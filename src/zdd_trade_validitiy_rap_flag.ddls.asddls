@AbapCatalog.sqlViewName: 'ZDD_TRADE_FLAG'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data Definition for Annual Trade Notification Flag'
define view ZDD_TRADE_VALIDITIY_RAP_FLAG as select from ZDD_TRADE_VALIDITIY_RAP
{
  key zcustomer_num,
  zcustomer_legal_name,
  zbusiness_unit_name,
  ztotal_credit_amount,
  zfirst_name,
  zmdg_bp_id,
  zrequest_no,
  zlicense_no,
  zcredit_limit,
  zvalid_to,
  Credit_Controller,
  CC_email,
  zlicense_validto,
  TradeNotification_Date,
  CurrentSys_Dat  ,
   case when CurrentSys_Dat >= TradeNotification_Date and CurrentSys_Dat <= zlicense_validto then 'X' else '' end as zflag,
   case when CurrentSys_Dat = TradeNotification_Date_60  then 'X' else '' end as zflag60,
   case when zlicense_validto <> '00000000' and CurrentSys_Dat > zlicense_validto then 'X' else '' end as zflag60_1
}
 

 
 