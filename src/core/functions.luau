--[[
    An example module for reusuable functions.
    Functions that you will use in most of your scripts.
]]

local Functions = {}

Functions.SecureService = newcclosure(function(service: string): Instance
    local gameRef = cloneref and cloneref(game) or game
    local success, result = pcall(function()
        return cloneref and cloneref(gameRef:GetService(service)) or gameRef:GetService(service)
    end)
    return success and result or error("Unable to get service: " .. service)
end)

function Functions.GetPlayer(): Player?
    local success, result = pcall(function()
        return Functions.SecureService("Players") :: Players
    end)
    return success and (result :: Players).LocalPlayer or nil
end

function Functions.GetCharacter(player: Player?): Model?
    local success, result = pcall(function()
        return player and player.Character or nil
    end)
    return success and result or nil
end

function Functions.GetHumanoid(player: Player?): Humanoid?
    local success, result = pcall(function()
        local character = Functions.GetCharacter(player)
        return character and character:FindFirstChildOfClass("Humanoid") or nil
    end)
    return success and result or nil
end

return Functions