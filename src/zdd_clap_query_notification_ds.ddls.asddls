@EndUserText.label: 'Custom Entity for Query to Initiator'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_QUERY_NOTIFICATION_DS'
define custom entity ZDD_CLAP_QUERY_NOTIFICATION_DS

{
  key customer : sysuuid_x16;
  zcomment : abap.sstring(255);
  
}
