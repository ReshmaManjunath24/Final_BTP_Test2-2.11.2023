
CLASS ztest_delete DEFINITION PUBLIC FINAL CREATE PUBLIC.
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.


   CONSTANTS:
      c_destination TYPE string VALUE 'S4D',
      rfc_destination TYPE string VALUE 'Z_IFFCO_MDG_CREATE_CUSTOMER'.



  PROTECTED SECTION.
  PRIVATE SECTION.
*    CONSTANTS:
*      c_destination TYPE string VALUE 'Z_IFFCO_MDG_CREATE_CUSTOMER'.
ENDCLASS.


CLASS ztest_delete IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


*
*  select single  from zdd_customer where zcustomer_num @data(lt_customer).
*  LOOP at lt_customer into data(ls_customer).
*  SHIFT ls_customer-zreconciliation_account  LEFT DELETING LEADING '0'.
update ztab_salesarea
set zshipping_conditions = '01',
zaccount_assignment_group = '01',
ztax_classification = '1'

where zcustomer_num = '9EAF1E7861C21EEE9DF93A53A4469D7D'.

*update ztab_customers
*set zregion = '01',
*zlanguage = 'HI',
*ztransportation_zone = 'IN00000003',
*zreconciliation_account = '0001431198'
*
*where zcustomer_num = '9EAF1E7861C21EEE9DF93A53A4469D7D'.
ENDMETHOD.
ENDCLASS.
















