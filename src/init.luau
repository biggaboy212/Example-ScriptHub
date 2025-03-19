--!nocheck
--!nolint

local files = {
    ["Universal"] = {
        File = require("games/Universal/init.luau"),
        Places = {}
    },
    ["Blank Base"] = {
        File = require("games/BlankBase/init.luau"), 
        Places = { -- Accepts PlaceId's
            1234567890,
            0987654321
        }
    }
}

for gameName, data in pairs(files) do
    if data.Places then
        for _, placeId in ipairs(data.Places) do
            if placeId == game.PlaceId then
                data.File(gameName)
                return
            end
        end
    end
end

files.Universal.File("Universal")