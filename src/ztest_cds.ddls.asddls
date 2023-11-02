@AbapCatalog.sqlViewName: 'ZTESTCDSVH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Test CDS'


define view ZTEST_CDS as select from I_UnitOfMeasure {
key UnitOfMeasure,
UnitOfMeasureSAPCode,
UnitOfMeasureISOCode,
IsPrimaryUnitForISOCode,
UnitOfMeasureNumberOfDecimals,
UnitOfMeasureIsCommercial,
UnitOfMeasureDimension,
SIUnitCnvrsnRateNumerator,
SIUnitCnvrsnRateDenominator,
SIUnitCnvrsnRateExponent,
SIUnitCnvrsnAdditiveValue,
UnitOfMeasureDspExponent,
UnitOfMeasureDspNmbrOfDcmls,
UnitOfMeasureTemperature,
UnitOfMeasureTemperatureUnit,
UnitOfMeasurePressure,
UnitOfMeasurePressureUnit,
UnitOfMeasure_E,
/* Associations */
_Dimension,
_DimensionText,
_ISOCode,
_ISOCodeText,
_Text
    
}
