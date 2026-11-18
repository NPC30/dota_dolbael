local windySteamAccountID = Set {
136407523,
916506173,
}
local RenoSteamAccountID = Set {
116431158,
}
local TuziSteamAccountID = Set {
335880293,
}
local xianyuSteamAccountID = Set {
1194383041,
}
local mimihuaSteamAccountID = Set {
385130282,
}
local luoshuBuffSteamAccountID = Set {
136668998,
}
local lumaoSteamAccountID = Set {
128984820,
}
local bulangyaSteamAccountID = Set {
117417953,
}
local qiliuSteamAccountID = Set {
353885092,
}
local hunzhuoSteamAccountID = Set {
251171524,
}
local chashaobaoSteamAccountID = Set {
882465781,
}
local menglihuaSteamAccountID = Set {
907056028,
}
local dabuguoSteamAccountID = Set {
342049002,
}
local shapuSteamAccountID = Set {
208461180,
445619710,
}
local kfw6SteamAccountID = Set {
322271699,
}
local dalaogongjiSteamAccountID = Set {
1166147496,
}
local jiangcaiSteamAccountID = Set {
108208968,
}
local rwbySteamAccountID = Set {
156694017,
}
local sunSteamAccountID = Set {
138652140,
}
local cynSteamAccountID = Set {
107625818,
}
local adolphzeroSteamAccountID = Set {
153632407,
}
local j3e9SteamAccountID = Set {
887874899,
}
local xinSteamAccountID = Set {
171217775,
}
local qiannianSteamAccountID = Set {
120921523,
}
local feijiSteamAccountID = Set {
213346065,
}
local pnsSteamAccountID = Set {
129972639,
}
local taikongSteamAccountID = Set {
140769251,
}
local wonderpisSteamAccountID = Set {
121514138,
}
local xiayibingSteamAccountID = Set {
849959529,
}
local m5xwSteamAccountID = Set {
129797279,
}
local mingriSteamAccountID = Set {
295200117,
}
local liaoranSteamAccountID = Set {
141805019,
}
local laniSteamAccountID = Set {
112073229,
}
local li123SteamAccountID = Set {
193859368,
}
local yangqiSteamAccountID = Set {
338188516,
}
local kudoSteamAccountID = Set {
118324486,
}
local arrayZoneYourSteamAccountID = Set {
314643375,
}
local nmjbSteamAccountID = Set {
139073897,
}
local puck1609SteamAccountID = Set {
245559423,
}
local dky190SteamAccountID = Set {
1033313629,
}
local keleSteamAccountID = Set {
330994098,
}
local loset12SteamAccountID = Set {
150252080,
}
local chuyinSteamAccountID = Set {
908271686,
}
local sushiSteamAccountID = Set {
160996305,
}
local kdvhSteamAccountID = Set {
59388035,
}
local YYLSteamAccountID = Set {
1159610111,
}
local aoliaoSteamAccountID = Set {
115909929,
}
local vjesSteamAccountID = Set {
231445049,
}
local laughSteamAccountID = Set {
118184749,
}
local asproseSteamAccountID = Set {
292827485,
}
local xysSteamAccountID = Set {
195850772,
}
local yuliangSteamAccountID = Set {
99825061,
}
local weilanSteamAccountID = Set {
215738002,
}
local ekxnSteamAccountID = Set {
455689605,
}
local uh9gSteamAccountID = Set {
128131041,
}
local xibaibaiSteamAccountID = Set {
186715813,
}
local dacapoSteamAccountID = Set {
136373823,
}
local xingguangSteamAccountID = Set {
152852224,
}
local hjauinSteamAccountID = Set {
106354079,
}
local eygcSteamAccountID = Set {
424859328,
}
local eesamaSteamAccountID = Set {
135986270,
}
local banshengSteamAccountID = Set {
155769916,
}
local pipiluSteamAccountID = Set {
112829917,
}
local nemesisSteamAccountID = Set {
82525914,
}
function EnablePlayerModifier(hEntity)
local steamAccountID = PlayerResource:GetSteamAccountID(hEntity:GetPlayerOwnerID())
if windySteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_windy", "modifiers/player/modifier_player_windy", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_windy", {})
end
if RenoSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_reno", "modifiers/player/modifier_player_reno",
LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_reno", {})
end
if TuziSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_tuzi", "modifiers/player/modifier_player_tuzi",
LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_tuzi", {})
end
if xianyuSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_xianyu", "modifiers/player/modifier_player_xianyu", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_xianyu", {})
end
if mimihuaSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_mimihua", "modifiers/player/modifier_player_mimihua", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_mimihua", {})
end
if lumaoSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_lumao", "modifiers/player/modifier_player_lumao", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_lumao", {})
end
if bulangyaSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_bulangya", "modifiers/player/modifier_player_bulangya", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_bulangya", {})
end
if qiliuSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_76", "modifiers/player/modifier_player_76", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_76", {})
end
if hunzhuoSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_hunzhuo", "modifiers/player/modifier_player_hunzhuo", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_hunzhuo", {})
end
if chashaobaoSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_chashaobao", "modifiers/player/modifier_player_chashaobao",
LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_chashaobao", {})
end
if menglihuaSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_menglihua", "modifiers/player/modifier_player_menglihua",
LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_menglihua", {})
end
if shapuSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_shapu", "modifiers/player/modifier_player_shapu", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_shapu", {})
end
if kfw6SteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_kfw6", "modifiers/player/modifier_player_kfw6", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_kfw6", {})
end
if dalaogongjiSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_dalaogongji", "modifiers/player/modifier_player_dalaogongji",
LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_dalaogongji", {})
end
if jiangcaiSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_jiangcai", "modifiers/player/modifier_player_jiangcai", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_jiangcai", {})
end
if rwbySteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_rwby", "modifiers/player/modifier_player_rwby", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_rwby", {})
end
if sunSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_sun", "modifiers/player/modifier_player_sun", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_sun", {})
end
if cynSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_cyn1", "modifiers/player/modifier_player_cyn1", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_cyn1", {})
LinkLuaModifier("modifier_player_cyn2", "modifiers/player/modifier_player_cyn2", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_cyn2", {})
LinkLuaModifier("modifier_player_cyn3", "modifiers/player/modifier_player_cyn3", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_cyn3", {})
end
if adolphzeroSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_adolphzero", "modifiers/player/modifier_player_adolphzero",
LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_adolphzero", {})
end
if j3e9SteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_j3e9", "modifiers/player/modifier_player_j3e9", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_j3e9", {})
end
if xinSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_xin", "modifiers/player/modifier_player_xin", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_xin", {})
LinkLuaModifier("modifier_player_xin_2", "modifiers/player/modifier_player_xin_2", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_xin_2", {})
LinkLuaModifier("modifier_player_xin_3", "modifiers/player/modifier_player_xin_3", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_xin_3", {})
LinkLuaModifier("modifier_player_xin_4", "modifiers/player/modifier_player_xin_4", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_xin_4", {})
LinkLuaModifier("modifier_player_xin_5", "modifiers/player/modifier_player_xin_5", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_xin_5", {})
LinkLuaModifier("modifier_player_xin_6", "modifiers/player/modifier_player_xin_6", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_xin_6", {})
end
if qiannianSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_qiannian", "modifiers/player/modifier_player_qiannian", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_qiannian", {})
LinkLuaModifier("modifier_player_qiannian_2", "modifiers/player/modifier_player_qiannian_2",
LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_qiannian_2", {})
LinkLuaModifier("modifier_player_qiannian_3", "modifiers/player/modifier_player_qiannian_3",
LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_qiannian_3", {})
LinkLuaModifier("modifier_player_qiannian_4", "modifiers/player/modifier_player_qiannian_4",
LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_qiannian_4", {})
LinkLuaModifier("modifier_player_qiannian_5", "modifiers/player/modifier_player_qiannian_5",
LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_qiannian_5", {})
LinkLuaModifier("modifier_player_qiannian_6", "modifiers/player/modifier_player_qiannian_6",
LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_qiannian_6", {})
LinkLuaModifier("modifier_player_qiannian_7", "modifiers/player/modifier_player_qiannian_7",
LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_qiannian_7", {})
LinkLuaModifier("modifier_player_qiannian_8", "modifiers/player/modifier_player_qiannian_8",
LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_qiannian_8", {})
end
if feijiSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_feiji", "modifiers/player/modifier_player_feiji", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_feiji", {})
end
if pnsSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_pns", "modifiers/player/modifier_player_pns", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_pns", {})
end
if taikongSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_taikong", "modifiers/player/modifier_player_taikong", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_taikong", {})
end
if wonderpisSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_wonderpis", "modifiers/player/modifier_player_wonderpis",
LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_wonderpis", {})
end
if xiayibingSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_xiayibing", "modifiers/player/modifier_player_xiayibing",
LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_xiayibing", {})
end
if luoshuBuffSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_abyss", "modifiers/player/modifier_player_abyss", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_abyss", {})
LinkLuaModifier("modifier_player_luoshu", "modifiers/player/modifier_player_luoshu", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_luoshu", {})
LinkLuaModifier("modifier_player_luoshu_2", "modifiers/player/modifier_player_luoshu_2", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_luoshu_2", {})
end
if m5xwSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_m5xw", "modifiers/player/modifier_player_m5xw", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_m5xw", {})
end
if mingriSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_mingri", "modifiers/player/modifier_player_mingri", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_mingri", {})
end
if liaoranSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_liaoran", "modifiers/player/modifier_player_liaoran", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_liaoran", {})
end
if laniSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_lani", "modifiers/player/modifier_player_lani", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_lani", {})
end
if li123SteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_li123", "modifiers/player/modifier_player_li123", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_li123", {})
end
if yangqiSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_yangqi", "modifiers/player/modifier_player_yangqi", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_yangqi", {})
end
if kudoSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_kudo", "modifiers/player/modifier_player_kudo", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_kudo", {})
end
if arrayZoneYourSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_arrayzoneyour", "modifiers/player/modifier_player_arrayzoneyour",
LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_arrayzoneyour", {})
end
if nmjbSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_nmjb", "modifiers/player/modifier_player_nmjb", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_nmjb", {})
end
if puck1609SteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_puck1609", "modifiers/player/modifier_player_puck1609", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_puck1609", {})
end
if dky190SteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_dky190", "modifiers/player/modifier_player_dky190", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_dky190", {})
LinkLuaModifier("modifier_player_dky190_2", "modifiers/player/modifier_player_dky190_2", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_dky190_2", {})
LinkLuaModifier("modifier_player_dky190_3", "modifiers/player/modifier_player_dky190_3", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_dky190_3", {})
LinkLuaModifier("modifier_player_dky190_4", "modifiers/player/modifier_player_dky190_4", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_dky190_4", {})
LinkLuaModifier("modifier_player_dky190_5", "modifiers/player/modifier_player_dky190_5", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_dky190_5", {})
end
if keleSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_kele", "modifiers/player/modifier_player_kele", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_kele", {})
end
if loset12SteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_loset12", "modifiers/player/modifier_player_loset12", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_loset12", {})
LinkLuaModifier("modifier_player_loset12_2", "modifiers/player/modifier_player_loset12_2",
LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_loset12_2", {})
end
if chuyinSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_chuyin", "modifiers/player/modifier_player_chuyin", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_chuyin", {})
LinkLuaModifier("modifier_player_chuyin_2", "modifiers/player/modifier_player_chuyin_2", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_chuyin_2", {})
LinkLuaModifier("modifier_player_chuyin_3", "modifiers/player/modifier_player_chuyin_3", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_chuyin_3", {})
LinkLuaModifier("modifier_player_chuyin_4", "modifiers/player/modifier_player_chuyin_4", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_chuyin_4", {})
LinkLuaModifier("modifier_player_chuyin_5", "modifiers/player/modifier_player_chuyin_5", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_chuyin_5", {})
end
if sushiSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_sushi", "modifiers/player/modifier_player_sushi", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_sushi", {})
LinkLuaModifier("modifier_player_sushi_2", "modifiers/player/modifier_player_sushi_2", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_sushi_2", {})
LinkLuaModifier("modifier_player_sushi_3", "modifiers/player/modifier_player_sushi_3", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_sushi_3", {})
LinkLuaModifier("modifier_player_sushi_4", "modifiers/player/modifier_player_sushi_4", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_sushi_4", {})
end
if kdvhSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_kdvh_1", "modifiers/player/modifier_player_kdvh_1", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_kdvh_1", {})
LinkLuaModifier("modifier_player_kdvh_2", "modifiers/player/modifier_player_kdvh_2", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_kdvh_2", {})
LinkLuaModifier("modifier_player_kdvh_3", "modifiers/player/modifier_player_kdvh_3", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_kdvh_3", {})
end
if YYLSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_YYL", "modifiers/player/modifier_player_YYL", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_YYL", {})
end
if aoliaoSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_aoliao", "modifiers/player/modifier_player_aoliao", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_aoliao", {})
LinkLuaModifier("modifier_player_aoliao_2", "modifiers/player/modifier_player_aoliao_2", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_aoliao_2", {})
end
if vjesSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_vjes", "modifiers/player/modifier_player_vjes", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_vjes", {})
end
if laughSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_laugh", "modifiers/player/modifier_player_laugh", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_laugh", {})
LinkLuaModifier("modifier_player_laugh_1", "modifiers/player/modifier_player_laugh_1", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_laugh_1", {})
LinkLuaModifier("modifier_player_laugh_2", "modifiers/player/modifier_player_laugh_2", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_laugh_2", {})
LinkLuaModifier("modifier_player_laugh_3", "modifiers/player/modifier_player_laugh_3", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_laugh_3", {})
LinkLuaModifier("modifier_player_laugh_4", "modifiers/player/modifier_player_laugh_4", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_laugh_4", {})
LinkLuaModifier("modifier_player_laugh_5", "modifiers/player/modifier_player_laugh_5", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_laugh_5", {})
end
if asproseSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_asprose", "modifiers/player/modifier_player_asprose", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_asprose", {})
end
if xysSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_xys", "modifiers/player/modifier_player_xys", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_xys", {})
end
if yuliangSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_yuliang", "modifiers/player/modifier_player_yuliang", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_yuliang", {})
end
if weilanSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_weilan", "modifiers/player/modifier_player_weilan", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_weilan", {})
end
if ekxnSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_ekxn", "modifiers/player/modifier_player_ekxn", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_ekxn", {})
end
if uh9gSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_uh9g", "modifiers/player/modifier_player_uh9g", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_uh9g", {})
end
if xibaibaiSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_xibaibai", "modifiers/player/modifier_player_xibaibai", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_xibaibai", {})
end
if dacapoSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_dacapo", "modifiers/player/modifier_player_dacapo", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_dacapo", {})
end
if xingguangSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_xingguang", "modifiers/player/modifier_player_xingguang",
LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_xingguang", {})
end
if hjauinSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_hjauin", "modifiers/player/modifier_player_hjauin", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_hjauin", {})
end
if eygcSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_eygc", "modifiers/player/modifier_player_eygc", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_eygc", {})
end
if eesamaSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_eesama", "modifiers/player/modifier_player_eesama", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_eesama", {})
end
if banshengSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_bansheng_1", "modifiers/player/modifier_player_bansheng_1",
LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_bansheng_1", {})
LinkLuaModifier("modifier_player_bansheng_2", "modifiers/player/modifier_player_bansheng_2",
LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_bansheng_2", {})
LinkLuaModifier("modifier_player_bansheng_3", "modifiers/player/modifier_player_bansheng_3",
LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_bansheng_3", {})
end
if pipiluSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_pipilu", "modifiers/player/modifier_player_pipilu", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_pipilu", {})
end
if nemesisSteamAccountID[steamAccountID] then
LinkLuaModifier("modifier_player_nemesis", "modifiers/player/modifier_player_nemesis", LUA_MODIFIER_MOTION_NONE)
hEntity:AddNewModifier(hEntity, nil, "modifier_player_nemesis", {})
end
end
