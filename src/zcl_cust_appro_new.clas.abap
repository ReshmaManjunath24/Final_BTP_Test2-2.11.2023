CLASS zcl_cust_appro_new DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun. "_For testing"

    TYPES:
      BEGIN OF mty_s_approver,
        email   TYPE string,
        name    TYPE string,
        remarks TYPE string,
      END OF mty_s_approver,
      mty_t_approver TYPE STANDARD TABLE OF mty_s_approver WITH EMPTY KEY,

      BEGIN OF mty_s_properties,
        businessunit TYPE string,
      END OF mty_s_properties.


    CLASS-METHODS:


      create_by_customer
        IMPORTING
                  iv_customernum TYPE sysuuid_x16
        RETURNING VALUE(ro_res)  TYPE REF TO zcl_cust_appro_new,

      create_by_properties
        IMPORTING
                  is_properties TYPE mty_s_properties
        RETURNING VALUE(ro_res) TYPE REF TO zcl_cust_appro_new.

    METHODS:





      get_approvers
        RETURNING VALUE(rt_approvers) TYPE mty_t_approver,


      select_properties
        IMPORTING
                  iv_customernum       TYPE sysuuid_x16
        RETURNING VALUE(rs_properties) TYPE mty_s_properties,


      select_remarks
        IMPORTING
                  iv_businessunit   TYPE string
        RETURNING VALUE(rv_remarks) TYPE string,


      select_businessunit
        IMPORTING
                  iv_businessunit        TYPE string
        RETURNING VALUE(rs_businessunit) TYPE ztab_businessunt,


      gather_approvers_list
        IMPORTING
                  is_businessunit     TYPE ztab_businessunt
                  iv_remarks          TYPE string
        RETURNING VALUE(rt_approvers) TYPE mty_t_approver.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA:
      mv_customernum TYPE ztab_clap1-zcustomer_num,
      ms_properties  TYPE mty_s_properties.
ENDCLASS.



CLASS ZCL_CUST_APPRO_NEW IMPLEMENTATION.


  METHOD select_properties.
    SELECT SINGLE
           zbusiness_unit_name AS businessunit
        FROM zdd_customer
        WHERE zcustomer_num = @iv_customernum
    INTO CORRESPONDING FIELDS OF @rs_properties.
  ENDMETHOD.


  METHOD create_by_customer.
    ro_res = NEW zcl_cust_appro_new( ).
    ro_res->mv_customernum = iv_customernum.
    ro_res->ms_properties = ro_res->select_properties( iv_customernum ).
  ENDMETHOD.


  METHOD create_by_properties.
    ro_res = NEW zcl_cust_appro_new( ).
    ro_res->ms_properties  = is_properties.
  ENDMETHOD.


  METHOD get_approvers.
    DATA(lv_remarks) = select_remarks(
                                         iv_businessunit = ms_properties-businessunit

                                         ).

    DATA(ls_businessunit) = select_businessunit( iv_businessunit = ms_properties-businessunit

                                                 ).

    rt_approvers = gather_approvers_list( is_businessunit = ls_businessunit
                                          iv_remarks     = lv_remarks ).
  ENDMETHOD.


  METHOD select_businessunit.
    SELECT *
        FROM ztab_businessunt
        WHERE businessunit = @iv_businessunit
        INTO @rs_businessunit
        UP TO 1 ROWS.
    ENDSELECT.
  ENDMETHOD.


  METHOD gather_approvers_list.
    SPLIT iv_remarks AT '-' INTO TABLE DATA(lt_codes).
    LOOP AT lt_codes ASSIGNING FIELD-SYMBOL(<lv_code>).
      ASSIGN COMPONENT <lv_code> OF STRUCTURE is_businessunit TO FIELD-SYMBOL(<lv_val0>).
      CHECK sy-subrc = 0.
      ASSIGN COMPONENT |{ <lv_code> }emailid| OF STRUCTURE is_businessunit TO FIELD-SYMBOL(<lv_email>).
      CHECK sy-subrc = 0 AND <lv_email> <> 'NA'.
      APPEND VALUE #(
        name  = <lv_val0>
        email = <lv_email>
        remarks  = <lv_code>
      ) TO rt_approvers.
    ENDLOOP.
  ENDMETHOD.


  METHOD select_remarks.
* For the sake of initial debug won't filter by credit limit in the query
    "_ztab_delegation-businessunit is char40, iv_businessunit is char70
    DATA(lv_businessunit) = VALUE ztab_delegation-businessunit( ).
    lv_businessunit = iv_businessunit.

    SELECT *
        FROM ztab_customer_ap
        WHERE
           businessunit = @lv_businessunit
        INTO TABLE @DATA(lt_doa).
    IF sy-subrc <> 0.
      RETURN.
    ENDIF.

    "LOOP AT lt_doa ASSIGNING FIELD-SYMBOL(<ls_doa>)."
    "rv_roletype = <ls_doa>-roletype."
    "  RETURN. "
    "ENDLOOP."
  ENDMETHOD.
ENDCLASS.
