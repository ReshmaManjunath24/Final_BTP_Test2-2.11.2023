CLASS ztrade_notification_60days
  DEFINITION PUBLIC FINAL CREATE PUBLIC.
  PUBLIC SECTION.
    INTERFACES if_rap_query_provider.
ENDCLASS.



CLASS ZTRADE_NOTIFICATION_60DAYS IMPLEMENTATION.


METHOD if_rap_query_provider~select.
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



    DATA: ls_request TYPE ZDD_TRADE_VALIDITIY_RAP_FLAG,
          lt_request type table of ZDD_TRADE_VALIDITIY_RAP_FLAG.


* Get Notification Date from Customer Table
*********************************************************************SELECT SINGLE * FROM ZDD_TRADE_VALIDITIY_RAP_FLAG WHERE  TradeNotification_Date = '20181201' INTO @ls_request.
 SELECT * FROM ZDD_TRADE_VALIDITIY_RAP_FLAG WHERE  zflag60 = 'X' INTO table  @lt_request.





* Get Notification Date from Customer Table
*SELECT SINGLE * FROM ZDD_TRADE_VALIDITIY_RAP_FLAG WHERE  TradeNotification_Date = '20181201' INTO @ls_request.


LOOP at lt_request into ls_request.


if sy-subrc = 0.
    DATA: ls_request_no TYPE c.


    DATA : w_date      TYPE dats,
           w_date1(10),
           w_date2(1)  VALUE '.'.
    w_date1 = w_date.

concatenate ls_request-zlicense_validto+6(2) ls_request-zlicense_validto+4(2) ls_request-zlicense_validto+0(4) into w_date1 separated by w_date2.


** Email Instances and Template Creation
    TRY.
        DATA(lo_mail) = cl_bcs_mail_message=>create_instance( ).

        lo_mail->set_sender( 'BTP-CLAP@iffco.com' ).
        lo_mail->add_recipient( 'akshay.pattar@vaspp.com' ).
        lo_mail->add_recipient( 'reshma.m@vaspp.com' ).

        lo_mail->set_subject( 'Notification: Trade License Expiry' ).
        DATA: iv_message TYPE string.
        iv_message =
'<p>Dear Credit  Controller,</p> <p>the Trade License for customer is Expired :</p><p> Business Partner ID : BPID </p><p> Reqeust_No: Request1 </p><p> Licence_ No: License1 </p> <p> Valid to: Valid1 </p> <p><a href={Url}>Click here to view.</a></p> '.

        REPLACE 'Request1' WITH ls_request-zrequest_no INTO
         iv_message.
        REPLACE 'A' WITH ls_request-zfirst_name INTO
         iv_message.
        REPLACE 'License1' WITH ls_request-zlicense_no INTO
        iv_message.
        REPLACE 'BPID' WITH ls_request-zmdg_bp_id INTO
        iv_message.
        REPLACE 'Valid1' WITH w_date1 INTO
        iv_message.
      REPLACE '{Url}' WITH 'https://iffcodev.launchpad.cfapps.eu10.hana.ondemand.com/site?siteId=82eb4ca9-2654-424d-b2f5-7cf09fafb69b#clap-create?sap-ui-app-id-hint=95342aed-35a3-4cc9-9574-cbcb14516507' INTO iv_message.

         REPLACE 'Credit Controller' WITH ls_request-Credit_Controller INTO
        iv_message.
        lo_mail->set_main( cl_bcs_mail_textpart=>create_instance(
            iv_content      = iv_message

            iv_content_type = 'text/html' )  ).


        lo_mail->send( IMPORTING et_status = DATA(lt_status) ).


    ENDTRY.

ENDIF.
    endloop.

  DATA:lt_result  TYPE TABLE of ZDD_ANNUAL_TRADE_NOTIFI_60DAY.

*    DATA(lo_bp) = NEW zcl_wf_bp( ).
*    DATA(lt_bp) = lo_bp->try_to_update_bp(  ).
*

 APPEND INITIAL LINE TO lt_result ASSIGNING FIELD-SYMBOL(<ls_result>).
   <ls_result>-customer = ls_request-zcustomer_num.
                      <ls_result>-status = 'Email Sent'.

*                      role     = ls_approver-role

*    ENDLOOP.
    io_response->set_data( lt_result ).
    io_response->set_total_number_of_records( 1 ).








*ENDIF.
ENDMETHOD.
ENDCLASS.
