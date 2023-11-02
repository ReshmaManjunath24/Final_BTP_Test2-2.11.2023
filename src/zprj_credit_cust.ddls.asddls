@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Projection for Credit Customer'
define root view entity ZPRJ_CREDIT_CUST provider contract transactional_query
as projection on ZDD_CREDIT_CUST{

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
    key zcustomer_num ,
     
     
     @UI.fieldGroup: [{
        // Qualifier is mandatory as this is
        // the way to distinguish between
        // Multiple groups
       qualifier: 'one',
       position: 10,
       label:'Business Unit Name'
       }]
     @UI.identification: [{position: 20 }]
    zbusiness_unit_name,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'one',
        position: 20,
     label:'Vertical'
      }]
     @UI.identification: [{position: 30 }]
     zvertical,
     
     @UI.fieldGroup: [{
        
      qualifier: 'one',
        position: 30,
     label:'Customer Legal Name'
      }]
     @UI.identification: [{position: 40 }]
     zcustomer_legal_name,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'one',
        position: 40,
     label:'Customer Groupzcustomer_ratings '
      }]
     @UI.identification: [{position: 50 }] 
      zcustomer_group,
     
     @UI.fieldGroup: [{
        
      qualifier: 'one',
        position: 50,
     label:'Customer Ratings'
      }]
     @UI.identification: [{position: 60 }] 
      zcustomer_ratings ,
     
      @UI.fieldGroup: [{
        
      qualifier: 'one',
        position: 60,
     label:'Credit Limit Unsecured'
      }]
     @UI.identification: [{position: 70 }]
      zcl_unsecured,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'one',
        position: 70,
     label:'Credit Limit Secured'
      }]
     @UI.identification: [{position: 80 }]
      zcl_secured,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'one',
        position: 80,
     label:'Total Credit Amount'
      }]
     @UI.identification: [{position: 90 }]
     ztotal_credit_amount,
     
     ----------------
     
     //TWO
     
     @UI.fieldGroup: [{
        
      qualifier: 'two',
        position: 10,
     label:'In Functional Currency'
      }]
     @UI.identification: [{position: 10 }]
     zin_functional_currency,
     
     
     @UI.fieldGroup: [{
        // Qualifier is mandatory as this is
        // the way to distinguish between
        // Multiple groups
       qualifier: 'two',
       position: 10,
       label:''
       }]
     @UI.identification: [{position: 20 }]
    zpayment_terms ,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'two',
        position: 20,
     label:''
      }]
     @UI.identification: [{position: 30 }]
     Zproxima,
     
     @UI.fieldGroup: [{
        
      qualifier: 'two',
        position: 30,
     label:'Maximum Credit Days'
      }]
     @UI.identification: [{position: 40 }]
     zmaximum_credit_days,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'two',
        position: 40,
     label:'Limit Valid Till'
      }]
     @UI.identification: [{position: 50 }] 
      zlimit_valid_till,
     
     @UI.fieldGroup: [{
        
      qualifier: 'two',
        position: 50,
     label:'Initiator Name'
      }]
     @UI.identification: [{position: 60 }] 
      zinitiator_name,
     
      @UI.fieldGroup: [{
        
      qualifier: 'two',
        position: 60,
     label:'Add Sites'
      }]
     @UI.identification: [{position: 70 }]
      zadd_sites,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'two',
        position: 70,
     label:'Year of Establishment'
      }]
     @UI.identification: [{position: 80 }]
      zyear_of_establishment,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'two',
        position: 80,
     label:'Type of Entity'
      }]
     @UI.identification: [{position: 90 }]
     ztype_of_entity,
     ---------------
     
     //THREE
     
         @UI.fieldGroup: [{
        
      qualifier: 'three',
        position: 10,
     label:'Customer Internal Rating'
      }]
     @UI.identification: [{position: 10 }]
     zcustomer_internal_rating,
     
     
     @UI.fieldGroup: [{
        // Qualifier is mandatory as this is
        // the way to distinguish between
        // Multiple groups
       qualifier: 'three',
       position: 10,
       label:'Customer Type'
       }]
     @UI.identification: [{position: 20 }]
    zcustomer_type,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'three',
        position: 20,
     label:'Channel Group'
      }]
     @UI.identification: [{position: 30 }]
     zchannel_group,
     
     @UI.fieldGroup: [{
        
      qualifier: 'three',
        position: 30,
     label:'Channel'
      }]
     @UI.identification: [{position: 40 }]
     zchannel,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'three',
        position: 40,
     label:'Sub Channel'
      }]
     @UI.identification: [{position: 50 }] 
      zsub_channel,
     
     @UI.fieldGroup: [{
        
      qualifier: 'three',
        position: 50,
     label:'Line of Business Type'
      }]
     @UI.identification: [{position: 60 }] 
     zline_business_type ,
     
      @UI.fieldGroup: [{
        
      qualifier: 'three',
        position: 60,
     label:'Country'
      }]
     @UI.identification: [{position: 70 }]
      zcountry ,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'three',
        position: 70,
     label:'Address Line 1'
      }]
     @UI.identification: [{position: 80 }]
      zaddress_line1,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'three',
        position: 80,
     label:'Address Line 2 '
      }]
     @UI.identification: [{position: 90 }]
     zaddress_line2,
     -------------------
     
     //FOUR
     
         @UI.fieldGroup: [{
        
      qualifier: 'four',
        position: 10,
     label:'City'
      }]
     @UI.identification: [{position: 10 }]
     zcity ,
     
     
     @UI.fieldGroup: [{
        // Qualifier is mandatory as this is
        // the way to distinguish between
        // Multiple groups
       qualifier: 'PO BOX/ Pincode',
       position: 10,
       label:'four'
       }]
     @UI.identification: [{position: 20 }]
    zpoboxno_pincode,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'four',
        position: 20,
     label:'Zone'
      }]
     @UI.identification: [{position: 30 }]
     zzone,
     
     @UI.fieldGroup: [{
        
      qualifier: 'four',
        position: 30,
     label:'Sub Area'
      }]
     @UI.identification: [{position: 40 }]
     zsub_area,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'four',
        position: 40,
     label:'Emirate'
      }]
     @UI.identification: [{position: 50 }] 
      zemirate,
     
     @UI.fieldGroup: [{
        
      qualifier: 'four',
        position: 50,
     label:'First Name'
      }]
     @UI.identification: [{position: 60 }] 
      zfirst_name,
     
      @UI.fieldGroup: [{
        
      qualifier: 'four',
        position: 60,
     label:'Last Name'
      }]
     @UI.identification: [{position: 70 }]
      zlast_name,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'four',
        position: 70,
     label:'Designation'
      }]
     @UI.identification: [{position: 80 }]
      zdesignation,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'four',
        position: 80,
     label:'Email ID'
      }]
     @UI.identification: [{position: 90 }]
     zemail_id,
     
     -------------------
     
     //FIVE
     
         @UI.fieldGroup: [{
        
      qualifier: 'five',
        position: 10,
     label:'Office Phone Number'
      }]
     @UI.identification: [{position: 10 }]
     zoffice_phone_number,
     
     
     @UI.fieldGroup: [{
        // Qualifier is mandatory as this is
        // the way to distinguish between
        // Multiple groups
       qualifier: 'five',
       position: 10,
       label:'Mobile Number'
       }]
     @UI.identification: [{position: 20 }]
    zmobile_number,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'five',
        position: 20,
     label:'VAT/GST Number'
      }]
     @UI.identification: [{position: 30 }]
     zvat_gst_number,
     
     @UI.fieldGroup: [{
        
      qualifier: 'five',
        position: 30,
     label:'Attachment'
      }]
     @UI.identification: [{position: 40 }]
     Zattachment,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'five',
        position: 40,
     label:'License Type'
      }]
     @UI.identification: [{position: 50 }] 
      zlicense_type,
     
     @UI.fieldGroup: [{
        
      qualifier: 'five',
        position: 50,
     label:'License Number '
      }]
     @UI.identification: [{position: 60 }] 
      zlicense_number ,
     
      @UI.fieldGroup: [{
        
      qualifier: 'five',
        position: 60,
     label:'Import License Number'
      }]
     @UI.identification: [{position: 70 }]
      zimport_license_number,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'five',
        position: 70,
     label:'Source of Inquiry'
      }]
     @UI.identification: [{position: 80 }]
      zsource_of_inquiry,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'five',
        position: 80,
     label:'Partnership Identity by Pass'
      }]
     @UI.identification: [{position: 90 }]
     zpartnership_identity_by_pass,
     --------------
     
     //SIX
     
         @UI.fieldGroup: [{
        
      qualifier: 'six',
        position: 10,
     label:'Partnership Deed'
      }]
     @UI.identification: [{position: 10 }]
     zpartnership_deed,
     
     
     @UI.fieldGroup: [{
        // Qualifier is mandatory as this is
        // the way to distinguish between
        // Multiple groups
       qualifier: 'six',
       position: 10,
       label:'Sponsors Passport'
       }]
     @UI.identification: [{position: 20 }]
    zsponsors_passport,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'six',
        position: 20,
     label:'Commercial License'
      }]
     @UI.identification: [{position: 30 }]
     zcommercial_license,
     
     @UI.fieldGroup: [{
        
      qualifier: 'six',
        position: 30,
     label:'Owners Identity Pass'
      }]
     @UI.identification: [{position: 40 }]
     zowners_identity_pass,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'six',
        position: 40,
     label:'Passport Copy'
      }]
     @UI.identification: [{position: 50 }] 
      zpassport_copy,
     
     @UI.fieldGroup: [{
        
      qualifier: 'six',
        position: 50,
     label:'Valid Passport Date'
      }]
     @UI.identification: [{position: 60 }] 
      zvalid_passport_date,
     
      @UI.fieldGroup: [{
        
      qualifier: 'six',
        position: 60,
     label:'Visa Copy'
      }]
     @UI.identification: [{position: 70 }]
     zvisa_copy  ,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'six',
        position: 70,
     label:'Valid Visa Date'
      }]
     @UI.identification: [{position: 80 }]
      zvalid_visa_date ,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'six',
        position: 80,
     label:'National Identity Card '
      }]
     @UI.identification: [{position: 90 }]
     znational_identity_card,
     ----------------------
     
     //SEVEN
     
     
         @UI.fieldGroup: [{
        
      qualifier: 'seven',
        position: 10,
     label:'Doc authentin by chmbr of cmrce'
      }]
     @UI.identification: [{position: 10 }]
     zdoc_authentin_by_chmbr_cmrce,
     
     
     @UI.fieldGroup: [{
        // Qualifier is mandatory as this is
        // the way to distinguish between
        // Multiple groups
       qualifier: 'seven',
       position: 10,
       label:'KYC Attachment with Signatures'
       }]
     @UI.identification: [{position: 20 }]
    zkyc_atchmnt_with_signatures,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'seven',
        position: 20,
     label:'Routecode Audit Performance'
      }]
     @UI.identification: [{position: 30 }]
     zroutecode_audit_performance,
     
     @UI.fieldGroup: [{
        
      qualifier: 'seven',
        position: 30,
     label:'Route Code'
      }]
     @UI.identification: [{position: 40 }]
     zroute_code ,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'seven',
        position: 40,
     label:'Geocode Latitude'
      }]
     @UI.identification: [{position: 50 }] 
     zgeocode_latitude ,
     
     @UI.fieldGroup: [{
        
      qualifier: 'seven',
        position: 50,
     label:'Geocode Longitude'
      }]
     @UI.identification: [{position: 60 }] 
      zgeocode_longitude,
     
      @UI.fieldGroup: [{
        
      qualifier: 'seven',
        position: 60,
     label:'Credit Limit Type'
      }]
     @UI.identification: [{position: 70 }]
      zcredit_limit_type,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'seven',
        position: 70,
     label:'Credit Limit Type Currency'
      }]
     @UI.identification: [{position: 80 }]
      zcredit_limit_type_currency,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'seven',
        position: 80,
     label:'OPen/Clean Credit Amount'
      }]
     @UI.identification: [{position: 90 }]
     zopen_clean_credit_amount ,
     ------------------------
     
     //EIGHT
     
     
         @UI.fieldGroup: [{
        
      qualifier: 'eight',
        position: 10,
     label:'CAD Amount'
      }]
     @UI.identification: [{position: 10 }]
     zcad_amount,
     
     
     @UI.fieldGroup: [{
        // Qualifier is mandatory as this is
        // the way to distinguish between
        // Multiple groups
       qualifier: 'eight',
       position: 10,
       label:'POC inhand Amount '
       }]
     @UI.identification: [{position: 20 }]
    zpoc_in_hand_amount,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'eight',
        position: 20,
     label:'Undated sec Deposit Cheque'
      }]
     @UI.identification: [{position: 30 }]
     zundated_sec_deposit_cheque,
     
     @UI.fieldGroup: [{
        
      qualifier: 'eight',
        position: 30,
     label:'CRI Amount'
      }]
     @UI.identification: [{position: 40 }]
     zcri_amount,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'eight',
        position: 40,
     label:'CRI Insurer'
      }]
     @UI.identification: [{position: 50 }] 
      zcri_insurer ,
     
     @UI.fieldGroup: [{
        
      qualifier: 'eight',
        position: 50,
     label:'Uncfrmd LC Nonapvdb Bnkname'
      }]
     @UI.identification: [{position: 60 }] 
      zuncfrmd_lc_nonapvd_bnkname,
     
      @UI.fieldGroup: [{
        
      qualifier: 'eight',
        position: 60,
     label:'Uncfrmd LC Nonapvdb BnkAmt'
      }]
     @UI.identification: [{position: 70 }]
      zuncfrmd_lc_nonapvd_bnkamt,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'eight',
        position: 70,
     label:'Total Secured Credit Limit'
      }]
     @UI.identification: [{position: 80 }]
      ztot_secured_cl ,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'eight',
        position: 80,
     label:'Tota Unsecured Credit Limit'
      }]
     @UI.identification: [{position: 90 }]
     ztot_unsecured_cl ,
     -----------------
     
     //NINE
     
     
         @UI.fieldGroup: [{
        
      qualifier: 'nine',
        position: 10,
     label:'Total Credit Amount'
      }]
     @UI.identification: [{position: 10 }]
     ztot_credit_amount,
     
     
     @UI.fieldGroup: [{
        // Qualifier is mandatory as this is
        // the way to distinguish between
        // Multiple groups
       qualifier: 'nine',
       position: 10,
       label:'Credit Limit Validity Date'
       }]
     @UI.identification: [{position: 20 }]
    zcredit_lmt_validity_date,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'nine',
        position: 20,
     label:'Cash Collection'
      }]
     @UI.identification: [{position: 30 }]
     zcash_collection ,
     
     @UI.fieldGroup: [{
        
      qualifier: 'nine',
        position: 30,
     label:'Transit Time'
      }]
     @UI.identification: [{position: 40 }]
     ztransit_time,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'nine',
        position: 40,
     label:'Total Credit Days'
      }]
     @UI.identification: [{position: 50 }] 
      ztotal_credit_days,
     
     @UI.fieldGroup: [{
        
      qualifier: 'nine',
        position: 50,
     label:'Business Unit Name'
      }]
     @UI.identification: [{position: 60 }] 
      zbu_name,
     
      @UI.fieldGroup: [{
        
      qualifier: 'nine',
        position: 60,
     label:'Business Unit Code'
      }]
     @UI.identification: [{position: 70 }]
      zbu_code,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'nine',
        position: 70,
     label:'Site Name'
      }]
     @UI.identification: [{position: 80 }]
      zsite_name,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'nine',
        position: 80,
     label:'Party Site Number'
      }]
     @UI.identification: [{position: 90 }]
     zprty_site_no,
     
     -------------------
     
     //TEN
     
         @UI.fieldGroup: [{
        
      qualifier: 'ten',
        position: 10,
     label:'Credit Limit'
      }]
     @UI.identification: [{position: 10 }]
     zcredit_limit,
     
     
     @UI.fieldGroup: [{
        // Qualifier is mandatory as this is
        // the way to distinguish between
        // Multiple groups
       qualifier: 'ten',
       position: 10,
       label:'Balance Amount'
       }]
     @UI.identification: [{position: 20 }]
    zbalance_amt ,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'ten',
        position: 20,
     label:'Total Site Level Credit Limit'
      }]
     @UI.identification: [{position: 30 }]
     ztot_site_lvl_cl ,
     
     @UI.fieldGroup: [{
        
      qualifier: 'ten',
        position: 30,
     label:'Total Credit Limit'
      }]
     @UI.identification: [{position: 40 }]
     ztot_credit_limit ,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'ten',
        position: 40,
     label:'Financial Statement'
      }]
     @UI.identification: [{position: 50 }] 
      zfinancial_statement,
     
     @UI.fieldGroup: [{
        
      qualifier: 'ten',
        position: 50,
     label:'D&B Report'
      }]
     @UI.identification: [{position: 60 }] 
      zdandb_report,
     
      @UI.fieldGroup: [{
        
      qualifier: 'ten',
        position: 60,
     label:'Bank Statement'
      }]
     @UI.identification: [{position: 70 }]
      zbank_statement,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'ten',
        position: 70,
     label:'Last Twelve Months Statement Acts'
      }]
     @UI.identification: [{position: 80 }]
      zlast_twelvemths_stmnt_accts,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'ten',
        position: 80,
     label:'Year of Financial'
      }]
     @UI.identification: [{position: 90 }]
     zyear_of_financial,
     
     ---------------------------------
     
     //ELEVEN
         @UI.fieldGroup: [{
        
      qualifier: 'eleven',
        position: 10,
     label:'Revenue Net Profit Currency'
      }]
     @UI.identification: [{position: 10 }]
     zrevenue_net_profit_crncy,
     
     
     @UI.fieldGroup: [{
        // Qualifier is mandatory as this is
        // the way to distinguish between
        // Multiple groups
       qualifier: 'eleven',
       position: 10,
       label:'Revenue Turnover'
       }]
     @UI.identification: [{position: 20 }]
    zrevenue_turnover,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'eleven',
        position: 20,
     label:'Net Profit'
      }]
     @UI.identification: [{position: 30 }]
     Znetprofit    ,
     
     @UI.fieldGroup: [{
        
      qualifier: 'eleven',
        position: 30,
     label:'Country Rating'
      }]
     @UI.identification: [{position: 40 }]
     zcountry_rating,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'eleven',
        position: 40,
     label:'D&B Rating'
      }]
     @UI.identification: [{position: 50 }] 
      zdandb_rating,
     
     @UI.fieldGroup: [{
        
      qualifier: 'eleven',
        position: 50,
     label:'Trail Date'
      }]
     @UI.identification: [{position: 60 }] 
      ztrail_date ,
     
      @UI.fieldGroup: [{
        
      qualifier: 'eleven',
        position: 60,
     label:'Trial User'
      }]
     @UI.identification: [{position: 70 }]
      ztrail_user,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'eleven',
        position: 70,
     label:'Trail Role'
      }]
     @UI.identification: [{position: 80 }]
      ztrail_role ,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'eleven',
        position: 80,
     label:'Trail Status'
      }]
     @UI.identification: [{position: 90 }]
     ztrail_status,
     
     
     -----------
     
     //TWELVE
     
     @UI.fieldGroup: [{
        
      qualifier: 'twelve',
        position: 10,
     label:'Trial Total CL Approved'
      }]
     @UI.identification: [{position: 10 }]
     ztrail_tot_cl_approved,
     
     
     @UI.fieldGroup: [{
        // Qualifier is mandatory as this is
        // the way to distinguish between
        // Multiple groups
       qualifier: 'twelve',
       position: 10,
       label:'Trial Maximum Credit Days'
       }]
     @UI.identification: [{position: 20 }]
   ztrailmax_credit_days ,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'twelve',
        position: 20,
     label:'Trial Version'
      }]
     @UI.identification: [{position: 30 }]
     ztrail_version ,
     
     @UI.fieldGroup: [{
        
      qualifier: 'twelve',
        position: 30,
     label:'Trail Remarks'
      }]
     @UI.identification: [{position: 40 }]
     ztrail_remarks, 
     
     @UI.fieldGroup: [{
        
      qualifier: 'twelve',
        position: 50,
     label:'Valid From'
      }]
     @UI.identification: [{position: 60 }]
     zvalidfrom,
     
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'twelve',
        position: 60,
     label:'Valid To'
      }]
     @UI.identification: [{position: 70 }]
     zvalidto
     }
     
     
     
