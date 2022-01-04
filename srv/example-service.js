const cds = require('@sap/cds');

module.exports = cds.service.impl(async function() {
	const service = await cds.connect.to('OP_API_SALES_ORDER_SRV_0001'); // connect to the external destination
	const { TestSaleOrders } = this.entities;
    this.before('*', (req) => {
        console.debug('>>>', req.method, req.target.name)
    });

	this.on('READ', TestSaleOrders, request => {
		return service.tx(request).run(request.query);
	});
});

