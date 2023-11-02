@AbapCatalog.sqlViewName: 'ZVERTICAL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help for Vertical'
define view ZVH_Vertical as select from  ztab_trade_cust {

 zvertical
}
