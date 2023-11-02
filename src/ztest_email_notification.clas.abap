CLASS ztest_email_notification DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .






  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PRIVATE SECTION.
    METHODS get_configuration
      IMPORTING io_out TYPE REF TO if_oo_adt_classrun_out.

    METHODS set_configuration
      IMPORTING io_out TYPE REF TO if_oo_adt_classrun_out.
ENDCLASS.



CLASS ZTEST_EMAIL_NOTIFICATION IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    get_configuration( out ).
*    set_configuration( out ).
  ENDMETHOD.


  METHOD get_configuration.
    DATA(lo_config) = cl_bcs_mail_system_config=>create_instance( ).

    io_out->write( |Check active: { lo_config->get_address_check_active( ) }| ).

    io_out->write( |Expires: { lo_config->get_days_until_mail_expires( ) }| ).

    io_out->write( |Sender domains:| ).
    DATA(lt_sender_domains) = lo_config->read_allowed_sender_domains( ).
    io_out->write( lt_sender_domains ).

    io_out->write( |Receiver domains:| ).
    DATA(lt_rec_domains) = lo_config->read_allowed_recipient_domains( ).
    io_out->write( lt_rec_domains ).

    lo_config->read_default_sender_address( IMPORTING ev_default_sender_address = DATA(ld_address)
                                                      ev_default_sender_name    = DATA(ld_name) ).
    io_out->write( |Sender address: { ld_address }| ).
    io_out->write( |Sender name: { ld_name }| ).
  ENDMETHOD.


  METHOD set_configuration.
    DATA(lo_config) = cl_bcs_mail_system_config=>create_instance( ).

    TRY.
        lo_config->set_address_check_active( abap_true  ).
        io_out->write( `Check activated` ).

      CATCH cx_bcs_mail_config.
        io_out->write( `Error in activation` ).
        RETURN.
    ENDTRY.

    TRY.
        lo_config->set_days_until_mail_expires( 7 ).
        io_out->write( `Expiry days set to 7` ).

      CATCH cx_bcs_mail_config.
        io_out->write( `Error while set the new days` ).
    ENDTRY.

    TRY.
        DATA(lt_allowed_receiver) = VALUE cl_bcs_mail_system_config=>tyt_recipient_domains( ( '*@IFFCO.com' )
                                                                                            ( '*@VASPP.com' ) ).

        lo_config->add_allowed_recipient_domains( it_allowed_rec_domains = lt_allowed_receiver ).
        io_out->write( `Allowlist receiver added` ).

      CATCH cx_bcs_mail_config.
        io_out->write( `Error in allowlist receiver` ).
    ENDTRY.

    TRY.
        DATA(lt_allowed_sender) = VALUE cl_bcs_mail_system_config=>tyt_sender_domains( ( '*@IFFCO.com' ) ).

        lo_config->add_allowed_sender_domains( it_allowed_sender_domains = lt_allowed_sender ).
        io_out->write( `Allowlist sender added` ).

      CATCH cx_bcs_mail_config.
        io_out->write( `Error in allowlist sender` ).
    ENDTRY.

    TRY.
        lo_config->modify_default_sender_address( iv_default_address = 'BTP-noreply@IFFCO.com'
                                                  iv_default_name    = '' ).
        io_out->write( `Default sender set` ).

      CATCH cx_bcs_mail_config.
        io_out->write( `Error with default data` ).
    ENDTRY.
  ENDMETHOD.
ENDCLASS.
