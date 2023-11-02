@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help for Sub Channel'
@Metadata.allowExtensions: true


@UI.headerInfo: {
typeNamePlural: 'sub_channel'}

define root view entity ZVH_sub_channel as select from ztab_custom
{

@UI:{lineItem: [{position:10 }],identification: [{position: 10 }],
selectionField: [{position: 10 }]}
@Consumption.valueHelpDefinition: [{entity:{name:'ztab_custom',element:'sub_channel' }}]
   key  sub_channel

}

