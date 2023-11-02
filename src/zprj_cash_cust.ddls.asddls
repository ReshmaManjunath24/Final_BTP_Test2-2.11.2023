@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Projection for Cash Customer'
define root view entity ZPRJ_CASH_CUST provider contract transactional_query
as projection on ZDD_CASH_CUST {
    
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
       }
       
       ]
                
       @UI.fieldGroup: [{
        
      qualifier: 'one',
        position: 10,
     label:'Customer Number'
      }]
     @UI.identification: [{position: 10 }]
     
      key zcustomer_num as CustomerNumber,







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
     label:'Customer Ratings'
      }]
     @UI.identification: [{position: 50 }] 
     zcustomer_ratings ,
     
     @UI.fieldGroup: [{
        
      qualifier: 'one',
        position: 50,
     label:'Credit Limit Unsecured'
      }]
     @UI.identification: [{position: 60 }] 
     zcl_unsecured ,
     
      @UI.fieldGroup: [{
        
      qualifier: 'one',
        position: 60,
     label:'Credit Limit Secured'
      }]
     @UI.identification: [{position: 70 }]
     zcl_secured ,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'one',
        position: 70,
     label:'Total Credit Amount'
      }]
     @UI.identification: [{position: 80 }]
     ztotal_credit_amount ,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'one',
        position: 80,
     label:'In Functional Currency'
      }]
     @UI.identification: [{position: 90 }]
     zin_functional_currency,
     
     ------------------------------------------------------
     
     //FACET TWO
     
      @UI.fieldGroup: [{
        
      qualifier: 'two',
        position: 10,
     label:'Security'
      }]
     @UI.identification: [{position: 10 }]
     zsecurity,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'two',
        position: 20,
     label:'Payment Terms'
      }]
     @UI.identification: [{position: 30 }]
     zpayment_terms,
     
     @UI.fieldGroup: [{
        
      qualifier: 'two',
        position: 30,
     label:'Is Proxima'
      }]
     @UI.identification: [{position: 40 }]
     zproxima,
     
     @UI.fieldGroup: [{
        
      qualifier: 'two',
        position: 40,
     label:'Maximum Credit Days'
      }]
     @UI.identification: [{position: 50 }]
     zmaximum_credit_days ,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'two',
        position: 60,
     label:'Limit Valid Till'
      }]
     @UI.identification: [{position: 70 }]
     zlimit_valid_till,
     
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'two',
        position: 70,
     label:'Legal Name'
      }]
     @UI.identification: [{position: 80 }]
     zlegal_name ,
     
     @UI.fieldGroup: [{
        
      qualifier: 'two',
        position: 80,
     label:'Add Sites'
      }]
     @UI.identification: [{position: 90 }] 
     zadd_sites,
     
   ----------------------------------------------------------------------------
   
   //THREE
   
   @UI.fieldGroup: [{
        
      qualifier: 'three',
        position: 10,
     label:'Year of Establishment'
      }]
     @UI.identification: [{position: 10 }]  
      zyear_of_establishment,
      
      
      @UI.fieldGroup: [{
        // Qualifier is mandatory as this is
        // the way to distinguish between
        // Multiple groups
       qualifier: 'three',
       position: 10,
       label:'Type of Entity'
       }]
     @UI.identification: [{position: 20 }]
     ztype_of_entity,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'three',
        position: 20,
     label:'Customer Internal Rating'
      }]
     @UI.identification: [{position: 30 }]
     zcustomer_internal_rating,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'three',
        position: 30,
     label:'Channel Group'
      }]
     @UI.identification: [{position: 40 }]
     zchannel_group,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'three',
        position: 40,
     label:'Channel Group'
      }]
     @UI.identification: [{position: 50 }]
     zchannel ,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'three',
        position: 50,
     label:'Sub Channel'
      }]
     @UI.identification: [{position: 60 }]
     zsub_channel,
     
     
      @UI.fieldGroup: [{
        
      qualifier: 'three',
        position: 60,
     label:'Line of Business Type'
      }]
     @UI.identification: [{position: 70 }]
     zline_business_type,
     
      @UI.fieldGroup: [{
        
      qualifier: 'three',
        position: 70,
     label:'Zone'
      }]
     @UI.identification: [{position: 80 }]
     zzone ,
     
     @UI.fieldGroup: [{
        
      qualifier: 'three',
        position: 80,
     label:'Sub Area'
      }]
     @UI.identification: [{position: 90 }]
     zsub_area ,
     ----------------------------------------------------------
     
     //FOUR
     
     @UI.fieldGroup: [{
        
      qualifier: 'four',
        position: 10,
     label:'Emirate'
      }]
     @UI.identification: [{position: 10 }]
     zemirate,
     
     
     @UI.fieldGroup: [{
        // Qualifier is mandatory as this is
        // the way to distinguish between
        // Multiple groups
       qualifier: 'four',
       position: 10,
       label:'Designation'
       }]
     @UI.identification: [{position: 20 }]
     zdesignation,
     
     @UI.fieldGroup: [{
        
      qualifier: 'four',
        position: 20,
     label:'Office Phone Number'
      }]
     @UI.identification: [{position: 30 }]
     zoffice_phone_number,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'four',
        position: 30,
     label:'Mobile Number'
      }]
     @UI.identification: [{position: 40 }]
     zmobile_number,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'four',
        position: 40,
     label:'VAT/GST Number'
      }]
     @UI.identification: [{position: 50 }]
     zvat_gst_number,
     
      @UI.fieldGroup: [{
        
      qualifier: 'four',
        position: 50,
     label:'Attachment'
      }]
     @UI.identification: [{position: 60 }]
     zattachment ,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'four',
        position: 60,
     label:'License Type'
      }]
     @UI.identification: [{position: 70 }]
     zlicense_type,
     
     
       @UI.fieldGroup: [{
        
      qualifier: 'four',
        position: 70,
     label:'License Number'
      }]
     @UI.identification: [{position: 80 }]
     zlicense_number,
     
     
      @UI.fieldGroup: [{
        
      qualifier: 'four',
        position: 80,
     label:'Import License Number'
      }]
     @UI.identification: [{position: 90 }]
     zimport_license_number,
     
     ---------------------------------------------
     
     //FIVE
     
       @UI.fieldGroup: [{
        
      qualifier: 'five',
        position: 10,
     label:'Source of Inquiry'
      }]
     @UI.identification: [{position: 10 }]
     zsource_of_inquiry ,
     
     
     @UI.fieldGroup: [{
        // Qualifier is mandatory as this is
        // the way to distinguish between
        // Multiple groups
       qualifier: 'five',
       position: 10,
       label:'Passport Copy'
       }]
     @UI.identification: [{position: 20 }]
     zpassport_copy,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'five',
        position: 20,
     label:'Valid Passport Date'
      }]
     @UI.identification: [{position: 30 }]
     zvalid_passport_date,
     
     
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'five',
        position: 30,
     label:'Visa Copy'
      }]
     @UI.identification: [{position: 40 }]
     zvisa_copy,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'five',
        position: 40,
     label:'Valid Visa Dte'
      }]
     @UI.identification: [{position: 50 }]
     zvalid_visa_date,
     
      @UI.fieldGroup: [{
        
      qualifier: 'five',
        position: 50,
     label:'National Identity Card'
      }]
     @UI.identification: [{position: 60 }]
     znational_identity_card,
     
     @UI.fieldGroup: [{
        
      qualifier: 'five',
        position: 60,
     label:'KYC Attachment with Signatures'
      }]
     @UI.identification: [{position: 70 }]
     zkyc_atchmnt_with_signatures,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'five',
        position: 70,
     label:'Route Code'
      }]
     @UI.identification: [{position: 80 }]
     zroute_code,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'five',
        position: 80,
     label:'Geocode Latitude'
      }]
     @UI.identification: [{position: 90 }]
     zgeocode_latitude,
     
      @UI.fieldGroup: [{
        
      qualifier: 'five',
        position: 90,
     label:'Geocode Longitude'
      }]
     @UI.identification: [{position: 100 }]
     zgeocode_longitude,
     
     
     -------------
     
     //SIX
     
     @UI.fieldGroup: [{
        
      qualifier: 'six',
        position: 10,
     label:'Customer Group'
      }]
     @UI.identification: [{position: 10 }]
      zcustomer_group,
     
     
     @UI.fieldGroup: [{
        // Qualifier is mandatory as this is
        // the way to distinguish between
        // Multiple groups
       qualifier: 'six',
       position: 10,
       label:'Customer Type'
       }]
     @UI.identification: [{position: 20 }]
     zcustomer_type,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'six',
        position: 20,
     label:'Country'
      }]
     @UI.identification: [{position: 30 }]
     zcountry,
     
     
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'six',
        position: 30,
     label:'Address Line 1'
      }]
     @UI.identification: [{position: 40 }]
     zaddress_line1,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'six',
        position: 40,
     label:'Address Line 2'
      }]
     @UI.identification: [{position: 50 }]
     zaddress_line2 ,
     
      @UI.fieldGroup: [{
        
      qualifier: 'six',
        position: 50,
     label:'City'
      }]
     @UI.identification: [{position: 60 }]
     zcity,
     
     @UI.fieldGroup: [{
        
      qualifier: 'six',
        position: 60,
     label:'Initiator Name'
      }]
     @UI.identification: [{position: 70 }]
     zinitiator_name ,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'six',
        position: 70,
     label:'PO BOX /Pincode'
      }]
     @UI.identification: [{position: 80 }]
     zpoboxno_pincode,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'six',
        position: 80,
     label:'First Name'
      }]
     @UI.identification: [{position: 90 }]
     zfirst_name,
     
      @UI.fieldGroup: [{
        
      qualifier: 'six',
        position: 90,
     label:'Last Name'
      }]
     @UI.identification: [{position: 100 }]
     zlast_name ,
     
     ---------------
     //SEVEN
     
     @UI.fieldGroup: [{
        
      qualifier: 'seven',
        position: 10,
     label:'Valid From'
      }]
     @UI.identification: [{position: 10 }]
     zvalidfrom,
     
     
     @UI.fieldGroup: [{
        // Qualifier is mandatory as this is
        // the way to distinguish between
        // Multiple groups
       qualifier: 'seven',
       position: 10,
       label:'Valid To'
       }]
     @UI.identification: [{position: 20 }]
     zvalidto ,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'seven',
        position: 20,
     label:'Email ID'
      }]
     @UI.identification: [{position: 30 }]
      zemail_id,
     
     
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'seven',
        position: 30,
     label:'Document Authctn by Chamber of Commerce'
      }]
     @UI.identification: [{position: 40 }]
     zdoc_authentin_by_chmbr_cmrce,
     
     
     @UI.fieldGroup: [{
        
      qualifier: 'seven',
        position: 40,
     label:'Whether Route code Audit is Performed'
      }]
     @UI.identification: [{position: 50 }]
     zroutecode_audit_performance 
     
      
     
}
