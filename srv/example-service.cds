using OP_API_SALES_ORDER_SRV_0001.A_SalesOrder as salesorder from './external/OP_API_SALES_ORDER_SRV_0001';
using API_PRODUCT_SRV.A_Product as product from './external/API_PRODUCT_SRV';
using OP_API_SALES_ORDER_SRV_0001.A_SalesOrderItem as salesorderItem from './external/OP_API_SALES_ORDER_SRV_0001';
using API_BILLING_DOCUMENT_SRV.A_BillingDocument as billingDocument from './external/API_BILLING_DOCUMENT_SRV';
using API_BILLING_DOCUMENT_SRV.A_BillingDocumentItem as billingDocumentItem from './external/API_BILLING_DOCUMENT_SRV';

// Section 1: Entities
service ExampleService {

  // Section 1.1: Sales Order Entity
  @readonly
  entity SalesOrders as projection on salesorder {
    key SalesOrder, SalesOrderType, OverallSDProcessStatus, LastChangeDate, CreationDate, TotalNetAmount, TransactionCurrency, to_Item
  };

  // Section 1.2: Sales Order Item Entity
  @readonly
  entity SalesOrderOrderItem as projection on salesorderItem {
    key SalesOrder, SalesOrderItem, Material
  };

  // Section 1.3: Product Entity
  @readonly
  entity Products            as projection on product {
    key Product, ProductType, CreationDate, CreatedByUser, LastChangedByUser, LastChangeDateTime, GrossWeight
  };

  // Section 1.4: Billing Document Entity
  @readonly
  entity BillingDocuments    as projection on billingDocument {
    key BillingDocument, BillingDocumentCategory, CreationDate, Region, County, TotalNetAmount, TransactionCurrency
  };

  // Section 1.5: Billing Document Entity
  @readonly
  entity BillingDocumentItem as projection on billingDocumentItem {
    key BillingDocument, CreationTime, BillingQuantity, BillingQuantityUnit, BillToPartyCountry, BillToPartyRegion, OrderID
  };

}
