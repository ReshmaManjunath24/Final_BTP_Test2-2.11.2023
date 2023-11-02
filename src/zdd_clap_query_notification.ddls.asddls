@EndUserText.label: 'Custom Entity for Query to Initiator'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_QUERY_NOTIFICATION'
define custom entity ZDD_CLAP_QUERY_NOTIFICATION

{
  key customer : sysuuid_x16;
  zcomment : abap.sstring(255);
  
}
