@EndUserText.label: 'Data Definition for Entity Annual Appraisal Notifications'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_ANNUAL_APRSAL_NOTIFICATION'

define custom entity ZDD_ANNAUL_APRSAL_NOTIFICATION

{
  key customer :  sysuuid_x16;
  status : abap.char(10);
  
}
