CLASS ztrade_notification
  DEFINITION PUBLIC FINAL CREATE PUBLIC.
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.



CLASS ZTRADE_NOTIFICATION IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.

    DATA: ls_request TYPE ZDD_TRADE_VALIDITIY_RAP_FLAG,
          lt_request type table of ZDD_TRADE_VALIDITIY_RAP_FLAG.




* Get Notification Date from Customer Table


**********************************************************************   SELECT SINGLE * FROM ZDD_TRADE_VALIDITIY_RAP WHERE  TradeNotification_Date = '20181201' INTO @ls_request.
   SELECT SINGLE * FROM ZDD_TRADE_VALIDITIY_RAP_FLAG WHERE  zflag = 'X' INTO @ls_request.
* f flag = x
*   SELECT  SINGLE * FROM ZDD_TRADE_VALIDITIY_RAP

*   where CurrentSys_Date >=   TradeNotification_Date  AND  CurrentSys_Date <= @zlicense_validto INTO @ls_request.
*SELECT SINGLE * FROM ZDD_TRADE_VALIDITIY_RAP2  where   diff >= 30 INTO @ls_request .




    Data : w_date type dats,
          w_date1(10),
 w_date2(1) value '.'.
w_date1 = w_date.


** Date Conversion
concatenate ls_request-zlicense_validto+6(2) ls_request-zlicense_validto+4(2) ls_request-zlicense_validto+0(4) into w_date1 separated by w_date2.


** Email Instances and Template Creation
    TRY.
        DATA(lo_mail) = cl_bcs_mail_message=>create_instance( ).

        lo_mail->set_sender( 'BTP-CLAP@iffco.com' ).
*        lo_mail->add_recipient( 'mustafa.alaran@vaspp.com' ).
        lo_mail->add_recipient( 'reshma.m@vaspp.com' ).
*        lo_mail->add_recipient( 'akshay.pattar@vaspp.com' ).

        lo_mail->set_subject( 'Notification: Trade License Expiry' ).
        DATA: iv_message TYPE string.
        iv_message = '<p>Dear Credit  Controller,</p> <p>the Trade License for customer A will be expired in 30 Days:</p><p> Reqeust_No: Request1 </p><p> Licence_ No: License1 </p> <p> Valid to: Valid1 </p> <p>Link</p> '.

        REPLACE 'Request1' WITH ls_request-zrequest_no INTO
         iv_message.
        REPLACE 'A' WITH ls_request-zfirst_name INTO
         iv_message.
        REPLACE 'License1' WITH ls_request-zlicense_no INTO
        iv_message.
        REPLACE 'Valid1' WITH w_date1 INTO
        iv_message.
        REPLACE 'Link' WITH 'https://iffcodev.launchpad.cfapps.eu10.hana.ondemand.com/site?siteId=82eb4ca9-2654-424d-b2f5-7cf09fafb69b#clap-create?sap-ui-app-id-hint=95342aed-35a3-4cc9-9574-cbcb14516507' INTO
        iv_message.
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
