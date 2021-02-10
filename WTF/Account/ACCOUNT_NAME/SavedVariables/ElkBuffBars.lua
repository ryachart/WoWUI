
ElkBuffBarsDB = {
	["namespaces"] = {
		["LibDualSpec-1.0"] = {
		},
	},
	["global"] = {
		["maxcharges"] = {
			["DEBUFF"] = {
				["Torment: Might of the Upper Reaches"] = 10,
				["Burst"] = 7,
				["Vile Spit"] = 2,
				["Bone Shrapnel"] = 2,
				["Assassinate"] = 5,
				["Winter's Chill"] = 2,
				["Aural Fracture"] = 5,
				["Thrash"] = 3,
				["Infectious Rain"] = 4,
				["Corrosive Gunk"] = 3,
				["Concentrated Plague"] = 3,
			},
			["BUFF"] = {
				["Thrill Seeker"] = 7,
				["Chi Energy"] = 30,
				["Soul Remnant's Blessing"] = 24,
				["Chain Reaction"] = 2,
				["Slimy Morsel"] = 9,
				["Purified Chi"] = 8,
				["Earth Shield"] = 9,
				["Fevered Incantation"] = 3,
				["Solidify"] = 2,
				["Unnatural Power"] = 13,
				["Ironfur"] = 3,
				["Elusive Brawler"] = 11,
				["Slime Injected"] = 5,
				["Earthwarden"] = 3,
				["Blood Waltz"] = 4,
				["Let Go of the Past"] = 3,
			},
		},
		["maxtimes"] = {
			["TENCH"] = {
				[6200] = 3599.497,
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
