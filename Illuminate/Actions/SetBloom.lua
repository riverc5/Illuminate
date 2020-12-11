local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Knit = require(ReplicatedStorage.Knit)

local Rodux = require(Knit.GetCore("Rodux"))

local Types = require(script.Parent.Parent.Types)

return Rodux.makeActionCreator(script.Name, function(bloomData)
    assert(Types.BloomData(bloomData))

    return {
        Bloom = {
            Intensity = bloomData.Intensity,
            Size = bloomData.Size,
            Threshold = bloomData.Threshold,
        }
    }
end)