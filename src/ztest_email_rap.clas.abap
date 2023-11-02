CLASS ztest_email_rap DEFINITION PUBLIC FINAL CREATE PUBLIC.
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.



CLASS ztest_email_rap IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: ls_request TYPE zdd_annual_appraisal_list,
          ls_dsteward type ztab_customer_ap.


* Get Notification Date from Customer Table
    SELECT SINGLE * FROM zdd_annual_appraisal_list WHERE  Notification_Date = '20230725' INTO @ls_request.
    SELECT SINGLE * FROM ztab_customer_ap  WHERE businessunit = @ls_request-zbusiness_unit_name AND remarks = 'Submitted by' INTO @ls_dsteward.


    DATA: ls_request_no TYPE c.

    DATA(lv_random_num) = cl_abap_random_int=>create( seed = cl_abap_random=>seed( )
                                                      min  = 1
                                                      max  = 100 )->get_next( ).

    DATA l_uuid_x16 TYPE sysuuid_x16.
    l_uuid_x16 = NEW cl_system_uuid( )->if_system_uuid~create_uuid_x16( ).

*lv_numc = ls_request_no.
* create/edit request



    DATA: ls_request_update TYPE ztab_customers,
          lt_request_update TYPE STANDARD TABLE OF ztab_customers.

    SELECT SINGLE * FROM ztab_customers WHERE zcustomer_num = @ls_request-zcustomer_num INTO  @ls_request_update.


* replace current request with new generated GUID and insert in DB

    CLEAR ls_request_update-zcustomer_num.

    CLEAR ls_request_update-zrequest_no.

    ls_request_update-zcustomer_num = l_uuid_x16.
    ls_request_update-zrequest_no = lv_random_num.

* has to be uncommented later on

*    INSERT INTO ztab_customers VALUES @ls_request_update.


** apply GUID to sales table
    DATA: ls_request_sales TYPE ztab_salesarea,
          lt_request_sales TYPE STANDARD TABLE OF ztab_salesarea.

* has to be uncommented later on

    SELECT  * FROM ztab_salesarea WHERE zcustomer_num = @ls_request-zcustomer_num INTO  TABLE @lt_request_sales.


    LOOP AT lt_request_sales INTO ls_request_sales.

      CLEAR ls_request_sales-zcustomer_num.
      CLEAR ls_request_sales-zrequest_no.

      ls_request_sales-zcustomer_num = l_uuid_x16.
      ls_request_sales-zrequest_no = lv_random_num.


*                INSERT INTO ztab_salesarea VALUES @ls_request_sales.


    ENDLOOP.










*      UPDATE ls_request_update
*      set zrequest_no = @lv_random_num,
*      zrequest_type = 'Annual Appraisal',
*      zstatus = 'In Draft'
*      where zcustomer_num = @ls_request_update-zcustomer_num.
*
*      UPDATE ztab_salesarea
*
*      set zrequest_no = @lv_random_num
*      where zcustomer_num =  @ls_request_update-zcustomer_num.


    DATA : w_date      TYPE dats,
           w_date1(10),
           w_date2(1)  VALUE '.'.
    w_date1 = w_date.


** Date Conversion
    CONCATENATE ls_request-zvalid_to+6(2) ls_request-zvalid_to+4(2) ls_request-zvalid_to+0(4) INTO w_date1 SEPARATED BY w_date2.


** Email Instances and Template Creation
    TRY.

        DATA(lo_mail) = cl_bcs_mail_message=>create_instance( ).

        lo_mail->set_sender( 'BTP-CLAP@iffco.com' ).
        lo_mail->add_recipient( 'mustafa.alaran@vaspp.com' ).
        lo_mail->add_recipient( 'ls_dsteward-email' ).


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
        REPLACE '{Url}' WITH 'www.sap.com' INTO iv_message
.
        REPLACE 'Credit Controller' WITH ls_request-Credit_Controller INTO
       iv_message.
        lo_mail->set_main( cl_bcs_mail_textpart=>create_instance(
            iv_content      = iv_message

            iv_content_type = 'text/html' )  ).


        lo_mail->send( IMPORTING et_status = DATA(lt_status) ).

        out->write( lt_status ).

      CATCH cx_bcs_mail INTO DATA(lo_err).
        out->write( lo_err->get_longtext( ) ).
    ENDTRY.




  ENDMETHOD.
ENDCLASS.
