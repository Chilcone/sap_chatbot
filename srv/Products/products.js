const https = require('https');

async function productsResponse(req, resp) {

        let url = "https://" + req.headers.host + '/example/Product'
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
module.exports = { productsResponse } 



function getMessages(data) {
    if (data.length == 0) {
        return {
            "type": "text",
            "content": "There is no Product."
        }
    } else if (data.length == 1) {
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
          "subtitle": "Type: " + product.ProductType + " Date: " + product.CreationDate,
          "description": product.CountryOfOrigin + ' ' + product.ProductGroup + ' ' + product.Brand
        }
    }
}


function listElement(order) { 
    return {
        "title": "PRODUCTS #" + product.Product,
        "subtitle": "Type: "+ product.ProductType + " Date: " + product.CreationDate,
        "description": product.CountryOfOrigin + ' ' + product.ProductGroup + ' ' + product.Brand
    }
}