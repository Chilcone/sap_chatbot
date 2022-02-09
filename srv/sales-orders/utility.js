/**
 * Prepares Conversational AI responses according to SalesOrder counts in data.
 * If no data, then a single message.
 * If only one Sales Order data, then a single card with details of Sales order.
 * If more than one Sales Order data, then a list with details of Sales Orders.
 * 
 * @param {[SalesOrder]} data Sales Orders to show. 
 * @returns Response in Coversational AI message format.
 */
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

/**
 * Creates and returns card message for a Sales Order details.
 * 
 * @param {SalesOrder} order Sales Order to show in card.
 * @returns Card message with Sales Order details.
 */
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

/**
 * Prepares and returns a list item with Sales Order details.
 * 
 * @param {SalesOrder} order Sales Order to show in list item.
 * @returns 
 */
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