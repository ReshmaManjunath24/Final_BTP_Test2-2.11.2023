@EndUserText.label: 'Data Definition for S4 Credit Limit Update'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_WF_CREDIT_LIMIT_UPDATE'
define custom entity ZDD_UPDATE_CREDIT_LIMIT_API

{
  key customer :  sysuuid_x16;
  status : abap.sstring(100);
  
}
