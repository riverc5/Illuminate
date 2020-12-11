local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Knit = require(ReplicatedStorage.Knit)

local Roact = require(Knit.GetCore("Roact"))
local RoactRodux = require(Knit.GetCore("RoactRodux"))
local Otter = require(Knit.GetCore("Otter"))

local Constants = require(script.Parent.Parent.Constants)

local Blur = Roact.Component:extend("Blur")

function Blur:init()
    self.size, self.updateSize = Roact.createBinding(self.props.Size)
    self.sizeMotor = Otter.createSingleMotor(self.props.Size)
    self.sizeMotor:onStep(self.updateSize)
end

function Blur:render()
    return Roact.createElement("BlurEffect", {
        Size = self.size,
    })
end

function Blur:didUpdate()
    self.sizeMotor:setGoal(Otter.spring(self.props.Size, Constants.SPRING_CONFIG))
end

function Blur:willUnmount()
    self.sizeMotor:destroy()
end

local function mapStateToProps(state, props)
    return state.effects.Blur
end

return RoactRodux.connect(mapStateToProps)(Blur)