@EndUserText.label: 'Customer Sales Report'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@Search.searchable: true
@UI.headerInfo: {
    typeName: 'Sales Report Item',
    typeNamePlural: 'Sales Report Items',
    title: { type: #STANDARD, value: 'SalesDocument' }
}
define root view entity ZC_CustomerSalesReport
  as projection on ZI_CustomerSalesData
{
  @UI.selectionField: [{ position: 10 }]
  @UI.lineItem: [{ position: 30, label: 'Customer' }]
  @Search.defaultSearchElement: true
  SoldToParty as Customer,

  @UI.selectionField: [{ position: 20 }]
  SalesOrganization,

  @UI.selectionField: [{ position: 30 }]
  DistributionChannel,

  @UI.selectionField: [{ position: 40 }]
  Division,

  @UI.selectionField: [{ position: 50 }]
  @UI.lineItem: [{ position: 50 }]
  Plant,

  @UI.selectionField: [{ position: 60 }]
  BillingDocumentType,

  @UI.selectionField: [{ position: 70 }]
  @UI.lineItem: [{ position: 80 }]
  PostingDate,

  @UI.lineItem: [{ position: 10 }]
  key SalesDocument,

  key SalesDocumentItem,

  @UI.lineItem: [{ position: 20 }]
  BillingDocument,
  
  BillingDocumentItem,

  @UI.lineItem: [{ position: 60 }]
  NetValue,

  @UI.lineItem: [{ position: 70 }]
  TaxAmount,

  TransactionCurrency,

  DocumentDate,

  @UI.lineItem: [{ position: 90 }]
  OverallStatus
}
