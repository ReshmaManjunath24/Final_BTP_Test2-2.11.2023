CLASS zcl_customer_approvers DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
 INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CUSTOMER_APPROVERS IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

 DATA itab TYPE TABLE OF ztab_customer_ap.

* fill internal travel table (itab)
 itab = VALUE #(

( businessunit = 'Al Ain National Juice & Refreshments Ltd'  name = 'Melanie Benitez Gallino'  remarks =  'Submitted by'  email = 'mgallino@iffco.com' )
( businessunit = 'Al Ain National Juice & Refreshments Ltd'  name = 'Sreejith Mundakath' remarks =  'Submitted by'  email = 'smundakath@iffco.com' )
( businessunit = 'Al Ain National Juice & Refreshments Ltd'  name = 'Ankit Gupta'  remarks =  'BU Manager' email = 'akgupta@iffco.com' )
( businessunit = 'Al Ain National Juice & Refreshments Ltd'  name = 'Imtiyaz Safruddin Shaikh' remarks =  'BU Manager' email = 'IShaikh@iffco.com' )
( businessunit = 'Al Ain National Juice & Refreshments Ltd'  name = 'Yigit Caglialtuncu' remarks =  'BU Manager' email = 'yigit@iffco.com' )
( businessunit = 'Al Ain National Juice & Refreshments Ltd'  name = 'Ankit Gupta'  remarks =  'Finance' email = 'akgupta@iffco.com' )
( businessunit = 'Al Ain National Juice & Refreshments Ltd'  name = 'Nelson Vegas' remarks =  'Finance' email = 'nvegas@iffco.com' )
( businessunit = 'IFFCO ALGERIA' name = 'Tarik Bara' remarks =  'Submitted by'  email = 'tbara@iffco.com' )
( businessunit = 'IFFCO ALGERIA' name = 'Abdelkarim Faouzi Bachar' remarks =  'BU Manager' email = 'afbachar@iffco.com' )
( businessunit = 'IFFCO ALGERIA' name = 'Widad tahri'  remarks =  'Finance' email = 'wtahri@iffco.com' )
( businessunit = 'IFFCO ALGERIA' name = 'Redouane Youcef Adjouri'  remarks =  'Finance' email = 'RYAdjouri@iffco.com' )
( businessunit = 'IFFCO ALGERIA' name = 'Ziriab Jalil Boukra'  remarks =  'Finance' email = 'zjboukra@iffco.com' )
( businessunit = 'Iffco Chemicals, UAE' name = 'Kamal Rajani' remarks =  'Submitted by'  email = 'KRajani@iffco.com' )
( businessunit = 'Iffco Chemicals, UAE' name = 'Sonia Rakhil Sadiq' remarks =  'Submitted by'  email = 'ssadiq@iffco.com' )
( businessunit = 'Iffco Chemicals, UAE' name = 'Kamal Rajani' remarks =  'BU Manager' email = 'KRajani@iffco.com' )
( businessunit = 'Iffco Chemicals, UAE' name = 'Syed Nusrat Hassan' remarks =  'BU Manager' email = 'SHASSAN@iffco.com' )
( businessunit = 'Iffco Chemicals, UAE' name = 'Anant Dingliwal'  remarks =  'Finance' email = 'adingliwal@iffco.com' )
( businessunit = 'Egypt' name = 'Ahmed Abd Elghaffar Omara Ismael' remarks =  'Submitted by'  email = 'aismael@iffco.com' )
( businessunit = 'Egypt' name = 'Hadeer El Sayed'  remarks =  'Submitted by'  email = 'helsayed@iffco.com' )
( businessunit = 'Egypt' name = 'Hany Khalil Ibrahim'  remarks =  'Submitted by'  email = 'hibrahim@iffco.com' )
( businessunit = 'Egypt' name = 'Karim Khaled Abdel Wahab' remarks =  'Submitted by'  email = 'kwahab@iffco.com' )
( businessunit = 'Egypt' name = 'Marina Malak Farag Habib' remarks =  'Submitted by'  email = 'mmalak@iffco.com' )
( businessunit = 'Egypt' name = 'Mohamed Youssef'  remarks =  'Submitted by'  email = 'MTayee@iffco.com' )
( businessunit = 'Egypt' name = 'Olaya Ashraf Fathy' remarks =  'Submitted by'  email = 'Ofathy@iffco.com' )
( businessunit = 'Egypt' name = 'Ahmed Ayad' remarks =  'BU Manager' email = 'aayad@iffco.com' )
( businessunit = 'Egypt' name = 'Ahmed Saad' remarks =  'BU Manager' email = 'agsaad@iffco.com' )
( businessunit = 'Egypt' name = 'Hesham Farouk' remarks =  'BU Manager' email = 'hfarouk@iffco.com' )
( businessunit = 'Egypt' name = 'Shady Mohamed' remarks =  'Finance' email = 'smohamed@iffco.com' )
( businessunit = 'Egypt' name = 'Tamer Fawaz'  remarks =  'Finance' email = 'tfawaz@iffco.com' )
( businessunit = 'Pristine Ingredients Private Limited'  name = 'Balbale Maqsood Affan' remarks =  'Submitted by'  email = 'baffan@iffco.com' )
( businessunit = 'Pristine Ingredients Private Limited'  name = 'Poojary Chennappa Mohan'  remarks =  'Submitted by'  email = 'pmohan@iffco.com' )
( businessunit = 'Pristine Ingredients Private Limited'  name = 'Pendyala Pratapkumar' remarks =  'Submitted by'  email = 't_ppratap@iffco.com' )
( businessunit = 'Pristine Ingredients Private Limited'  name = 'Shakeb Mohammed Nasir Khan' remarks =  'BU Manager' email = 'SMKHAN@iffco.com' )
( businessunit = 'Pristine Ingredients Private Limited'  name = 'Vijay Kumar Thota' remarks =  'BU Manager' email = 'vthota@iffco.com' )
( businessunit = 'PT Synergy Oil Nusantara' name = 'Irmayani' remarks =  'Submitted by'  email = 'Irmayani@iffco.com' )
( businessunit = 'PT Synergy Oil Nusantara' name = 'Mira Yuni Ginting' remarks =  'Submitted by'  email = 'mginting@iffco.com' )
( businessunit = 'PT Synergy Oil Nusantara' name = 'Siska Sihombing'  remarks =  'Submitted by'  email = 'Msihombing@iffco.com' )
( businessunit = 'PT Synergy Oil Nusantara' name = 'Nur Hidayah'  remarks =  'Submitted by'  email = 'nhidayah@iffco.com' )
( businessunit = 'PT Synergy Oil Nusantara' name = 'Sigit Waskito' remarks =  'Submitted by'  email = 'swaskito@iffco.com' )
( businessunit = 'PT Synergy Oil Nusantara' name = 'Popy Nofi Yanti'  remarks =  'BU Manager' email = 'pnofiyanti@iffco.com' )
( businessunit = 'PT Synergy Oil Nusantara' name = 'Durachman' remarks =  'BU Manager' email = 'Durachman@iffco.com' )
( businessunit = 'PT Synergy Oil Nusantara' name = 'Surendra Mohan Thakur' remarks =  'Finance' email = 'Suthakur@iffco.com' )
( businessunit = 'OFOQ AL IRAQ IND.LLC'  name = 'Fatimah Ibrahim Hassan' remarks =  'Submitted by'  email = 'fhassan@iffco.com' )
( businessunit = 'OFOQ AL IRAQ IND.LLC'  name = 'Farah AbdulMaged AbdulRasool' remarks =  'Submitted by'  email = 'fnajaf@iffco.com' )
( businessunit = 'OFOQ AL IRAQ IND.LLC'  name = 'Moussa Saghir' remarks =  'BU Manager' email = 'msaghir@iffco.com' )
( businessunit = 'OFOQ AL IRAQ IND.LLC'  name = 'Ugur Topaloglu' remarks =  'Finance' email = 'utopaloglu@iffco.com' )
( businessunit = 'Iffco Italia' name = 'Andrea De Rosa' remarks =  'Submitted by'  email = 'aderosa@iffco.com' )
( businessunit = 'Iffco Italia' name = 'Giuseppe Bianco'  remarks =  'Submitted by'  email = 'gbianco@iffco.com' )
( businessunit = 'Iffco Italia' name = 'Margherita Dequerquis' remarks =  'Submitted by'  email = 'mdequerquis@iffco.com' )
( businessunit = 'Iffco Italia' name = 'Marco Fauci'  remarks =  'Submitted by'  email = 'mfauci@iffco.com' )
( businessunit = 'Iffco Italia' name = 'Simmaco Ovidio' remarks =  'Submitted by'  email = 'sovidio@iffco.com' )
( businessunit = 'Iffco Italia' name = 'Adin Ghazi Nouri' remarks =  'BU Manager' email = 'aghazinouri@iffco.com' )
( businessunit = 'Iffco Italia' name = 'Margherita Dequerquis' remarks =  'Finance' email = 'mdequerquis@iffco.com' )
( businessunit = 'Iffco Italia' name = 'Annarita De Fusco' remarks =  'Finance' email = 'adefusco@iffco.com' )
( businessunit = 'Pakistan'  name = 'Ahmed Anwer'  remarks =  'Submitted by'  email = 'AANWER@iffco.com' )
( businessunit = 'Pakistan'  name = 'Khurram Bilal' remarks =  'Submitted by'  email = 'kbilal@iffco.com' )
( businessunit = 'Pakistan'  name = 'Muhammad Ayaz' remarks =  'Submitted by'  email = 'mayaz@iffco.com' )
( businessunit = 'Pakistan'  name = 'Mujeeb Ahmed' remarks =  'Submitted by'  email = 'mujahmed@iffco.com' )
( businessunit = 'Pakistan'  name = 'Muhammad Usman Mahmood' remarks =  'Submitted by'  email = 'mumahmood@iffco.com' )
( businessunit = 'Pakistan'  name = 'Sakhawat Ali' remarks =  'Submitted by'  email = 'saali@iffco.com' )
( businessunit = 'Pakistan'  name = 'Saad Rehman'  remarks =  'Submitted by'  email = 'SAAREHMAN@iffco.com' )
( businessunit = 'Pakistan'  name = 'Shehryar Khalid'  remarks =  'Submitted by'  email = 'shekhalid@iffco.com' )
( businessunit = 'Pakistan'  name = 'Shah Imran' remarks =  'Submitted by'  email = 'simran@iffco.com' )
( businessunit = 'Pakistan'  name = 'Syed Shahbaz Hussain' remarks =  'Submitted by'  email = 'syedhussain@iffco.com' )
( businessunit = 'Pakistan'  name = 'Tariq Abrar'  remarks =  'Submitted by'  email = 'tabrar@iffco.com' )
( businessunit = 'Pakistan'  name = 'Usama Javed'  remarks =  'Submitted by'  email = 'ujaved@iffco.com' )
( businessunit = 'Pakistan'  name = 'Wajid Ali' remarks =  'Submitted by'  email = 'waali@iffco.com' )
( businessunit = 'Pakistan'  name = 'KAAhmed'  remarks =  'BU Manager' email = 'KAAhmed@iffco.com' )
( businessunit = 'Pakistan'  name = 'Shahzad Rasheed'  remarks =  'BU Manager' email = 'srasheed@iffco.com' )
( businessunit = 'Pakistan'  name = 'Shama Food Industriesma Jaffery'  remarks =  'BU Manager' email = 'SJAFRI@iffco.com' )
( businessunit = 'Pakistan'  name = 'Faheemuddin Shaikh' remarks =  'BU Manager' email = 'FAHEEMSHAIKH@iffco.com' )
( businessunit = 'Pakistan'  name = 'Muhammad Hassan Siddiqui' remarks =  'BU Manager' email = 'MHSIDDIQUI@iffco.com' )
( businessunit = 'Pakistan'  name = 'Gul Muhammad' remarks =  'BU Manager' email = 'GULMUHAMMAD@iffco.com' )
( businessunit = 'Pakistan'  name = 'Faizan Muhammad'  remarks =  'Finance' email = 'FMUHAMMAD@iffco.com' )
( businessunit = 'Pakistan'  name = 'Gul Muhammad' remarks =  'Finance' email = 'GULMUHAMMAD@iffco.com' )
( businessunit = 'Pakistan'  name = 'Imran Mushtaq' remarks =  'Finance' email = 'IMUSHTAQ@iffco.com' )
( businessunit = 'Pakistan'  name = 'Muhammad Haseeb Ullah' remarks =  'Finance' email = 'MHASEEBULLAH@iffco.com' )
( businessunit = 'Pakistan'  name = 'Muhammad Hussain' remarks =  'Finance' email = 'mhussain@iffco.com' )
( businessunit = 'Pakistan'  name = 'Muhammad Ikrash Asif' remarks =  'Finance' email = 'MUHASIF@iffco.com' )
( businessunit = 'Pakistan'  name = 'Naveed Ali Durvesh' remarks =  'Finance' email = 'nadurvesh@iffco.com' )
( businessunit = 'Pakistan'  name = 'Warisha Khan' remarks =  'Finance' email = 'wakhan@iffco.com' )
( businessunit = 'Shama Food Industries Food Industries' name = 'Bashayer Salem Mohamed Bin Helal Alyammahi' remarks =  'Submitted by'  email = 'BALYAMMAHI@iffco.com' )
( businessunit = 'Shama Food Industries Food Industries' name = 'Valeria Vladimrovna Krynetskaya'  remarks =  'BU Manager' email = 'VKRYNETSKAYA@iffco.com' )
( businessunit = 'Shama Food Industries Food Industries' name = 'Sweta Pandey' remarks =  'Finance' email = 'SPANDEY@iffco.com' )
( businessunit = 'Shama Food Industries' name = 'Fuad Khaled Abdulrahem' remarks =  'Submitted by'  email = 'fabdulrahem@iffco.com' )
( businessunit = 'Shama Food Industries' name = 'Sachini Gasha Katukurunda' remarks =  'Submitted by'  email = 'skatukurunda@iffco.com' )
( businessunit = 'Shama Food Industries' name = 'Philippe Paez' remarks =  'BU Manager' email = 'PPAEZ@iffco.com' )
( businessunit = 'Shama Food Industries' name = 'Tahir Arshad' remarks =  'Finance' email = 'taarshad@iffco.com' )
( businessunit = 'Iffco Iberia' name = 'Ana María Grumberg' remarks =  'Submitted by'  email = 'agrumberg@iffco.com' )
( businessunit = 'Iffco Iberia' name = 'Francisco de Paula Fernández Abras' remarks =  'Submitted by'  email = 'ffernandez@iffco.com' )
( businessunit = 'Iffco Iberia' name = 'Lucía Romero Adamuz'  remarks =  'Submitted by'  email = 'ladamuz@iffco.com' )
( businessunit = 'Iffco Iberia' name = 'Sandra Gil Solana' remarks =  'Submitted by'  email = 'ssolana@iffco.com' )
( businessunit = 'Iffco Iberia' name = 'Ravi Agarwal' remarks =  'BU Manager' email = 'RAGARWAL@iffco.com' )
( businessunit = 'Iffco Iberia' name = 'Saurabh Daga' remarks =  'BU Manager' email = 'sdaga@iffco.com' )
( businessunit = 'Iffco Iberia' name = 'Ravi Agarwal' remarks =  'Finance' email = 'RAGARWAL@iffco.com' )
( businessunit = 'Iffco Iberia' name = 'Saurabh Daga' remarks =  'Finance' email = 'sdaga@iffco.com' )

 ).
* delete existing entries in the database table
 DELETE FROM ztab_customer_ap.

*insert the new table entries
 INSERT ztab_customer_ap FROM TABLE @itab.

*output the result as a console message
 out->write( |{ sy-dbcnt } Customer Approvers entries inserted successfully!| ).

  ENDMETHOD.
ENDCLASS.
