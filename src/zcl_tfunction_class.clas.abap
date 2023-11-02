CLASS zcl_tfunction_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
 interfaces if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_TFUNCTION_CLASS IMPLEMENTATION.


  METHOD IF_OO_ADT_CLASSRUN~MAIN.

    TRY.
      DATA(lo_destination) = cl_rfc_destination_provider=>CREATE_BY_CLOUD_DESTINATION(
                              i_name                  = 'S4D'
                             ).

      DATA(lv_destination) = lo_destination->get_destination_name( ).

      DATA lv_result type c length 200.

      CALL function 'RFC_SYSTEM_INFO'
      destination 'S4D'
        IMPORTING
          RFCSI_EXPORT      = lv_result.

        out->write( lv_result ).
    catch cx_root into data(lx_root).
      out->write( lx_root->get_text( ) ).
    endtry.
  ENDMETHOD.
ENDCLASS.
