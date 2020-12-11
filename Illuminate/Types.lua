local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Knit = require(ReplicatedStorage.Knit)

local t = require(Knit.GetCore("t"))

local Types = {}

Types.BlurData = t.strictInterface({
    type = t.string,
    Size = t.optional(t.number),
})

Types.BloomData = t.strictInterface({
    type = t.string,
    Intensity = t.optional(t.number),
    Size = t.optional(t.number),
    Threshold = t.optional(t.numberConstrainedExclusive(-0.1, math.huge)),
})

Types.ColorCorrectionData = t.strictInterface({
    type = t.string,
    Brightness = t.optional(t.number),
    Contrast = t.optional(t.number),
    Saturation = t.optional(t.number),
    TintColor = t.optional(t.Color3),
})

Types.DepthOfFieldData = t.strictInterface({
    type = t.string,
    FarIntensity = t.optional(t.number),
    FocusDistance = t.optional(t.number),
    InFocusRadius = t.optional(t.number),
    NearIntensity = t.optional(t.number),
})

Types.SunRaysData = t.strictInterface({
    type = t.string,
    Intensity = t.optional(t.number),
    Spread = t.optional(t.number),
})

return Types