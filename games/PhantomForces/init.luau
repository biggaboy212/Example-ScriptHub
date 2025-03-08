--!nocheck

local file = {}

--// Modules
local Functions = require("core/functions.luau")
local UI = require("core/ui.luau")
local ESP = require("modules/esp.luau")
local Aimbot = require("modules/aimbot.luau")

--// Variables
local LocalPlayer: Player = Functions.GetPlayer()

--// Logic
function file.init(gameName)
	local Window = UI:Window({
		Title = "SuperCool Hub | " .. gameName
	})
	
	local Tabs = {
		Combat = Window:Tab({
			Label = "Combat"
		}),
		Visuals = Window:Tab({
			Label = "Visuals"
		}),
		Player = Window:Tab({
			Label = "Player"
		}),
	}

	-- [[ COMBAT ]] --
	Tabs.Combat:Toggle({
		Label = "Aimbot",
		Callback = function(self, Value)
			Aimbot.Enabled = Value
		end
	})

	-- [[ VISUALS ]] --
	Tabs.Visuals:Toggle({
		Label = "ESP",
		Callback = function(self, Value)
			ESP.Enabled = Value
		end
	})

	-- [[ PLAYER ]] --
	Tabs.Visuals:Slider({
		Label = "Player Speed",
		Min = 1,
		Max = 100,
		Value = 16,
		Callback = function(self, Value)
			local Humanoid: Humanoid = Functions.GetHumanoid(LocalPlayer)
			
			if Humanoid then
				Humanoid.WalkSpeed = Value
			end
		end
	})
end

return file