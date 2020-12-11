local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Knit = require(ReplicatedStorage.Knit)

local Rodux = require(Knit.GetCore("Rodux"))

local Types = require(script.Parent.Parent.Types)

return Rodux.makeActionCreator(script.Name, function(blurData)
    assert(Types.BlurData(blurData))

    return {
        Blur = {
            Size = blurData.Size,
        }
    }
end)