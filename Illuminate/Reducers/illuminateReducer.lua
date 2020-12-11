local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Knit = require(ReplicatedStorage.Knit)

local Rodux = require(Knit.GetCore("Rodux"))

local effects = require(script.Parent.effects)

local illuminateReducer = Rodux.combineReducers({
    effects = effects,
})

return illuminateReducer