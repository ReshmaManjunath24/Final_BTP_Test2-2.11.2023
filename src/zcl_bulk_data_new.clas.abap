CLASS zcl_bulk_data_new DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_rap_query_provider.

    "! <p class="shorttext synchronized" lang="en">Structure type for entity ZDD_WF_BULK_APPROVERS</p>
    TYPES: mty_s_approvers TYPE zdd_wf_bulk_approvers,
           "! <p class="shorttext synchronized" lang="en">Table type for entities ZDD_WF_BULK_APPROVERS</p>
           mty_t_approvers TYPE STANDARD TABLE OF mty_s_approvers WITH EMPTY KEY.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_BULK_DATA_NEW IMPLEMENTATION.


  METHOD if_rap_query_provider~select.
    "_Select
    DATA: BEGIN OF ls_filter_plain,
            documentid TYPE if_rap_query_filter=>tt_range_option,
*            bp_id TYPE if_rap_query_filter=>tt_range_option,
          END OF ls_filter_plain.

    DATA: BEGIN OF ls_key,
            documentid TYPE sysuuid_x16,

          END OF ls_key.

    DATA(lv_top)         = io_request->get_paging( )->get_page_size( ).
    DATA(lv_skip)        = io_request->get_paging( )->get_offset( ).
    DATA(lt_fields)      = io_request->get_requested_elements( ).
    DATA(lt_sort)        = io_request->get_sort_elements( ).
    DATA(lt_filter_cond) = io_request->get_filter( )->get_as_ranges( ).

    LOOP AT lt_filter_cond ASSIGNING FIELD-SYMBOL(<ls_filter_cond>).
      ASSIGN COMPONENT <ls_filter_cond>-name OF STRUCTURE ls_filter_plain TO FIELD-SYMBOL(<lv_any>).
      CHECK sy-subrc = 0.
      <lv_any> = <ls_filter_cond>-range.
      ASSIGN COMPONENT <ls_filter_cond>-name OF STRUCTURE ls_key TO <lv_any>.
      CHECK sy-subrc = 0.
      <lv_any> = <ls_filter_cond>-range[ 1 ]-low.
    ENDLOOP.

    SELECT SINGLE *
        FROM zcust_mass_upld
        WHERE identifier IN @ls_filter_plain-documentid
    INTO  @DATA(ls_doc).


    data: lt_excel_records type standard table of zcust_mass_upld,
          ls_excel_records type zcust_mass_upld.
 DATA:  lt_result  TYPE STANDARD TABLE OF ZDD_WF_GET_APPROVERS_BULK.
          SELECT  * from zcust_mass_upld where identifier = @ls_doc-identifier

*           and account_number = @ls_doc-account_number

            INTO table @lt_excel_records.
          LOOP at lt_excel_records into ls_excel_records.


       data: lt_approvers_list TYPE STANDARD TABLE OF ztab_doa_bulk.

             SELECT * from  ztab_doa_bulk  where
              bu_code =  @ls_excel_records-bu_code and vertical = @ls_excel_records-zvertical
        AND   minimumcreditamount <= @ls_excel_records-creditlimitamount
        AND maximumcreditamount >= @ls_excel_records-creditlimitamount
         ORDER BY maximumcreditamount DESCENDING



             INTo table @lt_approvers_list .


                 LOOP AT lt_approvers_list INTO DATA(ls_approver).
                 DELETE ADJACENT DUPLICATES FROM lt_approvers_list.

* for testing internal user-- has to be removed later on
                    if ls_approver-role_type = 'CEO'.
                    ls_approver-email_id = 't_apattar@iffco.com'.
                    ELSEif
                     ls_approver-role_type = 'MD'.
                     ls_approver-email_id = 't_reshmam@iffco.com'.
                    ELSEIF
                     ls_approver-role_type = 'ED'.
                     ls_approver-email_id = 't_apattar@iffco.com'.
                    ELSEIF
                     ls_approver-role_type = 'ED'.
                     ls_approver-email_id = 't_reshmam@iffco.com'.
                    ELSEIF
                     ls_approver-role_type = 'SB'.
                     ls_approver-email_id = 't_apattar@iffco.com'.

                     ENDIF.





      APPEND VALUE #( documentid = ls_excel_records-identifier
                      bp_id =      ls_excel_records-account_number
                      email    = ls_approver-email_id
                      name     = ls_approver-name
                      role     = ls_approver-role_type
                    ) to lt_result.



    ENDLOOP.
     ENDLOOP.
                    DELETE ADJACENT DUPLICATES FROM lt_result.
    "_1. select ztab_doc entry
    "_2. get excel data
*    DATA(lo_bulk) = NEW zcl_core_bulk_split( ls_doc-documentid ).
*    DATA(lt_approvers) = lo_bulk->get_approvers( ).
*    DATA(lt_result) = CORRESPONDING mty_t_approvers( lt_approvers ).
*    DATA(lt_result) = CORRESPONDING mty_t_approvers( lt_approvers ).


*    DATA(lt_approvers) = lo_wf_core->get_approvers( ).

*    DATA(lt_result) = VALUE ZDD_WF_GET_APPROVERS_BULK( ).



    io_response->set_total_number_of_records( lines( lt_result ) ).
    io_response->set_data( lt_result ).
  ENDMETHOD.
ENDCLASS.
