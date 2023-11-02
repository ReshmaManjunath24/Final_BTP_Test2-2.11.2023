@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Document Item'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
define view entity zdd_com
  as select from zcomm as _com

 // composition [0..*] of ZDH_MngdDocumentAccount as _Account
  association to parent zdd_sales as _sales on _sales.sales_id = $projection.sales_id
{
 key sales_id ,
 key com_id,
 comments,
 _sales
}
