--!nocheck
--!nolint

-- This is your loader, it's set up to auto-load, but you can replace it with a GUI loader.
-- All game files must be directly imported for darklua to include it.

local Files = {
    Universal = {
        Name = "Universal",
        Load = require("games/Universal/init.luau"),
    },

    {
        Name = "Blank Base",
        Load = require("games/BlankBase/init.luau"),
        Places = { 1234567890, 0987654321 } -- List of PlaceId's
    },
    {
        Name = "Blank Base 2",
        Load = require("games/BlankBase2/init.luau"),
        Places = { 123123123, 321312321 }
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