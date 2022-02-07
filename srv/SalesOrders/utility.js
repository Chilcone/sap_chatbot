function getMessages(data) {
    if (data.length == 0) {
        return {
            "type": "text",
            "content": "There is no Sales Order with given information."
        }
    } else if (data.length == 1) {
        let order = data[0]
        return card(order)
    } else {
        let cards = data.map(order => listElement(order))
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
            "subtitle": "Type: " + order.SalesOrderType + ", Date: " + order.CreationDate,
            "description": order.TotalNetAmount.toString() + ' ' + order.TransactionCurrency,
            "status": order.OverallSDProcessStatus,
            "statusState": "success"
        }
    }
}

function listElement(order) {
    return {
        "title": "SALES ORDER #" + order.SalesOrder,
        "subtitle": "Type: " + order.SalesOrderType + ", Date: " + order.CreationDate,
        "description": order.TotalNetAmount.toString() + ' ' + order.TransactionCurrency,
        "status": order.OverallSDProcessStatus,
        "statusState": "success"
    }
}

module.exports = { getMessages } 