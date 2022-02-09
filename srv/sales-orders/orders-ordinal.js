const https = require('https');
const utility = require('./utility.js')
/**
 * Prepares response for the request with sorting information.
 * Expects ordinal gold entity in entities.
 * 'The last' has -1 ordinal entity so we used this information to sort the Sales Orders. There is also a 'sort' gold entity in CAI, but it doesn't work as expected. 
 * And restricted entities block gold entities since overlapped entities are not supported(for example it would block last year to be recognized as interval gold entity), 
 * so we had to go with ordinal gold entity.
 * E.g. "Show me my last five sales order" would give -1 as ordinal rank and 5 as id scalar.
 * 
 * @param {Request} req Request with ordinal information.
 * The form of req body:
 * {
 *     "action_id": "5149f96e-b2c5-4e30-96ec-c587ae978d52",
 *     "conversation": {
 *          "memory": { ... }
 *     },
 *     "nlp": {
 *          "entities": { 
 *               "ordinal": [ <ordinal entity of the expression> ]
 *          }
 *     },
 *     "api_service_response": {}
 * }
 * @param {Response} resp CAI reply response with updated memory.
 * The form of response:
 * {
 *     "replies": [<message according to request>],
 *     "conversation": <updated(if necessary) conversation information got from request>
 *  }
 */async function ordersOrdinalResponse(req, resp) { 
    // Get the count of the sales order. It is mostly matched to 'id' entity due to trained expressions. 
    // Default is 1, since "show my last sales order" type of expressions means only one record.
    let count = 1
    if('id' in req.body.nlp.entities) {
        count = req.body.nlp.entities['id'][0].scalar
    }

    // Get the sorting info from ordinal gold entity.
    let ordinal = 'desc'
    if(req.body.nlp.entities['ordinal'][0].rank > 0) { 
        ordinal = 'asc'
    }
    // Prepare OData url.
    let url = "https://" + req.headers.host + '/example/SalesOrders?$orderby=CreationDate%20'+ordinal+'&$top='+count
    
    // Fetch OData response.
    https.get(url, res => {
        let data = []
        res.on('data', chunk => {
            data.push(chunk)
        })
        res.on('end', () => {
            const responseData = JSON.parse(Buffer.concat(data).toString());
             // If there is only one Sales Order, it also updates the memory for further skill navigation.
            if(responseData.value.length == 1) {
                req.body.conversation.memory.lastOrderID = responseData.value[0].SalesOrder
            }
            // Prepare messages for response.
            let messages = utility.getMessages(responseData.value)
            // Send response with replies and updated conversation.
            resp.send({
                "replies": [ messages
                ],
                "conversation": req.body.conversation,
            })
        })
    }).on('error', err => {
        console.log('Error: ', err.message);
        resp.send(err)
    })
}

module.exports = { ordersOrdinalResponse } 