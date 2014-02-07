local addon, ns = ...

ns.config={
    player = {
		separate = true,						-- separate player castbar
		size = {250, 26}, 						-- width and height of castbar
		position = {0, -200}, 					-- position of castbar (relative to UIParent CENTER)
		text = { 								-- [optional] config for spellname
			alignment = {"LEFT", 4, 0}, 
			color = {0.84, 0.75, 0.65, 1}, 
		}, 
		timer = {								-- [optional] config for casttime
			alignment = {"RIGHT", -4, 0}, 
			color = {0.84, 0.75, 0.65, 1}, 
		},
		latency = { 							-- [optional] config for redzone (latency), only available for player castbar
			color = {0.69, 0.31, 0.31, 0.75}, 
		},
		icon = {								-- [optional] spellicon position (relative to castbar)
			alignment = {"LEFT", -25, 0},
		}, 
    },
    target = {
		separate = true,						-- separate target castbar
        size = {250, 26}, 
		position = {0, -150}, 
		text = { 
			alignment = {"LEFT", 4, 0}, 
			color = {0.84, 0.75, 0.65, 1}, 
		}, 
		timer = {
			alignment = {"RIGHT", -4, 0}, 
			color = {0.84, 0.75, 0.65, 1}, 
		},
		icon = {
			alignment = {"RIGHT", 25, 0}, 
		},
    },
    focus = {
		separate = true,						-- separate focus castbar
        size = {350, 30}, 
		position = {0, 250}, 
		text = { 
			alignment = {"LEFT", 4, 0}, 
			color = {0.84, 0.75, 0.65, 1}, 
		}, 
		timer = {
			alignment = {"RIGHT", -4, 0}, 
			color = {0.84, 0.75, 0.65, 1}, 
		},
		icon = {
			alignment = {"LEFT", -25, 0}, 
		},
    },
    focustarget = {
		separate = false,						-- separate focustarget castbar
        size = {250, 26}, 
		position = {0, 210}, 
		text = { 
			alignment = {"LEFT", 4, 0}, 
			color = {0.84, 0.75, 0.65, 1}, 
		}, 
		timer = {
			alignment = {"RIGHT", -4, 0}, 
			color = {0.84, 0.75, 0.65, 1}, 
		},
		icon = {
			alignment = {"RIGHT", 25, 0}, 
		},
    },
}

