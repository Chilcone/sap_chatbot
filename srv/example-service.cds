using my.sales as my from '../db/example-model';

service ExampleService {
  entity SaleOrders @readonly as projection on my.SaleOrders;
  entity ProductManagers @readonly as projection on my.ProductManagers;
}