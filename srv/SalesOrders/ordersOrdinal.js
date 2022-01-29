const https = require('https');

async function ordersOrdinalResponse(req, resp) { 
    let count = 1
    if('sales-order-number' in req.body.nlp.entities) {
        count = req.body.nlp.entities['sales-order-number'][0].value
    }
    console.log(count)
    let ordinal = req.body.nlp.entities['order-ordinal'][0].value
    console.log(ordinal)
    if(ordinal == 'last' || ordinal == 'recent') { 
        ordinal = 'desc'
    } else {
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

function getMessages(data) {
    if (data.length == 0) {
        return {
            "type": "text",
            "content": "There is no Sales Order with given date."
        }
    } else if (data.length == 1) {
        let order = data[0]
        return card(order)
    } else {
        let cards = data.map( order => listElement(order))
        return {
            "type": "list",
            "content": {
              "title": "YOUR SALES ORDERS",
              "total": data.length,
              "elements": cards
            }
          }
    }
}

function card(order) { 
    return {
        "type": "card",
        "content": {
          "title": "SALES ORDER #" + order.SalesOrder,
          "subtitle": "Type: " + order.SalesOrderType + " Date: " + order.CreationDate,
          "description": order.TotalNetAmount.toString() + ' ' + order.TransactionCurrency,
          "status": order.OverallSDProcessStatus,
          "statusState": "success"
        }
    }
}

function listElement(order) { 
    return {
        "title": "SALES ORDER #" + order.SalesOrder,
        "subtitle": "Type: " + order.SalesOrderType + " Date: " + order.CreationDate,
        "description": order.TotalNetAmount.toString() + ' ' + order.TransactionCurrency,
        "status": order.OverallSDProcessStatus,
        "statusState": "success"
    }
}

module.exports = { ordersOrdinalResponse } 