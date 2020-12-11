local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Knit = require(ReplicatedStorage.Knit)

local Roact = require(Knit.GetCore("Roact"))
local RoactRodux = require(Knit.GetCore("RoactRodux"))
local Otter = require(Knit.GetCore("Otter"))

local Constants = require(script.Parent.Parent.Constants)

local SunRays = Roact.Component:extend("SunRays")

function SunRays:init()
    self.intensity, self.updateIntensity = Roact.createBinding(self.props.Intensity)
    self.intensityMotor = Otter.createSingleMotor(self.props.Intensity)
    self.intensityMotor:onStep(self.updateIntensity)

    self.spread, self.updateSpread = Roact.createBinding(self.props.Spread)
    self.spreadMotor = Otter.createSingleMotor(self.props.Spread)
    self.spreadMotor:onStep(self.updateSpread)
end

function SunRays:render()
    return Roact.createElement("SunRaysEffect", {
        Intensity = self.props.Intensity,
        Spread = self.props.Spread,
    })
end

function SunRays:didUpdate()
    self.intensityMotor:setGoal(Otter.spring(self.props.Intensity, Constants.SPRING_CONFIG))
    self.spreadMotor:setGoal(Otter.spring(self.props.Spread, Constants.SPRING_CONFIG))
end

function SunRays:willUnmount()
    self.intensityMotor:destroy()
    self.spreadMotor:destroy()
end

local function mapStateToProps(state, props)
    return state.effects.SunRays
end

return RoactRodux.connect(mapStateToProps)(SunRays)