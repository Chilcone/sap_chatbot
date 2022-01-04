/* checksum : 8987d3a8811d2cef093bbb8ce202064a */
@cds.external : true
service OP_API_SALES_ORDER_SRV_0001 {};

type OP_API_SALES_ORDER_SRV_0001.FunctionResult {
  @sap.label : 'Indicator'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Boolean : Boolean;
};

action OP_API_SALES_ORDER_SRV_0001.rejectApprovalRequest(
  SalesOrder : String(11000)
) returns OP_API_SALES_ORDER_SRV_0001.FunctionResult;

action OP_API_SALES_ORDER_SRV_0001.releaseApprovalRequest(
  SalesOrder : String(11000)
) returns OP_API_SALES_ORDER_SRV_0001.FunctionResult;

@cds.persistence.skip : true
@sap.label : 'Sales Order Header'
@sap.content.version : '1'
entity OP_API_SALES_ORDER_SRV_0001.A_SalesOrder {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales Order'
  key SalesOrder : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales Order Type'
  SalesOrderType : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales Organization'
  SalesOrganization : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Distribution Channel'
  DistributionChannel : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Division'
  OrganizationDivision : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales Group'
  SalesGroup : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales Office'
  SalesOffice : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales District'
  SalesDistrict : String(6);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sold-to Party'
  SoldToParty : String(10);
  @sap.display.format : 'Date'
  @sap.label : 'Created On'
  @sap.quickinfo : 'Date on Which Record Was Created'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  CreationDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Created By'
  @sap.quickinfo : 'Name of Person Responsible for Creating the Object'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  CreatedByUser : String(12);
  @sap.display.format : 'Date'
  @sap.label : 'Changed On'
  @sap.quickinfo : 'Last Changed On'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  LastChangeDate : Date;
  @sap.label : 'Ext. Bus. Syst. ID'
  @sap.quickinfo : 'External Business System ID'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  SenderBusinessSystemName : String(60);
  @sap.display.format : 'UpperCase'
  @sap.label : 'External Document ID'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ExternalDocumentID : String(40);
  @sap.label : 'Time Stamp'
  @sap.quickinfo : 'UTC Time Stamp in Long Form (YYYYMMDDhhmmssmmmuuun)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  LastChangeDateTime : Timestamp;
  @sap.label : 'External Revision'
  @sap.quickinfo : 'Timestamp for Revision of External Calls'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ExternalDocLastChangeDateTime : Timestamp;
  @sap.label : 'Customer Reference'
  PurchaseOrderByCustomer : String(35);
  @sap.label : 'Customer Reference'
  @sap.quickinfo : 'Ship-to Party''s Customer Reference'
  PurchaseOrderByShipToParty : String(35);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Purchase Order Type'
  @sap.quickinfo : 'Customer Purchase Order Type'
  CustomerPurchaseOrderType : String(4);
  @sap.display.format : 'Date'
  @sap.label : 'Customer Ref. Date'
  @sap.quickinfo : 'Customer Reference Date'
  CustomerPurchaseOrderDate : Date;
  @sap.display.format : 'Date'
  @sap.label : 'Document Date'
  @sap.quickinfo : 'Document Date (Date Received/Sent)'
  SalesOrderDate : Date;
  @sap.unit : 'TransactionCurrency'
  @sap.label : 'Net Value'
  @sap.quickinfo : 'Net Value of the Sales Order in Document Currency'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  TotalNetAmount : Decimal(16, 3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Delivery Status'
  @sap.quickinfo : 'Delivery Status (All Items)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  OverallDeliveryStatus : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Overall Block Status'
  @sap.quickinfo : 'Overall Block Status (Header)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  TotalBlockStatus : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Ord.-Rel. Billg Sts'
  @sap.quickinfo : 'Order-Related Billing Status (All Items)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  OverallOrdReltdBillgStatus : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Reference Status'
  @sap.quickinfo : 'Reference Status (All Items)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  OverallSDDocReferenceStatus : String(1);
  @sap.label : 'Document Currency'
  @sap.quickinfo : 'SD Document Currency'
  @sap.semantics : 'currency-code'
  TransactionCurrency : String(5);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Order Reason'
  @sap.quickinfo : 'Order Reason (Reason for the Business Transaction)'
  SDDocumentReason : String(3);
  @sap.display.format : 'Date'
  @sap.label : 'Pricing Date'
  @sap.quickinfo : 'Date for Pricing and Exchange Rate'
  PricingDate : Date;
  @sap.label : 'Exchange Rate'
  @sap.quickinfo : 'Exchange Rate for Price Determination'
  PriceDetnExchangeRate : Decimal(9, 5);
  @sap.display.format : 'Date'
  @sap.label : 'Requested Delivery Date'
  RequestedDeliveryDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Shipping Conditions'
  ShippingCondition : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Complete Delivery'
  @sap.quickinfo : 'Complete Delivery Defined for Each Sales Order?'
  CompleteDeliveryIsDefined : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Shipping Type'
  ShippingType : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Billing Block'
  @sap.quickinfo : 'Billing Block in SD Document'
  HeaderBillingBlockReason : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Delivery Block'
  @sap.quickinfo : 'Delivery Block (Document Header)'
  DeliveryBlockReason : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Deliv Date Rule'
  @sap.quickinfo : 'Delivery Date Rule'
  DeliveryDateTypeRule : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Incoterms'
  @sap.quickinfo : 'Incoterms (Part 1)'
  IncotermsClassification : String(3);
  @sap.label : 'Incoterms (Part 2)'
  IncotermsTransferLocation : String(28);
  @sap.label : 'Incoterms Location 1'
  IncotermsLocation1 : String(70);
  @sap.label : 'Incoterms Location 2'
  IncotermsLocation2 : String(70);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Incoterms Version'
  IncotermsVersion : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Customer Price Group'
  CustomerPriceGroup : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Price List Type'
  PriceListType : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Payment Terms'
  @sap.quickinfo : 'Terms of Payment Key'
  CustomerPaymentTerms : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Payment Method'
  PaymentMethod : String(1);
  @sap.display.format : 'Date'
  @sap.label : 'Fixed Value Date'
  FixedValueDate : Date;
  @sap.label : 'Assignment'
  @sap.quickinfo : 'Assignment Number'
  AssignmentReference : String(18);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Reference Document'
  @sap.quickinfo : 'Document Number of Reference Document'
  ReferenceSDDocument : String(10);
  @sap.label : 'Preceding Doc.Categ.'
  @sap.quickinfo : 'Document Category of Preceding SD Document'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ReferenceSDDocumentCategory : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Reference'
  @sap.quickinfo : 'Reference Document Number'
  AccountingDocExternalReference : String(16);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Acct Assmt Grp Cust.'
  @sap.quickinfo : 'Account Assignment Group for this Customer'
  CustomerAccountAssignmentGroup : String(2);
  @sap.label : 'Exchng. Rate Accntg.'
  @sap.quickinfo : 'Exchange Rate for Postings to Financial Accounting'
  AccountingExchangeRate : Decimal(9, 5);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Customer Group'
  CustomerGroup : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Customer Group 1'
  AdditionalCustomerGroup1 : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Customer Group 2'
  AdditionalCustomerGroup2 : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Customer Group 3'
  AdditionalCustomerGroup3 : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Customer Group 4'
  AdditionalCustomerGroup4 : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Customer Group 5'
  AdditionalCustomerGroup5 : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Relevant for POD'
  @sap.quickinfo : 'Relevant for POD processing'
  SlsDocIsRlvtForProofOfDeliv : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Alt.Tax Classific.'
  @sap.quickinfo : 'Alternative Tax Classification'
  CustomerTaxClassification1 : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Class.2 Customer'
  @sap.quickinfo : 'Tax Classification 2 for Customer'
  CustomerTaxClassification2 : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Class.3 Customer'
  @sap.quickinfo : 'Tax Classification 3 for Customer'
  CustomerTaxClassification3 : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Class.4 Customer'
  @sap.quickinfo : 'Tax Classification 4 for Customer'
  CustomerTaxClassification4 : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Class.5 Customer'
  @sap.quickinfo : 'Tax Classification 5 for Customer'
  CustomerTaxClassification5 : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Class.6 Customer'
  @sap.quickinfo : 'Tax Classification 6 for Customer'
  CustomerTaxClassification6 : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Class.7 Customer'
  @sap.quickinfo : 'Tax Classification 7 for Customer'
  CustomerTaxClassification7 : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Class.8 Customer'
  @sap.quickinfo : 'Tax Classification 8 for Customer'
  CustomerTaxClassification8 : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Class.9 Customer'
  @sap.quickinfo : 'Tax Classification 9 for Customer'
  CustomerTaxClassification9 : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Departure C/R'
  @sap.quickinfo : 'Tax Departure Country/Region'
  TaxDepartureCountry : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Dest. Ctry/Reg.'
  @sap.quickinfo : 'Tax Destination Country/Region'
  VATRegistrationCountry : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Apprvl Req. Rsn ID'
  @sap.quickinfo : 'Approval Request Reason ID'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  SalesOrderApprovalReason : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Approval Status'
  @sap.quickinfo : 'Document Approval Status'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  SalesDocApprovalStatus : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Overall Status'
  @sap.quickinfo : 'Overall Processing Status (Header/All Items)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  OverallSDProcessStatus : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Credit Status'
  @sap.quickinfo : 'Overall Status of Credit Checks'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  TotalCreditCheckStatus : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Ovrl Delivery Status'
  @sap.quickinfo : 'Overall Delivery Status (All Items)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  OverallTotalDeliveryStatus : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Rejection Status'
  @sap.quickinfo : 'Rejection Status (All Items)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  OverallSDDocumentRejectionSts : String(1);
  @sap.display.format : 'Date'
  @sap.label : 'Billing Date'
  BillingDocumentDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Contract Account'
  @sap.quickinfo : 'Contract Account Number'
  ContractAccount : String(12);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Addit. Value Days'
  @sap.quickinfo : 'Additional Value Days'
  AdditionalValueDays : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Supplement'
  @sap.quickinfo : 'Purchase order number supplement'
  CustomerPurchaseOrderSuplmnt : String(4);
  @sap.display.format : 'Date'
  @sap.label : 'Serv. Rendered Date'
  @sap.quickinfo : 'Date on which services are rendered'
  ServicesRenderedDate : Date;
  @sap.display.format : 'Date'
  @sap.label : 'Cancellation Date'
  FashionCancelDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Customer Group 6'
  RetailAdditionalCustomerGrp6 : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Customer Group 7'
  RetailAdditionalCustomerGrp7 : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Customer Group 8'
  RetailAdditionalCustomerGrp8 : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Customer Group 9'
  RetailAdditionalCustomerGrp9 : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Customer Group 10'
  RetailAdditionalCustomerGrp10 : String(3);

  /**
   * Please add  an ON condition
   */
  to_Item : Association to many OP_API_SALES_ORDER_SRV_0001.A_SalesOrderItem {  };

  /**
   * Please add  an ON condition
   */
  to_Partner : Association to many OP_API_SALES_ORDER_SRV_0001.A_SalesOrderHeaderPartner {  };

  /**
   * Please add  an ON condition
   */
  to_PaymentPlanItemDetails : Association to many OP_API_SALES_ORDER_SRV_0001.A_SlsOrdPaymentPlanItemDetails {  };

  /**
   * Please add  an ON condition
   */
  to_PricingElement : Association to many OP_API_SALES_ORDER_SRV_0001.A_SalesOrderHeaderPrElement {  };

  /**
   * Please add  an ON condition
   */
  to_RelatedObject : Association to many OP_API_SALES_ORDER_SRV_0001.A_SalesOrderRelatedObject {  };

  /**
   * Please add  an ON condition
   */
  to_Text : Association to many OP_API_SALES_ORDER_SRV_0001.A_SalesOrderText {  };
};

@cds.persistence.skip : true
@sap.label : 'Header Partner'
@sap.content.version : '1'
entity OP_API_SALES_ORDER_SRV_0001.A_SalesOrderHeaderPartner {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales Order'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  key SalesOrder : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Partner Function'
  key PartnerFunction : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Customer'
  @sap.quickinfo : 'Customer Number'
  Customer : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Supplier'
  @sap.quickinfo : 'Account Number of Supplier'
  Supplier : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Personnel Number'
  Personnel : String(8);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Contact Person'
  @sap.quickinfo : 'Number of Contact Person'
  ContactPerson : String(10);

  /**
   * Please add  an ON condition
   */
  to_SalesOrder : Association to OP_API_SALES_ORDER_SRV_0001.A_SalesOrder {  };
};

@cds.persistence.skip : true
@sap.label : 'Header Pricing Element'
@sap.content.version : '1'
entity OP_API_SALES_ORDER_SRV_0001.A_SalesOrderHeaderPrElement {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales Order'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  key SalesOrder : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Step Number'
  key PricingProcedureStep : String(3);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Counter'
  @sap.quickinfo : 'Condition Counter'
  key PricingProcedureCounter : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Condition Type'
  ConditionType : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Valid From'
  @sap.quickinfo : 'Timestamp for Pricing'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  PricingDateTime : String(14);
  @sap.display.format : 'Date'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  PriceConditionDeterminationDte : Date;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Calculation Type'
  @sap.quickinfo : 'Calculation Type for Condition'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionCalculationType : String(3);
  @sap.label : 'Condition Basis'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionBaseValue : Decimal(24, 9);
  @sap.label : 'Amount'
  @sap.quickinfo : 'Condition Amount or Percentage'
  ConditionRateValue : Decimal(24, 9);
  @sap.label : 'Currency'
  @sap.quickinfo : 'Currency Key'
  @sap.semantics : 'currency-code'
  ConditionCurrency : String(5);
  @sap.unit : 'ConditionQuantitySAPUnit'
  @sap.label : 'Pricing Unit'
  @sap.quickinfo : 'Condition Pricing Unit'
  ConditionQuantity : Decimal(5, 0);
  @sap.label : 'Condition Unit'
  @sap.quickinfo : 'Condition Unit in the Document'
  @sap.semantics : 'unit-of-measure'
  ConditionQuantityUnit : String(3);
  @sap.label : 'SAP Condition Qty'
  @sap.quickinfo : 'SAP Unit Code for Condition Quantity'
  @sap.semantics : 'unit-of-measure'
  ConditionQuantitySAPUnit : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'ISO Condition Qty'
  @sap.quickinfo : 'ISO Unit Code for Condition Quantity'
  ConditionQuantityISOUnit : String(3);
  @sap.label : 'Condition Category'
  @sap.quickinfo : 'Condition Category (Examples: Tax, Freight, Price, Cost)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionCategory : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Statistical'
  @sap.quickinfo : 'Condition is used for statistics'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionIsForStatistics : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Scale Type'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  PricingScaleType : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Condition Origin'
  @sap.quickinfo : 'Origin of the Condition'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionOrigin : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Group Condition'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  IsGroupCondition : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Condition Record No.'
  @sap.quickinfo : 'Number of the Condition Record'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionRecord : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Sequent.No. of Cond.'
  @sap.quickinfo : 'Sequential Number of the Condition'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionSequentialNumber : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Code'
  @sap.quickinfo : 'Tax on sales/purchases code'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  TaxCode : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'W/Tax Code'
  @sap.quickinfo : 'Withholding Tax Code'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  WithholdingTaxCode : String(2);
  @sap.unit : 'TransactionCurrency'
  @sap.label : 'Cond.Rounding Diff.'
  @sap.quickinfo : 'Rounding-Off Difference of the Condition'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  CndnRoundingOffDiffAmount : Decimal(6, 3);
  @sap.unit : 'TransactionCurrency'
  @sap.label : 'Value'
  @sap.quickinfo : 'Condition Value'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionAmount : Decimal(16, 3);
  @sap.label : 'Document Currency'
  @sap.quickinfo : 'SD Document Currency'
  @sap.semantics : 'currency-code'
  TransactionCurrency : String(5);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Condition Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionControl : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Inactive Condition'
  @sap.quickinfo : 'Condition is Inactive'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionInactiveReason : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Condition Class'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionClass : String(1);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Counter'
  @sap.quickinfo : 'Condition Counter (Header)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  PrcgProcedureCounterForHeader : String(3);
  @sap.label : 'Condition Factor'
  @sap.quickinfo : 'Factor for Condition Base Value'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  FactorForConditionBasisValue : Double;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Structure Condition'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  StructureCondition : String(1);
  @sap.label : 'Condition Factor'
  @sap.quickinfo : 'Factor for Condition Basis (Period)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  PeriodFactorForCndnBasisValue : Double;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Scale Basis'
  @sap.quickinfo : 'Scale Basis Indicator'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  PricingScaleBasis : String(3);
  @sap.label : 'Scale Base Val.'
  @sap.quickinfo : 'Scale Base Value'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionScaleBasisValue : Decimal(24, 9);
  @sap.label : 'Scale Unit of Meas.'
  @sap.quickinfo : 'Condition Scale Unit of Measure'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.semantics : 'unit-of-measure'
  ConditionScaleBasisUnit : String(3);
  @sap.label : 'Scale Currency'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.semantics : 'currency-code'
  ConditionScaleBasisCurrency : String(5);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Intercomp.Billing'
  @sap.quickinfo : 'Condition for Intercompany Billing'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  CndnIsRelevantForIntcoBilling : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Changed Manually'
  @sap.quickinfo : 'Condition Changed Manually'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionIsManuallyChanged : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'UsedforVariantConfig'
  @sap.quickinfo : 'Condition Used for Variant Configuration'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionIsForConfiguration : Boolean;
  @sap.label : 'Variant Key'
  @sap.quickinfo : 'Variant Condition Key'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  VariantCondition : String(26);

  /**
   * Please add  an ON condition
   */
  to_SalesOrder : Association to OP_API_SALES_ORDER_SRV_0001.A_SalesOrder {  };
};

@cds.persistence.skip : true
@sap.label : 'Sales Order Item'
@sap.content.version : '1'
entity OP_API_SALES_ORDER_SRV_0001.A_SalesOrderItem {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales Order'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  key SalesOrder : String(10);
  @sap.display.format : 'NonNegative'
  @sap.text : 'SalesOrderItemText'
  @sap.label : 'Item'
  @sap.quickinfo : 'Sales Order Item'
  key SalesOrderItem : String(6);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Higher-Level Item'
  @sap.quickinfo : 'Higher-Level Item in Bill of Material Structures'
  HigherLevelItem : String(6);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Usage of HL Item'
  @sap.quickinfo : 'ID for higher-level item usage'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  HigherLevelItemUsage : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Item Category'
  @sap.quickinfo : 'Sales Document Item Category'
  SalesOrderItemCategory : String(4);
  @sap.label : 'Item Description'
  @sap.quickinfo : 'Short text for sales order item'
  SalesOrderItemText : String(40);
  @sap.label : 'Customer Reference'
  PurchaseOrderByCustomer : String(35);
  @sap.label : 'Customer Reference'
  @sap.quickinfo : 'Ship-to Party''s Customer Reference'
  PurchaseOrderByShipToParty : String(35);
  @sap.display.format : 'UpperCase'
  @sap.label : 'External Item ID'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ExternalItemID : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material'
  @sap.quickinfo : 'Material Number'
  Material : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Customer Material'
  @sap.quickinfo : 'Material Number Used by Customer'
  MaterialByCustomer : String(35);
  @sap.display.format : 'Date'
  @sap.label : 'Pricing Date'
  @sap.quickinfo : 'Date for Pricing and Exchange Rate'
  PricingDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Pricing Ref. Matl'
  @sap.quickinfo : 'Pricing Reference Material'
  PricingReferenceMaterial : String(40);
  @sap.unit : 'RequestedQuantitySAPUnit'
  @sap.label : 'Requested Quantity'
  RequestedQuantity : Decimal(15, 3);
  @sap.label : 'Requested Qty Unit'
  @sap.quickinfo : 'Unit of the Requested Quantity'
  @sap.semantics : 'unit-of-measure'
  RequestedQuantityUnit : String(3);
  @sap.label : 'SAP Code Req. Qty'
  @sap.quickinfo : 'SAP Unit Code for Requested Quantity'
  @sap.semantics : 'unit-of-measure'
  RequestedQuantitySAPUnit : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'ISO Code Req. Qty'
  @sap.quickinfo : 'ISO Unit Code for Requested Quantity'
  RequestedQuantityISOUnit : String(3);
  @sap.label : 'Sales Unit'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.semantics : 'unit-of-measure'
  OrderQuantityUnit : String(3);
  @sap.label : 'SAP Order Quantity'
  @sap.quickinfo : 'SAP Unit Code for Order Quantity'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.semantics : 'unit-of-measure'
  OrderQuantitySAPUnit : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'ISO Order Quantity'
  @sap.quickinfo : 'ISO Unit Code for Order Quantity'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  OrderQuantityISOUnit : String(3);
  @sap.unit : 'OrderQuantitySAPUnit'
  @sap.label : 'Cumltv Confd Qty(SU)'
  @sap.quickinfo : 'Cumulative Confirmed Quantity in Sales Unit'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConfdDelivQtyInOrderQtyUnit : Decimal(15, 3);
  @sap.unit : 'ItemWeightSAPUnit'
  @sap.label : 'Gross Weight'
  @sap.quickinfo : 'Gross Weight of the Item'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ItemGrossWeight : Decimal(15, 3);
  @sap.unit : 'ItemWeightSAPUnit'
  @sap.label : 'Net Weight'
  @sap.quickinfo : 'Net Weight of the Item'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ItemNetWeight : Decimal(15, 3);
  @sap.label : 'Weight Unit'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.semantics : 'unit-of-measure'
  ItemWeightUnit : String(3);
  @sap.label : 'SAP Code Item Weight'
  @sap.quickinfo : 'SAP Unit Code for Item Weight'
  @sap.semantics : 'unit-of-measure'
  ItemWeightSAPUnit : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'ISO Code Item Weight'
  @sap.quickinfo : 'ISO Unit Code for Item Weight'
  ItemWeightISOUnit : String(3);
  @sap.unit : 'ItemVolumeSAPUnit'
  @sap.label : 'Volume'
  @sap.quickinfo : 'Volume of the item'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ItemVolume : Decimal(15, 3);
  @sap.label : 'Volume Unit'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.semantics : 'unit-of-measure'
  ItemVolumeUnit : String(3);
  @sap.label : 'SAP Code f Item Vol.'
  @sap.quickinfo : 'SAP Unit Code for Item Volume'
  @sap.semantics : 'unit-of-measure'
  ItemVolumeSAPUnit : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'ISO Unit Item Volume'
  @sap.quickinfo : 'ISO Unit Code for Item Volume'
  ItemVolumeISOUnit : String(3);
  @sap.label : 'Document Currency'
  @sap.quickinfo : 'SD Document Currency'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.semantics : 'currency-code'
  TransactionCurrency : String(5);
  @sap.unit : 'TransactionCurrency'
  @sap.label : 'Net Value'
  @sap.quickinfo : 'Net Value of the Order Item in Document Currency'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  NetAmount : Decimal(16, 3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Ovrl Reference Sts'
  @sap.quickinfo : 'Overall Reference Status (Item)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  TotalSDDocReferenceStatus : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Reference Status'
  @sap.quickinfo : 'Reference Status (Item)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  SDDocReferenceStatus : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Substitution Reason'
  @sap.quickinfo : 'Reason for material substitution'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  MaterialSubstitutionReason : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material Group'
  MaterialGroup : String(9);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material Price Grp'
  @sap.quickinfo : 'Material Price Group'
  MaterialPricingGroup : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material Group 1'
  AdditionalMaterialGroup1 : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material Group 2'
  AdditionalMaterialGroup2 : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material Group 3'
  AdditionalMaterialGroup3 : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material Group 4'
  AdditionalMaterialGroup4 : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material Group 5'
  AdditionalMaterialGroup5 : String(3);
  @sap.display.format : 'Date'
  @sap.label : 'Billing Date'
  BillingDocumentDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Contract Account'
  @sap.quickinfo : 'Contract Account Number'
  ContractAccount : String(12);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Addit. Value Days'
  @sap.quickinfo : 'Additional Value Days'
  AdditionalValueDays : String(2);
  @sap.display.format : 'Date'
  @sap.label : 'Serv. Rendered Date'
  @sap.quickinfo : 'Date on which services are rendered'
  ServicesRenderedDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Batch'
  @sap.quickinfo : 'Batch Number'
  Batch : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Plant'
  @sap.quickinfo : 'Plant (Own or External)'
  ProductionPlant : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Storage Location'
  StorageLocation : String(4);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Delivery Group'
  @sap.quickinfo : 'Delivery Group (Items are delivered together)'
  DeliveryGroup : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Shipping Point'
  @sap.quickinfo : 'Shipping Point / Receiving Point'
  ShippingPoint : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Shipping Type'
  ShippingType : String(2);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Delivery Priority'
  DeliveryPriority : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Deliv Date Rule'
  @sap.quickinfo : 'Delivery Date Rule'
  DeliveryDateTypeRule : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Incoterms'
  @sap.quickinfo : 'Incoterms (Part 1)'
  IncotermsClassification : String(3);
  @sap.label : 'Incoterms (Part 2)'
  IncotermsTransferLocation : String(28);
  @sap.label : 'Incoterms Location 1'
  IncotermsLocation1 : String(70);
  @sap.label : 'Incoterms Location 2'
  IncotermsLocation2 : String(70);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Classifc. Mat.'
  @sap.quickinfo : 'Tax Classification for Material'
  ProductTaxClassification1 : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Classifc. Mat.'
  @sap.quickinfo : 'Tax Classification for Material'
  ProductTaxClassification2 : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Classifc. Mat.'
  @sap.quickinfo : 'Tax Classification for Material'
  ProductTaxClassification3 : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Classifc. Mat.'
  @sap.quickinfo : 'Tax Classification for Material'
  ProductTaxClassification4 : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Classifc. Mat.'
  @sap.quickinfo : 'Tax Classification for Material'
  ProductTaxClassification5 : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Classifc. Mat.'
  @sap.quickinfo : 'Tax Classification for Material'
  ProductTaxClassification6 : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Classifc. Mat.'
  @sap.quickinfo : 'Tax Classification for Material'
  ProductTaxClassification7 : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Classifc. Mat.'
  @sap.quickinfo : 'Tax Classification for Material'
  ProductTaxClassification8 : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Classifc. Mat.'
  @sap.quickinfo : 'Tax Classification for Material'
  ProductTaxClassification9 : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Acct Assmt Grp Mat.'
  @sap.quickinfo : 'Account Assignment Group for Material'
  MatlAccountAssignmentGroup : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Payment Terms'
  @sap.quickinfo : 'Terms of Payment Key'
  CustomerPaymentTerms : String(4);
  @sap.display.format : 'Date'
  @sap.label : 'Fixed Value Date'
  FixedValueDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Customer Group'
  CustomerGroup : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Reason for Rejection'
  @sap.quickinfo : 'Reason for Rejection of Sales Documents'
  SalesDocumentRjcnReason : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Billing Block'
  @sap.quickinfo : 'Billing Block for Item'
  ItemBillingBlockReason : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Relevant for POD'
  @sap.quickinfo : 'Relevant for POD processing'
  SlsDocIsRlvtForProofOfDeliv : Boolean;
  @sap.display.format : 'NonNegative'
  @sap.label : 'WBS Element'
  @sap.quickinfo : 'Work Breakdown Structure Element (WBS Element)'
  WBSElement : String(24);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Profit Center'
  ProfitCenter : String(10);
  @sap.label : 'Exchng. Rate Accntg.'
  @sap.quickinfo : 'Exchange Rate for Postings to Financial Accounting'
  AccountingExchangeRate : Decimal(9, 5);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Reference Document'
  @sap.quickinfo : 'Document Number of Reference Document'
  ReferenceSDDocument : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Reference Item'
  @sap.quickinfo : 'Item number of the reference item'
  ReferenceSDDocumentItem : String(6);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Overall Status'
  @sap.quickinfo : 'Overall Processing Status (Item)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  SDProcessStatus : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Delivery Status'
  @sap.quickinfo : 'Delivery Status (Item)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  DeliveryStatus : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Ord.-Rel. Billg Sts'
  @sap.quickinfo : 'Order-Related Billing Status (Item)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  OrderRelatedBillingStatus : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Season Year'
  ProductSeasonYear : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Season'
  ProductSeason : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Collection'
  @sap.quickinfo : 'Fashion Collection'
  ProductCollection : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Theme'
  @sap.quickinfo : 'Fashion Theme'
  ProductTheme : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Season Comp.Ind'
  @sap.quickinfo : 'Season Completeness Indicator'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  SeasonCompletenessStatus : String(1);
  @sap.display.format : 'Date'
  @sap.label : 'Cancellation Date'
  FashionCancelDate : Date;
  @sap.label : 'Characteristic 1'
  @sap.quickinfo : 'Characteristic Value 1'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProductCharacteristic1 : String(18);
  @sap.label : 'Characteristic 2'
  @sap.quickinfo : 'Characteristic Value 2'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProductCharacteristic2 : String(18);
  @sap.label : 'Characteristic 3'
  @sap.quickinfo : 'Characteristic Value 3'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProductCharacteristic3 : String(18);
  @sap.display.format : 'UpperCase'
  @sap.label : 'PSST Group'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ShippingGroupNumber : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'PSST Grouping Rule'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ShippingGroupRule : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Cross-plant CM'
  @sap.quickinfo : 'Cross-Plant Configurable Material'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  CrossPlantConfigurableProduct : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material Category'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProductCategory : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Requirement Segment'
  RequirementSegment : String(40);

  /**
   * Please add  an ON condition
   */
  to_Partner : Association to many OP_API_SALES_ORDER_SRV_0001.A_SalesOrderItemPartner {  };

  /**
   * Please add  an ON condition
   */
  to_PricingElement : Association to many OP_API_SALES_ORDER_SRV_0001.A_SalesOrderItemPrElement {  };

  /**
   * Please add  an ON condition
   */
  to_RelatedObject : Association to many OP_API_SALES_ORDER_SRV_0001.A_SalesOrderItemRelatedObject {  };

  /**
   * Please add  an ON condition
   */
  to_SalesOrder : Association to OP_API_SALES_ORDER_SRV_0001.A_SalesOrder {  };

  /**
   * Please add  an ON condition
   */
  to_ScheduleLine : Association to many OP_API_SALES_ORDER_SRV_0001.A_SalesOrderScheduleLine {  };

  /**
   * Please add  an ON condition
   */
  to_Text : Association to many OP_API_SALES_ORDER_SRV_0001.A_SalesOrderItemText {  };

  /**
   * Please add  an ON condition
   */
  to_ValueAddedService : Association to many OP_API_SALES_ORDER_SRV_0001.A_SalesOrderValAddedSrvc {  };
};

@cds.persistence.skip : true
@sap.label : 'Item Partner'
@sap.content.version : '1'
entity OP_API_SALES_ORDER_SRV_0001.A_SalesOrderItemPartner {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales Order'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  key SalesOrder : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Item'
  @sap.quickinfo : 'Sales Order Item'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  key SalesOrderItem : String(6);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Partner Function'
  key PartnerFunction : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Customer'
  @sap.quickinfo : 'Customer Number'
  Customer : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Supplier'
  @sap.quickinfo : 'Account Number of Supplier'
  Supplier : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Personnel Number'
  Personnel : String(8);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Contact Person'
  @sap.quickinfo : 'Number of Contact Person'
  ContactPerson : String(10);

  /**
   * Please add  an ON condition
   */
  to_SalesOrder : Association to OP_API_SALES_ORDER_SRV_0001.A_SalesOrder {  };

  /**
   * Please add  an ON condition
   */
  to_SalesOrderItem : Association to OP_API_SALES_ORDER_SRV_0001.A_SalesOrderItem {  };
};

@cds.persistence.skip : true
@sap.label : 'Item Pricing Element'
@sap.content.version : '1'
entity OP_API_SALES_ORDER_SRV_0001.A_SalesOrderItemPrElement {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales Order'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  key SalesOrder : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Item'
  @sap.quickinfo : 'Sales Order Item'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  key SalesOrderItem : String(6);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Step Number'
  key PricingProcedureStep : String(3);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Counter'
  @sap.quickinfo : 'Condition Counter'
  key PricingProcedureCounter : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Condition Type'
  ConditionType : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Valid From'
  @sap.quickinfo : 'Timestamp for Pricing'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  PricingDateTime : String(14);
  @sap.display.format : 'Date'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  PriceConditionDeterminationDte : Date;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Calculation Type'
  @sap.quickinfo : 'Calculation Type for Condition'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionCalculationType : String(3);
  @sap.label : 'Condition Basis'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionBaseValue : Decimal(24, 9);
  @sap.label : 'Amount'
  @sap.quickinfo : 'Condition Amount or Percentage'
  ConditionRateValue : Decimal(24, 9);
  @sap.label : 'Currency'
  @sap.quickinfo : 'Currency Key'
  @sap.semantics : 'currency-code'
  ConditionCurrency : String(5);
  @sap.unit : 'ConditionQuantitySAPUnit'
  @sap.label : 'Pricing Unit'
  @sap.quickinfo : 'Condition Pricing Unit'
  ConditionQuantity : Decimal(5, 0);
  @sap.label : 'Condition Unit'
  @sap.quickinfo : 'Condition Unit in the Document'
  @sap.semantics : 'unit-of-measure'
  ConditionQuantityUnit : String(3);
  @sap.label : 'SAP Condition Qty'
  @sap.quickinfo : 'SAP Unit Code for Condition Quantity'
  @sap.semantics : 'unit-of-measure'
  ConditionQuantitySAPUnit : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'ISO Condition Qty'
  @sap.quickinfo : 'ISO Unit Code for Condition Quantity'
  ConditionQuantityISOUnit : String(3);
  @sap.label : 'Condition Category'
  @sap.quickinfo : 'Condition Category (Examples: Tax, Freight, Price, Cost)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionCategory : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Statistical'
  @sap.quickinfo : 'Condition is used for statistics'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionIsForStatistics : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Scale Type'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  PricingScaleType : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Accruals'
  @sap.quickinfo : 'Condition is Relevant for Accrual (e.g. Freight)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  IsRelevantForAccrual : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Invoice List Cond.'
  @sap.quickinfo : 'Condition for Invoice List'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  CndnIsRelevantForInvoiceList : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Condition Origin'
  @sap.quickinfo : 'Origin of the Condition'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionOrigin : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Group Condition'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  IsGroupCondition : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Condition Record No.'
  @sap.quickinfo : 'Number of the Condition Record'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionRecord : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Sequent.No. of Cond.'
  @sap.quickinfo : 'Sequential Number of the Condition'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionSequentialNumber : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Code'
  @sap.quickinfo : 'Tax on sales/purchases code'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  TaxCode : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'W/Tax Code'
  @sap.quickinfo : 'Withholding Tax Code'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  WithholdingTaxCode : String(2);
  @sap.unit : 'TransactionCurrency'
  @sap.label : 'Cond.Rounding Diff.'
  @sap.quickinfo : 'Rounding-Off Difference of the Condition'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  CndnRoundingOffDiffAmount : Decimal(6, 3);
  @sap.unit : 'TransactionCurrency'
  @sap.label : 'Value'
  @sap.quickinfo : 'Condition Value'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionAmount : Decimal(16, 3);
  @sap.label : 'Document Currency'
  @sap.quickinfo : 'SD Document Currency'
  @sap.semantics : 'currency-code'
  TransactionCurrency : String(5);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Condition Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionControl : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Inactive Condition'
  @sap.quickinfo : 'Condition is Inactive'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionInactiveReason : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Condition Class'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionClass : String(1);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Counter'
  @sap.quickinfo : 'Condition Counter (Header)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  PrcgProcedureCounterForHeader : String(3);
  @sap.label : 'Condition Factor'
  @sap.quickinfo : 'Factor for Condition Base Value'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  FactorForConditionBasisValue : Double;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Structure Condition'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  StructureCondition : String(1);
  @sap.label : 'Condition Factor'
  @sap.quickinfo : 'Factor for Condition Basis (Period)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  PeriodFactorForCndnBasisValue : Double;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Scale Basis'
  @sap.quickinfo : 'Scale Basis Indicator'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  PricingScaleBasis : String(3);
  @sap.label : 'Scale Base Val.'
  @sap.quickinfo : 'Scale Base Value'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionScaleBasisValue : Decimal(24, 9);
  @sap.label : 'Scale Unit of Meas.'
  @sap.quickinfo : 'Condition Scale Unit of Measure'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.semantics : 'unit-of-measure'
  ConditionScaleBasisUnit : String(3);
  @sap.label : 'Scale Currency'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.semantics : 'currency-code'
  ConditionScaleBasisCurrency : String(5);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Intercomp.Billing'
  @sap.quickinfo : 'Condition for Intercompany Billing'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  CndnIsRelevantForIntcoBilling : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Changed Manually'
  @sap.quickinfo : 'Condition Changed Manually'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionIsManuallyChanged : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'UsedforVariantConfig'
  @sap.quickinfo : 'Condition Used for Variant Configuration'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionIsForConfiguration : Boolean;
  @sap.label : 'Variant Key'
  @sap.quickinfo : 'Variant Condition Key'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  VariantCondition : String(26);

  /**
   * Please add  an ON condition
   */
  to_SalesOrder : Association to OP_API_SALES_ORDER_SRV_0001.A_SalesOrder {  };

  /**
   * Please add  an ON condition
   */
  to_SalesOrderItem : Association to OP_API_SALES_ORDER_SRV_0001.A_SalesOrderItem {  };
};

@cds.persistence.skip : true
@sap.label : 'Item Related Object'
@sap.content.version : '1'
entity OP_API_SALES_ORDER_SRV_0001.A_SalesOrderItemRelatedObject {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales Order'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  key SalesOrder : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Item'
  @sap.quickinfo : 'Sales Order Item'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  key SalesOrderItem : String(6);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Sequence Number'
  @sap.quickinfo : 'Sequence Number of the Related Object of an SD Document'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  key SDDocRelatedObjectSequenceNmbr : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Related Object Type'
  @sap.quickinfo : 'Type of the Related Object of an SD Document'
  SDDocumentRelatedObjectType : String(5);
  @sap.label : 'System of Reltd Obj.'
  @sap.quickinfo : 'System of the Related Object of an SD Document'
  SDDocRelatedObjectSystem : String(60);
  @sap.label : 'Reltd Obj. Reference'
  @sap.quickinfo : 'Reference of the Related Object of an SD Document'
  SDDocRelatedObjectReference1 : String(60);
  @sap.label : 'Reltd Obj. Reference'
  @sap.quickinfo : 'Reference of the Related Object of an SD Document'
  SDDocRelatedObjectReference2 : String(60);

  /**
   * Please add  an ON condition
   */
  to_SalesOrder : Association to OP_API_SALES_ORDER_SRV_0001.A_SalesOrder {  };

  /**
   * Please add  an ON condition
   */
  to_SalesOrderItem : Association to OP_API_SALES_ORDER_SRV_0001.A_SalesOrderItem {  };
};

@cds.persistence.skip : true
@sap.label : 'Item Text'
@sap.content.version : '1'
entity OP_API_SALES_ORDER_SRV_0001.A_SalesOrderItemText {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales Order'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  key SalesOrder : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Item'
  @sap.quickinfo : 'Sales Order Item'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  key SalesOrderItem : String(6);
  @sap.label : 'Language Key'
  key Language : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Text ID'
  key LongTextID : String(4);
  @sap.label : 'String'
  @sap.heading : ''
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  LongText : LargeString;

  /**
   * Please add  an ON condition
   */
  to_SalesOrder : Association to OP_API_SALES_ORDER_SRV_0001.A_SalesOrder {  };

  /**
   * Please add  an ON condition
   */
  to_SalesOrderItem : Association to OP_API_SALES_ORDER_SRV_0001.A_SalesOrderItem {  };
};

@cds.persistence.skip : true
@sap.label : 'Header Related Object'
@sap.content.version : '1'
entity OP_API_SALES_ORDER_SRV_0001.A_SalesOrderRelatedObject {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales Order'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  key SalesOrder : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Sequence Number'
  @sap.quickinfo : 'Sequence Number of the Related Object of an SD Document'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  key SDDocRelatedObjectSequenceNmbr : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Related Object Type'
  @sap.quickinfo : 'Type of the Related Object of an SD Document'
  SDDocumentRelatedObjectType : String(5);
  @sap.label : 'System of Reltd Obj.'
  @sap.quickinfo : 'System of the Related Object of an SD Document'
  SDDocRelatedObjectSystem : String(60);
  @sap.label : 'Reltd Obj. Reference'
  @sap.quickinfo : 'Reference of the Related Object of an SD Document'
  SDDocRelatedObjectReference1 : String(60);
  @sap.label : 'Reltd Obj. Reference'
  @sap.quickinfo : 'Reference of the Related Object of an SD Document'
  SDDocRelatedObjectReference2 : String(60);

  /**
   * Please add  an ON condition
   */
  to_SalesOrder : Association to OP_API_SALES_ORDER_SRV_0001.A_SalesOrder {  };
};

@cds.persistence.skip : true
@sap.label : 'Item Schedule Line'
@sap.content.version : '1'
entity OP_API_SALES_ORDER_SRV_0001.A_SalesOrderScheduleLine {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales Document'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  key SalesOrder : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Sales Document Item'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  key SalesOrderItem : String(6);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Schedule Line Number'
  key ScheduleLine : String(4);
  @sap.display.format : 'Date'
  @sap.label : 'Delivery Date'
  @sap.quickinfo : 'Requested Delivery Date'
  RequestedDeliveryDate : Date;
  @sap.display.format : 'Date'
  @sap.label : 'Delivery Date'
  @sap.quickinfo : 'Confirmed Delivery Date'
  ConfirmedDeliveryDate : Date;
  @sap.label : 'Sales Unit'
  @sap.semantics : 'unit-of-measure'
  OrderQuantityUnit : String(3);
  @sap.label : 'SAP Order Quantity'
  @sap.quickinfo : 'SAP Unit Code for Order Quantity'
  @sap.semantics : 'unit-of-measure'
  OrderQuantitySAPUnit : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'ISO Order Quantity'
  @sap.quickinfo : 'ISO Unit Code for Order Quantity'
  OrderQuantityISOUnit : String(3);
  @sap.unit : 'OrderQuantitySAPUnit'
  @sap.label : 'Order Quantity'
  @sap.quickinfo : 'Order Quantity in Sales Units'
  ScheduleLineOrderQuantity : Decimal(13, 3);
  @sap.unit : 'OrderQuantitySAPUnit'
  @sap.label : 'Confirmed Quantity'
  ConfdOrderQtyByMatlAvailCheck : Decimal(13, 3);
  @sap.unit : 'OrderQuantitySAPUnit'
  @sap.label : 'Delivered Quantity'
  DeliveredQtyInOrderQtyUnit : Decimal(13, 3);
  @sap.unit : 'OrderQuantitySAPUnit'
  @sap.label : 'Open Quantity'
  @sap.quickinfo : 'Open Confirmed Delivery Quantity'
  OpenConfdDelivQtyInOrdQtyUnit : Decimal(13, 3);
  @sap.unit : 'OrderQuantitySAPUnit'
  @sap.label : 'Corr.qty'
  @sap.quickinfo : 'Corrected quantity in sales unit'
  CorrectedQtyInOrderQtyUnit : Decimal(13, 3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Delivery Block'
  @sap.quickinfo : 'Schedule Line Blocked for Delivery'
  DelivBlockReasonForSchedLine : String(2);
};

@cds.persistence.skip : true
@sap.label : 'Header Text'
@sap.content.version : '1'
entity OP_API_SALES_ORDER_SRV_0001.A_SalesOrderText {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales Order'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  key SalesOrder : String(10);
  @sap.label : 'Language Key'
  key Language : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Text ID'
  key LongTextID : String(4);
  @sap.label : 'String'
  @sap.heading : ''
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  LongText : LargeString;

  /**
   * Please add  an ON condition
   */
  to_SalesOrder : Association to OP_API_SALES_ORDER_SRV_0001.A_SalesOrder {  };
};

@cds.persistence.skip : true
@sap.label : 'Item Value Added Service'
@sap.content.version : '1'
entity OP_API_SALES_ORDER_SRV_0001.A_SalesOrderValAddedSrvc {
  @sap.display.format : 'NonNegative'
  @sap.label : 'VAS Service Types'
  key ValueAddedServiceType : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'VAS Sub Services'
  key ValueAddedSubServiceType : String(5);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Reference Document'
  @sap.quickinfo : 'Document Number of Reference Document'
  key SalesOrder : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Reference Item'
  @sap.quickinfo : 'Item number of the reference item'
  key SalesOrderItem : String(6);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Transaction Number'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ValAddedSrvcTransactionNumber : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Item Group'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ValAddedSrvcItemGroup : String(5);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Item Number'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ValAddedSrvcItemNumber : String(5);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material Number'
  @sap.quickinfo : 'VAS Material Number'
  ValueAddedServiceProduct : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Req Relevance'
  @sap.quickinfo : 'Requirement Relevancy Flag for VAS Material'
  ValAddedSrvcHasToBeOrdered : Boolean;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Increment'
  @sap.quickinfo : 'VAS Increment'
  ValAddedSrvcIncrement : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'VAS Charge Code'
  @sap.quickinfo : 'VAS Charge Codes'
  ValueAddedServiceChargeCode : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Manual Entry Ind.'
  @sap.quickinfo : 'Manual Entry Indicator'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ValAddedSrvcIsCreatedManually : String(1);
  @sap.display.format : 'NonNegative'
  @sap.label : 'VAS Item Number'
  @sap.quickinfo : 'VAS Item Number in SD'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ValAddedSrvcItemNumberInSD : String(6);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Procurmnt Relev'
  @sap.quickinfo : 'Procurement Relevant for VAS Material'
  ValAddedSrvcIsRlvtForProcmt : Boolean;
  @sap.label : 'Field1'
  @sap.quickinfo : 'VAS Field 1 for Free Use by Customer'
  ValueAddedServiceText1 : String(20);
  @sap.label : 'Field2'
  @sap.quickinfo : 'VAS Field 2 for Free Use by Customer'
  ValueAddedServiceText2 : String(20);
  @sap.label : 'Field3'
  @sap.quickinfo : 'VAS Field 3 for Free Use by Customer'
  ValueAddedServiceText3 : String(20);
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  ValueAddedServiceLongText : String(132);
};

@cds.persistence.skip : true
@sap.label : 'Header Payment Plan'
@sap.content.version : '1'
entity OP_API_SALES_ORDER_SRV_0001.A_SlsOrdPaymentPlanItemDetails {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales Order'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  key SalesOrder : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Item'
  @sap.quickinfo : 'Item for billing plan/invoice plan/payment cards'
  key PaymentPlanItem : String(6);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Bill. Plan No.'
  @sap.quickinfo : 'Billing Plan Number / Invoicing Plan Number'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  PaymentPlan : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'EPayt Type'
  @sap.quickinfo : 'Electronic Payment: Payment Type'
  ElectronicPaymentType : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Account Number'
  @sap.quickinfo : 'Electronic Payment: Account Number'
  ElectronicPayment : String(25);
  @sap.display.format : 'Date'
  @sap.label : 'EPayt Valid from'
  @sap.quickinfo : 'Electronic Payment: Valid from'
  EPaytValidityStartDate : Date;
  @sap.display.format : 'Date'
  @sap.label : 'EPayt Valid to'
  @sap.quickinfo : 'Electronic Payment: Valid to'
  EPaytValidityEndDate : Date;
  @sap.label : 'Account Holder'
  @sap.quickinfo : 'Electronic Payment: Name of Account Holder'
  ElectronicPaymentHolderName : String(40);
  @sap.unit : 'AuthorizationCurrency'
  @sap.label : 'Authorized Amount'
  @sap.quickinfo : 'Electronic Payment: Authorized Amount'
  AuthorizedAmountInAuthznCrcy : Decimal(16, 3);
  @sap.label : 'Currency'
  @sap.quickinfo : 'Currency Key'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.semantics : 'currency-code'
  AuthorizationCurrency : String(5);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Auth. Number'
  @sap.quickinfo : 'Electronic Payment: Authorization Number'
  AuthorizationByDigitalPaytSrvc : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Auth. Ref. Code'
  @sap.quickinfo : 'Electronic Payment: Authorization Reference Code'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  AuthorizationByAcquirer : String(15);
  @sap.display.format : 'Date'
  @sap.label : 'EPayt Auth. Date'
  @sap.quickinfo : 'Electronic Payment: Authorization Date'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  AuthorizationDate : Date;
  @sap.label : 'EPayt Auth. Time'
  @sap.quickinfo : 'Electronic Payment: Authorization Time'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  AuthorizationTime : Time;
  @sap.label : 'Text'
  @sap.quickinfo : 'Payment cards: Result text'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  AuthorizationStatusName : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'EPayt Token'
  @sap.quickinfo : 'Token for Digital Payment Integration in SD'
  EPaytByDigitalPaymentSrvc : String(25);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Call Status'
  @sap.quickinfo : 'Electronic Payment: Call Status'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ElectronicPaymentCallStatus : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Rsp to Auth. Check'
  @sap.quickinfo : 'Electronic Payment: Response to Authorization Checks'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  EPaytAuthorizationResult : String(1);
  @sap.unit : 'AuthorizationCurrency'
  @sap.label : 'Amt to Be Auth.'
  @sap.quickinfo : 'Electronic Payment: Amount to Be Authorized'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  EPaytToBeAuthorizedAmount : Decimal(16, 3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Auth. Expired'
  @sap.quickinfo : 'Electronic Payment: Authorization Expired'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  EPaytAuthorizationIsExpired : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Amount Changed'
  @sap.quickinfo : 'Electronic Payment: Amount Changed'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  EPaytAmountIsChanged : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Preauthorization'
  @sap.quickinfo : 'Electronic Payment: Preauthorization'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  PreauthorizationIsRequested : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Paymnt Serv. Provid.'
  @sap.quickinfo : 'Payment Service Provider for Digital Payments'
  PaymentServiceProvider : String(4);
  @sap.label : 'Payment Identifier'
  @sap.quickinfo : 'Digital Payments: Payment ID from Payment Service Provider'
  PaymentByPaymentServicePrvdr : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'PSP Transaction ID'
  @sap.quickinfo : 'SAP Digital Payments: Transaction ID of PSP'
  TransactionByPaytSrvcPrvdr : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Merchant ID'
  @sap.quickinfo : 'Electronic Payment: Merchant ID at Clearing House'
  MerchantByClearingHouse : String(15);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Auth. Rel. ID'
  @sap.quickinfo : 'Unique identifier of a previous successful authorization'
  PaymentCardAuthznRelationID : String(44);
  @sap.unit : 'AuthorizationCurrency'
  @sap.label : 'Billing Value'
  @sap.quickinfo : 'Value to be billed/calc. on date in billing/invoice plan'
  MaximumToBeAuthorizedAmount : Decimal(16, 3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Higher-level plan'
  @sap.quickinfo : 'Higher-level payment card plan number for billing'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  PaytPlnForAuthorizationItem : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Higher-level item'
  @sap.quickinfo : 'Higher-level item in billing plan'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  PaytPlnItmForAuthorizationItem : String(6);

  /**
   * Please add  an ON condition
   */
  to_SalesOrder : Association to OP_API_SALES_ORDER_SRV_0001.A_SalesOrder {  };
};

