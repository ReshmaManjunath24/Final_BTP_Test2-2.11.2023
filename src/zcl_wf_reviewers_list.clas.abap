CLASS zcl_wf_reviewers_list DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_rap_query_provider.
    TYPES:
           "! <p class="shorttext synchronized" lang="en">Table type for WF Customer's approver entities</p>
           mty_t_wf_customer_approvers TYPE STANDARD TABLE OF zdd_wf_customer_approvers WITH EMPTY KEY.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_wf_reviewers_list IMPLEMENTATION.


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

    "_Create an instance of ZCL_WF_CORE

    "get Approvers
    data: lt_customer type STANDARD TABLE OF ZDD_WF_REVIEWERS_LIST.
    SELECT  customer,
                  role,
                  name,
                  email
        FROM ZDD_WF_REVIEWERS_LIST
        WHERE customer IN @ls_filter_plain-customer
    INTO table @lt_customer.



    "_Get a list of approvers

    "_Fill in response entities
   data lt_result type STANDARD TABLE OF ZDD_WF_REVIEWERS_ENTITY.
    LOOP AT lt_customer INTO DATA(ls_reviewers).
      APPEND VALUE #( customer = ls_reviewers-customer
                      email    = ls_reviewers-email
                      name     = ls_reviewers-name
                      role     = ls_reviewers-role
                    ) TO lt_result.
    ENDLOOP.

    io_response->set_total_number_of_records( lines( lt_result ) ).
    io_response->set_data( lt_result ).
  ENDMETHOD.
ENDCLASS.
