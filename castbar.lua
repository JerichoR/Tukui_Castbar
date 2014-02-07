local addon, ns=...
local config = ns.config

local T, C, L, G = unpack(Tukui) -- Import: T - functions, constants, variables; C - config; L - locales; G - Globals

local Castbar = CreateFrame("Frame", "Tukui_Castbar")
Castbar.__index = Castbar
ns.Castbar = Castbar

function Castbar:detach(tukuibar, template)
	if not template.separate then return; end
	
	local cb = {}
	setmetatable(cb, self)
	
	cb.tukuiBar = tukuibar
	cb.size = template.size
	cb.position = template.position
	
	cb:createAnchor(cb.tukuiBar:GetName())
	cb:createPanel(cb.tukuiBar:GetName())
	cb:showSpellName(template.text)
	cb:showCastTime(template.timer)
	cb:showLatency(template.latency)
	cb:showSpellIcon(template.icon)
	
	return cb
end

-- create anchor for moveable frames
function Castbar:createAnchor(name)
	local anchor = CreateFrame("Button", name.."_Anchor", UIParent)
	anchor:SetTemplate("Default")
	anchor:SetSize(self.size[1], self.size[2])
	anchor:SetPoint("CENTER", UIParent, "CENTER", self.position[1], self.position[2])
	anchor:SetBackdropBorderColor(1, 0, 0, 1)
	anchor:SetMovable(true)
	anchor:Hide()
	
	anchor.text = T.SetFontString(anchor, C["media"].font, 12)
	anchor.text:SetPoint("CENTER")
	anchor.text:SetText(name)
	anchor.text.Show = function() anchor:Show() end
	anchor.text.Hide = function() anchor:Hide() end
	
	self.anchor = anchor
	table.insert(T.AllowFrameMoving, self.anchor)
end

-- create background panel for the castbar
function Castbar:createPanel(name)
	local panel = CreateFrame("Frame", name.."_Panel", self.tukuiBar)
    panel:SetTemplate("Default")
	panel:Size(self.size[1], self.size[2])
	panel:SetPoint("CENTER", self.anchor, "CENTER", 0, 0)
    panel:SetFrameLevel(1)
    panel:SetFrameStrata("BACKGROUND")
	panel:CreateShadow("Default")
	self.castbarpanel = panel
	
	self.tukuiBar:ClearAllPoints()      
	self.tukuiBar:Point("TOPLEFT", panel, 2, -2)
	self.tukuiBar:Point("BOTTOMRIGHT", panel, -2, 2)
end

-- move spellname on cast bar
function Castbar:showSpellName(conf)
	local text = self.tukuiBar.Text
	
	if not conf then 
		text:Hide()
	else
		text:SetPoint(conf.alignment[1], self.castbarpanel, conf.alignment[1], conf.alignment[2], conf.alignment[3])
		text:SetTextColor(unpack(conf.color))
		text:SetJustifyH(conf.alignment[1])
	end
end

-- move casttime on cast bar
function Castbar:showCastTime(conf)
	local timer = self.tukuiBar.time
	
	if not conf then 
		timer:Hide()
	else
		timer:SetPoint(conf.alignment[1], self.castbarpanel, conf.alignment[1], conf.alignment[2], conf.alignment[3])
		timer:SetTextColor(unpack(conf.color))
		timer:SetJustifyH(conf.alignment[1])
	end
end

-- move cast bar latency
function Castbar:showLatency(conf)
	local safeZone = self.tukuiBar.safezone
	
	if safeZone then
		if not conf then
			safeZone:Hide()
		else
			safeZone:SetVertexColor(unpack(conf.color))
		end
	end
end

-- move spellIcon
function Castbar:showSpellIcon(conf)
	local button = self.tukuiBar.button
	local icon = self.tukuiBar.icon
	
	if button then
		if not conf then
			button:Hide()
		else
			button:ClearAllPoints()
			button:Size(self.size[2])
			button:SetPoint("CENTER", self.tukuiBar, conf.alignment[1], conf.alignment[2], conf.alignment[3])
			icon:ClearAllPoints()
			icon:Point("TOPLEFT", button, 2, -2)
			icon:Point("BOTTOMRIGHT", button, -2, 2)
		end
	end
end

-- execute code when first time casting
-- any method can be over written externally before it is executed here
function Castbar:init() 
	Castbar:UnregisterEvent("UNIT_SPELLCAST_CHANNEL_START")
	Castbar:UnregisterEvent("UNIT_SPELLCAST_START")

	Castbar:detach(TukuiPlayerCastBar, config["player"])
	Castbar:detach(TukuiTargetCastBar, config["target"])
	Castbar:detach(TukuiFocusCastBar, config["focus"])
	Castbar:detach(TukuiFocusTargetCastBar, config["focustarget"])
end

Castbar:RegisterEvent("UNIT_SPELLCAST_CHANNEL_START")
Castbar:RegisterEvent("UNIT_SPELLCAST_START")
Castbar:SetScript("OnEvent", Castbar.init)


