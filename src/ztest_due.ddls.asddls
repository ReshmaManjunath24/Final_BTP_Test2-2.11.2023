@AbapCatalog.sqlViewName: 'ZTEST5'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'TEST DUE'
define view ZTEST_DUE as select from  ztab_customers
--ztab_clap

--association [0..1] to I_BusinessPartner as zcustomer_legal_name on $projection.CreatedByUser = zcustomer_legal_name.OrganizationBPName1
{
key zcustomer_legal_name,
zduedate,
$session.system_date as todate
//case when zduedate 
//<= dats_add_months ($session.system_date,-1,'UNCHANGED') then zduedate end  as due
}
--where zduedate >= dats_add_months( $session.system_date,-1,'UNCHANGED' ) 
