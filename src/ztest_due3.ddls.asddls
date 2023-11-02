@AbapCatalog.sqlViewName: 'ZTEST7'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'TEST DUE'
define view ZTEST_DUE3 as select from ZTEST_DUE2
{
    key zcustomer_legal_name,
    due
}
