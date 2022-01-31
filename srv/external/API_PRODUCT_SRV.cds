/* checksum : efd7ee9b0f2b1b311ea5a26463083fef */
@cds.external : true
service API_PRODUCT_SRV {};

@cds.persistence.skip : true
@sap.label : 'Product'
@sap.content.version : '1'
entity API_PRODUCT_SRV.A_Product {

  /**
   * Alphanumeric key uniquely identifying the product.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product'
  @sap.quickinfo : 'Product Number'
  key Product : String(40);

  /**
   * Key that assigns the product to a group of products such as raw materials, operating supplies or trading goods.
   * 
   * The product type defines certain attributes of the material and has important control functions.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product Type'
  ProductType : String(4);

  /**
   * Indicates whether the product may be used in the following areas for all plants:
   * 
   * Materials management (for example, in purchasing and in inventory management)Production planning and controlPlant maintenanceWarehouse managementCosting with a quantity structureThe cross-plant product status restricts the usability of the product for all plants, that is, it defines whether a warning or error message is displayed if you include the product in a particular function.The product may be a part under development or one to be discontinued.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'CrossPlantProdStatus'
  @sap.quickinfo : 'Cross-Plant Product Status'
  CrossPlantStatus : String(2);

  /**
   * Materials planning
   * 
   * The valid-from date of the material status is considered only if it precedes or is the same as the planning date; that is, if the valid-from date is later than the planning date, it is not considered, even if it is within the planning horizon.ExampleI<-------------Planning horizon------------->I-----I--------------------I-----------------------I-->Planning date Valid-from date TimeIn this case, the valid-from date is not considered in materials planning since it is later than the planning date.PurchasingThe valid-from date of the material status is checked against the current date.ExampleYou block the material for purchasing from May 1, xxxx. A purchase order is created for the material on April 28, xxxx with a delivery date of May 10, xxxx. In this case, the valid-from date May 1, xxxx is checked against the purchase order date April 28, xxxx and the purchase order is allowed. Had you created the purchase order on May 3, xxxx, an error message would have been issued.
   */
  @sap.display.format : 'Date'
  @sap.label : 'Valid from'
  @sap.quickinfo : 'Date from which the cross-plant material status is valid'
  CrossPlantStatusValidityDate : Date;

  /**
   * Date on which the record was created.
   */
  @sap.display.format : 'Date'
  @sap.label : 'Created On'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  CreationDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Created By'
  @sap.quickinfo : 'Name of Person Responsible for Creating the Object'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  CreatedByUser : String(12);

  /**
   * Date on which this rate was last changed.
   */
  @sap.display.format : 'Date'
  @sap.label : 'Last Change'
  @sap.quickinfo : 'Date of Last Change'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  LastChangeDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Changed By'
  @sap.quickinfo : 'Name of Person Who Changed Object'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  LastChangedByUser : String(12);

  /**
   * Shows the year, month, day, hour, second, millisecond, microsecond,
   * 
   * and the first decimal of the nanoseconds when the record was created.This value is for display only.
   */
  @sap.label : 'Last Changed'
  @sap.quickinfo : 'Change Time Stamp'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  LastChangeDateTime : Timestamp;

  /**
   * Indicator that allows you to flag a master record for deletion.
   * 
   * A reorganization program deletes the master record from the system if you have entered a delete flag for it in the master record.You cannot delete master records online.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Marked for Deletion'
  @sap.quickinfo : 'Deletion Indicator'
  IsMarkedForDeletion : Boolean;

  /**
   * Number under which you have managed the product so far or still manage it, for example, in another system or in a card index.
   * 
   * You can use the old product number to systematically search for product master records via matchcodes.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Old product number'
  @sap.quickinfo : 'Old Product Number'
  ProductOldID : String(40);

  /**
   * Gross weight expressed in the unit of weight specified by you in the Unit of weight field.
   */
  @sap.unit : 'WeightUnit'
  @sap.label : 'Gross Weight'
  GrossWeight : Decimal(13, 3);

  /**
   * Specifies the unit of measure in which the material is ordered.
   */
  @sap.label : 'Order Unit'
  @sap.quickinfo : 'Purchase Order Unit of Measure'
  @sap.semantics : 'unit-of-measure'
  PurchaseOrderQuantityUnit : String(3);

  /**
   * Restricts the search for sources of supply for this material to external (normal) or internal (stock transfer) sources of supply, and also allows you to define a search sequence.
   * 
   * The entry you make is used by the system in source determination if it cannot find a unique source of supply in the quota arrangement and source list.If the plant to be supplied is assigned to a supply region, the system chooses a potential source of supply only if the source of supply is valid for the plant's supply region.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Source of supply'
  @sap.quickinfo : 'Source of Supply'
  SourceOfSupply : String(1);

  /**
   * Unit referring to the gross weight or net weight of the material.
   * 
   * If you specify a weight, you must enter the corresponding unit of weight here.
   */
  @sap.label : 'Unit of Weight'
  @sap.semantics : 'unit-of-measure'
  WeightUnit : String(3);

  /**
   * Net weight expressed in the unit of weight specified by you in the Unit of weight field.
   */
  @sap.unit : 'WeightUnit'
  @sap.label : 'Net Weight'
  NetWeight : Decimal(13, 3);

  /**
   * Key of the country in which the material has been produced.
   * 
   * You are legally required to specify the country of origin both for export and import.ExportYou prove the origin of a material by presenting the certificate of origin. This is issued and controlled by the relevant authority of the issuing country.This authority confirms the origin of a material and the required information with the certificate of origin.ImportThe relevant authority of the importing country - usually the Ministry of Economic Affairs - stipulates which regulations regarding customs and foreign trade law have to be observed for the certificates of origin accompanying goods.This information is used for foreign trade processing in different areas, such as:Foreign trade lawCustoms lawExample for Europe:Article 9 of the EU origin regulation is the legal regulation for the certificate of origin.The responsible authorities in Germany include:Chamber of Commerce (Industrie- und Handelskammer)Chamber of Handicrafts (Handwerkskammer)Customs office
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Cntry/Reg of Origin'
  @sap.quickinfo : 'Country/Region of Origin of Material (Non-Preferential Ori.)'
  CountryOfOrigin : String(3);

  /**
   * Customer number of the competitor. Competitors are managed in the SAP system as customers of a particular account group. This account group defines internally that the customer is a competitor.
   * 
   * You can store company, personnel, and any other data for each competitor.The competitor number in the material master record serves to identify a competitive product as that of a particular commpetitor. Products can be contrasted and compared at different hierarchical levels thanks to this allocation of one's own products and competitive products to product groups.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Competitor'
  CompetitorID : String(10);

  /**
   * Key that you use to group together several products or services with the same attributes, and to assign them to a particular product group.
   * 
   * You can use product groups to:Restrict the scope of analysesSearch specifically for product master records via search helpsIf you have not defined a product group hierarchy using the classification system, you maintain product groups in Customizing for the Material Master in Define material groups.If you have defined a product group hierarchy, which is normally the case in retail, you maintain product groups in Customizing for Material Groups or from the initial Retailing screen by choosing Master data -> Material group.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product Group'
  ProductGroup : String(9);

  /**
   * Unit of measure in which stocks of the material are managed. The system converts all the quantities you enter in other units of measure (alternative units of measure) to the base unit of measure.
   * 
   * You define the base unit of measure and also alternative units of measure and their conversion factors in the material master record.Since all data is updated in the base unit of measure, your entry is particularly important for the conversion of alternative units of measure. A quantity in the alternative unit of measure can only be shown precisely if its value can be shown with the decimal places available. To ensure this, please note the following:The base unit of measure is the unit satisfying the highest necessary requirement for precision.The conversion of alternative units of measure to the base unit should result in simple decimal fractions (not, for example, 1/3 = 0.333...).Inventory ManagementIn Inventory Management, the base unit of measure is the same as the stockkeeping unit.ServicesServices have units of measure of their own, including the following:Service unitUnit of measure at the higher item level. The precise quantities of the individual services are each at the detailed service line level.BlanketUnit of measure at service line level for services to be provided once only, and for which no precise quantities can or are to be specified.
   */
  @sap.label : 'Base Unit of Measure'
  @sap.semantics : 'unit-of-measure'
  BaseUnit : String(3);

  /**
   * Materials grouping that helps the system to determine item categories during sales document processing.
   * 
   * If a group is configured specific to distribution channel, it has priority if the corresponding activity is distribution channel-dependent.The system automatically suggests an item type in the document depending on the item category group you assign and the sales document type you are processing.In the standard system, there are normal items, items that signify services (and therefore need no delivery processing) and items that signify packing material, for example.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Gen. item cat. grp'
  @sap.quickinfo : 'General item category group'
  ItemCategoryGroup : String(4);

  /**
   * Alphanumeric character string for grouping together materials by combining different characteristics. It is used for analyses and price determination.
   * 
   * In the standard SAP System, the product hierarchy can have up to 3 levels, each with a specific number of characters.Level Number of characters allowed1 52 53 8You define a product hierarchy with the following levels:Level Example Description1 00005 Electrical goods2 00003 Wet appliances3 00000001 Washing machineIn this case, a washing machine belongs to the product hierarchy 000050000300000001.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product Hierarchy'
  ProductHierarchy : String(18);

  /**
   * A way of grouping materials, products, or services. The system uses divisions to determine the sales areas and the business areas for a material, product, or service.
   * 
   * A product or service is always assigned to just one division. From the point of view of sales and distribution, the use of divisions lets you organize your sales structure around groups of similar products or product lines. This allows the people in a division who process orders and service customers to specialize within a manageable area of expertise.If a sales organization sells food and non-food products through both retail and wholesaledistribution channels each distribution channel could then be further split into food and non-food divisions.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Division'
  Division : String(2);

  /**
   * Activation of the variable purchase order unit.
   * 
   * The information from the field in the material master record is adopted in the purchasing info record. In the purchase order and in the source list, you can enter an order unit that differs from the one in the purchasing info record.If you wish to specify a different order unit for a requisition, you must assign a source with a different order unit to the requisition.The field also determines whether you work with conditions for each order unit.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Var. Order Unit'
  @sap.quickinfo : 'Variable Purchase Order Unit Active'
  VarblPurOrdUnitIsActive : String(1);

  /**
   * Unit referring to the volume of the material.
   * 
   * If you specify a volume, you have to enter the corresponding volume unit here.
   */
  @sap.label : 'Volume Unit'
  @sap.semantics : 'unit-of-measure'
  VolumeUnit : String(3);

  /**
   * Space that the product occupies per unit of volume. The volume refers to the unit specified in the &quot;Volume unit&quot; field.
   * 
   * The volume and its unit always refer to the base unit of measure.
   */
  @sap.unit : 'VolumeUnit'
  @sap.label : 'Volume'
  MaterialVolume : Decimal(13, 3);

  /**
   * Identifies the materials that are controlled by the Brazilian Oil Agency.
   */
  @sap.display.format : 'NonNegative'
  @sap.label : 'ANP Code'
  ANPCode : String(9);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Brand'
  Brand : String(4);

  /**
   * Determines the rules on the replenishability of a material for distribution centers and stores.
   * 
   * The procurement rule appears in the assortment list for information only. It does not yet have a functional use.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Procurement rule'
  ProcurementRule : String(1);

  /**
   * Date indicating as of when an entry is valid.
   */
  @sap.display.format : 'Date'
  @sap.label : 'Valid From'
  @sap.quickinfo : 'Valid-From Date'
  ValidityStartDate : Date;

  /**
   * The lowest level that a material appears in any product structure of the company. The low-level code controls the sequence in which the material is planned in an MRP run: First the materials with low-level code 0 are planned, then the materials with low-level code 1, and so on. The lower the low-level code, the higher the number that is assigned to the material.
   * 
   * The level that is set in the material master record represents the level at which the material will be planned. This means that the material will only be planned once all assemblies in which it occurs have been planned and exploded.The low-level code is set internally in the material master record when the BOM is maintained.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Low-Level Code'
  LowLevelCode : String(3);

  /**
   * Generic material to which the prepack material is assigned.
   * 
   * This field is filled for prepack materials that were created using the prepack maintenance and the prepack planning transaction for a specific generic material.This field is only used by IS Retail.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Generic Material'
  @sap.quickinfo : 'Material Number of the Generic Material in Prepack Materials'
  ProdNoInGenProdInPrepackProd : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Serial No. Profile'
  @sap.quickinfo : 'Serial Number Profile'
  SerialIdentifierAssgmtProfile : String(4);

  /**
   * Text field that you can use as you like, for example, to record the size or dimensions of the material. The data you enter is merely for information and is not used by the system.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Size/dimensions'
  SizeOrDimensionText : String(32);

  /**
   * Description of the material in accordance with the appropriate industry standard (such as ANSI or ISO).
   * 
   * This field is purely for information.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Industry Std Desc.'
  @sap.quickinfo : 'Industry Standard Description (such as ANSI or ISO)'
  IndustryStandardName : String(18);

  /**
   * A standardized unit that uniquely identifies a product relating to a unit of measure or type of packaging.
   * 
   * The Global Trade Item Number(GTIN) is assigned by the manufacturer of the product. In this case, the GTIN identifies the manufacturer uniquely. A company can assign GTINs using &quot;in-store&quot; numbering techniques known only to the company.The equivalent of the GTIN in America is the Universal Product Code (UPC).
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'GTIN'
  @sap.quickinfo : 'Global Trade Item Number (EAN/UPC/GTIN)'
  ProductStandardID : String(18);

  /**
   * Defines how the system determines an International Article Number (EAN) to be assigned internally, and which check criteria (check digit, prefix, and so on) an EAN of this category must fulfil.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'EAN category'
  @sap.quickinfo : 'Category of International Article Number (EAN)'
  InternationalArticleNumberCat : String(2);

  /**
   * Indicator that determines whether the product is configurable.
   * 
   * If this indicator is set, you can assign a variant class to the product, making it possible to use it as a configurable product.This indicator can be set in one of the following ways:Manually in the product master record, irrespective of the product typeIn Customizing for the Material Master in the activity Define Attributes of Material TypesIn this case, the indicator is set automatically whenever you create a product of the corresponding material type. It is not possible to cancel the indicator manually in the product master record.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Configurable'
  @sap.quickinfo : 'Product is Configurable'
  ProductIsConfigurable : Boolean;

  /**
   * Specifies whether the material is managed in batches.
   * 
   * This indicator can be set in the material master record manually or, if batches are valuated individually, it is set automatically for the plants concerned.Note that the automatic setting of the indicator is based on the configuration that you make in Customizing for Batch Management under Specify Batch Management Default by Plant,. In this case, if you wish to change this default setting, you can select/deselect the indicator manually.The indicator cannot be changed if stocks exist in either the current period or in the previous period. The reason for checking the previous period is because stocks can be posted to this period when goods movements are entered.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Batch Management'
  @sap.quickinfo : 'Batch Management Requirement Indicator'
  IsBatchManagementRequired : Boolean;

  /**
   * Key that you can use to assign the product to an external product group or to a product group determined according to external systematics.
   * 
   * For example, you can store the CCG product group or Nielsen product group here.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Ext. Product Group'
  @sap.quickinfo : 'External Product Group'
  ExternalProductGroup : String(18);

  /**
   * Alphanumeric key uniquely identifying the configurable product.
   * 
   * Unlike the plant-specific configurable product, the cross-plant configurable product is valid for all plants.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Cross-plant CP'
  @sap.quickinfo : 'Cross-Plant Configurable Product'
  CrossPlantConfigurableProduct : String(40);

  /**
   * Level on which the serial number must be unique.
   * 
   * If the indicator is blank, then only the combination of the material- and serial number is unique.If the indicator is 1, the serial number and equipment number are kept synchronous; that is, when master records are created, the system always sets the equipment number the same as the serial number.In this way you can make the serial numbers unique on a client-wide scale. A prerequisite for this is that all material master records have the indicator set to 1.This indicator is plant wide, that is, the setting applies to all the plants of the corresponding material master record.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Serialization level'
  @sap.quickinfo : 'Level of Explicitness for Serial Number'
  SerialNoExplicitnessLevel : String(1);

  /**
   * Specifies the number used by the manufacturer, or also by the supplier, to manage a material.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Mfr Part Number'
  @sap.quickinfo : 'Manufacturer Part Number'
  ProductManufacturerNumber : String(40);

  /**
   * Specifies the manufacturer of the MPN material or the manufacturer's plant for which a manufacturer master record has been created.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Manufacturer'
  @sap.quickinfo : 'Manufacturer number'
  ManufacturerNumber : String(10);

  /**
   * Defines how you can work with MPN materials in the procurement process.
   * 
   * If you wish to work with MPN materials, enter a profile. The profile then applies to all MPN materials that are assigned to this firm's own, inventory-managed material.In the profile, you can specify that:Entry of the MPN material in the purchase order is mandatoryInfo records may only be created for the MPN materialThe system checks the approved manufacturer parts list when you enter an MPN material.In Customizing for the Material master, the indicator Manufacturer part number must be set. You can check this in the activity Make Global Settings.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Mfr part profile'
  ManufacturerPartProfile : String(4);

  /**
   * If you set this indicator, you should activate &quot;QM in procurement&quot; for all plants pertaining to a client.
   * 
   * If you activate the indicator for QM in procurement in the material master record at the client level, you must also store a control key at the plant level for quality management in procurement.If you activate the indicator for QM in procurement in the material master record at the client level, you must also store a control key at the plant level for quality management in procurement.Depending on the control indicators in the control key, you may have to maintain additional data.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'QM in Procur. Active'
  @sap.quickinfo : 'QM in Procurement Is Active'
  QltyMgmtInProcmtIsActive : Boolean;

  /**
   * Key that specifies the branch of industry to which the material is assigned.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Industry sector'
  IndustrySector : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Change Number'
  ChangeNumber : String(12);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Revision Level'
  MaterialRevisionLevel : String(2);

  /**
   * Indicator that specifies how materials are handled in the warehouse. The handling code could have the attribute Fragile, for example, and would therefore need to be stored in a special section of the warehouse.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Handling Indicator'
  HandlingIndicator : String(4);

  /**
   * Groups materials by warehousing points of view.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'WH Material Group'
  @sap.quickinfo : 'Warehouse Material Group'
  WarehouseProductGroup : String(4);

  /**
   * Describes the storage condition that should be used to store the material.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Whse Stor. Condition'
  @sap.quickinfo : 'Warehouse Storage Condition'
  WarehouseStorageCondition : String(2);

  /**
   * Describes the standard handling unit type for mixed handling units, where no packing instruction is used for creating the HU.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Standard HU Type'
  StandardHandlingUnitType : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Serial No. Profile'
  @sap.quickinfo : 'Serial Number Profile'
  SerialNumberProfile : String(4);

  /**
   * The adjustment profile is relevant in SCM/eWM. There, it determines how inbound delivery item quantities are to be distributed to outbound delivery order item quantities, and which inbound delivery items are relevant for adjustment according to the tolerance. The field for the adjustment method is part of the product master data in SCM/eWM.
   * 
   * If the ERP system is the system administrating the master data, the adjustment profile can also be defined in ERP and can be assigned on article level. Then, the adjustment profile will be transferred to SCM/eWM.Within your administrative context, you have to make sure that the adjustment profiles defined in ERP are identical to the adjustment profiles in SCM/eWM.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Adjust. Profile'
  @sap.quickinfo : 'Adjustment Profile'
  AdjustmentProfile : String(3);

  /**
   * The preferred alternative unit of measure is the unit in which you usually handle a product in the warehouse.
   * 
   * The preferred alternative unit of measure is used in various warehouse processes, such as the UoM proposal for the creation of inbound delivery items or in the stock removal rule.You can maintain the preferred alternative unit of measure in the product master on global level and on warehouse level. In the warehouse processes the global preferred alternative unit of measure is used unless a warehouse-specific one is maintained.The base unit of measure of a product is eaches. Sometimes cartons with ten eaches are delivered but most of the time you receive cartons with six eaches. You set cartons with six eaches as preferred alternative unit of measure.
   */
  @sap.label : 'Preferred UoM'
  @sap.quickinfo : 'Preferred Alternative UoM for Warehouse Operations'
  @sap.semantics : 'unit-of-measure'
  PreferredUnitOfMeasure : String(3);

  /**
   * The material is pilferable, and possibly requires special storage in a secure storage type/section within the warehouse.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Pilferable'
  IsPilferable : Boolean;

  /**
   * There is hazardous substance data for this material. The system has to read additional data because this hazardous substance is relevant for storage.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Relevant for HS'
  @sap.quickinfo : 'Relevant for Hazardous Substances'
  IsRelevantForHzdsSubstances : Boolean;
  @sap.label : 'Quarant. Per.'
  @sap.quickinfo : 'Quarantine Period'
  QuarantinePeriod : Decimal(3, 0);
  @sap.label : 'Time Unit'
  @sap.quickinfo : 'Time Unit for Quarantine Period'
  @sap.semantics : 'unit-of-measure'
  TimeUnitForQuarantinePeriod : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Quality Inspec. Grp'
  @sap.quickinfo : 'Quality Inspection Group'
  QualityInspectionGroup : String(4);

  /**
   * The authorization group enables you protect access to certain objects.
   * 
   * In order to carry out a specific activity, the user must have authorization for the combination of the activity and the authorization group.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Authorization Group'
  AuthorizationGroup : String(4);

  /**
   * This indicator shows that the object (such as BOM or document) was created or changed in a CAD system. Data transfer in the SAP system via CAD interface.
   * 
   * This indicator is only for information.However you can use it as search criteria for a document search. You can restrict the document search as follows:Entry DescriptionX find documents with a CAD indicatorfind documents without a CAD indicator* find documents with or without a CAD indicatorThis indicator is set using the CAD interface.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'CAD Indicator'
  DocumentIsCreatedByCAD : Boolean;

  /**
   * Describes the handling unit type of a packaging material.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Handling Unit Type'
  HandlingUnitType : String(4);

  /**
   * Flags all packaging materials for this packaging material type as packaging materials with a variable tare weight. If a change in the total weight occurs, then the tare weight is adjusted and not the loading weight.
   * 
   * Use this indicator if you cannot determine exactly the tare weight for packaging materials in this packaging material type, but the weights in your materials to be packed are relatively accurate.Individually constructed crates and pallets that do not comply with any standards.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Varb. Tare Weight'
  @sap.quickinfo : 'Variable Tare Weight'
  HasVariableTareWeight : Boolean;
  @sap.unit : 'UnitForMaxPackagingDimensions'
  @sap.label : 'Max. Pack. Length'
  @sap.quickinfo : 'Maximum Packing Length of Packaging Material'
  MaximumPackagingLength : Decimal(15, 3);
  @sap.unit : 'UnitForMaxPackagingDimensions'
  @sap.label : 'Max. Pack. Width'
  @sap.quickinfo : 'Maximum Packing Width of Packaging Material'
  MaximumPackagingWidth : Decimal(15, 3);
  @sap.unit : 'UnitForMaxPackagingDimensions'
  @sap.label : 'Max. Pack. Height'
  @sap.quickinfo : 'Maximum Packing Height of Packaging Material'
  MaximumPackagingHeight : Decimal(15, 3);
  @sap.label : 'Unit of Measurement'
  @sap.quickinfo : 'Unit of Measure for Maximum Packing Length/Width/Height'
  @sap.semantics : 'unit-of-measure'
  UnitForMaxPackagingDimensions : String(3);

  /**
   * Please add  an ON condition
   */
  to_Description : Association to many API_PRODUCT_SRV.A_ProductDescription {  };

  /**
   * Please add  an ON condition
   */
  to_Plant : Association to many API_PRODUCT_SRV.A_ProductPlant {  };

  /**
   * Please add  an ON condition
   */
  to_ProductBasicText : Association to many API_PRODUCT_SRV.A_ProductBasicText {  };

  /**
   * Please add  an ON condition
   */
  to_ProductInspectionText : Association to many API_PRODUCT_SRV.A_ProductInspectionText {  };

  /**
   * Please add  an ON condition
   */
  to_ProductProcurement : Association to API_PRODUCT_SRV.A_ProductProcurement {  };

  /**
   * Please add  an ON condition
   */
  to_ProductPurchaseText : Association to many API_PRODUCT_SRV.A_ProductPurchaseText {  };

  /**
   * Please add  an ON condition
   */
  to_ProductQualityMgmt : Association to API_PRODUCT_SRV.A_ProductQualityMgmt {  };

  /**
   * Please add  an ON condition
   */
  to_ProductSales : Association to API_PRODUCT_SRV.A_ProductSales {  };

  /**
   * Please add  an ON condition
   */
  to_ProductSalesTax : Association to many API_PRODUCT_SRV.A_ProductSalesTax {  };

  /**
   * Please add  an ON condition
   */
  to_ProductStorage : Association to API_PRODUCT_SRV.A_ProductStorage {  };

  /**
   * Please add  an ON condition
   */
  to_ProductUnitsOfMeasure : Association to many API_PRODUCT_SRV.A_ProductUnitsOfMeasure {  };

  /**
   * Please add  an ON condition
   */
  to_SalesDelivery : Association to many API_PRODUCT_SRV.A_ProductSalesDelivery {  };

  /**
   * Please add  an ON condition
   */
  to_Valuation : Association to many API_PRODUCT_SRV.A_ProductValuation {  };
};

@cds.persistence.skip : true
@sap.label : 'Basic Text'
@sap.content.version : '1'
entity API_PRODUCT_SRV.A_ProductBasicText {

  /**
   * Alphanumeric key uniquely identifying the material.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material'
  @sap.quickinfo : 'Material Number'
  key Product : String(40);

  /**
   * The language key indicates
   * 
   * - the language in which texts are displayed,- the language in which you enter texts,- the language in which the system prints texts.
   */
  @sap.label : 'Language Key'
  key Language : String(2);
  @sap.label : 'String'
  @sap.heading : ''
  LongText : LargeString;
};

@cds.persistence.skip : true
@sap.label : 'Product Description'
@sap.content.version : '1'
entity API_PRODUCT_SRV.A_ProductDescription {

  /**
   * Alphanumeric key uniquely identifying the product.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product'
  @sap.quickinfo : 'Product Number'
  key Product : String(40);

  /**
   * The language key indicates
   * 
   * - the language in which texts are displayed,- the language in which you enter texts,- the language in which the system prints texts.
   */
  @sap.label : 'Language Key'
  key Language : String(2);

  /**
   * Text containing up to 40 characters that describes the product in detail.
   * 
   * You can enter one product description in each of any number of languages.In principle, you enter the product description on the data screen of the first user department for which you enter data, and in your logon language. You can overwrite the product description on the Basic Data screen.
   */
  @sap.label : 'Product Description'
  ProductDescription : String(40);
};

@cds.persistence.skip : true
@sap.label : 'Inspection Text'
@sap.content.version : '1'
entity API_PRODUCT_SRV.A_ProductInspectionText {

  /**
   * Alphanumeric key uniquely identifying the material.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material'
  @sap.quickinfo : 'Material Number'
  key Product : String(40);

  /**
   * The language key indicates
   * 
   * - the language in which texts are displayed,- the language in which you enter texts,- the language in which the system prints texts.
   */
  @sap.label : 'Language Key'
  key Language : String(2);
  @sap.label : 'String'
  @sap.heading : ''
  LongText : LargeString;
};

@cds.persistence.skip : true
@sap.label : 'Material Ledger Account'
@sap.content.version : '1'
entity API_PRODUCT_SRV.A_ProductMLAccount {

  /**
   * Alphanumeric key uniquely identifying the material.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material'
  @sap.quickinfo : 'Material Number'
  key Product : String(40);

  /**
   * Organizational level at which the material is valuated. A valuation area can be one of the following:
   * 
   * PlantAll plants belonging to a company code, in which case the valuation area is the company code
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Valuation Area'
  key ValuationArea : String(4);

  /**
   * Uniquely identifies separately valuated stocks of a material.
   * 
   * The valuation types allowed for a material are determined by the valuation category.If a material is valuated according to its origin (valuation category H), you can define the possible countries of origin as valuation types.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Valuation Type'
  key ValuationType : String(10);
  @sap.label : 'Crcy Type/Valn View'
  @sap.quickinfo : 'External Currency Type and Valuation View'
  key CurrencyRole : String(2);

  /**
   * Currency key for amounts in the system.
   */
  @sap.label : 'Currency'
  @sap.quickinfo : 'Currency Key'
  @sap.semantics : 'currency-code'
  Currency : String(5);

  /**
   * Indicates the price control used to valuate the stock of a material. You have the following options:
   * 
   * Standard priceMoving average priceIf the material ledger is activated for the material, this indicator, together with the material's price determination indicator, determines at which of the following prices the material is valuated:Standard priceMoving average pricePeriodic unit price
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Price control'
  @sap.quickinfo : 'Price control indicator'
  ProductPriceControl : String(1);

  /**
   * Number of units of measure on which the price is based.
   * 
   * You can change the price unit in all valuations, both in the accounting view of the material master record and in the price change transaction (MR21).
   */
  @sap.label : 'Price unit'
  PriceUnitQty : Decimal(5, 0);

  /**
   * See: Moving average price/periodic unit price
   */
  @sap.unit : 'Currency'
  @sap.label : 'Per. unit price'
  @sap.quickinfo : 'Periodic unit price'
  MovingAveragePrice : Decimal(12, 3);

  /**
   * Standard price of a material.
   * 
   * If material inventories are valuated at standard prices, this will result in all goods movements being valuated at the same price over an extended period of time.Price differences when goods or invoices are received (such as when the purchase price is higher than the standard price) will be posted to price difference accounts. This does not change the standard price.
   */
  @sap.unit : 'Currency'
  @sap.label : 'Standard price'
  StandardPrice : Decimal(12, 3);
};

@cds.persistence.skip : true
@sap.label : 'Material Ledger Prices'
@sap.content.version : '1'
entity API_PRODUCT_SRV.A_ProductMLPrices {

  /**
   * Alphanumeric key uniquely identifying the material.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material'
  @sap.quickinfo : 'Material Number'
  key Product : String(40);

  /**
   * Organizational level at which the material is valuated. A valuation area can be one of the following:
   * 
   * PlantAll plants belonging to a company code, in which case the valuation area is the company code
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Valuation Area'
  key ValuationArea : String(4);

  /**
   * Uniquely identifies separately valuated stocks of a material.
   * 
   * The valuation types allowed for a material are determined by the valuation category.If a material is valuated according to its origin (valuation category H), you can define the possible countries of origin as valuation types.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Valuation Type'
  key ValuationType : String(10);
  @sap.label : 'Crcy Type/Valn View'
  @sap.quickinfo : 'External Currency Type and Valuation View'
  key CurrencyRole : String(2);

  /**
   * Currency key for amounts in the system.
   */
  @sap.label : 'Currency'
  @sap.quickinfo : 'Currency Key'
  @sap.semantics : 'currency-code'
  Currency : String(5);

  /**
   * Price at which the material will be valuated as from a precise date in the future.
   * 
   * The future standard price is valid as of the date you enter in the relevant field.Before the future price can become effective, you must activate it for material valuation.
   */
  @sap.unit : 'Currency'
  @sap.label : 'Future Price'
  FuturePrice : Decimal(12, 3);
  @sap.display.format : 'Date'
  @sap.label : 'Future Price From'
  @sap.quickinfo : 'Date from Which a Future Valuation Price Is to Be Valid'
  FuturePriceValidityStartDate : Date;
  @sap.unit : 'Currency'
  @sap.label : 'Cost'
  PlannedPrice : Decimal(24, 3);
};

@cds.persistence.skip : true
@sap.label : 'Plant Data'
@sap.content.version : '1'
entity API_PRODUCT_SRV.A_ProductPlant {

  /**
   * Alphanumeric key uniquely identifying the material.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material'
  @sap.quickinfo : 'Material Number'
  key Product : String(40);

  /**
   * Key uniquely identifying a plant.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Plant'
  key Plant : String(4);

  /**
   * Key for a buyer or a group of buyers, who is/are responsible for certain purchasing activities.
   * 
   * Internally, the purchasing group is responsible for the procurement of a material or a class of materials.Externally, it is the medium through which contacts with the vendor are maintained.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Purchasing Group'
  PurchasingGroup : String(3);

  /**
   * Key of the country in which the material has been produced.
   * 
   * You are legally required to specify the country of origin both for export and import.ExportYou prove the origin of a material by presenting the certificate of origin. This is issued and controlled by the relevant authority of the issuing country.This authority confirms the origin of a material and the required information with the certificate of origin.ImportThe relevant authority of the importing country - usually the Ministry of Economic Affairs - stipulates which regulations regarding customs and foreign trade law have to be observed for the certificates of origin accompanying goods.This information is used for foreign trade processing in different areas, such as:Foreign trade lawCustoms lawExample for Europe:Article 9 of the EU origin regulation is the legal regulation for the certificate of origin.The responsible authorities in Germany include:Chamber of Commerce (Industrie- und Handelskammer)Chamber of Handicrafts (Handwerkskammer)Customs office
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Cntry/Reg of Origin'
  @sap.quickinfo : 'Country/Region of Origin of Material (Non-Preferential Ori.)'
  CountryOfOrigin : String(3);

  /**
   * Describes more precisely the origin of goods.
   * 
   * You can enter a region of the country from which the goods originate.This information is required for the declarations regarding goods dispatches/imports and goods receipts/exports which are made to the authorities. Declarations to the authorities for foreign trade are a legal requirement in many countries.INTRASTAT - Declaration in the European UnionEXTRASTAT - Declaration in the European UnionIn the materials management document, the 'region of destination' field indicates the region of the receiving plant.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Region of Origin'
  @sap.quickinfo : 'Region of Origin of Material (Non-Preferential Origin)'
  RegionOfOrigin : String(3);

  /**
   * In the case of a material produced in-house, this is the key of the storage location that is copied to the planned order, production order, or run schedule quantity.
   * 
   * If the material is a component, it is the issuing storage location to which a backflush is posted.If the material is produced, it is the receiving storage location to which the receipt of the material is posted.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Prod. stor. location'
  @sap.quickinfo : 'Issue Storage Location'
  ProductionInvtryManagedLoc : String(4);

  /**
   * Indicates whether, for a specific plant, the material may be used in the following areas:
   * 
   * Materials management (for example, in purchasing and in inventory management)Production planning and controlPlant maintenanceWarehouse managementCosting with a quantity structureThe plant-specific material status restricts the usability of the material for the plant concerned, that is, it defines whether a warning or error message is displayed if you include the material in a particular function.The material may be a part under development or one to be discontinued.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Plant-Sp.Matl Status'
  @sap.quickinfo : 'Plant-Specific Material Status'
  ProfileCode : String(2);

  /**
   * Materials planning
   * 
   * The valid-from date of the material status is considered only if it precedes or is the same as the planning date; that is, if the valid-from date is later than the planning date, it is not considered, even if it is within the planning horizon.ExampleI<-------------Planning horizon------------->I-----I--------------------I-----------------------I-->Planning date Valid-from date TimeIn this case, the valid-from date is not considered in materials planning since it is later than the planning date.PurchasingThe valid-from date of the material status is checked against the current date.ExampleYou block the material for purchasing from May 1, xxxx. A purchase order is created for the material on April 28, xxxx with a delivery date of May 10, xxxx. In this case, the valid-from date May 1, xxxx is checked against the purchase order date April 28, xxxx and the purchase order is allowed. Had you created the purchase order on May 3, xxxx, an error message would have been issued.
   */
  @sap.display.format : 'Date'
  @sap.label : 'Valid From'
  @sap.quickinfo : 'Date from Which the Plant-Specific Material Status Is Valid'
  ProfileValidityStartDate : Date;

  /**
   * This field has two uses:
   * 
   * Specifies whether and how the system checks availability and generates requirements for materials planning.In Flexible Planning, defines - together with the checking rule - the different MRP elements that make up this key figure. The sum of these elements gives the key figure.Use 1: Availability Checking and Materials PlanningThe value you enter for use 1 (see above) is a default value which defines:Which MRP elements (for example, purchase orders, reservations) the system includes in the availability checkWhether the system checks availability only until the end of the replenishment lead time or whether it checks availability over the entire period for which MRP elements existWhether the system generates individual requirements or summarized requirements if you enter sales orders or deliveries for the materialUse 2: Flexible PlanningIf you use this field to define the MRP elements of a key figure for Flexible Planning, you must also select Document KF in the Customizing parameters of the information structure.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Availability check'
  @sap.quickinfo : 'Checking Group for Availability Check'
  AvailabilityCheckType : String(2);

  /**
   * The fiscal year variant is used to define the fiscal year.
   * 
   * You can define the following using a fiscal year variant:How many posting periods are in a fiscal yearHow many special periods you requireHow the system determines the posting periods when postingIn the definition, you allocate your posting periods to the calendar year.Allocation control requires the same number of posting periods in the company code and in the assigned controlling area.This means that the number of posting periods in the fiscal year variants must be the same in the company code and in the controlling area. The period limits for the two fiscal year variants must also coincide.You must define which fiscal year variant is to be used for each company code. To do this, you must define the appropriate fiscal year variant. It must contain no more than 16 periods.Note:The company codes delivered with the standard system are allocated to the fiscal year variant that corresponds to the calendar year and which also uses four special periods.You define fiscal year variants as well as the allocation of fiscal year variant to the company code in Financial Accounting customizing.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Fiscal Year Variant'
  FiscalYearVariant : String(2);

  /**
   * Indicator specifying the periods in which the material's consumption values and forecast values are managed.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Period Indicator'
  PeriodType : String(1);

  /**
   * Key which together with the controlling area uniquely identifies a profit center.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Profit Center'
  ProfitCenter : String(10);

  /**
   * Official code number based on the Harmonized Commodity Description and Coding System (HS).
   * 
   * The Harmonized System contains code numbers for all goods that an be transported across national or regional boundaries. Goods are coded according to this nomenclature when declaring the import or export of goods to the proper authorities. The specification of standard commodity codes in declarations enables the authority to tally the quantities of imported or exported goods of specific goods categories for statistical purposes (INTRASTAT).
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Commodity Code'
  Commodity : String(17);

  /**
   * Number of workdays required after receiving the material for inspection and placement into storage.
   */
  @sap.label : 'GR processing time'
  @sap.quickinfo : 'Goods receipt processing time in days'
  GoodsReceiptDuration : Decimal(3, 0);

  /**
   * The maintenance status records:
   * 
   * Which user departments may maintain a material master record of a particular material typeWhich user departments have already maintained the material master record at a particular hierarchy levelThe overall maintenance status is made up of the individual maintenance statuses. The individual maintenance statuses have the following meaning:User department Maintenance statusWork scheduling AAccounting BClassification CMRP DPurchasing EProduction resources/tools FCosting GBasic data KStorage LForecasting PQuality management QWarehouse management SSales VPlant stocks XStorage location stocks Z
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Maintenance status'
  MaintenanceStatusName : String(15);

  /**
   * If this indicator is set, the archive and delete program checks whether the material may be deleted at plant level, and deletes the data at this level and at all lower levels accordingly.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'DF at plant level'
  @sap.quickinfo : 'Flag Material for Deletion at Plant Level'
  IsMarkedForDeletion : Boolean;

  /**
   * Key that determines whether and how the material is planned. You have the following options:
   * 
   * Manual reorder point planningAutomatic reorder point planningForecast-based planningMaterial requirements planning with forecasts for unplanned consumptionMaster production scheduling (MPS)Demand-driven replenishment
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'MRP Type'
  MRPType : String(2);

  /**
   * Specifies the number of the MRP controller or group of MRP controllers responsible for material planning for the material.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'MRP Controller'
  MRPResponsible : String(3);

  /**
   * Indicator that classifies a material as an A, B, or C part according to its consumption value. This classification process is known as the ABC analysis.
   * 
   * The three indicators have the following meanings:A - important part, high consumption valueB - less important part, medium consumption valueC - relatively unimportant part, low consumption value
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'ABC Indicator'
  ABCIndicator : String(1);

  /**
   * Minimum procurement quantity
   */
  @sap.unit : 'BaseUnit'
  @sap.label : 'Minimum Lot Size'
  MinimumLotSizeQuantity : Decimal(13, 3);

  /**
   * Quantity that is not allowed to be exceeded during procurement.
   * 
   * The system takes this value into account during the automatic lot size calculation for planned orders and production orders. The lot size of the individual orders cannot exceed this value.
   */
  @sap.unit : 'BaseUnit'
  @sap.label : 'Maximum Lot Size'
  MaximumLotSizeQuantity : Decimal(13, 3);

  /**
   * Quantity that will be ordered or produced in the event of a shortage.
   * 
   * If the amount of the shortage is less than the fixed lot size, it is the fixed lot size that is ordered or produced (and not the lesser quantity that is actually required).If the amount of the shortage is greater than the fixed lot size, a multiple of the fixed lot size is procured. The system creates several purchase order proposals for this purpose.
   */
  @sap.unit : 'BaseUnit'
  @sap.label : 'Fixed lot size'
  FixedLotSizeQuantity : Decimal(13, 3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Control code'
  @sap.quickinfo : 'Control code for consumption taxes in foreign trade'
  ConsumptionTaxCtrlCode : String(16);

  /**
   * Indicator you can use to specify that the material can also be used as a co-product.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Co-product'
  @sap.quickinfo : 'Indicator: Material can be co-product'
  IsCoProduct : Boolean;

  /**
   * Number uniquely identifying the configurable product.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'ConfigurableProduct'
  @sap.quickinfo : 'Configurable Product'
  ProductIsConfigurable : String(40);

  /**
   * Specifies the stock determination group.
   * 
   * The stock determination group combined with the stock determination rule at plant level create a key for the stock determination strategy.You enter the stock determination group in the material master record at plant level and it controls a stock determination based on material.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Stock det. grp'
  @sap.quickinfo : 'Stock determination group'
  StockDeterminationGroup : String(4);
  @sap.unit : 'BaseUnit'
  StockInTransferQuantity : Decimal(13, 3);
  @sap.unit : 'BaseUnit'
  StockInTransitQuantity : Decimal(13, 3);

  /**
   * Specifies whether the product is subject to quality inspection (without inspection lot processing) and whether a goods receipt is posted to inspection stock. The indicator is copied to purchase order items and goods receipt items as a default value.
   * 
   * You can select this indicator, if no stock-relevant inspection type has been selected in the inspection setup, and therefore no stock-relevant inspection lots can be created.If you activate a stock-relevant inspection type, the entry in this field is deselected and can no longer be maintained. In this case, a corresponding indicator in the inspection type controls whether goods are posted to inspection stock.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Post to insp. stock'
  @sap.quickinfo : 'Has Post to Inspection Stock'
  HasPostToInspectionStock : Boolean;

  /**
   * Specifies whether the material is managed in batches.
   * 
   * This indicator can be set in the material master record manually or, if batches are valuated individually, it is set automatically for the plants concerned.Based on the settings that you maintain in Customizing for Batch Management under Specify Batch Level and Activate Status Management -> Batch Level if the batch level is set to Batch unique at material level, then the field is shown in the display mode, until batches are valuated at material level.If the batches are valuated at material level, then the indicator is set automatically for the corresponding plants as well. Note that the automatic setting of the indicator is based on the configuration that you make in Customizing for Batch Management under Specify Batch Management Default by Plant. In this case, if you wish to change this default setting, you can select/deselect the indicator manually.If the batch level is set to Batch unique at plant level, then the field becomes editable.The indicator cannot be changed if stocks exist in either the current period or in the previous period. The reason for checking the previous period is because stocks can be posted to this period when goods movements are entered.SAP Note 2564190
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Batch Mgmt Rqt(Plnt)'
  @sap.quickinfo : 'Batch Management Requirement Indicator for Plant'
  IsBatchManagementRequired : Boolean;

  /**
   * Freely definable four-digit key that provides unique identification for a serial number profile.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Serial No. Profile'
  @sap.quickinfo : 'Serial Number Profile'
  SerialNumberProfile : String(4);

  /**
   * Indicates that negative stocks of the material are allowed at the plant.
   * 
   * Negative stock balances can only result if they are allowed at the following levels:Valuation area levelStorage location levelMaterial level (plant data in the material master record)Negative stock levels are already allowed for special stocks if negative stocks have been activated in the valuation area and for the special stock in question in the plant. You do not have to activate them in each material master record.You can have negative balances in stocks of the types &quot;unrestricted-use&quot; and &quot;blocked&quot;.Negative balances are possible in the following special stocks:Vendor consignment (K)Stock of material provided to vendor (O)Consignment stock at customer (W)Sales order stock (E)Project stock (Q)Returnable packaging stock at customer (V)Returnable transport packaging (M)
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Neg. stocks in plant'
  @sap.quickinfo : 'Negative stocks allowed in plant'
  IsNegativeStockAllowed : Boolean;
  @sap.unit : 'BaseUnit'
  GoodsReceiptBlockedStockQty : Decimal(13, 3);

  /**
   * Controls whether a material is preferably procured for own stock or consignment stock at a plant.
   * 
   * You can set the values for consignment control that you defined in Customizing for consignment control.When you set consignment control, please note the following:The system only evaluates the setting if you have activated Retail consignment processingNote that the settings for the Consignment Control and Source of Supply fields have to be coordinated:If you set procurement for own stock in consignment control, the search sequence for the supply source has to begin with &quot;Normal&quot;.If you set procurement for consignment stock in consignment control, the search sequence for the supply source has to begin with &quot;Consignment&quot;.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Consign.Control'
  @sap.quickinfo : 'Consignment Control'
  HasConsignmentCtrl : String(1);
  @sap.display.format : 'NonNegative'
  FiscalYearCurrentPeriod : String(4);
  @sap.display.format : 'NonNegative'
  FiscalMonthCurrentPeriod : String(2);

  /**
   * Indicator that defines how the material is procured. The following procurements types are possible:
   * 
   * The material is produced in-house.The material is procured externally.The material can be both produced in-house and procured externally.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Procurement Type'
  ProcurementType : String(1);

  /**
   * Indicator that specifies that the material is managed in batches.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Batch Management'
  @sap.quickinfo : 'Batch management indicator (internal)'
  IsInternalBatchManaged : Boolean;

  /**
   * This is the CFOP category of a material.
   * 
   * The CFOP category is used to determine the proper CFOP.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Mat. CFOP category'
  @sap.quickinfo : 'Material CFOP category'
  ProductCFOPCategory : String(2);

  /**
   * Indicates that the product is relevant for excise tax.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Is Excise Tax Relevant'
  @sap.quickinfo : 'Excise Tax Relevance Indicator'
  ProductIsExciseTaxRelevant : Boolean;

  /**
   * Unit of measure in which stocks of the material are managed. The system converts all the quantities you enter in other units of measure (alternative units of measure) to the base unit of measure.
   * 
   * You define the base unit of measure and also alternative units of measure and their conversion factors in the material master record.Since all data is updated in the base unit of measure, your entry is particularly important for the conversion of alternative units of measure. A quantity in the alternative unit of measure can only be shown precisely if its value can be shown with the decimal places available. To ensure this, please note the following:The base unit of measure is the unit satisfying the highest necessary requirement for precision.The conversion of alternative units of measure to the base unit should result in simple decimal fractions (not, for example, 1/3 = 0.333...).Inventory ManagementIn Inventory Management, the base unit of measure is the same as the stockkeeping unit.ServicesServices have units of measure of their own, including the following:Service unitUnit of measure at the higher item level. The precise quantities of the individual services are each at the detailed service line level.BlanketUnit of measure at service line level for services to be provided once only, and for which no precise quantities can or are to be specified.
   */
  @sap.label : 'Base Unit of Measure'
  @sap.semantics : 'unit-of-measure'
  BaseUnit : String(3);

  /**
   * Number uniquely identifying the configurable material.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'ConfigurableMaterial'
  @sap.quickinfo : 'Configurable material'
  ConfigurableProduct : String(40);

  /**
   * Unit in which the material is issued from the warehouse.
   */
  @sap.label : 'Unit of issue'
  @sap.semantics : 'unit-of-measure'
  GoodsIssueUnit : String(3);

  /**
   * The material freight group is used to group materials so that they can be classifed according to freight code and class.
   * 
   * Freight codes and classes in a freight code set are determined by the material freight group. The freight code set is used to determine freight costs and for communication with service agents.Maintain the corresponding group for the material.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material freight grp'
  @sap.quickinfo : 'Material freight group'
  MaterialFreightGroup : String(8);

  /**
   * Material for which an original batch is created.
   * 
   * If you do not enter an original batch reference material (OB reference material), the system creates the original batch for the material in the production order item or the PO item.If you enter an OB reference material, the system creates the original batch for the OB reference material.If you are working with WIP batches, you can specify the reference material for a WIP batch in this field.You can enter the OB reference material at plant level (views Purchasing, Plant Data/Storage 1, or Work Scheduling), or at production version level (view MRP 4). If you enter different OB reference materials at each of the two levels, the system creates the original batch for the OB reference material entered in the production version.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'OB Reference Materl'
  @sap.quickinfo : 'Reference Material for Original Batches'
  OriginalBatchReferenceMaterial : String(40);

  /**
   * Specifies whether original batches may be created for this material.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'OB Management'
  @sap.quickinfo : 'Indicator for Original Batch Management'
  OriglBatchManagementIsRequired : String(1);

  /**
   * Specifies whether the material is a critical part, that is, a particularly important part.
   * 
   * In inventory sampling, critical parts are included in the complete-count area. The indicator is otherwise for your information only.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Critical Part'
  @sap.quickinfo : 'Indicator: Critical part'
  ProductIsCriticalPrt : Boolean;

  /**
   * Grouping of materials that are comparable with regard to their handling.
   * 
   * The logistics handling group is used in the calculation of working loads such as placement into stock and picking.Logistics handling groups are, for example, groups of materials with one or more of the following attributes:FragileDangerousBulkyLiquid
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Log. handling group'
  @sap.quickinfo : 'Logistics handling group for workload calculation'
  ProductLogisticsHandlingGroup : String(4);

  /**
   * Please add  an ON condition
   */
  to_PlantMRPArea : Association to many API_PRODUCT_SRV.A_ProductPlantMRPArea {  };

  /**
   * Please add  an ON condition
   */
  to_PlantQualityMgmt : Association to API_PRODUCT_SRV.A_ProductPlantQualityMgmt {  };

  /**
   * Please add  an ON condition
   */
  to_PlantSales : Association to API_PRODUCT_SRV.A_ProductPlantSales {  };

  /**
   * Please add  an ON condition
   */
  to_PlantStorage : Association to API_PRODUCT_SRV.A_ProductPlantStorage {  };

  /**
   * Please add  an ON condition
   */
  to_PlantText : Association to API_PRODUCT_SRV.A_ProductPlantText {  };

  /**
   * Please add  an ON condition
   */
  to_ProdPlantInternationalTrade : Association to API_PRODUCT_SRV.A_ProductPlantIntlTrd {  };

  /**
   * Please add  an ON condition
   */
  to_ProductPlantCosting : Association to API_PRODUCT_SRV.A_ProductPlantCosting {  };

  /**
   * Please add  an ON condition
   */
  to_ProductPlantForecast : Association to API_PRODUCT_SRV.A_ProductPlantForecasting {  };

  /**
   * Please add  an ON condition
   */
  to_ProductPlantProcurement : Association to API_PRODUCT_SRV.A_ProductPlantProcurement {  };

  /**
   * Please add  an ON condition
   */
  to_ProductSupplyPlanning : Association to API_PRODUCT_SRV.A_ProductSupplyPlanning {  };

  /**
   * Please add  an ON condition
   */
  to_ProductWorkScheduling : Association to API_PRODUCT_SRV.A_ProductWorkScheduling {  };

  /**
   * Please add  an ON condition
   */
  to_StorageLocation : Association to many API_PRODUCT_SRV.A_ProductStorageLocation {  };
};

@cds.persistence.skip : true
@sap.label : 'Costing Data at Plant Level'
@sap.content.version : '1'
entity API_PRODUCT_SRV.A_ProductPlantCosting {

  /**
   * Alphanumeric key uniquely identifying the product.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product'
  @sap.quickinfo : 'Product Number'
  key Product : String(40);

  /**
   * Key uniquely identifying a plant.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Plant'
  key Plant : String(4);

  /**
   * Indicator you can use to specify that the material can also be used as a co-product.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Co-product'
  @sap.quickinfo : 'Indicator: Material can be co-product'
  IsCoProduct : Boolean;

  /**
   * Lot size of the costed object (such as a material or sales order) used in the product cost estimate as the basis for costing.
   * 
   * The costing lot size in the material master record is usually used as a basis for costing all materials within one low-level code. If these materials (such as semi-finished products) are used in materials (such as finished products) in the next-highest low-level code, the costing results are converted to the costing lot size of the material costed (in this case, the finished product) to calculate the material costs for the finished product.In material costing and sales order costing, you can make a setting in the costing variant to have the system use the costing lot size of the highest material as a basis for costing the materials below it.
   */
  @sap.unit : 'BaseUnit'
  @sap.label : 'Costing Lot Size'
  @sap.quickinfo : 'Lot Size for Product Costing'
  CostingLotSize : Decimal(13, 3);

  /**
   * Key that controls variance calculation.
   * 
   * Variances can only be calculated for the orders for which a variance key has been entered. This key is defaulted through the costing view in the material master record.If you have activated variance calculation in the variance key, the value of the scrap is calculated at target cost and subtracted from the actual costs before the variances are determined.If you are working with cost object hierarchies, the cost object category determines how variances are calculated.If the costs collected at hierarchy level are distributed to the assigned orders (product cost collectors or manufacturing orders), you must enter a variance key in each order so that the R/3 System can calculate variances for the assigned orders.If the costs collected at the hierarchy level are settled as price differences, you must store a variance key in the cost object nodes and calculate variances for the entire cost object hierarchy.You select the control parameters for variance calculation through the variance key in the order or in the cost object hierarchy and a target version.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Variance Key'
  VarianceKey : String(6);

  /**
   * Unit of measure in which stocks of the material are managed. The system converts all the quantities you enter in other units of measure (alternative units of measure) to the base unit of measure.
   * 
   * You define the base unit of measure and also alternative units of measure and their conversion factors in the material master record.Since all data is updated in the base unit of measure, your entry is particularly important for the conversion of alternative units of measure. A quantity in the alternative unit of measure can only be shown precisely if its value can be shown with the decimal places available. To ensure this, please note the following:The base unit of measure is the unit satisfying the highest necessary requirement for precision.The conversion of alternative units of measure to the base unit should result in simple decimal fractions (not, for example, 1/3 = 0.333...).Inventory ManagementIn Inventory Management, the base unit of measure is the same as the stockkeeping unit.ServicesServices have units of measure of their own, including the following:Service unitUnit of measure at the higher item level. The precise quantities of the individual services are each at the detailed service line level.BlanketUnit of measure at service line level for services to be provided once only, and for which no precise quantities can or are to be specified.
   */
  @sap.label : 'Base Unit of Measure'
  @sap.semantics : 'unit-of-measure'
  BaseUnit : String(3);

  /**
   * This key and the task list group uniquely identify a task list.
   * 
   * In Production Planning and Control, for example, it serves to identify alternative production processes in task lists and is used to make a distinction between similar task lists.The group counter can be used to identify different lot-size ranges, for example.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Group Counter'
  TaskListGroupCounter : String(2);

  /**
   * Key identifying a group.
   * 
   * You can use groups, for example, to identify two routings that have different production steps for one material.Enter the group to which you want to restrict the selection.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Group'
  @sap.quickinfo : 'Key for Task List Group'
  TaskListGroup : String(8);

  /**
   * Key which classifies task lists according to their functionality.
   * 
   * Routings are defined under the following task list types:RoutingsReference operation setsMaster recipeGeneral maintenance task listEquipment task listInspection planTask list for funct. location
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Task List Type'
  TaskListType : String(1);

  /**
   * Key that determines the production version which is used to determine the quantity structure for the cost estimate.
   * 
   * With joint production, you can here enter an apportionment structure for a leading co-product, or for a differenct co-product the reference to a leading co-product or process material through which the quantity structure is to be determined.So that the quantity structure can be determined automatically using the production version, you must have selected the setting 2 (selection by production version) or 3 (selection only by production version) in the material master record in MRP view 4 under selection method. This is unnecessary if you entered the production version direct when you created the cost estimate or if it was entered direct in the material master record in costing view 1 under production version.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Production Version'
  @sap.quickinfo : 'Production Version To Be Costed'
  CostingProductionVersion : String(4);

  /**
   * indicates the material as a fixed price co-product.
   * 
   * A material marked as a fixed price co-product is not costed using a joint production process.If the material is an output material of a process with several co-products, the costs for the fixed price co-product are taken from the process costs using the net realizable-value method.Set this indicator if the material is a co-product, but the costs are not to be determined using an apportionment method; instead, a preset price is to be used for the material.The price for the fixed price co-product is taken from a cost estimate without quantity structure; alternatively, a price from the material master is used.You can only set this indicator if you have also set the co-product indicator for the material.Fixed-price co-products are shown in the itemization as items of category M (not A, as is the case with normal co-products), albeit with negative quantities and values.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Fixed-Price Co-Prod.'
  @sap.quickinfo : 'Fixed-Price Co-Product'
  IsFixedPriceCoProduct : Boolean;

  /**
   * Key that you use to specify the material's procurement type predetermined by the material type in more detail for costing.
   * 
   * If you enter a special procurement type in the Costing view of the material master record, it is used in costing.If you do not enter a special procurement type in the costing view of the material master record, the system uses the special procurement type in the MRP view.If you want to cost a material as externally procured by ignoring the existing quantity structure in the system when costing, the following options are available:· In the MRP view of the material master record, enter procurement type F and no special procurement type (neither in the MRP view nor in the Costing view).· In Customizing for Product Cost Planning, create a new special procurement type (procurement type: F and special procurement type: blank) and enter this special procurement type in the material's Costing view.If you want to cost a material by ignoring the BOM but including the routing, go to Customizing for Product Cost Planning and create a new special procurement type (procurement type: E; special procurement type: E) and enter this special procurement type in the material's Costing view.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Special Procurement Type'
  @sap.quickinfo : 'Special Procurement Type for Costing'
  CostingSpecialProcurementType : String(2);

  /**
   * Identifies one BOM in a BOM group.
   * 
   * One product or assembly can be described by a number of (alternative) BOMs that represent, for example, different manufacturing processes for different lot sizes. These alternative BOMs are grouped together as one multiple BOM.Alternatives are maintained separately for each BOM usage.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Alternative BOM'
  SourceBOMAlternative : String(2);

  /**
   * This key defines the area (such as engineering/design or production) where a BOM can be used.
   * 
   * By setting various indicators, you can define the maximum configuration of the item status and define whether an item must be or cannot be processed in a particular area (such as production).A material is used in the areas production and costing in a company. For each area, you maintain a separate BOM with different items:Production BOM:This BOM contains items that are relevant to production. These items are copied to the planned order. Dependent requirements are generated for them, and they are copied to the production order.Costing BOM:This BOM contains items that are relevant to determining the material costs of a product.When you calculate production costs using a quantity structure, the system automatically determines the BOM and all the BOM items that are relevant to costing, in order to calculate manufacturing costs.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'BOM Usage'
  ProductBOMUsage : String(1);

  /**
   * Controls whether a cost estimate or a procurement alternative can be created for a material.
   * 
   * If you select this indicator, you cannot create any of the following for this material:Material cost estimate (with and without quantity structure)Sales order costingProcurement alternativesThe material is excluded from selection and BOM explosion, so that no cost component split will be created by the costing process. If the material is included in another cost estimate as a component to be valuated, the valuation price is determined through the valuation variant if no cost estimate with the same key exists for the material.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Do Not Cost'
  ProductIsCostingRelevant : Boolean;
};

@cds.persistence.skip : true
@sap.label : 'Forecasting Data'
@sap.content.version : '1'
entity API_PRODUCT_SRV.A_ProductPlantForecasting {

  /**
   * Alphanumeric key uniquely identifying the product.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product'
  @sap.quickinfo : 'Product Number'
  key Product : String(40);

  /**
   * Key uniquely identifying a plant.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Plant'
  key Plant : String(4);

  /**
   * Date until which the consumption data of the reference material is used for the material forecast.
   * 
   * If you have defined a reference material, you must enter a validity date. Up to the specified validity date, the system accesses the consumption data of the reference material, from this date, it accesses the material's own consumption data.
   */
  @sap.display.format : 'Date'
  @sap.label : 'Date to'
  @sap.quickinfo : 'To date of the material to be copied for consumption'
  ConsumptionRefUsageEndDate : Date;

  /**
   * Determines how much of the consumption quantity of the reference material should be used for the material forecast.
   * 
   * If you want exactly 100 % of the consumption quantity of the reference material to be used for the forecast of this material, enter 1.If you want only 70 % of the consumption quantity of the reference material to be used for the forecast of this material, enter 0,7.
   */
  @sap.label : 'Multiplier'
  @sap.quickinfo : 'Multiplier for reference material for consumption'
  ConsumptionQtyMultiplier : Decimal(4, 2);

  /**
   * The system uses the consumption data of this material for the forecast.
   * 
   * This field exists for new materials which do not yet have their own consumption statistics that the system can use in the forecast. If you have defined a reference material, the system accesses the consumption data of this material up to the validity date that you specified for it.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'RefMatl: consumption'
  @sap.quickinfo : 'Reference material for consumption'
  ConsumptionReferenceProduct : String(40);

  /**
   * Plant of the reference material on whose consumption data the material forecast is based.
   * 
   * This field is intended for new materials without any consumption statistics for the system to access in the forecast. If you have defined a reference material, the system accesses the consumption data that exists for it in this plant and continues to do so up to the validity date specified by you.If no plant has been specified for the reference material, the system takes the plant for the material itself as the reference work automatically.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'RefPlant:consumption'
  @sap.quickinfo : 'Reference plant for consumption'
  ConsumptionReferencePlant : String(4);
};

@cds.persistence.skip : true
@sap.label : 'International Trade Data'
@sap.content.version : '1'
entity API_PRODUCT_SRV.A_ProductPlantIntlTrd {

  /**
   * Alphanumeric key uniquely identifying the product.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product'
  @sap.quickinfo : 'Product Number'
  key Product : String(40);

  /**
   * Key uniquely identifying a plant.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Plant'
  key Plant : String(4);

  /**
   * Key of the country/region in which the product has been produced.
   * 
   * You are legally required to specify the country/region of origin both for export and import.ExportYou prove the origin of a product by presenting the certificate of origin. This is issued and controlled by the relevant authority of the issuing country/region.This authority confirms the origin of a product and the required information with the certificate of origin.ImportThe relevant authority of the importing country/region - usually the Ministry of Economic Affairs - stipulates which regulations regarding customs and foreign trade law have to be observed for the certificates of origin accompanying goods.This information is used for foreign trade processing in different areas, such as:Foreign trade lawCustoms lawExample for Europe:Article 9 of the EU origin regulation is the legal regulation for the certificate of origin.The responsible authorities in Germany include:Chamber of Commerce (Industrie- und Handelskammer)Chamber of Handicrafts (Handwerkskammer)Customs office
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Country/Region of Origin'
  @sap.quickinfo : 'Country/Region of Origin of Product'
  CountryOfOrigin : String(3);

  /**
   * Describes more precisely the origin of goods.
   * 
   * You can enter a region of the country from which the goods originate.This information is required for the declarations regarding goods dispatches/imports and goods receipts/exports which are made to the authorities. Declarations to the authorities for foreign trade are a legal requirement in many countries.INTRASTAT - Declaration in the European UnionEXTRASTAT - Declaration in the European UnionIn the products management document, the 'region of destination' field indicates the region of the receiving plant.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Region of Origin'
  RegionOfOrigin : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Control code'
  @sap.quickinfo : 'Control code for consumption taxes in foreign trade'
  ConsumptionTaxCtrlCode : String(16);

  /**
   * Key from the list of descriptions given by the World Health Organization (WHO) for customs-free pharmaceutical materials.
   * 
   * Customs exemption applies for the following categories of pharmaceutical products:Pharmaceutical productsSalt, ester, hydrateProducts for manufacturing pharmaceutical materialsThe electronic customs tariff (Europe) displays additional codes for these pharmaceutical materials:2500 - Customs-free pharmaceutical materials2501 - All other goodsKN-Code : 2903 6990CAS-RN : 3312-04-7Description: 1-chlor-4.4-to(4-flourphenyl)butan
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'CAS number (pharm.)'
  @sap.quickinfo : 'CAS number for pharmaceutical products in foreign trade'
  ProductCASNumber : String(15);

  /**
   * Alphanumeric key which allows a systematic categorization of goods for production statistics.
   * 
   * In order to harmonize the production statistics in the EU member states, the Council of Ministers of the European Communities drew up EEC regulation No. 3429/91 on December 19, 1991. This regulation introduced a Community survey on the production of goods (EC No. L 374 of December 1991) and represents a legal basis which specifies the procedure to be used as well as the nomenclature of goods.The PRODCOM (PRODuction COMmunautaire) list items have been defined and classified according to the Harmonized System for describing and coding goods (HS) and the Combined Nomenclature for foreign trade.This allows a direct comparison of production and foreign trade statistics.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'PRODCOM no.'
  @sap.quickinfo : 'Production statistics: PRODCOM number for foreign trade'
  ProdIntlTradeClassification : String(9);

  /**
   * A grouping of materials with similar Intrastat requirements.
   * 
   * The system can use material groups during automatic creation of data for Intrastat declarations to determine business transaction types, procedures, and movement codes.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Intrastat Group'
  @sap.quickinfo : 'Material Group for Intrastat'
  ExportAndImportProductGroup : String(4);
};

@cds.persistence.skip : true
@sap.label : 'MRP Area Data'
@sap.content.version : '1'
entity API_PRODUCT_SRV.A_ProductPlantMRPArea {

  /**
   * Alphanumeric key uniquely identifying the material.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material'
  @sap.quickinfo : 'Material Number'
  key Product : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'MRP Area Plant'
  @sap.quickinfo : 'MRP Area: Plant'
  key Plant : String(4);

  /**
   * Number of the MRP area for which material requirements planning should be carried out separately.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'MRP Area'
  key MRPArea : String(10);

  /**
   * Key that determines whether and how the material is planned. You have the following options:
   * 
   * Manual reorder point planningAutomatic reorder point planningForecast-based planningMaterial requirements planning with forecasts for unplanned consumptionMaster production scheduling (MPS)Demand-driven replenishment
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'MRP Type'
  MRPType : String(2);

  /**
   * Specifies the number of the MRP controller or group of MRP controllers responsible for material planning for the material.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'MRP Controller'
  MRPResponsible : String(3);

  /**
   * The MRP group contains all the materials from the point of view of MRP for assigning special control parameters for the total planning run. These control parameters include, for example, the strategy group, the consumption mode, and the planning horizon.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'MRP Group'
  MRPGroup : String(4);

  /**
   * If the stock falls below this quantity, the system flags the material for requirements planning by creating a planning file entry.
   */
  @sap.unit : 'BaseUnit'
  @sap.label : 'Reorder Point'
  ReorderThresholdQuantity : Decimal(13, 3);

  /**
   * The planning time fence specifies a period within which no automatic changes are to be made to the master plan.
   * 
   * The planning time fence is maintained in workdays.It is only used for materials that are planned using an MRP type which includes a firming type.The firming type determines how order proposlas are to be created or scheduled within the planning time fence.
   */
  @sap.display.format : 'NonNegative'
  @sap.label : 'Planning time fence'
  PlanningTimeFence : String(3);

  /**
   * Key that determines which lot-sizing procedure the system uses within materials planning to calculate the quantity to be procured or produced.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Lot Sizing Procedure'
  @sap.quickinfo : 'Lot Sizing Procedure within Materials Planning'
  LotSizingProcedure : String(2);

  /**
   * Value to a multiple of which the system rounds up the procurement quantity.
   * 
   * The rounding value is used in the planning run if no rounding profile has been specified in the material master record.
   */
  @sap.unit : 'BaseUnit'
  @sap.label : 'Rounding value'
  @sap.quickinfo : 'Rounding value for purchase order quantity'
  LotSizeRoundingQuantity : Decimal(13, 3);

  /**
   * Minimum procurement quantity
   */
  @sap.unit : 'BaseUnit'
  @sap.label : 'Minimum Lot Size'
  MinimumLotSizeQuantity : Decimal(13, 3);

  /**
   * Quantity that is not allowed to be exceeded during procurement.
   * 
   * The system takes this value into account during the automatic lot size calculation for planned orders and production orders. The lot size of the individual orders cannot exceed this value.
   */
  @sap.unit : 'BaseUnit'
  @sap.label : 'Maximum Lot Size'
  MaximumLotSizeQuantity : Decimal(13, 3);

  /**
   * Quantity of the material in this plant that may not be exceeded.
   * 
   * In materials planning, the maximum stock level is used only if you have chosen Replenish to maximum stock level as the lot-sizing procedure; that is, you have entered HB as the lot size key.Enter a value if you have chosen Replenish to maximum stock level as the lot-sizing procedure.
   */
  @sap.unit : 'BaseUnit'
  @sap.label : 'Maximum Stock Level'
  MaximumStockQuantity : Decimal(13, 3);

  /**
   * Percentage scrap that occurs during production of the material if the material is an assembly.
   * 
   * The assembly scrap is used in materials planning to calculate the lot size of the assembly. The system increases the quantity to be produced by the scrap quantity calculated.If the material is an assembly, specify the percentage scrap as required.If the quantity to be produced is 200 pieces and you specify an assembly scrap of 10%, you are reckoning with a scrap quantity of 20 pieces. As a result, 220 pieces are produced.The system increases the quantity to be produced for all of the assembly's components accordingly.
   */
  @sap.label : 'Assembly scrap (%)'
  @sap.quickinfo : 'Assembly scrap in percent'
  AssemblyScrapPercent : Decimal(5, 2);

  /**
   * Allows you to define the procurement type more exactly. The system determines the procurement type from the material type.
   * 
   * You use special procurement when you want to be able to override the procurement type in the material master or define the procurement type more precisely.If the procurement type is in-house, you can nevertheless force the system to ignore the BOM and routing, and process the material as if it were externally procured, by specifying the special procurement as external.Enter the special procurement type to which you want to restrict the selection.If you procure a material externally, you may want to choose the special procurement type Consignment. If you produce the material in-house, it may be appropriate to choose Production in other plant.If a material has a routing but no BOM, it is treated as an externally procured material even if the procurement type is in-house. Both the BOM and the routing are ignored.However, if you specify the special procurement type as in-house, the routing is included even if the material has no BOM.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Special procurement'
  @sap.quickinfo : 'Special procurement type'
  ProcurementSubType : String(2);

  /**
   * Key of the storage location that is proposed in the purchase requisition in materials planning for subsequent storage of the material. In the case of a material procured externally, this storage location is proposed in the planned order in materials planning.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Storage loc. for EP'
  @sap.quickinfo : 'Default storage location for external procurement'
  DfltStorageLocationExtProcmt : String(4);

  /**
   * Three character number (numeric or using letters) that identifies a PPS planning calendar.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Planning Calendar'
  @sap.quickinfo : 'PPC Planning Calendar'
  MRPPlanningCalendar : String(3);

  /**
   * Specifies the quantity whose purpose is to satisfy unexpectedly high demand in the coverage period.
   * 
   * The risk of shortfalls is reduced by having a safety stock.
   */
  @sap.unit : 'BaseUnit'
  @sap.label : 'Safety Stock'
  SafetyStockQuantity : Decimal(13, 3);

  /**
   * The range of coverage profile contains the parameters for calculating the dynamic safety stock. This is a statistical calculation on the basis of average daily requirements.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Coverage profile'
  @sap.quickinfo : 'Range of coverage profile'
  RangeOfCvrgPrflCode : String(3);

  /**
   * In this field, you define the number of workdays for the safety time/actual range of coverage.
   * 
   * If you define a safety time, the requirements in MRP are brought forward on the time axis by the number of workdays you define here.This does not change the actual requirements dates. However, as the requirements have technically been brought forward, receipts are created for the earlier dates in MRP.Time-phased materials planning is based on the interval between the MRP date and the availabilty date of the next MRP date. By using the safety time/ actual range of coverage, the number of days to the interval are included in the calculation.
   */
  @sap.display.format : 'NonNegative'
  @sap.label : 'Safety Time'
  @sap.quickinfo : 'Safety Time (in Workdays)'
  SafetyDuration : String(2);

  /**
   * Quantity that will be ordered or produced in the event of a shortage.
   * 
   * If the amount of the shortage is less than the fixed lot size, it is the fixed lot size that is ordered or produced (and not the lesser quantity that is actually required).If the amount of the shortage is greater than the fixed lot size, a multiple of the fixed lot size is procured. The system creates several purchase order proposals for this purpose.
   */
  @sap.unit : 'BaseUnit'
  @sap.label : 'Fixed lot size'
  FixedLotSizeQuantity : Decimal(13, 3);

  /**
   * Costs that are incurred, irrespective of lot size, for each purchase order or production order over and above the purchase order price or production costs.
   * 
   * The ordering costs are used only for calculating the lot size in optimum lot-sizing procedures. You must specify the ordering costs in the currency of the company code belonging to the plant.
   */
  @sap.unit : 'Currency'
  @sap.label : 'LS-Independent Costs'
  @sap.quickinfo : 'Lot-Size-Independent Costs'
  LotSizeIndependentCosts : Decimal(12, 3);

  /**
   * Indicator that specifies the storage costs percentage the system uses when calculating the lot size to determine storage costs.
   * 
   * The storage costs percentage is based on the quantity stored and the unit price, and refers to the average value of the materials stored.The percentage is considered constant for the stocking-up period. It normally lies between 15 and 35%.The storage costs percentage is used by optimizing lot-sizing procedures to calculate the lot size, but not for any other purpose.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Storage Costs Code'
  @sap.quickinfo : 'Storage Costs Percentage Code'
  IsStorageCosts : String(1);

  /**
   * If a requirement quantity (for example, for capacity reasons) cannot be procured in a single lot, you have to schedule several receipts. In conjunction with the overlap indicator in the lot size, you can use the takt time to specify that these receipts are offset, that is, that they are delayed by the takt time.
   * 
   * You enter the takt time in workdays.The system uses the takt time if a requirement is covered by several receipt elements due to restrictions on lot size such as maximum lot size (with all lot-sizing procedures) or rounding value (with fixed lot size with splitting).
   */
  @sap.label : 'Takt time'
  RqmtQtyRcptTaktTmeInWrkgDays : Decimal(3, 0);

  /**
   * Percentage specifying what proportion of the requirement is to be covered by the warehouse stock.
   * 
   * The system uses the service level to calculate the safety stock.The higher the service level, the higher will be the safety stock calculated by the system to compensate for additional consumption or delays in delivery.
   */
  @sap.label : 'Service level (%)'
  @sap.quickinfo : 'Service level'
  SrvcLvl : Decimal(3, 1);

  /**
   * Indicator that allows you to flag a master record for deletion.
   * 
   * A reorganization program deletes the master record from the system if you have entered a delete flag for it in the master record.You cannot delete master records online.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Deletion Indicator'
  IsMarkedForDeletion : Boolean;

  /**
   * The period profile for the safety time / actual range of coverage contains the periods (stating to/from date) with the safety time/actual range of coverage that is valid for each period.
   * 
   * In order to smooth out seasonal fluctuations, for any definable period you can define a safety time/actual range of coverage that varies from what you have maintained in the material master in the field safety time/actual range of coverage. If, for example, a higher actual range of coverage than usual is required due to higher demand during the Christmas period, you can define the period with the desired actual range of coverage in the period profile.You can also use the period profile to represent a safety time of less than one day. You do this by entering a safety time % in addition to the safety time.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'STime period profile'
  @sap.quickinfo : 'Period Profile for Safety Time'
  PerdPrflForSftyTme : String(3);

  /**
   * This indicator controls whether dependent requirements are relevant to MRP or not. Dependent requirements include dependent reservations and stock transfer requirements.
   * 
   * You only use this indicator in connection with planning strategies for make-to-stock production, assembly planning. Note that the indicator Dependent requirements not relevant to MRP should only be used when, for example, planned independent requirements exist for an assembly. In this case, no receipt elements for the dependent requirements in MRP should be created as receipts have already been created for the planned independent requirements.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'MRP dep.requirements'
  @sap.quickinfo : 'MRP relevancy for dependent requirements'
  IsMRPDependentRqmt : String(1);

  /**
   * You use this indicator to switch on the safety time actual range of coverage for a material in MRP.
   * 
   * If you define a safety time, the requirements in MRP are brought forward on the time axis by the number of workdays you define here. The actual range of coverage corresponds to the number of days, by which the requirements are brought forward.Using this indicator you can activate the safety time and you can set whether all requirements or only independent requirements (sales order, planned independent requirements, and so on) are to be brought forward.The actual requirements dates are not changed.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Safety time ind.'
  @sap.quickinfo : 'Safety time indicator (with or without safety time)'
  IsSafetyTime : String(1);

  /**
   * Number of calendar days needed to obtain the material or service if it is procured externally.
   * 
   * If you have different vendors for a material, you must specify an average value. The same applies if you order the material from a fixed vendor that has varying delivery times.If you use the SAP Retail System, the planned delivery time can be suggested from the vendor sub-range in the vendor master record.
   */
  @sap.label : 'Planned Deliv. Time'
  @sap.quickinfo : 'Planned Delivery Time in Days'
  PlannedDeliveryDurationInDays : Decimal(3, 0);

  /**
   * Indicator that determines whether the planned delivery time is used in the MRP area.
   * 
   * You have maintained a planned delivery time in the MRP area. If the planned delivery time for the MRP area is to be used for the external procurement of material for the MRP area, you must set the value &quot;Use Planned Delivery Time MRP Area&quot;. Otherwise, the planned delivery time of the plant will be used.For stock transport requisitions (plant to a storage location MRP area of the same plant) the planned delivery time of the MRP area is only used if the indicator &quot;Consider Planned Delivery Time&quot; is set.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Consider PlDelTime'
  @sap.quickinfo : 'Consider Planned Delivery Time of the MRP Area'
  IsPlannedDeliveryTime : Boolean;

  /**
   * Currency key for amounts in the system.
   */
  @sap.label : 'Currency'
  @sap.quickinfo : 'Currency Key'
  @sap.semantics : 'currency-code'
  Currency : String(5);

  /**
   * Unit of measure in which stocks of the material are managed. The system converts all the quantities you enter in other units of measure (alternative units of measure) to the base unit of measure.
   * 
   * You define the base unit of measure and also alternative units of measure and their conversion factors in the material master record.Since all data is updated in the base unit of measure, your entry is particularly important for the conversion of alternative units of measure. A quantity in the alternative unit of measure can only be shown precisely if its value can be shown with the decimal places available. To ensure this, please note the following:The base unit of measure is the unit satisfying the highest necessary requirement for precision.The conversion of alternative units of measure to the base unit should result in simple decimal fractions (not, for example, 1/3 = 0.333...).Inventory ManagementIn Inventory Management, the base unit of measure is the same as the stockkeeping unit.ServicesServices have units of measure of their own, including the following:Service unitUnit of measure at the higher item level. The precise quantities of the individual services are each at the detailed service line level.BlanketUnit of measure at service line level for services to be provided once only, and for which no precise quantities can or are to be specified.
   */
  @sap.label : 'Base Unit of Measure'
  @sap.semantics : 'unit-of-measure'
  BaseUnit : String(3);

  /**
   * Key that determines the day on which the material is planned and ordered.
   * 
   * In addition to the planning cycle, you can enter a delivery cycle which is defined in the planning calendar field.It makes sense to enter a delivery cycle for the following situation:You carry out the planning run and place orders every Monday and Tuesday. The materials that are ordered on Monday are delivered on Wednesday and the materials that are ordered on Tuesday are not delivered until Friday.The system interprets an additionally specified planned delivery time as the minimum delivery time, which means that at least this number of days pass between the planning run or the order and delivery.Before a material can be planned with the time-phased planning procedure, it must be assigned the MRP type that allows time-phased planning.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Planning Cycle'
  PlanAndOrderDayDetermination : String(3);

  /**
   * Key that the system uses to adjust the order proposal quantity to deliverable units.
   * 
   * In Customizing, enter a threshold value from which the system should round up to the next value per deliverable unit:If the requirements value exceeds the first threshold value, the system always rounds up to the next multiple of the level foundIf the requirements value falls below the first threshold value, the system copies the original requirements value.Two other types of rounding exist:Dynamic rounding profile:These profiles are used to round up quantities to logistical units of measure (for example, layers). The contents of a logistical unit of measure does not have to be know when creating the rounding profile. It is determined by the master data from the material master.Rounding profile with quantity to be added/subtractedWith these profiles, the given quantity is changed either by adding a percentage or subtracting a percentage.Only static rounding profiles are taken into account in requirements planning. Neither dynamic rounding profiles not quantity addition/ subtraction are taken into account.A material's base unit of measure is 1 unit; the purchase order is to be delivered in layers (1 layer corresponds to 5 units) or in pallets (1 pallet corresponds to 8 layers which contains 40 units).You maintain the profile as follows:From a requirements of 2 units, the system is to round up to 5; from a requirement of 32 units, the system is to round up to 40.This results in the following order proposal quantities:Requirement from 1 -> 1 requirement from 31 -> 30Requirement from 2 -> 5 requirement from 32 -> 40Requirement from 6 -> 10 requirement from 74 -> 80Requirement from 7 -> 10If no rounding profile has been entered, the system uses the rounding value entered in the material master record for the planning run.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Rounding Profile'
  RoundingProfile : String(4);

  /**
   * In the case of a material produced in-house, this is the key of the storage location that is copied to the planned order, production order, or run schedule quantity.
   * 
   * If the material is a component, it is the issuing storage location to which a backflush is posted.If the material is produced, it is the receiving storage location to which the receipt of the material is posted.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Prod. stor. location'
  @sap.quickinfo : 'Issue Storage Location'
  StorageLocation : String(4);
};

@cds.persistence.skip : true
@sap.label : 'Procurement Data'
@sap.content.version : '1'
entity API_PRODUCT_SRV.A_ProductPlantProcurement {

  /**
   * Alphanumeric key uniquely identifying the product.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product'
  @sap.quickinfo : 'Product Number'
  key Product : String(40);

  /**
   * Key uniquely identifying a plant.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Plant'
  key Plant : String(4);

  /**
   * Defines that purchase orders are generated automatically when purchase requsisitions are converted into purchase orders.
   * 
   * If this indicator is flagged, the system does not display the purchase orders on the screen before they are saved.In the master record for the vendor with whom the material is ordered, the field &quot;Automatic purchase order&quot; must be flagged in the control data for the purchasing data.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Automatic PO'
  @sap.quickinfo : 'Indicator: &quot;automatic purchase order allowed&quot;'
  IsAutoPurOrdCreationAllowed : Boolean;

  /**
   * Specifies that the source list must have been maintained in the case of external procurement for a certain plant.
   * 
   * If the indicator has been set for a plant, a source of supply must be entered in the source list before a purchase order can be created for issue to the source for the plant.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Source list'
  @sap.quickinfo : 'Indicator: Source list requirement'
  IsSourceListRequired : Boolean;

  /**
   * Restricts the search for sources of supply for this material to external (normal) or internal (stock transfer) sources of supply, and also allows you to define a search sequence.
   * 
   * The entry you make is used by the system in source determination if it cannot find a unique source of supply in the quota arrangement and source list.If the plant to be supplied is assigned to a supply region, the system chooses a potential source of supply only if the source of supply is valid for the plant's supply region.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Source of supply'
  @sap.quickinfo : 'Source of Supply'
  SourceOfSupplyCategory : String(1);

  /**
   * Determines whether it is possible to generate JIT delivery schedules in addition to forecast schedules for a material specified in a purchase scheduling agreement.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'JIT Indicator'
  @sap.quickinfo : 'Indicator: Item Relevant to JIT Delivery Schedules'
  ItmIsRlvtToJITDelivSchedules : String(1);
};

@cds.persistence.skip : true
@sap.label : 'Quality Management Data'
@sap.content.version : '1'
entity API_PRODUCT_SRV.A_ProductPlantQualityMgmt {

  /**
   * Alphanumeric key uniquely identifying the product.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product'
  @sap.quickinfo : 'Product Number'
  key Product : String(40);

  /**
   * Key uniquely identifying a plant.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Plant'
  key Plant : String(4);

  /**
   * The longest amount of time allowed for storing the material.
   * 
   * The value displayed here is for informational purposes only. The field has no functional importance; in particular, there is no functional connection between this and the following fields:Minimum Remaining Shelf LifeTotal Shelf LifeStorage Percentage
   */
  @sap.label : 'Max. Storage Period'
  @sap.quickinfo : 'Maximum Storage Period'
  MaximumStoragePeriod : Decimal(5, 0);

  /**
   * This key determines which conditions are valid for quality management in procurement.
   * 
   * If you activate the indicator for QM in procurement in the material master record at the client level, you must also store a control key at the plant level for quality management in procurement.If you activate the indicator for QM in procurement in the material master record at the client level, you must also store a control key at the plant level for quality management in procurement.Depending on the control indicators in the control key, you may have to maintain additional data.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'QM Control Key'
  @sap.quickinfo : 'Control Key for Quality Management in Procurement'
  QualityMgmtCtrlKey : String(8);

  /**
   * The material authorization group restricts user access to material-related data in QM.
   * 
   * Relevant objects and activities in QM:Changing the material authorization group in the QM material masterIf you want to change the authorization group, you require the relevant authorization for this group.Processing inspection lotsProcessing inspection results (characteristic inspection results and defects data)Processing completion of the inspection and usage decisionMaintaining the quality levelMaintaining the quality information recordsWhen you enter a material authorization group in the material master record, the system checks (on a material basis) if the user has authorization for the objects named above.If there is no authorization group entered, no authorization check is carried out.In order to pass the authorization check, the user needs material authorization, which contains the relevant authorization group as the field value.Using the material authorization group, you can control which approvals should be issued during inspection lot processing.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'QM Material Auth.'
  @sap.quickinfo : 'Material Authorization Group for Activities in QM'
  MatlQualityAuthorizationGroup : String(6);

  /**
   * Specifies whether the product is subject to quality inspection (without inspection lot processing) and whether a goods receipt is posted to inspection stock. The indicator is copied to purchase order items and goods receipt items as a default value.
   * 
   * You can select this indicator, if no stock-relevant inspection type has been selected in the inspection setup, and therefore no stock-relevant inspection lots can be created.If you activate a stock-relevant inspection type, the entry in this field is deselected and can no longer be maintained. In this case, a corresponding indicator in the inspection type controls whether goods are posted to inspection stock.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Post to insp. stock'
  @sap.quickinfo : 'Has Post to Inspection Stock'
  HasPostToInspectionStock : Boolean;

  /**
   * Causes changes to inspection lots for this material to be documented by the system.
   * 
   * Changes to the inspection lot or usage decision are recorded by change documents and displayed in the change history for these objects.Status changes are recorded in status management and displayed in the status history.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Documentation reqd'
  @sap.quickinfo : 'Documentation required indicator'
  InspLotDocumentationIsRequired : Boolean;

  /**
   * As a customer in a supply relationship, you can define the requirements for the supplier's QM system using this identifier and the accompanying description.
   * 
   * If a material is activated for QM in procurement, the system initiates the following check whenever purchasing functions are carried out (for example, when a request for a quotation is made or if a purchase order is created):Whether the supplier's verified QM system, according to supplier master record or quality info record (for a combination of supplier/material) meets the requirements for QM systems as specified in the material master.When carrying out the check, the system relies on the defined assignments for target QM systems and actual QM systems in the Customizing application. When carrying out the check, the system relies on the assignments for target QM systems and actual QM systems defined in the configuration.If the check is unsuccessful, a warning message is issued when a request for quotation is initiated and an error message is issued for all other procurement activities.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Target QM System'
  @sap.quickinfo : 'Required QM System for Supplier'
  SuplrQualityManagementSystem : String(4);

  /**
   * Specifies the interval between different quality inspections.
   * 
   * If the interval for the recurring inspection has been defined in the material master record, the date of the next recurring inspection is entered automatically when creating a batch.
   */
  @sap.label : 'Inspection Interval'
  @sap.quickinfo : 'Interval Until Next Recurring Inspection'
  RecrrgInspIntervalTimeInDays : Decimal(5, 0);

  /**
   * Defines the content of a quality certificate.
   * 
   * In procurement, you can use the certificate type to control a number of functions that have been defined for the processing of certificate receipts. The certificate type is specified in the QM data of the material for this purpose.For certificate creation, you can use the certificate type to control the statuses in the certificate profile. The certificate type is specified in the certificate profile.The entry of a certificate type in the Quality Management view of the material only takes effect if you also set the indicator for the activation of QM in procurement.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Certificate Type'
  ProductQualityCertificateType : String(4);
};

@cds.persistence.skip : true
@sap.label : 'Sales Data at Plant Level'
@sap.content.version : '1'
entity API_PRODUCT_SRV.A_ProductPlantSales {

  /**
   * Alphanumeric key uniquely identifying the product.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product'
  @sap.quickinfo : 'Product Number'
  key Product : String(40);

  /**
   * Key uniquely identifying a plant.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Plant'
  key Plant : String(4);

  /**
   * A grouping of materials that share the same loading requirements.
   * 
   * The system uses the loading group, as well as the shipping conditions and the delivering plant, to automatically determine the item's shipping point.Different loading groups could consist, for example, of materials that require the same:Equipment during loading (for example, a fork-lift truck)Amount of time for loadingLoading point (for example, loading bay #6)
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Loading Group'
  LoadingGroup : String(4);

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
   * Quantity to which the shipping processing time refers. It is measured in the base unit of measure.
   */
  @sap.unit : 'BaseUnit'
  @sap.label : 'Base quantity'
  @sap.quickinfo : 'Base quantity for capacity planning in shipping'
  CapPlanningQuantityInBaseUoM : Decimal(13, 3);

  /**
   * Time that is needed in shipping to process a specific quantity of a material.
   * 
   * Loading the van that transports the material to the customer.The shipping processing time is used for capacity planning in shipping.It refers to the base quantity for capacity planning in shipping.
   */
  @sap.label : 'Processing time'
  @sap.quickinfo : 'Shipping processing time'
  ProductShippingProcessingTime : Decimal(5, 2);

  /**
   * The time needed in shipping to set up the work centers where the material is processed. It is independent of quantity.
   * 
   * Setting up the fork lift that loads the material onto the truck.Shipping setup time is used for capacity planning in shipping.
   */
  @sap.label : 'Setup time'
  @sap.quickinfo : 'Shipping setup time'
  WrkCentersShipgSetupTimeInDays : Decimal(5, 2);

  /**
   * This field has two uses:
   * 
   * Specifies whether and how the system checks availability and generates requirements for materials planning.In Flexible Planning, defines - together with the checking rule - the different MRP elements that make up this key figure. The sum of these elements gives the key figure.Use 1: Availability Checking and Materials PlanningThe value you enter for use 1 (see above) is a default value which defines:Which MRP elements (for example, purchase orders, reservations) the system includes in the availability checkWhether the system checks availability only until the end of the replenishment lead time or whether it checks availability over the entire period for which MRP elements existWhether the system generates individual requirements or summarized requirements if you enter sales orders or deliveries for the materialUse 2: Flexible PlanningIf you use this field to define the MRP elements of a key figure for Flexible Planning, you must also select Document KF in the Customizing parameters of the information structure.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Availability check'
  @sap.quickinfo : 'Checking Group for Availability Check'
  AvailabilityCheckType : String(2);

  /**
   * Unit of measure in which stocks of the material are managed. The system converts all the quantities you enter in other units of measure (alternative units of measure) to the base unit of measure.
   * 
   * You define the base unit of measure and also alternative units of measure and their conversion factors in the material master record.Since all data is updated in the base unit of measure, your entry is particularly important for the conversion of alternative units of measure. A quantity in the alternative unit of measure can only be shown precisely if its value can be shown with the decimal places available. To ensure this, please note the following:The base unit of measure is the unit satisfying the highest necessary requirement for precision.The conversion of alternative units of measure to the base unit should result in simple decimal fractions (not, for example, 1/3 = 0.333...).Inventory ManagementIn Inventory Management, the base unit of measure is the same as the stockkeeping unit.ServicesServices have units of measure of their own, including the following:Service unitUnit of measure at the higher item level. The precise quantities of the individual services are each at the detailed service line level.BlanketUnit of measure at service line level for services to be provided once only, and for which no precise quantities can or are to be specified.
   */
  @sap.label : 'Base Unit of Measure'
  @sap.semantics : 'unit-of-measure'
  BaseUnit : String(3);
};

@cds.persistence.skip : true
@sap.label : 'Storage Data at Plant Level'
@sap.content.version : '1'
entity API_PRODUCT_SRV.A_ProductPlantStorage {

  /**
   * Alphanumeric key uniquely identifying the product.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product'
  @sap.quickinfo : 'Product Number'
  key Product : String(40);

  /**
   * Key uniquely identifying a plant.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Plant'
  key Plant : String(4);

  /**
   * Indicates that the given material is subject to the cycle counting method of inventory.
   * 
   * The indicator also defines at which time intervals a physical inventory is to be carried out for the material.UsageThis indicator groups the materials together into various cycle counting categories. Usually, these categories correspond to the ABC analysis of the materials.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'CC Phys. Inv. Ind.'
  @sap.quickinfo : 'Physical Inventory Indicator for Cycle Counting'
  InventoryForCycleCountInd : String(1);

  /**
   * The service level defines the present (or also future) level of provision of a material for the stores.
   * 
   * The purpose of this field is to provide information for the replenishment list. It does not have any functional effect.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Service Level'
  @sap.quickinfo : 'IS-R service level'
  ProvisioningServiceLevel : String(1);

  /**
   * Specifies that the cycle counting indicator cannot be changed for cycle counting by an ABC analysis.
   * 
   * The only way to change this indicator is through manual maintenance of the material master record.Set this indicator if the material is always to remain in the specified cycle counting category.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'CC indicator fixed'
  @sap.quickinfo : 'CC indicator is fixed'
  CycleCountingIndicatorIsFixed : Boolean;

  /**
   * Unit in which the maximum storage period of the material is measured.
   */
  @sap.label : 'Time unit'
  @sap.quickinfo : 'Unit for maximum storage period'
  @sap.semantics : 'unit-of-measure'
  ProdMaximumStoragePeriodUnit : String(3);

  /**
   * Date for placement in storage and/or removal from storage in warehouse management (WM).
   * 
   * Placement in and removal from storage in WM can be controlled by various criteria, which make up the putaway strategy and stock removal strategy. You can use enhancements to enable customer-specific strategies. The expiration date, the goods receipt date, and the production date are relevant here.By using the rotation date, you can define which data is to be used for placement in storage and removal from storage, depending on the material and plant.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Putaway/StkRmvl'
  @sap.quickinfo : 'Strategy for Putaway and Stock Removal'
  WrhsMgmtPtwyAndStkRemovalStrgy : String(1);
};

@cds.persistence.skip : true
@sap.label : 'Plant Text'
@sap.content.version : '1'
entity API_PRODUCT_SRV.A_ProductPlantText {

  /**
   * Alphanumeric key uniquely identifying the material.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material'
  @sap.quickinfo : 'Material Number'
  key Product : String(40);

  /**
   * Key uniquely identifying a plant.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Plant'
  key Plant : String(4);
  @sap.label : 'String'
  @sap.heading : ''
  LongText : LargeString;
};

@cds.persistence.skip : true
@sap.label : 'Basic Procurement Data'
@sap.content.version : '1'
entity API_PRODUCT_SRV.A_ProductProcurement {

  /**
   * Alphanumeric key uniquely identifying the material.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material'
  @sap.quickinfo : 'Material Number'
  key Product : String(40);

  /**
   * Specifies the unit of measure in which the material is ordered.
   */
  @sap.label : 'Order Unit'
  @sap.quickinfo : 'Purchase Order Unit of Measure'
  @sap.semantics : 'unit-of-measure'
  PurchaseOrderQuantityUnit : String(3);

  /**
   * Activation of the variable purchase order unit.
   * 
   * The information from the field in the material master record is adopted in the purchasing info record. In the purchase order and in the source list, you can enter an order unit that differs from the one in the purchasing info record.If you wish to specify a different order unit for a requisition, you must assign a source with a different order unit to the requisition.The field also determines whether you work with conditions for each order unit.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Var. Order Unit'
  @sap.quickinfo : 'Variable Purchase Order Unit Active'
  VarblPurOrdUnitStatus : String(1);

  /**
   * Key defining the reminder days and tolerance limits valid, as well as the shipping instructions and order acknowledgment requirement of the material for Purchasing.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Purchasing value key'
  @sap.quickinfo : 'Purchasing Value Key'
  PurchasingAcknProfile : String(4);
};

@cds.persistence.skip : true
@sap.label : 'Purchase Text'
@sap.content.version : '1'
entity API_PRODUCT_SRV.A_ProductPurchaseText {

  /**
   * Alphanumeric key uniquely identifying the material.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material'
  @sap.quickinfo : 'Material Number'
  key Product : String(40);

  /**
   * The language key indicates
   * 
   * - the language in which texts are displayed,- the language in which you enter texts,- the language in which the system prints texts.
   */
  @sap.label : 'Language Key'
  key Language : String(2);
  @sap.label : 'String'
  @sap.heading : ''
  LongText : LargeString;
};

@cds.persistence.skip : true
@sap.label : 'Basic Quality Management Data'
@sap.content.version : '1'
entity API_PRODUCT_SRV.A_ProductQualityMgmt {

  /**
   * Alphanumeric key uniquely identifying the product.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product'
  @sap.quickinfo : 'Product Number'
  key Product : String(40);

  /**
   * If you set this indicator, you should activate &quot;QM in procurement&quot; for all plants pertaining to a client.
   * 
   * If you activate the indicator for QM in procurement in the material master record at the client level, you must also store a control key at the plant level for quality management in procurement.If you activate the indicator for QM in procurement in the material master record at the client level, you must also store a control key at the plant level for quality management in procurement.Depending on the control indicators in the control key, you may have to maintain additional data.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'QM in Procur. Active'
  @sap.quickinfo : 'QM in Procurement Is Active'
  QltyMgmtInProcmtIsActive : Boolean;
};

@cds.persistence.skip : true
@sap.label : 'Basic Sales Data'
@sap.content.version : '1'
entity API_PRODUCT_SRV.A_ProductSales {

  /**
   * Alphanumeric key uniquely identifying the material.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material'
  @sap.quickinfo : 'Material Number'
  key Product : String(40);

  /**
   * Indicates whether the material may be used in individual functions in Sales and Distribution for all distribution chains.
   * 
   * The cross-distribution-chain material status restricts the usability of the material for all the distribution chains, that is, it defines whether a warning or error message is displayed if you include the material in a particular function.The material may be a part under development or one to be discontinued.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'X-distr.chain status'
  @sap.quickinfo : 'Cross-distribution-chain material status'
  SalesStatus : String(2);

  /**
   * Date from which the cross-distribution-chain product status is valid.
   */
  @sap.display.format : 'Date'
  @sap.label : 'Cross-Distr. Chain Product Validity'
  @sap.quickinfo : 'Date from which the X-distr.-chain Product status is valid'
  SalesStatusValidityDate : Date;

  /**
   * Key that identifies the tax classification of a material.
   * 
   * The value entered here serves as the default value for the tax classification of the tax categories to be taken into account (for example, for the tax category value-added tax in Germany).
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax classification'
  @sap.quickinfo : 'Tax classification of the material'
  TaxClassification : String(1);

  /**
   * A grouping of materials that share the same route and transportation requirements.
   * 
   * Transportation groups are used for automatic route scheduling during sales order and delivery note processing.Suppose that you sell food products, some of which are perishable and require refrigeration. You create a transportation group that includes all the products that need refrigerated trucks for delivery.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Transportation Group'
  TransportationGroup : String(4);
};

@cds.persistence.skip : true
@sap.label : 'Sales Organization Data'
@sap.content.version : '1'
entity API_PRODUCT_SRV.A_ProductSalesDelivery {

  /**
   * Alphanumeric key uniquely identifying the product.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product'
  @sap.quickinfo : 'Product Number'
  key Product : String(40);

  /**
   * An organizational unit responsible for the sale of certain products or services. The responsibility of a sales organization may include legal liability for products and customer claims.
   * 
   * You can assign any number of distribution channels and divisions to a sales organization. A particular combination of sales organization, distribution channel, and division is known as a sales area.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales Organization'
  key ProductSalesOrg : String(4);

  /**
   * The way in which products or services reach the customer. Typical examples of distribution channels are wholesale, retail, or direct sales.
   * 
   * You can maintain information about customers and materials by sales organization and distribution channel. Within a sales organization you can deliver goods to a given customer through more than one distribution channel.You can assign a distribution channel to one or more sales organizations. If, for example, you have numerous sales organizations, each sales organization may use the &quot;Wholesale&quot; distribution channel.For each combination of sales organization and distribution channel, you can further assign one or more of the divisions that are defined for the sales organization. You can, for example, assign &quot;Food&quot; and &quot;Non-food&quot; divisions to the &quot;Wholesale&quot; distribution channel. A particular combination of sales organization, distribution channel, and division is known as a sales area.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Distribution Channel'
  key ProductDistributionChnl : String(2);

  /**
   * The minimum quantity a customer may order.
   */
  @sap.unit : 'BaseUnit'
  @sap.label : 'Minimum order qty'
  @sap.quickinfo : 'Minimum order quantity in base unit of measure'
  MinimumOrderQuantity : Decimal(13, 3);

  /**
   * Plant from which the goods should be delivered to the customer.
   * 
   * This plant is automatically copied into the sales order item as the default value.If there is no default value when you process the sales order item, enter a delivering plant.The value proposed in the item is eitherfrom the customer master record of the goods recipient, orfrom the material master recordThe system checks whether it can propose a value (and for your own plants, whether the material has been created in the plant). If the system can propose a value, the plant is copied to the sales order item where you can change it as required.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Delivering Plant'
  @sap.quickinfo : 'Delivering Plant (Own or External)'
  SupplyingPlant : String(4);

  /**
   * A way of grouping products to which you want to apply the same conditions.
   * 
   * You can create condition records for a product price group using the following condition types:Product price group (for example, all non-food products)A combination of customer and product price groupA combination of customer price group and product price group (for example, all wholesale customers and all non-food products)
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product Price Group'
  @sap.quickinfo : 'Product Pricing Group'
  PriceSpecificationProductGroup : String(2);

  /**
   * Group of materials with the same accounting requirements.
   * 
   * Used by the system when creating an accounting document from a billing document to determine the revenue or sales deduction account.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Acct Assmt Grp Mat.'
  @sap.quickinfo : 'Account Assignment Group for Material'
  AccountDetnProductGroup : String(2);

  /**
   * Minimum quantity that may be delivered to a customer.
   */
  @sap.unit : 'BaseUnit'
  @sap.label : 'Minimum Delivery Qty'
  @sap.quickinfo : 'Minimum Delivery Quantity in Delivery Note Processing'
  DeliveryNoteProcMinDelivQty : Decimal(13, 3);

  /**
   * A grouping of materials or products that the system uses to determine item categories during the processing of sales documents.
   * 
   * Depending on the item category group that you apply and the sales document type you are processing, the system automatically proposes an item category in the document.In the standard system, for example, there are standard items, items that represent services (and do not require delivery processing), and items that represent packaging materials.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Item Category Group'
  @sap.quickinfo : 'Item Category Group from Material Master'
  ItemCategoryGroup : String(4);

  /**
   * Unit of measure that refers to the delivery unit.
   * 
   * The delivery unit consists of a number and a unit of measure. In the case of a delivery unit of 30 pieces, 30, 60, 90, and so on pieces can be delivered, but not, however, 100 pieces.Enter a value in this field only if you want to use a unit of measure differing from the base unit of measure.If the field does not contain an entry, the system will assume that the unit of measure is the base unit of measure.
   */
  @sap.label : 'Unit of measure'
  @sap.quickinfo : 'Unit of measure of delivery unit'
  @sap.semantics : 'unit-of-measure'
  DeliveryQuantityUnit : String(3);

  /**
   * Only exact multiples of this number can be delivered.
   * 
   * The delivery unit consists of a number and a unit of measure. In the case of a delivery unit of 30 pieces, 30, 60, 90, and so on pieces can be delivered, but not, however, 100 pieces.
   */
  @sap.unit : 'DeliveryQuantityUnit'
  @sap.label : 'Delivery unit'
  DeliveryQuantity : Decimal(13, 3);

  /**
   * Indicates whether, for a specific distribution chain, the material may be used in individual functions in Sales.
   * 
   * The distribution-chain-specific material status restricts the usability of the material for the distribution chain concerned, that is, it defines whether a warning or error message is displayed if you include the material in a particular function.The material may be a part under development or one to be discontinued.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'DChain-spec. status'
  @sap.quickinfo : 'Distribution-chain-specific material status'
  ProductSalesStatus : String(2);
  @sap.display.format : 'Date'
  @sap.label : 'Valid from'
  @sap.quickinfo : 'Date from which distr.-chain-spec. material status is valid'
  ProductSalesStatusValidityDate : Date;

  /**
   * Unit of measure in which the material is sold.
   */
  @sap.label : 'Sales Unit'
  @sap.semantics : 'unit-of-measure'
  SalesMeasureUnit : String(3);

  /**
   * If this indicator is set, the archive and delete program checks whether the material may be deleted at distribution chain level, and deletes the data at this level.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'DF distr. chain lvl'
  @sap.quickinfo : 'Ind.: Flag material for deletion at distribution chain level'
  IsMarkedForDeletion : Boolean;

  /**
   * Alphanumeric character string for grouping together materials by combining different characteristics. It is used for analyses and price determination.
   * 
   * In the standard SAP System, the product hierarchy can have up to 3 levels, each with a specific number of characters.Level Number of characters allowed1 52 53 8You define a product hierarchy with the following levels:Level Example Description1 00005 Electrical goods2 00003 Wet appliances3 00000001 Washing machineIn this case, a washing machine belongs to the product hierarchy 000050000300000001.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product Hierarchy'
  ProductHierarchy : String(18);

  /**
   * You can use product groups when maintaining a product master record. Since these product groups are not used in the standard SAP System, you can use them as required, for example, for analyses.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product Group 1'
  FirstSalesSpecProductGroup : String(3);

  /**
   * You can use product groups when maintaining a product master record. Since these product groups are not used in the standard SAP System, you can use them as required, for example, for analyses.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product Group 2'
  SecondSalesSpecProductGroup : String(3);

  /**
   * You can use product groups when maintaining a product master record. Since these product groups are not used in the standard SAP System, you can use them as required, for example, for analyses.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product Group 3'
  ThirdSalesSpecProductGroup : String(3);

  /**
   * You can use product groups when maintaining a product master record. Since these product groups are not used in the standard SAP System, you can use them as required, for example, for analyses.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product Group 4'
  FourthSalesSpecProductGroup : String(3);

  /**
   * You can use product groups when maintaining a product master record. Since these product groups are not used in the standard SAP System, you can use them as required, for example, for analyses.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product Group 5'
  FifthSalesSpecProductGroup : String(3);

  /**
   * Minimum quantity allowed when the material is made to order.
   * 
   * If the order quantity exceeds an exact multiple of the minimum make-to-order quantity, the system indicates the unplanned additional requirements when it processes the order.
   */
  @sap.unit : 'BaseUnit'
  @sap.label : 'Min. MtO quantity'
  @sap.quickinfo : 'Minimum make-to-order quantity'
  MinimumMakeToOrderOrderQty : Decimal(13, 3);

  /**
   * Unit of measure in which stocks of the material are managed. The system converts all the quantities you enter in other units of measure (alternative units of measure) to the base unit of measure.
   * 
   * You define the base unit of measure and also alternative units of measure and their conversion factors in the material master record.Since all data is updated in the base unit of measure, your entry is particularly important for the conversion of alternative units of measure. A quantity in the alternative unit of measure can only be shown precisely if its value can be shown with the decimal places available. To ensure this, please note the following:The base unit of measure is the unit satisfying the highest necessary requirement for precision.The conversion of alternative units of measure to the base unit should result in simple decimal fractions (not, for example, 1/3 = 0.333...).Inventory ManagementIn Inventory Management, the base unit of measure is the same as the stockkeeping unit.ServicesServices have units of measure of their own, including the following:Service unitUnit of measure at the higher item level. The precise quantities of the individual services are each at the detailed service line level.BlanketUnit of measure at service line level for services to be provided once only, and for which no precise quantities can or are to be specified.
   */
  @sap.label : 'Base Unit of Measure'
  @sap.semantics : 'unit-of-measure'
  BaseUnit : String(3);

  /**
   * Specifies a statistics group for this and helps determine which data the system updates in the logistics information system.
   * 
   * You can assign statistics groups to each of the following:Item categorySales document typeCustomerMaterialWhen you generate statistics in the logistics information system, the system uses the combination of specified statistics groups to determine the appropriate update sequence. The update sequence in turn determines for exactly which fields the statistics are generated.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Matl statistics grp'
  @sap.quickinfo : 'Material statistics group'
  LogisticsStatisticsGroup : String(1);

  /**
   * Group definition that can be used for rebate settlement.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Volume Rebate Group'
  @sap.quickinfo : 'Volume rebate group'
  VolumeRebateGroup : String(2);

  /**
   * Commission group to which the material is assigned.
   * 
   * You can assign two materials to the same commission group as long as each representative who sells these materials receives the same commission percentage for both materials. In other words, the commission percentages within a commission group are always the same for any one representative but may vary for different representatives.Material Rep. 1 Rep. 2 Rep. 3A 5 % 10 % 11 %B 5 % 10 % 11 %Materials A and B are sold by these three representatives only. You can therefore assign them to the same commission group.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Commission Group'
  ProductCommissionGroup : String(2);

  /**
   * Indicator that specifies whether this material qualifies for a cash discount.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Cash Discount'
  @sap.quickinfo : 'Cash Discount Indicator'
  CashDiscountIsDeductible : Boolean;

  /**
   * Material master record that the system uses as a reference for pricing purposes.
   * 
   * The conditions that apply to the pricing reference material also apply to the material in whose material master record the pricing reference material is stored.A pricing reference material must always have its own material master record.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Pricing Ref. Matl'
  @sap.quickinfo : 'Pricing Reference Material'
  PricingReferenceProduct : String(40);

  /**
   * Key that the system uses to adjust the order proposal quantity to deliverable units.
   * 
   * In Customizing, enter a threshold value from which the system should round up to the next value per deliverable unit:If the requirements value exceeds the first threshold value, the system always rounds up to the next multiple of the level foundIf the requirements value falls below the first threshold value, the system copies the original requirements value.Two other types of rounding exist:Dynamic rounding profile:These profiles are used to round up quantities to logistical units of measure (for example, layers). The contents of a logistical unit of measure does not have to be know when creating the rounding profile. It is determined by the master data from the material master.Rounding profile with quantity to be added/subtractedWith these profiles, the given quantity is changed either by adding a percentage or subtracting a percentage.Only static rounding profiles are taken into account in requirements planning. Neither dynamic rounding profiles not quantity addition/ subtraction are taken into account.A material's base unit of measure is 1 unit; the purchase order is to be delivered in layers (1 layer corresponds to 5 units) or in pallets (1 pallet corresponds to 8 layers which contains 40 units).You maintain the profile as follows:From a requirements of 2 units, the system is to round up to 5; from a requirement of 32 units, the system is to round up to 40.This results in the following order proposal quantities:Requirement from 1 -> 1 requirement from 31 -> 30Requirement from 2 -> 5 requirement from 32 -> 40Requirement from 6 -> 10 requirement from 74 -> 80Requirement from 7 -> 10If no rounding profile has been entered, the system uses the rounding value entered in the material master record for the planning run.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Rounding Profile'
  RoundingProfile : String(4);

  /**
   * Key that you can use for grouping several units of measure.
   * 
   * You can use the unit of measure group, for example, to define allowed units of measure for a particular material for a vendor or a receiver. This is of significance for when rounding with the dynamic rounding profile if 'check vendor' or 'check customer' is selected in the rounding profiles. In this case, only those units of measure are included in rounding that are defined in the unit of measure group.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Unit of Measure Grp'
  @sap.quickinfo : 'Unit of Measure Group'
  ProductUnitGroup : String(4);

  /**
   * You can maintain the sales unit for each material and sales organization/distribution channel. The sales unit is proposed in Sales and Distribution (SD) documents such as sales orders. If a variable sales unit is not allowed, the unit specified in documents may not differ from that in the master record.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales unit not var.'
  @sap.quickinfo : 'Variable Sales Unit Not Allowed'
  VariableSalesUnitIsNotAllowed : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product Attribute 1'
  @sap.quickinfo : 'ID for product attribute 1'
  ProductHasAttributeID01 : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product Attribute 2'
  @sap.quickinfo : 'ID for product attribute 2'
  ProductHasAttributeID02 : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product Attribute 3'
  @sap.quickinfo : 'ID for product attribute 3'
  ProductHasAttributeID03 : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product Attribute 4'
  @sap.quickinfo : 'ID for product attribute 4'
  ProductHasAttributeID04 : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product Attribute 5'
  @sap.quickinfo : 'ID for product attribute 5'
  ProductHasAttributeID05 : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product Attribute 6'
  @sap.quickinfo : 'ID for product attribute 6'
  ProductHasAttributeID06 : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product Attribute 7'
  @sap.quickinfo : 'ID for product attribute 7'
  ProductHasAttributeID07 : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product Attribute 8'
  @sap.quickinfo : 'ID for product attribute 8'
  ProductHasAttributeID08 : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product Attribute 9'
  @sap.quickinfo : 'ID for product attribute 9'
  ProductHasAttributeID09 : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product Attribute 10'
  @sap.quickinfo : 'ID for product attribute 10'
  ProductHasAttributeID10 : Boolean;

  /**
   * Please add  an ON condition
   */
  to_SalesTax : Association to many API_PRODUCT_SRV.A_ProductSalesTax {  };

  /**
   * Please add  an ON condition
   */
  to_SalesText : Association to many API_PRODUCT_SRV.A_ProductSalesText {  };
};

@cds.persistence.skip : true
@sap.label : 'Sales Tax Data'
@sap.content.version : '1'
entity API_PRODUCT_SRV.A_ProductSalesTax {

  /**
   * Alphanumeric key uniquely identifying the product.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product'
  @sap.quickinfo : 'Product Number'
  key Product : String(40);

  /**
   * Identifies the country or region in which the delivery originates.
   * 
   * You can define the country/region key in a table. As a rule, it is a good idea to use the existing international standards for identifying vehicles from different countries or regions (for example: USA = United States, I = Italy, and so on). The system uses the key to do the following:Help determine the relevant taxes during pricingDetermine important country or region-specific standards (the length of postal codes and bank account numbers, for example)
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Departure Ctry/Reg.'
  @sap.quickinfo : 'Departure Country/Region (from which the goods are sent)'
  key Country : String(3);

  /**
   * Identifies the condition that the system uses to automatically determine country-specific taxes during pricing.
   * 
   * You can define one or more tax categories for each country. During sales order processing, the system applies the tax category according tothe geographical location of your delivering plant and the location of the customer receiving the goodstax classifications in the customer master record and the material master record.In the USA, for example, you can define tax categories for Federal Sales Tax and Federal Excise Tax. In the U.K., you can define a tax category for Value Added Tax (VAT).
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Category'
  @sap.quickinfo : 'Tax category (sales tax, federal sales tax,...)'
  key TaxCategory : String(4);
  key TaxClassification : String(1);
};

@cds.persistence.skip : true
@sap.label : 'Sales Text'
@sap.content.version : '1'
entity API_PRODUCT_SRV.A_ProductSalesText {

  /**
   * Alphanumeric key uniquely identifying the product.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product'
  @sap.quickinfo : 'Product Number'
  key Product : String(40);

  /**
   * An organizational unit responsible for the sale of certain products or services. The responsibility of a sales organization may include legal liability for products and customer claims.
   * 
   * You can assign any number of distribution channels and divisions to a sales organization. A particular combination of sales organization, distribution channel, and division is known as a sales area.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales Organization'
  key ProductSalesOrg : String(4);

  /**
   * The way in which products or services reach the customer. Typical examples of distribution channels are wholesale, retail, or direct sales.
   * 
   * You can maintain information about customers and products by sales organization and distribution channel. Within a sales organization you can deliver goods to a given customer through more than one distribution channel.You can assign a distribution channel to one or more sales organizations. If, for example, you have numerous sales organizations, each sales organization may use the &quot;Wholesale&quot; distribution channel.For each combination of sales organization and distribution channel, you can further assign one or more of the divisions that are defined for the sales organization. You can, for example, assign &quot;Food&quot; and &quot;Non-food&quot; divisions to the &quot;Wholesale&quot; distribution channel. A particular combination of sales organization, distribution channel, and division is known as a sales area.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Distribution Channel'
  key ProductDistributionChnl : String(2);

  /**
   * The language key indicates
   * 
   * - the language in which texts are displayed,- the language in which you enter texts,- the language in which the system prints texts.
   */
  @sap.label : 'Language Key'
  key Language : String(2);
  @sap.label : 'String'
  @sap.heading : ''
  LongText : LargeString;
};

@cds.persistence.skip : true
@sap.label : 'Basic Storage Data'
@sap.content.version : '1'
entity API_PRODUCT_SRV.A_ProductStorage {

  /**
   * Alphanumeric key uniquely identifying the material.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material'
  @sap.quickinfo : 'Material Number'
  key Product : String(40);

  /**
   * Indicates what storage conditions are required for the material.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Storage conditions'
  StorageConditions : String(2);

  /**
   * Indicates the temperature conditions in which the material should be stored.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Temp. conditions'
  @sap.quickinfo : 'Temperature conditions indicator'
  TemperatureConditionInd : String(2);

  /**
   * Number that identifies the material as a hazardous material or as dangerous goods and assigns hazardous material data or dangerous goods data to it.
   * 
   * The hazardous material number indicates that the material is dangerous, making special precautions necessary for its storage and shipment.You can enter region-specific hazardous material data or dangerous goods data separately under one hazardous material number.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Haz. material number'
  @sap.quickinfo : 'Hazardous material number'
  HazardousMaterialNumber : String(40);

  /**
   * Specifies which quantity of the material, in the unit of entry, usually constitutes a pallet load.
   * 
   * In the case of a goods receipt with reference to a purchase order or production order, the system automatically calculates the number of GR/GI slips to be printed for the material document item as a quotient from the goods receipt quantity and the quantity defined here.The value determined is always rounded up to the next higher whole number.If you enter nothing in this field, the material document item is only printed on one goods receipt/issue slip.
   */
  @sap.unit : 'BaseUnit'
  @sap.label : 'GR slips quantity'
  @sap.quickinfo : 'Quantity: Number of GR/GI slips to be printed'
  NmbrOfGROrGISlipsToPrintQty : Decimal(13, 3);

  /**
   * Determines the way labels are created. The label type specifies, for example, whether labels are preprinted by the supplier or created on a central printer.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Label type'
  LabelType : String(2);

  /**
   * Determines the size and layout of the label. The label form specifies, for example, whether the label is an adhesive or a pin-on label.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Label form'
  LabelForm : String(2);

  /**
   * Minimum amount of time for which the material must keep upon goods receipt for the goods receipt to be accepted by the system.
   * 
   * The period (day, week, month, year) depends on the entry in the Period indicator field.
   */
  @sap.label : 'Min. Rem. Shelf Life'
  @sap.quickinfo : 'Minimum Remaining Shelf Life'
  MinRemainingShelfLife : Decimal(4, 0);

  /**
   * Indicator for the shelf life expiration date or expiration date.
   * 
   * In batch management, the shelf life expiration date or expiration date can be specified. You select the date type you want by using this indicator.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Expiration Date'
  ExpirationDate : String(1);

  /**
   * The period indicator specifies the unit of measurement for a period of time.
   * 
   * Maintain period indicator
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Period Ind. for SLED'
  @sap.quickinfo : 'Period Indicator for Shelf Life Expiration Date'
  ShelfLifeExpirationDatePeriod : String(1);

  /**
   * Period for which the material will keep in total, that is, from the date of production to the shelf life expiration date.
   * 
   * Value entered in the material master recordThe system assumes that the date entered upon goods receipt is the material's date of production. It then calculates a shelf life expiration date from the date of production plus the total shelf life.No value entered in the material master recordThe system assumes that the date entered upon goods receipt is the material's shelf life expiration date.In both cases, the system updates the shelf life expiration date in the batch master record and in the material document if the goods receipt is accepted.The period (day, week, month, year) depends on the entry in the Period indicator field.
   */
  @sap.label : 'Total shelf life'
  TotalShelfLife : Decimal(4, 0);

  /**
   * Unit of measure in which stocks of the material are managed. The system converts all the quantities you enter in other units of measure (alternative units of measure) to the base unit of measure.
   * 
   * You define the base unit of measure and also alternative units of measure and their conversion factors in the material master record.Since all data is updated in the base unit of measure, your entry is particularly important for the conversion of alternative units of measure. A quantity in the alternative unit of measure can only be shown precisely if its value can be shown with the decimal places available. To ensure this, please note the following:The base unit of measure is the unit satisfying the highest necessary requirement for precision.The conversion of alternative units of measure to the base unit should result in simple decimal fractions (not, for example, 1/3 = 0.333...).Inventory ManagementIn Inventory Management, the base unit of measure is the same as the stockkeeping unit.ServicesServices have units of measure of their own, including the following:Service unitUnit of measure at the higher item level. The precise quantities of the individual services are each at the detailed service line level.BlanketUnit of measure at service line level for services to be provided once only, and for which no precise quantities can or are to be specified.
   */
  @sap.label : 'Base Unit of Measure'
  @sap.semantics : 'unit-of-measure'
  BaseUnit : String(3);
};

@cds.persistence.skip : true
@sap.label : 'Storage Location Data'
@sap.content.version : '1'
entity API_PRODUCT_SRV.A_ProductStorageLocation {

  /**
   * Alphanumeric key uniquely identifying the material.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material'
  @sap.quickinfo : 'Material Number'
  key Product : String(40);

  /**
   * Key uniquely identifying a plant.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Plant'
  key Plant : String(4);

  /**
   * Number of the storage location in which the material is stored. A plant may contain one or more storage locations.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Storage Location'
  key StorageLocation : String(4);

  /**
   * Identifies the storage bin within a storage location where the material is stored.
   * 
   * This storage bin is only significant if you do not use SAP warehouse management. It appears on goods receipt/issue slips.However, if the warehouse management system is active, this value is merely for information.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Storage Bin'
  WarehouseStorageBin : String(10);

  /**
   * The maintenance status records:
   * 
   * Which user departments may maintain a material master record of a particular material typeWhich user departments have already maintained the material master record at a particular hierarchy levelThe overall maintenance status is made up of the individual maintenance statuses. The individual maintenance statuses have the following meaning:User department Maintenance statusWork scheduling AAccounting BClassification CMRP DPurchasing EProduction resources/tools FCosting GBasic data KStorage LForecasting PQuality management QWarehouse management SSales VPlant stocks XStorage location stocks Z
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Maintenance status'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  MaintenanceStatus : String(15);

  /**
   * Indicator that specifies that the stock is blocked for a physical inventory.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Phys. Inv. Block'
  @sap.quickinfo : 'Physical Inventory Blocking Indicator'
  PhysicalInventoryBlockInd : String(1);

  /**
   * Date on which the record was created.
   */
  @sap.display.format : 'Date'
  @sap.label : 'Created On'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  CreationDate : Date;

  /**
   * Indicates that the flag for deletion has been set in the material master record.
   * 
   * If this indicator is set, the archive and delete program checks whether the material may be deleted at storage location level, and deletes the data at this level.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'DF stor. loc. level'
  @sap.quickinfo : 'Flag Material for Deletion at Storage Location Level'
  IsMarkedForDeletion : Boolean;

  /**
   * Indicates the date on which the material was last counted.
   * 
   * The date of the last count is only used for cycle counting. It is used as the basis for determining the next count date.&quot;Date of last posted count date&quot; means the following:This indicates the date when the latest physical inventory count was posted for the specified material. The physical inventory count with the most recent date is always indicated.Examples:You executed and posted the last physical inventory count on 13th May. If you post a new physical inventory count on 2nd June, the 2nd June is then displayed as the date of the last count.You executed and posted the last physical inventory count on 2nd June. If you now post another physical inventory count for the one executed and posted on 13th May, the 2nd June is still displayed as the date of the last physical inventory count.Posting an inventory difference does not affect the specified date of the last physical inventory count. The date of the last physical inventory count is only valuated during the cycle counting, in order to determine the next count date.
   */
  @sap.display.format : 'Date'
  @sap.label : 'Date of Last Count'
  @sap.quickinfo : 'Date of Last Posted Count'
  DateOfLastPostedCntUnRstrcdStk : Date;

  /**
   * When carrying out requirements planning or ATP check, you can use the inventory correction factor to take into account stocks that are actually available in proportion units at plant and storage location level.
   */
  @sap.label : 'Invent. corr. factor'
  @sap.quickinfo : 'Inventory Correction Factor'
  InventoryCorrectionFactor : Double;

  /**
   * Records the physical inventory status of the respective stock. The following statuses are possible:
   * 
   * If the physical inventory still has to be taken in the current year:Physical inventory still has to be taken: _ _ _Physical inventory still has to be completed: _ X _Posting block is set in active document: X X _If the physical inventory has already been taken in the current year:Physical inventory has been taken: _ _ XPhysical inventory is active again: _ X XPosting block is set in active document: X X X
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Restricted-use stock'
  @sap.quickinfo : 'Physical inventory indicator for restricted-use stock'
  InvtryRestrictedUseStockInd : String(3);

  /**
   * Records the physical inventory status of the respective stock. The following statuses are possible:
   * 
   * If the physical inventory still has to be taken in the current year:Physical inventory still has to be taken: _ _ _Physical inventory still has to be completed: _ X _Posting block is set in active document: X X _If the physical inventory has already been taken in the current year:Physical inventory has been taken: _ _ XPhysical inventory is active again: _ X XPosting block is set in active document: X X X
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Warehouse stock CY'
  @sap.quickinfo : 'Physical inventory indicator for whse stock in current year'
  InvtryCurrentYearStockInd : String(3);

  /**
   * Records the physical inventory status of the respective stock. The following statuses are possible:
   * 
   * If the physical inventory still has to be taken in the current year:Physical inventory still has to be taken: _ _ _Physical inventory still has to be completed: _ X _Posting block is set in active document: X X _If the physical inventory has already been taken in the current year:Physical inventory has been taken: _ _ XPhysical inventory is active again: _ X XPosting block is set in active document: X X X
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Qual. insp. stock CY'
  @sap.quickinfo : 'Phys. inventory ind. f. stock in qual. insp. in current year'
  InvtryQualInspCurrentYrStkInd : String(3);

  /**
   * Records the physical inventory status of the respective stock. The following statuses are possible:
   * 
   * If the physical inventory still has to be taken in the current year:Physical inventory still has to be taken: _ _ _Physical inventory still has to be completed: _ X _Posting block is set in active document: X X _If the physical inventory has already been taken in the current year:Physical inventory has been taken: _ _ XPhysical inventory is active again: _ X XPosting block is set in active document: X X X
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Blocked stock'
  @sap.quickinfo : 'Physical inventory indicator for blocked stock'
  InventoryBlockStockInd : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Restricted use, PP'
  @sap.quickinfo : 'Physical inventory ind. for restricted-use stock, prev.pd'
  InvtryRestStockPrevPeriodInd : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Warehouse stock PY'
  @sap.quickinfo : 'Physical inventory indicator for stock in previous year'
  InventoryStockPrevPeriod : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'QualInspStock prv.pd'
  @sap.quickinfo : 'Phys. inventory ind. f. stock in qual. insp. in prev. period'
  InvtryStockQltyInspPrevPeriod : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Blcked stock prev.pd'
  @sap.quickinfo : 'Phys. inventory indicator for blocked stock in prev. period'
  HasInvtryBlockStockPrevPeriod : String(3);
  @sap.display.format : 'NonNegative'
  FiscalYearCurrentPeriod : String(4);
  @sap.display.format : 'NonNegative'
  FiscalMonthCurrentPeriod : String(2);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Fiscal year of current physical inventory indicator'
  @sap.heading : ''
  FiscalYearCurrentInvtryPeriod : String(4);

  /**
   * Groups together storage bins from the standpoint of picking strategies; that is, the storage bins are arranged in a strategically advantageous manner for the task of picking.
   * 
   * This picking area is used for the following purposes:Rough-cut planning, for example, identifying how long it will take to pick the stockCreation of transfer orders if your company uses lean WMThe picking area is the counterpart to the storage section which groups together storage bins from the standpoint of putaway strategies.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Picking area'
  @sap.quickinfo : 'Picking area for lean WM'
  LeanWrhsManagementPickingArea : String(3);
};

@cds.persistence.skip : true
@sap.label : 'Supply Planning Data'
@sap.content.version : '1'
entity API_PRODUCT_SRV.A_ProductSupplyPlanning {

  /**
   * Alphanumeric key uniquely identifying the product.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product'
  @sap.quickinfo : 'Product Number'
  key Product : String(40);

  /**
   * Key uniquely identifying a plant.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Plant'
  key Plant : String(4);

  /**
   * Quantity that will be ordered or produced in the event of a shortage.
   * 
   * If the amount of the shortage is less than the fixed lot size, it is the fixed lot size that is ordered or produced (and not the lesser quantity that is actually required).If the amount of the shortage is greater than the fixed lot size, a multiple of the fixed lot size is procured. The system creates several purchase order proposals for this purpose.
   */
  @sap.unit : 'BaseUnit'
  @sap.label : 'Fixed lot size'
  FixedLotSizeQuantity : Decimal(13, 3);

  /**
   * Quantity that is not allowed to be exceeded during procurement.
   * 
   * The system takes this value into account during the automatic lot size calculation for planned orders and production orders. The lot size of the individual orders cannot exceed this value.
   */
  @sap.unit : 'BaseUnit'
  @sap.label : 'Maximum Lot Size'
  MaximumLotSizeQuantity : Decimal(13, 3);

  /**
   * Minimum procurement quantity
   */
  @sap.unit : 'BaseUnit'
  @sap.label : 'Minimum Lot Size'
  MinimumLotSizeQuantity : Decimal(13, 3);

  /**
   * Value to a multiple of which the system rounds up the procurement quantity.
   * 
   * The rounding value is used in the planning run if no rounding profile has been specified in the material master record.
   */
  @sap.unit : 'BaseUnit'
  @sap.label : 'Rounding value'
  @sap.quickinfo : 'Rounding value for purchase order quantity'
  LotSizeRoundingQuantity : Decimal(13, 3);

  /**
   * Key that determines which lot-sizing procedure the system uses within materials planning to calculate the quantity to be procured or produced.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Lot Sizing Procedure'
  @sap.quickinfo : 'Lot Sizing Procedure within Materials Planning'
  LotSizingProcedure : String(2);

  /**
   * Key that determines whether and how the material is planned. You have the following options:
   * 
   * Manual reorder point planningAutomatic reorder point planningForecast-based planningMaterial requirements planning with forecasts for unplanned consumptionMaster production scheduling (MPS)Demand-driven replenishment
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'MRP Type'
  MRPType : String(2);

  /**
   * Specifies the number of the MRP controller or group of MRP controllers responsible for material planning for the material.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'MRP Controller'
  MRPResponsible : String(3);

  /**
   * Specifies the quantity whose purpose is to satisfy unexpectedly high demand in the coverage period.
   * 
   * The risk of shortfalls is reduced by having a safety stock.
   */
  @sap.unit : 'BaseUnit'
  @sap.label : 'Safety Stock'
  SafetyStockQuantity : Decimal(13, 3);

  /**
   * The quantity that defines the lower limit for safety stock. This value cannot be exceeded.
   * 
   * Defining a lower limit can influence the following:material master data maintenanceThe safety is checked to see if it is greater or equal to this lower limit.forecastingThe lower limit is checked if you use an availability indicator which shows if the safety stock is to be calculated again in a forecast.If the safety stock is lower than this level in forecasting, the safety stock is automatically increased to the value of the lower level.The safety stock must always be greater or equal to this lower level.
   */
  @sap.unit : 'BaseUnit'
  @sap.label : 'Min safety stock'
  @sap.quickinfo : 'Minimum Safety Stock'
  MinimumSafetyStockQuantity : Decimal(13, 3);

  /**
   * The planning time fence specifies a period within which no automatic changes are to be made to the master plan.
   * 
   * The planning time fence is maintained in workdays.It is only used for materials that are planned using an MRP type which includes a firming type.The firming type determines how order proposlas are to be created or scheduled within the planning time fence.
   */
  @sap.display.format : 'NonNegative'
  @sap.label : 'Planning time fence'
  PlanningTimeFence : String(3);

  /**
   * Indicator that classifies a material as an A, B, or C part according to its consumption value. This classification process is known as the ABC analysis.
   * 
   * The three indicators have the following meanings:A - important part, high consumption valueB - less important part, medium consumption valueC - relatively unimportant part, low consumption value
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'ABC Indicator'
  ABCIndicator : String(1);

  /**
   * Quantity of the material in this plant that may not be exceeded.
   * 
   * In materials planning, the maximum stock level is used only if you have chosen Replenish to maximum stock level as the lot-sizing procedure; that is, you have entered HB as the lot size key.Enter a value if you have chosen Replenish to maximum stock level as the lot-sizing procedure.
   */
  @sap.unit : 'BaseUnit'
  @sap.label : 'Maximum Stock Level'
  MaximumStockQuantity : Decimal(13, 3);

  /**
   * If the stock falls below this quantity, the system flags the material for requirements planning by creating a planning file entry.
   */
  @sap.unit : 'BaseUnit'
  @sap.label : 'Reorder Point'
  ReorderThresholdQuantity : Decimal(13, 3);

  /**
   * Number of calendar days needed to obtain the material or service if it is procured externally.
   * 
   * If you have different vendors for a material, you must specify an average value. The same applies if you order the material from a fixed vendor that has varying delivery times.If you use the SAP Retail System, the planned delivery time can be suggested from the vendor sub-range in the vendor master record.
   */
  @sap.label : 'Planned Deliv. Time'
  @sap.quickinfo : 'Planned Delivery Time in Days'
  PlannedDeliveryDurationInDays : Decimal(3, 0);

  /**
   * In this field, you define the number of workdays for the safety time/actual range of coverage.
   * 
   * If you define a safety time, the requirements in MRP are brought forward on the time axis by the number of workdays you define here.This does not change the actual requirements dates. However, as the requirements have technically been brought forward, receipts are created for the earlier dates in MRP.Time-phased materials planning is based on the interval between the MRP date and the availabilty date of the next MRP date. By using the safety time/ actual range of coverage, the number of days to the interval are included in the calculation.
   */
  @sap.display.format : 'NonNegative'
  @sap.label : 'Safety Time'
  @sap.quickinfo : 'Safety Time (in Workdays)'
  SafetyDuration : String(2);

  /**
   * The strategy group groups all the planning strategies that can be used for a particular material. The planning strategy represents the procedure used for planning a material and is (technically speaking) controlled by the MRP types.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Strategy Group'
  @sap.quickinfo : 'Planning Strategy Group'
  PlanningStrategyGroup : String(2);

  /**
   * The total replenishment lead time is the time needed before the product is completely available again, that is, after all BOM levels have been procured or produced. It is not calculated by the system, but defined in this field as the total of the in-house production time(s) and/or the planned delivery time(s) of the longest production path.
   * 
   * This time is necessary if, for materials produced in-house, the replenishment lead time is to be taken into consideration in the availability check.In an availability check where the system takes the replenishment lead time into consideration, it only checks whether there are sufficient incoming quantities and stocks available to cover the requirements within the replenishment lead time. Outside the replenishment lead time,the system assumes that the material is available in sufficient quantity.Therefore, in this situation, it is usually necessary to depict the product's total replenishment lead time with all BOM levels as the replenishment lead time.The following options exist for materials produced in-house if the replenishment lead time is included in the availability check:The Total replenishment lead time field is maintained.In this case, the time maintained in this field is used for the availability check.The Total replenishment lead time field is not maintained.In this case, the system reads the in-house production time and, if available, the goods receipt processing time, and interprets the total of these two times as the replenishment lead time for the availability check.There is no point in maintaining the Total replenishment lead time field for materials procured externally. In external procurement, the system adds the processing time from purchasing, the planned delivery time, and the goods receipt processing time and uses this total as the replenishment lead time for an availability check with replenishment lead time.
   */
  @sap.label : 'Tot. repl. lead time'
  @sap.quickinfo : 'Total replenishment lead time (in workdays)'
  TotalReplenishmentLeadTime : Decimal(3, 0);

  /**
   * Indicator that defines how the material is procured. The following procurements types are possible:
   * 
   * The material is produced in-house.The material is procured externally.The material can be both produced in-house and procured externally.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Procurement Type'
  ProcurementType : String(1);

  /**
   * Allows you to define the procurement type more exactly. The system determines the procurement type from the material type.
   * 
   * You use special procurement when you want to be able to override the procurement type in the material master or define the procurement type more precisely.If the procurement type is in-house, you can nevertheless force the system to ignore the BOM and routing, and process the material as if it were externally procured, by specifying the special procurement as external.Enter the special procurement type to which you want to restrict the selection.If you procure a material externally, you may want to choose the special procurement type Consignment. If you produce the material in-house, it may be appropriate to choose Production in other plant.If a material has a routing but no BOM, it is treated as an externally procured material even if the procurement type is in-house. Both the BOM and the routing are ignored.However, if you specify the special procurement type as in-house, the routing is included even if the material has no BOM.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Special procurement'
  @sap.quickinfo : 'Special procurement type'
  ProcurementSubType : String(2);

  /**
   * Percentage scrap that occurs during production of the material if the material is an assembly.
   * 
   * The assembly scrap is used in materials planning to calculate the lot size of the assembly. The system increases the quantity to be produced by the scrap quantity calculated.If the material is an assembly, specify the percentage scrap as required.If the quantity to be produced is 200 pieces and you specify an assembly scrap of 10%, you are reckoning with a scrap quantity of 20 pieces. As a result, 220 pieces are produced.The system increases the quantity to be produced for all of the assembly's components accordingly.
   */
  @sap.label : 'Assembly scrap (%)'
  @sap.quickinfo : 'Assembly scrap in percent'
  AssemblyScrapPercent : Decimal(5, 2);

  /**
   * This field has two uses:
   * 
   * Specifies whether and how the system checks availability and generates requirements for materials planning.In Flexible Planning, defines - together with the checking rule - the different MRP elements that make up this key figure. The sum of these elements gives the key figure.Use 1: Availability Checking and Materials PlanningThe value you enter for use 1 (see above) is a default value which defines:Which MRP elements (for example, purchase orders, reservations) the system includes in the availability checkWhether the system checks availability only until the end of the replenishment lead time or whether it checks availability over the entire period for which MRP elements existWhether the system generates individual requirements or summarized requirements if you enter sales orders or deliveries for the materialUse 2: Flexible PlanningIf you use this field to define the MRP elements of a key figure for Flexible Planning, you must also select Document KF in the Customizing parameters of the information structure.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Availability check'
  @sap.quickinfo : 'Checking Group for Availability Check'
  AvailabilityCheckType : String(2);

  /**
   * Number of workdays required after receiving the material for inspection and placement into storage.
   */
  @sap.label : 'GR processing time'
  @sap.quickinfo : 'Goods receipt processing time in days'
  GoodsReceiptDuration : Decimal(3, 0);

  /**
   * The MRP group contains all the materials from the point of view of MRP for assigning special control parameters for the total planning run. These control parameters include, for example, the strategy group, the consumption mode, and the planning horizon.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'MRP Group'
  MRPGroup : String(4);

  /**
   * Key of the storage location that is proposed in the purchase requisition in materials planning for subsequent storage of the material. In the case of a material procured externally, this storage location is proposed in the planned order in materials planning.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Storage loc. for EP'
  @sap.quickinfo : 'Default storage location for external procurement'
  DfltStorageLocationExtProcmt : String(4);

  /**
   * The consumption mode controls the direction on the time axis in which requirements are consumed.
   * 
   * In backward consumption, sales orders, dependent requirements, or material reservations consume planned independent requirements that lie before the requirements date.In forward consumption, sales orders, dependent requirements, or material reservations consume planned independent requirements that lie after the requirements date.In period-based consumption, sales orders, dependent requirements, or material reservations consume planned independent requirements that lie within the consumption period of the planned independent requirement.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Consumption mode'
  ProdRqmtsConsumptionMode : String(1);

  /**
   * Determines the consumption period (in workdays) for backward consumption.
   * 
   * Using backward consumption, sales orders, dependent requirements, or Product reservations are assigned to and consume planned independent requirement quantities which lie within the consumption period and before the requirements date.
   */
  @sap.display.format : 'NonNegative'
  @sap.label : 'Backward Consumption Period'
  @sap.quickinfo : 'Consumption Period: Backward'
  BackwardCnsmpnPeriodInWorkDays : String(3);

  /**
   * Determines the consumption period (in workdays) for forward consumption.
   * 
   * In forward consumption, sales orders, dependent requirements or product reservations consume planned independent requirements that lie within the consumption period after the requirements date.For the planning strategy, &quot;make-to-stock production&quot;, this field controls the reduction of the planned independent requirements by the goods issue. In this strategy, the system first reduces the planned independent requirements that lie in the past. If you specify a period in this field, the system also reduces the planned independent requirements that lie within this period in the future.
   */
  @sap.display.format : 'NonNegative'
  @sap.label : 'Forward Consumption Period'
  @sap.quickinfo : 'Consumption period: Forward'
  FwdConsumptionPeriodInWorkDays : String(3);

  /**
   * Unit of measure in which stocks of the material are managed. The system converts all the quantities you enter in other units of measure (alternative units of measure) to the base unit of measure.
   * 
   * You define the base unit of measure and also alternative units of measure and their conversion factors in the material master record.Since all data is updated in the base unit of measure, your entry is particularly important for the conversion of alternative units of measure. A quantity in the alternative unit of measure can only be shown precisely if its value can be shown with the decimal places available. To ensure this, please note the following:The base unit of measure is the unit satisfying the highest necessary requirement for precision.The conversion of alternative units of measure to the base unit should result in simple decimal fractions (not, for example, 1/3 = 0.333...).Inventory ManagementIn Inventory Management, the base unit of measure is the same as the stockkeeping unit.ServicesServices have units of measure of their own, including the following:Service unitUnit of measure at the higher item level. The precise quantities of the individual services are each at the detailed service line level.BlanketUnit of measure at service line level for services to be provided once only, and for which no precise quantities can or are to be specified.
   */
  @sap.label : 'Base Unit of Measure'
  @sap.semantics : 'unit-of-measure'
  BaseUnit : String(3);

  /**
   * Key that determines the day on which the material is planned and ordered.
   * 
   * In addition to the planning cycle, you can enter a delivery cycle which is defined in the planning calendar field.It makes sense to enter a delivery cycle for the following situation:You carry out the planning run and place orders every Monday and Tuesday. The materials that are ordered on Monday are delivered on Wednesday and the materials that are ordered on Tuesday are not delivered until Friday.The system interprets an additionally specified planned delivery time as the minimum delivery time, which means that at least this number of days pass between the planning run or the order and delivery.Before a material can be planned with the time-phased planning procedure, it must be assigned the MRP type that allows time-phased planning.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Planning Cycle'
  PlanAndOrderDayDetermination : String(3);

  /**
   * Key that the system uses to adjust the order proposal quantity to deliverable units.
   * 
   * In Customizing, enter a threshold value from which the system should round up to the next value per deliverable unit:If the requirements value exceeds the first threshold value, the system always rounds up to the next multiple of the level foundIf the requirements value falls below the first threshold value, the system copies the original requirements value.Two other types of rounding exist:Dynamic rounding profile:These profiles are used to round up quantities to logistical units of measure (for example, layers). The contents of a logistical unit of measure does not have to be know when creating the rounding profile. It is determined by the master data from the material master.Rounding profile with quantity to be added/subtractedWith these profiles, the given quantity is changed either by adding a percentage or subtracting a percentage.Only static rounding profiles are taken into account in requirements planning. Neither dynamic rounding profiles not quantity addition/ subtraction are taken into account.A material's base unit of measure is 1 unit; the purchase order is to be delivered in layers (1 layer corresponds to 5 units) or in pallets (1 pallet corresponds to 8 layers which contains 40 units).You maintain the profile as follows:From a requirements of 2 units, the system is to round up to 5; from a requirement of 32 units, the system is to round up to 40.This results in the following order proposal quantities:Requirement from 1 -> 1 requirement from 31 -> 30Requirement from 2 -> 5 requirement from 32 -> 40Requirement from 6 -> 10 requirement from 74 -> 80Requirement from 7 -> 10If no rounding profile has been entered, the system uses the rounding value entered in the material master record for the planning run.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Rounding Profile'
  RoundingProfile : String(4);

  /**
   * Costs that are incurred, irrespective of lot size, for each purchase order or production order over and above the purchase order price or production costs.
   * 
   * The ordering costs are used only for calculating the lot size in optimum lot-sizing procedures. You must specify the ordering costs in the currency of the company code belonging to the plant.
   */
  @sap.unit : 'Currency'
  @sap.label : 'LS-Independent Costs'
  @sap.quickinfo : 'Lot-Size-Independent Costs'
  LotSizeIndependentCosts : Decimal(12, 3);

  /**
   * Three character number (numeric or using letters) that identifies a PPS planning calendar.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Planning Calendar'
  @sap.quickinfo : 'PPC Planning Calendar'
  MRPPlanningCalendar : String(3);

  /**
   * The range of coverage profile contains the parameters for calculating the dynamic safety stock. This is a statistical calculation on the basis of average daily requirements.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Coverage profile'
  @sap.quickinfo : 'Range of coverage profile'
  RangeOfCvrgPrflCode : String(3);

  /**
   * You use this indicator to switch on the safety time actual range of coverage for a material in MRP.
   * 
   * If you define a safety time, the requirements in MRP are brought forward on the time axis by the number of workdays you define here. The actual range of coverage corresponds to the number of days, by which the requirements are brought forward.Using this indicator you can activate the safety time and you can set whether all requirements or only independent requirements (sales order, planned independent requirements, and so on) are to be brought forward.The actual requirements dates are not changed.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Safety time ind.'
  @sap.quickinfo : 'Safety time indicator (with or without safety time)'
  IsSafetyTime : String(1);

  /**
   * The period profile for the safety time / actual range of coverage contains the periods (stating to/from date) with the safety time/actual range of coverage that is valid for each period.
   * 
   * In order to smooth out seasonal fluctuations, for any definable period you can define a safety time/actual range of coverage that varies from what you have maintained in the material master in the field safety time/actual range of coverage. If, for example, a higher actual range of coverage than usual is required due to higher demand during the Christmas period, you can define the period with the desired actual range of coverage in the period profile.You can also use the period profile to represent a safety time of less than one day. You do this by entering a safety time % in addition to the safety time.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'STime period profile'
  @sap.quickinfo : 'Period Profile for Safety Time'
  PerdPrflForSftyTme : String(3);

  /**
   * This indicator controls whether dependent requirements are relevant to MRP or not. Dependent requirements include dependent reservations and stock transfer requirements.
   * 
   * You only use this indicator in connection with planning strategies for make-to-stock production, assembly planning. Note that the indicator Dependent requirements not relevant to MRP should only be used when, for example, planned independent requirements exist for an assembly. In this case, no receipt elements for the dependent requirements in MRP should be created as receipts have already been created for the planned independent requirements.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'MRP dep.requirements'
  @sap.quickinfo : 'MRP relevancy for dependent requirements'
  IsMRPDependentRqmt : String(1);

  /**
   * Specifies the time in workdays needed to produce the material in-house.
   * 
   * In-house production time is independent of the order quantity.
   */
  @sap.label : 'In-house production'
  @sap.quickinfo : 'In-house production time'
  InHouseProductionTime : Decimal(3, 0);

  /**
   * The indicator determines if the system takes all stock and MRP-relevant units (inward/outward movement) in the project stock segments for all documents without account assignment into consideration.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Cross-project matl'
  @sap.quickinfo : 'Indicator for cross-project material'
  ProductIsForCrossProject : String(1);

  /**
   * Indicator that specifies the storage costs percentage the system uses when calculating the lot size to determine storage costs.
   * 
   * The storage costs percentage is based on the quantity stored and the unit price, and refers to the average value of the materials stored.The percentage is considered constant for the stocking-up period. It normally lies between 15 and 35%.The storage costs percentage is used by optimizing lot-sizing procedures to calculate the lot size, but not for any other purpose.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Storage Costs Code'
  @sap.quickinfo : 'Storage Costs Percentage Code'
  StorageCostsPercentageCode : String(1);

  /**
   * Percentage specifying what proportion of the requirement is to be covered by the warehouse stock.
   * 
   * The system uses the service level to calculate the safety stock.The higher the service level, the higher will be the safety stock calculated by the system to compensate for additional consumption or delays in delivery.
   */
  @sap.label : 'Service level (%)'
  @sap.quickinfo : 'Service level'
  SrvcLvl : Decimal(3, 1);

  /**
   * Defines whether the material is available for:
   * 
   * Subassembly planning with final assemblyGross requirements planningSubassembly planning without final assembly
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Mixed MRP'
  @sap.quickinfo : 'Mixed MRP indicator'
  MRPAvailabilityType : String(1);

  /**
   * Number of the material that the system uses in materials planning to replace the material to be discontinued once its warehouse stock is depleted.
   * 
   * In the material master record and also in the bill of material (BOM), you can define a follow-up material for a material to be discontinued. The follow-up material defined in the BOM has a higher priority than that in the material master record.You must always specify a follow-up material in the material master record for the system to know a follow-up material if none has been specified in the BOM.Simple discontinuationA component to be discontinued is replaced with a follow-up component at a particular date.In the material master record of the component to be discontinued, you must set discontinuation indicator 1, enter a follow-up component, and specify an effective-out date.Dependent parallel discontinuationA group of materials is replaced with a group of materials; that is, if one component is to be discontinued (the main component), another component must also be discontinued (the subordinate component).In the material master record of the main component to be discontinued, you must set discontinuation indicator 1, enter a follow-up component, and specify an effective-out date. In the material master record of the subordinate component, you must set discontinuation indicator 3.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Follow-Up Material'
  FollowUpProduct : String(40);

  /**
   * Authorizes the product for repetitive manufacturing.
   * 
   * You can only backflush in repetitive manufacturing if you have set this indicator.If you set this indicator, you must also specify a repetitive manufacturing profile for this product.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Repetitive Manufacturing Enabled'
  RepetitiveManufacturingIsAllwd : Boolean;

  /**
   * Indicator determining whether the following requirements are allowed for the dependent requirements of the material:
   * 
   * Individual requirementsRequirement quantities of the dependent material are stated individually.Collective requirementsRequirement quantities of the dependent material are grouped together.You can maintain this indicator in the following places:In the material master recordFor the explosion type of the BOM item (in Customizing for Basic Data in Define Explosion Types)The setting for the explosion type overrides that in the material master record.If the material is assigned to a material type that does not allow quantity-based inventory management in this plant, you can set the indicator to individual requirements only.If the stock is to be managed in sales order stock or project stock, the indicator must be set to one of the following options:Individual and collective requirementsIndividual requirements onlyIf a material managed in project stock is to be procured from another plant using a cross-company-code stock transport order, the indicator must be set to 2 (collective requirements) in the issuing plant because, in this specific context, individual project stock management is not possible in both plants.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Individual/coll.'
  @sap.quickinfo : 'Dependent requirements ind. for individual and coll. reqmts'
  DependentRequirementsType : String(1);

  /**
   * This indicator defines a BOM item as a bulk material, which is available directly at the work center (for example, washers or grease).
   * 
   * The dependent requirements of bulk materials are not relevant to materials planning. This means they are not taken into account for net requirements calculation. Therefore planning for bulk materials should be consumption-based.If bulk materials are subject to material requirements planning, you must create planned independent requirements for them.Dependent requirements are only created in the planned order for information purposes and they can be displayed there. Dependent requirements for bulk material are not shown in the MRP list or the stock/req. list.You can maintain this indicator in both the material master record an the BOM item. The indicator in the material master record has higher priority.If a material is always used as a bulk material, set the indicator in the material master record.In this case, the Bulk material indicator in material master record is automatically set in the BOM item.If a material is only used as a bulk material in individual cases, set the indicator in the BOM item.To improve system performance, you can define in the IMG for MRP that no dependent requirements are to be created for bulk material items. However, this also means that you see no information on bulk material components in the planned order or production order.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Bulk Material'
  @sap.quickinfo : 'Indicator: Bulk Material'
  IsBulkMaterialComponent : Boolean;

  /**
   * Controls, via order type, whether you are working with make-to-order repetitive manufacturing, based on sales orders, or with make-to-stock repetitive manufacturing, based on no specific orders.
   * 
   * The repetitive manufacturing profile also determines;how the system deals with activities when backflushingwhich movement type is used to post goods receipts and goods issueshow planned order and run schedule quantities are reduced in the backflush transactionhow BOM corrections are made - if errors should occur when posting quantities to be backflushed
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Repetitive Manufacturing Profile'
  RepetitiveManufacturingProfile : String(4);

  /**
   * If a requirement quantity (for example, for capacity reasons) cannot be procured in a single lot, you have to schedule several receipts. In conjunction with the overlap indicator in the lot size, you can use the takt time to specify that these receipts are offset, that is, that they are delayed by the takt time.
   * 
   * You enter the takt time in workdays.The system uses the takt time if a requirement is covered by several receipt elements due to restrictions on lot size such as maximum lot size (with all lot-sizing procedures) or rounding value (with fixed lot size with splitting).
   */
  @sap.label : 'Takt time'
  RqmtQtyRcptTaktTmeInWrkgDays : Decimal(3, 0);

  /**
   * Indicator that defines how the system splits forecast requirements into smaller time intervals where the MRP type is forecast-based planning and the period indicator is not &quot;day&quot;.
   * 
   * If you enter a splitting indicator, the system will take only a limited number of periods into account when planning the material and split them into smaller time intervals.If you choose &quot;day&quot; as your splitting indicator, the system will spread forecast requirements minus actual consumption values over the remaining workdays in the month.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Splitting indicator'
  @sap.quickinfo : 'Splitting Indicator'
  ForecastRequirementsAreSplit : String(1);

  /**
   * Date from which the stocks of the material are to be used up. As soon as no more stock exists for this material, it is to be replaced by the follow-up material.
   * 
   * From this date, the system reassigns the dependent requirements that are no longer covered by warehouse stock of the discontinued material to the follow-up material. This is done as part of material requirements planning.Enter a date if you want to plan the discontinuation of a material for the long term.
   */
  @sap.display.format : 'Date'
  @sap.label : 'Effective-Out Date'
  EffectiveOutDate : Date;

  /**
   * Key that you can use to store MRP parameters that are independent of the material master record.
   * 
   * In an MRP profile, you definewhich fields are filled with values when MRP data is entered in the material master record,which values these fields have,which of these values can be overwritten and which not.The information stored in a profile is standard information that is needed again and again in similar constellations when material master records are maintained. Thus the MRP profile is a useful entry aid and makes it easier to manage MRP data.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'MRP profile'
  @sap.quickinfo : 'Material: MRP profile'
  MRPProfile : String(4);

  /**
   * Percentage of scrap that occurs during production of the material if the material is a component.
   * 
   * Component scrap is used in material requirements planning (MRP) to determine the quantities of components required. When exploding the bill of material (BOM), the system increases the required quantities of the components by the calculated scrap quantity.ExampleRequired quantity 200 piecesComponent scrap 10%Scrap quantity 20 piecesTherefore, 220 pieces are required.For examples of calculation in connection with the indicator for net scrap, see the documentation for this indicator.If there is also assembly scrap for a higher-level assembly, the system adds together the two types of scrap.If component scrap has been entered in the BOM, this value applies. Otherwise, the value specified in the material master record is used.
   */
  @sap.label : 'Component Scrap (%)'
  @sap.quickinfo : 'Component Scrap in Percent'
  ComponentScrapInPercent : Decimal(5, 2);

  /**
   * Identifies the material as a part to be discontinued and includes it in the discontinued parts procedure in materials planning.
   * 
   * If this indicator is set, the system transfers the dependent requirements in materials planning to the follow-up material if they are no longer covered by warehouse stocks. However, this requires:The part to be discontinued and the follow-up material to be planned using material requirements planning (MRP)The base unit of measure of the follow-up material to be the same as that of the part to be discontinuedNoteIn subcontracting, uncovered requirements are not switched to the follow-up material after the effective-out date. This is indicated by a corresponding exception message (58) in the MRP list.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Discontinuation ind.'
  @sap.quickinfo : 'Discontinuation indicator'
  ProductIsToBeDiscontinued : String(1);

  /**
   * Defines whether the system groups together dependent requirements for the material on a daily basis when analyzing requirements planning.
   * 
   * If you set this indicator, the display in the MRP list and stock/requirements list is preset as follows:If several dependent requirements are scheduled on one day, they are grouped together in a single line showing how many dependent requirements have been grouped together.You can also expand the grouping in the MRP list and in the stock/requirements list.Defines whether additional individual/dependent requirements are written for components whose assembly is set such that total dependent requirements are created.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Requirements group'
  @sap.quickinfo : 'Indicator for Requirements Grouping'
  ProdRqmtsAreConsolidated : String(1);

  /**
   * Determines whether the backflush indicator is set in the production order. Here, a 3-level hierarchy logic is applied:
   * 
   * In the routing, the backflush indicator is set in the component assignment.In the material master record, the backflush indicator is set to &quot;Always Backflush&quot;.In the material master record, the backflush indicator is set to &quot;Work Center Decides&quot;, and the indicator is set in the work center.Each material component is assigned to an operation in the production order. If a material component is backflushed, the system posts the withdrawal only upon confirmation of the operation. The withdrawal is then posted automatically.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Backflush'
  @sap.quickinfo : 'Indicator: Backflush'
  MatlCompIsMarkedForBackflush : String(1);

  /**
   * The supply area is used as an interim storage area on the shop floor which is used to provide materials directly at the production line.
   * 
   * The proposed supply area is mainly used for KANBAN materials that are only or usually provided at one supply area in a plant. Here, this supply area can be easily saved in the system.The proposed supply area is used, for example, to determine the supply area for the dependent requirements of a material.The supply area in the dependent requirements of a material is required:to enable the system to calculate the KANBAN control cycles automaticallyto enable you to select requirements in the pull list with reference to a supply area
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Proposed supply area'
  @sap.quickinfo : 'Proposed Supply Area in Material Master Record'
  ProposedProductSupplyArea : String(10);

  /**
   * Currency key for amounts in the system.
   */
  @sap.label : 'Currency'
  @sap.quickinfo : 'Currency Key'
  @sap.semantics : 'currency-code'
  Currency : String(5);

  /**
   * This key is used for the function &quot;Actions in the planned order&quot; and defines the sequence of the actions that can be carried out for the planned order.
   * 
   * Using the function, &quot;actions in the planned order&quot;, an interface is provided to external assembly control systems. Thus, work progress on the assembly line as well as activities independent of the assembly line can be transferred to the SAP System via a standard interface or a customized interface.Using this function, one or more actions can be carried out for a large number of planned orders in one step that, if carried out online, could only be carried out individually per planned order. Moreover, it is possible to carry out customer-specific actions.An action may be, for example;explode BOMcheck material availabilityschedule planned order, and so on...
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Action Control'
  @sap.quickinfo : 'Action Control: Planned Order Processing'
  PlannedOrderActionControl : String(2);
};

@cds.persistence.skip : true
@sap.label : 'Units of Measure'
@sap.content.version : '1'
entity API_PRODUCT_SRV.A_ProductUnitsOfMeasure {

  /**
   * Alphanumeric key uniquely identifying the material.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material'
  @sap.quickinfo : 'Material Number'
  key Product : String(40);

  /**
   * Unit of measure in which quantities can be entered alternatively to the base unit of measure / stockkeeping unit.
   */
  @sap.label : 'AlternativeUnit'
  @sap.quickinfo : 'Alternative Unit of Measure for Stockkeeping Unit'
  @sap.semantics : 'unit-of-measure'
  key AlternativeUnit : String(3);

  /**
   * Indicates the conversion factor for base unit of measure. Note that negative values are not allowed in this field.
   * 
   * Numerator of the quotient that specifies the ratio of the alternative unit of measure to the base unit of measure.To convert a quantity, whose unit of measure is not the same as the base unit of measure, into the base unit of measure, the system requires a quotient:Quantity (in alternative unit of measure) = quotient * quantity (in base unit of measure)Enter the number of units of the alternative unit of measure (denominator) that corresponds to the number of units of the base unit of measure (numerator).The alternative unit of measure is kilogram (kg). The base unit of measure is piece (PC). 5 kg correspond to 3 pieces.5 kg = 3 PC => 1 kg = 3/5 PCIn this case, the quotient is therefore 3/5 (the numerator being 3 and the denominator 5).You may enter only whole numbers in the numerator and denominator fields; that is, if 3.14 m² correspond to one piece, you must enter integer multiples (314 m² = 100 PC). In this case, the quotient is therefore 100/314 (the numerator being 100 and the denominator 314).
   */
  @sap.unit : 'BaseUnit'
  @sap.label : 'Units / Quantity - Base Unit of Measure'
  @sap.quickinfo : 'Numerator for Conversion to Base Units of Measure'
  QuantityNumerator : Decimal(5, 0);

  /**
   * Denominator of the quotient that specifies the ratio of the alternative unit of measure to the base unit of measure.
   * 
   * To convert a quantity, whose unit of measure is not the same as the base unit of measure, into the base unit of measure, the system requires a quotient:Quantity (in alternative unit of measure) = quotient * quantity (in base unit of measure)Enter the number of units of the alternative unit of measure (denominator) that corresponds to the number of units of the base unit of measure (numerator).The alternative unit of measure is kilogram (kg). The base unit of measure is piece (PC). 5 kg correspond to 3 pieces.5 kg = 3 PC => 1 kg = 3/5 PCIn this case, the quotient is therefore 3/5 (the numerator being 3 and the denominator 5).You may enter only whole numbers in the numerator and denominator fields; that is, if 3.14 m² correspond to one piece, you must enter integer multiples (314 m² = 100 PC). In this case, the quotient is therefore 100/314 (the numerator being 100 and the denominator 314).
   */
  @sap.unit : 'AlternativeUnit'
  @sap.label : 'Units / Quantity - Alt Unit of Measure'
  @sap.quickinfo : 'Denominator for conversion to base units of measure'
  QuantityDenominator : Decimal(5, 0);

  /**
   * Space that the material occupies per unit of volume. The volume refers to the unit specified in the &quot;Volume unit&quot; field.
   * 
   * The volume and its unit always refer to the base unit of measure.
   */
  @sap.unit : 'VolumeUnit'
  @sap.label : 'Volume'
  MaterialVolume : Decimal(13, 3);

  /**
   * Unit referring to the volume of the material.
   * 
   * If you specify a volume, you have to enter the corresponding volume unit here.
   */
  @sap.label : 'Volume Unit'
  @sap.semantics : 'unit-of-measure'
  VolumeUnit : String(3);

  /**
   * Gross weight expressed in the unit of weight specified by you in the Unit of weight field.
   */
  @sap.unit : 'WeightUnit'
  @sap.label : 'Gross Weight'
  GrossWeight : Decimal(13, 3);

  /**
   * Unit referring to the gross weight or net weight of the material.
   * 
   * If you specify a weight, you must enter the corresponding unit of weight here.
   */
  @sap.label : 'Unit of Weight'
  @sap.semantics : 'unit-of-measure'
  WeightUnit : String(3);

  /**
   * Glossary definition
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'EAN/UPC'
  @sap.quickinfo : 'International Article Number (EAN/UPC)'
  GlobalTradeItemNumber : String(18);

  /**
   * Defines how the system determines a Global Trade Item Number (GTIN) to be assigned internally, and which check criteria (check digit, prefix, and so on) a GTIN of this category must fulfil.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'GTIN Category'
  @sap.quickinfo : 'Category of Global Trade Item Number (GTIN)'
  GlobalTradeItemNumberCategory : String(2);

  /**
   * Length of the material or its packaging, measured in the unit of dimension.
   */
  @sap.unit : 'ProductMeasurementUnit'
  @sap.label : 'Length'
  UnitSpecificProductLength : Decimal(13, 3);

  /**
   * Breadth of the material or its packaging, measured in the unit of dimension.
   */
  @sap.unit : 'ProductMeasurementUnit'
  @sap.label : 'Width'
  UnitSpecificProductWidth : Decimal(13, 3);

  /**
   * Height of the material or its packaging, measured in the unit of dimension.
   */
  @sap.unit : 'ProductMeasurementUnit'
  @sap.label : 'Height'
  UnitSpecificProductHeight : Decimal(13, 3);

  /**
   * Unit in which the dimensions of length, breadth, and height of a material or its packaging are measured.
   */
  @sap.label : 'Unit of Dimension'
  @sap.quickinfo : 'Unit of Dimension for Length/Width/Height'
  @sap.semantics : 'unit-of-measure'
  ProductMeasurementUnit : String(3);

  /**
   * Your base unit of measure is piece. 12 pieces fit into a box, and 10 boxes fit onto a pallet. In this case, piece is the lower-level unit of measure with regard to box, and box is the lower-level unit of measure with regard to pallet. Conversely, pallet is the higher-level unit of measure with regard to box, and so on.
   */
  @sap.label : 'Lower-level unit'
  @sap.quickinfo : 'Lower-Level Unit of Measure in a Packing Hierarchy'
  @sap.semantics : 'unit-of-measure'
  LowerLevelPackagingUnit : String(3);

  /**
   * Describes the remaining volume in percent when two materials are stacked inside each other.
   * 
   * For example, if you place a cup on another cup, the volume of the first cup remains the same. However, since part of the second cup disappears into the first cup, the volume of the second cup is reduced.This data element describes the remaining volume of the first cup as a percentage of the 'normal' volume.
   */
  @sap.label : 'Rem.Vol.After Nestng'
  @sap.quickinfo : 'Remaining Volume after Nesting (in Percentage)'
  RemainingVolumeAfterNesting : Decimal(3, 0);

  /**
   * Specifies the allowed stacking factor. You can use the maximum stacking factor, for example, to specify how many pieces of a material, or how many crates can be placed on top of each other. The factor is quantity-dependent.
   */
  @sap.label : 'Max. Stacking Factor'
  @sap.quickinfo : 'Maximum Stacking Factor'
  MaximumStackingFactor : Integer;
  @sap.label : 'Capacity Usage'
  CapacityUsage : Decimal(15, 3);

  /**
   * Unit of measure in which stocks of the material are managed. The system converts all the quantities you enter in other units of measure (alternative units of measure) to the base unit of measure.
   * 
   * You define the base unit of measure and also alternative units of measure and their conversion factors in the material master record.Since all data is updated in the base unit of measure, your entry is particularly important for the conversion of alternative units of measure. A quantity in the alternative unit of measure can only be shown precisely if its value can be shown with the decimal places available. To ensure this, please note the following:The base unit of measure is the unit satisfying the highest necessary requirement for precision.The conversion of alternative units of measure to the base unit should result in simple decimal fractions (not, for example, 1/3 = 0.333...).Inventory ManagementIn Inventory Management, the base unit of measure is the same as the stockkeeping unit.ServicesServices have units of measure of their own, including the following:Service unitUnit of measure at the higher item level. The precise quantities of the individual services are each at the detailed service line level.BlanketUnit of measure at service line level for services to be provided once only, and for which no precise quantities can or are to be specified.
   */
  @sap.label : 'Base Unit of Measure'
  @sap.semantics : 'unit-of-measure'
  BaseUnit : String(3);

  /**
   * Please add  an ON condition
   */
  to_InternationalArticleNumber : Association to many API_PRODUCT_SRV.A_ProductUnitsOfMeasureEAN {  };
};

@cds.persistence.skip : true
@sap.label : 'GTIN Data'
@sap.content.version : '1'
entity API_PRODUCT_SRV.A_ProductUnitsOfMeasureEAN {

  /**
   * Alphanumeric key uniquely identifying the material.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material'
  @sap.quickinfo : 'Material Number'
  key Product : String(40);

  /**
   * Specifies the unit of measure in which the quantity represented is displayed.
   */
  @sap.label : 'Display Unit/Measure'
  @sap.quickinfo : 'Unit of Measure for Display'
  @sap.semantics : 'unit-of-measure'
  key AlternativeUnit : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Consecutive number'
  @sap.quickinfo : 'Consecutive Number'
  key ConsecutiveNumber : String(5);

  /**
   * Glossary definition
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'EAN/UPC'
  @sap.quickinfo : 'International Article Number (EAN/UPC)'
  ProductStandardID : String(18);

  /**
   * Defines how the system determines a Global Trade Item Number (GTIN) to be assigned internally, and which check criteria (check digit, prefix, and so on) a GTIN of this category must fulfil.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'GTIN Category'
  @sap.quickinfo : 'Category of Global Trade Item Number (GTIN)'
  InternationalArticleNumberCat : String(2);

  /**
   * Specifies that the International Article Number (EAN) is the main EAN for the unit of measure.
   * 
   * If there are several EANs for each unit of measure, you must always identify one of them as the main EAN.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Main EAN'
  @sap.quickinfo : 'Indicator: Main EAN'
  IsMainGlobalTradeItemNumber : Boolean;
};

@cds.persistence.skip : true
@sap.label : 'Valuation Area Data'
@sap.content.version : '1'
entity API_PRODUCT_SRV.A_ProductValuation {

  /**
   * Alphanumeric key uniquely identifying the material.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material'
  @sap.quickinfo : 'Material Number'
  key Product : String(40);

  /**
   * Organizational level at which the material is valuated. A valuation area can be one of the following:
   * 
   * PlantAll plants belonging to a company code, in which case the valuation area is the company code
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Valuation Area'
  key ValuationArea : String(4);

  /**
   * Uniquely identifies separately valuated stocks of a material.
   * 
   * The valuation types allowed for a material are determined by the valuation category.If a material is valuated according to its origin (valuation category H), you can define the possible countries of origin as valuation types.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Valuation Type'
  key ValuationType : String(10);

  /**
   * Default value for the valuation class for valuated stocks of this material.
   * 
   * The valuation class has the following functions:Allows the stock values of materials of the same material type to be posted to different G/L accounts.Allows the stock values of materials of different material types to be posted to the same G/L account.Determines together with other factors the G/L accounts updated for a valuation-relevant transaction (such as a goods movement).
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Valuation Class'
  ValuationClass : String(4);

  /**
   * You have the following options:
   * 
   * In Transaction-Based material price determination (option 2 in the material master), with price control V the material is valued at the moving average price. With price control S, the material is valued at the standard price. The moving average price is calculated for information purposes.In Single-/Multilevel price determination (option 3 in the material master), the valuation price (standard price) remains unchanged and a periodic unit price is calculated for the material valuation of the closed period.This option is only possible for materials with price control S (standard price), and is only recommended if, in addition to multiple currencies and/or valuations, you use Single-/Multilevel material price determination.With Single-/Multilevel material price determination, a periodic unit price is updated for information purposes but can only be used for material valuation in the closed period.The indicator is only relevant if the material ledger is active.When you activate the material ledger for a valuation area in Customizing, you can specify what type of material price determination will be proposed when a material is created in that valuation area. This proposal will be ignored at production startup: the system automatically sets the indicator to 2 in the material master for all materials present.If you want to change the indicator for a particular material later, go to the SAP Easy Access menu and choose Accounting > Controlling > Product Cost Controlling > Actual Costing/Material Ledger > Environment > Change Material Price Determination.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Price determ.'
  @sap.quickinfo : 'Material Price Determination: Control'
  PriceDeterminationControl : String(1);

  /**
   * Standard price of the material
   * 
   * The valuation of material stocks at standard prices means that all goods movements are valuated at the same price over an extended period.Price variances (for example, purchase price higher than standard price) upon goods receipt or invoice receipt are posted by the system to price difference accounts. This does not affect the standard price.
   */
  @sap.unit : 'Currency'
  @sap.label : 'Standard price'
  StandardPrice : Decimal(12, 3);

  /**
   * Number of units to which the price refers.
   * 
   * If 10 gallons of gasoline cost $12.00, the price unit is 10.
   */
  @sap.label : 'Price unit'
  PriceUnitQty : Decimal(5, 0);

  /**
   * Indicates the price control used to valuate the stock of a product. You have the following options:
   * 
   * · Standard price· Moving average priceIf the material ledger is activated for the product, this indicator, together with the product's price determination indicator, determines at which of the following prices the product is valuated:· Standard price· Moving average price· Periodic unit price
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Price Control'
  InventoryValuationProcedure : String(1);

  /**
   * Indicator which flags all data of a material of a particular valuation type for deletion.
   * 
   * The reorganization program checks whether the deletion is allowed and deletes the data if applicable.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Del. flag val. type'
  @sap.quickinfo : 'Deletion flag for all material data of a valuation type'
  IsMarkedForDeletion : Boolean;

  /**
   * Price of the material. This can be one of the following:
   * 
   * Moving average pricePeriodic unit price (only if the material ledger is activated for the material)The system calculates the moving average price automatically by dividing the material value in the stock account by the total of all storage location stocks in the plant concerned. It changes the price with each valuation-relevant movement.The system changes the periodic unit price if you settle the material ledger and then save the data.The valuation of stocks at moving average price or periodic unit price means that the price of the material is adapted to the continual fluctuations in the procurement price.If the material ledger is activated for the material, the material's settlement control determines whether this price is the moving average price or the periodic unit price.
   */
  @sap.unit : 'Currency'
  @sap.label : 'Moving price'
  @sap.quickinfo : 'Moving Average Price/Periodic Unit Price'
  MovingAveragePrice : Decimal(12, 3);

  /**
   * Determines whether stocks of the material are valuated together or separately.
   * 
   * In the case of split valuation, this indicator also determines which valuation types are allowed, that is, the criteria by which stocks can be valuated.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Valuation Category'
  ValuationCategory : String(1);

  /**
   * This indicator shows the intended usage of a particular product in inventory.
   * 
   * Please note that each usage of a product must have a separate valuation. As soon as a product has more than one usage in a valuation area then valuation types can be used.Product Usage:0 Resale1 Industrialization2 Consumption3 Asset
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product Usage'
  @sap.quickinfo : 'Usage of the Product'
  ProductUsageType : String(1);

  /**
   * This indicator shows whether the products were produced inside Brazil or were imported. If the goods were imported, it also indicates whether they were imported directly by the company or not.
   * 
   * Origin of product:0 National - except indicated for codes 3, 4,5, or 81 Foreign - imported directly2 Foreign - acquired nationally3 National - merchandise or asset with import content is over than 40%4 National - when the production is according to Decree-law 288/67, and laws 8.248/91, 8.387/91, 10.176/01 and 11.484/075 National - with import content less than or equal to 40%6 Foreign - imported directly, no similar national, listed in “Resolução CAMEX”7 Foreign - acquired nationally, no similar national, listed in “Resolução CAMEX”8 National - with import content over 70%
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product Origin'
  @sap.quickinfo : 'Origin of the Product'
  ProductOriginType : String(1);

  /**
   * This indicator shows whether the material was produced by the company or another one.
   * 
   * It is used for purpose of CFOP determination.If the indicator is set the material was produced by the company. If the indicator is not set the material was produced by another company.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Produced in-house'
  IsProducedInhouse : Boolean;

  /**
   * Number that identifies a cost estimate with quantity structure.
   * 
   * This number is assigned internally and written to the reference object.
   */
  @sap.display.format : 'NonNegative'
  @sap.label : 'ProdCostEst.No.'
  @sap.quickinfo : 'Cost Estimate Number - Product Costing'
  ProdCostEstNumber : String(12);

  /**
   * Default value for the valuation class for valuated project stocks of the material.
   * 
   * You need specify a valuation class here only if you want to assign a different valuation class to this type of stock than that assigned to other valuated stocks of the material. This makes it possible to define other allowed G/L accounts for these stocks.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Proj. stk val. class'
  @sap.quickinfo : 'Valuation Class for Project Stock'
  ProjectStockValuationClass : String(4);

  /**
   * Default value for the valuation class for valuated sales order stocks of the material.
   * 
   * You need specify a valuation class here only if you want to assign a different valuation class to this type of stock than that assigned to other valuated stocks of the material. This makes it possible to define other allowed G/L accounts for these stocks.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'VC: Sales order stk'
  @sap.quickinfo : 'Valuation Class for Sales Order Stock'
  ValuationClassSalesOrderStock : String(4);

  /**
   * Price that the system can take as a basis for product costing.
   */
  @sap.unit : 'Currency'
  @sap.label : 'Planned price 1'
  @sap.quickinfo : 'Future Planned Price 1'
  PlannedPrice1InCoCodeCrcy : Decimal(12, 3);

  /**
   * Price that the system can take as a basis for product costing.
   */
  @sap.unit : 'Currency'
  @sap.label : 'Planned price 2'
  @sap.quickinfo : 'Future Planned Price 2'
  PlannedPrice2InCoCodeCrcy : Decimal(12, 3);

  /**
   * Price that the system can take as a basis for product costing.
   */
  @sap.unit : 'Currency'
  @sap.label : 'Planned price 3'
  @sap.quickinfo : 'Future Planned Price 3'
  PlannedPrice3InCoCodeCrcy : Decimal(12, 3);

  /**
   * Date as from which planned price 1 is valid for the material.
   */
  @sap.display.format : 'Date'
  @sap.label : 'Planned price date 1'
  @sap.quickinfo : 'Date from Which Future Planned Price 1 Is Valid'
  FuturePlndPrice1ValdtyDate : Date;

  /**
   * Date as from which planned price 2 is valid for the material.
   */
  @sap.display.format : 'Date'
  @sap.label : 'Planned price date 2'
  @sap.quickinfo : 'Date from Which Future Planned Price 2 Is Valid'
  FuturePlndPrice2ValdtyDate : Date;

  /**
   * Date as from which planned price 3 is valid for the material.
   */
  @sap.display.format : 'Date'
  @sap.label : 'Planned price date 3'
  @sap.quickinfo : 'Date from Which Future Planned Price 3 Is Valid'
  FuturePlndPrice3ValdtyDate : Date;

  /**
   * Number of units of measure to which the price related in the previous year.
   * 
   * 10 gallons of fuel cost $50.00. In this case, the price unit was 10.
   */
  @sap.unit : 'BaseUnit'
  @sap.label : 'Price Unit'
  @sap.quickinfo : 'Price unit for valuation prices based on tax/commercial law'
  TaxBasedPricesPriceUnitQty : Decimal(5, 0);
  @sap.display.format : 'Date'
  @sap.label : 'Last Price Change'
  @sap.quickinfo : 'Date of Last Price Change'
  PriceLastChangeDate : Date;

  /**
   * Price from a marked standard cost estimate.
   * 
   * If you create and mark a standard cost estimate for the material, the results of this cost estimate are copied to this field.If you later release the standard cost estimate for this material, the price entered here is updated as the current planned price and as the current standard price.If you do not release the marked standard cost estimate, but create a new one for the material, you can remark the results. You can keep remarking the results until you release the cost estimate.NoteIf no marked standard cost estimate exists, you can enter a price in this field manually. This makes it possible for the system to find a price when costing an assembly via the valuation strategy, even if no standard cost estimate with status KA (correct) exists for a BOM material (such as a raw material or semifinished product).If you subsequently create and flag a cost estimate for this material, the results of this cost estimate are adopted as the future planned price, and the manual entry overwritten. It can then no longer be changed. Therefore, you are recommended to use the Planned price 1, Planned price 2, and Planned price 3 fields to maintain the planned prices of material components and to define them in the valuation strategy.
   */
  @sap.unit : 'Currency'
  @sap.label : 'Future planned price'
  PlannedPrice : Decimal(12, 3);

  /**
   * Price at which the material was valuated up until the most recent price change.
   * 
   * The system makes an entry in this field when you change a price manually in valuation.
   */
  @sap.unit : 'Currency'
  @sap.label : 'Previous Price'
  PrevInvtryPriceInCoCodeCrcy : Decimal(12, 3);

  /**
   * Currency key for amounts in the system.
   */
  @sap.label : 'Currency'
  @sap.quickinfo : 'Currency Key'
  @sap.semantics : 'currency-code'
  Currency : String(5);

  /**
   * Unit of measure in which stocks of the material are managed. The system converts all the quantities you enter in other units of measure (alternative units of measure) to the base unit of measure.
   * 
   * You define the base unit of measure and also alternative units of measure and their conversion factors in the material master record.Since all data is updated in the base unit of measure, your entry is particularly important for the conversion of alternative units of measure. A quantity in the alternative unit of measure can only be shown precisely if its value can be shown with the decimal places available. To ensure this, please note the following:The base unit of measure is the unit satisfying the highest necessary requirement for precision.The conversion of alternative units of measure to the base unit should result in simple decimal fractions (not, for example, 1/3 = 0.333...).Inventory ManagementIn Inventory Management, the base unit of measure is the same as the stockkeeping unit.ServicesServices have units of measure of their own, including the following:Service unitUnit of measure at the higher item level. The precise quantities of the individual services are each at the detailed service line level.BlanketUnit of measure at service line level for services to be provided once only, and for which no precise quantities can or are to be specified.
   */
  @sap.label : 'Base Unit of Measure'
  @sap.semantics : 'unit-of-measure'
  BaseUnit : String(3);

  /**
   * Please add  an ON condition
   */
  to_MLAccount : Association to many API_PRODUCT_SRV.A_ProductMLAccount {  };

  /**
   * Please add  an ON condition
   */
  to_MLPrices : Association to many API_PRODUCT_SRV.A_ProductMLPrices {  };

  /**
   * Please add  an ON condition
   */
  to_ValuationAccount : Association to API_PRODUCT_SRV.A_ProductValuationAccount {  };

  /**
   * Please add  an ON condition
   */
  to_ValuationCosting : Association to API_PRODUCT_SRV.A_ProductValuationCosting {  };
};

@cds.persistence.skip : true
@sap.label : 'Valuation Account Data'
@sap.content.version : '1'
entity API_PRODUCT_SRV.A_ProductValuationAccount {

  /**
   * Alphanumeric key uniquely identifying the product.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product'
  @sap.quickinfo : 'Product Number'
  key Product : String(40);

  /**
   * Organizational level at which the material is valuated. A valuation area can be one of the following:
   * 
   * PlantAll plants belonging to a company code, in which case the valuation area is the company code
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Valuation Area'
  key ValuationArea : String(4);

  /**
   * Uniquely identifies separately valuated stocks of a material.
   * 
   * The valuation types allowed for a material are determined by the valuation category.If a material is valuated according to its origin (valuation category H), you can define the possible countries of origin as valuation types.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Valuation Type'
  key ValuationType : String(10);

  /**
   * Price at which the material is valuated for commercial purposes. (The distinction between tax valuation and commercial valuation is not observed in the United States of America or in some European countries.)
   */
  @sap.unit : 'Currency'
  @sap.label : 'Commercial price 1'
  @sap.quickinfo : 'Valuation price based on commercial law: level 1'
  CommercialPrice1InCoCodeCrcy : Decimal(12, 3);

  /**
   * Price at which the material is valuated from the commercial viewpoint, and which is derived in the determination of lowest value. It relates to the price unit of the previous year.
   * 
   * Price level 2 is used for updating the lowest price that has been determined on the basis of range of coverage and movement rate.
   */
  @sap.unit : 'Currency'
  @sap.label : 'Commercial price 2'
  @sap.quickinfo : 'Valuation price based on commercial law: level 2'
  CommercialPrice2InCoCodeCrcy : Decimal(12, 3);

  /**
   * Price at which the material is valuated for reasons of commercial law. This price is given by the FIFO valuation. Alternatively, it can be specified by inventory costing or by an external source.
   * 
   * The price relates to the price unit in the previous year (for more information, see the SAP Library documentation Invoice Verification and Material Valuation).
   */
  @sap.unit : 'Currency'
  @sap.label : 'Commercial price 3'
  @sap.quickinfo : 'Valuation price based on commercial law: level 3'
  CommercialPrice3InCoCodeCrcy : Decimal(12, 3);

  /**
   * The devaluation indicator shows how many years the material has been flagged as slow or non-moving.
   * 
   * The devaluation indicator determines the percentage by which the value of a material is reduced. It allows the results from previous years to be taken into account when the &quot;lowest value&quot; of a material is determined on the basis of whether it is slow/non-moving. The devaluation indicator is:Increased by 1 if the material is slow or non-movingSet to 0 if the material is medium or fast moving
   */
  @sap.display.format : 'NonNegative'
  @sap.label : 'Devaluation Ind.'
  @sap.quickinfo : 'Lowest value: devaluation indicator'
  DevaluationYearCount : String(2);

  /**
   * Price at which the material will be valuated as from a precise date in the future.
   * 
   * The future standard price is valid as of the date you enter in the relevant field.Before the future price can become effective, you must activate it for material valuation.
   */
  @sap.label : 'Future Price'
  FutureEvaluatedAmountValue : Decimal(12, 3);

  /**
   * Date as from which the future price of the material is valid.
   */
  @sap.display.format : 'Date'
  @sap.label : 'Valid from'
  @sap.quickinfo : 'Date as of which the price is valid'
  FuturePriceValidityStartDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.label : 'TRUE'
  @sap.quickinfo : 'Data element for domain BOOLE: TRUE (=''X'') and FALSE (='' '')'
  IsLIFOAndFIFORelevant : Boolean;

  /**
   * Alphanumeric key uniquely identifying the document.
   * 
   * Materials to be valuated together in LIFO valuation are grouped under a pool number.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'LIFO Pool'
  @sap.quickinfo : 'Pool number for LIFO valuation'
  LIFOValuationPoolNumber : String(4);

  /**
   * Price at which the material is valuated for tax purposes. (The distinction between tax valuation and commercial valuation is not observed in the United States of America or in some European countries.)
   */
  @sap.unit : 'Currency'
  @sap.label : 'Tax price 1'
  @sap.quickinfo : 'Valuation price based on tax law: level 1'
  TaxPricel1InCoCodeCrcy : Decimal(12, 3);

  /**
   * Price at which the material is valuated for tax purposes, and which is derived in the determination of lowest value. It relates to the price unit of the previous year.
   * 
   * Price level 2 is used for updating the lowest price that has been determined on the basis of range of coverage and movement rate.
   */
  @sap.unit : 'Currency'
  @sap.label : 'Tax price 2'
  @sap.quickinfo : 'Valuation price based on tax law: level 2'
  TaxPrice2InCoCodeCrcy : Decimal(12, 3);

  /**
   * Price at which the material is valuated for reasons of tax law. This price is given by the FIFO valuation. Alternatively, it can be specified by inventory costing or by an external source.
   * 
   * The price relates to the price unit in the previous year (for more information, see the SAP Library documentation Invoice Verification and Material Valuation).
   */
  @sap.unit : 'Currency'
  @sap.label : 'Tax price 3'
  @sap.quickinfo : 'Valuation price based on tax law: level 3'
  TaxPrice3InCoCodeCrcy : Decimal(12, 3);

  /**
   * Currency key for amounts in the system.
   */
  @sap.label : 'Currency'
  @sap.quickinfo : 'Currency Key'
  @sap.semantics : 'currency-code'
  Currency : String(5);
};

@cds.persistence.skip : true
@sap.label : 'Valuation Costing Data'
@sap.content.version : '1'
entity API_PRODUCT_SRV.A_ProductValuationCosting {

  /**
   * Alphanumeric key uniquely identifying the product.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product'
  @sap.quickinfo : 'Product Number'
  key Product : String(40);

  /**
   * Organizational level at which the material is valuated. A valuation area can be one of the following:
   * 
   * PlantAll plants belonging to a company code, in which case the valuation area is the company code
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Valuation Area'
  key ValuationArea : String(4);

  /**
   * Uniquely identifies separately valuated stocks of a material.
   * 
   * The valuation types allowed for a material are determined by the valuation category.If a material is valuated according to its origin (valuation category H), you can define the possible countries of origin as valuation types.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Valuation Type'
  key ValuationType : String(10);

  /**
   * This indicator determines whether the material is costed using costing with or without a quantity structure.
   * 
   * If you usually cost materials using costing with quantity structure, turn on this indicator.If you usually cost materials using costing without quantity structure, do not turn on this indicator.You can change the indicator in the material master record at a later time.If you always cost your materials (including raw materials) using costing with quantity structure, you should turn on this indicator. This improves performance, because the system does not search in vain for existing cost estimates without a quantity structure for every material when it explodes the BOM. Therefore, only turn on this indicator if you normally cost the materials using costing without quantity structure.Regardless of the setting, you can cost a single material with or without quantity structure. However, you should bear in mind that this setting is always used in the costing run and in mixed costing (creating procurement alternatives).For every cost estimate, the system searches for existing cost estimates that have the materials in their structure. If a released cost estimate exists, the system copies it.If this indicator is set, the material is costed using costing with a quantity structure.The system searches for any existing cost estimates with quantity structure for the individual materials; it ignores existing cost estimates without quantity structure. If the system does not find any valid costing data for the materials, it costs the material or accesses the price in the material master. See also: Transfer controlIf this indicator is not set, the planned costs for the material are calculated using the cost estimate without quantity structure. In this case, you use unit costing to create the quantity structure manually by entering costing items for materials and activity types, for example.The system now searches for any existing cost estimates without quantity structure. If a cost estimate without quantity structure exists for a material, the results of this cost estimate are included in a cost estimate with quantity structure. If there is no cost estimate without quantity structure, the cost estimate with quantity structure accesses the price in the material master record. The planned costs for this material then go into the cost estimate with quantity structure as raw material costs.This does not apply if the indicator Ignore prod cost est w/o qty structure is set in the costing variant.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'With Qty Structure'
  @sap.quickinfo : 'Material Is Costed with Quantity Structure'
  IsMaterialCostedWithQtyStruc : Boolean;

  /**
   * If this indicator is set, the material number will be written to the cost element itemization in the Controlling module.
   * 
   * If you set this indicator, the costs incurred will be updatedunder a primary cost elementwith reference to the material numberThis enables you to analyze material costs in the information system in more detail.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material origin'
  @sap.quickinfo : 'Material-related origin'
  IsMaterialRelatedOrigin : String(1);

  /**
   * Used for subdividing material and overhead costs.
   * 
   * When material costs are calculated, each material is given a general ledger account and thus is assigned to a primary cost element. If you enter an origin group for the material, the combination of source group and cost element is updated to the CO component. This means that you canDefine calculation bases for determination of overhead rates for particular material groups.Define cost components in product costing for particular material groups.Create rules for activating work in process for each material group.When overhead is calculated, an object is debited with overhead costs and another object (usually a cost center) is credited. For more information on the origin of overhead rates in the credit record, specify an origin group in the credit key. The system then displays the origin group in Cost Center Accounting, as well as the overhead cost element.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Origin Group'
  @sap.quickinfo : 'Origin Group as Subdivision of Cost Element'
  CostOriginGroup : String(4);

  /**
   * Key that groups materials to which the same overhead is applied.
   * 
   * In costing with and without quantity structure, and when costing production orders and run schedule headers, you can apply percentage overhead charges by means of an overhead key, if you:Assign a costing sheet to your production order or run schedule header, or to the valuation variant for the cost estimateEnter overhead charges in this costing sheet that use the overhead key fieldAssign the overhead key to an overhead groupEnter this overhead group in the material master record of the material
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Overhead Group'
  @sap.quickinfo : 'Costing Overhead Group'
  CostingOverheadGroup : String(10);
};

@cds.persistence.skip : true
@sap.label : 'Work Scheduling Data'
@sap.content.version : '1'
entity API_PRODUCT_SRV.A_ProductWorkScheduling {

  /**
   * Alphanumeric key uniquely identifying the product.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product'
  @sap.quickinfo : 'Product Number'
  key Product : String(40);

  /**
   * Key uniquely identifying a plant.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Plant'
  key Plant : String(4);

  /**
   * Quantity to which the in-house production time and the processing time of the material relate.
   */
  @sap.unit : 'BaseUnit'
  @sap.label : 'Base quantity'
  MaterialBaseQuantity : Decimal(13, 3);

  /**
   * Indicator that specifies whether the quantity actually delivered may infinitely exceed the required production order quantity.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Unltd Overdelivery'
  @sap.quickinfo : 'Indicator: Unlimited Overdelivery Allowed'
  UnlimitedOverDelivIsAllowed : Boolean;

  /**
   * Percent by which the quantity that is posted to goods receipt may exceed the production order quantity.
   */
  @sap.label : 'Overdely tolerance'
  @sap.quickinfo : 'Overdelivery tolerance limit'
  OverDelivToleranceLimit : Decimal(3, 1);

  /**
   * Percentage rate that specifies the percent below which the quantity posted for a goods receipt may drop below the production order quantity.
   */
  @sap.label : 'Underdely tolerance'
  @sap.quickinfo : 'Underdelivery tolerance limit'
  UnderDelivToleranceLimit : Decimal(3, 1);

  /**
   * In the case of a material produced in-house, this is the key of the storage location that is copied to the planned order, production order, or run schedule quantity.
   * 
   * If the material is a component, it is the issuing storage location to which a backflush is posted.If the material is produced, it is the receiving storage location to which the receipt of the material is posted.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Prod. stor. location'
  @sap.quickinfo : 'Issue Storage Location'
  ProductionInvtryManagedLoc : String(4);

  /**
   * Unit of measure in which stocks of the material are managed. The system converts all the quantities you enter in other units of measure (alternative units of measure) to the base unit of measure.
   * 
   * You define the base unit of measure and also alternative units of measure and their conversion factors in the material master record.Since all data is updated in the base unit of measure, your entry is particularly important for the conversion of alternative units of measure. A quantity in the alternative unit of measure can only be shown precisely if its value can be shown with the decimal places available. To ensure this, please note the following:The base unit of measure is the unit satisfying the highest necessary requirement for precision.The conversion of alternative units of measure to the base unit should result in simple decimal fractions (not, for example, 1/3 = 0.333...).Inventory ManagementIn Inventory Management, the base unit of measure is the same as the stockkeeping unit.ServicesServices have units of measure of their own, including the following:Service unitUnit of measure at the higher item level. The precise quantities of the individual services are each at the detailed service line level.BlanketUnit of measure at service line level for services to be provided once only, and for which no precise quantities can or are to be specified.
   */
  @sap.label : 'Base Unit of Measure'
  @sap.semantics : 'unit-of-measure'
  BaseUnit : String(3);

  /**
   * Specifies the time needed to process the material in the operations at the different work centers.
   * 
   * The processing time depends on the order quantity.
   */
  @sap.label : 'Processing time'
  ProductProcessingTime : Decimal(5, 2);

  /**
   * Group responsible for controlling the production of a material.
   * 
   * Among other things, the production supervisor determines how capacity requirements are calculated for a material during a scheduling run.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Prodn Supervisor'
  @sap.quickinfo : 'Production Supervisor'
  ProductionSupervisor : String(3);

  /**
   * Unit relating to the production quantity.
   * 
   * Enter a value in this field only if you want to use a unit of measure differing from the base unit of measure.If the field does not contain an entry, the system will assume that the unit of measure is the base unit of measure.When you create a production order for a material, and a production unit has been entered in both the material master record and in the routing, the system checks whether the quantity entered in the production order falls within the lot size range in the routing.
   */
  @sap.label : 'Production unit'
  @sap.semantics : 'unit-of-measure'
  ProductProductionQuantityUnit : String(3);

  /**
   * Defines when batches have to be determined when using the PP/WM interface.
   * 
   * This indicator refers to the components of an order, not to the finished product to be manufactured. You have the following options:The batches can be determined when the goods issue is posted.The batches must be entered in the order before it is released.The batches must be entered in the order before the goods issue is posted, but not necessarily before the order is released.If you use pick parts, the batches are determined in the transfer order and then confirmed to the order. If there is no direct link between the transfer order and the production order/process order (for example, with release order parts or crate parts), you must enter the batches in the production order/process order manually.The batches are determined automatically when the order is released.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Batch entry'
  @sap.quickinfo : 'Determination of batch entry in the production/process order'
  ProdnOrderIsBatchRequired : String(1);

  /**
   * This field combines materials on the basis of setup properties, referring to a resource or a resource group.
   * 
   * No checks take place for this field.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material Grouping'
  @sap.quickinfo : 'Group of Materials for Transition Matrix'
  TransitionMatrixProductsGroup : String(20);

  /**
   * Controls change management for production orders.
   * 
   * In an overall profile you assign change profiles to the following processes:sales order processmaster data processassembly order processThat means that each of these processes can be controlled individually.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Change overall prof.'
  @sap.quickinfo : 'Overall profile for order change management'
  OrderChangeManagementProfile : String(6);

  /**
   * Determines whether the backflush indicator is set in the production order. Here, a 3-level hierarchy logic is applied:
   * 
   * In the routing, the backflush indicator is set in the component assignment.In the material master record, the backflush indicator is set to &quot;Always Backflush&quot;.In the material master record, the backflush indicator is set to &quot;Work Center Decides&quot;, and the indicator is set in the work center.Each material component is assigned to an operation in the production order. If a material component is backflushed, the system posts the withdrawal only upon confirmation of the operation. The withdrawal is then posted automatically.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Backflush'
  @sap.quickinfo : 'Indicator: Backflush'
  MatlCompIsMarkedForBackflush : String(1);

  /**
   * Specifies the number of workdays needed to set up and tear down the various work centers where the material is processed. This value is the total of the setup and teardown times.
   * 
   * The setup and teardown time is independent of the order quantity.
   */
  @sap.label : 'Setup time'
  @sap.quickinfo : 'Setup and teardown time'
  SetupAndTeardownTime : Decimal(5, 2);

  /**
   * Profile that you can use to
   * 
   * · specify that certain business transactions are carried out in parallel in a production order / process order (you can, for example, create and release an order at the same time, or release an order and print the shop papers)· trigger an automatic goods receipt· specify an overall profile for capacity levelingThe production scheduling profile is copied into the order during order creation.You can assign a production scheduling profile to a· product· production supervisorThe assignment to a material has a higher priority.
   */
  @sap.display.format : 'UpperCase'
  @sap.label : 'Production Scheduling Profile'
  ProductionSchedulingProfile : String(6);

  /**
   * Specifies the number of workdays required for the transition of a produced material between work centers or work center groups. It includes the following times:
   * 
   * Move timeQueue timeWait timeFloat before productionFloat after productionPlanned delivery time of an operation processed externallyThe interoperation time is independent of the order quantity.
   */
  @sap.label : 'Interoperation'
  @sap.quickinfo : 'Interoperation time'
  TransitionTime : Decimal(5, 2);
};

