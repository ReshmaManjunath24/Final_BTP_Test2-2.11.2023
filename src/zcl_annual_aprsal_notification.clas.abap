CLASS zcl_annual_aprsal_notification DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_rap_query_provider.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_annual_aprsal_notification IMPLEMENTATION.


  METHOD if_rap_query_provider~select.
    "_Select
    DATA: BEGIN OF ls_filter_plain,
            documentid TYPE if_rap_query_filter=>tt_range_option,
          END OF ls_filter_plain.

    DATA: BEGIN OF ls_key,
            documentid TYPE sysuuid_x16,
          END OF ls_key.

* filtering on a particular guid ID not required
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



    DATA: ls_request TYPE zdd_annual_appraisal_list,
          lt_request TYPE STANDARD TABLE OF zdd_annual_appraisal_list.


* Get Notification Date from Customer Table
    SELECT  * FROM zdd_annual_appraisal_list WHERE  Notification_Date = @sy-datum INTO TABLE  @lt_request.


* Generate Request number
    LOOP AT lt_request INTO ls_request.
      DATA: ls_request_no TYPE c.

      DATA(lv_random_num) = cl_abap_random_int=>create( seed = cl_abap_random=>seed( )
                                                        min  = 4000
                                                        max  = 999999 )->get_next( ).

      DATA l_uuid_x16 TYPE sysuuid_x16.
      l_uuid_x16 = NEW cl_system_uuid( )->if_system_uuid~create_uuid_x16( ).

*lv_numc = ls_request_no.
* create/edit request



      DATA: ls_request_update TYPE ztab_customers,
            lt_request_update TYPE STANDARD TABLE OF ztab_customers.

      SELECT SINGLE * FROM ztab_customers WHERE zcustomer_num = @ls_request-zcustomer_num INTO  @ls_request_update.

* preparing new request and make current request basic info empty and ready for new request data

      CLEAR ls_request_update-zcustomer_num.
      CLEAR ls_request_update-zrequest_no.
      CLEAR ls_request_update-zrequest_type.
      CLEAR ls_request_update-zrequest_status .
      CLEAR ls_request_update-is_active.
      clear ls_request_update-zmdg_request.

* replace current request with new generated GUID and insert in DB

      ls_request_update-zcustomer_num = l_uuid_x16.
      ls_request_update-zrequest_no = lv_random_num.
      ls_request_update-zrequest_type = 'Annual Appraisal'.
      ls_request_update-zrequest_status = 'In Draft'.
      ls_request_update-zstatus = 'In Draft'.


* has to be uncommented later on

      INSERT INTO ztab_customers VALUES @ls_request_update.


** apply GUID to sales table
      DATA: ls_request_sales TYPE ztab_salesarea,
            lt_request_sales TYPE STANDARD TABLE OF ztab_salesarea.

* has to be uncommented later on to avoid data insert

      SELECT  * FROM ztab_salesarea WHERE zcustomer_num = @ls_request-zcustomer_num INTO  TABLE @lt_request_sales.


      LOOP AT lt_request_sales INTO ls_request_sales.

        CLEAR ls_request_sales-zcustomer_num.
        CLEAR ls_request_sales-zrequest_no.
        clear ls_request_sales-zmdg_request.
        clear ls_request_sales-zis_credit_created.


        ls_request_sales-zcustomer_num = l_uuid_x16.
        ls_request_sales-zrequest_no = lv_random_num.


        INSERT INTO ztab_salesarea VALUES @ls_request_sales.


      ENDLOOP.



      DATA : w_date      TYPE dats,
             w_date1(10),
             w_date2(1)  VALUE '.'.
      w_date1 = w_date.


** Date Conversion: display correct format in Mail Template
      CONCATENATE ls_request-zvalid_to+6(2) ls_request-zvalid_to+4(2) ls_request-zvalid_to+0(4) INTO w_date1 SEPARATED BY w_date2.


** Email Instances and Template Creation
      TRY.

          DATA(lo_mail) = cl_bcs_mail_message=>create_instance( ).

          lo_mail->set_sender( 'BTP-CLAP@iffco.com' ).
*        lo_mail->add_recipient( 'mustafa.alaran@vaspp.com' ).
          lo_mail->add_recipient( 'reshma.m@vaspp.com' ).
          lo_mail->add_recipient( 'akshay.pattar@vaspp.com' ).


          lo_mail->set_subject( iv_subject = 'CLAP-Notification: Credit Limit Expiry' ).
          DATA: iv_message TYPE string.
          iv_message =
  '<p>Dear Credit Controller,</p> <p>the Credit limit for customer A expires in 30 Days:</p><p> Reqeust_No: Request1 </p><p> New Request: Request2 </p><p> Licence_ No: License1 </p> <p> Valid to: Valid1 </p> <p><a href={Url}>Click here to view.</a></p>'.
          REPLACE 'Request1' WITH ls_request-zrequest_no INTO
           iv_message.
          REPLACE 'Request2' WITH  ls_request_update-zrequest_no INTO
           iv_message.
          REPLACE 'A' WITH ls_request-zfirst_name INTO
           iv_message.
          REPLACE 'License1' WITH ls_request-zlicense_no INTO
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
    ENDLOOP.

    DATA:lt_result  TYPE TABLE OF zdd_annaul_aprsal_notification.

*    DATA(lo_bp) = NEW zcl_wf_bp( ).
*    DATA(lt_bp) = lo_bp->try_to_update_bp(  ).
*
* service return value
    APPEND INITIAL LINE TO lt_result ASSIGNING FIELD-SYMBOL(<ls_result>).
    <ls_result>-customer = ls_request_sales-zcustomer_num.
    <ls_result>-status = 'Email Sent'.

*                      role     = ls_approver-role

* set data and get result
    io_response->set_data( lt_result ).
    io_response->set_total_number_of_records( 1 ).






















  ENDMETHOD.

ENDCLASS.
