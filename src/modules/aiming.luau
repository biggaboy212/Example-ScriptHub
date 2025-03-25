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

function Aiming:Initialize()
	--// Some aiming logic here
	print("Aiming module Initialized!")

	return Aiming
end

return Aiming