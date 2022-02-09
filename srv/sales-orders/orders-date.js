const https = require('https');
const utility = require('./utility.js')

/**
 * Prepares response for the request with date or date interval information on Sales Orders which are gold entities in CAI.
 * Expects 'datetime' or 'interval' in entities.
 * If there is datetime gold entity, it means a specific day. It gets filtering date according to CAI accuracy information on datetime entity.
 * 
 * @param {Request} req Request with datetime or interval in body .
 * The form of req body:
 * {
 *     "action_id": "5149f96e-b2c5-4e30-96ec-c587ae978d52",
 *     "conversation": {
 *          "memory": { ... }
 *     },
 *     "nlp": {
 *          "entities": { 
 *               "datetime": [ <datetime information for querying> ],
 *               "interval": [ <date interval information for queryign> ]
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
async function ordersDateResponse(req, resp) { 
    // Prepare initial OData url.
    let url = "https://" + req.headers.host + '/example/SalesOrders?$filter='
    // Prepare start and end dates for filtering
    if('datetime' in req.body.nlp.entities) {
        let startDate = new Date(req.body.nlp.entities['datetime'][0].iso)
        let accuracy = req.body.nlp.entities['datetime'][0].accuracy
        var endDate = new Date()
        if (accuracy.includes("day")) {
            endDate = new Date(startDate.getFullYear(), startDate.getMonth(), startDate.getDate()+1)
        } else if (accuracy.includes("month")) {
            endDate = new Date(startDate.getFullYear(), startDate.getMonth()+1, startDate.getDate())
        } else if (accuracy.includes("year")) {
            endDate = new Date(startDate.getFullYear()+1, startDate.getMonth(), startDate.getDate())
        }
        url += 'CreationDate%20ge%20' + startDate.toISOString().split('T')[0] + '%20and%20CreationDate%20le%20' + endDate.toISOString().split('T')[0]
    } else if ('interval' in req.body.nlp.entities){ 
        let startDate = req.body.nlp.entities['interval'][0].begin.split('T')[0]
        let endDate = req.body.nlp.entities['interval'][0].end.split('T')[0]
        url += 'CreationDate%20ge%20' + startDate + '%20and%20CreationDate%20le%20' + endDate
    }
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
            // If there is only one Sales Order, it also updates the memory for further skill navigation.
            if(responseData.value.length === 1) {
                req.body.conversation.memory.lastOrderID = responseData.value[0].SalesOrder
            }
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

module.exports = { ordersDateResponse } 
