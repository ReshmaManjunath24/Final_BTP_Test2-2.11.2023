@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help for Credit Limit Currency'
@Metadata.allowExtensions: true


@UI.headerInfo: {
typeNamePlural: 'credit_limit_currency'}

define root view entity ZVH_crdt_lmt as select from ztab_custom
{

@UI:{lineItem: [{position:10 }],identification: [{position: 10 }],
selectionField: [{position: 10 }]}
@Consumption.valueHelpDefinition: [{entity:{name:'ztab_custom',element:'credit_limit_currency' }}]
   key  credit_limit_currency
}

