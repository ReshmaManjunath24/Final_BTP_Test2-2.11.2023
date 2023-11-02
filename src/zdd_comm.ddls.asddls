@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'comments'
define view entity zdd_comm as select from zcomm
association to parent zdd_sales as _sales on _sales.sales_id = $projection.sales_id 
//association [0..*] to as _comments on _sales.sales_id = _comments.sales_id

{
    key sales_id ,
    key com_id,
    comments,
  _sales // Make association public
}
