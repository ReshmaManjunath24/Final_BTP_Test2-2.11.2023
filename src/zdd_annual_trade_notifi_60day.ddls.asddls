@EndUserText.label: 'Data Def for Annual Trade Notification'
@ObjectModel.query.implementedBy: 'ABAP:ZTRADE_NOTIFICATION_60DAYS'
define custom entity ZDD_ANNUAL_TRADE_NOTIFI_60DAY
{
key customer :  sysuuid_x16;
status : abap.char(10);
}
