@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'sales'
define root view entity ZDD_SALES1 as select from zsales1 as _sales
//composition [1..*] of zdd_comm as _com 
{
   key sales_id,
    sales_area 
    //_association_name // Make association public
    //_com
}
