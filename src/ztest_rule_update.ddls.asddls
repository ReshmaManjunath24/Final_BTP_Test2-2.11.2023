@EndUserText.label: 'Custom CDS for Update Entity'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_RULE_TEST'

define custom entity ZTest_Rule_Update 
 {
  key rule_id :sysuuid_x16;
  process : abap.char(70);
  customer_type : abap.char(70);
  zbusiness_partner_id : abap.char(70);
  FieldName : abap.char(70);
  CustomerTab  : abap.char(70);
  CustomerSub1  : abap.char(70);
  LayoutNo      : abap.char(70);
  visibility : abap.char(70);
  mandatory : abap.char(70);
  
}
