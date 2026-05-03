@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer Sales Data Interface View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CustomerSalesData 
  as select from vbak as SalesHeader
    join vbap as SalesItem on SalesHeader.vbeln = SalesItem.vbeln
    left outer join vbrp as BillingItem on SalesItem.vbeln = BillingItem.aubel
                                       and SalesItem.posnr = BillingItem.aupos
    left outer join vbrk as BillingHeader on BillingItem.vbeln = BillingHeader.vbeln
{
  key SalesHeader.vbeln as SalesDocument,
  key SalesItem.posnr as SalesDocumentItem,
  
  SalesHeader.kunnr as SoldToParty,
  SalesHeader.vkorg as SalesOrganization,
  SalesHeader.vtweg as DistributionChannel,
  SalesHeader.spart as Division,
  SalesHeader.audat as DocumentDate,
  
  SalesItem.werks as Plant,
  @Semantics.amount.currencyCode: 'TransactionCurrency'
  SalesItem.netwr as NetValue,
  SalesItem.waerk as TransactionCurrency,
  
  BillingHeader.vbeln as BillingDocument,
  BillingHeader.fkart as BillingDocumentType,
  BillingHeader.fkdat as PostingDate,
  
  BillingItem.posnr as BillingDocumentItem,
  @Semantics.amount.currencyCode: 'TransactionCurrency'
  BillingItem.netwr as BillingNetValue,
  @Semantics.amount.currencyCode: 'TransactionCurrency'
  BillingItem.mwsbp as TaxAmount,
  
  /* Overall Status - Simplified Logic */
  case 
    when BillingHeader.vbeln is not null then 'Completed'
    else 'Open'
  end as OverallStatus
}
