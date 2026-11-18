local ____exports = {}
function ____exports.calculateIntellectMagicResist(self, intellect)
if intellect <= 500 then
return intellect * 0.05
elseif intellect <= 1000 then
return 25 + (intellect - 500) * 0.025
else
return 37.5 + (intellect - 1000) * 0.01
end
end
return ____exports
