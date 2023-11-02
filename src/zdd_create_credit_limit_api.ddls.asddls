@EndUserText.label: 'Data Definition: S4 Credit Limit Create'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_WF_CREDIT_LIMIT_CREATE'
define custom entity ZDD_CREATE_CREDIT_LIMIT_API

{
  key customer :  sysuuid_x16;
  status : abap.sstring(100);
  
}
