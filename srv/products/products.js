const https = require('https');
const log = require('cf-nodejs-logging-support');
const e = require('express');

async function productsResponse(req, resp) {
        // Get ids from request.
        let ids = req.body.nlp.entities['id'].map(element => element.raw)

        // Prepare OData with id filter.
        var filterParams = ids.map(id => `Product eq '${id}'`)
        var filter = filterParams.join(" or ")
        let url = "https://" + req.headers.host + '/example/Products?$filter=(' + filter + ')'
        
        // Fetch OData response.
        https.get(url, res => {
            let data = []
            res.on('data', chunk => {
                data.push(chunk)
            })
            res.on('end', () => {
                const responseData = JSON.parse(Buffer.concat(data).toString());
                // Prepare messages for response.
                let messages = getMessages(responseData.value)
                
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
                    "content": "There are no products associated with this order." 
                }
            ],
            "conversation": req.body.conversation,
        })
    }
}

module.exports = { productsResponse, productsFromSalesOrder } 

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
        let cards = data.map( product => listElement(product))
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

function listElement(product) { 
    return {
        "title": "PRODUCT #" + product.Product,
        "subtitle": "Type: " + product.ProductType + ", Creation Date: " + product.CreationDate,
        "description": "Created By: " + product.CreatedByUser + ', Gross weight: ' + product.GrossWeight
    }
}
