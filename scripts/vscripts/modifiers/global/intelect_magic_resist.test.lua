local ____exports = {}
local ____intellect_2Dmagic_2Dresist_2Dcalculator = require("modifiers.global.intellect-magic-resist-calculator")
local calculateIntellectMagicResist = ____intellect_2Dmagic_2Dresist_2Dcalculator.calculateIntellectMagicResist
describe(
nil,
"calculateIntellectMagicResist",
function()
describe(
nil,
"第一段：0-500智力",
function()
it:each({{0, 0, "0智力的魔抗"}, {100, 5, "100智力的魔抗 (5%)"}, {300, 15, "300智力的魔抗 (15%)"}, {500, 25, "500智力的魔抗（边界值）(25%)"}})(
nil,
"应该正确计算%s",
function(____, intellect, expected)
local result = calculateIntellectMagicResist(nil, intellect)
expect(nil, result):toBe(expected)
end
)
end
)
describe(
nil,
"第二段：500-1000智力",
function()
it:each({{501, 25.025, "501智力的魔抗（边界值+1）"}, {600, 27.5, "600智力的魔抗 (27.5%)"}, {750, 31.25, "750智力的魔抗 (31.25%)"}, {1000, 37.5, "1000智力的魔抗（边界值）(37.5%)"}})(
nil,
"应该正确计算%s",
function(____, intellect, expected)
local result = calculateIntellectMagicResist(nil, intellect)
if intellect == 501 then
expect(nil, result):toBeCloseTo(expected, 2)
else
expect(nil, result):toBe(expected)
end
end
)
end
)
describe(
nil,
"第三段：1000+智力",
function()
it:each({
{1001, 37.51, "1001智力的魔抗（边界值+1）"},
{1500, 42.5, "1500智力的魔抗 (42.5%)"},
{2000, 47.5, "2000智力的魔抗 (47.5%)"},
{3000, 57.5, "3000智力的魔抗 (57.5%)"},
{4000, 67.5, "4000智力的魔抗 (67.5%)"},
{5000, 77.5, "5000智力的魔抗（超过100%上限）(77.5%)"}
})(
nil,
"应该正确计算%s",
function(____, intellect, expected)
local result = calculateIntellectMagicResist(nil, intellect)
if intellect == 1001 then
expect(nil, result):toBeCloseTo(expected, 2)
else
expect(nil, result):toBe(expected)
end
end
)
end
)
describe(
nil,
"边界值测试",
function()
it:each({{500, 501, "500-501边界"}, {1000, 1001, "1000-1001边界"}})(
nil,
"应该在%s处连续",
function(____, lower, upper)
local atLower = calculateIntellectMagicResist(nil, lower)
local atUpper = calculateIntellectMagicResist(nil, upper)
expect(nil, atUpper):toBeGreaterThan(atLower)
end
)
end
)
describe(
nil,
"收益递减验证",
function()
it(
nil,
"应该验证低智力时收益高于高智力时",
function()
local first100 = calculateIntellectMagicResist(nil, 100) - calculateIntellectMagicResist(nil, 0)
local from1000to1100 = calculateIntellectMagicResist(nil, 1100) - calculateIntellectMagicResist(nil, 1000)
expect(nil, first100 / 100):toBeGreaterThan(from1000to1100 / 100)
end
)
it(
nil,
"应该验证每段收益递减",
function()
local segment1Rate = 0.05
local segment2Rate = 0.025
local segment3Rate = 0.01
expect(nil, segment1Rate):toBeGreaterThan(segment2Rate)
expect(nil, segment2Rate):toBeGreaterThan(segment3Rate)
end
)
it(
nil,
"应该验证5000智力时超过100%魔抗上限",
function()
local baseMagicResist = 25
local intellectMagicResist = calculateIntellectMagicResist(nil, 5000)
local totalMagicResist = baseMagicResist + intellectMagicResist
expect(nil, intellectMagicResist):toBe(77.5)
expect(nil, totalMagicResist):toBeGreaterThan(100)
end
)
end
)
end
)
return ____exports
