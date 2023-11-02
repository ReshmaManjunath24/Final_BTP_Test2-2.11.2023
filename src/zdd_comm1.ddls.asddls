@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'comments'
define view entity ZDD_COMM1 as select from zcomm1
//association to parent zdd_sales as _sales on _sales.sales_id
//    = $projection.sales_id 
    {
    key sales_id ,
    key com_id,
    comments
    //_sales // Make association public
}
