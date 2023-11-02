@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'PRJ TEST'
define root view entity Z099_PRJ_VIEW provider contract transactional_query
as projection on Z099_NORM_CDS
{
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
       label: 'Customer Data'
       },
       {
       parentId: 'GeneralInformation',
       id:'group2Information',
       type: #FIELDGROUP_REFERENCE,
       targetQualifier: 'two',
       label: 'Address Data'
       }
       
       
       
       ]
       
        @UI.fieldGroup: [{
        
      qualifier: 'one',
        position: 10,
     label:'Customer ID'
      }]
     @UI.identification: [{position: 10 }]
key Custnumb as CustomerNumber,



 @UI.fieldGroup: [{
        // Qualifier is mandatory as this is
        // the way to distinguish between
        // Multiple groups
       qualifier: 'two',
       position: 40,
       label:'Region'
       }]
     @UI.identification: [{position: 50 }]
     Region as Region,
     
     
     
    /* @UI.fieldGroup: [{
        // Qualifier is mandatory as this is
        // the way to distinguish between
        // Multiple groups
       qualifier: 'ONE',
       position: 40,
       label:'Region'
       }]
     @UI.identification: [{position: 50 }]
     Region7 as Region7, */
     
    @UI.fieldGroup: [{
        // Qualifier is mandatory as this is
        // the way to distinguish between
        // Multiple groups
       qualifier: 'two',
       position: 50,
       label:'City'
       }]
     @UI.identification: [{position: 60 }] 
     City as City,
     


@UI.fieldGroup: [{
        qualifier: 'one',
        position: 40,
        label:'Countrol Area'
      }]
      @UI.identification: [{position: 40 }]
Cntrolarea as ControlArea,
@UI.fieldGroup: [{
        qualifier: 'one',
        position: 40,
        label:'Customer Account Number'
      }]
      @UI.identification: [{position: 50 }]
Custoaccno as CustomerActNo,
@UI.fieldGroup: [{
        qualifier: 'one',
        position: 60,
        label:'Credit Limit Check'
      }]
      @UI.identification: [{position: 70 }]

Creditlimitcheck as CreditLimitCheck,

 @UI.fieldGroup: [{
        // Qualifier is mandatory as this is
        // the way to distinguish between
        // Multiple groups
       qualifier: 'one',
       position: 70,
       label:'Total Receivables'
       }]
     @UI.identification: [{position: 80 }]
Totalreceivables as TotalReceivables,


@UI.fieldGroup: [{
        // Qualifier is mandatory as this is
        // the way to distinguish between
        // Multiple groups
       qualifier: 'one',
       position: 80,
       label:'Name of Person'
       }]
     @UI.identification: [{position: 90 }]
   Nameofperson as NameofPerson ,
   
  
     @UI.fieldGroup: [{
        // Qualifier is mandatory as this is
        // the way to distinguish between
        // Multiple groups
       qualifier: 'two',
       position: 60,
       label:'District'
       }]
     @UI.identification: [{position: 70 }]
     District as District,
     
     @UI.fieldGroup: [{
        // Qualifier is mandatory as this is
        // the way to distinguish between
        // Multiple groups
       qualifier: 'two',
       position: 70,
       label:'Fax Number'
       }]
     @UI.identification: [{position: 80 }]
     Faxno as FaxNumber,
     
     
      @UI.fieldGroup: [{
        // Qualifier is mandatory as this is
        // the way to distinguish between
        // Multiple groups
       qualifier: 'two',
       position: 80,
       label:'Country'
       }]
     @UI.identification: [{position: 90 }]
     Country as Country
   
    
    

}
