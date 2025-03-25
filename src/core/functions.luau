--[[
    An example module for reusuable functions.
]]

local Functions = {}

Functions.SecureService = function(service: string): ServiceProvider
    local _game = cloneref and cloneref(game) or game
    local success, result = pcall(function()
        return cloneref and cloneref(_game:GetService(service)) or _game:GetService(service)
    end)
    return success and result or nil
end; Functions.SecureService = newcclosure and newcclosure(Functions.SecureService) or Functions.SecureService

function Functions.GetPlayer(): Player?
    local success, result = pcall(function()
        return Functions.SecureService("Players") :: ServiceProvider
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