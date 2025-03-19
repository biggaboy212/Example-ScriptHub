--!nocheck

-- This file is non functioning, it's a reference to how your script could look like

return function(gameName)
	--// Imports
	local Functions = require("core/functions.luau");
	local Ui = require("core/ui.luau");
	local Esp = require("modules/esp.luau");
	local Aiming = require("modules/aiming.luau");

	--// Methods
	local GetService = Functions.SecureService;

	--// Variables
	local LocalPlayer: Player = Functions.GetPlayer();
	local Aimbot = Aiming.Aimbot;
	local Triggerbot = Aiming.Triggerbot;

	--// References
	local Workspace: Workspace = GetService("Workspace")

	--// UI Begin
	local Window = Ui:Window({
		Title = `SuperCool Hub | {gameName}`
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

	-- [[ COMBAT TAB ]] --
	do
		local Sections = {
			Aimbot = Tabs.Combat:Section({ Label = "Aimbot" }),
			Triggerbot = Tabs.Combat:Section({ Label = "Triggerbot" })
		}

		-- Aimbot Section
		Sections.Aimbot:Toggle({
			Label = "Enabled",
			Callback = function(self, Value)
				Aimbot.Enabled = Value
			end
		})

		Sections.Aimbot:Slider({
			Label = "Smoothing",
			Min = 0,
			Max = 20,
			Value = 10,
			Callback = function(self, Value)
				Aimbot.Smoothing = Value
			end
		})

		-- Triggerbot Section
		Sections.Triggerbot:Toggle({
			Label = "Enabled",
			Callback = function(self, Value)
				Triggerbot.Enabled = Value
			end
		})

		Sections.Triggerbot:Slider({
			Label = "Delay",
			Min = 0,
			Max = 1,
			Value = 0,
			Precision = 3,
			Callback = function(self, Value)
				Triggerbot.Delay = Value
			end
		})
	end

	-- [[ VISUALS TAB ]] --
	do
		local Sections = {
			ESP = Tabs.Visuals:Section({ Label = "ESP" })
		}

		-- ESP Section
		Sections.ESP:Toggle({
			Label = "Enabled",
			Callback = function(self, Value)
				Esp.Enabled = Value
			end
		})

		Sections.ESP:Toggle({
			Label = "Boxes",
			Callback = function(self, Value)
				Esp.Boxes = Value
			end
		})

		Sections.ESP:Toggle({
			Label = "Tracers",
			Callback = function(self, Value)
				Esp.Tracers = Value
			end
		})
	end

	-- [[ PLAYER TAB ]] --
	do
		local Sections = {
			PlayerModification = Tabs.Player:Section({ Label = "Player Modification" })
		}

		-- Player Modification Section
		Sections.PlayerModification:Slider({
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

		Sections.World:Slider({
			Label = "Camera FOV",
			Min = 1,
			Max = 120,
			Value = 70,
			Precision = 3,
			Callback = function(self, Value)
				local CurrentCamera: Camera = Workspace.CurrentCamera

				CurrentCamera.FieldOfView = Value
			end
		})
	end

	--// Initialize
	Ui.Setup()
	Esp.Initialize()
	Aiming.Initialize()
end