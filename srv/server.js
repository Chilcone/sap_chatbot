const cds = require("@sap/cds");
const express = require('express');
const ordersHelper = require('./SalesOrders/orders.js')

const proxy = require("@sap/cds-odata-v2-adapter-proxy"); //enable OData 2 support

cds.on("bootstrap", (app) => {
    app.use(proxy())
    app.use(express.json())

    app.post('/orders', async function(req, resp) { ordersHelper.ordersResponse(req, resp) })
}) 

module.exports = cds.server