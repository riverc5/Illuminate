local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Knit = require(ReplicatedStorage.Knit)

local Roact = require(Knit.GetCore("Roact"))
local RoactRodux = require(Knit.GetCore("RoactRodux"))
local Otter = require(Knit.GetCore("Otter"))

local Constants = require(script.Parent.Parent.Constants)

local DepthOfField = Roact.Component:extend("DepthOfField")

function DepthOfField:init()
    self.farIntensity, self.updateFarIntensity = Roact.createBinding(self.props.FarIntensity)
    self.farIntensityMotor = Otter.createSingleMotor(self.props.FarIntensity)
    self.farIntensityMotor:onStep(self.updateFarIntensity)

    self.focusDistance, self.updateFocusDistance = Roact.createBinding(self.props.FocusDistance)
    self.focusDistanceMotor = Otter.createSingleMotor(self.props.FocusDistance)
    self.focusDistanceMotor:onStep(self.updateFocusDistance)

    self.inFocusRadius, self.updateInFocusRadius = Roact.createBinding(self.props.InFocusRadius)
    self.inFocusRadiusMotor = Otter.createSingleMotor(self.props.InFocusRadius)
    self.inFocusRadiusMotor:onStep(self.updateInFocusRadius)

    self.nearIntensity, self.updateNearIntensity = Roact.createBinding(self.props.NearIntensity)
    self.nearIntensityMotor = Otter.createSingleMotor(self.props.NearIntensity)
    self.nearIntensityMotor:onStep(self.updateNearIntensity)
end

function DepthOfField:render()
    return Roact.createElement("DepthOfFieldEffect", {
        FarIntensity = self.farIntensity,
        FocusDistance = self.focusDistance,
        InFocusRadius = self.inFocusRadius,
        NearIntensity = self.nearIntensity,
    })
end

function DepthOfField:didUpdate()
    self.farIntensityMotor:setGoal(Otter.spring(self.props.FarIntensity, Constants.SPRING_CONFIG))
    self.focusDistanceMotor:setGoal(Otter.spring(self.props.FocusDistance, Constants.SPRING_CONFIG))
    self.inFocusRadiusMotor:setGoal(Otter.spring(self.props.InFocusRadius, Constants.SPRING_CONFIG))
    self.nearIntensityMotor:setGoal(Otter.spring(self.props.NearIntensity, Constants.SPRING_CONFIG))
end

function DepthOfField:willUnmount()
    self.farIntensityMotor:destroy()
    self.focusDistanceMotor:destroy()
    self.inFocusRadiusMotor:destroy()
    self.nearIntensityMotor:destroy()
end

local function mapStateToProps(state, props)
    return state.effects.DepthOfField
end

return RoactRodux.connect(mapStateToProps)(DepthOfField)