using OP_API_SALES_ORDER_SRV_0001.A_SalesOrder as salesorder from './external/OP_API_SALES_ORDER_SRV_0001';
using API_PRODUCT_SRV.A_Product as product from './external/API_PRODUCT_SRV';
using OP_API_SALES_ORDER_SRV_0001.A_SalesOrderItem as salesorderItem from './external/OP_API_SALES_ORDER_SRV_0001';
using API_BILLING_DOCUMENT_SRV.A_BillingDocument as billingDocument from  './external/API_BILLING_DOCUMENT_SRV';
using OP_API_SALES_ORDER_SRV_0001.A_SlsOrdPaymentPlanItemDetails as salesorderPaymentItem from './external/OP_API_SALES_ORDER_SRV_0001';

service ExampleService {

  @readonly
  entity SalesOrders as projection on salesorder {
    key SalesOrder, SalesOrderType, OverallSDProcessStatus, LastChangeDate, CreationDate, TotalNetAmount, TransactionCurrency, to_Item
  };

  @readonly
  entity SalesOrderOrderItem as projection on salesorderItem {
    key SalesOrder, SalesOrderItem, Material
  };

  @readonly
  entity SalesOrderOrderPaymentItem as projection on salesorderPaymentItem {
    key SalesOrder, PaymentPlanItem, PaymentPlan
  };

  @readonly
  entity Products as projection on product {
    key Product, ProductType, CreationDate, CreatedByUser, LastChangedByUser, LastChangeDateTime, GrossWeight
  };

  @readonly
  entity BillingDocuments as projection on billingDocument {
    key BillingDocument, BillingDocumentCategory, CreationDate, Region, County, TotalNetAmount, TransactionCurrency
  };

}