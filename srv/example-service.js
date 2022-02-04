const cds = require('@sap/cds');

module.exports = cds.service.impl(async function() {
	const salesService = await cds.connect.to('OP_API_SALES_ORDER_SRV_0001'); // connect to the external destination
	const { SalesOrders } = this.entities;
	const  {SalesOrderOrderItem } = this.entities;
    const { SaleOrderHeaderPartner } = this.entities;

	const productsService = await cds.connect.to('API_PRODUCT_SRV');
	const { Products } = this.entities;

	const billingsService = await cds.connect.to('API_BILLING_DOCUMENT_SRV');
	const { BillingDocuments } = this.entities; 

	
	this.before('*', (req) => {
        console.debug('>>>', req.method, req.target.name)
    });

	this.on('READ', SalesOrders, request => {
		return salesService.tx(request).run(request.query);
	});

	this.on('READ', Products, request => {
		return productsService.tx(request).run(request.query);
	});

	this.on('READ', SalesOrderOrderItem, request => {
		return salesService.tx(request).run(request.query);
	});

	this.on('READ', SaleOrderHeaderPartner, request => {
		return salesService.tx(request).run(request.query);
	});

	this.on('READ', BillingDocuments, request => {
		return billingsService.tx(request).run(request.query);
	})
	
});
