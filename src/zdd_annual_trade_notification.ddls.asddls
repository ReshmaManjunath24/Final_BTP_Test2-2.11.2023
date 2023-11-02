@EndUserText.label: 'Data Def for Annual Trade Notification'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_ANNUAL_TRADE_NOTIFICATION'
define custom entity ZDD_ANNUAL_TRADE_NOTIFICATION
{
key customer :  sysuuid_x16;
status : abap.char(10);
}
