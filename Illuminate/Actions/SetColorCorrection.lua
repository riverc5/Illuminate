local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Knit = require(ReplicatedStorage.Knit)

local Rodux = require(Knit.GetCore("Rodux"))

local Types = require(script.Parent.Parent.Types)

return Rodux.makeActionCreator(script.Name, function(colorCorrectionData)
    assert(Types.ColorCorrectionData(colorCorrectionData))
    
    return {
        ColorCorrection = {
            Brightness = colorCorrectionData.Brightness,
            Contrast = colorCorrectionData.Contrast,
            Saturation = colorCorrectionData.Saturation,
            TintColor = colorCorrectionData.TintColor,
        }
    }
end)