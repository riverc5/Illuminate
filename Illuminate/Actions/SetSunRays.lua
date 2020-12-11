local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Knit = require(ReplicatedStorage.Knit)

local Rodux = require(Knit.GetCore("Rodux"))

local Types = require(script.Parent.Parent.Types)

return Rodux.makeActionCreator(script.Name, function(sunRaysData)
    assert(Types.SunRaysData(sunRaysData))
    
    return {
        SunRays ={
            Intensity = sunRaysData.Intensity,
            Spread = sunRaysData.Spread,
        }
    }
end)