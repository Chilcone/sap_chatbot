const https = require('https');
const utility = require('./utility.js')

async function ordersResponse(req, resp) {
    let ids = req.body.nlp.entities['id'].map(element => element.scalar)    
    
    var filterParams = ids.map(id => `SalesOrder eq '${id}'`)
    var filter = filterParams.join(" or ")
    let url = "https://" + req.headers.host + '/example/SalesOrders?$filter=(' + filter + ')'
    https.get(url, res => {
        let data = []
        res.on('data', chunk => {
            data.push(chunk)
        })
        res.on('end', () => {
            const responseData = JSON.parse(Buffer.concat(data).toString());
            let messages = utility.getMessages(responseData.value)
            if(responseData.value.length === 1) {
                req.body.conversation.memory.lastOrderID = responseData.value[0].SalesOrder
            }
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
