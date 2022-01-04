const cds = require("@sap/cds");
const proxy = require("@sap/cds-odata-v2-adapter-proxy"); //enable OData 2 support
cds.on("bootstrap", (app) => app.use(proxy()));
module.exports = cds.server;