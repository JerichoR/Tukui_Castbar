-- Standalone Castbar for Tukui by Krevlorne @ EU-Ulduar
-- Credits to Tukz, Syne, Elv22, Sweeper and all other great people of the Tukui community.

local T, C, _ = unpack(Tukui) -- Import: T - functions, constants, variables; C - config; L - locales

local addon, ns=...
local config = ns.config

local font = C["media"].uffont
local normTex = C["media"].normTex;

local Castbar = {
	tukuiBar,
	size,
	anchor,
	castbarpanel,
}
Castbar.__index = Castbar -- class is metatable for its instances

function Castbar:create(template)
	cb = {}
	setmetatable(cb, self)
	
	cb.tukuiBar = template.tukuiBar
	cb.size = template.size
	cb.tukuiBar.Castbar = cb.tukuiBar
	
	cb:createPanel()
	cb:showSpell(template.text)
	cb:showTimer(template.timer)
	cb:showLatency(template.latency)
	cb:createAnchor(cb.tukuiBar:GetName())
	
	return cb
end

function Castbar:createPanel() 
	local panel = CreateFrame("Frame", self.tukuiBar:GetName().."_Panel", self.tukuiBar)
    panel:SetTemplate("Default")
    panel:Size(self.size[1], self.size[2])
    panel:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
    panel:SetFrameLevel(1)
    panel:SetFrameStrata("BACKGROUND")
	panel:CreateShadow("Default")
	self.castbarpanel = panel
end

-- spellname on cast bar
function Castbar:showSpell(conf)
	if not conf then return end
	
	local text = T.SetFontString(self.tukuiBar, font, 12)
	text:SetPoint(conf.alignment[1], self.castbarpanel, conf.alignment[1], conf.alignment[2], conf.alignment[3])
	text:SetTextColor(unpack(conf.color))
	text:SetJustifyH(conf.alignment[1])
	self.tukuiBar.Castbar.Text = text
end

-- casttime on cast bar
function Castbar:showTimer(conf)
	if not conf then return end
	
	local timer = T.SetFontString(self.tukuiBar, font, 12)
	timer:SetPoint(conf.alignment[1], self.castbarpanel, conf.alignment[1], conf.alignment[2], conf.alignment[3])
	timer:SetTextColor(unpack(conf.color))
	timer:SetJustifyH(conf.alignment[1])

	self.tukuiBar.Castbar.Time = timer
end

-- cast bar latency
function Castbar:showLatency(conf)
	if not conf then return end
	
	local safezone = self.tukuiBar:CreateTexture(nil, "ARTWORK")
	safezone:SetTexture(normTex)
	safezone:SetVertexColor(unpack(conf.color))
	
	self.tukuiBar.SafeZone = safezone
end

-- anchor for moveable frames
function Castbar:createAnchor(name)
	local anchor = CreateFrame("Button", name.."_PanelAnchor", UIParent)
	anchor:SetTemplate("Default")
	anchor:SetSize(self.size[1], self.size[2])
	anchor:SetBackdropBorderColor(1, 0, 0, 1)
	anchor:SetMovable(true)
	anchor:Hide()
	
	anchor.text = T.SetFontString(anchor, font, 12)
	anchor.text:SetPoint("CENTER")
	anchor.text:SetText(name)
	anchor.text.Show = function() anchor:Show() end
	anchor.text.Hide = function() anchor:Hide() end
	
	self.anchor = anchor
	table.insert(T.AllowFrameMoving, self.anchor)
end

-- place the castbar on screen
function Castbar:placeBar(position, iconposition) 
	self.anchor:SetPoint("CENTER", UIParent, "CENTER", position[1], position[2])
	self.castbarpanel:SetPoint("CENTER", self.anchor, "CENTER", 0, 0)
	
	self.tukuiBar:ClearAllPoints()      
	self.tukuiBar:Point("TOPLEFT", self.castbarpanel, 2, -2)
	self.tukuiBar:Point("BOTTOMRIGHT", self.castbarpanel, -2, 2)
	
	self.tukuiBar.button:ClearAllPoints()
	self.tukuiBar.button:Size(self.size[2])
	self.tukuiBar.button:Point("CENTER", self.tukuiBar, iconposition[1], iconposition[2], iconposition[3])
end

ns.Castbar = Castbar
