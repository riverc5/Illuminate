local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Knit = require(ReplicatedStorage.Knit)

local Rodux = require(Knit.GetCore("Rodux"))

local Types = require(script.Parent.Parent.Types)

return Rodux.makeActionCreator(script.Name, function(depthOfFieldData)
    assert(Types.DepthOfFieldData(depthOfFieldData))
    
    return {
        DepthOfField = {
            FarIntensity = depthOfFieldData.FarIntensity,
            FocusDistance = depthOfFieldData.FocusDistance,
            InFocusRadius = depthOfFieldData.InFocusRadius,
            NearIntensity = depthOfFieldData.NearIntensity,
        }
    }
end)