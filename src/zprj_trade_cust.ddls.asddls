@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View fo Trading Business Partner'
define root view entity ZPRJ_TRADE_CUST
  provider contract transactional_query
  as projection on ZDD_TRADE_CUST
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
             label: 'Customer Data one'
             },


              {
             parentId: 'GeneralInformation',
             id:'group2Information',
             type: #FIELDGROUP_REFERENCE,
             targetQualifier: 'two',
             label: 'Customer Data two'
             },


             {
             parentId: 'GeneralInformation',
             id:'group3Information',
             type: #FIELDGROUP_REFERENCE,
             targetQualifier: 'three',
             label: 'Customer Data three'
             },


             {
             parentId: 'GeneralInformation',
             id:'group4Information',
             type: #FIELDGROUP_REFERENCE,
             targetQualifier: 'four',
             label: 'Customer Data four'
             },

              {
             parentId: 'GeneralInformation',
             id:'group5Information',
             type: #FIELDGROUP_REFERENCE,
             targetQualifier: 'five',
             label: 'Customer Data five'
             },

             {
             parentId: 'GeneralInformation',
             id:'group6Information',
             type: #FIELDGROUP_REFERENCE,
             targetQualifier: 'six',
             label: 'Customer Data six'
             },

             {
             parentId: 'GeneralInformation',
             id:'group7Information',
             type: #FIELDGROUP_REFERENCE,
             targetQualifier: 'seven',
             label: 'Customer Data seven'
             },


              {
             parentId: 'GeneralInformation',
             id:'group8Information',
             type: #FIELDGROUP_REFERENCE,
             targetQualifier: 'eight',
             label: 'Customer Data eight'
             },


              {
             parentId: 'GeneralInformation',
             id:'group9Information',
             type: #FIELDGROUP_REFERENCE,
             targetQualifier: 'nine',
             label: 'Customer Data nine'
             },


              {
             parentId: 'GeneralInformation',
             id:'group10Information',
             type: #FIELDGROUP_REFERENCE,
             targetQualifier: 'ten',
             label: 'Customer Data ten'
             },

             {
             parentId: 'GeneralInformation',
             id:'group11Information',
             type: #FIELDGROUP_REFERENCE,
             targetQualifier: 'eleven',
             label: 'Customer Data eleven'
             },


             {
             parentId: 'GeneralInformation',
             id:'group12Information',
             type: #FIELDGROUP_REFERENCE,
             targetQualifier: 'twelve',
             label: 'Customer Data twelve'
             }

             ]

      @UI.fieldGroup: [{

     qualifier: 'one',
       position: 10,
    label:'Customer Number'
     }]
      @UI.identification: [{position: 10 }]
  key zcustomer_num,

      @UI.fieldGroup: [{
           // Qualifier is mandatory as this is
           // the way to distinguish between
           // Multiple groups
          qualifier: 'one',
          position: 10,
          label:'Business Unit Name'}]
      @UI.identification: [{position: 20 }]
      zbusiness_unit_name,


      @UI.fieldGroup: [{
       qualifier: 'one',
         position: 20,
      label:'Vertical'}]
      @UI.identification: [{position: 30 }]
      zvertical,

      @UI.fieldGroup: [{
       qualifier: 'one',
         position: 30,
      label:'Customer Legal Name'}]
      @UI.identification: [{position: 40 }]
      zcustomer_group,
      @UI.fieldGroup: [{

       qualifier: 'one',
         position: 30,
      label:'Customer Legal Name'}]
      @UI.identification: [{position: 50 }]
      zcustomer_legal_name,
      
      @UI.fieldGroup: [{
       qualifier: 'one',
         position: 30,
      label:'Add Sites'}]
      @UI.identification: [{position: 60 }]
      zadd_sites,

      @UI.fieldGroup: [{
       qualifier: 'one',
         position: 30,
      label:'Year of Establishment'}]
      @UI.identification: [{position: 70 }]
      zyear_of_establishment,

      @UI.fieldGroup: [{
       qualifier: 'one',
         position: 30,
      label:'Type of Entity'}]
      @UI.identification: [{position: 80 }]
      ztype_of_entity,

      @UI.fieldGroup: [{
       qualifier: 'one',
         position: 30,
      label:'Customer Internal Rating'}]
      @UI.identification: [{position: 90 }]
      zcustomer_internal_rating,

      zcustomer_type,
      zchannel_group,
      zchannel,
      zsub_channel,
      zline_business_type,
      zcountry,
      zaddress_line_1,
      zaddress_line_2,
      zalternate_address,
      zcity,
      zstate,
      zpo_box_no_pin_code,
      zprovins,
      first_name,
      last_name,
      zdesignation,
      email_id,
      zoffice_phone_number,
      zmobile_number,
      zvat_gst_number,
      zattachment,
      zlicense_type,
      zvalid_from,
      zvalid_to,
      zimport_license_number,
      zsource_of_inquiry,
      company_identity_by_pass,
      certifications_of_incorporatio,
      memorandum_articles_of_associa,
      sponsors_passport,
      commercial_license,
      attachments_with_signature,
      route_audit_is_performed,
      route_code,
      geo_code,
      latitude,
      longitude,
      credit_limit_currency,
      backgrond_of_customer,
      rationable_for_trading,
      monthly_physical_buy_volume,
      monthly_physical_sell_volume,
      monthly_paper_volume,
      stoploss_mt_if_any,
      gross_average_gc_or_av_gc_mt,
      avg_gc_mt_or_gc,
      inco_term,
      zcredit_limit_type,
      zcredit_limit_type_currency,
      zopen_clean_credit_amount,
      zcad_amount,
      zpoc_in_hand_amount,
      zundated_or_security_deposit_c,
      zcri,
      zcri_amount,
      zcri_insurer_amount,
      zuncfrmd_lc_nonapvd_bnkname,
      zuncfrmd_lc_nonapvd_bnkamt,
      ztotal_secured_limit,
      ztotal_unsecured_limit,
      ztotal_credit_amount,
      zin_functional_currency,
      zdate,
      zmaximum_credit_days,
      zcash_collection,
      ztransit_time,
      ztotal_credit_days,
      zproxima,
      zpayment_terms,
      zbu_name,
      zbu_code,
      zsite_name,
      zprty_site_no,
      zcredit_limit,
      zbalance_amt,
      ztot_site_lvl_cl,
      ztot_credit_limit,
      zfinancial_statement,
      zd_and_b_report,
      zbank_statement_references,
      zlast_12_stmnt_accts,
      zyear_of_financial,
      zrevenue_net_profit_crncy,
      zrevenue_turnover,
      znetprofit,
      zcountry2,
      zcountry_rating,
      zd_and_b_rating,
      ztrail_date,
      ztrail_user,
      ztrail_role,
      ztrail_status,
      ztrail_tot_cl_approved,
      ztrailmax_credit_days,
      ztrail_version,
      ztrail_remarks

}
