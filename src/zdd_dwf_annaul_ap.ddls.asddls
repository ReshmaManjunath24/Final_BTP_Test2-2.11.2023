@EndUserText.label: 'Workflow: Customer Approvers'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_DWF_ANNAUL_AP'
define custom entity ZDD_DWF_ANNAUL_AP
{
  key customer           : sysuuid_x16;
  key email              : abap.char(70);
  name                   : abap.char(100);
  role                   : abap.sstring(10);
}
