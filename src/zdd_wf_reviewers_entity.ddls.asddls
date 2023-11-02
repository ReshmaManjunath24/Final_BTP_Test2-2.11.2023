@EndUserText.label: 'Data Definition for Reviewrs Entity'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_WF_REVIEWERS_LIST'
define custom entity ZDD_WF_REVIEWERS_ENTITY

{
  key customer : sysuuid_x16;
  key email      : abap.char(70);
      name       : abap.char(100);
      role       : abap.sstring(100);
  
}
