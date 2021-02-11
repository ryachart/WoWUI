
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
		["Ignorc - Blackrock"] = "Default",
		["Mistgarr - Tichondrius"] = "Default",
		["Flashlyte - Blackrock"] = "Default",
		["Glaivegarr - Blackrock"] = "Default",
		["Raingarr - Thunderlord"] = "Default",
		["Paingarr - Sargeras"] = "Default",
		["Arantir - Lightbringer"] = "Default",
	},
	["global"] = {
		["maxcharges"] = {
			["DEBUFF"] = {
				["Soul Split"] = 2,
				["Agonizing Backlash"] = 2,
				["Festering Wound"] = 6,
				["Triple Bite"] = 3,
				["Unholy Blight"] = 4,
				["Debilitating Poison"] = 3,
				["Winter's Chill"] = 2,
				["Bloodletting"] = 2,
				["Thrash"] = 3,
				["Dying Breath"] = 5,
				["Flagellation"] = 15,
				["Mirrors of Torment"] = 3,
			},
			["BUFF"] = {
				["Luck of the Draw"] = 3,
				["Growing Menace"] = 5,
				["Chain Reaction"] = 3,
				["Ironfur"] = 9,
				["Incanter's Flow"] = 4,
				["Earthwarden"] = 3,
				["Kindled Soul"] = 100,
			},
		},
		["build"] = "37474",
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
					["y"] = 1074.500122070313,
					["configmode"] = false,
					["x"] = 1413.000610351563,
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
						["abbreviate_name"] = 47,
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
						["textTRcolor"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["textBRcolor"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["bartexture"] = "Details Flat",
						["width"] = 220,
						["spark"] = true,
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
						["textTLfontsize"] = 14,
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
					["sorting"] = "timemax",
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
						["textTRcolor"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["textBRcolor"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["bartexture"] = "Details Flat",
						["width"] = 220,
						["spark"] = false,
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
						["textTLfontsize"] = 14,
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
					["sorting"] = "timemax",
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
						["textTRcolor"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["textBRcolor"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["bartexture"] = "Details Flat",
						["width"] = 220,
						["spark"] = false,
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
						["textTLfontsize"] = 14,
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
					["stickside"] = "LEFT",
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
