CLASS lhc_Customer DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Customer RESULT result.

ENDCLASS.

CLASS lhc_Customer IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

ENDCLASS.

CLASS lhc_ZDD_CW_SALESAREA DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS ValidationForBusinessUnit FOR VALIDATE ON SAVE
      IMPORTING keys FOR zdd_cw_customer~ValidationForBusinessUnit.

ENDCLASS.

CLASS lhc_ZDD_CW_SALESAREA IMPLEMENTATION.

  METHOD ValidationForBusinessUnit.


  READ ENTITIES OF ZDD_CW_CUSTOMER IN LOCAL MODE

*"Customer" Behavioural Definition name

  ENTITY Customer FIELDS ( zcustomer_num  zbusiness_unit_name zcustomer_legal_name zmdg_status )
  WITH CORRESPONDING #( keys )
  RESULT DATA(It_Customers).

  LOOP at It_Customers INTO DATA(Customer).
  SELECT FROM ztab_cw_custs
  FIELDS zcustomer_num
  WHERE zbusiness_unit_name = @customer-zbusiness_unit_name
  AND zcustomer_legal_name = @customer-zcustomer_legal_name
  AND zmdg_status = @customer-zmdg_status
*  UNION
*  SELECT FROM ztab_cm_Customer_D
*  FIELDS c_id
*  WHERE zbusiness_unit_name = @Customer-zbusiness_unit_name AND zcustomer_legal_name = @Customer-zcustomer_legal_name
 INTO TABLE @DATA(check_results).

 IF check_results is NOT INITIAL.
 data(message) = me->new_message(
 id = 'ZERROR_MSG'
 number = '001'
 severity = ms-error
 v1 = Customer-zbusiness_unit_name
 v2 = Customer-zcustomer_legal_name
 v3 = Customer-zmdg_status ).

 DATA reported_record LIKE LINE OF reported-customer.
 reported_record-%tky = Customer-%tky.
 reported_record-%msg = message.
 reported_record-%element-zbusiness_unit_name = if_abap_behv=>mk-on.
 reported_record-%element-zcustomer_legal_name = if_abap_behv=>mk-on.
 reported_record-%element-zmdg_status = if_abap_behv=>mk-on.
 APPEND reported_record to reported-Customer.


 data failed_record LIKE LINE OF failed-Customer.

 failed_record-%tky = Customer-%tky.
 APPEND failed_record to failed-Customer.


 ENDIF.
  ENDLOOP.

  ENDMETHOD.

ENDCLASS.
