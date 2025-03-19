--[[ 
    An example Aiming module
]]

local Aiming = {
	Aimbot = {
		Enabled = false,
		Smoothing = 0
	},
	Triggerbot = {
		Enabled = false,
		Delay = 0
	}
}

Aiming.Initialize = function()
	--// Some aiming logic here
end

return Aiming