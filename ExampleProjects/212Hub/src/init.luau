--!nocheck
--!nolint

local game = cloneref and cloneref(cloneref(game)) or game
local gPID = game.PlaceId

local files = {
    ["Clicking Simulator"] = {
        File = require("games/ClickingSimulator/init.luau"), 
        Places = {
            14400545236
        }
    },
    ["Racing Simulator"] = {
        File = require("games/RacingSimulator/init.luau"), 
        Places = {
            105483453326837
        }
    },
}

for gameName, data in pairs(files) do
    if data.Places then
        for _, placeId in ipairs(data.Places) do
            if placeId == gPID then
                print(gameName)
                data.File.init(gameName)
                return
            end
        end
    end
end