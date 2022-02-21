const cds = require('@sap/cds');
// Section 1: OData Endpoints

module.exports = cds.service.impl(async function () {
	// Section 1.1: Sales Orders Service Connection
	const salesService = await cds.connect.to('OP_API_SALES_ORDER_SRV_0001'); // connect to the external destination
	const { SalesOrders } = this.entities;
	const { SalesOrderOrderItem } = this.entities;

	this.on('READ', SalesOrders, request => {
		return salesService.tx(request).run(request.query);
	});

	this.on('READ', SalesOrderOrderItem, request => {
		return salesService.tx(request).run(request.query);
	});

	// Section 1.2: Products Service Connection
	const productsService = await cds.connect.to('API_PRODUCT_SRV');
	const { Products } = this.entities;

	this.on('READ', Products, request => {
		return productsService.tx(request).run(request.query);
	});

	// Section 1.3: Billing Documents Service Connection
	const billingsService = await cds.connect.to('API_BILLING_DOCUMENT_SRV');
	const { BillingDocuments } = this.entities;
	const { BillingDocumentItem } = this.entities;

	this.on('READ', BillingDocuments, request => {
		return billingsService.tx(request).run(request.query);
	});

	this.on('READ', BillingDocumentItem, request => {
		return billingsService.tx(request).run(request.query);
	});

	this.before('*', (req) => {
		console.debug('>>>', req.method, req.target.name)
	});

});

