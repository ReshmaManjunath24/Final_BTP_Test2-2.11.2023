@EndUserText.label: 'Data Definition for Bulk CSV SPLIT'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_WF_CORE_CSV_SPLIT'

define root custom entity ZDD_CORE_BULK_SPLIT_REQUEST

{
  key customer : abap.char(12);
  


  
  
//      _Approvers_Split : association [0..*] to ZDD_WF_GET_APPROVERS_BULK on _Approvers_Split.documentid = $projection.documentid;
}
