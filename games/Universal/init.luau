--!nocheck

local file = {}

function file.init(gameName)
	--/ Modules \--
	local Functions = require("core/functions.luau")
	local UI = require("core/ui.luau")
	local ESP = require("modules/esp.luau")
	local Aimbot = require("modules/aimbot.luau")

	--/ Variables \--
	local LocalPlayer: Player = Functions.GetPlayer()

	--/ Logic \--
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
	--// Aimbot Section \\-
	local AimbotSection = Tabs.Combat:Section({ Label = "Aimbot" })

	AimbotSection:Toggle({
		Label = "Aimbot",
		Callback = function(self, Value)
			Aimbot.Enabled = Value
		end
	})

	AimbotSection:Slider({
		Label = "Aimbot Smoothing",
		Min = 0,
		Max = 20,
		Value = 10,
		Callback = function(self, Value)
			Aimbot.Smoothing = Value
		end
	})

	-- [[ VISUALS ]] --
	---// ESP Section \\-
	local ESPSection = Tabs.Visuals:Section({ Label = "ESP" })

	ESPSection:Toggle({
		Label = "ESP",
		Callback = function(self, Value)
			ESP.Enabled = Value
		end
	})

	ESPSection:Toggle({
		Label = "Boxes",
		Callback = function(self, Value)
			ESP.Boxes = Value
		end
	})

	ESPSection:Toggle({
		Label = "Tracers",
		Callback = function(self, Value)
			ESP.Tracers = Value
		end
	})

	-- [[ PLAYER ]] --
	--// Player Modification Section \\-
	local PlayerModsSection = Tabs.Visuals:Section({ Label = "Player Modifications" })

	PlayerModsSection:Slider({
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