local addon, ns = ...

ns.config={
    ["separateplayer"] = true, -- separate player castbar
    ["separatetarget"] = true, -- separate target castbar
    ["separatefocus"] = true, -- separate focus castbar
    ["separatefocustarget"]  = false, -- separate focustarget castbar
	
    player = {
		tukuiBar = TukuiPlayerCastBar, 			-- [required]
		size = {250, 26}, 						-- [required] width and height of castbar
		position = {0, -200}, 					-- [required] position of castbar (relative to UIParent CENTER)
		iconposition = {"LEFT", -25, 0}, 		-- [required] spellicon position (relative to castbar)
		text = { 								-- [optional] config for spellname, remove for no name
			alignment = {"LEFT", 4, 0}, 
			color = {0.84, 0.75, 0.65, 1}, 
		}, 
		timer = {								-- [optional] config for casttime, remove for no timer
			alignment = {"RIGHT", -4, 0}, 
			color = {0.84, 0.75, 0.65, 1}, 
		},
		latency = { 							-- [optional] config for redzone (latency), remove for no redzone
			color = {0.69, 0.31, 0.31, 0.75}, 
		},
    },
    target = {
		tukuiBar = TukuiTargetCastBar, 
        size = {250, 26}, 
		position = {0, -150}, 
		iconposition = {"RIGHT", 25, 0}, 
		text = { 
			alignment = {"LEFT", 4, 0}, 
			color = {0.84, 0.75, 0.65, 1}, 
		}, 
		timer = {
			alignment = {"RIGHT", -4, 0}, 
			color = {0.84, 0.75, 0.65, 1}, 
		},
		latency = { 
			color = {0.69, 0.31, 0.31, 0.75}, 
		},
    },
    focus = {
		tukuiBar = TukuiFocusCastBar, 
        size = {350, 30}, 
		position = {0, 250}, 
		iconposition = {"LEFT", -25, 0}, 
		text = { 
			alignment = {"LEFT", 4, 0}, 
			color = {0.84, 0.75, 0.65, 1}, 
		}, 
		timer = {
			alignment = {"RIGHT", -4, 0}, 
			color = {0.84, 0.75, 0.65, 1}, 
		},
		latency = { 
			color = {0.69, 0.31, 0.31, 0.75}, 
		},
    },
    focustarget = {
		tukuiBar = TukuiFocusTargetCastBar, 
        size = {250, 26}, 
		position = {0, 210}, 
		iconposition = {"RIGHT", 25, 0}, 
		text = { 
			alignment = {"LEFT", 4, 0}, 
			color = {0.84, 0.75, 0.65, 1}, 
		}, 
		timer = {
			alignment = {"RIGHT", -4, 0}, 
			color = {0.84, 0.75, 0.65, 1}, 
		},
		latency = { 
			color = {0.69, 0.31, 0.31, 0.75}, 
		},
    },
}

