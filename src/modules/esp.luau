--[[ 
    An example ESP module
]]

local Esp = {
	Enabled = false,
	Boxes = false,
	Tracers = false
}

function Esp:Initialize()
	--// Some ESP logic here
	print("Esp module Initialized!")

	return Esp
end

return Esp