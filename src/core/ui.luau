--[[
	An example UI Library module
]]

local UI = {}

function UI:Window(Settings)
	local Window = {
		Title = Settings.Title or "Window",
	}

	function Window:Tab(Settings)
		local Tab = {
			Title = Settings.Label or "Tab",
		}

		function Tab:Section(Settings)
			local Section = {
				Title = Settings.Label or "Section"
			}

			function Section:Toggle(Settings)
				local Toggle = {
					Label = Settings.Label or "Toggle",
					State = Settings.State or false,
					Callback = Settings.Callback or function() end
				}

				function Toggle:Set(Value)
					Toggle.State = Value
					Toggle.Callback(Toggle, Value)
				end

				return Toggle
			end

			function Section:Slider(Settings)
				local Slider = {
					Label = Settings.Label or "Slider",
					Min = Settings.Min or 0,
					Max = Settings.Max or 1,
					Value = Settings.Value or 0,
					Precision = Settings.Precision or 0,
					Callback = Settings.Callback or function() end
				}

				function Slider:Set(Value)
					Slider.Value = math.clamp(Value, Slider.Min, Slider.Max)
					Slider.Callback(Slider, Slider.Value)
				end

				return Slider
			end
			return Section
		end

		return Tab
	end

	return Window
end

return UI