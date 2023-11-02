@EndUserText.label: 'Custom Entity for notifying Initiator'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_ANNUAL_NOTIF_REVIEWER'
define custom entity ZDD_ANNUAL_NOTIFI_REVIEWER
 
{
  key customer : sysuuid_x16;
 status : abap.char(10);
  
}
