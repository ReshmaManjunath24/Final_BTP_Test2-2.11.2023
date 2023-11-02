@EndUserText.label: 'Workflow: Bulk Data File Approvers'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_BULK_DATA_NEW'
define root custom entity ZDD_WF_GET_APPROVERS_BULK
{
  key documentid : sysuuid_x16;
  key bp_id   : abap.char(12);
  key email      : abap.char(70);
      name       : abap.char(100);
      role       : abap.sstring(10);
}

