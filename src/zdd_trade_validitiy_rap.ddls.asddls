@AbapCatalog.sqlViewName: 'ZTRADEVALIDITY'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View for Trade Licence Expiry'
define view ZDD_TRADE_VALIDITIY_RAP  as select from ztab_customers
association [0..1] to ZDD_BusinessUnit_VH as _BusinessUnit         on $projection.zbusiness_unit_name = _BusinessUnit.Businessunit
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
    _BusinessUnit.cc as Credit_Controller,
    _BusinessUnit.ccemailid as CC_email, 
    --dats_add_months(zvalid_to, -1 ,'FAIL') as Notification_Date,
    zlicense_validto,
    cast(dats_add_months(zlicense_validto, -1 ,'FAIL')as abap.dats(8)) as TradeNotification_Date,
    case when zlicense_validto !=  '00000000' then cast(dats_add_days(zlicense_validto, +60 ,'FAIL')as abap.dats(8)) end as TradeNotification_Date_60,
  // case when zlicense_validto !=  '00000000' then cast(dats_add_months(zlicense_validto, +2 ,'FAIL')as abap.dats(8)) end as TradeNotification_Date_60,
    
    $session.system_date as CurrentSys_Dat
    
    
}
where zlicense_validto <> '00000000' and _BusinessUnit.cc != 'NA'





















//{
//    key zcustomer_num,
//    
//    zbusiness_unit_name,
//    ztotal_credit_amount,
//    zfirst_name,
//    zmdg_bp_id,
//    zrequest_no,
//    zlicense_no,
//    zcredit_limit,
//    zvalid_to,
//    zlicense_validto,
//    _BusinessUnit.cc as Credit_Controller,
//    _BusinessUnit.ccemailid as CC_email
//   -- dats_add_months(zvalid_to, -1 ,'FAIL') as Notification_Date,
//   -- dats_add_months(zlicense_validto, -1 ,'FAIL') as TradeNotification_Date 
//    --$session.system_date as CurrentSys_Date
//    
//}
//where zlicense_validto <> '00000000' and _BusinessUnit.cc != 'NA'

