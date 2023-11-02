@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'NORM CDS TEST'
define root view entity Z099_NORM_CDS as select from z009_cust
{

key custnumb as Custnumb,
cntrolarea as Cntrolarea,
custoaccno as Custoaccno,
creditlimitcheck as Creditlimitcheck,
totalreceivables as Totalreceivables,

nameofperson as Nameofperson,
region as Region,
//region as Region7,
city as City,
district as District,
faxno as Faxno,
country as Country
}
