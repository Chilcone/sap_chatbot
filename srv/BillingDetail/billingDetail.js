const https = require('https');
const log = require('cf-nodejs-logging-support');
const e = require('express');

async function billingsResponce(req, resp) {
    let url = "https://" + req.headers.host + '/example/Billings'
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
    let billingsIds = await getBillingIds(req, salesOrderId);

    if (billingsIds != null && billingsIds != undefined && billingsIds.length > 0) {
        var filterParams = billingsIds.map(id => `Billing eq '${id}'`)
        var filter = filterParams.join(" or ")
        url = "https://" + req.headers.host + '/example/Billings?$filter=(' + filter + ')'
        https.get(url, res => {
            let data = []
            res.on('data', chunk => {
                data.push(chunk)
            })
            res.on('end', () => {
                log.info("DATA PRODUCT: " + data);
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
    } else {
        resp.send({
            "replies": [ 
                {
                    "type": "text",
                    "content": "There are no billings associated with this order." 
                }
            ],
            "conversation": req.body.conversation,
        })
    }
}
module.exports = {billingsResponce, billingsFromSalesOrder}

function getBillingIds(req, salesOrderId) {
    let url = "https://" + req.headers.host + "/example/SalesOrders('" + salesOrderId + "')/to_PaymentPlanItemDetails"
    return new Promise((resolve, reject) => {
        https.get(url, (response) => {
            let data = [];
            response.on('data', chunk => {
                data.push(chunk)
            })
            response.on('end', () => {
                let responseData = JSON.parse(Buffer.concat(data).toString());
                billingIds = responseData.value.map(x => x.PaymentPlan); //Material is the Billing Id
                resolve(billingIds);
            });
            response.on('error', err => reject(err));
        })
    });
}

function getMessages(data) {
    if (data.length == 0) {
        return {
            "type": "text",
            "content": "There is no Billing."
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
          "title": "PRODUCT #" + billing.Product,
          "subtitle": "Type: " + product.ProductType + ", Creation Date: " + product.CreationDate,
          "description": "Created By: " + product.CreatedByUser + ', Gross weight: ' + product.GrossWeight
        }
    }
}