@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'VERTICAL PROJECTION'
@Metadata.allowExtensions: true
@UI.headerInfo: {
typeNamePlural: 'Vertical'}

define root view entity ZVH_Vertical_PR as select from ZVH_Vertical
{

@UI:{lineItem: [{position:10 }],identification: [{position: 10 }],
selectionField: [{position: 10 }]}
@Consumption.valueHelpDefinition: [{entity:{name:'ZDD_TRADE_CUST',element:'zvertical' }}]
   key  zvertical 

}

