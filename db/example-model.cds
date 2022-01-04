namespace my.sales;

entity SaleOrders {
  key ID : UUID;
  title  : localized String;
  productManager : Association to ProductManagers;
  stock  : Integer;
  shippingDate : Date;
}

entity ProductManagers {
  key ID : Integer;
  name   : String;
  saleOrders  : Association to many SaleOrders on saleOrders.productManager = $self;
}
