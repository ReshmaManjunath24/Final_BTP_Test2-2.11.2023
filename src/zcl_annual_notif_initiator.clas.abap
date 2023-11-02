CLASS zcl_annual_notif_initiator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES: if_rap_query_provider.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_annual_notif_initiator IMPLEMENTATION.

METHOD if_rap_query_provider~select.
   "_Select
    DATA: BEGIN OF ls_filter_plain,
            documentid TYPE if_rap_query_filter=>tt_range_option,
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


 DATA: ls_init TYPE ZDD_WF_REVIEWERS_LIST,
        ls_customer type zdd_customer.
SELECT SINGLE * FROM ZDD_WF_REVIEWERS_LIST WHERE  customer in @<ls_filter_cond>-range
and Role = 'Initiator' INTO @ls_init.
SELECT SINGLE * from zdd_customer where zcustomer_num in @<ls_filter_cond>-range into @ls_customer.



TRY.

        DATA(lo_mail) = cl_bcs_mail_message=>create_instance( ).

        lo_mail->set_sender( 'BTP-CLAP@iffco.com' ).
      lo_mail->add_recipient( iv_address = 'mustafa.alaran@vaspp.com' ).
        lo_mail->add_recipient( iv_address = 'reshma.m@vaspp.com' ).
                lo_mail->add_recipient( 'akshay.pattar@vaspp.com' ).
 lo_mail->add_recipient( 'sohail.khan@vaspp.com' ).


        lo_mail->set_subject( iv_subject = 'CLAP-Request: Annual Review' ).
        DATA: iv_message TYPE string.
*        iv_message = '<p>Dear Initiator,</p> <p>the The Approver A has added a Query to the following request :</p><p> Reqeust_No: Request1 </p><p> customer: customer1 </p><p> comment: comment1</p> <p>Open Clap Request</p> '.
        iv_message = '<p>Dear Initiator,</p> <p>Customer is submitted for annual Review :</p><p> Reqeust_No: Request1 </p><p> customer: customer1 </p> <p>Open Clap Request</p> '.
        REPLACE 'Request1' WITH ls_customer-zrequest_no INTO

         iv_message.
         REPLACE 'customer1' WITH ls_customer-zcustomer_legal_name INTO
         iv_message.



        REPLACE 'Initiator' WITH ls_init-Name INTO
       iv_message.
        lo_mail->set_main( cl_bcs_mail_textpart=>create_instance(
            iv_content      = iv_message

            iv_content_type = 'text/html' )  ).


        lo_mail->send( IMPORTING et_status = DATA(lt_status) ).


    ENDTRY.


DATA:lt_result  TYPE TABLE of ZDD_ANNUAL_NOTIFI_INITIATOR.

*    DATA(lo_bp) = NEW zcl_wf_bp( ).
*    DATA(lt_bp) = lo_bp->try_to_update_bp(  ).
*

 APPEND INITIAL LINE TO lt_result ASSIGNING FIELD-SYMBOL(<ls_result>).
   <ls_result>-customer = ls_init-customer.
                      <ls_result>-status = 'Email Sent'.

*                      role     = ls_approver-role

*    ENDLOOP.
    io_response->set_data( lt_result ).
    io_response->set_total_number_of_records( 1 ).


ENDMETHOD.
ENDCLASS.
