@AbapCatalog.sqlViewName: 'ZREVIEWERLIST'
@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data Definition for Workflow Reviewrs'
define view ZDD_WF_REVIEWERS_LIST as select from ztab_customers
{
key  zcustomer_num as customer,
cast( 'Reviewer' as abap.char(70) ) as Role,
//zreviewer as Name,
cast( 'Akshay Pattar' as abap.char(70) ) as Name,
//zreviewer_email as Email
cast('t_apattar@iffco.com' as abap.char(70) ) as Email

  
}

union all select from ztab_customers{ 

key zcustomer_num as customer,

cast( 'Sales Head' as abap.char(70) ) as Role,
//zsaleshead  as Name,
cast( 'Akshay Pattar' as abap.char(70) ) as Name,
//zsaleshead_email as Email
cast('t_apattar@iffco.com' as abap.char(70) ) as Email





}

union all select from ztab_customers{

key zcustomer_num as customer,

cast('Fincance Reviewer' as abap.char(70) ) as Role,
//zfa_reviewer as Name,
cast( 'Recham M' as abap.char(70) ) as name,
//zfa_reviewer_email as Email

cast('t_reshmam@iffco.com' as abap.char(70) ) as Email

}

union all select distinct from ztab_customers
left outer to one join ztab_businessunt on ztab_businessunt.businessunit = ztab_customers.zbusiness_unit_name
{



key zcustomer_num as customer,

cast('MDM' as abap.char(70) ) as Role,
//cast( ztab_businessunt.mdm as abap.char(70) ) as Name,
cast( 'Recham M' as abap.char(70) ) as name,
//zfa_reviewer_email as Email

cast('t_reshmam@iffco.com' as abap.char(70) ) as Email

}
//where ztab_businessunt.mdm <> 'NA'

union all select from ztab_customers
left outer to one join ZDD_CLAP_USER_INFO on ZDD_CLAP_USER_INFO.UserID = ztab_customers.zcreated_by


{


key zcustomer_num as customer,

cast('Initiator' as abap.char(70) ) as Role,
cast( ZDD_CLAP_USER_INFO.FirstName as abap.char(70) ) as Name,
//zfa_reviewer_email as Email

cast(ZDD_CLAP_USER_INFO.DefaultEmailAddress as abap.char(70) ) as Email

}




union all select from ztab_customers
left outer to one join ztab_salesarea on ztab_customers.zcustomer_num = ztab_salesarea.zcustomer_num
left outer to one join ztab_businessunt on ztab_businessunt.businessunit = ztab_customers.zbusiness_unit_name

{

key ztab_customers.zcustomer_num as customer,

cast( 'Credit Controller'  as abap.char(70) ) as Role,
ztab_businessunt.cc as Name,
//cast( 'Akshay Pattar' as abap.char(70) ) as Name,
//ztab_businessunt.ccemailid as Email
cast('t_apattar@iffco.com' as abap.char(70) ) as Email

}
where ztab_businessunt.cc <> 'NA'

