@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Projection View for Rule Engine'
//define root view entity ZPR_RULE_ENGINE as select from ZDD_RULE_ENGINE
//composition of target_data_source_name as _association_name {
//    key RuleId,
//    Process,
//    CompanyCode,
//    CustomerGroup,
//    Layout,
//    FieldName,
//    Visibility,
//    Mandatory,
//    CustomerType,
//    CustomLabel,
//    Internationalization,
//    FieldValue,
//    Flag,
//    FieldOrder,
//    UiControl,
//    Leng,
//    _association_name // Make association public
//}

//@UI: {
//headerInfo: { typeName: 'RuleEngine', typeNamePlural: 'RuleEngine', title: { type: #STANDARD, value: 'RULEID' } } }
//
//
//
//@Search.searchable: true



define root view entity ZPR_RULE_ENGINE
//  provider contract transactional_query
//  as projection on t
as select from Zdd_rule_engine 
  //{
  //@UI.facet: [ { id: 'RuleEngine',
  //purpose: #STANDARD,
  //type: #IDENTIFICATION_REFERENCE,
  //label: 'Rule Engine',
  //position: 10 } ]
  //
  //
  //
  //
  //@UI: {
  //lineItem: [ { position: 10, importance: #HIGH } ],
  //identification: [ { position: 10, label: 'Rule ID ' } ] ,
  //selectionField: [ { position: 20 } ] }
  //@Search.defaultSearchElement: true
  //key rule_id as RuleId,
  //
  //@UI: {
  //lineItem: [ { position: 20, importance: #HIGH } ],
  //identification: [ { position: 20 , label: 'Process' } ],
  //selectionField: [ { position: 20 } ] }
  //
  //@Search.defaultSearchElement: true
  //process as PROCESS,
  //
  //@UI: {
  //lineItem: [ { position: 30, importance: #HIGH } ],
  //identification: [ { position: 30 , label: 'Company Code'} ],
  //selectionField: [ { position: 30 } ] }
  //
  //@ObjectModel.text.element: ['COMPANYCODE']
  //@Search.defaultSearchElement: true
  //company_code as CompanyCode,
  //
  //
  //
  //@UI.hidden: true
  //customer_group as CustomerGroup,
  //
  //
  //
  //@UI: {
  //lineItem: [ { position: 40, importance: #MEDIUM } ],
  //identification: [ { position: 40 ,label: 'Layout'} ] }
  //layout as Layout,
  //
  //@UI: {
  //lineItem: [ { position: 41, importance: #MEDIUM } ],
  //identification: [ { position: 41 , label: 'Field Name' } ] }
  //field_name as Field,
  //
  //@UI: {
  //lineItem: [ { position: 50, importance: #MEDIUM } ],
  //identification: [ { position: 50, label: 'Visiblity' } ] }
  //
  //visibility as VISIBILITY,
  //
  //@Consumption.valueHelpDefinition: [{entity: {name: 'I_Currency', element: 'Currency' }}]
  //mandatory as MANDATORY,
  //
  //@UI: {
  //lineItem: [ { position: 60, importance: #HIGH },
  //{ type: #FOR_ACTION, dataAction: 'accept rule', label: 'Accept Rule' } ],
  //identification: [ { position: 60, label: 'Customer Type' } ] }
  //customer_type as CustomerType,
  //
  //@UI.identification: [ { position: 70, label: 'Custom Label' } ]
  //custom_label as CustomLabel
  //
  ////@UI.hidden: true
  ////internationalization as internationalization,
  ////field_value as FieldValue,
  ////flag as FLAG,
  ////field_order as FieldOrder,
  ////ui_control as UIControl,
  ////leng as leng
{

//      @UI.facet: [
//          // This is for the body
//          {
//            id: 'GeneralInformation',
//            isSummary: true,
//            type: #COLLECTION
//           },
//            {
//           parentId: 'GeneralInformation',
//           id:'group1Information',
//           type: #FIELDGROUP_REFERENCE,
//           targetQualifier: 'one',
//           label: 'Customer Data one'
//           },
//
//               {
//           parentId: 'GeneralInformation',
//           id:'group2Information',
//           type: #FIELDGROUP_REFERENCE,
//           targetQualifier: 'two',
//           label: 'Customer Data two'
//           },
//
//
//           {
//           parentId: 'GeneralInformation',
//           id:'group12Information',
//           type: #FIELDGROUP_REFERENCE,
//           targetQualifier: 'twelve',
//           label: 'Customer Data twelve'
//           }
//
//           ]
//
//      @UI.fieldGroup: [{
//
//     qualifier: 'one',
//       position: 10,
//    label:'Rule Id'
//     }]
//      @UI.identification: [{position: 10 }]
key rule_id
//key process,
//key customer_type,
//key zbusiness_partner_id,
//la
//company_code,
//customer_group,
//visibility,
//mandatory,

//
//custom_label,
//internationalization,
//field_value,
//flag,
//field_order,
//ui_control,
//leng,
//created_by,
//created_date


}

//      @UI.fieldGroup: [{
//
//      qualifier: 'one',
//      position: 20,
//      label:'Process'
//      }]
//      @UI.identification: [{position: 20 }]
//      @Consumption.valueHelpDefinition: [{entity:{name:'zdd_rule_fields',element:'process' }}]
//      process,
//
//      @UI.fieldGroup: [{
//
//      qualifier: 'one',
//      position: 30,
//      label:'Company Code'
//      }]
//      @UI.identification: [{position: 30 }]
//      company_code,
//
//      @UI.fieldGroup: [{
//
//      qualifier: 'one',
//      position: 40,
//      label:'Customer Group'
//      }]
//      @UI.identification: [{position: 40 }]
//      customer_group,
//
////      @UI.fieldGroup: [{
////
////      qualifier: 'one',
////      position: 50,
////      label:'Layout'
////      }]
////      @UI.identification: [{position: 50 }]
////      layout,
//
////      @UI.fieldGroup: [{
////      qualifier: 'one',
////      position: 60,
////      label:'Field Name'}]
////      @UI.identification: [{position: 60 }]
////@Consumption.valueHelpDefinition: [{entity:{name:'ZDD_CUSTOMER' }}]
////
////      field_name,
//
//      @UI.fieldGroup: [{
//      qualifier: 'one',
//      position: 10,
//      label:'Visibility'
//      }]
//      @UI.identification: [{position: 10 }]
//@Consumption.valueHelpDefinition: [{entity:{name:'zdd_rule_fields',element:'mandatory' }}]
//      visibility,
//
//      @UI.fieldGroup: [{
//
//      qualifier: 'one',
//      position: 70,
//      label:'Mandatory'
//      }]
//      @UI.identification: [{position:70 }]
//@Consumption.valueHelpDefinition: [{entity:{name:'zdd_rule_fields',element:'mandatory' }}]
//      mandatory,
//
//      @UI.fieldGroup: [{
//
//       qualifier: 'one',
//         position: 10,
//      label:'Customer Type'
//       }]
//      @UI.identification: [{position: 10 }]
//      @Consumption.valueHelpDefinition: [{entity:{name:'zdd_rule_fields',element:'customertype' }}]
//      customer_type,
//      
//      
////**********************************************************
//// added by Mustafa  
////**********************************************************   
//        @UI.fieldGroup: [{
//       qualifier: 'one',
//         position: 10,
//      label:'Business Partner ID/Grouping'
//       }]
//      @UI.identification: [{position: 10 }]
//      zbusiness_partner_id,
//      
////**********************************************************      
//
//      @UI.fieldGroup: [{
//
//        qualifier: 'one',
//          position: 80,
//       label:'Custom Label'
//        }]
//      @UI.identification: [{position: 80 }]
//      custom_label,
//      @UI.fieldGroup: [{
//
//      qualifier: 'one',
//      position: 10,
//      label:'Internationalization'
//      }]
//      @UI.identification: [{position: 10 }]
//      internationalization,
//
//      @UI.fieldGroup: [{
//
//        qualifier: 'one',
//          position: 10,
//       label:'Field Value'
//        }]
//      @UI.identification: [{position: 10 }]
//      field_value,
//
//      @UI.fieldGroup: [{
//
//        qualifier: 'one',
//          position: 90,
//       label:'Flag'
//        }]
//      @UI.identification: [{position: 90 }]
//      flag,
//
//      @UI.fieldGroup: [{
//
//        qualifier: 'one',
//          position: 10,
//       label:'Field Order'
//        }]
//      @UI.identification: [{position: 10 }]
//      field_order,
//
//      @UI.fieldGroup: [{
//
//           qualifier: 'one',
//             position: 10,
//          label:'UI Control' }]
//      @UI.identification: [{position: 10 }]
//      ui_control,
//
//      @UI.fieldGroup: [{
//
//        qualifier: 'two',
//          position: 10,
//       label:'leng'
//        }]
//      @UI.identification: [{position: 10 }]
//      leng
//}
