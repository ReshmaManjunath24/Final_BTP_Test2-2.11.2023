CLASS zcl_mdm_masters_split DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
      INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_mdm_masters_split IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.



data: ls_MDM type ztab_businessunt,
      lt_MDM TYPE STANDARD TABLE OF ztab_businessunt,
      lv_mdm type STANDARD TABLE OF ztab_businessunt,
      lv_mdm_email type STANDARD TABLE OF ztab_businessunt.

 SELECT single * from ztab_businessunt where CEO <> 'NA' into @ls_MDM.

DATA : LV_STRING TYPE STRING,
       LV_STRING1 type string.
TYPES: BEGIN OF TY_STRING,
      MDM(25) TYPE C,
      MDMEMAILID(50) TYPE C,

      END OF TY_STRING.
DATA IT_STRING TYPE TABLE OF TY_STRING-mdm.
DATA IT_STRING1 TYPE TABLE OF TY_STRING-mdmemailid.
DATA WA_STRING TYPE TY_STRING .


data lt_final type  table of  ztab_mdm_masters .
data ls_final type  ty_string .
data: ls_mdm_master type  ty_string.

SPLIT ls_mdm-mdm  AT ',' INTO TABLE IT_STRING .
LOOP at IT_STRING into ls_mdm_master-mdm.
 ls_final-mdm = ls_mdm_master-mdm.
 APPEND ls_final-mdm to lt_final.

ENDLOOP.
*INSERT ztab_mdm_masters from table @lt_final.

*SPLIT ls_mdm-mdmemailid  AT ',' INTO TABLE IT_STRING1.
*LOOP at IT_STRING1 into ls_mdm_master-mdmemailid.
* ls_final-mdmemailid = ls_mdm_master-mdmemailid.
* APPEND ls_final-mdmemailid to lt_final .
*
*ENDLOOP.
**
*SPLIT ls_mdm-mdmemailid  AT ',' INTO table IT_STRING1.
*
*app  IT_STRING1 to lt_final EXPANDING NESTED TABLES.
**
**LOOP AT IT_STRING INTO WA_STRING-mdmemailid.
**
**WA_STRING-mdmemailid = ls_mdm_master-email.
*

*
*

*
*
*
*
*
*
*
*ENDLOOP.







  ENDMETHOD.

ENDCLASS.
