@EndUserText.label: 'table function'
define table function ztable_function

returns {

  Client : mandt;
  customer : abap.char(10);


} implemented by method ZCL_TFUNCTION_CLASS=>ZCL_TFUNCTION_METHOD;

