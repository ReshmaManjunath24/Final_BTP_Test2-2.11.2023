@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help for License Type'
@Metadata.allowExtensions: true


@UI.headerInfo: {
typeNamePlural: 'license_type'}

define root view entity ZVH_license_type as select from ztab_custom
{

@UI:{lineItem: [{position:10 }],identification: [{position: 10 }],
selectionField: [{position: 10 }]}
@Consumption.valueHelpDefinition: [{entity:{name:'ztab_custom',element:'license_type' }}]
   key  license_type
}

