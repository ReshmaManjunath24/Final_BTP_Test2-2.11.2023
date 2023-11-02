@AbapCatalog.sqlViewName: 'ZTRADEVALIDITY2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View for Trade Licence Expiry'
define view ZDD_TRADE_VALIDITIY_RAP2  as select from ZDD_TRADE_VALIDITIY_RAP
--association [0..1] to ZDD_BusinessUnit_VH as _BusinessUnit         on $projection.zbusiness_unit_name = _BusinessUnit.Businessunit
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
    --dats_add_months(zvalid_to, -1 ,'FAIL') as Notification_Date,
    zlicense_validto,
    cast(dats_add_months(zlicense_validto, -1 ,'FAIL')as abap.dats(8)) as TradeNotification_Date,
    $session.system_date as CurrentSys_Dat,
    dats_days_between(TradeNotification_Date,zlicense_validto) as diff
    
    
}
--where zvalid_to <> '00000000' and cc != 'NA'





















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

