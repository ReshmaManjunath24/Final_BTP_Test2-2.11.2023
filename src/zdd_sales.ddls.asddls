@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'sales'
define root view entity zdd_sales as select from zsales as _sales
composition [1..*] of zdd_comm as _com 
//association [1..*] to zdd_comm as _comments on _sales.sales_id = _comments.sales_id
association [1..*] to zcomm as _comments on _sales.sales_id = _comments.sales_id

{
   key sales_id,
     sales_area ,
    //_association_name // Make association public
    
    _comments.comments,
    _com
}
