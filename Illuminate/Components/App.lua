--[[
	Entry point into Illuminate. Bootstraps the StoreProvider and any other
	context we want to supply.
]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Knit = require(ReplicatedStorage.Knit)

local Roact = require(Knit.GetCore("Roact"))
local RoactRodux = require(Knit.GetCore("RoactRodux"))

local Bloom = require(script.Parent.Bloom)
local Blur = require(script.Parent.Blur)
local ColorCorrection = require(script.Parent.ColorCorrection)
local DepthOfField = require(script.Parent.DepthOfField)
local SunRays = require(script.Parent.SunRays)

local App = Roact.Component:extend("App")

function App:render()
    return Roact.createElement(RoactRodux.StoreProvider, {
        store = self.props.store,
    }, {
        Bloom = Roact.createElement(Bloom),
        Blur = Roact.createElement(Blur),
        ColorCorrection = Roact.createElement(ColorCorrection),
        DepthOfField = Roact.createElement(DepthOfField),
        SunRays = Roact.createElement(SunRays),
    })
end

return App