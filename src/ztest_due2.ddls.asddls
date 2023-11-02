@AbapCatalog.sqlViewName: 'ZTEST6'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'TEST SUE2'
define view ZTEST_DUE2 as select from ZTEST_DUE
    
    {
    key zcustomer_legal_name,
//    zduedate,
//    todate,
    case when zduedate 
<= dats_add_days (todate,-10,'UNCHANGED') then zduedate end  as due
}
