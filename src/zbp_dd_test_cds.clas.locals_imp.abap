CLASS lhc_room1 DEFINITION INHERITING FROM cl_abap_behavior_handler.
PUBLIC SECTION.
 CLASS-DATA:
      mt_root_to_create TYPE STANDARD TABLE OF zcomm WITH NON-UNIQUE DEFAULT KEY,
      mt_root_to_update TYPE STANDARD TABLE OF zcomm WITH NON-UNIQUE DEFAULT KEY,
      mt_root_to_delete TYPE STANDARD TABLE OF zcomm WITH NON-UNIQUE DEFAULT KEY.
  PRIVATE SECTION.
   TYPES:
      ty_action(2)     TYPE c,
      tt_message       TYPE TABLE OF symsg,
      tt_room_failed   TYPE TABLE FOR FAILED zdd_test_cds,
      tt_room_reported TYPE TABLE FOR REPORTED zdd_test_cds.
    CONSTANTS:
      BEGIN OF cs_action,
        create TYPE ty_action VALUE '01',
        update TYPE ty_action VALUE '02',
        delete TYPE ty_action VALUE '03',
      END OF cs_action.



    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR room1 RESULT result.

    METHODS create FOR MODIFY IMPORTING entities FOR CREATE room1.
    METHODS update FOR MODIFY IMPORTING entities FOR UPDATE room1.
    METHODS delete FOR MODIFY IMPORTING keys FOR DELETE room1.
    METHODS read FOR READ IMPORTING roots_to_read FOR READ room1 RESULT result.
    METHODS lock FOR LOCK IMPORTING roots_to_lock FOR LOCK room1.
   METHODS  validate
        IMPORTING
          iv_action         TYPE ty_action
          is_room           TYPE zcomm
        RETURNING
          VALUE(rv_message) TYPE string.

ENDCLASS.

CLASS lhc_room1 IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create.


    LOOP AT entities INTO DATA(ls_root_to_create).
      DATA(lv_message) = validate( iv_action = cs_action-create is_room = CORRESPONDING zcomm( ls_root_to_create ) ).
      IF lv_message IS INITIAL.
*        ls_root_to_create-lastchangedbyuser = sy-uname.
*        GET TIME STAMP FIELD ls_root_to_create-lastchangeddatetime.
        INSERT CORRESPONDING #( ls_root_to_create ) INTO TABLE mapped-room1.
        INSERT CORRESPONDING #( ls_root_to_create ) INTO TABLE mt_root_to_create.
      ELSE.
        APPEND VALUE #( %cid = ls_root_to_create-%cid sales_id = ls_root_to_create-sales_id %fail = VALUE #( cause = if_abap_behv=>cause-unspecific ) ) TO failed-room1.
        APPEND VALUE #( %cid = ls_root_to_create-%cid sales_id = ls_root_to_create-sales_id %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error text = lv_message ) ) TO reported-room1.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
   LOOP AT roots_to_read INTO DATA(ls_root_to_read).
      SELECT SINGLE FROM zdd_test_cds FIELDS * WHERE sales_id = @ls_root_to_read-sales_id INTO @DATA(ls_room).
      INSERT ls_room INTO TABLE result.
    ENDLOOP.
  ENDMETHOD.

  METHOD lock.

  LOOP AT roots_to_lock INTO DATA(ls_root_to_lock).
      TRY.
          cl_abap_lock_object_factory=>get_instance( iv_name = 'EZTEST')->enqueue(
            it_table_mode = VALUE if_abap_lock_object=>tt_table_mode( ( table_name = 'ZCOMM' ) )
            it_parameter  = VALUE if_abap_lock_object=>tt_parameter( ( name = 'sales_id' value = REF #( ls_root_to_lock-sales_id ) ) ) ).
        CATCH cx_abap_foreign_lock INTO DATA(lx_lock).
          APPEND VALUE #( sales_id = ls_root_to_lock-sales_id %fail = VALUE #( cause = if_abap_behv=>cause-locked ) ) TO failed-room1.
          APPEND VALUE #( sales_id = ls_root_to_lock-sales_id %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error text = lx_lock->get_text( ) ) ) TO reported-room1.
        CATCH cx_abap_lock_failure.
          ASSERT 1 = 0.
      ENDTRY.
    ENDLOOP.


  ENDMETHOD.

  METHOD validate.

  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZDD_TEST_CDS DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZDD_TEST_CDS IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.
  INSERT zcomm FROM TABLE @lhc_room1=>mt_root_to_create.
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
