
ElkBuffBarsDB = {
	["namespaces"] = {
		["LibDualSpec-1.0"] = {
		},
	},
	["profileKeys"] = {
		["Angarr - Thunderlord"] = "Default",
		["Angarr - Blackrock"] = "Default",
		["Shadegarr - Tichondrius"] = "Default",
		["Fangarr - Tichondrius"] = "Default",
		["Mistgarr - Tichondrius"] = "Default",
		["Glaivegarr - Blackrock"] = "Default",
		["Flashlyte - Blackrock"] = "Default",
		["Raingarr - Thunderlord"] = "Default",
		["Paingarr - Sargeras"] = "Default",
		["Ignorc - Blackrock"] = "Default",
	},
	["global"] = {
		["maxtimes"] = {
			["TENCH"] = {
				[6188] = 1607.8,
			},
		},
		["build"] = "36949",
	},
	["profiles"] = {
		["Default"] = {
			["bargroups"] = {
				{
					["sorting"] = "timemax",
					["scale"] = 1,
					["id"] = 1,
					["barspacing"] = 0,
					["alpha"] = 0.5,
					["y"] = 1072.500122070313,
					["configmode"] = false,
					["x"] = 1427.000610351563,
					["growup"] = false,
					["filter"] = {
						["names_exclude"] = {
							["BUFF"] = {
								["Ace of Voracity"] = true,
								["Windwalking"] = true,
								["Anglers' Water Striders"] = true,
								["Sign of the Critter"] = true,
							},
						},
						["type"] = {
							["BUFF"] = true,
						},
					},
					["target"] = "player",
					["bars"] = {
						["textBR"] = false,
						["textTRfont"] = "Friz Quadrata TT",
						["tooltipanchor"] = "ANCHOR_CURSOR",
						["textBRfontsize"] = 14,
						["icon"] = "RIGHT",
						["abbreviate_name"] = 0,
						["textBRstyle"] = "",
						["bgbar"] = true,
						["iconcount"] = true,
						["textTLalign"] = "LEFT",
						["textTRstyle"] = "",
						["textBLcolor"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["textTR"] = "TIMELEFT",
						["bar"] = true,
						["textBL"] = false,
						["textBRfont"] = "Friz Quadrata TT",
						["timeFraction"] = true,
						["barbgcolor"] = {
							0, -- [1]
							0.5, -- [2]
							1, -- [3]
							0.3, -- [4]
						},
						["textTLcolor"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["height"] = 20,
						["textTLfont"] = "Friz Quadrata TT",
						["tooltipcaster"] = true,
						["textTRfontsize"] = 14,
						["iconcountfont"] = "Friz Quadrata TT",
						["timeformat"] = "CONDENSED",
						["iconcountfontsize"] = 14,
						["iconcountanchor"] = "CENTER",
						["textTLfontsize"] = 14,
						["textBRcolor"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["bartexture"] = "Details Flat",
						["width"] = 220,
						["textTRcolor"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["barright"] = false,
						["textBLfont"] = "Friz Quadrata TT",
						["iconcountcolor"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["textBLstyle"] = "",
						["textTLstyle"] = "",
						["debufftypecolor"] = true,
						["textBLfontsize"] = 14,
						["spark"] = true,
						["timelessfull"] = false,
						["barcolor"] = {
							0.3, -- [1]
							0.5, -- [2]
							1, -- [3]
							0.8, -- [4]
						},
						["padding"] = 1,
						["textBLalign"] = "LEFT",
						["textTL"] = "NAMERANKCOUNT",
					},
					["anchortext"] = "BUFFS",
					["anchorshown"] = false,
				}, -- [1]
				{
					["sorting"] = "timeleft",
					["id"] = 2,
					["scale"] = 1,
					["barspacing"] = 0,
					["alpha"] = 1,
					["stickto"] = 1,
					["anchortext"] = "DEBUFFS",
					["growup"] = false,
					["configmode"] = false,
					["filter"] = {
						["type"] = {
							["DEBUFF"] = true,
						},
					},
					["target"] = "player",
					["bars"] = {
						["textBR"] = false,
						["textTRfont"] = "Friz Quadrata TT",
						["tooltipanchor"] = "default",
						["textBRfontsize"] = 14,
						["icon"] = "RIGHT",
						["abbreviate_name"] = 0,
						["textBRstyle"] = "",
						["bgbar"] = true,
						["iconcount"] = true,
						["textTLalign"] = "LEFT",
						["textTRstyle"] = "",
						["textBLcolor"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["textTR"] = "TIMELEFT",
						["bar"] = true,
						["textBL"] = false,
						["textBRfont"] = "Friz Quadrata TT",
						["timeFraction"] = true,
						["barbgcolor"] = {
							1, -- [1]
							0, -- [2]
							0, -- [3]
							0.3, -- [4]
						},
						["textTLcolor"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["height"] = 20,
						["textTLfont"] = "Friz Quadrata TT",
						["tooltipcaster"] = true,
						["textTRfontsize"] = 14,
						["iconcountfont"] = "Friz Quadrata TT",
						["timeformat"] = "CONDENSED",
						["iconcountfontsize"] = 14,
						["iconcountanchor"] = "CENTER",
						["textTLfontsize"] = 14,
						["textBRcolor"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["bartexture"] = "Details Flat",
						["width"] = 220,
						["textTRcolor"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["barright"] = false,
						["textBLfont"] = "Friz Quadrata TT",
						["iconcountcolor"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["textBLstyle"] = "",
						["textTLstyle"] = "",
						["debufftypecolor"] = true,
						["textBLfontsize"] = 14,
						["spark"] = false,
						["timelessfull"] = false,
						["barcolor"] = {
							1, -- [1]
							0, -- [2]
							0, -- [3]
							0.8, -- [4]
						},
						["padding"] = 1,
						["textBLalign"] = "LEFT",
						["textTL"] = "NAMERANKCOUNT",
					},
					["stickside"] = "",
					["anchorshown"] = false,
				}, -- [2]
				{
					["sorting"] = "timeleft",
					["id"] = 3,
					["scale"] = 1,
					["barspacing"] = 0,
					["alpha"] = 0.5,
					["stickto"] = 2,
					["anchortext"] = "TENCH",
					["growup"] = false,
					["configmode"] = false,
					["filter"] = {
						["type"] = {
							["TENCH"] = true,
						},
					},
					["target"] = "player",
					["bars"] = {
						["textBR"] = false,
						["textTRfont"] = "Friz Quadrata TT",
						["tooltipanchor"] = "default",
						["textBRfontsize"] = 14,
						["icon"] = "RIGHT",
						["abbreviate_name"] = 0,
						["textBRstyle"] = "",
						["bgbar"] = true,
						["iconcount"] = true,
						["textTLalign"] = "LEFT",
						["textTRstyle"] = "",
						["textBLcolor"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["textTR"] = "TIMELEFT",
						["bar"] = true,
						["textBL"] = false,
						["textBRfont"] = "Friz Quadrata TT",
						["timeFraction"] = true,
						["barbgcolor"] = {
							0.5, -- [1]
							0, -- [2]
							0.5, -- [3]
							0.3, -- [4]
						},
						["textTLcolor"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["height"] = 20,
						["textTLfont"] = "Friz Quadrata TT",
						["tooltipcaster"] = true,
						["textTRfontsize"] = 14,
						["iconcountfont"] = "Friz Quadrata TT",
						["timeformat"] = "CONDENSED",
						["iconcountfontsize"] = 14,
						["iconcountanchor"] = "CENTER",
						["textTLfontsize"] = 14,
						["textBRcolor"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["bartexture"] = "Details Flat",
						["width"] = 220,
						["textTRcolor"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["barright"] = false,
						["textBLfont"] = "Friz Quadrata TT",
						["iconcountcolor"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["textBLstyle"] = "",
						["textTLstyle"] = "",
						["debufftypecolor"] = true,
						["textBLfontsize"] = 14,
						["spark"] = false,
						["timelessfull"] = false,
						["barcolor"] = {
							0.5, -- [1]
							0, -- [2]
							0.5, -- [3]
							0.8, -- [4]
						},
						["padding"] = 1,
						["textBLalign"] = "LEFT",
						["textTL"] = "NAMERANKCOUNT",
					},
					["stickside"] = "",
					["anchorshown"] = false,
				}, -- [3]
			},
			["groupspacing"] = 0,
			["minimap"] = {
				["hide"] = false,
			},
		},
	},
}
