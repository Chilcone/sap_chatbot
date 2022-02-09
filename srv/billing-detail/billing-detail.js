const https = require('https');
const log = require('cf-nodejs-logging-support');
const e = require('express');

async function billingsResponse(req, resp) {
    let ids = req.body.nlp.entities['id'].map(element => element.raw)
    var filterParams = ids.map(id => `BillingDocument eq '${id}'`)
    var filter = filterParams.join(" or ")
    let url = "https://" + req.headers.host + '/example/BillingDocuments?$filter=(' + filter + ')'
    https.get(url, res => {
        let data = []
        res.on('data', chunk => {
            data.push(chunk)
        })
        res.on('end', () => {
            const responseData = JSON.parse(Buffer.concat(data).toString());
            let messages = getMessages(responseData.value)

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

async function billingsDateResponse(req, resp) { 
    let url = "https://" + req.headers.host + '/example/BillingDocuments?$filter='
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
            let messages = getMessages(responseData.value)
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

async function billingsFromSalesOrder(req, resp) {
    let salesOrderId = req.body.conversation.memory.salesOrderNumber.raw;
    var filter = `OrderID eq '${salesOrderId}'`
    let url = "https://" + req.headers.host + '/example/Billings?$filter=(' + filter + ')'
    return new Promise((resolve, reject) => {
        https.get(url, (response) => {
            let data = [];
            response.on('data', chunk => {
                data.push(chunk)
            })
            response.on('end', () => {
                let responseData = JSON.parse(Buffer.concat(data).toString());
                let messages = getMessages(responseData.value)
                resp.send({
                    "replies": [ messages
                    ],
                    "conversation": req.body.conversation,
                })
            });
            response.on('error', err => reject(err));
        })
    });
}
module.exports = {billingsResponse, billingsFromSalesOrder, billingsDateResponse}


function getMessages(data) {
    if (data.length == 0) {
        return {
            "type": "text",
            "content": "There is no such Billing."
        }
    } else if (data.length == 1) {
        let billing = data[0]
        return card(billing)
        
    } else {
        let cards = data.map( billing => listElement(billing))
        return {
            "type": "list",
            "content": {
              "title": "YOUR BILLINGS",
              "total": data.length,
              "elements": cards
            }
          }
    }
}

function card(billing) { 
    return {
        "type": "card",
        "content": {
          "title": "BILLING #" + billing.BillingDocument,
          "subtitle": "Creation Date: " + billing.CreationDate,
          "description": "Amount: " + billing.TotalNetAmount + ", Currency: " + billing.TransactionCurrency + ", Region: " + billing.Region
        }
    }
}

function listElement(billing) { 
    return {
        "title": "BILLING #" + billing.BillingDocument,
        "subtitle": "Creation Date: " + billing.CreationDate,
        "description": "Amount: " + billing.TotalNetAmount + ", Currency: " + billing.TransactionCurrency + ", Region: " + billing.Region
    }
}