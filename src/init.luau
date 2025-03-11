--!nocheck
--!nolint

local game = cloneref and cloneref(game) or game
local gPID = game.PlaceId

local files = {
    ["Universal"] = {
        File = require("games/Universal/init.luau"),
        Places = {}
    },
    ["Blank Base"] = {
        File = require("games/BlankBase/init.luau"), 
        Places = {
            1234567890, -- List of PlaceId's
            0987654321
        }
    }
}

for gameName, data in pairs(files) do
    if data.Places then
        for _, placeId in ipairs(data.Places) do
            if placeId == gPID then
                data.File.init(gameName)
                return
            end
        end
    end
end

files.Universal.File.init("Universal")