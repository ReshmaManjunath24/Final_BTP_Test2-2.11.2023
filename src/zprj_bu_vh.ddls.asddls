@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Business Unit'
define root view entity ZPRJ_BU_VH provider contract transactional_query 
as projection on ZDD_BU_VH {
    
    @UI.facet: [
      // This is for the body
      {
        id: 'GeneralInformation',
        isSummary: true,
        type: #COLLECTION
       },
        {
       parentId: 'GeneralInformation',
       id:'group1Information',
       type: #FIELDGROUP_REFERENCE,
       targetQualifier: 'one',
       label: 'Customer Data one'
       }]
       
       @UI.fieldGroup: [{
        
      qualifier: 'one',
        position: 10,
     label:'Business Unit'
      }]
     @UI.identification: [{position: 10 }]
    key businessunit
}
