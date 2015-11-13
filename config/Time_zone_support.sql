INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('Pacific/Efate', @time_zone_id);
INSERT INTO time_zone_transition (Time_zone_id, Transition_time, Transition_type_id) VALUES
(@time_zone_id, -1829387596, 2)
,(@time_zone_id, 433256400, 1)
,(@time_zone_id, 448977600, 2)
,(@time_zone_id, 467298000, 1)
,(@time_zone_id, 480427200, 2)
,(@time_zone_id, 496760400, 1)
,(@time_zone_id, 511876800, 2)
,(@time_zone_id, 528210000, 1)
,(@time_zone_id, 543931200, 2)
,(@time_zone_id, 559659600, 1)
,(@time_zone_id, 575380800, 2)
,(@time_zone_id, 591109200, 1)
,(@time_zone_id, 606830400, 2)
,(@time_zone_id, 622558800, 1)
,(@time_zone_id, 638280000, 2)
,(@time_zone_id, 654008400, 1)
,(@time_zone_id, 669729600, 2)
,(@time_zone_id, 686062800, 1)
,(@time_zone_id, 696340800, 2)
,(@time_zone_id, 719931600, 1)
,(@time_zone_id, 727790400, 2)
;
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
(@time_zone_id, 0, 40396, 0, 'LMT')
,(@time_zone_id, 1, 43200, 1, 'VUST')
,(@time_zone_id, 2, 39600, 0, 'VUT')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('Pacific/Enderbury', @time_zone_id);
INSERT INTO time_zone_transition (Time_zone_id, Transition_time, Transition_type_id) VALUES
(@time_zone_id, 307627200, 1)
,(@time_zone_id, 788958000, 2)
;
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
(@time_zone_id, 0, -43200, 0, 'PHOT')
,(@time_zone_id, 1, -39600, 0, 'PHOT')
,(@time_zone_id, 2, 46800, 0, 'PHOT')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('Pacific/Fakaofo', @time_zone_id);
INSERT INTO time_zone_transition (Time_zone_id, Transition_time, Transition_type_id) VALUES
(@time_zone_id, 1325242800, 1)
;
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
(@time_zone_id, 0, -39600, 0, 'TKT')
,(@time_zone_id, 1, 46800, 0, 'TKT')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('Pacific/Fiji', @time_zone_id);
INSERT INTO time_zone_transition (Time_zone_id, Transition_time, Transition_type_id) VALUES
(@time_zone_id, -1709985344, 2)
,(@time_zone_id, 909842400, 1)
,(@time_zone_id, 920124000, 2)
,(@time_zone_id, 941896800, 1)
,(@time_zone_id, 951573600, 2)
,(@time_zone_id, 1259416800, 1)
,(@time_zone_id, 1269698400, 2)
,(@time_zone_id, 1287842400, 1)
,(@time_zone_id, 1299333600, 2)
,(@time_zone_id, 1319292000, 1)
,(@time_zone_id, 1327154400, 2)
,(@time_zone_id, 1350741600, 1)
,(@time_zone_id, 1358604000, 2)
,(@time_zone_id, 1382796000, 1)
,(@time_zone_id, 1390050000, 2)
,(@time_zone_id, 1414245600, 1)
,(@time_zone_id, 1421499600, 2)
,(@time_zone_id, 1445695200, 1)
,(@time_zone_id, 1453554000, 2)
,(@time_zone_id, 1477144800, 1)
,(@time_zone_id, 1485003600, 2)
,(@time_zone_id, 1508594400, 1)
,(@time_zone_id, 1516453200, 2)
,(@time_zone_id, 1540044000, 1)
,(@time_zone_id, 1547902800, 2)
,(@time_zone_id, 1572098400, 1)
,(@time_zone_id, 1579352400, 2)
,(@time_zone_id, 1603548000, 1)
,(@time_zone_id, 1611406800, 2)
,(@time_zone_id, 1634997600, 1)
,(@time_zone_id, 1642856400, 2)
,(@time_zone_id, 1666447200, 1)
,(@time_zone_id, 1674306000, 2)
,(@time_zone_id, 1697896800, 1)
,(@time_zone_id, 1705755600, 2)
,(@time_zone_id, 1729951200, 1)
,(@time_zone_id, 1737205200, 2)
,(@time_zone_id, 1761400800, 1)
,(@time_zone_id, 1768654800, 2)
,(@time_zone_id, 1792850400, 1)
,(@time_zone_id, 1800709200, 2)
,(@time_zone_id, 1824300000, 1)
,(@time_zone_id, 1832158800, 2)
,(@time_zone_id, 1855749600, 1)
,(@time_zone_id, 1863608400, 2)
,(@time_zone_id, 1887199200, 1)
,(@time_zone_id, 1895058000, 2)
,(@time_zone_id, 1919253600, 1)
,(@time_zone_id, 1926507600, 2)
,(@time_zone_id, 1950703200, 1)
,(@time_zone_id, 1957957200, 2)
,(@time_zone_id, 1982152800, 1)
,(@time_zone_id, 1990011600, 2)
,(@time_zone_id, 2013602400, 1)
,(@time_zone_id, 2021461200, 2)
,(@time_zone_id, 2045052000, 1)
,(@time_zone_id, 2052910800, 2)
,(@time_zone_id, 2076501600, /* consulta larga de SQL (2,1 KiB), fragmentada no caractere 2.000 */
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
(@time_zone_id, 0, 42944, 0, 'LMT')
,(@time_zone_id, 1, 46800, 1, 'FJST')
,(@time_zone_id, 2, 43200, 0, 'FJT')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('Pacific/Funafuti', @time_zone_id);
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
(@time_zone_id, 0, 43200, 0, 'TVT')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('Pacific/Galapagos', @time_zone_id);
INSERT INTO time_zone_transition (Time_zone_id, Transition_time, Transition_type_id) VALUES
(@time_zone_id, -1230746496, 1)
,(@time_zone_id, 504939600, 2)
;
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
(@time_zone_id, 0, -21504, 0, 'LMT')
,(@time_zone_id, 1, -18000, 0, 'ECT')
,(@time_zone_id, 2, -21600, 0, 'GALT')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('Pacific/Gambier', @time_zone_id);
INSERT INTO time_zone_transition (Time_zone_id, Transition_time, Transition_type_id) VALUES
(@time_zone_id, -1806678012, 1)
;
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
(@time_zone_id, 0, -32388, 0, 'LMT')
,(@time_zone_id, 1, -32400, 0, 'GAMT')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('Pacific/Guadalcanal', @time_zone_id);
INSERT INTO time_zone_transition (Time_zone_id, Transition_time, Transition_type_id) VALUES
(@time_zone_id, -1806748788, 1)
;
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
(@time_zone_id, 0, 38388, 0, 'LMT')
,(@time_zone_id, 1, 39600, 0, 'SBT')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('Pacific/Guam', @time_zone_id);
INSERT INTO time_zone_transition (Time_zone_id, Transition_time, Transition_type_id) VALUES
(@time_zone_id, 977493600, 1)
;
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
(@time_zone_id, 0, 36000, 0, 'GST')
,(@time_zone_id, 1, 36000, 0, 'ChST')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('Pacific/Honolulu', @time_zone_id);
INSERT INTO time_zone_transition (Time_zone_id, Transition_time, Transition_type_id) VALUES
(@time_zone_id, -1157283000, 1)
,(@time_zone_id, -1155436200, 0)
,(@time_zone_id, -880198200, 1)
,(@time_zone_id, -765376200, 0)
,(@time_zone_id, -712150200, 2)
;
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
(@time_zone_id, 0, -37800, 0, 'HST')
,(@time_zone_id, 1, -34200, 1, 'HDT')
,(@time_zone_id, 2, -36000, 0, 'HST')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('Pacific/Johnston', @time_zone_id);
INSERT INTO time_zone_transition (Time_zone_id, Transition_time, Transition_type_id) VALUES
(@time_zone_id, -1157283000, 1)
,(@time_zone_id, -1155436200, 0)
,(@time_zone_id, -880198200, 1)
,(@time_zone_id, -765376200, 0)
,(@time_zone_id, -712150200, 2)
;
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
(@time_zone_id, 0, -37800, 0, 'HST')
,(@time_zone_id, 1, -34200, 1, 'HDT')
,(@time_zone_id, 2, -36000, 0, 'HST')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('Pacific/Kiritimati', @time_zone_id);
INSERT INTO time_zone_transition (Time_zone_id, Transition_time, Transition_type_id) VALUES
(@time_zone_id, 307622400, 1)
,(@time_zone_id, 788954400, 2)
;
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
(@time_zone_id, 0, -38400, 0, 'LINT')
,(@time_zone_id, 1, -36000, 0, 'LINT')
,(@time_zone_id, 2, 50400, 0, 'LINT')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('Pacific/Kosrae', @time_zone_id);
INSERT INTO time_zone_transition (Time_zone_id, Transition_time, Transition_type_id) VALUES
(@time_zone_id, -7988400, 1)
,(@time_zone_id, 915105600, 0)
;
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
(@time_zone_id, 0, 39600, 0, 'KOST')
,(@time_zone_id, 1, 43200, 0, 'KOST')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('Pacific/Kwajalein', @time_zone_id);
INSERT INTO time_zone_transition (Time_zone_id, Transition_time, Transition_type_id) VALUES
(@time_zone_id, -7988400, 1)
,(@time_zone_id, 745848000, 2)
;
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
(@time_zone_id, 0, 39600, 0, 'MHT')
,(@time_zone_id, 1, -43200, 0, 'KWAT')
,(@time_zone_id, 2, 43200, 0, 'MHT')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('Pacific/Majuro', @time_zone_id);
INSERT INTO time_zone_transition (Time_zone_id, Transition_time, Transition_type_id) VALUES
(@time_zone_id, -7988400, 1)
;
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
(@time_zone_id, 0, 39600, 0, 'MHT')
,(@time_zone_id, 1, 43200, 0, 'MHT')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('Pacific/Marquesas', @time_zone_id);
INSERT INTO time_zone_transition (Time_zone_id, Transition_time, Transition_type_id) VALUES
(@time_zone_id, -1806676920, 1)
;
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
(@time_zone_id, 0, -33480, 0, 'LMT')
,(@time_zone_id, 1, -34200, 0, 'MART')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('Pacific/Midway', @time_zone_id);
INSERT INTO time_zone_transition (Time_zone_id, Transition_time, Transition_type_id) VALUES
(@time_zone_id, -428504400, 1)
,(@time_zone_id, -420645600, 0)
,(@time_zone_id, -86878800, 2)
,(@time_zone_id, 439038000, 3)
;
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
(@time_zone_id, 0, -39600, 0, 'NST')
,(@time_zone_id, 1, -36000, 1, 'NDT')
,(@time_zone_id, 2, -39600, 0, 'BST')
,(@time_zone_id, 3, -39600, 0, 'SST')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('Pacific/Nauru', @time_zone_id);
INSERT INTO time_zone_transition (Time_zone_id, Transition_time, Transition_type_id) VALUES
(@time_zone_id, -1545131260, 1)
,(@time_zone_id, -877347000, 2)
,(@time_zone_id, -800960400, 1)
,(@time_zone_id, 294323400, 3)
;
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
(@time_zone_id, 0, 40060, 0, 'LMT')
,(@time_zone_id, 1, 41400, 0, 'NRT')
,(@time_zone_id, 2, 32400, 0, 'JST')
,(@time_zone_id, 3, 43200, 0, 'NRT')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('Pacific/Niue', @time_zone_id);
INSERT INTO time_zone_transition (Time_zone_id, Transition_time, Transition_type_id) VALUES
(@time_zone_id, -599575200, 1)
,(@time_zone_id, 276089400, 2)
;
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
(@time_zone_id, 0, -40800, 0, 'NUT')
,(@time_zone_id, 1, -41400, 0, 'NUT')
,(@time_zone_id, 2, -39600, 0, 'NUT')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('Pacific/Norfolk', @time_zone_id);
INSERT INTO time_zone_transition (Time_zone_id, Transition_time, Transition_type_id) VALUES
(@time_zone_id, -599656320, 1)
;
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
(@time_zone_id, 0, 40320, 0, 'NMT')
,(@time_zone_id, 1, 41400, 0, 'NFT')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('Pacific/Noumea', @time_zone_id);
INSERT INTO time_zone_transition (Time_zone_id, Transition_time, Transition_type_id) VALUES
(@time_zone_id, -1829387148, 2)
,(@time_zone_id, 250002000, 1)
,(@time_zone_id, 257342400, 2)
,(@time_zone_id, 281451600, 1)
,(@time_zone_id, 288878400, 2)
,(@time_zone_id, 849366000, 3)
,(@time_zone_id, 857228400, 4)
;
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
(@time_zone_id, 0, 39948, 0, 'LMT')
,(@time_zone_id, 1, 43200, 1, 'NCST')
,(@time_zone_id, 2, 39600, 0, 'NCT')
,(@time_zone_id, 3, 43200, 1, 'NCST')
,(@time_zone_id, 4, 39600, 0, 'NCT')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('Pacific/Pago_Pago', @time_zone_id);
INSERT INTO time_zone_transition (Time_zone_id, Transition_time, Transition_type_id) VALUES
(@time_zone_id, -1861879032, 1)
,(@time_zone_id, -631110600, 2)
,(@time_zone_id, -86878800, 3)
,(@time_zone_id, 439038000, 4)
;
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
(@time_zone_id, 0, -40968, 0, 'LMT')
,(@time_zone_id, 1, -41400, 0, 'SAMT')
,(@time_zone_id, 2, -39600, 0, 'NST')
,(@time_zone_id, 3, -39600, 0, 'BST')
,(@time_zone_id, 4, -39600, 0, 'SST')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('Pacific/Palau', @time_zone_id);
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
(@time_zone_id, 0, 32400, 0, 'PWT')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('Pacific/Pitcairn', @time_zone_id);
INSERT INTO time_zone_transition (Time_zone_id, Transition_time, Transition_type_id) VALUES
(@time_zone_id, 893665800, 1)
;
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
(@time_zone_id, 0, -30600, 0, 'PNT')
,(@time_zone_id, 1, -28800, 0, 'PST')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('Pacific/Pohnpei', @time_zone_id);
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
(@time_zone_id, 0, 39600, 0, 'PONT')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('Pacific/Ponape', @time_zone_id);
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
(@time_zone_id, 0, 39600, 0, 'PONT')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('Pacific/Port_Moresby', @time_zone_id);
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
(@time_zone_id, 0, 36000, 0, 'PGT')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('Pacific/Rarotonga', @time_zone_id);
INSERT INTO time_zone_transition (Time_zone_id, Transition_time, Transition_type_id) VALUES
(@time_zone_id, 279714600, 2)
,(@time_zone_id, 289387800, 1)
,(@time_zone_id, 309952800, 2)
,(@time_zone_id, 320837400, 1)
,(@time_zone_id, 341402400, 2)
,(@time_zone_id, 352287000, 1)
,(@time_zone_id, 372852000, 2)
,(@time_zone_id, 384341400, 1)
,(@time_zone_id, 404906400, 2)
,(@time_zone_id, 415791000, 1)
,(@time_zone_id, 436356000, 2)
,(@time_zone_id, 447240600, 1)
,(@time_zone_id, 467805600, 2)
,(@time_zone_id, 478690200, 1)
,(@time_zone_id, 499255200, 2)
,(@time_zone_id, 510139800, 1)
,(@time_zone_id, 530704800, 2)
,(@time_zone_id, 541589400, 1)
,(@time_zone_id, 562154400, 2)
,(@time_zone_id, 573643800, 1)
,(@time_zone_id, 594208800, 2)
,(@time_zone_id, 605093400, 1)
,(@time_zone_id, 625658400, 2)
,(@time_zone_id, 636543000, 1)
,(@time_zone_id, 657108000, 2)
,(@time_zone_id, 667992600, 1)
;
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
(@time_zone_id, 0, -37800, 0, 'CKT')
,(@time_zone_id, 1, -36000, 0, 'CKT')
,(@time_zone_id, 2, -34200, 1, 'CKHST')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('Pacific/Saipan', @time_zone_id);
INSERT INTO time_zone_transition (Time_zone_id, Transition_time, Transition_type_id) VALUES
(@time_zone_id, -7981200, 1)
,(@time_zone_id, 977493600, 2)
;
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
(@time_zone_id, 0, 32400, 0, 'MPT')
,(@time_zone_id, 1, 36000, 0, 'MPT')
,(@time_zone_id, 2, 36000, 0, 'ChST')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('Pacific/Samoa', @time_zone_id);
INSERT INTO time_zone_transition (Time_zone_id, Transition_time, Transition_type_id) VALUES
(@time_zone_id, -1861879032, 1)
,(@time_zone_id, -631110600, 2)
,(@time_zone_id, -86878800, 3)
,(@time_zone_id, 439038000, 4)
;
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
(@time_zone_id, 0, -40968, 0, 'LMT')
,(@time_zone_id, 1, -41400, 0, 'SAMT')
,(@time_zone_id, 2, -39600, 0, 'NST')
,(@time_zone_id, 3, -39600, 0, 'BST')
,(@time_zone_id, 4, -39600, 0, 'SST')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('Pacific/Tahiti', @time_zone_id);
INSERT INTO time_zone_transition (Time_zone_id, Transition_time, Transition_type_id) VALUES
(@time_zone_id, -1806674504, 1)
;
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
(@time_zone_id, 0, -35896, 0, 'LMT')
,(@time_zone_id, 1, -36000, 0, 'TAHT')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('Pacific/Tarawa', @time_zone_id);
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
(@time_zone_id, 0, 43200, 0, 'GILT')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('Pacific/Tongatapu', @time_zone_id);
INSERT INTO time_zone_transition (Time_zone_id, Transition_time, Transition_type_id) VALUES
(@time_zone_id, -915193200, 1)
,(@time_zone_id, 939214800, 2)
,(@time_zone_id, 953384400, 3)
,(@time_zone_id, 973342800, 4)
,(@time_zone_id, 980596800, 1)
,(@time_zone_id, 1004792400, 4)
,(@time_zone_id, 1012046400, 1)
;
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
(@time_zone_id, 0, 44400, 0, 'TOT')
,(@time_zone_id, 1, 46800, 0, 'TOT')
,(@time_zone_id, 2, 50400, 1, 'TOST')
,(@time_zone_id, 3, 46800, 0, 'TOT')
,(@time_zone_id, 4, 50400, 1, 'TOST')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('Pacific/Truk', @time_zone_id);
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
(@time_zone_id, 0, 36000, 0, 'CHUT')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('Pacific/Wake', @time_zone_id);
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
(@time_zone_id, 0, 43200, 0, 'WAKT')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('Pacific/Wallis', @time_zone_id);
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
(@time_zone_id, 0, 43200, 0, 'WFT')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('Pacific/Yap', @time_zone_id);
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
(@time_zone_id, 0, 36000, 0, 'CHUT')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('Poland', @time_zone_id);
INSERT INTO time_zone_transition (Time_zone_id, Transition_time, Transition_type_id) VALUES
(@time_zone_id, -1717032240, 2)
,(@time_zone_id, -1693706400, 1)
,(@time_zone_id, -1680483600, 2)
,(@time_zone_id, -1663455600, 3)
,(@time_zone_id, -1650150000, 4)
,(@time_zone_id, -1632006000, 3)
,(@time_zone_id, -1618700400, 7)
,(@time_zone_id, -1600473600, 5)
,(@time_zone_id, -1587168000, 6)
,(@time_zone_id, -1501725600, 2)
,(@time_zone_id, -931734000, 1)
,(@time_zone_id, -857257200, 4)
,(@time_zone_id, -844556400, 3)
,(@time_zone_id, -828226800, 4)
,(@time_zone_id, -812502000, 3)
,(@time_zone_id, -796874400, 1)
,(@time_zone_id, -796608000, 2)
,(@time_zone_id, -778726800, 1)
,(@time_zone_id, -762660000, 2)
,(@time_zone_id, -748486800, 3)
,(@time_zone_id, -733273200, 4)
,(@time_zone_id, -715215600, 3)
,(@time_zone_id, -701910000, 4)
,(@time_zone_id, -684975600, 3)
,(@time_zone_id, -670460400, 4)
,(@time_zone_id, -654130800, 3)
,(@time_zone_id, -639010800, 4)
,(@time_zone_id, -397094400, 3)
,(@time_zone_id, -386812800, 4)
,(@time_zone_id, -371088000, 3)
,(@time_zone_id, -355363200, 4)
,(@time_zone_id, -334195200, 3)
,(@time_zone_id, -323308800, 4)
,(@time_zone_id, -307584000, 3)
,(@time_zone_id, -291859200, 4)
,(@time_zone_id, -271296000, 3)
,(@time_zone_id, -260409600, 4)
,(@time_zone_id, -239846400, 3)
,(@time_zone_id, -228960000, 4)
,(@time_zone_id, -208396800, 3)
,(@time_zone_id, -197510400, 4)
,(@time_zone_id, -176342400, 3)
,(@time_zone_id, -166060800, 4)
,(@time_zone_id, 220921200, 2)
,(@time_zone_id, 228873600, 3)
,(@time_zone_id, 243993600, 4)
,(@time_zone_id, 260323200, 3)
,(@time_zone_id, 276048000, 4)
,(@time_zone_id, 291772800, 3)
,(@time_zone_id, 307497600, 4)
,(@time_zone_id, 323827200, 3)
,(@time_zone_id, 338947200, 4)
,(@time_zone_id, 354672000, 3)
,(@time_zone_id, 370396800, 4)
,(@time_zone_id, 386121600, 3)
,(@time_zone_id, 401846400, 4)
,(@time_zone_id, 417571200, 3)
,(@time_zone_id, 433296000, 4)/* consulta larga de SQL (5,4 KiB), fragmentada no caractere 2.000 */
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
 (@time_zone_id, 0, 5040, 0, 'WMT')
,(@time_zone_id, 1, 7200, 1, 'CEST')
,(@time_zone_id, 2, 3600, 0, 'CET')
,(@time_zone_id, 3, 7200, 1, 'CEST')
,(@time_zone_id, 4, 3600, 0, 'CET')
,(@time_zone_id, 5, 10800, 1, 'EEST')
,(@time_zone_id, 6, 7200, 0, 'EET')
,(@time_zone_id, 7, 7200, 0, 'EET')
,(@time_zone_id, 8, 7200, 1, 'CEST')
,(@time_zone_id, 9, 3600, 0, 'CET')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('Portugal', @time_zone_id);
INSERT INTO time_zone_transition (Time_zone_id, Transition_time, Transition_type_id) VALUES
 (@time_zone_id, -1830381808, 2)
,(@time_zone_id, -1689555600, 1)
,(@time_zone_id, -1677801600, 2)
,(@time_zone_id, -1667437200, 3)
,(@time_zone_id, -1647738000, 4)
,(@time_zone_id, -1635814800, 3)
,(@time_zone_id, -1616202000, 4)
,(@time_zone_id, -1604365200, 3)
,(@time_zone_id, -1584666000, 4)
,(@time_zone_id, -1572742800, 3)
,(@time_zone_id, -1553043600, 4)
,(@time_zone_id, -1541206800, 3)
,(@time_zone_id, -1521507600, 4)
,(@time_zone_id, -1442451600, 3)
,(@time_zone_id, -1426813200, 4)
,(@time_zone_id, -1379293200, 3)
,(@time_zone_id, -1364778000, 4)
,(@time_zone_id, -1348448400, 3)
,(@time_zone_id, -1333328400, 4)
,(@time_zone_id, -1316394000, 3)
,(@time_zone_id, -1301274000, 4)
,(@time_zone_id, -1284339600, 3)
,(@time_zone_id, -1269824400, 4)
,(@time_zone_id, -1221440400, 3)
,(@time_zone_id, -1206925200, 4)
,(@time_zone_id, -1191200400, 3)
,(@time_zone_id, -1175475600, 4)
,(@time_zone_id, -1127696400, 3)
,(@time_zone_id, -1111971600, 4)
,(@time_zone_id, -1096851600, 3)
,(@time_zone_id, -1080522000, 4)
,(@time_zone_id, -1063587600, 3)
,(@time_zone_id, -1049072400, 4)
,(@time_zone_id, -1033347600, 3)
,(@time_zone_id, -1017622800, 4)
,(@time_zone_id, -1002502800, 3)
,(@time_zone_id, -986173200, 4)
,(@time_zone_id, -969238800, 3)
,(@time_zone_id, -950490000, 4)
,(@time_zone_id, -942022800, 3)
,(@time_zone_id, -922669200, 4)
,(@time_zone_id, -906944400, 3)
,(@time_zone_id, -891133200, 4)
,(@time_zone_id, -877309200, 3)
,(@time_zone_id, -873684000, 5)
,(@time_zone_id, -864007200, 3)
,(@time_zone_id, -857955600, 4)
,(@time_zone_id, -845859600, 3)
,(@time_zone_id, -842839200, 5)
,(@time_zone_id, -831348000, 3)
,(@time_zone_id, -825901200, 4)
,(@time_zone_id, -814410000, 3)
,(@time_zone_id, -810784800, 5)
,(@time_zone_id, -799898400, 3)
,(@time_zone_id, -794451600, 4)
,(@time_zone_id, -782960400, 3)
,(@time_zone_id, -77933/* consulta larga de SQL (7,2 KiB), fragmentada no caractere 2.000 */
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
 (@time_zone_id, 0, -2192, 0, 'LMT')
,(@time_zone_id, 1, 3600, 1, 'WEST')
,(@time_zone_id, 2, 0, 0, 'WET')
,(@time_zone_id, 3, 3600, 1, 'WEST')
,(@time_zone_id, 4, 0, 0, 'WET')
,(@time_zone_id, 5, 7200, 1, 'WEMT')
,(@time_zone_id, 6, 3600, 0, 'CET')
,(@time_zone_id, 7, 3600, 0, 'CET')
,(@time_zone_id, 8, 7200, 1, 'CEST')
,(@time_zone_id, 9, 3600, 1, 'WEST')
,(@time_zone_id, 10, 0, 0, 'WET')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('ROC', @time_zone_id);
INSERT INTO time_zone_transition (Time_zone_id, Transition_time, Transition_type_id) VALUES
 (@time_zone_id, -778579200, 0)
,(@time_zone_id, -765363600, 1)
,(@time_zone_id, -747043200, 0)
,(@time_zone_id, -733827600, 1)
,(@time_zone_id, -715507200, 0)
,(@time_zone_id, -702291600, 1)
,(@time_zone_id, -683884800, 0)
,(@time_zone_id, -670669200, 1)
,(@time_zone_id, -652348800, 0)
,(@time_zone_id, -639133200, 1)
,(@time_zone_id, -620812800, 0)
,(@time_zone_id, -607597200, 1)
,(@time_zone_id, -589276800, 0)
,(@time_zone_id, -576061200, 1)
,(@time_zone_id, -562924800, 0)
,(@time_zone_id, -541760400, 1)
,(@time_zone_id, -528710400, 0)
,(@time_zone_id, -510224400, 1)
,(@time_zone_id, -497174400, 0)
,(@time_zone_id, -478688400, 1)
,(@time_zone_id, -465638400, 0)
,(@time_zone_id, -449830800, 1)
,(@time_zone_id, -434016000, 0)
,(@time_zone_id, -418208400, 1)
,(@time_zone_id, -402480000, 0)
,(@time_zone_id, -386672400, 1)
,(@time_zone_id, -370944000, 0)
,(@time_zone_id, -355136400, 1)
,(@time_zone_id, -339408000, 0)
,(@time_zone_id, -323600400, 1)
,(@time_zone_id, -302515200, 0)
,(@time_zone_id, -291978000, 1)
,(@time_zone_id, -270979200, 0)
,(@time_zone_id, -260442000, 1)
,(@time_zone_id, 133977600, 0)
,(@time_zone_id, 149785200, 1)
,(@time_zone_id, 165513600, 0)
,(@time_zone_id, 181321200, 1)
,(@time_zone_id, 299520000, 0)
,(@time_zone_id, 307465200, 1)
;
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
 (@time_zone_id, 0, 32400, 1, 'CDT')
,(@time_zone_id, 1, 28800, 0, 'CST')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('ROK', @time_zone_id);
INSERT INTO time_zone_transition (Time_zone_id, Transition_time, Transition_type_id) VALUES
 (@time_zone_id, -2053931400, 1)
,(@time_zone_id, -1325494800, 0)
,(@time_zone_id, -1199262600, 1)
,(@time_zone_id, -498128400, 3)
,(@time_zone_id, -303984000, 2)
,(@time_zone_id, -293533200, 3)
,(@time_zone_id, -264931200, 0)
,(@time_zone_id, -39515400, 1)
,(@time_zone_id, 547570800, 4)
,(@time_zone_id, 560872800, 1)
,(@time_zone_id, 579020400, 4)
,(@time_zone_id, 592322400, 1)
;
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
 (@time_zone_id, 0, 30600, 0, 'KST')
,(@time_zone_id, 1, 32400, 0, 'KST')
,(@time_zone_id, 2, 32400, 1, 'KDT')
,(@time_zone_id, 3, 28800, 0, 'KST')
,(@time_zone_id, 4, 36000, 1, 'KDT')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('Singapore', @time_zone_id);
INSERT INTO time_zone_transition (Time_zone_id, Transition_time, Transition_type_id) VALUES
 (@time_zone_id, -2038200925, 1)
,(@time_zone_id, -1167634800, 2)
,(@time_zone_id, -1073028000, 3)
,(@time_zone_id, -894180000, 4)
,(@time_zone_id, -879665400, 5)
,(@time_zone_id, -767005200, 4)
,(@time_zone_id, -138785400, 6)
,(@time_zone_id, 378664200, 7)
;
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
 (@time_zone_id, 0, 24925, 0, 'SMT')
,(@time_zone_id, 1, 25200, 0, 'MALT')
,(@time_zone_id, 2, 26400, 1, 'MALST')
,(@time_zone_id, 3, 26400, 0, 'MALT')
,(@time_zone_id, 4, 27000, 0, 'MALT')
,(@time_zone_id, 5, 32400, 0, 'JST')
,(@time_zone_id, 6, 27000, 0, 'SGT')
,(@time_zone_id, 7, 28800, 0, 'SGT')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('Turkey', @time_zone_id);
INSERT INTO time_zone_transition (Time_zone_id, Transition_time, Transition_type_id) VALUES
 (@time_zone_id, -1869875816, 2)
,(@time_zone_id, -1693706400, 1)
,(@time_zone_id, -1680490800, 2)
,(@time_zone_id, -1570413600, 1)
,(@time_zone_id, -1552186800, 2)
,(@time_zone_id, -1538359200, 1)
,(@time_zone_id, -1522551600, 2)
,(@time_zone_id, -1507514400, 1)
,(@time_zone_id, -1490583600, 2)
,(@time_zone_id, -1440208800, 1)
,(@time_zone_id, -1428030000, 2)
,(@time_zone_id, -1409709600, 1)
,(@time_zone_id, -1396494000, 2)
,(@time_zone_id, -931140000, 1)
,(@time_zone_id, -922762800, 2)
,(@time_zone_id, -917834400, 1)
,(@time_zone_id, -892436400, 2)
,(@time_zone_id, -875844000, 1)
,(@time_zone_id, -857358000, 2)
,(@time_zone_id, -781063200, 1)
,(@time_zone_id, -764737200, 2)
,(@time_zone_id, -744343200, 1)
,(@time_zone_id, -733806000, 2)
,(@time_zone_id, -716436000, 1)
,(@time_zone_id, -701924400, 2)
,(@time_zone_id, -684986400, 1)
,(@time_zone_id, -670474800, 2)
,(@time_zone_id, -654141600, 1)
,(@time_zone_id, -639025200, 2)
,(@time_zone_id, -621828000, 1)
,(@time_zone_id, -606970800, 2)
,(@time_zone_id, -590032800, 1)
,(@time_zone_id, -575434800, 2)
,(@time_zone_id, -235620000, 1)
,(@time_zone_id, -228279600, 2)
,(@time_zone_id, -177732000, 1)
,(@time_zone_id, -165726000, 2)
,(@time_zone_id, 10533600, 1)
,(@time_zone_id, 23835600, 2)
,(@time_zone_id, 41983200, 1)
,(@time_zone_id, 55285200, 2)
,(@time_zone_id, 74037600, 1)
,(@time_zone_id, 87339600, 2)
,(@time_zone_id, 107910000, 1)
,(@time_zone_id, 121219200, 2)
,(@time_zone_id, 133920000, 1)
,(@time_zone_id, 152676000, 2)
,(@time_zone_id, 165362400, 1)
,(@time_zone_id, 183502800, 2)
,(@time_zone_id, 202428000, 1)
,(@time_zone_id, 215557200, 2)
,(@time_zone_id, 228866400, 1)
,(@time_zone_id, 245797200, 2)
,(@time_zone_id, 260316000, 1)
,(@time_zone_id, 277246800, 3)
,(@time_zone_id, 308779200, 4)
,(@time_zone_id, 323827200, 3)
,(@time_zone_id, 340228800, 4)
,(@time/* consulta larga de SQL (5,5 KiB), fragmentada no caractere 2.000 */
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
 (@time_zone_id, 0, 7016, 0, 'IMT')
,(@time_zone_id, 1, 10800, 1, 'EEST')
,(@time_zone_id, 2, 7200, 0, 'EET')
,(@time_zone_id, 3, 14400, 1, 'TRST')
,(@time_zone_id, 4, 10800, 0, 'TRT')
,(@time_zone_id, 5, 10800, 1, 'EEST')
,(@time_zone_id, 6, 7200, 0, 'EET')
,(@time_zone_id, 7, 10800, 1, 'EEST')
,(@time_zone_id, 8, 7200, 0, 'EET')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('UCT', @time_zone_id);
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
 (@time_zone_id, 0, 0, 0, 'UCT')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('US/Alaska', @time_zone_id);
INSERT INTO time_zone_transition (Time_zone_id, Transition_time, Transition_type_id) VALUES
(@time_zone_id, -880200000, 1)
,(@time_zone_id, -769395600, 2)
,(@time_zone_id, -765378000, 0)
,(@time_zone_id, -86882400, 3)
,(@time_zone_id, -21470400, 4)
,(@time_zone_id, -5749200, 3)
,(@time_zone_id, 9979200, 4)
,(@time_zone_id, 25700400, 3)
,(@time_zone_id, 41428800, 4)
,(@time_zone_id, 57754800, 3)
,(@time_zone_id, 73483200, 4)
,(@time_zone_id, 89204400, 3)
,(@time_zone_id, 104932800, 4)
,(@time_zone_id, 120654000, 3)
,(@time_zone_id, 126705600, 4)
,(@time_zone_id, 152103600, 3)
,(@time_zone_id, 162388800, 4)
,(@time_zone_id, 183553200, 3)
,(@time_zone_id, 199281600, 4)
,(@time_zone_id, 215607600, 3)
,(@time_zone_id, 230731200, 4)
,(@time_zone_id, 247057200, 3)
,(@time_zone_id, 262785600, 4)
,(@time_zone_id, 278506800, 3)
,(@time_zone_id, 294235200, 4)
,(@time_zone_id, 309956400, 3)
,(@time_zone_id, 325684800, 4)
,(@time_zone_id, 341406000, 3)
,(@time_zone_id, 357134400, 4)
,(@time_zone_id, 372855600, 3)
,(@time_zone_id, 388584000, 4)
,(@time_zone_id, 404910000, 3)
,(@time_zone_id, 420033600, 4)
,(@time_zone_id, 436359600, 5)
,(@time_zone_id, 439030800, 7)
,(@time_zone_id, 452084400, 6)
,(@time_zone_id, 467805600, 7)
,(@time_zone_id, 483534000, 6)
,(@time_zone_id, 499255200, 7)
,(@time_zone_id, 514983600, 6)
,(@time_zone_id, 530704800, 7)
,(@time_zone_id, 544618800, 6)
,(@time_zone_id, 562154400, 7)
,(@time_zone_id, 576068400, 6)
,(@time_zone_id, 594208800, 7)
,(@time_zone_id, 607518000, 6)
,(@time_zone_id, 625658400, 7)
,(@time_zone_id, 638967600, 6)
,(@time_zone_id, 657108000, 7)
,(@time_zone_id, 671022000, 6)
,(@time_zone_id, 688557600, 7)
,(@time_zone_id, 702471600, 6)
,(@time_zone_id, 720007200, 7)
,(@time_zone_id, 733921200, 6)
,(@time_zone_id, 752061600, 7)
,(@time_zone_id, 765370800, 6)
,(@time_zone_id, 783511200, 7)
,(@time_zone_id, 796820400, 6)
,(@time_zone_id, 814960800, 7)
,(@time_zone_id, 8288748/* consulta larga de SQL (4,6 KiB), fragmentada no caractere 2.000 */
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
 (@time_zone_id, 0, -36000, 0, 'CAT')
,(@time_zone_id, 1, -32400, 1, 'CAWT')
,(@time_zone_id, 2, -32400, 1, 'CAPT')
,(@time_zone_id, 3, -36000, 0, 'AHST')
,(@time_zone_id, 4, -32400, 1, 'AHDT')
,(@time_zone_id, 5, -32400, 0, 'YST')
,(@time_zone_id, 6, -28800, 1, 'AKDT')
,(@time_zone_id, 7, -32400, 0, 'AKST')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('US/Aleutian', @time_zone_id);
INSERT INTO time_zone_transition (Time_zone_id, Transition_time, Transition_type_id) VALUES
(@time_zone_id, -880196400, 1)
,(@time_zone_id, -769395600, 2)
,(@time_zone_id, -765374400, 0)
,(@time_zone_id, -86878800, 3)
,(@time_zone_id, -21466800, 4)
,(@time_zone_id, -5745600, 3)
,(@time_zone_id, 9982800, 4)
,(@time_zone_id, 25704000, 3)
,(@time_zone_id, 41432400, 4)
,(@time_zone_id, 57758400, 3)
,(@time_zone_id, 73486800, 4)
,(@time_zone_id, 89208000, 3)
,(@time_zone_id, 104936400, 4)
,(@time_zone_id, 120657600, 3)
,(@time_zone_id, 126709200, 4)
,(@time_zone_id, 152107200, 3)
,(@time_zone_id, 162392400, 4)
,(@time_zone_id, 183556800, 3)
,(@time_zone_id, 199285200, 4)
,(@time_zone_id, 215611200, 3)
,(@time_zone_id, 230734800, 4)
,(@time_zone_id, 247060800, 3)
,(@time_zone_id, 262789200, 4)
,(@time_zone_id, 278510400, 3)
,(@time_zone_id, 294238800, 4)
,(@time_zone_id, 309960000, 3)
,(@time_zone_id, 325688400, 4)
,(@time_zone_id, 341409600, 3)
,(@time_zone_id, 357138000, 4)
,(@time_zone_id, 372859200, 3)
,(@time_zone_id, 388587600, 4)
,(@time_zone_id, 404913600, 3)
,(@time_zone_id, 420037200, 4)
,(@time_zone_id, 436363200, 5)
,(@time_zone_id, 439034400, 7)
,(@time_zone_id, 452088000, 6)
,(@time_zone_id, 467809200, 7)
,(@time_zone_id, 483537600, 6)
,(@time_zone_id, 499258800, 7)
,(@time_zone_id, 514987200, 6)
,(@time_zone_id, 530708400, 7)
,(@time_zone_id, 544622400, 6)
,(@time_zone_id, 562158000, 7)
,(@time_zone_id, 576072000, 6)
,(@time_zone_id, 594212400, 7)
,(@time_zone_id, 607521600, 6)
,(@time_zone_id, 625662000, 7)
,(@time_zone_id, 638971200, 6)
,(@time_zone_id, 657111600, 7)
,(@time_zone_id, 671025600, 6)
,(@time_zone_id, 688561200, 7)
,(@time_zone_id, 702475200, 6)
,(@time_zone_id, 720010800, 7)
,(@time_zone_id, 733924800, 6)
,(@time_zone_id, 752065200, 7)
,(@time_zone_id, 765374400, 6)
,(@time_zone_id, 783514800, 7)
,(@time_zone_id, 796824000, 6)
,(@time_zone_id, 814964400, 7)
,(@time_zone_id, 8288784/* consulta larga de SQL (4,6 KiB), fragmentada no caractere 2.000 */
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
 (@time_zone_id, 0, -39600, 0, 'NST')
,(@time_zone_id, 1, -36000, 1, 'NWT')
,(@time_zone_id, 2, -36000, 1, 'NPT')
,(@time_zone_id, 3, -39600, 0, 'BST')
,(@time_zone_id, 4, -36000, 1, 'BDT')
,(@time_zone_id, 5, -36000, 0, 'AHST')
,(@time_zone_id, 6, -32400, 1, 'HADT')
,(@time_zone_id, 7, -36000, 0, 'HAST')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('US/Arizona', @time_zone_id);
INSERT INTO time_zone_transition (Time_zone_id, Transition_time, Transition_type_id) VALUES
(@time_zone_id, -1633273200, 0)
,(@time_zone_id, -1615132800, 1)
,(@time_zone_id, -1601823600, 0)
,(@time_zone_id, -1583683200, 1)
,(@time_zone_id, -880210800, 2)
,(@time_zone_id, -820519140, 1)
,(@time_zone_id, -812653140, 2)
,(@time_zone_id, -796845540, 1)
,(@time_zone_id, -84380400, 0)
,(@time_zone_id, -68659200, 1)
;
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
(@time_zone_id, 0, -21600, 1, 'MDT')
,(@time_zone_id, 1, -25200, 0, 'MST')
,(@time_zone_id, 2, -21600, 1, 'MWT')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('US/Central', @time_zone_id);
INSERT INTO time_zone_transition (Time_zone_id, Transition_time, Transition_type_id) VALUES
(@time_zone_id, -1633276800, 0)
,(@time_zone_id, -1615136400, 1)
,(@time_zone_id, -1601827200, 0)
,(@time_zone_id, -1583686800, 1)
,(@time_zone_id, -1563724800, 0)
,(@time_zone_id, -1551632400, 1)
,(@time_zone_id, -1538928000, 0)
,(@time_zone_id, -1520182800, 1)
,(@time_zone_id, -1504454400, 0)
,(@time_zone_id, -1491757200, 1)
,(@time_zone_id, -1473004800, 0)
,(@time_zone_id, -1459702800, 1)
,(@time_zone_id, -1441555200, 0)
,(@time_zone_id, -1428253200, 1)
,(@time_zone_id, -1410105600, 0)
,(@time_zone_id, -1396803600, 1)
,(@time_zone_id, -1378656000, 0)
,(@time_zone_id, -1365354000, 1)
,(@time_zone_id, -1347206400, 0)
,(@time_zone_id, -1333904400, 1)
,(@time_zone_id, -1315152000, 0)
,(@time_zone_id, -1301850000, 1)
,(@time_zone_id, -1283702400, 0)
,(@time_zone_id, -1270400400, 1)
,(@time_zone_id, -1252252800, 0)
,(@time_zone_id, -1238950800, 1)
,(@time_zone_id, -1220803200, 0)
,(@time_zone_id, -1207501200, 1)
,(@time_zone_id, -1189353600, 0)
,(@time_zone_id, -1176051600, 1)
,(@time_zone_id, -1157299200, 0)
,(@time_zone_id, -1144602000, 1)
,(@time_zone_id, -1125849600, 0)
,(@time_zone_id, -1112547600, 1)
,(@time_zone_id, -1094400000, 0)
,(@time_zone_id, -1081098000, 1)
,(@time_zone_id, -1067788800, 2)
,(@time_zone_id, -1045414800, 1)
,(@time_zone_id, -1031500800, 0)
,(@time_zone_id, -1018198800, 1)
,(@time_zone_id, -1000051200, 0)
,(@time_zone_id, -986749200, 1)
,(@time_zone_id, -967996800, 0)
,(@time_zone_id, -955299600, 1)
,(@time_zone_id, -936547200, 0)
,(@time_zone_id, -923245200, 1)
,(@time_zone_id, -905097600, 0)
,(@time_zone_id, -891795600, 1)
,(@time_zone_id, -880214400, 3)
,(@time_zone_id, -769395600, 4)
,(@time_zone_id, -765392400, 1)
,(@time_zone_id, -747244800, 0)
,(@time_zone_id, -733942800, 1)
,(@time_zone_id, -715795200, 0)
,(@time_zone_id, -702493200, 1)
,(@time_zone_id, -684345600, 0)
,(@time_zone_id, -/* consulta larga de SQL (7,6 KiB), fragmentada no caractere 2.000 */
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
(@time_zone_id, 0, -18000, 1, 'CDT')
,(@time_zone_id, 1, -21600, 0, 'CST')
,(@time_zone_id, 2, -18000, 0, 'EST')
,(@time_zone_id, 3, -18000, 1, 'CWT')
,(@time_zone_id, 4, -18000, 1, 'CPT')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('US/East-Indiana', @time_zone_id);
INSERT INTO time_zone_transition (Time_zone_id, Transition_time, Transition_type_id) VALUES
(@time_zone_id, -1633276800, 0)
,(@time_zone_id, -1615136400, 1)
,(@time_zone_id, -1601827200, 0)
,(@time_zone_id, -1583686800, 1)
,(@time_zone_id, -900259200, 0)
,(@time_zone_id, -891795600, 1)
,(@time_zone_id, -880214400, 2)
,(@time_zone_id, -769395600, 3)
,(@time_zone_id, -765392400, 1)
,(@time_zone_id, -747244800, 0)
,(@time_zone_id, -733942800, 1)
,(@time_zone_id, -715795200, 0)
,(@time_zone_id, -702493200, 1)
,(@time_zone_id, -684345600, 0)
,(@time_zone_id, -671043600, 1)
,(@time_zone_id, -652896000, 0)
,(@time_zone_id, -639594000, 1)
,(@time_zone_id, -620841600, 0)
,(@time_zone_id, -608144400, 1)
,(@time_zone_id, -589392000, 0)
,(@time_zone_id, -576090000, 1)
,(@time_zone_id, -557942400, 0)
,(@time_zone_id, -544640400, 1)
,(@time_zone_id, -526492800, 0)
,(@time_zone_id, -513190800, 1)
,(@time_zone_id, -495043200, 0)
,(@time_zone_id, -481741200, 1)
,(@time_zone_id, -463593600, 4)
,(@time_zone_id, -386787600, 1)
,(@time_zone_id, -368640000, 4)
,(@time_zone_id, -21488400, 5)
,(@time_zone_id, -5767200, 4)
,(@time_zone_id, 9961200, 5)
,(@time_zone_id, 25682400, 4)
,(@time_zone_id, 1143961200, 5)
,(@time_zone_id, 1162101600, 4)
,(@time_zone_id, 1173596400, 5)
,(@time_zone_id, 1194156000, 4)
,(@time_zone_id, 1205046000, 5)
,(@time_zone_id, 1225605600, 4)
,(@time_zone_id, 1236495600, 5)
,(@time_zone_id, 1257055200, 4)
,(@time_zone_id, 1268550000, 5)
,(@time_zone_id, 1289109600, 4)
,(@time_zone_id, 1299999600, 5)
,(@time_zone_id, 1320559200, 4)
,(@time_zone_id, 1331449200, 5)
,(@time_zone_id, 1352008800, 4)
,(@time_zone_id, 1362898800, 5)
,(@time_zone_id, 1383458400, 4)
,(@time_zone_id, 1394348400, 5)
,(@time_zone_id, 1414908000, 4)
,(@time_zone_id, 1425798000, 5)
,(@time_zone_id, 1446357600, 4)
,(@time_zone_id, 1457852400, 5)
,(@time_zone_id, 1478412000, 4)
,(@time_zone_id, 1489302000, 5)
,(@time_zone_id, 1509861600, 4/* consulta larga de SQL (3,2 KiB), fragmentada no caractere 2.000 */
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
 (@time_zone_id, 0, -18000, 1, 'CDT')
,(@time_zone_id, 1, -21600, 0, 'CST')
,(@time_zone_id, 2, -18000, 1, 'CWT')
,(@time_zone_id, 3, -18000, 1, 'CPT')
,(@time_zone_id, 4, -18000, 0, 'EST')
,(@time_zone_id, 5, -14400, 1, 'EDT')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('US/Eastern', @time_zone_id);
INSERT INTO time_zone_transition (Time_zone_id, Transition_time, Transition_type_id) VALUES
(@time_zone_id, -1633280400, 0)
,(@time_zone_id, -1615140000, 1)
,(@time_zone_id, -1601830800, 0)
,(@time_zone_id, -1583690400, 1)
,(@time_zone_id, -1570381200, 0)
,(@time_zone_id, -1551636000, 1)
,(@time_zone_id, -1536512400, 0)
,(@time_zone_id, -1523210400, 1)
,(@time_zone_id, -1504458000, 0)
,(@time_zone_id, -1491760800, 1)
,(@time_zone_id, -1473008400, 0)
,(@time_zone_id, -1459706400, 1)
,(@time_zone_id, -1441558800, 0)
,(@time_zone_id, -1428256800, 1)
,(@time_zone_id, -1410109200, 0)
,(@time_zone_id, -1396807200, 1)
,(@time_zone_id, -1378659600, 0)
,(@time_zone_id, -1365357600, 1)
,(@time_zone_id, -1347210000, 0)
,(@time_zone_id, -1333908000, 1)
,(@time_zone_id, -1315155600, 0)
,(@time_zone_id, -1301853600, 1)
,(@time_zone_id, -1283706000, 0)
,(@time_zone_id, -1270404000, 1)
,(@time_zone_id, -1252256400, 0)
,(@time_zone_id, -1238954400, 1)
,(@time_zone_id, -1220806800, 0)
,(@time_zone_id, -1207504800, 1)
,(@time_zone_id, -1189357200, 0)
,(@time_zone_id, -1176055200, 1)
,(@time_zone_id, -1157302800, 0)
,(@time_zone_id, -1144605600, 1)
,(@time_zone_id, -1125853200, 0)
,(@time_zone_id, -1112551200, 1)
,(@time_zone_id, -1094403600, 0)
,(@time_zone_id, -1081101600, 1)
,(@time_zone_id, -1062954000, 0)
,(@time_zone_id, -1049652000, 1)
,(@time_zone_id, -1031504400, 0)
,(@time_zone_id, -1018202400, 1)
,(@time_zone_id, -1000054800, 0)
,(@time_zone_id, -986752800, 1)
,(@time_zone_id, -968000400, 0)
,(@time_zone_id, -955303200, 1)
,(@time_zone_id, -936550800, 0)
,(@time_zone_id, -923248800, 1)
,(@time_zone_id, -905101200, 0)
,(@time_zone_id, -891799200, 1)
,(@time_zone_id, -880218000, 2)
,(@time_zone_id, -769395600, 3)
,(@time_zone_id, -765396000, 1)
,(@time_zone_id, -747248400, 0)
,(@time_zone_id, -733946400, 1)
,(@time_zone_id, -715798800, 0)
,(@time_zone_id, -702496800, 1)
,(@time_zone_id, -684349200, 0)
,(@time_zone_id, -/* consulta larga de SQL (7,6 KiB), fragmentada no caractere 2.000 */
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
(@time_zone_id, 0, -14400, 1, 'EDT')
,(@time_zone_id, 1, -18000, 0, 'EST')
,(@time_zone_id, 2, -14400, 1, 'EWT')
,(@time_zone_id, 3, -14400, 1, 'EPT')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('US/Hawaii', @time_zone_id);
INSERT INTO time_zone_transition (Time_zone_id, Transition_time, Transition_type_id) VALUES
(@time_zone_id, -1157283000, 1)
,(@time_zone_id, -1155436200, 0)
,(@time_zone_id, -880198200, 1)
,(@time_zone_id, -765376200, 0)
,(@time_zone_id, -712150200, 2)
;
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
(@time_zone_id, 0, -37800, 0, 'HST')
,(@time_zone_id, 1, -34200, 1, 'HDT')
,(@time_zone_id, 2, -36000, 0, 'HST')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('US/Indiana-Starke', @time_zone_id);
INSERT INTO time_zone_transition (Time_zone_id, Transition_time, Transition_type_id) VALUES
(@time_zone_id, -1633276800, 0)
,(@time_zone_id, -1615136400, 1)
,(@time_zone_id, -1601827200, 0)
,(@time_zone_id, -1583686800, 1)
,(@time_zone_id, -880214400, 2)
,(@time_zone_id, -769395600, 3)
,(@time_zone_id, -765392400, 1)
,(@time_zone_id, -715795200, 0)
,(@time_zone_id, -702493200, 1)
,(@time_zone_id, -684345600, 0)
,(@time_zone_id, -671043600, 1)
,(@time_zone_id, -652896000, 0)
,(@time_zone_id, -639594000, 1)
,(@time_zone_id, -620841600, 0)
,(@time_zone_id, -608144400, 1)
,(@time_zone_id, -589392000, 0)
,(@time_zone_id, -576090000, 1)
,(@time_zone_id, -557942400, 0)
,(@time_zone_id, -544640400, 1)
,(@time_zone_id, -526492800, 0)
,(@time_zone_id, -513190800, 1)
,(@time_zone_id, -495043200, 0)
,(@time_zone_id, -481741200, 1)
,(@time_zone_id, -463593600, 0)
,(@time_zone_id, -447267600, 1)
,(@time_zone_id, -431539200, 0)
,(@time_zone_id, -415818000, 1)
,(@time_zone_id, -400089600, 0)
,(@time_zone_id, -386787600, 1)
,(@time_zone_id, -368640000, 0)
,(@time_zone_id, -355338000, 1)
,(@time_zone_id, -337190400, 0)
,(@time_zone_id, -321469200, 1)
,(@time_zone_id, -305740800, 0)
,(@time_zone_id, -289414800, 1)
,(@time_zone_id, -273686400, 0)
,(@time_zone_id, -257965200, 1)
,(@time_zone_id, -242236800, 4)
,(@time_zone_id, -195066000, 1)
,(@time_zone_id, -84384000, 0)
,(@time_zone_id, -68662800, 1)
,(@time_zone_id, -52934400, 0)
,(@time_zone_id, -37213200, 1)
,(@time_zone_id, -21484800, 0)
,(@time_zone_id, -5763600, 1)
,(@time_zone_id, 9964800, 0)
,(@time_zone_id, 25686000, 1)
,(@time_zone_id, 41414400, 0)
,(@time_zone_id, 57740400, 1)
,(@time_zone_id, 73468800, 0)
,(@time_zone_id, 89190000, 1)
,(@time_zone_id, 104918400, 0)
,(@time_zone_id, 120639600, 1)
,(@time_zone_id, 126691200, 0)
,(@time_zone_id, 152089200, 1)
,(@time_zone_id, 162374400, 0)
,(@time_zone_id, 183538800, 1)
,(@time_zone_id, 199267200, 0)
,(@time_zone_id,/* consulta larga de SQL (5,0 KiB), fragmentada no caractere 2.000 */
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
(@time_zone_id, 0, -18000, 1, 'CDT')
,(@time_zone_id, 1, -21600, 0, 'CST')
,(@time_zone_id, 2, -18000, 1, 'CWT')
,(@time_zone_id, 3, -18000, 1, 'CPT')
,(@time_zone_id, 4, -18000, 0, 'EST')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('US/Michigan', @time_zone_id);
INSERT INTO time_zone_transition (Time_zone_id, Transition_time, Transition_type_id) VALUES
(@time_zone_id, -2051202469, 1)
,(@time_zone_id, -1724083200, 2)
,(@time_zone_id, -880218000, 3)
,(@time_zone_id, -769395600, 4)
,(@time_zone_id, -765396000, 2)
,(@time_zone_id, -684349200, 5)
,(@time_zone_id, -671047200, 2)
,(@time_zone_id, -80499600, 5)
,(@time_zone_id, -68666400, 2)
,(@time_zone_id, 104914800, 5)
,(@time_zone_id, 120636000, 2)
,(@time_zone_id, 126687600, 5)
,(@time_zone_id, 152085600, 2)
,(@time_zone_id, 167814000, 5)
,(@time_zone_id, 183535200, 2)
,(@time_zone_id, 199263600, 5)
,(@time_zone_id, 215589600, 2)
,(@time_zone_id, 230713200, 5)
,(@time_zone_id, 247039200, 2)
,(@time_zone_id, 262767600, 5)
,(@time_zone_id, 278488800, 2)
,(@time_zone_id, 294217200, 5)
,(@time_zone_id, 309938400, 2)
,(@time_zone_id, 325666800, 5)
,(@time_zone_id, 341388000, 2)
,(@time_zone_id, 357116400, 5)
,(@time_zone_id, 372837600, 2)
,(@time_zone_id, 388566000, 5)
,(@time_zone_id, 404892000, 2)
,(@time_zone_id, 420015600, 5)
,(@time_zone_id, 436341600, 2)
,(@time_zone_id, 452070000, 5)
,(@time_zone_id, 467791200, 2)
,(@time_zone_id, 483519600, 5)
,(@time_zone_id, 499240800, 2)
,(@time_zone_id, 514969200, 5)
,(@time_zone_id, 530690400, 2)
,(@time_zone_id, 544604400, 5)
,(@time_zone_id, 562140000, 2)
,(@time_zone_id, 576054000, 5)
,(@time_zone_id, 594194400, 2)
,(@time_zone_id, 607503600, 5)
,(@time_zone_id, 625644000, 2)
,(@time_zone_id, 638953200, 5)
,(@time_zone_id, 657093600, 2)
,(@time_zone_id, 671007600, 5)
,(@time_zone_id, 688543200, 2)
,(@time_zone_id, 702457200, 5)
,(@time_zone_id, 719992800, 2)
,(@time_zone_id, 733906800, 5)
,(@time_zone_id, 752047200, 2)
,(@time_zone_id, 765356400, 5)
,(@time_zone_id, 783496800, 2)
,(@time_zone_id, 796806000, 5)
,(@time_zone_id, 814946400, 2)
,(@time_zone_id, 828860400, 5)
,(@time_zone_id, 846396000, 2)
,(@time_zone_id, 860310000, 5)
,(@time_zone_id, 877845600, 2)
,(@time_zo/* consulta larga de SQL (4,5 KiB), fragmentada no caractere 2.000 */
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
 (@time_zone_id, 0, -19931, 0, 'LMT')
,(@time_zone_id, 1, -21600, 0, 'CST')
,(@time_zone_id, 2, -18000, 0, 'EST')
,(@time_zone_id, 3, -14400, 1, 'EWT')
,(@time_zone_id, 4, -14400, 1, 'EPT')
,(@time_zone_id, 5, -14400, 1, 'EDT')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('US/Mountain', @time_zone_id);
INSERT INTO time_zone_transition (Time_zone_id, Transition_time, Transition_type_id) VALUES
(@time_zone_id, -1633273200, 0)
,(@time_zone_id, -1615132800, 1)
,(@time_zone_id, -1601823600, 0)
,(@time_zone_id, -1583683200, 1)
,(@time_zone_id, -1570374000, 0)
,(@time_zone_id, -1551628800, 1)
,(@time_zone_id, -1538924400, 0)
,(@time_zone_id, -1534089600, 1)
,(@time_zone_id, -880210800, 2)
,(@time_zone_id, -769395600, 3)
,(@time_zone_id, -765388800, 1)
,(@time_zone_id, -147884400, 0)
,(@time_zone_id, -131558400, 1)
,(@time_zone_id, -116434800, 0)
,(@time_zone_id, -100108800, 1)
,(@time_zone_id, -84380400, 0)
,(@time_zone_id, -68659200, 1)
,(@time_zone_id, -52930800, 0)
,(@time_zone_id, -37209600, 1)
,(@time_zone_id, -21481200, 0)
,(@time_zone_id, -5760000, 1)
,(@time_zone_id, 9968400, 0)
,(@time_zone_id, 25689600, 1)
,(@time_zone_id, 41418000, 0)
,(@time_zone_id, 57744000, 1)
,(@time_zone_id, 73472400, 0)
,(@time_zone_id, 89193600, 1)
,(@time_zone_id, 104922000, 0)
,(@time_zone_id, 120643200, 1)
,(@time_zone_id, 126694800, 0)
,(@time_zone_id, 152092800, 1)
,(@time_zone_id, 162378000, 0)
,(@time_zone_id, 183542400, 1)
,(@time_zone_id, 199270800, 0)
,(@time_zone_id, 215596800, 1)
,(@time_zone_id, 230720400, 0)
,(@time_zone_id, 247046400, 1)
,(@time_zone_id, 262774800, 0)
,(@time_zone_id, 278496000, 1)
,(@time_zone_id, 294224400, 0)
,(@time_zone_id, 309945600, 1)
,(@time_zone_id, 325674000, 0)
,(@time_zone_id, 341395200, 1)
,(@time_zone_id, 357123600, 0)
,(@time_zone_id, 372844800, 1)
,(@time_zone_id, 388573200, 0)
,(@time_zone_id, 404899200, 1)
,(@time_zone_id, 420022800, 0)
,(@time_zone_id, 436348800, 1)
,(@time_zone_id, 452077200, 0)
,(@time_zone_id, 467798400, 1)
,(@time_zone_id, 483526800, 0)
,(@time_zone_id, 499248000, 1)
,(@time_zone_id, 514976400, 0)
,(@time_zone_id, 530697600, 1)
,(@time_zone_id, 544611600, 0)
,(@time_zone_id, 562147200, 1)
,(@time_zone_id, 576061200, 0)
,(@time_zone_id, 594201600, 1)
,(@t/* consulta larga de SQL (5,1 KiB), fragmentada no caractere 2.000 */
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
 (@time_zone_id, 0, -21600, 1, 'MDT')
,(@time_zone_id, 1, -25200, 0, 'MST')
,(@time_zone_id, 2, -21600, 1, 'MWT')
,(@time_zone_id, 3, -21600, 1, 'MPT')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('US/Pacific', @time_zone_id);
INSERT INTO time_zone_transition (Time_zone_id, Transition_time, Transition_type_id) VALUES
(@time_zone_id, -1633269600, 0)
,(@time_zone_id, -1615129200, 1)
,(@time_zone_id, -1601820000, 0)
,(@time_zone_id, -1583679600, 1)
,(@time_zone_id, -880207200, 2)
,(@time_zone_id, -769395600, 3)
,(@time_zone_id, -765385200, 1)
,(@time_zone_id, -687967200, 0)
,(@time_zone_id, -662655600, 1)
,(@time_zone_id, -620834400, 0)
,(@time_zone_id, -608137200, 1)
,(@time_zone_id, -589384800, 0)
,(@time_zone_id, -576082800, 1)
,(@time_zone_id, -557935200, 0)
,(@time_zone_id, -544633200, 1)
,(@time_zone_id, -526485600, 0)
,(@time_zone_id, -513183600, 1)
,(@time_zone_id, -495036000, 0)
,(@time_zone_id, -481734000, 1)
,(@time_zone_id, -463586400, 0)
,(@time_zone_id, -450284400, 1)
,(@time_zone_id, -431532000, 0)
,(@time_zone_id, -418230000, 1)
,(@time_zone_id, -400082400, 0)
,(@time_zone_id, -386780400, 1)
,(@time_zone_id, -368632800, 0)
,(@time_zone_id, -355330800, 1)
,(@time_zone_id, -337183200, 0)
,(@time_zone_id, -323881200, 1)
,(@time_zone_id, -305733600, 0)
,(@time_zone_id, -292431600, 1)
,(@time_zone_id, -273679200, 0)
,(@time_zone_id, -260982000, 1)
,(@time_zone_id, -242229600, 0)
,(@time_zone_id, -226508400, 1)
,(@time_zone_id, -210780000, 0)
,(@time_zone_id, -195058800, 1)
,(@time_zone_id, -179330400, 0)
,(@time_zone_id, -163609200, 1)
,(@time_zone_id, -147880800, 0)
,(@time_zone_id, -131554800, 1)
,(@time_zone_id, -116431200, 0)
,(@time_zone_id, -100105200, 1)
,(@time_zone_id, -84376800, 0)
,(@time_zone_id, -68655600, 1)
,(@time_zone_id, -52927200, 0)
,(@time_zone_id, -37206000, 1)
,(@time_zone_id, -21477600, 0)
,(@time_zone_id, -5756400, 1)
,(@time_zone_id, 9972000, 0)
,(@time_zone_id, 25693200, 1)
,(@time_zone_id, 41421600, 0)
,(@time_zone_id, 57747600, 1)
,(@time_zone_id, 73476000, 0)
,(@time_zone_id, 89197200, 1)
,(@time_zone_id, 104925600, 0)
,(@time_zone_id, 120646800, 1)
,(@time_zone_id, 126698400, 0)
,(@time_zone/* consulta larga de SQL (6,0 KiB), fragmentada no caractere 2.000 */
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
 (@time_zone_id, 0, -25200, 1, 'PDT')
,(@time_zone_id, 1, -28800, 0, 'PST')
,(@time_zone_id, 2, -25200, 1, 'PWT')
,(@time_zone_id, 3, -25200, 1, 'PPT')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('US/Samoa', @time_zone_id);
INSERT INTO time_zone_transition (Time_zone_id, Transition_time, Transition_type_id) VALUES
(@time_zone_id, -1861879032, 1)
,(@time_zone_id, -631110600, 2)
,(@time_zone_id, -86878800, 3)
,(@time_zone_id, 439038000, 4)
;
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
(@time_zone_id, 0, -40968, 0, 'LMT')
,(@time_zone_id, 1, -41400, 0, 'SAMT')
,(@time_zone_id, 2, -39600, 0, 'NST')
,(@time_zone_id, 3, -39600, 0, 'BST')
,(@time_zone_id, 4, -39600, 0, 'SST')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('UTC', @time_zone_id);
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
(@time_zone_id, 0, 0, 0, 'UTC')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('Universal', @time_zone_id);
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
(@time_zone_id, 0, 0, 0, 'UTC')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('W-SU', @time_zone_id);
INSERT INTO time_zone_transition (Time_zone_id, Transition_time, Transition_type_id) VALUES
(@time_zone_id, -1688265000, 2)
,(@time_zone_id, -1656819048, 1)
,(@time_zone_id, -1641353448, 2)
,(@time_zone_id, -1627965048, 3)
,(@time_zone_id, -1618716648, 1)
,(@time_zone_id, -1596429048, 3)
,(@time_zone_id, -1593829848, 5)
,(@time_zone_id, -1589860800, 4)
,(@time_zone_id, -1542427200, 5)
,(@time_zone_id, -1539493200, 6)
,(@time_zone_id, -1525323600, 5)
,(@time_zone_id, -1522728000, 4)
,(@time_zone_id, -1491188400, 7)
,(@time_zone_id, -1247536800, 4)
,(@time_zone_id, 354920400, 5)
,(@time_zone_id, 370728000, 4)
,(@time_zone_id, 386456400, 5)
,(@time_zone_id, 402264000, 4)
,(@time_zone_id, 417992400, 5)
,(@time_zone_id, 433800000, 4)
,(@time_zone_id, 449614800, 5)
,(@time_zone_id, 465346800, 8)
,(@time_zone_id, 481071600, 9)
,(@time_zone_id, 496796400, 8)
,(@time_zone_id, 512521200, 9)
,(@time_zone_id, 528246000, 8)
,(@time_zone_id, 543970800, 9)
,(@time_zone_id, 559695600, 8)
,(@time_zone_id, 575420400, 9)
,(@time_zone_id, 591145200, 8)
,(@time_zone_id, 606870000, 9)
,(@time_zone_id, 622594800, 8)
,(@time_zone_id, 638319600, 9)
,(@time_zone_id, 654649200, 8)
,(@time_zone_id, 670374000, 10)
,(@time_zone_id, 686102400, 11)
,(@time_zone_id, 695779200, 8)
,(@time_zone_id, 701812800, 5)
,(@time_zone_id, 717534000, 4)
,(@time_zone_id, 733273200, 9)
,(@time_zone_id, 748998000, 8)
,(@time_zone_id, 764722800, 9)
,(@time_zone_id, 780447600, 8)
,(@time_zone_id, 796172400, 9)
,(@time_zone_id, 811897200, 8)
,(@time_zone_id, 828226800, 9)
,(@time_zone_id, 846370800, 8)
,(@time_zone_id, 859676400, 9)
,(@time_zone_id, 877820400, 8)
,(@time_zone_id, 891126000, 9)
,(@time_zone_id, 909270000, 8)
,(@time_zone_id, 922575600, 9)
,(@time_zone_id, 941324400, 8)
,(@time_zone_id, 954025200, 9)
,(@time_zone_id, 972774000, 8)
,(@time_zone_id, 985474800, 9)
,(@time_zone_id, 1004223600, 8)
,(@time_zone_id, 1017529200, 9)
,(@time_zone_id, 10/* consulta larga de SQL (2,5 KiB), fragmentada no caractere 2.000 */
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
 (@time_zone_id, 0, 9000, 0, 'MMT')
,(@time_zone_id, 1, 12648, 1, 'MST')
,(@time_zone_id, 2, 9048, 0, 'MMT')
,(@time_zone_id, 3, 16248, 1, 'MDST')
,(@time_zone_id, 4, 10800, 0, 'MSK')
,(@time_zone_id, 5, 14400, 1, 'MSD')
,(@time_zone_id, 6, 18000, 1, 'MSD')
,(@time_zone_id, 7, 7200, 0, 'EET')
,(@time_zone_id, 8, 10800, 0, 'MSK')
,(@time_zone_id, 9, 14400, 1, 'MSD')
,(@time_zone_id, 10, 10800, 1, 'EEST')
,(@time_zone_id, 11, 7200, 0, 'EET')
,(@time_zone_id, 12, 14400, 0, 'MSK')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('WET', @time_zone_id);
INSERT INTO time_zone_transition (Time_zone_id, Transition_time, Transition_type_id) VALUES
 (@time_zone_id, 228877200, 0)
,(@time_zone_id, 243997200, 1)
,(@time_zone_id, 260326800, 0)
,(@time_zone_id, 276051600, 1)
,(@time_zone_id, 291776400, 0)
,(@time_zone_id, 307501200, 1)
,(@time_zone_id, 323830800, 0)
,(@time_zone_id, 338950800, 1)
,(@time_zone_id, 354675600, 0)
,(@time_zone_id, 370400400, 1)
,(@time_zone_id, 386125200, 0)
,(@time_zone_id, 401850000, 1)
,(@time_zone_id, 417574800, 0)
,(@time_zone_id, 433299600, 1)
,(@time_zone_id, 449024400, 0)
,(@time_zone_id, 465354000, 1)
,(@time_zone_id, 481078800, 0)
,(@time_zone_id, 496803600, 1)
,(@time_zone_id, 512528400, 0)
,(@time_zone_id, 528253200, 1)
,(@time_zone_id, 543978000, 0)
,(@time_zone_id, 559702800, 1)
,(@time_zone_id, 575427600, 0)
,(@time_zone_id, 591152400, 1)
,(@time_zone_id, 606877200, 0)
,(@time_zone_id, 622602000, 1)
,(@time_zone_id, 638326800, 0)
,(@time_zone_id, 654656400, 1)
,(@time_zone_id, 670381200, 0)
,(@time_zone_id, 686106000, 1)
,(@time_zone_id, 701830800, 0)
,(@time_zone_id, 717555600, 1)
,(@time_zone_id, 733280400, 0)
,(@time_zone_id, 749005200, 1)
,(@time_zone_id, 764730000, 0)
,(@time_zone_id, 780454800, 1)
,(@time_zone_id, 796179600, 0)
,(@time_zone_id, 811904400, 1)
,(@time_zone_id, 828234000, 0)
,(@time_zone_id, 846378000, 1)
,(@time_zone_id, 859683600, 0)
,(@time_zone_id, 877827600, 1)
,(@time_zone_id, 891133200, 0)
,(@time_zone_id, 909277200, 1)
,(@time_zone_id, 92258coffee2800, 0)
,(@time_zone_id, 941331600, 1)
,(@time_zone_id, 954032400, 0)
,(@time_zone_id, 972781200, 1)
,(@time_zone_id, 985482000, 0)
,(@time_zone_id, 1004230800, 1)
,(@time_zone_id, 1017536400, 0)
,(@time_zone_id, 1035680400, 1)
,(@time_zone_id, 1048986000, 0)
,(@time_zone_id, 1067130000, 1)
,(@time_zone_id, 1080435600, 0)
,(@time_zone_id, 1099184400, 1)
,(@time_zone_id, 1111885200, 0)
,(@time_zone_id, 1130634000, 1)
,(@time_zone_id, 1143334800, 0)
,(@time_z/* consulta larga de SQL (4,0 KiB), fragmentada no caractere 2.000 */
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
 (@time_zone_id, 0, 3600, 1, 'WEST')
,(@time_zone_id, 1, 0, 0, 'WET')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('Zulu', @time_zone_id);
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
 (@time_zone_id, 0, 0, 0, 'UTC')
;
INSERT INTO time_zone (Use_leap_seconds) VALUES ('N');
SET @time_zone_id= LAST_INSERT_ID();
INSERT INTO time_zone_name (Name, Time_zone_id) VALUES ('posixrules', @time_zone_id);
INSERT INTO time_zone_transition (Time_zone_id, Transition_time, Transition_type_id) VALUES
 (@time_zone_id, -1633280400, 0)
,(@time_zone_id, -1615140000, 1)
,(@time_zone_id, -1601830800, 0)
,(@time_zone_id, -1583690400, 1)
,(@time_zone_id, -1570381200, 0)
,(@time_zone_id, -1551636000, 1)
,(@time_zone_id, -1536512400, 0)
,(@time_zone_id, -1523210400, 1)
,(@time_zone_id, -1504458000, 0)
,(@time_zone_id, -1491760800, 1)
,(@time_zone_id, -1473008400, 0)
,(@time_zone_id, -1459706400, 1)
,(@time_zone_id, -1441558800, 0)
,(@time_zone_id, -1428256800, 1)
,(@time_zone_id, -1410109200, 0)
,(@time_zone_id, -1396807200, 1)
,(@time_zone_id, -1378659600, 0)
,(@time_zone_id, -1365357600, 1)
,(@time_zone_id, -1347210000, 0)
,(@time_zone_id, -1333908000, 1)
,(@time_zone_id, -1315155600, 0)
,(@time_zone_id, -1301853600, 1)
,(@time_zone_id, -1283706000, 0)
,(@time_zone_id, -1270404000, 1)
,(@time_zone_id, -1252256400, 0)
,(@time_zone_id, -1238954400, 1)
,(@time_zone_id, -1220806800, 0)
,(@time_zone_id, -1207504800, 1)
,(@time_zone_id, -1189357200, 0)
,(@time_zone_id, -1176055200, 1)
,(@time_zone_id, -1157302800, 0)
,(@time_zone_id, -1144605600, 1)
,(@time_zone_id, -1125853200, 0)
,(@time_zone_id, -1112551200, 1)
,(@time_zone_id, -1094403600, 0)
,(@time_zone_id, -1081101600, 1)
,(@time_zone_id, -1062954000, 0)
,(@time_zone_id, -1049652000, 1)
,(@time_zone_id, -1031504400, 0)
,(@time_zone_id, -1018202400, 1)
,(@time_zone_id, -1000054800, 0)
,(@time_zone_id, -986752800, 1)
,(@time_zone_id, -968000400, 0)
,(@time_zone_id, -955303200, 1)
,(@time_zone_id, -936550800, 0)
,(@time_zone_id, -923248800, 1)
,(@time_zone_id, -905101200, 0)
,(@time_zone_id, -891799200, 1)
,(@time_zone_id, -880218000, 2)
,(@time_zone_id, -769395600, 3)
,(@time_zone_id, -765396000, 1)
,(@time_zone_id, -747248400, 0)
,(@time_zone_id, -733946400, 1)
,(@time_zone_id, -715798800, 0)
,(@time_zone_id, -702496800, 1)
,(@time_zone_id, -684349200, 0)
,(@time_zone_id, -/* consulta larga de SQL (7,6 KiB), fragmentada no caractere 2.000 */
INSERT INTO time_zone_transition_type (Time_zone_id, Transition_type_id, Offset, Is_DST, Abbreviation) VALUES
 (@time_zone_id, 0, -14400, 1, 'EDT')
,(@time_zone_id, 1, -18000, 0, 'EST')
,(@time_zone_id, 2, -14400, 1, 'EWT')
,(@time_zone_id, 3, -14400, 1, 'EPT')
;
ALTER TABLE time_zone_transition ORDER BY Time_zone_id, Transition_time;
ALTER TABLE time_zone_transition_type ORDER BY Time_zone_id, Transition_type_id;
/* Affected rows: 84.444  Registros encontrados: 0  Avisos: 1  Duração de 2.840 queries: 8,918 sec. */
SHOW WARNINGS LIMIT 5;