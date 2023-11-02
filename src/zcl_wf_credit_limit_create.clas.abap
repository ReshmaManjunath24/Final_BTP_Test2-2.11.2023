
CLASS zcl_wf_credit_limit_create DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_rap_query_provider.

  PROTECTED SECTION.
  PRIVATE SECTION.

    TYPES:
       tt_result TYPE STANDARD TABLE OF zcreditmanagementaccount WITH EMPTY KEY.

    CONSTANTS:
      c_destination TYPE string VALUE `S4D`,
      c_entity      TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'CREDITMANAGEMENTACCOUNT'.

    METHODS:
      get_proxy
        RETURNING VALUE(ro_result) TYPE REF TO /iwbep/if_cp_client_proxy.

ENDCLASS.

CLASS zcl_wf_credit_limit_create IMPLEMENTATION.


  METHOD get_proxy.

    TRY.
        DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination(
          i_name       = c_destination
          i_authn_mode = if_a4c_cp_service=>service_specific
        ).

        DATA(lo_client) = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).

      CATCH cx_root.

    ENDTRY.

  ENDMETHOD.

  METHOD if_rap_query_provider~select.
    DATA: BEGIN OF ls_filter_plain,
            documentid TYPE if_rap_query_filter=>tt_range_option,
          END OF ls_filter_plain.

    DATA: BEGIN OF ls_key1,
            documentid TYPE sysuuid_x16,
          END OF ls_key1.

    DATA(lv_top)         = io_request->get_paging( )->get_page_size( ).
    DATA(lv_skip)        = io_request->get_paging( )->get_offset( ).
    DATA(lt_fields)      = io_request->get_requested_elements( ).
    DATA(lt_sort)        = io_request->get_sort_elements( ).
    DATA(lt_filter_cond) = io_request->get_filter( )->get_as_ranges( ).

    LOOP AT lt_filter_cond ASSIGNING FIELD-SYMBOL(<ls_filter_cond>).
      ASSIGN COMPONENT <ls_filter_cond>-name OF STRUCTURE ls_filter_plain TO FIELD-SYMBOL(<lv_any>).
      CHECK sy-subrc = 0.
      <lv_any> = <ls_filter_cond>-range.
      ASSIGN COMPONENT <ls_filter_cond>-name OF STRUCTURE ls_key1 TO <lv_any>.
      CHECK sy-subrc = 0.
      <lv_any> = <ls_filter_cond>-range[ 1 ]-low.
    ENDLOOP.
    DATA ls_bp TYPE  zdd_customer.

    DATA ls_BP_Data TYPE ztab_customers.
    DATA lt_BP_Data TYPE TABLE OF ztab_customers.
    DATA ls_Sales_Area TYPE ztab_salesarea.
    DATA lt_Sales_Area TYPE TABLE OF ztab_salesarea.

    SELECT * FROM ztab_customers  WHERE zmdg_status = 'A'  AND (  zrequest_type = 'Create Customer'  or zrequest_type = 'Extend Customer' ) ORDER BY  zcreated_date DESCENDING INTO TABLE @lt_bp_data.
    LOOP AT lt_bp_data INTO ls_bp_data.
      SELECT  * FROM ztab_salesarea WHERE zcustomer_num = @ls_bp_data-zcustomer_num AND zmdg_bp_id = @ls_bp_data-zmdg_bp_id AND zis_credit_created <> 'Yes' AND zlimit <> 0 AND zcredit_segment <> '' INTO  TABLE @lt_sales_area.
      LOOP AT lt_sales_area INTO ls_sales_area.

** Create Credit Profile Data with Standard APIs


        DATA(lo_wf_update) = NEW zcl_credit_limit_create( ).
        lo_wf_update->create_Credit_data( iv_customer_num = ls_sales_area-zcustomer_num iv_segment = ls_sales_area-zcredit_segment iv_bpid = ls_sales_area-zmdg_bp_id ).

** Create Additional Credit Segment with FMs
        DATA(lo_wf_extend) = NEW zcl_credit_limit_create( ).
        lo_wf_extend->extend_credit_data( iv_customer_num = ls_sales_area-zcustomer_num iv_segment = ls_sales_area-zcredit_segment iv_bpid = conv #( ls_sales_area-zmdg_bp_id ) ).

      ENDLOOP.
    ENDLOOP.

** Update Credit Limit with Standard APIs

    SELECT * FROM ztab_customers  WHERE zmdg_status = 'A'  AND (  zrequest_type = 'Annual Appraisal'  or zrequest_type = 'Change Customer' ) ORDER BY  zcreated_date DESCENDING INTO TABLE @lt_bp_data.
    LOOP AT lt_bp_data INTO ls_bp_data.
      SELECT  * FROM ztab_salesarea WHERE zcustomer_num = @ls_bp_data-zcustomer_num AND zmdg_bp_id = @ls_bp_data-zmdg_bp_id AND zis_credit_created <> 'Yes' AND zlimit <> 0 AND zcredit_segment <> '' INTO  TABLE @lt_sales_area.
      LOOP AT lt_sales_area INTO ls_sales_area.

** Create Credit Profile Data with Standard APIs


        DATA(lo_update) = NEW zcl_credit_limit_update( ).
        lo_update->update_Credit_data( iv_customer_num = ls_sales_area-zcustomer_num ).


      ENDLOOP.
    ENDLOOP.
    DATA:lt_result  TYPE TABLE OF zdd_update_credit_limit_api.


    APPEND INITIAL LINE TO lt_result ASSIGNING FIELD-SYMBOL(<ls_result>).
    <ls_result>-customer = ls_sales_area-zcustomer_num.
    <ls_result>-status = 'Completed'.

    io_response->set_data( lt_result ).
    io_response->set_total_number_of_records( 1 ).
  ENDMETHOD.
ENDCLASS.
