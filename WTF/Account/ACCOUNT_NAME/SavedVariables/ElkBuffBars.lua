
ElkBuffBarsDB = {
	["namespaces"] = {
		["LibDualSpec-1.0"] = {
		},
	},
	["global"] = {
		["maxcharges"] = {
			["DEBUFF"] = {
				["Agony"] = 10,
				["Weapons of Order"] = 4,
				["Festering Wound"] = 6,
				["Death's Due"] = 6,
				["Unholy Blight"] = 4,
				["Everfrost"] = 10,
				["Winter's Chill"] = 2,
				["Shattered Psyche"] = 5,
				["Thrash"] = 3,
				["Everchill Brambles"] = 7,
				["Razorice"] = 5,
				["Tethering Shot Stacking Slow"] = 2,
			},
			["BUFF"] = {
				["Tranquility"] = 5,
				["Let Go of the Past"] = 3,
				["Balance of All Things"] = 2,
				["Elusive Brawler"] = 2,
				["Invoke Chi-Ji, the Red Crane"] = 3,
				["Blood Waltz"] = 4,
				["Prayer of Mending"] = 3,
			},
		},
		["build"] = "37474",
	},
	["profileKeys"] = {
		["Angarr - Thunderlord"] = "Default",
		["Angarr - Blackrock"] = "Default",
		["Shadegarr - Tichondrius"] = "Default",
		["Fangarr - Tichondrius"] = "Default",
		["Ignorc - Blackrock"] = "Default",
		["Mistgarr - Tichondrius"] = "Default",
		["Paingarr - Sargeras"] = "Default",
		["Raingarr - Thunderlord"] = "Default",
		["Glaivegarr - Blackrock"] = "Default",
		["Flashlyte - Blackrock"] = "Default",
		["Arantir - Lightbringer"] = "Default",
	},
	["profiles"] = {
		["Default"] = {
			["bargroups"] = {
				{
					["anchorshown"] = false,
					["anchortext"] = "BUFFS",
					["scale"] = 1,
					["barspacing"] = 0,
					["alpha"] = 0.5,
					["configmode"] = false,
					["y"] = 1074.500122070313,
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
						["textTL"] = "NAMERANKCOUNT",
						["textTLfont"] = "Friz Quadrata TT",
						["tooltipcaster"] = true,
						["textTRfontsize"] = 14,
						["iconcountfont"] = "Friz Quadrata TT",
						["timeformat"] = "CONDENSED",
						["barcolor"] = {
							0.3, -- [1]
							0.5, -- [2]
							1, -- [3]
							0.8, -- [4]
						},
						["iconcountanchor"] = "CENTER",
						["timelessfull"] = false,
						["textBRcolor"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["spark"] = true,
						["textTLstyle"] = "",
						["textTLfontsize"] = 14,
						["bartexture"] = "Details Flat",
						["debufftypecolor"] = true,
						["iconcountcolor"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["textBLstyle"] = "",
						["iconcountfontsize"] = 14,
						["textBLfont"] = "Friz Quadrata TT",
						["textBLfontsize"] = 14,
						["barright"] = false,
						["textTRcolor"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["width"] = 220,
						["padding"] = 1,
						["textBLalign"] = "LEFT",
						["height"] = 20,
					},
					["id"] = 1,
					["sorting"] = "timemax",
				}, -- [1]
				{
					["anchorshown"] = false,
					["scale"] = 1,
					["id"] = 2,
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
						["textTL"] = "NAMERANKCOUNT",
						["textTLfont"] = "Friz Quadrata TT",
						["tooltipcaster"] = true,
						["textTRfontsize"] = 14,
						["iconcountfont"] = "Friz Quadrata TT",
						["timeformat"] = "CONDENSED",
						["barcolor"] = {
							1, -- [1]
							0, -- [2]
							0, -- [3]
							0.8, -- [4]
						},
						["iconcountanchor"] = "CENTER",
						["timelessfull"] = false,
						["textBRcolor"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["spark"] = false,
						["textTLstyle"] = "",
						["textTLfontsize"] = 14,
						["bartexture"] = "Details Flat",
						["debufftypecolor"] = true,
						["iconcountcolor"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["textBLstyle"] = "",
						["iconcountfontsize"] = 14,
						["textBLfont"] = "Friz Quadrata TT",
						["textBLfontsize"] = 14,
						["barright"] = false,
						["textTRcolor"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["width"] = 220,
						["padding"] = 1,
						["textBLalign"] = "LEFT",
						["height"] = 20,
					},
					["stickside"] = "",
					["sorting"] = "timemax",
				}, -- [2]
				{
					["anchorshown"] = false,
					["scale"] = 1,
					["id"] = 3,
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
						["textTL"] = "NAMERANKCOUNT",
						["textTLfont"] = "Friz Quadrata TT",
						["tooltipcaster"] = true,
						["textTRfontsize"] = 14,
						["iconcountfont"] = "Friz Quadrata TT",
						["timeformat"] = "CONDENSED",
						["barcolor"] = {
							0.5, -- [1]
							0, -- [2]
							0.5, -- [3]
							0.8, -- [4]
						},
						["iconcountanchor"] = "CENTER",
						["timelessfull"] = false,
						["textBRcolor"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["spark"] = false,
						["textTLstyle"] = "",
						["textTLfontsize"] = 14,
						["bartexture"] = "Details Flat",
						["debufftypecolor"] = true,
						["iconcountcolor"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["textBLstyle"] = "",
						["iconcountfontsize"] = 14,
						["textBLfont"] = "Friz Quadrata TT",
						["textBLfontsize"] = 14,
						["barright"] = false,
						["textTRcolor"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["width"] = 220,
						["padding"] = 1,
						["textBLalign"] = "LEFT",
						["height"] = 20,
					},
					["stickside"] = "LEFT",
					["sorting"] = "timemax",
				}, -- [3]
			},
			["groupspacing"] = 0,
			["minimap"] = {
				["hide"] = false,
			},
		},
	},
}
