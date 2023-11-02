@AbapCatalog.sqlViewName: 'ZDDMASTERLIST'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data Definition for Master List'
define view ZDD_MASTER_LIST as select from ztab_customer_ap
--left outer join ZDD_BusinessUnit_VH on ztab_customer_ap.businessunit = ZDD_BusinessUnit_VH.Businessunit
{
    
    key ztab_customer_ap.businessunit as Businessunit,
    key name as Name,
    key remarks as Remarks,
    email as Email
    --ZDD_BusinessUnit_VH.mdm,
    --ZDD_BusinessUnit_VH.mdmemailid
}


//
//union all select from ZDD_BusinessUnit_VH 
//{
//key Businessunit as Businessunit,
//ZDD_BusinessUnit_VH.mdm as Name,
//cast( 'MDM' as abap.char(70) ) as Remarks,
//ZDD_BusinessUnit_VH.mdmemailid as Email
//}

union  select from ztab_customer_ap{ 

key businessunit as Businessunit,

cast( 'Akshay Pattar' as abap.char(70) ) as Name,
//zsaleshead  as Name,
cast( 'MDM' as abap.char(70) ) as Remarks,
//zsaleshead_email as Email
cast('t_apattar@iffco.com' as abap.char(70) ) as Email





}
--where remarks = 'Submitted by'
