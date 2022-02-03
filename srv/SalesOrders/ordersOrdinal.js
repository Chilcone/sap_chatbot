const https = require('https');
const utility = require('./utility.js')

async function ordersOrdinalResponse(req, resp) { 
    let count = 1
    if('sales-order-number' in req.body.nlp.entities) {
        count = req.body.nlp.entities['sales-order-number'][0].value
    }

    let ordinal = 'desc'
    if(req.body.nlp.entities['ordinal'][0].rank > 0) { 
        ordinal = 'asc'
    }
    let url = "https://" + req.headers.host + '/example/SalesOrders?$orderby=CreationDate%20'+ordinal+'&$top='+count
    console.log(url)
    https.get(url, res => {
        let data = []
        res.on('data', chunk => {
            data.push(chunk)
        })
        res.on('end', () => {
            const responseData = JSON.parse(Buffer.concat(data).toString());
            let messages = utility.getMessages(responseData.value)

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