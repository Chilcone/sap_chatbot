using OP_API_SALES_ORDER_SRV_0001.A_SalesOrder as salesorder from './external/OP_API_SALES_ORDER_SRV_0001';

service ExampleService {

  @readonly
  entity TestSaleOrders as projection on salesorder {
    key SalesOrder, LastChangeDate, CreationDate, TotalNetAmount
  };

}