CLASS ztest2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZTEST2 IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.
*DATA LV_ID TYPE ZDD_CUSTOMER-zbusiness_partner_id.
*LV_ID = 1.
*UPDATE ZTAB_CUSTOMER
*set zbusiness_partner_id = @lv_id
*where zbusiness_partner_id = 'C2FA1CE6DFE31EEE87DE5D7899E777D4'.


update ztab_salesarea
set zvalidity_to = '20231120'
*where zbusiness_partner_id = '50000147'.
where zcustomer_num = '5E2EE98345D41EEE9BB2D7DB4499F02D'.

endmethod.
ENDCLASS.
