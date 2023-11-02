@EndUserText.label: 'Custom Entity for Query to Initiator'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_DSTEWARD_NOTIFICATION'
define custom entity ZDD_DATA_STEWARD_NOTIFICATION

{
  key customer : sysuuid_x16;
  status : abap.sstring(255);
  
}
