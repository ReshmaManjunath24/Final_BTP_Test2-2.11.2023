@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Testing'
define root view entity ZDD_TEST_CDS as select from zcomm
//composition of target_data_source_name as _association_name
{
    key sales_id,
    key com_id ,
    comments 
   // _association_name // Make association public
}
