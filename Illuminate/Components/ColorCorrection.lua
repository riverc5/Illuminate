local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Knit = require(ReplicatedStorage.Knit)

local Roact = require(Knit.GetCore("Roact"))
local RoactRodux = require(Knit.GetCore("RoactRodux"))
local Otter = require(Knit.GetCore("Otter"))

local Constants = require(script.Parent.Parent.Constants)

local ColorCorrection = Roact.Component:extend("ColorCorrection")

function ColorCorrection:init()
    self.brightness, self.updateBrightness = Roact.createBinding(self.props.Brightness)
    self.brightnessMotor = Otter.createSingleMotor(self.props.Brightness)
    self.brightnessMotor:onStep(self.updateBrightness)

    self.contrast, self.updateContrast = Roact.createBinding(self.props.Contrast)
    self.contrastMotor = Otter.createSingleMotor(self.props.Contrast)
    self.contrastMotor:onStep(self.updateContrast)

    self.saturation, self.updateSaturation = Roact.createBinding(self.props.Saturation)
    self.saturationMotor = Otter.createSingleMotor(self.props.Saturation)
    self.saturationMotor:onStep(self.updateSaturation)

    self.tintColorR, self.updateTintColorR = Roact.createBinding(self.props.TintColor.R)
    self.tintColorRMotor = Otter.createSingleMotor(self.props.TintColor.R)
    self.tintColorRMotor:onStep(self.updateTintColorR)

    self.tintColorG, self.updateTintColorG = Roact.createBinding(self.props.TintColor.G)
    self.tintColorGMotor = Otter.createSingleMotor(self.props.TintColor.G)
    self.tintColorGMotor:onStep(self.updateTintColorG)

    self.tintColorB, self.updateTintColorB = Roact.createBinding(self.props.TintColor.B)
    self.tintColorBMotor = Otter.createSingleMotor(self.props.TintColor.B)
    self.tintColorBMotor:onStep(self.updateTintColorB)

    self.tintColor = Roact.joinBindings({self.tintColorR, self.tintColorG, self.tintColorB}):map(function(colors)
        return Color3.new(colors[1], colors[2], colors[3])
    end)
end

function ColorCorrection:render()
    return Roact.createElement("ColorCorrectionEffect", {
        Brightness = self.brightness,
        Contrast = self.contrast,
        Saturation = self.saturation,
        TintColor = self.tintColor,
    })
end

function ColorCorrection:didUpdate()
    self.brightnessMotor:setGoal(Otter.spring(self.props.Brightness, Constants.SPRING_CONFIG))
    self.contrastMotor:setGoal(Otter.spring(self.props.Contrast, Constants.SPRING_CONFIG))
    self.saturationMotor:setGoal(Otter.spring(self.props.Saturation, Constants.SPRING_CONFIG))
    self.tintColorRMotor:setGoal(Otter.spring(self.props.TintColor.R, Constants.SPRING_CONFIG))
    self.tintColorGMotor:setGoal(Otter.spring(self.props.TintColor.G, Constants.SPRING_CONFIG))
    self.tintColorBMotor:setGoal(Otter.spring(self.props.TintColor.B, Constants.SPRING_CONFIG))
end

function ColorCorrection:willUnmount()
    self.brightnessMotor:destroy()
    self.contrastMotor:destroy()
    self.saturationMotor:destroy()
    self.tintColorRMotor:destroy()
    self.tintColorGMotor:destroy()
    self.tintColorBMotor:destroy()
end

local function mapStateToProps(state, props)
    return state.effects.ColorCorrection
end

return RoactRodux.connect(mapStateToProps)(ColorCorrection)