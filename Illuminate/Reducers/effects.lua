local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Knit = require(ReplicatedStorage.Knit)

local Rodux = require(Knit.GetCore("Rodux"))
local Cryo = require(Knit.GetCore("Cryo"))

local initialState = require(script.Parent.Parent.InitialState)

local SetBlur = require(script.Parent.Parent.Actions.SetBlur)
local SetBloom = require(script.Parent.Parent.Actions.SetBloom)
local SetColorCorrection = require(script.Parent.Parent.Actions.SetColorCorrection)
local SetDepthOfField = require(script.Parent.Parent.Actions.SetDepthOfField)
local SetSunRays = require(script.Parent.Parent.Actions.SetSunRays)

local effects = Rodux.createReducer(initialState,{
    [SetBlur.name] = function(state, action)
        state = state or initialState
        return Cryo.Dictionary.join(state, action)
    end,
    
    [SetBloom.name] = function(state, action)
        state = state or initialState
        return Cryo.Dictionary.join(state, action)
    end,
    
    [SetColorCorrection.name] = function(state, action)
        state = state or initialState
        
        return Cryo.Dictionary.join(state, action)
    end,
    
    [SetDepthOfField.name] = function(state, action)
        state = state or initialState
        
        return Cryo.Dictionary.join(state, action)
    end,
    
    [SetSunRays.name] = function(state, action)
        state = state or initialState
        
        return Cryo.Dictionary.join(state, action)
    end,
})

return effects