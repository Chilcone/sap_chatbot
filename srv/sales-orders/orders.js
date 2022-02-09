const https = require('https');
const utility = require('./utility.js')

/**
 * Prepares response for the request with Sales Order ID.
 * Expects id(s) in entities.
 * If there is only one id, it adds lastOrderID to memory for futher navigation to other skills.
 * 
 * @param {Request} req Request with Sales Order ID.
 * The form of req body:
 * {
 *     "action_id": "5149f96e-b2c5-4e30-96ec-c587ae978d52",
 *     "conversation": {
 *          "memory": { ... }
 *     },
 *     "nlp": {
 *          "entities": { 
 *               "id": [ <IDs of SalesOrder to fetch> ]
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
 */
async function ordersResponse(req, resp) {
    // Get id's from request.
    let ids = req.body.nlp.entities['id'].map(element => element.scalar)    
    
    // Prepare OData with id filter.
    var filterParams = ids.map(id => `SalesOrder eq '${id}'`)
    var filter = filterParams.join(" or ")
    let url = "https://" + req.headers.host + '/example/SalesOrders?$filter=(' + filter + ')'
    
    // Fetch OData response.
    https.get(url, res => {
        let data = []
        res.on('data', chunk => {
            data.push(chunk)
        })
        res.on('end', () => {
            const responseData = JSON.parse(Buffer.concat(data).toString());
            // Prepare messages for response.
            let messages = utility.getMessages(responseData.value)
            // If there is only one Sales Order id, it also updates the memory for further skill navigation.
            if(responseData.value.length == 1) {
                req.body.conversation.memory.lastOrderID = responseData.value[0].SalesOrder
            }
            // Send response with replies and updated conversation.
            resp.send({
                "replies": [messages
                ],
                "conversation": req.body.conversation,
            })
        })
    }).on('error', err => {
        console.log('Error: ', err.message);
        resp.send(err)
    })
}

module.exports = { ordersResponse } 
