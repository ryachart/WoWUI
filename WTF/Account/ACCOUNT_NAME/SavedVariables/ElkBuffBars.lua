
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
				["Stony Veins"] = 2,
				["Curse of Hargitas"] = 8,
				["Drained Soul"] = 5,
				["Empyreal Ordnance"] = 5,
				["Jagged Swipe"] = 3,
				["Weapons of Order"] = 4,
				["Festering Wound"] = 6,
				["Burning Remnants"] = 2,
				["Unholy Blight"] = 4,
				["Vanquished"] = 5,
				["Winter's Chill"] = 2,
				["Nathrian Hymn: Sinsear"] = 7,
				["Rotting"] = 30,
				["Expose Weakness"] = 4,
				["Deathly Roar"] = 2,
				["Destabilize"] = 25,
			},
			["BUFF"] = {
				["Redirected Anima"] = 11,
				["Focused Will"] = 2,
				["Tranquility"] = 5,
				["Primordial Arcanic Pulsar"] = 3,
				["Whirlwind"] = 2,
				["Infernal Cascade"] = 2,
				["Prayer of Mending"] = 10,
				["Crushing Stone"] = 7,
				["High Tide"] = 2,
				["Purified Chi"] = 8,
				["Reverberation"] = 5,
				["Crimson Chorus"] = 3,
				["Soul Fragments"] = 5,
				["Chain Reaction"] = 5,
				["Demonic Core"] = 2,
				["Lust"] = 20,
				["Chi Energy"] = 30,
				["Thrill Seeker"] = 39,
				["Growing Hunger"] = 10,
				["Valiant Strikes"] = 20,
				["Elusive Brawler"] = 7,
				["Earth Shield"] = 9,
				["Hit Combo"] = 6,
				["Tidal Waves"] = 2,
				["Frenzy"] = 4,
				["Flash Concentration"] = 5,
				["Gluttonous"] = 9,
				["Alacrity"] = 5,
				["Fevered Incantation"] = 5,
				["Water Shield"] = 3,
				["Icicles"] = 2,
			},
		},
		["maxtimes"] = {
			["TENCH"] = {
				[6188] = 3599.495,
			},
		},
		["build"] = "37176",
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
						["spark"] = true,
						["textBRcolor"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["bartexture"] = "Details Flat",
						["width"] = 220,
						["textTLfontsize"] = 14,
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
						["textTRcolor"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
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
						["spark"] = false,
						["textBRcolor"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["bartexture"] = "Details Flat",
						["width"] = 220,
						["textTLfontsize"] = 14,
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
						["textTRcolor"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
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
						["spark"] = false,
						["textBRcolor"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["bartexture"] = "Details Flat",
						["width"] = 220,
						["textTLfontsize"] = 14,
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
						["textTRcolor"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
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
