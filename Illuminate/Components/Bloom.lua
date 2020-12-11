local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Knit = require(ReplicatedStorage.Knit)

local Roact = require(Knit.GetCore("Roact"))
local RoactRodux = require(Knit.GetCore("RoactRodux"))
local Otter = require(Knit.GetCore("Otter"))

local Constants = require(script.Parent.Parent.Constants)

local Bloom = Roact.Component:extend("Bloom")

function Bloom:init()
    self.intensity, self.updateIntensity = Roact.createBinding(self.props.Intensity)
    self.intensityMotor = Otter.createSingleMotor(self.props.Intensity)
    self.intensityMotor:onStep(self.updateIntensity)

    self.size, self.updateSize = Roact.createBinding(self.props.Size)
    self.sizeMotor = Otter.createSingleMotor(self.props.Size)
    self.sizeMotor:onStep(self.updateSize)

    self.threshold, self.updateThreshold = Roact.createBinding(self.props.Threshold)
    self.thresholdMotor = Otter.createSingleMotor(self.props.Threshold)
    self.thresholdMotor:onStep(self.updateThreshold)
end

function Bloom:render()
    return Roact.createElement("BloomEffect", {
        Intensity = self.intensity,
        Size = self.size,
        Threshold = self.threshold,
    })
end

function Bloom:didUpdate()
    self.intensityMotor:setGoal(Otter.spring(self.props.Intensity, Constants.SPRING_CONFIG))
    self.sizeMotor:setGoal(Otter.spring(self.props.Size, Constants.SPRING_CONFIG))
    self.thresholdMotor:setGoal(Otter.spring(self.props.Threshold, Constants.SPRING_CONFIG))
end

function Bloom:willUnmount()
    self.intensityMotor:destroy()
    self.sizeMotor:destroy()
    self.thresholdMotor:destroy()
end

local function mapStateToProps(state, props)
    return state.effects.Bloom
end

return RoactRodux.connect(mapStateToProps)(Bloom)