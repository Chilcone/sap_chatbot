const https = require('https');
const log = require('cf-nodejs-logging-support');
const e = require('express');

//  Section 1:  Products  Endpoints
// Function 1.1:  Products /products Endpoint  Response

/**
 * Prepares response for the request with Product ID.
 * Expects id(s) in entities.
 *
 * @param {Request} req Request with Product ID.
 * The form of req body:
 * {
 *     "action_id": "5149f96e-b2c5-4e30-96ec-c587ae978d52",
 *     "conversation": {
 *          "memory": { ... }
 *     },
 *     "nlp": {
 *          "entities": {
 *               "id": [ <IDs of Product to fetch> ]
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

async function productsResponse(req, resp) {
    let ids = req.body.nlp.entities['id'].map(element => element.raw)
    var filterParams = ids.map(id => `Product eq '${id}'`)
    var filter = filterParams.join(" or ")
    let url = "https://" + req.headers.host + '/example/Products?$filter=(' + filter + ')'
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

// Function 1.2:  Products /productsFromSalesOrder Endpoint  Response

/**
 * Prepares response for the request with Sale Order ID
 * Expects Sales Order ID in entities
 * Returns the Product of the Sales Order with that ID
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

async function productsFromSalesOrder(req, resp) {

    let salesOrderId = req.body.conversation.memory.lastOrderID
    let productIds = await getProductIds(req, salesOrderId);

    if (productIds != null && productIds.length > 0) {
        // For testing multiple products, use SalesOrder with ID 127
        var filterParams = productIds.map(id => `Product eq '${id}'`)
        var filter = filterParams.join(" or ")
        url = "https://" + req.headers.host + '/example/Products?$filter=(' + filter + ')'
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
                    "content": "There are no products associated with this order."
                }
            ],
            "conversation": req.body.conversation,
        })
    }
}

module.exports = { productsResponse, productsFromSalesOrder }

//  Section 2:  Helpers for Products Endpoints
// Function 2.1: Get Product IDs from Sales Order ID

/**
 * Gets the Production Ids of the Sales order with given SalesOrder ID
 * @param {Request} req Request with headers host
 * @param {String} salesOrderId SaleOrder ID.
 * @returns Response of an array of Production IDs
 */
function getProductIds(req, salesOrderId) {
    let url = "https://" + req.headers.host + "/example/SalesOrders('" + salesOrderId + "')/to_Item"
    return new Promise((resolve, reject) => {
        https.get(url, (response) => {
            let data = [];
            response.on('data', chunk => {
                data.push(chunk)
            })
            response.on('end', () => {
                let responseData = JSON.parse(Buffer.concat(data).toString());
                let productIds = responseData.value.map(x => x.Material); //Material is the Product Id
                resolve(productIds);
            });
            response.on('error', err => reject(err));
        })
    });
}

// Function 2.2: Get Messages
/**
 * Prepares Conversational AI responses according to Products count in data.
 * If no data, then a single message.
 * If only one Product data, then a single card with details of the Production.
 * If more than one Product data, then a list with details of Products.
 *
 * @param {[Product]} data Products to show.
 * @returns Response in Coversational AI message format.
 */

function getMessages(data) {
    if (data.length === 0) {
        return {
            "type": "text",
            "content": "There is no Product."
        }
    } else if (data.length === 1) {
        let product = data[0]
        return card(product)

    } else {
        let cards = data.map(product => listElement(product))
        return {
            "type": "list",
            "content": {
                "title": "YOUR PRODUCTS",
                "total": data.length,
                "elements": cards
            }
        }
    }
}


// Function 2.3: Get Card Messages
/**
 * Creates and returns card message for one Product.
 *
 * @param {Product} product Product to show in card.
 * @returns Card message with Product details.
 */
function card(product) {
    return {
        "type": "card",
        "content": {
            "title": "PRODUCT #" + product.Product,
            "subtitle": "Type: " + product.ProductType + ", Creation Date: " + product.CreationDate,
            "description": "Created By: " + product.CreatedByUser + ', Gross weight: ' + product.GrossWeight
        }
    }
}

// Function 2.4: Get List Element Messages
function listElement(product) {
    return {
        "title": "PRODUCT #" + product.Product,
        "subtitle": "Type: " + product.ProductType + ", Creation Date: " + product.CreationDate,
        "description": "Created By: " + product.CreatedByUser + ', Gross weight: ' + product.GrossWeight
    }
}

