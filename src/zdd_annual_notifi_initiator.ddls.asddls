@EndUserText.label: 'Custom Entity for notifying Initiator'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_ANNUAL_NOTIF_INITIATOR'
define custom entity ZDD_ANNUAL_NOTIFI_INITIATOR
 
{
  key customer : sysuuid_x16;
 status : abap.char(10);
  
}
