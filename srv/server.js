const cds = require("@sap/cds");
const express = require('express');
const ordersHelper = require('./SalesOrders/orders.js')
const ordersOrdinalHelper = require('./SalesOrders/ordersOrdinal.js')
const ordersDateHelper = require('./SalesOrders/ordersDate.js')
const productsHelper = require('./Products/products.js')
const bllingsHelper = require('./BillingDetail/billingDetail.js')
const proxy = require("@sap/cds-odata-v2-adapter-proxy"); //enable OData 2 support

cds.on("bootstrap", (app) => {
    app.use(proxy())
    app.use(express.json())

    app.post('/orders', async function(req, resp) { ordersHelper.ordersResponse(req, resp) })
    app.post('/orders/ordinal', async function(req, resp) { ordersOrdinalHelper.ordersOrdinalResponse(req, resp) })
    app.post('/orders/date', async function(req, resp) { ordersDateHelper.ordersDateResponse(req, resp) })

    app.post('/products', async function(req, resp){ productsHelper.productsResponse(req, resp) })
    app.post('/productsFromSalesOrder', async function(req, resp){ productsHelper.productsFromSalesOrder(req, resp) })
    
    app.post('/billings', async function(req, resp){ bllingsHelper.billingsResponce(req, resp) })
    app.post('/billings/date', async function(req, resp){ bllingsHelper.billingsDateResponse(req, resp) })
    app.post('/billingsFromSalesOrder',  async function(req, resp){ bllingsHelper.billingsFromSalesOrder(req, resp) })
    

}) 

module.exports = cds.server