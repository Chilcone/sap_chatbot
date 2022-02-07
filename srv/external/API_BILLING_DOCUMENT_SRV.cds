/* checksum : 843ba3f0f2b1b319f762f61b1473be95 */
@cds.external : true
service API_BILLING_DOCUMENT_SRV {};

type API_BILLING_DOCUMENT_SRV.FunctionImportResult {
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  BillingDocument : String(10);
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  BillingDocumentItem : String(10);
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  MessageId : String(3);
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  MessageType : String(1);
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Message : String(256);
};

type API_BILLING_DOCUMENT_SRV.CancelResult {
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  BillingDocument : String(10);
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  CancellationBillingDocument : String(10);

  /**
   * Message type (E,I,W,...)
   */
  @sap.label : 'Message Type'
  @sap.heading : 'MT'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  SystemMessageType : String(1);

  /**
   * A grouping term for every work area under which the number of the message is saved.
   */
  @sap.label : 'Message class'
  @sap.quickinfo : 'Message identification'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  SystemMessageIdentification : String(20);
  @sap.label : 'Message Number'
  @sap.heading : 'Msg.'
  @sap.quickinfo : 'System Message Number'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  SystemMessageNumber : String(3);
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  SystemMessageText : String(256);
  @sap.label : 'Message variable'
  @sap.heading : '*'
  @sap.quickinfo : 'Message variable 01'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  SystemMessageVariable1 : String(50);
  @sap.label : 'Message variable'
  @sap.heading : '*'
  @sap.quickinfo : 'Message variable 02'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  SystemMessageVariable2 : String(50);
  @sap.label : 'Message variable'
  @sap.heading : '*'
  @sap.quickinfo : 'Message variable 03'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  SystemMessageVariable3 : String(50);
  @sap.label : 'Message variable'
  @sap.heading : '*'
  @sap.quickinfo : 'Message variable 04'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  SystemMessageVariable4 : String(50);
};

type API_BILLING_DOCUMENT_SRV.GetPDFResult {
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  BillingDocumentBinary : LargeString;
};

@cds.persistence.skip : true
@sap.label : 'Billing Document Header'
@sap.content.version : '1'
entity API_BILLING_DOCUMENT_SRV.A_BillingDocument {

  /**
   * The number that uniquely identifies the billing document (the invoice, for example).
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Billing Document'
  key BillingDocument : String(10);

  /**
   * A classification for the different types of documents that you can process, for example, quotations, sales orders, deliveries, and invoices.
   * 
   * The document category determines how the system stores and keeps track of document data. It enables the system to provide you with status information about delivery processing, billing, and documents that are used for reference (for example, inquiries and quotations).
   */
  @sap.label : 'SD Document Category'
  SDDocumentCategory : String(4);

  /**
   * Indicates whether the billing document refers to a sales order or a delivery.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Billing Category'
  BillingDocumentCategory : String(1);

  /**
   * Classifies types of billing document that require different processing by the system.
   * 
   * When you process billing documents collectively, you can use the billing type as one of the selection criteria.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Billing Type'
  BillingDocumentType : String(4);
  @sap.display.format : 'Date'
  @sap.label : 'Created On'
  @sap.quickinfo : 'Date on Which Record Was Created'
  CreationDate : Date;

  /**
   * The time of day at which the document was posted and stored in the system.
   */
  @sap.label : 'Time'
  @sap.quickinfo : 'Entry time'
  CreationTime : Time;
  @sap.display.format : 'Date'
  @sap.label : 'Changed On'
  @sap.quickinfo : 'Last Changed On'
  LastChangeDate : Date;

  /**
   * The UTC timestamp displays date and time according to UTC (Universal Coordinated Time).
   * 
   * In order to convert local time into a UTC time stamp, which makes it easier to compare times, the local time must be converted according to your time zone. The ABAP command convert is available for this purpose.Even if the time zone that the conversion is based on can be redetermined from Customizing or master data, we still recommend that you save the time zone.The internal structure of the high-resolution UTC time stamp is logically organized in date and time sections in a packed decimal format (YYYYMMDDhhmmssmmmuuun), which depicts the year, month, day, hour,second, millisecond, microsecond and the first decimal of the nanoseconds. Please note that the hardware that is normally used does not fully support a resolution of 100 nanoseconds, which is available in the structure.See also GET TIME STAMPA UTC time stamp in short form is also available.
   */
  @sap.label : 'Time Stamp'
  @sap.quickinfo : 'UTC Time Stamp in Long Form (YYYYMMDDhhmmssmmmuuun)'
  LastChangeDateTime : Timestamp;

  /**
   * System in which applications run integrated on a shared data basis.
   * 
   * The distribution of data between systems requires that each system in the network has a unique identification. The logical system is used for this purpose.In the SAP System the client corresponds to a logical system. You can assign a logical system to a client in the client maintenance (choose Goto -> Detail).The logical system is relevant in the following SAP areas:ALE general: two or more logical systems communicate with one another.ALE - ALE business processes (for example, cost center accounting): definition of a system where a specific application runs. Changes to master data can only be made in this system, for example.Workflow objects: the logical system in which the object is located is always included in an object's key.When maintaining the logical system, note the following:The logical system must be unique company-wide. It must not be used by any other system in the ALE integrated group. In a production system, the logical system must not be changed. If the logical system of a document reference is not set to initial and does not match your own, the system assumes the document is located in a different system.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Logical System'
  LogicalSystem : String(10);

  /**
   * An organizational unit responsible for the sale of certain products or services. The responsibility of a sales organization may include legal liability for products and customer claims.
   * 
   * You can assign any number of distribution channels and divisions to a sales organization. A particular combination of sales organization, distribution channel, and division is known as a sales area.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales Organization'
  SalesOrganization : String(4);

  /**
   * The way in which products or services reach the customer. Typical examples of distribution channels are wholesale, retail, or direct sales.
   * 
   * You can maintain information about customers and materials by sales organization and distribution channel. Within a sales organization you can deliver goods to a given customer through more than one distribution channel.You can assign a distribution channel to one or more sales organizations. If, for example, you have numerous sales organizations, each sales organization may use the &quot;Wholesale&quot; distribution channel.For each combination of sales organization and distribution channel, you can further assign one or more of the divisions that are defined for the sales organization. You can, for example, assign &quot;Food&quot; and &quot;Non-food&quot; divisions to the &quot;Wholesale&quot; distribution channel. A particular combination of sales organization, distribution channel, and division is known as a sales area.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Distribution Channel'
  DistributionChannel : String(2);

  /**
   * A way of grouping materials, products, or services. The system uses divisions to determine the sales areas and the business areas for a material, product, or service.
   * 
   * A product or service is always assigned to just one division. From the point of view of sales and distribution, the use of divisions lets you organize your sales structure around groups of similar products or product lines. This allows the people in a division who process orders and service customers to specialize within a manageable area of expertise.If a sales organization sells food and non-food products through both retail and wholesaledistribution channels each distribution channel could then be further split into food and non-food divisions.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Division'
  Division : String(2);

  /**
   * The date on which the billing is processed and booked for accounting purposes.
   * 
   * You can use the billing date as one of the selection criteria when you process billing documents collectively.If invoice dates are defined for the customer, the system proposes the billing date from the invoice date calendar. If no invoice dates are agreed, then the actual goods issue date is formed on the basis of delivery related billing. In order related billing, the billing date of the order forms the basis of the billing date.If you are billing services, the system proposes the date of services rendered. You can change the date manually in the sales document.If you are using a billing plan to bill a project, the system can propose billing dates for the billing plan on the basis of planned or actual dates in the corresponding milestone.In a billing plan for a maintenance or rental contract, you can specify rules by which the system determines billing dates on the basis of other dates in the contract.
   */
  @sap.display.format : 'Date'
  @sap.label : 'Billing Date'
  BillingDocumentDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Canceled'
  @sap.quickinfo : 'Billing document is canceled'
  BillingDocumentIsCancelled : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Canceled Bill. Doc.'
  @sap.quickinfo : 'Number of canceled billing document'
  CancelledBillingDocument : String(10);

  /**
   * Internal number for export data.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Foreign Trade DataNr'
  @sap.quickinfo : 'Number of foreign trade data in MM and SD documents'
  ForeignTrade : String(10);

  /**
   * Indicates whether the delivery will be exported.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Export'
  @sap.quickinfo : 'Export indicator'
  IsExportDelivery : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Combination Criteria'
  @sap.quickinfo : 'Combination criteria in the billing document'
  BillingDocCombinationCriteria : String(40);

  /**
   * Indicates if the invoices for manual post processing should be printed out.
   * 
   * The system proposes the value from the customer master record. You can change the indicator manually in the sales document.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Man. Invoice Maint.'
  @sap.quickinfo : 'Manual Invoice Maintenance'
  ManualInvoiceMaintIsRelevant : Boolean;

  /**
   * Flag that defines a document as relevant for INTRASTAT declaration
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Intrastat Relevance'
  @sap.quickinfo : 'Relevant for Intrastat Reporting'
  IsIntrastatReportingRelevant : Boolean;

  /**
   * Flag used to exclude a document from the INTRASTAT declaration
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Intrastat Exclusion'
  @sap.quickinfo : 'Exclude from Intrastat Reporting'
  IsIntrastatReportingExcluded : Boolean;

  /**
   * Net value of the document item.
   */
  @sap.unit : 'TransactionCurrency'
  @sap.label : 'Net Value'
  @sap.quickinfo : 'Net Value in Document Currency'
  TotalNetAmount : Decimal(16, 3);

  /**
   * The currency that applies to the document (for example, to a sales order or an invoice).
   * 
   * The system proposes the document currency from the customer master record of the sold-to party. You can change the currency manually in the document. If you change the currency, the system recalculates prices for the entire document.
   */
  @sap.label : 'Document Currency'
  @sap.quickinfo : 'SD Document Currency'
  @sap.semantics : 'currency-code'
  TransactionCurrency : String(5);
  @sap.label : 'Statistics Currency'
  @sap.semantics : 'currency-code'
  StatisticsCurrency : String(5);

  /**
   * The total sales taxes, expressed in the document currency.
   */
  @sap.unit : 'TransactionCurrency'
  @sap.label : 'Tax Amount'
  @sap.quickinfo : 'Tax Amount in Document Currency'
  TaxAmount : Decimal(14, 3);
  @sap.unit : 'TransactionCurrency'
  TotalGrossAmount : Decimal(17, 3);

  /**
   * A grouping of customers who share the same pricing requirements.
   * 
   * You can define price groups according to the needs of your organization and create pricing records for each group. You can, for example, define a group of customers to whom you want to give the same kind of discount. You can assign a price group to an individual customer either in the customer master record or in the sales document.The system can propose the price group from the customer master record. You can change the proposed value manually in the sales document at both header and item level.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Customer Price Group'
  CustomerPriceGroup : String(2);

  /**
   * Identifies a price list or other condition type (for example, a surcharge or discount).
   * 
   * You can define price list types according to the needs of your own organization. Price list types can be grouped according to:the kind of price list (for example, wholesale or retail)the currency in which the price appearsthe number of the price list typeYou can use price list types to apply conditions during pricing or to generate statistics.In the customer master record, enter one of the values predefined for your system. The system proposes the value automatically during sales order processing. You can change the value manually in the sales document header.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Price List Type'
  PriceListType : String(2);

  /**
   * For tax determination, the country or region of departure is used as the plant country/region.
   * 
   * A different country or region needs to be entered for certain internal European transactions (chain transactions).
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Departure C/R'
  @sap.quickinfo : 'Tax Departure Country/Region'
  TaxDepartureCountry : String(3);

  /**
   * VAT registration number (VAT reg.no.) of the customer, vendor or your company code.
   * 
   * The VAT registration number is used within the EU for tax-exempt deliveries for the &quot;EC sales list&quot;. The check rules are defined for each EU country and cannot be changed.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'VAT Registration No.'
  @sap.quickinfo : 'VAT Registration Number'
  VATRegistration : String(20);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Origin Sales Tax No.'
  @sap.quickinfo : 'Origin of Sales Tax ID Number'
  VATRegistrationOrigin : String(1);

  /**
   * Specifies the key for the country of the VAT registration number.
   * 
   * This key is used to check country-specific entries such as the length of the zip code or bank account number.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Ctry/Rgn Sls Tax No.'
  @sap.quickinfo : 'Country/Region of Sales Tax ID Number'
  VATRegistrationCountry : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'HierarchyTypePricing'
  @sap.quickinfo : 'Hierarchy type for pricing'
  HierarchyTypePricing : String(1);

  /**
   * Indicates whether, during pricing, the system takes into account taxes that relate to the customer (for example, state sales taxes).
   * 
   * The system copies the tax classification from the tax information stored in the customer master record of the ship-to party. During pricing, the system uses the tax classification together with the country key (identifies where the customer is located) to calculate relevant taxes.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Class.1 Customer'
  @sap.quickinfo : 'Tax Classification 1 for Customer'
  CustomerTaxClassification1 : String(1);

  /**
   * Indicates whether, during pricing, the system takes into account taxes that relate to the customer (for example, state sales taxes).
   * 
   * The system copies the tax classification from the tax information stored in the customer master record of the ship-to party. During pricing, the system uses the tax classification together with the country key (identifies where the customer is located) to calculate relevant taxes.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Class.2 Customer'
  @sap.quickinfo : 'Tax Classification 2 for Customer'
  CustomerTaxClassification2 : String(1);

  /**
   * Indicates whether, during pricing, the system takes into account taxes that relate to the customer (for example, state sales taxes).
   * 
   * The system copies the tax classification from the tax information stored in the customer master record of the ship-to party. During pricing, the system uses the tax classification together with the country key (identifies where the customer is located) to calculate relevant taxes.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Class.3 Customer'
  @sap.quickinfo : 'Tax Classification 3 for Customer'
  CustomerTaxClassification3 : String(1);

  /**
   * Indicates whether, during pricing, the system takes into account taxes that relate to the customer (for example, state sales taxes).
   * 
   * The system copies the tax classification from the tax information stored in the customer master record of the ship-to party. During pricing, the system uses the tax classification together with the country key (identifies where the customer is located) to calculate relevant taxes.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Class.4 Customer'
  @sap.quickinfo : 'Tax Classification 4 for Customer'
  CustomerTaxClassification4 : String(1);

  /**
   * Indicates whether, during pricing, the system takes into account taxes that relate to the customer (for example, state sales taxes).
   * 
   * The system copies the tax classification from the tax information stored in the customer master record of the ship-to party. During pricing, the system uses the tax classification together with the country key (identifies where the customer is located) to calculate relevant taxes.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Class.5 Customer'
  @sap.quickinfo : 'Tax Classification 5 for Customer'
  CustomerTaxClassification5 : String(1);

  /**
   * Indicates whether, during pricing, the system takes into account taxes that relate to the customer (for example, state sales taxes).
   * 
   * The system copies the tax classification from the tax information stored in the customer master record of the ship-to party. During pricing, the system uses the tax classification together with the country key (identifies where the customer is located) to calculate relevant taxes.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Class.6 Customer'
  @sap.quickinfo : 'Tax Classification 6 for Customer'
  CustomerTaxClassification6 : String(1);

  /**
   * Indicates whether, during pricing, the system takes into account taxes that relate to the customer (for example, state sales taxes).
   * 
   * The system copies the tax classification from the tax information stored in the customer master record of the ship-to party. During pricing, the system uses the tax classification together with the country key (identifies where the customer is located) to calculate relevant taxes.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Class.7 Customer'
  @sap.quickinfo : 'Tax Classification 7 for Customer'
  CustomerTaxClassification7 : String(1);

  /**
   * Indicates whether, during pricing, the system takes into account taxes that relate to the customer (for example, state sales taxes).
   * 
   * The system copies the tax classification from the tax information stored in the customer master record of the ship-to party. During pricing, the system uses the tax classification together with the country key (identifies where the customer is located) to calculate relevant taxes.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Class.8 Customer'
  @sap.quickinfo : 'Tax Classification 8 for Customer'
  CustomerTaxClassification8 : String(1);

  /**
   * Indicates whether, during pricing, the system takes into account taxes that relate to the customer (for example, state sales taxes).
   * 
   * The system copies the tax classification from the tax information stored in the customer master record of the ship-to party. During pricing, the system uses the tax classification together with the country key (identifies where the customer is located) to calculate relevant taxes.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Class.9 Customer'
  @sap.quickinfo : 'Tax Classification 9 for Customer'
  CustomerTaxClassification9 : String(1);

  /**
   * If you select this field, the system includes this transaction in the EC sales list under the triangular deal section.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'EU Triangular Deal'
  @sap.quickinfo : 'Indicator: Triangular Deal Within the EU'
  IsEUTriangularDeal : Boolean;

  /**
   * Determines which condition types can be used in a document and in which sequence they appear.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Pricing Procedure'
  @sap.quickinfo : 'Pricing Procedure in Pricing'
  SDPricingProcedure : String(6);

  /**
   * General shipping strategy for the delivery of goods from the vendor to the customer.
   * 
   * You can define shipping conditions in your system which correspond to the requirements of your company. You can specify a shipping condition in the customer master and in the vendor master.Shipping point determination (outbound delivery):The loading group, the plant and the shipping condition determine the shipping point that will be proposed by the system.Route determination (outbound delivery):Apart from the country and the geographical region of the shipping point, the ship-to party and the transportation group, the shipping condition determines the route that the system proposes in the order for the delivery of the goods. In the delivery, the route proposal also takes the weight group into account.A particular customer always requires immediate delivery. You enter the appropriate shipping condition into the customer master record. This means that when you process orders for this customer, the system automatically proposes the express mail room as a shipping point and the quickest way to the airport as a route.If a shipping condition has been assigned to a sales document type in Customizing, this condition will be proposed by the system in the corresponding sales document. If there is no assignment, the system copies the relevant data from the corresponding customer master record of the sold-to party. You cannot change this value during delivery processing. The shipping condition will not be copied from the delivery into the shipment. The shipping condition is one of several criteria for selecting deliveries when you create a shipment. You can enter a shipping condition manually in the shipment where it only serves as a characteristic for grouping shipments.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Shipping Conditions'
  ShippingCondition : String(2);

  /**
   * An incoterms version is an edition containing a list of international terms for transportation that is defined by the International Chamber of Commerce (ICC).
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Incoterms Version'
  IncotermsVersion : String(4);

  /**
   * Commonly used trading terms that comply with the standards established by the International Chamber of Commerce (ICC).
   * 
   * Incoterms specify internationally recognized procedures that the shipper and the receiving party must follow for the shipping transaction to be completed successfully.If goods are shipped through a port of departure, the appropriate Incoterm might be: FOB (&quot;Free On Board&quot;). You can provide further details (for example, the name of the port) in the secondary Incoterm field: FOB Boston, for example.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Incoterms'
  @sap.quickinfo : 'Incoterms (Part 1)'
  IncotermsClassification : String(3);

  /**
   * Additional information for the primary Incoterm.
   * 
   * If the primary Incoterm is, for example, FOB (&quot;Free on Board&quot;), then the second field provides details of the port from which the delivery leaves (for example, &quot;FOB Boston&quot;).
   */
  @sap.label : 'Incoterms (Part 2)'
  IncotermsTransferLocation : String(28);

  /**
   * Provides additional information for the primary Incoterm. For Incoterms 2010, this field represents:
   * 
   * 1. For sea and inland waterway transport - Port of Shipment or Port of Destination2. For any mode of transport - Place of Delivery 2010 or Place of DestinationFor non-C clauses, both costs and risk are transferred from the seller to the buyer at location 1.For C clauses, the costs are transferred at location 1 and the risk is transferred at location 2.Incoterms are divided as follows:Group 1: Rules for any mode or modes of transport (including by vessel)Incoterm Incoterm Description Location 1 EXW Ex Works Place of DeliveryFCA Free Carrier Place of DeliveryCPT Carriage Paid To Place of DestinationCIP Carriage & Insurance Paid To Place of DestinationDAF Delivered at Frontier Place of DeliveryDDP Delivered Duty Paid Place of DestinationDDU Delivered Duty Unpaid Place of DestinationGroup 2: Rules for sea and inland waterwaysIncoterm Incoterm Description Location 1 FAS Free Alongside Ship Port of ShipmentFOB Free On Board Port of ShipmentCFR Cost & Freight Port of DestinationCIF Cost Insurance & Freight Port of DestinationDEQ Delivered Eq Quay (Duty Paid) Port of DestinationDES Delivered Ex Ship Port of DestinationIf the primary incoterm is specified as FOB “Free on Board”, the second field provides details of the port from which the delivery leaves, such as FOB Boston.
   */
  @sap.label : 'Incoterms Location 1'
  IncotermsLocation1 : String(70);

  /**
   * Provides additional information for the Incoterms. This field is only available for C-Clauses (if customized appropriately). Note the following for the incoterms versions below:
   * 
   * No Version:This field is disabledIncoterm Version 2000This field is disabled as part of standard delivery unless a customer decides to enable it by the way of Customizing for Sales and Distribution under Master Data -> Business Partners -> Customers -> Billing Document -> Incoterms -> Map Incoterms to Versions.Incoterm Version 2010For this version, the field represents:Sea and inland waterway transport - Port of ShipmentAny mode of transport - Place of Delivery2010 Incoterms are divided as follows:Group 1: Rules for any mode or modes of transport (including by vessel)Incoterm Incoterm Description Location 2CPT Carriage Paid To Place of DeliveryCIP Carriage & Insurance Paid To Place of DeliveryGroup 2: Rules for sea and inland waterwaysIncoterm Incoterm Description Location 2CFR Cost & Freight Port of ShipmentCIF Cost Insurance & Freight Port of Shipment
   */
  @sap.label : 'Incoterms Location 2'
  IncotermsLocation2 : String(70);

  /**
   * The party who is responsible for actually paying the bill.
   * 
   * The payer may differ from the bill-to party who receives the bill.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Payer'
  PayerParty : String(10);

  /**
   * Key that uniquely identifies a contract account per client.
   * 
   * The postings in Contract Accounts Receivable and Payable are always assigned to a contract account and a business partner.In the contract account master record, specifically for each business partner, you can define procedures that are to be used for further processing of line items. These include for example, payment methods, dunning procedure, tolerances.NoteFor utility and insurance companies, a contract is assigned to exactly one contract account. However several accounts - depending on contract account type can be assigned to one contract account.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Contract Account'
  @sap.quickinfo : 'Contract Account Number'
  ContractAccount : String(12);

  /**
   * Key for defining payment terms composed of cash discount percentages and payment periods.
   * 
   * It is used in sales orders, purchase orders, and invoices. Terms of payment provide information for:Cash managementDunning proceduresPayment transactionsData can be entered in the field for the terms of payment key in various ways as you enter a business transaction:In most business transactions, the system defaults the key specified in the master record of the customer/vendor in question.In some transactions (for example, credit memos), however, the system does not default the key from the master record. Despite this, you can use the key from the customer/vendor master record by entering &quot;*&quot; in the field.Regardless of whether or not a key is defaulted from the master record, you can manually enter a key during document entry at:item level in sales ordersheader level in purchase orders and invoicesMaster records have separate areas for Financial Accounting, Sales, and Purchasing. You can specify different terms of payment keys in each of these areas. When you then enter a business transaction, the application in question will use the key specified in its area of the master record.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Terms of Payment'
  @sap.quickinfo : 'Terms of Payment Key'
  CustomerPaymentTerms : String(4);

  /**
   * Payment method with which this item is to be paid.
   * 
   * If you enter a payment method, then only this payment method can be used in automatic payment transactions. Unless you enter a payment method, one of the payment methods that was allowed in the master record is selected in the payment program according to specified rules.For document entry or document changes, you only enter a payment method if you want to switch off the automatic payment method selection of the payment program.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Payment Method'
  PaymentMethod : String(1);

  /**
   * The payment reference contains a key for customer line items that is passed on to the customer in the invoice. The customer should refer to the payment reference when making the payment.
   * 
   * For supplier line items, the key that the supplier passes on in the invoice is entered in the payment reference. In automatic payment transactions, the payment reference can be passed on again to the payee.When an outgoing payment is made, the payment reference you specify is passed on to the relevant financial institute and from there to the payee.When you are processing your account statement, you can use the payment reference to determine which items you have paid and then clear them.Payment reference numbers are often used in Finland, Norway, and Sweden. These countries also have rules for the structure of the payment reference. Check digit procedures are used to check that these rules are followed.DME Denmark:The FIK OCR line is entered using the format +nn<zzzzzzzzzzzzzzz+yyyyyyyy<, where nn is the form code and zzzzzzzzzzzzzzz is either a 15- or a 16-digit payment reference. The last digit in the payment reference is subject to modulo10-check. yyyyyyyy is the creditor number. The following example is a valid format: +71<123450000012345+12345678<.DME Finland:The number 4477 has the check digit 8 and should be defined as the character string 44778.DME Norway:The number 12345678 has the check digit 2 when using the Modulo-10 method, and check digit 5 when using the Modulo-11 method. Therefore, 123456782 or 123456785 are permitted as payment references.DME Sweden:The number 1234567890 has the check digit 3 and should be defined as the character string 12345678903. The Modulo procedure used is a form of Modulo-10 with the key 1212121.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Payment Reference'
  PaymentReference : String(30);

  /**
   * The date on which the terms of payment related to the sales document become effective.
   * 
   * If you enter a date in this field, you cannot enter a value in the additional value days field.
   */
  @sap.display.format : 'Date'
  @sap.label : 'Fixed Value Date'
  FixedValueDate : Date;

  /**
   * The number of days between the billing date and the date on which the terms of payment for the sales document become effective.
   * 
   * If you enter a value in this field, you cannot enter a date in the fixed value date field.
   */
  @sap.display.format : 'NonNegative'
  @sap.label : 'Addit. Value Days'
  @sap.quickinfo : 'Additional Value Days'
  AdditionalValueDays : String(2);

  /**
   * Identifies the mandate uniquely, together with the creditor identification number.
   * 
   * The mandate reference can be specified externally or be determined by internal number assignment. The system determines 12-digit numerical mandate references for the internal number assignment.Whether internal or external number assignment (or both) is possible depends on the application concerned.Once you have created the mandate, you can no longer change its mandate reference.At event 0570, you can implement different logic using your own installation-specific function module. Register the function module in Customizing for Contract Accounts Receivable and Payable under Business Transactions -> Incoming/Outgoing Payment Creation -> Management of SEPA Mandates -> General Settings in the Mandate Reference field.Notes on Assigning Contract Accounts and Contracts to MandatesYou can enter a mandate reference in various FI-CA objects (such as, the document item, the contract account, or the contract). The effect of entering a reference is that the system uses the entered mandate for this object during payment.Notes on Using Alternative PayersIf you want to enter an alternative payer P1 for business partner B1 with contract account C1, you have to enter the mandate for this alternative payer P1. If the mandate is to be used now exclusively for paying postings on B1, then enter B1 in the field Payment for Alternative Debtor/ID on the lower part of the screen. If you want the mandate to be used only for a certain contract account of B1 (for instance, for C1), then enter the ID of this contract account in the Contract Account field on the upper part of the screen.ExampleYou enter mandate M1 in contract account C1. When items of contract C1 are paid, the system uses mandate M1.Using a mandate for one object does not exclude using it for another object. That means, for example, that you could also enter mandate M1 in contract C2 as the mandate to be used. In that case, no contract account is entered in the mandate itself, so that it can be referenced from multiple objects.Example - Assignment of a mandate to multiple contract accountsContract account Mandate (in Contract Acct) MeaningC1 M1 Mandate M1 is valid for C1.C2 M1 Mandate M1 is also valid for C2.C3 M2 Mandate M2 is valid for C3.C4 M2 Mandate M2 is also valid for C4.Another alternative is to enter the contract account in the mandate itself. The result of making this assignment, however, is that the mandate can only be used (exclusively) for the payment of items of this one contract account.Example - Assignment of one contract account per mandateMandate Contract Account (in Mandate) MeaningM1 C1 Mandate M1 is only valid for items of contract account C1.M2 C2 Mandate M2 is only valid for items of contract account C2.If you want a mandate to be used by several FI-CA objects (such as, document, contract account, or contract), enter the mandate only in the given objects.The examples above apply in a similar manner to the assignment of contracts.Even if you do not enter payment data at the contract level in contracts of the various industry components that use Contract Accounts Receivable and Payable, it can be useful to make an assignment between the contract and the mandate. This makes it possible to have the system pay postings assigned to a contract using a specific mandate.If you do not make any assignments between FI-CA objects (such as, document, contract account, or contract) and a mandate, the system determines the mandate from the bank details entered in the payment data of the payer. In doing so, the system compares the IBAN in the mandate with the IBAN of the bank details.If there are several active mandates for the same bank details of the payer, but there are no additional assignments between the mandate and the FI-CA object, you can use event 0653 to specify which of the mandates is used for making the payment.If you do not make any specification, the system uses the first mandate that qualifies for the payment.Register the function module for accounts receivable accounting in Customizing for Accounts Receivable Accounting under Business Transactions -> Incoming Payments -> Management of SEPA Mandates -> General Settings in the Mandate Reference field.You can enter the mandate M1 for customer C1 for accounts receivable accounting. When the items of customer C1 are paid, the system uses mandate M1.Example – Assignment of a Customer per MandateMandate Contract Account (in Mandate) Meaning M1 CA1 Mandate M1 applies only for items from contract account CA1 M2 CA2 Mandate M2 applies only for items from contract account CA2
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Mandate Reference'
  @sap.quickinfo : 'Unique Reference to Mandate for each Payee'
  SEPAMandate : String(35);

  /**
   * The company code is an organizational unit within financial accounting.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Company Code'
  CompanyCode : String(4);

  /**
   * Period, 12 months as a rule, for which the company is to create its inventory and balance sheet. The fiscal year can be the same as the calendar year, but does not have to be.
   */
  @sap.display.format : 'NonNegative'
  @sap.label : 'Fiscal Year'
  FiscalYear : String(4);

  /**
   * The document number is the key the system uses to access the accounting document.
   * 
   * The document number is unique per company code and fiscal year. When entering an accounting document, you can specify the number manually or it can be determined by the system from a pre-defined area (number range).The relevant area of the document numbers (number range) is determined in each company code per document type.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Document Number'
  @sap.quickinfo : 'Accounting Document Number'
  AccountingDocument : String(10);

  /**
   * The account assignment group to which the system automatically posts the sales document.
   * 
   * The system uses the account assignment group as one of the criteria during the automatic determination of revenue accounts.The system automatically proposes the account assignment group from the customer master record of the payer. You can change the default value in the sales document or the billing document.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Acct Assmt Grp Cust.'
  @sap.quickinfo : 'Account Assignment Group for this Customer'
  CustomerAccountAssignmentGroup : String(2);

  /**
   * Indicates whether the currency exchange rate between document currency and local currency has been set as fixed. A fixed exchange rate is constant and cannot be redetermined or changed within the billing document.
   * 
   * As a general rule, the system automatically sets the currency exchange rate as fixed in all billing documents created with reference to existing billing documents. This includes billing document cancellations, credit memos, and debit memos.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Set Exchange Rate'
  @sap.quickinfo : 'Exchange Rate Setting'
  AccountingExchangeRateIsSet : Boolean;

  /**
   * Exchange rate from document currency into accounting currency.
   */
  @sap.label : 'Abs.Exch.Rate Acct.'
  @sap.quickinfo : 'Absolute exchange rate for FI postings'
  AbsltAccountingExchangeRate : Decimal(9, 5);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Indirect Quotation'
  @sap.quickinfo : 'Accounting exchange rate quotation is indirect'
  AcctgExchangeRateIsIndrctQtan : Boolean;

  /**
   * Translation date for determining the exchange rate which is to be used for translation. The exchange rates are stored in the system.
   * 
   * You do not need to enter a date unless the date in question is not the same as the document entry date.
   */
  @sap.display.format : 'Date'
  @sap.label : 'Translation Date'
  ExchangeRateDate : Date;

  /**
   * Key representing a type of exchange rate in the system.
   * 
   * You enter the exchange rate type to store different exchange rates.You can use the exchange rate type to define a buying rate, selling rate, or average rate for translating foreign currency amounts. You can use the average rate for the currency translation, and the bank buying and selling rates for valuation of foreign currency amounts.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Exchange Rate Type'
  ExchangeRateType : String(4);

  /**
   * The reference document number contains the document number with the business partner
   * 
   * The reference document number serves as a search criterion when displaying or changing documents. In correspondence, the refererence document number is sometimes printed instead of the document number.The reference number is set in the document flow according to control and taken into the financial journal entry.You can set the customer order number, the order number, the delivery number, the billing number or the external delivery number as reference number.The field is a seperation criterion in the billing document.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Reference'
  @sap.quickinfo : 'Reference Document Number'
  DocumentReferenceID : String(16);

  /**
   * The allocation is additional information in the customer line item of the journal entry.
   * 
   * The line items of an account are displayed in sort sequence according to the content of the field.The allocation number is set in the billing document in accordance with control in document flow and transferred to the financial journal entry.It is possible to set the customer purchase order number, the customer order number, the delivery number or the external delivery number as allocation numbers.The field is a separating criterion in the billing document.
   */
  @sap.label : 'Assignment'
  @sap.quickinfo : 'Assignment Number'
  AssignmentReference : String(18);

  /**
   * The dunning area represents an organizational entity that is responsible for dunning. The dunning areas represent a sub-structure of the company codes.
   * 
   * If different responsibilities or different dunning procedures exist within a company code, you can set up corresponding dunning areas.All dunning notices are made separately according to dunning areas, and if necessary with different dunning procedures.The dunning area must be noted in the line items. As long as documents are copied from preliminary work areas (billing documents), the dunning area can be derived from details such as division or sales area, if necessary.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Dunning Area'
  DunningArea : String(2);

  /**
   * Key which reflects the reason for a dunning block indicator.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Dunning Block'
  DunningBlockingReason : String(1);

  /**
   * Determines that the item can only be dunned with restrictions or is to be displayed with an extra text line on the dunning notice. The keys are freely-definable.
   * 
   * You define the contents of the text line in Customizing for the dunning key.If you enter a key in an item, then it can only reach the maximum dunning level defined for this key. Therefore it is possible that an item can contain one dunning notice at the most, although several dunning levels are defined in the dunning procedure.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Dunning Key'
  DunningKey : String(1);

  /**
   * Internal number of a financial document that is mapped to a trade finance transaction. The number is assigned by the system.
   * 
   * You want to guarantee the payment of your sales order by using a transaction in Trade Finance (for example, a letter of credit transaction). A trade finance transaction is mapped to a financial document number in SD. To guarantee the payment, you therefore assign a financial document number by selecting its corresponding trade finance transaction.You can navigate to the corresponding trade finance transaction directly from the assigned financial document number. As a prerequisite, you need to have the authorization to display the trade finance transaction.Before you can select a trade finance transaction when assigning a financial document to a sales order, you need to activate the integration with Trade Finance first.For information about how to activate the integration with Trade Finance, see Integration of Trade Finance with S/4HANA Finance on SAP Help Portal under SAP S/4HANA -> Product Assistance -> Enterprise Business Applications -> Finance -> Treasury and Financial Risk Management -> SAP Treasury and Risk Management (FIN-FSCM-TRM) -> Transaction Manager -> Overview Financial Instruments -> Trade Finance.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Financial Doc. No.'
  @sap.quickinfo : 'Financial doc. processing: Internal financial doc. number'
  InternalFinancialDocument : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Relevant for Accrual'
  @sap.quickinfo : 'Is relevant for accrual'
  IsRelevantForAccrual : Boolean;

  /**
   * The customer who orders the goods or services. The sold-to party is contractually responsible for sales orders.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sold-to Party'
  SoldToParty : String(10);

  /**
   * Company ID standard for the whole group.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Trading Partner No.'
  @sap.quickinfo : 'Company ID of Trading Partner'
  PartnerCompany : String(6);

  /**
   * Number that the customer uses to uniquely identify a purchasing document (e.g. an inquiry or a purchase order).
   * 
   * The number creates the link between the customer purchase order and the sales document that you create. You can use the number used by the customer during correspondence with the customer to find certain document information. If the number refers to a purchase order, you can also print it on the documents that you send to the customer (e.g. on the delivery note).
   */
  @sap.label : 'Customer Reference'
  PurchaseOrderByCustomer : String(35);

  /**
   * Identifies a particular group of customers (for example, wholesale or retail) for the purpose of pricing or generating statistics.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Customer Group'
  CustomerGroup : String(2);

  /**
   * Identifies the destination country/region in which the goods are delivered to the customer.
   * 
   * As a general rule, it is best to use the existing international standards for identifying vehicles from different countries/regions (for example: USA = United States, I = Italy, and so on).The system uses the country/region key identifier to:Help determine the appropriate taxes during pricingDetermine important country/region-specific standards (the length of postal codes and bank account numbers, for example)When you process billing documents collectively, you can use the destination country as one of the selection criteria.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Dest. Country/Region'
  @sap.quickinfo : 'Destination Country/Region'
  Country : String(3);

  /**
   * This key is used for classifying cities from a tax point of view. This is a finer sub-division than the county code.
   * 
   * Currently the key is used only in the USA for handling city tax.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'City Code'
  CityCode : String(4);

  /**
   * A geographical sales district or region.
   * 
   * Each customer can be assigned to a sales district. You can use sales districts to apply pricing conditions. When you want to generate sales statistics, you can use sales districts as a selection criteria.The system can propose a value from the customer master record of the sold-to party. You can change the value manually in the document at the header or item level.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales District'
  SalesDistrict : String(6);

  /**
   * In some countries, the region forms part of the address. The meaning depends on the country.
   * 
   * The automatic address formatting function prints the region in addresses in the USA, Canada, Italy, Brazil or Australia, and the county in Great Britain.For more information, see the examples in the documentation on the Address Layout Key.Meaning of the regional code in ...Australia -> ProvinceBrazil -> StateCanada -> ProvinceGermany -> StateGreat Britain -> CountyItaly -> ProvinceJapan -> PrefectureSwitzerland -> CantonUSA -> State
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Region'
  @sap.quickinfo : 'Region (State, Province, County)'
  Region : String(3);

  /**
   * Key used to classify cities from the point of view of taxes.
   * 
   * Currently the county code is used in the USA for handling county tax, and in Denmark to define the municipality number of the employee's first place of residence.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'County Code'
  County : String(3);

  /**
   * The credit control area is an organizational entity which grants and monitors a credit limit for customers. A credit control area can include one or more company codes.
   * 
   * You can also enter the credit control area separately for each posting, if this was marked in the appropriate company code.When entering an order, the credit control area can also be determined from the business area and the sales area segement of the payer's master record or using a user exit.It follows that company codes and credit control areas are not linked.The only thing that you define in the company code table is the default credit control area. This is used either for payments on account to credit these payments, or where you did not enter a credit control area or the system could not determine one.There is also an allocation table of permitted credit control areas per company code which is used to check entries only.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Credit Control Area'
  CreditControlArea : String(4);

  /**
   * The number that uniquely identifies a rebate agreement.
   * 
   * A rebate agreement is an agreement between a customer and a supplier. On the basis of the customer's sales volume during a specified period, the supplier grants the customer a special rebate. A general rebate agreement can consist of numerous individual agreements (condition records) that are based on different factors. For example, an individualagreement may be based on a combination of customer and material or a combination of customer and rebate group, and so on.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Agreement'
  @sap.quickinfo : 'Agreement (various conditions grouped together)'
  CustomerRebateAgreement : String(10);

  /**
   * The internal number under which the system saves conditions that apply to a sales order, for example.
   * 
   * The purchasing and sales departments may want to use the same order number for a document even though different conditions may apply in each area. The system uses the internal number to identify the different conditions.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Doc. Condition No.'
  @sap.quickinfo : 'Number of the Document Condition'
  SalesDocumentCondition : String(10);

  /**
   * The processing status of the entire sales document.
   * 
   * The system determines the status of the entire sales document by taking into account the status of all header-related information and the status of all individual items. The status message tells you whether processing of the sales document is open, in progress, or complete.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Overall Status'
  @sap.quickinfo : 'Overall Processing Status (Header/All Items)'
  OverallSDProcessStatus : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Status'
  @sap.quickinfo : 'SD Billing Status'
  OverallBillingStatus : String(1);

  /**
   * The accounting status of the billing document.
   * 
   * The status message tells you whether the billing document must be posted to accounting, and, if so, whether the posting has taken place.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Posting Status'
  @sap.quickinfo : 'Posting Status of Billing Document'
  AccountingPostingStatus : String(1);

  /**
   * The accounting status of the billing document (for example, an invoice).
   * 
   * The status message tells you whether the system has successfully posted the document to accounting or whether posting is blocked because a posting block is set for the billing type.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Posting Status'
  @sap.quickinfo : 'Status for Transfer to Accounting'
  AccountingTransferStatus : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Issue Type'
  @sap.quickinfo : 'Billing Issue Type'
  BillingIssueType : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Invoice List Status'
  @sap.quickinfo : 'Invoice list status of billing document'
  InvoiceListStatus : String(1);

  /**
   * The incompletion status of general item information in the sales document. General item information includes business, shipping, and billing data.
   * 
   * The status tells you if general item information is incomplete. Sales documents where general information is missing cannot be copied into other documents. For example, you cannot copy an incomplete quotation into a sales order.If you try to save a document with missing information, the system tells you that the document is incomplete. You can then list the fields where information is missing and complete them. Alternatively, you can save the incomplete document and enter the missing information later.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'All Items'
  @sap.quickinfo : 'Incompletion Status (All Items)'
  OvrlItmGeneralIncompletionSts : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Pricing – All Items'
  @sap.quickinfo : 'Pricing Incompletion Status (All Items)'
  OverallPricingIncompletionSts : String(1);

  /**
   * The clearing status of a billing document provides information about whether the billing document has been cleared in financial accounting or not. Financial accounting automatically updates the clearing status when a relevant incoming or outgoing payment is posted.
   * 
   * A billing document counts as fully cleared when it has been posted to financial accounting and the corresponding incoming payment has been received (for example, a customer’s payment of an F2 invoice) or the corresponding outgoing payment has been sent (for example, a refund that is granted through a G2 credit memo).The following statuses are possible:' ' (blank): Not relevantThis status is set when a billing document that has not yet been cleared is canceled. The corresponding cancellation document is also set to this status. (When, on the other hand, a cleared billing document is canceled, the status is set to C and the cancellation document’s status is set to A until it's cleared, which changes its status to C.)A: To be clearedThe billing document has not been cleared yet. Depending on the specific billing type, it must be cleared by either an incoming payment or an outgoing payment. A newly created billing document usually receives this status.B: Partially clearedThe billing document has been cleared partially. This means that an incoming payment smaller than the document total amount has been received or an outgoing payment smaller than the document total amount has been sent.C: Fully clearedThe billing document has been fully cleared, meaning that there are no open amounts.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Clearing Status'
  @sap.quickinfo : 'Clearing Status of Billing Document'
  InvoiceClearingStatus : String(1);

  /**
   * Classification that distinguishes between invoice list types that require different processing by the system.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Invoice List Type'
  BillingDocumentListType : String(4);

  /**
   * Specifies the billing date of the invoice list.
   * 
   * The system automatically proposes the next valid date defined in the customer's factory calendar. You can change the date manually in the header of the invoice list.
   */
  @sap.display.format : 'Date'
  @sap.label : 'Inv. List Bill. Date'
  @sap.quickinfo : 'Billing date for the invoice list'
  BillingDocumentListDate : Date;

  /**
   * Please add  an ON condition
   */
  to_Item : Association to many API_BILLING_DOCUMENT_SRV.A_BillingDocumentItem {  };

  /**
   * Please add  an ON condition
   */
  to_Partner : Association to many API_BILLING_DOCUMENT_SRV.A_BillingDocumentPartner {  };

  /**
   * Please add  an ON condition
   */
  to_PricingElement : Association to many API_BILLING_DOCUMENT_SRV.A_BillingDocumentPrcgElmnt {  };

  /**
   * Please add  an ON condition
   */
  to_Text : Association to many API_BILLING_DOCUMENT_SRV.A_BillingDocumentText {  };
} actions {
  action Cancel() returns many API_BILLING_DOCUMENT_SRV.CancelResult;
  function GetPDF() returns API_BILLING_DOCUMENT_SRV.GetPDFResult;
};

@cds.persistence.skip : true
@sap.label : 'Billing Document Item'
@sap.content.version : '1'
entity API_BILLING_DOCUMENT_SRV.A_BillingDocumentItem {

  /**
   * The number that uniquely identifies the billing document (the invoice, for example).
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Billing Document'
  key BillingDocument : String(10);

  /**
   * The number that uniquely identifies the item in the billing document.
   */
  @sap.display.format : 'NonNegative'
  @sap.label : 'Item'
  @sap.quickinfo : 'Billing Item'
  key BillingDocumentItem : String(6);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales Doc. Item Cat.'
  @sap.quickinfo : 'Sales Document Item Category'
  SalesDocumentItemCategory : String(4);

  /**
   * A way of classifying items that require different kinds of processing by the system.
   * 
   * The system processes items that refer to a specific material differently than items that do not refer to a material. For example, text items do not require processing for pricing, taxes, and weight calculations.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Item Type'
  SalesDocumentItemType : String(1);

  /**
   * This item is a returns item if the field is selected
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Returns'
  @sap.quickinfo : 'Returns item'
  ReturnItemProcessingType : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Created By'
  @sap.quickinfo : 'Name of Person Responsible for Creating the Object'
  CreatedByUser : String(12);
  @sap.display.format : 'Date'
  @sap.label : 'Created On'
  @sap.quickinfo : 'Date on Which Record Was Created'
  CreationDate : Date;

  /**
   * The time of day at which the document was posted and stored in the system.
   */
  @sap.label : 'Time'
  @sap.quickinfo : 'Entry time'
  CreationTime : Time;

  /**
   * System in which applications run integrated on a shared data basis.
   * 
   * The distribution of data between systems requires that each system in the network has a unique identification. The logical system is used for this purpose.In the SAP System the client corresponds to a logical system. You can assign a logical system to a client in the client maintenance (choose Goto -> Detail).The logical system is relevant in the following SAP areas:ALE general: two or more logical systems communicate with one another.ALE - ALE business processes (for example, cost center accounting): definition of a system where a specific application runs. Changes to master data can only be made in this system, for example.Workflow objects: the logical system in which the object is located is always included in an object's key.When maintaining the logical system, note the following:The logical system must be unique company-wide. It must not be used by any other system in the ALE integrated group. In a production system, the logical system must not be changed. If the logical system of a document reference is not set to initial and does not match your own, the system assumes the document is located in a different system.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Logical System'
  ReferenceLogicalSystem : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Division of Order'
  @sap.quickinfo : 'Division in Sales Order Header'
  OrganizationDivision : String(2);

  /**
   * A way of grouping materials, products, or services. The system uses divisions to determine the sales areas and the business areas for a material, product, or service.
   * 
   * A product or service is always assigned to just one division. From the point of view of sales and distribution, the use of divisions lets you organize your sales structure around groups of similar products or product lines. This allows the people in a division who process orders and service customers to specialize within a manageable area of expertise.If a sales organization sells food and non-food products through both retail and wholesaledistribution channels each distribution channel could then be further split into food and non-food divisions.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Division'
  Division : String(2);

  /**
   * A physical location (for example, a branch office) that has responsibility for the sale of certain products or services within a given geographical area.
   * 
   * When you create sales statistics, you can use a sales office as one of the selection criteria. When you print out order confirmations, you can include the address of the sales office.You can assign each customer to a sales office in the customer master record.Within a sales office you can establish sales groups (for example, departments) with specific sales responsibilities. Each person who works in the sales office can be assigned to a sales group in his or her user master record. Each customer can also be assigned to a particular sales group in the customer master record.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales Office'
  SalesOffice : String(4);

  /**
   * Alphanumeric key uniquely identifying the material.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material'
  @sap.quickinfo : 'Material Number'
  Material : String(40);

  /**
   * Material originally requested by the customer.
   * 
   * If, for some reason, you have to send a substitute material instead of the material originally requested, you can see which product the customer originally ordered.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material Entered'
  OriginallyRequestedMaterial : String(40);

  /**
   * Glossary definition
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'EAN/UPC'
  @sap.quickinfo : 'International Article Number (EAN/UPC)'
  InternationalArticleNumber : String(18);

  /**
   * Material master record that the system uses as a reference for pricing purposes.
   * 
   * The conditions that apply to the pricing reference material also apply to the material in whose material master record the pricing reference material is stored.A pricing reference material must always have its own material master record.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Pricing Ref. Matl'
  @sap.quickinfo : 'Pricing Reference Material'
  PricingReferenceMaterial : String(40);

  /**
   * Assigns a material that is manufactured in batches or production lots to a specific batch.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Batch'
  @sap.quickinfo : 'Batch Number'
  Batch : String(10);

  /**
   * Alphanumeric character string for grouping together materials by combining different characteristics. It is used for analyses and price determination.
   * 
   * In the standard SAP System, the product hierarchy can have up to 3 levels, each with a specific number of characters.Level Number of characters allowed1 52 53 8You define a product hierarchy with the following levels:Level Example Description1 00005 Electrical goods2 00003 Wet appliances3 00000001 Washing machineIn this case, a washing machine belongs to the product hierarchy 000050000300000001.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product Hierarchy'
  ProductHierarchyNode : String(18);

  /**
   * Key that you use to group together several materials or services with the same attributes, and to assign them to a particular material group.
   * 
   * You can use material groups to:Restrict the scope of analysesSearch specifically for material master records via search helps
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material Group'
  MaterialGroup : String(9);

  /**
   * You can use material groups when maintaining a material master record. Since these material groups are not used in the standard SAP System, you can use them as required, for example, for analyses.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material Group 1'
  AdditionalMaterialGroup1 : String(3);

  /**
   * You can use material groups when maintaining a material master record. Since these material groups are not used in the standard SAP System, you can use them as required, for example, for analyses.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material Group 2'
  AdditionalMaterialGroup2 : String(3);

  /**
   * You can use material groups when maintaining a material master record. Since these material groups are not used in the standard SAP System, you can use them as required, for example, for analyses.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material Group 3'
  AdditionalMaterialGroup3 : String(3);

  /**
   * You can use material groups when maintaining a material master record. Since these material groups are not used in the standard SAP System, you can use them as required, for example, for analyses.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material Group 4'
  AdditionalMaterialGroup4 : String(3);

  /**
   * You can use material groups when maintaining a material master record. Since these material groups are not used in the standard SAP System, you can use them as required, for example, for analyses.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material Group 5'
  AdditionalMaterialGroup5 : String(3);

  /**
   * Commission group to which the material is assigned.
   * 
   * You can assign two materials to the same commission group as long as each representative who sells these materials receives the same commission percentage for both materials. In other words, the commission percentages within a commission group are always the same for any one representative but may vary for different representatives.Material Rep. 1 Rep. 2 Rep. 3A 5 % 10 % 11 %B 5 % 10 % 11 %Materials A and B are sold by these three representatives only. You can therefore assign them to the same commission group.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Commission Group'
  MaterialCommissionGroup : String(2);

  /**
   * Key uniquely identifying a plant.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Plant'
  Plant : String(4);

  /**
   * Number of the storage location in which the material is stored. A plant may contain one or more storage locations.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Storage Location'
  StorageLocation : String(4);

  /**
   * Indicator that specifies whether the material can be a replacement part, must be a replacement part, or is not a replacement part.
   * 
   * The SD billing application uses this indicator to disclose used-parts VAT.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Replacement Part'
  @sap.quickinfo : 'Replacement part'
  ReplacementPartType : String(1);

  /**
   * Key, which specifies the grouping of material groups.
   * 
   * Material group hierarchy levels can be put together into groups. In this way the goods group with its higher-level material group hierarchy levels can be made into a clear material group hierarchy valid for a sinlge client.Prices and conditions can be stored at material group level and at the first of the two higher-level material group hierarchy levels.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material group 1'
  @sap.quickinfo : 'Material group hierarchy 1'
  MaterialGroupHierarchy1 : String(18);

  /**
   * Key that specifies the grouping of material groups.
   * 
   * Material group hierarchy levels can be put together into groups. In this way the goods group with its higher-level material group hierarchy levels can be made into a clear material group hierarchy valid for a single client.Prices and conditions can be stored at material group level and at the first of the two higher level material group hierarchy levels.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material group 2'
  @sap.quickinfo : 'Material group hierarchy 2'
  MaterialGroupHierarchy2 : String(18);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Region of Dlv. Plant'
  @sap.quickinfo : 'Region in which plant is located'
  PlantRegion : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'County of Dlv.Plant'
  @sap.quickinfo : 'County in which plant is located'
  PlantCounty : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'City of Deliv. Plant'
  @sap.quickinfo : 'City in which plant is located'
  PlantCity : String(4);

  /**
   * Number used by the component supplier to identify the production series from which the customer releases and receives materials.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'BOM Explosion Number'
  BOMExplosion : String(8);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Mat.Determ.Active'
  @sap.quickinfo : 'ID for material determination'
  MaterialDeterminationType : String(1);

  /**
   * A short description of the item.
   * 
   * Short texts are used throughout sales order processing, shipping, and billing. They also appear on printed order confirmations.The system proposes the short text from the material master record. If you have included a short text in a customer-material info record, it replaces the material master text during sales document processing. You can change the text at the item level in the sales document or during delivery processing.
   */
  @sap.label : 'Item Description'
  @sap.quickinfo : 'Short Text for Sales Order Item'
  BillingDocumentItemText : String(40);

  /**
   * The date of services rendered that determines when the system calculates taxes (for example, sales tax) for the material.
   * 
   * If you deliver products, the date of services rendered corresponds to the goods issue date and you do not have to enter a date in this field. If you provide a service, however, and you are billing hours, you can enter a date manually. You can use the date of services rendered as one of the selection criteria when you process billing documents collectively.
   */
  @sap.display.format : 'Date'
  @sap.label : 'Serv. Rendered Date'
  @sap.quickinfo : 'Date on which services are rendered'
  ServicesRenderedDate : Date;

  /**
   * The item quantity that is actually billed.
   */
  @sap.unit : 'BillingQuantityUnit'
  @sap.label : 'Billed Quantity'
  @sap.quickinfo : 'Actual Billed Quantity'
  BillingQuantity : Decimal(13, 3);

  /**
   * Unit of measure in which the material is sold.
   */
  @sap.label : 'Sales Unit'
  @sap.semantics : 'unit-of-measure'
  BillingQuantityUnit : String(3);
  @sap.unit : 'BaseUnit'
  @sap.label : 'Billing Qty in SKU'
  @sap.quickinfo : 'Billing quantity in stock keeping unit'
  BillingQuantityInBaseUnit : Decimal(13, 3);

  /**
   * Unit of measure in which stocks of the material are managed. The system converts all the quantities you enter in other units of measure (alternative units of measure) to the base unit of measure.
   * 
   * You define the base unit of measure and also alternative units of measure and their conversion factors in the material master record.Since all data is updated in the base unit of measure, your entry is particularly important for the conversion of alternative units of measure. A quantity in the alternative unit of measure can only be shown precisely if its value can be shown with the decimal places available. To ensure this, please note the following:The base unit of measure is the unit satisfying the highest necessary requirement for precision.The conversion of alternative units of measure to the base unit should result in simple decimal fractions (not, for example, 1/3 = 0.333...).Inventory ManagementIn Inventory Management, the base unit of measure is the same as the stockkeeping unit.ServicesServices have units of measure of their own, including the following:Service unitUnit of measure at the higher item level. The precise quantities of the individual services are each at the detailed service line level.BlanketUnit of measure at service line level for services to be provided once only, and for which no precise quantities can or are to be specified.
   */
  @sap.label : 'Base Unit of Measure'
  @sap.semantics : 'unit-of-measure'
  BaseUnit : String(3);

  /**
   * The quantity that the system transfers as requirements from the schedule line to material requirements planning (MRP). The quantity corresponds to the confirmed quantity and is expressed in base units.
   * 
   * The system uses this quantity during the availability check to guarantee that the confirmed quantity cannot be used for another sales order.If you change the material requirements quantity manually, the system automatically adjusts the conversion factor that converts sales units to base units.
   */
  @sap.unit : 'BaseUnit'
  @sap.label : 'Required Quantity'
  @sap.quickinfo : 'Required quantity for mat.management in stockkeeping units'
  MRPRequiredQuantityInBaseUnit : Decimal(13, 3);

  /**
   * Denominator of the conversion factor that the system uses to convert sales units to base units of measure.
   * 
   * Many material processing functions, such as the generation of production requirements, may require that sales units are converted into base units of measureYou store a certain beverage in casks, but sell it in 1-liter bottles. The conversion factor is as follows:100 bt <=> 1 caThe first number (the denominator) represents the sales units, in this case, bottles. The second number (the numerator) represents the equivalent quantity in base units of measure, in this case, casks.
   */
  @sap.label : 'Denominator'
  @sap.quickinfo : 'Denominator (divisor) for conversion of sales Qty into SKU'
  BillingToBaseQuantityDnmntr : Decimal(5, 0);

  /**
   * Numerator of the conversion factor that the system uses to convert sales units to base units of measure.
   * 
   * Many material processing functions, such as the generation of production requirements, may require that sales units are converted into base units of measureYou store a certain beverage in casks, but sell it in 1-liter bottles. The conversion factor is as follows:100 bt <=> 1 caThe first number (the denominator) represents the sales units, in this case, bottles. The second number (the numerator) represents the equivalent quantity in base units of measure, in this case, casks.
   */
  @sap.label : 'Numerator'
  @sap.quickinfo : 'Numerator (factor) for conversion of sales quantity into SKU'
  BillingToBaseQuantityNmrtr : Decimal(5, 0);

  /**
   * The total gross weight of all items in the delivery. The gross weight represents the net weight plus the weight of packaging.
   * 
   * The system calculates the gross weight of each item by multiplying the delivery quantity by the gross weight per unit that comes from the sales order. If there is no related sales order, the system uses the gross weight from the material master record.You can change the gross weight manually in the delivery document.
   */
  @sap.unit : 'ItemWeightUnit'
  @sap.label : 'Gross Weight'
  ItemGrossWeight : Decimal(15, 3);

  /**
   * The total net weight of all items in the delivery.
   * 
   * The system calculates the net weight of each item by multiplying the delivery quantity by the net weight per unit that comes from the sales order. If there is no related sales order, the system uses the net weight from the material master record.You can change the net weight manually in the delivery document.
   */
  @sap.unit : 'ItemWeightUnit'
  @sap.label : 'Net Weight'
  ItemNetWeight : Decimal(15, 3);

  /**
   * Unit referring to the gross weight or net weight of the material.
   * 
   * If you specify a weight, you must enter the corresponding unit of weight here.
   */
  @sap.label : 'Unit of Weight'
  @sap.semantics : 'unit-of-measure'
  ItemWeightUnit : String(3);

  /**
   * The total volume of all items in the delivery.
   * 
   * The system calculates the volume for each item by multiplying the delivery quantity by the volume per unit that comes from the sales order. If there is no related sales order, the system uses the volume from the material master record.You can change the volume manually in the delivery document.
   */
  @sap.unit : 'ItemVolumeUnit'
  @sap.label : 'Volume'
  ItemVolume : Decimal(15, 3);

  /**
   * Unit referring to the volume of the material.
   * 
   * If you specify a volume, you have to enter the corresponding volume unit here.
   */
  @sap.label : 'Volume Unit'
  @sap.semantics : 'unit-of-measure'
  ItemVolumeUnit : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Dest. Ctry/Reg. Ord.'
  @sap.quickinfo : 'Destination Country/Region of Sales Order'
  BillToPartyCountry : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Region Order'
  @sap.quickinfo : 'Region of Sales Order'
  BillToPartyRegion : String(3);

  /**
   * Specifies for each billing plan date how the value to be billed is determined.
   * 
   * Billing plan for a rental contract for a piece of machineryBilling dates: First of the month for 12 monthsBilling amount: 1000 USD per monthEach date requires a billing rule which determines this fixed amount as the amount to be billed.Billing plan for the installation of a turbine at a customer locationBilling dates: Date delivered 10%Date installed 30%Date turbine goes productive 70%Final invoiceBilling amount: 10,000 USD for entire projectEach date requires a billing rule which determines a percentage of the overall billing value of the project as the amount to be billed.In the second example, the billing values for each date could equally be fixed partial amounts rather than percentages. For example:Billing dates: Date delivered 1,000 USDDate installed 3,000 USDDate turbine goes productive 6,000 USDBilling amount 10,000 USD
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Billing Rule'
  @sap.quickinfo : 'Rule in billing plan/invoice plan'
  BillingPlanRule : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Bill. Plan. No.'
  @sap.quickinfo : 'Billing Plan Number / Invoicing Plan Number'
  BillingPlan : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Item'
  @sap.quickinfo : 'Item for billing plan/invoice plan/payment cards'
  BillingPlanItem : String(6);

  /**
   * The net value of the billing item including discounts, surcharges and other pricing conditions (such as freight costs), but excluding sales taxes.
   */
  @sap.unit : 'TransactionCurrency'
  @sap.label : 'Net Value'
  @sap.quickinfo : 'Net Value of Billing item in Document Currency'
  NetAmount : Decimal(16, 3);

  /**
   * The currency that applies to the document (for example, to a sales order or an invoice).
   * 
   * The system proposes the document currency from the customer master record of the sold-to party. You can change the currency manually in the document. If you change the currency, the system recalculates prices for the entire document.
   */
  @sap.label : 'Document Currency'
  @sap.quickinfo : 'SD Document Currency'
  @sap.semantics : 'currency-code'
  TransactionCurrency : String(5);

  /**
   * Net value of the billing item including all surcharges and discounts as well as price determination conditions (e.g. freight costs) but without VAT.
   */
  @sap.unit : 'TransactionCurrency'
  @sap.label : 'Gross Value'
  @sap.quickinfo : 'Gross Value of the Billing Item in Document Currency'
  GrossAmount : Decimal(16, 3);

  /**
   * The date that determines date-related pricing elements, such as conditions and foreign exchange rate.
   * 
   * You can use the pricing date as a selection criterion when you process billing documents collectively.The system proposes the current date. You can change it manually in the document. If you change the pricing date, the system recalculates pricing for the entire document. If the date is in the past, you receive a warning before you can continue.Determining the ProposalIn the order: You can customize the order type to determine a proposal, such as the current date or the requested delivery date as the pricing date.In the billing document: The billing date is proposed as the pricing date.
   */
  @sap.display.format : 'Date'
  @sap.label : 'Pricing Date'
  @sap.quickinfo : 'Date for Pricing and Exchange Rate'
  PricingDate : Date;

  /**
   * Exchange rate for price determination
   */
  @sap.label : 'Abs. Exch. Rate Prc.'
  @sap.quickinfo : 'Absolute exchange rate for price determination'
  AbsltPriceDetnExchangeRate : Decimal(9, 5);
  @sap.display.format : 'UpperCase'
  @sap.label : 'PrcExchRateIsIndirct'
  @sap.quickinfo : 'Pricing exchange rate quotation is indirect'
  PriceDetnExchRateIsIndrctQtan : Boolean;

  /**
   * Translation date for determining the exchange rate which is to be used for translation. The exchange rates are stored in the system.
   * 
   * You do not need to enter a date unless the date in question is not the same as the document entry date.
   */
  @sap.display.format : 'Date'
  @sap.label : 'Translation Date'
  PriceDetnExchangeRateDate : Date;
  @sap.unit : 'BaseUnit'
  @sap.label : 'Scale Quantity'
  @sap.quickinfo : 'Scale Quantity in base unit of measure'
  PricingScaleQuantityInBaseUnit : Decimal(13, 3);

  /**
   * The total sales taxes, expressed in the document currency.
   */
  @sap.unit : 'TransactionCurrency'
  @sap.label : 'Tax Amount'
  @sap.quickinfo : 'Tax Amount in Document Currency'
  TaxAmount : Decimal(14, 3);

  /**
   * The cost of an item in a delivery-related billing documents. The cost is determined during the posting of goods issue.
   */
  @sap.unit : 'TransactionCurrency'
  @sap.label : 'Cost'
  @sap.quickinfo : 'Cost in Document Currency'
  CostAmount : Decimal(14, 3);

  /**
   * Contains a value that is calculated during pricing from all price elements in a pricing procedure that refer to the corresponding field in the Subtotal column.
   */
  @sap.unit : 'TransactionCurrency'
  @sap.label : 'Subtotal 1'
  @sap.quickinfo : 'Subtotal 1 from Pricing Procedure for Price Element'
  Subtotal1Amount : Decimal(14, 3);

  /**
   * Contains a value that is calculated during pricing from all price elements in a pricing procedure that refer to the corresponding field in the Subtotal column.
   */
  @sap.unit : 'TransactionCurrency'
  @sap.label : 'Subtotal 2'
  @sap.quickinfo : 'Subtotal 2 from Pricing Procedure for Price Element'
  Subtotal2Amount : Decimal(14, 3);

  /**
   * Contains a value that is calculated during pricing from all price elements in a pricing procedure that refer to the corresponding field in the Subtotal column.
   */
  @sap.unit : 'TransactionCurrency'
  @sap.label : 'Subtotal 3'
  @sap.quickinfo : 'Subtotal 3 from Pricing Procedure for Price Element'
  Subtotal3Amount : Decimal(14, 3);

  /**
   * Contains a value that is calculated during pricing from all price elements in a pricing procedure that refer to the corresponding field in the Subtotal column.
   */
  @sap.unit : 'TransactionCurrency'
  @sap.label : 'Subtotal 4'
  @sap.quickinfo : 'Subtotal 4 from Pricing Procedure for Price Element'
  Subtotal4Amount : Decimal(14, 3);

  /**
   * Contains a value that is calculated during pricing from all price elements in a pricing procedure that refer to the corresponding field in the Subtotal column.
   */
  @sap.unit : 'TransactionCurrency'
  @sap.label : 'Subtotal 5'
  @sap.quickinfo : 'Subtotal 5 from Pricing Procedure for Price Element'
  Subtotal5Amount : Decimal(14, 3);

  /**
   * Contains a value that is calculated during pricing from all price elements in a pricing procedure that refer to the corresponding field in the Subtotal column.
   */
  @sap.unit : 'TransactionCurrency'
  @sap.label : 'Subtotal 6'
  @sap.quickinfo : 'Subtotal 6 from Pricing Procedure for Price Element'
  Subtotal6Amount : Decimal(14, 3);

  /**
   * Indicates whether the system takes the value of an item into account when it determines the total value of a document.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Statistical Value'
  @sap.quickinfo : 'Statistical Values'
  StatisticalValueControl : String(1);

  /**
   * Indicator that specifies whether this material qualifies for a cash discount.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Cash Discount'
  @sap.quickinfo : 'Cash Discount Indicator'
  CashDiscountIsDeductible : Boolean;

  /**
   * Using condition groups 1 - 5 from the customer record, a customer can be assigned to a group that can be used during subsequent processing (order, delivery, billing document...) for condition determination and pricing.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Condition Group 1'
  @sap.quickinfo : 'Customer Condition Group 1'
  CustomerConditionGroup1 : String(2);

  /**
   * Using condition groups 1 - 5 from the customer record, a customer can be assigned to a group that can be used during subsequent processing (order, delivery, billing document...) for condition determination and pricing.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Condition Group 2'
  @sap.quickinfo : 'Customer Condition Group 2'
  CustomerConditionGroup2 : String(2);

  /**
   * Using condition groups 1 - 5 from the customer record, a customer can be assigned to a group that can be used during subsequent processing (order, delivery, billing document...) for condition determination and pricing.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Condition Group 3'
  @sap.quickinfo : 'Customer Condition Group 3'
  CustomerConditionGroup3 : String(2);

  /**
   * Using condition groups 1 - 5 from the customer record, a customer can be assigned to a group that can be used during subsequent processing (order, delivery, billing document...) for condition determination and pricing.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Condition Group 4'
  @sap.quickinfo : 'Customer Condition Group 4'
  CustomerConditionGroup4 : String(2);

  /**
   * Using condition groups 1 - 5 from the customer record, a customer can be assigned to a group that can be used during subsequent processing (order, delivery, billing document...) for condition determination and pricing.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Condition Group 5'
  @sap.quickinfo : 'Customer Condition Group 5'
  CustomerConditionGroup5 : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Manual Price'
  @sap.quickinfo : 'Status manual price change'
  ManualPriceChangeType : String(1);

  /**
   * A way of grouping materials to which you want to apply the same condition.
   * 
   * You can create condition records for a material price group using the following condition types:Material price group (for example, all non-food products)A combination of customer and material price groupA combination of customer price group and material price group (for example, all wholesale customers and all non-food products)
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material Price Grp'
  @sap.quickinfo : 'Material Price Group'
  MaterialPricingGroup : String(2);

  /**
   * Exchange rate from statistics currency into company currency
   */
  @sap.label : 'Abs.Exch.rate stats'
  @sap.quickinfo : 'Absolute exchange rate for statistics'
  AbsltStatisticsExchangeRate : Decimal(9, 5);
  @sap.display.format : 'UpperCase'
  @sap.label : 'StatExcRateIsIndirct'
  @sap.quickinfo : 'Statistics exchange rate quotation is indirect'
  StatisticsExchRateIsIndrctQtan : Boolean;

  /**
   * Enter the number of the material master record for the pricing reference material on which the system should base its calculations for pricing for the main item.
   * 
   * The pricing reference material is stored in the master record of the main item material. All pricing conditions which apply to reference material apply to the material in the main item.You must first of all create a material master record for the pricing reference material.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Pricing Ref.Material'
  @sap.quickinfo : 'Pricing reference material of main item'
  MainItemPricingRefMaterial : String(40);

  /**
   * Enter a grouping of main item materials for which the same price conditions should apply.
   * 
   * You can create price conditions fora material pricing group (for example, non-food products)a combination of customer and material pricing groupa combination of price group and material pricing group (for example, wholesale customers and all non-food products)
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'MnItem MatPricingGrp'
  @sap.quickinfo : 'Material pricing group of main item'
  MainItemMaterialPricingGroup : String(2);

  /**
   * Identifies the country or region in which the delivery originates.
   * 
   * You can define the country/region key in a table. As a rule, it is a good idea to use the existing international standards for identifying vehicles from different countries or regions (for example: USA = United States, I = Italy, and so on). The system uses the key to do the following:Help determine the relevant taxes during pricingDetermine important country or region-specific standards (the length of postal codes and bank account numbers, for example)
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Departure Ctry/Reg.'
  @sap.quickinfo : 'Departure Country/Region (from which the goods are sent)'
  DepartureCountry : String(3);

  /**
   * The tax jurisdiction is used for determining the tax rates in the USA. It defines to which tax authorities you must pay your taxes. It is always the city to which the goods are supplied.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Jurisdiction'
  TaxJurisdiction : String(15);

  /**
   * Indicates whether, during sales order processing, the system determines taxes that relate to the material (for example, state sales taxes).
   * 
   * The system copies the tax classification from the tax information stored in the material master record. During pricing, the system uses the tax classification to calculate relevant taxes.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Class. Material'
  @sap.quickinfo : 'Tax Classification Material'
  ProductTaxClassification1 : String(1);

  /**
   * Indicates whether, during sales order processing, the system determines taxes that relate to the material (for example, VAT in the UK or state sales taxes in the USA).
   * 
   * The system copies the tax classification from the tax information stored in the material master record. During pricing, the system uses the tax classification to calculate relevant taxes.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Class.2 Material'
  @sap.quickinfo : 'Tax Classification 2 for Material'
  ProductTaxClassification2 : String(1);

  /**
   * Indicates whether, during sales order processing, the system determines taxes that relate to the material (for example, VAT in the UK or state sales taxes in the USA).
   * 
   * The system copies the tax classification from the tax information stored in the material master record. During pricing, the system uses the tax classification to calculate relevant taxes.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Class.3 Material'
  @sap.quickinfo : 'Tax Classification 3 for Material'
  ProductTaxClassification3 : String(1);

  /**
   * Indicates whether, during sales order processing, the system determines taxes that relate to the material (for example, VAT in the UK or state sales taxes in the USA).
   * 
   * The system copies the tax classification from the tax information stored in the material master record. During pricing, the system uses the tax classification to calculate relevant taxes.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Class.4 Material'
  @sap.quickinfo : 'Tax Classification 4 for Material'
  ProductTaxClassification4 : String(1);

  /**
   * Indicates whether, during sales order processing, the system determines taxes that relate to the material (for example, VAT in the UK or state sales taxes in the USA).
   * 
   * The system copies the tax classification from the tax information stored in the material master record. During pricing, the system uses the tax classification to calculate relevant taxes.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Class.5 Material'
  @sap.quickinfo : 'Tax Classification 5 for Material'
  ProductTaxClassification5 : String(1);

  /**
   * Indicates whether, during sales order processing, the system determines taxes that relate to the material (for example, VAT in the UK or state sales taxes in the USA).
   * 
   * The system copies the tax classification from the tax information stored in the material master record. During pricing, the system uses the tax classification to calculate relevant taxes.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Class.6 Material'
  @sap.quickinfo : 'Tax Classification 6 for Material'
  ProductTaxClassification6 : String(1);

  /**
   * Indicates whether, during sales order processing, the system determines taxes that relate to the material (for example, VAT in the UK or state sales taxes in the USA).
   * 
   * The system copies the tax classification from the tax information stored in the material master record. During pricing, the system uses the tax classification to calculate relevant taxes.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Class.7 Material'
  @sap.quickinfo : 'Tax Classification 7 for Material'
  ProductTaxClassification7 : String(1);

  /**
   * Indicates whether, during sales order processing, the system determines taxes that relate to the material (for example, VAT in the UK or state sales taxes in the USA).
   * 
   * The system copies the tax classification from the tax information stored in the material master record. During pricing, the system uses the tax classification to calculate relevant taxes.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Class.8 Material'
  @sap.quickinfo : 'Tax Classification 8 for Material'
  ProductTaxClassification8 : String(1);

  /**
   * Indicates whether, during sales order processing, the system determines taxes that relate to the material (for example, VAT in the UK or state sales taxes in the USA).
   * 
   * The system copies the tax classification from the tax information stored in the material master record. During pricing, the system uses the tax classification to calculate relevant taxes.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Class.9 Material'
  @sap.quickinfo : 'Tax Classification 9 for Material'
  ProductTaxClassification9 : String(1);

  /**
   * The codes are necessary to describe the different types of zero VAT for
   * 
   * the tax purposes.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Reason 0 VAT'
  @sap.quickinfo : 'Reason for Zero VAT'
  ZeroVATRsn : String(1);

  /**
   * Part of the invoiced amount for which cash discount is granted. The amount is always in the document currency.
   * 
   * During document entry, the amount qualifying for cash discount can be determined manually or automatically. The amount is determined automatically if no entry is made or a '*' is entered.To determine this amount automatically, the system takes into account the offsetting items relevant to cash discount for the invoice item and the rules assigned for each company code for processing cash discount and taxes.
   */
  @sap.unit : 'TransactionCurrency'
  @sap.label : 'Cash Disc.Basis'
  @sap.quickinfo : 'Amount eligible for cash discount in document currency'
  EligibleAmountForCashDiscount : Decimal(14, 3);

  /**
   * Key that uniquely identifies a business area.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Business Area'
  BusinessArea : String(4);

  /**
   * Key which together with the controlling area uniquely identifies a profit center.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Profit Center'
  ProfitCenter : String(10);

  /**
   * Key that identifies a WBS element.
   */
  @sap.display.format : 'NonNegative'
  @sap.label : 'WBS Element'
  @sap.quickinfo : 'Work Breakdown Structure Element (WBS Element)'
  WBSElement : String(24);

  /**
   * Uniquely identifies a controlling area.
   * 
   * The controlling area is the highest organizational unit in Controlling.Whether controlling area and company code are in a 1:1 relationship or a 1:n relationship, the number of posting periods in both controlling area and company code(s) must be identical. However, special periods may vary.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Controlling Area'
  ControllingArea : String(4);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Profitability Segment (Deprecated)'
  @sap.quickinfo : 'Deprecated: Profitability Segment'
  ProfitabilitySegment : String(10);

  /**
   * Key that uniquely identifies an order within a client.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Order'
  @sap.quickinfo : 'Order Number'
  OrderID : String(12);

  /**
   * A key that uniquely identifies a cost center.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Cost Center'
  CostCenter : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Originating Document'
  OriginSDDocument : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Originating Item'
  OriginSDDocumentItem : String(6);

  /**
   * Group of materials with the same accounting requirements.
   * 
   * Used by the system when creating an accounting document from a billing document to determine the revenue or sales deduction account.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Acct Assmt Grp Mat.'
  @sap.quickinfo : 'Account Assignment Group for Material'
  MatlAccountAssignmentGroup : String(2);

  /**
   * Identifies the sales order to which the delivery refers.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Reference Document'
  @sap.quickinfo : 'Document Number of the Reference Document'
  ReferenceSDDocument : String(10);

  /**
   * The number of the sales order item to which the delivery item refers.
   */
  @sap.display.format : 'NonNegative'
  @sap.label : 'Reference Item'
  @sap.quickinfo : 'Item Number of the Reference Item'
  ReferenceSDDocumentItem : String(6);
  @sap.label : 'Ref. Doc. Category'
  @sap.quickinfo : 'Reference Document Category'
  ReferenceSDDocumentCategory : String(4);

  /**
   * The number that uniquely identifies the sales document.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales Document'
  SalesDocument : String(10);

  /**
   * The number that uniquely identifies the item in the sales document.
   */
  @sap.display.format : 'NonNegative'
  @sap.label : 'Sales Document Item'
  SalesDocumentItem : String(6);
  @sap.label : 'Sales Doc. Category'
  @sap.quickinfo : 'Sales Document Category'
  SalesSDDocumentCategory : String(4);

  /**
   * The number of the higher-level item to which this item belongs in a hierarchy.
   * 
   * Items can be organized hierarchically. When you assign a sub-item to another item, the other item becomes a higher-level item.Enter the number of a higher-level item.
   */
  @sap.display.format : 'NonNegative'
  @sap.label : 'Higher-Level Item'
  @sap.quickinfo : 'Higher-Level Item in Bill of Material Structures'
  HigherLevelItem : String(6);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Partner Item'
  @sap.quickinfo : 'Item Number in the Partner Segment'
  BillingDocumentItemInPartSgmt : String(6);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Ext. Reference Document'
  @sap.quickinfo : 'External Reference Document'
  ExternalReferenceDocument : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Ext. Ref. Document Item'
  @sap.quickinfo : 'External Reference Document Item'
  ExternalReferenceDocumentItem : String(6);

  /**
   * A group of sales people who are responsible for processing sales of certain products or services.
   * 
   * By using sales groups you can designate different areas of responsibility within a sales office. When you generate sales statistics, you can use the sales group as one of the selection criteria.If sales office personnel service both retail and wholesale markets, you can assign a sales group to each market.You assign each salesperson to a sales group in his or her user master record. You assign each customer to a particular sales group in the customer's master record.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales Group'
  SalesGroup : String(3);

  /**
   * Specifies a customer-defined group of customers.
   * 
   * You can define up to five different groups of customers, according to the needs of your organization. You specify the groups in the customer master record under &quot;Additional data&quot;. If you assign a particular customer to one or more groups, the system automatically displays the groups in the header data of corresponding sales orders.You can define customer groups in Tables TVV1 through TVV5 and assign them to specific languages in Tables TVV1T through TVV5T.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Customer Group 1'
  AdditionalCustomerGroup1 : String(3);

  /**
   * Specifies a customer-defined group of customers.
   * 
   * You can define up to five different groups of customers, according to the needs of your organization. You specify the groups in the customer master record under &quot;Additional data&quot;. If you assign a particular customer to one or more groups, the system automatically displays the groups in the header data of corresponding sales orders.You can define customer groups in Tables TVV1 through TVV5 and assign them to specific languages in Tables TVV1T through TVV5T.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Customer Group 2'
  AdditionalCustomerGroup2 : String(3);

  /**
   * Specifies a customer-defined group of customers.
   * 
   * You can define up to five different groups of customers, according to the needs of your organization. You specify the groups in the customer master record under &quot;Additional data&quot;. If you assign a particular customer to one or more groups, the system automatically displays the groups in the header data of corresponding sales orders.You can define customer groups in Tables TVV1 through TVV5 and assign them to specific languages in Tables TVV1T through TVV5T.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Customer Group 3'
  AdditionalCustomerGroup3 : String(3);

  /**
   * Specifies a customer-defined group of customers.
   * 
   * You can define up to five different groups of customers, according to the needs of your organization. You specify the groups in the customer master record under &quot;Additional data&quot;. If you assign a particular customer to one or more groups, the system automatically displays the groups in the header data of corresponding sales orders.You can define customer groups in Tables TVV1 through TVV5 and assign them to specific languages in Tables TVV1T through TVV5T.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Customer Group 4'
  AdditionalCustomerGroup4 : String(3);

  /**
   * Specifies a customer-defined group of customers.
   * 
   * You can define up to five different groups of customers, according to the needs of your organization. You specify the groups in the customer master record under &quot;Additional data&quot;. If you assign a particular customer to one or more groups, the system automatically displays the groups in the header data of corresponding sales orders.You can define customer groups in Tables TVV1 through TVV5 and assign them to specific languages in Tables TVV1T through TVV5T.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Customer Group 5'
  AdditionalCustomerGroup5 : String(3);

  /**
   * Indicates the reason for creating the sales document.
   * 
   * You can freely define order reasons according to the needs of your organization. When you generate sales statistics, you can use the order reason as one of the selection criteria.Enter one of the values predefined for your system. If you are creating a credit or debit memo request, you must enter an order reason.If the order reason specifies, for example, that a customer placed a sales order as a result of contact at a trade fair, you can later generate statistics for all sales orders that were placed at trade fairs.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Order Reason'
  @sap.quickinfo : 'Order Reason (Reason for the Business Transaction)'
  SDDocumentReason : String(3);

  /**
   * Number identifying a promotion for which procurement is to take place.
   * 
   * For each item of a purchasing document, you can specify the promotion to which the item belongs.Depending on your system settings, special prices and conditions that are maintained in the IS-R system (Retail) for this promotion are applied when a promotion number is entered.This field also allows you to create purchasing documents on a selective basis for a certain promotion. For example, you can create a purchase order containing only those items that are to be procured for one promotion.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Promotion'
  RetailPromotion : String(10);

  /**
   * Specifies the amount of sales revenue that the system uses as a basis to calculate percentage rebates.
   */
  @sap.unit : 'TransactionCurrency'
  @sap.label : 'Rebate Basis'
  @sap.quickinfo : 'Rebate Basis 1'
  RebateBasisAmount : Decimal(14, 3);

  /**
   * Group definition that can be used for rebate settlement.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Volume Rebate Group'
  @sap.quickinfo : 'Volume rebate group'
  VolumeRebateGroup : String(2);

  /**
   * Specifies whether the credit management functions (credit checks and update statistics) for order, delivery, or invoice items are active.
   * 
   * Select this field if the values of the item type in the total liability are to be updated.In the documentary payments (letter of credit), only those item types that have this field selected are included.ExampleYou do not want a credit check to be executed for an adjustment (item type L2N) and have therefore not activated the credit check for transation type L2. You nevertheless want the values of the adjustment to be updated in the total liability. In this case, you need to select the field ActiveReceivable/Credit-Relevant. for thisitem type.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Credit Funct. Active'
  @sap.quickinfo : 'ID: Item with active credit function / relevant for credit'
  ItemIsRelevantForCredit : Boolean;

  /**
   * Specifies the credit-related price in a sales, shipping, or billing document.
   * 
   * The system multiplies the price you specify (for example, the net price) by the item quantity of an open sales, shipping, or billing document to calculate the value for credit management purposes.This price is freely definable in the pricing procedure. You can specify, for example, that either the gross price or the net price can be used for processing credit checks. In the standard system, the credit-related price is the net price, inclusive of sales tax.
   */
  @sap.unit : 'TransactionCurrency'
  @sap.label : 'Credit Price'
  @sap.quickinfo : 'Item credit price'
  CreditRelatedPrice : Decimal(12, 3);

  /**
   * The number that uniquely identifies the sales deal.
   * 
   * When creating a new sales deal, you can either enter a number manually or let the system automatically assign an internal number. If you enter a number manually, it must lie within the allocated number range (press F4 to see the range).
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales Deal'
  SalesDeal : String(10);

  /**
   * The number that uniquely identifies the promotion.
   * 
   * When creating a new promotion, you can either enter a number manually or let the system automatically assign an internal number. If you enter a number manually, it must lie within the allocated number range (press F4 to see the range).
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales Promotion'
  SalesPromotion : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales Distr. Order'
  @sap.quickinfo : 'Sales district of sales order'
  SalesOrderSalesDistrict : String(6);

  /**
   * Identifies a particular group of customers (for example, wholesale or retail) for the purpose of pricing or generating statistics.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Customer Grp Order'
  @sap.quickinfo : 'Customer group of sales order'
  SalesOrderCustomerGroup : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Price Group of Order'
  @sap.quickinfo : 'Price group of sales order'
  SalesOrderCustomerPriceGroup : String(2);

  /**
   * Specifies the price list type or other condition type(such as a surcharge or discount) which has been defined in the sales document.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Price List Order'
  @sap.quickinfo : 'Price list type of sales order'
  SalesOrderPriceListType : String(2);

  /**
   * Specifies the sales organization responsible for processing the sales order.
   * 
   * When you create condition records to define prices for inter-company billing, you specify the sales organization that is responsible for processing the sales order.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales Org. of Order'
  @sap.quickinfo : 'Sales organization of sales order'
  SalesOrderSalesOrganization : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Distr. Channel Order'
  @sap.quickinfo : 'Distribution channel of sales order'
  SalesOrderDistributionChannel : String(2);

  /**
   * Indicates whether a sales document (a sales order, for example) was created from a reference document.
   * 
   * You create a sales order from a quotation. The sales order results in an invoice. The order reference indicator in the invoice shows that the sales order was created from a reference document (in this case, the quotation).
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'SalesDocumentRefer'
  @sap.quickinfo : 'Sales document was created from reference'
  SalesDocIsCreatedFromReference : Boolean;

  /**
   * The physical location (for example, a warehouse or collection of loading ramps) from which you ship the item.
   * 
   * You can predefine shipping/receiving points in the system, based on different combinations ofPlantsShipping conditionsLoading groupsDuring delivery processing, the shipping/receiving point is the most important criterion that you use to select deliveries.A delivery can be shipped from only one shipping point or received at only one receiving point.If you want to provide more detailed information about a shipping point you can specify a loading point (for example, one of a number of different loading ramps).If, for example, you want to ship refrigerated goods to a certain customer by rail, the system proposes a shipping point with a suitable location and equipment for loading refrigerated goods onto rail cars.The system can propose a shipping/receiving point. If valid alternatives are predefined in your system, you can change the shipping/receiving point manually.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Shipping Point'
  @sap.quickinfo : 'Shipping Point / Receiving Point'
  ShippingPoint : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Usage of HL Item'
  @sap.quickinfo : 'ID for higher-level item usage'
  HigherLevelItemUsage : String(1);

  /**
   * Please add  an ON condition
   */
  to_BillingDocument : Association to API_BILLING_DOCUMENT_SRV.A_BillingDocument {  };

  /**
   * Please add  an ON condition
   */
  to_ItemText : Association to many API_BILLING_DOCUMENT_SRV.A_BillingDocumentItemText {  };

  /**
   * Please add  an ON condition
   */
  to_Partner : Association to many API_BILLING_DOCUMENT_SRV.A_BillingDocumentItemPartner {  };

  /**
   * Please add  an ON condition
   */
  to_PricingElement : Association to many API_BILLING_DOCUMENT_SRV.A_BillingDocumentItemPrcgElmnt {  };
};

@cds.persistence.skip : true
@sap.label : 'Item Partner'
@sap.content.version : '1'
entity API_BILLING_DOCUMENT_SRV.A_BillingDocumentItemPartner {

  /**
   * The number that uniquely identifies the billing document (the invoice, for example).
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Billing Document'
  key BillingDocument : String(10);

  /**
   * The number that uniquely identifies the item in the billing document.
   */
  @sap.display.format : 'NonNegative'
  @sap.label : 'Item'
  @sap.quickinfo : 'Billing Item'
  key BillingDocumentItem : String(6);

  /**
   * The abbreviated form of the name that identifies the partner function.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Partner Function'
  key PartnerFunction : String(2);

  /**
   * Gives an alphanumeric key, which clearly identifies the customer or vendor in the SAP system.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Customer'
  @sap.quickinfo : 'Customer Number'
  Customer : String(10);

  /**
   * Specifies an alphanumeric key that uniquely identifies the supplier in the SAP system.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Supplier'
  @sap.quickinfo : 'Account Number of Supplier'
  Supplier : String(10);

  /**
   * The personnel number is the only feature within a client which is unique to an employee. You have to enter a personnel number before you can display and maintain an employee's master data and time data.
   */
  @sap.display.format : 'NonNegative'
  @sap.label : 'Personnel Number'
  Personnel : String(8);

  /**
   * The number that uniquely identifies the contact person.
   */
  @sap.display.format : 'NonNegative'
  @sap.label : 'Contact Person'
  @sap.quickinfo : 'Number of Contact Person'
  ContactPerson : String(10);

  /**
   * Please add  an ON condition
   */
  to_BillingDocument : Association to API_BILLING_DOCUMENT_SRV.A_BillingDocument {  };

  /**
   * Please add  an ON condition
   */
  to_BillingDocumentItem : Association to API_BILLING_DOCUMENT_SRV.A_BillingDocumentItem {  };
};

@cds.persistence.skip : true
@sap.label : 'Item Pricing Element'
@sap.content.version : '1'
entity API_BILLING_DOCUMENT_SRV.A_BillingDocumentItemPrcgElmnt {

  /**
   * The number that uniquely identifies the billing document (the invoice, for example).
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Billing Document'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  key BillingDocument : String(10);

  /**
   * The number that uniquely identifies the item in the billing document.
   */
  @sap.display.format : 'NonNegative'
  @sap.label : 'Item'
  @sap.quickinfo : 'Billing Item'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  key BillingDocumentItem : String(6);

  /**
   * Number that determines the sequence of the condition within a procedure.
   */
  @sap.display.format : 'NonNegative'
  @sap.label : 'Step Number'
  key PricingProcedureStep : String(3);

  /**
   * Access number of the conditions within a step in the pricing procedure.
   * 
   * During automatic pricing, the system takes into account the sequence specified by the counter.
   */
  @sap.display.format : 'NonNegative'
  @sap.label : 'Counter'
  @sap.quickinfo : 'Condition Counter'
  key PricingProcedureCounter : String(3);

  /**
   * The key that uniquely identifies the condition.
   * 
   * The condition type indicates, for example, whether, during pricing, the system applies a price, a discount, a surcharge, or other pricing elements, such as freight costs and sales taxes. For each of these pricing elements, there is a condition type defined in the system.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Condition Type'
  ConditionType : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Valid From'
  @sap.quickinfo : 'Timestamp for Pricing'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  PricingDateTime : String(14);

  /**
   * Determines how the system calculates prices, discounts, or surcharges in a condition. For example, the system can calculate a price as a fixed amount or as a percentage based on quantity, volume, or weight.
   * 
   * The calculation type can be set when generating new condition records. If this does not happen, the calculation type maintained here is valid for the condition record.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Calculation Type'
  @sap.quickinfo : 'Calculation Type for Condition'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionCalculationType : String(3);

  /**
   * Defines the value in a business document that the system uses together with the condition amount to calculate the condition value for the price condition.
   * 
   * During the pricing process in a business document, for each condition type used in the pricing procedure, the system calculates the condition value as follows:For several calculation types (for example, A, C, D, E, F, H, I, J, K, M, N, O, P, W), the system multiplies the condition amount with the condition basis to calculate the condition value.For several calculation types (for example, A, C, D, E, F, H, I, M, N, O, P), the system multiplies the condition amount with the condition basis to calculate the condition value.For several calculation types (for example, C, D, E, F, H, I, M, N, O, P), the value of the condition basis refers to a unit of measure. If the unit of measure of the conditions basis differs from the unit of measure of the price condition (condition unit), the system automatically converts it into the unit of measure of the condition unit. For calculation types C, M, N, O, and P, the item quantity is the default value for the condition basis.For several calculation types (for example, A, B, H, I, J, K, W), the condition basis is a currency field and refers to a currency key field. Such a currency field in the context of pricing is called currency amount. If the currency key of the conditions basis (currency amount) differs from the currency key of the document, the system automatically converts the condition basis (currency amount) into the currency of the document. The system uses the exchange rates for the currencies that are defined in the general settings for currencies.For several calculation types (for example, A, B, H, I), the condition basis is a currency field and refers to a currency key field. Such a currency field in the context of pricing is called currency amount. If the currency key of the conditions basis (currency amount) differs from the currency key of the document, the system automatically converts the condition basis (currency amount) into the currency of the document. The system uses the exchange rates for the currencies that are defined in the general settings for currencies.Note: The standard number of decimal places for a currency is two.Currencies that use a different number of decimal places must in addition be entered into table TCURX, where you can explicitly define the number of decimal places, for example, zero decimals for Japanese yen JPY.Deviations are preconfigured depending on the currency, for example, zero decimals for Japanese yen JPY.If you have defined scales, the system uses the condition basis to determine the valid scale line with the corresponding condition amount.In usage-based pricing models, the usage corresponds to the condition basis.The condition basis can be aQuantityWeightVolumeCurrency AmountA sales order includes an item with a quantity of 120 pieces:The determined list price of USD 101 (condition amount) multiplied with the quantity of 120 pieces (condition basis) results in a condition value of USD 12120.Two discounts are applied to the item of this sales order:The first discount (-1 USD / PC) is based on the quantity ordered that is the condition basis equals the item quantity and the result is - 120 USD.The second discount (- 2 %) is calculated as a percentage which is applied to the results of the list price (USD 12120) and the first discount (- 120 USD). Its result (12000 USD) is the condition basis for the second discount. The result of the second discount is - 240 USD.
   */
  @sap.label : 'Condition Basis'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionBaseValue : Decimal(24, 9);

  /**
   * Determines how the system calculates prices using a specific condition.
   * 
   * Depending on the condition type, it can be a fixed amount, a percentage, or per mille. If the condition includes a pricing scale, the condition amount or percentage displays the first line of the scale.The following examples illustrate how you can use the condition amount or percentage in different condition types:If you create a condition that includes prices (for example, prices for a material), you enter an amount.If you create a condition based on percentage, such as discounts or surcharges (for example, a customer-specific discount), you enter the value of a percentage. If the condition is a discount, the system automatically enters a minus sign behind the amount and a percent sign in the Condition Unit field.
   */
  @sap.label : 'Amount'
  @sap.quickinfo : 'Condition Amount or Percentage'
  ConditionRateValue : Decimal(24, 9);

  /**
   * Currency key for amounts in the system.
   */
  @sap.label : 'Currency'
  @sap.quickinfo : 'Currency Key'
  @sap.semantics : 'currency-code'
  ConditionCurrency : String(5);

  /**
   * The quantity on which the amount or percentage is based. The quantity is expressed in sales units (for example, bottles).
   * 
   * You want to create a condition record for a material price of US$8 for 1 piece. You enter &quot;8&quot; in the Rate field, &quot;USD&quot; in the Unit field, and &quot;1&quot; as the condition pricing unit in this field.You create a condition record that gives a fixed discount of $10 to a customer who buys 1000 bottles. In this case, the condition pricing unit is 1000.
   */
  @sap.unit : 'ConditionQuantityUnit'
  @sap.label : 'Pricing Unit'
  @sap.quickinfo : 'Condition Pricing Unit'
  ConditionQuantity : Decimal(5, 0);

  /**
   * Quantity unit, to which the condition amount or percentage refers.
   */
  @sap.label : 'Condition Unit'
  @sap.quickinfo : 'Condition Unit in the Document'
  @sap.semantics : 'unit-of-measure'
  ConditionQuantityUnit : String(3);

  /**
   * A classification of conditions according to pre-defined categories (for example, all conditions that relate to freight costs).
   */
  @sap.label : 'Condition Category'
  @sap.quickinfo : 'Condition Category (Examples: Tax, Freight, Price, Cost)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionCategory : String(1);

  /**
   * This indicator causes a surcharge or discount to be set in the document statistically (that is, without altering the value).
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Statistical'
  @sap.quickinfo : 'Condition is used for statistics'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionIsForStatistics : Boolean;

  /**
   * Indicator that controls the validity of the scale value or percentage:
   * 
   * From a certain quantity or value (base scale)Up to a certain quantity or value (to-scale)Alternatively, it is possible to work with interval scales. Interval scales must be stored in the condition type, that is, the scale type &quot;interval scale&quot; cannot be changed in the condition record. The reason for this is technical restrictions resulting from the programming within pricing.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Scale Type'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  PricingScaleType : String(1);

  /**
   * Indicates that the system posts the amounts resulting from this condition to financial accounting as accruals.
   * 
   * If you mark this indicator, the condition appears in the document as a statistical condition.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Accruals'
  @sap.quickinfo : 'Condition is Relevant for Accrual (e.g. Freight)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  IsRelevantForAccrual : Boolean;

  /**
   * Indicates that the condition type is relevant for internal costing.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Invoice List Cond.'
  @sap.quickinfo : 'Condition for Invoice List'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  CndnIsRelevantForInvoiceList : String(1);

  /**
   * Indicates where the condition originated (for example, whether you entered the condition manually or whether the system determined it automatically).
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Condition Origin'
  @sap.quickinfo : 'Origin of the Condition'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionOrigin : String(1);

  /**
   * Indicates whether the system calculates the scale base value or the condition value taking all related items of the business document into account.
   * 
   * For a group condition to be effective, the items must belong to a group. You can freely define the group to meet the needs of your own organization. The items can, for example, all belong to the same material group.A sales order contains two items. Both items belong to the material group 01.Material Quantity Material groupA 150 01B 100 01The group condition indicator is set in the definition of the condition type for material group discounts. The condition record for material group 01 includes the following pricing scale:Scale quantity Discountfrom 1 pc -1%from 200 pc -2%Neither item alone qualifies for the 2% discount. However, when the items are combined as part of a group condition, the combined quantity creates a basis of 250 pieces. This basis then exceeds the scale value of 200 pieces, which is necessary to qualify for the higher discount.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Group Condition'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  IsGroupCondition : String(1);

  /**
   * Number that uniquely identifies a condition record.
   * 
   * The system uses the condition record number to store and retrieve information during processing (pricing, for example).
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Condition Record No.'
  @sap.quickinfo : 'Number of the Condition Record'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionRecord : String(10);

  /**
   * The sequential number that uniquely identifies the condition if a condition supplement exists.
   * 
   * If you have assigned a condition supplement to the condition, the system automatically assigns the number.
   */
  @sap.display.format : 'NonNegative'
  @sap.label : 'Sequent.No. of Cond.'
  @sap.quickinfo : 'Sequential Number of the Condition'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionSequentialNumber : String(3);

  /**
   * The tax on sales and purchases code represents a tax category that has to be considered for tax reporting to the tax authorities.
   * 
   * Tax codes are unique per country. The tax rate calculation rules and further features are stored in a table for each tax code.For tax-exempt or non-taxable transactions, you should use tax codes with a 0 percentage rate if the corresponding transactions are to be displayed in the tax returns.If the tax rates are changed by law, you have to define new tax codes. The old codes with the old tax rates must remain in the system until no more open items which use this tax code exist.For countries/regions for which time-dependent tax calculation is activated, the process for specifying your tax codes may differ. For more information, log onto SAP Help Portal and search for “time-dependent taxes”.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Code'
  @sap.quickinfo : 'Tax on Sales/Purchases Code'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  TaxCode : String(2);

  /**
   * One or more &quot;withholding tax codes&quot; are assigned to each withholding tax type. One of the things these codes determine is the various percentage rates for the withholding tax type.
   * 
   * Note that when processing a business transaction, no more than one withholding tax code can be assigned per withholding tax type. If the business transaction is subject to more than one withholding taxes, these must be represented in the system by defining various withholding tax types.
   */
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

  /**
   * The value, resulting from pricing, for a particular condition, total, or subtotal in a document.
   * 
   * This value is used as a total for the condition in the pricing procedure.
   */
  @sap.unit : 'TransactionCurrency'
  @sap.label : 'Value'
  @sap.quickinfo : 'Condition Value'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionAmount : Decimal(16, 3);

  /**
   * The currency that applies to the document (for example, to a sales order or an invoice).
   * 
   * The system proposes the document currency from the customer master record of the sold-to party. You can change the currency manually in the document. If you change the currency, the system recalculates prices for the entire document.
   */
  @sap.label : 'Document Currency'
  @sap.quickinfo : 'SD Document Currency'
  @sap.semantics : 'currency-code'
  TransactionCurrency : String(5);

  /**
   * Indicates whether the prices or values in a condition are fixed or whether and in what way they changed.
   * 
   * The indicator shows, for example, if the prices generated by a condition have been changed manually during processing.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Condition Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionControl : String(1);

  /**
   * Indicates if the condition is active.
   * 
   * A condition can be inactive due to the following reasons:Condition is excludedSubsequent price deactivates conditionFormula deactivates conditionError during pricing
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Inactive Condition'
  @sap.quickinfo : 'Condition is Inactive'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionInactiveReason : String(1);

  /**
   * Preliminary structuring of condition types, for example, in surcharges and discounts or prices.
   * 
   * Allows standardized processing of individual condition classes within the system.
   */
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

  /**
   * Controls whether the condition type is a duplicated condition or a cumulated condition.
   * 
   * This control is only helpful when you use bill of materials or configurable materials:' ' - None'A' - Duplication Condition: A duplicated condition is duplicated into all assigned items.'B' - Cumulation Condition: A cumulated condition contains the net value of all assigned items.
   */
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

  /**
   * Determines how the system interprets a pricing scale in a condition. For example, the scale can be based on quantity, weight, or volume.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Scale Basis'
  @sap.quickinfo : 'Scale Basis Indicator'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  PricingScaleBasis : String(3);

  /**
   * A value or quantity that the system uses to access a pricing scale to determine a scale level.
   * 
   * The scale base value can be a condition value or the value of a quantity, weight, and so on that has been entered in the document.You create a price condition based on a simple quantity scale with scale type A: Base scale:Quantity Price per Unit10 12 USD100 11 USD1000 10 USDA sales order item with 150 units qualifies for the condition scale quantity of 100 units and the price per unit of USD 11. In this case, the scale base value that determines the price is 150.
   */
  @sap.label : 'Scale Base Val.'
  @sap.quickinfo : 'Scale Base Value'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionScaleBasisValue : Decimal(24, 9);

  /**
   * Unit of measure to which the quantity scale refers.
   */
  @sap.label : 'Scale Unit of Meas.'
  @sap.quickinfo : 'Condition Scale Unit of Measure'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.semantics : 'unit-of-measure'
  ConditionScaleBasisUnit : String(3);

  /**
   * Specifies a currency for a pricing scale in a condition record.
   * 
   * If a pricing scale is based on a value instead of a quantity, you can specify a currency for the value. In the standard version of the SAP System, this field is only relevant in condition records for the following discounts:Price groupPrice group/Material pricing groupYou apply a price group discount to customers in a particular foreign country. When you create a condition record for this discount and enter values in the pricing scale, you can also enter the corresponding foreign currency. During pricing, the system then calculates discounts based on scale values in the foreign currency. The discount amount is then converted into the currency you are using in the sales document.After you enter a currency in this field and save the condition record, you cannot change the currency without deleting the record and creating it again.
   */
  @sap.label : 'Scale Currency'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.semantics : 'currency-code'
  ConditionScaleBasisCurrency : String(5);

  /**
   * Indicator that defines a condition as relevant for the intercompany process.
   * 
   * Intercompany conditions are usually statistical in the sales order and the customer invoice and not statistical in the intercompany invoice.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Intercomp.Billing'
  @sap.quickinfo : 'Condition for Intercompany Billing'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  CndnIsRelevantForIntcoBilling : Boolean;

  /**
   * If this flag is set, the condition has been manually or automatically changed or created (by entry in the condition screen).
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Changed Manually'
  @sap.quickinfo : 'Condition Changed Manually'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionIsManuallyChanged : Boolean;

  /**
   * A condition that is relevant for variant configuration.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'UsedforVariantConfig'
  @sap.quickinfo : 'Condition Used for Variant Configuration'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionIsForConfiguration : Boolean;

  /**
   * Freely definable attribute that determines the valid price components of a configurable material.
   * 
   * To model the price for a variant of a configurable material, you typically use a larger number of variant condition keys.In a business document, the price for a selected variant is realized as surcharges and discounts specific for this variant: The sales price of a bike depends on the material that is used to produce the frame. You define a characteristic FRAME_MATERIAL that can have the values steel, aluminum, and carbon with the following surcharges:Steel: 0.0 USD per pieceAluminum: + 300 USD per pieceCarbon: + 1000 USD per pieceYou define three different variant condition keys FRAME_STEEL, FRAME_ALU, and FRAME_CARBON and maintain the above-mentioned surcharges as condition records. During order creation, you select the variant of the bike with the carbon frame. This will lead to a surcharge of 1000 USD that corresponds to the variant condition key FRAME_CARBON.
   */
  @sap.label : 'Variant Key'
  @sap.quickinfo : 'Variant Condition Key'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  VariantCondition : String(26);

  /**
   * Please add  an ON condition
   */
  to_BillingDocument : Association to API_BILLING_DOCUMENT_SRV.A_BillingDocument {  };

  /**
   * Please add  an ON condition
   */
  to_BillingDocumentItem : Association to API_BILLING_DOCUMENT_SRV.A_BillingDocumentItem {  };
};

@cds.persistence.skip : true
@sap.label : 'Item Text'
@sap.content.version : '1'
entity API_BILLING_DOCUMENT_SRV.A_BillingDocumentItemText {

  /**
   * The number that uniquely identifies the billing document (the invoice, for example).
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Billing Document'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  key BillingDocument : String(10);

  /**
   * The number that uniquely identifies the item in the billing document.
   */
  @sap.display.format : 'NonNegative'
  @sap.label : 'Item'
  @sap.quickinfo : 'Billing Item'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  key BillingDocumentItem : String(6);

  /**
   * The language key indicates
   * 
   * - the language in which texts are displayed,- the language in which you enter texts,- the language in which the system prints texts.
   */
  @sap.label : 'Language Key'
  key Language : String(2);

  /**
   * The text ID defines the various types of texts related to a text object. For example, the object &quot;TEXT&quot; (standard texts) can have the following text IDs:
   * 
   * ST for user-specific standard texts (individual texts)SYST for cross-application system textsvarious IDs for specific application departments. You must have the appropriate access authorization in order to access these texts.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Text ID'
  key LongTextID : String(4);
  @sap.label : 'String'
  @sap.heading : ''
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  LongText : LargeString;
};

@cds.persistence.skip : true
@sap.label : 'Header Partner'
@sap.content.version : '1'
entity API_BILLING_DOCUMENT_SRV.A_BillingDocumentPartner {

  /**
   * The number that uniquely identifies the billing document (the invoice, for example).
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Billing Document'
  key BillingDocument : String(10);

  /**
   * The abbreviated form of the name that identifies the partner function.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Partner Function'
  key PartnerFunction : String(2);

  /**
   * Gives an alphanumeric key, which clearly identifies the customer or vendor in the SAP system.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Customer'
  @sap.quickinfo : 'Customer Number'
  Customer : String(10);

  /**
   * Specifies an alphanumeric key that uniquely identifies the supplier in the SAP system.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Supplier'
  @sap.quickinfo : 'Account Number of Supplier'
  Supplier : String(10);

  /**
   * The personnel number is the only feature within a client which is unique to an employee. You have to enter a personnel number before you can display and maintain an employee's master data and time data.
   */
  @sap.display.format : 'NonNegative'
  @sap.label : 'Personnel Number'
  Personnel : String(8);

  /**
   * The number that uniquely identifies the contact person.
   */
  @sap.display.format : 'NonNegative'
  @sap.label : 'Contact Person'
  @sap.quickinfo : 'Number of Contact Person'
  ContactPerson : String(10);

  /**
   * Please add  an ON condition
   */
  to_BillingDocument : Association to API_BILLING_DOCUMENT_SRV.A_BillingDocument {  };
};

@cds.persistence.skip : true
@sap.label : 'Header Pricing Element'
@sap.content.version : '1'
entity API_BILLING_DOCUMENT_SRV.A_BillingDocumentPrcgElmnt {

  /**
   * The number that uniquely identifies the billing document (the invoice, for example).
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Billing Document'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  key BillingDocument : String(10);

  /**
   * Number that determines the sequence of the condition within a procedure.
   */
  @sap.display.format : 'NonNegative'
  @sap.label : 'Step Number'
  key PricingProcedureStep : String(3);

  /**
   * Access number of the conditions within a step in the pricing procedure.
   * 
   * During automatic pricing, the system takes into account the sequence specified by the counter.
   */
  @sap.display.format : 'NonNegative'
  @sap.label : 'Counter'
  @sap.quickinfo : 'Condition Counter'
  key PricingProcedureCounter : String(3);

  /**
   * The key that uniquely identifies the condition.
   * 
   * The condition type indicates, for example, whether, during pricing, the system applies a price, a discount, a surcharge, or other pricing elements, such as freight costs and sales taxes. For each of these pricing elements, there is a condition type defined in the system.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Condition Type'
  ConditionType : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Valid From'
  @sap.quickinfo : 'Timestamp for Pricing'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  PricingDateTime : String(14);

  /**
   * Determines how the system calculates prices, discounts, or surcharges in a condition. For example, the system can calculate a price as a fixed amount or as a percentage based on quantity, volume, or weight.
   * 
   * The calculation type can be set when generating new condition records. If this does not happen, the calculation type maintained here is valid for the condition record.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Calculation Type'
  @sap.quickinfo : 'Calculation Type for Condition'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionCalculationType : String(3);

  /**
   * Defines the value in a business document that the system uses together with the condition amount to calculate the condition value for the price condition.
   * 
   * During the pricing process in a business document, for each condition type used in the pricing procedure, the system calculates the condition value as follows:For several calculation types (for example, A, C, D, E, F, H, I, J, K, M, N, O, P, W), the system multiplies the condition amount with the condition basis to calculate the condition value.For several calculation types (for example, A, C, D, E, F, H, I, M, N, O, P), the system multiplies the condition amount with the condition basis to calculate the condition value.For several calculation types (for example, C, D, E, F, H, I, M, N, O, P), the value of the condition basis refers to a unit of measure. If the unit of measure of the conditions basis differs from the unit of measure of the price condition (condition unit), the system automatically converts it into the unit of measure of the condition unit. For calculation types C, M, N, O, and P, the item quantity is the default value for the condition basis.For several calculation types (for example, A, B, H, I, J, K, W), the condition basis is a currency field and refers to a currency key field. Such a currency field in the context of pricing is called currency amount. If the currency key of the conditions basis (currency amount) differs from the currency key of the document, the system automatically converts the condition basis (currency amount) into the currency of the document. The system uses the exchange rates for the currencies that are defined in the general settings for currencies.For several calculation types (for example, A, B, H, I), the condition basis is a currency field and refers to a currency key field. Such a currency field in the context of pricing is called currency amount. If the currency key of the conditions basis (currency amount) differs from the currency key of the document, the system automatically converts the condition basis (currency amount) into the currency of the document. The system uses the exchange rates for the currencies that are defined in the general settings for currencies.Note: The standard number of decimal places for a currency is two.Currencies that use a different number of decimal places must in addition be entered into table TCURX, where you can explicitly define the number of decimal places, for example, zero decimals for Japanese yen JPY.Deviations are preconfigured depending on the currency, for example, zero decimals for Japanese yen JPY.If you have defined scales, the system uses the condition basis to determine the valid scale line with the corresponding condition amount.In usage-based pricing models, the usage corresponds to the condition basis.The condition basis can be aQuantityWeightVolumeCurrency AmountA sales order includes an item with a quantity of 120 pieces:The determined list price of USD 101 (condition amount) multiplied with the quantity of 120 pieces (condition basis) results in a condition value of USD 12120.Two discounts are applied to the item of this sales order:The first discount (-1 USD / PC) is based on the quantity ordered that is the condition basis equals the item quantity and the result is - 120 USD.The second discount (- 2 %) is calculated as a percentage which is applied to the results of the list price (USD 12120) and the first discount (- 120 USD). Its result (12000 USD) is the condition basis for the second discount. The result of the second discount is - 240 USD.
   */
  @sap.label : 'Condition Basis'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionBaseValue : Decimal(24, 9);

  /**
   * Determines how the system calculates prices using a specific condition.
   * 
   * Depending on the condition type, it can be a fixed amount, a percentage, or per mille. If the condition includes a pricing scale, the condition amount or percentage displays the first line of the scale.The following examples illustrate how you can use the condition amount or percentage in different condition types:If you create a condition that includes prices (for example, prices for a material), you enter an amount.If you create a condition based on percentage, such as discounts or surcharges (for example, a customer-specific discount), you enter the value of a percentage. If the condition is a discount, the system automatically enters a minus sign behind the amount and a percent sign in the Condition Unit field.
   */
  @sap.label : 'Amount'
  @sap.quickinfo : 'Condition Amount or Percentage'
  ConditionRateValue : Decimal(24, 9);

  /**
   * Currency key for amounts in the system.
   */
  @sap.label : 'Currency'
  @sap.quickinfo : 'Currency Key'
  @sap.semantics : 'currency-code'
  ConditionCurrency : String(5);

  /**
   * The quantity on which the amount or percentage is based. The quantity is expressed in sales units (for example, bottles).
   * 
   * You want to create a condition record for a material price of US$8 for 1 piece. You enter &quot;8&quot; in the Rate field, &quot;USD&quot; in the Unit field, and &quot;1&quot; as the condition pricing unit in this field.You create a condition record that gives a fixed discount of $10 to a customer who buys 1000 bottles. In this case, the condition pricing unit is 1000.
   */
  @sap.unit : 'ConditionQuantityUnit'
  @sap.label : 'Pricing Unit'
  @sap.quickinfo : 'Condition Pricing Unit'
  ConditionQuantity : Decimal(5, 0);

  /**
   * Quantity unit, to which the condition amount or percentage refers.
   */
  @sap.label : 'Condition Unit'
  @sap.quickinfo : 'Condition Unit in the Document'
  @sap.semantics : 'unit-of-measure'
  ConditionQuantityUnit : String(3);

  /**
   * A classification of conditions according to pre-defined categories (for example, all conditions that relate to freight costs).
   */
  @sap.label : 'Condition Category'
  @sap.quickinfo : 'Condition Category (Examples: Tax, Freight, Price, Cost)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionCategory : String(1);

  /**
   * This indicator causes a surcharge or discount to be set in the document statistically (that is, without altering the value).
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Statistical'
  @sap.quickinfo : 'Condition is used for statistics'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionIsForStatistics : Boolean;

  /**
   * Indicator that controls the validity of the scale value or percentage:
   * 
   * From a certain quantity or value (base scale)Up to a certain quantity or value (to-scale)Alternatively, it is possible to work with interval scales. Interval scales must be stored in the condition type, that is, the scale type &quot;interval scale&quot; cannot be changed in the condition record. The reason for this is technical restrictions resulting from the programming within pricing.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Scale Type'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  PricingScaleType : String(1);

  /**
   * Indicates where the condition originated (for example, whether you entered the condition manually or whether the system determined it automatically).
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Condition Origin'
  @sap.quickinfo : 'Origin of the Condition'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionOrigin : String(1);

  /**
   * Indicates whether the system calculates the scale base value or the condition value taking all related items of the business document into account.
   * 
   * For a group condition to be effective, the items must belong to a group. You can freely define the group to meet the needs of your own organization. The items can, for example, all belong to the same material group.A sales order contains two items. Both items belong to the material group 01.Material Quantity Material groupA 150 01B 100 01The group condition indicator is set in the definition of the condition type for material group discounts. The condition record for material group 01 includes the following pricing scale:Scale quantity Discountfrom 1 pc -1%from 200 pc -2%Neither item alone qualifies for the 2% discount. However, when the items are combined as part of a group condition, the combined quantity creates a basis of 250 pieces. This basis then exceeds the scale value of 200 pieces, which is necessary to qualify for the higher discount.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Group Condition'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  IsGroupCondition : String(1);

  /**
   * Number that uniquely identifies a condition record.
   * 
   * The system uses the condition record number to store and retrieve information during processing (pricing, for example).
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Condition Record No.'
  @sap.quickinfo : 'Number of the Condition Record'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionRecord : String(10);

  /**
   * The sequential number that uniquely identifies the condition if a condition supplement exists.
   * 
   * If you have assigned a condition supplement to the condition, the system automatically assigns the number.
   */
  @sap.display.format : 'NonNegative'
  @sap.label : 'Sequent.No. of Cond.'
  @sap.quickinfo : 'Sequential Number of the Condition'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionSequentialNumber : String(3);

  /**
   * The tax on sales and purchases code represents a tax category that has to be considered for tax reporting to the tax authorities.
   * 
   * Tax codes are unique per country. The tax rate calculation rules and further features are stored in a table for each tax code.For tax-exempt or non-taxable transactions, you should use tax codes with a 0 percentage rate if the corresponding transactions are to be displayed in the tax returns.If the tax rates are changed by law, you have to define new tax codes. The old codes with the old tax rates must remain in the system until no more open items which use this tax code exist.For countries/regions for which time-dependent tax calculation is activated, the process for specifying your tax codes may differ. For more information, log onto SAP Help Portal and search for “time-dependent taxes”.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Code'
  @sap.quickinfo : 'Tax on Sales/Purchases Code'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  TaxCode : String(2);

  /**
   * One or more &quot;withholding tax codes&quot; are assigned to each withholding tax type. One of the things these codes determine is the various percentage rates for the withholding tax type.
   * 
   * Note that when processing a business transaction, no more than one withholding tax code can be assigned per withholding tax type. If the business transaction is subject to more than one withholding taxes, these must be represented in the system by defining various withholding tax types.
   */
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

  /**
   * The value, resulting from pricing, for a particular condition, total, or subtotal in a document.
   * 
   * This value is used as a total for the condition in the pricing procedure.
   */
  @sap.unit : 'TransactionCurrency'
  @sap.label : 'Value'
  @sap.quickinfo : 'Condition Value'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionAmount : Decimal(16, 3);

  /**
   * The currency that applies to the document (for example, to a sales order or an invoice).
   * 
   * The system proposes the document currency from the customer master record of the sold-to party. You can change the currency manually in the document. If you change the currency, the system recalculates prices for the entire document.
   */
  @sap.label : 'Document Currency'
  @sap.quickinfo : 'SD Document Currency'
  @sap.semantics : 'currency-code'
  TransactionCurrency : String(5);

  /**
   * Indicates whether the prices or values in a condition are fixed or whether and in what way they changed.
   * 
   * The indicator shows, for example, if the prices generated by a condition have been changed manually during processing.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Condition Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionControl : String(1);

  /**
   * Indicates if the condition is active.
   * 
   * A condition can be inactive due to the following reasons:Condition is excludedSubsequent price deactivates conditionFormula deactivates conditionError during pricing
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Inactive Condition'
  @sap.quickinfo : 'Condition is Inactive'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionInactiveReason : String(1);

  /**
   * Preliminary structuring of condition types, for example, in surcharges and discounts or prices.
   * 
   * Allows standardized processing of individual condition classes within the system.
   */
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

  /**
   * Controls whether the condition type is a duplicated condition or a cumulated condition.
   * 
   * This control is only helpful when you use bill of materials or configurable materials:' ' - None'A' - Duplication Condition: A duplicated condition is duplicated into all assigned items.'B' - Cumulation Condition: A cumulated condition contains the net value of all assigned items.
   */
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

  /**
   * Determines how the system interprets a pricing scale in a condition. For example, the scale can be based on quantity, weight, or volume.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Scale Basis'
  @sap.quickinfo : 'Scale Basis Indicator'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  PricingScaleBasis : String(3);

  /**
   * A value or quantity that the system uses to access a pricing scale to determine a scale level.
   * 
   * The scale base value can be a condition value or the value of a quantity, weight, and so on that has been entered in the document.You create a price condition based on a simple quantity scale with scale type A: Base scale:Quantity Price per Unit10 12 USD100 11 USD1000 10 USDA sales order item with 150 units qualifies for the condition scale quantity of 100 units and the price per unit of USD 11. In this case, the scale base value that determines the price is 150.
   */
  @sap.label : 'Scale Base Val.'
  @sap.quickinfo : 'Scale Base Value'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionScaleBasisValue : Decimal(24, 9);

  /**
   * Unit of measure to which the quantity scale refers.
   */
  @sap.label : 'Scale Unit of Meas.'
  @sap.quickinfo : 'Condition Scale Unit of Measure'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.semantics : 'unit-of-measure'
  ConditionScaleBasisUnit : String(3);

  /**
   * Specifies a currency for a pricing scale in a condition record.
   * 
   * If a pricing scale is based on a value instead of a quantity, you can specify a currency for the value. In the standard version of the SAP System, this field is only relevant in condition records for the following discounts:Price groupPrice group/Material pricing groupYou apply a price group discount to customers in a particular foreign country. When you create a condition record for this discount and enter values in the pricing scale, you can also enter the corresponding foreign currency. During pricing, the system then calculates discounts based on scale values in the foreign currency. The discount amount is then converted into the currency you are using in the sales document.After you enter a currency in this field and save the condition record, you cannot change the currency without deleting the record and creating it again.
   */
  @sap.label : 'Scale Currency'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.semantics : 'currency-code'
  ConditionScaleBasisCurrency : String(5);

  /**
   * Indicator that defines a condition as relevant for the intercompany process.
   * 
   * Intercompany conditions are usually statistical in the sales order and the customer invoice and not statistical in the intercompany invoice.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Intercomp.Billing'
  @sap.quickinfo : 'Condition for Intercompany Billing'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  CndnIsRelevantForIntcoBilling : Boolean;

  /**
   * If this flag is set, the condition has been manually or automatically changed or created (by entry in the condition screen).
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Changed Manually'
  @sap.quickinfo : 'Condition Changed Manually'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionIsManuallyChanged : Boolean;

  /**
   * A condition that is relevant for variant configuration.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'UsedforVariantConfig'
  @sap.quickinfo : 'Condition Used for Variant Configuration'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ConditionIsForConfiguration : Boolean;

  /**
   * Freely definable attribute that determines the valid price components of a configurable material.
   * 
   * To model the price for a variant of a configurable material, you typically use a larger number of variant condition keys.In a business document, the price for a selected variant is realized as surcharges and discounts specific for this variant: The sales price of a bike depends on the material that is used to produce the frame. You define a characteristic FRAME_MATERIAL that can have the values steel, aluminum, and carbon with the following surcharges:Steel: 0.0 USD per pieceAluminum: + 300 USD per pieceCarbon: + 1000 USD per pieceYou define three different variant condition keys FRAME_STEEL, FRAME_ALU, and FRAME_CARBON and maintain the above-mentioned surcharges as condition records. During order creation, you select the variant of the bike with the carbon frame. This will lead to a surcharge of 1000 USD that corresponds to the variant condition key FRAME_CARBON.
   */
  @sap.label : 'Variant Key'
  @sap.quickinfo : 'Variant Condition Key'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  VariantCondition : String(26);

  /**
   * Please add  an ON condition
   */
  to_BillingDocument : Association to API_BILLING_DOCUMENT_SRV.A_BillingDocument {  };
};

@cds.persistence.skip : true
@sap.label : 'Header Text'
@sap.content.version : '1'
entity API_BILLING_DOCUMENT_SRV.A_BillingDocumentText {

  /**
   * The number that uniquely identifies the billing document (the invoice, for example).
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Billing Document'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  key BillingDocument : String(10);

  /**
   * The language key indicates
   * 
   * - the language in which texts are displayed,- the language in which you enter texts,- the language in which the system prints texts.
   */
  @sap.label : 'Language Key'
  key Language : String(2);

  /**
   * The text ID defines the various types of texts related to a text object. For example, the object &quot;TEXT&quot; (standard texts) can have the following text IDs:
   * 
   * ST for user-specific standard texts (individual texts)SYST for cross-application system textsvarious IDs for specific application departments. You must have the appropriate access authorization in order to access these texts.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Text ID'
  key LongTextID : String(4);
  @sap.label : 'String'
  @sap.heading : ''
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  LongText : LargeString;
};

