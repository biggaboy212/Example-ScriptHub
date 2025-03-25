--!nocheck
--!nolint

local Files = {
    Universal = {
        Name = "Universal",
        Load = require("games/Universal/init.luau"),
    },

    {
        Name = "Blank Base",
        Load = require("games/BlankBase/init.luau"),
        Places = { -- List of PlaceId's
            1234567890,
            0987654321
        }
    }
}

-- Loop through Files and check if any Id in the Places table match the PlaceId of the current game
for _, Data in pairs(Files) do
    if Data.Places then
        for _, PlaceId in ipairs(Data.Places) do
            if PlaceId == game.PlaceId then
                return Data:Load()
            end
        end
    end
end

-- If no game was loaded, load the Universal script
return Files.Universal:Load()