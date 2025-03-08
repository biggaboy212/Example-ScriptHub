--!nocheck
--!nolint

local game = cloneref(game)
local gPID = game.PlaceId

local files = {
    ["Universal"] = {
        File = require("games/Universal/init.luau"),
        Places = {}
    },
    ["Example Game"] = {
        File = require("games/ExampleGame/init.luau"), 
        Places = {
            123456789
        }
    },
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