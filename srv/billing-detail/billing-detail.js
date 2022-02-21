const https = require('https');
const log = require('cf-nodejs-logging-support');
const e = require('express');

//  Section 1:  Billing Documents  Endpoints
// Function 1.1:  Billing Document /billings Endpoint  Response

/**
 * Prepares response for the request with Billing ID.
 * Expects id(s) in entities.
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
 *               "id": [ <IDs of Billing to fetch> ]
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

async function billingsResponse(req, resp) {
    let ids = req.body.nlp.entities['id'] != null ? req.body.nlp.entities['id'].map(element => element.raw) : []
    let numbers = req.body.nlp.entities['number'] != null ? req.body.nlp.entities['number'].map(element => element.raw) : []
    let allPossibleIds = ids.concat(numbers)
    let filterParams = allPossibleIds.map(id => `BillingDocument eq '${id}'`)
    let filter = filterParams.join(" or ")
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

// Function 1.2:  Billing Document /billings/date Endpoint  Response

/**
 * Prepares response for the request with date or date interval information on Billings which are gold entities in CAI.
 * Expects 'datetime' or 'interval' in entities.
 * If there is datetime gold entity, it means a specific day. It gets date interval according to CAI accuracy information on datetime entity.
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
 *               "interval": [ <date interval information for querying> ]
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

async function billingsDateResponse(req, resp) {
    let url = "https://" + req.headers.host + '/example/BillingDocuments?$filter='
    if ('datetime' in req.body.nlp.entities) {
        let startDate = new Date(req.body.nlp.entities['datetime'][0].iso)
        let accuracy = req.body.nlp.entities['datetime'][0].accuracy
        var endDate = new Date()
        if (accuracy.includes("day")) {
            endDate = new Date(startDate.getFullYear(), startDate.getMonth(), startDate.getDate() + 1)
        } else if (accuracy.includes("month")) {
            endDate = new Date(startDate.getFullYear(), startDate.getMonth() + 1, startDate.getDate())
        } else if (accuracy.includes("year")) {
            endDate = new Date(startDate.getFullYear() + 1, startDate.getMonth(), startDate.getDate())
        }
        url += 'CreationDate%20ge%20' + startDate.toISOString().split('T')[0] + '%20and%20CreationDate%20le%20' + endDate.toISOString().split('T')[0]
    } else if ('interval' in req.body.nlp.entities) {
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


// Function 1.3:  Billing Document /billingsFromSalesOrder Endpoint  Response
/**
 * Prepares response for the request with Sales Order ID
 * Expects Sales Order ID in entities
 * Returns the Billing Detail of the Sales Order with that ID
 *
 * @param {Request} req Request with Sales Order ID in body .
 * The form of req body:
 * {
 *    "action_id": "5149f96e-b2c5-4e30-96ec-c587ae978d52",
 *     "conversation": {
 *          "memory": { ... }
 *     },
 *     "nlp": {
 *          "entities": {
 *               "id": [ <ID of Sales Order to fetch> ]
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

async function billingsFromSalesOrder(req, resp) {
    let salesOrderId = req.body.conversation.memory.lastOrderID;
    let billingIds = await getBillingIds(req, salesOrderId);
    if (billingIds != null && billingIds.length > 0) {
        let filterParams = billingIds.map(id => `BillingDocument eq '${id}'`);
        let filter = filterParams.join(" or ");
        let url = "https://" + req.headers.host + '/example/BillingDocuments?$filter=(' + filter + ')'
        https.get(url, res => {
            let data = []
            res.on('data', chunk => {
                data.push(chunk)
            })
            res.on('end', () => {
                log.info("DATA BILLING: " + data);
                const responseData = JSON.parse(Buffer.concat(data).toString());
                let messages = getMessages(responseData.value)

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
module.exports = { billingsResponse, billingsFromSalesOrder, billingsDateResponse }

//  Section 2:  Helpers for Billing Documents Endpoints
// Function 2.1: Get Billing Document IDs from Sales Order ID

/**
 * Gets the Billing Ids of the Sales order with given SalesOrder ID
 * @param {Request} req Request with headers host
 * @param {String} salesOrderId SaleOrder ID.
 * @returns Response of an array of Billing IDs
 */

function getBillingIds(req, salesOrderId) {
    let filter = `OrderID eq '${salesOrderId}'`;
    let url = "https://" + req.headers.host + '/example/BillingDocumentItem?$filter=(' + filter + ')'
    return new Promise((resolve, reject) => {
        https.get(url, (response) => {
            let data = [];
            response.on('data', chunk => {
                data.push(chunk)
            })
            response.on('end', () => {
                let responseData = JSON.parse(Buffer.concat(data).toString());
                let billingIds = responseData.value.map(x => x.BillingDocument);
                resolve(billingIds);
            });
            response.on('error', err => reject(err));
        })
    });
}
// Function 2.2: Get Messages
/**
 * Prepares Conversational AI responses according to Billings count in data.
 * If no data, then a single message.
 * If only one Billing data, then a single card with details of the Billing.
 * If more than one Billing data, then a list with details of Billings.
 *
 * @param {[Billing]} data Billings to show.
 * @returns Response in Conversational AI message format.
 */

function getMessages(data) {
    if (data.length === 0) {
        return {
            "type": "text",
            "content": "There is no such Billing."
        }
    } else if (data.length === 1) {
        let billing = data[0]
        return card(billing)

    } else {
        let cards = data.map(billing => listElement(billing))
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

// Function 2.3: Get Card Messages
/**
 * Creates and returns card message for one Billing.
 *
 * @param {Billing} billing Billing to show in card.
 * @returns Card message with Billing details.
 */

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

// Function 2.4: Get List Element Messages
/**
 * Prepares and returns a list item with Billing details.
 *
 * @param {Billing} billing Billing to show in list item.
 * @returns
 */

function listElement(billing) {
    return {
        "title": "BILLING #" + billing.BillingDocument,
        "subtitle": "Creation Date: " + billing.CreationDate,
        "description": "Amount: " + billing.TotalNetAmount + ", Currency: " + billing.TransactionCurrency + ", Region: " + billing.Region
    }
}

