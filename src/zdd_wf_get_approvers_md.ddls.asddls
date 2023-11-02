@EndUserText.label: 'Approver List for Master Data'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_QP_CUSTOMER_APPROVERS_NEW'
define custom entity ZDD_WF_GET_APPROVERS_MD

{
  key customer           : sysuuid_x16;
  key email              : abap.char(70);
  name                   : abap.char(100);
  remarks                   : abap.char( 50 );
  businessunit              : abap.char(70);
  
}
