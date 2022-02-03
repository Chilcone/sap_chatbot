const https = require('https');
const utility = require('./utility.js')

async function ordersDateResponse(req, resp) { 
    let url = "https://" + req.headers.host + '/example/SalesOrders?$filter='
    if('datetime' in req.body.nlp.entities) {
        let date = req.body.nlp.entities['datetime'][0].iso.split('T')[0]
        url += 'CreationDate%20ge%20' + date
    } else { 
        console.log(req.body.nlp.entities)
        let startDate = req.body.nlp.entities['interval'][0].begin.split('T')[0]
        let endDate = req.body.nlp.entities['interval'][0].end.split('T')[0]
        url += 'CreationDate%20ge%20' + startDate + '%20and%20CreationDate%20le%20' + endDate
    }
    console.log(url)
    https.get(url, res => {
        let data = []
        res.on('data', chunk => {
            data.push(chunk)
        })
        res.on('end', () => {
            const responseData = JSON.parse(Buffer.concat(data).toString());
            let messages = utility.getMessages(responseData.value)
            if(responseData.value.length == 1) {
                req.body.conversation.memory.lastOrderID = responseData.value[0].SalesOrder
            }
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