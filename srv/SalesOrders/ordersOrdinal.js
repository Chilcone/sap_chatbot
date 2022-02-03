const https = require('https');
const utility = require('./utility.js')

async function ordersOrdinalResponse(req, resp) { 
    let count = 1
    if('id' in req.body.nlp.entities) {
        count = req.body.nlp.entities['id'][0].scalar
    }

    let ordinal = 'desc'
    if(req.body.nlp.entities['ordinal'][0].rank > 0) { 
        ordinal = 'asc'
    }
    
    //let url = "https://" + 'ibsolution-development-tum2021ws-ib-sap-chatbot-srv.cfapps.eu10.hana.ondemand.com' + '/example/SalesOrders?$orderby=CreationDate%20'+ordinal+'&$top='+count
    let url = "https://" + req.headers.host + '/example/SalesOrders?$orderby=CreationDate%20'+ordinal+'&$top='+count
    
    https.get(url, res => {
        let data = []
        res.on('data', chunk => {
            data.push(chunk)
        })
        res.on('end', () => {
            const responseData = JSON.parse(Buffer.concat(data).toString());
            console.log(responseData)
            if(responseData.value.length == 1) {
                req.body.conversation.memory.lastOrderID = responseData.value[0].SalesOrder
            }
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