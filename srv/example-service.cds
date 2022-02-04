using OP_API_SALES_ORDER_SRV_0001.A_SalesOrder as salesorder from './external/OP_API_SALES_ORDER_SRV_0001';
using API_PRODUCT_SRV.A_Product as product from './external/API_PRODUCT_SRV';
using OP_API_SALES_ORDER_SRV_0001.A_SalesOrderItem as salesorderItem from './external/OP_API_SALES_ORDER_SRV_0001';
using API_BILLING_DOCUMENT_SRV.A_BillingDocument as billingDocument from  './external/API_BILLING_DOCUMENT_SRV';
using OP_API_SALES_ORDER_SRV_0001.A_SalesOrderHeaderPartner as salesorderHP from './external/OP_API_SALES_ORDER_SRV_0001';

service ExampleService {

  @readonly
  entity SalesOrders as projection on salesorder {
    key SalesOrder, SalesOrderType, OverallSDProcessStatus, LastChangeDate, CreationDate, TotalNetAmount, TransactionCurrency, to_Item
  };

  @readonly
  entity Products as projection on product {
    key Product, ProductType, CreationDate, CreatedByUser, LastChangedByUser, LastChangeDateTime, GrossWeight
  };

  @readonly
  entity SalesOrderOrderItem as projection on salesorderItem {
    key SalesOrder, Material
  }

  @readonly
  entity SaleOrderHeaderPartner as projection on salesorderHP {
    key SalesOrder, PartnerFunction
  }

  // BillingDocumentCategory, CreationDate, Region, County
  @readonly
  entity BillingDocuments as projection on billingDocument {
    key BillingDocument
  }

}