
ElkBuffBarsDB = {
	["namespaces"] = {
		["LibDualSpec-1.0"] = {
		},
	},
	["global"] = {
		["maxcharges"] = {
			["DEBUFF"] = {
				["Bruising Strike"] = 3,
				["Agony"] = 8,
			},
			["BUFF"] = {
				["Redirected Anima"] = 8,
				["Hit Scheme"] = 3,
				["Deathtouched Brew"] = 11,
				["Seeker's Scroll"] = 100,
				["Unnatural Power"] = 5,
				["Secret Spices"] = 50,
				["Chi Energy"] = 10,
				["Purified Chi"] = 7,
				["Shining Light"] = 4,
				["Invoke Chi-Ji, the Red Crane"] = 3,
				["Uber Strike"] = 6,
				["Blood Waltz"] = 4,
				["Soul Remnant's Blessing"] = 46,
				["Elusive Brawler"] = 19,
				["Fevered Incantation"] = 3,
				["Inner Flames"] = 12,
				["Fading Away"] = 15,
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
					["configmode"] = false,
					["id"] = 1,
					["barspacing"] = 0,
					["alpha"] = 0.5,
					["anchortext"] = "BUFFS",
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
						["textBRcolor"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["timelessfull"] = false,
						["textTLfontsize"] = 14,
						["textTLstyle"] = "",
						["textTRcolor"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["barright"] = false,
						["debufftypecolor"] = true,
						["iconcountcolor"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["textBLstyle"] = "",
						["width"] = 220,
						["textBLfont"] = "Friz Quadrata TT",
						["textBLfontsize"] = 14,
						["bartexture"] = "Details Flat",
						["spark"] = true,
						["iconcountfontsize"] = 14,
						["padding"] = 1,
						["textBLalign"] = "LEFT",
						["height"] = 20,
					},
					["scale"] = 1,
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
						["textBRcolor"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["timelessfull"] = false,
						["textTLfontsize"] = 14,
						["textTLstyle"] = "",
						["textTRcolor"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["barright"] = false,
						["debufftypecolor"] = true,
						["iconcountcolor"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["textBLstyle"] = "",
						["width"] = 220,
						["textBLfont"] = "Friz Quadrata TT",
						["textBLfontsize"] = 14,
						["bartexture"] = "Details Flat",
						["spark"] = false,
						["iconcountfontsize"] = 14,
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
						["textBRcolor"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["timelessfull"] = false,
						["textTLfontsize"] = 14,
						["textTLstyle"] = "",
						["textTRcolor"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["barright"] = false,
						["debufftypecolor"] = true,
						["iconcountcolor"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["textBLstyle"] = "",
						["width"] = 220,
						["textBLfont"] = "Friz Quadrata TT",
						["textBLfontsize"] = 14,
						["bartexture"] = "Details Flat",
						["spark"] = false,
						["iconcountfontsize"] = 14,
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
