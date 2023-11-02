@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help for Channel '
@Metadata.allowExtensions: true


@UI.headerInfo: {
typeNamePlural: 'Channel'}
define root view entity ZVH_CHANNEL as select from ztab_custom
 {
 
 @UI:{lineItem: [{position:10 }],identification: [{position: 10 }],
selectionField: [{position: 10 }]}
@Consumption.valueHelpDefinition: [{entity:{name:'ztab_custom',element:'channel ' }}]

 key channel  

}
