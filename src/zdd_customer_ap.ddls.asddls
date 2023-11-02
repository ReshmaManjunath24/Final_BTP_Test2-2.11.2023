@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Approver list of Master Data'
define root view entity ZDD_CUSTOMER_AP as select from ztab_customer_ap

{
    key businessunit as Businessunit,
    key name as Name,
    key remarks as Roletype,
    email as Email
   }
