local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayFind = ____lualib.__TS__ArrayFind
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local Set = ____lualib.Set
local __TS__Iterator = ____lualib.__TS__Iterator
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__Number = ____lualib.__TS__Number
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArraySome = ____lualib.__TS__ArraySome
local __TS__SparseArrayNew = ____lualib.__TS__SparseArrayNew
local __TS__SparseArrayPush = ____lualib.__TS__SparseArrayPush
local __TS__SparseArraySpread = ____lualib.__TS__SparseArraySpread
local __TS__NumberIsFinite = ____lualib.__TS__NumberIsFinite
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__ArrayFindIndex = ____lualib.__TS__ArrayFindIndex
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "api/player.lua"
__TS__SourceMapTraceBack("api/player.lua", {["21"] = 1,["22"] = 1,["23"] = 2,["24"] = 2,["25"] = 3,["26"] = 4,["27"] = 5,["28"] = 7,["29"] = 9,["30"] = 9,["31"] = 9,["32"] = 10,["33"] = 10,["34"] = 11,["35"] = 11,["36"] = 12,["37"] = 12,["38"] = 13,["39"] = 13,["40"] = 15,["41"] = 16,["42"] = 16,["43"] = 17,["44"] = 17,["45"] = 19,["46"] = 19,["47"] = 19,["49"] = 19,["50"] = 26,["51"] = 26,["52"] = 26,["54"] = 26,["55"] = 73,["56"] = 73,["57"] = 73,["59"] = 73,["60"] = 88,["61"] = 88,["62"] = 88,["64"] = 88,["65"] = 112,["66"] = 112,["67"] = 112,["69"] = 112,["70"] = 144,["71"] = 144,["72"] = 144,["74"] = 205,["75"] = 208,["76"] = 208,["77"] = 208,["78"] = 208,["79"] = 212,["80"] = 212,["81"] = 212,["82"] = 212,["83"] = 217,["84"] = 217,["85"] = 217,["86"] = 217,["87"] = 222,["88"] = 222,["89"] = 222,["90"] = 222,["91"] = 226,["92"] = 226,["93"] = 226,["94"] = 226,["95"] = 230,["96"] = 230,["97"] = 230,["98"] = 230,["99"] = 233,["100"] = 233,["101"] = 233,["102"] = 233,["103"] = 237,["104"] = 237,["105"] = 237,["106"] = 237,["107"] = 241,["108"] = 241,["109"] = 241,["110"] = 241,["111"] = 245,["112"] = 245,["113"] = 247,["114"] = 248,["115"] = 249,["116"] = 250,["117"] = 251,["118"] = 245,["119"] = 245,["120"] = 204,["121"] = 256,["122"] = 257,["123"] = 256,["124"] = 260,["125"] = 261,["126"] = 262,["127"] = 263,["130"] = 269,["131"] = 270,["132"] = 271,["135"] = 277,["136"] = 278,["137"] = 279,["138"] = 260,["139"] = 282,["140"] = 283,["141"] = 282,["142"] = 289,["143"] = 290,["144"] = 291,["147"] = 295,["148"] = 296,["151"] = 300,["152"] = 301,["153"] = 303,["154"] = 304,["155"] = 305,["156"] = 289,["157"] = 310,["158"] = 311,["159"] = 312,["162"] = 316,["163"] = 317,["166"] = 321,["167"] = 322,["168"] = 323,["169"] = 310,["170"] = 328,["171"] = 329,["172"] = 330,["175"] = 334,["176"] = 335,["179"] = 339,["181"] = 339,["183"] = 340,["184"] = 341,["185"] = 328,["186"] = 344,["187"] = 347,["188"] = 348,["189"] = 349,["191"] = 351,["192"] = 344,["193"] = 354,["194"] = 357,["195"] = 358,["196"] = 362,["197"] = 363,["199"] = 366,["200"] = 367,["202"] = 369,["203"] = 370,["204"] = 371,["206"] = 373,["207"] = 354,["208"] = 376,["209"] = 379,["210"] = 382,["211"] = 383,["213"] = 385,["214"] = 376,["215"] = 388,["216"] = 389,["217"] = 390,["218"] = 391,["220"] = 393,["221"] = 388,["222"] = 396,["223"] = 400,["224"] = 401,["225"] = 402,["226"] = 403,["227"] = 404,["228"] = 405,["229"] = 406,["230"] = 407,["231"] = 408,["232"] = 409,["233"] = 409,["234"] = 409,["235"] = 409,["236"] = 409,["237"] = 409,["238"] = 409,["239"] = 409,["240"] = 409,["241"] = 409,["242"] = 409,["243"] = 409,["244"] = 409,["245"] = 409,["246"] = 409,["247"] = 409,["248"] = 409,["249"] = 396,["250"] = 424,["251"] = 425,["252"] = 425,["253"] = 425,["254"] = 425,["255"] = 425,["256"] = 425,["257"] = 425,["258"] = 425,["259"] = 425,["260"] = 425,["261"] = 425,["262"] = 425,["263"] = 425,["264"] = 425,["265"] = 425,["266"] = 425,["267"] = 425,["268"] = 424,["269"] = 441,["270"] = 442,["273"] = 446,["274"] = 447,["275"] = 447,["276"] = 447,["277"] = 447,["278"] = 448,["279"] = 449,["280"] = 450,["281"] = 450,["282"] = 451,["283"] = 453,["284"] = 457,["285"] = 459,["286"] = 460,["287"] = 461,["288"] = 462,["289"] = 463,["291"] = 464,["292"] = 465,["293"] = 465,["295"] = 467,["296"] = 472,["297"] = 472,["299"] = 473,["303"] = 480,["305"] = 481,["306"] = 482,["308"] = 485,["309"] = 485,["310"] = 485,["311"] = 485,["312"] = 485,["313"] = 485,["314"] = 490,["315"] = 490,["317"] = 491,["321"] = 498,["322"] = 504,["323"] = 505,["324"] = 506,["325"] = 507,["326"] = 508,["327"] = 508,["328"] = 508,["329"] = 508,["330"] = 508,["331"] = 508,["332"] = 513,["333"] = 514,["336"] = 517,["339"] = 519,["340"] = 520,["341"] = 498,["342"] = 528,["343"] = 528,["344"] = 528,["345"] = 528,["347"] = 528,["349"] = 528,["350"] = 529,["351"] = 529,["352"] = 529,["353"] = 529,["354"] = 529,["355"] = 529,["356"] = 529,["357"] = 535,["358"] = 535,["359"] = 535,["360"] = 535,["361"] = 535,["362"] = 535,["363"] = 535,["364"] = 536,["365"] = 536,["366"] = 536,["367"] = 536,["368"] = 536,["369"] = 536,["370"] = 536,["371"] = 537,["372"] = 537,["373"] = 537,["374"] = 537,["375"] = 537,["376"] = 537,["377"] = 537,["378"] = 540,["379"] = 541,["380"] = 542,["381"] = 543,["382"] = 543,["383"] = 543,["384"] = 543,["385"] = 543,["386"] = 543,["387"] = 543,["388"] = 543,["390"] = 550,["391"] = 553,["392"] = 554,["393"] = 555,["394"] = 556,["396"] = 558,["399"] = 441,["400"] = 563,["401"] = 564,["402"] = 566,["403"] = 568,["404"] = 569,["405"] = 575,["406"] = 578,["407"] = 578,["408"] = 578,["409"] = 578,["410"] = 578,["413"] = 581,["414"] = 581,["415"] = 581,["416"] = 581,["417"] = 582,["418"] = 583,["419"] = 587,["420"] = 587,["421"] = 587,["422"] = 587,["423"] = 587,["425"] = 589,["427"] = 564,["428"] = 563,["429"] = 594,["430"] = 595,["431"] = 597,["432"] = 598,["433"] = 598,["434"] = 598,["435"] = 598,["436"] = 599,["437"] = 601,["438"] = 601,["439"] = 601,["440"] = 601,["441"] = 601,["443"] = 595,["444"] = 594,["445"] = 606,["446"] = 607,["447"] = 609,["448"] = 610,["449"] = 610,["450"] = 610,["451"] = 610,["452"] = 611,["453"] = 613,["454"] = 613,["455"] = 613,["456"] = 613,["457"] = 616,["458"] = 618,["459"] = 622,["461"] = 625,["462"] = 625,["463"] = 625,["464"] = 625,["465"] = 625,["467"] = 627,["468"] = 628,["469"] = 629,["470"] = 607,["471"] = 606,["472"] = 633,["473"] = 635,["474"] = 636,["476"] = 639,["477"] = 639,["478"] = 639,["479"] = 639,["480"] = 640,["481"] = 641,["483"] = 643,["484"] = 633,["485"] = 646,["486"] = 648,["487"] = 649,["489"] = 651,["490"] = 651,["491"] = 651,["492"] = 651,["493"] = 653,["494"] = 654,["496"] = 657,["497"] = 658,["499"] = 661,["500"] = 646,["501"] = 664,["502"] = 665,["503"] = 665,["504"] = 665,["505"] = 665,["506"] = 666,["507"] = 667,["509"] = 669,["510"] = 664,["511"] = 672,["512"] = 673,["513"] = 673,["514"] = 673,["515"] = 673,["516"] = 674,["517"] = 672,["518"] = 677,["519"] = 678,["520"] = 678,["521"] = 678,["522"] = 678,["523"] = 679,["524"] = 677,["525"] = 682,["526"] = 683,["527"] = 685,["528"] = 685,["529"] = 685,["530"] = 685,["531"] = 685,["532"] = 685,["533"] = 685,["534"] = 685,["535"] = 698,["536"] = 682,["537"] = 701,["538"] = 702,["539"] = 703,["540"] = 704,["541"] = 705,["544"] = 709,["545"] = 710,["547"] = 712,["549"] = 701,["550"] = 716,["551"] = 719,["552"] = 720,["553"] = 721,["555"] = 723,["557"] = 724,["558"] = 725,["559"] = 726,["561"] = 728,["562"] = 729,["563"] = 730,["565"] = 732,["569"] = 737,["570"] = 716,["571"] = 740,["572"] = 746,["573"] = 747,["574"] = 748,["576"] = 750,["580"] = 755,["581"] = 756,["582"] = 756,["583"] = 756,["584"] = 759,["585"] = 759,["586"] = 759,["587"] = 759,["588"] = 756,["589"] = 756,["590"] = 765,["591"] = 766,["592"] = 767,["593"] = 756,["594"] = 769,["595"] = 770,["596"] = 771,["597"] = 772,["599"] = 774,["601"] = 756,["602"] = 756,["603"] = 740,["604"] = 780,["605"] = 781,["606"] = 781,["607"] = 781,["608"] = 781,["609"] = 781,["610"] = 786,["611"] = 786,["612"] = 788,["613"] = 788,["614"] = 788,["615"] = 788,["616"] = 788,["617"] = 788,["618"] = 786,["619"] = 781,["620"] = 781,["621"] = 794,["622"] = 795,["623"] = 781,["624"] = 797,["625"] = 798,["626"] = 799,["627"] = 802,["628"] = 781,["629"] = 781,["630"] = 780,["631"] = 807,["632"] = 808,["633"] = 809,["634"] = 807,["635"] = 812,["636"] = 813,["637"] = 815,["638"] = 812,["639"] = 818,["640"] = 821,["641"] = 818,["642"] = 825,["643"] = 826,["644"] = 828,["645"] = 828,["646"] = 828,["647"] = 828,["648"] = 828,["649"] = 828,["650"] = 828,["651"] = 839,["652"] = 825,["653"] = 843,["654"] = 844,["655"] = 845,["656"] = 847,["657"] = 848,["658"] = 843,["659"] = 851,["660"] = 852,["661"] = 853,["662"] = 851,["663"] = 856,["664"] = 858,["667"] = 865,["668"] = 866,["669"] = 856,["670"] = 869,["671"] = 870,["672"] = 870,["673"] = 870,["674"] = 870,["675"] = 870,["676"] = 870,["677"] = 876,["678"] = 877,["679"] = 878,["680"] = 870,["681"] = 880,["682"] = 881,["683"] = 870,["684"] = 870,["685"] = 869,["686"] = 886,["687"] = 887,["688"] = 888,["689"] = 889,["690"] = 890,["691"] = 891,["694"] = 894,["697"] = 897,["698"] = 886,["699"] = 900,["700"] = 901,["701"] = 902,["702"] = 902,["703"] = 902,["704"] = 905,["705"] = 905,["706"] = 905,["707"] = 905,["710"] = 908,["711"] = 908,["712"] = 909,["713"] = 910,["714"] = 908,["715"] = 908,["716"] = 908,["717"] = 908,["718"] = 908,["719"] = 908,["720"] = 900,["721"] = 922,["722"] = 923,["723"] = 924,["724"] = 924,["725"] = 924,["726"] = 927,["727"] = 927,["728"] = 927,["729"] = 930,["730"] = 930,["731"] = 930,["732"] = 927,["733"] = 927,["734"] = 922,["735"] = 934,["736"] = 935,["737"] = 936,["738"] = 937,["739"] = 938,["740"] = 939,["743"] = 942,["744"] = 943,["747"] = 946,["748"] = 947,["751"] = 951,["752"] = 952,["753"] = 952,["754"] = 952,["755"] = 952,["756"] = 952,["757"] = 952,["758"] = 952,["759"] = 959,["760"] = 960,["761"] = 961,["762"] = 962,["763"] = 963,["764"] = 964,["765"] = 965,["766"] = 965,["767"] = 965,["768"] = 965,["769"] = 965,["770"] = 966,["771"] = 967,["772"] = 968,["775"] = 971,["776"] = 952,["777"] = 973,["778"] = 974,["779"] = 975,["780"] = 976,["781"] = 952,["782"] = 952,["783"] = 934,["784"] = 981,["785"] = 982,["786"] = 983,["787"] = 984,["789"] = 986,["790"] = 987,["791"] = 981,["792"] = 993,["793"] = 994,["794"] = 994,["795"] = 994,["796"] = 994,["797"] = 994,["798"] = 994,["799"] = 994,["800"] = 1004,["801"] = 1005,["802"] = 1006,["803"] = 1007,["804"] = 994,["805"] = 1011,["806"] = 1012,["807"] = 994,["808"] = 994,["809"] = 993,["810"] = 1017,["811"] = 1018,["812"] = 1019,["813"] = 1020,["814"] = 1021,["815"] = 1022,["816"] = 1023,["817"] = 1017,["818"] = 1026,["819"] = 1027,["820"] = 1028,["823"] = 1031,["824"] = 1026,["825"] = 1040,["826"] = 1041,["827"] = 1041,["828"] = 1041,["829"] = 1041,["830"] = 1042,["831"] = 1043,["832"] = 1044,["833"] = 1045,["834"] = 1045,["835"] = 1047,["836"] = 1048,["837"] = 1050,["838"] = 1052,["839"] = 1052,["841"] = 1052,["842"] = 1052,["844"] = 1052,["845"] = 1053,["846"] = 1053,["847"] = 1053,["849"] = 1054,["851"] = 1048,["853"] = 1058,["854"] = 1061,["855"] = 1063,["857"] = 1067,["858"] = 1072,["859"] = 1073,["860"] = 1074,["862"] = 1076,["863"] = 1077,["864"] = 1081,["865"] = 1082,["866"] = 1082,["867"] = 1082,["868"] = 1082,["869"] = 1082,["870"] = 1082,["872"] = 1088,["874"] = 1089,["875"] = 1089,["877"] = 1090,["881"] = 1096,["883"] = 1098,["885"] = 1100,["886"] = 1100,["888"] = 1103,["889"] = 1104,["890"] = 1105,["892"] = 1108,["893"] = 1111,["894"] = 1113,["895"] = 1117,["897"] = 1119,["898"] = 1120,["899"] = 1121,["900"] = 1040,["901"] = 1125,["902"] = 1128,["903"] = 1129,["904"] = 1129,["905"] = 1129,["906"] = 1129,["907"] = 1129,["908"] = 1129,["909"] = 1129,["910"] = 1129,["911"] = 1129,["912"] = 1129,["913"] = 1129,["914"] = 1142,["915"] = 1143,["916"] = 1144,["918"] = 1147,["919"] = 1147,["920"] = 1147,["921"] = 1147,["922"] = 1151,["923"] = 1152,["924"] = 1154,["925"] = 1154,["926"] = 1154,["927"] = 1154,["928"] = 1155,["929"] = 1156,["931"] = 1158,["932"] = 1147,["933"] = 1147,["934"] = 1125,["935"] = 1163,["936"] = 1166,["937"] = 1167,["940"] = 1171,["941"] = 1172,["942"] = 1173,["945"] = 1177,["946"] = 1178,["949"] = 1182,["952"] = 1186,["953"] = 1187,["954"] = 1189,["959"] = 1198,["960"] = 1203,["961"] = 1203,["962"] = 1203,["963"] = 1203,["964"] = 1204,["968"] = 1209,["971"] = 1213,["972"] = 1214,["974"] = 1216,["975"] = 1217,["977"] = 1163,["978"] = 1221,["979"] = 1222,["980"] = 1222,["981"] = 1222,["982"] = 1222,["983"] = 1222,["984"] = 1222,["985"] = 1222,["986"] = 1223,["987"] = 1221,["988"] = 1226,["989"] = 1232,["990"] = 1233,["991"] = 1235,["992"] = 1236,["993"] = 1237,["995"] = 1241,["996"] = 1244,["997"] = 1245,["998"] = 1246,["999"] = 1246,["1000"] = 1246,["1001"] = 1246,["1002"] = 1246,["1003"] = 1247,["1005"] = 1249,["1006"] = 1250,["1008"] = 1252,["1009"] = 1253,["1012"] = 1258,["1013"] = 1262,["1014"] = 1263,["1016"] = 1265,["1017"] = 1266,["1019"] = 1270,["1020"] = 1274,["1021"] = 1275,["1023"] = 1278,["1024"] = 1226,["1025"] = 1281,["1026"] = 1282,["1027"] = 1283,["1029"] = 1285,["1030"] = 1281,["1031"] = 1288,["1032"] = 1293,["1033"] = 1293,["1034"] = 1293,["1035"] = 1293,["1036"] = 1294,["1037"] = 1288,["1038"] = 1297,["1039"] = 1298,["1040"] = 1297,["1041"] = 1301,["1042"] = 1302,["1043"] = 1302,["1044"] = 1302,["1045"] = 1302,["1046"] = 1302,["1047"] = 1302,["1048"] = 1302,["1049"] = 1302,["1050"] = 1302,["1051"] = 1302,["1052"] = 1302,["1053"] = 1302,["1054"] = 1302,["1055"] = 1302,["1056"] = 1302,["1057"] = 1302,["1058"] = 1302,["1059"] = 1302,["1060"] = 1302,["1061"] = 1302,["1062"] = 1302,["1063"] = 1302,["1064"] = 1302,["1065"] = 1302,["1066"] = 1301,["1067"] = 1328,["1068"] = 1329,["1069"] = 1329,["1070"] = 1329,["1071"] = 1329,["1072"] = 1329,["1073"] = 1329,["1074"] = 1329,["1075"] = 1329,["1076"] = 1329,["1077"] = 1329,["1078"] = 1329,["1079"] = 1329,["1080"] = 1329,["1081"] = 1329,["1082"] = 1329,["1083"] = 1329,["1084"] = 1328,["1085"] = 1347,["1086"] = 1348,["1087"] = 1348,["1088"] = 1348,["1089"] = 1348,["1090"] = 1348,["1091"] = 1348,["1092"] = 1348,["1093"] = 1348,["1094"] = 1348,["1095"] = 1348,["1096"] = 1348,["1097"] = 1348,["1098"] = 1348,["1099"] = 1348,["1100"] = 1348,["1101"] = 1348,["1102"] = 1347,["1103"] = 1366,["1104"] = 1371,["1105"] = 1372,["1106"] = 1373,["1108"] = 1375,["1109"] = 1376,["1111"] = 1378,["1112"] = 1379,["1114"] = 1381,["1115"] = 1382,["1117"] = 1384,["1118"] = 1385,["1120"] = 1387,["1121"] = 1388,["1123"] = 1390,["1124"] = 1391,["1126"] = 1393,["1127"] = 1394,["1129"] = 1396,["1130"] = 1397,["1132"] = 1399,["1133"] = 1400,["1135"] = 1403,["1136"] = 1404,["1137"] = 1405,["1138"] = 1406,["1139"] = 1407,["1140"] = 1366,["1141"] = 1410,["1142"] = 1411,["1143"] = 1412,["1144"] = 1413,["1145"] = 1413,["1146"] = 1413,["1147"] = 1413,["1148"] = 1413,["1149"] = 1413,["1150"] = 1413,["1151"] = 1413,["1152"] = 1413,["1153"] = 1413,["1154"] = 1413,["1155"] = 1419,["1156"] = 1410,["1157"] = 1422,["1158"] = 1423,["1159"] = 1424,["1160"] = 1424,["1161"] = 1424,["1162"] = 1424,["1163"] = 1424,["1164"] = 1424,["1165"] = 1424,["1166"] = 1424,["1167"] = 1424,["1168"] = 1424,["1169"] = 1424,["1170"] = 1430,["1171"] = 1422,["1172"] = 1433,["1173"] = 1434,["1174"] = 1435,["1175"] = 1436,["1176"] = 1438,["1177"] = 1438,["1178"] = 1438,["1179"] = 1438,["1180"] = 1438,["1181"] = 1438,["1182"] = 1438,["1183"] = 1438,["1184"] = 1438,["1185"] = 1438,["1186"] = 1438,["1187"] = 1450,["1188"] = 1451,["1190"] = 1453,["1191"] = 1433,["1192"] = 1456,["1193"] = 1457,["1194"] = 1458,["1195"] = 1459,["1197"] = 1462,["1198"] = 1463,["1199"] = 1464,["1200"] = 1465,["1201"] = 1456,["1202"] = 1468,["1203"] = 1469,["1204"] = 1470,["1205"] = 1471,["1207"] = 1474,["1208"] = 1475,["1209"] = 1476,["1210"] = 1477,["1211"] = 1468,["1212"] = 1480,["1213"] = 1481,["1214"] = 1482,["1215"] = 1483,["1217"] = 1486,["1218"] = 1487,["1219"] = 1488,["1220"] = 1489,["1221"] = 1480,["1222"] = 1492,["1223"] = 1493,["1224"] = 1494,["1225"] = 1495,["1227"] = 1498,["1228"] = 1499,["1230"] = 1501,["1231"] = 1502,["1232"] = 1503,["1233"] = 1504,["1234"] = 1505,["1235"] = 1492,["1236"] = 1508,["1237"] = 1513,["1238"] = 1514,["1240"] = 1515,["1241"] = 1515,["1242"] = 1516,["1243"] = 1517,["1244"] = 1518,["1245"] = 1515,["1248"] = 1520,["1249"] = 1521,["1250"] = 1522,["1251"] = 1508,["1252"] = 1525,["1253"] = 1526,["1254"] = 1527,["1255"] = 1528,["1257"] = 1531,["1258"] = 1532,["1259"] = 1533,["1260"] = 1534,["1261"] = 1525,["1262"] = 1537,["1263"] = 1542,["1264"] = 1543,["1265"] = 1544,["1266"] = 1545,["1267"] = 1545,["1268"] = 1545,["1269"] = 1545,["1270"] = 1545,["1271"] = 1545,["1272"] = 1545,["1273"] = 1545,["1274"] = 1553,["1275"] = 1554,["1276"] = 1555,["1277"] = 1555,["1278"] = 1555,["1279"] = 1555,["1281"] = 1557,["1282"] = 1557,["1283"] = 1559,["1284"] = 1560,["1285"] = 1561,["1287"] = 1563,["1288"] = 1557,["1289"] = 1557,["1290"] = 1557,["1291"] = 1567,["1292"] = 1569,["1293"] = 1569,["1294"] = 1569,["1295"] = 1569,["1296"] = 1569,["1297"] = 1569,["1298"] = 1569,["1299"] = 1569,["1300"] = 1577,["1301"] = 1578,["1302"] = 1579,["1303"] = 1579,["1304"] = 1579,["1305"] = 1579,["1307"] = 1581,["1308"] = 1581,["1309"] = 1583,["1310"] = 1584,["1311"] = 1585,["1313"] = 1587,["1314"] = 1581,["1315"] = 1581,["1316"] = 1581,["1317"] = 1591,["1318"] = 1592,["1319"] = 1597,["1320"] = 1537,["1321"] = 145,["1322"] = 146,["1323"] = 147,["1324"] = 148,["1325"] = 149,["1326"] = 150,["1327"] = 151,["1328"] = 152,["1329"] = 155,["1330"] = 155,["1331"] = 155,["1332"] = 155,["1333"] = 155,["1334"] = 155,["1335"] = 155,["1336"] = 155,["1337"] = 155,["1338"] = 155,["1339"] = 155,["1340"] = 155,["1341"] = 155,["1342"] = 155,["1343"] = 172,["1344"] = 178,["1345"] = 184,["1346"] = 189,["1347"] = 190,["1348"] = 192,["1349"] = 193,["1350"] = 194,["1351"] = 195,["1352"] = 196,["1353"] = 197});
local ____exports = {}
local ____player_2Dhelper = require("modules.helper.player-helper")
local PlayerHelper = ____player_2Dhelper.PlayerHelper
local ____property_controller = require("modules.property.property_controller")
local PropertyController = ____property_controller.PropertyController
local ____rebirth = require("api.rebirth")
local getRebirthEffectivePropertyLevel = ____rebirth.getRebirthEffectivePropertyLevel
local isRebirthDirectAbilityProperty = ____rebirth.isRebirthDirectAbilityProperty
local resolveRebirth = ____rebirth.resolveRebirth
local ____api_2Dclient = require("api.api-client")
local ApiClient = ____api_2Dclient.ApiClient
local HttpMethod = ____api_2Dclient.HttpMethod
local ____custom_2Dmode_2Dsettings = require("api.custom-mode-settings")
local CustomModeSettings = ____custom_2Dmode_2Dsettings.CustomModeSettings
local ____player_2Dlanguage = require("api.player-language")
local PlayerLanguage = ____player_2Dlanguage.PlayerLanguage
local ____player_2Dtask = require("api.player-task")
local PlayerTask = ____player_2Dtask.PlayerTask
local ____showcase = require("api.showcase")
local Showcase = ____showcase.Showcase
____exports.MemberLevel = MemberLevel or ({})
____exports.MemberLevel.NORMAL = 1
____exports.MemberLevel[____exports.MemberLevel.NORMAL] = "NORMAL"
____exports.MemberLevel.PREMIUM = 2
____exports.MemberLevel[____exports.MemberLevel.PREMIUM] = "PREMIUM"
____exports.MemberDto = __TS__Class()
local MemberDto = ____exports.MemberDto
MemberDto.name = "MemberDto"
function MemberDto.prototype.____constructor(self)
end
____exports.PlayerProperty = __TS__Class()
local PlayerProperty = ____exports.PlayerProperty
PlayerProperty.name = "PlayerProperty"
function PlayerProperty.prototype.____constructor(self)
end
____exports.PlayerSetting = __TS__Class()
local PlayerSetting = ____exports.PlayerSetting
PlayerSetting.name = "PlayerSetting"
function PlayerSetting.prototype.____constructor(self)
end
____exports.PlayerDto = __TS__Class()
local PlayerDto = ____exports.PlayerDto
PlayerDto.name = "PlayerDto"
function PlayerDto.prototype.____constructor(self)
end
____exports.PointInfoDto = __TS__Class()
local PointInfoDto = ____exports.PointInfoDto
PointInfoDto.name = "PointInfoDto"
function PointInfoDto.prototype.____constructor(self)
end
____exports.Player = __TS__Class()
local Player = ____exports.Player
Player.name = "Player"
function Player.prototype.____constructor(self)
    CustomModeSettings:RegisterListeners()
    CustomGameEventManager:RegisterListener(
        "player_property_levelup",
        function(_, event) return self:onPlayerPropertyLevelup(event) end
    )
    CustomGameEventManager:RegisterListener(
        "player_property_apply_changes",
        function(_, event) return ____exports.Player:onPlayerPropertyApplyChanges(event) end
    )
    CustomGameEventManager:RegisterListener(
        "player_property_reset",
        function(_, event) return self:onPlayerPropertyReset(event) end
    )
    CustomGameEventManager:RegisterListener(
        "save_bind_ability_key",
        function(_, event) return self:SendBindAbilityKey(event) end
    )
    CustomGameEventManager:RegisterListener(
        "backpack_item_cast",
        function(_, event) return self:OnBackpackItemCast(event) end
    )
    CustomGameEventManager:RegisterListener(
        "rookie_gift_claim",
        function(_, event) return ____exports.Player:OnRookieGiftClaim(event) end
    )
    CustomGameEventManager:RegisterListener(
        "gold_consumable_converter_cycle",
        function(_, event) return ____exports.Player:OnGoldConsumableConverterCycle(event) end
    )
    CustomGameEventManager:RegisterListener(
        "gold_consumable_converter_toggle",
        function(_, event) return ____exports.Player:OnGoldConsumableConverterToggle(event) end
    )
    CustomGameEventManager:RegisterListener(
        "gold_consumable_converter_consume",
        function(_, event) return ____exports.Player:OnGoldConsumableConverterConsume(event) end
    )
    CustomGameEventManager:RegisterListener(
        "player_language",
        function(_, event)
            local steamId = PlayerResource:GetSteamAccountID(event.PlayerID)
            PlayerLanguage:SetPlayerLanguage(steamId, event.language)
            PlayerTask:RefreshPlayerTasks(steamId)
            Showcase:RefreshShowcase(steamId)
        end
    )
end
function Player.GetPlayerCount(self)
    return ____exports.Player.playerCount
end
function Player.UnlockGoldConsumableConverter(self, hero)
    if not ____exports.Player:HasGoldConsumableConverterAccess(hero) then
        ____exports.Player:SyncGoldConsumableConverterLockedState(hero)
        ApiClient:DebugLog("[GoldConsumableConverter] unlock skipped, missing property_cannot_miss: " .. hero:GetUnitName())
        return
    end
    local ability = ____exports.Player:EnsureGoldConsumableConverterAbility(hero)
    if not ability then
        ApiClient:DebugLog("[GoldConsumableConverter] unlock failed, ability missing: " .. hero:GetUnitName())
        return
    end
    ability.converter_enabled = ability.converter_enabled == true
    ____exports.Player:SyncGoldConsumableConverterState(hero, ability)
    ApiClient:DebugLog("[GoldConsumableConverter] unlocked for player " .. tostring(hero:GetPlayerOwnerID()))
end
function Player.HasGoldConsumableConverterAccess(self, hero)
    return hero:HasModifier("property_cannot_miss") or hero:HasModifier("modifier_player_property_cannot_miss")
end
function Player.OnGoldConsumableConverterCycle(self, event)
    local hero = ____exports.Player:GetGoldConsumableConverterHero(event.PlayerID)
    if not hero then
        return
    end
    local ability = ____exports.Player:GetGoldConsumableConverterAbility(hero)
    if not ability then
        return
    end
    local currentMode = ____exports.Player:GetGoldConsumableConverterMode(hero)
    local nextMode = currentMode >= #____exports.Player.GOLD_CONSUMABLE_CONVERTER_MODES and 1 or currentMode + 1
    hero:SetModifierStackCount(____exports.Player.GOLD_CONSUMABLE_CONVERTER_MODIFIER, hero, nextMode)
    ____exports.Player:SyncGoldConsumableConverterState(hero, ability)
    ApiClient:DebugLog((("[GoldConsumableConverter] cycle player " .. tostring(event.PlayerID)) .. ", mode=") .. tostring(nextMode))
end
function Player.OnGoldConsumableConverterToggle(self, event)
    local hero = ____exports.Player:GetGoldConsumableConverterHero(event.PlayerID)
    if not hero then
        return
    end
    local ability = ____exports.Player:GetGoldConsumableConverterAbility(hero)
    if not ability then
        return
    end
    ability.converter_enabled = ability.converter_enabled ~= true
    ____exports.Player:SyncGoldConsumableConverterState(hero, ability)
    ApiClient:DebugLog((("[GoldConsumableConverter] toggle player " .. tostring(event.PlayerID)) .. ", enabled=") .. tostring(ability.converter_enabled == true))
end
function Player.OnGoldConsumableConverterConsume(self, event)
    local hero = ____exports.Player:GetGoldConsumableConverterHero(event.PlayerID)
    if not hero then
        return
    end
    local ability = ____exports.Player:GetGoldConsumableConverterAbility(hero)
    if not ability then
        return
    end
    local ____opt_0 = ability.ConsumePending
    if ____opt_0 ~= nil then
        ____opt_0(ability)
    end
    ____exports.Player:SyncGoldConsumableConverterState(hero, ability)
    ApiClient:DebugLog("[GoldConsumableConverter] consume pending player " .. tostring(event.PlayerID))
end
function Player.GetGoldConsumableConverterHero(self, playerId)
    local hero = PlayerResource:GetSelectedHeroEntity(playerId)
    if not hero or not hero:IsRealHero() or hero:IsIllusion() then
        return nil
    end
    return hero
end
function Player.EnsureGoldConsumableConverterAbility(self, hero)
    local existingAbility = hero:FindAbilityByName(____exports.Player.GOLD_CONSUMABLE_CONVERTER_ABILITY)
    local ability = existingAbility or hero:AddAbility(____exports.Player.GOLD_CONSUMABLE_CONVERTER_ABILITY)
    if not ability then
        return nil
    end
    if ability:GetLevel() < 1 then
        ability:SetLevel(1)
    end
    ability:SetHidden(true)
    if ____exports.Player:GetGoldConsumableConverterMode(hero) < 1 then
        hero:SetModifierStackCount(____exports.Player.GOLD_CONSUMABLE_CONVERTER_MODIFIER, hero, 1)
    end
    return ability
end
function Player.GetGoldConsumableConverterAbility(self, hero)
    local ability = hero:FindAbilityByName(____exports.Player.GOLD_CONSUMABLE_CONVERTER_ABILITY)
    if not ability or ability:GetLevel() < 1 then
        return nil
    end
    return ability
end
function Player.GetGoldConsumableConverterMode(self, hero)
    local mode = hero:GetModifierStackCount(____exports.Player.GOLD_CONSUMABLE_CONVERTER_MODIFIER, hero)
    if mode >= 1 and mode <= #____exports.Player.GOLD_CONSUMABLE_CONVERTER_MODES then
        return mode
    end
    return 1
end
function Player.SyncGoldConsumableConverterState(self, hero, ability)
    local playerId = hero:GetPlayerOwnerID()
    local mode = ____exports.Player:GetGoldConsumableConverterMode(hero)
    local modeInfo = ____exports.Player.GOLD_CONSUMABLE_CONVERTER_MODES[mode]
    local pending = ability.converter_pending or ({})
    local pending1 = pending[1] or 0
    local pending2 = pending[2] or 0
    local pending3 = pending[3] or 0
    local pending4 = pending[4] or 0
    local pendingCount = pending[mode] or 0
    CustomNetTables:SetTableValue(
        "gold_consumable_converter",
        tostring(playerId),
        {
            unlocked = 1,
            enabled = ability.converter_enabled == true and 1 or 0,
            mode = mode,
            texture = modeInfo.texture,
            label = modeInfo.label,
            pendingCount = pendingCount,
            totalPending = pending1 + pending2 + pending3 + pending4,
            pending1 = pending1,
            pending2 = pending2,
            pending3 = pending3,
            pending4 = pending4
        }
    )
end
function Player.SyncGoldConsumableConverterLockedState(self, hero)
    CustomNetTables:SetTableValue(
        "gold_consumable_converter",
        tostring(hero:GetPlayerOwnerID()),
        {
            unlocked = 0,
            enabled = 0,
            mode = 1,
            texture = ____exports.Player.GOLD_CONSUMABLE_CONVERTER_MODES[1].texture,
            label = ____exports.Player.GOLD_CONSUMABLE_CONVERTER_MODES[1].label,
            pendingCount = 0,
            totalPending = 0,
            pending1 = 0,
            pending2 = 0,
            pending3 = 0,
            pending4 = 0
        }
    )
end
function Player.SetPlayerProperty(self, hero)
    if not hero then
        return
    end
    local steamId = PlayerResource:GetSteamAccountID(hero:GetPlayerOwnerID())
    local playerInfo = __TS__ArrayFind(
        ____exports.Player.playerList,
        function(____, player) return player.id == tostring(steamId) end
    )
    ApiClient:DebugLog((("[Player] SetPlayerProperty for " .. hero:GetUnitName()) .. ", steamId: ") .. tostring(steamId))
    local rawProperties = playerInfo and playerInfo.propertyRawLevels or playerInfo and playerInfo.properties or ({})
    local ____opt_6 = playerInfo and playerInfo.rebirth
    local backendEffectiveLevels = ____opt_6 and ____opt_6.propertyEffectiveLevels
    local hasNewPropertyContract = (playerInfo and playerInfo.propertyRawLevels) ~= nil or backendEffectiveLevels ~= nil
    ApiClient:DebugLog((((("[Player] PlayerInfo found: " .. tostring(playerInfo ~= nil)) .. ", raw properties count: ") .. tostring(#rawProperties)) .. ", new contract: ") .. tostring(hasNewPropertyContract))
    PropertyController:RemoveAllPlayerProperty(steamId)
    local effectiveProperties = __TS__New(Map)
    local directAbilityPropertyNames = __TS__New(Set)
    local resolvedRebirth = resolveRebirth(nil, playerInfo and playerInfo.rebirth)
    local rawPropertyLevels = __TS__New(Map)
    for ____, property in ipairs(rawProperties) do
        do
            rawPropertyLevels:set(property.name, property.level)
            if isRebirthDirectAbilityProperty(nil, property.name) then
                goto __continue47
            end
            local effectiveLevel = getRebirthEffectivePropertyLevel(nil, property.name, property.level, playerInfo and playerInfo.rebirth)
            if effectiveLevel <= 0 then
                goto __continue47
            end
            effectiveProperties:set(property.name, {steamId = steamId, name = property.name, level = effectiveLevel})
        end
        ::__continue47::
    end
    for propertyName in pairs(backendEffectiveLevels or ({})) do
        do
            if isRebirthDirectAbilityProperty(nil, propertyName) or effectiveProperties:has(propertyName) then
                goto __continue51
            end
            local effectiveLevel = getRebirthEffectivePropertyLevel(
                nil,
                propertyName,
                rawPropertyLevels:get(propertyName) or 0,
                playerInfo and playerInfo.rebirth
            )
            if effectiveLevel <= 0 then
                goto __continue51
            end
            effectiveProperties:set(propertyName, {steamId = steamId, name = propertyName, level = effectiveLevel})
        end
        ::__continue51::
    end
    local function grantDirectAbility(____, enabled, name, activationLevel, legacyActivationLevel)
        local level = 0
        if enabled == true then
            level = activationLevel
        elseif enabled == nil then
            local legacyEffectiveLevel = getRebirthEffectivePropertyLevel(
                nil,
                name,
                rawPropertyLevels:get(name) or 0,
                playerInfo and playerInfo.rebirth
            )
            if legacyEffectiveLevel >= legacyActivationLevel then
                level = legacyEffectiveLevel
            end
        end
        if level <= 0 then
            return
        end
        directAbilityPropertyNames:add(name)
        effectiveProperties:set(name, {steamId = steamId, name = name, level = level})
    end
    local ____temp_24
    if resolvedRebirth.count > 0 then
        local ____opt_20 = playerInfo and playerInfo.rebirth
        ____temp_24 = ____opt_20 and ____opt_20.abilities
    else
        ____temp_24 = nil
    end
    local rebirthAbilities = ____temp_24
    grantDirectAbility(
        nil,
        rebirthAbilities and rebirthAbilities.moveSpeedLimitBreak,
        "property_ignore_movespeed_limit",
        1,
        8
    )
    grantDirectAbility(
        nil,
        rebirthAbilities and rebirthAbilities.enemyCounter,
        "property_cannot_miss",
        8,
        8
    )
    grantDirectAbility(
        nil,
        rebirthAbilities and rebirthAbilities.flying,
        "property_flying",
        8,
        8
    )
    grantDirectAbility(
        nil,
        rebirthAbilities and rebirthAbilities.extraSlot,
        "property_can_use_backpack_items",
        16,
        16
    )
    if ____exports.Player.WHITELIST_STEAM_IDS:has(steamId) then
        directAbilityPropertyNames:add("property_cannot_miss")
        local current = effectiveProperties:get("property_cannot_miss")
        effectiveProperties:set(
            "property_cannot_miss",
            {
                steamId = steamId,
                name = "property_cannot_miss",
                level = math.max(current and current.level or 0, 8)
            }
        )
    end
    ApiClient:DebugLog((((("[Player] Applying rebirth count=" .. tostring(resolvedRebirth.count)) .. ", baseBonus=") .. tostring(resolvedRebirth.baseAttributeBonus)) .. ", effectiveMax=") .. tostring(resolvedRebirth.singleAttributeEffectiveMax))
    for ____, property in __TS__Iterator(effectiveProperties:values()) do
        ApiClient:DebugLog((("[Player] Applying property: " .. property.name) .. ", level: ") .. tostring(property.level))
        if directAbilityPropertyNames:has(property.name) then
            PropertyController:LevelupHeroProperty(hero, property, true)
        else
            PropertyController:LevelupHeroProperty(hero, property)
        end
    end
end
function Player.saveMemberToNetTable(self)
    PlayerHelper:ForEachPlayer(function(____, playerId)
        local steamId = PlayerResource:GetSteamAccountID(playerId)
        if ____exports.Player.WHITELIST_STEAM_IDS:has(steamId) then
            local whitelistMember = {steamId = steamId, enable = true, expireDateString = "2026-06-31", level = ____exports.MemberLevel.PREMIUM}
            ApiClient:DebugLog((("[Member] whitelist member steamId=" .. tostring(steamId)) .. ", level=") .. tostring(whitelistMember.level))
            CustomNetTables:SetTableValue(
                "member_table",
                tostring(steamId),
                whitelistMember
            )
            return
        end
        local member = __TS__ArrayFind(
            ____exports.Player.memberList,
            function(____, m) return m.steamId == steamId end
        )
        if member then
            ApiClient:DebugLog((((("[Member] backend member steamId=" .. tostring(steamId)) .. ", level=") .. tostring(member.level)) .. ", enable=") .. tostring(member.enable))
            CustomNetTables:SetTableValue(
                "member_table",
                tostring(steamId),
                member
            )
        else
            ApiClient:DebugLog("[Member] no backend member steamId=" .. tostring(steamId))
        end
    end)
end
function Player.savePointInfoToNetTable(self)
    PlayerHelper:ForEachPlayer(function(____, playerId)
        local steamId = PlayerResource:GetSteamAccountID(playerId)
        local steamIdPointInfoList = __TS__ArrayFilter(
            ____exports.Player.pointInfoList,
            function(____, p) return p.steamId == steamId end
        )
        if #steamIdPointInfoList > 0 then
            CustomNetTables:SetTableValue(
                "point_info",
                tostring(steamId),
                steamIdPointInfoList
            )
        end
    end)
end
function Player.savePlayerToNetTable(self)
    PlayerHelper:ForEachPlayer(function(____, playerId)
        local steamId = PlayerResource:GetSteamAccountID(playerId)
        local player = __TS__ArrayFind(
            ____exports.Player.playerList,
            function(____, p) return p.id == tostring(steamId) end
        )
        if player then
            local oldData = CustomNetTables:GetTableValue(
                "player_table",
                tostring(steamId)
            )
            local oldName = oldData and oldData.playerName
            if (player.playerName == nil or player.playerName == "") and oldName and oldName ~= "" then
                player.playerName = oldName
            end
            CustomNetTables:SetTableValue(
                "player_table",
                tostring(steamId),
                player
            )
        end
        PlayerTask:LoadPlayerTasksOnce(steamId)
        Showcase:LoadShowcaseOnce(steamId)
        ____exports.Player:LoadRookieGiftStatusOnce(steamId)
    end)
end
function Player.IsMemberStatic(self, steamId)
    if ____exports.Player.WHITELIST_STEAM_IDS:has(steamId) then
        return true
    end
    local member = __TS__ArrayFind(
        ____exports.Player.memberList,
        function(____, m) return m.steamId == steamId end
    )
    if member then
        return member.enable
    end
    return false
end
function Player.GetMemberLevel(self, steamId)
    if ____exports.Player.WHITELIST_STEAM_IDS:has(steamId) then
        return ____exports.MemberLevel.PREMIUM
    end
    local member = __TS__ArrayFind(
        ____exports.Player.memberList,
        function(____, m) return m.steamId == steamId end
    )
    if not member then
        return 0
    end
    if not member.enable then
        return 0
    end
    return member.level
end
function Player.GetSeasonLevel(self, steamId)
    local player = __TS__ArrayFind(
        ____exports.Player.playerList,
        function(____, p) return p.id == tostring(steamId) end
    )
    if player then
        return player.seasonLevel
    end
    return 0
end
function Player.GetRebirthCount(self, steamId)
    local player = __TS__ArrayFind(
        ____exports.Player.playerList,
        function(____, p) return p.id == tostring(steamId) end
    )
    return resolveRebirth(nil, player and player.rebirth).count
end
function Player.GetLotteryRefreshExtraCount(self, steamId)
    local config = __TS__ArrayFind(
        ____exports.Player.lotteryRefreshExtraList,
        function(____, item) return item.steamId == steamId end
    )
    return config and config.extraCount
end
function Player.prototype.onPlayerPropertyLevelup(self, event)
    local steamId = PlayerResource:GetSteamAccountID(event.PlayerID)
    local apiParameter = {
        method = HttpMethod.PUT,
        path = ____exports.Player.ADD_PLAYER_PROPERTY_URL,
        body = {steamId = steamId, name = event.name, level = event.level},
        silent = true,
        successFunc = self.PropertyLevelupSuccess,
        failureFunc = self.PropertyLevelupFailure
    }
    ApiClient:sendToBackupHost(apiParameter)
end
function Player.onPlayerPropertyApplyChanges(self, event)
    local steamId = PlayerResource:GetSteamAccountID(event.PlayerID)
    local changes = ____exports.Player:NormalizePropertyChanges(event.changes)
    if not steamId or steamId <= 0 or #changes == 0 then
        ____exports.Player:savePlayerToNetTable()
        return
    end
    if ____exports.Player.batchPlayerPropertyAvailable then
        ____exports.Player:ApplyPropertyChangesBatch(steamId, changes)
    else
        ____exports.Player:ApplyPropertyChangeQueue(steamId, changes, 0)
    end
end
function Player.NormalizePropertyChanges(self, rawChanges)
    local changes = {}
    if not rawChanges then
        return changes
    end
    for key in pairs(rawChanges) do
        do
            local change = rawChanges[key]
            if not change or not change.name then
                goto __continue103
            end
            local level = __TS__Number(change.level or 0)
            if level <= 0 then
                goto __continue103
            end
            changes[#changes + 1] = {name = change.name, level = level}
        end
        ::__continue103::
    end
    return changes
end
function Player.ApplyPropertyChangeQueue(self, steamId, changes, index, lastPlayer)
    if index >= #changes then
        if lastPlayer then
            ____exports.Player:UpsertPlayerData(lastPlayer)
        else
            ____exports.Player:savePlayerToNetTable()
        end
        return
    end
    local change = changes[index + 1]
    ApiClient:sendToBackupHost({
        method = HttpMethod.PUT,
        path = ____exports.Player.ADD_PLAYER_PROPERTY_URL,
        body = {
            steamId = steamId,
            name = change.name,
            level = __TS__Number(change.level or 0)
        },
        silent = true,
        successFunc = function(____, data)
            local player = (json.decode(data))
            ____exports.Player:ApplyPropertyChangeQueue(steamId, changes, index + 1, player)
        end,
        failureFunc = function(____, data)
            ApiClient:DebugLog((("[Player] ApplyPropertyChange failure " .. tostring(change.name)) .. ", data=") .. data)
            if lastPlayer then
                ____exports.Player:UpsertPlayerData(lastPlayer)
            else
                ____exports.Player:savePlayerToNetTable()
            end
        end
    })
end
function Player.ApplyPropertyChangesBatch(self, steamId, changes)
    ApiClient:sendToBackupHost({
        method = HttpMethod.PUT,
        path = ____exports.Player.BATCH_PLAYER_PROPERTY_URL,
        retryTimes = 1,
        timeoutSeconds = 3,
        body = {
            steamId = steamId,
            properties = __TS__ArrayMap(
                changes,
                function(____, change) return {
                    name = change.name,
                    level = __TS__Number(change.level or 0)
                } end
            )
        },
        silent = true,
        successFunc = function(____, data)
            ____exports.Player:UpsertPlayerData(____exports.Player:DecodePlayerResponse(data))
        end,
        failureFunc = function(____, data)
            ____exports.Player.batchPlayerPropertyAvailable = false
            ApiClient:DebugLog("[Player] ApplyPropertyChanges batch failed, fallback to single PUT, data=" .. data)
            ____exports.Player:ApplyPropertyChangeQueue(steamId, changes, 0)
        end
    })
end
function Player.DecodePlayerResponse(self, data)
    local decoded = (json.decode(data))
    return decoded.data or decoded
end
function Player.prototype.PropertyLevelupSuccess(self, data)
    local player = ____exports.Player:DecodePlayerResponse(data)
    ____exports.Player:UpsertPlayerData(player)
end
function Player.prototype.PropertyLevelupFailure(self, _data)
    ____exports.Player:savePlayerToNetTable()
end
function Player.prototype.onPlayerPropertyReset(self, event)
    local steamId = PlayerResource:GetSteamAccountID(event.PlayerID)
    local apiParameter = {
        method = HttpMethod.POST,
        path = ____exports.Player.RESET_PLAYER_PROPERTY_URL,
        body = {steamId = steamId, useMemberPoint = event.useMemberPoint},
        successFunc = self.PropertyResetSuccess,
        failureFunc = self.PropertyResetFailure
    }
    ApiClient:sendToBackupHost(apiParameter)
end
function Player.prototype.PropertyResetSuccess(self, data)
    ApiClient:DebugLog("[Player] Property Reset Success data " .. data)
    local player = (json.decode(data))
    PropertyController:RemoveAllPlayerProperty(__TS__Number(player.id))
    ____exports.Player:UpsertPlayerData(player)
end
function Player.prototype.PropertyResetFailure(self, data)
    ApiClient:DebugLog("[Player] Property Reset Failure data " .. data)
    ____exports.Player:savePlayerToNetTable()
end
function Player.LoadRookieGiftStatusOnce(self, steamId)
    if not steamId or steamId <= 0 or ____exports.Player.rookieGiftStatusRequestedSteamIds:has(steamId) or ____exports.Player.rookieGiftClaimedSteamIds:has(steamId) then
        return
    end
    ____exports.Player.rookieGiftStatusRequestedSteamIds:add(steamId)
    ____exports.Player:RefreshRookieGiftStatus(steamId)
end
function Player.RefreshRookieGiftStatus(self, steamId)
    ApiClient:sendToBackupHost({
        method = HttpMethod.GET,
        path = ("/player/" .. tostring(steamId)) .. ____exports.Player.ROOKIE_GIFT_STATUS_URL_SUFFIX,
        retryTimes = 1,
        timeoutSeconds = 5,
        silent = true,
        successFunc = function(____, data)
            local status = ____exports.Player:DecodeRookieGiftResponse(data)
            ____exports.Player:ApplyRookieGiftStatus(steamId, status)
        end,
        failureFunc = function(____, data)
            ApiClient:DebugLog((("[RookieGift] status failed steamId=" .. tostring(steamId)) .. ", data=") .. data)
        end
    })
end
function Player.ApplyRookieGiftStatus(self, steamId, status)
    local eligible = status.rookieGiftEligible == true or status.rookieGiftEligible == 1
    local claimed = status.rookieGiftClaimed == true or status.rookieGiftClaimed == 1
    if claimed then
        ____exports.Player.rookieGiftClaimedSteamIds:add(steamId)
        ____exports.Player:RemoveRookieGiftPointInfo(steamId)
        return
    end
    if not eligible then
        return
    end
    ____exports.Player:UpsertRookieGiftPointInfo(steamId)
end
function Player.UpsertRookieGiftPointInfo(self, steamId)
    local current = CustomNetTables:GetTableValue(
        "point_info",
        tostring(steamId)
    ) or ({})
    if __TS__ArraySome(
        current,
        function(____, item) return item.primaryAction == "rookie_gift_claim" end
    ) then
        return
    end
    local ____CustomNetTables_SetTableValue_43 = CustomNetTables.SetTableValue
    local ____tostring_result_42 = tostring(steamId)
    local ____array_41 = __TS__SparseArrayNew(unpack(current))
    __TS__SparseArrayPush(____array_41, {steamId = steamId, title = {cn = "新手礼包资格已获得<br>奖励：16000勇士积分、31天高级会员、1000会员积分、觉醒宝箱x3、白宝箱x10<br>请输入邀请人 SteamID 后领取，没有邀请人可填作者 116431158", en = "Rookie gift available<br>Rewards: 16000 battle points, 31 days premium membership, 1000 member points, 3 awakening boxes, 10 white boxes<br>Enter inviter SteamID to claim. If none, use 116431158"}, primaryAction = "rookie_gift_claim", primaryText = "领取"})
    ____CustomNetTables_SetTableValue_43(
        CustomNetTables,
        "point_info",
        ____tostring_result_42,
        {__TS__SparseArraySpread(____array_41)}
    )
end
function Player.RemoveRookieGiftPointInfo(self, steamId)
    local current = CustomNetTables:GetTableValue(
        "point_info",
        tostring(steamId)
    ) or ({})
    CustomNetTables:SetTableValue(
        "point_info",
        tostring(steamId),
        __TS__ArrayFilter(
            current,
            function(____, item) return item.primaryAction ~= "rookie_gift_claim" end
        )
    )
end
function Player.OnRookieGiftClaim(self, event)
    local playerId = event.PlayerID
    local steamId = PlayerResource:GetSteamAccountID(playerId)
    local inviterSteamId = __TS__Number(event.inviterSteamId or 0)
    if not steamId or steamId <= 0 then
        ____exports.Player:SendRookieGiftResult(playerId, false, "领取失败：无法识别玩家。")
        return
    end
    if not inviterSteamId or inviterSteamId <= 0 or not __TS__NumberIsFinite(inviterSteamId) then
        ____exports.Player:SendRookieGiftResult(playerId, false, "请输入正确的邀请人 SteamID。")
        return
    end
    if inviterSteamId == steamId then
        ____exports.Player:SendRookieGiftResult(playerId, false, "邀请人不能是自己。")
        return
    end
    print((("[RookieGift] claim start steamId=" .. tostring(steamId)) .. ", inviterSteamId=") .. tostring(inviterSteamId))
    ApiClient:sendToBackupHost({
        method = HttpMethod.POST,
        path = ("/player/" .. tostring(steamId)) .. ____exports.Player.ROOKIE_GIFT_CLAIM_URL_SUFFIX,
        body = {inviterSteamId = inviterSteamId},
        retryTimes = 1,
        timeoutSeconds = 8,
        silent = true,
        successFunc = function(____, data)
            print((("[RookieGift] claim success callback steamId=" .. tostring(steamId)) .. ", data=") .. data)
            local response = ____exports.Player:DecodeRookieGiftResponse(data)
            if response.code == 200 then
                ____exports.Player.rookieGiftClaimedSteamIds:add(steamId)
                ____exports.Player:RemoveRookieGiftPointInfo(steamId)
                ____exports.Player:SendRookieGiftResult(
                    playerId,
                    true,
                    ____exports.Player:GetRookieGiftSuccessMessage(response)
                )
                ____exports.Player:RefreshPlayerDataFromPropertyEndpoint(steamId)
                PlayerTask:RefreshPlayerTasks(steamId)
                Showcase:RefreshShowcase(steamId)
                return
            end
            ____exports.Player:SendRookieGiftResult(playerId, false, response.message or "新手礼包领取失败。")
        end,
        failureFunc = function(____, data)
            print((("[RookieGift] claim failure callback steamId=" .. tostring(steamId)) .. ", data=") .. data)
            local response = ____exports.Player:DecodeRookieGiftResponse(data)
            ____exports.Player:SendRookieGiftResult(playerId, false, response.message or "新手礼包领取失败。")
        end
    })
end
function Player.DecodeRookieGiftResponse(self, data)
    local decoded = (json.decode(data))
    if not decoded then
        return {}
    end
    local nested = decoded.data or ({})
    return __TS__ObjectAssign({}, decoded, nested)
end
function Player.RefreshPlayerDataFromPropertyEndpoint(self, steamId)
    ApiClient:sendToBackupHost({
        method = HttpMethod.PUT,
        path = ____exports.Player.BATCH_PLAYER_PROPERTY_URL,
        retryTimes = 1,
        timeoutSeconds = 5,
        body = {steamId = steamId, properties = {}},
        silent = true,
        successFunc = function(____, data)
            local player = ____exports.Player:DecodePlayerResponse(data)
            ____exports.Player:UpsertPlayerData(player)
            print((((((((((("[RookieGift] refreshed authoritative player steamId=" .. tostring(steamId)) .. ", seasonPointTotal=") .. tostring(player.seasonPointTotal)) .. ", seasonLevel=") .. tostring(player.seasonLevel)) .. ", memberPointTotal=") .. tostring(player.memberPointTotal)) .. ", memberLevel=") .. tostring(player.memberLevel)) .. ", useableLevel=") .. tostring(player.useableLevel))
        end,
        failureFunc = function(____, data)
            print((("[RookieGift] authoritative player refresh failed steamId=" .. tostring(steamId)) .. ", data=") .. data)
        end
    })
end
function Player.GetRookieGiftSuccessMessage(self, response)
    local seasonPoints = response.claimedSeasonPoints or 16000
    local memberDays = response.claimedMemberDays or 31
    local memberPoints = response.claimedMemberPoints or 1000
    local awakeningBoxes = response.claimedAwakeningBoxes or 3
    local whiteChests = response.claimedWhiteChests or 10
    return ((((((((("新手礼包领取成功：+" .. tostring(seasonPoints)) .. "勇士积分、+") .. tostring(memberPoints)) .. "会员积分、") .. tostring(memberDays)) .. "天高级会员、觉醒宝箱x") .. tostring(awakeningBoxes)) .. "、白宝箱x") .. tostring(whiteChests)) .. "。<br>积分可在左上角主页 - 进行永久的属性加点<br>觉醒宝箱可在左上角主页 - 觉醒 领取英雄定制觉醒技能"
end
function Player.SendRookieGiftResult(self, playerId, success, message)
    local player = PlayerResource:GetPlayer(playerId)
    if not player then
        return
    end
    CustomGameEventManager:Send_ServerToPlayer(player, "rookie_gift_result", {success = success and 1 or 0, message = message})
end
function Player.UpsertPlayerData(self, player)
    local index = __TS__ArrayFindIndex(
        ____exports.Player.playerList,
        function(____, p) return p.id == player.id end
    )
    if index > -1 then
        local previousPlayer = ____exports.Player.playerList[index + 1]
        local previousRebirth = previousPlayer.rebirth
        local ____opt_44 = player.rebirth
        local responseHasEffectiveLevels = (____opt_44 and ____opt_44.propertyEffectiveLevels) ~= nil
        if previousRebirth then
            local ____player_54 = player
            local ____player_rebirth_53 = player.rebirth
            local ____temp_52
            local ____previousRebirth_abilities_48 = previousRebirth.abilities
            if not ____previousRebirth_abilities_48 then
                local ____opt_46 = player.rebirth
                ____previousRebirth_abilities_48 = ____opt_46 and ____opt_46.abilities
            end
            if ____previousRebirth_abilities_48 then
                local ____previousRebirth_abilities_51 = previousRebirth.abilities
                local ____opt_49 = player.rebirth
                ____temp_52 = __TS__ObjectAssign({}, ____previousRebirth_abilities_51, ____opt_49 and ____opt_49.abilities)
            else
                ____temp_52 = nil
            end
            ____player_54.rebirth = __TS__ObjectAssign({}, previousRebirth, ____player_rebirth_53, {abilities = ____temp_52})
        end
        local hadNewPropertyContract = previousPlayer.propertyRawLevels ~= nil or (previousRebirth and previousRebirth.propertyEffectiveLevels) ~= nil
        if hadNewPropertyContract and player.propertyRawLevels == nil then
            player.propertyRawLevels = player.properties or ({})
        end
        if hadNewPropertyContract and not responseHasEffectiveLevels and player.rebirth and (previousRebirth and previousRebirth.propertyEffectiveLevels) then
            local rawLevels = __TS__New(Map)
            for ____, property in ipairs(player.propertyRawLevels or ({})) do
                rawLevels:set(property.name, property.level)
            end
            local refreshedEffectiveLevels = {}
            local rebirthWithoutEffectiveLevels = __TS__ObjectAssign({}, player.rebirth, {propertyEffectiveLevels = nil})
            for propertyName in pairs(previousRebirth.propertyEffectiveLevels) do
                refreshedEffectiveLevels[propertyName] = getRebirthEffectivePropertyLevel(
                    nil,
                    propertyName,
                    rawLevels:get(propertyName) or 0,
                    rebirthWithoutEffectiveLevels
                )
            end
            for ____, property in ipairs(player.propertyRawLevels or ({})) do
                do
                    if refreshedEffectiveLevels[property.name] ~= nil then
                        goto __continue163
                    end
                    refreshedEffectiveLevels[property.name] = getRebirthEffectivePropertyLevel(nil, property.name, property.level, rebirthWithoutEffectiveLevels)
                end
                ::__continue163::
            end
            player.rebirth.propertyEffectiveLevels = refreshedEffectiveLevels
        end
        ____exports.Player.playerList[index + 1] = player
    else
        local ____exports_Player_playerList_59 = ____exports.Player.playerList
        ____exports_Player_playerList_59[#____exports_Player_playerList_59 + 1] = player
    end
    local hero = PlayerHelper:FindHeroBySteeamAccountId(__TS__Number(player.id))
    if hero then
        ____exports.Player:SetPlayerProperty(hero)
    end
    local oldData = CustomNetTables:GetTableValue("player_table", player.id)
    local oldName = oldData and oldData.playerName
    if (player.playerName == nil or player.playerName == "") and oldName and oldName ~= "" then
        player.playerName = oldName
    end
    CustomNetTables:SetTableValue("player_table", player.id, player)
    PlayerTask:LoadPlayerTasksOnce(__TS__Number(player.id))
    Showcase:LoadShowcaseOnce(__TS__Number(player.id))
end
function Player.prototype.SendBindAbilityKey(self, event)
    local steamId = PlayerResource:GetSteamAccountID(event.PlayerID)
    local playerSetting = {
        isRememberAbilityKey = event.isRememberAbilityKey == 1,
        activeAbilityKey = event.activeAbilityKey,
        passiveAbilityKey = event.passiveAbilityKey,
        activeAbilityQuickCast = event.activeAbilityQuickCast == 1,
        passiveAbilityQuickCast = event.passiveAbilityQuickCast == 1,
        backpackWardEyeKey = event.backpackWardEyeKey or "",
        backpackItemKey1 = event.backpackItemKey1 or event.backpackWardEyeKey or "",
        backpackItemKey2 = event.backpackItemKey2 or "",
        backpackItemKey3 = event.backpackItemKey3 or ""
    }
    if GameRules.Option.extraPassiveAbilities then
        playerSetting.passiveAbilityKey2 = event.passiveAbilityKey2
        playerSetting.passiveAbilityQuickCast2 = event.passiveAbilityQuickCast2 == 1
    end
    ApiClient:sendToBackupHost({
        method = HttpMethod.PUT,
        path = ("/player/" .. tostring(steamId)) .. "/setting",
        body = playerSetting,
        successFunc = function(____, data)
            local playerSetting = (json.decode(data))
            local player = __TS__ArrayFind(
                ____exports.Player.playerList,
                function(____, p) return p.id == tostring(steamId) end
            )
            if player then
                player.playerSetting = playerSetting
            end
            ____exports.Player:savePlayerToNetTable()
        end
    })
end
function Player.prototype.OnBackpackItemCast(self, event)
    local hero = PlayerResource:GetSelectedHeroEntity(event.PlayerID)
    if not hero or not hero:IsRealHero() or not hero:IsAlive() then
        return
    end
    local position = Vector(event.x, event.y, event.z)
    local slot = event.slot >= 1 and event.slot <= 3 and event.slot + 5 or nil
    if slot == nil then
        return
    end
    local item = hero:GetItemInSlot(slot)
    if not item then
        return
    end
    if not item:IsCooldownReady() or not item:IsOwnersManaEnough() then
        return
    end
    local itemName = item:GetAbilityName()
    if not ____exports.Player:IsSupportedBackpackActiveItem(itemName) then
        if ____exports.Player:HasBackpackItemSlotAccess(hero) and ____exports.Player:TryCastAnyBackpackItem(hero, item, position, event.target) then
            return
        end
        return
    end
    if itemName ~= "item_glimmer_cape" and itemName ~= "item_smoke_of_deceit" and itemName ~= "item_dust" and not ____exports.Player:IsSupportedBackpackNoTargetItem(itemName) then
        local castRange = item:GetCastRange(
            hero:GetAbsOrigin(),
            hero
        )
        if castRange > 0 and (position - hero:GetAbsOrigin()):Length2D() > castRange then
            return
        end
    end
    if not ____exports.Player:CastBackpackActiveItem(hero, item, position) then
        return
    end
    if not ____exports.Player:IsBackpackCastResourceHandledByItem(itemName) then
        item:UseResources(true, false, false, true)
    end
    if item:GetAbilityName() == "item_smoke_of_deceit" or item:GetAbilityName() == "item_dust" then
        item:SpendCharge(0)
    end
end
function Player.HasBackpackItemSlotAccess(self, hero)
    local parts = {
        "property",
        "can",
        "use",
        "backpack",
        "items"
    }
    return hero:HasModifier(table.concat(parts, "_"))
end
function Player.TryCastAnyBackpackItem(self, hero, item, position, targetIndex)
    local behavior = item:GetBehavior()
    local playerId = hero:GetPlayerOwnerID()
    if ____exports.Player:IsAbilityBehavior(behavior, DOTA_ABILITY_BEHAVIOR_TOGGLE) then
        item:ToggleAbility()
        return true
    end
    if ____exports.Player:IsAbilityBehavior(behavior, DOTA_ABILITY_BEHAVIOR_UNIT_TARGET) or ____exports.Player:IsAbilityBehavior(behavior, DOTA_ABILITY_BEHAVIOR_OPTIONAL_UNIT_TARGET) then
        local target = ____exports.Player:GetBackpackCastTarget(targetIndex)
        if target then
            if not ____exports.Player:IsPositionInItemCastRange(
                hero,
                item,
                target:GetAbsOrigin()
            ) then
                return false
            end
            hero:CastAbilityOnTarget(target, item, playerId)
            return true
        end
        if not ____exports.Player:IsAbilityBehavior(behavior, DOTA_ABILITY_BEHAVIOR_OPTIONAL_UNIT_TARGET) then
            return false
        end
    end
    if ____exports.Player:IsAbilityBehavior(behavior, DOTA_ABILITY_BEHAVIOR_POINT) or ____exports.Player:IsAbilityBehavior(behavior, DOTA_ABILITY_BEHAVIOR_AOE) or ____exports.Player:IsAbilityBehavior(behavior, DOTA_ABILITY_BEHAVIOR_OPTIONAL_POINT) then
        if not ____exports.Player:IsPositionInItemCastRange(hero, item, position) then
            return false
        end
        hero:CastAbilityOnPosition(position, item, playerId)
        return true
    end
    if ____exports.Player:IsAbilityBehavior(behavior, DOTA_ABILITY_BEHAVIOR_NO_TARGET) or ____exports.Player:IsAbilityBehavior(behavior, DOTA_ABILITY_BEHAVIOR_IMMEDIATE) or ____exports.Player:IsAbilityBehavior(behavior, DOTA_ABILITY_BEHAVIOR_OPTIONAL_NO_TARGET) then
        hero:CastAbilityNoTarget(item, playerId)
        return true
    end
    return false
end
function Player.GetBackpackCastTarget(self, targetIndex)
    if not targetIndex or targetIndex <= 0 then
        return nil
    end
    return EntIndexToHScript(targetIndex)
end
function Player.IsPositionInItemCastRange(self, hero, item, position)
    local castRange = item:GetCastRange(
        hero:GetAbsOrigin(),
        hero
    )
    return castRange <= 0 or (position - hero:GetAbsOrigin()):Length2D() <= castRange
end
function Player.IsAbilityBehavior(self, abilityBehavior, behavior)
    return bit.band(abilityBehavior, behavior) == behavior
end
function Player.IsSupportedBackpackActiveItem(self, itemName)
    return __TS__New(Set, {
        "item_titanium_ward_eye",
        "item_zhuque_p",
        "item_glimmer_cape",
        "item_smoke_of_deceit",
        "item_dust",
        "item_qinglong_p",
        "item_xuanwu_p",
        "item_baihu_p",
        "item_tome_of_knowledge",
        "item_treasure_chest",
        "item_enchanted_mango",
        "item_tome_of_ability_reset",
        "item_tome_of_ability_replace",
        "item_tome_of_strength",
        "item_tome_of_agility",
        "item_tome_of_intelligence",
        "item_tome_of_luoshu",
        "item_wings_of_haste",
        "item_ultimate_scepter_2",
        "item_moon_shard_datadriven",
        "item_moon_shard_10x",
        "item_faerie_fire"
    }):has(itemName)
end
function Player.IsSupportedBackpackNoTargetItem(self, itemName)
    return __TS__New(Set, {
        "item_tome_of_knowledge",
        "item_treasure_chest",
        "item_enchanted_mango",
        "item_tome_of_ability_reset",
        "item_tome_of_ability_replace",
        "item_tome_of_strength",
        "item_tome_of_agility",
        "item_tome_of_intelligence",
        "item_tome_of_luoshu",
        "item_wings_of_haste",
        "item_ultimate_scepter_2",
        "item_moon_shard_datadriven",
        "item_moon_shard_10x",
        "item_faerie_fire"
    }):has(itemName)
end
function Player.IsBackpackCastResourceHandledByItem(self, itemName)
    return __TS__New(Set, {
        "item_tome_of_knowledge",
        "item_treasure_chest",
        "item_enchanted_mango",
        "item_tome_of_ability_reset",
        "item_tome_of_ability_replace",
        "item_tome_of_strength",
        "item_tome_of_agility",
        "item_tome_of_intelligence",
        "item_tome_of_luoshu",
        "item_wings_of_haste",
        "item_ultimate_scepter_2",
        "item_moon_shard_datadriven",
        "item_moon_shard_10x",
        "item_faerie_fire"
    }):has(itemName)
end
function Player.CastBackpackActiveItem(self, hero, item, position)
    local itemName = item:GetAbilityName()
    if itemName == "item_glimmer_cape" then
        return ____exports.Player:CastBackpackGlimmer(hero, item)
    end
    if itemName == "item_smoke_of_deceit" then
        return ____exports.Player:CastBackpackSmoke(hero, item)
    end
    if itemName == "item_dust" then
        return ____exports.Player:CastBackpackDust(hero, item)
    end
    if itemName == "item_tome_of_knowledge" then
        return ____exports.Player:CastBackpackTomeOfKnowledge(hero, item)
    end
    if itemName == "item_enchanted_mango" then
        return ____exports.Player:CastBackpackMango(hero, item)
    end
    if itemName == "item_wings_of_haste" then
        return ____exports.Player:CastBackpackWingsOfHaste(hero, item)
    end
    if itemName == "item_ultimate_scepter_2" then
        return ____exports.Player:CastBackpackUltimateScepter2(hero, item)
    end
    if itemName == "item_moon_shard_datadriven" then
        return ____exports.Player:CastBackpackMoonShard(hero, item, 1)
    end
    if itemName == "item_moon_shard_10x" then
        return ____exports.Player:CastBackpackMoonShard(hero, item, 10)
    end
    if itemName == "item_faerie_fire" then
        return ____exports.Player:CastBackpackFaerieFire(hero, item)
    end
    hero:SetCursorCastTarget(nil)
    hero:SetCursorTargetingNothing(true)
    hero:SetCursorPosition(position)
    item:OnSpellStart()
    return true
end
function Player.CastBackpackGlimmer(self, hero, item)
    local duration = item:GetSpecialValueFor("duration") or 5
    hero:EmitSound("Item.GlimmerCape.Activate")
    hero:AddNewModifier(
        hero,
        item,
        "modifier_item_glimmer_cape_fade",
        {
            duration = duration,
            active_movement_speed = item:GetSpecialValueFor("active_movement_speed") or 60,
            bonus_magical_armor = item:GetSpecialValueFor("bonus_magical_armor") or 35,
            barrier_block = item:GetSpecialValueFor("barrier_block") or 600
        }
    )
    return true
end
function Player.CastBackpackSmoke(self, hero, item)
    hero:EmitSound("Item.SmokeOfDeceit.Activate")
    hero:AddNewModifier(
        hero,
        item,
        "modifier_smoke_of_deceit",
        {
            duration = item:GetSpecialValueFor("duration") or 45,
            bonus_movement_speed = item:GetSpecialValueFor("bonus_movement_speed") or 15,
            visibility_radius = item:GetSpecialValueFor("visibility_radius") or 900,
            secondary_application_radius = item:GetSpecialValueFor("secondary_application_radius") or 1200
        }
    )
    return true
end
function Player.CastBackpackDust(self, hero, item)
    local radius = item:GetSpecialValueFor("radius") or 1050
    local duration = item:GetSpecialValueFor("duration") or 12
    hero:EmitSound("DOTA_Item.DustOfAppearance.Activate")
    local enemies = FindUnitsInRadius(
        hero:GetTeamNumber(),
        hero:GetAbsOrigin(),
        nil,
        radius,
        DOTA_UNIT_TARGET_TEAM_ENEMY,
        bit.bor(DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_BASIC),
        DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES,
        FIND_ANY_ORDER,
        false
    )
    for ____, enemy in ipairs(enemies) do
        enemy:AddNewModifier(hero, item, "modifier_item_dustofappearance", {duration = duration})
    end
    return true
end
function Player.CastBackpackTomeOfKnowledge(self, hero, item)
    local xp = item:GetSpecialValueFor("xp_per_use")
    if xp <= 0 then
        return false
    end
    hero:AddExperience(xp, DOTA_ModifyXP_TomeOfKnowledge, false, true)
    hero:EmitSound("Item.TomeOfKnowledge")
    item:SpendCharge(1)
    return true
end
function Player.CastBackpackMango(self, hero, item)
    local mana = item:GetSpecialValueFor("replenish_amount")
    if mana <= 0 then
        return false
    end
    hero:GiveMana(mana)
    hero:EmitSound("DOTA_Item.Mango.Activate")
    item:SpendCharge(1)
    return true
end
function Player.CastBackpackWingsOfHaste(self, hero, item)
    local modifierName = "modifier_item_wings_of_haste_consumed"
    if hero:HasModifier(modifierName) then
        return false
    end
    item:ApplyDataDrivenModifier(hero, hero, modifierName, {})
    hero:EmitSound("Hero_Alchemist.Scepter.Cast")
    UTIL_RemoveImmediate(item)
    return true
end
function Player.CastBackpackUltimateScepter2(self, hero, item)
    local modifierName = "modifier_item_ultimate_scepter_2_consumed"
    if hero:HasModifier(modifierName) then
        return false
    end
    if hero:HasModifier("modifier_item_ultimate_scepter") then
        hero:RemoveModifierByName("modifier_item_ultimate_scepter")
    end
    hero:AddNewModifier(hero, nil, "modifier_item_ultimate_scepter", {duration = -1})
    hero:AddNewModifier(hero, item, modifierName, {})
    hero:EmitSound("Hero_Alchemist.Scepter.Cast")
    UTIL_RemoveImmediate(item)
    return true
end
function Player.CastBackpackMoonShard(self, hero, item, stacks)
    local modifierName = "modifier_item_moon_shard_datadriven_consumed"
    local dataDrivenItem = item
    do
        local i = 0
        while i < stacks do
            dataDrivenItem:ApplyDataDrivenModifier(hero, hero, modifierName, {})
            local currentStacks = hero:GetModifierStackCount(modifierName, hero)
            hero:SetModifierStackCount(modifierName, hero, currentStacks + 1)
            i = i + 1
        end
    end
    hero:EmitSound("Item.MoonShard.Consume")
    item:SpendCharge(1)
    return true
end
function Player.CastBackpackFaerieFire(self, hero, item)
    local heal = item:GetSpecialValueFor("hp_restore")
    if heal <= 0 then
        return false
    end
    hero:Heal(heal, item)
    hero:EmitSound("DOTA_Item.FaerieSpark.Activate")
    item:SpendCharge(1)
    return true
end
function Player.PlaceWardEyePair(self, caster, castPosition, duration)
    local position = GetGroundPosition(castPosition, caster)
    local isHumanCaster = PlayerHelper:IsHumanPlayer(caster)
    local wardOwner = isHumanCaster and caster or nil
    local observerWard = CreateUnitByName(
        "npc_dota_observer_wards",
        position,
        true,
        wardOwner,
        wardOwner,
        caster:GetTeamNumber()
    )
    if isHumanCaster then
        observerWard:SetOwner(caster)
        observerWard:SetControllableByPlayer(
            caster:GetPlayerOwnerID(),
            true
        )
    end
    observerWard:SetContextThink(
        "ward_lifetime",
        function()
            if observerWard and not observerWard:IsNull() then
                observerWard:ForceKill(false)
            end
            return nil
        end,
        duration
    )
    observerWard:AddNewModifier(caster, nil, "modifier_item_buff_ward", {duration = duration})
    local sentryWard = CreateUnitByName(
        "npc_dota_sentry_wards",
        position + Vector(10, 10, 0),
        true,
        wardOwner,
        wardOwner,
        caster:GetTeamNumber()
    )
    if isHumanCaster then
        sentryWard:SetOwner(caster)
        sentryWard:SetControllableByPlayer(
            caster:GetPlayerOwnerID(),
            true
        )
    end
    sentryWard:SetContextThink(
        "ward_lifetime",
        function()
            if sentryWard and not sentryWard:IsNull() then
                sentryWard:ForceKill(false)
            end
            return nil
        end,
        duration
    )
    sentryWard:AddNewModifier(caster, nil, "modifier_item_buff_ward", {duration = duration})
    sentryWard:AddNewModifier(caster, nil, "modifier_item_ward_true_sight", {true_sight_range = 1050, duration = duration})
    caster:EmitSound("DOTA_Item.ObserverWard.Activate")
end
Player.ADD_PLAYER_PROPERTY_URL = "/player/property"
Player.BATCH_PLAYER_PROPERTY_URL = "/player/properties"
Player.RESET_PLAYER_PROPERTY_URL = "/player/property/reset"
Player.ROOKIE_GIFT_CLAIM_URL_SUFFIX = "/rookie-gift/claim"
Player.ROOKIE_GIFT_STATUS_URL_SUFFIX = "/property-panel"
Player.batchPlayerPropertyAvailable = true
Player.rookieGiftStatusRequestedSteamIds = __TS__New(Set)
Player.rookieGiftClaimedSteamIds = __TS__New(Set)
Player.WHITELIST_STEAM_IDS = __TS__New(Set, {
    177189240,
    436804590,
    295351477,
    180074451,
    92159660,
    370099556,
    162341200,
    883568310,
    198490822,
    152103416,
    135764651,
    1002784680
})
Player.GAO_WAN_STEAM_IDS = __TS__New(Set, {171404072, 335880293, 121373743, 256116833})
Player.SB_STEAM_IDS = __TS__New(Set, {171404072, 335880293, 121373743, 256116833})
Player.FW_STEAM_IDS = __TS__New(Set, {171404072, 335880293, 121373743, 256116833})
Player.memberList = {}
Player.playerList = {}
Player.pointInfoList = {}
Player.lotteryRefreshExtraList = {}
Player.playerCount = 0
Player.GOLD_CONSUMABLE_CONVERTER_ABILITY = "gold_consumable_converter"
Player.GOLD_CONSUMABLE_CONVERTER_MODIFIER = "modifier_gold_consumable_converter"
Player.GOLD_CONSUMABLE_CONVERTER_MODES = {{texture = "gold_consumable_converter_strength", label = "力量之书"}, {texture = "gold_consumable_converter_agility", label = "敏捷之书"}, {texture = "gold_consumable_converter_intelligence", label = "智力之书"}, {texture = "gold_consumable_converter_moon_shard", label = "真·银月之晶"}}
return ____exports
