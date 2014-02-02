local T, C, L, G = unpack(Tukui) -- Import: T - functions, constants, variables; C - config; L - locales; G - Globals

if ( C == nil or C["unitframes"] == nil or not C["unitframes"]["enable"] ) then return; end

if (C["unitframes"].unitcastbar ~= true) then return; end

local addon, ns=...
local config = ns.config

if (config.separateplayer) then
	local c = config["player"]
	local playercb = ns.Castbar:create(c)
	playercb:placeBar(c.position, c.iconposition)
end

if (config.separatetarget) then
	local c = config["target"]
	local targetcb = ns.Castbar:create(c)
	targetcb:placeBar(c.position, c.iconposition)
end

if (config.separatefocus) then
	local c = config["focus"]
	local focuscb = ns.Castbar:create(c)
	focuscb:placeBar(c.position, c.iconposition)
end

if (config.separatefocustarget) then
	local c = config["focustarget"]
	local focustargetcb = ns.Castbar:create(c)
	focustargetcb:placeBar(c.position, c.iconposition)
end
