CLASS zcl_qp_customer_approvers_new DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_rap_query_provider.
    TYPES:
           "! <p class="shorttext synchronized" lang="en">Table type for WF Customer's approver entities</p>
           mty_t_wf_customer_approvers TYPE STANDARD TABLE OF ZDD_WF_GET_APPROVERS_MD WITH EMPTY KEY.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_QP_CUSTOMER_APPROVERS_NEW IMPLEMENTATION.


 METHOD if_rap_query_provider~select.
    DATA: BEGIN OF ls_filter_plain,
            customer           TYPE if_rap_query_filter=>tt_range_option,
            zsales_orgnization TYPE if_rap_query_filter=>tt_range_option,
          END OF ls_filter_plain.

    DATA: BEGIN OF ls_key,
            customer           TYPE sysuuid_x16,
            zsales_orgnization TYPE string,
          END OF ls_key.

    DATA(lv_top)         = io_request->get_paging( )->get_page_size( ).
    DATA(lv_skip)        = io_request->get_paging( )->get_offset( ).
    DATA(lt_fields)      = io_request->get_requested_elements( ).
    DATA(lt_sort)        = io_request->get_sort_elements( ).
    DATA(lt_filter_cond) = io_request->get_filter( )->get_as_ranges( ).

    "_Fill ls_key flat structure from filter table
    LOOP AT lt_filter_cond ASSIGNING FIELD-SYMBOL(<ls_filter_cond>).
      ASSIGN COMPONENT <ls_filter_cond>-name OF STRUCTURE ls_filter_plain TO FIELD-SYMBOL(<lv_any>).
      CHECK sy-subrc = 0.
      <lv_any> = <ls_filter_cond>-range.
      ASSIGN COMPONENT <ls_filter_cond>-name OF STRUCTURE ls_key TO <lv_any>.
      CHECK sy-subrc = 0.
      <lv_any> = <ls_filter_cond>-range[ 1 ]-low.
    ENDLOOP.

    "_Create an instance of ZCL_cust_appro_new
    SELECT *
                FROM zdd_customer
        WHERE zcustomer_num IN @ls_filter_plain-customer
    INTO @DATA(ls_customer).

        ENDSELECT.
*data ls_approvers_md type  ztab_customer_ap.
*data lt_approvers_md type standard table of ztab_customer_ap.

data ls_approvers_md type  ZDD_MASTER_LIST.
data lt_approvers_md type standard table of ZDD_MASTER_LIST.

*SELECT * from ztab_customer_ap  WHERE businessunit = @ls_customer-zbusiness_unit_name  INTO table  @lt_approvers_md.
SELECT * from ZDD_MASTER_LIST  WHERE businessunit = @ls_customer-zbusiness_unit_name  INTO table  @lt_approvers_md.


    DATA(lo_wf_core) = zcl_cust_appro_new=>create_by_customer(
      iv_customernum = ls_customer-zcustomer_num

    ).

    "_Get a list of approvers
    DATA(lt_approvers) = lo_wf_core->get_approvers( ).

    "_Fill in response entities
    DATA(lt_result) = VALUE mty_t_wf_customer_approvers( ).
    LOOP AT lt_approvers_md INTO DATA(ls_approver).
      APPEND VALUE #( customer = ls_customer-zcustomer_num
                      email    = ls_approver-email
                      name     = ls_approver-name
                      remarks     = ls_approver-remarks
                      businessunit =  ls_approver-businessunit
                    ) TO lt_result.
    ENDLOOP.

    io_response->set_total_number_of_records( lines( lt_result ) ).
    io_response->set_data( lt_result ).
  ENDMETHOD.
ENDCLASS.
