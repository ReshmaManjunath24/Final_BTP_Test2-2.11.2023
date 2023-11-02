@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help for Line of BU Type'
@Metadata.allowExtensions: true


@UI.headerInfo: {
typeNamePlural: 'lineof_bu_type'}

define root view entity ZVH_lineof_bu_type as select from ztab_custom
{

@UI:{lineItem: [{position:10 }],identification: [{position: 10 }],
selectionField: [{position: 10 }]}
@Consumption.valueHelpDefinition: [{entity:{name:'ztab_custom',element:'lineof_bu_type' }}]
   key  lineof_bu_type
}

