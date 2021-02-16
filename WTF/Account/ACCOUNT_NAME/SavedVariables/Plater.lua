
PlaterDB = {
	["profileKeys"] = {
		["Angarr - Thunderlord"] = "[Better Pixel Perfect] M+ Mods/Scripts",
		["Angarr - Blackrock"] = "Default",
		["Shadegarr - Tichondrius"] = "Default",
		["Ignorc - Blackrock"] = "Default",
		["Paingarr - Sargeras"] = "Default",
		["Huntgarr - Thunderlord"] = "Default",
		["Flashsmite - Blackrock"] = "Default",
		["Mistgarr - Tichondrius"] = "[Better Pixel Perfect] M+ Mods/Scripts",
		["Fangarr - Tichondrius"] = "[Better Pixel Perfect] M+ Mods/Scripts",
		["Raingarr - Thunderlord"] = "Default",
		["Glaivegarr - Blackrock"] = "Default",
		["Flashlyte - Blackrock"] = "Default",
		["Arantir - Lightbringer"] = "Default",
	},
	["profiles"] = {
		["Default"] = {
			["script_data"] = {
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --settings (you may need /reload if some configs isn't applied immediately)    \n    --change the nameplate color to this if allowed\n    envTable.CanChangeNameplateColor = scriptTable.config.changeNameplateColor --\n    envTable.NameplateColor = scriptTable.config.nameplateColor\n    envTable.NameplateSizeOffset = scriptTable.config.nameplateSizeOffset --\n    \n    unitFrame.UnitImportantSkullTexture = unitFrame.UnitImportantSkullTexture or unitFrame:CreateTexture(nil, \"background\")\n    \n    unitFrame.UnitImportantSkullTexture:SetTexture([[Interface/AddOns/Plater/media/skullbones_128]])\n    unitFrame.UnitImportantSkullTexture:SetPoint(\"center\", unitFrame.healthBar, \"center\", 0, -5)\n    \n    unitFrame.UnitImportantSkullTexture:SetVertexColor(Plater:ParseColors(scriptTable.config.skullColor))\n    unitFrame.UnitImportantSkullTexture:SetAlpha(scriptTable.config.skullAlpha)\n    unitFrame.UnitImportantSkullTexture:SetScale(scriptTable.config.skullScale)\n    \n    unitFrame.UnitImportantSkullTexture:Hide()\nend\n\n--[=[\n\n154564 - debug\n\nUsing spellIDs for multi-language support\n\n164362 - smily morsel - plaguefall\n168882 - fleeting manifestation - sanguine depths\n170234 - oppressive banner - theater of pain\n168988 - overgrowth - Mists of Tirna Scithe\n170452 - essesnce orb - torghast\n\n\n--]=]",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    Plater.StopDotAnimation(unitFrame.healthBar, envTable.dotAnimation)   \n    \n    --restore the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)    \n    \n    unitFrame.UnitImportantSkullTexture:Hide()\nend\n\n\n",
					["ScriptType"] = 3,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if can change the nameplate color\n    if (envTable.CanChangeNameplateColor) then\n        Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n    end\n    \nend\n\n\n\n\n",
					["Time"] = 1604599472,
					["url"] = "",
					["Icon"] = "Interface\\AddOns\\Plater\\media\\skullbones_64",
					["Enabled"] = true,
					["Revision"] = 355,
					["semver"] = "",
					["Author"] = "Izimode-Azralon",
					["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["Desc"] = "Highlight a nameplate of an important Add. Add the unit name or NpcID into the trigger box to add more.",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    if (envTable.dotAnimation) then\n        Plater.StopDotAnimation(unitFrame.healthBar, envTable.dotAnimation)\n    end\n    \n    envTable.dotAnimation = Plater.PlayDotAnimation(unitFrame.healthBar, 2, scriptTable.config.dotsColor, 3, 4) \n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \n    unitFrame.UnitImportantSkullTexture:Show()\nend\n\n\n\n\n",
					["SpellIds"] = {
					},
					["PlaterCore"] = 1,
					["Options"] = {
						{
							["Type"] = 6,
							["Key"] = "option4",
							["Value"] = 0,
							["Name"] = "Blank Space",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [1]
						{
							["Type"] = 5,
							["Key"] = "option6",
							["Value"] = "Enter the npc name or npcId in the \"Add Trigger\" box and hit \"Add\".",
							["Name"] = "Option 6",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [2]
						{
							["Type"] = 6,
							["Name"] = "Blank Space",
							["Value"] = 0,
							["Key"] = "option4",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [3]
						{
							["Type"] = 4,
							["Key"] = "changeNameplateColor",
							["Value"] = true,
							["Name"] = "Change Nameplate Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "change to true to change the color",
						}, -- [4]
						{
							["Type"] = 1,
							["Key"] = "nameplateColor",
							["Value"] = {
								1, -- [1]
								0, -- [2]
								0.5254901960784314, -- [3]
								1, -- [4]
							},
							["Name"] = "Nameplate Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "",
						}, -- [5]
						{
							["Type"] = 2,
							["Max"] = 6,
							["Desc"] = "increase the nameplate height by this value",
							["Min"] = 0,
							["Fraction"] = false,
							["Value"] = 3,
							["Name"] = "Nameplate Size Offset",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Key"] = "nameplateSizeOffset",
						}, -- [6]
						{
							["Type"] = 6,
							["Name"] = "Blank Space",
							["Value"] = 0,
							["Key"] = "option4",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [7]
						{
							["Type"] = 1,
							["Key"] = "dotsColor",
							["Value"] = {
								1, -- [1]
								0.7137254901960784, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Name"] = "Dot Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "",
						}, -- [8]
						{
							["Type"] = 6,
							["Key"] = "option4",
							["Value"] = 0,
							["Name"] = "Blank Space",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [9]
						{
							["Type"] = 5,
							["Key"] = "option10",
							["Value"] = "Skull Texture",
							["Name"] = "Skull Texture",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [10]
						{
							["Type"] = 1,
							["Key"] = "skullColor",
							["Value"] = {
								1, -- [1]
								0.4627450980392157, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Name"] = "Skull Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "",
						}, -- [11]
						{
							["Type"] = 2,
							["Max"] = 1,
							["Desc"] = "",
							["Min"] = 0,
							["Name"] = "Alpha",
							["Value"] = 0.2,
							["Fraction"] = true,
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Key"] = "skullAlpha",
						}, -- [12]
						{
							["Type"] = 2,
							["Max"] = 2,
							["Desc"] = "",
							["Min"] = 0.4,
							["Key"] = "skullScale",
							["Value"] = 0.6,
							["Name"] = "Scale",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = true,
						}, -- [13]
					},
					["version"] = -1,
					["Name"] = "Unit - Important [Plater]",
					["NpcNames"] = {
						"164362", -- [1]
						"168882", -- [2]
						"168988", -- [3]
						"170234", -- [4]
						"165905", -- [5]
						"170452", -- [6]
					},
				}, -- [1]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --creates a glow around the icon\n    envTable.buffIconGlow = envTable.buffIconGlow or Plater.CreateIconGlow (self, scriptTable.config.glowColor)\n    \nend",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (scriptTable.config.glowEnabled) then\n        envTable.buffIconGlow:Hide()\n    end\n    \n    if (scriptTable.config.dotsEnabled) then\n        Plater.StopDotAnimation(self, envTable.dotAnimation)\n    end\n    \n    \nend",
					["ScriptType"] = 1,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    \n    \n    \nend",
					["Time"] = 1605214963,
					["url"] = "",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura",
					["Enabled"] = true,
					["Revision"] = 607,
					["semver"] = "",
					["Author"] = "Tercioo-Sylvanas",
					["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["Desc"] = "Add the buff name in the trigger box.",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (scriptTable.config.glowEnabled) then\n        envTable.buffIconGlow:Show()\n    end\n    \n    if (scriptTable.config.dotsEnabled) then\n        envTable.dotAnimation = Plater.PlayDotAnimation(self, 6, scriptTable.config.dotsColor, 6, 3) \n    end\n    \nend\n\n\n\n\n",
					["SpellIds"] = {
						323149, -- [1]
						324392, -- [2]
						340544, -- [3]
						342189, -- [4]
						333227, -- [5]
					},
					["PlaterCore"] = 1,
					["Options"] = {
						{
							["Type"] = 6,
							["Name"] = "Blank Space",
							["Value"] = 0,
							["Key"] = "option1",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [1]
						{
							["Type"] = 5,
							["Name"] = "Option 2",
							["Value"] = "Enter the spell name or spellID of the Buff in the Add Trigger box and hit \"Add\".",
							["Key"] = "option2",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [2]
						{
							["Type"] = 6,
							["Name"] = "Blank Space",
							["Value"] = 0,
							["Key"] = "option3",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [3]
						{
							["Type"] = 4,
							["Name"] = "Glow Enabled",
							["Value"] = false,
							["Key"] = "glowEnabled",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "",
						}, -- [4]
						{
							["Type"] = 1,
							["Name"] = "Glow Color",
							["Value"] = {
								0.403921568627451, -- [1]
								0.00392156862745098, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Key"] = "glowColor",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "",
						}, -- [5]
						{
							["Type"] = 6,
							["Key"] = "option3",
							["Value"] = 0,
							["Name"] = "Blank Space",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [6]
						{
							["Type"] = 4,
							["Name"] = "Dots Enabled",
							["Value"] = true,
							["Key"] = "dotsEnabled",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "",
						}, -- [7]
						{
							["Type"] = 1,
							["Key"] = "dotsColor",
							["Value"] = {
								1, -- [1]
								0.3215686274509804, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Name"] = "Dots Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "",
						}, -- [8]
					},
					["version"] = -1,
					["Name"] = "Aura - Buff Alert [Plater]",
					["NpcNames"] = {
					},
				}, -- [2]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --create a texture to use for a flash behind the cast bar\n    local backGroundFlashTexture = Plater:CreateImage (self, [[Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Alert-Glow]], self:GetWidth()+40, self:GetHeight()+20, \"background\", {0, 400/512, 0, 170/256})\n    backGroundFlashTexture:SetBlendMode (\"ADD\")\n    backGroundFlashTexture:SetPoint (\"center\", self, \"center\")\n    backGroundFlashTexture:SetVertexColor(Plater:ParseColors(scriptTable.config.flashColor))\n    backGroundFlashTexture:Hide()\n    \n    --create the animation hub to hold the flash animation sequence\n    envTable.BackgroundFlash = envTable.BackgroundFlash or Plater:CreateAnimationHub (backGroundFlashTexture, \n        function()\n            backGroundFlashTexture:Show()\n        end,\n        function()\n            backGroundFlashTexture:Hide()\n        end\n    )\n    \n    --create the flash animation sequence\n    local fadeIn = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 1, scriptTable.config.flashDuration/2, 0, 1)\n    local fadeOut = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 2, scriptTable.config.flashDuration/2, 1, 0)\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, scriptTable.config.shakeDuration, scriptTable.config.shakeAmplitude, scriptTable.config.shakeFrequency, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))\n    \n    --update the config for the flash here so it wont need a /reload\n    fadeIn:SetDuration (scriptTable.config.flashDuration/2)\n    fadeOut:SetDuration (scriptTable.config.flashDuration/2)\n    \n    --update the config for the skake here so it wont need a /reload\n    envTable.FrameShake.OriginalAmplitude = scriptTable.config.shakeAmplitude\n    envTable.FrameShake.OriginalDuration = scriptTable.config.shakeDuration\n    envTable.FrameShake.OriginalFrequency = scriptTable.config.shakeFrequency\nend",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    Plater.StopDotAnimation(unitFrame.castBar, envTable.dotAnimation)    \n    \n    envTable.BackgroundFlash:Stop()\n    \n    unitFrame:StopFrameShake (envTable.FrameShake)    \n    \nend\n\n\n",
					["ScriptType"] = 2,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \nend\n\n\n",
					["Time"] = 1604674264,
					["url"] = "",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar_darkorange",
					["Enabled"] = true,
					["Revision"] = 695,
					["semver"] = "",
					["Author"] = "Bombad�o-Azralon",
					["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["Desc"] = "Highlight a very important cast applying several effects into the Cast Bar. Add spell in the Add Trigger field.",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.dotAnimation = Plater.PlayDotAnimation(unitFrame.castBar, 5, scriptTable.config.dotColor, scriptTable.config.xOffset, scriptTable.config.yOffset)\n    \n    \n    envTable.BackgroundFlash:Play()\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    unitFrame:PlayFrameShake (envTable.FrameShake)\n    \n    if (envTable._CanInterrupt) then\n        if (scriptTable.config.useCastbarColor) then\n            self:SetStatusBarColor (Plater:ParseColors (scriptTable.config.castBarColor))\n        end\n    end\n    \nend\n\n\n",
					["SpellIds"] = {
						321247, -- [1]
						334522, -- [2]
						320232, -- [3]
						319962, -- [4]
						325879, -- [5]
						324427, -- [6]
						322999, -- [7]
						325360, -- [8]
						322903, -- [9]
						324103, -- [10]
						333294, -- [11]
						333540, -- [12]
						319521, -- [13]
						326021, -- [14]
						326450, -- [15]
						322711, -- [16]
						329104, -- [17]
						295000, -- [18]
						242391, -- [19]
						320197, -- [20]
						329608, -- [21]
					},
					["PlaterCore"] = 1,
					["Options"] = {
						{
							["Type"] = 6,
							["Key"] = "option1",
							["Value"] = 0,
							["Name"] = "Option 1",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [1]
						{
							["Type"] = 5,
							["Key"] = "option2",
							["Value"] = "Plays a big animation when the cast start.",
							["Name"] = "Option 2",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [2]
						{
							["Type"] = 5,
							["Name"] = "Option 2",
							["Value"] = "Enter the spell name or spellID of the Spell in the Add Trigger box and hit \"Add\".",
							["Key"] = "option2",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [3]
						{
							["Type"] = 6,
							["Key"] = "option4",
							["Value"] = 0,
							["Name"] = "Option 4",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [4]
						{
							["Type"] = 5,
							["Key"] = "option2",
							["Value"] = "Flash:",
							["Name"] = "Flash",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [5]
						{
							["Type"] = 2,
							["Max"] = 1.2,
							["Desc"] = "How long is the flash played when the cast starts.",
							["Min"] = 0.1,
							["Name"] = "Flash Duration",
							["Value"] = 0.8,
							["Fraction"] = true,
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Key"] = "flashDuration",
						}, -- [6]
						{
							["Type"] = 1,
							["Key"] = "flashColor",
							["Value"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["Name"] = "Flash Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "Color of the Flash",
						}, -- [7]
						{
							["Type"] = 6,
							["Key"] = "option7",
							["Value"] = 0,
							["Name"] = "Option 7",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [8]
						{
							["Type"] = 5,
							["Name"] = "Shake",
							["Value"] = "Shake:",
							["Key"] = "option2",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [9]
						{
							["Type"] = 2,
							["Max"] = 0.5,
							["Desc"] = "When the cast starts, there's a small shake in the nameplate, this settings controls how long it takes.",
							["Min"] = 0.1,
							["Name"] = "Shake Duration",
							["Value"] = 0.2,
							["Fraction"] = true,
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Key"] = "shakeDuration",
						}, -- [10]
						{
							["Type"] = 2,
							["Max"] = 10,
							["Desc"] = "How strong is the shake.",
							["Min"] = 1,
							["Name"] = "Shake Amplitude",
							["Value"] = 5,
							["Fraction"] = false,
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Key"] = "shakeAmplitude",
						}, -- [11]
						{
							["Type"] = 2,
							["Max"] = 80,
							["Desc"] = "How fast the shake moves.",
							["Min"] = 1,
							["Name"] = "Shake Frequency",
							["Value"] = 40,
							["Fraction"] = false,
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Key"] = "shakeFrequency",
						}, -- [12]
						{
							["Type"] = 6,
							["Key"] = "option13",
							["Value"] = 0,
							["Name"] = "Option 13",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [13]
						{
							["Type"] = 5,
							["Key"] = "option14",
							["Value"] = "Dot Animation:",
							["Name"] = "Dot Animation",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [14]
						{
							["Type"] = 1,
							["Key"] = "dotColor",
							["Value"] = {
								0.5647058823529412, -- [1]
								0.5647058823529412, -- [2]
								0.5647058823529412, -- [3]
								1, -- [4]
							},
							["Name"] = "Dot Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "Adjust the color of the dots around the nameplate",
						}, -- [15]
						{
							["Type"] = 2,
							["Max"] = 20,
							["Desc"] = "Adjust the width of the dots to better fit in your nameplate.",
							["Min"] = -10,
							["Fraction"] = false,
							["Value"] = 8,
							["Name"] = "Dot X Offset",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Key"] = "xOffset",
						}, -- [16]
						{
							["Type"] = 2,
							["Max"] = 10,
							["Desc"] = "Adjust the height of the dots to better fit in your nameplate.",
							["Min"] = -10,
							["Name"] = "Dot Y Offset",
							["Value"] = 3,
							["Key"] = "yOffset",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [17]
						{
							["Type"] = 6,
							["Key"] = "option18",
							["Value"] = 0,
							["Name"] = "blank",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [18]
						{
							["Type"] = 6,
							["Name"] = "blank",
							["Value"] = 0,
							["Key"] = "option18",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [19]
						{
							["Type"] = 6,
							["Name"] = "blank",
							["Value"] = 0,
							["Key"] = "option18",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [20]
						{
							["Type"] = 6,
							["Key"] = "option18",
							["Value"] = 0,
							["Name"] = "blank",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [21]
						{
							["Type"] = 6,
							["Key"] = "option18",
							["Value"] = 0,
							["Name"] = "blank",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [22]
						{
							["Type"] = 6,
							["Name"] = "blank",
							["Value"] = 0,
							["Key"] = "option18",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [23]
						{
							["Type"] = 5,
							["Key"] = "option19",
							["Value"] = "Cast Bar",
							["Name"] = "Option 19",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [24]
						{
							["Type"] = 4,
							["Key"] = "useCastbarColor",
							["Value"] = true,
							["Name"] = "Use Cast Bar Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "Use cast bar color.",
						}, -- [25]
						{
							["Type"] = 1,
							["Key"] = "castBarColor",
							["Value"] = {
								0.4117647058823529, -- [1]
								1, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Name"] = "Cast Bar Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "Cast bar color.",
						}, -- [26]
					},
					["version"] = -1,
					["Name"] = "Cast - Very Important [Plater]",
					["NpcNames"] = {
					},
				}, -- [3]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --settings\n    envTable.NameplateSizeOffset = scriptTable.config.castBarHeight\n    envTable.ShowArrow = scriptTable.config.showArrow\n    envTable.ArrowAlpha = scriptTable.config.arrowAlpha\n    envTable.HealthBarColor = scriptTable.config.healthBarColor\n    \n    --creates the spark to show the cast progress inside the health bar\n    envTable.overlaySpark = envTable.overlaySpark or Plater:CreateImage (unitFrame.healthBar)\n    envTable.overlaySpark:SetBlendMode (\"ADD\")\n    envTable.overlaySpark.width = 16\n    envTable.overlaySpark.height = 36\n    envTable.overlaySpark.alpha = .9\n    envTable.overlaySpark.texture = [[Interface\\AddOns\\Plater\\images\\spark3]]\n    \n    envTable.topArrow = envTable.topArrow or Plater:CreateImage (unitFrame.healthBar)\n    envTable.topArrow:SetBlendMode (\"ADD\")\n    envTable.topArrow.width = scriptTable.config.arrowWidth\n    envTable.topArrow.height = scriptTable.config.arrowHeight\n    envTable.topArrow.alpha = envTable.ArrowAlpha\n    envTable.topArrow.texture = [[Interface\\BUTTONS\\Arrow-Down-Up]]\n    \n    --scale animation\n    envTable.smallScaleAnimation = envTable.smallScaleAnimation or Plater:CreateAnimationHub (unitFrame.healthBar)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 1, 0.075, 1, 1, 1.08, 1.08)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 2, 0.075, 1, 1, 0.95, 0.95)    \n    --envTable.smallScaleAnimation:Play() --envTable.smallScaleAnimation:Stop()\n    \nend\n\n\n\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    Plater.StopDotAnimation(unitFrame.healthBar, envTable.dotAnimation)\n    \n    envTable.overlaySpark:Hide()\n    envTable.topArrow:Hide()\n    \n    Plater.RefreshNameplateColor (unitFrame)\n    \n    envTable.smallScaleAnimation:Stop()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)\nend\n\n\n",
					["ScriptType"] = 2,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --update the percent\n    envTable.overlaySpark:SetPoint (\"left\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100)-9, 0)\n    \n    envTable.topArrow:SetPoint (\"bottomleft\", unitFrame.healthBar, \"topleft\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100) - 4, 2 )\n    \n    --forces the script to update on a 60Hz base\n    self.ThrottleUpdate = 0\n    \n\nend\n\n\n",
					["Time"] = 1604698647,
					["url"] = "",
					["Icon"] = 2175503,
					["Enabled"] = true,
					["Revision"] = 462,
					["semver"] = "",
					["Author"] = "Bombad�o-Azralon",
					["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["Desc"] = "Apply several animations when the explosion orb cast starts on a Mythic Dungeon with Explosion Affix",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.overlaySpark:Show()\n    \n    if (envTable.ShowArrow) then\n        envTable.topArrow:Show()\n    end\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    envTable.smallScaleAnimation:Play()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \n    envTable.overlaySpark.height = nameplateHeight + 5\n    \n    envTable.dotAnimation = Plater.PlayDotAnimation(unitFrame.healthBar, 2, scriptTable.config.dotColor, scriptTable.config.xOffset, scriptTable.config.yOffset)\n    \n    self:SetStatusBarColor (Plater:ParseColors (scriptTable.config.castBarColor))\nend\n\n\n\n\n\n\n",
					["SpellIds"] = {
						240446, -- [1]
					},
					["PlaterCore"] = 1,
					["Options"] = {
						{
							["Type"] = 6,
							["Key"] = "option1",
							["Value"] = 0,
							["Name"] = "Option 1",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [1]
						{
							["Type"] = 5,
							["Key"] = "option2",
							["Value"] = "Plays a special animation showing the explosion time.",
							["Name"] = "Option 2",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [2]
						{
							["Type"] = 6,
							["Key"] = "option3",
							["Value"] = 0,
							["Name"] = "Option 3",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [3]
						{
							["Type"] = 2,
							["Max"] = 6,
							["Desc"] = "Increases the cast bar height by this value",
							["Min"] = 0,
							["Fraction"] = false,
							["Value"] = 3,
							["Name"] = "Cast Bar Height Mod",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Key"] = "castBarHeight",
						}, -- [4]
						{
							["Type"] = 1,
							["Key"] = "castBarColor",
							["Value"] = {
								1, -- [1]
								0.5843137254901961, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Name"] = "Cast Bar Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "Changes the cast bar color to this one.",
						}, -- [5]
						{
							["Type"] = 6,
							["Key"] = "option7",
							["Value"] = 0,
							["Name"] = "Option 7",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [6]
						{
							["Type"] = 5,
							["Key"] = "option6",
							["Value"] = "Arrow:",
							["Name"] = "Arrow:",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [7]
						{
							["Type"] = 4,
							["Key"] = "showArrow",
							["Value"] = true,
							["Name"] = "Show Arrow",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "Show an arrow above the nameplate showing the cast bar progress.",
						}, -- [8]
						{
							["Type"] = 2,
							["Max"] = 1,
							["Desc"] = "Arrow alpha.",
							["Min"] = 0,
							["Fraction"] = true,
							["Value"] = 0.5,
							["Name"] = "Arrow Alpha",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Key"] = "arrowAlpha",
						}, -- [9]
						{
							["Type"] = 2,
							["Max"] = 12,
							["Desc"] = "Arrow Width.",
							["Min"] = 4,
							["Name"] = "Arrow Width",
							["Value"] = 8,
							["Key"] = "arrowWidth",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [10]
						{
							["Type"] = 2,
							["Max"] = 12,
							["Desc"] = "Arrow Height.",
							["Min"] = 4,
							["Fraction"] = false,
							["Value"] = 8,
							["Name"] = "Arrow Height",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Key"] = "arrowHeight",
						}, -- [11]
						{
							["Type"] = 6,
							["Key"] = "option13",
							["Value"] = 0,
							["Name"] = "Option 13",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [12]
						{
							["Type"] = 5,
							["Key"] = "option12",
							["Value"] = "Dot Animation:",
							["Name"] = "Dot Animation:",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [13]
						{
							["Type"] = 1,
							["Key"] = "dotColor",
							["Value"] = {
								1, -- [1]
								0.615686274509804, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Name"] = "Dot Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "Adjust the color of the dot animation.",
						}, -- [14]
						{
							["Type"] = 2,
							["Max"] = 10,
							["Desc"] = "Dot X Offset",
							["Min"] = -10,
							["Name"] = "Dot X Offset",
							["Value"] = 4,
							["Fraction"] = false,
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Key"] = "xOffset",
						}, -- [15]
						{
							["Type"] = 2,
							["Max"] = 10,
							["Desc"] = "Dot Y Offset",
							["Min"] = -10,
							["Key"] = "yOffset",
							["Value"] = 3,
							["Name"] = "Dot Y Offset",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [16]
					},
					["version"] = -1,
					["Name"] = "Explosion Affix M+ [Plater]",
					["NpcNames"] = {
					},
				}, -- [4]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --creates a glow around the icon\n    envTable.buffIconGlow = envTable.buffIconGlow or Plater.CreateIconGlow (self, scriptTable.config.glowColor)\n    \nend\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (scriptTable.config.glowEnabled) then\n        envTable.buffIconGlow:Hide()\n    end\n    \n    if (scriptTable.config.dotsEnabled) then\n        Plater.StopDotAnimation(self, envTable.dotAnimation)\n    end\n    \n    \nend\n\n\n",
					["ScriptType"] = 1,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["Time"] = 1604454032,
					["url"] = "",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura",
					["Enabled"] = true,
					["Revision"] = 351,
					["semver"] = "",
					["Author"] = "Tercioo-Sylvanas",
					["Desc"] = "Add the debuff name in the trigger box.",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    if (scriptTable.config.glowEnabled) then\n        envTable.buffIconGlow:Show()\n    end\n    \n    if (scriptTable.config.dotsEnabled) then\n        envTable.dotAnimation = Plater.PlayDotAnimation(self, 6, scriptTable.config.dotsColor, 6, 3) \n    end\nend\n\n\n",
					["SpellIds"] = {
						337220, -- [1]
						337253, -- [2]
						337251, -- [3]
					},
					["PlaterCore"] = 1,
					["Options"] = {
						{
							["Type"] = 6,
							["Key"] = "option1",
							["Value"] = 0,
							["Name"] = "Blank Space",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [1]
						{
							["Type"] = 5,
							["Key"] = "option2",
							["Value"] = "Enter the spell name or spellID of the Buff in the Add Trigger box and hit \"Add\".",
							["Name"] = "Option 2",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [2]
						{
							["Type"] = 6,
							["Key"] = "option3",
							["Value"] = 0,
							["Name"] = "Blank Space",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [3]
						{
							["Type"] = 4,
							["Key"] = "glowEnabled",
							["Value"] = false,
							["Name"] = "Glow Enabled",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "",
						}, -- [4]
						{
							["Type"] = 1,
							["Key"] = "glowColor",
							["Value"] = {
								0.403921568627451, -- [1]
								0.00392156862745098, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Name"] = "Glow Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "",
						}, -- [5]
						{
							["Type"] = 6,
							["Name"] = "Blank Space",
							["Value"] = 0,
							["Key"] = "option3",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [6]
						{
							["Type"] = 4,
							["Key"] = "dotsEnabled",
							["Value"] = true,
							["Name"] = "Dots Enabled",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "",
						}, -- [7]
						{
							["Type"] = 1,
							["Name"] = "Dots Color",
							["Value"] = {
								1, -- [1]
								0.3215686274509804, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Key"] = "dotsColor",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "",
						}, -- [8]
					},
					["version"] = -1,
					["Name"] = "Aura - Debuff Alert [Plater]",
					["NpcNames"] = {
					},
				}, -- [5]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --settings\n    envTable.NameplateSizeOffset = scriptTable.config.castBarHeight\n    envTable.ShowArrow = scriptTable.config.showArrow\n    envTable.ArrowAlpha = scriptTable.config.arrowAlpha\n    envTable.HealthBarColor = scriptTable.config.healthBarColor\n    \n    --creates the spark to show the cast progress inside the health bar\n    envTable.overlaySpark = envTable.overlaySpark or Plater:CreateImage (unitFrame.healthBar)\n    envTable.overlaySpark:SetBlendMode (\"ADD\")\n    envTable.overlaySpark.width = 16\n    envTable.overlaySpark.height = 36\n    envTable.overlaySpark.alpha = .9\n    envTable.overlaySpark.texture = [[Interface\\AddOns\\Plater\\images\\spark3]]\n    \n    envTable.topArrow = envTable.topArrow or Plater:CreateImage (unitFrame.healthBar)\n    envTable.topArrow:SetBlendMode (\"ADD\")\n    envTable.topArrow.width = scriptTable.config.arrowWidth\n    envTable.topArrow.height = scriptTable.config.arrowHeight\n    envTable.topArrow.alpha = envTable.ArrowAlpha\n    envTable.topArrow.texture = [[Interface\\BUTTONS\\Arrow-Down-Up]]\n    \n    --scale animation\n    envTable.smallScaleAnimation = envTable.smallScaleAnimation or Plater:CreateAnimationHub (unitFrame.healthBar)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 1, 0.075, 1, 1, 1.08, 1.08)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 2, 0.075, 1, 1, 0.95, 0.95)    \n    --envTable.smallScaleAnimation:Play() --envTable.smallScaleAnimation:Stop()\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, scriptTable.config.shakeDuration, scriptTable.config.shakeAmplitude, scriptTable.config.shakeFrequency, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))    \n    \n    --update the config for the skake here so it wont need a /reload\n    envTable.FrameShake.OriginalAmplitude = scriptTable.config.shakeAmplitude\n    envTable.FrameShake.OriginalDuration = scriptTable.config.shakeDuration\n    envTable.FrameShake.OriginalFrequency = scriptTable.config.shakeFrequency\nend\n\n\n\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    Plater.StopDotAnimation(unitFrame.healthBar, envTable.dotAnimation)\n    \n    envTable.overlaySpark:Hide()\n    envTable.topArrow:Hide()\n    \n    Plater.RefreshNameplateColor (unitFrame)\n    \n    envTable.smallScaleAnimation:Stop()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)\nend\n\n\n",
					["ScriptType"] = 2,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --update the percent\n    envTable.overlaySpark:SetPoint (\"left\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100)-9, 0)\n    \n    envTable.topArrow:SetPoint (\"bottomleft\", unitFrame.healthBar, \"topleft\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100) - 4, 2 )\n    \n    --forces the script to update on a 60Hz base\n    self.ThrottleUpdate = 0.016\n    \n    --update the health bar color coloring from yellow to red\n    --Plater.SetNameplateColor (unitFrame, max (envTable._CastPercent/100, .66), abs (envTable._CastPercent/100 - 1), 0, 1)\n    \n    Plater.SetNameplateColor (unitFrame, envTable.HealthBarColor)\nend\n\n\n",
					["Time"] = 1604617977,
					["url"] = "",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar_red",
					["Enabled"] = true,
					["Revision"] = 513,
					["semver"] = "",
					["Author"] = "Bombad�o-Azralon",
					["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["Desc"] = "Used on casts that make the mob explode or transform if the cast passes.",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.overlaySpark:Show()\n    \n    if (envTable.ShowArrow) then\n        envTable.topArrow:Show()\n    end\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    envTable.smallScaleAnimation:Play()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \n    envTable.overlaySpark.height = nameplateHeight + 5\n    \n    envTable.dotAnimation = Plater.PlayDotAnimation(unitFrame.healthBar, 2, scriptTable.config.dotColor, scriptTable.config.xOffset, scriptTable.config.yOffset)\n    \n    \nend",
					["SpellIds"] = {
						332329, -- [1]
						320103, -- [2]
						321406, -- [3]
						335817, -- [4]
						321061, -- [5]
						320141, -- [6]
						326171, -- [7]
					},
					["PlaterCore"] = 1,
					["Options"] = {
						{
							["Type"] = 6,
							["Name"] = "Option 1",
							["Value"] = 0,
							["Key"] = "option1",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [1]
						{
							["Type"] = 5,
							["Name"] = "Option 2",
							["Value"] = "Plays a special animation showing the explosion time.",
							["Key"] = "option2",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [2]
						{
							["Type"] = 6,
							["Name"] = "Option 3",
							["Value"] = 0,
							["Key"] = "option3",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [3]
						{
							["Type"] = 2,
							["Max"] = 6,
							["Desc"] = "Increases the health bar height by this value",
							["Min"] = 0,
							["Fraction"] = false,
							["Value"] = 3,
							["Key"] = "castBarHeight",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Name"] = "Health Bar Height Mod",
						}, -- [4]
						{
							["Type"] = 1,
							["Name"] = "Health Bar Color",
							["Value"] = {
								1, -- [1]
								0.5843137254901961, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Key"] = "healthBarColor",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "Changes the health bar color to this one.",
						}, -- [5]
						{
							["Type"] = 6,
							["Name"] = "Option 7",
							["Value"] = 0,
							["Key"] = "option7",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [6]
						{
							["Type"] = 5,
							["Name"] = "Arrow:",
							["Value"] = "Arrow:",
							["Key"] = "option6",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [7]
						{
							["Type"] = 4,
							["Name"] = "Show Arrow",
							["Value"] = true,
							["Key"] = "showArrow",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "Show an arrow above the nameplate showing the cast bar progress.",
						}, -- [8]
						{
							["Type"] = 2,
							["Max"] = 1,
							["Desc"] = "Arrow alpha.",
							["Min"] = 0,
							["Fraction"] = true,
							["Value"] = 0.5,
							["Key"] = "arrowAlpha",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Name"] = "Arrow Alpha",
						}, -- [9]
						{
							["Type"] = 2,
							["Max"] = 12,
							["Desc"] = "Arrow Width.",
							["Min"] = 4,
							["Name"] = "Arrow Width",
							["Value"] = 8,
							["Fraction"] = false,
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Key"] = "arrowWidth",
						}, -- [10]
						{
							["Type"] = 2,
							["Max"] = 12,
							["Desc"] = "Arrow Height.",
							["Min"] = 4,
							["Fraction"] = false,
							["Value"] = 8,
							["Key"] = "arrowHeight",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Name"] = "Arrow Height",
						}, -- [11]
						{
							["Type"] = 6,
							["Name"] = "Option 13",
							["Value"] = 0,
							["Key"] = "option13",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [12]
						{
							["Type"] = 5,
							["Name"] = "Dot Animation:",
							["Value"] = "Dot Animation:",
							["Key"] = "option12",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [13]
						{
							["Type"] = 1,
							["Name"] = "Dot Color",
							["Value"] = {
								1, -- [1]
								0.615686274509804, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Key"] = "dotColor",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "Adjust the color of the dot animation.",
						}, -- [14]
						{
							["Type"] = 2,
							["Max"] = 10,
							["Desc"] = "Dot X Offset",
							["Min"] = -10,
							["Name"] = "Dot X Offset",
							["Value"] = 4,
							["Key"] = "xOffset",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [15]
						{
							["Type"] = 2,
							["Max"] = 10,
							["Desc"] = "Dot Y Offset",
							["Min"] = -10,
							["Key"] = "yOffset",
							["Value"] = 3,
							["Fraction"] = false,
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Name"] = "Dot Y Offset",
						}, -- [16]
					},
					["version"] = -1,
					["Name"] = "Cast - Ultra Important [P]",
					["NpcNames"] = {
					},
				}, -- [6]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --castbar color (when can be interrupted)\n    envTable.CastbarColor = scriptTable.config.castbarColor\n    \n    --flash duration\n    local CONFIG_BACKGROUND_FLASH_DURATION = scriptTable.config.flashDuration\n    \n    --add this value to the cast bar height\n    envTable.CastBarHeightAdd = scriptTable.config.castBarHeight\n    \n    --create a fast flash above the cast bar\n    envTable.FullBarFlash = envTable.FullBarFlash or Plater.CreateFlash (self, 0.05, 1, \"white\")\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, scriptTable.config.shakeDuration, scriptTable.config.shakeAmplitude, scriptTable.config.shakeFrequency, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))\n    \n    --create a texture to use for a flash behind the cast bar\n    local backGroundFlashTexture = Plater:CreateImage (self, [[Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Alert-Glow]], self:GetWidth()+60, self:GetHeight()+50, \"background\", {0, 400/512, 0, 170/256})\n    backGroundFlashTexture:SetBlendMode (\"ADD\")\n    backGroundFlashTexture:SetPoint (\"center\", self, \"center\")\n    backGroundFlashTexture:Hide()\n    \n    --create the animation hub to hold the flash animation sequence\n    envTable.BackgroundFlash = envTable.BackgroundFlash or Plater:CreateAnimationHub (backGroundFlashTexture, \n        function()\n            backGroundFlashTexture:Show()\n        end,\n        function()\n            backGroundFlashTexture:Hide()\n        end\n    )\n    \n    --create the flash animation sequence\n    envTable.BackgroundFlash.fadeIn = envTable.BackgroundFlash.fadeIn or Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 1, CONFIG_BACKGROUND_FLASH_DURATION/2, 0, .75)\n    envTable.BackgroundFlash.fadeIn:SetDuration(CONFIG_BACKGROUND_FLASH_DURATION/2)\n    \n    envTable.BackgroundFlash.fadeOut = envTable.BackgroundFlash.fadeOut or Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 2, CONFIG_BACKGROUND_FLASH_DURATION/2, 1, 0)    \n    envTable.BackgroundFlash.fadeOut:SetDuration(CONFIG_BACKGROUND_FLASH_DURATION/2)\n    \n    --envTable.BackgroundFlash:Play() --envTable.BackgroundFlash:Stop()    \n    \n    \n    \n    \n    \nend\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\" or Plater.ZoneInstanceType == \"none\") then\n        return\n    end    \n    \n    unitFrame.castBar:SetHeight (envTable._DefaultHeight)\n    \n    --stop the camera shake\n    unitFrame:StopFrameShake (envTable.FrameShake)\n    \n    envTable.FullBarFlash:Stop()\n    envTable.BackgroundFlash:Stop()\n    \n    unitFrame.castBar.Spark:SetHeight(unitFrame.castBar:GetHeight())\n    \nend\n\n\n\n\n\n",
					["ScriptType"] = 2,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \nend\n\n\n",
					["Time"] = 1604696442,
					["url"] = "",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar_orange",
					["Enabled"] = true,
					["Revision"] = 970,
					["semver"] = "",
					["Author"] = "Tercioo-Sylvanas",
					["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend",
					["Desc"] = "Flash, Bounce and Red Color the CastBar border when when an important cast is happening. Add spell in the Add Trigger field.",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\" or Plater.ZoneInstanceType == \"none\") then\n        return\n    end\n    \n    --play flash animations\n    envTable.FullBarFlash:Play()\n    \n    --envTable.currentHeight = unitFrame.castBar:GetHeight()\n    \n    --restoring the default size (not required since it already restore in the hide script)\n    if (envTable.OriginalHeight) then\n        self:SetHeight (envTable.OriginalHeight)\n    end\n    \n    --increase the cast bar size\n    local height = self:GetHeight()\n    envTable.OriginalHeight = height\n    \n    self:SetHeight (height + envTable.CastBarHeightAdd)\n    \n    Plater.SetCastBarBorderColor (self, 1, .2, .2, 0.4)\n    \n    unitFrame:PlayFrameShake (envTable.FrameShake)\n    \n    --set the color of the cast bar to dark orange (only if can be interrupted)\n    --Plater auto set this color to default when a new cast starts, no need to reset this value at OnHide.    \n    if (envTable._CanInterrupt) then\n        if (scriptTable.config.useCastbarColor) then\n            self:SetStatusBarColor (Plater:ParseColors (envTable.CastbarColor))\n        end\n    end\n    \n    envTable.BackgroundFlash:Play()\n    \n    unitFrame.castBar.Spark:SetHeight(unitFrame.castBar:GetHeight())\n    \nend\n\n\n\n\n\n\n\n\n",
					["SpellIds"] = {
						338353, -- [1]
						334748, -- [2]
						334749, -- [3]
						320784, -- [4]
						341352, -- [5]
						341520, -- [6]
						341522, -- [7]
						336005, -- [8]
						339777, -- [9]
						331933, -- [10]
						326617, -- [11]
						324914, -- [12]
						324776, -- [13]
						326046, -- [14]
						340634, -- [15]
						319070, -- [16]
						328295, -- [17]
						317936, -- [18]
						327413, -- [19]
						319654, -- [20]
						323821, -- [21]
						320772, -- [22]
						324293, -- [23]
						330562, -- [24]
						330868, -- [25]
						341902, -- [26]
						342139, -- [27]
						342675, -- [28]
						323190, -- [29]
						332836, -- [30]
						327648, -- [31]
						328217, -- [32]
						322938, -- [33]
						340544, -- [34]
						325876, -- [35]
						325700, -- [36]
						323552, -- [37]
						332666, -- [38]
						332612, -- [39]
						332706, -- [40]
						340026, -- [41]
						294171, -- [42]
						292910, -- [43]
						294165, -- [44]
						338871, -- [45]
						330813, -- [46]
						335694, -- [47]
						327461, -- [48]
						329787, -- [49]
						304946, -- [50]
						15245, -- [51]
						276754, -- [52]
						304831, -- [53]
						277036, -- [54]
						320657, -- [55]
						294362, -- [56]
						270248, -- [57]
						292926, -- [58]
					},
					["PlaterCore"] = 1,
					["Options"] = {
						{
							["Type"] = 6,
							["Name"] = "Blank Line",
							["Value"] = 0,
							["Key"] = "option1",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [1]
						{
							["Type"] = 5,
							["Name"] = "Option 2",
							["Value"] = "Produces a notable effect in the cast bar when a spell from the 'Triggers' starts to cast.",
							["Key"] = "option2",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [2]
						{
							["Type"] = 5,
							["Name"] = "Option 3",
							["Value"] = "Enter the spell name or spellID of the Spell in the Add Trigger box and hit \"Add\".",
							["Key"] = "option3",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [3]
						{
							["Type"] = 6,
							["Name"] = "Blank Space",
							["Value"] = 0,
							["Key"] = "option4",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [4]
						{
							["Type"] = 4,
							["Name"] = "Cast Bar Color Enabled",
							["Value"] = true,
							["Key"] = "useCastbarColor",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "When enabled, changes the cast bar color,",
						}, -- [5]
						{
							["Type"] = 1,
							["Name"] = "Cast Bar Color",
							["Value"] = {
								1, -- [1]
								0.4313725490196079, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Key"] = "castbarColor",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "Color of the cast bar.",
						}, -- [6]
						{
							["Type"] = 6,
							["Name"] = "Blank Line",
							["Value"] = 0,
							["Key"] = "option7",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [7]
						{
							["Type"] = 2,
							["Max"] = 1,
							["Desc"] = "When the cast starts it flash rapidly, adjust how fast it flashes. Value is milliseconds.",
							["Min"] = 0.05,
							["Fraction"] = true,
							["Value"] = 0.4,
							["Key"] = "flashDuration",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Name"] = "Flash Duration",
						}, -- [8]
						{
							["Type"] = 2,
							["Max"] = 10,
							["Desc"] = "Increases the cast bar height by this value",
							["Min"] = 0,
							["Fraction"] = false,
							["Value"] = 5,
							["Key"] = "castBarHeight",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Name"] = "Cast Bar Height Mod",
						}, -- [9]
						{
							["Type"] = 2,
							["Max"] = 1,
							["Desc"] = "When the cast starts, there's a small shake in the nameplate, this settings controls how long it takes.",
							["Min"] = 0.1,
							["Fraction"] = true,
							["Value"] = 0.2,
							["Key"] = "shakeDuration",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Name"] = "Shake Duration",
						}, -- [10]
						{
							["Type"] = 2,
							["Max"] = 100,
							["Desc"] = "How strong is the shake.",
							["Min"] = 2,
							["Name"] = "Shake Amplitude",
							["Value"] = 8,
							["Key"] = "shakeAmplitude",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [11]
						{
							["Type"] = 2,
							["Max"] = 80,
							["Desc"] = "How fast the shake moves.",
							["Min"] = 1,
							["Name"] = "Shake Frequency",
							["Value"] = 40,
							["Key"] = "shakeFrequency",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [12]
					},
					["version"] = -1,
					["Name"] = "Cast - Big Alert [Plater]",
					["NpcNames"] = {
					},
				}, -- [7]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --flash duration\n    local CONFIG_FLASH_DURATION = scriptTable.config.flashDuration\n    \n    --manually create a new texture for the flash animation\n    if (not envTable.SmallFlashTexture) then\n        envTable.SmallFlashTexture = envTable.SmallFlashTexture or Plater:CreateImage (unitFrame.castBar)\n        envTable.SmallFlashTexture:SetColorTexture (1, 1, 1)\n        envTable.SmallFlashTexture:SetAllPoints()\n    end\n    \n    --manually create a flash animation using the framework\n    if (not envTable.SmallFlashAnimationHub) then \n        \n        local onPlay = function()\n            envTable.SmallFlashTexture:Show()\n        end\n        \n        local onFinished = function()\n            envTable.SmallFlashTexture:Hide()\n        end\n        \n        local animationHub = Plater:CreateAnimationHub (envTable.SmallFlashTexture, onPlay, onFinished)\n        envTable.flashIn = Plater:CreateAnimation (animationHub, \"Alpha\", 1, CONFIG_FLASH_DURATION/2, 0, .6)\n        envTable.flashOut = Plater:CreateAnimation (animationHub, \"Alpha\", 2, CONFIG_FLASH_DURATION/2, 1, 0)\n        \n        envTable.SmallFlashAnimationHub = animationHub\n    end\n    \n    envTable.flashIn:SetDuration(scriptTable.config.flashDuration / 2)\n    envTable.flashOut:SetDuration(scriptTable.config.flashDuration / 2)\n    envTable.SmallFlashTexture:SetColorTexture (Plater:ParseColors(scriptTable.config.flashColor))\n    \nend\n\n\n\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.SmallFlashAnimationHub:Stop()\n    \nend\n\n\n",
					["ScriptType"] = 2,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    \n    \nend\n\n\n",
					["Time"] = 1604617585,
					["url"] = "",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar",
					["Enabled"] = true,
					["Revision"] = 595,
					["semver"] = "",
					["Author"] = "Tercioo-Sylvanas",
					["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["Desc"] = "Flashes the Cast Bar when a spell in the trigger list is Cast. Add spell in the Add Trigger field.",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.SmallFlashAnimationHub:Play()\n    \nend\n\n\n",
					["SpellIds"] = {
						320170, -- [1]
						320171, -- [2]
						320462, -- [3]
						330712, -- [4]
						332170, -- [5]
						333875, -- [6]
						326836, -- [7]
						342135, -- [8]
						333861, -- [9]
						341969, -- [10]
						317963, -- [11]
						327481, -- [12]
						328331, -- [13]
						322614, -- [14]
						325701, -- [15]
						326438, -- [16]
						323538, -- [17]
						321764, -- [18]
						296523, -- [19]
						330755, -- [20]
						295929, -- [21]
						296019, -- [22]
						335685, -- [23]
						170751, -- [24]
						342207, -- [25]
					},
					["PlaterCore"] = 1,
					["Options"] = {
						{
							["Type"] = 6,
							["Key"] = "option1",
							["Value"] = 0,
							["Name"] = "Option 1",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [1]
						{
							["Type"] = 5,
							["Key"] = "option2",
							["Value"] = "Plays a small animation when the cast start.",
							["Name"] = "Option 2",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [2]
						{
							["Type"] = 5,
							["Name"] = "Option 2",
							["Value"] = "Enter the spell name or spellID of the Spell in the Add Trigger box and hit \"Add\".",
							["Key"] = "option2",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [3]
						{
							["Type"] = 6,
							["Key"] = "option3",
							["Value"] = 0,
							["Name"] = "Option 3",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [4]
						{
							["Type"] = 2,
							["Max"] = 1.2,
							["Desc"] = "How long is the flash played when the cast starts.",
							["Min"] = 0.1,
							["Fraction"] = true,
							["Value"] = 0.6,
							["Name"] = "Flash Duration",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Key"] = "flashDuration",
						}, -- [5]
						{
							["Type"] = 1,
							["Key"] = "flashColor",
							["Value"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["Name"] = "Flash Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "Color of the Flash",
						}, -- [6]
					},
					["version"] = -1,
					["Name"] = "Cast - Small Alert [Plater]",
					["NpcNames"] = {
					},
				}, -- [8]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \n    --check for marks\n    function  envTable.CheckMark (unitId, unitFrame)\n        if (not GetRaidTargetIndex(unitId)) then\n            if (scriptTable.config.onlyInCombat) then\n                if (not UnitAffectingCombat(unitId)) then\n                    return\n                end                \n            end\n            \n            SetRaidTarget(unitId, 8)\n        end       \n    end\nend\n\n\n--163520 - forsworn squad-leader\n--163618 - zolramus necromancer - The Necrotic Wake\n--164506 - anciet captain - theater of pain\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["ScriptType"] = 3,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.CheckMark (unitId, unitFrame)\nend\n\n\n",
					["Time"] = 1604696441,
					["url"] = "",
					["Icon"] = "Interface\\Worldmap\\GlowSkull_64Grey",
					["Enabled"] = true,
					["Revision"] = 63,
					["semver"] = "",
					["Author"] = "Aelerolor-Torghast",
					["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["Desc"] = "Auto set skull marker",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.CheckMark (unitId, unitFrame)\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
					["SpellIds"] = {
					},
					["PlaterCore"] = 1,
					["Options"] = {
						{
							["Type"] = 5,
							["Key"] = "option1",
							["Value"] = "Auto set a raid target Skull on the unit.",
							["Name"] = "Option 1",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [1]
						{
							["Type"] = 6,
							["Key"] = "option2",
							["Value"] = 0,
							["Name"] = "Option 2",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [2]
						{
							["Type"] = 4,
							["Key"] = "onlyInCombat",
							["Value"] = false,
							["Name"] = "Only in Combat",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "Set the mark only if the unit is in combat.",
						}, -- [3]
					},
					["version"] = -1,
					["Name"] = "Auto Set Skull",
					["NpcNames"] = {
						"163520", -- [1]
						"163618", -- [2]
						"164506", -- [3]
					},
				}, -- [9]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \nend\n\n--[=[\n\n154564 - debug\n\n168098 - empowered coldheart agent\n156212 - coldheart agent\n\n\n\n--]=]",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    Plater.StopDotAnimation(unitFrame.healthBar, unitFrame.healthBar.MainTargetDotAnimation)\n    \n    --restore the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)    \n    \nend\n\n\n\n\n",
					["ScriptType"] = 3,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --check if can change the nameplate color\n    if (scriptTable.config.changeNameplateColor) then\n        Plater.SetNameplateColor (unitFrame, scriptTable.config.nameplateColor)\n    end\n    \nend\n\n\n\n\n",
					["Time"] = 1604607993,
					["url"] = "",
					["Icon"] = "Interface\\AddOns\\Plater\\media\\skullbones_64",
					["Enabled"] = true,
					["Revision"] = 406,
					["semver"] = "",
					["Author"] = "Izimode-Azralon",
					["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["Desc"] = "Highlight a nameplate of an important Add. Add the unit name or NpcID into the trigger box to add more.",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    Plater.StopDotAnimation(unitFrame.healthBar, unitFrame.healthBar.MainTargetDotAnimation)\n    \n    unitFrame.healthBar.MainTargetDotAnimation = Plater.PlayDotAnimation(unitFrame.healthBar, 2, scriptTable.config.dotsColor, 3, 4) \n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + scriptTable.config.nameplateSizeOffset)\n    \nend\n\n\n\n\n\n\n\n",
					["SpellIds"] = {
					},
					["PlaterCore"] = 1,
					["Options"] = {
						{
							["Type"] = 6,
							["Name"] = "Blank Space",
							["Value"] = 0,
							["Key"] = "option4",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [1]
						{
							["Type"] = 5,
							["Name"] = "Option 6",
							["Value"] = "Enter the npc name or npcId in the \"Add Trigger\" box and hit \"Add\".",
							["Key"] = "option6",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [2]
						{
							["Type"] = 6,
							["Key"] = "option4",
							["Value"] = 0,
							["Name"] = "Blank Space",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [3]
						{
							["Type"] = 4,
							["Name"] = "Change Nameplate Color",
							["Value"] = true,
							["Key"] = "changeNameplateColor",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "change to true to change the color",
						}, -- [4]
						{
							["Type"] = 1,
							["Name"] = "Nameplate Color",
							["Value"] = {
								1, -- [1]
								0, -- [2]
								0.5254901960784314, -- [3]
								1, -- [4]
							},
							["Key"] = "nameplateColor",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "",
						}, -- [5]
						{
							["Type"] = 2,
							["Max"] = 6,
							["Desc"] = "increase the nameplate height by this value",
							["Min"] = 0,
							["Key"] = "nameplateSizeOffset",
							["Value"] = 0,
							["Fraction"] = false,
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Name"] = "Nameplate Size Offset",
						}, -- [6]
						{
							["Type"] = 6,
							["Key"] = "option4",
							["Value"] = 0,
							["Name"] = "Blank Space",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [7]
						{
							["Type"] = 1,
							["Name"] = "Dot Color",
							["Value"] = {
								1, -- [1]
								0.7137254901960784, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Key"] = "dotsColor",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "",
						}, -- [8]
						{
							["Type"] = 6,
							["Name"] = "Blank Space",
							["Value"] = 0,
							["Key"] = "option4",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [9]
					},
					["version"] = -1,
					["Name"] = "Unit - Main Target [P]",
					["NpcNames"] = {
						"156212", -- [1]
						"168098", -- [2]
					},
				}, -- [10]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --settings (require a /reload after editing any setting)\n    do\n        --blink and glow\n        envTable.BlinkEnabled = scriptTable.config.blinkEnabled\n        envTable.GlowEnabled = scriptTable.config.glowEnabled \n        envTable.ChangeNameplateColor = scriptTable.config.changeNameplateColor;\n        envTable.TimeLeftToBlink = scriptTable.config.timeleftToBlink;\n        envTable.BlinkSpeed = scriptTable.config.blinkSpeed; \n        envTable.BlinkColor = scriptTable.config.blinkColor; \n        envTable.BlinkMaxAlpha = scriptTable.config.blinkMaxAlpha; \n        envTable.NameplateColor = scriptTable.config.nameplateColor; \n        \n        --text color\n        envTable.TimerColorEnabled = scriptTable.config.timerColorEnabled \n        envTable.TimeLeftWarning = scriptTable.config.timeLeftWarning;\n        envTable.TimeLeftCritical = scriptTable.config.timeLeftCritical;\n        envTable.TextColor_Warning = scriptTable.config.warningColor; \n        envTable.TextColor_Critical = scriptTable.config.criticalColor; \n        \n        --list of spellIDs to ignore\n        envTable.IgnoredSpellID = {\n            [12] = true, --use a simple comma here\n            [13] = true,\n        }\n    end\n    \n    \n    --private\n    do\n        --if not envTable.blinkTexture then\n        envTable.blinkTexture = Plater:CreateImage (self, \"\", 1, 1, \"overlay\")\n        envTable.blinkTexture:SetPoint ('center', 0, 0)\n        envTable.blinkTexture:Hide()\n        \n        local onPlay = function()\n            envTable.blinkTexture:Show() \n            envTable.blinkTexture.color = envTable.BlinkColor\n        end\n        local onStop = function()\n            envTable.blinkTexture:Hide()  \n        end\n        envTable.blinkAnimation = Plater:CreateAnimationHub (envTable.blinkTexture, onPlay, onStop)\n        Plater:CreateAnimation (envTable.blinkAnimation, \"ALPHA\", 1, envTable.BlinkSpeed / 2, 0, envTable.BlinkMaxAlpha)\n        Plater:CreateAnimation (envTable.blinkAnimation, \"ALPHA\", 2, envTable.BlinkSpeed / 2, envTable.BlinkMaxAlpha, 0)\n        --end\n        \n        envTable.glowEffect = envTable.glowEffect or self.overlay or Plater.CreateIconGlow (self)\n        --envTable.glowEffect = envTable.glowEffect or Plater.CreateIconGlow (self)\n        --envTable.glowEffect:Show() --envTable.glowEffect:Hide()\n        \n    end\n    \nend\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    envTable.blinkAnimation:Stop()\n    envTable.blinkTexture:Hide()\n    envTable.blinkAnimation:Stop()\n    envTable.glowEffect:Stop()\n    Plater:SetFontColor (self.Cooldown.Timer, Plater.db.profile.aura_timer_text_color)\nend\n\n\n",
					["OptionsValues"] = {
					},
					["ScriptType"] = 1,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    local timeLeft = envTable._RemainingTime\n    \n    --check if the spellID isn't being ignored\n    if (envTable.IgnoredSpellID [envTable._SpellID]) then\n        return\n    end\n    \n    --check the time left and start or stop the blink animation and also check if the time left is > zero\n    if ((envTable.BlinkEnabled or envTable.GlowEnabled) and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftToBlink) then\n            --blink effect\n            if (envTable.BlinkEnabled) then\n                if (not envTable.blinkAnimation:IsPlaying()) then\n                    envTable.blinkAnimation:Play()\n                end\n            end\n            --glow effect\n            if (envTable.GlowEnabled) then\n                envTable.glowEffect:Show()\n            end\n            --nameplate color\n            if (envTable.ChangeNameplateColor) then\n                Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n            end\n        else\n            --blink effect\n            if (envTable.blinkAnimation:IsPlaying()) then\n                envTable.blinkAnimation:Stop()\n            end\n            --glow effect\n            if (envTable.GlowEnabled and envTable.glowEffect:IsShown()) then\n                envTable.glowEffect:Hide()\n            end\n        end\n    end\n    \n    --timer color\n    if (envTable.TimerColorEnabled and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftCritical) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Critical)\n        elseif (timeLeft < envTable.TimeLeftWarning) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Warning)        \n        else\n            Plater:SetFontColor (self.Cooldown.Timer, Plater.db.profile.aura_timer_text_color)\n        end\n    end\n    \nend",
					["Time"] = 1611856720,
					["url"] = "",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura_blink",
					["Enabled"] = true,
					["Revision"] = 369,
					["semver"] = "",
					["Author"] = "Izimode-Azralon",
					["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["Desc"] = "Blink, change the number and nameplate color. Add the debuffs int he trigger box. Set settings on constructor script.",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.blinkTexture:SetSize (self:GetSize())\n    \nend\n\n\n",
					["SpellIds"] = {
					},
					["PlaterCore"] = 1,
					["Options"] = {
						{
							["Type"] = 6,
							["Name"] = "Blank Space",
							["Value"] = 0,
							["Key"] = "option10",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [1]
						{
							["Type"] = 5,
							["Name"] = "Option 17",
							["Value"] = "Enter the spell name or spellID in the Add Trigger box and hit \"Add\".",
							["Key"] = "option17",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [2]
						{
							["Type"] = 6,
							["Key"] = "option10",
							["Value"] = 0,
							["Name"] = "Blank Space",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [3]
						{
							["Type"] = 4,
							["Name"] = "Blink Enabled",
							["Value"] = true,
							["Key"] = "blinkEnabled",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "set to 'false' to disable blink",
						}, -- [4]
						{
							["Type"] = 4,
							["Name"] = "Glow Enabled",
							["Value"] = true,
							["Key"] = "glowEnabled",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "set to 'false' to disable glows",
						}, -- [5]
						{
							["Type"] = 4,
							["Name"] = "Change NamePlate Color",
							["Value"] = true,
							["Key"] = "changeNameplateColor",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "set to 'true' to enable nameplate color change",
						}, -- [6]
						{
							["Type"] = 2,
							["Max"] = 20,
							["Desc"] = "in seconds, affects the blink effect only",
							["Min"] = 1,
							["Name"] = "Timeleft to Blink",
							["Value"] = 3,
							["Key"] = "timeleftToBlink",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = true,
						}, -- [7]
						{
							["Type"] = 2,
							["Max"] = 3,
							["Desc"] = "time to complete a blink loop",
							["Min"] = 0.5,
							["Name"] = "Blink Speed",
							["Value"] = 1,
							["Key"] = "blinkSpeed",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = true,
						}, -- [8]
						{
							["Type"] = 2,
							["Max"] = 1,
							["Desc"] = "max transparency in the animation loop (1.0 is full opaque)",
							["Min"] = 0.1,
							["Name"] = "Blink Max Alpha",
							["Value"] = 0.6,
							["Key"] = "blinkMaxAlpha",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = true,
						}, -- [9]
						{
							["Type"] = 1,
							["Name"] = "Blink Color",
							["Value"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["Key"] = "blinkColor",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "color of the blink",
						}, -- [10]
						{
							["Type"] = 1,
							["Name"] = "Nameplate Color",
							["Value"] = {
								0.2862745098039216, -- [1]
								0.00392156862745098, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Key"] = "",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "nameplate color if ChangeNameplateColor is true",
						}, -- [11]
						{
							["Type"] = 6,
							["Key"] = "option10",
							["Value"] = 0,
							["Name"] = "Blank Space",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [12]
						{
							["Type"] = 4,
							["Name"] = "Timer Color Enabled",
							["Value"] = true,
							["Key"] = "timerColorEnabled",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "set to 'false' to disable changes in the color of the time left text",
						}, -- [13]
						{
							["Type"] = 2,
							["Max"] = 20,
							["Desc"] = "in seconds, affects the color of the text",
							["Min"] = 1,
							["Fraction"] = true,
							["Value"] = 8,
							["Key"] = "timeLeftWarning",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Name"] = "Time Left Warning",
						}, -- [14]
						{
							["Type"] = 2,
							["Max"] = 10,
							["Desc"] = "in seconds, affects the color of the text",
							["Min"] = 1,
							["Fraction"] = true,
							["Value"] = 3,
							["Key"] = "timeLeftCritical",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Name"] = "Time Left Critical",
						}, -- [15]
						{
							["Type"] = 1,
							["Name"] = "Warning Color",
							["Value"] = {
								1, -- [1]
								0.8705882352941177, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Key"] = "warningColor",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "color when the time left entered in a warning zone",
						}, -- [16]
						{
							["Type"] = 1,
							["Name"] = "Critical Color",
							["Value"] = {
								1, -- [1]
								0.07450980392156863, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Key"] = "criticalColor",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "color when the time left is critical",
						}, -- [17]
					},
					["version"] = -1,
					["Name"] = "Aura - Blink by Time Left [Plater]",
					["NpcNames"] = {
					},
				}, -- [11]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \n    envTable.npcInfo = {\n        [164427] = {secondCastBar = true, timer = 20, timerId = 321247, altCastId = \"1\", name = \"Boom!\"}, --reanimated warrior - plaguefall\n        \n        [164414] = {secondCastBar = true, timer = 20, timerId = 321247, altCastId = \"2\", name = \"Boom!\"}, --reanimated mage - plaguefall\n        \n        [164185] = {secondCastBar = true, timer = 20, timerId = 319941, altCastId = \"3\", remaining = 5, name = GetSpellInfo(319941)}, --Echelon - Halls of Atonement\n        \n        [164567] = {secondCastBar = true, altCastId = \"dromanswrath\", debuffTimer = 323059, name = GetSpellInfo(323059), spellIcon = 323059}, --Ingra Maloch -- tirna scythe\n        \n        [165408] = {secondCastBar = true, timer = 20, timerId = 322711, altCastId = \"4\", remaining = 5, name = GetSpellInfo(322711)}, --Halkias - Refracted Sinlight - Halls of Atonement\n        \n        \n        --[154564] = {secondCastBar = true, timerId = \"Test Bar\", altCastId = \"debugcast\", remaining = 5, name = GetSpellInfo(319941), spellIcon = 319941}, --debug \"Test (1)\" BW \"Test Bar\" DBM --DEBUG\n        --[154580] = {secondCastBar = true, altCastId = \"debugcast\", debuffTimer = 204242, name = GetSpellInfo(81297), spellIcon = 81297}, --debug \"Test (1)\" BW \"Test Bar\" DBM --DEBUG\n    }\n    \n    --set the castbar config\n    local config = {\n        iconTexture = \"\",\n        iconTexcoord = {0.1, 0.9, 0.1, 0.9},\n        iconAlpha = 1,\n        iconSize = 14,\n        \n        text = \"Boom!\",\n        textSize = 9,\n        \n        texture = [[Interface\\AddOns\\Plater\\images\\bar_background]],\n        color = \"silver\",\n        \n        isChanneling = false,\n        canInterrupt = false,\n        \n        height = 2,\n        width = Plater.db.profile.plate_config.enemynpc.health_incombat[1],\n        \n        spellNameAnchor = {side = 3, x = 0, y = -2},\n        timerAnchor = {side = 5, x = 0, y = -2},\n    }    \n    \n    function envTable.ShowAltCastBar(npcInfo, unitFrame, unitId, customTime, customStart)\n        --show the cast bar\n        if (npcInfo.timerId) then\n            local barObject = Plater.GetBossTimer(npcInfo.timerId)\n            if (barObject) then\n                if (npcInfo.remaining) then\n                    local timeLeft = barObject.timer + barObject.start - GetTime()\n                    if (timeLeft > npcInfo.remaining) then\n                        return\n                    end\n                end\n                \n                config.text = npcInfo.name\n                \n                if (npcInfo.spellIcon) then\n                    local _, _, iconTexture = GetSpellInfo(npcInfo.spellIcon)\n                    config.iconTexture = iconTexture\n                else\n                    config.iconTexture = \"\"\n                end\n                \n                Plater.SetAltCastBar(unitFrame.PlateFrame, config, barObject.timer, customStart or barObject.start, npcInfo.altCastId)\n            end\n        else\n            Plater.SetAltCastBar(unitFrame.PlateFrame, config, customTime or npcInfo.timer, customStart, npcInfo.altCastId)            \n        end\n        \n        DetailsFramework:TruncateText(unitFrame.castBar2.Text, unitFrame.castBar2:GetWidth() - 16)\n    end\nend",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    Plater.ClearAltCastBar(unitFrame.PlateFrame)\nend",
					["ScriptType"] = 3,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    local npcInfo = envTable.npcInfo[envTable._NpcID]\n    \n    if (npcInfo and npcInfo.secondCastBar) then\n        if (npcInfo.timerId) then\n            local barObject = Plater.GetBossTimer(npcInfo.timerId)\n            if (barObject) then\n                local altCastId = Plater.GetAltCastBarAltId(unitFrame.PlateFrame)\n                if (altCastId ~= npcInfo.altCastId or not unitFrame.castBar2:IsShown()) then\n                    envTable.ShowAltCastBar(npcInfo, unitFrame, unitId)\n                end\n            end \n            \n        elseif (npcInfo.debuffTimer) then\n            if (Plater.NameplateHasAura (unitFrame, npcInfo.debuffTimer)) then\n                \n                --get the debuff timeleft\n                local name = npcInfo.name\n                local _, _, _, _, duration, expirationTime = AuraUtil.FindAuraByName(name, unitId, \"DEBUFF\")\n                local startTime = expirationTime - duration\n                \n                if (not unitFrame.castBar2:IsShown() or unitFrame.castBar2.spellStartTime < startTime) then\n                    envTable.ShowAltCastBar(npcInfo, unitFrame, unitId, duration, startTime)\n                end\n                \n            else \n                if (unitFrame.castBar2:IsShown()) then\n                    local altCastId = Plater.GetAltCastBarAltId(unitFrame.PlateFrame)\n                    if (altCastId == npcInfo.altCastId) then\n                        Plater.ClearAltCastBar(unitFrame.PlateFrame)\n                    end                   \n                end                              \n            end\n        end\n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
					["Time"] = 1604354364,
					["url"] = "",
					["Icon"] = "Interface\\AddOns\\Plater\\Images\\countdown_bar_icon",
					["Enabled"] = true,
					["Revision"] = 206,
					["semver"] = "",
					["Author"] = "Aelerolor-Torghast",
					["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["Desc"] = "Some units has special events without a clear way to show. This script adds a second cast bar to inform the user about it.",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    local npcInfo = envTable.npcInfo[envTable._NpcID]\n    \n    if (npcInfo and npcInfo.secondCastBar) then\n        if (npcInfo.debuffTimer) then\n            if (Plater.NameplateHasAura (unitFrame, npcInfo.debuffTimer)) then\n                \n                local name = npcInfo.name\n                local _, _, _, _, duration, expirationTime = AuraUtil.FindAuraByName(name, unitId, \"DEBUFF\")\n                \n                envTable.ShowAltCastBar(npcInfo, unitFrame, unitId, duration, expirationTime-duration)\n            else\n                if (unitFrame.castBar2:IsShown()) then\n                    local altCastId = Plater.GetAltCastBarAltId(unitFrame.PlateFrame)\n                    if (altCastId == npcInfo.altCastId) then\n                        Plater.ClearAltCastBar(unitFrame.PlateFrame)\n                    end                   \n                end                              \n            end\n        else\n            envTable.ShowAltCastBar(npcInfo, unitFrame, unitId)\n        end\n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
					["SpellIds"] = {
					},
					["PlaterCore"] = 1,
					["Options"] = {
					},
					["version"] = -1,
					["Name"] = "Countdown",
					["NpcNames"] = {
						"164427", -- [1]
						"164414", -- [2]
						"164185", -- [3]
						"164567", -- [4]
						"165408", -- [5]
					},
				}, -- [12]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \n    envTable.lifePercent = {\n        --npcId         percent divisions\n        [154564] = {80, 30},   --debug\n        [164451] = {40}, --dessia the decapirator - theater of pain\n        [164463] = {40}, --Paceran the Virulent - theater of pain\n        [164461] = {40}, -- Sathel the Accursed - theater of pain\n        [165946]= {50}, -- ~mordretha - thather of pain\n        [164501] = {70, 40, 10}, --mistcaller - tina scythe\n        [164218] = {70, 40}, --Lord Chamberlain - Halls of Atonement\n    }\n    \n    function envTable.CreateMarker(unitFrame)\n        unitFrame.healthMarker = unitFrame.healthBar:CreateTexture(nil, \"overlay\")\n        unitFrame.healthMarker:SetColorTexture(1, 1, 1)\n        unitFrame.healthMarker:SetSize(1, unitFrame.healthBar:GetHeight())\n        \n        unitFrame.healthOverlay = unitFrame.healthBar:CreateTexture(nil, \"overlay\")\n        unitFrame.healthOverlay:SetColorTexture(1, 1, 1)\n        unitFrame.healthOverlay:SetSize(1, unitFrame.healthBar:GetHeight())\n    end\n    \n    function envTable.UpdateMarkers(unitFrame)\n        local markersTable = envTable.lifePercent[envTable._NpcID]\n        if (markersTable) then\n            local unitLifePercent = envTable._HealthPercent / 100\n            for i, percent in ipairs(markersTable) do\n                percent = percent / 100\n                if (unitLifePercent > percent) then\n                    if (not unitFrame.healthMarker) then\n                        envTable.CreateMarker(unitFrame)\n                    end\n                    \n                    unitFrame.healthMarker:Show()\n                    local width = unitFrame.healthBar:GetWidth()\n                    unitFrame.healthMarker:SetPoint(\"left\", unitFrame.healthBar, \"left\", width*percent, 0)\n                    \n                    local overlaySize = width * (unitLifePercent - percent)\n                    unitFrame.healthOverlay:SetWidth(overlaySize)\n                    unitFrame.healthOverlay:SetPoint(\"left\", unitFrame.healthMarker, \"right\", 0, 0)\n                    \n                    unitFrame.healthMarker:SetVertexColor(Plater:ParseColors(scriptTable.config.indicatorColor))\n                    unitFrame.healthMarker:SetAlpha(scriptTable.config.indicatorAlpha)\n                    \n                    unitFrame.healthOverlay:SetVertexColor(Plater:ParseColors(scriptTable.config.fillColor))\n                    unitFrame.healthOverlay:SetAlpha(scriptTable.config.fillAlpha)\n                    \n                    return\n                end\n            end --end for\n            \n            if (unitFrame.healthMarker and unitFrame.healthMarker:IsShown()) then\n                unitFrame.healthMarker:Hide()\n                unitFrame.healthOverlay:Hide()\n            end\n        end\n    end\nend      \n\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    if (unitFrame.healthMarker) then\n        unitFrame.healthMarker:Hide()\n        unitFrame.healthOverlay:Hide()\n    end\nend\n\n\n\n\n",
					["ScriptType"] = 3,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.UpdateMarkers(unitFrame)\nend\n\n\n",
					["Time"] = 1606506781,
					["url"] = "",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\health_indicator",
					["Enabled"] = true,
					["Revision"] = 109,
					["semver"] = "",
					["Author"] = "Aelerolor-Torghast",
					["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["Desc"] = "Place a marker into the health bar to indicate when the unit will change phase or cast an important spell.",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.UpdateMarkers(unitFrame)\nend\n\n\n",
					["SpellIds"] = {
					},
					["PlaterCore"] = 1,
					["Options"] = {
						{
							["Type"] = 5,
							["Name"] = "Option 1",
							["Value"] = "Add markers into the health bar to remind you about boss abilities at life percent.",
							["Key"] = "option1",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [1]
						{
							["Type"] = 6,
							["Name"] = "blank line",
							["Value"] = 0,
							["Key"] = "",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [2]
						{
							["Type"] = 1,
							["Name"] = "Vertical Line Color",
							["Value"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["Key"] = "indicatorColor",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "Indicator color.",
						}, -- [3]
						{
							["Type"] = 2,
							["Max"] = 1,
							["Desc"] = "Indicator alpha.",
							["Min"] = 0.1,
							["Fraction"] = true,
							["Value"] = 0.79,
							["Key"] = "indicatorAlpha",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Name"] = "Vertical Line Alpha",
						}, -- [4]
						{
							["Type"] = 6,
							["Key"] = "",
							["Value"] = 0,
							["Name"] = "blank line",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [5]
						{
							["Type"] = 1,
							["Key"] = "fillColor",
							["Value"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["Name"] = "Fill Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "Fill color.",
						}, -- [6]
						{
							["Type"] = 2,
							["Max"] = 1,
							["Desc"] = "Fill alpha.",
							["Min"] = 0,
							["Key"] = "fillAlpha",
							["Value"] = 0.2,
							["Name"] = "Fill Alpha",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = true,
						}, -- [7]
					},
					["version"] = -1,
					["Name"] = "Unit - Health Markers [P]",
					["NpcNames"] = {
						"164451", -- [1]
						"164463", -- [2]
						"164461", -- [3]
						"165946", -- [4]
						"164501", -- [5]
						"164218", -- [6]
					},
				}, -- [13]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.movingArrow = envTable.movingArrow or Plater:CreateImage (self, [[Interface\\PETBATTLES\\PetBattle-StatIcons]], 16, self:GetHeight(), \"background\", {0, 15/32, 18/32, 30/32})\n    \n    --envTable.movingArrow.color = scriptTable.config.arrowColor\n    envTable.movingArrow:SetAlpha (scriptTable.config.arrowAlpha)\n    envTable.movingArrow:SetDesaturated (scriptTable.config.desaturateArrow)\n    \n    envTable.movingAnimation = envTable.movingAnimation or Plater:CreateAnimationHub (envTable.movingArrow, \n        function() \n            envTable.movingArrow:Show() \n            envTable.movingArrow:SetPoint(\"left\", 0, 0)\n        end, \n        function() envTable.movingArrow:Hide() end)\n    \n    envTable.movingAnimation:SetLooping (\"REPEAT\")\n    \n    envTable.arrowAnimation = envTable.arrowAnimation or Plater:CreateAnimation (envTable.movingAnimation, \"translation\", 1, 0.20, self:GetWidth()-16, 0)\n    \n    envTable.arrowAnimation:SetDuration(scriptTable.config.animSpeed)\nend\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    envTable.movingAnimation:Stop()\nend\n\n\n",
					["ScriptType"] = 2,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \nend",
					["Time"] = 1604599443,
					["url"] = "",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar_frontal",
					["Enabled"] = true,
					["Revision"] = 460,
					["semver"] = "",
					["Author"] = "Izimode-Azralon",
					["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["Desc"] = "Does an animation for casts that affect the frontal area of the enemy. Add spell in the Add Trigger field.",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    envTable.movingAnimation:Play()\nend\n\n\n",
					["SpellIds"] = {
						323489, -- [1]
						323496, -- [2]
						319941, -- [3]
						319592, -- [4]
						334266, -- [5]
						325258, -- [6]
						334913, -- [7]
						326221, -- [8]
						322936, -- [9]
						323236, -- [10]
						321834, -- [11]
						336752, -- [12]
						325418, -- [13]
						324667, -- [14]
						327233, -- [15]
						324368, -- [16]
						324205, -- [17]
						323943, -- [18]
						319713, -- [19]
						320596, -- [20]
						320729, -- [21]
						323608, -- [22]
						330614, -- [23]
						320063, -- [24]
						332708, -- [25]
						334023, -- [26]
						317231, -- [27]
						317943, -- [28]
						320966, -- [29]
						334053, -- [30]
						328458, -- [31]
						321968, -- [32]
						331718, -- [33]
						325793, -- [34]
						330453, -- [35]
						326997, -- [36]
						334051, -- [37]
						292903, -- [38]
						330843, -- [39]
						294173, -- [40]
						189200, -- [41]
					},
					["PlaterCore"] = 1,
					["Options"] = {
						{
							["Type"] = 6,
							["Key"] = "option1",
							["Value"] = 0,
							["Name"] = "Option 1",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [1]
						{
							["Type"] = 5,
							["Key"] = "option2",
							["Value"] = "Produces an effect to indicate the spell will hit players in front of the enemy.",
							["Name"] = "Option 2",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [2]
						{
							["Type"] = 5,
							["Key"] = "option4",
							["Value"] = "Enter the spell name or spellID of the Spell in the Add Trigger box and hit \"Add\".",
							["Name"] = "Option 4",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [3]
						{
							["Type"] = 6,
							["Key"] = "option3",
							["Value"] = 0,
							["Name"] = "Option 3",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [4]
						{
							["Type"] = 2,
							["Max"] = 1,
							["Desc"] = "Set the alpha of the moving arrow",
							["Min"] = 0,
							["Name"] = "Arrow Alpha",
							["Value"] = 0.275,
							["Fraction"] = true,
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Key"] = "arrowAlpha",
						}, -- [5]
						{
							["Type"] = 2,
							["Max"] = 1,
							["Desc"] = "Time that takes for an arrow to travel from the to right.",
							["Min"] = 0,
							["Name"] = "Animation Speed",
							["Value"] = 0.2,
							["Fraction"] = true,
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Key"] = "animSpeed",
						}, -- [6]
						{
							["Type"] = 4,
							["Key"] = "desaturateArrow",
							["Value"] = false,
							["Name"] = "Use White Arrow",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "If enabled, the arrow color will be desaturated.",
						}, -- [7]
					},
					["version"] = -1,
					["Name"] = "Cast - Frontal Cone [Plater]",
					["NpcNames"] = {
					},
				}, -- [14]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.FixateTarget = Plater:CreateLabel (unitFrame);\n    envTable.FixateTarget:SetPoint (\"bottom\", unitFrame.BuffFrame, \"top\", 0, 10);    \n    \n    envTable.FixateIcon = Plater:CreateImage (unitFrame, 236188, 16, 16, \"overlay\");\n    envTable.FixateIcon:SetPoint (\"bottom\", envTable.FixateTarget, \"top\", 0, 4);    \n    \n    envTable.FixateTarget:Hide()\n    envTable.FixateIcon:Hide()\nend\n\n--165560 = Gormling Larva - MTS\n\n\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:Hide()\n    envTable.FixateIcon:Hide()\nend\n\n\n",
					["ScriptType"] = 3,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    local targetName = UnitName (unitId .. \"target\");\n    if (targetName) then\n        local _, class = UnitClass (unitId .. \"target\");\n        targetName = Plater.SetTextColorByClass (unitId .. \"target\", targetName);\n        envTable.FixateTarget.text = targetName;\n        \n        envTable.FixateTarget:Show();\n        envTable.FixateIcon:Show();\n    end    \nend\n\n\n",
					["Time"] = 1604239880,
					["url"] = "",
					["Icon"] = 1029718,
					["Enabled"] = true,
					["Revision"] = 269,
					["semver"] = "",
					["Author"] = "Celian-Sylvanas",
					["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n\n\n\n\n",
					["Desc"] = "Show above the nameplate who is the player fixated",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["SpellIds"] = {
					},
					["PlaterCore"] = 1,
					["Options"] = {
					},
					["version"] = -1,
					["Name"] = "Fixate [Plater]",
					["NpcNames"] = {
						"165560", -- [1]
					},
				}, -- [15]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --castbar color (when can be interrupted)\n    envTable.CastbarColor = scriptTable.config.castbarColor\n    \n    --flash duration\n    local CONFIG_BACKGROUND_FLASH_DURATION = scriptTable.config.flashDuration\n    \n    --add this value to the cast bar height\n    envTable.CastBarHeightAdd = scriptTable.config.castBarHeight\n    \n    --create a fast flash above the cast bar\n    envTable.FullBarFlash = envTable.FullBarFlash or Plater.CreateFlash (self, 0.05, 1, \"white\")\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, scriptTable.config.shakeDuration, scriptTable.config.shakeAmplitude, scriptTable.config.shakeFrequency, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))\n    \n    --create a texture to use for a flash behind the cast bar\n    local backGroundFlashTexture = Plater:CreateImage (self, [[Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Alert-Glow]], self:GetWidth()+60, self:GetHeight()+50, \"background\", {0, 400/512, 0, 170/256})\n    backGroundFlashTexture:SetBlendMode (\"ADD\")\n    backGroundFlashTexture:SetPoint (\"center\", self, \"center\")\n    backGroundFlashTexture:Hide()\n    \n    --create the animation hub to hold the flash animation sequence\n    envTable.BackgroundFlash = envTable.BackgroundFlash or Plater:CreateAnimationHub (backGroundFlashTexture, \n        function()\n            backGroundFlashTexture:Show()\n        end,\n        function()\n            backGroundFlashTexture:Hide()\n        end\n    )\n    \n    --create the flash animation sequence\n    envTable.BackgroundFlash.fadeIn = envTable.BackgroundFlash.fadeIn or Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 1, CONFIG_BACKGROUND_FLASH_DURATION/2, 0, .75)\n    envTable.BackgroundFlash.fadeIn:SetDuration(CONFIG_BACKGROUND_FLASH_DURATION/2)\n    \n    envTable.BackgroundFlash.fadeOut = envTable.BackgroundFlash.fadeOut or Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 2, CONFIG_BACKGROUND_FLASH_DURATION/2, 1, 0)    \n    envTable.BackgroundFlash.fadeOut:SetDuration(CONFIG_BACKGROUND_FLASH_DURATION/2)\n    \n    --envTable.BackgroundFlash:Play() --envTable.BackgroundFlash:Stop()    \n    \n    \n    \n    \n    \nend\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (not Plater.IsPlayerTank()) then\n        return\n    end\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\") then\n        return\n    end    \n    \n    unitFrame.castBar:SetHeight (envTable._DefaultHeight)\n    \n    --stop the camera shake\n    unitFrame:StopFrameShake (envTable.FrameShake)\n    \n    envTable.FullBarFlash:Stop()\n    envTable.BackgroundFlash:Stop()\n    \n    unitFrame.castBar.Spark:SetHeight(unitFrame.castBar:GetHeight())\n    \nend\n\n\n\n\n\n",
					["ScriptType"] = 2,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \nend\n\n\n",
					["Time"] = 1604593143,
					["url"] = "",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar_tank",
					["Enabled"] = true,
					["Revision"] = 833,
					["semver"] = "",
					["Author"] = "Tercioo-Sylvanas",
					["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend",
					["Desc"] = "Cast alert for abilities which only the tank can interrupt.",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (not Plater.IsPlayerTank()) then\n        return\n    end\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\") then\n        return\n    end\n    \n    --play flash animations\n    envTable.FullBarFlash:Play()\n    \n    --envTable.currentHeight = unitFrame.castBar:GetHeight()\n    \n    --restoring the default size (not required since it already restore in the hide script)\n    if (envTable.OriginalHeight) then\n        self:SetHeight (envTable.OriginalHeight)\n    end\n    \n    --increase the cast bar size\n    local height = self:GetHeight()\n    envTable.OriginalHeight = height\n    \n    self:SetHeight (height + envTable.CastBarHeightAdd)\n    \n    Plater.SetCastBarBorderColor (self, 1, .2, .2, 0.4)\n    \n    unitFrame:PlayFrameShake (envTable.FrameShake)\n    \n    --set the color of the cast bar to dark orange (only if can be interrupted)\n    --Plater auto set this color to default when a new cast starts, no need to reset this value at OnHide.    \n    if (envTable._CanInterrupt) then\n        if (scriptTable.config.useCastbarColor) then\n            self:SetStatusBarColor (Plater:ParseColors (envTable.CastbarColor))\n        end\n    end\n    \n    envTable.BackgroundFlash:Play()\n    \n    unitFrame.castBar.Spark:SetHeight(unitFrame.castBar:GetHeight())\n    \nend\n\n\n\n\n\n\n\n\n",
					["SpellIds"] = {
						321828, -- [1]
					},
					["PlaterCore"] = 1,
					["Options"] = {
						{
							["Type"] = 6,
							["Key"] = "option1",
							["Value"] = 0,
							["Name"] = "Blank Line",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [1]
						{
							["Type"] = 5,
							["Key"] = "option2",
							["Value"] = "Produces a notable effect in the cast bar when a spell from the 'Triggers' starts to cast.",
							["Name"] = "Option 2",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [2]
						{
							["Type"] = 5,
							["Key"] = "option3",
							["Value"] = "Enter the spell name or spellID of the Spell in the Add Trigger box and hit \"Add\".",
							["Name"] = "Option 3",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [3]
						{
							["Type"] = 6,
							["Key"] = "option4",
							["Value"] = 0,
							["Name"] = "Blank Space",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [4]
						{
							["Type"] = 4,
							["Key"] = "useCastbarColor",
							["Value"] = true,
							["Name"] = "Cast Bar Color Enabled",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "When enabled, changes the cast bar color,",
						}, -- [5]
						{
							["Type"] = 1,
							["Key"] = "castbarColor",
							["Value"] = {
								1, -- [1]
								0.4313725490196079, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Name"] = "Cast Bar Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "Color of the cast bar.",
						}, -- [6]
						{
							["Type"] = 6,
							["Key"] = "option7",
							["Value"] = 0,
							["Name"] = "Blank Line",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [7]
						{
							["Type"] = 2,
							["Max"] = 1,
							["Desc"] = "When the cast starts it flash rapidly, adjust how fast it flashes. Value is milliseconds.",
							["Min"] = 0.05,
							["Name"] = "Flash Duration",
							["Value"] = 0.2,
							["Fraction"] = true,
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Key"] = "flashDuration",
						}, -- [8]
						{
							["Type"] = 2,
							["Max"] = 10,
							["Desc"] = "Increases the cast bar height by this value",
							["Min"] = 0,
							["Name"] = "Cast Bar Height Mod",
							["Value"] = 0,
							["Fraction"] = false,
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Key"] = "castBarHeight",
						}, -- [9]
						{
							["Type"] = 2,
							["Max"] = 1,
							["Desc"] = "When the cast starts, there's a small shake in the nameplate, this settings controls how long it takes.",
							["Min"] = 0.1,
							["Name"] = "Shake Duration",
							["Value"] = 0.1,
							["Fraction"] = true,
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Key"] = "shakeDuration",
						}, -- [10]
						{
							["Type"] = 2,
							["Max"] = 200,
							["Desc"] = "How strong is the shake.",
							["Min"] = 10,
							["Fraction"] = false,
							["Value"] = 25,
							["Name"] = "Shake Amplitude",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Key"] = "shakeAmplitude",
						}, -- [11]
						{
							["Type"] = 2,
							["Max"] = 80,
							["Desc"] = "How fast the shake moves.",
							["Min"] = 1,
							["Fraction"] = false,
							["Value"] = 30,
							["Name"] = "Shake Frequency",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Key"] = "shakeFrequency",
						}, -- [12]
					},
					["version"] = -1,
					["Name"] = "Cast - Tank Interrupt [P]",
					["NpcNames"] = {
					},
				}, -- [16]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    envTable.EnergyAmount = Plater:CreateLabel (unitFrame, \"\", 16, \"silver\");\n    envTable.EnergyAmount:SetPoint (\"bottom\", unitFrame, \"top\", 0, 18);    \n    \n    envTable.EnergyAmount.fontsize = scriptTable.config.fontSize\n    envTable.EnergyAmount.fontcolor = scriptTable.config.fontColor\n    envTable.EnergyAmount.outline = scriptTable.config.outline\n    \n    \nend\n\n--[=[\n\n164406 = Shriekwing\n164407 = Sludgefist\n162100 = kryxis the voracious\n162099 = general kaal - sanguine depths\n162329 = Xav the Unfallen - threater of pain\n--]=]",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    envTable.EnergyAmount:Hide()\nend\n\n\n",
					["ScriptType"] = 3,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    local currentPower = UnitPower(unitId)\n    \n    if (currentPower and currentPower > 0) then\n        local maxPower = UnitPowerMax (unitId)\n        local percent = floor (currentPower / maxPower * 100)\n        \n        envTable.EnergyAmount.text = \"\" .. percent;\n        \n        if (scriptTable.config.showLater) then\n            local alpha = (percent -80) * 5\n            alpha = alpha / 100\n            alpha = max(0, alpha)\n            envTable.EnergyAmount:SetAlpha(alpha)\n            \n        else\n            envTable.EnergyAmount:SetAlpha(1.0)\n        end\n        \n        \n    else\n        envTable.EnergyAmount.text = \"\"\n    end\nend\n\n\n\n\n\n\n\n\n",
					["Time"] = 1604357453,
					["url"] = "",
					["Icon"] = 136048,
					["Enabled"] = true,
					["Revision"] = 233,
					["semver"] = "",
					["Author"] = "Celian-Sylvanas",
					["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["Desc"] = "Show the energy amount above the nameplate.",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    envTable.EnergyAmount:Show()\nend\n\n\n",
					["SpellIds"] = {
					},
					["PlaterCore"] = 1,
					["Options"] = {
						{
							["Type"] = 6,
							["Key"] = "option1",
							["Value"] = 0,
							["Name"] = "Option 1",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [1]
						{
							["Type"] = 5,
							["Key"] = "option3",
							["Value"] = "Show the power of the unit above the nameplate.",
							["Name"] = "script desc",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [2]
						{
							["Type"] = 5,
							["Name"] = "add trigger",
							["Value"] = "Add the unit name or unitId in the \"Add Trigger\" field and press \"Add\".",
							["Key"] = "option3",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [3]
						{
							["Type"] = 6,
							["Key"] = "option2",
							["Value"] = 0,
							["Name"] = "Option 2",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [4]
						{
							["Type"] = 4,
							["Key"] = "showLater",
							["Value"] = true,
							["Name"] = "Show at 80% of Energy",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "If enabled, the energy won't start showing until the unit has 80% energy.",
						}, -- [5]
						{
							["Type"] = 6,
							["Name"] = "Option 2",
							["Value"] = 0,
							["Key"] = "option2",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [6]
						{
							["Type"] = 2,
							["Max"] = 32,
							["Desc"] = "Text size.",
							["Min"] = 8,
							["Name"] = "Text Size",
							["Value"] = 16,
							["Fraction"] = false,
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Key"] = "fontSize",
						}, -- [7]
						{
							["Type"] = 1,
							["Key"] = "fontColor",
							["Value"] = {
								0.803921568627451, -- [1]
								0.803921568627451, -- [2]
								0.803921568627451, -- [3]
								1, -- [4]
							},
							["Name"] = "Font Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "Color of the text.",
						}, -- [8]
						{
							["Type"] = 4,
							["Key"] = "outline",
							["Value"] = true,
							["Name"] = "Enable Text Outline",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "If enabled, the text uses outline.",
						}, -- [9]
					},
					["version"] = -1,
					["Name"] = "Unit - Show Energy [Plater]",
					["NpcNames"] = {
						"164406", -- [1]
						"164407", -- [2]
						"162100", -- [3]
						"162099", -- [4]
						"162329", -- [5]
						"164558", -- [6]
					},
				}, -- [17]
				{
					["ConstructorCode"] = "--todo: add npc ids for multilanguage support\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.TextAboveNameplate = \"** On You **\"\n    envTable.NameplateColor = \"green\"\n    \n    --label to show the text above the nameplate\n    envTable.FixateTarget = Plater:CreateLabel (unitFrame);\n    envTable.FixateTarget:SetPoint (\"bottom\", unitFrame.healthBar, \"top\", 0, 30);\n    \n    --the spell casted by the npc in the trigger list needs to be in the list below as well\n    local spellList = {\n        [321891] = \"Freeze Tag Fixation\", --Illusionary Vulpin - MTS\n        \n    }\n    \n    --build the list with localized spell names\n    envTable.FixateDebuffs = {}\n    for spellID, enUSSpellName in pairs (spellList) do\n        local localizedSpellName = GetSpellInfo (spellID)\n        envTable.FixateDebuffs [localizedSpellName or enUSSpellName] = true\n    end\n    \n    --debug - smuggled crawg\n    envTable.FixateDebuffs [\"Jagged Maw\"] = true\n    \nend\n\n--[=[\nNpcIDs:\n136461: Spawn of G'huun (mythic uldir G'huun)\n\n--]=]\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:SetText (\"\")\n    envTable.FixateTarget:Hide()\n    \n    envTable.IsFixated = false\n    \n    Plater.RefreshNameplateColor (unitFrame)\nend\n\n\n",
					["ScriptType"] = 3,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --swap this to true when it is fixated\n    local isFixated = false\n    \n    --check the debuffs the player has and see if any of these debuffs has been placed by this unit\n    for debuffId = 1, 40 do\n        local name, texture, count, debuffType, duration, expirationTime, caster = UnitDebuff (\"player\", debuffId)\n        \n        --cancel the loop if there's no more debuffs on the player\n        if (not name) then \n            break \n        end\n        \n        --check if the owner of the debuff is this unit\n        if (envTable.FixateDebuffs [name] and caster and UnitIsUnit (caster, unitId)) then\n            --the debuff the player has, has been placed by this unit, set the name above the unit name\n            envTable.FixateTarget:SetText (envTable.TextAboveNameplate)\n            envTable.FixateTarget:Show()\n            Plater.SetNameplateColor (unitFrame,  envTable.NameplateColor)\n            isFixated = true\n            \n            if (not envTable.IsFixated) then\n                envTable.IsFixated = true\n                Plater.FlashNameplateBody (unitFrame, \"fixate\", .2)\n            end\n        end\n        \n    end\n    \n    --check if the nameplate color is changed but isn't fixated any more\n    if (not isFixated and envTable.IsFixated) then\n        --refresh the nameplate color\n        Plater.RefreshNameplateColor (unitFrame)\n        --reset the text\n        envTable.FixateTarget:SetText (\"\")\n        \n        envTable.IsFixated = false\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
					["Time"] = 1604087921,
					["url"] = "",
					["Icon"] = 841383,
					["Enabled"] = true,
					["Revision"] = 266,
					["semver"] = "",
					["Author"] = "Tecno-Azralon",
					["Desc"] = "When an enemy places a debuff and starts to chase you. This script changes the nameplate color and place your name above the nameplate as well.",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["SpellIds"] = {
						"spawn of g'huun", -- [1]
						"smuggled crawg", -- [2]
						"sergeant bainbridge", -- [3]
						"blacktooth scrapper", -- [4]
						"irontide grenadier", -- [5]
						"feral bloodswarmer", -- [6]
						"earthrager", -- [7]
						"crawler mine", -- [8]
						"rezan", -- [9]
					},
					["PlaterCore"] = 1,
					["Options"] = {
					},
					["version"] = -1,
					["Name"] = "Fixate On You [Plater]",
					["NpcNames"] = {
					},
				}, -- [18]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \n    if (not unitFrame.spitefulTexture) then\n        unitFrame.spitefulTexture = unitFrame.healthBar:CreateTexture(nil, \"overlay\", nil, 6)\n        unitFrame.spitefulTexture:SetPoint('right', 0, 0)\n        unitFrame.spitefulTexture:SetSize(27, 14)\n        unitFrame.spitefulTexture:SetColorTexture(.3, .3, 1, .7)\n        \n        unitFrame.spitefulText = unitFrame.healthBar:CreateFontString(nil, \"overlay\", \"GameFontNormal\", 6)\n        DetailsFramework:SetFontFace (unitFrame.spitefulText, \"2002\")\n        unitFrame.spitefulText:SetPoint(\"right\", unitFrame.spitefulTexture, \"right\", -2, 0)\n        unitFrame.spitefulText:SetJustifyH(\"right\")\n        \n        unitFrame.roleIcon = unitFrame:CreateTexture(nil, \"overlay\")\n        unitFrame.roleIcon:SetPoint(\"left\", unitFrame.healthBar, \"left\", 2, 0)\n        unitFrame.targetName = unitFrame:CreateFontString(nil, \"overlay\", \"GameFontNormal\")\n        unitFrame.targetName:SetPoint(\"left\", unitFrame.roleIcon, \"right\", 2, 0)\n        \n        unitFrame.spitefulTexture:Hide()\n        unitFrame.spitefulText:Hide()\n    end\n    \n    function envTable.UpdateSpitefulWidget(unitFrame)\n        \n        local r, g, b, a = Plater:ParseColors(scriptTable.config.bgColor)\n        unitFrame.spitefulTexture:SetColorTexture(r, g, b, a)\n        unitFrame.spitefulTexture:SetSize(scriptTable.config.bgWidth, unitFrame.healthBar:GetHeight())   \n        Plater:SetFontSize(unitFrame.spitefulText, scriptTable.config.textSize)\n        Plater:SetFontColor(unitFrame.spitefulText, scriptTable.config.textColor)\n        \n        local currentHealth = unitFrame.healthBar.CurrentHealth\n        local maxHealth = unitFrame.healthBar.CurrentHealthMax\n        \n        local healthPercent = currentHealth / maxHealth * 100\n        local timeToDie = format(\"%.1fs\", healthPercent / 8)\n        unitFrame.spitefulText:SetText(timeToDie)\n        \n        unitFrame.spitefulText:Show()\n        unitFrame.spitefulTexture:Show()\n        \n        if scriptTable.config.switchTargetName then\n            local plateFrame = unitFrame.PlateFrame\n            \n            local target = UnitName(unitFrame.namePlateUnitToken .. \"target\") or UnitName(unitFrame.namePlateUnitToken)\n            \n            if (target and target ~= \"\") then\n                local _, class = UnitClass(unitFrame.namePlateUnitToken .. \"target\")\n                if (class) then\n                    target = DetailsFramework:AddClassColorToText(target, class)\n                end\n                \n                local role = UnitGroupRolesAssigned(unitFrame.namePlateUnitToken .. \"target\")\n                if (role and role ~= \"NONE\") then\n                    target = DetailsFramework:AddRoleIconToText(target, role)\n                end\n                \n                plateFrame.namePlateUnitName = target\n                Plater.UpdateUnitName(plateFrame)\n            end\n        end\n        \n        if scriptTable.config.useTargetingColor then\n            local targeted = UnitIsUnit(unitFrame.namePlateUnitToken .. \"target\", \"player\")\n            if targeted then\n                Plater.SetNameplateColor (unitFrame, scriptTable.config.targetingColor)\n            else\n                Plater.RefreshNameplateColor(unitFrame)\n            end\n        end\n    end\nend",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    if (unitFrame.spitefulTexture) then\n        unitFrame.spitefulText:Hide()\n        unitFrame.spitefulTexture:Hide()    \n        unitFrame.roleIcon:Hide()\n        unitFrame.targetName:Hide()\n    end\nend\n\n\n\n\n\n",
					["OptionsValues"] = {
					},
					["ScriptType"] = 3,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.UpdateSpitefulWidget(unitFrame)\nend\n\n\n",
					["Time"] = 1611844883,
					["url"] = "",
					["Icon"] = 135945,
					["Enabled"] = true,
					["Revision"] = 186,
					["semver"] = "",
					["Author"] = "Symantec-Azralon",
					["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["Desc"] = "Time to die Spiteful affix",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.UpdateSpitefulWidget(unitFrame)\nend\n\n\n",
					["SpellIds"] = {
					},
					["PlaterCore"] = 1,
					["Options"] = {
						{
							["Type"] = 5,
							["Key"] = "option12",
							["Value"] = "Time to Die",
							["Name"] = "Time to Die",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [1]
						{
							["Type"] = 2,
							["Max"] = 50,
							["Desc"] = "",
							["Min"] = 10,
							["Key"] = "bgWidth",
							["Value"] = 27,
							["Name"] = "Width",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [2]
						{
							["Type"] = 1,
							["Key"] = "bgColor",
							["Value"] = {
								0.5058823529411764, -- [1]
								0.07058823529411765, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["Name"] = "Background Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "",
						}, -- [3]
						{
							["Type"] = 2,
							["Max"] = 24,
							["Desc"] = "",
							["Min"] = 7,
							["Key"] = "textSize",
							["Value"] = 8,
							["Name"] = "Text Size",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [4]
						{
							["Type"] = 1,
							["Key"] = "textColor",
							["Value"] = {
								1, -- [1]
								0.5843137254901961, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Name"] = "Text Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "",
						}, -- [5]
						{
							["Type"] = 6,
							["Name"] = "Option 7",
							["Value"] = 0,
							["Key"] = "option7",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [6]
						{
							["Type"] = 5,
							["Key"] = "option11",
							["Value"] = "Targeting",
							["Name"] = "Targeting",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [7]
						{
							["Type"] = 4,
							["Name"] = "Show Target instead of Name",
							["Value"] = true,
							["Key"] = "switchTargetName",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "",
						}, -- [8]
						{
							["Type"] = 4,
							["Name"] = "Change Color if targeting You",
							["Value"] = true,
							["Key"] = "useTargetingColor",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "",
						}, -- [9]
						{
							["Type"] = 1,
							["Name"] = "Color if targeting You",
							["Value"] = {
								0.07058823529411765, -- [1]
								0.6196078431372549, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Key"] = "targetingColor",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "",
						}, -- [10]
						{
							["Type"] = 6,
							["Key"] = "option11",
							["Value"] = 0,
							["Name"] = "Option 11",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [11]
					},
					["version"] = -1,
					["Name"] = "M+ Spiteful",
					["NpcNames"] = {
						"174773", -- [1]
					},
				}, -- [19]
			},
			["aura2_x_offset"] = 0,
			["hook_data"] = {
				{
					["Enabled"] = false,
					["Revision"] = 50,
					["semver"] = "",
					["HooksTemp"] = {
					},
					["Author"] = "Kastfall-Azralon",
					["Name"] = "Color Automation [Plater]",
					["Desc"] = "Easy way to change the color of an unit. Open the constructor script and follow the examples.",
					["Hooks"] = {
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --attempt to get the color from the unit color list\n    local color = envTable.NpcColors [unitFrame.namePlateUnitNameLower] or envTable.NpcColors [unitFrame.namePlateUnitName] or envTable.NpcColors [unitFrame.namePlateNpcId]\n    \n    --if the color exists, set the health bar color\n    if (color) then\n        Plater.SetNameplateColor (unitFrame, color)\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --list of npcs and their colors, can be inserted:\n    --name of the unit\n    --name of the unit in lower case\n    --npcID of the unit\n    \n    --color can be added as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}    \n    \n    envTable.NpcColors = {\n        \n        --examples, using the unit name in lower case, regular unit name and the unitID:\n        \n        [\"Thunderlord Windreader\"] = \"red\", --using regular mob name and color it as red\n        [\"thunderlord crag-leaper\"] = {1, 1, 0}, --using lower case and coloring it yellow\n        [75790] = \"#00FF00\", --using the ID of the unit and using green as color\n        \n        --insert the new mobs here:\n        \n        \n        \n        \n        \n        \n        \n        \n        \n        \n        \n        \n        \n    } --close custom color bracket\n    \nend\n\n\n\n\n",
					},
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["role"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["version"] = -1,
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["url"] = "",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\color_bar",
					["Time"] = 1547392935,
				}, -- [1]
				{
					["Enabled"] = false,
					["Revision"] = 348,
					["Options"] = {
						{
							["Type"] = 5,
							["Name"] = "Icon Settings",
							["Value"] = "Icon Settings:",
							["Key"] = "option4",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [1]
						{
							["Type"] = 4,
							["Name"] = "Show Icon",
							["Value"] = true,
							["Key"] = "showIcon",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "Show the castbar icon when enabled",
						}, -- [2]
						{
							["Type"] = 4,
							["Name"] = "Icon on Left Side",
							["Value"] = true,
							["Key"] = "iconOnLeftSide",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "If enabled it anchor the icon on the left side, right otherwise",
						}, -- [3]
						{
							["Type"] = 4,
							["Key"] = "useFullSize",
							["Value"] = false,
							["Name"] = "Use Big Icon",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "If enabled the icon has the size of the cast bar plus the healthbar",
						}, -- [4]
						{
							["Type"] = 2,
							["Max"] = 5,
							["Desc"] = "Fine tune the icon size",
							["Min"] = 0,
							["Fraction"] = true,
							["Value"] = 0,
							["Key"] = "iconSizeOffset",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Name"] = "Icon Size Offset",
						}, -- [5]
						{
							["Type"] = 2,
							["Max"] = 5,
							["Desc"] = "Space between the icon and the cast bar",
							["Min"] = -5,
							["Name"] = "Icon Padding",
							["Value"] = 0,
							["Fraction"] = false,
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Key"] = "iconPadding",
						}, -- [6]
						{
							["Type"] = 6,
							["Name"] = "Blank Space",
							["Value"] = 0,
							["Key"] = "option6",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [7]
						{
							["Type"] = 5,
							["Name"] = "Interrupt Texture",
							["Value"] = "Can't Interrupt Texture:",
							["Key"] = "option5",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [8]
						{
							["Type"] = 4,
							["Name"] = "Show Texture",
							["Value"] = true,
							["Key"] = "showTexture",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "If enabled show a texture to tell the cast can't be interrupted",
						}, -- [9]
						{
							["Type"] = 3,
							["Name"] = "Texture Path",
							["Value"] = "Interface\\GROUPFRAME\\UI-GROUP-MAINTANKICON",
							["Key"] = "iconTexturePath",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_text",
							["Desc"] = "Insert the path for the texture",
						}, -- [10]
						{
							["Type"] = 4,
							["Name"] = "Texture Desaturated",
							["Value"] = true,
							["Key"] = "desaturatedTexture",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "If enbaled, texture is shown in black & white",
						}, -- [11]
						{
							["Type"] = 1,
							["Name"] = "Texture Color",
							["Value"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								0.3056715726852417, -- [4]
							},
							["Key"] = "textureColor",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "Select the color of the texture",
						}, -- [12]
						{
							["Type"] = 2,
							["Max"] = 32,
							["Desc"] = "Adjust the texture width",
							["Min"] = 1,
							["Fraction"] = false,
							["Value"] = 10,
							["Key"] = "textureWidth",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Name"] = "Texture Width",
						}, -- [13]
						{
							["Type"] = 2,
							["Max"] = 16,
							["Desc"] = "The texture is set to be the same size as the cast bar, fine tune the height as wanted",
							["Min"] = -16,
							["Name"] = "Texture Height Mod",
							["Value"] = 0,
							["Fraction"] = true,
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Key"] = "textureHeightMod",
						}, -- [14]
						{
							["Type"] = 2,
							["Max"] = 32,
							["Desc"] = "Adjust the texture position",
							["Min"] = -32,
							["Fraction"] = false,
							["Value"] = 0,
							["Key"] = "texturePosition",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Name"] = "Texture Position",
						}, -- [15]
						{
							["Type"] = 2,
							["Max"] = 1,
							["Desc"] = "Adjust the texture transparency",
							["Min"] = 0,
							["Key"] = "textureAlpha",
							["Value"] = 1,
							["Name"] = "Texture Alpha",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = true,
						}, -- [16]
					},
					["HooksTemp"] = {
					},
					["version"] = -1,
					["Author"] = "Ditador-Azralon",
					["semver"] = "",
					["Desc"] = "Move the icon of the spell cast to the left or right side of the nameplate.",
					["Hooks"] = {
						["Cast Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.UpdateIconPosition (unitFrame)\n    self.ThrottleUpdate = -1\n    \nend\n\n\n",
						["Cast Start"] = "function (self, unitId, unitFrame, envTable)\n    \n    unitFrame.castBar.BorderShield:SetDrawLayer(\"artwork\")\n    envTable.UpdateIconPosition (unitFrame)\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable, modTable)\n    \n    --private:\n    function envTable.UpdateIconPosition (unitFrame)\n        local castBar = unitFrame.castBar\n        local icon = castBar.Icon\n        local noInterruptTexture = castBar.BorderShield\n        \n        if (modTable.config.showIcon) then\n            icon:ClearAllPoints()\n            \n            if (modTable.config.iconOnLeftSide) then\n                if (modTable.config.useFullSize) then\n                    icon:SetPoint (\"topright\", unitFrame.healthBar, \"topleft\", modTable.config.iconPadding, modTable.config.iconSizeOffset)\n                    icon:SetPoint (\"bottomright\", unitFrame.castBar, \"bottomleft\", modTable.config.iconPadding, -modTable.config.iconSizeOffset)\n                    \n                else\n                    \n                    icon:SetPoint (\"topright\", unitFrame.castBar, \"topleft\", modTable.config.iconPadding, modTable.config.iconSizeOffset)\n                    icon:SetPoint (\"bottomright\", unitFrame.castBar, \"bottomleft\", modTable.config.iconPadding, -modTable.config.iconSizeOffset)\n                end\n                \n            else\n                if (modTable.config.useFullSize) then\n                    icon:SetPoint (\"topleft\", unitFrame.healthBar, \"topright\", modTable.config.iconPadding, modTable.config.iconSizeOffset)\n                    icon:SetPoint (\"bottomleft\", unitFrame.castBar, \"bottomright\", modTable.config.iconPadding, -modTable.config.iconSizeOffset)\n                    \n                else\n                    \n                    icon:SetPoint (\"topleft\", unitFrame.castBar, \"topright\", modTable.config.iconPadding, modTable.config.iconSizeOffset)\n                    icon:SetPoint (\"bottomleft\", unitFrame.castBar, \"bottomright\", modTable.config.iconPadding, -modTable.config.iconSizeOffset)\n                end\n            end\n            \n            icon:SetWidth (icon:GetHeight())\n            icon:Show()\n        else\n            icon:Hide()\n        end\n        \n        if (modTable.config.showTexture and not castBar.canInterrupt) then\n            noInterruptTexture:Show()\n            \n            local texturePath = modTable.config.iconTexturePath\n            texturePath = texturePath:gsub(\"//\", \"/\")\n            texturePath = texturePath:gsub(\"\\\\\", \"/\")\n            \n            noInterruptTexture:SetTexture (texturePath)\n            noInterruptTexture:SetTexCoord (0, 1, 0, 1)\n            \n            if (modTable.config.desaturatedTexture) then\n                noInterruptTexture:SetDesaturated (modTable.config.desaturatedTexture)\n            else\n                noInterruptTexture:SetVertexColor (DetailsFramework:ParseColors (modTable.config.textureColor))\n            end\n            \n            noInterruptTexture:SetSize (modTable.config.textureWidth, castBar:GetHeight() + modTable.config.textureHeightMod)\n            noInterruptTexture:ClearAllPoints()\n            noInterruptTexture:SetPoint (\"center\", castBar, \"left\", modTable.config.texturePosition, 0)\n            noInterruptTexture:SetAlpha (modTable.config.textureAlpha)\n        else\n            noInterruptTexture:Hide()\n        end\n    end\nend",
					},
					["Time"] = 1597097268,
					["Name"] = "Cast Bar Icon Settings [P]",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["race"] = {
						},
					},
					["PlaterCore"] = 1,
					["url"] = "",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\castbar_icon",
					["LastHookEdited"] = "",
				}, -- [2]
				{
					["Enabled"] = false,
					["Revision"] = 254,
					["Options"] = {
					},
					["HooksTemp"] = {
					},
					["version"] = -1,
					["Author"] = "Izimode-Azralon",
					["semver"] = "",
					["Desc"] = "Show combo points above the nameplate for Druid Feral and Rogues.",
					["Hooks"] = {
						["Nameplate Created"] = "function (self, unitId, unitFrame, envTable)\n    \n    --run constructor!\n    --constructor is executed only once when any script of the hook runs.\n    \nend\n\n\n",
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if need update the amount of combo points shown\n    if (envTable.LastPlayerTalentUpdate > envTable.LastUpdate) then\n        envTable.UpdateComboPointAmount()\n    end    \n    \n    if (unitFrame.namePlateIsTarget and not unitFrame.IsSelf) then\n        envTable.ComboPointFrame:Show()\n        envTable.UpdateComboPoints()\n        \n    else\n        envTable.ComboPointFrame:Hide()\n    end    \n    \nend\n\n\n",
						["Target Changed"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if this nameplate is the current target\n    if (unitFrame.namePlateIsTarget and not unitFrame.IsSelf) then\n        envTable.ComboPointFrame:Show()\n        envTable.UpdateComboPoints()\n    else\n        envTable.ComboPointFrame:Hide()\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Player Power Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateIsTarget and not unitFrame.IsSelf) then\n        envTable.UpdateComboPoints()\n    end\n    \n    \nend\n\n\n\n\n\n\n",
						["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.ComboPointFrame:Hide()\n    \nend\n\n\n",
						["Destructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.ComboPointFrame:Hide()\n    \nend\n\n\n\n\n",
						["Player Talent Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    --update the amount of comboo points shown when the player changes talents or specialization\n    envTable.UpdateComboPointAmount()\n    \n    --save the time of the last talent change\n    envTable.LastPlayerTalentUpdate = GetTime()\n    \n    \nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    --settings\n    local anchors = {\n        {\"bottom\", unitFrame.healthBar, \"top\", 0, 24},\n    }\n    \n    local sizes = {\n        width = 12,\n        height = 12,\n        scale = 1,\n    }\n    \n    local textures = {\n        backgroundTexture = [[Interface\\PLAYERFRAME\\ClassOverlayComboPoints]],\n        backgroundTexCoords = {0/128, 21/128, 101/128, 122/128},\n        \n        comboPointTexture = [[Interface\\PLAYERFRAME\\ClassOverlayComboPoints]],\n        comboPointTexCoords = {3/128, 18/128, 81/128, 96/128},\n    }\n    \n    local frameLevel = 1000\n    local frameStrata = \"high\"    \n    \n    --private\n    do\n        --store combo points frames on this table\n        envTable.ComboPoints = {}\n        --save when the player changed talents or spec\n        envTable.LastPlayerTalentUpdate = GetTime()\n        --save when this nameplate got a combo point amount and alignment update        \n        \n        --build combo points frame anchor (combo point are anchored to this)\n        if (not unitFrame.PlaterComboPointFrame) then\n            local hostFrame = CreateFrame (\"frame\", nil, unitFrame)\n            hostFrame.ComboPointFramesPool = {}\n            unitFrame.PlaterComboPointFrame = hostFrame\n            envTable.ComboPointFrame = hostFrame\n            envTable.ComboPointFrame:SetScale (sizes.scale)\n            \n            --DetailsFramework:ApplyStandardBackdrop (envTable.ComboPointFrame) --debug anchor size\n            \n            --animations\n            local onPlayShowAnimation = function (animation)\n                --stop the hide animation if it's playing\n                if (animation:GetParent():GetParent().HideAnimation:IsPlaying()) then\n                    animation:GetParent():GetParent().HideAnimation:Stop()\n                end\n                \n                animation:GetParent():Show()\n            end\n            \n            local onPlayHideAnimation = function (animation)\n                --stop the show animation if it's playing\n                if (animation:GetParent():GetParent().ShowAnimation:IsPlaying()) then\n                    animation:GetParent():GetParent().ShowAnimation:Stop()\n                end\n            end        \n            local onStopHideAnimation = function (animation)\n                animation:GetParent():Hide()       \n            end\n            \n            local createAnimations = function (comboPoint)\n                --on show\n                comboPoint.ShowAnimation = Plater:CreateAnimationHub (comboPoint.comboPointTexture, onPlayShowAnimation, nil)\n                Plater:CreateAnimation (comboPoint.ShowAnimation, \"scale\", 1, 0.1, 0, 0, 1, 1)\n                Plater:CreateAnimation (comboPoint.ShowAnimation, \"alpha\", 1, 0.1, .5, 1)\n                Plater:CreateAnimation (comboPoint.ShowAnimation, \"scale\", 2, 0.1, 1.2, 1.2, 1, 1)\n                \n                --on hide\n                comboPoint.HideAnimation = Plater:CreateAnimationHub (comboPoint.comboPointTexture, onPlayHideAnimation, onStopHideAnimation)\n                Plater:CreateAnimation (comboPoint.HideAnimation, \"scale\", 1, 0.1, 1, 1, 0, 0)\n                Plater:CreateAnimation (comboPoint.HideAnimation, \"alpha\", 1, 0.1, 1, 0)\n            end\n            \n            --build combo point frame        \n            for i =1, 10 do \n                local f = CreateFrame (\"frame\", nil, envTable.ComboPointFrame)\n                f:SetSize (sizes.width, sizes.height)\n                tinsert (envTable.ComboPoints, f)\n                tinsert (unitFrame.PlaterComboPointFrame.ComboPointFramesPool, f)\n                \n                local backgroundTexture = f:CreateTexture (nil, \"background\")\n                backgroundTexture:SetTexture (textures.backgroundTexture)\n                backgroundTexture:SetTexCoord (unpack (textures.backgroundTexCoords))\n                backgroundTexture:SetSize (sizes.width, sizes.height)\n                backgroundTexture:SetPoint (\"center\")\n                \n                local comboPointTexture = f:CreateTexture (nil, \"artwork\")\n                comboPointTexture:SetTexture (textures.comboPointTexture)\n                comboPointTexture:SetTexCoord (unpack (textures.comboPointTexCoords))\n                \n                comboPointTexture:SetSize (sizes.width, sizes.height)\n                comboPointTexture:SetPoint (\"center\")\n                comboPointTexture:Hide()            \n                \n                f.IsActive = false\n                \n                f.backgroundTexture = backgroundTexture\n                f.comboPointTexture = comboPointTexture\n                \n                createAnimations (f)\n            end\n            \n        else\n            envTable.ComboPointFrame = unitFrame.PlaterComboPointFrame\n            envTable.ComboPointFrame:SetScale (sizes.scale)\n            envTable.ComboPoints = unitFrame.PlaterComboPointFrame.ComboPointFramesPool\n            \n        end            \n        \n        envTable.ComboPointFrame:SetFrameLevel (frameLevel)\n        envTable.ComboPointFrame:SetFrameStrata (frameStrata)\n        \n        function envTable.UpdateComboPoints()\n            local comboPoints = UnitPower (\"player\", Enum.PowerType.ComboPoints)\n            \n            for i = 1, envTable.TotalComboPoints do\n                local thisComboPoint = envTable.ComboPoints [i]\n                \n                if (i <= comboPoints ) then\n                    --combo point enabled\n                    if (not thisComboPoint.IsActive) then\n                        thisComboPoint.ShowAnimation:Play()\n                        thisComboPoint.IsActive = true\n                        \n                    end\n                    \n                else\n                    --combo point disabled\n                    if (thisComboPoint.IsActive) then\n                        thisComboPoint.HideAnimation:Play()\n                        thisComboPoint.IsActive = false\n                        \n                    end\n                end\n            end\n            \n            \n        end\n        \n        function envTable.UpdateComboPointAmount()\n            local namePlateWidth = Plater.db.profile.plate_config.enemynpc.health_incombat[1]\n            local comboPoints = UnitPowerMax (\"player\", Enum.PowerType.ComboPoints)\n            local reservedSpace = (namePlateWidth - sizes.width * comboPoints)  / comboPoints \n            \n            --store the total amount of combo points\n            envTable.TotalComboPoints = comboPoints\n            \n            --update anchor frame\n            envTable.ComboPointFrame:SetWidth (namePlateWidth)\n            envTable.ComboPointFrame:SetHeight (20)\n            envTable.ComboPointFrame:ClearAllPoints()\n            for i = 1, #anchors do\n                local anchor = anchors[i]\n                envTable.ComboPointFrame:SetPoint (unpack (anchor))\n            end        \n            \n            --\n            for i = 1, #envTable.ComboPoints do\n                envTable.ComboPoints[i]:Hide()\n                envTable.ComboPoints[i]:ClearAllPoints()\n            end\n            \n            for i = 1, comboPoints do\n                local comboPoint = envTable.ComboPoints[i]\n                if i == 1 then\n                    comboPoint:SetPoint (\"left\", envTable.ComboPointFrame, \"left\", reservedSpace/2, 0)\n                else\n                    comboPoint:SetPoint (\"left\", envTable.ComboPoints[i-1], \"right\", reservedSpace, 0)\n                end\n                \n                comboPoint:Show()\n            end\n            \n            envTable.LastUpdate = GetTime()\n            \n            envTable.UpdateComboPoints()\n        end\n        \n        --initialize\n        envTable.UpdateComboPointAmount()\n        envTable.ComboPointFrame:Hide()\n    end\n    \n    \nend",
					},
					["Time"] = 1603567332,
					["Name"] = "Combo Points [Plater]",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
							["Enabled"] = true,
							["DRUID"] = true,
							["ROGUE"] = true,
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
							["103"] = true,
							["Enabled"] = true,
						},
						["race"] = {
						},
						["encounter_ids"] = {
						},
						["affix"] = {
						},
					},
					["PlaterCore"] = 1,
					["url"] = "",
					["Icon"] = 135426,
					["LastHookEdited"] = "",
				}, -- [3]
				{
					["Enabled"] = false,
					["Revision"] = 84,
					["semver"] = "",
					["HooksTemp"] = {
					},
					["Author"] = "Ahwa-Azralon",
					["Name"] = "Execute Range [Plater]",
					["Desc"] = "Add extra effects to execute range. See the constructor script for options.",
					["Hooks"] = {
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (envTable.UseCustomExecutePercent) then\n        \n        --manual detection\n        local healthBar = unitFrame.healthBar\n        if (healthBar.CurrentHealth / healthBar.CurrentHealthMax <= envTable.ExecutePercent) then\n            envTable.UnitInExecuteRange (unitFrame)\n        end        \n        \n    else\n        \n        --auto detection\n        if (unitFrame.InExecuteRange) then\n            envTable.UnitInExecuteRange (unitFrame)\n        end\n        \n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --execute detection, if true the script will handle the execute percent\n    --while false Plater will automatically trigger the execute range\n    --you only want to set this to true in case of Plater not detecting the execute range correctly\n    envTable.UseCustomExecutePercent = false\n    --execute percent, if not detecting automatic, this is the percent to active the execute range\n    --use from zero to one, 0.20 is equal to 20% of the unit life\n    envTable.ExecutePercent = 0.20\n    \n    --allow this script to change the nameplate color when the unit is in execute range\n    envTable.CanChangeColor = true\n    --change the health bar color to this color when the unit is in execute range\n    --color can be set as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}\n    envTable.ExecuteColor = \"green\"\n    \n    --border color\n    envTable.CanChangeBorderColor = false\n    envTable.BorderColor = \"red\"\n    \n    --hide the default health divisor and the health execute indicator\n    envTable.HideHealthDivisor = false\n    --if not hidden, adjust the health divisor settings and the health execute indicator\n    envTable.HealthDivisorAlpha = 0.5\n    envTable.HealthDivisorColor = \"white\"\n    envTable.HealthExecuteIndicatorAlpha = 0.15\n    envTable.HealthExecuteIndicatorColor = \"darkred\"\n    \n    \n    --private (internal functions)\n    do\n        function envTable.UnitInExecuteRange (unitFrame)\n            --check if can change the execute color\n            if (envTable.CanChangeColor) then\n                Plater.SetNameplateColor (unitFrame, envTable.ExecuteColor)\n            end\n            \n            if (envTable.CanChangeBorderColor) then\n                Plater.SetBorderColor (unitFrame, envTable.BorderColor)\n            end\n            \n            if (envTable.HideHealthDivisor) then\n                unitFrame.healthBar.healthCutOff:Hide() \n                unitFrame.healthBar.executeRange:Hide()\n                \n            else\n                envTable.UpdateHealthDivisor (unitFrame)\n                \n            end\n        end\n        \n        function envTable.UpdateHealthDivisor (unitFrame)\n            local healthBar = unitFrame.healthBar\n            \n            healthBar.healthCutOff:Show()\n            healthBar.healthCutOff:SetVertexColor (DetailsFramework:ParseColors (envTable.HealthDivisorColor))\n            healthBar.healthCutOff:SetAlpha (envTable.HealthDivisorAlpha)\n            \n            healthBar.executeRange:Show()\n            healthBar.executeRange:SetVertexColor (DetailsFramework:ParseColors (envTable.HealthExecuteIndicatorColor))\n            healthBar.executeRange:SetAlpha (envTable.HealthExecuteIndicatorAlpha)\n            \n            if (envTable.UseCustomExecutePercent) then\n                healthBar.healthCutOff:ClearAllPoints()\n                healthBar.executeRange:ClearAllPoints()\n                \n                healthBar.healthCutOff:SetSize (healthBar:GetHeight(), healthBar:GetHeight())\n                healthBar.healthCutOff:SetPoint (\"center\", healthBar, \"left\", healthBar:GetWidth() * envTable.ExecutePercent, 0)\n                \n                healthBar.executeRange:SetTexCoord (0, envTable.ExecutePercent, 0, 1)\n                healthBar.executeRange:SetHeight (healthBar:GetHeight())\n                healthBar.executeRange:SetPoint (\"left\", healthBar, \"left\", 0, 0)\n                healthBar.executeRange:SetPoint (\"right\", healthBar.healthCutOff, \"center\")\n            end\n            \n        end\n    end\n    \nend",
					},
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["role"] = {
						},
					},
					["version"] = -1,
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["url"] = "",
					["Icon"] = 135358,
					["Time"] = 1547406548,
				}, -- [4]
				{
					["Enabled"] = false,
					["Revision"] = 73,
					["semver"] = "",
					["HooksTemp"] = {
					},
					["Author"] = "Izimode-Azralon",
					["Name"] = "Hide Neutral Units [Plater]",
					["Desc"] = "Hide neutral units, show when selected, see the constructor script for options.",
					["Hooks"] = {
						["Leave Combat"] = "function (self, unitId, unitFrame, envTable)\n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end    \n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat) then\n            envTable.HideNameplate (unitFrame)\n        end\n    end\nend\n\n\n",
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end\n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat and InCombatLockdown()) then\n            return\n        end\n        \n        envTable.HideNameplate (unitFrame)\n    end\n    \nend\n\n\n\n\n\n\n",
						["Target Changed"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end    \n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat and InCombatLockdown()) then\n            return\n        end\n        \n        --check the unit reaction\n        if (unitFrame.namePlateIsTarget) then\n            envTable.ShowNameplate (unitFrame)\n            \n        else\n            envTable.HideNameplate (unitFrame)\n            \n        end    \n    end\n    \nend\n\n\n\n\n\n\n",
						["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        envTable.ShowNameplate (unitFrame)\n    end\n    \nend\n\n\n\n\n",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --when plater finishes an update on the nameplate\n    --check within the envTable if the healthBar of this nameplate should be hidden\n    if (envTable.IsHidden) then\n        if (unitFrame.healthBar:IsShown()) then\n            envTable.HideNameplate (unitFrame)\n        end\n    end\n    \nend\n\n\n\n\n",
						["Enter Combat"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end    \n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat) then\n            envTable.ShowNameplate (unitFrame)\n        end\n    end\nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.OnlyInOpenWorld = true;\n    envTable.ShowInCombat = true;\n    \n    --consts\n    envTable.REACTION_NEUTRAL = 4;\n    \n    --functions to hide and show the healthBar\n    function envTable.HideNameplate (unitFrame)\n        Plater.HideHealthBar (unitFrame)\n        Plater.DisableHighlight (unitFrame)\n        envTable.IsHidden = true\n    end\n    \n    function envTable.ShowNameplate (unitFrame)\n        Plater.ShowHealthBar (unitFrame)\n        Plater.EnableHighlight (unitFrame)\n        envTable.IsHidden = false\n    end\n    \nend\n\n\n\n\n",
					},
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["race"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["version"] = -1,
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["url"] = "",
					["Icon"] = 1990989,
					["Time"] = 1541606242,
				}, -- [5]
				{
					["Enabled"] = false,
					["Revision"] = 222,
					["semver"] = "",
					["HooksTemp"] = {
					},
					["Author"] = "Kastfall-Azralon",
					["Name"] = "Attacking Specific Unit [Plater]",
					["Desc"] = "Change the nameplate color if the unit is attacking a specific unit like Monk's Ox Statue or Druid's Treants. You may edit which units it track in the constructor script.",
					["Hooks"] = {
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --list of npcs and their colors, can be inserted:\n    --name of the unit\n    --name of the unit in lower case\n    --npcID of the unit\n    \n    --color can be added as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}    \n    \n    envTable.ListOfNpcs = {\n        [61146] = \"olive\", --monk statue npcID\n        [103822] = \"olive\", --druid treant npcID\n        \n    }\n    \n    \nend\n\n\n\n\n",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --get the GUID of the target of the unit\n    local targetGUID = UnitGUID (unitId .. \"target\")\n    \n    if (targetGUID) then\n        \n        --get the npcID of the target\n        local npcID = Plater.GetNpcIDFromGUID (targetGUID)\n        --check if the npcID of this unit is in the npc list \n        if (envTable.ListOfNpcs [npcID]) then\n            Plater.SetNameplateColor (unitFrame, envTable.ListOfNpcs [npcID])\n            \n        else\n            --check if the name of ths unit is in the list\n            local unitName = UnitName (unitId .. \"target\")\n            if (envTable.ListOfNpcs [unitName]) then\n                Plater.SetNameplateColor (unitFrame, envTable.ListOfNpcs [unitName])\n                \n            else\n                --check if the name of the unit in lower case is in the npc list\n                unitName = string.lower (unitName)\n                if (envTable.ListOfNpcs [unitName]) then\n                    Plater.SetNameplateColor (unitFrame, envTable.ListOfNpcs [unitName])                \n                    \n                end\n            end\n        end\n        \n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
					},
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["role"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["version"] = -1,
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["url"] = "",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_attacking_unit",
					["Time"] = 1547993111,
				}, -- [6]
				{
					["Enabled"] = false,
					["Revision"] = 176,
					["semver"] = "",
					["HooksTemp"] = {
					},
					["Author"] = "Tecno-Azralon",
					["Name"] = "Extra Border [Plater]",
					["Desc"] = "Add another border with more customizations. This border can also be manipulated by other scripts.",
					["Hooks"] = {
						["Nameplate Created"] = "function (self, unitId, unitFrame, envTable)\n    \n    --run constructor!\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    if (envTable.IsEnabled) then\n        if (unitFrame.IsSelf) then\n            if (envTable.ShowOnPersonalBar) then\n                envTable.BorderFrame:Show()\n            else\n                envTable.BorderFrame:Hide() \n            end\n        else\n            envTable.BorderFrame:Show()\n        end   \n    end\n    \nend   \n\n\n\n",
						["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.BorderFrame:Hide()\n    \nend\n\n\n",
						["Destructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.BorderFrame:Hide()\n    \nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --border color\n    local borderColor = \"yellow\"\n    \n    --size of the border\n    local borderSize = 1\n    \n    --transparency\n    local borderAlpha = 1\n    \n    --enabled (set to false it you only want to use the extra border in other scripts)\n    local isEnabled = true\n    \n    --export border (allow the border to be used by other scripts)\n    --other scripts can use:\n    --unitFrame.healthBar.extraBorder:Show()\n    --unitFrame.healthBar.extraBorder:SetVertexColor (r, g, b)\n    --unitFrame.healthBar.extraBorder:SetBorderSizes (borderSize)\n    local canExportBorder = true\n    \n    --do not add the border to personal bar\n    local noPersonalBar = true\n    \n    --private\n    do\n        \n        local newBorder = CreateFrame (\"frame\", nil, unitFrame.healthBar, \"NamePlateFullBorderTemplate\")\n        envTable.BorderFrame = newBorder\n        \n        newBorder:SetBorderSizes (borderSize, borderSize, borderSize, borderSize)\n        newBorder:UpdateSizes()\n        \n        local r, g, b = DetailsFramework:ParseColors (borderColor)\n        newBorder:SetVertexColor (r, g, b, borderAlpha)\n        \n        envTable.ShowOnPersonalBar = not noPersonalBar\n        \n        if (canExportBorder) then\n            unitFrame.healthBar.extraBorder = newBorder\n        end\n        \n        if (not isEnabled) then\n            envTable.IsEnabled = false\n        else\n            envTable.IsEnabled = true\n        end\n    end\n    \nend\n\n\n",
					},
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["race"] = {
						},
					},
					["version"] = -1,
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["url"] = "",
					["Icon"] = 133689,
					["Time"] = 1547409079,
				}, -- [7]
				{
					["Enabled"] = false,
					["Revision"] = 93,
					["Options"] = {
					},
					["HooksTemp"] = {
					},
					["version"] = -1,
					["Author"] = "Kastfall-Azralon",
					["semver"] = "",
					["Desc"] = "Function Plater.UpdatePlateSize from Plater.lua exported to scritps.",
					["Hooks"] = {
						["Nameplate Added"] = "\n\n-- exported function Plater.UpdatePlateSize() from Plater.lua\n--this is for advanced users which wants to reorder the nameplate frame at their desire\n\n\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --check if there's a type of unit on this nameplate\n    local plateFrame = unitFrame:GetParent()\n    if (not plateFrame.actorType) then\n        return\n    end\n    \n    --get all the frames and cache some variables\n    local ACTORTYPE_ENEMY_PLAYER = \"enemyplayer\"\n    local profile = Plater.db.profile\n    local DB_PLATE_CONFIG = profile.plate_config\n    local isInCombat = Plater.IsInCombat()\n    local actorType = plateFrame.actorType\n    \n    local unitFrame = plateFrame.unitFrame\n    local healthBar = unitFrame.healthBar\n    local castBar = unitFrame.castBar\n    local powerBar = unitFrame.powerBar\n    local buffFrame1 = unitFrame.BuffFrame\n    local buffFrame2 = unitFrame.BuffFrame2\n    \n    --use in combat bars when in pvp\n    if (plateFrame.actorType == ACTORTYPE_ENEMY_PLAYER) then\n        if ((Plater.ZoneInstanceType == \"pvp\" or Plater.ZoneInstanceType == \"arena\") and DB_PLATE_CONFIG.player.pvp_always_incombat) then\n            isInCombat = true\n        end\n    end\n    \n    --get the config for this actor type\n    local plateConfigs = DB_PLATE_CONFIG [actorType]\n    --get the config key based if the player is in combat\n    local castBarConfigKey, healthBarConfigKey, manaConfigKey = Plater.GetHashKey (isInCombat)\n    \n    --get the width and height from what the user set in the options panel\n    local healthBarWidth, healthBarHeight = unitFrame.customHealthBarWidth or plateConfigs [healthBarConfigKey][1], unitFrame.customHealthBarHeight or plateConfigs [healthBarConfigKey][2]\n    local castBarWidth, castBarHeight = unitFrame.customCastBarWidth or plateConfigs [castBarConfigKey][1], unitFrame.customCastBarHeight or plateConfigs [castBarConfigKey][2]\n    local powerBarWidth, powerBarHeight = unitFrame.customPowerBarHeight or plateConfigs [manaConfigKey][1], unitFrame.customPowerBarHeight or plateConfigs [manaConfigKey][2]\n    \n    --calculate the offset for the cast bar, this is done due to the cast bar be anchored to topleft and topright\n    local castBarOffSetX = (healthBarWidth - castBarWidth) / 2\n    local castBarOffSetY = plateConfigs.castbar_offset\n    \n    --calculate offsets for the power bar\n    local powerBarOffSetX = (healthBarWidth - powerBarWidth) / 2\n    local powerBarOffSetY = 0\n    \n    --calculate the size deviation for pets\n    local unitType = Plater.GetUnitType (plateFrame)\n    if (unitType == \"pet\") then\n        healthBarHeight = healthBarHeight * Plater.db.profile.pet_height_scale\n        healthBarWidth = healthBarWidth * Plater.db.profile.pet_width_scale\n        \n    elseif (unitType == \"minus\") then\n        healthBarHeight = healthBarHeight * Plater.db.profile.minor_height_scale\n        healthBarWidth = healthBarWidth * Plater.db.profile.minor_width_scale\n    end\n    \n    --unit frame - is set to be the same size as the plateFrame\n    unitFrame:ClearAllPoints()\n    unitFrame:SetAllPoints()\n    \n    --calculates the health bar anchor points\n    --it will always be placed in the center of the nameplate area (where it accepts mouse clicks) \n    local xOffSet = (plateFrame:GetWidth() - healthBarWidth) / 2\n    local yOffSet = (plateFrame:GetHeight() - healthBarHeight) / 2\n    \n    --set the health bar point\n    healthBar:ClearAllPoints()\n    PixelUtil.SetPoint (healthBar, \"topleft\", unitFrame, \"topleft\", xOffSet + profile.global_offset_x, -yOffSet + profile.global_offset_y)\n    PixelUtil.SetPoint (healthBar, \"bottomright\", unitFrame, \"bottomright\", -xOffSet + profile.global_offset_x, yOffSet + profile.global_offset_y)\n    \n    --set the cast bar point and size\n    castBar:ClearAllPoints()\n    PixelUtil.SetPoint (castBar, \"topleft\", healthBar, \"bottomleft\", castBarOffSetX, castBarOffSetY)\n    PixelUtil.SetPoint (castBar, \"topright\", healthBar, \"bottomright\", -castBarOffSetX, castBarOffSetY)\n    PixelUtil.SetHeight (castBar, castBarHeight)\n    PixelUtil.SetSize (castBar.Icon, castBarHeight, castBarHeight)\n    PixelUtil.SetSize (castBar.BorderShield, castBarHeight * 1.4, castBarHeight * 1.4)\n    \n    --set the power bar point and size\n    powerBar:ClearAllPoints()\n    PixelUtil.SetPoint (powerBar, \"topleft\", healthBar, \"bottomleft\", powerBarOffSetX, powerBarOffSetY)\n    PixelUtil.SetPoint (powerBar, \"topright\", healthBar, \"bottomright\", -powerBarOffSetX, powerBarOffSetY)\n    PixelUtil.SetHeight (powerBar, powerBarHeight)\n    \n    --power bar are hidden by default, show it if there's a custom size for it\n    if (unitFrame.customPowerBarWidth and unitFrame.customPowerBarHeight) then\n        powerBar:SetUnit (unitFrame.unit)\n    end\n    \n    --aura frames\n    local bf1Anchor = Plater.db.profile.aura_frame1_anchor\n    Plater.SetAnchor (buffFrame1, {side = bf1Anchor.side, x = bf1Anchor.x, y = bf1Anchor.y + plateConfigs.buff_frame_y_offset}, unitFrame.healthBar, (Plater.db.profile.aura_grow_direction or 2) == 2)\n    \n    local bf2Anchor = Plater.db.profile.aura_frame2_anchor\n    Plater.SetAnchor (buffFrame2, {side = bf2Anchor.side, x = bf2Anchor.x, y = bf2Anchor.y + plateConfigs.buff_frame_y_offset}, unitFrame.healthBar, (Plater.db.profile.aura2_grow_direction or 2) == 2)\n    \nend\n\n\n",
					},
					["Time"] = 1596791840,
					["Name"] = "Reorder Nameplate [Plater]",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["race"] = {
						},
					},
					["PlaterCore"] = 1,
					["url"] = "",
					["Icon"] = 574574,
					["LastHookEdited"] = "",
				}, -- [8]
				{
					["Enabled"] = false,
					["Revision"] = 59,
					["semver"] = "",
					["HooksTemp"] = {
					},
					["Author"] = "Izimode-Azralon",
					["Name"] = "Don't Have Aura [Plater]",
					["Desc"] = "Change the nameplate color when a nameplate does not have the auras set in the constructor script.",
					["Hooks"] = {
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --do nothing if the player isn't in combat\n    if (not Plater.IsInCombat()) then\n        return \n    end\n    \n    --do nothing if the unit isn't in combat\n    if (not unitFrame.InCombat) then\n        return\n    end\n    \n    --do nothing if the unit is the player it self\n    if (unitFrame.IsSelf) then\n        return\n    end\n    \n    --check the auras\n    local hasAura = false\n    \n    for auraName, _ in pairs (envTable.TrackingAuras) do\n        if (Plater.NameplateHasAura (unitFrame, auraName)) then\n            hasAura = true\n            break\n        end\n    end\n    \n    if (not hasAura) then\n        Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n    else\n        if (envTable.ForceRefreshNameplateColor) then\n            Plater.RefreshNameplateColor (unitFrame) \n        end\n    end    \n    \nend",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    --Important: lines starting with double dashes are comments and are not part of the script\n    \n    --set this to true if you are not using threat colors in the health bar\n    envTable.ForceRefreshNameplateColor = true\n    \n    --if the unit does not have any of the following auras, it will be painted with the color listed below\n    --list of spells to track, can be the spell name (case-sensitive) or the spellID\n    envTable.TrackingAuras = {\n        --[\"Nightblade\"] = true, --this is an example using the spell name\n        --[195452] = true, --this is an example using the spellID\n        \n    }\n    \n    --which color the nameplate wil be changed\n    --color can be added as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}    \n    --you may also use /plater colors\n    envTable.NameplateColor = \"pink\"\n    \nend",
					},
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["role"] = {
						},
					},
					["version"] = -1,
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["url"] = "",
					["Icon"] = 136207,
					["Time"] = 1554138845,
				}, -- [9]
				{
					["OptionsValues"] = {
					},
					["LastHookEdited"] = "",
					["Hooks"] = {
						["Initialization"] = "function (modTable)\n    \n    --ATTENTION: after enabling this mod, you may have to adjust the anchor point at the Buff Settings tab\n    \n    local sortByTime = false\n    local invertSort = false\n    \n    --which auras goes first, assign a value (any number), bigger value goes first\n    local priority = {\n        [\"Vampiric Touch\"] = 50,\n        [\"Shadow Word: Pain\"] = 22,\n        [\"Mind Flay\"] = 5,\n        [\"Pistol Shot\"] = 50,\n        [\"Marked for Death\"] = 99,\n    }\n    \n    -- Sort function - do not touch\n    Plater.db.profile.aura_sort = true\n    \n    \n    function Plater.AuraIconsSortFunction (aura1, aura2)\n        local p1 = priority[aura1.SpellId] or priority[aura1.SpellName] or 1\n        local p2 = priority[aura2.SpellId] or priority[aura2.SpellName] or 1\n        \n        if sortByTime and p1 == p2 then\n            if invertSort then\n                return (aura1.Duration == 0 and 99999999 or aura1.RemainingTime or 0) > (aura2.Duration == 0 and 99999999 or aura2.RemainingTime or 0)\n            else\n                return (aura1.Duration == 0 and 99999999 or aura1.RemainingTime or 0) < (aura2.Duration == 0 and 99999999 or aura2.RemainingTime or 0)\n            end\n        else\n            if invertSort then\n                 return p1 < p2\n            else\n                return p1 > p2\n            end\n        end\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
					},
					["Time"] = 1608663128,
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["race"] = {
						},
						["encounter_ids"] = {
						},
						["affix"] = {
						},
					},
					["url"] = "",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura_reorder",
					["Enabled"] = false,
					["Revision"] = 356,
					["semver"] = "",
					["Author"] = "Ditador-Azralon",
					["Desc"] = "Reorder buffs and debuffs following the settings set in the constructor.",
					["Name"] = "Aura Reorder [Plater]",
					["PlaterCore"] = 1,
					["version"] = -1,
					["HooksTemp"] = {
					},
					["Options"] = {
					},
				}, -- [10]
				{
					["Enabled"] = false,
					["Revision"] = 182,
					["semver"] = "",
					["HooksTemp"] = {
					},
					["Author"] = "Izimode-Azralon",
					["Name"] = "Players Targeting a Target [Plater]",
					["Desc"] = "Show how many raid members are targeting the unit",
					["Hooks"] = {
						["Leave Combat"] = "function (self, unitId, unitFrame, envTable)\n    envTable.CanShow = false;\n    envTable.TargetAmount:SetText (\"\")\nend\n\n\n",
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    --when a nameplate is added to the screen check if the player is in combat\n    if (InCombatLockdown()) then\n        --player is in combat, check if can check amount of targets\n        envTable.CanShow = envTable.CanShowTargetAmount();\n        \n    else\n        envTable.CanShow = false; \n    end\n    \n    envTable.TargetAmount:SetText (\"\");\n    \nend",
						["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.TargetAmount:SetText (\"\");\n    envTable.CanShow = false;\n    \nend\n\n\n",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --if the script is allowed to show the amount of targets\n    --also check if the unit is in combat\n    if (envTable.CanShow and UnitAffectingCombat (unitId)) then\n        \n        --check if can update the amount of targets following the cooldown set in the constructor script\n        --by default Plater updates the nameplate every 250ms, by default the cooldown is 2, so it'll update the amuont of target every 1/2 of a second\n        envTable.UpdateCooldown = envTable.UpdateCooldown + 1\n        if (envTable.UpdateCooldown < envTable.UpdateInterval) then\n            return\n        else\n            \n            --reset the cooldown interval to check the amount of target again\n            envTable.UpdateCooldown = 0\n            \n            --get the amount of targets\n            local amount;\n            if (envTable.InRaid) then\n                amount = envTable.NumTargetsInRaid (unitFrame)      \n                \n            elseif (envTable.InParty) then\n                amount = envTable.NumTargetsInParty (unitFrame)   \n                \n            else\n                envTable.TargetAmount:SetText (\"\")\n                return\n            end\n            \n            --update the amount text\n            if (amount == 0) then\n                envTable.TargetAmount:SetText (\"\")\n            else\n                envTable.TargetAmount:SetText (amount)\n            end\n            \n        end\n    end\nend\n\n\n",
						["Enter Combat"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if can show the amount of targets\n    envTable.CanShow = envTable.CanShowTargetAmount();\n    \n    if (not envTable.CanShow) then\n        envTable.TargetAmount:SetText (\"\") \n    end\nend\n\n\n\n\n",
						["Constructor"] = "--all gray text like this are comments and do not run as code\n--build the settings and basic functions for the hook\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --declare setting variables:\n    local textColor = \"orange\";\n    local textSize = 12;\n    \n    local showInRaid = true;\n    local showInDungeon = true;\n    local showInArena = false;\n    local showInBattleground = false;\n    local showInOpenWorld = true;\n    \n    envTable.UpdateInterval = 2; --each 2 updates in the nameplate it'll update the amount of targets\n    \n    local anchor = {\n        side = 6, --1 = topleft 2 = left 3 = bottomleft 4 = bottom 5 = bottom right 6 = right 7 = topright 8 = top\n        x = 4, --x offset\n        y = 0, --y offset\n    };\n    \n    \n    ---------------------------------------------------------------------------------------------------------------------------------------------\n    \n    \n    --frames:\n    \n    --create the text that will show the amount of people targeting the unit\n    if (not  unitFrame.healthBar.TargetAmount) then\n        envTable.TargetAmount = Plater:CreateLabel (unitFrame.healthBar, \"\", textSize, textColor);\n        Plater.SetAnchor (envTable.TargetAmount, anchor);\n        unitFrame.healthBar.TargetAmount = envTable.TargetAmount\n    end\n    \n    --in case Plater wipes the envTable\n    envTable.TargetAmount = unitFrame.healthBar.TargetAmount\n    \n    ---------------------------------------------------------------------------------------------------------------------------------------------           \n    --private variables (they will be used in the other scripts within this hook)\n    envTable.CanShow = false;\n    envTable.UpdateCooldown = 0;\n    envTable.InRaid = false;\n    envTable.InParty = false;\n    \n    ---------------------------------------------------------------------------------------------------------------------------------------------           \n    --functions\n    \n    --update the InRaid or InParty proprieties\n    function envTable.UpdateGroupType()\n        if (IsInRaid()) then\n            envTable.InRaid = true;\n            envTable.InParty = false;     \n            \n        elseif (IsInGroup()) then\n            envTable.InRaid = false;\n            envTable.InParty = true;   \n            \n        else\n            envTable.InRaid = false;            \n            envTable.InParty = false;\n        end\n    end\n    \n    --this function controls if the amount of targets can show following the settings in the top of this script\n    function envTable.CanShowTargetAmount()\n        \n        local _, instanceType, difficultyID, _, _, _, _, instanceMapID, instanceGroupSize = GetInstanceInfo()\n        \n        if (showInRaid and instanceType == \"raid\") then\n            envTable.UpdateGroupType()\n            return true\n        end\n        \n        if (showInDungeon and instanceType == \"party\") then\n            envTable.UpdateGroupType()\n            return true\n        end\n        \n        if (showInArena and instanceType == \"arena\") then\n            envTable.UpdateGroupType()\n            return true\n        end\n        \n        if (showInBattleground and instanceType == \"pvp\") then\n            envTable.UpdateGroupType()\n            return true\n        end\n        \n        if (showInOpenWorld and instanceType == \"none\") then\n            envTable.UpdateGroupType()\n            if (envTable.InRaid or envTable.InParty) then\n                return true\n            end\n        end\n        \n        return false\n    end\n    \n    --get the amount of player targetting the unit in raid or party\n    function envTable.NumTargetsInRaid (unitFrame)\n        local amount = 0\n        for i = 1, GetNumGroupMembers() do\n            local unit = \"raid\" .. i .. \"target\"\n            if (UnitGUID (unit) == unitFrame.namePlateUnitGUID) then\n                amount = amount + 1\n            end\n        end\n        \n        return amount\n    end\n    \n    function envTable.NumTargetsInParty()\n        local amount = 0\n        for i = 1, GetNumGroupMembers() - 1 do\n            local unit = \"party\" .. i .. \"target\"\n            if (UnitGUID (unit) == unitFrame.namePlateUnitGUID) then\n                amount = amount + 1\n            end\n        end\n        \n        local unit = \"playertarget\"\n        if (UnitGUID (unit) == unitFrame.namePlateUnitGUID) then\n            amount = amount + 1\n        end        \n        \n        return amount\n    end\n    \nend",
					},
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["role"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["version"] = -1,
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["url"] = "",
					["Icon"] = 1966587,
					["Time"] = 1548278227,
				}, -- [11]
				{
					["Enabled"] = false,
					["Revision"] = 93,
					["semver"] = "",
					["HooksTemp"] = {
					},
					["Author"] = "Izimode-Azralon",
					["Name"] = "Current Target Color [Plater]",
					["Desc"] = "Changes the target color to the color set in the constructor script.",
					["Hooks"] = {
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    envTable.UpdateColor (unitFrame)\nend",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    envTable.UpdateColor (unitFrame)\nend",
						["Target Changed"] = "function (self, unitId, unitFrame, envTable)\n    envTable.UpdateColor (unitFrame)\nend\n\n\n\n\n\n\n\n\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --usage: color name e.g \"red\" \"yellow\"; color table e.g {1, 0, 0} {1, 1, 0}; hex string e.g. \"#FF0000\" \"FFFF00\"\n    \n    envTable.TargetColor = \"purple\"\n    --envTable.TargetColor = \"#FF00FF\"\n    --envTable.TargetColor = {252/255, 0/255, 254/255}\n    \n    function envTable.UpdateColor (unitFrame)\n        --do not change the color of the personal bar\n        if (not unitFrame.IsSelf) then\n            \n            --if this nameplate the current target of the player?\n            if (unitFrame.namePlateIsTarget) then\n                Plater.SetNameplateColor (unitFrame, envTable.TargetColor)  --rgb\n            else\n                --refresh the nameplate color\n                Plater.RefreshNameplateColor (unitFrame)\n            end\n        end\n    end\n    \nend\n\n\n\n\n",
					},
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["role"] = {
						},
					},
					["version"] = -1,
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["url"] = "",
					["Icon"] = 878211,
					["Time"] = 1552354619,
				}, -- [12]
			},
			["aura_x_offset"] = 0,
			["first_run3"] = true,
			["cast_statusbar_fadeout_time"] = 0.4999999701976776,
			["hover_highlight_alpha"] = 0.2999999821186066,
			["indicator_raidmark_scale"] = 0.9999999403953552,
			["saved_cvars"] = {
				["ShowClassColorInNameplate"] = "1",
				["nameplateLargeTopInset"] = "0.085",
				["nameplateShowEnemyMinus"] = "1",
				["nameplateMotionSpeed"] = "0.05",
				["NamePlateClassificationScale"] = "1",
				["nameplateShowFriendlyTotems"] = "0",
				["nameplateShowEnemyMinions"] = "1",
				["nameplateShowFriendlyPets"] = "0",
				["nameplateShowFriendlyNPCs"] = "0",
				["nameplateSelectedScale"] = "1.15",
				["nameplateTargetRadialPosition"] = "1",
				["nameplateResourceOnTarget"] = "0",
				["nameplateShowAll"] = "1",
				["nameplateMinScale"] = "1",
				["nameplateMaxDistance"] = "100",
				["nameplateOtherTopInset"] = "0.085",
				["nameplateShowSelf"] = "0",
				["nameplateShowFriendlyMinions"] = "0",
				["nameplateTargetBehindMaxDistance"] = "30",
				["nameplateShowFriendlyGuardians"] = "0",
				["NamePlateHorizontalScale"] = "1",
				["ShowNamePlateLoseAggroFlash"] = "1",
				["nameplateShowEnemies"] = "1",
				["nameplatePersonalHideDelaySeconds"] = "0.2",
				["NamePlateVerticalScale"] = "1",
			},
			["aura2_y_offset"] = 5,
			["login_counter"] = 127,
			["script_data_trash"] = {
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \n    if (not unitFrame.spitefulTexture) then\n        unitFrame.spitefulTexture = unitFrame.healthBar:CreateTexture(nil, \"overlay\", nil, 6)\n        unitFrame.spitefulTexture:SetPoint('right', 0, 0)\n        unitFrame.spitefulTexture:SetSize(27, 14)\n        unitFrame.spitefulTexture:SetColorTexture(.3, .3, 1, .7)\n        \n        unitFrame.spitefulText = unitFrame.healthBar:CreateFontString(nil, \"overlay\", \"GameFontNormal\", 6)\n        unitFrame.spitefulText:SetPoint(\"right\", unitFrame.spitefulTexture, \"right\", -2, 0)\n        unitFrame.spitefulText:SetJustifyH(\"right\")\n        \n        unitFrame.spitefulTexture:Hide()\n        unitFrame.spitefulText:Hide()\n    end\n    \n    function envTable.UpdateSpitefulWidget(unitFrame)\n        \n        local r, g, b, a = Plater:ParseColors(scriptTable.config.bgColor)\n        unitFrame.spitefulTexture:SetSize(scriptTable.config.bgWidth, unitFrame.healthBar:GetHeight())   \n        Plater:SetFontSize(unitFrame.spitefulText, scriptTable.config.textSize)\n        Plater:SetFontColor(unitFrame.spitefulText, scriptTable.config.textColor)\n        \n        local currentHealth = unitFrame.healthBar.CurrentHealth\n        local maxHealth = unitFrame.healthBar.CurrentHealthMax\n        \n        local healthPercent = currentHealth / maxHealth * 100\n        local timeToDie = format(\"%.1fs\", healthPercent / 8)\n        unitFrame.spitefulText:SetText(timeToDie)\n        \n        unitFrame.spitefulText:Show()\n        unitFrame.spitefulTexture:Show()\n    end\nend\n\n\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    if (unitFrame.spitefulTexture) then\n        unitFrame.spitefulText:Hide()\n        unitFrame.spitefulTexture:Hide()    \n    end\nend\n\n\n\n\n\n",
					["OptionsValues"] = {
					},
					["ScriptType"] = 3,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.UpdateSpitefulWidget(unitFrame)\nend\n\n\n",
					["Time"] = 1608852889,
					["url"] = "",
					["Icon"] = 135945,
					["Enabled"] = true,
					["Revision"] = 59,
					["semver"] = "",
					["Author"] = "Symantec-Azralon",
					["Initialization"] = "		function (scriptTable)\n			--insert code here\n			\n		end\n	",
					["Desc"] = "Time to die Spiteful affix",
					["NpcNames"] = {
						"174773", -- [1]
					},
					["SpellIds"] = {
					},
					["Name"] = "M+ Spiteful",
					["PlaterCore"] = 1,
					["version"] = -1,
					["Options"] = {
						{
							["Type"] = 2,
							["Max"] = 50,
							["Desc"] = "",
							["Min"] = 10,
							["Name"] = "Width",
							["Value"] = 27,
							["Key"] = "bgWidth",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [1]
						{
							["Type"] = 1,
							["Key"] = "bgColor",
							["Value"] = {
								0.5058823529411764, -- [1]
								0.07058823529411765, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["Name"] = "Background Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "",
						}, -- [2]
						{
							["Type"] = 6,
							["Key"] = "option5",
							["Value"] = 0,
							["Name"] = "Option 5",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [3]
						{
							["Type"] = 2,
							["Max"] = 24,
							["Desc"] = "",
							["Min"] = 7,
							["Name"] = "Text Size",
							["Value"] = 8,
							["Key"] = "textSize",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [4]
						{
							["Type"] = 1,
							["Key"] = "textColor",
							["Value"] = {
								1, -- [1]
								0.5843137254901961, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Name"] = "Text Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "",
						}, -- [5]
					},
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.UpdateSpitefulWidget(unitFrame)\nend\n\n\n",
					["__TrashAt"] = 1610769153,
				}, -- [1]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \n    if (not unitFrame.spitefulTexture) then\n        unitFrame.spitefulTexture = unitFrame.healthBar:CreateTexture(nil, \"overlay\", nil, 6)\n        unitFrame.spitefulTexture:SetPoint('right', 0, 0)\n        unitFrame.spitefulTexture:SetSize(27, 14)\n        unitFrame.spitefulTexture:SetColorTexture(.3, .3, 1, .7)\n        \n        unitFrame.spitefulText = unitFrame.healthBar:CreateFontString(nil, \"overlay\", \"GameFontNormal\", 6)\n        DetailsFramework:SetFontFace (unitFrame.spitefulText, \"2002\")\n        unitFrame.spitefulText:SetPoint(\"right\", unitFrame.spitefulTexture, \"right\", -2, 0)\n        unitFrame.spitefulText:SetJustifyH(\"right\")\n        \n        unitFrame.spitefulTexture:Hide()\n        unitFrame.spitefulText:Hide()\n    end\n    \n    function envTable.UpdateSpitefulWidget(unitFrame)\n        \n        local r, g, b, a = Plater:ParseColors(scriptTable.config.bgColor)\n        unitFrame.spitefulTexture:SetColorTexture(r, g, b, a)\n        unitFrame.spitefulTexture:SetSize(scriptTable.config.bgWidth, unitFrame.healthBar:GetHeight())   \n        Plater:SetFontSize(unitFrame.spitefulText, scriptTable.config.textSize)\n        Plater:SetFontColor(unitFrame.spitefulText, scriptTable.config.textColor)\n        \n        local currentHealth = unitFrame.healthBar.CurrentHealth\n        local maxHealth = unitFrame.healthBar.CurrentHealthMax\n        \n        local healthPercent = currentHealth / maxHealth * 100\n        local timeToDie = format(\"%.1fs\", healthPercent / 8)\n        unitFrame.spitefulText:SetText(timeToDie)\n        \n        unitFrame.spitefulText:Show()\n        unitFrame.spitefulTexture:Show()\n        \n        if scriptTable.config.switchTargetName then\n            local plateFrame = unitFrame.PlateFrame\n            local target = UnitName(unitFrame.namePlateUnitToken .. \"target\") or UnitName(unitFrame.namePlateUnitToken)\n            if target and target ~= \"\" then\n                plateFrame.namePlateUnitName = target\n                Plater.UpdateUnitName (plateFrame)\n            end\n        end\n        \n        if scriptTable.config.useTargetingColor then\n            local targeted = UnitIsUnit(unitFrame.namePlateUnitToken .. \"target\", \"player\")\n            if targeted then\n                Plater.SetNameplateColor (unitFrame, scriptTable.config.targetingColor)\n            end\n        end\n    end\nend",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    if (unitFrame.spitefulTexture) then\n        unitFrame.spitefulText:Hide()\n        unitFrame.spitefulTexture:Hide()    \n    end\nend\n\n\n\n\n\n",
					["OptionsValues"] = {
					},
					["ScriptType"] = 3,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.UpdateSpitefulWidget(unitFrame)\nend\n\n\n",
					["Time"] = 1609281290,
					["url"] = "",
					["Icon"] = 135945,
					["Enabled"] = true,
					["Revision"] = 132,
					["semver"] = "",
					["Author"] = "Symantec-Azralon",
					["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["Desc"] = "Time to die Spiteful affix",
					["__TrashAt"] = 1613362058,
					["NpcNames"] = {
						"174773", -- [1]
					},
					["SpellIds"] = {
					},
					["PlaterCore"] = 1,
					["Name"] = "M+ Spiteful",
					["version"] = -1,
					["Options"] = {
						{
							["Type"] = 2,
							["Max"] = 50,
							["Desc"] = "",
							["Min"] = 10,
							["Fraction"] = false,
							["Value"] = 27,
							["Name"] = "Width",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Key"] = "bgWidth",
						}, -- [1]
						{
							["Type"] = 1,
							["Name"] = "Background Color",
							["Value"] = {
								0.5058823529411764, -- [1]
								0.07058823529411765, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["Key"] = "bgColor",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "",
						}, -- [2]
						{
							["Type"] = 6,
							["Name"] = "Option 5",
							["Value"] = 0,
							["Key"] = "option5",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [3]
						{
							["Type"] = 2,
							["Max"] = 24,
							["Desc"] = "",
							["Min"] = 7,
							["Fraction"] = false,
							["Value"] = 8,
							["Name"] = "Text Size",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Key"] = "textSize",
						}, -- [4]
						{
							["Type"] = 1,
							["Name"] = "Text Color",
							["Value"] = {
								1, -- [1]
								0.5843137254901961, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Key"] = "textColor",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "",
						}, -- [5]
						{
							["Type"] = 6,
							["Key"] = "option7",
							["Value"] = 0,
							["Name"] = "Option 7",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [6]
						{
							["Type"] = 4,
							["Key"] = "switchTargetName",
							["Value"] = false,
							["Name"] = "Show Target instead of Name",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "",
						}, -- [7]
						{
							["Type"] = 6,
							["Key"] = "option8",
							["Value"] = 0,
							["Name"] = "Option 8",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [8]
						{
							["Type"] = 4,
							["Key"] = "useTargetingColor",
							["Value"] = false,
							["Name"] = "Change Color if targeting You",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "",
						}, -- [9]
						{
							["Type"] = 1,
							["Key"] = "targetingColor",
							["Value"] = {
								0.5058823529411764, -- [1]
								0.07058823529411765, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["Name"] = "Color if targeting You",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "",
						}, -- [10]
					},
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.UpdateSpitefulWidget(unitFrame)\nend\n\n\n",
				}, -- [2]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --settings (require a /reload after editing any setting)\n    do\n        --blink and glow\n        envTable.BlinkEnabled = scriptTable.config.blinkEnabled\n        envTable.GlowEnabled = scriptTable.config.glowEnabled \n        envTable.ChangeNameplateColor = scriptTable.config.changeNameplateColor;\n        envTable.TimeLeftToBlink = scriptTable.config.timeleftToBlink;\n        envTable.BlinkSpeed = scriptTable.config.blinkSpeed; \n        envTable.BlinkColor = scriptTable.config.blinkColor; \n        envTable.BlinkMaxAlpha = scriptTable.config.blinkMaxAlpha; \n        envTable.NameplateColor = scriptTable.config.nameplateColor; \n        \n        --text color\n        envTable.TimerColorEnabled = scriptTable.config.timerColorEnabled \n        envTable.TimeLeftWarning = scriptTable.config.timeLeftWarning;\n        envTable.TimeLeftCritical = scriptTable.config.timeLeftCritical;\n        envTable.TextColor_Warning = scriptTable.config.warningColor; \n        envTable.TextColor_Critical = scriptTable.config.criticalColor; \n        \n        --list of spellIDs to ignore\n        envTable.IgnoredSpellID = {\n            [12] = true, --use a simple comma here\n            [13] = true,\n        }\n    end\n    \n    \n    --private\n    do\n        envTable.blinkTexture = Plater:CreateImage (self, \"\", 1, 1, \"overlay\")\n        envTable.blinkTexture:SetPoint ('center', 0, 0)\n        envTable.blinkTexture:Hide()\n        \n        local onPlay = function()\n            envTable.blinkTexture:Show() \n            envTable.blinkTexture.color = envTable.BlinkColor\n        end\n        local onStop = function()\n            envTable.blinkTexture:Hide()  \n        end\n        envTable.blinkAnimation = Plater:CreateAnimationHub (envTable.blinkTexture, onPlay, onStop)\n        Plater:CreateAnimation (envTable.blinkAnimation, \"ALPHA\", 1, envTable.BlinkSpeed / 2, 0, envTable.BlinkMaxAlpha)\n        Plater:CreateAnimation (envTable.blinkAnimation, \"ALPHA\", 2, envTable.BlinkSpeed / 2, envTable.BlinkMaxAlpha, 0)\n        \n        envTable.glowEffect = envTable.glowEffect or Plater.CreateIconGlow (self)\n        --envTable.glowEffect:Show() --envTable.glowEffect:Hide()\n        \n    end\n    \nend\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.blinkAnimation:Stop()\n    envTable.blinkTexture:Hide()\n    envTable.blinkAnimation:Stop()\n    envTable.glowEffect:Stop()\n    Plater:SetFontColor (self.Cooldown.Timer, Plater.db.profile.aura_timer_text_color)\nend\n\n\n",
					["OptionsValues"] = {
					},
					["ScriptType"] = 1,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    local timeLeft = envTable._RemainingTime\n    \n    --check if the spellID isn't being ignored\n    if (envTable.IgnoredSpellID [envTable._SpellID]) then\n        return\n    end\n    \n    --check the time left and start or stop the blink animation and also check if the time left is > zero\n    if ((envTable.BlinkEnabled or envTable.GlowEnabled) and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftToBlink) then\n            --blink effect\n            if (envTable.BlinkEnabled) then\n                if (not envTable.blinkAnimation:IsPlaying()) then\n                    envTable.blinkAnimation:Play()\n                end\n            end\n            --glow effect\n            if (envTable.GlowEnabled) then\n                envTable.glowEffect:Show()\n            end\n            --nameplate color\n            if (envTable.ChangeNameplateColor) then\n                Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n            end\n        else\n            --blink effect\n            if (envTable.blinkAnimation:IsPlaying()) then\n                envTable.blinkAnimation:Stop()\n            end\n            --glow effect\n            if (envTable.GlowEnabled and envTable.glowEffect:IsShown()) then\n                envTable.glowEffect:Hide()\n            end\n        end\n    end\n    \n    --timer color\n    if (envTable.TimerColorEnabled and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftCritical) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Critical)\n        elseif (timeLeft < envTable.TimeLeftWarning) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Warning)        \n        else\n            Plater:SetFontColor (self.Cooldown.Timer, Plater.db.profile.aura_timer_text_color)\n        end\n    end\n    \nend",
					["Time"] = 1604354808,
					["url"] = "",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura_blink",
					["Enabled"] = true,
					["Revision"] = 331,
					["semver"] = "",
					["Author"] = "Izimode-Azralon",
					["Initialization"] = "					function (scriptTable)\n						--insert code here\n						\n					end\n				",
					["Desc"] = "Blink, change the number and nameplate color. Add the debuffs int he trigger box. Set settings on constructor script.",
					["__TrashAt"] = 1613362058,
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.blinkTexture:SetSize (self:GetSize())\n    \nend\n\n\n",
					["SpellIds"] = {
					},
					["PlaterCore"] = 1,
					["Options"] = {
						{
							["Type"] = 6,
							["Key"] = "option10",
							["Value"] = 0,
							["Name"] = "Blank Space",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [1]
						{
							["Type"] = 5,
							["Key"] = "option17",
							["Value"] = "Enter the spell name or spellID in the Add Trigger box and hit \"Add\".",
							["Name"] = "Option 17",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [2]
						{
							["Type"] = 6,
							["Name"] = "Blank Space",
							["Value"] = 0,
							["Key"] = "option10",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [3]
						{
							["Type"] = 4,
							["Key"] = "blinkEnabled",
							["Value"] = true,
							["Name"] = "Blink Enabled",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "set to 'false' to disable blink",
						}, -- [4]
						{
							["Type"] = 4,
							["Key"] = "glowEnabled",
							["Value"] = true,
							["Name"] = "Glow Enabled",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "set to 'false' to disable glows",
						}, -- [5]
						{
							["Type"] = 4,
							["Key"] = "changeNameplateColor",
							["Value"] = true,
							["Name"] = "Change NamePlate Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "set to 'true' to enable nameplate color change",
						}, -- [6]
						{
							["Type"] = 2,
							["Max"] = 20,
							["Desc"] = "in seconds, affects the blink effect only",
							["Min"] = 1,
							["Fraction"] = true,
							["Value"] = 3,
							["Name"] = "Timeleft to Blink",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Key"] = "timeleftToBlink",
						}, -- [7]
						{
							["Type"] = 2,
							["Max"] = 3,
							["Desc"] = "time to complete a blink loop",
							["Min"] = 0.5,
							["Fraction"] = true,
							["Value"] = 1,
							["Name"] = "Blink Speed",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Key"] = "blinkSpeed",
						}, -- [8]
						{
							["Type"] = 2,
							["Max"] = 1,
							["Desc"] = "max transparency in the animation loop (1.0 is full opaque)",
							["Min"] = 0.1,
							["Fraction"] = true,
							["Value"] = 0.6,
							["Name"] = "Blink Max Alpha",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Key"] = "blinkMaxAlpha",
						}, -- [9]
						{
							["Type"] = 1,
							["Key"] = "blinkColor",
							["Value"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["Name"] = "Blink Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "color of the blink",
						}, -- [10]
						{
							["Type"] = 1,
							["Key"] = "",
							["Value"] = {
								0.2862745098039216, -- [1]
								0.00392156862745098, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Name"] = "Nameplate Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "nameplate color if ChangeNameplateColor is true",
						}, -- [11]
						{
							["Type"] = 6,
							["Name"] = "Blank Space",
							["Value"] = 0,
							["Key"] = "option10",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [12]
						{
							["Type"] = 4,
							["Key"] = "timerColorEnabled",
							["Value"] = true,
							["Name"] = "Timer Color Enabled",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "set to 'false' to disable changes in the color of the time left text",
						}, -- [13]
						{
							["Type"] = 2,
							["Max"] = 20,
							["Desc"] = "in seconds, affects the color of the text",
							["Min"] = 1,
							["Name"] = "Time Left Warning",
							["Value"] = 8,
							["Fraction"] = true,
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Key"] = "timeLeftWarning",
						}, -- [14]
						{
							["Type"] = 2,
							["Max"] = 10,
							["Desc"] = "in seconds, affects the color of the text",
							["Min"] = 1,
							["Name"] = "Time Left Critical",
							["Value"] = 3,
							["Fraction"] = true,
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Key"] = "timeLeftCritical",
						}, -- [15]
						{
							["Type"] = 1,
							["Key"] = "warningColor",
							["Value"] = {
								1, -- [1]
								0.8705882352941177, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Name"] = "Warning Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "color when the time left entered in a warning zone",
						}, -- [16]
						{
							["Type"] = 1,
							["Key"] = "criticalColor",
							["Value"] = {
								1, -- [1]
								0.07450980392156863, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Name"] = "Critical Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "color when the time left is critical",
						}, -- [17]
					},
					["version"] = -1,
					["Name"] = "Aura - Blink by Time Left [Plater]",
					["NpcNames"] = {
					},
				}, -- [3]
			},
			["pet_width_scale"] = 0.949999988079071,
			["plate_config"] = {
				["global_health_height"] = 12,
				["friendlyplayer"] = {
					["cast"] = {
						112, -- [1]
					},
					["actorname_text_spacing"] = 9,
					["health"] = {
						112, -- [1]
						12, -- [2]
					},
					["cast_incombat"] = {
						112, -- [1]
					},
					["level_text_alpha"] = 0.2999999821186066,
					["health_incombat"] = {
						112, -- [1]
						12, -- [2]
					},
				},
				["global_health_width"] = 112,
				["enemynpc"] = {
					["cast_incombat"] = {
						112, -- [1]
					},
					["level_text_alpha"] = 0.2999999821186066,
					["health_incombat"] = {
						112, -- [1]
						12, -- [2]
					},
				},
				["enemyplayer"] = {
					["cast_incombat"] = {
						112, -- [1]
					},
					["health_incombat"] = {
						112, -- [1]
						12, -- [2]
					},
					["level_text_alpha"] = 0.2999999821186066,
					["actorname_text_spacing"] = 11,
				},
				["friendlynpc"] = {
					["cast_incombat"] = {
						112, -- [1]
					},
					["health_incombat"] = {
						112, -- [1]
						12, -- [2]
					},
					["level_text_alpha"] = 0.2999999821186066,
					["actorname_text_spacing"] = 9,
				},
			},
			["aura_y_offset"] = 5,
			["use_ui_parent"] = true,
			["hook_data_trash"] = {
				{
					["OptionsValues"] = {
					},
					["LastHookEdited"] = "",
					["Hooks"] = {
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --ATTENTION: after enabling this script, you may have to adjust the anchor point at the Buff Settings tab\n    \n    --space between each aura icon\n    envTable.padding = 2\n    \n    --space between each row of icons\n    envTable.rowPadding = 12\n    \n    --amount of icons in the row, it'll breakline and start a new row after reach the threshold\n    envTable.maxAurasPerRow = 5\n    \n    --stack auras of the same name that arent stacked by default from the game\n    envTable.consolidadeRepeatedAuras = true    \n    \n    --which auras goes first, assign a value (any number), bigger value goes first\n    envTable.priority = {\n        [\"Vampiric Touch\"] = 50,\n        [\"Shadow Word: Pain\"] = 22,\n        [\"Mind Flay\"] = 5,\n    }\n    \nend \n\n\n\n\n",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    local auraContainers = {unitFrame.BuffFrame.PlaterBuffList}\n    \n    if (Plater.db.profile.buffs_on_aura2) then\n        auraContainers [2] = unitFrame.BuffFrame2.PlaterBuffList\n    end\n    \n    for containerID = 1, #auraContainers do\n        \n        local auraContainer = auraContainers [containerID]\n        local aurasShown = {}\n        local aurasDuplicated = {}\n        \n        --build the list of auras shown in the buff frame and check for each aura priority\n        --also check if the consolidate (stack) auras with the same name is enabled\n        for index, auraIcon in ipairs (auraContainer) do\n            if (auraIcon:IsShown()) then\n                if (envTable.consolidadeRepeatedAuras) then\n                    --is this aura already shown?\n                    local iconShownIndex = aurasDuplicated [auraIcon.SpellName]\n                    if (iconShownIndex) then\n                        --get the table with information about the shown icon\n                        local auraShownTable = aurasShown [iconShownIndex]\n                        --get the icon already in the table\n                        local icon = auraShownTable[1]\n                        --increase the amount of stacks\n                        auraShownTable[3] = auraShownTable[3] + 1\n                        \n                        --check if the remaining time of the icon already added in the table is lower than the current\n                        if (auraIcon.RemainingTime > icon.RemainingTime) then\n                            --replace the icon for the icon with bigger duration\n                            auraShownTable[1] = auraIcon\n                            icon:Hide()\n                        else\n                            auraIcon:Hide()\n                        end\n                    else    \n                        local priority = envTable.priority[auraIcon.SpellName] or envTable.priority[auraIcon.spellId] or 1\n                        tinsert (aurasShown, {auraIcon, priority, 1}) --icon frame, priority, stack amount\n                        aurasDuplicated [auraIcon.SpellName] = #aurasShown\n                    end\n                else\n                    --not stacking similar auras\n                    local priority = envTable.priority[auraIcon.SpellName] or envTable.priority[auraIcon.spellId] or 1\n                    tinsert (aurasShown, {auraIcon, priority})\n                    \n                end           \n            end\n        end\n        \n        --sort auras by priority\n        table.sort (aurasShown, DetailsFramework.SortOrder2)\n        \n        local growDirection\n        if (containerID == 1) then --debuff container\n            growDirection = Plater.db.profile.aura_grow_direction\n            --force to grow to right if it is anchored to center\n            if (growDirection == 2) then\n                growDirection = 3\n            end\n            -- \"Left\", \"Center\", \"Right\" - 1  2  3\n            \n        elseif (containerID == 2) then --buff container\n            growDirection = Plater.db.profile.aura2_grow_direction\n            --force to grow to left if it is anchored to center\n            if (growDirection == 2) then\n                growDirection = 1\n            end\n            \n        end\n        \n        local padding = envTable.padding\n        local framersPerRow = envTable.maxAurasPerRow + 1\n        local horizontalLength = (-padding or 0)\n        \n        --first icon is where the row starts\n        local firstIcon = aurasShown[1] and aurasShown[1][1]\n        \n        if (firstIcon) then\n            local anchorPoint = firstIcon:GetParent() --anchor point is the BuffFrame\n            anchorPoint:SetSize (1, 1)\n            \n            --> left to right\n            if (growDirection == 3) then\n                --> iterate among all aura icons\n                for i = 1, #aurasShown do\n                    local auraIcon = aurasShown [i][1]\n                    auraIcon:ClearAllPoints()\n                    \n                    if (i == 1) then\n                        auraIcon:SetPoint (\"bottomleft\", anchorPoint, \"bottomleft\", 0, 0)\n                    elseif (i % framersPerRow == 0) then\n                        auraIcon:SetPoint (\"bottomleft\", firstIcon, \"topleft\", 0, envTable.rowPadding or 0)\n                        framersPerRow = framersPerRow + framersPerRow\n                    else\n                        auraIcon:SetPoint (\"topleft\", aurasShown [i-1][1], \"topright\", padding, 0)\n                    end\n                    \n                    local stacks = aurasShown[i][3]\n                    if (stacks and stacks > 1) then\n                        auraIcon.StackText:SetText (stacks)\n                        auraIcon.StackText:Show()\n                    end\n                    \n                    horizontalLength = horizontalLength + auraIcon:GetWidth() + padding\n                end\n                \n                --right to left\n            elseif (growDirection == 1) then\n                --> iterate among all aura icons\n                for i = 1, #aurasShown do\n                    local auraIcon = aurasShown [i][1]\n                    auraIcon:ClearAllPoints()\n                    \n                    if (i == 1) then\n                        auraIcon:SetPoint (\"bottomright\", anchorPoint, \"bottomright\", 0, 0)\n                    elseif (i % framersPerRow == 0) then\n                        auraIcon:SetPoint (\"bottomright\", firstIcon, \"topright\", 0, envTable.rowPadding or 0)\n                        framersPerRow = framersPerRow + framersPerRow\n                    else\n                        auraIcon:SetPoint (\"topright\", aurasShown [i-1][1], \"topleft\", -padding, 0)\n                    end\n                    \n                    local stacks = aurasShown[i][3]\n                    if (stacks and stacks > 1) then\n                        auraIcon.StackText:SetText (stacks)\n                        auraIcon.StackText:Show()\n                    end\n                    \n                    horizontalLength = horizontalLength + auraIcon:GetWidth() + padding\n                end                    \n            end\n            \n            --set the size of the buff frame\n            anchorPoint:SetWidth (horizontalLength)\n            anchorPoint:SetHeight (firstIcon:GetHeight())\n            \n        end\n    end\nend\n\n\n",
					},
					["__TrashAt"] = 1609008878,
					["Time"] = 1596741775,
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["role"] = {
						},
					},
					["url"] = "",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura_reorder",
					["Enabled"] = false,
					["Revision"] = 295,
					["semver"] = "",
					["Author"] = "Ditador-Azralon",
					["Desc"] = "Reorder buffs and debuffs following the settings set in the constructor.",
					["version"] = -1,
					["PlaterCore"] = 1,
					["Name"] = "Aura Reorder [Plater]",
					["HooksTemp"] = {
					},
					["Options"] = {
					},
				}, -- [1]
			},
			["script_auto_imported"] = {
				["Unit - Important"] = 11,
				["Aura - Buff Alert"] = 13,
				["Cast - Very Important"] = 11,
				["Explosion Affix M+"] = 11,
				["Aura - Debuff Alert"] = 11,
				["Cast - Ultra Important"] = 11,
				["Cast - Big Alert"] = 11,
				["Cast - Small Alert"] = 11,
				["Auto Set Skull"] = 11,
				["Unit - Main Target"] = 11,
				["Aura - Blink Time Left"] = 12,
				["Countdown"] = 11,
				["Unit - Health Markers"] = 12,
				["Cast - Frontal Cone"] = 11,
				["Fixate"] = 11,
				["Cast - Tank Interrupt"] = 11,
				["Fixate On You"] = 11,
				["Spiteful Affix"] = 3,
				["Unit - Show Energy"] = 11,
			},
			["range_check_in_range_or_target_alpha"] = 0.8999999761581421,
			["update_throttle"] = 0.1200000047683716,
			["minor_width_scale"] = 0.8999999761581421,
			["range_check_alpha"] = 0.6499999761581421,
			["health_animation_time_dilatation"] = 2.619999885559082,
			["npc_cache"] = {
				[53206] = {
					"Hell Hound", -- [1]
					"Firelands", -- [2]
				},
				[53222] = {
					"Flamewaker Centurion", -- [1]
					"Firelands", -- [2]
				},
				[45062] = {
					"Oathsworn Scorpid Keeper", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[39984] = {
					"Malignant Trogg", -- [1]
					"Grim Batol", -- [2]
				},
				[168942] = {
					"Death Speaker", -- [1]
					"De Other Side", -- [2]
				},
				[40272] = {
					"Ascended Rockbreaker", -- [1]
					"Grim Batol", -- [2]
				},
				[40320] = {
					"Valiona", -- [1]
					"Grim Batol", -- [2]
				},
				[53622] = {
					"Lava Spawn", -- [1]
					"Firelands", -- [2]
				},
				[53127] = {
					"Fire Scorpion", -- [1]
					"Firelands", -- [2]
				},
				[162046] = {
					"Famished Tick", -- [1]
					"Sanguine Depths", -- [2]
				},
				[167731] = {
					"Separation Assistant", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[164218] = {
					"Lord Chamberlain", -- [1]
					"Halls of Atonement", -- [2]
				},
				[40448] = {
					"Twilight Enforcer", -- [1]
					"Grim Batol", -- [2]
				},
				[45063] = {
					"Bonesnapper Scorpid", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[171181] = {
					"Territorial Bladebeak", -- [1]
					"De Other Side", -- [2]
				},
				[162047] = {
					"Insatiable Brute", -- [1]
					"Sanguine Depths", -- [2]
				},
				[166264] = {
					"Spare Parts", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[40177] = {
					"Forgemaster Throngus", -- [1]
					"Grim Batol", -- [2]
				},
				[170480] = {
					"Atal'ai Deathwalker", -- [1]
					"De Other Side", -- [2]
				},
				[162049] = {
					"Vestige of Doubt", -- [1]
					"Sanguine Depths", -- [2]
				},
				[40273] = {
					"Ascended Waterlasher", -- [1]
					"Grim Batol", -- [2]
				},
				[53096] = {
					"Fire Turtle Hatchling", -- [1]
					"Firelands", -- [2]
				},
				[53128] = {
					"Giant Fire Scorpion", -- [1]
					"Firelands", -- [2]
				},
				[171184] = {
					"Mythresh, Sky's Talons", -- [1]
					"De Other Side", -- [2]
				},
				[54693] = {
					"Time-Twisted Rifleman", -- [1]
					"End Time", -- [2]
				},
				[39890] = {
					"Twilight Earthshaper", -- [1]
					"Grim Batol", -- [2]
				},
				[171376] = {
					"Head Custodian Javlin", -- [1]
					"Sanguine Depths", -- [2]
				},
				[168949] = {
					"Risen Bonesoldier", -- [1]
					"De Other Side", -- [2]
				},
				[39954] = {
					"Twilight Shadow Weaver", -- [1]
					"Grim Batol", -- [2]
				},
				[163520] = {
					"Forsworn Squad-Leader", -- [1]
					"Spires of Ascension", -- [2]
				},
				[162051] = {
					"Frenzied Ghoul", -- [1]
					"Sanguine Depths", -- [2]
				},
				[41040] = {
					"Twisted Visage", -- [1]
					"Grim Batol", -- [2]
				},
				[170483] = {
					"Atal'ai Deathwalker's Spirit", -- [1]
					"De Other Side", -- [2]
				},
				[163457] = {
					"Forsworn Vanguard", -- [1]
					"Spires of Ascension", -- [2]
				},
				[162691] = {
					"Blightbone", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[166396] = {
					"Noble Skirmisher", -- [1]
					"Sanguine Depths", -- [2]
				},
				[163458] = {
					"Forsworn Castigator", -- [1]
					"Spires of Ascension", -- [2]
				},
				[167610] = {
					"Stonefiend Anklebiter", -- [1]
					"Halls of Atonement", -- [2]
				},
				[40290] = {
					"Crimsonborne Seer", -- [1]
					"Grim Batol", -- [2]
				},
				[40306] = {
					"Twilight Armsmaster", -- [1]
					"Grim Batol", -- [2]
				},
				[168058] = {
					"Infused Quill-feather", -- [1]
					"Sanguine Depths", -- [2]
				},
				[167611] = {
					"Stoneborn Eviscerator", -- [1]
					"Halls of Atonement", -- [2]
				},
				[36841] = {
					"Fallen Warrior", -- [1]
					"Pit of Saron", -- [2]
				},
				[170486] = {
					"Atal'ai Devoted", -- [1]
					"De Other Side", -- [2]
				},
				[167612] = {
					"Stoneborn Reaver", -- [1]
					"Halls of Atonement", -- [2]
				},
				[163077] = {
					"Azules", -- [1]
					"Spires of Ascension", -- [2]
				},
				[165824] = {
					"Nar'zudah", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[53369] = {
					"Blazing Talon Initiate", -- [1]
					"Firelands", -- [2]
				},
				[53896] = {
					"Blazing Talon Initiate", -- [1]
					"Firelands", -- [2]
				},
				[162056] = {
					"Rockbound Sprite", -- [1]
					"Sanguine Depths", -- [2]
				},
				[162057] = {
					"Chamber Sentinel", -- [1]
					"Sanguine Depths", -- [2]
				},
				[167806] = {
					"Animated Sin", -- [1]
					"Halls of Atonement", -- [2]
				},
				[44922] = {
					"Oathsworn Axemaster", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[167615] = {
					"Depraved Darkblade", -- [1]
					"Halls of Atonement", -- [2]
				},
				[162058] = {
					"Ventunax", -- [1]
					"Spires of Ascension", -- [2]
				},
				[39381] = {
					"Crimsonborne Guardian", -- [1]
					"Grim Batol", -- [2]
				},
				[171384] = {
					"Research Scribe", -- [1]
					"Sanguine Depths", -- [2]
				},
				[171448] = {
					"Dreadful Huntmaster", -- [1]
					"Sanguine Depths", -- [2]
				},
				[36874] = {
					"Disturbed Glacial Revenant", -- [1]
					"Pit of Saron", -- [2]
				},
				[39956] = {
					"Twilight Enforcer", -- [1]
					"Grim Batol", -- [2]
				},
				[162059] = {
					"Kin-Tara", -- [1]
					"Spires of Ascension", -- [2]
				},
				[38487] = {
					"Fallen Warrior", -- [1]
					"Pit of Saron", -- [2]
				},
				[162060] = {
					"Oryphrion", -- [1]
					"Spires of Ascension", -- [2]
				},
				[54552] = {
					"Time-Twisted Breaker", -- [1]
					"End Time", -- [2]
				},
				[162061] = {
					"Devos", -- [1]
					"Spires of Ascension", -- [2]
				},
				[54073] = {
					"Flamewaker Hound Master", -- [1]
					"Firelands", -- [2]
				},
				[55654] = {
					"Corrupted Arcanist", -- [1]
					"Well of Eternity", -- [2]
				},
				[53115] = {
					"Molten Lord", -- [1]
					"Firelands", -- [2]
				},
				[52620] = {
					"Fragment of Rhyolith", -- [1]
					"Firelands", -- [2]
				},
				[39909] = {
					"Azureborne Warlord", -- [1]
					"Grim Batol", -- [2]
				},
				[39414] = {
					"Ascended Windwalker", -- [1]
					"Grim Batol", -- [2]
				},
				[164873] = {
					"Runestag Elderhorn", -- [1]
					"De Other Side", -- [2]
				},
				[40484] = {
					"Erudax", -- [1]
					"Grim Batol", -- [2]
				},
				[53786] = {
					"Blazing Monstrosity", -- [1]
					"Firelands", -- [2]
				},
				[43614] = {
					"Lockmaw", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[167876] = {
					"Inquisitor Sigar", -- [1]
					"Halls of Atonement", -- [2]
				},
				[164363] = {
					"Undying Stonefiend", -- [1]
					"Halls of Atonement", -- [2]
				},
				[164427] = {
					"Reanimated Warrior", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[54920] = {
					"Infinite Suppressor", -- [1]
					"End Time", -- [2]
				},
				[164555] = {
					"Millificent Manastorm", -- [1]
					"De Other Side", -- [2]
				},
				[54553] = {
					"Time-Twisted Seer", -- [1]
					"End Time", -- [2]
				},
				[171455] = {
					"Stonewall Gargon", -- [1]
					"Sanguine Depths", -- [2]
				},
				[44924] = {
					"Oathsworn Myrmidon", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[53116] = {
					"Unbound Blazing Elemental", -- [1]
					"Firelands", -- [2]
				},
				[165515] = {
					"Depraved Darkblade", -- [1]
					"Halls of Atonement", -- [2]
				},
				[164557] = {
					"Shard of Halkias", -- [1]
					"Halls of Atonement", -- [2]
				},
				[168326] = {
					"Shattered Visage", -- [1]
					"De Other Side", -- [2]
				},
				[39415] = {
					"Ascended Flameseeker", -- [1]
					"Grim Batol", -- [2]
				},
				[53244] = {
					"Flamewaker Trainee", -- [1]
					"Firelands", -- [2]
				},
				[164558] = {
					"Hakkar the Soulflayer", -- [1]
					"De Other Side", -- [2]
				},
				[165197] = {
					"Skeletal Monstrosity", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[166411] = {
					"Forsworn Usurper", -- [1]
					"Spires of Ascension", -- [2]
				},
				[40166] = {
					"Enslaved Gronn Brute", -- [1]
					"Grim Batol", -- [2]
				},
				[162133] = {
					"General Kaal", -- [1]
					"Sanguine Depths", -- [2]
				},
				[52558] = {
					"Lord Rhyolith", -- [1]
					"Firelands", -- [2]
				},
				[55656] = {
					"Dreadlord Defender", -- [1]
					"Well of Eternity", -- [2]
				},
				[36877] = {
					"Wrathbone Skeleton", -- [1]
					"Pit of Saron", -- [2]
				},
				[164562] = {
					"Depraved Houndmaster", -- [1]
					"Halls of Atonement", -- [2]
				},
				[165137] = {
					"Zolramus Gatekeeper", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[163157] = {
					"Amarth", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[164563] = {
					"Vicious Gargon", -- [1]
					"Halls of Atonement", -- [2]
				},
				[165138] = {
					"Blight Bag", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[40167] = {
					"Twilight Beguiler", -- [1]
					"Grim Batol", -- [2]
				},
				[52447] = {
					"Cinderweb Spiderling", -- [1]
					"Firelands", -- [2]
				},
				[165905] = {
					"Son of Hakkar", -- [1]
					"De Other Side", -- [2]
				},
				[166608] = {
					"Mueh'zala", -- [1]
					"De Other Side", -- [2]
				},
				[168844] = {
					"Lakesis", -- [1]
					"Spires of Ascension", -- [2]
				},
				[44926] = {
					"Oathsworn Wanderer", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[53134] = {
					"Ancient Core Hound", -- [1]
					"Firelands", -- [2]
				},
				[165076] = {
					"Gluttonous Tick", -- [1]
					"Sanguine Depths", -- [2]
				},
				[168717] = {
					"Forsworn Justicar", -- [1]
					"Spires of Ascension", -- [2]
				},
				[36830] = {
					"Wrathbone Laborer", -- [1]
					"Pit of Saron", -- [2]
				},
				[168845] = {
					"Astronos", -- [1]
					"Spires of Ascension", -- [2]
				},
				[54795] = {
					"Fountain of Light", -- [1]
					"End Time", -- [2]
				},
				[168718] = {
					"Forsworn Warden", -- [1]
					"Spires of Ascension", -- [2]
				},
				[168591] = {
					"Ravenous Dreadbat", -- [1]
					"Sanguine Depths", -- [2]
				},
				[39625] = {
					"General Umbriss", -- [1]
					"Grim Batol", -- [2]
				},
				[170572] = {
					"Atal'ai Hoodoo Hexxer", -- [1]
					"De Other Side", -- [2]
				},
				[164185] = {
					"Echelon", -- [1]
					"Halls of Atonement", -- [2]
				},
				[53087] = {
					"Right Foot", -- [1]
					"Firelands", -- [2]
				},
				[53119] = {
					"Flamewaker Forward Guard", -- [1]
					"Firelands", -- [2]
				},
				[53167] = {
					"Unbound Pyrelord", -- [1]
					"Firelands", -- [2]
				},
				[45007] = {
					"Enslaved Bandit", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[167955] = {
					"Sanguine Cadet", -- [1]
					"Sanguine Depths", -- [2]
				},
				[39961] = {
					"Enslaved Water Spirit", -- [1]
					"Grim Batol", -- [2]
				},
				[168594] = {
					"Chamber Sentinel", -- [1]
					"Sanguine Depths", -- [2]
				},
				[171341] = {
					"Bladebeak Hatchling", -- [1]
					"De Other Side", -- [2]
				},
				[167892] = {
					"Tormented Soul", -- [1]
					"Halls of Atonement", -- [2]
				},
				[167956] = {
					"Dark Acolyte", -- [1]
					"Sanguine Depths", -- [2]
				},
				[40600] = {
					"Faceless Corruptor", -- [1]
					"Grim Batol", -- [2]
				},
				[165529] = {
					"Depraved Collector", -- [1]
					"Halls of Atonement", -- [2]
				},
				[39626] = {
					"Crimsonborne Warlord", -- [1]
					"Grim Batol", -- [2]
				},
				[171342] = {
					"Juvenile Runestag", -- [1]
					"De Other Side", -- [2]
				},
				[165913] = {
					"Ghastly Parishioner", -- [1]
					"Halls of Atonement", -- [2]
				},
				[171343] = {
					"Bladebeak Matriarch", -- [1]
					"De Other Side", -- [2]
				},
				[44896] = {
					"Pygmy Brute", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[52577] = {
					"Left Foot", -- [1]
					"Firelands", -- [2]
				},
				[53120] = {
					"Flamewaker Pathfinder", -- [1]
					"Firelands", -- [2]
				},
				[44976] = {
					"Neferset Plaguebringer", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[39962] = {
					"Twilight Stormbreaker", -- [1]
					"Grim Batol", -- [2]
				},
				[44577] = {
					"General Husam", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[53791] = {
					"Blazing Monstrosity", -- [1]
					"Firelands", -- [2]
				},
				[164702] = {
					"Carrion Worm", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[165597] = {
					"Patchwerk Soldier", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[54015] = {
					"Majordomo Staghelm", -- [1]
					"Firelands", -- [2]
				},
				[52498] = {
					"Beth'tilac", -- [1]
					"Firelands", -- [2]
				},
				[163618] = {
					"Zolramus Necromancer", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[44897] = {
					"Pygmy Scout", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[167898] = {
					"Manifestation of Envy", -- [1]
					"Halls of Atonement", -- [2]
				},
				[167962] = {
					"Defunct Dental Drill", -- [1]
					"De Other Side", -- [2]
				},
				[53121] = {
					"Flamewaker Cauterizer", -- [1]
					"Firelands", -- [2]
				},
				[53648] = {
					"Inferno Hawk", -- [1]
					"Firelands", -- [2]
				},
				[44977] = {
					"Neferset Torturer", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[163619] = {
					"Zolramus Bonecarver", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[53185] = {
					"Flamewaker Overseer", -- [1]
					"Firelands", -- [2]
				},
				[166302] = {
					"Corpse Harvester", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[40953] = {
					"Khaaphom", -- [1]
					"Grim Batol", -- [2]
				},
				[167963] = {
					"Headless Client", -- [1]
					"De Other Side", -- [2]
				},
				[164450] = {
					"Dealer Xy'exa", -- [1]
					"De Other Side", -- [2]
				},
				[164578] = {
					"Stitchflesh's Creation", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[163620] = {
					"Rotspew", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[168986] = {
					"Skeletal Raptor", -- [1]
					"De Other Side", -- [2]
				},
				[54431] = {
					"Echo of Baine", -- [1]
					"End Time", -- [2]
				},
				[169753] = {
					"Famished Tick", -- [1]
					"Sanguine Depths", -- [2]
				},
				[167965] = {
					"Lubricator", -- [1]
					"De Other Side", -- [2]
				},
				[54543] = {
					"Time-Twisted Drake", -- [1]
					"End Time", -- [2]
				},
				[163622] = {
					"Goregrind Bits", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[37728] = {
					"Wrathbone Sorcerer", -- [1]
					"Pit of Saron", -- [2]
				},
				[44898] = {
					"Pygmy Firebreather", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[54687] = {
					"Time-Twisted Footman", -- [1]
					"End Time", -- [2]
				},
				[171799] = {
					"Depths Warden", -- [1]
					"Sanguine Depths", -- [2]
				},
				[39900] = {
					"Enslaved Rock Elemental", -- [1]
					"Grim Batol", -- [2]
				},
				[162729] = {
					"Patchwerk Soldier", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[167967] = {
					"Sentient Oil", -- [1]
					"De Other Side", -- [2]
				},
				[53793] = {
					"Harbinger of Flame", -- [1]
					"Firelands", -- [2]
				},
				[45122] = {
					"Oathsworn Captain", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[53734] = {
					"Blazing Talon Clawshaper", -- [1]
					"Firelands", -- [2]
				},
				[53898] = {
					"Voracious Hatchling", -- [1]
					"Firelands", -- [2]
				},
				[54432] = {
					"Murozond", -- [1]
					"End Time", -- [2]
				},
				[53223] = {
					"Flamewaker Beast Handler", -- [1]
					"Firelands", -- [2]
				},
				[165222] = {
					"Zolramus Bonemender", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[44260] = {
					"Venomfang Crocolisk", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[54691] = {
					"Time-Twisted Sorceress", -- [1]
					"End Time", -- [2]
				},
				[165414] = {
					"Depraved Obliterator", -- [1]
					"Halls of Atonement", -- [2]
				},
				[164414] = {
					"Reanimated Mage", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[164857] = {
					"Spriggan Mendbender", -- [1]
					"De Other Side", -- [2]
				},
				[52524] = {
					"Cinderweb Spinner", -- [1]
					"Firelands", -- [2]
				},
				[40268] = {
					"Twilight War-Mage", -- [1]
					"Grim Batol", -- [2]
				},
				[37729] = {
					"Wrathbone Reaver", -- [1]
					"Pit of Saron", -- [2]
				},
				[53094] = {
					"Patriarch Fire Turtle", -- [1]
					"Firelands", -- [2]
				},
				[173016] = {
					"Corpse Collector", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[165415] = {
					"Toiling Groundskeeper", -- [1]
					"Halls of Atonement", -- [2]
				},
				[53640] = {
					"Flamewaker Sentinel", -- [1]
					"Firelands", -- [2]
				},
				[40291] = {
					"Azureborne Seer", -- [1]
					"Grim Batol", -- [2]
				},
				[53642] = {
					"Cinderweb Spinner", -- [1]
					"Firelands", -- [2]
				},
				[53616] = {
					"Kar the Everburning", -- [1]
					"Firelands", -- [2]
				},
				[39390] = {
					"Twilight Drake", -- [1]
					"Grim Batol", -- [2]
				},
				[53211] = {
					"Spark of Rhyolith", -- [1]
					"Firelands", -- [2]
				},
				[168418] = {
					"Forsworn Inquisitor", -- [1]
					"Spires of Ascension", -- [2]
				},
				[39450] = {
					"Trogg Dweller", -- [1]
					"Grim Batol", -- [2]
				},
				[53630] = {
					"Unstable Pyrelord", -- [1]
					"Firelands", -- [2]
				},
				[165408] = {
					"Halkias", -- [1]
					"Halls of Atonement", -- [2]
				},
				[53794] = {
					"Smouldering Hatchling", -- [1]
					"Firelands", -- [2]
				},
				[173044] = {
					"Stitching Assistant", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[53095] = {
					"Matriarch Fire Turtle", -- [1]
					"Firelands", -- [2]
				},
				[168457] = {
					"Stonewall Gargon", -- [1]
					"Sanguine Depths", -- [2]
				},
				[54435] = {
					"Mizzron", -- [1]
					"End Time", -- [2]
				},
				[41095] = {
					"Twilight Drake", -- [1]
					"Grim Batol", -- [2]
				},
				[165014] = {
					"Animated Plague", -- [1]
					"Spires of Ascension", -- [2]
				},
				[163501] = {
					"Forsworn Skirmisher", -- [1]
					"Spires of Ascension", -- [2]
				},
				[165556] = {
					"Fleeting Manifestation", -- [1]
					"Sanguine Depths", -- [2]
				},
				[171805] = {
					"Research Scribe", -- [1]
					"Sanguine Depths", -- [2]
				},
				[162693] = {
					"Nalthor the Rimebinder", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[44261] = {
					"Sharptalon Eagle", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[168420] = {
					"Forsworn Champion", -- [1]
					"Spires of Ascension", -- [2]
				},
				[39892] = {
					"Enslaved Burning Ember", -- [1]
					"Grim Batol", -- [2]
				},
				[162689] = {
					"Surgeon Stitchflesh", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[40357] = {
					"Invoked Flaming Spirit", -- [1]
					"Grim Batol", -- [2]
				},
				[165911] = {
					"Loyal Creation", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[40269] = {
					"Enslaved Thunder Spirit", -- [1]
					"Grim Batol", -- [2]
				},
				[164862] = {
					"Weald Shimmermoth", -- [1]
					"De Other Side", -- [2]
				},
				[163503] = {
					"Etherdiver", -- [1]
					"Spires of Ascension", -- [2]
				},
				[52581] = {
					"Cinderweb Drone", -- [1]
					"Firelands", -- [2]
				},
				[44932] = {
					"Oathsworn Pathfinder", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[53635] = {
					"Cinderweb Drone", -- [1]
					"Firelands", -- [2]
				},
				[36788] = {
					"Deathwhisper Necrolyte", -- [1]
					"Pit of Saron", -- [2]
				},
				[39870] = {
					"Twilight Firecatcher", -- [1]
					"Grim Batol", -- [2]
				},
				[164861] = {
					"Spriggan Barkbinder", -- [1]
					"De Other Side", -- [2]
				},
				[168992] = {
					"Risen Cultist", -- [1]
					"De Other Side", -- [2]
				},
				[167607] = {
					"Stoneborn Slasher", -- [1]
					"Halls of Atonement", -- [2]
				},
				[162038] = {
					"Regal Mistdancer", -- [1]
					"Sanguine Depths", -- [2]
				},
				[162099] = {
					"General Kaal", -- [1]
					"Sanguine Depths", -- [2]
				},
				[168681] = {
					"Forsworn Helion", -- [1]
					"Spires of Ascension", -- [2]
				},
				[53141] = {
					"Molten Surger", -- [1]
					"Firelands", -- [2]
				},
				[53795] = {
					"Egg Pile", -- [1]
					"Firelands", -- [2]
				},
				[163121] = {
					"Stitched Vanguard", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[54923] = {
					"Infinite Warden", -- [1]
					"End Time", -- [2]
				},
				[36658] = {
					"Scourgelord Tyrannus", -- [1]
					"Pit of Saron", -- [2]
				},
				[168934] = {
					"Enraged Spirit", -- [1]
					"De Other Side", -- [2]
				},
				[163623] = {
					"Rotspew Leftovers", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[45097] = {
					"Oathsworn Tamer", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[41073] = {
					"Twilight Armsmaster", -- [1]
					"Grim Batol", -- [2]
				},
				[162100] = {
					"Kryxis the Voracious", -- [1]
					"Sanguine Depths", -- [2]
				},
				[163122] = {
					"Brittlebone Warrior", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[171333] = {
					"Atal'ai Devoted", -- [1]
					"De Other Side", -- [2]
				},
				[163506] = {
					"Forsworn Stealthclaw", -- [1]
					"Spires of Ascension", -- [2]
				},
				[163524] = {
					"Kyrian Dark-Praetor", -- [1]
					"Spires of Ascension", -- [2]
				},
				[36842] = {
					"Wrathbone Coldwraith", -- [1]
					"Pit of Saron", -- [2]
				},
				[54445] = {
					"Echo of Jaina", -- [1]
					"End Time", -- [2]
				},
				[36661] = {
					"Rimefang", -- [1]
					"Pit of Saron", -- [2]
				},
				[39854] = {
					"Azureborne Guardian", -- [1]
					"Grim Batol", -- [2]
				},
				[40270] = {
					"Twilight Thundercaller", -- [1]
					"Grim Batol", -- [2]
				},
				[39405] = {
					"Crimsonborne Seer", -- [1]
					"Grim Batol", -- [2]
				},
				[166266] = {
					"Spare Parts", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[165410] = {
					"High Adjudicator Aleez", -- [1]
					"Halls of Atonement", -- [2]
				},
				[45377] = {
					"Augh", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[163621] = {
					"Goregrind", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[39855] = {
					"Azureborne Seer", -- [1]
					"Grim Batol", -- [2]
				},
				[44981] = {
					"Oathsworn Skinner", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[162102] = {
					"Grand Proctor Beryllia", -- [1]
					"Sanguine Depths", -- [2]
				},
				[39392] = {
					"Faceless Corruptor", -- [1]
					"Grim Batol", -- [2]
				},
				[54690] = {
					"Time-Twisted Priest", -- [1]
					"End Time", -- [2]
				},
				[53732] = {
					"Unbound Smoldering Elemental", -- [1]
					"Firelands", -- [2]
				},
				[163459] = {
					"Forsworn Mender", -- [1]
					"Spires of Ascension", -- [2]
				},
				[174175] = {
					"Loyal Stoneborn", -- [1]
					"Halls of Atonement", -- [2]
				},
				[36881] = {
					"Skeletal Slave", -- [1]
					"Pit of Saron", -- [2]
				},
				[162039] = {
					"Wicked Oppressor", -- [1]
					"Sanguine Depths", -- [2]
				},
				[162103] = {
					"Executor Tarvold", -- [1]
					"Sanguine Depths", -- [2]
				},
				[168843] = {
					"Klotos", -- [1]
					"Spires of Ascension", -- [2]
				},
				[165919] = {
					"Skeletal Marauder", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[165872] = {
					"Flesh Crafter", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[166079] = {
					"Brittlebone Crossbowman", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[45096] = {
					"Tamed Tol'vir Prowler", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[166589] = {
					"Animated Weapon", -- [1]
					"Sanguine Depths", -- [2]
				},
				[162040] = {
					"Grand Overseer", -- [1]
					"Sanguine Depths", -- [2]
				},
				[163126] = {
					"Brittlebone Mage", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[167964] = {
					"4.RF-4.RF", -- [1]
					"De Other Side", -- [2]
				},
				[171500] = {
					"Shuffling Corpse", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[53639] = {
					"Flamewaker Cauterizer", -- [1]
					"Firelands", -- [2]
				},
				[172981] = {
					"Kyrian Stitchwerk", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[53509] = {
					"Voracious Hatchling", -- [1]
					"Firelands", -- [2]
				},
				[39873] = {
					"Twilight Wyrmcaller", -- [1]
					"Grim Batol", -- [2]
				},
				[162041] = {
					"Grubby Dirtcruncher", -- [1]
					"Sanguine Depths", -- [2]
				},
				[168318] = {
					"Forsworn Goliath", -- [1]
					"Spires of Ascension", -- [2]
				},
				[53631] = {
					"Cinderweb Spiderling", -- [1]
					"Firelands", -- [2]
				},
				[45467] = {
					"Trogg Dweller", -- [1]
					"Grim Batol", -- [2]
				},
				[40319] = {
					"Drahga Shadowburner", -- [1]
					"Grim Batol", -- [2]
				},
				[164556] = {
					"Millhouse Manastorm", -- [1]
					"De Other Side", -- [2]
				},
				[169912] = {
					"Enraged Mask", -- [1]
					"De Other Side", -- [2]
				},
				[169905] = {
					"Risen Warlord", -- [1]
					"De Other Side", -- [2]
				},
				[44982] = {
					"Neferset Darkcaster", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[163128] = {
					"Zolramus Sorcerer", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[52530] = {
					"Alysrazor", -- [1]
					"Firelands", -- [2]
				},
				[170490] = {
					"Atal'ai High Priest", -- [1]
					"De Other Side", -- [2]
				},
			},
			["OptionsPanelDB"] = {
				["PlaterOptionsPanelFrame"] = {
					["scale"] = 1,
				},
			},
			["indicator_scale"] = 0.9999999403953552,
			["hook_auto_imported"] = {
				["Reorder Nameplate"] = 4,
				["Dont Have Aura"] = 1,
				["Players Targetting Amount"] = 4,
				["Color Automation"] = 1,
				["Combo Points"] = 4,
				["Cast Bar Icon Config"] = 2,
				["Aura Reorder"] = 3,
				["Hide Neutral Units"] = 1,
				["Extra Border"] = 2,
				["Target Color"] = 3,
				["Execute Range"] = 1,
				["Attacking Specific Unit"] = 1,
			},
			["number_region_first_run"] = true,
			["pet_height_scale"] = 0.949999988079071,
			["captured_spells"] = {
				[204598] = {
					["type"] = "DEBUFF",
					["source"] = "Gigasloth-Korgath",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[193473] = {
					["type"] = "DEBUFF",
					["source"] = "Void Tendril",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 98167,
				},
				[328891] = {
					["source"] = "Lesanna-Azshara",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[74039] = {
					["source"] = "Battered Red Drake",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 39294,
				},
				[228128] = {
					["source"] = "Glaivegarr",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[270070] = {
					["source"] = "Uggla-Muradin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[263165] = {
					["type"] = "BUFF",
					["source"] = "Daphna",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[2050] = {
					["encounterID"] = 1206,
					["source"] = "Eilana",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[74551] = {
					["source"] = "Twilight Firecatcher",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 39870,
				},
				[308434] = {
					["source"] = "Luggz-Windrunner",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[327104] = {
					["type"] = "BUFF",
					["source"] = "Lolithryx",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[99359] = {
					["type"] = "BUFF",
					["source"] = "Voracious Hatchling",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 53509,
				},
				[315341] = {
					["encounterID"] = 1206,
					["source"] = "Stabba",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[130] = {
					["type"] = "BUFF",
					["source"] = "Jesstara",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[337848] = {
					["type"] = "BUFF",
					["source"] = "Guvante",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[330943] = {
					["type"] = "BUFF",
					["source"] = "Daphna",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[74552] = {
					["source"] = "Twilight Earthshaper",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 39890,
				},
				[205369] = {
					["encounterID"] = 1206,
					["source"] = "Daphna",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[200382] = {
					["source"] = "Allari the Souleater",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 101006,
				},
				[113746] = {
					["type"] = "DEBUFF",
					["source"] = "Lolithryx",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[23881] = {
					["encounterID"] = 1206,
					["source"] = "Drpoopypants-Proudmoore",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[279028] = {
					["type"] = "BUFF",
					["source"] = "Raingarr",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[236060] = {
					["type"] = "BUFF",
					["source"] = "Jesstara",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[527] = {
					["source"] = "Epicbazooka-Tichondrius",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[279029] = {
					["type"] = "BUFF",
					["source"] = "Raingarr",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[228260] = {
					["encounterID"] = 1206,
					["source"] = "Kelexx-Korgath",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[6262] = {
					["encounterID"] = 1206,
					["source"] = "Gigasloth-Korgath",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[69438] = {
					["source"] = "Arrmah-Bronzebeard",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[152175] = {
					["type"] = "BUFF",
					["source"] = "Lolithryx",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[133] = {
					["encounterID"] = 1206,
					["source"] = "Jesstara",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[304606] = {
					["source"] = "Melandrias-AzjolNerub",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[99361] = {
					["type"] = "BUFF",
					["source"] = "Voracious Hatchling",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 53898,
				},
				[156779] = {
					["source"] = "Savannasedai",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[63619] = {
					["encounterID"] = 1206,
					["source"] = "Shadowfiend",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 19668,
				},
				[100640] = {
					["encounterID"] = 1206,
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[336832] = {
					["type"] = "BUFF",
					["source"] = "Jesstara",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[279033] = {
					["type"] = "BUFF",
					["source"] = "Raingarr",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[190411] = {
					["encounterID"] = 1206,
					["source"] = "Savannasedai",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[307166] = {
					["source"] = "Blah",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[269571] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Demyxodus",
					["npcID"] = 0,
				},
				[99362] = {
					["type"] = "BUFF",
					["source"] = "Voracious Hatchling",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 53898,
				},
				[17] = {
					["type"] = "BUFF",
					["source"] = "Kelexx-Korgath",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[320212] = {
					["type"] = "BUFF",
					["source"] = "Mizzron",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[210489] = {
					["source"] = "Glaivegarr",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[328908] = {
					["type"] = "BUFF",
					["source"] = "Kelexx-Korgath",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[304612] = {
					["source"] = "Melandrias-AzjolNerub",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[13787] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 144129,
				},
				[271877] = {
					["encounterID"] = 1206,
					["source"] = "Stabba",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[269576] = {
					["type"] = "DEBUFF",
					["source"] = "Silenal",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[246807] = {
					["source"] = "Lhorne",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[53390] = {
					["type"] = "BUFF",
					["source"] = "Raingarr",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[14914] = {
					["encounterID"] = 1206,
					["source"] = "Eilana",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[200389] = {
					["type"] = "BUFF",
					["source"] = "Marixx",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[193356] = {
					["type"] = "BUFF",
					["source"] = "Stabba",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[162794] = {
					["encounterID"] = 1206,
					["source"] = "Riptcagé",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[222256] = {
					["source"] = "Roghunt-Nordrassil",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[59752] = {
					["type"] = "BUFF",
					["source"] = "Rachallin",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[139] = {
					["encounterID"] = 1206,
					["source"] = "Eilana",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[339400] = {
					["type"] = "BUFF",
					["source"] = "Silenal",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[556] = {
					["source"] = "Raingarr",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[34433] = {
					["encounterID"] = 1206,
					["source"] = "Daphna",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[57994] = {
					["encounterID"] = 1206,
					["source"] = "Raingarr",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[113942] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Fruitrollupz",
					["npcID"] = 0,
				},
				[99812] = {
					["source"] = "Giant Fire Scorpion",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 53128,
				},
				[8936] = {
					["encounterID"] = 1206,
					["source"] = "Marixx",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[48020] = {
					["type"] = "BUFF",
					["source"] = "Vazio-Dragonblight",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[76603] = {
					["source"] = "Twilight Earthshaper",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 39890,
				},
				[207553] = {
					["encounterID"] = 1206,
					["source"] = "Rachallin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[289277] = {
					["source"] = "Moocakes-Destromath",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[226991] = {
					["source"] = "Amorial-BoreanTundra",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[51505] = {
					["encounterID"] = 1206,
					["source"] = "Raingarr",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[188501] = {
					["source"] = "Glaivegarr",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[345545] = {
					["source"] = "Elows-Proudmoore",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[97128] = {
					["type"] = "BUFF",
					["source"] = "Jesstara",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[234153] = {
					["encounterID"] = 1206,
					["source"] = "Vazio-Dragonblight",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[79865] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 47247,
				},
				[216251] = {
					["type"] = "BUFF",
					["source"] = "Ducksaas",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[307185] = {
					["source"] = "Scarletautum",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[207684] = {
					["source"] = "Glaivegarr",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[88625] = {
					["encounterID"] = 1206,
					["source"] = "Eilana",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[257044] = {
					["encounterID"] = 1206,
					["source"] = "Silenal",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[185562] = {
					["source"] = "Ironhidejm-Lightbringer",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[33763] = {
					["encounterID"] = 1206,
					["source"] = "Marixx",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[108446] = {
					["type"] = "BUFF",
					["source"] = "Unknown",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 17252,
				},
				[260881] = {
					["source"] = "Cadberry-BloodFurnace",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[48181] = {
					["source"] = "Gartbrez-Shandris",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[34914] = {
					["encounterID"] = 1206,
					["source"] = "Kelexx-Korgath",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[260242] = {
					["type"] = "BUFF",
					["source"] = "Silenal",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[271896] = {
					["type"] = "BUFF",
					["source"] = "Stabba",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[11366] = {
					["encounterID"] = 1206,
					["source"] = "Jesstara",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[585] = {
					["encounterID"] = 1206,
					["source"] = "Eilana",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[586] = {
					["type"] = "BUFF",
					["source"] = "Daphna",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[204490] = {
					["type"] = "DEBUFF",
					["source"] = "Gigasloth-Korgath",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[347600] = {
					["source"] = "Taechi",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[307192] = {
					["encounterID"] = 1206,
					["source"] = "Drpoopypants-Proudmoore",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[589] = {
					["encounterID"] = 1206,
					["source"] = "Kelexx-Korgath",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[292359] = {
					["source"] = "Osullf",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[205258] = {
					["source"] = "Hellfire Infernal",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 114410,
				},
				[339929] = {
					["type"] = "BUFF",
					["source"] = "Silenal",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[253595] = {
					["source"] = "Koury-Windrunner",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[292360] = {
					["source"] = "Stein-Muradin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[225207] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 101100,
				},
				[280852] = {
					["type"] = "BUFF",
					["source"] = "Charnaa",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[292361] = {
					["source"] = "Juicemane-Azgalor",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[205259] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 114410,
				},
				[101223] = {
					["encounterID"] = 1206,
					["source"] = "Blazing Talon Initiate",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 53369,
				},
				[30213] = {
					["encounterID"] = 1206,
					["source"] = "Ikzilraksha",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 17252,
				},
				[225080] = {
					["type"] = "DEBUFF",
					["source"] = "Raingarr",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[185311] = {
					["type"] = "BUFF",
					["source"] = "Stabba",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[203981] = {
					["type"] = "BUFF",
					["source"] = "Gigasloth-Korgath",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[115098] = {
					["source"] = "Monkheadahh-Area52",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[325101] = {
					["source"] = "Steward",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 166663,
				},
				[329449] = {
					["type"] = "DEBUFF",
					["source"] = "Silenal",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[123986] = {
					["encounterID"] = 1206,
					["source"] = "Lolithryx",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[221886] = {
					["source"] = "Vormav-Lightbringer",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[235313] = {
					["type"] = "BUFF",
					["source"] = "Jesstara",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[27576] = {
					["encounterID"] = 1206,
					["source"] = "Mizzron",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[121557] = {
					["type"] = "BUFF",
					["source"] = "Eilana",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[201427] = {
					["encounterID"] = 1206,
					["source"] = "Riptcagé",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[207693] = {
					["source"] = "Glaivegarr",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[228537] = {
					["source"] = "Iwillthrow-Tichondrius",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[272167] = {
					["encounterID"] = 1206,
					["source"] = "Bilescourge",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 136404,
				},
				[321527] = {
					["type"] = "BUFF",
					["source"] = "Stabba",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[335082] = {
					["type"] = "BUFF",
					["source"] = "Onawar-Korgath",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[138130] = {
					["type"] = "BUFF",
					["source"] = "Earth Spirit",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 69792,
				},
				[343011] = {
					["type"] = "DEBUFF",
					["source"] = "Gigasloth-Korgath",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[137619] = {
					["encounterID"] = 1206,
					["source"] = "Mizzron",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[299790] = {
					["type"] = "BUFF",
					["source"] = "Raingarr",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[107428] = {
					["encounterID"] = 1206,
					["source"] = "Lolithryx",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[99308] = {
					["encounterID"] = 1206,
					["source"] = "Voracious Hatchling",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 53509,
				},
				[344803] = {
					["type"] = "BUFF",
					["source"] = "Kelexx-Korgath",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[343013] = {
					["type"] = "BUFF",
					["source"] = "Gigasloth-Korgath",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[101546] = {
					["encounterID"] = 1206,
					["source"] = "Lolithryx",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[308488] = {
					["source"] = "Hezah",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[8921] = {
					["encounterID"] = 1206,
					["source"] = "Marixx",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[272172] = {
					["encounterID"] = 1206,
					["source"] = "Shivarra",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 136406,
				},
				[204883] = {
					["encounterID"] = 1206,
					["source"] = "Eilana",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[77762] = {
					["type"] = "BUFF",
					["source"] = "Raingarr",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[280615] = {
					["type"] = "BUFF",
					["source"] = "Raingarr",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[334067] = {
					["type"] = "BUFF",
					["source"] = "Daphna",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[188389] = {
					["encounterID"] = 1206,
					["source"] = "Raingarr",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[228287] = {
					["type"] = "DEBUFF",
					["source"] = "Lolithryx",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[265273] = {
					["type"] = "BUFF",
					["source"] = "Vazio-Dragonblight",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[303380] = {
					["type"] = "BUFF",
					["source"] = "Raingarr",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[336372] = {
					["type"] = "BUFF",
					["source"] = "Riptcagé",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[316936] = {
					["source"] = "Crunkology",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[255909] = {
					["type"] = "DEBUFF",
					["source"] = "Stabba",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[336885] = {
					["type"] = "BUFF",
					["source"] = "Guvante",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[333049] = {
					["type"] = "BUFF",
					["source"] = "Jesstara",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[642] = {
					["type"] = "BUFF",
					["source"] = "Guvante",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[348139] = {
					["type"] = "BUFF",
					["source"] = "Jesstara",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[335096] = {
					["encounterID"] = 1206,
					["source"] = "Rachallin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[340467] = {
					["encounterID"] = 1206,
					["source"] = "Ducksaas",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 173756,
				},
				[235450] = {
					["source"] = "Frrostbitee-AzjolNerub",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[193635] = {
					["encounterID"] = 1206,
					["source"] = "Void Tendril",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 98167,
				},
				[335097] = {
					["encounterID"] = 1206,
					["source"] = "Rachallin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[2580] = {
					["source"] = "Savannasedai",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[18562] = {
					["encounterID"] = 1206,
					["source"] = "Marixx",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[320009] = {
					["type"] = "BUFF",
					["source"] = "Silenal",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[25771] = {
					["type"] = "DEBUFF",
					["source"] = "Guvante",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[289577] = {
					["type"] = "BUFF",
					["source"] = "Daphna",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[335101] = {
					["type"] = "BUFF",
					["source"] = "Rachallin",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[205146] = {
					["type"] = "BUFF",
					["source"] = "Vazio-Dragonblight",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[69070] = {
					["source"] = "Costlyheals",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[30151] = {
					["type"] = "BUFF",
					["source"] = "Ikzilraksha",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 17252,
				},
				[12550] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 7379,
				},
				[308506] = {
					["source"] = "Theuncola-Proudmoore",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[325130] = {
					["encounterID"] = 1206,
					["source"] = "Jesstara",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[116768] = {
					["type"] = "BUFF",
					["source"] = "Lolithryx",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[319504] = {
					["type"] = "DEBUFF",
					["source"] = "Mizzron",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[45181] = {
					["type"] = "DEBUFF",
					["source"] = "Stabba",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[100784] = {
					["encounterID"] = 1206,
					["source"] = "Lolithryx",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[202719] = {
					["source"] = "Glaivegarr",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[5308] = {
					["encounterID"] = 1206,
					["source"] = "Savannasedai",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[223819] = {
					["type"] = "BUFF",
					["source"] = "Guvante",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[331016] = {
					["type"] = "DEBUFF",
					["source"] = "Stabba",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[116705] = {
					["encounterID"] = 1206,
					["source"] = "Lolithryx",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[245686] = {
					["source"] = "Dozy-Shandris",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[345595] = {
					["encounterID"] = 1206,
					["source"] = "Gigasloth-Korgath",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[204255] = {
					["encounterID"] = 1206,
					["source"] = "Gigasloth-Korgath",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[194153] = {
					["encounterID"] = 1206,
					["source"] = "Charnaa",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[32645] = {
					["type"] = "BUFF",
					["source"] = "Mizzron",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[8690] = {
					["source"] = "Buffarildo",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[336135] = {
					["source"] = "Devony-Azshara",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[18499] = {
					["type"] = "BUFF",
					["source"] = "Drpoopypants-Proudmoore",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[275779] = {
					["encounterID"] = 1206,
					["source"] = "Guvante",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[13877] = {
					["type"] = "BUFF",
					["source"] = "Stabba",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[347901] = {
					["source"] = "Knotts",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[190319] = {
					["type"] = "BUFF",
					["source"] = "Jesstara",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[98868] = {
					["encounterID"] = 1206,
					["source"] = "Blazing Talon Initiate",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 53896,
				},
				[64843] = {
					["type"] = "BUFF",
					["source"] = "Eilana",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[205025] = {
					["source"] = "Fintbert-Daggerspine",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[200166] = {
					["encounterID"] = 1206,
					["source"] = "Riptcagé",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[316958] = {
					["encounterID"] = 1206,
					["source"] = "Guvante",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[97462] = {
					["encounterID"] = 1206,
					["source"] = "Drpoopypants-Proudmoore",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[686] = {
					["encounterID"] = 1206,
					["source"] = "Vazio-Dragonblight",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[327701] = {
					["source"] = "Knotts",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[74189] = {
					["source"] = "Teenymeany-Bronzebeard",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[32182] = {
					["type"] = "BUFF",
					["source"] = "Raingarr",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[61295] = {
					["encounterID"] = 1206,
					["source"] = "Raingarr",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[61391] = {
					["encounterID"] = 1206,
					["source"] = "Charnaa",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[691] = {
					["source"] = "Imnotthd-ShatteredHand",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[196460] = {
					["source"] = "Glazer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 96680,
				},
				[262232] = {
					["type"] = "BUFF",
					["source"] = "Drpoopypants-Proudmoore",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[97463] = {
					["type"] = "BUFF",
					["source"] = "Drpoopypants-Proudmoore",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[197995] = {
					["encounterID"] = 1206,
					["source"] = "Thelinguist-Dragonblight",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[345863] = {
					["source"] = "Onawar-Korgath",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[34026] = {
					["encounterID"] = 1206,
					["source"] = "Scarletautum",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[341260] = {
					["source"] = "Amorial-BoreanTundra",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[64844] = {
					["type"] = "BUFF",
					["source"] = "Eilana",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[308525] = {
					["source"] = "Dwsb",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[137639] = {
					["type"] = "BUFF",
					["source"] = "Lolithryx",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[122783] = {
					["type"] = "BUFF",
					["source"] = "Lolithryx",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[196462] = {
					["source"] = "Glazer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 96680,
				},
				[312107] = {
					["source"] = "Cheezedoodle",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[341263] = {
					["encounterID"] = 1206,
					["source"] = "Kelexx-Korgath",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[41635] = {
					["type"] = "BUFF",
					["source"] = "Eilana",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[703] = {
					["encounterID"] = 1206,
					["source"] = "Mizzron",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[86659] = {
					["type"] = "BUFF",
					["source"] = "Guvante",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[2818] = {
					["type"] = "DEBUFF",
					["source"] = "Mizzron",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[343312] = {
					["type"] = "BUFF",
					["source"] = "Riptcagé",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[280398] = {
					["source"] = "Presti",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[260402] = {
					["type"] = "BUFF",
					["source"] = "Silenal",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[5672] = {
					["type"] = "BUFF",
					["source"] = "Healing Stream Totem",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 3527,
				},
				[158486] = {
					["source"] = "Ianielle-Shandris",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[108271] = {
					["type"] = "BUFF",
					["source"] = "Raingarr",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[71507] = {
					["source"] = "Orgrimmar Grunt",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 3296,
				},
				[317485] = {
					["encounterID"] = 1206,
					["source"] = "Rachallin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[147362] = {
					["encounterID"] = 1206,
					["source"] = "Silenal",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[190456] = {
					["type"] = "BUFF",
					["source"] = "Drpoopypants-Proudmoore",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[205929] = {
					["source"] = "Velamun-KhazModan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[290121] = {
					["source"] = "Dozy-Shandris",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[337948] = {
					["type"] = "BUFF",
					["source"] = "Eilana",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[100024] = {
					["encounterID"] = 1206,
					["source"] = "Voracious Hatchling",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 53509,
				},
				[16870] = {
					["type"] = "BUFF",
					["source"] = "Marixx",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[53209] = {
					["encounterID"] = 1206,
					["source"] = "Scarletautum",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[328231] = {
					["encounterID"] = 1206,
					["source"] = "Silenal",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[251838] = {
					["source"] = "Mizzron",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[246851] = {
					["type"] = "BUFF",
					["source"] = "Scarletautum",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[132403] = {
					["type"] = "BUFF",
					["source"] = "Guvante",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[317491] = {
					["type"] = "DEBUFF",
					["source"] = "Rachallin",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[251839] = {
					["source"] = "Realslayer-Proudmoore",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[210152] = {
					["encounterID"] = 1206,
					["source"] = "Riptcagé",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[1459] = {
					["source"] = "Thellwyn-Nazjatar",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[19236] = {
					["type"] = "BUFF",
					["source"] = "Eilana",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[107570] = {
					["encounterID"] = 1206,
					["source"] = "Drpoopypants-Proudmoore",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[1464] = {
					["encounterID"] = 1206,
					["source"] = "Rachallin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[322098] = {
					["type"] = "DEBUFF",
					["source"] = "Daphna",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[98619] = {
					["type"] = "BUFF",
					["source"] = "Jesstara",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[193530] = {
					["type"] = "BUFF",
					["source"] = "Scarletautum",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[26573] = {
					["encounterID"] = 1206,
					["source"] = "Guvante",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[268904] = {
					["type"] = "BUFF",
					["source"] = "Raingarr",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[2948] = {
					["encounterID"] = 1206,
					["source"] = "Jesstara",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[332842] = {
					["source"] = "Xinti-Bronzebeard",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[322101] = {
					["encounterID"] = 1206,
					["source"] = "Lolithryx",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[740] = {
					["type"] = "BUFF",
					["source"] = "Marixx",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[157982] = {
					["type"] = "BUFF",
					["source"] = "Marixx",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[116011] = {
					["encounterID"] = 1206,
					["source"] = "Jesstara",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[160029] = {
					["type"] = "DEBUFF",
					["source"] = "Marixx",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1490] = {
					["type"] = "DEBUFF",
					["source"] = "Riptcagé",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[73685] = {
					["type"] = "BUFF",
					["source"] = "Thelinguist-Dragonblight",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[325174] = {
					["encounterID"] = 1206,
					["source"] = "Spirit Link Totem",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 53006,
				},
				[74699] = {
					["type"] = "BUFF",
					["source"] = "Unknown",
					["encounterID"] = 1051,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 39984,
				},
				[74634] = {
					["encounterID"] = 1051,
					["source"] = "General Umbriss",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 39625,
				},
				[76729] = {
					["source"] = "Twilight Armsmaster",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 41073,
				},
				[76596] = {
					["source"] = "Twilight Earthshaper",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 39890,
				},
				[23920] = {
					["type"] = "BUFF",
					["source"] = "Savannasedai",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[202225] = {
					["type"] = "BUFF",
					["source"] = "Drpoopypants-Proudmoore",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[335150] = {
					["source"] = "Silenal",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[261947] = {
					["encounterID"] = 1206,
					["source"] = "Lolithryx",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[70233] = {
					["source"] = "Lukedruid-Hyjal",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[122470] = {
					["type"] = "BUFF",
					["source"] = "Lolithryx",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[101545] = {
					["source"] = "Monkheadahh-Area52",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[32216] = {
					["type"] = "BUFF",
					["source"] = "Onawar-Korgath",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[221771] = {
					["encounterID"] = 1051,
					["source"] = "Monkheadahh-Area52",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[76727] = {
					["source"] = "Twilight Armsmaster",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 41073,
				},
				[270661] = {
					["source"] = "Crunkology",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[34861] = {
					["encounterID"] = 1206,
					["source"] = "Eilana",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[74837] = {
					["type"] = "DEBUFF",
					["source"] = "Malignant Trogg",
					["encounterID"] = 1051,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 39984,
				},
				[328933] = {
					["source"] = "Ferda-Shandris",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[204021] = {
					["encounterID"] = 1206,
					["source"] = "Gigasloth-Korgath",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[327225] = {
					["type"] = "BUFF",
					["source"] = "Guvante",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[298837] = {
					["source"] = "Lantebacon-Proudmoore",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[296003] = {
					["source"] = "Lëxä-Nordrassil",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[217832] = {
					["source"] = "Glaivegarr",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[224098] = {
					["source"] = "Elana",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 112575,
				},
				[70234] = {
					["source"] = "Chewbear",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[53595] = {
					["encounterID"] = 1206,
					["source"] = "Guvante",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[8122] = {
					["encounterID"] = 1206,
					["source"] = "Kelexx-Korgath",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[100093] = {
					["type"] = "BUFF",
					["source"] = "Blazing Talon Initiate",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 53369,
				},
				[78674] = {
					["encounterID"] = 1206,
					["source"] = "Charnaa",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[44212] = {
					["source"] = "Crunkology",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[74561] = {
					["source"] = "Twilight Stormbreaker",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 39962,
				},
				[270576] = {
					["type"] = "BUFF",
					["source"] = "Raingarr",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[302932] = {
					["type"] = "BUFF",
					["source"] = "Drpoopypants-Proudmoore",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[2096] = {
					["source"] = "Valinari-Lightbringer",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[204896] = {
					["source"] = "Spellfiend Devourer",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 114406,
				},
				[198013] = {
					["type"] = "BUFF",
					["source"] = "Riptcagé",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[116014] = {
					["type"] = "BUFF",
					["source"] = "Jesstara",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[73920] = {
					["encounterID"] = 1206,
					["source"] = "Thelinguist-Dragonblight",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[317920] = {
					["source"] = "Momoland-Azshara",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[281195] = {
					["type"] = "BUFF",
					["source"] = "Silenal",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[193538] = {
					["type"] = "BUFF",
					["source"] = "Stabba",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[78675] = {
					["source"] = "Toddmother-Magtheridon",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[76693] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 41045,
				},
				[256778] = {
					["source"] = "Trauxinhxinh-Nordrassil",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[288613] = {
					["type"] = "BUFF",
					["source"] = "Silenal",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[20484] = {
					["encounterID"] = 1206,
					["source"] = "Marixx",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[254474] = {
					["type"] = "BUFF",
					["source"] = "Guvante",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[258883] = {
					["type"] = "DEBUFF",
					["source"] = "Riptcagé",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[2061] = {
					["encounterID"] = 1206,
					["source"] = "Eilana",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[124007] = {
					["encounterID"] = 1206,
					["source"] = "Xuen",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 63508,
				},
				[2060] = {
					["source"] = "Epicbazooka-Tichondrius",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[33967] = {
					["source"] = "Vanndar Stormpike",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 11948,
				},
				[774] = {
					["encounterID"] = 1206,
					["source"] = "Marixx",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[49966] = {
					["encounterID"] = 1206,
					["source"] = "Somber Dawn",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 165189,
				},
				[61684] = {
					["type"] = "BUFF",
					["source"] = "Spirit Beast",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 165189,
				},
				[11544] = {
					["source"] = "Lunar Festival Vendor",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 47897,
				},
				[24858] = {
					["source"] = "Torvii-Lightbringer",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[176277] = {
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[81262] = {
					["type"] = "BUFF",
					["source"] = "Efflorescence",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 47649,
				},
				[60842] = {
					["source"] = "Trade Prince Gallywix",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 101605,
				},
				[193358] = {
					["type"] = "BUFF",
					["source"] = "Stabba",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[311492] = {
					["source"] = "Ikcarus-Shandris",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[188625] = {
					["source"] = "Eitrigg",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 101018,
				},
				[783] = {
					["encounterID"] = 1206,
					["source"] = "Marixx",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[154796] = {
					["source"] = "Huntgarr",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[342181] = {
					["type"] = "BUFF",
					["source"] = "Vazio-Dragonblight",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[781] = {
					["encounterID"] = 1206,
					["source"] = "Silenal",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[207076] = {
					["source"] = "Crunkology",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[75096] = {
					["source"] = "Twilight Thundercaller",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 40270,
				},
				[232854] = {
					["source"] = "Zorlea-Bronzebeard",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[145205] = {
					["encounterID"] = 1206,
					["source"] = "Marixx",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[295378] = {
					["type"] = "BUFF",
					["source"] = "Charnaa",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[185358] = {
					["encounterID"] = 1206,
					["source"] = "Silenal",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[212084] = {
					["type"] = "BUFF",
					["source"] = "Gigasloth-Korgath",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[198839] = {
					["type"] = "BUFF",
					["source"] = "Earthen Wall Totem",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 100943,
				},
				[108280] = {
					["type"] = "BUFF",
					["source"] = "Raingarr",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[12544] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 112608,
				},
				[104316] = {
					["encounterID"] = 1206,
					["source"] = "Vazio-Dragonblight",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[124009] = {
					["type"] = "BUFF",
					["source"] = "Xuen",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 63508,
				},
				[186254] = {
					["type"] = "BUFF",
					["source"] = "Scarletautum",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[204157] = {
					["encounterID"] = 1206,
					["source"] = "Gigasloth-Korgath",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[217200] = {
					["encounterID"] = 1206,
					["source"] = "Scarletautum",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[5277] = {
					["type"] = "BUFF",
					["source"] = "Stabba",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[205180] = {
					["source"] = "Gartbrez-Shandris",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[596] = {
					["encounterID"] = 1206,
					["source"] = "Eilana",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[311489] = {
					["type"] = "BUFF",
					["source"] = "Riptcagé",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[108853] = {
					["encounterID"] = 1206,
					["source"] = "Jesstara",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[191933] = {
					["source"] = "Glazer",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 96680,
				},
				[298343] = {
					["type"] = "BUFF",
					["source"] = "Drpoopypants-Proudmoore",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[342076] = {
					["type"] = "BUFF",
					["source"] = "Silenal",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[343355] = {
					["encounterID"] = 1206,
					["source"] = "Kelexx-Korgath",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[109304] = {
					["encounterID"] = 1206,
					["source"] = "Silenal",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[311488] = {
					["type"] = "BUFF",
					["source"] = "Silenal",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[347037] = {
					["type"] = "BUFF",
					["source"] = "Stabba",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[280286] = {
					["type"] = "DEBUFF",
					["source"] = "Charnaa",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[281209] = {
					["source"] = "Mezzerfleu",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[192522] = {
					["source"] = "Ash'golm",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 96681,
				},
				[196742] = {
					["type"] = "BUFF",
					["source"] = "Lolithryx",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[76151] = {
					["source"] = "Twilight Beguiler",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 40167,
				},
				[192106] = {
					["source"] = "Rendark",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[61353] = {
					["source"] = "Dagna Flintlock",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 96779,
				},
				[100] = {
					["encounterID"] = 1206,
					["source"] = "Onawar-Korgath",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[199758] = {
					["source"] = "Immolanth",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 96682,
				},
				[186257] = {
					["type"] = "BUFF",
					["source"] = "Silenal",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[8676] = {
					["encounterID"] = 1206,
					["source"] = "Stabba",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[298841] = {
					["source"] = "Drpoopypants-Proudmoore",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[195072] = {
					["encounterID"] = 1206,
					["source"] = "Riptcagé",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[139546] = {
					["encounterID"] = 1206,
					["source"] = "Stabba",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[192519] = {
					["source"] = "Ash'golm",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 96681,
				},
				[1604] = {
					["source"] = "Savage Felstalker",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 92782,
				},
				[186258] = {
					["type"] = "BUFF",
					["source"] = "Silenal",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[325202] = {
					["type"] = "BUFF",
					["source"] = "Lolithryx",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[197639] = {
					["source"] = "Freed Illidari",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 96656,
				},
				[199490] = {
					["source"] = "Allari the Souleater",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 101006,
				},
				[182104] = {
					["type"] = "BUFF",
					["source"] = "Guvante",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[162264] = {
					["type"] = "BUFF",
					["source"] = "Riptcagé",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[19574] = {
					["type"] = "BUFF",
					["source"] = "Scarletautum",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[209788] = {
					["source"] = "Glaivegarr",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[273798] = {
					["type"] = "BUFF",
					["source"] = "Charnaa",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[76314] = {
					["source"] = "Crimsonborne Seer",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 39405,
				},
				[76378] = {
					["source"] = "Azureborne Guardian",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 39854,
				},
				[311484] = {
					["type"] = "BUFF",
					["source"] = "Silenal",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[165746] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 112585,
				},
				[132169] = {
					["type"] = "DEBUFF",
					["source"] = "Drpoopypants-Proudmoore",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[200498] = {
					["source"] = "Savage Felstalker",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 92782,
				},
				[303211] = {
					["source"] = "Trauxinhxinh-Nordrassil",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[76720] = {
					["source"] = "Twilight Stormbreaker",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 39962,
				},
				[19750] = {
					["encounterID"] = 1206,
					["source"] = "Guvante",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[53822] = {
					["source"] = "Koury-Windrunner",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[192058] = {
					["encounterID"] = 1206,
					["source"] = "Raingarr",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[328275] = {
					["encounterID"] = 1206,
					["source"] = "Silenal",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[341202] = {
					["type"] = "BUFF",
					["source"] = "Stabba",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[131347] = {
					["encounterID"] = 1206,
					["source"] = "Gigasloth-Korgath",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[207744] = {
					["source"] = "Siejagen-Bonechewer",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[330067] = {
					["source"] = "Timrobinson-Destromath",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[99844] = {
					["type"] = "DEBUFF",
					["source"] = "Alysrazor",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 52530,
				},
				[205826] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 114412,
				},
				[201223] = {
					["source"] = "Uggla-Muradin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[76507] = {
					["source"] = "Trogg Dweller",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 39450,
				},
				[272013] = {
					["encounterID"] = 1206,
					["source"] = "Vicious Hellhound",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 136399,
				},
				[34769] = {
					["source"] = "Lhorne",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[100780] = {
					["encounterID"] = 1206,
					["source"] = "Lolithryx",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[203782] = {
					["source"] = "Siejagen-Bonechewer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[204677] = {
					["source"] = "Doomguard Firecaller",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 114399,
				},
				[127230] = {
					["source"] = "Uggla-Muradin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[186518] = {
					["source"] = "Eitrigg",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 101018,
				},
				[345495] = {
					["encounterID"] = 1206,
					["source"] = "Frothing Pustule",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 175519,
				},
				[340556] = {
					["type"] = "DEBUFF",
					["source"] = "Marixx",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[70242] = {
					["source"] = "Chewbear",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[270481] = {
					["encounterID"] = 1206,
					["source"] = "Demonic Tyrant",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 135002,
				},
				[347462] = {
					["source"] = "Iwillthrow-Tichondrius",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[186263] = {
					["encounterID"] = 1206,
					["source"] = "Kelexx-Korgath",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[148540] = {
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[193547] = {
					["source"] = "Glaivegarr",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[57723] = {
					["type"] = "DEBUFF",
					["source"] = "Raingarr",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[408] = {
					["encounterID"] = 1206,
					["source"] = "Stabba",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[2098] = {
					["encounterID"] = 1206,
					["source"] = "Stabba",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[331939] = {
					["type"] = "BUFF",
					["source"] = "Rachallin",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[99432] = {
					["type"] = "BUFF",
					["source"] = "Alysrazor",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 52530,
				},
				[113656] = {
					["type"] = "BUFF",
					["source"] = "Lolithryx",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[74846] = {
					["encounterID"] = 1051,
					["source"] = "General Umbriss",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 39625,
				},
				[315496] = {
					["type"] = "BUFF",
					["source"] = "Stabba",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[32223] = {
					["source"] = "Musky-Bronzebeard",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[15286] = {
					["type"] = "BUFF",
					["source"] = "Kelexx-Korgath",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[321379] = {
					["type"] = "BUFF",
					["source"] = "Eilana",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[297412] = {
					["source"] = "Lëxä-Nordrassil",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[148542] = {
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[186265] = {
					["type"] = "BUFF",
					["source"] = "Silenal",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[70243] = {
					["source"] = "Chewbear",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[204843] = {
					["source"] = "Glaivegarr",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[76335] = {
					["source"] = "Crimsonborne Seer",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 39405,
				},
				[87024] = {
					["source"] = "Cocoabutter",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[265116] = {
					["encounterID"] = 1206,
					["source"] = "Raingarr",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[122] = {
					["encounterID"] = 1206,
					["source"] = "Jesstara",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[126892] = {
					["source"] = "Linjaeso-Draenor",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[974] = {
					["encounterID"] = 1206,
					["source"] = "Raingarr",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[79962] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 96954,
				},
				[198065] = {
					["source"] = "Agrarianmaik-Quel'Thalas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[272790] = {
					["encounterID"] = 1206,
					["source"] = "Scarletautum",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[167898] = {
					["source"] = "Oryza-Azgalor",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[2120] = {
					["encounterID"] = 1206,
					["source"] = "Jesstara",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[205448] = {
					["encounterID"] = 1206,
					["source"] = "Kelexx-Korgath",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[1943] = {
					["encounterID"] = 1206,
					["source"] = "Mizzron",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[33076] = {
					["encounterID"] = 1206,
					["source"] = "Eilana",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[70244] = {
					["source"] = "Severussnape-Shandris",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[53600] = {
					["encounterID"] = 1206,
					["source"] = "Guvante",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[57724] = {
					["source"] = "Imnotthd-ShatteredHand",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[164273] = {
					["source"] = "Silenal",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[24870] = {
					["source"] = "Lukedruid-Hyjal",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[207495] = {
					["type"] = "BUFF",
					["source"] = "Ancestral Protection Totem",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 104818,
				},
				[48517] = {
					["type"] = "BUFF",
					["source"] = "Charnaa",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[100359] = {
					["type"] = "DEBUFF",
					["source"] = "Voracious Hatchling",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 53898,
				},
				[11426] = {
					["source"] = "Frrostbitee-AzjolNerub",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[99464] = {
					["type"] = "BUFF",
					["source"] = "Alysrazor",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 52530,
				},
				[311477] = {
					["type"] = "BUFF",
					["source"] = "Eilana",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[257541] = {
					["encounterID"] = 1206,
					["source"] = "Jesstara",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[115804] = {
					["type"] = "DEBUFF",
					["source"] = "Lolithryx",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[213634] = {
					["encounterID"] = 1206,
					["source"] = "Daphna",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[272126] = {
					["source"] = "Mikeoxlong",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[311474] = {
					["type"] = "BUFF",
					["source"] = "Marixx",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[321388] = {
					["source"] = "Thellwyn-Nazjatar",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[182335] = {
					["source"] = "Orgrimmar Grunt",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 101146,
				},
				[203277] = {
					["source"] = "Kinetik-Nazjatar",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[5761] = {
					["source"] = "Mizzron",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[6788] = {
					["type"] = "DEBUFF",
					["source"] = "Kelexx-Korgath",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[6552] = {
					["encounterID"] = 1206,
					["source"] = "Savannasedai",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[147193] = {
					["encounterID"] = 1206,
					["source"] = "Kelexx-Korgath",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[343385] = {
					["encounterID"] = 1206,
					["source"] = "Ducksaas",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[323436] = {
					["encounterID"] = 1206,
					["source"] = "Gigasloth-Korgath",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[315508] = {
					["type"] = "BUFF",
					["source"] = "Stabba",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[3408] = {
					["source"] = "Sapie-KulTiras",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1706] = {
					["encounterID"] = 1206,
					["source"] = "Kelexx-Korgath",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[325283] = {
					["encounterID"] = 1206,
					["source"] = "Kelexx-Korgath",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[32379] = {
					["encounterID"] = 1206,
					["source"] = "Kelexx-Korgath",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[343386] = {
					["type"] = "BUFF",
					["source"] = "Ducksaas",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[265187] = {
					["encounterID"] = 1206,
					["source"] = "Vazio-Dragonblight",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[99913] = {
					["type"] = "BUFF",
					["source"] = "Unbound Smoldering Elemental",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 53732,
				},
				[344154] = {
					["type"] = "BUFF",
					["source"] = "Drpoopypants-Proudmoore",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[24275] = {
					["encounterID"] = 1206,
					["source"] = "Guvante",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[281240] = {
					["source"] = "Uggla-Muradin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1715] = {
					["encounterID"] = 1206,
					["source"] = "Savannasedai",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[1719] = {
					["type"] = "BUFF",
					["source"] = "Savannasedai",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[12323] = {
					["encounterID"] = 1206,
					["source"] = "Rachallin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[204686] = {
					["source"] = "Doombringer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 114400,
				},
				[8613] = {
					["source"] = "Toddmother-Magtheridon",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[6673] = {
					["source"] = "Onawar-Korgath",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[196502] = {
					["source"] = "Glazer",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 96680,
				},
				[311471] = {
					["type"] = "BUFF",
					["source"] = "Mizzron",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[189469] = {
					["source"] = "Malace Shade",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 97090,
				},
				[70771] = {
					["source"] = "Daemonicus-Muradin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[339298] = {
					["type"] = "BUFF",
					["source"] = "Vazio-Dragonblight",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[77472] = {
					["encounterID"] = 1206,
					["source"] = "Ducksaas",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[310143] = {
					["type"] = "BUFF",
					["source"] = "Stabba",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[279709] = {
					["type"] = "BUFF",
					["source"] = "Charnaa",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[342309] = {
					["type"] = "BUFF",
					["source"] = "Stabba",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[36554] = {
					["type"] = "BUFF",
					["source"] = "Mizzron",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[236645] = {
					["source"] = "Agrarianmaik-Quel'Thalas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[72968] = {
					["source"] = "Lesanna-Azshara",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[185123] = {
					["encounterID"] = 1206,
					["source"] = "Riptcagé",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[343648] = {
					["type"] = "BUFF",
					["source"] = "Charnaa",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[307187] = {
					["source"] = "Gohma-Azshara",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[188499] = {
					["type"] = "BUFF",
					["source"] = "Riptcagé",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[343393] = {
					["encounterID"] = 1206,
					["source"] = "Ducksaas",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[185763] = {
					["encounterID"] = 1206,
					["source"] = "Stabba",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[124211] = {
					["source"] = "Biggnome-KhazModan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[243435] = {
					["type"] = "BUFF",
					["source"] = "Lolithryx",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[31884] = {
					["type"] = "BUFF",
					["source"] = "Guvante",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[328305] = {
					["encounterID"] = 1206,
					["source"] = "Stabba",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[198838] = {
					["encounterID"] = 1206,
					["source"] = "Ducksaas",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[187464] = {
					["type"] = "DEBUFF",
					["source"] = "Kelexx-Korgath",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[196840] = {
					["encounterID"] = 1206,
					["source"] = "Thelinguist-Dragonblight",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[335467] = {
					["encounterID"] = 1206,
					["source"] = "Kelexx-Korgath",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[325299] = {
					["type"] = "BUFF",
					["source"] = "Vazio-Dragonblight",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[79849] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 47248,
				},
				[343396] = {
					["type"] = "BUFF",
					["source"] = "Ducksaas",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[74670] = {
					["encounterID"] = 1051,
					["source"] = "General Umbriss",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 39625,
				},
				[203795] = {
					["encounterID"] = 1206,
					["source"] = "Gigasloth-Korgath",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[118905] = {
					["encounterID"] = 1206,
					["source"] = "Capacitor Totem",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 61245,
				},
				[52174] = {
					["encounterID"] = 1206,
					["source"] = "Onawar-Korgath",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[31224] = {
					["type"] = "BUFF",
					["source"] = "Mizzron",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[314791] = {
					["type"] = "BUFF",
					["source"] = "Jesstara",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[311466] = {
					["type"] = "BUFF",
					["source"] = "Mizzron",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[271788] = {
					["type"] = "DEBUFF",
					["source"] = "Silenal",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[294133] = {
					["source"] = "Stein-Muradin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[76332] = {
					["source"] = "Crimsonborne Seer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 39405,
				},
				[343144] = {
					["type"] = "BUFF",
					["source"] = "Kelexx-Korgath",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[224001] = {
					["source"] = "Uggla-Muradin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[334448] = {
					["source"] = "Apawìmanì-AzjolNerub",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[74853] = {
					["type"] = "BUFF",
					["source"] = "General Umbriss",
					["encounterID"] = 1051,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 39625,
				},
				[225919] = {
					["encounterID"] = 1206,
					["source"] = "Gigasloth-Korgath",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[188196] = {
					["encounterID"] = 1206,
					["source"] = "Raingarr",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[48168] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 96955,
				},
				[186406] = {
					["source"] = "Glaivegarr",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[228477] = {
					["encounterID"] = 1206,
					["source"] = "Gigasloth-Korgath",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[344732] = {
					["encounterID"] = 1206,
					["source"] = "Kelexx-Korgath",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[101643] = {
					["source"] = "Emrri-Azshara",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[12654] = {
					["type"] = "DEBUFF",
					["source"] = "Jesstara",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[10060] = {
					["type"] = "BUFF",
					["source"] = "Kelexx-Korgath",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[311464] = {
					["type"] = "BUFF",
					["source"] = "Mizzron",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[306830] = {
					["encounterID"] = 1206,
					["source"] = "Gigasloth-Korgath",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[190984] = {
					["encounterID"] = 1206,
					["source"] = "Charnaa",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[310923] = {
					["source"] = "Frrostbitee-AzjolNerub",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[232698] = {
					["type"] = "BUFF",
					["source"] = "Kelexx-Korgath",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[320130] = {
					["type"] = "BUFF",
					["source"] = "Mizzron",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[345230] = {
					["type"] = "BUFF",
					["source"] = "Vazio-Dragonblight",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[225921] = {
					["encounterID"] = 1206,
					["source"] = "Gigasloth-Korgath",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[48108] = {
					["type"] = "BUFF",
					["source"] = "Jesstara",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[118779] = {
					["type"] = "BUFF",
					["source"] = "Onawar-Korgath",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[184362] = {
					["type"] = "BUFF",
					["source"] = "Drpoopypants-Proudmoore",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[345535] = {
					["type"] = "BUFF",
					["source"] = "Onawar-Korgath",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[294966] = {
					["source"] = "Cheezedoodle",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[202137] = {
					["encounterID"] = 1206,
					["source"] = "Gigasloth-Korgath",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[288675] = {
					["type"] = "BUFF",
					["source"] = "Raingarr",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[108211] = {
					["source"] = "Uggla-Muradin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[77489] = {
					["type"] = "BUFF",
					["source"] = "Eilana",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[197277] = {
					["type"] = "DEBUFF",
					["source"] = "Guvante",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[95826] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Horde Guard",
					["npcID"] = 51914,
				},
				[207685] = {
					["source"] = "Glaivegarr",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[188370] = {
					["type"] = "BUFF",
					["source"] = "Guvante",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[202138] = {
					["source"] = "Glaivegarr",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[338804] = {
					["source"] = "Hanalai",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[189467] = {
					["source"] = "Malace Shade",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 97090,
				},
				[193315] = {
					["encounterID"] = 1206,
					["source"] = "Stabba",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[345710] = {
					["type"] = "DEBUFF",
					["source"] = "Rachallin",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[194594] = {
					["type"] = "BUFF",
					["source"] = "Silenal",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[43308] = {
					["source"] = "Drpoopypants-Proudmoore",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[15407] = {
					["type"] = "BUFF",
					["source"] = "Kelexx-Korgath",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[126664] = {
					["encounterID"] = 1206,
					["source"] = "Onawar-Korgath",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[115008] = {
					["source"] = "Monkheadahh-Area52",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[80354] = {
					["source"] = "Dalinicus",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[126389] = {
					["source"] = "Vex",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[56641] = {
					["encounterID"] = 1206,
					["source"] = "Silenal",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[99919] = {
					["encounterID"] = 1206,
					["source"] = "Blazing Talon Clawshaper",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 53734,
				},
				[6201] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ignorc",
					["npcID"] = 0,
				},
				[338825] = {
					["source"] = "Tuskers-KhazModan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[162243] = {
					["encounterID"] = 1206,
					["source"] = "Riptcagé",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[15487] = {
					["encounterID"] = 1206,
					["source"] = "Kelexx-Korgath",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[11327] = {
					["type"] = "BUFF",
					["source"] = "Stabba",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[336267] = {
					["type"] = "BUFF",
					["source"] = "Eilana",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[330896] = {
					["type"] = "BUFF",
					["source"] = "Gigasloth-Korgath",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[307096] = {
					["source"] = "Vormav-Lightbringer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[164812] = {
					["type"] = "DEBUFF",
					["source"] = "Marixx",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[20824] = {
					["source"] = "Deadwind Ogre Mage",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 7379,
				},
				[79140] = {
					["encounterID"] = 1206,
					["source"] = "Mizzron",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[65081] = {
					["type"] = "BUFF",
					["source"] = "Kelexx-Korgath",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[124280] = {
					["type"] = "DEBUFF",
					["source"] = "Lolithryx",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[185857] = {
					["source"] = "Bilgewater Soldier",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 101026,
				},
				[307865] = {
					["encounterID"] = 1206,
					["source"] = "Savannasedai",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[184367] = {
					["encounterID"] = 1206,
					["source"] = "Onawar-Korgath",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[328837] = {
					["type"] = "BUFF",
					["source"] = "Silenal",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[5246] = {
					["encounterID"] = 1206,
					["source"] = "Rachallin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[48518] = {
					["type"] = "BUFF",
					["source"] = "Charnaa",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1064] = {
					["encounterID"] = 1206,
					["source"] = "Raingarr",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[242551] = {
					["source"] = "Longnifes-Cairne",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[307611] = {
					["source"] = "Darknite",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[276154] = {
					["type"] = "BUFF",
					["source"] = "Charnaa",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1833] = {
					["encounterID"] = 1206,
					["source"] = "Mizzron",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[204062] = {
					["source"] = "Glaivegarr",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[200992] = {
					["source"] = "Savage Felstalker",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 92782,
				},
				[195457] = {
					["encounterID"] = 1206,
					["source"] = "Stabba",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[207386] = {
					["type"] = "BUFF",
					["source"] = "Marixx",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[324748] = {
					["type"] = "BUFF",
					["source"] = "Eilana",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[77130] = {
					["encounterID"] = 1206,
					["source"] = "Thelinguist-Dragonblight",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[258920] = {
					["type"] = "BUFF",
					["source"] = "Riptcagé",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[225289] = {
					["source"] = "Dark Ranger Kalira",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 113084,
				},
				[15727] = {
					["source"] = "Eitrigg",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 101018,
				},
				[308637] = {
					["source"] = "Juicemane-Azgalor",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[201633] = {
					["type"] = "BUFF",
					["source"] = "Earthen Wall Totem",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 100943,
				},
				[213525] = {
					["source"] = "Draenei Anchorite",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 97688,
				},
				[197641] = {
					["source"] = "Altruis the Sufferer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 97267,
				},
				[48778] = {
					["source"] = "Husbeast",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[157644] = {
					["type"] = "BUFF",
					["source"] = "Jesstara",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[191915] = {
					["source"] = "Glazer",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 96680,
				},
				[48107] = {
					["type"] = "BUFF",
					["source"] = "Jesstara",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[117952] = {
					["encounterID"] = 1206,
					["source"] = "Lolithryx",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[1850] = {
					["source"] = "Toddmother-Magtheridon",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[79206] = {
					["type"] = "BUFF",
					["source"] = "Raingarr",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[201122] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 96656,
				},
				[19434] = {
					["encounterID"] = 1206,
					["source"] = "Silenal",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[331624] = {
					["encounterID"] = 1206,
					["source"] = "Silenal",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[46924] = {
					["type"] = "BUFF",
					["source"] = "Rachallin",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1856] = {
					["encounterID"] = 1206,
					["source"] = "Stabba",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[1329] = {
					["encounterID"] = 1206,
					["source"] = "Mizzron",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[465] = {
					["type"] = "BUFF",
					["source"] = "Guvante",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[308514] = {
					["source"] = "Pentree-Azgalor",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[68529] = {
					["source"] = "Chewbear",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[199461] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 101006,
				},
				[5394] = {
					["encounterID"] = 1206,
					["source"] = "Raingarr",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[307871] = {
					["type"] = "DEBUFF",
					["source"] = "Savannasedai",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[207771] = {
					["type"] = "DEBUFF",
					["source"] = "Gigasloth-Korgath",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[322109] = {
					["encounterID"] = 1206,
					["source"] = "Lolithryx",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[223499] = {
					["source"] = "Sylvyan-Bronzebeard",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[199828] = {
					["source"] = "Immolanth",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 96682,
				},
				[2645] = {
					["type"] = "BUFF",
					["source"] = "Ducksaas",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[116670] = {
					["encounterID"] = 1206,
					["source"] = "Lolithryx",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[70192] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Decisbigrack",
					["npcID"] = 0,
				},
				[76394] = {
					["source"] = "Azureborne Guardian",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 39854,
				},
				[311458] = {
					["source"] = "Dazzan-Lightbringer",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[325013] = {
					["type"] = "BUFF",
					["source"] = "Kelexx-Korgath",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[227723] = {
					["source"] = "Scarletautum",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[69489] = {
					["source"] = "Arrmah-Bronzebeard",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[311459] = {
					["source"] = "Slepnir-Suramar",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[209693] = {
					["encounterID"] = 1206,
					["source"] = "Riptcagé",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[102417] = {
					["source"] = "Kinetickus",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[195627] = {
					["type"] = "BUFF",
					["source"] = "Stabba",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[345219] = {
					["type"] = "DEBUFF",
					["source"] = "Kelexx-Korgath",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[93402] = {
					["encounterID"] = 1206,
					["source"] = "Charnaa",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[187827] = {
					["type"] = "BUFF",
					["source"] = "Gigasloth-Korgath",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[15284] = {
					["source"] = "Lor'themar Theron",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 101010,
				},
				[184364] = {
					["type"] = "BUFF",
					["source"] = "Onawar-Korgath",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[330131] = {
					["type"] = "BUFF",
					["source"] = "Jesstara",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[96231] = {
					["encounterID"] = 1206,
					["source"] = "Guvante",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[165961] = {
					["type"] = "BUFF",
					["source"] = "Marixx",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[280772] = {
					["encounterID"] = 1206,
					["source"] = "Savannasedai",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[320674] = {
					["encounterID"] = 1206,
					["source"] = "Raingarr",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[22842] = {
					["type"] = "BUFF",
					["source"] = "Marixx",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[5760] = {
					["type"] = "DEBUFF",
					["source"] = "Stabba",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[280773] = {
					["type"] = "DEBUFF",
					["source"] = "Onawar-Korgath",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[85673] = {
					["encounterID"] = 1206,
					["source"] = "Guvante",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[193455] = {
					["encounterID"] = 1206,
					["source"] = "Scarletautum",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[79976] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 168597,
				},
				[53351] = {
					["encounterID"] = 1206,
					["source"] = "Scarletautum",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[2094] = {
					["encounterID"] = 1206,
					["source"] = "Mizzron",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[192225] = {
					["source"] = "Vazio-Dragonblight",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1766] = {
					["encounterID"] = 1206,
					["source"] = "Stabba",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[311465] = {
					["type"] = "BUFF",
					["source"] = "Mizzron",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[193357] = {
					["type"] = "BUFF",
					["source"] = "Stabba",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[207778] = {
					["encounterID"] = 1206,
					["source"] = "Thelinguist-Dragonblight",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[109132] = {
					["encounterID"] = 1206,
					["source"] = "Lolithryx",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[280776] = {
					["type"] = "BUFF",
					["source"] = "Savannasedai",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[121536] = {
					["encounterID"] = 1206,
					["source"] = "Eilana",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[100029] = {
					["type"] = "DEBUFF",
					["source"] = "Vazio-Dragonblight",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[853] = {
					["encounterID"] = 1206,
					["source"] = "Guvante",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[311467] = {
					["type"] = "BUFF",
					["source"] = "Mizzron",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[263642] = {
					["encounterID"] = 1206,
					["source"] = "Gigasloth-Korgath",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[199831] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 101406,
				},
				[324260] = {
					["encounterID"] = 1206,
					["source"] = "Rachallin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[311468] = {
					["type"] = "BUFF",
					["source"] = "Mizzron",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[341207] = {
					["type"] = "BUFF",
					["source"] = "Kelexx-Korgath",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[192631] = {
					["source"] = "Ash'golm",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 96681,
				},
				[121153] = {
					["type"] = "BUFF",
					["source"] = "Mizzron",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[311469] = {
					["type"] = "BUFF",
					["source"] = "Mizzron",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[317009] = {
					["encounterID"] = 1206,
					["source"] = "Riptcagé",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[193359] = {
					["type"] = "BUFF",
					["source"] = "Stabba",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[327276] = {
					["type"] = "BUFF",
					["source"] = "Lolithryx",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[311470] = {
					["type"] = "BUFF",
					["source"] = "Mizzron",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[98008] = {
					["encounterID"] = 1206,
					["source"] = "Raingarr",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[48045] = {
					["encounterID"] = 1206,
					["source"] = "Daphna",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[108366] = {
					["type"] = "BUFF",
					["source"] = "Vazio-Dragonblight",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[2823] = {
					["source"] = "Mizzron",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[125439] = {
					["source"] = "Sulgrim-Azgalor",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[164815] = {
					["type"] = "DEBUFF",
					["source"] = "Charnaa",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[196656] = {
					["source"] = "Malace Shade",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 97090,
				},
				[278736] = {
					["source"] = "Lílith-KhazModan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[31850] = {
					["type"] = "BUFF",
					["source"] = "Guvante",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[256374] = {
					["type"] = "BUFF",
					["source"] = "Vazio-Dragonblight",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[90898] = {
					["source"] = "Vyndalin-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[2383] = {
					["source"] = "Scarletautum",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[64765] = {
					["type"] = "BUFF",
					["source"] = "Guvante",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[201080] = {
					["source"] = "Wrathguard Legate",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 97225,
				},
				[27827] = {
					["type"] = "BUFF",
					["source"] = "Eilana",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[31935] = {
					["encounterID"] = 1206,
					["source"] = "Guvante",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[154797] = {
					["source"] = "Mizzron",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[176151] = {
					["source"] = "Thellwyn-Nazjatar",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[207399] = {
					["encounterID"] = 1206,
					["source"] = "Raingarr",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[311475] = {
					["type"] = "BUFF",
					["source"] = "Marixx",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[160597] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Torßjorn-Proudmoore",
					["npcID"] = 0,
				},
				[123904] = {
					["type"] = "BUFF",
					["source"] = "Lolithryx",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[203819] = {
					["type"] = "BUFF",
					["source"] = "Gigasloth-Korgath",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[311476] = {
					["type"] = "BUFF",
					["source"] = "Eilana",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[268905] = {
					["type"] = "BUFF",
					["source"] = "Raingarr",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[22888] = {
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[207400] = {
					["type"] = "BUFF",
					["source"] = "Thelinguist-Dragonblight",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[331937] = {
					["type"] = "BUFF",
					["source"] = "Rachallin",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[269279] = {
					["type"] = "BUFF",
					["source"] = "Charnaa",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[199600] = {
					["type"] = "BUFF",
					["source"] = "Stabba",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[114250] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Demyxodus",
					["npcID"] = 0,
				},
				[311478] = {
					["type"] = "BUFF",
					["source"] = "Eilana",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[64382] = {
					["encounterID"] = 1206,
					["source"] = "Savannasedai",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[325289] = {
					["encounterID"] = 1206,
					["source"] = "Vazio-Dragonblight",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[323385] = {
					["type"] = "BUFF",
					["source"] = "Eilana",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[311479] = {
					["type"] = "BUFF",
					["source"] = "Eilana",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[295367] = {
					["type"] = "DEBUFF",
					["source"] = "Raingarr",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[327510] = {
					["type"] = "BUFF",
					["source"] = "Guvante",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[203720] = {
					["encounterID"] = 1206,
					["source"] = "Gigasloth-Korgath",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[311480] = {
					["type"] = "BUFF",
					["source"] = "Eilana",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[329127] = {
					["type"] = "DEBUFF",
					["source"] = "Thelinguist-Dragonblight",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[253309] = {
					["type"] = "DEBUFF",
					["source"] = "Charnaa",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[191034] = {
					["type"] = "BUFF",
					["source"] = "Charnaa",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[311481] = {
					["type"] = "BUFF",
					["source"] = "Eilana",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[99461] = {
					["encounterID"] = 1206,
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1966] = {
					["type"] = "BUFF",
					["source"] = "Stabba",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[59715] = {
					["source"] = "Lor'themar Theron",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 101010,
				},
				[321712] = {
					["type"] = "DEBUFF",
					["source"] = "Jesstara",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[179057] = {
					["encounterID"] = 1206,
					["source"] = "Riptcagé",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[75569] = {
					["source"] = "Faceless Corruptor",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 39392,
				},
				[309181] = {
					["source"] = "Pentree-Azgalor",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[311483] = {
					["type"] = "BUFF",
					["source"] = "Onawar-Korgath",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[51723] = {
					["encounterID"] = 1206,
					["source"] = "Mizzron",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[199603] = {
					["type"] = "BUFF",
					["source"] = "Stabba",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[163073] = {
					["source"] = "Glaivegarr",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[34428] = {
					["encounterID"] = 1206,
					["source"] = "Onawar-Korgath",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[204079] = {
					["encounterID"] = 1206,
					["source"] = "Guvante",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[85288] = {
					["encounterID"] = 1206,
					["source"] = "Drpoopypants-Proudmoore",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[768] = {
					["source"] = "Krainan-Shandris",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[311485] = {
					["type"] = "BUFF",
					["source"] = "Riptcagé",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[295373] = {
					["encounterID"] = 1206,
					["source"] = "Charnaa",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[104318] = {
					["encounterID"] = 1206,
					["source"] = "Wild Imp",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 143622,
				},
				[8679] = {
					["source"] = "Toggie",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[311486] = {
					["type"] = "BUFF",
					["source"] = "Rachallin",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[338340] = {
					["type"] = "BUFF",
					["source"] = "Ducksaas",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[13750] = {
					["type"] = "BUFF",
					["source"] = "Stabba",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[264173] = {
					["type"] = "BUFF",
					["source"] = "Vazio-Dragonblight",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[311487] = {
					["type"] = "BUFF",
					["source"] = "Savannasedai",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[321973] = {
					["type"] = "BUFF",
					["source"] = "Daphna",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[211881] = {
					["encounterID"] = 1206,
					["source"] = "Riptcagé",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[21562] = {
					["source"] = "Kelexx-Korgath",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[111759] = {
					["type"] = "BUFF",
					["source"] = "Kelexx-Korgath",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[203975] = {
					["source"] = "Rotodem",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[246152] = {
					["type"] = "BUFF",
					["source"] = "Scarletautum",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[339928] = {
					["type"] = "BUFF",
					["source"] = "Silenal",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[270569] = {
					["type"] = "DEBUFF",
					["source"] = "Vazio-Dragonblight",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[194249] = {
					["type"] = "BUFF",
					["source"] = "Kelexx-Korgath",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[270058] = {
					["source"] = "Longnifes-Cairne",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[79892] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 96957,
				},
				[311490] = {
					["type"] = "BUFF",
					["source"] = "Lolithryx",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[105174] = {
					["encounterID"] = 1206,
					["source"] = "Vazio-Dragonblight",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[202164] = {
					["source"] = "Taechi",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[8004] = {
					["encounterID"] = 1206,
					["source"] = "Ducksaas",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[311491] = {
					["type"] = "BUFF",
					["source"] = "Silenal",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[264689] = {
					["source"] = "Presti",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[119085] = {
					["source"] = "Moocakes-Destromath",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[264178] = {
					["encounterID"] = 1206,
					["source"] = "Vazio-Dragonblight",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[315584] = {
					["source"] = "Stabba",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[190784] = {
					["encounterID"] = 1206,
					["source"] = "Guvante",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[157153] = {
					["encounterID"] = 1206,
					["source"] = "Ducksaas",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[88423] = {
					["encounterID"] = 1206,
					["source"] = "Marixx",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[311493] = {
					["source"] = "Momoland-Azshara",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[45182] = {
					["type"] = "BUFF",
					["source"] = "Stabba",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[334511] = {
					["type"] = "BUFF",
					["source"] = "Gigasloth-Korgath",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[199736] = {
					["source"] = "Slepnir-Suramar",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[231390] = {
					["source"] = "Onecyde-Destromath",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[255234] = {
					["type"] = "DEBUFF",
					["source"] = "Rachallin",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[183752] = {
					["encounterID"] = 1206,
					["source"] = "Riptcagé",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[342814] = {
					["type"] = "BUFF",
					["source"] = "Stabba",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[311495] = {
					["source"] = "Rawrbomb-Destromath",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[209261] = {
					["type"] = "DEBUFF",
					["source"] = "Gigasloth-Korgath",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[204242] = {
					["type"] = "DEBUFF",
					["source"] = "Guvante",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[297941] = {
					["source"] = "Necrodaemon",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[118922] = {
					["type"] = "BUFF",
					["source"] = "Silenal",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[8092] = {
					["encounterID"] = 1206,
					["source"] = "Daphna",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[40120] = {
					["source"] = "Lessors",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[248473] = {
					["source"] = "Frrostbitee-AzjolNerub",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[212653] = {
					["type"] = "BUFF",
					["source"] = "Jesstara",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[99389] = {
					["type"] = "DEBUFF",
					["source"] = "Voracious Hatchling",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 53509,
				},
				[194384] = {
					["source"] = "Fatherthyme",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[225313] = {
					["source"] = "Dark Ranger Velonara",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 113086,
				},
				[5487] = {
					["source"] = "Shadowwarrio-Muradin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[85739] = {
					["type"] = "BUFF",
					["source"] = "Savannasedai",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[202168] = {
					["encounterID"] = 1206,
					["source"] = "Rachallin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[308509] = {
					["source"] = "Karateka-Winterhoof",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[302917] = {
					["type"] = "BUFF",
					["source"] = "Drpoopypants-Proudmoore",
					["encounterID"] = 1206,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[201189] = {
					["source"] = "Abyssal Shard",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 97228,
				},
			},
			["aura_tracker"] = {
				["buff_tracked"] = {
					[209859] = true,
				},
			},
			["health_selection_overlay_alpha"] = 0.09999999403953552,
			["cast_statusbar_spark_alpha"] = 0.8299999833106995,
			["minor_height_scale"] = 0.949999988079071,
			["patch_version"] = 13,
			["not_affecting_combat_alpha"] = 0.5999999642372131,
			["ui_parent_scale_tune"] = 1.409999847412109,
		},
		["[Better Pixel Perfect] M+ Mods/Scripts"] = {
			["script_data"] = {
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --flash duration\n    local CONFIG_FLASH_DURATION = scriptTable.config.flashDuration\n    \n    --manually create a new texture for the flash animation\n    if (not envTable.SmallFlashTexture) then\n        envTable.SmallFlashTexture = envTable.SmallFlashTexture or Plater:CreateImage (unitFrame.castBar)\n        envTable.SmallFlashTexture:SetColorTexture (1, 1, 1)\n        envTable.SmallFlashTexture:SetAllPoints()\n    end\n    \n    --manually create a flash animation using the framework\n    if (not envTable.SmallFlashAnimationHub) then \n        \n        local onPlay = function()\n            envTable.SmallFlashTexture:Show()\n        end\n        \n        local onFinished = function()\n            envTable.SmallFlashTexture:Hide()\n        end\n        \n        local animationHub = Plater:CreateAnimationHub (envTable.SmallFlashTexture, onPlay, onFinished)\n        envTable.flashIn = Plater:CreateAnimation (animationHub, \"Alpha\", 1, CONFIG_FLASH_DURATION/2, 0, .6)\n        envTable.flashOut = Plater:CreateAnimation (animationHub, \"Alpha\", 2, CONFIG_FLASH_DURATION/2, 1, 0)\n        \n        envTable.SmallFlashAnimationHub = animationHub\n    end\n    \n    envTable.flashIn:SetDuration(scriptTable.config.flashDuration / 2)\n    envTable.flashOut:SetDuration(scriptTable.config.flashDuration / 2)\n    envTable.SmallFlashTexture:SetColorTexture (Plater:ParseColors(scriptTable.config.flashColor))\n    \nend\n\n\n\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.SmallFlashAnimationHub:Stop()\n    \nend\n\n\n",
					["OptionsValues"] = {
					},
					["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.SmallFlashAnimationHub:Play()\n    \nend\n\n\n",
					["ScriptType"] = 2,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    \n    \nend\n\n\n",
					["Time"] = 1613183768,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar",
					["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --flash duration\n    local CONFIG_FLASH_DURATION = scriptTable.config.flashDuration\n    \n    --manually create a new texture for the flash animation\n    if (not envTable.SmallFlashTexture) then\n        envTable.SmallFlashTexture = envTable.SmallFlashTexture or Plater:CreateImage (unitFrame.castBar)\n        envTable.SmallFlashTexture:SetColorTexture (1, 1, 1)\n        envTable.SmallFlashTexture:SetAllPoints()\n    end\n    \n    --manually create a flash animation using the framework\n    if (not envTable.SmallFlashAnimationHub) then \n        \n        local onPlay = function()\n            envTable.SmallFlashTexture:Show()\n        end\n        \n        local onFinished = function()\n            envTable.SmallFlashTexture:Hide()\n        end\n        \n        local animationHub = Plater:CreateAnimationHub (envTable.SmallFlashTexture, onPlay, onFinished)\n        envTable.flashIn = Plater:CreateAnimation (animationHub, \"Alpha\", 1, CONFIG_FLASH_DURATION/2, 0, .6)\n        envTable.flashOut = Plater:CreateAnimation (animationHub, \"Alpha\", 2, CONFIG_FLASH_DURATION/2, 1, 0)\n        \n        envTable.SmallFlashAnimationHub = animationHub\n    end\n    \n    envTable.flashIn:SetDuration(scriptTable.config.flashDuration / 2)\n    envTable.flashOut:SetDuration(scriptTable.config.flashDuration / 2)\n    envTable.SmallFlashTexture:SetColorTexture (Plater:ParseColors(scriptTable.config.flashColor))\n    \nend\n\n\n\n\n\n\n\n",
					["NpcNames"] = {
					},
					["semver"] = "",
					["Enabled"] = true,
					["Revision"] = 637,
					["Options"] = {
						{
							["Type"] = 6,
							["Key"] = "option1",
							["Value"] = 0,
							["Name"] = "Option 1",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [1]
						{
							["Type"] = 5,
							["Key"] = "option2",
							["Value"] = "Plays a small animation when the cast start.",
							["Name"] = "Option 2",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [2]
						{
							["Type"] = 5,
							["Key"] = "option2",
							["Value"] = "Enter the spell name or spellID of the Spell in the Add Trigger box and hit \"Add\".",
							["Name"] = "Option 2",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [3]
						{
							["Type"] = 6,
							["Key"] = "option3",
							["Value"] = 0,
							["Name"] = "Option 3",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [4]
						{
							["Type"] = 2,
							["Max"] = 1.2,
							["Desc"] = "How long is the flash played when the cast starts.",
							["Min"] = 0.1,
							["Key"] = "flashDuration",
							["Value"] = 0.6,
							["Name"] = "Flash Duration",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = true,
						}, -- [5]
						{
							["Type"] = 1,
							["Key"] = "flashColor",
							["Value"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["Name"] = "Flash Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "Color of the Flash",
						}, -- [6]
					},
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.SmallFlashAnimationHub:Play()\n    \nend\n\n\n",
					["Name"] = "Cast - Small Alert [Plater]",
					["Author"] = "Tercioo-Sylvanas",
					["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["Desc"] = "Flashes the Cast Bar when a spell in the trigger list is Cast. Add spell in the Add Trigger field.",
					["version"] = -1,
					["Prio"] = 99,
					["SpellIds"] = {
						331379, -- [1]
						332236, -- [2]
						332671, -- [3]
						323166, -- [4]
						329917, -- [5]
						320512, -- [6]
						328986, -- [7]
						328180, -- [8]
						320529, -- [9]
						328338, -- [10]
						328400, -- [11]
						325552, -- [12]
						325700, -- [13]
						323552, -- [14]
						324609, -- [15]
						334653, -- [16]
						322169, -- [17]
						328288, -- [18]
						320462, -- [19]
						320171, -- [20]
						320293, -- [21]
						330784, -- [22]
					},
					["PlaterCore"] = 1,
					["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    \n    \nend\n\n\n",
					["Temp_Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.SmallFlashAnimationHub:Stop()\n    \nend\n\n\n",
					["url"] = "",
				}, -- [1]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --color to set the nameplate\n    envTable.NameplateColor = \"gray\"\n    \nend\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["OptionsValues"] = {
					},
					["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["ScriptType"] = 1,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --only change the nameplate color in combat\n    if (InCombatLockdown()) then\n        Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n    end\n    \nend\n\n\n\n\n\n\n",
					["Time"] = 1600015493,
					["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --color to set the nameplate\n    envTable.NameplateColor = \"gray\"\n    \nend\n\n\n",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_invalid",
					["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["Revision"] = 110,
					["Options"] = {
					},
					["Author"] = "Izimode-Azralon",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["NpcNames"] = {
					},
					["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --only change the nameplate color in combat\n    if (InCombatLockdown()) then\n        Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n    end\n    \nend\n\n\n\n\n\n\n",
					["Name"] = "Aura - Invalidate Unit [Plater]",
					["PlaterCore"] = 1,
					["Desc"] = "When an aura makes the unit invulnarable and you don't want to attack it. Add spell in the Add Trigger field.",
					["SpellIds"] = {
						261265, -- [1]
						261266, -- [2]
						271590, -- [3]
					},
					["Prio"] = 99,
					["Enabled"] = true,
				}, -- [2]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --creates a glow around the icon\n    envTable.buffIconGlow = envTable.buffIconGlow or Plater.CreateIconGlow (self, scriptTable.config.glowColor)\n    \nend",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (scriptTable.config.glowEnabled) then\n        envTable.buffIconGlow:Hide()\n    end\n    \n    if (scriptTable.config.dotsEnabled) then\n        Plater.StopDotAnimation(self, envTable.dotAnimation)\n    end\n    \n    \nend",
					["OptionsValues"] = {
					},
					["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (scriptTable.config.glowEnabled) then\n        envTable.buffIconGlow:Show()\n    end\n    \n    if (scriptTable.config.dotsEnabled) then\n        envTable.dotAnimation = Plater.PlayDotAnimation(self, 6, scriptTable.config.dotsColor, 6, 3) \n    end\n    \nend\n\n\n\n\n",
					["ScriptType"] = 1,
					["Temp_Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["Time"] = 1613183781,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura",
					["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --creates a glow around the icon\n    envTable.buffIconGlow = envTable.buffIconGlow or Plater.CreateIconGlow (self, scriptTable.config.glowColor)\n    \nend",
					["NpcNames"] = {
					},
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (scriptTable.config.glowEnabled) then\n        envTable.buffIconGlow:Show()\n    end\n    \n    if (scriptTable.config.dotsEnabled) then\n        envTable.dotAnimation = Plater.PlayDotAnimation(self, 6, scriptTable.config.dotsColor, 6, 3) \n    end\n    \nend\n\n\n\n\n",
					["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (scriptTable.config.glowEnabled) then\n        envTable.buffIconGlow:Hide()\n    end\n    \n    if (scriptTable.config.dotsEnabled) then\n        Plater.StopDotAnimation(self, envTable.dotAnimation)\n    end\n    \n    \nend",
					["Revision"] = 608,
					["Options"] = {
						{
							["Type"] = 6,
							["Key"] = "option1",
							["Value"] = 0,
							["Name"] = "Blank Space",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [1]
						{
							["Type"] = 5,
							["Key"] = "option2",
							["Value"] = "Enter the spell name or spellID of the Buff in the Add Trigger box and hit \"Add\".",
							["Name"] = "Option 2",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [2]
						{
							["Type"] = 6,
							["Key"] = "option3",
							["Value"] = 0,
							["Name"] = "Blank Space",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [3]
						{
							["Type"] = 4,
							["Key"] = "glowEnabled",
							["Value"] = false,
							["Name"] = "Glow Enabled",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "",
						}, -- [4]
						{
							["Type"] = 1,
							["Key"] = "glowColor",
							["Value"] = {
								0.40392156862745, -- [1]
								0.003921568627451, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Name"] = "Glow Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "",
						}, -- [5]
						{
							["Type"] = 6,
							["Key"] = "option3",
							["Value"] = 0,
							["Name"] = "Blank Space",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [6]
						{
							["Type"] = 4,
							["Key"] = "dotsEnabled",
							["Value"] = true,
							["Name"] = "Dots Enabled",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "",
						}, -- [7]
						{
							["Type"] = 1,
							["Key"] = "dotsColor",
							["Value"] = {
								1, -- [1]
								0.32156862745098, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Name"] = "Dots Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "",
						}, -- [8]
					},
					["SpellIds"] = {
						323149, -- [1]
						324392, -- [2]
						340544, -- [3]
						342189, -- [4]
						333227, -- [5]
					},
					["Prio"] = 99,
					["Author"] = "Tercioo-Sylvanas",
					["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["Desc"] = "Add the buff name in the trigger box.",
					["Name"] = "Aura - Buff Alert [Plater]",
					["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    \n    \n    \nend",
					["version"] = -1,
					["PlaterCore"] = 1,
					["semver"] = "",
					["Enabled"] = true,
					["url"] = "",
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    \n    \n    \nend",
				}, -- [3]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --create a texture to use for a flash behind the cast bar\n    local backGroundFlashTexture = Plater:CreateImage (self, [[Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Alert-Glow]], self:GetWidth()+40, self:GetHeight()+20, \"background\", {0, 400/512, 0, 170/256})\n    backGroundFlashTexture:SetBlendMode (\"ADD\")\n    backGroundFlashTexture:SetPoint (\"center\", self, \"center\")\n    backGroundFlashTexture:SetVertexColor(Plater:ParseColors(scriptTable.config.flashColor))\n    backGroundFlashTexture:Hide()\n    \n    --create the animation hub to hold the flash animation sequence\n    envTable.BackgroundFlash = envTable.BackgroundFlash or Plater:CreateAnimationHub (backGroundFlashTexture, \n        function()\n            backGroundFlashTexture:Show()\n        end,\n        function()\n            backGroundFlashTexture:Hide()\n        end\n    )\n    \n    --create the flash animation sequence\n    local fadeIn = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 1, scriptTable.config.flashDuration/2, 0, 1)\n    local fadeOut = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 2, scriptTable.config.flashDuration/2, 1, 0)\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, scriptTable.config.shakeDuration, scriptTable.config.shakeAmplitude, scriptTable.config.shakeFrequency, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))\n    \n    --update the config for the flash here so it wont need a /reload\n    fadeIn:SetDuration (scriptTable.config.flashDuration/2)\n    fadeOut:SetDuration (scriptTable.config.flashDuration/2)\n    \n    --update the config for the skake here so it wont need a /reload\n    envTable.FrameShake.OriginalAmplitude = scriptTable.config.shakeAmplitude\n    envTable.FrameShake.OriginalDuration = scriptTable.config.shakeDuration\n    envTable.FrameShake.OriginalFrequency = scriptTable.config.shakeFrequency\nend",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    Plater.StopDotAnimation(unitFrame.castBar, envTable.dotAnimation)    \n    \n    envTable.BackgroundFlash:Stop()\n    \n    unitFrame:StopFrameShake (envTable.FrameShake)    \n    \nend\n\n\n",
					["OptionsValues"] = {
					},
					["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.dotAnimation = Plater.PlayDotAnimation(unitFrame.castBar, 5, scriptTable.config.dotColor, scriptTable.config.xOffset, scriptTable.config.yOffset)\n    \n    \n    envTable.BackgroundFlash:Play()\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    unitFrame:PlayFrameShake (envTable.FrameShake)\n    \n    if (envTable._CanInterrupt) then\n        if (scriptTable.config.useCastbarColor) then\n            self:SetStatusBarColor (Plater:ParseColors (scriptTable.config.castBarColor))\n        end\n    end\n    \nend\n\n\n",
					["ScriptType"] = 2,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \nend\n\n\n",
					["Time"] = 1613183759,
					["NpcNames"] = {
					},
					["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --create a texture to use for a flash behind the cast bar\n    local backGroundFlashTexture = Plater:CreateImage (self, [[Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Alert-Glow]], self:GetWidth()+40, self:GetHeight()+20, \"background\", {0, 400/512, 0, 170/256})\n    backGroundFlashTexture:SetBlendMode (\"ADD\")\n    backGroundFlashTexture:SetPoint (\"center\", self, \"center\")\n    backGroundFlashTexture:SetVertexColor(Plater:ParseColors(scriptTable.config.flashColor))\n    backGroundFlashTexture:Hide()\n    \n    --create the animation hub to hold the flash animation sequence\n    envTable.BackgroundFlash = envTable.BackgroundFlash or Plater:CreateAnimationHub (backGroundFlashTexture, \n        function()\n            backGroundFlashTexture:Show()\n        end,\n        function()\n            backGroundFlashTexture:Hide()\n        end\n    )\n    \n    --create the flash animation sequence\n    local fadeIn = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 1, scriptTable.config.flashDuration/2, 0, 1)\n    local fadeOut = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 2, scriptTable.config.flashDuration/2, 1, 0)\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, scriptTable.config.shakeDuration, scriptTable.config.shakeAmplitude, scriptTable.config.shakeFrequency, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))\n    \n    --update the config for the flash here so it wont need a /reload\n    fadeIn:SetDuration (scriptTable.config.flashDuration/2)\n    fadeOut:SetDuration (scriptTable.config.flashDuration/2)\n    \n    --update the config for the skake here so it wont need a /reload\n    envTable.FrameShake.OriginalAmplitude = scriptTable.config.shakeAmplitude\n    envTable.FrameShake.OriginalDuration = scriptTable.config.shakeDuration\n    envTable.FrameShake.OriginalFrequency = scriptTable.config.shakeFrequency\nend",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar_darkorange",
					["Options"] = {
						{
							["Type"] = 6,
							["Key"] = "option1",
							["Value"] = 0,
							["Name"] = "Option 1",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [1]
						{
							["Type"] = 5,
							["Key"] = "option2",
							["Value"] = "Plays a big animation when the cast start.",
							["Name"] = "Option 2",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [2]
						{
							["Type"] = 5,
							["Key"] = "option2",
							["Value"] = "Enter the spell name or spellID of the Spell in the Add Trigger box and hit \"Add\".",
							["Name"] = "Option 2",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [3]
						{
							["Type"] = 6,
							["Key"] = "option4",
							["Value"] = 0,
							["Name"] = "Option 4",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [4]
						{
							["Type"] = 5,
							["Key"] = "option2",
							["Value"] = "Flash:",
							["Name"] = "Flash",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [5]
						{
							["Type"] = 2,
							["Max"] = 1.2,
							["Desc"] = "How long is the flash played when the cast starts.",
							["Min"] = 0.1,
							["Key"] = "flashDuration",
							["Value"] = 0.8,
							["Name"] = "Flash Duration",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = true,
						}, -- [6]
						{
							["Type"] = 1,
							["Key"] = "flashColor",
							["Value"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["Name"] = "Flash Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "Color of the Flash",
						}, -- [7]
						{
							["Type"] = 6,
							["Key"] = "option7",
							["Value"] = 0,
							["Name"] = "Option 7",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [8]
						{
							["Type"] = 5,
							["Key"] = "option2",
							["Value"] = "Shake:",
							["Name"] = "Shake",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [9]
						{
							["Type"] = 2,
							["Max"] = 0.5,
							["Desc"] = "When the cast starts, there's a small shake in the nameplate, this settings controls how long it takes.",
							["Min"] = 0.1,
							["Key"] = "shakeDuration",
							["Value"] = 0.2,
							["Name"] = "Shake Duration",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = true,
						}, -- [10]
						{
							["Type"] = 2,
							["Max"] = 10,
							["Desc"] = "How strong is the shake.",
							["Min"] = 1,
							["Key"] = "shakeAmplitude",
							["Value"] = 5,
							["Name"] = "Shake Amplitude",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [11]
						{
							["Type"] = 2,
							["Max"] = 80,
							["Desc"] = "How fast the shake moves.",
							["Min"] = 1,
							["Key"] = "shakeFrequency",
							["Value"] = 40,
							["Name"] = "Shake Frequency",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [12]
						{
							["Type"] = 6,
							["Key"] = "option13",
							["Value"] = 0,
							["Name"] = "Option 13",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [13]
						{
							["Type"] = 5,
							["Key"] = "option14",
							["Value"] = "Dot Animation:",
							["Name"] = "Dot Animation",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [14]
						{
							["Type"] = 1,
							["Key"] = "dotColor",
							["Value"] = {
								0.56470588235294, -- [1]
								0.56470588235294, -- [2]
								0.56470588235294, -- [3]
								1, -- [4]
							},
							["Name"] = "Dot Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "Adjust the color of the dots around the nameplate",
						}, -- [15]
						{
							["Type"] = 2,
							["Max"] = 20,
							["Desc"] = "Adjust the width of the dots to better fit in your nameplate.",
							["Min"] = -10,
							["Key"] = "xOffset",
							["Value"] = 8,
							["Name"] = "Dot X Offset",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [16]
						{
							["Type"] = 2,
							["Max"] = 10,
							["Desc"] = "Adjust the height of the dots to better fit in your nameplate.",
							["Min"] = -10,
							["Key"] = "yOffset",
							["Value"] = 3,
							["Name"] = "Dot Y Offset",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [17]
						{
							["Type"] = 6,
							["Key"] = "option18",
							["Value"] = 0,
							["Name"] = "blank",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [18]
						{
							["Type"] = 6,
							["Key"] = "option18",
							["Value"] = 0,
							["Name"] = "blank",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [19]
						{
							["Type"] = 6,
							["Key"] = "option18",
							["Value"] = 0,
							["Name"] = "blank",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [20]
						{
							["Type"] = 6,
							["Key"] = "option18",
							["Value"] = 0,
							["Name"] = "blank",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [21]
						{
							["Type"] = 6,
							["Key"] = "option18",
							["Value"] = 0,
							["Name"] = "blank",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [22]
						{
							["Type"] = 6,
							["Key"] = "option18",
							["Value"] = 0,
							["Name"] = "blank",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [23]
						{
							["Type"] = 5,
							["Key"] = "option19",
							["Value"] = "Cast Bar",
							["Name"] = "Option 19",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [24]
						{
							["Type"] = 4,
							["Key"] = "useCastbarColor",
							["Value"] = true,
							["Name"] = "Use Cast Bar Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "Use cast bar color.",
						}, -- [25]
						{
							["Type"] = 1,
							["Key"] = "castBarColor",
							["Value"] = {
								0.41176470588235, -- [1]
								1, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Name"] = "Cast Bar Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "Cast bar color.",
						}, -- [26]
					},
					["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    Plater.StopDotAnimation(unitFrame.castBar, envTable.dotAnimation)    \n    \n    envTable.BackgroundFlash:Stop()\n    \n    unitFrame:StopFrameShake (envTable.FrameShake)    \n    \nend\n\n\n",
					["Revision"] = 754,
					["semver"] = "",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.dotAnimation = Plater.PlayDotAnimation(unitFrame.castBar, 5, scriptTable.config.dotColor, scriptTable.config.xOffset, scriptTable.config.yOffset)\n    \n    \n    envTable.BackgroundFlash:Play()\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    unitFrame:PlayFrameShake (envTable.FrameShake)\n    \n    if (envTable._CanInterrupt) then\n        if (scriptTable.config.useCastbarColor) then\n            self:SetStatusBarColor (Plater:ParseColors (scriptTable.config.castBarColor))\n        end\n    end\n    \nend\n\n\n",
					["Prio"] = 99,
					["Author"] = "Bombad�o-Azralon",
					["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["Desc"] = "Highlight a very important cast applying several effects into the Cast Bar. Add spell in the Add Trigger field.",
					["version"] = -1,
					["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \nend\n\n\n",
					["SpellIds"] = {
						321349, -- [1]
						334967, -- [2]
						333875, -- [3]
						331927, -- [4]
						321764, -- [5]
						332156, -- [6]
						332084, -- [7]
						320141, -- [8]
						332706, -- [9]
						332605, -- [10]
						332612, -- [11]
						322736, -- [12]
						336449, -- [13]
						328016, -- [14]
						328015, -- [15]
						327995, -- [16]
						321935, -- [17]
						320576, -- [18]
						328475, -- [19]
						330786, -- [20]
						325876, -- [21]
						326450, -- [22]
						325701, -- [23]
						322711, -- [24]
						324044, -- [25]
						326607, -- [26]
						328206, -- [27]
						323393, -- [28]
						300155, -- [29]
						322938, -- [30]
						331743, -- [31]
						324776, -- [32]
						324914, -- [33]
						326046, -- [34]
						340544, -- [35]
						322450, -- [36]
						321019, -- [37]
						319654, -- [38]
						326836, -- [39]
						322433, -- [40]
						334324, -- [41]
						322554, -- [42]
						317936, -- [43]
						327416, -- [44]
						327648, -- [45]
						328295, -- [46]
						328331, -- [47]
						323190, -- [48]
						320637, -- [49]
						321807, -- [50]
						335141, -- [51]
						324293, -- [52]
						335143, -- [53]
						320822, -- [54]
						327130, -- [55]
						338353, -- [56]
						341902, -- [57]
						342139, -- [58]
						342135, -- [59]
						330562, -- [60]
						330586, -- [61]
						330868, -- [62]
						333299, -- [63]
						338690, -- [64]
					},
					["PlaterCore"] = 1,
					["Name"] = "Cast - Very Important [Plater]",
					["Enabled"] = true,
					["url"] = "",
					["Temp_Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
				}, -- [4]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --creates a glow around the icon\n    envTable.buffIconGlow = envTable.buffIconGlow or Plater.CreateIconGlow (self, scriptTable.config.glowColor)\n    \nend\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (scriptTable.config.glowEnabled) then\n        envTable.buffIconGlow:Hide()\n    end\n    \n    if (scriptTable.config.dotsEnabled) then\n        Plater.StopDotAnimation(self, envTable.dotAnimation)\n    end\n    \n    \nend\n\n\n",
					["OptionsValues"] = {
					},
					["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    if (scriptTable.config.glowEnabled) then\n        envTable.buffIconGlow:Show()\n    end\n    \n    if (scriptTable.config.dotsEnabled) then\n        envTable.dotAnimation = Plater.PlayDotAnimation(self, 6, scriptTable.config.dotsColor, 6, 3) \n    end\nend\n\n\n",
					["ScriptType"] = 1,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["Time"] = 1613183777,
					["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --creates a glow around the icon\n    envTable.buffIconGlow = envTable.buffIconGlow or Plater.CreateIconGlow (self, scriptTable.config.glowColor)\n    \nend\n\n\n",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura",
					["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (scriptTable.config.glowEnabled) then\n        envTable.buffIconGlow:Hide()\n    end\n    \n    if (scriptTable.config.dotsEnabled) then\n        Plater.StopDotAnimation(self, envTable.dotAnimation)\n    end\n    \n    \nend\n\n\n",
					["Revision"] = 352,
					["semver"] = "",
					["NpcNames"] = {
					},
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    if (scriptTable.config.glowEnabled) then\n        envTable.buffIconGlow:Show()\n    end\n    \n    if (scriptTable.config.dotsEnabled) then\n        envTable.dotAnimation = Plater.PlayDotAnimation(self, 6, scriptTable.config.dotsColor, 6, 3) \n    end\nend\n\n\n",
					["Author"] = "Tercioo-Sylvanas",
					["SpellIds"] = {
						337220, -- [1]
						337253, -- [2]
						337251, -- [3]
					},
					["Desc"] = "Add the debuff name in the trigger box.",
					["version"] = -1,
					["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["Name"] = "Aura - Debuff Alert [Plater]",
					["PlaterCore"] = 1,
					["Prio"] = 99,
					["Options"] = {
						{
							["Type"] = 6,
							["Key"] = "option1",
							["Value"] = 0,
							["Name"] = "Blank Space",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [1]
						{
							["Type"] = 5,
							["Key"] = "option2",
							["Value"] = "Enter the spell name or spellID of the Buff in the Add Trigger box and hit \"Add\".",
							["Name"] = "Option 2",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [2]
						{
							["Type"] = 6,
							["Key"] = "option3",
							["Value"] = 0,
							["Name"] = "Blank Space",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [3]
						{
							["Type"] = 4,
							["Key"] = "glowEnabled",
							["Value"] = false,
							["Name"] = "Glow Enabled",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "",
						}, -- [4]
						{
							["Type"] = 1,
							["Key"] = "glowColor",
							["Value"] = {
								0.40392156862745, -- [1]
								0.003921568627451, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Name"] = "Glow Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "",
						}, -- [5]
						{
							["Type"] = 6,
							["Key"] = "option3",
							["Value"] = 0,
							["Name"] = "Blank Space",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [6]
						{
							["Type"] = 4,
							["Key"] = "dotsEnabled",
							["Value"] = true,
							["Name"] = "Dots Enabled",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "",
						}, -- [7]
						{
							["Type"] = 1,
							["Key"] = "dotsColor",
							["Value"] = {
								1, -- [1]
								0.32156862745098, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Name"] = "Dots Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "",
						}, -- [8]
					},
					["Enabled"] = true,
					["url"] = "",
				}, -- [5]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.movingArrow = envTable.movingArrow or Plater:CreateImage (self, [[Interface\\PETBATTLES\\PetBattle-StatIcons]], 16, self:GetHeight(), \"background\", {0, 15/32, 18/32, 30/32})\n    \n    --envTable.movingArrow.color = scriptTable.config.arrowColor\n    envTable.movingArrow:SetAlpha (scriptTable.config.arrowAlpha)\n    envTable.movingArrow:SetDesaturated (scriptTable.config.desaturateArrow)\n    \n    envTable.movingAnimation = envTable.movingAnimation or Plater:CreateAnimationHub (envTable.movingArrow, \n        function() \n            envTable.movingArrow:Show() \n            envTable.movingArrow:SetPoint(\"left\", 0, 0)\n        end, \n        function() envTable.movingArrow:Hide() end)\n    \n    envTable.movingAnimation:SetLooping (\"REPEAT\")\n    \n    envTable.arrowAnimation = envTable.arrowAnimation or Plater:CreateAnimation (envTable.movingAnimation, \"translation\", 1, 0.20, self:GetWidth()-16, 0)\n    \n    envTable.arrowAnimation:SetDuration(scriptTable.config.animSpeed)\nend\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    envTable.movingAnimation:Stop()\nend\n\n\n",
					["OptionsValues"] = {
					},
					["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    envTable.movingAnimation:Play()\nend\n\n\n",
					["ScriptType"] = 2,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \nend",
					["Time"] = 1613183774,
					["NpcNames"] = {
					},
					["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.movingArrow = envTable.movingArrow or Plater:CreateImage (self, [[Interface\\PETBATTLES\\PetBattle-StatIcons]], 16, self:GetHeight(), \"background\", {0, 15/32, 18/32, 30/32})\n    \n    --envTable.movingArrow.color = scriptTable.config.arrowColor\n    envTable.movingArrow:SetAlpha (scriptTable.config.arrowAlpha)\n    envTable.movingArrow:SetDesaturated (scriptTable.config.desaturateArrow)\n    \n    envTable.movingAnimation = envTable.movingAnimation or Plater:CreateAnimationHub (envTable.movingArrow, \n        function() \n            envTable.movingArrow:Show() \n            envTable.movingArrow:SetPoint(\"left\", 0, 0)\n        end, \n        function() envTable.movingArrow:Hide() end)\n    \n    envTable.movingAnimation:SetLooping (\"REPEAT\")\n    \n    envTable.arrowAnimation = envTable.arrowAnimation or Plater:CreateAnimation (envTable.movingAnimation, \"translation\", 1, 0.20, self:GetWidth()-16, 0)\n    \n    envTable.arrowAnimation:SetDuration(scriptTable.config.animSpeed)\nend\n\n\n\n\n",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar_frontal",
					["Options"] = {
						{
							["Type"] = 6,
							["Key"] = "option1",
							["Value"] = 0,
							["Name"] = "Option 1",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [1]
						{
							["Type"] = 5,
							["Key"] = "option2",
							["Value"] = "Produces an effect to indicate the spell will hit players in front of the enemy.",
							["Name"] = "Option 2",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [2]
						{
							["Type"] = 5,
							["Key"] = "option4",
							["Value"] = "Enter the spell name or spellID of the Spell in the Add Trigger box and hit \"Add\".",
							["Name"] = "Option 4",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [3]
						{
							["Type"] = 6,
							["Key"] = "option3",
							["Value"] = 0,
							["Name"] = "Option 3",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [4]
						{
							["Type"] = 2,
							["Max"] = 1,
							["Desc"] = "Set the alpha of the moving arrow",
							["Min"] = 0,
							["Key"] = "arrowAlpha",
							["Value"] = 0.275,
							["Name"] = "Arrow Alpha",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = true,
						}, -- [5]
						{
							["Type"] = 2,
							["Max"] = 1,
							["Desc"] = "Time that takes for an arrow to travel from the to right.",
							["Min"] = 0,
							["Key"] = "animSpeed",
							["Value"] = 0.2,
							["Name"] = "Animation Speed",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = true,
						}, -- [6]
						{
							["Type"] = 4,
							["Key"] = "desaturateArrow",
							["Value"] = false,
							["Name"] = "Use White Arrow",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "If enabled, the arrow color will be desaturated.",
						}, -- [7]
					},
					["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    envTable.movingAnimation:Stop()\nend\n\n\n",
					["Revision"] = 507,
					["semver"] = "",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    envTable.movingAnimation:Play()\nend\n\n\n",
					["Prio"] = 99,
					["Author"] = "Izimode-Azralon",
					["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["Desc"] = "Does an animation for casts that affect the frontal area of the enemy. Add spell in the Add Trigger field.",
					["version"] = -1,
					["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \nend",
					["SpellIds"] = {
						334051, -- [1]
						333729, -- [2]
						330403, -- [3]
						327233, -- [4]
						324667, -- [5]
						318949, -- [6]
						328395, -- [7]
						325523, -- [8]
						346866, -- [9]
						325797, -- [10]
						322936, -- [11]
						326997, -- [12]
						321968, -- [13]
						323137, -- [14]
						340160, -- [15]
						320991, -- [16]
						322429, -- [17]
						334329, -- [18]
						317943, -- [19]
						320966, -- [20]
						324368, -- [21]
						323786, -- [22]
						324205, -- [23]
						323943, -- [24]
						320596, -- [25]
						324323, -- [26]
						333488, -- [27]
						323608, -- [28]
						317231, -- [29]
						320729, -- [30]
						330614, -- [31]
						333294, -- [32]
					},
					["PlaterCore"] = 1,
					["Name"] = "Cast - Frontal Cone [Plater]",
					["Enabled"] = true,
					["url"] = "",
					["Temp_Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
				}, -- [6]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.FixateTarget = Plater:CreateLabel (unitFrame);\n    envTable.FixateTarget:SetPoint (\"bottom\", unitFrame.BuffFrame, \"top\", 0, 10);    \n    \n    envTable.FixateIcon = Plater:CreateImage (unitFrame, 236188, 16, 16, \"overlay\");\n    envTable.FixateIcon:SetPoint (\"bottom\", envTable.FixateTarget, \"top\", 0, 4);    \n    \n    envTable.FixateTarget:Hide()\n    envTable.FixateIcon:Hide()\nend\n\n--165560 = Gormling Larva - MTS\n\n\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:Hide()\n    envTable.FixateIcon:Hide()\nend\n\n\n",
					["OptionsValues"] = {
					},
					["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["ScriptType"] = 3,
					["Temp_Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n\n\n\n\n",
					["Time"] = 1613183789,
					["Icon"] = 1029718,
					["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.FixateTarget = Plater:CreateLabel (unitFrame);\n    envTable.FixateTarget:SetPoint (\"bottom\", unitFrame.BuffFrame, \"top\", 0, 10);    \n    \n    envTable.FixateIcon = Plater:CreateImage (unitFrame, 236188, 16, 16, \"overlay\");\n    envTable.FixateIcon:SetPoint (\"bottom\", envTable.FixateTarget, \"top\", 0, 4);    \n    \n    envTable.FixateTarget:Hide()\n    envTable.FixateIcon:Hide()\nend\n\n--165560 = Gormling Larva - MTS\n\n\n\n\n\n\n",
					["NpcNames"] = {
						"165560", -- [1]
					},
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:Hide()\n    envTable.FixateIcon:Hide()\nend\n\n\n",
					["Revision"] = 270,
					["Options"] = {
					},
					["SpellIds"] = {
					},
					["Prio"] = 99,
					["Author"] = "Celian-Sylvanas",
					["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n\n\n\n\n",
					["Desc"] = "Show above the nameplate who is the player fixated",
					["Name"] = "Fixate [Plater]",
					["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    local targetName = UnitName (unitId .. \"target\");\n    if (targetName) then\n        local _, class = UnitClass (unitId .. \"target\");\n        targetName = Plater.SetTextColorByClass (unitId .. \"target\", targetName);\n        envTable.FixateTarget.text = targetName;\n        \n        envTable.FixateTarget:Show();\n        envTable.FixateIcon:Show();\n    end    \nend\n\n\n",
					["version"] = -1,
					["PlaterCore"] = 1,
					["semver"] = "",
					["Enabled"] = true,
					["url"] = "",
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    local targetName = UnitName (unitId .. \"target\");\n    if (targetName) then\n        local _, class = UnitClass (unitId .. \"target\");\n        targetName = Plater.SetTextColorByClass (unitId .. \"target\", targetName);\n        envTable.FixateTarget.text = targetName;\n        \n        envTable.FixateTarget:Show();\n        envTable.FixateIcon:Show();\n    end    \nend\n\n\n",
				}, -- [7]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount = Plater:CreateLabel (unitFrame, \"\", 16, \"silver\");\n    envTable.EnergyAmount:SetPoint (\"bottom\", unitFrame, \"top\", 0, 18);\nend\n\n--[=[\n\n\n--]=]",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount:Hide()\nend\n\n\n",
					["OptionsValues"] = {
					},
					["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount:Show()\nend\n\n\n",
					["ScriptType"] = 3,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount.text = \"\" .. UnitPower (unitId);\nend\n\n\n",
					["Time"] = 1600015596,
					["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount = Plater:CreateLabel (unitFrame, \"\", 16, \"silver\");\n    envTable.EnergyAmount:SetPoint (\"bottom\", unitFrame, \"top\", 0, 18);\nend\n\n--[=[\n\n\n--]=]",
					["Icon"] = 136048,
					["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount:Hide()\nend\n\n\n",
					["Revision"] = 138,
					["Options"] = {
					},
					["Author"] = "Celian-Sylvanas",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount:Show()\nend\n\n\n",
					["NpcNames"] = {
						"Guardian of Yogg-Saron", -- [1]
					},
					["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount.text = \"\" .. UnitPower (unitId);\nend\n\n\n",
					["Name"] = "UnitPower [Plater]",
					["PlaterCore"] = 1,
					["Desc"] = "Show the energy amount above the nameplate",
					["SpellIds"] = {
					},
					["Prio"] = 99,
					["Enabled"] = true,
				}, -- [8]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --settings (you may need /reload if some configs isn't applied immediately)    \n    --change the nameplate color to this if allowed\n    envTable.CanChangeNameplateColor = scriptTable.config.changeNameplateColor --\n    envTable.NameplateColor = scriptTable.config.nameplateColor\n    envTable.NameplateSizeOffset = scriptTable.config.nameplateSizeOffset --\n    \n    unitFrame.UnitImportantSkullTexture = unitFrame.UnitImportantSkullTexture or unitFrame:CreateTexture(nil, \"background\")\n    \n    unitFrame.UnitImportantSkullTexture:SetTexture([[Interface/AddOns/Plater/media/skullbones_128]])\n    unitFrame.UnitImportantSkullTexture:SetPoint(\"center\", unitFrame.healthBar, \"center\", 0, -5)\n    \n    unitFrame.UnitImportantSkullTexture:SetVertexColor(Plater:ParseColors(scriptTable.config.skullColor))\n    unitFrame.UnitImportantSkullTexture:SetAlpha(scriptTable.config.skullAlpha)\n    unitFrame.UnitImportantSkullTexture:SetScale(scriptTable.config.skullScale)\n    \n    unitFrame.UnitImportantSkullTexture:Hide()\nend\n\n--[=[\n\n154564 - debug\n\nUsing spellIDs for multi-language support\n\n164362 - smily morsel - plaguefall\n168882 - fleeting manifestation - sanguine depths\n170234 - oppressive banner - theater of pain\n168988 - overgrowth - Mists of Tirna Scithe\n170452 - essesnce orb - torghast\n\n\n--]=]",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    Plater.StopDotAnimation(unitFrame.healthBar, envTable.dotAnimation)   \n    \n    --restore the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)    \n    \n    unitFrame.UnitImportantSkullTexture:Hide()\nend\n\n\n",
					["OptionsValues"] = {
					},
					["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    if (envTable.dotAnimation) then\n        Plater.StopDotAnimation(unitFrame.healthBar, envTable.dotAnimation)\n    end\n    \n    envTable.dotAnimation = Plater.PlayDotAnimation(unitFrame.healthBar, 2, scriptTable.config.dotsColor, 3, 4) \n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \n    unitFrame.UnitImportantSkullTexture:Show()\nend\n\n\n\n\n",
					["ScriptType"] = 3,
					["Temp_Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["Time"] = 1613183890,
					["Icon"] = "Interface\\AddOns\\Plater\\media\\skullbones_64",
					["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --settings (you may need /reload if some configs isn't applied immediately)    \n    --change the nameplate color to this if allowed\n    envTable.CanChangeNameplateColor = scriptTable.config.changeNameplateColor --\n    envTable.NameplateColor = scriptTable.config.nameplateColor\n    envTable.NameplateSizeOffset = scriptTable.config.nameplateSizeOffset --\n    \n    unitFrame.UnitImportantSkullTexture = unitFrame.UnitImportantSkullTexture or unitFrame:CreateTexture(nil, \"background\")\n    \n    unitFrame.UnitImportantSkullTexture:SetTexture([[Interface/AddOns/Plater/media/skullbones_128]])\n    unitFrame.UnitImportantSkullTexture:SetPoint(\"center\", unitFrame.healthBar, \"center\", 0, -5)\n    \n    unitFrame.UnitImportantSkullTexture:SetVertexColor(Plater:ParseColors(scriptTable.config.skullColor))\n    unitFrame.UnitImportantSkullTexture:SetAlpha(scriptTable.config.skullAlpha)\n    unitFrame.UnitImportantSkullTexture:SetScale(scriptTable.config.skullScale)\n    \n    unitFrame.UnitImportantSkullTexture:Hide()\nend\n\n--[=[\n\n154564 - debug\n\nUsing spellIDs for multi-language support\n\n164362 - smily morsel - plaguefall\n168882 - fleeting manifestation - sanguine depths\n170234 - oppressive banner - theater of pain\n168988 - overgrowth - Mists of Tirna Scithe\n170452 - essesnce orb - torghast\n\n\n--]=]",
					["NpcNames"] = {
						"164362", -- [1]
						"168882", -- [2]
						"168988", -- [3]
						"170234", -- [4]
						"165905", -- [5]
						"170452", -- [6]
					},
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    if (envTable.dotAnimation) then\n        Plater.StopDotAnimation(unitFrame.healthBar, envTable.dotAnimation)\n    end\n    \n    envTable.dotAnimation = Plater.PlayDotAnimation(unitFrame.healthBar, 2, scriptTable.config.dotsColor, 3, 4) \n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \n    unitFrame.UnitImportantSkullTexture:Show()\nend\n\n\n\n\n",
					["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    Plater.StopDotAnimation(unitFrame.healthBar, envTable.dotAnimation)   \n    \n    --restore the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)    \n    \n    unitFrame.UnitImportantSkullTexture:Hide()\nend\n\n\n",
					["Revision"] = 357,
					["Options"] = {
						{
							["Type"] = 6,
							["Key"] = "option4",
							["Value"] = 0,
							["Name"] = "Blank Space",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [1]
						{
							["Type"] = 5,
							["Key"] = "option6",
							["Value"] = "Enter the npc name or npcId in the \"Add Trigger\" box and hit \"Add\".",
							["Name"] = "Option 6",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [2]
						{
							["Type"] = 6,
							["Key"] = "option4",
							["Value"] = 0,
							["Name"] = "Blank Space",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [3]
						{
							["Type"] = 4,
							["Key"] = "changeNameplateColor",
							["Value"] = true,
							["Name"] = "Change Nameplate Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "change to true to change the color",
						}, -- [4]
						{
							["Type"] = 1,
							["Key"] = "nameplateColor",
							["Value"] = {
								1, -- [1]
								0, -- [2]
								0.52549019607843, -- [3]
								1, -- [4]
							},
							["Name"] = "Nameplate Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "",
						}, -- [5]
						{
							["Type"] = 2,
							["Max"] = 6,
							["Desc"] = "increase the nameplate height by this value",
							["Min"] = 0,
							["Key"] = "nameplateSizeOffset",
							["Value"] = 3,
							["Name"] = "Nameplate Size Offset",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [6]
						{
							["Type"] = 6,
							["Key"] = "option4",
							["Value"] = 0,
							["Name"] = "Blank Space",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [7]
						{
							["Type"] = 1,
							["Key"] = "dotsColor",
							["Value"] = {
								1, -- [1]
								0.71372549019608, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Name"] = "Dot Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "",
						}, -- [8]
						{
							["Type"] = 6,
							["Key"] = "option4",
							["Value"] = 0,
							["Name"] = "Blank Space",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [9]
						{
							["Type"] = 5,
							["Key"] = "option10",
							["Value"] = "Skull Texture",
							["Name"] = "Skull Texture",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [10]
						{
							["Type"] = 1,
							["Key"] = "skullColor",
							["Value"] = {
								1, -- [1]
								0.46274509803922, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Name"] = "Skull Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "",
						}, -- [11]
						{
							["Type"] = 2,
							["Max"] = 1,
							["Desc"] = "",
							["Min"] = 0,
							["Key"] = "skullAlpha",
							["Value"] = 0.2,
							["Name"] = "Alpha",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = true,
						}, -- [12]
						{
							["Type"] = 2,
							["Max"] = 2,
							["Desc"] = "",
							["Min"] = 0.4,
							["Key"] = "skullScale",
							["Value"] = 0.6,
							["Name"] = "Scale",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = true,
						}, -- [13]
					},
					["SpellIds"] = {
					},
					["Prio"] = 99,
					["Author"] = "Izimode-Azralon",
					["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["Desc"] = "Highlight a nameplate of an important Add. Add the unit name or NpcID into the trigger box to add more.",
					["Name"] = "Unit - Important [Plater]",
					["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if can change the nameplate color\n    if (envTable.CanChangeNameplateColor) then\n        Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n    end\n    \nend\n\n\n\n\n",
					["version"] = -1,
					["PlaterCore"] = 1,
					["semver"] = "",
					["Enabled"] = true,
					["url"] = "",
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if can change the nameplate color\n    if (envTable.CanChangeNameplateColor) then\n        Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n    end\n    \nend\n\n\n\n\n",
				}, -- [9]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --castbar color (when can be interrupted)\n    envTable.CastbarColor = scriptTable.config.castbarColor\n    \n    --flash duration\n    local CONFIG_BACKGROUND_FLASH_DURATION = scriptTable.config.flashDuration\n    \n    --add this value to the cast bar height\n    envTable.CastBarHeightAdd = scriptTable.config.castBarHeight\n    \n    --create a fast flash above the cast bar\n    envTable.FullBarFlash = envTable.FullBarFlash or Plater.CreateFlash (self, 0.05, 1, \"white\")\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, scriptTable.config.shakeDuration, scriptTable.config.shakeAmplitude, scriptTable.config.shakeFrequency, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))\n    \n    --create a texture to use for a flash behind the cast bar\n    local backGroundFlashTexture = Plater:CreateImage (self, [[Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Alert-Glow]], self:GetWidth()+60, self:GetHeight()+50, \"background\", {0, 400/512, 0, 170/256})\n    backGroundFlashTexture:SetBlendMode (\"ADD\")\n    backGroundFlashTexture:SetPoint (\"center\", self, \"center\")\n    backGroundFlashTexture:Hide()\n    \n    --create the animation hub to hold the flash animation sequence\n    envTable.BackgroundFlash = envTable.BackgroundFlash or Plater:CreateAnimationHub (backGroundFlashTexture, \n        function()\n            backGroundFlashTexture:Show()\n        end,\n        function()\n            backGroundFlashTexture:Hide()\n        end\n    )\n    \n    --create the flash animation sequence\n    envTable.BackgroundFlash.fadeIn = envTable.BackgroundFlash.fadeIn or Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 1, CONFIG_BACKGROUND_FLASH_DURATION/2, 0, .75)\n    envTable.BackgroundFlash.fadeIn:SetDuration(CONFIG_BACKGROUND_FLASH_DURATION/2)\n    \n    envTable.BackgroundFlash.fadeOut = envTable.BackgroundFlash.fadeOut or Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 2, CONFIG_BACKGROUND_FLASH_DURATION/2, 1, 0)    \n    envTable.BackgroundFlash.fadeOut:SetDuration(CONFIG_BACKGROUND_FLASH_DURATION/2)\n    \n    --envTable.BackgroundFlash:Play() --envTable.BackgroundFlash:Stop()    \n    \n    \n    \n    \n    \nend\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\" or Plater.ZoneInstanceType == \"none\") then\n        return\n    end    \n    \n    unitFrame.castBar:SetHeight (envTable._DefaultHeight)\n    \n    --stop the camera shake\n    unitFrame:StopFrameShake (envTable.FrameShake)\n    \n    envTable.FullBarFlash:Stop()\n    envTable.BackgroundFlash:Stop()\n    \n    unitFrame.castBar.Spark:SetHeight(unitFrame.castBar:GetHeight())\n    \nend\n\n\n\n\n\n",
					["OptionsValues"] = {
					},
					["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\" or Plater.ZoneInstanceType == \"none\") then\n        return\n    end\n    \n    --play flash animations\n    envTable.FullBarFlash:Play()\n    \n    --envTable.currentHeight = unitFrame.castBar:GetHeight()\n    \n    --restoring the default size (not required since it already restore in the hide script)\n    if (envTable.OriginalHeight) then\n        self:SetHeight (envTable.OriginalHeight)\n    end\n    \n    --increase the cast bar size\n    local height = self:GetHeight()\n    envTable.OriginalHeight = height\n    \n    self:SetHeight (height + envTable.CastBarHeightAdd)\n    \n    Plater.SetCastBarBorderColor (self, 1, .2, .2, 0.4)\n    \n    unitFrame:PlayFrameShake (envTable.FrameShake)\n    \n    --set the color of the cast bar to dark orange (only if can be interrupted)\n    --Plater auto set this color to default when a new cast starts, no need to reset this value at OnHide.    \n    if (envTable._CanInterrupt) then\n        if (scriptTable.config.useCastbarColor) then\n            self:SetStatusBarColor (Plater:ParseColors (envTable.CastbarColor))\n        end\n    end\n    \n    envTable.BackgroundFlash:Play()\n    \n    unitFrame.castBar.Spark:SetHeight(unitFrame.castBar:GetHeight())\n    \nend\n\n\n\n\n\n\n\n\n",
					["ScriptType"] = 2,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \nend\n\n\n",
					["Time"] = 1613183776,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar_orange",
					["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --castbar color (when can be interrupted)\n    envTable.CastbarColor = scriptTable.config.castbarColor\n    \n    --flash duration\n    local CONFIG_BACKGROUND_FLASH_DURATION = scriptTable.config.flashDuration\n    \n    --add this value to the cast bar height\n    envTable.CastBarHeightAdd = scriptTable.config.castBarHeight\n    \n    --create a fast flash above the cast bar\n    envTable.FullBarFlash = envTable.FullBarFlash or Plater.CreateFlash (self, 0.05, 1, \"white\")\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, scriptTable.config.shakeDuration, scriptTable.config.shakeAmplitude, scriptTable.config.shakeFrequency, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))\n    \n    --create a texture to use for a flash behind the cast bar\n    local backGroundFlashTexture = Plater:CreateImage (self, [[Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Alert-Glow]], self:GetWidth()+60, self:GetHeight()+50, \"background\", {0, 400/512, 0, 170/256})\n    backGroundFlashTexture:SetBlendMode (\"ADD\")\n    backGroundFlashTexture:SetPoint (\"center\", self, \"center\")\n    backGroundFlashTexture:Hide()\n    \n    --create the animation hub to hold the flash animation sequence\n    envTable.BackgroundFlash = envTable.BackgroundFlash or Plater:CreateAnimationHub (backGroundFlashTexture, \n        function()\n            backGroundFlashTexture:Show()\n        end,\n        function()\n            backGroundFlashTexture:Hide()\n        end\n    )\n    \n    --create the flash animation sequence\n    envTable.BackgroundFlash.fadeIn = envTable.BackgroundFlash.fadeIn or Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 1, CONFIG_BACKGROUND_FLASH_DURATION/2, 0, .75)\n    envTable.BackgroundFlash.fadeIn:SetDuration(CONFIG_BACKGROUND_FLASH_DURATION/2)\n    \n    envTable.BackgroundFlash.fadeOut = envTable.BackgroundFlash.fadeOut or Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 2, CONFIG_BACKGROUND_FLASH_DURATION/2, 1, 0)    \n    envTable.BackgroundFlash.fadeOut:SetDuration(CONFIG_BACKGROUND_FLASH_DURATION/2)\n    \n    --envTable.BackgroundFlash:Play() --envTable.BackgroundFlash:Stop()    \n    \n    \n    \n    \n    \nend\n\n\n",
					["NpcNames"] = {
					},
					["semver"] = "",
					["Enabled"] = true,
					["Revision"] = 981,
					["Options"] = {
						{
							["Type"] = 6,
							["Key"] = "option1",
							["Value"] = 0,
							["Name"] = "Blank Line",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [1]
						{
							["Type"] = 5,
							["Key"] = "option2",
							["Value"] = "Produces a notable effect in the cast bar when a spell from the 'Triggers' starts to cast.",
							["Name"] = "Option 2",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [2]
						{
							["Type"] = 5,
							["Key"] = "option3",
							["Value"] = "Enter the spell name or spellID of the Spell in the Add Trigger box and hit \"Add\".",
							["Name"] = "Option 3",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [3]
						{
							["Type"] = 6,
							["Key"] = "option4",
							["Value"] = 0,
							["Name"] = "Blank Space",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [4]
						{
							["Type"] = 4,
							["Key"] = "useCastbarColor",
							["Value"] = true,
							["Name"] = "Cast Bar Color Enabled",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "When enabled, changes the cast bar color,",
						}, -- [5]
						{
							["Type"] = 1,
							["Key"] = "castbarColor",
							["Value"] = {
								1, -- [1]
								0.43137254901961, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Name"] = "Cast Bar Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "Color of the cast bar.",
						}, -- [6]
						{
							["Type"] = 6,
							["Key"] = "option7",
							["Value"] = 0,
							["Name"] = "Blank Line",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [7]
						{
							["Type"] = 2,
							["Max"] = 1,
							["Desc"] = "When the cast starts it flash rapidly, adjust how fast it flashes. Value is milliseconds.",
							["Min"] = 0.05,
							["Key"] = "flashDuration",
							["Value"] = 0.4,
							["Name"] = "Flash Duration",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = true,
						}, -- [8]
						{
							["Type"] = 2,
							["Max"] = 10,
							["Desc"] = "Increases the cast bar height by this value",
							["Min"] = 0,
							["Key"] = "castBarHeight",
							["Value"] = 5,
							["Name"] = "Cast Bar Height Mod",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [9]
						{
							["Type"] = 2,
							["Max"] = 1,
							["Desc"] = "When the cast starts, there's a small shake in the nameplate, this settings controls how long it takes.",
							["Min"] = 0.1,
							["Key"] = "shakeDuration",
							["Value"] = 0.2,
							["Name"] = "Shake Duration",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = true,
						}, -- [10]
						{
							["Type"] = 2,
							["Max"] = 100,
							["Desc"] = "How strong is the shake.",
							["Min"] = 2,
							["Key"] = "shakeAmplitude",
							["Value"] = 8,
							["Name"] = "Shake Amplitude",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [11]
						{
							["Type"] = 2,
							["Max"] = 80,
							["Desc"] = "How fast the shake moves.",
							["Min"] = 1,
							["Key"] = "shakeFrequency",
							["Value"] = 40,
							["Name"] = "Shake Frequency",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [12]
					},
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\" or Plater.ZoneInstanceType == \"none\") then\n        return\n    end\n    \n    --play flash animations\n    envTable.FullBarFlash:Play()\n    \n    --envTable.currentHeight = unitFrame.castBar:GetHeight()\n    \n    --restoring the default size (not required since it already restore in the hide script)\n    if (envTable.OriginalHeight) then\n        self:SetHeight (envTable.OriginalHeight)\n    end\n    \n    --increase the cast bar size\n    local height = self:GetHeight()\n    envTable.OriginalHeight = height\n    \n    self:SetHeight (height + envTable.CastBarHeightAdd)\n    \n    Plater.SetCastBarBorderColor (self, 1, .2, .2, 0.4)\n    \n    unitFrame:PlayFrameShake (envTable.FrameShake)\n    \n    --set the color of the cast bar to dark orange (only if can be interrupted)\n    --Plater auto set this color to default when a new cast starts, no need to reset this value at OnHide.    \n    if (envTable._CanInterrupt) then\n        if (scriptTable.config.useCastbarColor) then\n            self:SetStatusBarColor (Plater:ParseColors (envTable.CastbarColor))\n        end\n    end\n    \n    envTable.BackgroundFlash:Play()\n    \n    unitFrame.castBar.Spark:SetHeight(unitFrame.castBar:GetHeight())\n    \nend\n\n\n\n\n\n\n\n\n",
					["Name"] = "Cast - Big Alert [Plater]",
					["Author"] = "Tercioo-Sylvanas",
					["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend",
					["Desc"] = "Flash, Bounce and Red Color the CastBar border when when an important cast is happening. Add spell in the Add Trigger field.",
					["version"] = -1,
					["Prio"] = 99,
					["SpellIds"] = {
					},
					["PlaterCore"] = 1,
					["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \nend\n\n\n",
					["Temp_Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend",
					["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\" or Plater.ZoneInstanceType == \"none\") then\n        return\n    end    \n    \n    unitFrame.castBar:SetHeight (envTable._DefaultHeight)\n    \n    --stop the camera shake\n    unitFrame:StopFrameShake (envTable.FrameShake)\n    \n    envTable.FullBarFlash:Stop()\n    envTable.BackgroundFlash:Stop()\n    \n    unitFrame.castBar.Spark:SetHeight(unitFrame.castBar:GetHeight())\n    \nend\n\n\n\n\n\n",
					["url"] = "",
				}, -- [10]
				{
					["ConstructorCode"] = "--todo: add npc ids for multilanguage support\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.TextAboveNameplate = \"** On You **\"\n    envTable.NameplateColor = \"green\"\n    \n    --label to show the text above the nameplate\n    envTable.FixateTarget = Plater:CreateLabel (unitFrame);\n    envTable.FixateTarget:SetPoint (\"bottom\", unitFrame.healthBar, \"top\", 0, 30);\n    \n    --the spell casted by the npc in the trigger list needs to be in the list below as well\n    local spellList = {\n        [321891] = \"Freeze Tag Fixation\", --Illusionary Vulpin - MTS\n        \n    }\n    \n    --build the list with localized spell names\n    envTable.FixateDebuffs = {}\n    for spellID, enUSSpellName in pairs (spellList) do\n        local localizedSpellName = GetSpellInfo (spellID)\n        envTable.FixateDebuffs [localizedSpellName or enUSSpellName] = true\n    end\n    \n    --debug - smuggled crawg\n    envTable.FixateDebuffs [\"Jagged Maw\"] = true\n    \nend\n\n--[=[\nNpcIDs:\n136461: Spawn of G'huun (mythic uldir G'huun)\n\n--]=]\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:SetText (\"\")\n    envTable.FixateTarget:Hide()\n    \n    envTable.IsFixated = false\n    \n    Plater.RefreshNameplateColor (unitFrame)\nend\n\n\n",
					["OptionsValues"] = {
					},
					["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["ScriptType"] = 3,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --swap this to true when it is fixated\n    local isFixated = false\n    \n    --check the debuffs the player has and see if any of these debuffs has been placed by this unit\n    for debuffId = 1, 40 do\n        local name, texture, count, debuffType, duration, expirationTime, caster = UnitDebuff (\"player\", debuffId)\n        \n        --cancel the loop if there's no more debuffs on the player\n        if (not name) then \n            break \n        end\n        \n        --check if the owner of the debuff is this unit\n        if (envTable.FixateDebuffs [name] and caster and UnitIsUnit (caster, unitId)) then\n            --the debuff the player has, has been placed by this unit, set the name above the unit name\n            envTable.FixateTarget:SetText (envTable.TextAboveNameplate)\n            envTable.FixateTarget:Show()\n            Plater.SetNameplateColor (unitFrame,  envTable.NameplateColor)\n            isFixated = true\n            \n            if (not envTable.IsFixated) then\n                envTable.IsFixated = true\n                Plater.FlashNameplateBody (unitFrame, \"fixate\", .2)\n            end\n        end\n        \n    end\n    \n    --check if the nameplate color is changed but isn't fixated any more\n    if (not isFixated and envTable.IsFixated) then\n        --refresh the nameplate color\n        Plater.RefreshNameplateColor (unitFrame)\n        --reset the text\n        envTable.FixateTarget:SetText (\"\")\n        \n        envTable.IsFixated = false\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
					["Time"] = 1613183890,
					["Temp_ConstructorCode"] = "--todo: add npc ids for multilanguage support\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.TextAboveNameplate = \"** On You **\"\n    envTable.NameplateColor = \"green\"\n    \n    --label to show the text above the nameplate\n    envTable.FixateTarget = Plater:CreateLabel (unitFrame);\n    envTable.FixateTarget:SetPoint (\"bottom\", unitFrame.healthBar, \"top\", 0, 30);\n    \n    --the spell casted by the npc in the trigger list needs to be in the list below as well\n    local spellList = {\n        [321891] = \"Freeze Tag Fixation\", --Illusionary Vulpin - MTS\n        \n    }\n    \n    --build the list with localized spell names\n    envTable.FixateDebuffs = {}\n    for spellID, enUSSpellName in pairs (spellList) do\n        local localizedSpellName = GetSpellInfo (spellID)\n        envTable.FixateDebuffs [localizedSpellName or enUSSpellName] = true\n    end\n    \n    --debug - smuggled crawg\n    envTable.FixateDebuffs [\"Jagged Maw\"] = true\n    \nend\n\n--[=[\nNpcIDs:\n136461: Spawn of G'huun (mythic uldir G'huun)\n\n--]=]\n\n\n\n\n",
					["Icon"] = 841383,
					["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:SetText (\"\")\n    envTable.FixateTarget:Hide()\n    \n    envTable.IsFixated = false\n    \n    Plater.RefreshNameplateColor (unitFrame)\nend\n\n\n",
					["Revision"] = 268,
					["semver"] = "",
					["NpcNames"] = {
					},
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["Author"] = "Tecno-Azralon",
					["SpellIds"] = {
						"spawn of g'huun", -- [1]
						"smuggled crawg", -- [2]
						"sergeant bainbridge", -- [3]
						"blacktooth scrapper", -- [4]
						"irontide grenadier", -- [5]
						"feral bloodswarmer", -- [6]
						"earthrager", -- [7]
						"crawler mine", -- [8]
						"rezan", -- [9]
					},
					["Desc"] = "When an enemy places a debuff and starts to chase you. This script changes the nameplate color and place your name above the nameplate as well.",
					["version"] = -1,
					["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --swap this to true when it is fixated\n    local isFixated = false\n    \n    --check the debuffs the player has and see if any of these debuffs has been placed by this unit\n    for debuffId = 1, 40 do\n        local name, texture, count, debuffType, duration, expirationTime, caster = UnitDebuff (\"player\", debuffId)\n        \n        --cancel the loop if there's no more debuffs on the player\n        if (not name) then \n            break \n        end\n        \n        --check if the owner of the debuff is this unit\n        if (envTable.FixateDebuffs [name] and caster and UnitIsUnit (caster, unitId)) then\n            --the debuff the player has, has been placed by this unit, set the name above the unit name\n            envTable.FixateTarget:SetText (envTable.TextAboveNameplate)\n            envTable.FixateTarget:Show()\n            Plater.SetNameplateColor (unitFrame,  envTable.NameplateColor)\n            isFixated = true\n            \n            if (not envTable.IsFixated) then\n                envTable.IsFixated = true\n                Plater.FlashNameplateBody (unitFrame, \"fixate\", .2)\n            end\n        end\n        \n    end\n    \n    --check if the nameplate color is changed but isn't fixated any more\n    if (not isFixated and envTable.IsFixated) then\n        --refresh the nameplate color\n        Plater.RefreshNameplateColor (unitFrame)\n        --reset the text\n        envTable.FixateTarget:SetText (\"\")\n        \n        envTable.IsFixated = false\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
					["Name"] = "Fixate On You [Plater]",
					["PlaterCore"] = 1,
					["Prio"] = 99,
					["Options"] = {
					},
					["Enabled"] = true,
					["url"] = "",
				}, -- [11]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --settings\n    envTable.NameplateSizeOffset = scriptTable.config.castBarHeight\n    envTable.ShowArrow = scriptTable.config.showArrow\n    envTable.ArrowAlpha = scriptTable.config.arrowAlpha\n    envTable.HealthBarColor = scriptTable.config.healthBarColor\n    \n    --creates the spark to show the cast progress inside the health bar\n    envTable.overlaySpark = envTable.overlaySpark or Plater:CreateImage (unitFrame.healthBar)\n    envTable.overlaySpark:SetBlendMode (\"ADD\")\n    envTable.overlaySpark.width = 16\n    envTable.overlaySpark.height = 36\n    envTable.overlaySpark.alpha = .9\n    envTable.overlaySpark.texture = [[Interface\\AddOns\\Plater\\images\\spark3]]\n    \n    envTable.topArrow = envTable.topArrow or Plater:CreateImage (unitFrame.healthBar)\n    envTable.topArrow:SetBlendMode (\"ADD\")\n    envTable.topArrow.width = scriptTable.config.arrowWidth\n    envTable.topArrow.height = scriptTable.config.arrowHeight\n    envTable.topArrow.alpha = envTable.ArrowAlpha\n    envTable.topArrow.texture = [[Interface\\BUTTONS\\Arrow-Down-Up]]\n    \n    --scale animation\n    envTable.smallScaleAnimation = envTable.smallScaleAnimation or Plater:CreateAnimationHub (unitFrame.healthBar)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 1, 0.075, 1, 1, 1.08, 1.08)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 2, 0.075, 1, 1, 0.95, 0.95)    \n    --envTable.smallScaleAnimation:Play() --envTable.smallScaleAnimation:Stop()\n    \nend\n\n\n\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    Plater.StopDotAnimation(unitFrame.healthBar, envTable.dotAnimation)\n    \n    envTable.overlaySpark:Hide()\n    envTable.topArrow:Hide()\n    \n    Plater.RefreshNameplateColor (unitFrame)\n    \n    envTable.smallScaleAnimation:Stop()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)\nend\n\n\n",
					["OptionsValues"] = {
					},
					["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.overlaySpark:Show()\n    \n    if (envTable.ShowArrow) then\n        envTable.topArrow:Show()\n    end\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    envTable.smallScaleAnimation:Play()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \n    envTable.overlaySpark.height = nameplateHeight + 5\n    \n    envTable.dotAnimation = Plater.PlayDotAnimation(unitFrame.healthBar, 2, scriptTable.config.dotColor, scriptTable.config.xOffset, scriptTable.config.yOffset)\n    \n    self:SetStatusBarColor (Plater:ParseColors (scriptTable.config.castBarColor))\nend\n\n\n\n\n\n\n",
					["ScriptType"] = 2,
					["Temp_Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["Time"] = 1613183890,
					["Icon"] = 2175503,
					["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --settings\n    envTable.NameplateSizeOffset = scriptTable.config.castBarHeight\n    envTable.ShowArrow = scriptTable.config.showArrow\n    envTable.ArrowAlpha = scriptTable.config.arrowAlpha\n    envTable.HealthBarColor = scriptTable.config.healthBarColor\n    \n    --creates the spark to show the cast progress inside the health bar\n    envTable.overlaySpark = envTable.overlaySpark or Plater:CreateImage (unitFrame.healthBar)\n    envTable.overlaySpark:SetBlendMode (\"ADD\")\n    envTable.overlaySpark.width = 16\n    envTable.overlaySpark.height = 36\n    envTable.overlaySpark.alpha = .9\n    envTable.overlaySpark.texture = [[Interface\\AddOns\\Plater\\images\\spark3]]\n    \n    envTable.topArrow = envTable.topArrow or Plater:CreateImage (unitFrame.healthBar)\n    envTable.topArrow:SetBlendMode (\"ADD\")\n    envTable.topArrow.width = scriptTable.config.arrowWidth\n    envTable.topArrow.height = scriptTable.config.arrowHeight\n    envTable.topArrow.alpha = envTable.ArrowAlpha\n    envTable.topArrow.texture = [[Interface\\BUTTONS\\Arrow-Down-Up]]\n    \n    --scale animation\n    envTable.smallScaleAnimation = envTable.smallScaleAnimation or Plater:CreateAnimationHub (unitFrame.healthBar)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 1, 0.075, 1, 1, 1.08, 1.08)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 2, 0.075, 1, 1, 0.95, 0.95)    \n    --envTable.smallScaleAnimation:Play() --envTable.smallScaleAnimation:Stop()\n    \nend\n\n\n\n\n\n\n\n",
					["NpcNames"] = {
					},
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.overlaySpark:Show()\n    \n    if (envTable.ShowArrow) then\n        envTable.topArrow:Show()\n    end\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    envTable.smallScaleAnimation:Play()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \n    envTable.overlaySpark.height = nameplateHeight + 5\n    \n    envTable.dotAnimation = Plater.PlayDotAnimation(unitFrame.healthBar, 2, scriptTable.config.dotColor, scriptTable.config.xOffset, scriptTable.config.yOffset)\n    \n    self:SetStatusBarColor (Plater:ParseColors (scriptTable.config.castBarColor))\nend\n\n\n\n\n\n\n",
					["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    Plater.StopDotAnimation(unitFrame.healthBar, envTable.dotAnimation)\n    \n    envTable.overlaySpark:Hide()\n    envTable.topArrow:Hide()\n    \n    Plater.RefreshNameplateColor (unitFrame)\n    \n    envTable.smallScaleAnimation:Stop()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)\nend\n\n\n",
					["Revision"] = 464,
					["Options"] = {
						{
							["Type"] = 6,
							["Key"] = "option1",
							["Value"] = 0,
							["Name"] = "Option 1",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [1]
						{
							["Type"] = 5,
							["Key"] = "option2",
							["Value"] = "Plays a special animation showing the explosion time.",
							["Name"] = "Option 2",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [2]
						{
							["Type"] = 6,
							["Key"] = "option3",
							["Value"] = 0,
							["Name"] = "Option 3",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [3]
						{
							["Type"] = 2,
							["Max"] = 6,
							["Desc"] = "Increases the cast bar height by this value",
							["Min"] = 0,
							["Key"] = "castBarHeight",
							["Value"] = 3,
							["Name"] = "Cast Bar Height Mod",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [4]
						{
							["Type"] = 1,
							["Key"] = "castBarColor",
							["Value"] = {
								1, -- [1]
								0.5843137254902, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Name"] = "Cast Bar Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "Changes the cast bar color to this one.",
						}, -- [5]
						{
							["Type"] = 6,
							["Key"] = "option7",
							["Value"] = 0,
							["Name"] = "Option 7",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [6]
						{
							["Type"] = 5,
							["Key"] = "option6",
							["Value"] = "Arrow:",
							["Name"] = "Arrow:",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [7]
						{
							["Type"] = 4,
							["Key"] = "showArrow",
							["Value"] = true,
							["Name"] = "Show Arrow",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "Show an arrow above the nameplate showing the cast bar progress.",
						}, -- [8]
						{
							["Type"] = 2,
							["Max"] = 1,
							["Desc"] = "Arrow alpha.",
							["Min"] = 0,
							["Key"] = "arrowAlpha",
							["Value"] = 0.5,
							["Name"] = "Arrow Alpha",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = true,
						}, -- [9]
						{
							["Type"] = 2,
							["Max"] = 12,
							["Desc"] = "Arrow Width.",
							["Min"] = 4,
							["Key"] = "arrowWidth",
							["Value"] = 8,
							["Name"] = "Arrow Width",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [10]
						{
							["Type"] = 2,
							["Max"] = 12,
							["Desc"] = "Arrow Height.",
							["Min"] = 4,
							["Key"] = "arrowHeight",
							["Value"] = 8,
							["Name"] = "Arrow Height",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [11]
						{
							["Type"] = 6,
							["Key"] = "option13",
							["Value"] = 0,
							["Name"] = "Option 13",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [12]
						{
							["Type"] = 5,
							["Key"] = "option12",
							["Value"] = "Dot Animation:",
							["Name"] = "Dot Animation:",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [13]
						{
							["Type"] = 1,
							["Key"] = "dotColor",
							["Value"] = {
								1, -- [1]
								0.6156862745098, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Name"] = "Dot Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "Adjust the color of the dot animation.",
						}, -- [14]
						{
							["Type"] = 2,
							["Max"] = 10,
							["Desc"] = "Dot X Offset",
							["Min"] = -10,
							["Key"] = "xOffset",
							["Value"] = 4,
							["Name"] = "Dot X Offset",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [15]
						{
							["Type"] = 2,
							["Max"] = 10,
							["Desc"] = "Dot Y Offset",
							["Min"] = -10,
							["Key"] = "yOffset",
							["Value"] = 3,
							["Name"] = "Dot Y Offset",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [16]
					},
					["SpellIds"] = {
						240446, -- [1]
						273577, -- [2]
					},
					["Prio"] = 99,
					["Author"] = "Bombad�o-Azralon",
					["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["Desc"] = "Apply several animations when the explosion orb cast starts on a Mythic Dungeon with Explosion Affix",
					["Name"] = "Explosion Affix M+ [Plater]",
					["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --update the percent\n    envTable.overlaySpark:SetPoint (\"left\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100)-9, 0)\n    \n    envTable.topArrow:SetPoint (\"bottomleft\", unitFrame.healthBar, \"topleft\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100) - 4, 2 )\n    \n    --forces the script to update on a 60Hz base\n    self.ThrottleUpdate = 0\n    \n\nend\n\n\n",
					["version"] = -1,
					["PlaterCore"] = 1,
					["semver"] = "",
					["Enabled"] = true,
					["url"] = "",
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --update the percent\n    envTable.overlaySpark:SetPoint (\"left\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100)-9, 0)\n    \n    envTable.topArrow:SetPoint (\"bottomleft\", unitFrame.healthBar, \"topleft\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100) - 4, 2 )\n    \n    --forces the script to update on a 60Hz base\n    self.ThrottleUpdate = 0\n    \n\nend\n\n\n",
				}, -- [12]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings:\n    do\n        \n        --change the nameplate color to this color\n        --can use color names: \"red\", \"yellow\"\n        --can use color hex: \"#FF0000\", \"#FFFF00\"\n        --con use color table: {1, 0, 0}, {1, 1, 0}\n        \n        envTable.Color = \"green\"\n        \n        --if true, it'll replace the health info with the unit name\n        envTable.ReplaceHealthWithName = false\n        \n        --use flash when the unit is shown in the screen\n        envTable.FlashNameplate = true\n        \n    end\n    \n    --private:\n    do\n        --create a flash for when the unit if shown\n        envTable.smallFlash = envTable.smallFlash or Plater.CreateFlash (unitFrame.healthBar, 0.15, 1, envTable.Color)\n        \n    end\n    \nend\n\n--[=[\n\nNpc IDS:\n\n141851: Spawn of G'Huun on Mythic Dungeons\n\n\n--]=]\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --make plater refresh the nameplate color\n    Plater.RefreshNameplateColor (unitFrame)\n    \n        envTable.smallFlash:Stop()\n    \nend\n\n\n",
					["OptionsValues"] = {
					},
					["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if can flash the nameplate\n    if (envTable.FlashNameplate) then\n        envTable.smallFlash:Play()\n    end\n    \nend\n\n\n\n\n\n\n\n\n",
					["ScriptType"] = 3,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --adjust the nameplate color\n    Plater.SetNameplateColor (unitFrame, envTable.Color)\n    \n    --check if can replace the health amount with the unit name\n    if (envTable.ReplaceHealthWithName) then\n        \n        local healthPercent = format (\"%.1f\", unitFrame.healthBar.CurrentHealth / unitFrame.healthBar.CurrentHealthMax *100)\n        \n        unitFrame.healthBar.lifePercent:SetText (unitFrame.namePlateUnitName .. \"  (\" .. healthPercent  .. \"%)\")\n        \n    end\n    \nend\n\n\n",
					["Time"] = 1600015543,
					["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings:\n    do\n        \n        --change the nameplate color to this color\n        --can use color names: \"red\", \"yellow\"\n        --can use color hex: \"#FF0000\", \"#FFFF00\"\n        --con use color table: {1, 0, 0}, {1, 1, 0}\n        \n        envTable.Color = \"green\"\n        \n        --if true, it'll replace the health info with the unit name\n        envTable.ReplaceHealthWithName = false\n        \n        --use flash when the unit is shown in the screen\n        envTable.FlashNameplate = true\n        \n    end\n    \n    --private:\n    do\n        --create a flash for when the unit if shown\n        envTable.smallFlash = envTable.smallFlash or Plater.CreateFlash (unitFrame.healthBar, 0.15, 1, envTable.Color)\n        \n    end\n    \nend\n\n--[=[\n\nNpc IDS:\n\n141851: Spawn of G'Huun on Mythic Dungeons\n\n\n--]=]\n\n\n\n\n",
					["Icon"] = 135024,
					["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --make plater refresh the nameplate color\n    Plater.RefreshNameplateColor (unitFrame)\n    \n        envTable.smallFlash:Stop()\n    \nend\n\n\n",
					["Revision"] = 72,
					["Options"] = {
					},
					["Author"] = "Izimode-Azralon",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if can flash the nameplate\n    if (envTable.FlashNameplate) then\n        envTable.smallFlash:Play()\n    end\n    \nend\n\n\n\n\n\n\n\n\n",
					["NpcNames"] = {
						"141851", -- [1]
					},
					["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --adjust the nameplate color\n    Plater.SetNameplateColor (unitFrame, envTable.Color)\n    \n    --check if can replace the health amount with the unit name\n    if (envTable.ReplaceHealthWithName) then\n        \n        local healthPercent = format (\"%.1f\", unitFrame.healthBar.CurrentHealth / unitFrame.healthBar.CurrentHealthMax *100)\n        \n        unitFrame.healthBar.lifePercent:SetText (unitFrame.namePlateUnitName .. \"  (\" .. healthPercent  .. \"%)\")\n        \n    end\n    \nend\n\n\n",
					["Name"] = "Color Change [Plater]",
					["PlaterCore"] = 1,
					["Desc"] = "Add a unitID or unit name in 'Add Trigger' entry. See the constructor script for options.",
					["SpellIds"] = {
					},
					["Prio"] = 99,
					["Enabled"] = true,
				}, -- [13]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --settings (require a /reload after editing any setting)\n    do\n        --blink and glow\n        envTable.BlinkEnabled = scriptTable.config.blinkEnabled\n        envTable.GlowEnabled = scriptTable.config.glowEnabled \n        envTable.ChangeNameplateColor = scriptTable.config.changeNameplateColor;\n        envTable.TimeLeftToBlink = scriptTable.config.timeleftToBlink;\n        envTable.BlinkSpeed = scriptTable.config.blinkSpeed; \n        envTable.BlinkColor = scriptTable.config.blinkColor; \n        envTable.BlinkMaxAlpha = scriptTable.config.blinkMaxAlpha; \n        envTable.NameplateColor = scriptTable.config.nameplateColor; \n        \n        --text color\n        envTable.TimerColorEnabled = scriptTable.config.timerColorEnabled \n        envTable.TimeLeftWarning = scriptTable.config.timeLeftWarning;\n        envTable.TimeLeftCritical = scriptTable.config.timeLeftCritical;\n        envTable.TextColor_Warning = scriptTable.config.warningColor; \n        envTable.TextColor_Critical = scriptTable.config.criticalColor; \n        \n        --list of spellIDs to ignore\n        envTable.IgnoredSpellID = {\n            [12] = true, --use a simple comma here\n            [13] = true,\n        }\n    end\n    \n    \n    --private\n    do\n        --if not envTable.blinkTexture then\n        envTable.blinkTexture = Plater:CreateImage (self, \"\", 1, 1, \"overlay\")\n        envTable.blinkTexture:SetPoint ('center', 0, 0)\n        envTable.blinkTexture:Hide()\n        \n        local onPlay = function()\n            envTable.blinkTexture:Show() \n            envTable.blinkTexture.color = envTable.BlinkColor\n        end\n        local onStop = function()\n            envTable.blinkTexture:Hide()  \n        end\n        envTable.blinkAnimation = Plater:CreateAnimationHub (envTable.blinkTexture, onPlay, onStop)\n        Plater:CreateAnimation (envTable.blinkAnimation, \"ALPHA\", 1, envTable.BlinkSpeed / 2, 0, envTable.BlinkMaxAlpha)\n        Plater:CreateAnimation (envTable.blinkAnimation, \"ALPHA\", 2, envTable.BlinkSpeed / 2, envTable.BlinkMaxAlpha, 0)\n        --end\n        \n        envTable.glowEffect = envTable.glowEffect or self.overlay or Plater.CreateIconGlow (self)\n        --envTable.glowEffect = envTable.glowEffect or Plater.CreateIconGlow (self)\n        --envTable.glowEffect:Show() --envTable.glowEffect:Hide()\n        \n    end\n    \nend\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    envTable.blinkAnimation:Stop()\n    envTable.blinkTexture:Hide()\n    envTable.blinkAnimation:Stop()\n    envTable.glowEffect:Stop()\n    Plater:SetFontColor (self.Cooldown.Timer, Plater.db.profile.aura_timer_text_color)\nend\n\n\n",
					["OptionsValues"] = {
					},
					["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.blinkTexture:SetSize (self:GetSize())\n    \nend\n\n\n",
					["ScriptType"] = 1,
					["Temp_Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["Time"] = 1613183783,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura_blink",
					["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --settings (require a /reload after editing any setting)\n    do\n        --blink and glow\n        envTable.BlinkEnabled = scriptTable.config.blinkEnabled\n        envTable.GlowEnabled = scriptTable.config.glowEnabled \n        envTable.ChangeNameplateColor = scriptTable.config.changeNameplateColor;\n        envTable.TimeLeftToBlink = scriptTable.config.timeleftToBlink;\n        envTable.BlinkSpeed = scriptTable.config.blinkSpeed; \n        envTable.BlinkColor = scriptTable.config.blinkColor; \n        envTable.BlinkMaxAlpha = scriptTable.config.blinkMaxAlpha; \n        envTable.NameplateColor = scriptTable.config.nameplateColor; \n        \n        --text color\n        envTable.TimerColorEnabled = scriptTable.config.timerColorEnabled \n        envTable.TimeLeftWarning = scriptTable.config.timeLeftWarning;\n        envTable.TimeLeftCritical = scriptTable.config.timeLeftCritical;\n        envTable.TextColor_Warning = scriptTable.config.warningColor; \n        envTable.TextColor_Critical = scriptTable.config.criticalColor; \n        \n        --list of spellIDs to ignore\n        envTable.IgnoredSpellID = {\n            [12] = true, --use a simple comma here\n            [13] = true,\n        }\n    end\n    \n    \n    --private\n    do\n        --if not envTable.blinkTexture then\n        envTable.blinkTexture = Plater:CreateImage (self, \"\", 1, 1, \"overlay\")\n        envTable.blinkTexture:SetPoint ('center', 0, 0)\n        envTable.blinkTexture:Hide()\n        \n        local onPlay = function()\n            envTable.blinkTexture:Show() \n            envTable.blinkTexture.color = envTable.BlinkColor\n        end\n        local onStop = function()\n            envTable.blinkTexture:Hide()  \n        end\n        envTable.blinkAnimation = Plater:CreateAnimationHub (envTable.blinkTexture, onPlay, onStop)\n        Plater:CreateAnimation (envTable.blinkAnimation, \"ALPHA\", 1, envTable.BlinkSpeed / 2, 0, envTable.BlinkMaxAlpha)\n        Plater:CreateAnimation (envTable.blinkAnimation, \"ALPHA\", 2, envTable.BlinkSpeed / 2, envTable.BlinkMaxAlpha, 0)\n        --end\n        \n        envTable.glowEffect = envTable.glowEffect or self.overlay or Plater.CreateIconGlow (self)\n        --envTable.glowEffect = envTable.glowEffect or Plater.CreateIconGlow (self)\n        --envTable.glowEffect:Show() --envTable.glowEffect:Hide()\n        \n    end\n    \nend\n\n\n\n\n",
					["NpcNames"] = {
					},
					["semver"] = "",
					["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    envTable.blinkAnimation:Stop()\n    envTable.blinkTexture:Hide()\n    envTable.blinkAnimation:Stop()\n    envTable.glowEffect:Stop()\n    Plater:SetFontColor (self.Cooldown.Timer, Plater.db.profile.aura_timer_text_color)\nend\n\n\n",
					["Revision"] = 370,
					["Options"] = {
						{
							["Type"] = 6,
							["Name"] = "Blank Space",
							["Value"] = 0,
							["Key"] = "option10",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [1]
						{
							["Type"] = 5,
							["Name"] = "Option 17",
							["Value"] = "Enter the spell name or spellID in the Add Trigger box and hit \"Add\".",
							["Key"] = "option17",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [2]
						{
							["Type"] = 6,
							["Key"] = "option10",
							["Value"] = 0,
							["Name"] = "Blank Space",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [3]
						{
							["Type"] = 4,
							["Name"] = "Blink Enabled",
							["Value"] = true,
							["Key"] = "blinkEnabled",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "set to 'false' to disable blink",
						}, -- [4]
						{
							["Type"] = 4,
							["Name"] = "Glow Enabled",
							["Value"] = true,
							["Key"] = "glowEnabled",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "set to 'false' to disable glows",
						}, -- [5]
						{
							["Type"] = 4,
							["Name"] = "Change NamePlate Color",
							["Value"] = true,
							["Key"] = "changeNameplateColor",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "set to 'true' to enable nameplate color change",
						}, -- [6]
						{
							["Type"] = 2,
							["Max"] = 20,
							["Desc"] = "in seconds, affects the blink effect only",
							["Min"] = 1,
							["Name"] = "Timeleft to Blink",
							["Value"] = 3,
							["Fraction"] = true,
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Key"] = "timeleftToBlink",
						}, -- [7]
						{
							["Type"] = 2,
							["Max"] = 3,
							["Desc"] = "time to complete a blink loop",
							["Min"] = 0.5,
							["Name"] = "Blink Speed",
							["Value"] = 1,
							["Fraction"] = true,
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Key"] = "blinkSpeed",
						}, -- [8]
						{
							["Type"] = 2,
							["Max"] = 1,
							["Desc"] = "max transparency in the animation loop (1.0 is full opaque)",
							["Min"] = 0.1,
							["Name"] = "Blink Max Alpha",
							["Value"] = 0.6,
							["Fraction"] = true,
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Key"] = "blinkMaxAlpha",
						}, -- [9]
						{
							["Type"] = 1,
							["Name"] = "Blink Color",
							["Value"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["Key"] = "blinkColor",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "color of the blink",
						}, -- [10]
						{
							["Type"] = 1,
							["Name"] = "Nameplate Color",
							["Value"] = {
								0.2862745098039216, -- [1]
								0.00392156862745098, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Key"] = "",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "nameplate color if ChangeNameplateColor is true",
						}, -- [11]
						{
							["Type"] = 6,
							["Key"] = "option10",
							["Value"] = 0,
							["Name"] = "Blank Space",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [12]
						{
							["Type"] = 4,
							["Name"] = "Timer Color Enabled",
							["Value"] = true,
							["Key"] = "timerColorEnabled",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "set to 'false' to disable changes in the color of the time left text",
						}, -- [13]
						{
							["Type"] = 2,
							["Max"] = 20,
							["Desc"] = "in seconds, affects the color of the text",
							["Min"] = 1,
							["Fraction"] = true,
							["Value"] = 8,
							["Name"] = "Time Left Warning",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Key"] = "timeLeftWarning",
						}, -- [14]
						{
							["Type"] = 2,
							["Max"] = 10,
							["Desc"] = "in seconds, affects the color of the text",
							["Min"] = 1,
							["Fraction"] = true,
							["Value"] = 3,
							["Name"] = "Time Left Critical",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Key"] = "timeLeftCritical",
						}, -- [15]
						{
							["Type"] = 1,
							["Name"] = "Warning Color",
							["Value"] = {
								1, -- [1]
								0.8705882352941177, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Key"] = "warningColor",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "color when the time left entered in a warning zone",
						}, -- [16]
						{
							["Type"] = 1,
							["Name"] = "Critical Color",
							["Value"] = {
								1, -- [1]
								0.07450980392156863, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Key"] = "criticalColor",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "color when the time left is critical",
						}, -- [17]
					},
					["version"] = -1,
					["Prio"] = 99,
					["Author"] = "Izimode-Azralon",
					["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["Desc"] = "Blink, change the number and nameplate color. Add the debuffs int he trigger box. Set settings on constructor script.",
					["Name"] = "Aura - Blink by Time Left [Plater]",
					["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    local timeLeft = envTable._RemainingTime\n    \n    --check if the spellID isn't being ignored\n    if (envTable.IgnoredSpellID [envTable._SpellID]) then\n        return\n    end\n    \n    --check the time left and start or stop the blink animation and also check if the time left is > zero\n    if ((envTable.BlinkEnabled or envTable.GlowEnabled) and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftToBlink) then\n            --blink effect\n            if (envTable.BlinkEnabled) then\n                if (not envTable.blinkAnimation:IsPlaying()) then\n                    envTable.blinkAnimation:Play()\n                end\n            end\n            --glow effect\n            if (envTable.GlowEnabled) then\n                envTable.glowEffect:Show()\n            end\n            --nameplate color\n            if (envTable.ChangeNameplateColor) then\n                Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n            end\n        else\n            --blink effect\n            if (envTable.blinkAnimation:IsPlaying()) then\n                envTable.blinkAnimation:Stop()\n            end\n            --glow effect\n            if (envTable.GlowEnabled and envTable.glowEffect:IsShown()) then\n                envTable.glowEffect:Hide()\n            end\n        end\n    end\n    \n    --timer color\n    if (envTable.TimerColorEnabled and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftCritical) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Critical)\n        elseif (timeLeft < envTable.TimeLeftWarning) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Warning)        \n        else\n            Plater:SetFontColor (self.Cooldown.Timer, Plater.db.profile.aura_timer_text_color)\n        end\n    end\n    \nend",
					["SpellIds"] = {
					},
					["PlaterCore"] = 1,
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.blinkTexture:SetSize (self:GetSize())\n    \nend\n\n\n",
					["Enabled"] = true,
					["url"] = "",
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    local timeLeft = envTable._RemainingTime\n    \n    --check if the spellID isn't being ignored\n    if (envTable.IgnoredSpellID [envTable._SpellID]) then\n        return\n    end\n    \n    --check the time left and start or stop the blink animation and also check if the time left is > zero\n    if ((envTable.BlinkEnabled or envTable.GlowEnabled) and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftToBlink) then\n            --blink effect\n            if (envTable.BlinkEnabled) then\n                if (not envTable.blinkAnimation:IsPlaying()) then\n                    envTable.blinkAnimation:Play()\n                end\n            end\n            --glow effect\n            if (envTable.GlowEnabled) then\n                envTable.glowEffect:Show()\n            end\n            --nameplate color\n            if (envTable.ChangeNameplateColor) then\n                Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n            end\n        else\n            --blink effect\n            if (envTable.blinkAnimation:IsPlaying()) then\n                envTable.blinkAnimation:Stop()\n            end\n            --glow effect\n            if (envTable.GlowEnabled and envTable.glowEffect:IsShown()) then\n                envTable.glowEffect:Hide()\n            end\n        end\n    end\n    \n    --timer color\n    if (envTable.TimerColorEnabled and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftCritical) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Critical)\n        elseif (timeLeft < envTable.TimeLeftWarning) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Warning)        \n        else\n            Plater:SetFontColor (self.Cooldown.Timer, Plater.db.profile.aura_timer_text_color)\n        end\n    end\n    \nend",
				}, -- [14]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \n    --check for marks\n    function  envTable.CheckMark (unitId, unitFrame)\n        if (not GetRaidTargetIndex(unitId)) then\n            if (scriptTable.config.onlyInCombat) then\n                if (not UnitAffectingCombat(unitId)) then\n                    return\n                end                \n            end\n            \n            SetRaidTarget(unitId, 8)\n        end       \n    end\nend\n\n\n--163520 - forsworn squad-leader\n--163618 - zolramus necromancer - The Necrotic Wake\n--164506 - anciet captain - theater of pain\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["OptionsValues"] = {
					},
					["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.CheckMark (unitId, unitFrame)\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
					["ScriptType"] = 3,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.CheckMark (unitId, unitFrame)\nend\n\n\n",
					["Time"] = 1605782842,
					["NpcNames"] = {
						"163520", -- [1]
						"163618", -- [2]
						"164506", -- [3]
					},
					["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \n    --check for marks\n    function  envTable.CheckMark (unitId, unitFrame)\n        if (not GetRaidTargetIndex(unitId)) then\n            if (scriptTable.config.onlyInCombat) then\n                if (not UnitAffectingCombat(unitId)) then\n                    return\n                end                \n            end\n            \n            SetRaidTarget(unitId, 8)\n        end       \n    end\nend\n\n\n--163520 - forsworn squad-leader\n--163618 - zolramus necromancer - The Necrotic Wake\n--164506 - anciet captain - theater of pain\n\n\n",
					["Icon"] = "Interface\\Worldmap\\GlowSkull_64Grey",
					["Options"] = {
						{
							["Type"] = 5,
							["Key"] = "option1",
							["Value"] = "Auto set a raid target Skull on the unit.",
							["Name"] = "Option 1",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [1]
						{
							["Type"] = 6,
							["Key"] = "option2",
							["Value"] = 0,
							["Name"] = "Option 2",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [2]
						{
							["Type"] = 4,
							["Key"] = "onlyInCombat",
							["Value"] = false,
							["Name"] = "Only in Combat",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "Set the mark only if the unit is in combat.",
						}, -- [3]
					},
					["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["Revision"] = 68,
					["semver"] = "",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.CheckMark (unitId, unitFrame)\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
					["Prio"] = 99,
					["Author"] = "Aelerolor-Torghast",
					["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["Desc"] = "Auto set skull marker",
					["version"] = -1,
					["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.CheckMark (unitId, unitFrame)\nend\n\n\n",
					["SpellIds"] = {
					},
					["PlaterCore"] = 1,
					["Name"] = "Auto Set Skull",
					["Enabled"] = true,
					["url"] = "",
					["Temp_Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
				}, -- [15]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \nend\n\n--[=[\n\n154564 - debug\n\n168098 - empowered coldheart agent\n156212 - coldheart agent\n\n\n\n--]=]",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    Plater.StopDotAnimation(unitFrame.healthBar, unitFrame.healthBar.MainTargetDotAnimation)\n    \n    --restore the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)    \n    \nend\n\n\n\n\n",
					["OptionsValues"] = {
					},
					["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    Plater.StopDotAnimation(unitFrame.healthBar, unitFrame.healthBar.MainTargetDotAnimation)\n    \n    unitFrame.healthBar.MainTargetDotAnimation = Plater.PlayDotAnimation(unitFrame.healthBar, 2, scriptTable.config.dotsColor, 3, 4) \n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + scriptTable.config.nameplateSizeOffset)\n    \nend\n\n\n\n\n\n\n\n",
					["ScriptType"] = 3,
					["Temp_Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["Time"] = 1613183891,
					["Icon"] = "Interface\\AddOns\\Plater\\media\\skullbones_64",
					["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \nend\n\n--[=[\n\n154564 - debug\n\n168098 - empowered coldheart agent\n156212 - coldheart agent\n\n\n\n--]=]",
					["NpcNames"] = {
						"156212", -- [1]
						"168098", -- [2]
					},
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    Plater.StopDotAnimation(unitFrame.healthBar, unitFrame.healthBar.MainTargetDotAnimation)\n    \n    unitFrame.healthBar.MainTargetDotAnimation = Plater.PlayDotAnimation(unitFrame.healthBar, 2, scriptTable.config.dotsColor, 3, 4) \n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + scriptTable.config.nameplateSizeOffset)\n    \nend\n\n\n\n\n\n\n\n",
					["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    Plater.StopDotAnimation(unitFrame.healthBar, unitFrame.healthBar.MainTargetDotAnimation)\n    \n    --restore the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)    \n    \nend\n\n\n\n\n",
					["Revision"] = 408,
					["Options"] = {
						{
							["Type"] = 6,
							["Key"] = "option4",
							["Value"] = 0,
							["Name"] = "Blank Space",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [1]
						{
							["Type"] = 5,
							["Key"] = "option6",
							["Value"] = "Enter the npc name or npcId in the \"Add Trigger\" box and hit \"Add\".",
							["Name"] = "Option 6",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [2]
						{
							["Type"] = 6,
							["Key"] = "option4",
							["Value"] = 0,
							["Name"] = "Blank Space",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [3]
						{
							["Type"] = 4,
							["Key"] = "changeNameplateColor",
							["Value"] = true,
							["Name"] = "Change Nameplate Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "change to true to change the color",
						}, -- [4]
						{
							["Type"] = 1,
							["Key"] = "nameplateColor",
							["Value"] = {
								1, -- [1]
								0, -- [2]
								0.52549019607843, -- [3]
								1, -- [4]
							},
							["Name"] = "Nameplate Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "",
						}, -- [5]
						{
							["Type"] = 2,
							["Max"] = 6,
							["Desc"] = "increase the nameplate height by this value",
							["Min"] = 0,
							["Key"] = "nameplateSizeOffset",
							["Value"] = 0,
							["Name"] = "Nameplate Size Offset",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [6]
						{
							["Type"] = 6,
							["Key"] = "option4",
							["Value"] = 0,
							["Name"] = "Blank Space",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [7]
						{
							["Type"] = 1,
							["Key"] = "dotsColor",
							["Value"] = {
								1, -- [1]
								0.71372549019608, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Name"] = "Dot Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "",
						}, -- [8]
						{
							["Type"] = 6,
							["Key"] = "option4",
							["Value"] = 0,
							["Name"] = "Blank Space",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [9]
					},
					["SpellIds"] = {
					},
					["Prio"] = 99,
					["Author"] = "Izimode-Azralon",
					["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["Desc"] = "Highlight a nameplate of an important Add. Add the unit name or NpcID into the trigger box to add more.",
					["Name"] = "Unit - Main Target [P]",
					["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --check if can change the nameplate color\n    if (scriptTable.config.changeNameplateColor) then\n        Plater.SetNameplateColor (unitFrame, scriptTable.config.nameplateColor)\n    end\n    \nend\n\n\n\n\n",
					["version"] = -1,
					["PlaterCore"] = 1,
					["semver"] = "",
					["Enabled"] = true,
					["url"] = "",
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --check if can change the nameplate color\n    if (scriptTable.config.changeNameplateColor) then\n        Plater.SetNameplateColor (unitFrame, scriptTable.config.nameplateColor)\n    end\n    \nend\n\n\n\n\n",
				}, -- [16]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \n    envTable.npcInfo = {\n        [164427] = {secondCastBar = true, timer = 20, timerId = 321247, altCastId = \"1\", name = \"Boom!\"}, --reanimated warrior - plaguefall\n        \n        [164414] = {secondCastBar = true, timer = 20, timerId = 321247, altCastId = \"2\", name = \"Boom!\"}, --reanimated mage - plaguefall\n        \n        [164185] = {secondCastBar = true, timer = 20, timerId = 319941, altCastId = \"3\", remaining = 5, name = GetSpellInfo(319941)}, --Echelon - Halls of Atonement\n        \n        [164567] = {secondCastBar = true, altCastId = \"dromanswrath\", debuffTimer = 323059, name = GetSpellInfo(323059), spellIcon = 323059}, --Ingra Maloch -- tirna scythe\n        \n        [165408] = {secondCastBar = true, timer = 20, timerId = 322711, altCastId = \"4\", remaining = 5, name = GetSpellInfo(322711)}, --Halkias - Refracted Sinlight - Halls of Atonement\n        \n        \n        --[154564] = {secondCastBar = true, timerId = \"Test Bar\", altCastId = \"debugcast\", remaining = 5, name = GetSpellInfo(319941), spellIcon = 319941}, --debug \"Test (1)\" BW \"Test Bar\" DBM --DEBUG\n        --[154580] = {secondCastBar = true, altCastId = \"debugcast\", debuffTimer = 204242, name = GetSpellInfo(81297), spellIcon = 81297}, --debug \"Test (1)\" BW \"Test Bar\" DBM --DEBUG\n    }\n    \n    --set the castbar config\n    local config = {\n        iconTexture = \"\",\n        iconTexcoord = {0.1, 0.9, 0.1, 0.9},\n        iconAlpha = 1,\n        iconSize = 14,\n        \n        text = \"Boom!\",\n        textSize = 9,\n        \n        texture = [[Interface\\AddOns\\Plater\\images\\bar_background]],\n        color = \"silver\",\n        \n        isChanneling = false,\n        canInterrupt = false,\n        \n        height = 2,\n        width = Plater.db.profile.plate_config.enemynpc.health_incombat[1],\n        \n        spellNameAnchor = {side = 3, x = 0, y = -2},\n        timerAnchor = {side = 5, x = 0, y = -2},\n    }    \n    \n    function envTable.ShowAltCastBar(npcInfo, unitFrame, unitId, customTime, customStart)\n        --show the cast bar\n        if (npcInfo.timerId) then\n            local barObject = Plater.GetBossTimer(npcInfo.timerId)\n            if (barObject) then\n                if (npcInfo.remaining) then\n                    local timeLeft = barObject.timer + barObject.start - GetTime()\n                    if (timeLeft > npcInfo.remaining) then\n                        return\n                    end\n                end\n                \n                config.text = npcInfo.name\n                \n                if (npcInfo.spellIcon) then\n                    local _, _, iconTexture = GetSpellInfo(npcInfo.spellIcon)\n                    config.iconTexture = iconTexture\n                else\n                    config.iconTexture = \"\"\n                end\n                \n                Plater.SetAltCastBar(unitFrame.PlateFrame, config, barObject.timer, customStart or barObject.start, npcInfo.altCastId)\n            end\n        else\n            Plater.SetAltCastBar(unitFrame.PlateFrame, config, customTime or npcInfo.timer, customStart, npcInfo.altCastId)            \n        end\n        \n        DetailsFramework:TruncateText(unitFrame.castBar2.Text, unitFrame.castBar2:GetWidth() - 16)\n    end\nend",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    Plater.ClearAltCastBar(unitFrame.PlateFrame)\nend",
					["OptionsValues"] = {
					},
					["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    local npcInfo = envTable.npcInfo[envTable._NpcID]\n    \n    if (npcInfo and npcInfo.secondCastBar) then\n        if (npcInfo.debuffTimer) then\n            if (Plater.NameplateHasAura (unitFrame, npcInfo.debuffTimer)) then\n                \n                local name = npcInfo.name\n                local _, _, _, _, duration, expirationTime = AuraUtil.FindAuraByName(name, unitId, \"DEBUFF\")\n                \n                envTable.ShowAltCastBar(npcInfo, unitFrame, unitId, duration, expirationTime-duration)\n            else\n                if (unitFrame.castBar2:IsShown()) then\n                    local altCastId = Plater.GetAltCastBarAltId(unitFrame.PlateFrame)\n                    if (altCastId == npcInfo.altCastId) then\n                        Plater.ClearAltCastBar(unitFrame.PlateFrame)\n                    end                   \n                end                              \n            end\n        else\n            envTable.ShowAltCastBar(npcInfo, unitFrame, unitId)\n        end\n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
					["ScriptType"] = 3,
					["Temp_Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["Time"] = 1613183889,
					["Icon"] = "Interface\\AddOns\\Plater\\Images\\countdown_bar_icon",
					["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \n    envTable.npcInfo = {\n        [164427] = {secondCastBar = true, timer = 20, timerId = 321247, altCastId = \"1\", name = \"Boom!\"}, --reanimated warrior - plaguefall\n        \n        [164414] = {secondCastBar = true, timer = 20, timerId = 321247, altCastId = \"2\", name = \"Boom!\"}, --reanimated mage - plaguefall\n        \n        [164185] = {secondCastBar = true, timer = 20, timerId = 319941, altCastId = \"3\", remaining = 5, name = GetSpellInfo(319941)}, --Echelon - Halls of Atonement\n        \n        [164567] = {secondCastBar = true, altCastId = \"dromanswrath\", debuffTimer = 323059, name = GetSpellInfo(323059), spellIcon = 323059}, --Ingra Maloch -- tirna scythe\n        \n        [165408] = {secondCastBar = true, timer = 20, timerId = 322711, altCastId = \"4\", remaining = 5, name = GetSpellInfo(322711)}, --Halkias - Refracted Sinlight - Halls of Atonement\n        \n        \n        --[154564] = {secondCastBar = true, timerId = \"Test Bar\", altCastId = \"debugcast\", remaining = 5, name = GetSpellInfo(319941), spellIcon = 319941}, --debug \"Test (1)\" BW \"Test Bar\" DBM --DEBUG\n        --[154580] = {secondCastBar = true, altCastId = \"debugcast\", debuffTimer = 204242, name = GetSpellInfo(81297), spellIcon = 81297}, --debug \"Test (1)\" BW \"Test Bar\" DBM --DEBUG\n    }\n    \n    --set the castbar config\n    local config = {\n        iconTexture = \"\",\n        iconTexcoord = {0.1, 0.9, 0.1, 0.9},\n        iconAlpha = 1,\n        iconSize = 14,\n        \n        text = \"Boom!\",\n        textSize = 9,\n        \n        texture = [[Interface\\AddOns\\Plater\\images\\bar_background]],\n        color = \"silver\",\n        \n        isChanneling = false,\n        canInterrupt = false,\n        \n        height = 2,\n        width = Plater.db.profile.plate_config.enemynpc.health_incombat[1],\n        \n        spellNameAnchor = {side = 3, x = 0, y = -2},\n        timerAnchor = {side = 5, x = 0, y = -2},\n    }    \n    \n    function envTable.ShowAltCastBar(npcInfo, unitFrame, unitId, customTime, customStart)\n        --show the cast bar\n        if (npcInfo.timerId) then\n            local barObject = Plater.GetBossTimer(npcInfo.timerId)\n            if (barObject) then\n                if (npcInfo.remaining) then\n                    local timeLeft = barObject.timer + barObject.start - GetTime()\n                    if (timeLeft > npcInfo.remaining) then\n                        return\n                    end\n                end\n                \n                config.text = npcInfo.name\n                \n                if (npcInfo.spellIcon) then\n                    local _, _, iconTexture = GetSpellInfo(npcInfo.spellIcon)\n                    config.iconTexture = iconTexture\n                else\n                    config.iconTexture = \"\"\n                end\n                \n                Plater.SetAltCastBar(unitFrame.PlateFrame, config, barObject.timer, customStart or barObject.start, npcInfo.altCastId)\n            end\n        else\n            Plater.SetAltCastBar(unitFrame.PlateFrame, config, customTime or npcInfo.timer, customStart, npcInfo.altCastId)            \n        end\n        \n        DetailsFramework:TruncateText(unitFrame.castBar2.Text, unitFrame.castBar2:GetWidth() - 16)\n    end\nend",
					["NpcNames"] = {
						"164427", -- [1]
						"164414", -- [2]
						"164185", -- [3]
						"164567", -- [4]
						"165408", -- [5]
					},
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    local npcInfo = envTable.npcInfo[envTable._NpcID]\n    \n    if (npcInfo and npcInfo.secondCastBar) then\n        if (npcInfo.debuffTimer) then\n            if (Plater.NameplateHasAura (unitFrame, npcInfo.debuffTimer)) then\n                \n                local name = npcInfo.name\n                local _, _, _, _, duration, expirationTime = AuraUtil.FindAuraByName(name, unitId, \"DEBUFF\")\n                \n                envTable.ShowAltCastBar(npcInfo, unitFrame, unitId, duration, expirationTime-duration)\n            else\n                if (unitFrame.castBar2:IsShown()) then\n                    local altCastId = Plater.GetAltCastBarAltId(unitFrame.PlateFrame)\n                    if (altCastId == npcInfo.altCastId) then\n                        Plater.ClearAltCastBar(unitFrame.PlateFrame)\n                    end                   \n                end                              \n            end\n        else\n            envTable.ShowAltCastBar(npcInfo, unitFrame, unitId)\n        end\n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
					["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    Plater.ClearAltCastBar(unitFrame.PlateFrame)\nend",
					["Revision"] = 207,
					["Options"] = {
					},
					["SpellIds"] = {
					},
					["Prio"] = 99,
					["Author"] = "Aelerolor-Torghast",
					["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["Desc"] = "Some units has special events without a clear way to show. This script adds a second cast bar to inform the user about it.",
					["Name"] = "Countdown",
					["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    local npcInfo = envTable.npcInfo[envTable._NpcID]\n    \n    if (npcInfo and npcInfo.secondCastBar) then\n        if (npcInfo.timerId) then\n            local barObject = Plater.GetBossTimer(npcInfo.timerId)\n            if (barObject) then\n                local altCastId = Plater.GetAltCastBarAltId(unitFrame.PlateFrame)\n                if (altCastId ~= npcInfo.altCastId or not unitFrame.castBar2:IsShown()) then\n                    envTable.ShowAltCastBar(npcInfo, unitFrame, unitId)\n                end\n            end \n            \n        elseif (npcInfo.debuffTimer) then\n            if (Plater.NameplateHasAura (unitFrame, npcInfo.debuffTimer)) then\n                \n                --get the debuff timeleft\n                local name = npcInfo.name\n                local _, _, _, _, duration, expirationTime = AuraUtil.FindAuraByName(name, unitId, \"DEBUFF\")\n                local startTime = expirationTime - duration\n                \n                if (not unitFrame.castBar2:IsShown() or unitFrame.castBar2.spellStartTime < startTime) then\n                    envTable.ShowAltCastBar(npcInfo, unitFrame, unitId, duration, startTime)\n                end\n                \n            else \n                if (unitFrame.castBar2:IsShown()) then\n                    local altCastId = Plater.GetAltCastBarAltId(unitFrame.PlateFrame)\n                    if (altCastId == npcInfo.altCastId) then\n                        Plater.ClearAltCastBar(unitFrame.PlateFrame)\n                    end                   \n                end                              \n            end\n        end\n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
					["version"] = -1,
					["PlaterCore"] = 1,
					["semver"] = "",
					["Enabled"] = true,
					["url"] = "",
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    local npcInfo = envTable.npcInfo[envTable._NpcID]\n    \n    if (npcInfo and npcInfo.secondCastBar) then\n        if (npcInfo.timerId) then\n            local barObject = Plater.GetBossTimer(npcInfo.timerId)\n            if (barObject) then\n                local altCastId = Plater.GetAltCastBarAltId(unitFrame.PlateFrame)\n                if (altCastId ~= npcInfo.altCastId or not unitFrame.castBar2:IsShown()) then\n                    envTable.ShowAltCastBar(npcInfo, unitFrame, unitId)\n                end\n            end \n            \n        elseif (npcInfo.debuffTimer) then\n            if (Plater.NameplateHasAura (unitFrame, npcInfo.debuffTimer)) then\n                \n                --get the debuff timeleft\n                local name = npcInfo.name\n                local _, _, _, _, duration, expirationTime = AuraUtil.FindAuraByName(name, unitId, \"DEBUFF\")\n                local startTime = expirationTime - duration\n                \n                if (not unitFrame.castBar2:IsShown() or unitFrame.castBar2.spellStartTime < startTime) then\n                    envTable.ShowAltCastBar(npcInfo, unitFrame, unitId, duration, startTime)\n                end\n                \n            else \n                if (unitFrame.castBar2:IsShown()) then\n                    local altCastId = Plater.GetAltCastBarAltId(unitFrame.PlateFrame)\n                    if (altCastId == npcInfo.altCastId) then\n                        Plater.ClearAltCastBar(unitFrame.PlateFrame)\n                    end                   \n                end                              \n            end\n        end\n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
				}, -- [17]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --castbar color (when can be interrupted)\n    envTable.CastbarColor = scriptTable.config.castbarColor\n    \n    --flash duration\n    local CONFIG_BACKGROUND_FLASH_DURATION = scriptTable.config.flashDuration\n    \n    --add this value to the cast bar height\n    envTable.CastBarHeightAdd = scriptTable.config.castBarHeight\n    \n    --create a fast flash above the cast bar\n    envTable.FullBarFlash = envTable.FullBarFlash or Plater.CreateFlash (self, 0.05, 1, \"white\")\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, scriptTable.config.shakeDuration, scriptTable.config.shakeAmplitude, scriptTable.config.shakeFrequency, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))\n    \n    --create a texture to use for a flash behind the cast bar\n    local backGroundFlashTexture = Plater:CreateImage (self, [[Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Alert-Glow]], self:GetWidth()+60, self:GetHeight()+50, \"background\", {0, 400/512, 0, 170/256})\n    backGroundFlashTexture:SetBlendMode (\"ADD\")\n    backGroundFlashTexture:SetPoint (\"center\", self, \"center\")\n    backGroundFlashTexture:Hide()\n    \n    --create the animation hub to hold the flash animation sequence\n    envTable.BackgroundFlash = envTable.BackgroundFlash or Plater:CreateAnimationHub (backGroundFlashTexture, \n        function()\n            backGroundFlashTexture:Show()\n        end,\n        function()\n            backGroundFlashTexture:Hide()\n        end\n    )\n    \n    --create the flash animation sequence\n    envTable.BackgroundFlash.fadeIn = envTable.BackgroundFlash.fadeIn or Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 1, CONFIG_BACKGROUND_FLASH_DURATION/2, 0, .75)\n    envTable.BackgroundFlash.fadeIn:SetDuration(CONFIG_BACKGROUND_FLASH_DURATION/2)\n    \n    envTable.BackgroundFlash.fadeOut = envTable.BackgroundFlash.fadeOut or Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 2, CONFIG_BACKGROUND_FLASH_DURATION/2, 1, 0)    \n    envTable.BackgroundFlash.fadeOut:SetDuration(CONFIG_BACKGROUND_FLASH_DURATION/2)\n    \n    --envTable.BackgroundFlash:Play() --envTable.BackgroundFlash:Stop()    \n    \n    \n    \n    \n    \nend\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (not Plater.IsPlayerTank()) then\n        return\n    end\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\") then\n        return\n    end    \n    \n    unitFrame.castBar:SetHeight (envTable._DefaultHeight)\n    \n    --stop the camera shake\n    unitFrame:StopFrameShake (envTable.FrameShake)\n    \n    envTable.FullBarFlash:Stop()\n    envTable.BackgroundFlash:Stop()\n    \n    unitFrame.castBar.Spark:SetHeight(unitFrame.castBar:GetHeight())\n    \nend\n\n\n\n\n\n",
					["OptionsValues"] = {
					},
					["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (not Plater.IsPlayerTank()) then\n        return\n    end\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\") then\n        return\n    end\n    \n    --play flash animations\n    envTable.FullBarFlash:Play()\n    \n    --envTable.currentHeight = unitFrame.castBar:GetHeight()\n    \n    --restoring the default size (not required since it already restore in the hide script)\n    if (envTable.OriginalHeight) then\n        self:SetHeight (envTable.OriginalHeight)\n    end\n    \n    --increase the cast bar size\n    local height = self:GetHeight()\n    envTable.OriginalHeight = height\n    \n    self:SetHeight (height + envTable.CastBarHeightAdd)\n    \n    Plater.SetCastBarBorderColor (self, 1, .2, .2, 0.4)\n    \n    unitFrame:PlayFrameShake (envTable.FrameShake)\n    \n    --set the color of the cast bar to dark orange (only if can be interrupted)\n    --Plater auto set this color to default when a new cast starts, no need to reset this value at OnHide.    \n    if (envTable._CanInterrupt) then\n        if (scriptTable.config.useCastbarColor) then\n            self:SetStatusBarColor (Plater:ParseColors (envTable.CastbarColor))\n        end\n    end\n    \n    envTable.BackgroundFlash:Play()\n    \n    unitFrame.castBar.Spark:SetHeight(unitFrame.castBar:GetHeight())\n    \nend\n\n\n\n\n\n\n\n\n",
					["ScriptType"] = 2,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \nend\n\n\n",
					["Time"] = 1613183761,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar_tank",
					["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --castbar color (when can be interrupted)\n    envTable.CastbarColor = scriptTable.config.castbarColor\n    \n    --flash duration\n    local CONFIG_BACKGROUND_FLASH_DURATION = scriptTable.config.flashDuration\n    \n    --add this value to the cast bar height\n    envTable.CastBarHeightAdd = scriptTable.config.castBarHeight\n    \n    --create a fast flash above the cast bar\n    envTable.FullBarFlash = envTable.FullBarFlash or Plater.CreateFlash (self, 0.05, 1, \"white\")\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, scriptTable.config.shakeDuration, scriptTable.config.shakeAmplitude, scriptTable.config.shakeFrequency, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))\n    \n    --create a texture to use for a flash behind the cast bar\n    local backGroundFlashTexture = Plater:CreateImage (self, [[Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Alert-Glow]], self:GetWidth()+60, self:GetHeight()+50, \"background\", {0, 400/512, 0, 170/256})\n    backGroundFlashTexture:SetBlendMode (\"ADD\")\n    backGroundFlashTexture:SetPoint (\"center\", self, \"center\")\n    backGroundFlashTexture:Hide()\n    \n    --create the animation hub to hold the flash animation sequence\n    envTable.BackgroundFlash = envTable.BackgroundFlash or Plater:CreateAnimationHub (backGroundFlashTexture, \n        function()\n            backGroundFlashTexture:Show()\n        end,\n        function()\n            backGroundFlashTexture:Hide()\n        end\n    )\n    \n    --create the flash animation sequence\n    envTable.BackgroundFlash.fadeIn = envTable.BackgroundFlash.fadeIn or Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 1, CONFIG_BACKGROUND_FLASH_DURATION/2, 0, .75)\n    envTable.BackgroundFlash.fadeIn:SetDuration(CONFIG_BACKGROUND_FLASH_DURATION/2)\n    \n    envTable.BackgroundFlash.fadeOut = envTable.BackgroundFlash.fadeOut or Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 2, CONFIG_BACKGROUND_FLASH_DURATION/2, 1, 0)    \n    envTable.BackgroundFlash.fadeOut:SetDuration(CONFIG_BACKGROUND_FLASH_DURATION/2)\n    \n    --envTable.BackgroundFlash:Play() --envTable.BackgroundFlash:Stop()    \n    \n    \n    \n    \n    \nend\n\n\n",
					["NpcNames"] = {
					},
					["semver"] = "",
					["Enabled"] = true,
					["Revision"] = 837,
					["Options"] = {
						{
							["Type"] = 6,
							["Key"] = "option1",
							["Value"] = 0,
							["Name"] = "Blank Line",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [1]
						{
							["Type"] = 5,
							["Key"] = "option2",
							["Value"] = "Produces a notable effect in the cast bar when a spell from the 'Triggers' starts to cast.",
							["Name"] = "Option 2",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [2]
						{
							["Type"] = 5,
							["Key"] = "option3",
							["Value"] = "Enter the spell name or spellID of the Spell in the Add Trigger box and hit \"Add\".",
							["Name"] = "Option 3",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [3]
						{
							["Type"] = 6,
							["Key"] = "option4",
							["Value"] = 0,
							["Name"] = "Blank Space",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [4]
						{
							["Type"] = 4,
							["Key"] = "useCastbarColor",
							["Value"] = true,
							["Name"] = "Cast Bar Color Enabled",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "When enabled, changes the cast bar color,",
						}, -- [5]
						{
							["Type"] = 1,
							["Key"] = "castbarColor",
							["Value"] = {
								1, -- [1]
								0.43137254901961, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Name"] = "Cast Bar Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "Color of the cast bar.",
						}, -- [6]
						{
							["Type"] = 6,
							["Key"] = "option7",
							["Value"] = 0,
							["Name"] = "Blank Line",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [7]
						{
							["Type"] = 2,
							["Max"] = 1,
							["Desc"] = "When the cast starts it flash rapidly, adjust how fast it flashes. Value is milliseconds.",
							["Min"] = 0.05,
							["Key"] = "flashDuration",
							["Value"] = 0.2,
							["Name"] = "Flash Duration",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = true,
						}, -- [8]
						{
							["Type"] = 2,
							["Max"] = 10,
							["Desc"] = "Increases the cast bar height by this value",
							["Min"] = 0,
							["Key"] = "castBarHeight",
							["Value"] = 0,
							["Name"] = "Cast Bar Height Mod",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [9]
						{
							["Type"] = 2,
							["Max"] = 1,
							["Desc"] = "When the cast starts, there's a small shake in the nameplate, this settings controls how long it takes.",
							["Min"] = 0.1,
							["Key"] = "shakeDuration",
							["Value"] = 0.1,
							["Name"] = "Shake Duration",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = true,
						}, -- [10]
						{
							["Type"] = 2,
							["Max"] = 200,
							["Desc"] = "How strong is the shake.",
							["Min"] = 10,
							["Key"] = "shakeAmplitude",
							["Value"] = 25,
							["Name"] = "Shake Amplitude",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [11]
						{
							["Type"] = 2,
							["Max"] = 80,
							["Desc"] = "How fast the shake moves.",
							["Min"] = 1,
							["Key"] = "shakeFrequency",
							["Value"] = 30,
							["Name"] = "Shake Frequency",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [12]
					},
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (not Plater.IsPlayerTank()) then\n        return\n    end\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\") then\n        return\n    end\n    \n    --play flash animations\n    envTable.FullBarFlash:Play()\n    \n    --envTable.currentHeight = unitFrame.castBar:GetHeight()\n    \n    --restoring the default size (not required since it already restore in the hide script)\n    if (envTable.OriginalHeight) then\n        self:SetHeight (envTable.OriginalHeight)\n    end\n    \n    --increase the cast bar size\n    local height = self:GetHeight()\n    envTable.OriginalHeight = height\n    \n    self:SetHeight (height + envTable.CastBarHeightAdd)\n    \n    Plater.SetCastBarBorderColor (self, 1, .2, .2, 0.4)\n    \n    unitFrame:PlayFrameShake (envTable.FrameShake)\n    \n    --set the color of the cast bar to dark orange (only if can be interrupted)\n    --Plater auto set this color to default when a new cast starts, no need to reset this value at OnHide.    \n    if (envTable._CanInterrupt) then\n        if (scriptTable.config.useCastbarColor) then\n            self:SetStatusBarColor (Plater:ParseColors (envTable.CastbarColor))\n        end\n    end\n    \n    envTable.BackgroundFlash:Play()\n    \n    unitFrame.castBar.Spark:SetHeight(unitFrame.castBar:GetHeight())\n    \nend\n\n\n\n\n\n\n\n\n",
					["Name"] = "Cast - Tank Interrupt [P]",
					["Author"] = "Tercioo-Sylvanas",
					["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend",
					["Desc"] = "Cast alert for abilities which only the tank can interrupt.",
					["version"] = -1,
					["Prio"] = 99,
					["SpellIds"] = {
						321828, -- [1]
					},
					["PlaterCore"] = 1,
					["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \nend\n\n\n",
					["Temp_Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend",
					["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (not Plater.IsPlayerTank()) then\n        return\n    end\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\") then\n        return\n    end    \n    \n    unitFrame.castBar:SetHeight (envTable._DefaultHeight)\n    \n    --stop the camera shake\n    unitFrame:StopFrameShake (envTable.FrameShake)\n    \n    envTable.FullBarFlash:Stop()\n    envTable.BackgroundFlash:Stop()\n    \n    unitFrame.castBar.Spark:SetHeight(unitFrame.castBar:GetHeight())\n    \nend\n\n\n\n\n\n",
					["url"] = "",
				}, -- [18]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    envTable.EnergyAmount = Plater:CreateLabel (unitFrame, \"\", 16, \"silver\");\n    envTable.EnergyAmount:SetPoint (\"bottom\", unitFrame, \"top\", 0, 18);    \n    \n    envTable.EnergyAmount.fontsize = scriptTable.config.fontSize\n    envTable.EnergyAmount.fontcolor = scriptTable.config.fontColor\n    envTable.EnergyAmount.outline = scriptTable.config.outline\n    \n    \nend\n\n--[=[\n\n164406 = Shriekwing\n164407 = Sludgefist\n162100 = kryxis the voracious\n162099 = general kaal - sanguine depths\n162329 = Xav the Unfallen - threater of pain\n--]=]",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    envTable.EnergyAmount:Hide()\nend\n\n\n",
					["OptionsValues"] = {
					},
					["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    envTable.EnergyAmount:Show()\nend\n\n\n",
					["ScriptType"] = 3,
					["Temp_Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["Time"] = 1604357453,
					["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    envTable.EnergyAmount = Plater:CreateLabel (unitFrame, \"\", 16, \"silver\");\n    envTable.EnergyAmount:SetPoint (\"bottom\", unitFrame, \"top\", 0, 18);    \n    \n    envTable.EnergyAmount.fontsize = scriptTable.config.fontSize\n    envTable.EnergyAmount.fontcolor = scriptTable.config.fontColor\n    envTable.EnergyAmount.outline = scriptTable.config.outline\n    \n    \nend\n\n--[=[\n\n164406 = Shriekwing\n164407 = Sludgefist\n162100 = kryxis the voracious\n162099 = general kaal - sanguine depths\n162329 = Xav the Unfallen - threater of pain\n--]=]",
					["Icon"] = 136048,
					["NpcNames"] = {
						"164406", -- [1]
						"164407", -- [2]
						"162100", -- [3]
						"162099", -- [4]
						"162329", -- [5]
						"164558", -- [6]
					},
					["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    envTable.EnergyAmount:Hide()\nend\n\n\n",
					["Revision"] = 233,
					["Options"] = {
						{
							["Type"] = 6,
							["Key"] = "option1",
							["Value"] = 0,
							["Name"] = "Option 1",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [1]
						{
							["Type"] = 5,
							["Key"] = "option3",
							["Value"] = "Show the power of the unit above the nameplate.",
							["Name"] = "script desc",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [2]
						{
							["Type"] = 5,
							["Key"] = "option3",
							["Value"] = "Add the unit name or unitId in the \"Add Trigger\" field and press \"Add\".",
							["Name"] = "add trigger",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [3]
						{
							["Type"] = 6,
							["Key"] = "option2",
							["Value"] = 0,
							["Name"] = "Option 2",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [4]
						{
							["Type"] = 4,
							["Key"] = "showLater",
							["Value"] = true,
							["Name"] = "Show at 80% of Energy",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "If enabled, the energy won't start showing until the unit has 80% energy.",
						}, -- [5]
						{
							["Type"] = 6,
							["Key"] = "option2",
							["Value"] = 0,
							["Name"] = "Option 2",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [6]
						{
							["Type"] = 2,
							["Max"] = 32,
							["Desc"] = "Text size.",
							["Min"] = 8,
							["Key"] = "fontSize",
							["Value"] = 16,
							["Name"] = "Text Size",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [7]
						{
							["Type"] = 1,
							["Key"] = "fontColor",
							["Value"] = {
								0.80392156862745, -- [1]
								0.80392156862745, -- [2]
								0.80392156862745, -- [3]
								1, -- [4]
							},
							["Name"] = "Font Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "Color of the text.",
						}, -- [8]
						{
							["Type"] = 4,
							["Key"] = "outline",
							["Value"] = true,
							["Name"] = "Enable Text Outline",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "If enabled, the text uses outline.",
						}, -- [9]
					},
					["Desc"] = "Show the energy amount above the nameplate.",
					["SpellIds"] = {
					},
					["Author"] = "Celian-Sylvanas",
					["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    envTable.EnergyAmount:Show()\nend\n\n\n",
					["version"] = -1,
					["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    local currentPower = UnitPower(unitId)\n    \n    if (currentPower and currentPower > 0) then\n        local maxPower = UnitPowerMax (unitId)\n        local percent = floor (currentPower / maxPower * 100)\n        \n        envTable.EnergyAmount.text = \"\" .. percent;\n        \n        if (scriptTable.config.showLater) then\n            local alpha = (percent -80) * 5\n            alpha = alpha / 100\n            alpha = max(0, alpha)\n            envTable.EnergyAmount:SetAlpha(alpha)\n            \n        else\n            envTable.EnergyAmount:SetAlpha(1.0)\n        end\n        \n        \n    else\n        envTable.EnergyAmount.text = \"\"\n    end\nend\n\n\n\n\n\n\n\n\n",
					["Name"] = "Unit - Show Energy [Plater]",
					["PlaterCore"] = 1,
					["semver"] = "",
					["Enabled"] = true,
					["url"] = "",
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    local currentPower = UnitPower(unitId)\n    \n    if (currentPower and currentPower > 0) then\n        local maxPower = UnitPowerMax (unitId)\n        local percent = floor (currentPower / maxPower * 100)\n        \n        envTable.EnergyAmount.text = \"\" .. percent;\n        \n        if (scriptTable.config.showLater) then\n            local alpha = (percent -80) * 5\n            alpha = alpha / 100\n            alpha = max(0, alpha)\n            envTable.EnergyAmount:SetAlpha(alpha)\n            \n        else\n            envTable.EnergyAmount:SetAlpha(1.0)\n        end\n        \n        \n    else\n        envTable.EnergyAmount.text = \"\"\n    end\nend\n\n\n\n\n\n\n\n\n",
				}, -- [19]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \n    if (not unitFrame.spitefulTexture) then\n        unitFrame.spitefulTexture = unitFrame.healthBar:CreateTexture(nil, \"overlay\", nil, 6)\n        unitFrame.spitefulTexture:SetPoint('right', 0, 0)\n        unitFrame.spitefulTexture:SetSize(27, 14)\n        unitFrame.spitefulTexture:SetColorTexture(.3, .3, 1, .7)\n        \n        unitFrame.spitefulText = unitFrame.healthBar:CreateFontString(nil, \"overlay\", \"GameFontNormal\", 6)\n        DetailsFramework:SetFontFace (unitFrame.spitefulText, \"2002\")\n        unitFrame.spitefulText:SetPoint(\"right\", unitFrame.spitefulTexture, \"right\", -2, 0)\n        unitFrame.spitefulText:SetJustifyH(\"right\")\n        \n        unitFrame.roleIcon = unitFrame:CreateTexture(nil, \"overlay\")\n        unitFrame.roleIcon:SetPoint(\"left\", unitFrame.healthBar, \"left\", 2, 0)\n        unitFrame.targetName = unitFrame:CreateFontString(nil, \"overlay\", \"GameFontNormal\")\n        unitFrame.targetName:SetPoint(\"left\", unitFrame.roleIcon, \"right\", 2, 0)\n        \n        unitFrame.spitefulTexture:Hide()\n        unitFrame.spitefulText:Hide()\n    end\n    \n    function envTable.UpdateSpitefulWidget(unitFrame)\n        \n        local r, g, b, a = Plater:ParseColors(scriptTable.config.bgColor)\n        unitFrame.spitefulTexture:SetColorTexture(r, g, b, a)\n        unitFrame.spitefulTexture:SetSize(scriptTable.config.bgWidth, unitFrame.healthBar:GetHeight())   \n        Plater:SetFontSize(unitFrame.spitefulText, scriptTable.config.textSize)\n        Plater:SetFontColor(unitFrame.spitefulText, scriptTable.config.textColor)\n        \n        local currentHealth = unitFrame.healthBar.CurrentHealth\n        local maxHealth = unitFrame.healthBar.CurrentHealthMax\n        \n        local healthPercent = currentHealth / maxHealth * 100\n        local timeToDie = format(\"%.1fs\", healthPercent / 8)\n        unitFrame.spitefulText:SetText(timeToDie)\n        \n        unitFrame.spitefulText:Show()\n        unitFrame.spitefulTexture:Show()\n        \n        if scriptTable.config.switchTargetName then\n            local plateFrame = unitFrame.PlateFrame\n            \n            local target = UnitName(unitFrame.namePlateUnitToken .. \"target\") or UnitName(unitFrame.namePlateUnitToken)\n            \n            if (target and target ~= \"\") then\n                local _, class = UnitClass(unitFrame.namePlateUnitToken .. \"target\")\n                if (class) then\n                    target = DetailsFramework:AddClassColorToText(target, class)\n                end\n                \n                local role = UnitGroupRolesAssigned(unitFrame.namePlateUnitToken .. \"target\")\n                if (role and role ~= \"NONE\") then\n                    target = DetailsFramework:AddRoleIconToText(target, role)\n                end\n                \n                plateFrame.namePlateUnitName = target\n                Plater.UpdateUnitName(plateFrame)\n            end\n        end\n        \n        if scriptTable.config.useTargetingColor then\n            local targeted = UnitIsUnit(unitFrame.namePlateUnitToken .. \"target\", \"player\")\n            if targeted then\n                Plater.SetNameplateColor (unitFrame, scriptTable.config.targetingColor)\n            else\n                Plater.RefreshNameplateColor(unitFrame)\n            end\n        end\n    end\nend",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    if (unitFrame.spitefulTexture) then\n        unitFrame.spitefulText:Hide()\n        unitFrame.spitefulTexture:Hide()    \n        unitFrame.roleIcon:Hide()\n        unitFrame.targetName:Hide()\n    end\nend\n\n\n\n\n\n",
					["OptionsValues"] = {
					},
					["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.UpdateSpitefulWidget(unitFrame)\nend\n\n\n",
					["ScriptType"] = 3,
					["Temp_Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["Time"] = 1613183890,
					["Icon"] = 135945,
					["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \n    if (not unitFrame.spitefulTexture) then\n        unitFrame.spitefulTexture = unitFrame.healthBar:CreateTexture(nil, \"overlay\", nil, 6)\n        unitFrame.spitefulTexture:SetPoint('right', 0, 0)\n        unitFrame.spitefulTexture:SetSize(27, 14)\n        unitFrame.spitefulTexture:SetColorTexture(.3, .3, 1, .7)\n        \n        unitFrame.spitefulText = unitFrame.healthBar:CreateFontString(nil, \"overlay\", \"GameFontNormal\", 6)\n        DetailsFramework:SetFontFace (unitFrame.spitefulText, \"2002\")\n        unitFrame.spitefulText:SetPoint(\"right\", unitFrame.spitefulTexture, \"right\", -2, 0)\n        unitFrame.spitefulText:SetJustifyH(\"right\")\n        \n        unitFrame.roleIcon = unitFrame:CreateTexture(nil, \"overlay\")\n        unitFrame.roleIcon:SetPoint(\"left\", unitFrame.healthBar, \"left\", 2, 0)\n        unitFrame.targetName = unitFrame:CreateFontString(nil, \"overlay\", \"GameFontNormal\")\n        unitFrame.targetName:SetPoint(\"left\", unitFrame.roleIcon, \"right\", 2, 0)\n        \n        unitFrame.spitefulTexture:Hide()\n        unitFrame.spitefulText:Hide()\n    end\n    \n    function envTable.UpdateSpitefulWidget(unitFrame)\n        \n        local r, g, b, a = Plater:ParseColors(scriptTable.config.bgColor)\n        unitFrame.spitefulTexture:SetColorTexture(r, g, b, a)\n        unitFrame.spitefulTexture:SetSize(scriptTable.config.bgWidth, unitFrame.healthBar:GetHeight())   \n        Plater:SetFontSize(unitFrame.spitefulText, scriptTable.config.textSize)\n        Plater:SetFontColor(unitFrame.spitefulText, scriptTable.config.textColor)\n        \n        local currentHealth = unitFrame.healthBar.CurrentHealth\n        local maxHealth = unitFrame.healthBar.CurrentHealthMax\n        \n        local healthPercent = currentHealth / maxHealth * 100\n        local timeToDie = format(\"%.1fs\", healthPercent / 8)\n        unitFrame.spitefulText:SetText(timeToDie)\n        \n        unitFrame.spitefulText:Show()\n        unitFrame.spitefulTexture:Show()\n        \n        if scriptTable.config.switchTargetName then\n            local plateFrame = unitFrame.PlateFrame\n            \n            local target = UnitName(unitFrame.namePlateUnitToken .. \"target\") or UnitName(unitFrame.namePlateUnitToken)\n            \n            if (target and target ~= \"\") then\n                local _, class = UnitClass(unitFrame.namePlateUnitToken .. \"target\")\n                if (class) then\n                    target = DetailsFramework:AddClassColorToText(target, class)\n                end\n                \n                local role = UnitGroupRolesAssigned(unitFrame.namePlateUnitToken .. \"target\")\n                if (role and role ~= \"NONE\") then\n                    target = DetailsFramework:AddRoleIconToText(target, role)\n                end\n                \n                plateFrame.namePlateUnitName = target\n                Plater.UpdateUnitName(plateFrame)\n            end\n        end\n        \n        if scriptTable.config.useTargetingColor then\n            local targeted = UnitIsUnit(unitFrame.namePlateUnitToken .. \"target\", \"player\")\n            if targeted then\n                Plater.SetNameplateColor (unitFrame, scriptTable.config.targetingColor)\n            else\n                Plater.RefreshNameplateColor(unitFrame)\n            end\n        end\n    end\nend",
					["NpcNames"] = {
						"174773", -- [1]
					},
					["semver"] = "",
					["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    if (unitFrame.spitefulTexture) then\n        unitFrame.spitefulText:Hide()\n        unitFrame.spitefulTexture:Hide()    \n        unitFrame.roleIcon:Hide()\n        unitFrame.targetName:Hide()\n    end\nend\n\n\n\n\n\n",
					["Revision"] = 188,
					["Options"] = {
						{
							["Type"] = 5,
							["Key"] = "option12",
							["Value"] = "Time to Die",
							["Name"] = "Time to Die",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [1]
						{
							["Type"] = 2,
							["Max"] = 50,
							["Desc"] = "",
							["Min"] = 10,
							["Key"] = "bgWidth",
							["Value"] = 27,
							["Fraction"] = false,
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Name"] = "Width",
						}, -- [2]
						{
							["Type"] = 1,
							["Key"] = "bgColor",
							["Value"] = {
								0.5058823529411764, -- [1]
								0.07058823529411765, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["Name"] = "Background Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "",
						}, -- [3]
						{
							["Type"] = 2,
							["Max"] = 24,
							["Desc"] = "",
							["Min"] = 7,
							["Key"] = "textSize",
							["Value"] = 8,
							["Fraction"] = false,
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Name"] = "Text Size",
						}, -- [4]
						{
							["Type"] = 1,
							["Key"] = "textColor",
							["Value"] = {
								1, -- [1]
								0.5843137254901961, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Name"] = "Text Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "",
						}, -- [5]
						{
							["Type"] = 6,
							["Name"] = "Option 7",
							["Value"] = 0,
							["Key"] = "option7",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [6]
						{
							["Type"] = 5,
							["Key"] = "option11",
							["Value"] = "Targeting",
							["Name"] = "Targeting",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [7]
						{
							["Type"] = 4,
							["Name"] = "Show Target instead of Name",
							["Value"] = true,
							["Key"] = "switchTargetName",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "",
						}, -- [8]
						{
							["Type"] = 4,
							["Name"] = "Change Color if targeting You",
							["Value"] = true,
							["Key"] = "useTargetingColor",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "",
						}, -- [9]
						{
							["Type"] = 1,
							["Name"] = "Color if targeting You",
							["Value"] = {
								0.07058823529411765, -- [1]
								0.6196078431372549, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Key"] = "targetingColor",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "",
						}, -- [10]
						{
							["Type"] = 6,
							["Key"] = "option11",
							["Value"] = 0,
							["Name"] = "Option 11",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [11]
					},
					["version"] = -1,
					["Prio"] = 99,
					["Author"] = "Symantec-Azralon",
					["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["Desc"] = "Time to die Spiteful affix",
					["Name"] = "M+ Spiteful",
					["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.UpdateSpitefulWidget(unitFrame)\nend\n\n\n",
					["SpellIds"] = {
					},
					["PlaterCore"] = 1,
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.UpdateSpitefulWidget(unitFrame)\nend\n\n\n",
					["Enabled"] = true,
					["url"] = "",
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.UpdateSpitefulWidget(unitFrame)\nend\n\n\n",
				}, -- [20]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \n    envTable.lifePercent = {\n        --npcId         percent divisions\n        --[87760] = {80, 30},   --debug\n        [166608] = {10},   --무에젤라\n        [164555] = {10},   --마나스톰 부부\n        [164556] = {10},   \n        [164967] = {66, 33},   --의사 이커스\n        [164267] = {66, 33},   --후작 스트라디마\n        [162061] = {70, 30},   --데보스\n        [162133] = {90, 80, 70},   --장군 카알\n        [162099] = {50},   \n        [164451] = {40}, --데시아\n        [164463] = {40}, --파세란\n        [164461] = {40}, --사델\n        [165946]= {50}, --모르드레타\n        [164501] = {70, 40, 10}, --미스트콜러\n        [164804] = {20}, --울파란\n        [164517] = {70, 40}, --트레도바\n        \n        --레이드\n        [168112] = {50}, --돌군단 장군  \n        [168113] = {50},   \n        [166969] = {50}, --혈기의 의회\n        [166970] = {50},   \n        [166971] = {50},   \n    }\n    \n    function envTable.CreateMarker(unitFrame)\n        local DB_PLATE_CONFIG = Plater.db.profile.plate_config\n        local actorType = unitFrame.ActorType        \n        \n        unitFrame.healthMarker = unitFrame.healthBar:CreateTexture(nil, \"overlay\")\n        unitFrame.healthMarker:SetColorTexture(1, 1, 1)\n        unitFrame.healthMarker:SetSize(1, DB_PLATE_CONFIG[actorType].health_incombat [2])\n        \n        unitFrame.healthOverlay = unitFrame.healthBar:CreateTexture(nil, \"overlay\")\n        unitFrame.healthOverlay:SetColorTexture(1, 1, 1)\n        unitFrame.healthOverlay:SetSize(1, DB_PLATE_CONFIG[actorType].health_incombat [2])\n    end\n    \n    function envTable.UpdateMarkers(unitFrame)\n        local markersTable = envTable.lifePercent[envTable._NpcID]\n        if (markersTable) then\n            local unitLifePercent = envTable._HealthPercent / 100\n            for i, percent in ipairs(markersTable) do\n                percent = percent / 100\n                if (unitLifePercent > percent) then\n                    if (not unitFrame.healthMarker) then\n                        envTable.CreateMarker(unitFrame)\n                    end\n                    \n                    unitFrame.healthMarker:Show()\n                    local width = unitFrame.healthBar:GetWidth()\n                    unitFrame.healthMarker:SetPoint(\"left\", unitFrame.healthBar, \"left\", width*percent, 0)\n                    \n                    local overlaySize = width * (percent)\n                    unitFrame.healthOverlay:SetWidth(overlaySize)\n                    unitFrame.healthOverlay:SetPoint(\"right\", unitFrame.healthMarker, \"left\", 0, 0)\n                    \n                    unitFrame.healthMarker:SetVertexColor(Plater:ParseColors(scriptTable.config.indicatorColor))\n                    unitFrame.healthMarker:SetAlpha(scriptTable.config.indicatorAlpha)\n                    \n                    unitFrame.healthOverlay:SetVertexColor(Plater:ParseColors(scriptTable.config.fillColor))\n                    unitFrame.healthOverlay:SetAlpha(scriptTable.config.fillAlpha)\n                    \n                    return\n                end\n            end --end for\n            \n            if (unitFrame.healthMarker and unitFrame.healthMarker:IsShown()) then\n                unitFrame.healthMarker:Hide()\n                unitFrame.healthOverlay:Hide()\n            end\n        end\n    end\nend      \n\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    if (unitFrame.healthMarker) then\n        unitFrame.healthMarker:Hide()\n        unitFrame.healthOverlay:Hide()\n    end\nend\n\n\n\n\n",
					["OptionsValues"] = {
					},
					["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.UpdateMarkers(unitFrame)    \nend    \n\n\n",
					["ScriptType"] = 3,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.UpdateMarkers(unitFrame)    \nend    \n\n\n",
					["Time"] = 1613183788,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\health_indicator",
					["url"] = "https://wago.io/yBzHj6t19/6",
					["NpcNames"] = {
						"164451", -- [1]
						"164463", -- [2]
						"164461", -- [3]
						"165946", -- [4]
						"164501", -- [5]
						"164218", -- [6]
						"162133", -- [7]
						"162061", -- [8]
						"164267", -- [9]
						"164555", -- [10]
						"164556", -- [11]
						"164967", -- [12]
						"166608", -- [13]
						"168112", -- [14]
						"168113", -- [15]
						"166969", -- [16]
						"166970", -- [17]
						"166971", -- [18]
						"164804", -- [19]
						"164517", -- [20]
						"87760", -- [21]
					},
					["semver"] = "1.0.5",
					["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    if (unitFrame.healthMarker) then\n        unitFrame.healthMarker:Hide()\n        unitFrame.healthOverlay:Hide()\n    end\nend\n\n\n\n\n",
					["Revision"] = 340,
					["Options"] = {
						{
							["Type"] = 5,
							["Name"] = "Option 1",
							["Value"] = "Add markers into the health bar to remind you about boss abilities at life percent.",
							["Key"] = "option1",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [1]
						{
							["Type"] = 6,
							["Name"] = "blank line",
							["Value"] = 0,
							["Key"] = "",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [2]
						{
							["Type"] = 1,
							["Name"] = "Vertical Line Color",
							["Value"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["Key"] = "indicatorColor",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "Indicator color.",
						}, -- [3]
						{
							["Type"] = 2,
							["Max"] = 1,
							["Desc"] = "Indicator alpha.",
							["Min"] = 0.1,
							["Fraction"] = true,
							["Value"] = 0.85,
							["Name"] = "Vertical Line Alpha",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Key"] = "indicatorAlpha",
						}, -- [4]
						{
							["Type"] = 6,
							["Name"] = "blank line",
							["Value"] = 0,
							["Key"] = "",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [5]
						{
							["Type"] = 1,
							["Name"] = "Fill Color",
							["Value"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["Key"] = "fillColor",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "Fill color.",
						}, -- [6]
						{
							["Type"] = 2,
							["Max"] = 1,
							["Desc"] = "Fill alpha.",
							["Min"] = 0,
							["Fraction"] = true,
							["Value"] = 0.67,
							["Name"] = "Fill Alpha",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Key"] = "fillAlpha",
						}, -- [7]
					},
					["version"] = 6,
					["Prio"] = 99,
					["Author"] = "Aelerolor-Torghast",
					["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.UpdateMarkers(unitFrame)    \nend    \n\n\n",
					["Name"] = "Unit - Health Markers [Fixed]",
					["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.UpdateMarkers(unitFrame)    \nend    \n\n\n",
					["SpellIds"] = {
					},
					["PlaterCore"] = 1,
					["Desc"] = "Place a marker into the health bar to indicate when the unit will change phase or cast an important spell.",
					["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \n    envTable.lifePercent = {\n        --npcId         percent divisions\n        --[87760] = {80, 30},   --debug\n        [166608] = {10},   --무에젤라\n        [164555] = {10},   --마나스톰 부부\n        [164556] = {10},   \n        [164967] = {66, 33},   --의사 이커스\n        [164267] = {66, 33},   --후작 스트라디마\n        [162061] = {70, 30},   --데보스\n        [162133] = {90, 80, 70},   --장군 카알\n        [162099] = {50},   \n        [164451] = {40}, --데시아\n        [164463] = {40}, --파세란\n        [164461] = {40}, --사델\n        [165946]= {50}, --모르드레타\n        [164501] = {70, 40, 10}, --미스트콜러\n        [164804] = {20}, --울파란\n        [164517] = {70, 40}, --트레도바\n        \n        --레이드\n        [168112] = {50}, --돌군단 장군  \n        [168113] = {50},   \n        [166969] = {50}, --혈기의 의회\n        [166970] = {50},   \n        [166971] = {50},   \n    }\n    \n    function envTable.CreateMarker(unitFrame)\n        local DB_PLATE_CONFIG = Plater.db.profile.plate_config\n        local actorType = unitFrame.ActorType        \n        \n        unitFrame.healthMarker = unitFrame.healthBar:CreateTexture(nil, \"overlay\")\n        unitFrame.healthMarker:SetColorTexture(1, 1, 1)\n        unitFrame.healthMarker:SetSize(1, DB_PLATE_CONFIG[actorType].health_incombat [2])\n        \n        unitFrame.healthOverlay = unitFrame.healthBar:CreateTexture(nil, \"overlay\")\n        unitFrame.healthOverlay:SetColorTexture(1, 1, 1)\n        unitFrame.healthOverlay:SetSize(1, DB_PLATE_CONFIG[actorType].health_incombat [2])\n    end\n    \n    function envTable.UpdateMarkers(unitFrame)\n        local markersTable = envTable.lifePercent[envTable._NpcID]\n        if (markersTable) then\n            local unitLifePercent = envTable._HealthPercent / 100\n            for i, percent in ipairs(markersTable) do\n                percent = percent / 100\n                if (unitLifePercent > percent) then\n                    if (not unitFrame.healthMarker) then\n                        envTable.CreateMarker(unitFrame)\n                    end\n                    \n                    unitFrame.healthMarker:Show()\n                    local width = unitFrame.healthBar:GetWidth()\n                    unitFrame.healthMarker:SetPoint(\"left\", unitFrame.healthBar, \"left\", width*percent, 0)\n                    \n                    local overlaySize = width * (percent)\n                    unitFrame.healthOverlay:SetWidth(overlaySize)\n                    unitFrame.healthOverlay:SetPoint(\"right\", unitFrame.healthMarker, \"left\", 0, 0)\n                    \n                    unitFrame.healthMarker:SetVertexColor(Plater:ParseColors(scriptTable.config.indicatorColor))\n                    unitFrame.healthMarker:SetAlpha(scriptTable.config.indicatorAlpha)\n                    \n                    unitFrame.healthOverlay:SetVertexColor(Plater:ParseColors(scriptTable.config.fillColor))\n                    unitFrame.healthOverlay:SetAlpha(scriptTable.config.fillAlpha)\n                    \n                    return\n                end\n            end --end for\n            \n            if (unitFrame.healthMarker and unitFrame.healthMarker:IsShown()) then\n                unitFrame.healthMarker:Hide()\n                unitFrame.healthOverlay:Hide()\n            end\n        end\n    end\nend      \n\n\n\n\n\n",
					["Enabled"] = true,
					["Temp_Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
				}, -- [21]
			},
			["url"] = "https://wago.io/1ZozQnKxj/23",
			["cast_statusbar_fadein_time"] = 0.02081192471087,
			["aura2_y_offset"] = 8,
			["aura_timer_text_anchor"] = {
				["y"] = -7,
				["x"] = -1,
				["side"] = 1,
			},
			["buffs_on_aura2"] = true,
			["cast_statusbar_color_nointerrupt"] = {
				0.49411764705882, -- [1]
				0.49803921568627, -- [2]
				0.50196078431373, -- [3]
				0.96000000089407, -- [4]
			},
			["first_run2"] = true,
			["npc_cache"] = {
				[36877] = {
					"Wrathbone Skeleton", -- [1]
					"Pit of Saron", -- [2]
				},
				[69899] = {
					"Farraki Sand Conjurer", -- [1]
					"Throne of Thunder", -- [2]
				},
				[37133] = {
					"Ymirjar Warlord", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[165872] = {
					"Flesh Crafter", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[124158] = {
					"Imonar the Soulhunter", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[33806] = {
					"Void Beast", -- [1]
					"Ulduar", -- [2]
				},
				[34190] = {
					"Hardened Iron Golem", -- [1]
					"Ulduar", -- [2]
				},
				[170480] = {
					"Atal'ai Deathwalker", -- [1]
					"De Other Side", -- [2]
				},
				[134137] = {
					"Temple Attendant", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[159219] = {
					"Umbral Seer", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[127230] = {
					"Garothi Annihilator", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[127486] = {
					"Ashvane Officer", -- [1]
					"Tol Dagor", -- [2]
				},
				[169457] = {
					"Bargast", -- [1]
					"Castle Nathria", -- [2]
				},
				[136186] = {
					"Tidesage Spiritualist", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[169458] = {
					"Hecutis", -- [1]
					"Castle Nathria", -- [2]
				},
				[36494] = {
					"Forgemaster Garfrost", -- [1]
					"Pit of Saron", -- [2]
				},
				[69133] = {
					"Unharnessed Power", -- [1]
					"Throne of Thunder", -- [2]
				},
				[127231] = {
					"Garothi Decimator", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[37134] = {
					"Ymirjar Huntress", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[53642] = {
					"Cinderweb Spinner", -- [1]
					"Firelands", -- [2]
				},
				[170483] = {
					"Atal'ai Deathwalker's Spirit", -- [1]
					"De Other Side", -- [2]
				},
				[69134] = {
					"Kazra'jin", -- [1]
					"Throne of Thunder", -- [2]
				},
				[69390] = {
					"Zandalari Storm-Caller", -- [1]
					"Throne of Thunder", -- [2]
				},
				[127488] = {
					"Ashvane Flamecaster", -- [1]
					"Tol Dagor", -- [2]
				},
				[43917] = {
					"Rock Borer", -- [1]
					"The Stonecore", -- [2]
				},
				[172021] = {
					"Coldheart Automaton", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[174069] = {
					"Hulking Gargon", -- [1]
					"Castle Nathria", -- [2]
				},
				[170486] = {
					"Atal'ai Devoted", -- [1]
					"De Other Side", -- [2]
				},
				[36879] = {
					"Plagueborn Horror", -- [1]
					"Pit of Saron", -- [2]
				},
				[37007] = {
					"Deathbound Ward", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[161273] = {
					"Abyssal Spawn", -- [1]
					"Chamber of Heart - Scenario", -- [2]
				},
				[174070] = {
					"Kennel Overseer", -- [1]
					"Castle Nathria", -- [2]
				},
				[134144] = {
					"Living Current", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[131585] = {
					"Enthralled Guard", -- [1]
					"Waycrest Manor", -- [2]
				},
				[164857] = {
					"Spriggan Mendbender", -- [1]
					"De Other Side", -- [2]
				},
				[34192] = {
					"Boomer XP-500", -- [1]
					"Ulduar", -- [2]
				},
				[174071] = {
					"Vicious Gargon", -- [1]
					"Castle Nathria", -- [2]
				},
				[170488] = {
					"Son of Hakkar", -- [1]
					"De Other Side", -- [2]
				},
				[135169] = {
					"Spirit Drain Totem", -- [1]
					"The Underrot", -- [2]
				},
				[131586] = {
					"Banquet Steward", -- [1]
					"Waycrest Manor", -- [2]
				},
				[127490] = {
					"Knight Captain Valyri", -- [1]
					"Tol Dagor", -- [2]
				},
				[43662] = {
					"Unbound Earth Rager", -- [1]
					"The Stonecore", -- [2]
				},
				[156157] = {
					"Coldheart Ascendant", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[170490] = {
					"Atal'ai High Priest", -- [1]
					"De Other Side", -- [2]
				},
				[36880] = {
					"Decaying Colossus", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[69905] = {
					"Gurubashi Berserker", -- [1]
					"Throne of Thunder", -- [2]
				},
				[13447] = {
					"Corporal Noreg Stormpike", -- [1]
					"Alterac Valley", -- [2]
				},
				[166396] = {
					"Noble Skirmisher", -- [1]
					"Sanguine Depths", -- [2]
				},
				[156159] = {
					"Coldheart Javelineer", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[173051] = {
					"Suppressor Xelors", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[118022] = {
					"Infernal Chaosbringer", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[163326] = {
					"Skeletal Defender", -- [1]
					"Maldraxxus Covenant Finale Scenario", -- [2]
				},
				[73745] = {
					"Kor'kron Iron Sentinel", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[69906] = {
					"Zandalari High Priest", -- [1]
					"Throne of Thunder", -- [2]
				},
				[164862] = {
					"Weald Shimmermoth", -- [1]
					"De Other Side", -- [2]
				},
				[162303] = {
					"Aqir Swarmkeeper", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[134150] = {
					"Runecarver Sorn", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[139269] = {
					"Gloom Horror", -- [1]
					"Waycrest Manor", -- [2]
				},
				[156161] = {
					"Inquisitor Gnshal", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[36881] = {
					"Skeletal Slave", -- [1]
					"Pit of Saron", -- [2]
				},
				[123398] = {
					"Garothi Annihilator", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[53901] = {
					"Unstable Magma", -- [1]
					"Firelands", -- [2]
				},
				[138247] = {
					"Irontide Marauder", -- [1]
					"Siege of Boralus", -- [2]
				},
				[163841] = {
					"Amalgamation of Flesh", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[162306] = {
					"Aqir Drone", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[29834] = {
					"Drakkari Frenzy", -- [1]
					"Gundrak", -- [2]
				},
				[173568] = {
					"Anima Crazed Worker", -- [1]
					"Castle Nathria", -- [2]
				},
				[681] = {
					"LilC", -- [1]
					"Waycrest Manor", -- [2]
				},
				[163331] = {
					"Stone Legion Nightblade", -- [1]
					"Revendreth Scenario", -- [2]
				},
				[164355] = {
					"Manifestation of Pride", -- [1]
					"Revendreth Scenario", -- [2]
				},
				[168962] = {
					"Reborn Phoenix", -- [1]
					"Castle Nathria", -- [2]
				},
				[117769] = {
					"Felborne Spellbreaker", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[36626] = {
					"Festergut", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[53134] = {
					"Ancient Core Hound", -- [1]
					"Firelands", -- [2]
				},
				[126983] = {
					"Harlan Sweete", -- [1]
					"Freehold", -- [2]
				},
				[69909] = {
					"Amani'shi Flame Chanter", -- [1]
					"Throne of Thunder", -- [2]
				},
				[26763] = {
					"Anomalus", -- [1]
					"The Nexus", -- [2]
				},
				[162309] = {
					"Kul'tharok", -- [1]
					"Theater of Pain", -- [2]
				},
				[72981] = {
					"Aggron", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[134157] = {
					"Shadow-Borne Warrior", -- [1]
					"Kings' Rest", -- [2]
				},
				[155656] = {
					"Misha", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[69910] = {
					"Drakkari Frost Warden", -- [1]
					"Throne of Thunder", -- [2]
				},
				[5925] = {
					"Grounding Totem", -- [1]
					"The Battle for Gilneas", -- [2]
				},
				[153097] = {
					"Voidbound Shaman", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[43537] = {
					"Stonecore Earthshaper", -- [1]
					"The Stonecore", -- [2]
				},
				[162311] = {
					"Death Knight", -- [1]
					"Vision of Ysera Scenario", -- [2]
				},
				[134158] = {
					"Shadow-Borne Champion", -- [1]
					"Kings' Rest", -- [2]
				},
				[155657] = {
					"Huffer", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[162312] = {
					"Druid", -- [1]
					"Vision of Ysera Scenario", -- [2]
				},
				[138254] = {
					"Irontide Powdershot", -- [1]
					"Siege of Boralus", -- [2]
				},
				[12264] = {
					"Shazzrah", -- [1]
					"Molten Core", -- [2]
				},
				[122890] = {
					"Fanatical Pyromancer", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[37011] = {
					"The Damned", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[127497] = {
					"Ashvane Warden", -- [1]
					"Tol Dagor", -- [2]
				},
				[162313] = {
					"Mage", -- [1]
					"Vision of Ysera Scenario", -- [2]
				},
				[138255] = {
					"Ashvane Spotter", -- [1]
					"Siege of Boralus", -- [2]
				},
				[168968] = {
					"Plaguebound Fallen", -- [1]
					"Plaguefall", -- [2]
				},
				[34196] = {
					"Rune Etched Sentry", -- [1]
					"Ulduar", -- [2]
				},
				[72983] = {
					"Corrupted Skullsplitter", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[159755] = {
					"The Grand Malleare", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[119052] = {
					"War Banner", -- [1]
					"Silvershard Mines", -- [2]
				},
				[168969] = {
					"Gushing Slime", -- [1]
					"Plaguefall", -- [2]
				},
				[137233] = {
					"Plague Toad", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[164363] = {
					"Undying Stonefiend", -- [1]
					"Halls of Atonement", -- [2]
				},
				[129802] = {
					"Earthrager", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[72728] = {
					"Kor'kron Blood Axe", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[166411] = {
					"Forsworn Usurper", -- [1]
					"Spires of Ascension", -- [2]
				},
				[13320] = {
					"Commander Karl Philips", -- [1]
					"Alterac Valley", -- [2]
				},
				[37012] = {
					"Ancient Skeletal Soldier", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[26764] = {
					"Ilsa Direbrew", -- [1]
					"Blackrock Depths", -- [2]
				},
				[53648] = {
					"Inferno Hawk", -- [1]
					"Firelands", -- [2]
				},
				[174090] = {
					"Nathrian Hierarch", -- [1]
					"Castle Nathria", -- [2]
				},
				[162317] = {
					"Gorechop", -- [1]
					"Theater of Pain", -- [2]
				},
				[9545] = {
					"Grim Patron", -- [1]
					"Blackrock Depths", -- [2]
				},
				[34197] = {
					"Chamber Overseer", -- [1]
					"Ulduar", -- [2]
				},
				[162318] = {
					"Monk", -- [1]
					"Vision of Ysera Scenario", -- [2]
				},
				[167949] = {
					"Plague-Ridden Survivor", -- [1]
					"Plaguefall", -- [2]
				},
				[74009] = {
					"Crawler Mine", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[168973] = {
					"High Torturer Darithos", -- [1]
					"Castle Nathria", -- [2]
				},
				[174092] = {
					"Nathrian Gargon Rider", -- [1]
					"Castle Nathria", -- [2]
				},
				[154129] = {
					"Burning Emberguard", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[136214] = {
					"Windspeaker Heldis", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[174093] = {
					"Nathrian Ranger", -- [1]
					"Castle Nathria", -- [2]
				},
				[162320] = {
					"Shaman", -- [1]
					"Vision of Ysera Scenario", -- [2]
				},
				[150547] = {
					"Scrapbone Grunter", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[127757] = {
					"Reanimated Honor Guard", -- [1]
					"Atal'Dazar", -- [2]
				},
				[54161] = {
					"Flame Archon", -- [1]
					"Firelands", -- [2]
				},
				[163857] = {
					"Plaguebound Devoted", -- [1]
					"Plaguefall", -- [2]
				},
				[139799] = {
					"Ironhull Apprentice", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[117264] = {
					"Maiden of Valor", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[34198] = {
					"Iron Mender", -- [1]
					"Ulduar", -- [2]
				},
				[165905] = {
					"Son of Hakkar", -- [1]
					"De Other Side", -- [2]
				},
				[139800] = {
					"Galecaller Apprentice", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[29836] = {
					"Drakkari Battle Rider", -- [1]
					"Gundrak", -- [2]
				},
				[26125] = {
					"Beetlerobber", -- [1]
					"Waycrest Manor", -- [2]
				},
				[135706] = {
					"Bilge Rat Looter", -- [1]
					"Tol Dagor", -- [2]
				},
				[129550] = {
					"Bilge Rat Padfoot", -- [1]
					"Freehold", -- [2]
				},
				[161812] = {
					"Faceless Ruiner", -- [1]
					"Chamber of Heart - Scenario", -- [2]
				},
				[118289] = {
					"Maiden of Vigilance", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[167955] = {
					"Sanguine Cadet", -- [1]
					"Sanguine Depths", -- [2]
				},
				[127503] = {
					"Overseer Korgus", -- [1]
					"Tol Dagor", -- [2]
				},
				[70429] = {
					"Flesh'rok the Diseased", -- [1]
					"Throne of Thunder", -- [2]
				},
				[161813] = {
					"K'thir Assassin", -- [1]
					"Chamber of Heart - Scenario", -- [2]
				},
				[162325] = {
					"Warrior", -- [1]
					"Vision of Ysera Scenario", -- [2]
				},
				[37782] = {
					"Flesh-eating Insect", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[167956] = {
					"Dark Acolyte", -- [1]
					"Sanguine Depths", -- [2]
				},
				[34199] = {
					"Lightning Charged Iron Dwarf", -- [1]
					"Ulduar", -- [2]
				},
				[101398] = {
					"Psyfiend", -- [1]
					"Eye of the Storm", -- [2]
				},
				[162326] = {
					"Priest", -- [1]
					"Vision of Ysera Scenario", -- [2]
				},
				[175123] = {
					"Warden Arkoban", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[163862] = {
					"Defender of Many Eyes", -- [1]
					"Plaguefall", -- [2]
				},
				[152089] = {
					"Thrall", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[23694] = {
					"Pulsing Pumpkin", -- [1]
					"Scarlet Monastery", -- [2]
				},
				[161815] = {
					"K'thir Voidcaller", -- [1]
					"Chamber of Heart - Scenario", -- [2]
				},
				[162327] = {
					"Rogue", -- [1]
					"Vision of Ysera Scenario", -- [2]
				},
				[134174] = {
					"Shadow-Borne Witch Doctor", -- [1]
					"Kings' Rest", -- [2]
				},
				[134686] = {
					"Mature Krolusk", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[129552] = {
					"Monzumi", -- [1]
					"Atal'Dazar", -- [2]
				},
				[165911] = {
					"Loyal Creation", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[162328] = {
					"Warlock", -- [1]
					"Vision of Ysera Scenario", -- [2]
				},
				[151579] = {
					"Shield Generator", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[136735] = {
					"Ashvane Marine", -- [1]
					"Tol Dagor", -- [2]
				},
				[162329] = {
					"Xav the Unfallen", -- [1]
					"Theater of Pain", -- [2]
				},
				[120851] = {
					"Hippogryph Lord Varah", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[129553] = {
					"Dinomancer Kish'o", -- [1]
					"Atal'Dazar", -- [2]
				},
				[165913] = {
					"Ghastly Parishioner", -- [1]
					"Halls of Atonement", -- [2]
				},
				[162330] = {
					"Demon Hunter", -- [1]
					"Vision of Ysera Scenario", -- [2]
				},
				[173080] = {
					"Wandering Death", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[167962] = {
					"Defunct Dental Drill", -- [1]
					"De Other Side", -- [2]
				},
				[168986] = {
					"Skeletal Raptor", -- [1]
					"De Other Side", -- [2]
				},
				[169498] = {
					"Plague Bomb", -- [1]
					"Plaguefall", -- [2]
				},
				[149535] = {
					"Icebound Image", -- [1]
					"Battle of Dazar'alor", -- [2]
				},
				[13257] = {
					"Murgot Deepforge", -- [1]
					"Alterac Valley", -- [2]
				},
				[53140] = {
					"Son of Flame", -- [1]
					"Firelands", -- [2]
				},
				[167963] = {
					"Headless Client", -- [1]
					"De Other Side", -- [2]
				},
				[37016] = {
					"Skybreaker Luminary", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[37144] = {
					"Skybreaker Marksman", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[153119] = {
					"Lesser Void Elemental", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[33433] = {
					"Suit of Armor", -- [1]
					"Ulduar", -- [2]
				},
				[13577] = {
					"Stormpike Ram Rider Commander", -- [1]
					"Alterac Valley", -- [2]
				},
				[168988] = {
					"Overgrowth", -- [1]
					"Mists of Tirna Scithe", -- [2]
				},
				[117782] = {
					"Eredar Bloodmage", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[167965] = {
					"Lubricator", -- [1]
					"De Other Side", -- [2]
				},
				[167966] = {
					"Experimental Sludge", -- [1]
					"De Other Side", -- [2]
				},
				[24207] = {
					"Army of the Dead", -- [1]
					"Waycrest Manor", -- [2]
				},
				[165919] = {
					"Skeletal Marauder", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[73250] = {
					"Kor'kron Wild Gun", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[53141] = {
					"Molten Surger", -- [1]
					"Firelands", -- [2]
				},
				[167967] = {
					"Sentient Oil", -- [1]
					"De Other Side", -- [2]
				},
				[37017] = {
					"Skybreaker Assassin", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[70179] = {
					"Ritual Guard", -- [1]
					"Throne of Thunder", -- [2]
				},
				[165408] = {
					"Halkias", -- [1]
					"Halls of Atonement", -- [2]
				},
				[99868] = {
					"Fenryr", -- [1]
					"Halls of Valor", -- [2]
				},
				[159266] = {
					"Portal Master", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[71715] = {
					"Orgrimmar Faithful", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[168992] = {
					"Risen Cultist", -- [1]
					"De Other Side", -- [2]
				},
				[72483] = {
					"Sarok", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[122135] = {
					"Shatug", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[155684] = {
					"Depthcaller Xith'el", -- [1]
					"Mogu'shan Scenario", -- [2]
				},
				[160291] = {
					"Ashwalker Assassin", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[29838] = {
					"Drakkari Rhino", -- [1]
					"Gundrak", -- [2]
				},
				[165410] = {
					"High Adjudicator Aleez", -- [1]
					"Halls of Atonement", -- [2]
				},
				[154149] = {
					"Karolek", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[138281] = {
					"Faceless Corruptor", -- [1]
					"The Underrot", -- [2]
				},
				[155685] = {
					"Deephive Soldier", -- [1]
					"Mogu'shan Scenario", -- [2]
				},
				[72484] = {
					"Zazo", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[154150] = {
					"Kamari", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[130582] = {
					"Despondent Scallywag", -- [1]
					"Tol Dagor", -- [2]
				},
				[154663] = {
					"Gnome-Eating Droplet", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[33819] = {
					"Twilight Frost Mage", -- [1]
					"Ulduar", -- [2]
				},
				[129559] = {
					"Cutwater Duelist", -- [1]
					"Freehold", -- [2]
				},
				[72485] = {
					"Goma", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[11658] = {
					"Molten Giant", -- [1]
					"Molten Core", -- [2]
				},
				[134701] = {
					"Blood Effigy", -- [1]
					"The Underrot", -- [2]
				},
				[63508] = {
					"Xuen", -- [1]
					"Eye of the Storm", -- [2]
				},
				[78116] = {
					"Water Elemental", -- [1]
					"Waycrest Manor", -- [2]
				},
				[148522] = {
					"Ice Block", -- [1]
					"Battle of Dazar'alor", -- [2]
				},
				[173604] = {
					"Sinister Antiquarian", -- [1]
					"Castle Nathria", -- [2]
				},
				[123929] = {
					"Garothi Demolisher", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[175652] = {
					"Lord of Woe", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[165415] = {
					"Toiling Groundskeeper", -- [1]
					"Halls of Atonement", -- [2]
				},
				[125977] = {
					"Reanimation Totem", -- [1]
					"Atal'Dazar", -- [2]
				},
				[36891] = {
					"Iceborn Proto-Drake", -- [1]
					"Pit of Saron", -- [2]
				},
				[69927] = {
					"Zandalari Prelate", -- [1]
					"Throne of Thunder", -- [2]
				},
				[37531] = {
					"Frostwarden Handler", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[33820] = {
					"Twilight Pyromancer", -- [1]
					"Ulduar", -- [2]
				},
				[68904] = {
					"Suen", -- [1]
					"Throne of Thunder", -- [2]
				},
				[159275] = {
					"Portal Keeper", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[163882] = {
					"Decaying Flesh Giant", -- [1]
					"Plaguefall", -- [2]
				},
				[129050] = {
					"Antoran Felguard", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[173609] = {
					"Nathrian Conservator", -- [1]
					"Castle Nathria", -- [2]
				},
				[72744] = {
					"Kor'kron Skullsplitter", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[68905] = {
					"Lu'lin", -- [1]
					"Throne of Thunder", -- [2]
				},
				[36892] = {
					"Ymirjar Deathbringer", -- [1]
					"Pit of Saron", -- [2]
				},
				[37148] = {
					"Skybreaker Summoner", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[37532] = {
					"Frostwing Whelp", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[9547] = {
					"Guzzling Patron", -- [1]
					"Blackrock Depths", -- [2]
				},
				[133685] = {
					"Befouled Spirit", -- [1]
					"The Underrot", -- [2]
				},
				[71466] = {
					"Iron Juggernaut", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[72490] = {
					"Overseer Mojka", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[149555] = {
					"Abomination", -- [1]
					"Warsong Gulch", -- [2]
				},
				[36893] = {
					"Ymirjar Flamebearer", -- [1]
					"Pit of Saron", -- [2]
				},
				[37021] = {
					"Skybreaker Vicar", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[174126] = {
					"Baron Duskhollow", -- [1]
					"Castle Nathria", -- [2]
				},
				[37533] = {
					"Rimefang", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[33822] = {
					"Twilight Guardian", -- [1]
					"Ulduar", -- [2]
				},
				[71979] = {
					"Kor'kron Warbringer", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[14762] = {
					"Dun Baldar North Marshal", -- [1]
					"Alterac Valley", -- [2]
				},
				[156212] = {
					"Coldheart Agent", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[136249] = {
					"Guardian Elemental", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[153141] = {
					"Endless Hunger Totem", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[163891] = {
					"Rotmarrow Slime", -- [1]
					"Plaguefall", -- [2]
				},
				[156213] = {
					"Coldheart Guardian", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[136250] = {
					"Hoodoo Hexer", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[72492] = {
					"Shimra", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[163892] = {
					"Rotting Slimeclaw", -- [1]
					"Plaguefall", -- [2]
				},
				[37022] = {
					"Blighted Abomination", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[157238] = {
					"Prophet Skitra", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[53786] = {
					"Blazing Monstrosity", -- [1]
					"Firelands", -- [2]
				},
				[37534] = {
					"Spinestalker", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[158774] = {
					"Broken Citizen", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[33823] = {
					"Twilight Slayer", -- [1]
					"Ulduar", -- [2]
				},
				[72493] = {
					"Trak'gen", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[11659] = {
					"Molten Destroyer", -- [1]
					"Molten Core", -- [2]
				},
				[163894] = {
					"Blighted Spinebreaker", -- [1]
					"Plaguefall", -- [2]
				},
				[164406] = {
					"Shriekwing", -- [1]
					"Castle Nathria", -- [2]
				},
				[165430] = {
					"Malignant Spawn", -- [1]
					"Plaguefall", -- [2]
				},
				[164407] = {
					"Sludgefist", -- [1]
					"Castle Nathria", -- [2]
				},
				[155706] = {
					"Yox'ith", -- [1]
					"Mogu'shan Scenario", -- [2]
				},
				[37023] = {
					"Plague Scientist", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[164920] = {
					"Drust Soulcleaver", -- [1]
					"Mists of Tirna Scithe", -- [2]
				},
				[37663] = {
					"Darkfallen Noble", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[33824] = {
					"Twilight Shadowblade", -- [1]
					"Ulduar", -- [2]
				},
				[156219] = {
					"Coldheart Scout", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[164921] = {
					"Drust Harvester", -- [1]
					"Mists of Tirna Scithe", -- [2]
				},
				[166969] = {
					"Baroness Frieda", -- [1]
					"Castle Nathria", -- [2]
				},
				[155708] = {
					"Tentacle", -- [1]
					"Mogu'shan Scenario", -- [2]
				},
				[70448] = {
					"Ancient Python", -- [1]
					"Throne of Thunder", -- [2]
				},
				[165946] = {
					"Mordretha, the Endless Empress", -- [1]
					"Theater of Pain", -- [2]
				},
				[166970] = {
					"Lord Stavros", -- [1]
					"Castle Nathria", -- [2]
				},
				[43934] = {
					"Soul Fragment", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[167994] = {
					"Ossified Conscript", -- [1]
					"Theater of Pain", -- [2]
				},
				[72496] = {
					"Overseer Thathung", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[158781] = {
					"Shredded Psyche", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[135235] = {
					"Spectral Beastmaster", -- [1]
					"Kings' Rest", -- [2]
				},
				[173114] = {
					"Invasive Decayfly", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[37664] = {
					"Darkfallen Archmage", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[167485] = {
					"Starving Mawrat", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[164414] = {
					"Reanimated Mage", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[164926] = {
					"Drust Boughbreaker", -- [1]
					"Mists of Tirna Scithe", -- [2]
				},
				[19668] = {
					"Shadowfiend", -- [1]
					"Eye of the Storm", -- [2]
				},
				[71474] = {
					"Embodied Despair", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[167998] = {
					"Portal Guardian", -- [1]
					"Theater of Pain", -- [2]
				},
				[101163] = {
					"Cursed Guardian", -- [1]
					"Karazhan Catacombs", -- [2]
				},
				[14283] = {
					"Stormpike Owl", -- [1]
					"Alterac Valley", -- [2]
				},
				[69427] = {
					"Dark Animus", -- [1]
					"Throne of Thunder", -- [2]
				},
				[135239] = {
					"Spectral Witch Doctor", -- [1]
					"Kings' Rest", -- [2]
				},
				[156226] = {
					"Coldheart Binder", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[37665] = {
					"Darkfallen Lieutenant", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[71475] = {
					"Rook Stonetoe", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[135240] = {
					"Soul Essence", -- [1]
					"Waycrest Manor", -- [2]
				},
				[136264] = {
					"Half-Finished Mummy", -- [1]
					"Kings' Rest", -- [2]
				},
				[14763] = {
					"Dun Baldar South Marshal", -- [1]
					"Alterac Valley", -- [2]
				},
				[168001] = {
					"Empowered Flameforge Enforcer", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[71476] = {
					"Embodied Misery", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[168002] = {
					"Empowered Mawsworn Shackler", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[173633] = {
					"Nathrian Archivist", -- [1]
					"Castle Nathria", -- [2]
				},
				[73012] = {
					"Klaxxi Skirmisher", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[159301] = {
					"General Kaal", -- [1]
					"Revendreth Scenario", -- [2]
				},
				[168003] = {
					"Empowered Coldheart Ascendant", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[37026] = {
					"Skybreaker Sorcerer", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[128551] = {
					"Irontide Mastiff", -- [1]
					"Freehold", -- [2]
				},
				[71477] = {
					"Embodied Gloom", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[168004] = {
					"Empowered Imperial Consular", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[130087] = {
					"Irontide Raider", -- [1]
					"Tol Dagor", -- [2]
				},
				[167493] = {
					"Venomous Sniper", -- [1]
					"Plaguefall", -- [2]
				},
				[135245] = {
					"Bilge Rat Demolisher", -- [1]
					"Siege of Boralus", -- [2]
				},
				[11948] = {
					"Vanndar Stormpike", -- [1]
					"Alterac Valley", -- [2]
				},
				[71478] = {
					"Embodied Anguish", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[71734] = {
					"Sha of Pride", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[12076] = {
					"Lava Elemental", -- [1]
					"Molten Core", -- [2]
				},
				[159305] = {
					"Maddened Conscript", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[168007] = {
					"Empowered Mawsworn Soulbinder", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[135759] = {
					"Earthwall Totem", -- [1]
					"Kings' Rest", -- [2]
				},
				[53791] = {
					"Blazing Monstrosity", -- [1]
					"Firelands", -- [2]
				},
				[155211] = {
					"Gormling Pest", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[155723] = {
					"Swarmguard Kzaz", -- [1]
					"Mogu'shan Scenario", -- [2]
				},
				[46753] = {
					"Al'Akir", -- [1]
					"Throne of the Four Winds", -- [2]
				},
				[135761] = {
					"Thundering Totem", -- [1]
					"Kings' Rest", -- [2]
				},
				[158284] = {
					"Craggle Wobbletop", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[159308] = {
					"Zealous Adherent", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[163915] = {
					"Hatchling Nest", -- [1]
					"Plaguefall", -- [2]
				},
				[164427] = {
					"Reanimated Warrior", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[173641] = {
					"Nathrian Gargon", -- [1]
					"Castle Nathria", -- [2]
				},
				[134739] = {
					"Purification Construct", -- [1]
					"Kings' Rest", -- [2]
				},
				[127019] = {
					"Training Dummy", -- [1]
					"Freehold", -- [2]
				},
				[32933] = {
					"Left Arm", -- [1]
					"Ulduar", -- [2]
				},
				[71481] = {
					"Embodied Sorrow", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[156239] = {
					"Dark Ascended Corrus", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[72249] = {
					"Galakras", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[170572] = {
					"Atal'ai Hoodoo Hexxer", -- [1]
					"De Other Side", -- [2]
				},
				[155216] = {
					"Faeleaf Warden", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[135765] = {
					"Torrent Totem", -- [1]
					"Kings' Rest", -- [2]
				},
				[70202] = {
					"Manchu", -- [1]
					"Throne of Thunder", -- [2]
				},
				[99891] = {
					"Storm Drake", -- [1]
					"Halls of Valor", -- [2]
				},
				[71482] = {
					"Embodied Desperation", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[135254] = {
					"Irontide Raider", -- [1]
					"Tol Dagor", -- [2]
				},
				[156241] = {
					"Monstrous Guardian", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[14188] = {
					"Dirk Swindle", -- [1]
					"Alterac Valley", -- [2]
				},
				[73530] = {
					"Dragonmaw Grunt", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[156242] = {
					"Animated Prowler", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[53793] = {
					"Harbinger of Flame", -- [1]
					"Firelands", -- [2]
				},
				[134232] = {
					"Hired Assassin", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[155219] = {
					"Gormling Spitter", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[14764] = {
					"Icewing Marshal", -- [1]
					"Alterac Valley", -- [2]
				},
				[156244] = {
					"Winged Automaton", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[173136] = {
					"Blightsmasher", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[157268] = {
					"Crawling Corruption", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[155221] = {
					"Faeleaf Tender", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[151638] = {
					"Crazed Earth Rager", -- [1]
					"Neltharion's Lair - HoA Scenario", -- [2]
				},
				[156245] = {
					"Grand Automaton", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[153174] = {
					"Watchers of Death", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[174161] = {
					"Lady Sinsear", -- [1]
					"Castle Nathria", -- [2]
				},
				[151127] = {
					"Lord of Torment", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[151639] = {
					"Crazed Gyreworm", -- [1]
					"Neltharion's Lair - HoA Scenario", -- [2]
				},
				[70205] = {
					"Weisheng", -- [1]
					"Throne of Thunder", -- [2]
				},
				[53794] = {
					"Smouldering Hatchling", -- [1]
					"Firelands", -- [2]
				},
				[151128] = {
					"Lord of Locks", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[131677] = {
					"Heartsbane Runeweaver", -- [1]
					"Waycrest Manor", -- [2]
				},
				[113971] = {
					"Maiden of Virtue", -- [1]
					"Return to Karazhan", -- [2]
				},
				[42789] = {
					"Stonecore Magmalord", -- [1]
					"The Stonecore", -- [2]
				},
				[173140] = {
					"Soldier of the Frozen Wastes", -- [1]
					"Maldraxxus Covenant Finale Scenario", -- [2]
				},
				[155225] = {
					"Faeleaf Grovesinger", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[168022] = {
					"Slime Tentacle", -- [1]
					"Plaguefall", -- [2]
				},
				[155226] = {
					"Verdant Keeper", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[135263] = {
					"Ashvane Spotter", -- [1]
					"Siege of Boralus", -- [2]
				},
				[173142] = {
					"Dread Feaster", -- [1]
					"Castle Nathria", -- [2]
				},
				[45477] = {
					"Gust Soldier", -- [1]
					"The Vortex Pinnacle", -- [2]
				},
				[170071] = {
					"Mawsworn Shadestalker", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[173143] = {
					"Soul Weaver", -- [1]
					"Maldraxxus Covenant Finale Scenario", -- [2]
				},
				[173655] = {
					"Mistveil Matriarch", -- [1]
					"Mists of Tirna Scithe", -- [2]
				},
				[152669] = {
					"Void Globule", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[43430] = {
					"Stonecore Berserker", -- [1]
					"The Stonecore", -- [2]
				},
				[173145] = {
					"Gorging Mite", -- [1]
					"Castle Nathria", -- [2]
				},
				[72768] = {
					"Kor'kron War Wolf", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[173146] = {
					"Winged Ravager", -- [1]
					"Castle Nathria", -- [2]
				},
				[131685] = {
					"Runic Disciple", -- [1]
					"Waycrest Manor", -- [2]
				},
				[38184] = {
					"Corrupted Ymirjar", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[165469] = {
					"Nathrian Enforcer", -- [1]
					"Castle Nathria", -- [2]
				},
				[151649] = {
					"Defense Bot Mk I", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[165470] = {
					"Nathrian Executor", -- [1]
					"Castle Nathria", -- [2]
				},
				[115767] = {
					"Mistress Sassz'ine", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[165471] = {
					"Nathrian Duelist", -- [1]
					"Castle Nathria", -- [2]
				},
				[72770] = {
					"Kor'kron Dark Farseer", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[137830] = {
					"Pallid Gorger", -- [1]
					"Waycrest Manor", -- [2]
				},
				[73538] = {
					"Kor'kron War Wolf", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[69699] = {
					"Massive Anima Golem", -- [1]
					"Throne of Thunder", -- [2]
				},
				[32938] = {
					"Flash Freeze", -- [1]
					"Ulduar", -- [2]
				},
				[169055] = {
					"Marrow Scraper", -- [1]
					"Theater of Pain", -- [2]
				},
				[165472] = {
					"Nathrian Siphoner", -- [1]
					"Castle Nathria", -- [2]
				},
				[121399] = {
					"Inquisitor Sebilus", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[132713] = {
					"Mogul Razdunk", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[174175] = {
					"Loyal Stoneborn", -- [1]
					"Halls of Atonement", -- [2]
				},
				[14765] = {
					"Stonehearth Marshal", -- [1]
					"Alterac Valley", -- [2]
				},
				[73539] = {
					"Kor'kron Den Mother", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[172128] = {
					"Hero", -- [1]
					"Vision of Ysera Scenario", -- [2]
				},
				[164450] = {
					"Dealer Xy'exa", -- [1]
					"De Other Side", -- [2]
				},
				[70212] = {
					"Flaming Head", -- [1]
					"Throne of Thunder", -- [2]
				},
				[165474] = {
					"Nathrian Assassin", -- [1]
					"Castle Nathria", -- [2]
				},
				[10990] = {
					"Alterac Ram", -- [1]
					"Alterac Valley", -- [2]
				},
				[164451] = {
					"Dessia the Decapitator", -- [1]
					"Theater of Pain", -- [2]
				},
				[121400] = {
					"Accusator Gnazh", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[134251] = {
					"Seneschal M'bara", -- [1]
					"Kings' Rest", -- [2]
				},
				[155238] = {
					"Guardian of the Leaf", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[69701] = {
					"Anima Golem", -- [1]
					"Throne of Thunder", -- [2]
				},
				[127799] = {
					"Dazar'ai Honor Guard", -- [1]
					"Atal'Dazar", -- [2]
				},
				[11502] = {
					"Ragnaros", -- [1]
					"Molten Core", -- [2]
				},
				[97087] = {
					"Valarjar Champion", -- [1]
					"Halls of Valor", -- [2]
				},
				[11662] = {
					"Flamewaker Priest", -- [1]
					"Molten Core", -- [2]
				},
				[73541] = {
					"Kor'kron Wolf Pup", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[151657] = {
					"Bomb Tonk", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[160871] = {
					"Possessed Package", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[161895] = {
					"Thing From Beyond", -- [1]
					"Mogu'shan Scenario", -- [2]
				},
				[11982] = {
					"Magmadar", -- [1]
					"Molten Core", -- [2]
				},
				[151658] = {
					"Strider Tonk", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[164967] = {
					"Doctor Ickus", -- [1]
					"Plaguefall", -- [2]
				},
				[165479] = {
					"Court Enforcer", -- [1]
					"Castle Nathria", -- [2]
				},
				[151659] = {
					"Rocket Tonk", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[33836] = {
					"Bomb Bot", -- [1]
					"Ulduar", -- [2]
				},
				[172647] = {
					"Parasitic Infestor", -- [1]
					"Mists of Tirna Scithe", -- [2]
				},
				[165481] = {
					"Court Assassin", -- [1]
					"Castle Nathria", -- [2]
				},
				[158315] = {
					"Eye of Chaos", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[165483] = {
					"Court Hierarch", -- [1]
					"Castle Nathria", -- [2]
				},
				[13358] = {
					"Stormpike Bowman", -- [1]
					"Alterac Valley", -- [2]
				},
				[26776] = {
					"Direbrew Minion", -- [1]
					"Blackrock Depths", -- [2]
				},
				[141938] = {
					"Ashvane Sniper", -- [1]
					"Siege of Boralus", -- [2]
				},
				[167532] = {
					"Heavin the Breaker", -- [1]
					"Theater of Pain", -- [2]
				},
				[164461] = {
					"Sathel the Accursed", -- [1]
					"Theater of Pain", -- [2]
				},
				[157807] = {
					"Mawsworn Soulweaver", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[141939] = {
					"Ashvane Spotter", -- [1]
					"Siege of Boralus", -- [2]
				},
				[167533] = {
					"Advent Nevermore", -- [1]
					"Theater of Pain", -- [2]
				},
				[128060] = {
					"Priestess of Delirium", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[167022] = {
					"Battlesewn Render", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[167534] = {
					"Rek the Hardened", -- [1]
					"Theater of Pain", -- [2]
				},
				[164463] = {
					"Paceran the Virulent", -- [1]
					"Theater of Pain", -- [2]
				},
				[157809] = {
					"Mawsworn Darkcaster", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[155250] = {
					"Decayspeaker", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[172142] = {
					"Baroness Ninadar", -- [1]
					"Maldraxxus Covenant Finale Scenario", -- [2]
				},
				[164464] = {
					"Xira the Underhanded", -- [1]
					"Theater of Pain", -- [2]
				},
				[53545] = {
					"Molten Spewer", -- [1]
					"Firelands", -- [2]
				},
				[157810] = {
					"Mawsworn Endbringer", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[162417] = {
					"Anubisath Sentinel", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[142454] = {
					"Ashtail Bandicoon", -- [1]
					"Freehold", -- [2]
				},
				[167536] = {
					"Harugia the Bloodthirsty", -- [1]
					"Theater of Pain", -- [2]
				},
				[33838] = {
					"Enslaved Fire Elemental", -- [1]
					"Ulduar", -- [2]
				},
				[33966] = {
					"Crusher Tentacle", -- [1]
					"Ulduar", -- [2]
				},
				[157811] = {
					"Lilliam Sparkspindle", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[157300] = {
					"Tunk", -- [1]
					"Darkmaul Citadel", -- [2]
				},
				[157812] = {
					"Billibub Cogspinner", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[167538] = {
					"Dokigg the Brutalizer", -- [1]
					"Theater of Pain", -- [2]
				},
				[129598] = {
					"Freehold Pack Mule", -- [1]
					"Freehold", -- [2]
				},
				[157813] = {
					"Sprite Jumpsprocket", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[37038] = {
					"Vengeful Fleshreaper", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[174194] = {
					"Court Executor", -- [1]
					"Castle Nathria", -- [2]
				},
				[129599] = {
					"Cutwater Knife Juggler", -- [1]
					"Freehold", -- [2]
				},
				[11663] = {
					"Flamewaker Healer", -- [1]
					"Molten Core", -- [2]
				},
				[158327] = {
					"Crackling Shard", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[154744] = {
					"Toxic Monstrosity", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[129600] = {
					"Bilge Rat Brinescale", -- [1]
					"Freehold", -- [2]
				},
				[174197] = {
					"Battlefield Ritualist", -- [1]
					"Theater of Pain", -- [2]
				},
				[69455] = {
					"Zandalari Water-Binder", -- [1]
					"Throne of Thunder", -- [2]
				},
				[73806] = {
					"Kor'kron Machinist", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[152699] = {
					"Voidbound Berserker", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[156795] = {
					"SI:7 Informant", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[167033] = {
					"Putrid Shambler", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[69712] = {
					"Ji-Kun", -- [1]
					"Throne of Thunder", -- [2]
				},
				[70224] = {
					"Rotting Scavenger", -- [1]
					"Throne of Thunder", -- [2]
				},
				[127810] = {
					"Slobbering Fiend", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[150142] = {
					"Scrapbone Trashtosser", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[138369] = {
					"Footbomb Hooligan", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[116549] = {
					"Backup Singer", -- [1]
					"Return to Karazhan", -- [2]
				},
				[168058] = {
					"Infused Quill-feather", -- [1]
					"Sanguine Depths", -- [2]
				},
				[129602] = {
					"Irontide Enforcer", -- [1]
					"Freehold", -- [2]
				},
				[36272] = {
					"Apothecary Frye", -- [1]
					"Shadowfang Keep", -- [2]
				},
				[72784] = {
					"Kor'kron Gunner", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[150143] = {
					"Scrapbone Grinder", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[173178] = {
					"Stone Legion Goliath", -- [1]
					"Castle Nathria", -- [2]
				},
				[166524] = {
					"Deathwalker", -- [1]
					"Theater of Pain", -- [2]
				},
				[45870] = {
					"Anshal", -- [1]
					"Throne of the Four Winds", -- [2]
				},
				[116550] = {
					"Spectral Patron", -- [1]
					"Return to Karazhan", -- [2]
				},
				[168572] = {
					"Fungi Stormer", -- [1]
					"Plaguefall", -- [2]
				},
				[152704] = {
					"Crawling Corruption", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[163966] = {
					"Dread Siphonist", -- [1]
					"Revendreth Scenario", -- [2]
				},
				[150146] = {
					"Scrapbone Shaman", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[168574] = {
					"Pestilent Harvester", -- [1]
					"Plaguefall", -- [2]
				},
				[161408] = {
					"Malicious Growth", -- [1]
					"Freehold", -- [2]
				},
				[157825] = {
					"Crazed Tormenter", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[127045] = {
					"Antoran Champion", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[70227] = {
					"Skittering Spiderling", -- [1]
					"Throne of Thunder", -- [2]
				},
				[45871] = {
					"Nezir", -- [1]
					"Throne of the Four Winds", -- [2]
				},
				[163457] = {
					"Forsworn Vanguard", -- [1]
					"Spires of Ascension", -- [2]
				},
				[152708] = {
					"Mawsworn Seeker", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[72787] = {
					"Blade of the Hundred Steps", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[163458] = {
					"Forsworn Castigator", -- [1]
					"Spires of Ascension", -- [2]
				},
				[169601] = {
					"Stone Legion Commando", -- [1]
					"Castle Nathria", -- [2]
				},
				[174208] = {
					"Court Executor", -- [1]
					"Castle Nathria", -- [2]
				},
				[163459] = {
					"Forsworn Mender", -- [1]
					"Spires of Ascension", -- [2]
				},
				[168578] = {
					"Fungalmancer", -- [1]
					"Plaguefall", -- [2]
				},
				[72276] = {
					"Amalgam of Corruption", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[126023] = {
					"Harbor Saurid", -- [1]
					"The Underrot", -- [2]
				},
				[154758] = {
					"Toxic Monstrosity", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[44976] = {
					"Neferset Plaguebringer", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[168579] = {
					"Fen Hatchling", -- [1]
					"Plaguefall", -- [2]
				},
				[174210] = {
					"Blighted Sludge-Spewer", -- [1]
					"Theater of Pain", -- [2]
				},
				[134284] = {
					"Fallen Deathspeaker", -- [1]
					"The Underrot", -- [2]
				},
				[33715] = {
					"Charged Sphere", -- [1]
					"Ulduar", -- [2]
				},
				[168580] = {
					"Plagueborer", -- [1]
					"Plaguefall", -- [2]
				},
				[11664] = {
					"Flamewaker Elite", -- [1]
					"Molten Core", -- [2]
				},
				[70230] = {
					"Zandalari Blade Initiate", -- [1]
					"Throne of Thunder", -- [2]
				},
				[150154] = {
					"Saurolisk Bonenipper", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[173189] = {
					"Nathrian Hawkeye", -- [1]
					"Castle Nathria", -- [2]
				},
				[161416] = {
					"Aqir Shadowcrafter", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[32666] = {
					"Training Dummy", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[53167] = {
					"Unbound Pyrelord", -- [1]
					"Firelands", -- [2]
				},
				[173190] = {
					"Court Hawkeye", -- [1]
					"Castle Nathria", -- [2]
				},
				[175238] = {
					"Arch-Tyrant Zerios", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[120651] = {
					"Explosives", -- [1]
					"Waycrest Manor", -- [2]
				},
				[173191] = {
					"Soulstalker V'lara", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[72791] = {
					"Lingering Corruption", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[171656] = {
					"Venomous Sniper Captain", -- [1]
					"Plaguefall", -- [2]
				},
				[168073] = {
					"Fallen Monk", -- [1]
					"The Battle for Gilneas", -- [2]
				},
				[70232] = {
					"Muckbat", -- [1]
					"Throne of Thunder", -- [2]
				},
				[168074] = {
					"Fallen Monk", -- [1]
					"The Battle for Gilneas", -- [2]
				},
				[152718] = {
					"Alleria Windrunner", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[165515] = {
					"Depraved Darkblade", -- [1]
					"Halls of Atonement", -- [2]
				},
				[150159] = {
					"King Gobbamak", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[69465] = {
					"Jin'rokh the Breaker", -- [1]
					"Throne of Thunder", -- [2]
				},
				[155790] = {
					"Mawsworn Acolyte", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[26716] = {
					"Azure Warder", -- [1]
					"The Nexus", -- [2]
				},
				[156814] = {
					"Gor'groth", -- [1]
					"Darkmaul Citadel", -- [2]
				},
				[150160] = {
					"Scrapbone Bully", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[167564] = {
					"Thultain", -- [1]
					"Maldraxxus Covenant Finale Scenario", -- [2]
				},
				[54320] = {
					"Ban'thalos", -- [1]
					"Waycrest Manor", -- [2]
				},
				[130635] = {
					"Stonefury", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[157328] = {
					"Darkmaul Channeler", -- [1]
					"Darkmaul Citadel", -- [2]
				},
				[167566] = {
					"Bleakwing Assassin", -- [1]
					"Castle Nathria", -- [2]
				},
				[155793] = {
					"Skeletal Remains", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[152722] = {
					"Fallen Voidspeaker", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[167055] = {
					"Rot Flinger", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[168591] = {
					"Ravenous Dreadbat", -- [1]
					"Sanguine Depths", -- [2]
				},
				[70235] = {
					"Frozen Head", -- [1]
					"Throne of Thunder", -- [2]
				},
				[95061] = {
					"Greater Fire Elemental", -- [1]
					"Deepwind Gorge", -- [2]
				},
				[71515] = {
					"General Nazgrim", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[71771] = {
					"Kor'kron Arcweaver", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[165521] = {
					"Lady Inerva Darkvein", -- [1]
					"Castle Nathria", -- [2]
				},
				[150165] = {
					"Slime Elemental", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[165010] = {
					"Congealed Slime", -- [1]
					"Plaguefall", -- [2]
				},
				[155797] = {
					"Animated Guardian", -- [1]
					"Mogu'shan Scenario", -- [2]
				},
				[168594] = {
					"Chamber Sentinel", -- [1]
					"Sanguine Depths", -- [2]
				},
				[52530] = {
					"Alysrazor", -- [1]
					"Firelands", -- [2]
				},
				[157333] = {
					"Darkwhisper Cultist", -- [1]
					"Blackwing Descent Scenario", -- [2]
				},
				[44980] = {
					"Neferset Theurgist", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[148120] = {
					"Kul Tiran Marine", -- [1]
					"Battle of Dazar'alor", -- [2]
				},
				[136347] = {
					"Tidesage Initiate", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[173714] = {
					"Mistveil Nightblossom", -- [1]
					"Mists of Tirna Scithe", -- [2]
				},
				[150168] = {
					"Toxic Monstrosity", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[33719] = {
					"Emerald Consort", -- [1]
					"Ulduar", -- [2]
				},
				[71773] = {
					"Kor'kron Warshaman", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[164501] = {
					"Mistcaller", -- [1]
					"Mists of Tirna Scithe", -- [2]
				},
				[11665] = {
					"Lava Annihilator", -- [1]
					"Molten Core", -- [2]
				},
				[150169] = {
					"Toxic Lurker", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[95832] = {
					"Valarjar Shieldmaiden", -- [1]
					"Halls of Valor", -- [2]
				},
				[156825] = {
					"Darkmaul Centurion", -- [1]
					"Darkmaul Citadel", -- [2]
				},
				[157337] = {
					"Spawn of Shad'har", -- [1]
					"Blackwing Descent Scenario", -- [2]
				},
				[122450] = {
					"Garothi Worldbreaker", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[130896] = {
					"Blackout Barrel", -- [1]
					"Freehold", -- [2]
				},
				[139422] = {
					"Scaled Krolusk Tamer", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[153755] = {
					"Naeno Megacrash", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[171159] = {
					"Unraveling Soul Remnant", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[33720] = {
					"Obsidian Consort", -- [1]
					"Ulduar", -- [2]
				},
				[140447] = {
					"Demolishing Terror", -- [1]
					"Siege of Boralus", -- [2]
				},
				[165529] = {
					"Depraved Collector", -- [1]
					"Halls of Atonement", -- [2]
				},
				[114261] = {
					"Toe Knee", -- [1]
					"Return to Karazhan", -- [2]
				},
				[135329] = {
					"Matron Bryndle", -- [1]
					"Waycrest Manor", -- [2]
				},
				[164506] = {
					"Ancient Captain", -- [1]
					"Theater of Pain", -- [2]
				},
				[136353] = {
					"Colossal Tentacle", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[173720] = {
					"Mistveil Gorgegullet", -- [1]
					"Mists of Tirna Scithe", -- [2]
				},
				[95834] = {
					"Valarjar Mystic", -- [1]
					"Halls of Valor", -- [2]
				},
				[139425] = {
					"Crazed Incubator", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[114262] = {
					"Attumen the Huntsman", -- [1]
					"Return to Karazhan", -- [2]
				},
				[69473] = {
					"Ra-den", -- [1]
					"Throne of Thunder", -- [2]
				},
				[127315] = {
					"Reanimation Totem", -- [1]
					"Atal'Dazar", -- [2]
				},
				[123476] = {
					"Hulking Demolisher", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[161437] = {
					"Explosive Scarab", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[13617] = {
					"Stormpike Stable Master", -- [1]
					"Alterac Valley", -- [2]
				},
				[9554] = {
					"Hammered Patron", -- [1]
					"Blackrock Depths", -- [2]
				},
				[153760] = {
					"Enthralled Footman", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[122965] = {
					"Vol'kaal", -- [1]
					"Atal'Dazar", -- [2]
				},
				[164510] = {
					"Shambling Arbalest", -- [1]
					"Theater of Pain", -- [2]
				},
				[123477] = {
					"Antoran Doomguard", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[23775] = {
					"Head of the Horseman", -- [1]
					"Scarlet Monastery", -- [2]
				},
				[135846] = {
					"Sand-Crusted Striker", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[171166] = {
					"Unraveling Soul Remnant", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[123478] = {
					"Antoran Felguard", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[33722] = {
					"Storm Tempered Keeper", -- [1]
					"Ulduar", -- [2]
				},
				[158371] = {
					"Zardeth of the Black Claw", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[114265] = {
					"Gang Ruffian", -- [1]
					"Return to Karazhan", -- [2]
				},
				[155812] = {
					"Mawsworn Ritualist", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[29982] = {
					"Drakkari Raider", -- [1]
					"Gundrak", -- [2]
				},
				[116569] = {
					"Razorjaw Wavemender", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[168098] = {
					"Empowered Coldheart Agent", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[129366] = {
					"Bilge Rat Buccaneer", -- [1]
					"Siege of Boralus", -- [2]
				},
				[173729] = {
					"Manifestation of Pride", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[114266] = {
					"Shoreline Tidespeaker", -- [1]
					"Return to Karazhan", -- [2]
				},
				[168099] = {
					"Empowered Coldheart Javelineer", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[139946] = {
					"Heart Guardian", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[123480] = {
					"Antoran Champion", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[89] = {
					"Infernal", -- [1]
					"Eye of the Storm", -- [2]
				},
				[170147] = {
					"Volatile Memory", -- [1]
					"De Other Side", -- [2]
				},
				[120153] = {
					"Eonic Defender", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[171171] = {
					"Mawsworn Archer", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[134828] = {
					"Aqualing", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[164517] = {
					"Tred'ova", -- [1]
					"Mists of Tirna Scithe", -- [2]
				},
				[11666] = {
					"Firewalker", -- [1]
					"Molten Core", -- [2]
				},
				[171172] = {
					"Mawsworn Shackler", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[168101] = {
					"Empowered Deadsoul Shade", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[165030] = {
					"Lady Inerva Darkvein", -- [1]
					"Castle Nathria Scenario", -- [2]
				},
				[95072] = {
					"Greater Earth Elemental", -- [1]
					"Eye of the Storm", -- [2]
				},
				[171173] = {
					"Mawsworn Shadestalker", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[12018] = {
					"Majordomo Executus", -- [1]
					"Molten Core", -- [2]
				},
				[168102] = {
					"Empowered Deadsoul Echo", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[139949] = {
					"Plague Doctor", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[122970] = {
					"Shadowblade Stalker", -- [1]
					"Atal'Dazar", -- [2]
				},
				[70247] = {
					"Venomous Head", -- [1]
					"Throne of Thunder", -- [2]
				},
				[168104] = {
					"Empowered Flameforge Master", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[96609] = {
					"Gildedfur Stag", -- [1]
					"Halls of Valor", -- [2]
				},
				[117596] = {
					"Razorjaw Gladiator", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[42810] = {
					"Crystalspawn Giant", -- [1]
					"The Stonecore", -- [2]
				},
				[122971] = {
					"Dazar'ai Juggernaut", -- [1]
					"Atal'Dazar", -- [2]
				},
				[70248] = {
					"Arcane Head", -- [1]
					"Throne of Thunder", -- [2]
				},
				[157356] = {
					"Extractor Thelsara", -- [1]
					"Blackwing Descent Scenario", -- [2]
				},
				[150190] = {
					"HK-8 Aerial Oppression Unit", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[95842] = {
					"Valarjar Thundercaller", -- [1]
					"Halls of Valor", -- [2]
				},
				[168106] = {
					"Empowered Mawsworn Guard", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[129370] = {
					"Irontide Waveshaper", -- [1]
					"Siege of Boralus", -- [2]
				},
				[159405] = {
					"Aqir Scarab", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[168107] = {
					"Empowered Mawsworn Interceptor", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[163501] = {
					"Forsworn Skirmisher", -- [1]
					"Spires of Ascension", -- [2]
				},
				[168108] = {
					"Empowered Lumbering Creation", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[129371] = {
					"Riptide Shredder", -- [1]
					"Siege of Boralus", -- [2]
				},
				[168109] = {
					"Empowered Mawsworn Ritualist", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[120158] = {
					"Volatile Corruption", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[171181] = {
					"Territorial Bladebeak", -- [1]
					"De Other Side", -- [2]
				},
				[163503] = {
					"Etherdiver", -- [1]
					"Spires of Ascension", -- [2]
				},
				[168110] = {
					"Empowered Imperial Duelist", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[129372] = {
					"Blacktar Bomber", -- [1]
					"Siege of Boralus", -- [2]
				},
				[72810] = {
					"Staff of Resonating Water", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[150195] = {
					"Gnome-Eating Slime", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[122718] = {
					"Felblade Shocktrooper", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[168111] = {
					"Empowered Imperial Curator", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[54073] = {
					"Flamewaker Hound Master", -- [1]
					"Firelands", -- [2]
				},
				[168112] = {
					"General Kaal", -- [1]
					"Castle Nathria", -- [2]
				},
				[129373] = {
					"Dockhound Packmaster", -- [1]
					"Siege of Boralus", -- [2]
				},
				[42428] = {
					"Devout Follower", -- [1]
					"The Stonecore", -- [2]
				},
				[141495] = {
					"Kul Tiran Footman", -- [1]
					"Siege of Boralus", -- [2]
				},
				[130653] = {
					"Wanton Sapper", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[163506] = {
					"Forsworn Stealthclaw", -- [1]
					"Spires of Ascension", -- [2]
				},
				[155828] = {
					"Runecarved Colossus", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[125535] = {
					"Riftworld Assistant", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[134331] = {
					"King Rahu'ai", -- [1]
					"Kings' Rest", -- [2]
				},
				[155830] = {
					"Mawsworn Disciple", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[168627] = {
					"Plaguebinder", -- [1]
					"Plaguefall", -- [2]
				},
				[165556] = {
					"Fleeting Manifestation", -- [1]
					"Sanguine Depths", -- [2]
				},
				[128095] = {
					"Sister of the Lash", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[150712] = {
					"Trixie Tazer", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[155831] = {
					"Mawsworn Soulbinder", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[33983] = {
					"Constrictor Tentacle", -- [1]
					"Ulduar", -- [2]
				},
				[11667] = {
					"Flameguard", -- [1]
					"Molten Core", -- [2]
				},
				[171188] = {
					"Plaguebound Devoted", -- [1]
					"Plaguefall", -- [2]
				},
				[11859] = {
					"Doomguard", -- [1]
					"Sanguine Depths", -- [2]
				},
				[157368] = {
					"Velinaria", -- [1]
					"Blackwing Descent Scenario", -- [2]
				},
				[137405] = {
					"Gripping Terror", -- [1]
					"Siege of Boralus", -- [2]
				},
				[174773] = {
					"Spiteful Shade", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[159417] = {
					"Demented Knife-Twister", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[151739] = {
					"Ma'haat the Indomitable", -- [1]
					"Neltharion's Lair - HoA Scenario", -- [2]
				},
				[165560] = {
					"Gormling Larva", -- [1]
					"Mists of Tirna Scithe", -- [2]
				},
				[37695] = {
					"Drudge Ghoul", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[122467] = {
					"Asara, Mother of Night", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[134338] = {
					"Tidesage Enforcer", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[167610] = {
					"Stonefiend Anklebiter", -- [1]
					"Halls of Atonement", -- [2]
				},
				[13139] = {
					"Commander Randolph", -- [1]
					"Alterac Valley", -- [2]
				},
				[122468] = {
					"Noura, Mother of Flames", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[167611] = {
					"Stoneborn Eviscerator", -- [1]
					"Halls of Atonement", -- [2]
				},
				[26722] = {
					"Azure Magus", -- [1]
					"The Nexus", -- [2]
				},
				[167612] = {
					"Stoneborn Reaver", -- [1]
					"Halls of Atonement", -- [2]
				},
				[33985] = {
					"Corruptor Tentacle", -- [1]
					"Ulduar", -- [2]
				},
				[166589] = {
					"Animated Weapon", -- [1]
					"Sanguine Depths", -- [2]
				},
				[118374] = {
					"Captain Yathae Moonstrike", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[135365] = {
					"Matron Alma", -- [1]
					"Waycrest Manor", -- [2]
				},
				[129124] = {
					"Wolf", -- [1]
					"Waycrest Manor", -- [2]
				},
				[166079] = {
					"Brittlebone Crossbowman", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[130404] = {
					"Vermin Trapper", -- [1]
					"Freehold", -- [2]
				},
				[167615] = {
					"Depraved Darkblade", -- [1]
					"Halls of Atonement", -- [2]
				},
				[114792] = {
					"Virtuous Lady", -- [1]
					"Return to Karazhan", -- [2]
				},
				[136391] = {
					"Heart Guardian", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[37697] = {
					"Volatile Ooze", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[2630] = {
					"Earthbind Totem", -- [1]
					"Eye of the Storm", -- [2]
				},
				[131785] = {
					"Buzzing Drone", -- [1]
					"Tol Dagor", -- [2]
				},
				[130661] = {
					"Venture Co. Earthshaper", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[144071] = {
					"Irontide Waveshaper", -- [1]
					"Siege of Boralus", -- [2]
				},
				[153285] = {
					"Training Dummy", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[165059] = {
					"Crimson Protector", -- [1]
					"Castle Nathria Scenario", -- [2]
				},
				[133835] = {
					"Feral Bloodswarmer", -- [1]
					"The Underrot", -- [2]
				},
				[163524] = {
					"Kyrian Dark-Praetor", -- [1]
					"Spires of Ascension", -- [2]
				},
				[114794] = {
					"Skeletal Hound", -- [1]
					"Return to Karazhan", -- [2]
				},
				[26723] = {
					"Keristrasza", -- [1]
					"The Nexus", -- [2]
				},
				[165060] = {
					"Animimic", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[53694] = {
					"Riplimb", -- [1]
					"Firelands", -- [2]
				},
				[133836] = {
					"Reanimated Guardian", -- [1]
					"The Underrot", -- [2]
				},
				[121193] = {
					"Shadowsoul", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[165061] = {
					"Crimson Assassin", -- [1]
					"Castle Nathria Scenario", -- [2]
				},
				[11668] = {
					"Firelord", -- [1]
					"Molten Core", -- [2]
				},
				[167109] = {
					"Skeletal Vanguard", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[164550] = {
					"Slithering Ooze", -- [1]
					"Plaguefall", -- [2]
				},
				[169157] = {
					"Mudlump", -- [1]
					"Castle Nathria", -- [2]
				},
				[28067] = {
					"Dark Iron Brewer", -- [1]
					"Blackrock Depths", -- [2]
				},
				[71542] = {
					"Blood", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[129640] = {
					"Snarling Dockhound", -- [1]
					"Siege of Boralus", -- [2]
				},
				[167111] = {
					"Spinemaw Staghorn", -- [1]
					"Mists of Tirna Scithe", -- [2]
				},
				[122986] = {
					"Wild Skyscreamer", -- [1]
					"Atal'Dazar", -- [2]
				},
				[164552] = {
					"Rotmarrow Slime", -- [1]
					"Plaguefall", -- [2]
				},
				[169159] = {
					"Unstable Canister", -- [1]
					"Plaguefall", -- [2]
				},
				[53695] = {
					"Rageface", -- [1]
					"Firelands", -- [2]
				},
				[37571] = {
					"Darkfallen Advisor", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[71543] = {
					"Immerseus", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[37955] = {
					"Blood-Queen Lana'thel", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[33988] = {
					"Immortal Guardian", -- [1]
					"Ulduar", -- [2]
				},
				[158411] = {
					"Unstable Servant", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[167113] = {
					"Spinemaw Acidgullet", -- [1]
					"Mists of Tirna Scithe", -- [2]
				},
				[114541] = {
					"Spectral Patron", -- [1]
					"Return to Karazhan", -- [2]
				},
				[165066] = {
					"Huntsman Altimor", -- [1]
					"Castle Nathria", -- [2]
				},
				[150222] = {
					"Gunker", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[164555] = {
					"Millificent Manastorm", -- [1]
					"De Other Side", -- [2]
				},
				[165067] = {
					"Margore", -- [1]
					"Castle Nathria", -- [2]
				},
				[162508] = {
					"Anubisath Sentinel", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[114542] = {
					"Ghostly Philanthropist", -- [1]
					"Return to Karazhan", -- [2]
				},
				[45122] = {
					"Oathsworn Captain", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[164556] = {
					"Millhouse Manastorm", -- [1]
					"De Other Side", -- [2]
				},
				[45378] = {
					"Augh", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[167116] = {
					"Spinemaw Reaver", -- [1]
					"Mists of Tirna Scithe", -- [2]
				},
				[164557] = {
					"Shard of Halkias", -- [1]
					"Halls of Atonement", -- [2]
				},
				[137940] = {
					"Safety Shark", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[167117] = {
					"Spinemaw Larva", -- [1]
					"Mists of Tirna Scithe", -- [2]
				},
				[164558] = {
					"Hakkar the Soulflayer", -- [1]
					"De Other Side", -- [2]
				},
				[157904] = {
					"Aqir Scarab", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[125549] = {
					"Hungering Stalker", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[167119] = {
					"Beckoned Wraith", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[53185] = {
					"Flamewaker Overseer", -- [1]
					"Firelands", -- [2]
				},
				[45379] = {
					"Augh", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[33350] = {
					"Mimiron", -- [1]
					"Ulduar", -- [2]
				},
				[166608] = {
					"Mueh'zala", -- [1]
					"De Other Side", -- [2]
				},
				[68220] = {
					"Gastropod", -- [1]
					"Throne of Thunder", -- [2]
				},
				[68476] = {
					"Horridon", -- [1]
					"Throne of Thunder", -- [2]
				},
				[42692] = {
					"Stonecore Bruiser", -- [1]
					"The Stonecore", -- [2]
				},
				[114801] = {
					"Spectral Apprentice", -- [1]
					"Return to Karazhan", -- [2]
				},
				[164562] = {
					"Depraved Houndmaster", -- [1]
					"Halls of Atonement", -- [2]
				},
				[164563] = {
					"Vicious Gargon", -- [1]
					"Halls of Atonement", -- [2]
				},
				[68221] = {
					"Bore Worm", -- [1]
					"Throne of Thunder", -- [2]
				},
				[72828] = {
					"Claw of Burning Anger", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[36678] = {
					"Professor Putricide", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[114802] = {
					"Spectral Journeyman", -- [1]
					"Return to Karazhan", -- [2]
				},
				[165076] = {
					"Gluttonous Tick", -- [1]
					"Sanguine Depths", -- [2]
				},
				[133852] = {
					"Living Rot", -- [1]
					"The Underrot", -- [2]
				},
				[134364] = {
					"Faithless Tender", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[68222] = {
					"Bow Fly Swarm", -- [1]
					"Throne of Thunder", -- [2]
				},
				[11669] = {
					"Flame Imp", -- [1]
					"Molten Core", -- [2]
				},
				[126832] = {
					"Skycap'n Kragg", -- [1]
					"Freehold", -- [2]
				},
				[114803] = {
					"Spectral Stable Hand", -- [1]
					"Return to Karazhan", -- [2]
				},
				[164567] = {
					"Ingra Maloch", -- [1]
					"Mists of Tirna Scithe", -- [2]
				},
				[73342] = {
					"Fallen Pool Tender", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[53187] = {
					"Flamewaker Animator", -- [1]
					"Firelands", -- [2]
				},
				[114804] = {
					"Spectral Charger", -- [1]
					"Return to Karazhan", -- [2]
				},
				[135903] = {
					"Manifestation of the Deep", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[170199] = {
					"Harnessed Specter", -- [1]
					"Castle Nathria", -- [2]
				},
				[133345] = {
					"Feckless Assistant", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[138464] = {
					"Ashvane Deckhand", -- [1]
					"Siege of Boralus", -- [2]
				},
				[168153] = {
					"Plagueroc", -- [1]
					"Plaguefall", -- [2]
				},
				[165594] = {
					"Coldheart Ambusher", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[138465] = {
					"Ashvane Cannoneer", -- [1]
					"Siege of Boralus", -- [2]
				},
				[30245] = {
					"Nexus Lord", -- [1]
					"The Eye of Eternity", -- [2]
				},
				[36296] = {
					"Apothecary Hummel", -- [1]
					"Shadowfang Keep", -- [2]
				},
				[53188] = {
					"Flamewaker Subjugator", -- [1]
					"Firelands", -- [2]
				},
				[131812] = {
					"Heartsbane Soulcharmer", -- [1]
					"Waycrest Manor", -- [2]
				},
				[26918] = {
					"Chaotic Rift", -- [1]
					"The Nexus", -- [2]
				},
				[160990] = {
					"Image of Absolution", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[165597] = {
					"Patchwerk Soldier", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[42695] = {
					"Stonecore Sentry", -- [1]
					"The Stonecore", -- [2]
				},
				[155872] = {
					"Trapped Saurok", -- [1]
					"Mogu'shan Scenario", -- [2]
				},
				[173276] = {
					"Stone Legion Commando", -- [1]
					"Castle Nathria", -- [2]
				},
				[120182] = {
					"Tormented Priestess", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[136934] = {
					"Weapons Tester", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[172255] = {
					"Gravestalker", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[131817] = {
					"Cragmaw the Infested", -- [1]
					"The Underrot", -- [2]
				},
				[169696] = {
					"Mire Soldier", -- [1]
					"Plaguefall", -- [2]
				},
				[162018] = {
					"Temple Guard", -- [1]
					"Vision of Ysera Scenario", -- [2]
				},
				[73091] = {
					"Blackfuse Sellsword", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[131818] = {
					"Marked Sister", -- [1]
					"Waycrest Manor", -- [2]
				},
				[173280] = {
					"Stone Legion Skirmisher", -- [1]
					"Castle Nathria", -- [2]
				},
				[131819] = {
					"Coven Diviner", -- [1]
					"Waycrest Manor", -- [2]
				},
				[162020] = {
					"Priestess of Elune", -- [1]
					"Vision of Ysera Scenario", -- [2]
				},
				[158437] = {
					"Fallen Taskmaster", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[26727] = {
					"Mage Hunter Ascendant", -- [1]
					"The Nexus", -- [2]
				},
				[162021] = {
					"Temple Archer", -- [1]
					"Vision of Ysera Scenario", -- [2]
				},
				[120697] = {
					"Worshiper of Elune", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[131821] = {
					"Faceless Maiden", -- [1]
					"Waycrest Manor", -- [2]
				},
				[161510] = {
					"Mindrend Tentacle", -- [1]
					"Freehold", -- [2]
				},
				[162534] = {
					"Anubisath Sentinel", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[73349] = {
					"Tormented Initiate", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[152809] = {
					"Alx'kov the Infested", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[150250] = {
					"Pistonhead Blaster", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[163559] = {
					"Royal Servant", -- [1]
					"Revendreth Scenario", -- [2]
				},
				[135406] = {
					"Animated Gold", -- [1]
					"Kings' Rest", -- [2]
				},
				[131823] = {
					"Sister Malady", -- [1]
					"Waycrest Manor", -- [2]
				},
				[12118] = {
					"Lucifron", -- [1]
					"Molten Core", -- [2]
				},
				[150251] = {
					"Pistonhead Mechanic", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[36811] = {
					"Deathspeaker Attendant", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[131824] = {
					"Sister Solena", -- [1]
					"Waycrest Manor", -- [2]
				},
				[53575] = {
					"Lava Wielder", -- [1]
					"Firelands", -- [2]
				},
				[173798] = {
					"Rat of Unusual Size", -- [1]
					"Castle Nathria", -- [2]
				},
				[131825] = {
					"Sister Briar", -- [1]
					"Waycrest Manor", -- [2]
				},
				[157419] = {
					"Void-Twisted Whelp", -- [1]
					"Blackwing Descent Scenario", -- [2]
				},
				[133361] = {
					"Wasting Servant", -- [1]
					"Waycrest Manor", -- [2]
				},
				[73095] = {
					"Blackfuse Engineer", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[168681] = {
					"Forsworn Helion", -- [1]
					"Spires of Ascension", -- [2]
				},
				[173800] = {
					"Sewer Rat", -- [1]
					"Castle Nathria", -- [2]
				},
				[150254] = {
					"Scraphound", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[172265] = {
					"Remnant of Fury", -- [1]
					"Sanguine Depths", -- [2]
				},
				[67977] = {
					"Tortos", -- [1]
					"Throne of Thunder", -- [2]
				},
				[137458] = {
					"Rotting Spore", -- [1]
					"The Underrot", -- [2]
				},
				[26536] = {
					"Mindless Servant", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[32845] = {
					"Hodir", -- [1]
					"Ulduar", -- [2]
				},
				[26728] = {
					"Mage Hunter Initiate", -- [1]
					"The Nexus", -- [2]
				},
				[26792] = {
					"Crystalline Protector", -- [1]
					"The Nexus", -- [2]
				},
				[173802] = {
					"Carved Assistant", -- [1]
					"Castle Nathria", -- [2]
				},
				[134388] = {
					"A Knot of Snakes", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[162030] = {
					"Darkwhisper Ritualist", -- [1]
					"Blackwing Descent Scenario", -- [2]
				},
				[134389] = {
					"Venomous Ophidian", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[131318] = {
					"Elder Leaxa", -- [1]
					"The Underrot", -- [2]
				},
				[160495] = {
					"Maniacal Soulbinder", -- [1]
					"Theater of Pain", -- [2]
				},
				[134390] = {
					"Sand-crusted Striker", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[156913] = {
					"Decaying Corpse", -- [1]
					"Darkmaul Citadel", -- [2]
				},
				[73098] = {
					"Kor'kron Overseer", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[126845] = {
					"Captain Jolly", -- [1]
					"Freehold", -- [2]
				},
				[120191] = {
					"Eternal Soulguard", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[42188] = {
					"Ozruk", -- [1]
					"The Stonecore", -- [2]
				},
				[88967] = {
					"Training Dummy", -- [1]
					"FW Horde Garrison Level 3", -- [2]
				},
				[163058] = {
					"Mistveil Defender", -- [1]
					"Mists of Tirna Scithe", -- [2]
				},
				[102532] = {
					"Ariden", -- [1]
					"Karazhan Catacombs", -- [2]
				},
				[158452] = {
					"Mindtwist Tendril", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[138489] = {
					"Shadow of Zul", -- [1]
					"Kings' Rest", -- [2]
				},
				[126847] = {
					"Captain Raoul", -- [1]
					"Freehold", -- [2]
				},
				[26729] = {
					"Steward", -- [1]
					"The Nexus", -- [2]
				},
				[26793] = {
					"Crystalline Frayer", -- [1]
					"The Nexus", -- [2]
				},
				[166644] = {
					"Artificer Xy'mox", -- [1]
					"Castle Nathria", -- [2]
				},
				[120449] = {
					"Defensive Countermeasure", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[121473] = {
					"Coercitor Nixa", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[121985] = {
					"Flame of Taeshalach", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[142587] = {
					"Devouring Maggot", -- [1]
					"Waycrest Manor", -- [2]
				},
				[126848] = {
					"Captain Eudora", -- [1]
					"Freehold", -- [2]
				},
				[162039] = {
					"Wicked Oppressor", -- [1]
					"Sanguine Depths", -- [2]
				},
				[120194] = {
					"Ghostly Acolyte", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[138493] = {
					"Minion of Zul", -- [1]
					"Kings' Rest", -- [2]
				},
				[117123] = {
					"Tidescale Legionnaire", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[12119] = {
					"Flamewaker Protector", -- [1]
					"Molten Core", -- [2]
				},
				[162040] = {
					"Grand Overseer", -- [1]
					"Sanguine Depths", -- [2]
				},
				[141566] = {
					"Scrimshaw Gutter", -- [1]
					"Siege of Boralus", -- [2]
				},
				[33488] = {
					"Saronite Vapors", -- [1]
					"Ulduar", -- [2]
				},
				[37711] = {
					"Hungering Ghoul", -- [1]
					"Pit of Saron", -- [2]
				},
				[125570] = {
					"Riftworld Assistant", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[114565] = {
					"Guardian of the Forgotten Queen", -- [1]
					"Silvershard Mines", -- [2]
				},
				[127106] = {
					"Irontide Officer", -- [1]
					"Freehold", -- [2]
				},
				[43214] = {
					"Slabhide", -- [1]
					"The Stonecore", -- [2]
				},
				[137473] = {
					"Guard Captain Atu", -- [1]
					"Kings' Rest", -- [2]
				},
				[30249] = {
					"Scion of Eternity", -- [1]
					"The Eye of Eternity", -- [2]
				},
				[101257] = {
					"The Conservator", -- [1]
					"Karazhan Catacombs", -- [2]
				},
				[137474] = {
					"King Timalji", -- [1]
					"Kings' Rest", -- [2]
				},
				[73104] = {
					"Unstable Spark", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[172282] = {
					"Web Wrap", -- [1]
					"Plaguefall", -- [2]
				},
				[26730] = {
					"Mage Slayer", -- [1]
					"The Nexus", -- [2]
				},
				[26794] = {
					"Ormorok the Tree-Shaper", -- [1]
					"The Nexus", -- [2]
				},
				[174842] = {
					"Belligerent Waiter", -- [1]
					"Castle Nathria", -- [2]
				},
				[37712] = {
					"Deathwhisper Shadowcaster", -- [1]
					"Pit of Saron", -- [2]
				},
				[168700] = {
					"Pestering Fiend", -- [1]
					"Castle Nathria", -- [2]
				},
				[125828] = {
					"Moonstriderr", -- [1]
					"Atal'Dazar", -- [2]
				},
				[162046] = {
					"Famished Tick", -- [1]
					"Sanguine Depths", -- [2]
				},
				[130435] = {
					"Addled Thug", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[171772] = {
					"Mistveil Defender", -- [1]
					"Mists of Tirna Scithe", -- [2]
				},
				[162047] = {
					"Insatiable Brute", -- [1]
					"Sanguine Depths", -- [2]
				},
				[137989] = {
					"Embalming Fluid", -- [1]
					"Kings' Rest", -- [2]
				},
				[131847] = {
					"Waycrest Reveler", -- [1]
					"Waycrest Manor", -- [2]
				},
				[157441] = {
					"Void Wraith", -- [1]
					"Blackwing Descent Scenario", -- [2]
				},
				[137478] = {
					"Queen Wasi", -- [1]
					"Kings' Rest", -- [2]
				},
				[130436] = {
					"Off-Duty Laborer", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[114312] = {
					"Moroes", -- [1]
					"Return to Karazhan", -- [2]
				},
				[2559] = {
					"happy", -- [1]
					"Waycrest Manor", -- [2]
				},
				[140038] = {
					"Abyssal Eel", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[133384] = {
					"Merektha", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[150276] = {
					"Heavy Scrapbot", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[37713] = {
					"Deathwhisper Torturer", -- [1]
					"Pit of Saron", -- [2]
				},
				[151812] = {
					"Detect-o-Bot", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[131849] = {
					"Crazed Marksman", -- [1]
					"Waycrest Manor", -- [2]
				},
				[130437] = {
					"Mine Rat", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[155908] = {
					"Deathspeaker", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[131850] = {
					"Maddened Survivalist", -- [1]
					"Waycrest Manor", -- [2]
				},
				[174336] = {
					"Kennel Overseer", -- [1]
					"Castle Nathria", -- [2]
				},
				[151814] = {
					"Deadsoul Shade", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[52558] = {
					"Lord Rhyolith", -- [1]
					"Firelands", -- [2]
				},
				[69013] = {
					"Diffused Lightning", -- [1]
					"Throne of Thunder", -- [2]
				},
				[151815] = {
					"Deadsoul Echo", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[26731] = {
					"Grand Magus Telestra", -- [1]
					"The Nexus", -- [2]
				},
				[127879] = {
					"Shieldbearer of Zul", -- [1]
					"Atal'Dazar", -- [2]
				},
				[174338] = {
					"Stinky Feedhauler", -- [1]
					"Castle Nathria", -- [2]
				},
				[120201] = {
					"Spectral Guardian", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[31146] = {
					"Raider's Training Dummy", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[151816] = {
					"Deadsoul Scavenger", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[11672] = {
					"Core Rager", -- [1]
					"Molten Core", -- [2]
				},
				[151817] = {
					"Deadsoul Devil", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[137485] = {
					"Bloodsworn Agent", -- [1]
					"Kings' Rest", -- [2]
				},
				[103822] = {
					"Treant", -- [1]
					"Ulduar", -- [2]
				},
				[12056] = {
					"Baron Geddon", -- [1]
					"Molten Core", -- [2]
				},
				[162056] = {
					"Rockbound Sprite", -- [1]
					"Sanguine Depths", -- [2]
				},
				[114316] = {
					"Baroness Dorothea Millstipe", -- [1]
					"Return to Karazhan", -- [2]
				},
				[162057] = {
					"Chamber Sentinel", -- [1]
					"Sanguine Depths", -- [2]
				},
				[128649] = {
					"Sergeant Bainbridge", -- [1]
					"Siege of Boralus", -- [2]
				},
				[68248] = {
					"Corpse Spider", -- [1]
					"Throne of Thunder", -- [2]
				},
				[136976] = {
					"T'zala", -- [1]
					"Kings' Rest", -- [2]
				},
				[162058] = {
					"Ventunax", -- [1]
					"Spires of Ascension", -- [2]
				},
				[134417] = {
					"Deepsea Ritualist", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[131858] = {
					"Thornguard", -- [1]
					"Waycrest Manor", -- [2]
				},
				[29931] = {
					"Drakkari Rhino", -- [1]
					"Gundrak", -- [2]
				},
				[162059] = {
					"Kin-Tara", -- [1]
					"Spires of Ascension", -- [2]
				},
				[8889] = {
					"Anvilrage Overseer", -- [1]
					"Blackrock Depths", -- [2]
				},
				[134418] = {
					"Drowned Depthbringer", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[162060] = {
					"Oryphrion", -- [1]
					"Spires of Ascension", -- [2]
				},
				[69017] = {
					"Primordius", -- [1]
					"Throne of Thunder", -- [2]
				},
				[114318] = {
					"Baron Rafe Dreuger", -- [1]
					"Return to Karazhan", -- [2]
				},
				[36948] = {
					"Muradin Bronzebeard", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[123532] = {
					"Dark Keeper", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[162061] = {
					"Devos", -- [1]
					"Spires of Ascension", -- [2]
				},
				[158478] = {
					"Corruption Tumor", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[128651] = {
					"Hadal Darkfathom", -- [1]
					"Siege of Boralus", -- [2]
				},
				[37972] = {
					"Prince Keleseth", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[164621] = {
					"Oozing Slime", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[34133] = {
					"Champion of Hodir", -- [1]
					"Ulduar", -- [2]
				},
				[163086] = {
					"Rancid Gasbag", -- [1]
					"Theater of Pain", -- [2]
				},
				[168717] = {
					"Forsworn Justicar", -- [1]
					"Spires of Ascension", -- [2]
				},
				[123533] = {
					"Tarneth", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[128652] = {
					"Viq'Goth", -- [1]
					"Siege of Boralus", -- [2]
				},
				[3527] = {
					"Healing Stream Totem", -- [1]
					"Waycrest Manor", -- [2]
				},
				[168718] = {
					"Forsworn Warden", -- [1]
					"Spires of Ascension", -- [2]
				},
				[136470] = {
					"Refreshment Vendor", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[153874] = {
					"Mawsworn Sentry", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[36565] = {
					"Apothecary Baxter", -- [1]
					"Shadowfang Keep", -- [2]
				},
				[134423] = {
					"Abyss Dweller", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[131864] = {
					"Gorak Tul", -- [1]
					"Waycrest Manor", -- [2]
				},
				[33110] = {
					"Dark Rune Acolyte", -- [1]
					"Ulduar", -- [2]
				},
				[150292] = {
					"Mechagon Cavalry", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[163089] = {
					"Disgusting Refuse", -- [1]
					"Theater of Pain", -- [2]
				},
				[120719] = {
					"Lunar Priestess", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[37973] = {
					"Prince Taldaram", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[34134] = {
					"Winter Revenant", -- [1]
					"Ulduar", -- [2]
				},
				[136984] = {
					"Reban", -- [1]
					"Kings' Rest", -- [2]
				},
				[58960] = {
					"Korrothion", -- [1]
					"Eye of the Storm", -- [2]
				},
				[114321] = {
					"Lord Crispin Ference", -- [1]
					"Return to Karazhan", -- [2]
				},
				[165138] = {
					"Blight Bag", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[173840] = {
					"Plaguebound Devoted", -- [1]
					"Plaguefall", -- [2]
				},
				[120720] = {
					"Lunar Guard", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[156949] = {
					"Armsmaster Terenson", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[153878] = {
					"Mawsworn Archer", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[150295] = {
					"Tank Buster MK1", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[127119] = {
					"Freehold Deckhand", -- [1]
					"Freehold", -- [2]
				},
				[45268] = {
					"Servant of Siamat", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[26861] = {
					"King Ymiron", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[153879] = {
					"Deadsoul Shadow", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[159510] = {
					"Eye of the Depths", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[34135] = {
					"Winter Rumbler", -- [1]
					"Ulduar", -- [2]
				},
				[11673] = {
					"Ancient Core Hound", -- [1]
					"Molten Core", -- [2]
				},
				[150297] = {
					"Mechagon Renormalizer", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[118930] = {
					"Ixallon the Soulbreaker", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[12057] = {
					"Garr", -- [1]
					"Molten Core", -- [2]
				},
				[96664] = {
					"Valarjar Runecarver", -- [1]
					"Halls of Valor", -- [2]
				},
				[72350] = {
					"Dragonmaw Elite Grunt", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[153882] = {
					"Deadsoul Spirit", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[155930] = {
					"Deephive Chosen", -- [1]
					"Mogu'shan Scenario", -- [2]
				},
				[45269] = {
					"Servant of Siamat", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[169751] = {
					"Ashen Wasp", -- [1]
					"Theater of Pain", -- [2]
				},
				[171799] = {
					"Depths Warden", -- [1]
					"Sanguine Depths", -- [2]
				},
				[72351] = {
					"Dragonmaw Flagbearer", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[161562] = {
					"General Shar'az", -- [1]
					"Halls of Origination", -- [2]
				},
				[38487] = {
					"Fallen Warrior", -- [1]
					"Pit of Saron", -- [2]
				},
				[151325] = {
					"Alarm-o-Bot", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[172312] = {
					"Spinemaw Gorger", -- [1]
					"Mists of Tirna Scithe", -- [2]
				},
				[169753] = {
					"Famished Tick", -- [1]
					"Sanguine Depths", -- [2]
				},
				[153885] = {
					"Deadsoul Shambler", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[144160] = {
					"Chopper Redhook", -- [1]
					"Siege of Boralus", -- [2]
				},
				[72352] = {
					"Dragonmaw Ebon Stalker", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[26670] = {
					"Ymirjar Flesh Hunter", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[26734] = {
					"Azure Enforcer", -- [1]
					"The Nexus", -- [2]
				},
				[136483] = {
					"Ashvane Deckhand", -- [1]
					"Siege of Boralus", -- [2]
				},
				[145185] = {
					"Gnomercy 4.U.", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[138019] = {
					"Kul Tiran Vanguard", -- [1]
					"Siege of Boralus", -- [2]
				},
				[38104] = {
					"Plagued Zombie", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[72353] = {
					"Dragonmaw Flameslinger", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[151329] = {
					"Warden Skoldus", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[127124] = {
					"Freehold Barhand", -- [1]
					"Freehold", -- [2]
				},
				[153377] = {
					"Goop", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[171805] = {
					"Research Scribe", -- [1]
					"Sanguine Depths", -- [2]
				},
				[72354] = {
					"Dragonmaw Bonecrusher", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[151331] = {
					"Cellblock Sentinel", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[5134] = {
					"Jonivera Farmountain", -- [1]
					"Alterac Valley", -- [2]
				},
				[127381] = {
					"Silt Crab", -- [1]
					"Tol Dagor", -- [2]
				},
				[137511] = {
					"Bilge Rat Cutthroat", -- [1]
					"Siege of Boralus", -- [2]
				},
				[33754] = {
					"Dark Rune Thunderer", -- [1]
					"Ulduar", -- [2]
				},
				[125590] = {
					"Antoran Felguard", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[58964] = {
					"Gordus", -- [1]
					"Eye of the Storm", -- [2]
				},
				[163618] = {
					"Zolramus Necromancer", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[29742] = {
					"Snake Wrap", -- [1]
					"Gundrak", -- [2]
				},
				[70308] = {
					"Soul-Fed Construct", -- [1]
					"Throne of Thunder", -- [2]
				},
				[161571] = {
					"Anubisath Sentinel", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[163619] = {
					"Zolramus Bonecarver", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[153382] = {
					"Maw of the Maw", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[163620] = {
					"Rotspew", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[26735] = {
					"Azure Scale-Binder", -- [1]
					"The Nexus", -- [2]
				},
				[26799] = {
					"Horde Berserker", -- [1]
					"The Nexus", -- [2]
				},
				[120473] = {
					"Tidescale Combatant", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[163621] = {
					"Goregrind", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[72357] = {
					"Lieutenant Krugruk", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[137516] = {
					"Ashvane Invader", -- [1]
					"Siege of Boralus", -- [2]
				},
				[163622] = {
					"Goregrind Bits", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[137517] = {
					"Ashvane Destroyer", -- [1]
					"Siege of Boralus", -- [2]
				},
				[163623] = {
					"Rotspew Leftovers", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[155945] = {
					"Gherus the Chained", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[121498] = {
					"Twilight Soul", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[133935] = {
					"Animated Guardian", -- [1]
					"Kings' Rest", -- [2]
				},
				[122778] = {
					"Annihilator", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[152875] = {
					"Massive Crusher", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[37595] = {
					"Darkfallen Blood Knight", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[135472] = {
					"Zanazal the Wise", -- [1]
					"Kings' Rest", -- [2]
				},
				[157483] = {
					"Ysedra the Darkener", -- [1]
					"Halls of Origination", -- [2]
				},
				[137521] = {
					"Irontide Powdershot", -- [1]
					"Siege of Boralus", -- [2]
				},
				[135474] = {
					"Thistle Acolyte", -- [1]
					"Waycrest Manor", -- [2]
				},
				[175401] = {
					"Warden of Souls", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[135475] = {
					"Kula the Butcher", -- [1]
					"Kings' Rest", -- [2]
				},
				[168747] = {
					"Venomfang", -- [1]
					"Plaguefall", -- [2]
				},
				[26928] = {
					"Grand Magus Telestra", -- [1]
					"The Nexus", -- [2]
				},
				[120477] = {
					"Deep Stalker", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[124828] = {
					"Argus the Unmaker", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[9499] = {
					"Plugger Spazzring", -- [1]
					"Blackrock Depths", -- [2]
				},
				[155952] = {
					"Suffer", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[135989] = {
					"Shieldbearer of Zul", -- [1]
					"Atal'Dazar", -- [2]
				},
				[133430] = {
					"Venture Co. Mastermind", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[155953] = {
					"C'Thuffer", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[133943] = {
					"Minion of Zul", -- [1]
					"Kings' Rest", -- [2]
				},
				[36701] = {
					"Raging Spirit", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[36829] = {
					"Deathspeaker High Priest", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[133432] = {
					"Venture Co. Alchemist", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[133944] = {
					"Aspix", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[163121] = {
					"Stitched Vanguard", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[96677] = {
					"Steeljaw Grizzly", -- [1]
					"Halls of Valor", -- [2]
				},
				[163122] = {
					"Brittlebone Warrior", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[122783] = {
					"Blazing Imp", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[1860] = {
					"Graz'krast", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[70060] = {
					"Shadowed Voodoo Spirit", -- [1]
					"Throne of Thunder", -- [2]
				},
				[173360] = {
					"Plaguebelcher", -- [1]
					"Plaguefall", -- [2]
				},
				[162099] = {
					"General Kaal", -- [1]
					"Sanguine Depths", -- [2]
				},
				[96934] = {
					"Valarjar Trapper", -- [1]
					"Halls of Valor", -- [2]
				},
				[162100] = {
					"Kryxis the Voracious", -- [1]
					"Sanguine Depths", -- [2]
				},
				[167731] = {
					"Separation Assistant", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[26737] = {
					"Crazed Mana-Surge", -- [1]
					"The Nexus", -- [2]
				},
				[26801] = {
					"Horde Ranger", -- [1]
					"The Nexus", -- [2]
				},
				[133436] = {
					"Venture Co. Skyscorcher", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[31216] = {
					"Voiidmage", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[117154] = {
					"Razorjaw Acolyte", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[72365] = {
					"Dragonmaw Cannoneer", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[162102] = {
					"Grand Proctor Beryllia", -- [1]
					"Sanguine Depths", -- [2]
				},
				[163126] = {
					"Brittlebone Mage", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[151353] = {
					"Mawrat", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[153401] = {
					"K'thir Dominator", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[162103] = {
					"Executor Tarvold", -- [1]
					"Sanguine Depths", -- [2]
				},
				[120482] = {
					"Tidescale Seacaller", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[168246] = {
					"Reanimated Crossbowman", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[52571] = {
					"Majordomo Staghelm", -- [1]
					"Firelands", -- [2]
				},
				[163128] = {
					"Zolramus Sorcerer", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[74158] = {
					"Kor'kron Gunner", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[45917] = {
					"Cloud Prince", -- [1]
					"The Vortex Pinnacle", -- [2]
				},
				[4255] = {
					"Brogus Thunderbrew", -- [1]
					"Alterac Valley", -- [2]
				},
				[148797] = {
					"Magus of the Dead", -- [1]
					"Waycrest Manor", -- [2]
				},
				[138048] = {
					"Training Dummy", -- [1]
					"Waycrest Manor", -- [2]
				},
				[122532] = {
					"Ember of Taeshalach", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[160061] = {
					"Crawling Corruption", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[172858] = {
					"Stone Legion Goliath", -- [1]
					"Castle Nathria", -- [2]
				},
				[26930] = {
					"Grand Magus Telestra", -- [1]
					"The Nexus", -- [2]
				},
				[146753] = {
					"Kul Tiran Marine", -- [1]
					"Battle of Dazar'alor", -- [2]
				},
				[129699] = {
					"Ludwig Von Tortollan", -- [1]
					"Freehold", -- [2]
				},
				[136005] = {
					"Rowdy Reveler", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[137029] = {
					"Ordnance Specialist", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[71858] = {
					"Wavebinder Kardris", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[136006] = {
					"Rowdy Reveler", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[152898] = {
					"Deadsoul Chorus", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[5135] = {
					"Svalbrad Farmountain", -- [1]
					"Alterac Valley", -- [2]
				},
				[37217] = {
					"Precious", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[45919] = {
					"Young Storm Dragon", -- [1]
					"The Vortex Pinnacle", -- [2]
				},
				[71603] = {
					"Sha Puddle", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[71859] = {
					"Earthbreaker Haromm", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[97197] = {
					"Valarjar Purifier", -- [1]
					"Halls of Valor", -- [2]
				},
				[131402] = {
					"Underrot Tick", -- [1]
					"The Underrot", -- [2]
				},
				[29874] = {
					"Drakkari Inciter", -- [1]
					"Gundrak", -- [2]
				},
				[162115] = {
					"Koda Steelclaw", -- [1]
					"Vision of Ysera Scenario", -- [2]
				},
				[162116] = {
					"Lyanis Moonfall", -- [1]
					"Vision of Ysera Scenario", -- [2]
				},
				[133963] = {
					"Test Subject", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[26803] = {
					"Horde Cleric", -- [1]
					"The Nexus", -- [2]
				},
				[162117] = {
					"Tyrande Whisperwind", -- [1]
					"Vision of Ysera Scenario", -- [2]
				},
				[165189] = {
					"Ravager", -- [1]
					"Eye of the Storm", -- [2]
				},
				[152905] = {
					"Tower Sentinel", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[138061] = {
					"Venture Co. Longshoreman", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[171333] = {
					"Atal'ai Devoted", -- [1]
					"De Other Side", -- [2]
				},
				[134990] = {
					"Charged Dust Devil", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[52447] = {
					"Cinderweb Spiderling", -- [1]
					"Firelands", -- [2]
				},
				[53087] = {
					"Right Foot", -- [1]
					"Firelands", -- [2]
				},
				[134991] = {
					"Sandfury Stonefist", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[157002] = {
					"Imperial Enforcer", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[138063] = {
					"Posh Vacationer", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[163145] = {
					"Necromancer Ritualist", -- [1]
					"Maldraxxus Covenant Finale Scenario", -- [2]
				},
				[121003] = {
					"Rez the Tombwatcher", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[157003] = {
					"Imperial Duelist", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[138064] = {
					"Posh Vacationer", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[134993] = {
					"Mchimba the Embalmer", -- [1]
					"Kings' Rest", -- [2]
				},
				[134994] = {
					"Spectral Headhunter", -- [1]
					"Kings' Rest", -- [2]
				},
				[164171] = {
					"Honored Duelist", -- [1]
					"Revendreth Scenario", -- [2]
				},
				[97202] = {
					"Olmyr the Enlightened", -- [1]
					"Halls of Valor", -- [2]
				},
				[138066] = {
					"Posh Vacationer", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[33125] = {
					"Iron Honor Guard", -- [1]
					"Ulduar", -- [2]
				},
				[133972] = {
					"Heavy Cannon", -- [1]
					"Tol Dagor", -- [2]
				},
				[45922] = {
					"Empyrean Assassin", -- [1]
					"The Vortex Pinnacle", -- [2]
				},
				[71865] = {
					"Garrosh Hellscream", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[165197] = {
					"Skeletal Monstrosity", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[138068] = {
					"Posh Vacationer", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[70586] = {
					"Eternal Guardian", -- [1]
					"Throne of Thunder", -- [2]
				},
				[171341] = {
					"Bladebeak Hatchling", -- [1]
					"De Other Side", -- [2]
				},
				[52577] = {
					"Left Foot", -- [1]
					"Firelands", -- [2]
				},
				[133463] = {
					"Venture Co. War Machine", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[171342] = {
					"Juvenile Runestag", -- [1]
					"De Other Side", -- [2]
				},
				[70587] = {
					"Shale Stalker", -- [1]
					"Throne of Thunder", -- [2]
				},
				[171343] = {
					"Bladebeak Matriarch", -- [1]
					"De Other Side", -- [2]
				},
				[164177] = {
					"Royal Nightcloak", -- [1]
					"Revendreth Scenario", -- [2]
				},
				[158035] = {
					"Magister Umbric", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[139097] = {
					"Sandswept Marksman", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[156501] = {
					"Ravnyr", -- [1]
					"Darkmaul Citadel", -- [2]
				},
				[153942] = {
					"Annihilator Lak'hal", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[69821] = {
					"Thunder Lord", -- [1]
					"Throne of Thunder", -- [2]
				},
				[70589] = {
					"Cavern Burrower", -- [1]
					"Throne of Thunder", -- [2]
				},
				[170323] = {
					"General Grashaal", -- [1]
					"Revendreth Scenario", -- [2]
				},
				[163157] = {
					"Amarth", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[72893] = {
					"Orgrimmar Peon", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[136541] = {
					"Bile Oozeling", -- [1]
					"Waycrest Manor", -- [2]
				},
				[162647] = {
					"Willing Sacrifice", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[44261] = {
					"Sharptalon Eagle", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[157017] = {
					"Lithic Watcher", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[170838] = {
					"Unyielding Contender", -- [1]
					"Theater of Pain", -- [2]
				},
				[135007] = {
					"Orb Guardian", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[32872] = {
					"Runic Colossus", -- [1]
					"Ulduar", -- [2]
				},
				[155483] = {
					"Faeleaf Shimmerwing", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[164185] = {
					"Echelon", -- [1]
					"Halls of Atonement", -- [2]
				},
				[128434] = {
					"Feasting Skyscreamer", -- [1]
					"Atal'Dazar", -- [2]
				},
				[43878] = {
					"Grand Vizier Ertan", -- [1]
					"The Vortex Pinnacle", -- [2]
				},
				[73152] = {
					"Storeroom Guard", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[26550] = {
					"Dragonflayer Deathseeker", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[36840] = {
					"Ymirjar Wrathbringer", -- [1]
					"Pit of Saron", -- [2]
				},
				[32873] = {
					"Ancient Rune Giant", -- [1]
					"Ulduar", -- [2]
				},
				[53732] = {
					"Unbound Smoldering Elemental", -- [1]
					"Firelands", -- [2]
				},
				[128435] = {
					"Toxic Saurid", -- [1]
					"Atal'Dazar", -- [2]
				},
				[164189] = {
					"Horrific Figment", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[164702] = {
					"Carrion Worm", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[136549] = {
					"Ashvane Cannoneer", -- [1]
					"Siege of Boralus", -- [2]
				},
				[70594] = {
					"Mist Lurker", -- [1]
					"Throne of Thunder", -- [2]
				},
				[119990] = {
					"Wolf", -- [1]
					"Waycrest Manor", -- [2]
				},
				[116407] = {
					"Harjatan", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[164191] = {
					"Noble Courtier", -- [1]
					"Revendreth Scenario", -- [2]
				},
				[173405] = {
					"Deathspeaker Yutla", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[36841] = {
					"Fallen Warrior", -- [1]
					"Pit of Saron", -- [2]
				},
				[36969] = {
					"Skybreaker Rifleman", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[173406] = {
					"Renegade Abomination", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[169823] = {
					"Gorm Behemoth", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[164705] = {
					"Pestilence Slime", -- [1]
					"Plaguefall", -- [2]
				},
				[136552] = {
					"Kao-Tien Marauder", -- [1]
					"Atal'Dazar", -- [2]
				},
				[130485] = {
					"Mechanized Peacekeeper", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[144231] = {
					"Rowdy Reveler", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[133482] = {
					"Crawler Mine", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[164707] = {
					"Congealed Slime", -- [1]
					"Plaguefall", -- [2]
				},
				[161124] = {
					"Urg'roth, Breaker of Heroes", -- [1]
					"Waycrest Manor", -- [2]
				},
				[170850] = {
					"Raging Bloodhorn", -- [1]
					"Theater of Pain", -- [2]
				},
				[53094] = {
					"Patriarch Fire Turtle", -- [1]
					"Firelands", -- [2]
				},
				[53222] = {
					"Flamewaker Centurion", -- [1]
					"Firelands", -- [2]
				},
				[139626] = {
					"Dredged Sailor", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[37098] = {
					"Val'kyr Herald", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[70341] = {
					"Tormented Spirit", -- [1]
					"Throne of Thunder", -- [2]
				},
				[33515] = {
					"Auriaya", -- [1]
					"Ulduar", -- [2]
				},
				[172899] = {
					"Nathrian Enforcer", -- [1]
					"Castle Nathria", -- [2]
				},
				[158567] = {
					"Tormented Kor'kron Annihilator", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[165222] = {
					"Zolramus Bonemender", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[158056] = {
					"Rat", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[129208] = {
					"Dread Captain Lockwood", -- [1]
					"Siege of Boralus", -- [2]
				},
				[61029] = {
					"Primal Fire Elemental", -- [1]
					"The Battle for Gilneas", -- [2]
				},
				[6112] = {
					"Windfury Totem", -- [1]
					"Theater of Pain", -- [2]
				},
				[73414] = {
					"Kor'kron Reaper", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[53223] = {
					"Flamewaker Beast Handler", -- [1]
					"Firelands", -- [2]
				},
				[32876] = {
					"Dark Rune Champion", -- [1]
					"Ulduar", -- [2]
				},
				[152939] = {
					"Boundless Corruption", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[153451] = {
					"Kosarus the Fallen", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[33772] = {
					"Faceless Horror", -- [1]
					"Ulduar", -- [2]
				},
				[156523] = {
					"Maut", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[72903] = {
					"Kor'kron Siegemaster", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[130489] = {
					"Dazarian Stalker", -- [1]
					"Freehold", -- [2]
				},
				[118460] = {
					"Engine of Souls", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[163690] = {
					"Shath'Yar Scribe", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[134514] = {
					"Abyssal Cultist", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[53096] = {
					"Fire Turtle Hatchling", -- [1]
					"Firelands", -- [2]
				},
				[53224] = {
					"Flamewaker Taskmaster", -- [1]
					"Firelands", -- [2]
				},
				[37228] = {
					"Frostwarden Warrior", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[37868] = {
					"Risen Archmage", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[156015] = {
					"Writhing Soulmass", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[97219] = {
					"Solsten", -- [1]
					"Halls of Valor", -- [2]
				},
				[134005] = {
					"Shalebiter", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[69834] = {
					"Lightning Guardian", -- [1]
					"Throne of Thunder", -- [2]
				},
				[119742] = {
					"Felguard Invader", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[160112] = {
					"Stone Legion Nightblade", -- [1]
					"Revendreth Scenario", -- [2]
				},
				[144244] = {
					"The Platinum Pummeler", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[121790] = {
					"Fleetlord Dominator", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[114624] = {
					"Arcane Warden", -- [1]
					"Return to Karazhan", -- [2]
				},
				[33134] = {
					"Sara", -- [1]
					"Ulduar", -- [2]
				},
				[137591] = {
					"Healing Tide Totem", -- [1]
					"Kings' Rest", -- [2]
				},
				[171887] = {
					"Slimy Smorgasbord", -- [1]
					"Plaguefall", -- [2]
				},
				[144246] = {
					"K.U.-J.0.", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[142199] = {
					"Alpine Hawk", -- [1]
					"Freehold", -- [2]
				},
				[171376] = {
					"Head Custodian Javlin", -- [1]
					"Sanguine Depths", -- [2]
				},
				[114625] = {
					"Phantom Guest", -- [1]
					"Return to Karazhan", -- [2]
				},
				[129214] = {
					"Coin-Operated Crowd Pummeler", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[144248] = {
					"Head Machinist Sparkflux", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[169330] = {
					"Mucky Grunt", -- [1]
					"Revendreth Scenario", -- [2]
				},
				[26553] = {
					"Dragonflayer Fanatic", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[114626] = {
					"Forlorn Spirit", -- [1]
					"Return to Karazhan", -- [2]
				},
				[144249] = {
					"Omega Buster", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[134012] = {
					"Taskmaster Askari", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[156023] = {
					"Miniature Soulmass", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[166262] = {
					"Decaying Corpse", -- [1]
					"Darkmaul Citadel", -- [2]
				},
				[168310] = {
					"Plagueroc", -- [1]
					"Plaguefall", -- [2]
				},
				[12127] = {
					"Stormpike Guardsman", -- [1]
					"Alterac Valley", -- [2]
				},
				[114628] = {
					"Skeletal Waiter", -- [1]
					"Return to Karazhan", -- [2]
				},
				[33136] = {
					"Guardian of Yogg-Saron", -- [1]
					"Ulduar", -- [2]
				},
				[166264] = {
					"Spare Parts", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[150396] = {
					"Aerial Unit R-21/X", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[135552] = {
					"Deathtouched Slaver", -- [1]
					"Waycrest Manor", -- [2]
				},
				[4257] = {
					"Lana Thunderbrew", -- [1]
					"Alterac Valley", -- [2]
				},
				[132481] = {
					"Kul Tiran Vanguard", -- [1]
					"Siege of Boralus", -- [2]
				},
				[72655] = {
					"Fragment of Pride", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[150397] = {
					"King Mechagon", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[171384] = {
					"Research Scribe", -- [1]
					"Sanguine Depths", -- [2]
				},
				[131009] = {
					"Spirit of Gold", -- [1]
					"Atal'Dazar", -- [2]
				},
				[164218] = {
					"Lord Chamberlain", -- [1]
					"Halls of Atonement", -- [2]
				},
				[166266] = {
					"Spare Parts", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[158588] = {
					"Gamon", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[120516] = {
					"Razorjaw Swiftfin", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[175992] = {
					"Dutiful Attendant", -- [1]
					"Castle Nathria", -- [2]
				},
				[26554] = {
					"Dragonflayer Seer", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[26746] = {
					"Crazed Mana-Wraith", -- [1]
					"The Nexus", -- [2]
				},
				[37232] = {
					"Nerub'ar Broodling", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[27386] = {
					"Avenging Spirit", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[163199] = {
					"Rathborne", -- [1]
					"Maldraxxus Covenant Finale Scenario", -- [2]
				},
				[167806] = {
					"Animated Sin", -- [1]
					"Halls of Atonement", -- [2]
				},
				[168318] = {
					"Forsworn Goliath", -- [1]
					"Spires of Ascension", -- [2]
				},
				[173949] = {
					"Nathrian Soldier", -- [1]
					"Castle Nathria", -- [2]
				},
				[114632] = {
					"Spectral Attendant", -- [1]
					"Return to Karazhan", -- [2]
				},
				[69843] = {
					"Zao'cho", -- [1]
					"Throne of Thunder", -- [2]
				},
				[162689] = {
					"Surgeon Stitchflesh", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[135048] = {
					"Gorestained Piglet", -- [1]
					"Waycrest Manor", -- [2]
				},
				[164737] = {
					"Brood Ambusher", -- [1]
					"Plaguefall", -- [2]
				},
				[157571] = {
					"Mawsworn Flametender", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[114633] = {
					"Spectral Valet", -- [1]
					"Return to Karazhan", -- [2]
				},
				[157572] = {
					"Mawsworn Firecaller", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[162691] = {
					"Blightbone", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[71380] = {
					"Animated Stone Mogu", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[135562] = {
					"Venomous Ophidian", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[165251] = {
					"Illusionary Vulpin", -- [1]
					"Mists of Tirna Scithe", -- [2]
				},
				[173953] = {
					"Loyal Gargon", -- [1]
					"Castle Nathria", -- [2]
				},
				[166275] = {
					"Mistveil Shaper", -- [1]
					"Mists of Tirna Scithe", -- [2]
				},
				[170882] = {
					"Bone Magus", -- [1]
					"Theater of Pain", -- [2]
				},
				[26555] = {
					"Scourge Hulk", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[126919] = {
					"Irontide Stormcaller", -- [1]
					"Freehold", -- [2]
				},
				[32883] = {
					"Captured Mercenary Soldier", -- [1]
					"Ulduar", -- [2]
				},
				[169859] = {
					"Observer Zelgar", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[166276] = {
					"Mistveil Guardian", -- [1]
					"Mists of Tirna Scithe", -- [2]
				},
				[162693] = {
					"Nalthor the Rimebinder", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[87761] = {
					"Dungeoneer's Training Dummy", -- [1]
					"FW Horde Garrison Level 3", -- [2]
				},
				[135052] = {
					"Blight Toad", -- [1]
					"Waycrest Manor", -- [2]
				},
				[136076] = {
					"Agitated Nimbus", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[72661] = {
					"Zeal", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[69078] = {
					"Sul the Sandcrawler", -- [1]
					"Throne of Thunder", -- [2]
				},
				[166971] = {
					"Castellan Niklaus", -- [1]
					"Castle Nathria", -- [2]
				},
				[168837] = {
					"Stealthling", -- [1]
					"Plaguefall", -- [2]
				},
				[173444] = {
					"Caramain", -- [1]
					"Castle Nathria", -- [2]
				},
				[169861] = {
					"Ickor Bileflesh", -- [1]
					"Plaguefall", -- [2]
				},
				[73226] = {
					"Lesser Sha Puddle", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[161140] = {
					"Bwemba", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[71382] = {
					"Burial Urn", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[170093] = {
					"Mawsworn Seeker", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[168326] = {
					"Shattered Visage", -- [1]
					"De Other Side", -- [2]
				},
				[72150] = {
					"Kor'kron Shadowmage", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[173445] = {
					"Sindrel", -- [1]
					"Castle Nathria", -- [2]
				},
				[72662] = {
					"Vanity", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[137614] = {
					"Demolishing Terror", -- [1]
					"Siege of Boralus", -- [2]
				},
				[42691] = {
					"Stonecore Rift Conjurer", -- [1]
					"The Stonecore", -- [2]
				},
				[49045] = {
					"Augh", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[114636] = {
					"Phantom Guardsman", -- [1]
					"Return to Karazhan", -- [2]
				},
				[42845] = {
					"Rock Borer", -- [1]
					"The Stonecore", -- [2]
				},
				[173361] = {
					"Slimy Morsel", -- [1]
					"Plaguefall", -- [2]
				},
				[173446] = {
					"Hargitas", -- [1]
					"Castle Nathria", -- [2]
				},
				[137103] = {
					"Blood Visage", -- [1]
					"The Underrot", -- [2]
				},
				[43286] = {
					"Crystal Shard", -- [1]
					"The Stonecore", -- [2]
				},
				[43438] = {
					"Corborus", -- [1]
					"The Stonecore", -- [2]
				},
				[71383] = {
					"Kor'thik Warcaller", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[128969] = {
					"Ashvane Commander", -- [1]
					"Siege of Boralus", -- [2]
				},
				[42808] = {
					"Stonecore Flayer", -- [1]
					"The Stonecore", -- [2]
				},
				[29307] = {
					"Drakkari Colossus", -- [1]
					"Gundrak", -- [2]
				},
				[173613] = {
					"Nathrian Registrar", -- [1]
					"Castle Nathria", -- [2]
				},
				[163520] = {
					"Forsworn Squad-Leader", -- [1]
					"Spires of Ascension", -- [2]
				},
				[45001] = {
					"Enslaved Bandit", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[44704] = {
					"Minion of Siamat", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[125545] = {
					"Blazing Imp", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[114637] = {
					"Spectral Sentry", -- [1]
					"Return to Karazhan", -- [2]
				},
				[171500] = {
					"Shuffling Corpse", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[29819] = {
					"Drakkari Lancer", -- [1]
					"Gundrak", -- [2]
				},
				[173448] = {
					"Dragost", -- [1]
					"Castle Nathria", -- [2]
				},
				[29768] = {
					"Unyielding Constrictor", -- [1]
					"Gundrak", -- [2]
				},
				[158092] = {
					"Fallen Heartpiercer", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[43612] = {
					"High Prophet Barim", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[62982] = {
					"Mindbender", -- [1]
					"Deepwind Gorge", -- [2]
				},
				[44819] = {
					"Siamat", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[44977] = {
					"Neferset Torturer", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[156143] = {
					"Voidcrazed Hulk", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[72408] = {
					"Anti-Air Turret", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[33432] = {
					"Leviathan Mk II", -- [1]
					"Ulduar", -- [2]
				},
				[13216] = {
					"Gaelden Hammersmith", -- [1]
					"Alterac Valley", -- [2]
				},
				[47720] = {
					"Camel", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[36724] = {
					"Servant of the Throne", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[162041] = {
					"Grubby Dirtcruncher", -- [1]
					"Sanguine Depths", -- [2]
				},
				[26684] = {
					"Ravenous Furbolg", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[168843] = {
					"Klotos", -- [1]
					"Spires of Ascension", -- [2]
				},
				[165260] = {
					"Oozing Leftovers", -- [1]
					"Theater of Pain", -- [2]
				},
				[44981] = {
					"Oathsworn Skinner", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[120013] = {
					"The Dread Stalker", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[130909] = {
					"Fetid Maggot", -- [1]
					"The Underrot", -- [2]
				},
				[163213] = {
					"Maw Infernous", -- [1]
					"Maldraxxus Covenant Finale Scenario", -- [2]
				},
				[122366] = {
					"Varimathras", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[129227] = {
					"Azerokk", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[168844] = {
					"Lakesis", -- [1]
					"Spires of Ascension", -- [2]
				},
				[37132] = {
					"Ymirjar Battle-Maiden", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[157583] = {
					"Forge Keeper", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[37004] = {
					"Skybreaker Dreadblade", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[13318] = {
					"Commander Mortimer", -- [1]
					"Alterac Valley", -- [2]
				},
				[44982] = {
					"Neferset Darkcaster", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[31260] = {
					"Ymirjar Skycaller", -- [1]
					"Pit of Saron", -- [2]
				},
				[174802] = {
					"Venomous Sniper", -- [1]
					"Plaguefall", -- [2]
				},
				[168845] = {
					"Astronos", -- [1]
					"Spires of Ascension", -- [2]
				},
				[36950] = {
					"Skybreaker Marine", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[157584] = {
					"Flameforge Master", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[29832] = {
					"Drakkari Golem", -- [1]
					"Gundrak", -- [2]
				},
				[72131] = {
					"Blind Blademaster", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[122973] = {
					"Dazar'ai Confessor", -- [1]
					"Atal'Dazar", -- [2]
				},
				[159632] = {
					"Cultist Shadowblade", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[32882] = {
					"Jormungar Behemoth", -- [1]
					"Ulduar", -- [2]
				},
				[26668] = {
					"Svala Sorrowgrave", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[36658] = {
					"Scourgelord Tyrannus", -- [1]
					"Pit of Saron", -- [2]
				},
				[43658] = {
					"Frenzied Crocolisk", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[61245] = {
					"Capacitor Totem", -- [1]
					"Theater of Pain", -- [2]
				},
				[36597] = {
					"The Lich King", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[36725] = {
					"Nerub'ar Broodkeeper", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[159633] = {
					"Cultist Executioner", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[32886] = {
					"Dark Rune Acolyte", -- [1]
					"Ulduar", -- [2]
				},
				[73742] = {
					"Thresher Turret", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[53617] = {
					"Molten Erupter", -- [1]
					"Firelands", -- [2]
				},
				[53745] = {
					"Engorged Broodling", -- [1]
					"Firelands", -- [2]
				},
				[121975] = {
					"Aggramar", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[44260] = {
					"Venomfang Crocolisk", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[120527] = {
					"Jhorneth", -- [1]
					"Warsong Gulch", -- [2]
				},
				[122968] = {
					"Yazma", -- [1]
					"Atal'Dazar", -- [2]
				},
				[128455] = {
					"T'lonja", -- [1]
					"Atal'Dazar", -- [2]
				},
				[37666] = {
					"Darkfallen Tactician", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[72411] = {
					"Kor'kron Provisioner", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[105427] = {
					"Skyfury Totem", -- [1]
					"The Battle for Gilneas", -- [2]
				},
				[152644] = {
					"Deadsoul Drifter", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[134041] = {
					"Infected Peasant", -- [1]
					"Waycrest Manor", -- [2]
				},
				[118715] = {
					"Reanimated Templar", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[72455] = {
					"Overseer Komak", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[168337] = {
					"Moldovaak", -- [1]
					"Castle Nathria", -- [2]
				},
				[29820] = {
					"Drakkari God Hunter", -- [1]
					"Gundrak", -- [2]
				},
				[151613] = {
					"Anti-Personnel Squirrel", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[34137] = {
					"Winter Jormungar", -- [1]
					"Ulduar", -- [2]
				},
				[137625] = {
					"Demolishing Terror", -- [1]
					"Siege of Boralus", -- [2]
				},
				[69132] = {
					"High Priestess Mar'li", -- [1]
					"Throne of Thunder", -- [2]
				},
				[71388] = {
					"Amber-Encased Kunchong", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[116689] = {
					"Atrigan", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[156821] = {
					"Darkmaul Shadowcaller", -- [1]
					"Darkmaul Citadel", -- [2]
				},
				[33717] = {
					"Azure Consort", -- [1]
					"Ulduar", -- [2]
				},
				[72412] = {
					"Kor'kron Grunt", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[122963] = {
					"Rezan", -- [1]
					"Atal'Dazar", -- [2]
				},
				[137626] = {
					"Demolishing Terror", -- [1]
					"Siege of Boralus", -- [2]
				},
				[122469] = {
					"Diima, Mother of Gloom", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[150249] = {
					"Pistonhead Scrapper", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[49267] = {
					"Crystal Shard", -- [1]
					"The Stonecore", -- [2]
				},
				[73948] = {
					"Commander Ik'tal", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[81362] = {
					"Frostwall Goren", -- [1]
					"FW Horde Garrison Level 3", -- [2]
				},
				[69639] = {
					"Humming Crystal", -- [1]
					"Throne of Thunder", -- [2]
				},
				[169875] = {
					"Shackled Soul", -- [1]
					"Theater of Pain", -- [2]
				},
				[69383] = {
					"Quivering Blob", -- [1]
					"Throne of Thunder", -- [2]
				},
				[71529] = {
					"Thok the Bloodthirsty", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[162692] = {
					"Amarth", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[136297] = {
					"Forgotten Denizen", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[129231] = {
					"Rixxa Fluxflame", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[33818] = {
					"Twilight Adherent", -- [1]
					"Ulduar", -- [2]
				},
				[11671] = {
					"Core Hound", -- [1]
					"Molten Core", -- [2]
				},
				[120777] = {
					"Guardian Sentry", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[164188] = {
					"Horrific Figment", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[53127] = {
					"Fire Scorpion", -- [1]
					"Firelands", -- [2]
				},
				[36886] = {
					"Geist Ambusher", -- [1]
					"Pit of Saron", -- [2]
				},
				[126928] = {
					"Irontide Corsair", -- [1]
					"Freehold", -- [2]
				},
				[73949] = {
					"Commander Na'kaz", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[101637] = {
					"Valarjar Aspirant", -- [1]
					"Halls of Valor", -- [2]
				},
				[136330] = {
					"Soul Thorns", -- [1]
					"Waycrest Manor", -- [2]
				},
				[69388] = {
					"Zandalari Spear-Shaper", -- [1]
					"Throne of Thunder", -- [2]
				},
				[133007] = {
					"Unbound Abomination", -- [1]
					"The Underrot", -- [2]
				},
				[95833] = {
					"Hyrja", -- [1]
					"Halls of Valor", -- [2]
				},
				[148631] = {
					"Unexploded Ordnance", -- [1]
					"Battle of Dazar'alor", -- [2]
				},
				[116691] = {
					"Belac", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[129232] = {
					"Mogul Razdunk", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[33755] = {
					"Dark Rune Ravager", -- [1]
					"Ulduar", -- [2]
				},
				[417] = {
					"Droomon", -- [1]
					"Theater of Pain", -- [2]
				},
				[173973] = {
					"Nathrian Tracker", -- [1]
					"Castle Nathria", -- [2]
				},
				[115844] = {
					"Goroth", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[13319] = {
					"Commander Duffy", -- [1]
					"Alterac Valley", -- [2]
				},
				[122578] = {
					"Kin'garoth", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[36855] = {
					"Lady Deathwhisper", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[101639] = {
					"Valarjar Shieldmaiden", -- [1]
					"Halls of Valor", -- [2]
				},
				[129527] = {
					"Bilge Rat Buccaneer", -- [1]
					"Freehold", -- [2]
				},
				[152987] = {
					"Faceless Willbreaker", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[157594] = {
					"Lesser Void Elemental", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[154011] = {
					"Armed Prisoner", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[153244] = {
					"Oblivion Elemental", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[121004] = {
					"Razorjaw Myrmidon", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[53206] = {
					"Hell Hound", -- [1]
					"Firelands", -- [2]
				},
				[157083] = {
					"Stonewing Ravager", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[144286] = {
					"Asset Manager", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[152988] = {
					"Faceless Shadowcaller", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[129367] = {
					"Bilge Rat Tempest", -- [1]
					"Siege of Boralus", -- [2]
				},
				[72927] = {
					"Kovok", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[154524] = {
					"K'thir Mindcarver", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[125547] = {
					"Feltouched Skitterer", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[134024] = {
					"Devouring Maggot", -- [1]
					"Waycrest Manor", -- [2]
				},
				[73951] = {
					"Commander Tik", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[125569] = {
					"Riftworld Assistant", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[173464] = {
					"Deplina", -- [1]
					"Castle Nathria", -- [2]
				},
				[32907] = {
					"Captured Mercenary Captain", -- [1]
					"Ulduar", -- [2]
				},
				[37813] = {
					"Deathbringer Saurfang", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[126969] = {
					"Trothak", -- [1]
					"Freehold", -- [2]
				},
				[71392] = {
					"Shadow Ritualist Phylactery", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[156794] = {
					"SI:7 Light-Hunter", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[72964] = {
					"Goro'dan", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[165764] = {
					"Rockbound Vanquisher", -- [1]
					"Castle Nathria", -- [2]
				},
				[156818] = {
					"Wrathion", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[73310] = {
					"Dragonmaw War Banner", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[166299] = {
					"Mistveil Tender", -- [1]
					"Mists of Tirna Scithe", -- [2]
				},
				[73184] = {
					"Starved Yeti", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[137969] = {
					"Interment Construct", -- [1]
					"Kings' Rest", -- [2]
				},
				[96611] = {
					"Angerhoof Bull", -- [1]
					"Halls of Valor", -- [2]
				},
				[131492] = {
					"Devout Blood Priest", -- [1]
					"The Underrot", -- [2]
				},
				[23795] = {
					"Dark Iron Antagonist", -- [1]
					"Blackrock Depths", -- [2]
				},
				[173466] = {
					"Fara", -- [1]
					"Castle Nathria", -- [2]
				},
				[26798] = {
					"Commander Kolurg", -- [1]
					"The Nexus", -- [2]
				},
				[126333] = {
					"Felseeker Ritualist", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[120789] = {
					"Lieutenant Silvermight", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[71393] = {
					"Mogu Shadow Ritualist", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[176026] = {
					"Dancing Fools", -- [1]
					"Castle Nathria", -- [2]
				},
				[100943] = {
					"Earthen Wall Totem", -- [1]
					"Waycrest Manor", -- [2]
				},
				[136100] = {
					"Sunken Denizen", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[34014] = {
					"Sanctum Sentry", -- [1]
					"Ulduar", -- [2]
				},
				[170690] = {
					"Diseased Horror", -- [1]
					"Theater of Pain", -- [2]
				},
				[166301] = {
					"Mistveil Stalker", -- [1]
					"Mists of Tirna Scithe", -- [2]
				},
				[73185] = {
					"Enraged Mushan Beast", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[135049] = {
					"Dreadwing Raven", -- [1]
					"Waycrest Manor", -- [2]
				},
				[163978] = {
					"Darkwhisper Cultist", -- [1]
					"Blackwing Descent Scenario", -- [2]
				},
				[70236] = {
					"Zandalari Storm-Caller", -- [1]
					"Throne of Thunder", -- [2]
				},
				[122477] = {
					"F'harg", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[60849] = {
					"Jade Serpent Statue", -- [1]
					"Deepwind Gorge", -- [2]
				},
				[130179] = {
					"Apocalypsis Module", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[166302] = {
					"Corpse Harvester", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[33855] = {
					"Junk Bot", -- [1]
					"Ulduar", -- [2]
				},
				[36805] = {
					"Deathspeaker Servant", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[162664] = {
					"Aqir Swarmer", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[164255] = {
					"Globgrog", -- [1]
					"Plaguefall", -- [2]
				},
				[156577] = {
					"Therum Deepforge", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[173469] = {
					"Kullan", -- [1]
					"Castle Nathria", -- [2]
				},
				[123906] = {
					"Garothi Annihilator", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[154018] = {
					"Prisonbreak Mauler", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[45912] = {
					"Wild Vortex", -- [1]
					"The Vortex Pinnacle", -- [2]
				},
				[171422] = {
					"Arch-Suppressor Laguas", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[70240] = {
					"Shan'ze Celestial Shaper", -- [1]
					"Throne of Thunder", -- [2]
				},
				[160161] = {
					"Fog Dweller", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[144293] = {
					"Waste Processing Unit", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[152995] = {
					"Warden of Souls", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[14465] = {
					"Alliance Battle Standard", -- [1]
					"The Battle for Gilneas", -- [2]
				},
				[166304] = {
					"Mistveil Stinger", -- [1]
					"Mists of Tirna Scithe", -- [2]
				},
				[99804] = {
					"Valarjar Falconer", -- [1]
					"Halls of Valor", -- [2]
				},
				[71395] = {
					"Modified Anima Golem", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[29305] = {
					"Moorabi", -- [1]
					"Gundrak", -- [2]
				},
				[134056] = {
					"Aqu'sirr", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[144294] = {
					"Mechagon Tinkerer", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[156642] = {
					"Enthralled Laborer", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[157603] = {
					"Void Globule", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[154020] = {
					"Prisonbreak Cursewalker", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[69916] = {
					"Gurubashi Berserker", -- [1]
					"Throne of Thunder", -- [2]
				},
				[29630] = {
					"Fanged Pit Viper", -- [1]
					"Gundrak", -- [2]
				},
				[163746] = {
					"Walkie Shockie X1", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[144295] = {
					"Mechagon Mechanic", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[29822] = {
					"Drakkari Fire Weaver", -- [1]
					"Gundrak", -- [2]
				},
				[100937] = {
					"Dark Rider", -- [1]
					"Karazhan Catacombs", -- [2]
				},
				[157604] = {
					"Crawling Corruption", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[134139] = {
					"Shrine Templar", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[134058] = {
					"Galecaller Faye", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[32930] = {
					"Kologarn", -- [1]
					"Ulduar", -- [2]
				},
				[32517] = {
					"Loque'nahak", -- [1]
					"Waycrest Manor", -- [2]
				},
				[88288] = {
					"Dungeoneer's Training Dummy", -- [1]
					"FW Horde Garrison Level 3", -- [2]
				},
				[144296] = {
					"Spider Tank", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[158565] = {
					"Naros", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[157605] = {
					"Burrowing Appendage", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[72194] = {
					"Hellscream Demolisher", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[73188] = {
					"Captive Cave Bat", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[37562] = {
					"Gas Cloud", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[129369] = {
					"Irontide Raider", -- [1]
					"Siege of Boralus", -- [2]
				},
				[26687] = {
					"Gortok Palehoof", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[53494] = {
					"Baleroc", -- [1]
					"Firelands", -- [2]
				},
				[157094] = {
					"Imperial Curator", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[99541] = {
					"Risen Skulker", -- [1]
					"Theater of Pain", -- [2]
				},
				[127111] = {
					"Irontide Oarsman", -- [1]
					"Freehold", -- [2]
				},
				[134060] = {
					"Lord Stormsong", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[71397] = {
					"Zar'thik Amber Priest", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[156158] = {
					"Adjutant Felipos", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[164261] = {
					"Hungering Destroyer", -- [1]
					"Castle Nathria", -- [2]
				},
				[144298] = {
					"Defense Bot Mk III", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[72421] = {
					"Kor'kron Overseer", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[157607] = {
					"Faceless Shadowcaller", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[130488] = {
					"Mech Jockey", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[120463] = {
					"Undersea Custodian", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[36830] = {
					"Wrathbone Laborer", -- [1]
					"Pit of Saron", -- [2]
				},
				[47238] = {
					"Whipping Wind", -- [1]
					"The Vortex Pinnacle", -- [2]
				},
				[144232] = {
					"Rowdy Reveler", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[144299] = {
					"Workshop Defender", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[118518] = {
					"Priestess Lunaspyre", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[157608] = {
					"Faceless Willbreaker", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[23872] = {
					"Coren Direbrew", -- [1]
					"Blackrock Depths", -- [2]
				},
				[133379] = {
					"Adderis", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[71454] = {
					"Malkorok", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[72986] = {
					"Shanna Sparkfizz", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[141565] = {
					"Kul Tiran Footman", -- [1]
					"Siege of Boralus", -- [2]
				},
				[144300] = {
					"Mechagon Citizen", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[175091] = {
					"Necrotic Droplet", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[157609] = {
					"K'thir Mindcarver", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[68313] = {
					"Roaming Fog", -- [1]
					"Throne of Thunder", -- [2]
				},
				[134063] = {
					"Brother Ironhull", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[69351] = {
					"Greater Cave Bat", -- [1]
					"Throne of Thunder", -- [2]
				},
				[131445] = {
					"Block Warden", -- [1]
					"Tol Dagor", -- [2]
				},
				[160169] = {
					"Honored Duelist", -- [1]
					"Revendreth Scenario", -- [2]
				},
				[144301] = {
					"Living Waste", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[153003] = {
					"Soul Fragment", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[157610] = {
					"K'thir Dominator", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[168949] = {
					"Risen Bonesoldier", -- [1]
					"De Other Side", -- [2]
				},
				[162729] = {
					"Patchwerk Soldier", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[171431] = {
					"Suppressor Vellon", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[53619] = {
					"Druid of the Flame", -- [1]
					"Firelands", -- [2]
				},
				[72658] = {
					"Amalgamated Hubris", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[36961] = {
					"Skybreaker Sergeant", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[157099] = {
					"Imperial Censor", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[123402] = {
					"Garothi Decimator", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[69352] = {
					"Vampiric Cave Bat", -- [1]
					"Throne of Thunder", -- [2]
				},
				[73191] = {
					"Aqueous Defender", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[171432] = {
					"Suppressor Hersi", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[165108] = {
					"Illusionary Clone", -- [1]
					"Mists of Tirna Scithe", -- [2]
				},
				[168361] = {
					"Fen Hornet", -- [1]
					"Plaguefall", -- [2]
				},
				[144303] = {
					"G.U.A.R.D.", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[132530] = {
					"Kul Tiran Vanguard", -- [1]
					"Siege of Boralus", -- [2]
				},
				[173044] = {
					"Stitching Assistant", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[32865] = {
					"Thorim", -- [1]
					"Ulduar", -- [2]
				},
				[37729] = {
					"Wrathbone Reaver", -- [1]
					"Pit of Saron", -- [2]
				},
				[171433] = {
					"Suppressor Cer", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[130400] = {
					"Irontide Crusher", -- [1]
					"Freehold", -- [2]
				},
				[164267] = {
					"Margrave Stradama", -- [1]
					"Plaguefall", -- [2]
				},
				[162038] = {
					"Regal Mistdancer", -- [1]
					"Sanguine Depths", -- [2]
				},
				[157149] = {
					"Heartseeker", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[150959] = {
					"Mawsworn Interceptor", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[154030] = {
					"Oddly Large Mawrat", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[130522] = {
					"Freehold Shipmate", -- [1]
					"Freehold", -- [2]
				},
				[44922] = {
					"Oathsworn Axemaster", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[165339] = {
					"Empowered Baroness Ninadar", -- [1]
					"Maldraxxus Covenant Finale Scenario", -- [2]
				},
				[36627] = {
					"Rotface", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[37116] = {
					"Skybreaker Sorcerer", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[132532] = {
					"Kul Tiran Marksman", -- [1]
					"Siege of Boralus", -- [2]
				},
				[124166] = {
					"Torment of Khaz'goroth", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[151818] = {
					"Deadsoul Miscreation", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[157016] = {
					"Imperial Archivist", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[162305] = {
					"Aqir Heartpiercer", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[168033] = {
					"Fallen Monk", -- [1]
					"The Battle for Gilneas", -- [2]
				},
				[29829] = {
					"Drakkari Earthshaker", -- [1]
					"Gundrak", -- [2]
				},
				[130521] = {
					"Freehold Deckhand", -- [1]
					"Freehold", -- [2]
				},
				[161198] = {
					"Warpweaver Dushar", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[165805] = {
					"Shade of Kael'thas", -- [1]
					"Castle Nathria", -- [2]
				},
				[32934] = {
					"Right Arm", -- [1]
					"Ulduar", -- [2]
				},
				[134069] = {
					"Vol'zith the Whisperer", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[26669] = {
					"Ymirjar Savage", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[37970] = {
					"Prince Valanar", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[168365] = {
					"Fungret Shroomtender", -- [1]
					"Plaguefall", -- [2]
				},
				[100938] = {
					"Dark Rider", -- [1]
					"Karazhan Catacombs", -- [2]
				},
				[173484] = {
					"Conjured Manifestation", -- [1]
					"Castle Nathria", -- [2]
				},
				[170234] = {
					"Oppressive Banner", -- [1]
					"Theater of Pain", -- [2]
				},
				[37025] = {
					"Stinky", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[72191] = {
					"Overlord Runthak", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[126776] = {
					"Slobbering Fiend", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[33699] = {
					"Storm Tempered Keeper", -- [1]
					"Ulduar", -- [2]
				},
				[11988] = {
					"Golemagg the Incinerator", -- [1]
					"Molten Core", -- [2]
				},
				[168878] = {
					"Rigged Plagueborer", -- [1]
					"Plaguefall", -- [2]
				},
				[36477] = {
					"Krick", -- [1]
					"Pit of Saron", -- [2]
				},
				[130012] = {
					"Irontide Ravager", -- [1]
					"Freehold", -- [2]
				},
				[170414] = {
					"Howling Spectre", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[73194] = {
					"Kor'kron Iron Scorpion", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[122590] = {
					"Shadow of Varimathras", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[120721] = {
					"Lunar Archer", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[135192] = {
					"Honored Raptor", -- [1]
					"Kings' Rest", -- [2]
				},
				[53635] = {
					"Cinderweb Drone", -- [1]
					"Firelands", -- [2]
				},
				[153011] = {
					"Binder Baritas", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[133912] = {
					"Bloodsworn Defiler", -- [1]
					"The Underrot", -- [2]
				},
				[37501] = {
					"Nerub'ar Champion", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[170927] = {
					"Erupting Ooze", -- [1]
					"Plaguefall", -- [2]
				},
				[33271] = {
					"General Vezax", -- [1]
					"Ulduar", -- [2]
				},
				[151476] = {
					"Blastatron X-80", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[133389] = {
					"Galvazzt", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[155098] = {
					"Rexxar", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[72427] = {
					"Orgrimmar Peon", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[157275] = {
					"Darkwhisper Disciple", -- [1]
					"Blackwing Descent Scenario", -- [2]
				},
				[72958] = {
					"Dragonmaw Tidal Shaman", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[73195] = {
					"Kor'kron Jailer", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[150965] = {
					"Mawsworn Shackler", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[122847] = {
					"Umbral Priestess", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[36661] = {
					"Rimefang", -- [1]
					"Pit of Saron", -- [2]
				},
				[144311] = {
					"Orb Guardian", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[58605] = {
					"Scarlet Judicator", -- [1]
					"Scarlet Monastery", -- [2]
				},
				[169905] = {
					"Risen Warlord", -- [1]
					"De Other Side", -- [2]
				},
				[170417] = {
					"Animated Stygia", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[162310] = {
					"Hunter", -- [1]
					"Vision of Ysera Scenario", -- [2]
				},
				[70219] = {
					"Putrid Waste", -- [1]
					"Throne of Thunder", -- [2]
				},
				[96574] = {
					"Stormforged Sentinel", -- [1]
					"Halls of Valor", -- [2]
				},
				[129758] = {
					"Irontide Grenadier", -- [1]
					"Freehold", -- [2]
				},
				[168882] = {
					"Fleeting Manifestation", -- [1]
					"Sanguine Depths", -- [2]
				},
				[157109] = {
					"Vampire Bat", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[153526] = {
					"Aqir Swarmer", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[170418] = {
					"Goxul the Devourer", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[162133] = {
					"General Kaal", -- [1]
					"Sanguine Depths", -- [2]
				},
				[44924] = {
					"Oathsworn Myrmidon", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[152656] = {
					"Deadsoul Stalker", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[160181] = {
					"Royal Arcanist", -- [1]
					"Revendreth Scenario", -- [2]
				},
				[45872] = {
					"Rohash", -- [1]
					"Throne of the Four Winds", -- [2]
				},
				[153015] = {
					"Bound Soul", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[153527] = {
					"Aqir Swarmleader", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[37502] = {
					"Nerub'ar Webweaver", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[117269] = {
					"Kil'jaeden", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[71405] = {
					"Set'thik Wind Wielder", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[37886] = {
					"Gluttonous Abomination", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[160182] = {
					"Void Initiate", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[172979] = {
					"Honeydew Sporeflutterer", -- [1]
					"Mists of Tirna Scithe", -- [2]
				},
				[68397] = {
					"Lei Shen", -- [1]
					"Throne of Thunder", -- [2]
				},
				[134629] = {
					"Scaled Krolusk Rider", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[72941] = {
					"Dragonmaw Grunt", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[73197] = {
					"Lesser Sha Puddle", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[153943] = {
					"Decimator Shiq'voth", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[12096] = {
					"Stormpike Quartermaster", -- [1]
					"Alterac Valley", -- [2]
				},
				[160183] = {
					"Void Fanatic", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[23682] = {
					"Headless Horseman", -- [1]
					"Scarlet Monastery", -- [2]
				},
				[26686] = {
					"Ferocious Rhino", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[139284] = {
					"Plague Doctor", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[158136] = {
					"Inquisitor Darkspeak", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[52524] = {
					"Cinderweb Spinner", -- [1]
					"Firelands", -- [2]
				},
				[163077] = {
					"Azules", -- [1]
					"Spires of Ascension", -- [2]
				},
				[68079] = {
					"Ro'shak", -- [1]
					"Throne of Thunder", -- [2]
				},
				[156089] = {
					"Aqir Venomweaver", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[172981] = {
					"Kyrian Stitchwerk", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[129548] = {
					"Blacktooth Brute", -- [1]
					"Freehold", -- [2]
				},
				[131863] = {
					"Raal the Gluttonous", -- [1]
					"Waycrest Manor", -- [2]
				},
				[72942] = {
					"Dragonmaw Flagbearer", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[162744] = {
					"Nekthara the Mangler", -- [1]
					"Theater of Pain", -- [2]
				},
				[53115] = {
					"Molten Lord", -- [1]
					"Firelands", -- [2]
				},
				[122850] = {
					"Umbral Guard", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[168457] = {
					"Stonewall Gargon", -- [1]
					"Sanguine Depths", -- [2]
				},
				[165798] = {
					"Necromancer Ritualist", -- [1]
					"Maldraxxus Covenant Finale Scenario", -- [2]
				},
				[126764] = {
					"Bladesworn Ravager", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[153531] = {
					"Aqir Bonecrusher", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[135258] = {
					"Irontide Marauder", -- [1]
					"Siege of Boralus", -- [2]
				},
				[135971] = {
					"Faithless Conscript", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[121011] = {
					"Tidescale Witch", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[26693] = {
					"Skadi the Ruthless", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[36853] = {
					"Sindragosa", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[152508] = {
					"Dusky Tremorbeast", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[171474] = {
					"Finger Food", -- [1]
					"Plaguefall", -- [2]
				},
				[153532] = {
					"Aqir Mindhunter", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[72943] = {
					"Dragonmaw Proto-Drake", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[146366] = {
					"Molten Hound", -- [1]
					"Battle of Dazar'alor", -- [2]
				},
				[171448] = {
					"Dreadful Huntmaster", -- [1]
					"Sanguine Depths", -- [2]
				},
				[122851] = {
					"Umbral Archer", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[73775] = {
					"War Master Kragg", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[160699] = {
					"Angry Mailemental", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[157709] = {
					"Dreliana", -- [1]
					"Blackwing Descent Scenario", -- [2]
				},
				[127233] = {
					"Flameweaver", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[37027] = {
					"Skybreaker Hierophant", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[71152] = {
					"Skeer the Bloodseeker", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[71408] = {
					"Kun-Da", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[164929] = {
					"Tirnenn Villager", -- [1]
					"Mists of Tirna Scithe", -- [2]
				},
				[159303] = {
					"Monstrous Behemoth", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[131112] = {
					"Cutwater Striker", -- [1]
					"Tol Dagor", -- [2]
				},
				[153022] = {
					"Snang", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[10981] = {
					"Frost Wolf", -- [1]
					"Alterac Valley", -- [2]
				},
				[69702] = {
					"Ritualist Gond", -- [1]
					"Throne of Thunder", -- [2]
				},
				[136643] = {
					"Azerite Extractor", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[44926] = {
					"Oathsworn Wanderer", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[53244] = {
					"Flamewaker Trainee", -- [1]
					"Firelands", -- [2]
				},
				[26690] = {
					"Ymirjar Warrior", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[168891] = {
					"Rigged Plagueborer", -- [1]
					"Plaguefall", -- [2]
				},
				[157118] = {
					"Royal Advisor", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[26685] = {
					"Massive Jormungar", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[132126] = {
					"Gilded Priestess", -- [1]
					"Atal'Dazar", -- [2]
				},
				[71153] = {
					"Hisek the Swarmkeeper", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[71409] = {
					"Commander Zak'tar", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[152612] = {
					"Subjugator Klontzas", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[71921] = {
					"Darkfang", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[103477] = {
					"Cursed Guardian", -- [1]
					"Karazhan Catacombs", -- [2]
				},
				[162238] = {
					"Darkwhisper Cultist", -- [1]
					"Blackwing Descent Scenario", -- [2]
				},
				[149441] = {
					"Frozen Ballista", -- [1]
					"Battle of Dazar'alor", -- [2]
				},
				[72945] = {
					"Dragonmaw Bonecrusher", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[168005] = {
					"Empowered Deadsoul Shambler", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[36842] = {
					"Wrathbone Coldwraith", -- [1]
					"Pit of Saron", -- [2]
				},
				[71385] = {
					"Sri'thik Bombardier", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[126558] = {
					"Antoran Felguard", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[78001] = {
					"Cloudburst Totem", -- [1]
					"Waycrest Manor", -- [2]
				},
				[43391] = {
					"Millhouse Manastorm", -- [1]
					"The Stonecore", -- [2]
				},
				[174012] = {
					"Executrix Ophelia", -- [1]
					"Castle Nathria", -- [2]
				},
				[146371] = {
					"Dark Iron Primalist", -- [1]
					"Battle of Dazar'alor", -- [2]
				},
				[71154] = {
					"Ka'roz the Locust", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[164897] = {
					"Fog Dweller", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[134173] = {
					"Animated Droplet", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[131527] = {
					"Lord Waycrest", -- [1]
					"Waycrest Manor", -- [2]
				},
				[160704] = {
					"Letter Encrusted Void Globule", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[72434] = {
					"Treasury Guard", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[33670] = {
					"Aerial Command Unit", -- [1]
					"Ulduar", -- [2]
				},
				[69792] = {
					"Unruck", -- [1]
					"Eye of the Storm", -- [2]
				},
				[161217] = {
					"Aqir Skitterer", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[134599] = {
					"Imbued Stormcaller", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[158146] = {
					"Fallen Riftwalker", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[5139] = {
					"Kurdrum Barleybeard", -- [1]
					"Alterac Valley", -- [2]
				},
				[171455] = {
					"Stonewall Gargon", -- [1]
					"Sanguine Depths", -- [2]
				},
				[157122] = {
					"Patrician Cromwell", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[165824] = {
					"Nar'zudah", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[10404] = {
					"Pustulating Horror", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[71155] = {
					"Korven the Prime", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[134600] = {
					"Sandswept Marksman", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[157634] = {
					"Flameforge Enforcer", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[71923] = {
					"Bloodclaw", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[172991] = {
					"Drust Soulcleaver", -- [1]
					"Mists of Tirna Scithe", -- [2]
				},
				[168105] = {
					"Empowered Mawsworn Flametender", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[105451] = {
					"Counterstrike Totem", -- [1]
					"Deepwind Gorge", -- [2]
				},
				[72947] = {
					"Kor'kron Demolisher", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[33716] = {
					"Influence Tentacle", -- [1]
					"Ulduar", -- [2]
				},
				[53121] = {
					"Flamewaker Cauterizer", -- [1]
					"Firelands", -- [2]
				},
				[152874] = {
					"Vez'okk the Lightless", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[152517] = {
					"Deadsoul Lifetaker", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[29826] = {
					"Drakkari Medicine Man", -- [1]
					"Gundrak", -- [2]
				},
				[73904] = {
					"Kor'kron Iron Sentinel", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[153541] = {
					"Slavemaster Ul'rok", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[73415] = {
					"Ichor of Y'Shaarj", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[71156] = {
					"Kaz'tik the Manipulator", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[134602] = {
					"Shrouded Fang", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[120808] = {
					"Lylth the Silent", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[72367] = {
					"Dragonmaw Tidal Shaman", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[53116] = {
					"Unbound Blazing Elemental", -- [1]
					"Firelands", -- [2]
				},
				[95674] = {
					"Fenryr", -- [1]
					"Halls of Valor", -- [2]
				},
				[71993] = {
					"Desperation Spawn", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[69756] = {
					"Anima Orb", -- [1]
					"Throne of Thunder", -- [2]
				},
				[45924] = {
					"Turbulent Squall", -- [1]
					"The Vortex Pinnacle", -- [2]
				},
				[167964] = {
					"4.RF-4.RF", -- [1]
					"De Other Side", -- [2]
				},
				[37122] = {
					"Captain Arnath", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[26691] = {
					"Ymirjar Witch Doctor", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[164804] = {
					"Droman Oulfarran", -- [1]
					"Mists of Tirna Scithe", -- [2]
				},
				[53630] = {
					"Unstable Pyrelord", -- [1]
					"Firelands", -- [2]
				},
				[32875] = {
					"Iron Honor Guard", -- [1]
					"Ulduar", -- [2]
				},
				[173066] = {
					"Kel'Thuzad", -- [1]
					"Maldraxxus Covenant Finale Scenario", -- [2]
				},
				[138187] = {
					"Grotesque Horror", -- [1]
					"The Underrot", -- [2]
				},
				[155951] = {
					"Ruffer", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[167876] = {
					"Inquisitor Sigar", -- [1]
					"Halls of Atonement", -- [2]
				},
				[135470] = {
					"Aka'ali the Conqueror", -- [1]
					"Kings' Rest", -- [2]
				},
				[151333] = {
					"Sentinel Shard", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[12098] = {
					"Sulfuron Harbinger", -- [1]
					"Molten Core", -- [2]
				},
				[153552] = {
					"Weeping Wraith", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[29306] = {
					"Gal'darah", -- [1]
					"Gundrak", -- [2]
				},
				[29304] = {
					"Slad'ran", -- [1]
					"Gundrak", -- [2]
				},
				[164266] = {
					"Domina Venomblade", -- [1]
					"Plaguefall", -- [2]
				},
				[119206] = {
					"Convert's Erupting Reflection", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[152009] = {
					"Malfunctioning Scrapbot", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[69911] = {
					"Zandalari Warlord", -- [1]
					"Throne of Thunder", -- [2]
				},
				[94960] = {
					"Hymdall", -- [1]
					"Halls of Valor", -- [2]
				},
				[134691] = {
					"Static-charged Dervish", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[26683] = {
					"Frenzied Worgen", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[71158] = {
					"Rik'kal the Dissector", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[68036] = {
					"Durumu the Forgotten", -- [1]
					"Throne of Thunder", -- [2]
				},
				[71479] = {
					"He Softfoot", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[37124] = {
					"Captain Grondel", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[12100] = {
					"Lava Reaver", -- [1]
					"Molten Core", -- [2]
				},
				[53795] = {
					"Egg Pile", -- [1]
					"Firelands", -- [2]
				},
				[130024] = {
					"Soggy Shiprat", -- [1]
					"Freehold", -- [2]
				},
				[165414] = {
					"Depraved Obliterator", -- [1]
					"Halls of Atonement", -- [2]
				},
				[169265] = {
					"Creepy Crawler", -- [1]
					"Plaguefall", -- [2]
				},
				[53119] = {
					"Flamewaker Forward Guard", -- [1]
					"Firelands", -- [2]
				},
				[81398] = {
					"Frostwall Goren Hatchling", -- [1]
					"FW Horde Garrison Level 3", -- [2]
				},
				[123680] = {
					"Dark Keeper Aedis", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[71480] = {
					"Sun Tenderheart", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[53631] = {
					"Cinderweb Spiderling", -- [1]
					"Firelands", -- [2]
				},
				[169927] = {
					"Putrid Butcher", -- [1]
					"Theater of Pain", -- [2]
				},
				[53095] = {
					"Matriarch Fire Turtle", -- [1]
					"Firelands", -- [2]
				},
				[54015] = {
					"Majordomo Staghelm", -- [1]
					"Firelands", -- [2]
				},
				[54143] = {
					"Molten Flamefather", -- [1]
					"Firelands", -- [2]
				},
				[97068] = {
					"Storm Drake", -- [1]
					"Halls of Valor", -- [2]
				},
				[136139] = {
					"Mechanized Peacekeeper", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[28859] = {
					"Malygos", -- [1]
					"The Eye of Eternity", -- [2]
				},
				[131383] = {
					"Sporecaller Zancha", -- [1]
					"The Underrot", -- [2]
				},
				[130025] = {
					"Irontide Thug", -- [1]
					"Tol Dagor", -- [2]
				},
				[71160] = {
					"Iyyokuk the Lucid", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[70209] = {
					"Untrained Quilen", -- [1]
					"Throne of Thunder", -- [2]
				},
				[38125] = {
					"Ymirjar Deathbringer", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[122984] = {
					"Dazar'ai Colossus", -- [1]
					"Atal'Dazar", -- [2]
				},
				[168393] = {
					"Plaguebelcher", -- [1]
					"Plaguefall", -- [2]
				},
				[130655] = {
					"Bobby Howlis", -- [1]
					"Tol Dagor", -- [2]
				},
				[164362] = {
					"Slimy Morsel", -- [1]
					"Plaguefall", -- [2]
				},
				[37662] = {
					"Darkfallen Commander", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[37229] = {
					"Frostwarden Sorceress", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[162763] = {
					"Soulforged Bonereaver", -- [1]
					"Theater of Pain", -- [2]
				},
				[12050] = {
					"Stormpike Defender", -- [1]
					"Alterac Valley", -- [2]
				},
				[171557] = {
					"Shade of Bargast", -- [1]
					"Castle Nathria", -- [2]
				},
				[168394] = {
					"Slimy Morsel", -- [1]
					"Plaguefall", -- [2]
				},
				[132051] = {
					"Blood Tick", -- [1]
					"The Underrot", -- [2]
				},
				[153130] = {
					"Greater Void Elemental", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[130026] = {
					"Bilge Rat Seaspeaker", -- [1]
					"Tol Dagor", -- [2]
				},
				[158157] = {
					"Overlord Mathias Shaw", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[36612] = {
					"Lord Marrowgar", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[53120] = {
					"Flamewaker Pathfinder", -- [1]
					"Firelands", -- [2]
				},
				[36907] = {
					"Wrathbone Siegesmith", -- [1]
					"Pit of Saron", -- [2]
				},
				[26692] = {
					"Ymirjar Harpooner", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[168907] = {
					"Slime Tentacle", -- [1]
					"Plaguefall", -- [2]
				},
				[127723] = {
					"Imperator Deconix", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[69944] = {
					"Sand Elemental", -- [1]
					"Throne of Thunder", -- [2]
				},
				[158158] = {
					"Forge-Guard Hurrul", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[71161] = {
					"Kil'ruk the Wind-Reaver", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[134612] = {
					"Grasping Tentacles", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[70206] = {
					"Untrained Quilen", -- [1]
					"Throne of Thunder", -- [2]
				},
				[168396] = {
					"Plaguebelcher", -- [1]
					"Plaguefall", -- [2]
				},
				[100850] = {
					"Ariden", -- [1]
					"Karazhan Catacombs", -- [2]
				},
				[151773] = {
					"Junkyard D.0.G.", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[130027] = {
					"Ashvane Marine", -- [1]
					"Tol Dagor", -- [2]
				},
				[33651] = {
					"VX-001", -- [1]
					"Ulduar", -- [2]
				},
				[72358] = {
					"Kor'kron Cannon", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[34035] = {
					"Feral Defender", -- [1]
					"Ulduar", -- [2]
				},
				[155680] = {
					"Deephive Summoner", -- [1]
					"Mogu'shan Scenario", -- [2]
				},
				[71157] = {
					"Xaril the Poisoned Mind", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[165137] = {
					"Zolramus Gatekeeper", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[127724] = {
					"Fanatical Pyromancer", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[114796] = {
					"Wholesome Hostess", -- [1]
					"Return to Karazhan", -- [2]
				},
				[72498] = {
					"Theramore Citizen", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[135975] = {
					"Off-Duty Laborer", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[174100] = {
					"Nathrian Singuard", -- [1]
					"Castle Nathria", -- [2]
				},
				[34034] = {
					"Swarming Guardian", -- [1]
					"Ulduar", -- [2]
				},
				[168398] = {
					"Slimy Morsel", -- [1]
					"Plaguefall", -- [2]
				},
				[164815] = {
					"Zolramus Siphoner", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[157137] = {
					"Terror Tendril", -- [1]
					"Halls of Origination", -- [2]
				},
				[130028] = {
					"Ashvane Priest", -- [1]
					"Tol Dagor", -- [2]
				},
				[72954] = {
					"Kor'thik Honor Guard", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[155094] = {
					"Mechagon Trooper", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[155090] = {
					"Anodized Coilbearer", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[131666] = {
					"Coven Thornshaper", -- [1]
					"Waycrest Manor", -- [2]
				},
				[150958] = {
					"Mawsworn Guard", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[132056] = {
					"Venture Co. Skyscorcher", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[127725] = {
					"Felblade Shocktrooper", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[161745] = {
					"Hepthys", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[169912] = {
					"Enraged Mask", -- [1]
					"De Other Side", -- [2]
				},
				[99828] = {
					"Trained Hawk", -- [1]
					"Halls of Valor", -- [2]
				},
				[134616] = {
					"Krolusk Pup", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[122773] = {
					"Decimator", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[131545] = {
					"Lady Waycrest", -- [1]
					"Waycrest Manor", -- [2]
				},
				[129517] = {
					"Reanimated Raptor", -- [1]
					"Atal'Dazar", -- [2]
				},
				[33768] = {
					"Rubble", -- [1]
					"Ulduar", -- [2]
				},
				[161746] = {
					"Ossirat", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[133593] = {
					"Expert Technician", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[114584] = {
					"Phantom Crew", -- [1]
					"Return to Karazhan", -- [2]
				},
				[134617] = {
					"Krolusk Hatchling", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[73723] = {
					"Jun-Wei", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[131667] = {
					"Soulbound Goliath", -- [1]
					"Waycrest Manor", -- [2]
				},
				[114264] = {
					"Midnight", -- [1]
					"Return to Karazhan", -- [2]
				},
				[136665] = {
					"Ashvane Spotter", -- [1]
					"Tol Dagor", -- [2]
				},
				[157102] = {
					"Imperial Consular", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[26782] = {
					"Crystalline Keeper", -- [1]
					"The Nexus", -- [2]
				},
				[130575] = {
					"Wandering Axebeak", -- [1]
					"Atal'Dazar", -- [2]
				},
				[71420] = {
					"Hungry Kunchong", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[156237] = {
					"Imperator Dara", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[171184] = {
					"Mythresh, Sky's Talons", -- [1]
					"De Other Side", -- [2]
				},
				[154128] = {
					"Blazing Elemental", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[137486] = {
					"Queen Patlaa", -- [1]
					"Kings' Rest", -- [2]
				},
				[123921] = {
					"Garothi Decimator", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[43873] = {
					"Altairus", -- [1]
					"The Vortex Pinnacle", -- [2]
				},
				[32874] = {
					"Iron Ring Guard", -- [1]
					"Ulduar", -- [2]
				},
				[44932] = {
					"Oathsworn Pathfinder", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[73724] = {
					"Zu Yin", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[36998] = {
					"Skybreaker Protector", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[37126] = {
					"Sister Svalna", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[73452] = {
					"Harbinger of Y'Shaarj", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[45572] = {
					"Howling Gale", -- [1]
					"The Vortex Pinnacle", -- [2]
				},
				[137484] = {
					"King A'akul", -- [1]
					"Kings' Rest", -- [2]
				},
				[135204] = {
					"Spectral Hex Priest", -- [1]
					"Kings' Rest", -- [2]
				},
				[159190] = {
					"Synod", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[167892] = {
					"Tormented Soul", -- [1]
					"Halls of Atonement", -- [2]
				},
				[121021] = {
					"Shadowsworn Invader", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[168886] = {
					"Virulax Blightweaver", -- [1]
					"Plaguefall", -- [2]
				},
				[12099] = {
					"Firesworn", -- [1]
					"Molten Core", -- [2]
				},
				[135764] = {
					"Explosive Totem", -- [1]
					"Kings' Rest", -- [2]
				},
				[170452] = {
					"Essence Orb", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[165793] = {
					"Rathborne", -- [1]
					"Maldraxxus Covenant Finale Scenario", -- [2]
				},
				[152661] = {
					"Mawsworn Ward", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[73725] = {
					"Xiang-Lin", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[129547] = {
					"Blacktooth Knuckleduster", -- [1]
					"Freehold", -- [2]
				},
				[70445] = {
					"Stormbringer Draz'kil", -- [1]
					"Throne of Thunder", -- [2]
				},
				[68078] = {
					"Iron Qon", -- [1]
					"Throne of Thunder", -- [2]
				},
				[170419] = {
					"Lost Dredger", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[158168] = {
					"Dark Disciple", -- [1]
					"Halls of Origination", -- [2]
				},
				[72236] = {
					"Embodied Doubt", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[117776] = {
					"Shadow Council Warlock", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[137487] = {
					"Skeletal Hunting Raptor", -- [1]
					"Kings' Rest", -- [2]
				},
				[155215] = {
					"Faeleaf Lasher", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[12101] = {
					"Lava Surger", -- [1]
					"Molten Core", -- [2]
				},
				[157620] = {
					"Prophet Skitra", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[71712] = {
					"Despair Spawn", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[158169] = {
					"Devout Disciple", -- [1]
					"Halls of Origination", -- [2]
				},
				[71504] = {
					"Siegecrafter Blackfuse", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[69375] = {
					"Hidden Fog", -- [1]
					"Throne of Thunder", -- [2]
				},
				[162051] = {
					"Frenzied Ghoul", -- [1]
					"Sanguine Depths", -- [2]
				},
				[38369] = {
					"Dark Nucleus", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[37127] = {
					"Ymirjar Frostbinder", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[161241] = {
					"Voidweaver Mal'thir", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[33288] = {
					"Yogg-Saron", -- [1]
					"Ulduar", -- [2]
				},
				[174550] = {
					"Myskia", -- [1]
					"Revendreth Scenario", -- [2]
				},
				[134112] = {
					"Matron Christiane", -- [1]
					"Waycrest Manor", -- [2]
				},
				[136295] = {
					"Sunken Denizen", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[53616] = {
					"Kar the Everburning", -- [1]
					"Firelands", -- [2]
				},
				[71378] = {
					"Quilen Guardian", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[136160] = {
					"King Dazar", -- [1]
					"Kings' Rest", -- [2]
				},
				[157700] = {
					"Agustus Moulaine", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[114544] = {
					"Skeletal Usher", -- [1]
					"Return to Karazhan", -- [2]
				},
				[158171] = {
					"Faceless Destroyer", -- [1]
					"Halls of Origination", -- [2]
				},
				[29573] = {
					"Drakkari Elemental", -- [1]
					"Gundrak", -- [2]
				},
				[29637] = {
					"Crafty Snake", -- [1]
					"Gundrak", -- [2]
				},
				[43014] = {
					"Imp", -- [1]
					"The Stonecore", -- [2]
				},
				[130011] = {
					"Irontide Buccaneer", -- [1]
					"Freehold", -- [2]
				},
				[173016] = {
					"Corpse Collector", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[161243] = {
					"Samh'rek, Beckoner of Chaos", -- [1]
					"Waycrest Manor", -- [2]
				},
				[37728] = {
					"Wrathbone Sorcerer", -- [1]
					"Pit of Saron", -- [2]
				},
				[135167] = {
					"Spectral Berserker", -- [1]
					"Kings' Rest", -- [2]
				},
				[131436] = {
					"Chosen Blood Matron", -- [1]
					"The Underrot", -- [2]
				},
				[122972] = {
					"Dazar'ai Augur", -- [1]
					"Atal'Dazar", -- [2]
				},
				[167898] = {
					"Manifestation of Envy", -- [1]
					"Halls of Atonement", -- [2]
				},
				[174325] = {
					"Ascended Lich", -- [1]
					"Maldraxxus Covenant Finale Scenario", -- [2]
				},
				[36476] = {
					"Ick", -- [1]
					"Pit of Saron", -- [2]
				},
				[161244] = {
					"Blood of the Corruptor", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[45915] = {
					"Armored Mistral", -- [1]
					"The Vortex Pinnacle", -- [2]
				},
				[135699] = {
					"Ashvane Jailer", -- [1]
					"Tol Dagor", -- [2]
				},
				[134115] = {
					"Sacrificial Acolyte", -- [1]
					"Waycrest Manor", -- [2]
				},
				[135231] = {
					"Spectral Brute", -- [1]
					"Kings' Rest", -- [2]
				},
				[45062] = {
					"Oathsworn Scorpid Keeper", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[26694] = {
					"Ymirjar Dusk Shaman", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[139110] = {
					"Spark Channeler", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[26822] = {
					"Ursula Direbrew", -- [1]
					"Blackrock Depths", -- [2]
				},
				[141282] = {
					"Kul Tiran Footman", -- [1]
					"Siege of Boralus", -- [2]
				},
				[103673] = {
					"Darkglare", -- [1]
					"The Battle for Gilneas", -- [2]
				},
				[70246] = {
					"Spirit Flayer", -- [1]
					"Throne of Thunder", -- [2]
				},
				[131587] = {
					"Bewitched Captain", -- [1]
					"Waycrest Manor", -- [2]
				},
				[33890] = {
					"Brain of Yogg-Saron", -- [1]
					"Ulduar", -- [2]
				},
				[127235] = {
					"Garothi Demolisher", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[34057] = {
					"Assault Bot", -- [1]
					"Ulduar", -- [2]
				},
				[164861] = {
					"Spriggan Barkbinder", -- [1]
					"De Other Side", -- [2]
				},
				[141283] = {
					"Kul Tiran Halberd", -- [1]
					"Siege of Boralus", -- [2]
				},
				[133605] = {
					"Escaped Convict", -- [1]
					"Tol Dagor", -- [2]
				},
				[72929] = {
					"Sra'thik Amber-Master", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[13797] = {
					"Mountaineer Boombellow", -- [1]
					"Alterac Valley", -- [2]
				},
				[169893] = {
					"Nefarious Darkspeaker", -- [1]
					"Theater of Pain", -- [2]
				},
				[152033] = {
					"Inconspicuous Plant", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[135366] = {
					"Blacktooth Arsonist", -- [1]
					"Tol Dagor", -- [2]
				},
				[127732] = {
					"Clobex", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[141284] = {
					"Kul Tiran Wavetender", -- [1]
					"Siege of Boralus", -- [2]
				},
				[71770] = {
					"Kor'kron Ironblade", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[156406] = {
					"Voidbound Honor Guard", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[156146] = {
					"Voidbound Shieldbearer", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[135241] = {
					"Bilge Rat Pillager", -- [1]
					"Siege of Boralus", -- [2]
				},
				[33567] = {
					"Deathsworn Zealot", -- [1]
					"Ulduar", -- [2]
				},
				[156641] = {
					"Enthralled Weaponsmith", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[155251] = {
					"Elder Longbranch", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[141285] = {
					"Kul Tiran Marksman", -- [1]
					"Siege of Boralus", -- [2]
				},
				[114783] = {
					"Reformed Maiden", -- [1]
					"Return to Karazhan", -- [2]
				},
				[165111] = {
					"Drust Spiteclaw", -- [1]
					"Mists of Tirna Scithe", -- [2]
				},
				[52498] = {
					"Beth'tilac", -- [1]
					"Firelands", -- [2]
				},
				[45063] = {
					"Bonesnapper Scorpid", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[69791] = {
					"Unruck", -- [1]
					"Eye of the Storm", -- [2]
				},
				[127477] = {
					"Saltwater Snapper", -- [1]
					"Tol Dagor", -- [2]
				},
				[114634] = {
					"Undying Servant", -- [1]
					"Return to Karazhan", -- [2]
				},
				[154014] = {
					"Imprisoned Cabalist", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[153196] = {
					"Scrapbone Grunter", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[158690] = {
					"Cultist Tormenter", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[118728] = {
					"Ghastly Bonewarden", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[116939] = {
					"Fallen Avatar", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[114629] = {
					"Spectral Retainer", -- [1]
					"Return to Karazhan", -- [2]
				},
				[70557] = {
					"Zandalari Prophet", -- [1]
					"Throne of Thunder", -- [2]
				},
				[72451] = {
					"Kor'kron Dark Shaman", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[32926] = {
					"Flash Freeze", -- [1]
					"Ulduar", -- [2]
				},
				[127485] = {
					"Bilge Rat Looter", -- [1]
					"Tol Dagor", -- [2]
				},
				[114320] = {
					"Lord Robin Daris", -- [1]
					"Return to Karazhan", -- [2]
				},
				[29774] = {
					"Spitting Cobra", -- [1]
					"Gundrak", -- [2]
				},
				[71772] = {
					"Kor'kron Assassin", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[129601] = {
					"Cutwater Harpooner", -- [1]
					"Freehold", -- [2]
				},
				[29830] = {
					"Living Mojo", -- [1]
					"Gundrak", -- [2]
				},
				[150253] = {
					"Weaponized Crawler", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[156142] = {
					"Seeker of Souls", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[128967] = {
					"Ashvane Sniper", -- [1]
					"Siege of Boralus", -- [2]
				},
				[135322] = {
					"The Golden Serpent", -- [1]
					"Kings' Rest", -- [2]
				},
				[29713] = {
					"Slad'ran Constrictor", -- [1]
					"Gundrak", -- [2]
				},
				[155824] = {
					"Lumbering Creation", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[168418] = {
					"Forsworn Inquisitor", -- [1]
					"Spires of Ascension", -- [2]
				},
				[129526] = {
					"Bilge Rat Swabby", -- [1]
					"Freehold", -- [2]
				},
				[72452] = {
					"Kor'kron Dire Wolf", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[96608] = {
					"Ebonclaw Worg", -- [1]
					"Halls of Valor", -- [2]
				},
				[122104] = {
					"Portal Keeper Hasabel", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[53691] = {
					"Shannox", -- [1]
					"Firelands", -- [2]
				},
				[26929] = {
					"Grand Magus Telestra", -- [1]
					"The Nexus", -- [2]
				},
				[36874] = {
					"Disturbed Glacial Revenant", -- [1]
					"Pit of Saron", -- [2]
				},
				[156134] = {
					"Ghastly Charger", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[127479] = {
					"The Sand Queen", -- [1]
					"Tol Dagor", -- [2]
				},
				[157158] = {
					"Cultist Slavedriver", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[29680] = {
					"Slad'ran Viper", -- [1]
					"Gundrak", -- [2]
				},
				[45704] = {
					"Lurking Tempest", -- [1]
					"The Vortex Pinnacle", -- [2]
				},
				[146409] = {
					"Lady Jaina Proudmoore", -- [1]
					"Battle of Dazar'alor", -- [2]
				},
				[46910] = {
					"Core Hound", -- [1]
					"Waycrest Manor", -- [2]
				},
				[52409] = {
					"Ragnaros", -- [1]
					"Firelands", -- [2]
				},
				[168420] = {
					"Forsworn Champion", -- [1]
					"Spires of Ascension", -- [2]
				},
				[38154] = {
					"Warhawk", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[28368] = {
					"Ymirjar Necromancer", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[29264] = {
					"Spirit Raptor", -- [1]
					"Eye of the Storm", -- [2]
				},
				[70245] = {
					"Training Dummy", -- [1]
					"Throne of Thunder", -- [2]
				},
				[126918] = {
					"Irontide Crackshot", -- [1]
					"Freehold", -- [2]
				},
				[69382] = {
					"Malignant Ooze", -- [1]
					"Throne of Thunder", -- [2]
				},
				[36788] = {
					"Deathwhisper Necrolyte", -- [1]
					"Pit of Saron", -- [2]
				},
				[161502] = {
					"Ravenous Fleshfiend", -- [1]
					"Freehold", -- [2]
				},
				[127480] = {
					"Stinging Parasite", -- [1]
					"Tol Dagor", -- [2]
				},
				[153065] = {
					"Voidbound Ravager", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[132491] = {
					"Kul Tiran Marksman", -- [1]
					"Siege of Boralus", -- [2]
				},
				[36808] = {
					"Deathspeaker Zealot", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[122367] = {
					"Admiral Svirax", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[136083] = {
					"Forgotten Denizen", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[172005] = {
					"Furrowed Colossus", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[28231] = {
					"Crystalline Tender", -- [1]
					"The Nexus", -- [2]
				},
				[168934] = {
					"Enraged Spirit", -- [1]
					"De Other Side", -- [2]
				},
				[122969] = {
					"Zanchuli Witch-Doctor", -- [1]
					"Atal'Dazar", -- [2]
				},
				[133870] = {
					"Diseased Lasher", -- [1]
					"The Underrot", -- [2]
				},
				[114260] = {
					"Mrrgria", -- [1]
					"Return to Karazhan", -- [2]
				},
				[34886] = {
					"Bird of Prey", -- [1]
					"Waycrest Manor", -- [2]
				},
				[118523] = {
					"Huntress Kasparian", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[45065] = {
					"Tol'vir Merchant", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[37003] = {
					"Skybreaker Vindicator", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[156650] = {
					"Dark Manifestation", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[53639] = {
					"Flamewaker Cauterizer", -- [1]
					"Firelands", -- [2]
				},
				[131669] = {
					"Jagged Hound", -- [1]
					"Waycrest Manor", -- [2]
				},
				[174843] = {
					"Stoneborn Maitre D'", -- [1]
					"Castle Nathria", -- [2]
				},
				[164873] = {
					"Runestag Elderhorn", -- [1]
					"De Other Side", -- [2]
				},
				[162049] = {
					"Vestige of Doubt", -- [1]
					"Sanguine Depths", -- [2]
				},
				[26672] = {
					"Bloodthirsty Tundra Wolf", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[36807] = {
					"Deathspeaker Disciple", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[129529] = {
					"Blacktooth Scrapper", -- [1]
					"Freehold", -- [2]
				},
				[136688] = {
					"Fanatical Driller", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[122967] = {
					"Priestess Alun'za", -- [1]
					"Atal'Dazar", -- [2]
				},
				[131670] = {
					"Heartsbane Vinetwister", -- [1]
					"Waycrest Manor", -- [2]
				},
				[73223] = {
					"Pterrordax", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[172205] = {
					"Bone Thrall", -- [1]
					"Maldraxxus Covenant Finale Scenario", -- [2]
				},
				[120188] = {
					"Wailing Soul", -- [1]
					"Tomb of Sargeras", -- [2]
				},
				[157340] = {
					"Skeletal Remains", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[127482] = {
					"Sewer Vicejaw", -- [1]
					"Tol Dagor", -- [2]
				},
				[44234] = {
					"Vicious Leech", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[162319] = {
					"Paladin", -- [1]
					"Vision of Ysera Scenario", -- [2]
				},
				[137713] = {
					"Big Money Crab", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[135234] = {
					"Diseased Mastiff", -- [1]
					"Waycrest Manor", -- [2]
				},
				[114526] = {
					"Ghostly Understudy", -- [1]
					"Return to Karazhan", -- [2]
				},
				[147439] = {
					"Molten Hound", -- [1]
					"Battle of Dazar'alor", -- [2]
				},
				[167607] = {
					"Stoneborn Slasher", -- [1]
					"Halls of Atonement", -- [2]
				},
				[156653] = {
					"Coagulated Horror", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[72456] = {
					"Korgra the Snake", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[165763] = {
					"Vile Occultist", -- [1]
					"Castle Nathria", -- [2]
				},
				[170474] = {
					"Brood Assassin", -- [1]
					"Plaguefall", -- [2]
				},
				[165762] = {
					"Soul Infuser", -- [1]
					"Castle Nathria", -- [2]
				},
				[53128] = {
					"Giant Fire Scorpion", -- [1]
					"Firelands", -- [2]
				},
				[147440] = {
					"Blazing Fireguard", -- [1]
					"Battle of Dazar'alor", -- [2]
				},
				[26696] = {
					"Ymirjar Berserker", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[70153] = {
					"Fungal Growth", -- [1]
					"Throne of Thunder", -- [2]
				},
				[53640] = {
					"Flamewaker Sentinel", -- [1]
					"Firelands", -- [2]
				},
				[168113] = {
					"General Grashaal", -- [1]
					"Castle Nathria", -- [2]
				},
				[45007] = {
					"Enslaved Bandit", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[96640] = {
					"Valarjar Marksman", -- [1]
					"Halls of Valor", -- [2]
				},
				[71433] = {
					"Spark of Life", -- [1]
					"Siege of Orgrimmar", -- [2]
				},
				[100936] = {
					"Dark Rider", -- [1]
					"Karazhan Catacombs", -- [2]
				},
				[38028] = {
					"Web Wrap", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[125436] = {
					"Thu'raya, Mother of the Cosmos", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[165357] = {
					"Pestilence Slime", -- [1]
					"Plaguefall", -- [2]
				},
				[137204] = {
					"Hoodoo Hexer", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[137716] = {
					"Bottom Feeder", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[157349] = {
					"Void Boar", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[138740] = {
					"Musashitake", -- [1]
					"The Underrot", -- [2]
				},
				[164578] = {
					"Stitchflesh's Creation", -- [1]
					"The Necrotic Wake", -- [2]
				},
				[159425] = {
					"Occult Shadowmender", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[127484] = {
					"Jes Howlis", -- [1]
					"Tol Dagor", -- [2]
				},
				[45096] = {
					"Tamed Tol'vir Prowler", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[45097] = {
					"Oathsworn Tamer", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[133663] = {
					"Fanatical Headhunter", -- [1]
					"The Underrot", -- [2]
				},
				[42696] = {
					"Stonecore Warbringer", -- [1]
					"The Stonecore", -- [2]
				},
				[69131] = {
					"Frost King Malakk", -- [1]
					"Throne of Thunder", -- [2]
				},
				[170228] = {
					"Bone Husk", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
				[156145] = {
					"Burrowing Appendage", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[168942] = {
					"Death Speaker", -- [1]
					"De Other Side", -- [2]
				},
				[129788] = {
					"Irontide Bonesaw", -- [1]
					"Freehold", -- [2]
				},
				[42333] = {
					"High Priestess Azil", -- [1]
					"The Stonecore", -- [2]
				},
				[174162] = {
					"Countess Gloomveil", -- [1]
					"Castle Nathria", -- [2]
				},
				[48906] = {
					"Blaze of the Heavens", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[155236] = {
					"Ironroot Strider", -- [1]
					"Torghast, Tower of the Damned", -- [2]
				},
			},
			["aura_grow_direction"] = 3,
			["indicator_anchor"] = {
				["y"] = 10.22999572753906,
				["x"] = -5.270004272460938,
				["side"] = 6,
			},
			["health_selection_overlay_alpha"] = 0,
			["minor_height_scale"] = 0.9999999403953552,
			["aura_padding"] = 2,
			["last_news_time"] = 1551553489,
			["aura_width2"] = 22,
			["hook_data_trash"] = {
				{
					["OptionsValues"] = {
					},
					["HooksTemp"] = {
					},
					["Hooks"] = {
						["Player Talent Update"] = "function (self, unitId, unitFrame, envTable)\n    envTable.updateInterruptId (unitFrame)\nend\n\n\n",
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    envTable.setCastColorFunction (unitFrame)\nend\n\n\n",
						["Cast Update"] = "function (self, unitId, unitFrame, envTable)\n    unitFrame.castBar:UpdateCastColor()\nend",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    -- settings:\n    local noKickReadyColor = \"#eaeaea\"\n    local kickReadyInTimeColor = \"#00D1FF\"\n    local kickReadyInTimeGraceTime = 0.5 --sec - additional time on the CD to account for reaction, lag, etc\n    \n    \n    -- functions:\n    \n    -- determine interrupt spell according to spec\n    function envTable.updateInterruptId (unitFrame)\n        local specId = GetSpecializationInfo(GetSpecialization())\n        local interruptId = nil\n        if Plater.PlayerClass == \"ROGUE\" then\n            interruptId = 1766\n        elseif Plater.PlayerClass == \"DEATHKNIGHT\" then\n            interruptId = 47528\n        elseif Plater.PlayerClass == \"DEMONHUNTER\" then\n            interruptId = 183752\n        elseif Plater.PlayerClass == \"DRUID\" then\n            if specId == 103 or specId == 104 then\n                interruptId = 106839 -- feral/guardian\n            elseif specId == 102 then\n                interruptId = 78675 -- moonkin\n            end\n        elseif Plater.PlayerClass == \"HUNTER\" then\n            if specId == 255 then\n                interruptId = 187707 -- SV\n            else\n                interruptId = 147362 -- BM/MS\n            end\n        elseif Plater.PlayerClass == \"MONK\" then\n            if specId == 268 or specId == 269 then\n                interruptId = 116705 --WW/BM\n            end\n        elseif Plater.PlayerClass == \"PALADIN\" then\n            if specId == 66 or specId == 70 then\n                interruptId = 96231 --prot/ret\n            end\n        elseif Plater.PlayerClass == \"SHAMAN\" then\n            interruptId = 57994\n        elseif Plater.PlayerClass == \"WARRIOR\" then\n            interruptId = 6552\n        elseif Plater.PlayerClass == \"MAGE\" then\n            interruptId = 2139\n        elseif Plater.PlayerClass == \"PRIEST\" then\n            if specId == 258 then\n                interruptId = 15487\n            end\n        end\n        unitFrame.castBar.interruptSpellId = interruptId\n    end\n    \n    function envTable.setCastColorFunction (unitFrame)\n        -- overwrite the color function:\n        unitFrame.castBar.GetCastColor = function (self)\n            \n            --print(self.interruptSpellId and select(2, GetSpellCooldown(self.interruptSpellId)) > 0 )\n            local interruptCD = 0\n            if self.interruptSpellId then\n                local cdStart, cdDur =  GetSpellCooldown(self.interruptSpellId)\n                interruptCD = (cdStart > 0 and  cdDur - (GetTime() - cdStart)) or 0\n            end\n            --print(interruptCD,  interruptCD < (self.maxValue - self.value))\n            \n            if (not self.canInterrupt) then\n                return self.Colors.NonInterruptible\n                \n            elseif (self.failed) then\n                return self.Colors.Failed\n                \n            elseif (self.interrupted) then\n                return self.Colors.Interrupted\n                \n            elseif (self.finished) then\n                return self.Colors.Finished\n                \n            elseif interruptCD > 0 and  (interruptCD + kickReadyInTimeGraceTime) < (self.maxValue - self.value) then\n                return kickReadyInTimeColor\n                \n            elseif interruptCD > 0 then\n                return noKickReadyColor\n                \n            elseif (self.channeling) then\n                return self.Colors.Channeling\n                \n            else        \n                return self.Colors.Casting\n                \n            end\n        end\n    end\n    \n    envTable.updateInterruptId(unitFrame)\n    envTable.setCastColorFunction (unitFrame)\n    \nend",
					},
					["__TrashAt"] = 1612127245,
					["Time"] = 1600572219,
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["affix"] = {
						},
						["race"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["url"] = "https://wago.io/jHilJiXiY/10",
					["Icon"] = 132219,
					["Enabled"] = true,
					["Revision"] = 215,
					["semver"] = "1.0.9",
					["Author"] = "Viashi-Antonidas",
					["Desc"] = "Sets the cast bar color to the specified one if your interrupt spell is not ready. Uses other Plater color settings otherwise.",
					["Prio"] = 99,
					["version"] = 10,
					["PlaterCore"] = 1,
					["Name"] = "Interrupt not ready Cast Color",
					["LastHookEdited"] = "Constructor",
					["Options"] = {
					},
				}, -- [1]
				{
					["OptionsValues"] = {
					},
					["LastHookEdited"] = "Constructor",
					["Hooks"] = {
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable, modTable)\n    modTable.updateInterruptId (unitFrame)\nend\n\n\n",
						["Cast Update"] = "function (self, unitId, unitFrame, envTable, modTable)\n    unitFrame.castBar:UpdateCastColor()\nend",
						["Player Talent Update"] = "function (self, unitId, unitFrame, envTable, modTable)\n    modTable.updateInterruptIDs()\n    modTable.updateInterruptId (unitFrame)\nend\n\n\n",
						["Initialization"] = "function (modTable)\n    \n    -- settings:\n    local noKickReadyColor = modTable.config.noKickReadyColor or \"blue\"\n    local kickReadyInTimeColor = modTable.config.kickReadyInTimeColor or \"purple\"\n    local kickReadyInTimeGraceTime = modTable.config. kickReadyInTimeGraceTime or 0.5 --sec - additional time on the CD to account for reaction, lag, etc\n    local checkPetInterrupts = true\n    local checkCovenant = true\n    \n    \n    -- functions:\n    \n    -- determine interrupt spell according to spec\n    function modTable.updateInterruptIDs ()\n        local specId = GetSpecializationInfo(GetSpecialization())\n        local interruptIDs = {} -- contains: [spellID] = <is player ability>, false meaning pet ability!\n        if Plater.PlayerClass == \"ROGUE\" then\n            interruptIDs[1766] = true\n        elseif Plater.PlayerClass == \"DEATHKNIGHT\" then\n            interruptIDs[47528] = true\n        elseif Plater.PlayerClass == \"DEMONHUNTER\" then\n            interruptIDs[183752] = true\n        elseif Plater.PlayerClass == \"DRUID\" then\n            if specId == 103 or specId == 104 then\n                interruptIDs[106839] = true -- feral/guardian\n            elseif specId == 102 then\n                interruptIDs[78675] = true -- moonkin\n            end\n        elseif Plater.PlayerClass == \"HUNTER\" then\n            if specId == 255 then\n                interruptIDs[187707] = true -- SV\n            else\n                interruptIDs[147362] = true -- BM/MS\n            end\n        elseif Plater.PlayerClass == \"MONK\" then\n            if specId == 268 or specId == 269 then\n                interruptIDs[116705] = true --WW/BM\n            end\n        elseif Plater.PlayerClass == \"PALADIN\" then\n            if specId == 66 or specId == 70 then\n                interruptIDs[96231] = true --prot/ret\n            end\n            if specId == 66 then\n                interruptIDs[31935] = true --prot\n                if checkCovenant and IsPlayerSpell(304971) then\n                    interruptIDs[304971] = true --kyrian\n                end\n            end\n        elseif Plater.PlayerClass == \"SHAMAN\" then\n            interruptIDs[57994] = true\n        elseif Plater.PlayerClass == \"WARRIOR\" then\n            interruptIDs[6552] = true\n        elseif Plater.PlayerClass == \"MAGE\" then\n            interruptIDs[2139] = true\n        elseif Plater.PlayerClass == \"PRIEST\" then\n            if specId == 258 then\n                interruptIDs[15487] = true\n            end\n        elseif Plater.PlayerClass == \"WARLOCK\" then\n            if checkPetInterrupts then\n                interruptIDs[19647] = false\n                if specId == 266 then\n                    interruptIDs[89766] = false --demo/fel guard\n                end\n            end\n        end\n        modTable.interruptSpellIDs = interruptIDs\n    end\n    \n    function modTable.updateInterruptId (unitFrame)\n        if not modTable.interruptSpellIDs then\n            modTable.updateInterruptIDs()\n        end\n        unitFrame.castBar.interruptSpellIDs = modTable.interruptSpellIDs\n    end\n    \n    function modTable.setCastColorFunction (unitFrame)\n        -- overwrite the color function:\n        unitFrame.castBar.GetCastColor = function (self)\n            \n            local interruptCD, interruptReadyInTime = nil, false\n            if self.interruptSpellIDs then\n                \n                for interruptSpellId, playerAbility in pairs(self.interruptSpellIDs) do\n                    if IsSpellKnown(interruptSpellId, not playerAbility) then\n                        local cdStart, cdDur =  GetSpellCooldown(interruptSpellId)\n                        local tmpInterruptCD = (cdStart > 0 and  cdDur - (GetTime() - cdStart)) or 0\n                        if not interruptCD or (tmpInterruptCD < interruptCD) then\n                            interruptCD = tmpInterruptCD\n                        end\n                    end\n                end\n                \n                if not interruptCD then\n                    interruptCD = 0\n                end\n                \n                if self.channeling then\n                    interruptReadyInTime = (interruptCD + kickReadyInTimeGraceTime) < self.value\n                    --print(interruptCD, self.value, interruptCD < self.value)\n                else\n                    interruptReadyInTime = (interruptCD + kickReadyInTimeGraceTime) < (self.maxValue - self.value)\n                    --print(interruptCD, self.maxValue, self.value, interruptCD < (self.maxValue - self.value))\n                end\n            end\n            \n            if not interruptCD then\n                interruptCD = 0\n            end\n            \n            if (not self.canInterrupt) then\n                return self.Colors.NonInterruptible\n                \n            elseif (self.failed) then\n                return self.Colors.Failed\n                \n            elseif (self.interrupted) then\n                return self.Colors.Interrupted\n                \n            elseif (self.finished) then\n                return self.Colors.Finished\n                \n            elseif interruptCD > 0 and interruptReadyInTime then\n                return kickReadyInTimeColor\n                \n            elseif interruptCD > 0 then\n                return noKickReadyColor\n                \n            elseif (self.channeling) then\n                return self.Colors.Channeling\n                \n            else        \n                return self.Colors.Casting\n                \n            end\n        end\n    end\n    \nend\n\n\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable, modTable)\n    modTable.updateInterruptId (unitFrame)\n    modTable.setCastColorFunction (unitFrame)\nend",
					},
					["__TrashAt"] = 1612670989,
					["Time"] = 1612127251,
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["affix"] = {
						},
						["race"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["url"] = "https://wago.io/jHilJiXiY/13",
					["Icon"] = 132219,
					["Enabled"] = true,
					["Revision"] = 325,
					["semver"] = "1.0.12",
					["Author"] = "Viash-Thrall",
					["Desc"] = "Sets the cast bar color to the specified one if your interrupt spell is not ready. Uses other Plater color settings otherwise.",
					["Prio"] = 99,
					["Name"] = "Interrupt not ready Cast Color",
					["PlaterCore"] = 1,
					["version"] = 13,
					["HooksTemp"] = {
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable, modTable)\n    modTable.updateInterruptId (unitFrame)\nend\n\n\n",
						["Cast Update"] = "function (self, unitId, unitFrame, envTable, modTable)\n    unitFrame.castBar:UpdateCastColor()\nend",
						["Player Talent Update"] = "function (self, unitId, unitFrame, envTable, modTable)\n    modTable.updateInterruptIDs()\n    modTable.updateInterruptId (unitFrame)\nend\n\n\n",
						["Initialization"] = "function (modTable)\n    \n    -- settings:\n    local noKickReadyColor = modTable.config.noKickReadyColor or \"blue\"\n    local kickReadyInTimeColor = modTable.config.kickReadyInTimeColor or \"purple\"\n    local kickReadyInTimeGraceTime = modTable.config. kickReadyInTimeGraceTime or 0.5 --sec - additional time on the CD to account for reaction, lag, etc\n    local checkPetInterrupts = true\n    local checkCovenant = true\n    \n    \n    -- functions:\n    \n    -- determine interrupt spell according to spec\n    function modTable.updateInterruptIDs ()\n        local specId = GetSpecializationInfo(GetSpecialization())\n        local interruptIDs = {} -- contains: [spellID] = <is player ability>, false meaning pet ability!\n        if Plater.PlayerClass == \"ROGUE\" then\n            interruptIDs[1766] = true\n        elseif Plater.PlayerClass == \"DEATHKNIGHT\" then\n            interruptIDs[47528] = true\n        elseif Plater.PlayerClass == \"DEMONHUNTER\" then\n            interruptIDs[183752] = true\n        elseif Plater.PlayerClass == \"DRUID\" then\n            if specId == 103 or specId == 104 then\n                interruptIDs[106839] = true -- feral/guardian\n            elseif specId == 102 then\n                interruptIDs[78675] = true -- moonkin\n            end\n        elseif Plater.PlayerClass == \"HUNTER\" then\n            if specId == 255 then\n                interruptIDs[187707] = true -- SV\n            else\n                interruptIDs[147362] = true -- BM/MS\n            end\n        elseif Plater.PlayerClass == \"MONK\" then\n            if specId == 268 or specId == 269 then\n                interruptIDs[116705] = true --WW/BM\n            end\n        elseif Plater.PlayerClass == \"PALADIN\" then\n            if specId == 66 or specId == 70 then\n                interruptIDs[96231] = true --prot/ret\n            end\n            if specId == 66 then\n                interruptIDs[31935] = true --prot\n                if checkCovenant and IsPlayerSpell(304971) then\n                    interruptIDs[304971] = true --kyrian\n                end\n            end\n        elseif Plater.PlayerClass == \"SHAMAN\" then\n            interruptIDs[57994] = true\n        elseif Plater.PlayerClass == \"WARRIOR\" then\n            interruptIDs[6552] = true\n        elseif Plater.PlayerClass == \"MAGE\" then\n            interruptIDs[2139] = true\n        elseif Plater.PlayerClass == \"PRIEST\" then\n            if specId == 258 then\n                interruptIDs[15487] = true\n            end\n        elseif Plater.PlayerClass == \"WARLOCK\" then\n            if checkPetInterrupts then\n                interruptIDs[19647] = false\n                if specId == 266 then\n                    interruptIDs[89766] = false --demo/fel guard\n                end\n            end\n        end\n        modTable.interruptSpellIDs = interruptIDs\n    end\n    \n    function modTable.updateInterruptId (unitFrame)\n        if not modTable.interruptSpellIDs then\n            modTable.updateInterruptIDs()\n        end\n        unitFrame.castBar.interruptSpellIDs = modTable.interruptSpellIDs\n    end\n    \n    function modTable.setCastColorFunction (unitFrame)\n        -- overwrite the color function:\n        unitFrame.castBar.GetCastColor = function (self)\n            \n            local interruptCD, interruptReadyInTime = nil, false\n            if self.interruptSpellIDs then\n                \n                for interruptSpellId, playerAbility in pairs(self.interruptSpellIDs) do\n                    if IsSpellKnown(interruptSpellId, not playerAbility) then\n                        local cdStart, cdDur =  GetSpellCooldown(interruptSpellId)\n                        local tmpInterruptCD = (cdStart > 0 and  cdDur - (GetTime() - cdStart)) or 0\n                        if not interruptCD or (tmpInterruptCD < interruptCD) then\n                            interruptCD = tmpInterruptCD\n                        end\n                    end\n                end\n                \n                if not interruptCD then\n                    interruptCD = 0\n                end\n                \n                if self.channeling then\n                    interruptReadyInTime = (interruptCD + kickReadyInTimeGraceTime) < self.value\n                    --print(interruptCD, self.value, interruptCD < self.value)\n                else\n                    interruptReadyInTime = (interruptCD + kickReadyInTimeGraceTime) < (self.maxValue - self.value)\n                    --print(interruptCD, self.maxValue, self.value, interruptCD < (self.maxValue - self.value))\n                end\n            end\n            \n            if not interruptCD then\n                interruptCD = 0\n            end\n            \n            if (not self.canInterrupt) then\n                return self.Colors.NonInterruptible\n                \n            elseif (self.failed) then\n                return self.Colors.Failed\n                \n            elseif (self.interrupted) then\n                return self.Colors.Interrupted\n                \n            elseif (self.finished) then\n                return self.Colors.Finished\n                \n            elseif interruptCD > 0 and interruptReadyInTime then\n                return kickReadyInTimeColor\n                \n            elseif interruptCD > 0 then\n                return noKickReadyColor\n                \n            elseif (self.channeling) then\n                return self.Colors.Channeling\n                \n            else        \n                return self.Colors.Casting\n                \n            end\n        end\n    end\n    \nend\n\n\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable, modTable)\n    modTable.updateInterruptId (unitFrame)\n    modTable.setCastColorFunction (unitFrame)\nend",
					},
					["Options"] = {
						{
							["Type"] = 1,
							["Name"] = "Kick not Ready Color",
							["Value"] = {
								0, -- [1]
								0, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["Key"] = "noKickReadyColor",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "",
						}, -- [1]
						{
							["Type"] = 1,
							["Name"] = "Kick Ready in Time Color",
							["Value"] = {
								0.50196078431373, -- [1]
								0, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["Key"] = "kickReadyInTimeColor",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "",
						}, -- [2]
						{
							["Type"] = 2,
							["Max"] = 1,
							["Desc"] = "",
							["Min"] = 0,
							["Fraction"] = true,
							["Value"] = 0.5,
							["Name"] = "Reaction grace Time",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Key"] = "kickReadyInTimeGraceTime",
						}, -- [3]
					},
				}, -- [2]
			},
			["extra_icon_anchor"] = {
				["x"] = 4,
			},
			["range_check_alpha"] = 0.75,
			["semver"] = "1.1.2",
			["aura_frame2_anchor"] = {
				["y"] = 8,
				["side"] = 7,
			},
			["aura_alpha"] = 0.84999996423721,
			["aura_cooldown_edge_texture"] = "Interface\\GLUES\\loadingOld",
			["extra_icon_height"] = 16,
			["transparency_behavior"] = 3,
			["spell_animations"] = false,
			["aura_consolidate"] = true,
			["extra_icon_width"] = 22,
			["health_statusbar_texture"] = "Smooth",
			["hook_auto_imported"] = {
				["Color Automation"] = 1,
				["Blockade Encounter"] = 1,
				["Cast Bar Icon Config"] = 2,
				["Hide Neutral Units"] = 1,
				["Aura Reorder"] = 3,
				["Reorder Nameplate"] = 4,
				["Dont Have Aura"] = 1,
				["Players Targetting Amount"] = 4,
				["Bwonsamdi Reaping"] = 1,
				["Jaina Encounter"] = 6,
				["Execute Range"] = 1,
				["Attacking Specific Unit"] = 1,
				["Extra Border"] = 2,
				["Targetting Alpha"] = 3,
				["Target Color"] = 3,
				["Combo Points"] = 4,
				["Monk Statue"] = 2,
			},
			["minor_width_scale"] = 0.9999999403953552,
			["castbar_target_text_size"] = 8,
			["captured_spells"] = {
				[167898] = {
					["type"] = "BUFF",
					["source"] = "Leaelda-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1022] = {
					["type"] = "BUFF",
					["source"] = "Strixpaladin-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[202425] = {
					["type"] = "BUFF",
					["source"] = "Darkksong-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[254471] = {
					["type"] = "BUFF",
					["source"] = "Lyselos-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[308434] = {
					["type"] = "BUFF",
					["source"] = "Elyk-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[193475] = {
					["type"] = "BUFF",
					["source"] = "Isabeau-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[342961] = {
					["type"] = "DEBUFF",
					["source"] = "Dealer Xy'exa",
					["encounterID"] = 2400,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 164450,
				},
				[254472] = {
					["type"] = "BUFF",
					["source"] = "Maldini-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[329919] = {
					["type"] = "BUFF",
					["source"] = "Bwonsamdi's Fury",
					["encounterID"] = 2396,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 169506,
				},
				[322759] = {
					["encounterID"] = 2395,
					["source"] = "Hakkar the Soulflayer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 164558,
				},
				[307159] = {
					["type"] = "BUFF",
					["source"] = "Honiahaka-Perenolde",
					["encounterID"] = 2394,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[113746] = {
					["type"] = "DEBUFF",
					["source"] = "Mistgarr",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[236060] = {
					["type"] = "BUFF",
					["source"] = "Jesstara-Thunderlord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[328900] = {
					["type"] = "BUFF",
					["source"] = "Diororo",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[334271] = {
					["type"] = "BUFF",
					["source"] = "Verael-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[322507] = {
					["type"] = "BUFF",
					["source"] = "Mistgarr",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[2120] = {
					["source"] = "Jesstara-Thunderlord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[333250] = {
					["type"] = "DEBUFF",
					["source"] = "Risen Warlord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 169905,
				},
				[1064] = {
					["source"] = "Delínâ-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[336832] = {
					["type"] = "BUFF",
					["source"] = "Jesstara-Thunderlord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[307166] = {
					["type"] = "BUFF",
					["source"] = "Ecoh-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[257418] = {
					["type"] = "BUFF",
					["source"] = "Darkksong-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[324047] = {
					["encounterID"] = 2394,
					["source"] = "Millificent Manastorm",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 164555,
				},
				[17] = {
					["type"] = "BUFF",
					["source"] = "Hazeel-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[320212] = {
					["type"] = "BUFF",
					["source"] = "Manaclawtwo-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[334535] = {
					["source"] = "Territorial Bladebeak",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 171181,
				},
				[135299] = {
					["type"] = "DEBUFF",
					["source"] = "Honiahaka-Perenolde",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[332234] = {
					["source"] = "Sentient Oil",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 167967,
				},
				[87023] = {
					["type"] = "DEBUFF",
					["source"] = "Jesstara-Thunderlord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[322773] = {
					["type"] = "BUFF",
					["source"] = "Hakkar the Soulflayer",
					["encounterID"] = 2395,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 164558,
				},
				[53390] = {
					["type"] = "BUFF",
					["source"] = "Delínâ-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[218164] = {
					["source"] = "Mistgarr",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[215479] = {
					["type"] = "BUFF",
					["source"] = "Mistgarr",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[139] = {
					["type"] = "BUFF",
					["source"] = "Resc-MoonGuard",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[87024] = {
					["type"] = "DEBUFF",
					["source"] = "Jesstara-Thunderlord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[323544] = {
					["type"] = "BUFF",
					["source"] = "Son of Hakkar",
					["encounterID"] = 2395,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 165905,
				},
				[324312] = {
					["source"] = "Mistgarr",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[327893] = {
					["type"] = "DEBUFF",
					["source"] = "Sutarman-Frostmourne",
					["encounterID"] = 2396,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[5487] = {
					["type"] = "BUFF",
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[8936] = {
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[341449] = {
					["type"] = "BUFF",
					["source"] = "Dreädnaught-Fenris",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[123725] = {
					["type"] = "DEBUFF",
					["source"] = "Mistgarr",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[248473] = {
					["type"] = "BUFF",
					["source"] = "Mytae-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[289277] = {
					["type"] = "BUFF",
					["source"] = "Bwonsãmdi-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[147709] = {
					["source"] = "Syrìo-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[345545] = {
					["type"] = "BUFF",
					["source"] = "Verael-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[194384] = {
					["type"] = "BUFF",
					["source"] = "Selphy-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[24394] = {
					["type"] = "DEBUFF",
					["source"] = "Zillah",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 165189,
				},
				[307185] = {
					["source"] = "Honiahaka-Perenolde",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[334295] = {
					["type"] = "BUFF",
					["source"] = "Zenzzal-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[327646] = {
					["encounterID"] = 2396,
					["source"] = "Mueh'zala",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 166608,
				},
				[321764] = {
					["source"] = "Spriggan Barkbinder",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 164861,
				},
				[320230] = {
					["encounterID"] = 2400,
					["source"] = "Dealer Xy'exa",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 164450,
				},
				[260881] = {
					["type"] = "BUFF",
					["source"] = "Isabeau-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[55342] = {
					["type"] = "BUFF",
					["source"] = "Elyk-WyrmrestAccord",
					["encounterID"] = 2395,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[34914] = {
					["type"] = "DEBUFF",
					["source"] = "Debx-Zul'jin",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[73920] = {
					["source"] = "Greeblik-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[206151] = {
					["type"] = "DEBUFF",
					["source"] = "Elyk-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[333787] = {
					["type"] = "BUFF",
					["source"] = "Enraged Spirit",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 168934,
				},
				[332509] = {
					["type"] = "BUFF",
					["source"] = "Millificent Manastorm",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 164555,
				},
				[11366] = {
					["source"] = "Jesstara-Thunderlord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[24858] = {
					["type"] = "BUFF",
					["source"] = "Zalukala-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[307192] = {
					["encounterID"] = 2394,
					["source"] = "Honiahaka-Perenolde",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[341207] = {
					["type"] = "BUFF",
					["source"] = "Mzoth-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[253595] = {
					["type"] = "BUFF",
					["source"] = "Joll-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[292360] = {
					["type"] = "BUFF",
					["source"] = "Bwonsãmdi-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[261396] = {
					["type"] = "BUFF",
					["source"] = "Aethaele-Illidan",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[332514] = {
					["type"] = "BUFF",
					["source"] = "Mobamba-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[292362] = {
					["type"] = "BUFF",
					["source"] = "Mobamba-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[287504] = {
					["type"] = "BUFF",
					["source"] = "Diororo",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[321519] = {
					["type"] = "DEBUFF",
					["source"] = "Honiahaka-Perenolde",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[334051] = {
					["source"] = "Death Speaker",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 168942,
				},
				[292364] = {
					["type"] = "BUFF",
					["source"] = "Nokmojek-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[48438] = {
					["type"] = "BUFF",
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[143625] = {
					["type"] = "BUFF",
					["source"] = "Bloodshox-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[325101] = {
					["type"] = "BUFF",
					["source"] = "Steward",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 166663,
				},
				[192090] = {
					["type"] = "DEBUFF",
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[221885] = {
					["type"] = "BUFF",
					["source"] = "Kowahu-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[257946] = {
					["type"] = "BUFF",
					["source"] = "Honiahaka-Perenolde",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[123986] = {
					["source"] = "Mistgarr",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[193753] = {
					["type"] = "BUFF",
					["source"] = "Adralle-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[323569] = {
					["type"] = "DEBUFF",
					["source"] = "Son of Hakkar",
					["encounterID"] = 2395,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 165905,
				},
				[235313] = {
					["type"] = "BUFF",
					["source"] = "Jesstara-Thunderlord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[121557] = {
					["type"] = "BUFF",
					["source"] = "Silkysilky-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[101545] = {
					["source"] = "Rokkoko-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[301578] = {
					["source"] = "Gaeya-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[45242] = {
					["type"] = "BUFF",
					["source"] = "Mzoth-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[321527] = {
					["type"] = "BUFF",
					["source"] = "Elyk-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[137619] = {
					["type"] = "DEBUFF",
					["source"] = "Saptiva",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[323064] = {
					["type"] = "BUFF",
					["source"] = "Hakkar the Soulflayer",
					["encounterID"] = 2395,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 164558,
				},
				[197721] = {
					["type"] = "BUFF",
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[308488] = {
					["type"] = "BUFF",
					["source"] = "Zalukala-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[8921] = {
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[278310] = {
					["type"] = "BUFF",
					["source"] = "Elyk-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[289308] = {
					["type"] = "DEBUFF",
					["source"] = "Elyk-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[219589] = {
					["type"] = "BUFF",
					["source"] = "Manaclawtwo-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[205523] = {
					["source"] = "Mistgarr",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[345319] = {
					["encounterID"] = 2394,
					["source"] = "Elyk-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[100780] = {
					["source"] = "Mistgarr",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[116189] = {
					["type"] = "DEBUFF",
					["source"] = "Mistgarr",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[210256] = {
					["type"] = "BUFF",
					["source"] = "Strixpaladin-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[327164] = {
					["type"] = "BUFF",
					["source"] = "Delínâ-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[321538] = {
					["type"] = "DEBUFF",
					["source"] = "Zillah",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 165189,
				},
				[72968] = {
					["type"] = "BUFF",
					["source"] = "Mondsucht-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[333049] = {
					["type"] = "BUFF",
					["source"] = "Jesstara-Thunderlord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[235450] = {
					["type"] = "BUFF",
					["source"] = "Manaclawtwo-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[324867] = {
					["type"] = "BUFF",
					["source"] = "Mistgarr",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[320008] = {
					["encounterID"] = 2394,
					["source"] = "Millhouse Manastorm",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 164556,
				},
				[18562] = {
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[320009] = {
					["type"] = "BUFF",
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[327426] = {
					["type"] = "BUFF",
					["source"] = "Shattered Visage",
					["encounterID"] = 2396,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 168326,
				},
				[124503] = {
					["source"] = "Mistgarr",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[334076] = {
					["source"] = "Death Speaker",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 168942,
				},
				[307101] = {
					["source"] = "Gaeya-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[169468] = {
					["source"] = "Syrìo-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[308742] = {
					["source"] = "Ziranoctl-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[323760] = {
					["source"] = "Ezri-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[106898] = {
					["type"] = "BUFF",
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[297034] = {
					["type"] = "BUFF",
					["source"] = "Iorebryn-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[336891] = {
					["type"] = "DEBUFF",
					["source"] = "Mistgarr",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[182512] = {
					["source"] = "Syrìo-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[323761] = {
					["source"] = "Ezri-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[231390] = {
					["type"] = "BUFF",
					["source"] = "Mytae-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[69070] = {
					["source"] = "Greeblik-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[308415] = {
					["source"] = "Ezri-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[170950] = {
					["type"] = "BUFF",
					["source"] = "Rosebudding-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[270661] = {
					["type"] = "BUFF",
					["source"] = "Ziranoctl-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[68529] = {
					["type"] = "BUFF",
					["source"] = "Ruhanaa-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[115804] = {
					["type"] = "DEBUFF",
					["source"] = "Kiing-Blade'sEdge",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[53365] = {
					["type"] = "BUFF",
					["source"] = "Joll-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[326920] = {
					["encounterID"] = 2394,
					["source"] = "Millhouse Manastorm",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 164556,
				},
				[325130] = {
					["source"] = "Jesstara-Thunderlord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[309530] = {
					["source"] = "Lyrill-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[320147] = {
					["type"] = "DEBUFF",
					["source"] = "Millificent Manastorm",
					["encounterID"] = 2394,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 164555,
				},
				[35079] = {
					["type"] = "BUFF",
					["source"] = "Honiahaka-Perenolde",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[144787] = {
					["type"] = "BUFF",
					["source"] = "Toromaklauss-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[339966] = {
					["source"] = "Spriggan Barkbinder",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 164861,
				},
				[12654] = {
					["type"] = "DEBUFF",
					["source"] = "Jesstara-Thunderlord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[131493] = {
					["type"] = "BUFF",
					["source"] = "Jadëscroll-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[119582] = {
					["source"] = "Mistgarr",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[320786] = {
					["type"] = "DEBUFF",
					["encounterID"] = 2394,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[240443] = {
					["type"] = "DEBUFF",
					["source"] = "Risen Bonesoldier",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 168949,
				},
				[245686] = {
					["type"] = "BUFF",
					["source"] = "Malíën-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[204361] = {
					["type"] = "BUFF",
					["source"] = "Bonestriker-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[320787] = {
					["encounterID"] = 2394,
					["source"] = "Millhouse Manastorm",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 164556,
				},
				[343290] = {
					["type"] = "BUFF",
					["source"] = "Mzoth-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[176890] = {
					["source"] = "Syrìo-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[341291] = {
					["type"] = "DEBUFF",
					["source"] = "Codyx-Illidan",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[124506] = {
					["source"] = "Mistgarr",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[8690] = {
					["source"] = "Foxtail-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[196099] = {
					["type"] = "BUFF",
					["source"] = "Skreem-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[330764] = {
					["type"] = "BUFF",
					["source"] = "Jesstara-Thunderlord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[336135] = {
					["type"] = "BUFF",
					["source"] = "Anëi-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[190446] = {
					["type"] = "BUFF",
					["source"] = "Elyk-WyrmrestAccord",
					["encounterID"] = 2395,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[330765] = {
					["type"] = "BUFF",
					["source"] = "Jesstara-Thunderlord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[347901] = {
					["type"] = "BUFF",
					["source"] = "Shiramue-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[332678] = {
					["source"] = "Atal'ai Deathwalker",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 170480,
				},
				[156779] = {
					["type"] = "BUFF",
					["source"] = "Lindallos-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[190319] = {
					["type"] = "BUFF",
					["source"] = "Jesstara-Thunderlord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[188401] = {
					["source"] = "Ezri-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[45438] = {
					["type"] = "BUFF",
					["source"] = "Elyk-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[328210] = {
					["type"] = "BUFF",
					["source"] = "Mistgarr",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[90328] = {
					["type"] = "BUFF",
					["source"] = "Unknown",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 165189,
				},
				[344266] = {
					["source"] = "Morsilde-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[307495] = {
					["type"] = "BUFF",
					["source"] = "Elyk-WyrmrestAccord",
					["encounterID"] = 2396,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[268877] = {
					["type"] = "BUFF",
					["source"] = "Honiahaka-Perenolde",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[131318] = {
					["source"] = "Morsilde-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[324631] = {
					["type"] = "BUFF",
					["source"] = "Mistgarr",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[11541] = {
					["source"] = "Mobamba-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[108843] = {
					["type"] = "BUFF",
					["source"] = "Jesstara-Thunderlord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[327701] = {
					["type"] = "BUFF",
					["source"] = "Zadili-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[5760] = {
					["type"] = "DEBUFF",
					["source"] = "Saptiva",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[8680] = {
					["type"] = "DEBUFF",
					["source"] = "Saptiva",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[340546] = {
					["type"] = "BUFF",
					["source"] = "Upgrayedd-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[339978] = {
					["type"] = "DEBUFF",
					["source"] = "Mistgarr",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[61295] = {
					["type"] = "BUFF",
					["source"] = "Delínâ-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[330943] = {
					["type"] = "BUFF",
					["source"] = "Dregen-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[311492] = {
					["type"] = "BUFF",
					["source"] = "Pinkbunny-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[342869] = {
					["type"] = "BUFF",
					["source"] = "Enraged Spirit",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 168934,
				},
				[335904] = {
					["type"] = "DEBUFF",
					["source"] = "Bloodshox-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[269279] = {
					["type"] = "BUFF",
					["source"] = "Hurumà-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[327704] = {
					["type"] = "BUFF",
					["source"] = "Ecoh-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[97463] = {
					["type"] = "BUFF",
					["source"] = "Bghero-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[195949] = {
					["type"] = "BUFF",
					["source"] = "Syrìo-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[345863] = {
					["type"] = "BUFF",
					["source"] = "Sarwyyn-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[34026] = {
					["source"] = "Honiahaka-Perenolde",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[176212] = {
					["source"] = "Syrìo-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[326171] = {
					["encounterID"] = 2396,
					["source"] = "Mueh'zala",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 166608,
				},
				[345230] = {
					["type"] = "BUFF",
					["source"] = "Joppy-Barthilas",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[308525] = {
					["type"] = "BUFF",
					["source"] = "Lyrill-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[324382] = {
					["source"] = "Mistgarr",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[326684] = {
					["encounterID"] = 2394,
					["source"] = "Millhouse Manastorm",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 164556,
				},
				[44544] = {
					["type"] = "BUFF",
					["source"] = "Elyk-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[236502] = {
					["type"] = "BUFF",
					["source"] = "Joppy-Barthilas",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[73685] = {
					["type"] = "BUFF",
					["source"] = "Joppy-Barthilas",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[328987] = {
					["type"] = "DEBUFF",
					["source"] = "Son of Hakkar",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 170488,
				},
				[252216] = {
					["type"] = "BUFF",
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1490] = {
					["type"] = "DEBUFF",
					["source"] = "Gelutesb-Illidan",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[207400] = {
					["type"] = "BUFF",
					["source"] = "Delínâ-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[77472] = {
					["source"] = "Delínâ-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[222695] = {
					["source"] = "ßenson-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[66906] = {
					["type"] = "BUFF",
					["source"] = "Sarwyyn-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[330729] = {
					["type"] = "BUFF",
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[321061] = {
					["type"] = "BUFF",
					["source"] = "Millificent Manastorm",
					["encounterID"] = 2394,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 164555,
				},
				[192058] = {
					["source"] = "Greeblik-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[235219] = {
					["encounterID"] = 2395,
					["source"] = "Elyk-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[157131] = {
					["type"] = "DEBUFF",
					["source"] = "Mobamba-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[202602] = {
					["type"] = "BUFF",
					["source"] = "Galicit-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[331548] = {
					["source"] = "4.RF-4.RF",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 167964,
				},
				[5394] = {
					["source"] = "Greeblik-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[111759] = {
					["type"] = "BUFF",
					["source"] = "Hazeel-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[311483] = {
					["type"] = "BUFF",
					["source"] = "Telarido-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[5672] = {
					["type"] = "BUFF",
					["source"] = "Healing Stream Totem",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 3527,
				},
				[323877] = {
					["type"] = "DEBUFF",
					["source"] = "Millificent Manastorm",
					["encounterID"] = 2394,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 164555,
				},
				[115176] = {
					["type"] = "BUFF",
					["source"] = "Mistgarr",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[177938] = {
					["source"] = "Syrìo-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[70774] = {
					["type"] = "BUFF",
					["source"] = "Huij-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[204262] = {
					["type"] = "BUFF",
					["source"] = "Urukara-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[281209] = {
					["type"] = "BUFF",
					["source"] = "Annabon-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[115008] = {
					["source"] = "Enclavian-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[147362] = {
					["source"] = "Honiahaka-Perenolde",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[190456] = {
					["type"] = "BUFF",
					["source"] = "Bghero-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[5761] = {
					["type"] = "BUFF",
					["source"] = "Druly-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[290121] = {
					["type"] = "BUFF",
					["source"] = "Bloodshox-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[108211] = {
					["type"] = "BUFF",
					["source"] = "Sinaelis-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[65081] = {
					["type"] = "BUFF",
					["source"] = "Hazeel-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[312372] = {
					["type"] = "BUFF",
					["source"] = "Gobwok-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[6788] = {
					["type"] = "DEBUFF",
					["source"] = "Hazeel-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[344597] = {
					["source"] = "Elyk-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[251837] = {
					["type"] = "BUFF",
					["source"] = "Elèdrith-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[337948] = {
					["type"] = "BUFF",
					["source"] = "Malfer-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[333089] = {
					["type"] = "BUFF",
					["source"] = "Shinybandaid-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[16870] = {
					["type"] = "BUFF",
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[70233] = {
					["type"] = "BUFF",
					["source"] = "Ixshel-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[334448] = {
					["type"] = "BUFF",
					["source"] = "Velýs-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[328231] = {
					["source"] = "Honiahaka-Perenolde",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[246851] = {
					["type"] = "BUFF",
					["source"] = "Honiahaka-Perenolde",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1449] = {
					["source"] = "Helén-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[334443] = {
					["type"] = "BUFF",
					["source"] = "Verael-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[2823] = {
					["type"] = "BUFF",
					["source"] = "Verael-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[2908] = {
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[246852] = {
					["type"] = "BUFF",
					["source"] = "Honiahaka-Perenolde",
					["encounterID"] = 2395,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1459] = {
					["type"] = "BUFF",
					["source"] = "Jesstara-Thunderlord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[2645] = {
					["type"] = "BUFF",
					["source"] = "Lokobamf-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[290640] = {
					["type"] = "BUFF",
					["source"] = "Upgrayedd-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[116841] = {
					["source"] = "Mistgarr",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[57724] = {
					["type"] = "DEBUFF",
					["source"] = "Silkysilky-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[281178] = {
					["type"] = "BUFF",
					["source"] = "Strixpaladin-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[342814] = {
					["type"] = "BUFF",
					["source"] = "Honiahaka-Perenolde",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[121253] = {
					["source"] = "Mistgarr",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[332329] = {
					["source"] = "Atal'ai Devoted",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 170486,
				},
				[193530] = {
					["type"] = "BUFF",
					["source"] = "Honiahaka-Perenolde",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[334810] = {
					["type"] = "BUFF",
					["source"] = "Mueh'zala",
					["encounterID"] = 2396,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 166608,
				},
				[323123] = {
					["type"] = "BUFF",
					["source"] = "Runestag Elderhorn",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 164873,
				},
				[2948] = {
					["source"] = "Jesstara-Thunderlord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[322101] = {
					["source"] = "Mistgarr",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[740] = {
					["type"] = "BUFF",
					["source"] = "Sutarman-Frostmourne",
					["encounterID"] = 2395,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[196728] = {
					["source"] = "Niuzao",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 73967,
				},
				[157982] = {
					["type"] = "BUFF",
					["source"] = "Sutarman-Frostmourne",
					["encounterID"] = 2395,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[332332] = {
					["type"] = "DEBUFF",
					["source"] = "Son of Hakkar",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 170488,
				},
				[116011] = {
					["source"] = "Jesstara-Thunderlord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[108978] = {
					["encounterID"] = 2395,
					["source"] = "Jesstara-Thunderlord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[307162] = {
					["type"] = "BUFF",
					["source"] = "Jesstara-Thunderlord",
					["encounterID"] = 2396,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[227291] = {
					["source"] = "Niuzao",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 73967,
				},
				[320823] = {
					["encounterID"] = 2394,
					["source"] = "Millificent Manastorm",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 164555,
				},
				[320825] = {
					["encounterID"] = 2394,
					["source"] = "Mechanical Bomb Squirrel",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 164568,
				},
				[332334] = {
					["type"] = "BUFF",
					["source"] = "Son of Hakkar",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 170488,
				},
				[320168] = {
					["encounterID"] = 2394,
					["source"] = "Millificent Manastorm",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 164555,
				},
				[342309] = {
					["type"] = "BUFF",
					["source"] = "Elyk-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[332335] = {
					["type"] = "BUFF",
					["source"] = "Son of Hakkar",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 170488,
				},
				[197625] = {
					["type"] = "BUFF",
					["source"] = "Sutarman-Frostmourne",
					["encounterID"] = 2396,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[48518] = {
					["type"] = "BUFF",
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[34477] = {
					["type"] = "BUFF",
					["source"] = "Honiahaka-Perenolde",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[323385] = {
					["type"] = "BUFF",
					["source"] = "Joppy-Barthilas",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[122278] = {
					["type"] = "BUFF",
					["source"] = "Mistgarr",
					["encounterID"] = 2395,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[115181] = {
					["source"] = "Mistgarr",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[197626] = {
					["encounterID"] = 2396,
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[89798] = {
					["type"] = "DEBUFF",
					["source"] = "Lord Victor Nefarius",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 49799,
				},
				[32216] = {
					["type"] = "BUFF",
					["source"] = "Bghero-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[5176] = {
					["encounterID"] = 2395,
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[311477] = {
					["type"] = "BUFF",
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[320830] = {
					["encounterID"] = 2394,
					["source"] = "Mechanical Bomb Squirrel",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 164568,
				},
				[322109] = {
					["source"] = "Mistgarr",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[116844] = {
					["source"] = "Mistgarr",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[332084] = {
					["type"] = "BUFF",
					["source"] = "Lubricator",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 167965,
				},
				[321530] = {
					["source"] = "Honiahaka-Perenolde",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[333875] = {
					["source"] = "Death Speaker",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 168942,
				},
				[190336] = {
					["source"] = "Elyk-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[343594] = {
					["type"] = "BUFF",
					["source"] = "Jesstara-Thunderlord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[197628] = {
					["encounterID"] = 2396,
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[115546] = {
					["source"] = "Mistgarr",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[22842] = {
					["type"] = "BUFF",
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[325437] = {
					["type"] = "DEBUFF",
					["source"] = "Jesstara-Thunderlord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[308506] = {
					["type"] = "BUFF",
					["source"] = "Youaresad-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[188550] = {
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[280398] = {
					["type"] = "BUFF",
					["source"] = "Shinybandaid-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[116014] = {
					["type"] = "BUFF",
					["source"] = "Jesstara-Thunderlord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[203975] = {
					["type"] = "BUFF",
					["source"] = "Lhøkni-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[119085] = {
					["type"] = "BUFF",
					["source"] = "Enclavian-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[221886] = {
					["type"] = "BUFF",
					["source"] = "Lexiaria-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[311465] = {
					["type"] = "BUFF",
					["source"] = "Elyk-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[330919] = {
					["source"] = "Enraged Mask",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 169912,
				},
				[8212] = {
					["type"] = "BUFF",
					["source"] = "Silkysilky-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[195457] = {
					["source"] = "Kurozi-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[774] = {
					["type"] = "BUFF",
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[311493] = {
					["type"] = "BUFF",
					["source"] = "Puwexil-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[59638] = {
					["encounterID"] = 2395,
					["source"] = "Elyk-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 31216,
				},
				[332605] = {
					["source"] = "Atal'ai Hoodoo Hexxer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 170572,
				},
				[332862] = {
					["type"] = "BUFF",
					["source"] = "Apokolipse-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[116847] = {
					["type"] = "BUFF",
					["source"] = "Mistgarr",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[781] = {
					["source"] = "Nmmoinn-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[12472] = {
					["type"] = "BUFF",
					["source"] = "Elyk-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[332608] = {
					["source"] = "Atal'ai Hoodoo Hexxer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 170572,
				},
				[783] = {
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[176151] = {
					["type"] = "BUFF",
					["source"] = "Seraanna-MoonGuard",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[327649] = {
					["type"] = "DEBUFF",
					["source"] = "Mueh'zala",
					["encounterID"] = 2396,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 166608,
				},
				[258920] = {
					["type"] = "BUFF",
					["source"] = "Maximopoder-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[186254] = {
					["type"] = "BUFF",
					["source"] = "Honiahaka-Perenolde",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[217200] = {
					["source"] = "Honiahaka-Perenolde",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[2580] = {
					["type"] = "BUFF",
					["source"] = "Zalukala-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[2139] = {
					["source"] = "Elyk-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[311496] = {
					["type"] = "BUFF",
					["source"] = "Röskva-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[331846] = {
					["source"] = "4.RF-4.RF",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 167964,
				},
				[109304] = {
					["source"] = "Honiahaka-Perenolde",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[331847] = {
					["type"] = "DEBUFF",
					["source"] = "4.RF-4.RF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 167964,
				},
				[326221] = {
					["encounterID"] = 2396,
					["source"] = "Mueh'zala",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 166608,
				},
				[44614] = {
					["encounterID"] = 2395,
					["source"] = "Elyk-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[318038] = {
					["source"] = "Greeblik-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[186257] = {
					["type"] = "BUFF",
					["source"] = "Honiahaka-Perenolde",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[311474] = {
					["type"] = "BUFF",
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[52127] = {
					["type"] = "BUFF",
					["source"] = "Isabeau-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[333641] = {
					["source"] = "Risen Warlord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 169905,
				},
				[32223] = {
					["type"] = "BUFF",
					["source"] = "Röskva-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[324739] = {
					["source"] = "Kowahu-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[19574] = {
					["type"] = "BUFF",
					["source"] = "Honiahaka-Perenolde",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[325092] = {
					["type"] = "BUFF",
					["source"] = "Mistgarr",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[281216] = {
					["type"] = "BUFF",
					["source"] = "Bràktar-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[315584] = {
					["type"] = "BUFF",
					["source"] = "Druly-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[25771] = {
					["type"] = "DEBUFF",
					["source"] = "Vallaryah-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[328275] = {
					["source"] = "Honiahaka-Perenolde",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[325587] = {
					["type"] = "DEBUFF",
					["source"] = "Bwonsamdi",
					["encounterID"] = 2396,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 169814,
				},
				[327891] = {
					["encounterID"] = 2396,
					["source"] = "Bwonsamdi's Fury",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 169506,
				},
				[334913] = {
					["type"] = "DEBUFF",
					["source"] = "Mueh'zala",
					["encounterID"] = 2396,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 166608,
				},
				[186265] = {
					["type"] = "BUFF",
					["source"] = "Honiahaka-Perenolde",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[257541] = {
					["source"] = "Jesstara-Thunderlord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[324090] = {
					["encounterID"] = 2400,
					["source"] = "Dealer Xy'exa",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 164450,
				},
				[332371] = {
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[236645] = {
					["type"] = "BUFF",
					["source"] = "Aenderan-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[309610] = {
					["source"] = "Lyrill-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[340556] = {
					["type"] = "DEBUFF",
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[329666] = {
					["type"] = "BUFF",
					["source"] = "Honiahaka-Perenolde",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[323166] = {
					["encounterID"] = 2395,
					["source"] = "Hakkar the Soulflayer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 164558,
				},
				[70242] = {
					["type"] = "BUFF",
					["source"] = "Lohdeathpan-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[324701] = {
					["source"] = "Jesstara-Thunderlord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[57723] = {
					["type"] = "DEBUFF",
					["source"] = "Lokobamf-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[345673] = {
					["type"] = "BUFF",
					["source"] = "Halz-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[323576] = {
					["source"] = "Runestag Elderhorn",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 164873,
				},
				[325725] = {
					["encounterID"] = 2396,
					["source"] = "Mueh'zala",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 166608,
				},
				[190356] = {
					["source"] = "Elyk-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[324523] = {
					["type"] = "BUFF",
					["source"] = "Mistgarr",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[276111] = {
					["type"] = "BUFF",
					["source"] = "Healioz-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[186258] = {
					["type"] = "BUFF",
					["source"] = "Honiahaka-Perenolde",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[325216] = {
					["source"] = "Mistgarr",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[70243] = {
					["type"] = "BUFF",
					["source"] = "Tessrak-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[331866] = {
					["source"] = "Fanadian-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[320144] = {
					["encounterID"] = 2394,
					["source"] = "Millificent Manastorm",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 164555,
				},
				[324010] = {
					["type"] = "DEBUFF",
					["source"] = "Millificent Manastorm",
					["encounterID"] = 2394,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 164555,
				},
				[320785] = {
					["type"] = "BUFF",
					["source"] = "Millhouse Manastorm",
					["encounterID"] = 2394,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 164556,
				},
				[124275] = {
					["type"] = "DEBUFF",
					["source"] = "Mistgarr",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[272790] = {
					["source"] = "Honiahaka-Perenolde",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[342905] = {
					["type"] = "BUFF",
					["source"] = "Millhouse Manastorm",
					["encounterID"] = 2394,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 164556,
				},
				[257284] = {
					["source"] = "Honiahaka-Perenolde",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[119381] = {
					["source"] = "Mistgarr",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[331927] = {
					["type"] = "BUFF",
					["source"] = "Defunct Dental Drill",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 167962,
				},
				[48517] = {
					["type"] = "BUFF",
					["source"] = "Sutarman-Frostmourne",
					["encounterID"] = 2396,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[334428] = {
					["type"] = "BUFF",
					["source"] = "Zenzzal-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[217597] = {
					["type"] = "BUFF",
					["source"] = "Syrìo-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[323687] = {
					["encounterID"] = 2400,
					["source"] = "Dealer Xy'exa",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 164450,
				},
				[11426] = {
					["type"] = "BUFF",
					["source"] = "Elyk-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[323118] = {
					["type"] = "DEBUFF",
					["source"] = "Hakkar the Soulflayer",
					["encounterID"] = 2395,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 164558,
				},
				[110909] = {
					["type"] = "BUFF",
					["source"] = "Jesstara-Thunderlord",
					["encounterID"] = 2395,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[323567] = {
					["type"] = "BUFF",
					["source"] = "Son of Hakkar",
					["encounterID"] = 2395,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 165905,
				},
				[309623] = {
					["source"] = "Pekoraa-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[321388] = {
					["type"] = "BUFF",
					["source"] = "Tookah-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[185358] = {
					["source"] = "Honiahaka-Perenolde",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[116705] = {
					["source"] = "Mistgarr",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[344662] = {
					["type"] = "BUFF",
					["source"] = "Honiahaka-Perenolde",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[29166] = {
					["type"] = "BUFF",
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[102342] = {
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[344663] = {
					["type"] = "DEBUFF",
					["source"] = "Risen Bonesoldier",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 168949,
				},
				[332671] = {
					["type"] = "BUFF",
					["source"] = "Atal'ai Deathwalker",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 170480,
				},
				[323692] = {
					["type"] = "DEBUFF",
					["source"] = "Honiahaka-Perenolde",
					["encounterID"] = 2400,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[3408] = {
					["type"] = "BUFF",
					["source"] = "Verael-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1706] = {
					["source"] = "Hazeel-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[124273] = {
					["type"] = "DEBUFF",
					["source"] = "Mistgarr",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[205708] = {
					["type"] = "DEBUFF",
					["source"] = "Elyk-WyrmrestAccord",
					["encounterID"] = 2395,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[240446] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[1543] = {
					["source"] = "Honiahaka-Perenolde",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[118455] = {
					["type"] = "BUFF",
					["source"] = "Honiahaka-Perenolde",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[53351] = {
					["source"] = "Honiahaka-Perenolde",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[201754] = {
					["source"] = "Zillah",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 165189,
				},
				[17253] = {
					["source"] = "Zillah",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 165189,
				},
				[263840] = {
					["source"] = "Zillah",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 165189,
				},
				[30455] = {
					["source"] = "Elyk-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[124274] = {
					["type"] = "DEBUFF",
					["source"] = "Mistgarr",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[114108] = {
					["type"] = "BUFF",
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[328740] = {
					["source"] = "Risen Cultist",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 168992,
				},
				[310143] = {
					["type"] = "BUFF",
					["source"] = "Elyk-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[119415] = {
					["type"] = "BUFF",
					["source"] = "Elyk-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[333728] = {
					["source"] = "Risen Bonesoldier",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 168949,
				},
				[195630] = {
					["type"] = "BUFF",
					["source"] = "Mistgarr",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[328707] = {
					["source"] = "Risen Cultist",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 168992,
				},
				[311479] = {
					["type"] = "BUFF",
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[322729] = {
					["source"] = "Mistgarr",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[132951] = {
					["type"] = "DEBUFF",
					["source"] = "Atal'ai High Priest",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 170490,
				},
				[43308] = {
					["type"] = "BUFF",
					["source"] = "Honiahaka-Perenolde",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[329840] = {
					["source"] = "Mistgarr",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[336746] = {
					["type"] = "DEBUFF",
					["source"] = "Honiahaka-Perenolde",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[311469] = {
					["type"] = "BUFF",
					["source"] = "Elyk-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[22812] = {
					["type"] = "BUFF",
					["source"] = "Sutarman-Frostmourne",
					["encounterID"] = 2400,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[118905] = {
					["source"] = "Capacitor Totem",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 61245,
				},
				[70234] = {
					["type"] = "BUFF",
					["source"] = "Tubanub-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[102793] = {
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[164815] = {
					["type"] = "DEBUFF",
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[339848] = {
					["type"] = "BUFF",
					["source"] = "Unknown",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 58965,
				},
				[254474] = {
					["type"] = "BUFF",
					["source"] = "Arakain-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[331379] = {
					["source"] = "Lubricator",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 167965,
				},
				[321405] = {
					["source"] = "Mistgarr",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[224001] = {
					["type"] = "BUFF",
					["source"] = "Galicit-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[186406] = {
					["type"] = "BUFF",
					["source"] = "Zalukala-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[342122] = {
					["source"] = "Tessrak-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[101643] = {
					["type"] = "BUFF",
					["source"] = "Mistgarr",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[232698] = {
					["type"] = "BUFF",
					["source"] = "Prieston-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[320130] = {
					["type"] = "BUFF",
					["source"] = "Manaclawtwo-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[329849] = {
					["type"] = "BUFF",
					["source"] = "Mistgarr",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[210065] = {
					["type"] = "BUFF",
					["source"] = "Saggitarious-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[108446] = {
					["type"] = "BUFF",
					["source"] = "Unknown",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 58965,
				},
				[320132] = {
					["encounterID"] = 2394,
					["source"] = "Millhouse Manastorm",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 164556,
				},
				[80353] = {
					["type"] = "BUFF",
					["source"] = "Jesstara-Thunderlord",
					["encounterID"] = 2395,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[209261] = {
					["type"] = "DEBUFF",
					["source"] = "Bastindis-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[31661] = {
					["source"] = "Jesstara-Thunderlord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[198837] = {
					["source"] = "Risen Skulker",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 99541,
				},
				[120954] = {
					["type"] = "BUFF",
					["source"] = "Mistgarr",
					["encounterID"] = 2395,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[332156] = {
					["type"] = "BUFF",
					["source"] = "Headless Client",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 167963,
				},
				[19577] = {
					["source"] = "Honiahaka-Perenolde",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[334970] = {
					["type"] = "BUFF",
					["source"] = "Mueh'zala",
					["encounterID"] = 2396,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 166608,
				},
				[80354] = {
					["type"] = "DEBUFF",
					["source"] = "Jesstara-Thunderlord",
					["encounterID"] = 2395,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[316220] = {
					["type"] = "DEBUFF",
					["source"] = "Saptiva",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[88423] = {
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[332158] = {
					["type"] = "BUFF",
					["source"] = "Headless Client",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 167963,
				},
				[155722] = {
					["type"] = "DEBUFF",
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[242551] = {
					["type"] = "BUFF",
					["source"] = "Galicit-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[19801] = {
					["source"] = "Honiahaka-Perenolde",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[320140] = {
					["encounterID"] = 2394,
					["source"] = "Honiahaka-Perenolde",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[207640] = {
					["type"] = "BUFF",
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[328837] = {
					["type"] = "BUFF",
					["source"] = "Honiahaka-Perenolde",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[132578] = {
					["type"] = "BUFF",
					["source"] = "Mistgarr",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[127797] = {
					["type"] = "DEBUFF",
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[339324] = {
					["type"] = "BUFF",
					["source"] = "Strixpaladin-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[325258] = {
					["type"] = "BUFF",
					["source"] = "Mueh'zala",
					["encounterID"] = 2396,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 166608,
				},
				[321422] = {
					["type"] = "BUFF",
					["source"] = "Mistgarr",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[118922] = {
					["type"] = "BUFF",
					["source"] = "Nmmoinn-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[2643] = {
					["source"] = "Honiahaka-Perenolde",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[207386] = {
					["type"] = "BUFF",
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[324748] = {
					["type"] = "BUFF",
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[308514] = {
					["type"] = "BUFF",
					["source"] = "Mistgarr",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[331398] = {
					["source"] = "Volatile Memory",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 170147,
				},
				[228358] = {
					["type"] = "DEBUFF",
					["source"] = "Elyk-WyrmrestAccord",
					["encounterID"] = 2395,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[307187] = {
					["type"] = "BUFF",
					["source"] = "Halzek-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[41425] = {
					["type"] = "DEBUFF",
					["source"] = "Elyk-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[334067] = {
					["type"] = "BUFF",
					["source"] = "Klarina-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[157644] = {
					["type"] = "BUFF",
					["source"] = "Jesstara-Thunderlord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[345211] = {
					["type"] = "BUFF",
					["source"] = "Jesstara-Thunderlord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[117952] = {
					["source"] = "Mistgarr",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[1850] = {
					["type"] = "BUFF",
					["source"] = "Wargwood-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[116] = {
					["encounterID"] = 2395,
					["source"] = "Elyk-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[20707] = {
					["type"] = "BUFF",
					["source"] = "Xivara-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[115203] = {
					["encounterID"] = 2395,
					["source"] = "Mistgarr",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[185394] = {
					["type"] = "BUFF",
					["source"] = "Lanaline-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[54149] = {
					["type"] = "BUFF",
					["source"] = "Mobamba-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[465] = {
					["type"] = "BUFF",
					["source"] = "Xaalu-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[48107] = {
					["type"] = "BUFF",
					["source"] = "Jesstara-Thunderlord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[48778] = {
					["type"] = "BUFF",
					["source"] = "Zadili-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[337542] = {
					["type"] = "BUFF",
					["source"] = "Meridias-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[310454] = {
					["type"] = "BUFF",
					["source"] = "Diororo",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[308899] = {
					["source"] = "Ketchikan-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[30831] = {
					["type"] = "BUFF",
					["source"] = "Spriggan Mendbender",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 164857,
				},
				[341824] = {
					["type"] = "BUFF",
					["source"] = "Mzoth-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[187698] = {
					["source"] = "Honiahaka-Perenolde",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[227723] = {
					["type"] = "BUFF",
					["source"] = "Zalukala-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[205473] = {
					["type"] = "BUFF",
					["source"] = "Elyk-WyrmrestAccord",
					["encounterID"] = 2395,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[102417] = {
					["source"] = "Jeiut-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[338825] = {
					["type"] = "BUFF",
					["source"] = "Shiramue-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[311460] = {
					["type"] = "BUFF",
					["source"] = "Joll-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[93402] = {
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[333711] = {
					["source"] = "Skeletal Raptor",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 168986,
				},
				[338036] = {
					["type"] = "BUFF",
					["source"] = "Gubbie-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[165961] = {
					["type"] = "BUFF",
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[347600] = {
					["type"] = "BUFF",
					["source"] = "Mythicktrap-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[321948] = {
					["type"] = "DEBUFF",
					["source"] = "Dealer Xy'exa",
					["encounterID"] = 2400,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 164450,
				},
				[87840] = {
					["type"] = "BUFF",
					["source"] = "Prayspot-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[48108] = {
					["type"] = "BUFF",
					["source"] = "Jesstara-Thunderlord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[345696] = {
					["type"] = "BUFF",
					["source"] = "Bràktar-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[193455] = {
					["source"] = "Honiahaka-Perenolde",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[311464] = {
					["type"] = "BUFF",
					["source"] = "Elyk-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[475] = {
					["source"] = "Jesstara-Thunderlord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[115078] = {
					["encounterID"] = 2395,
					["source"] = "Mistgarr",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[164812] = {
					["type"] = "DEBUFF",
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[109132] = {
					["source"] = "Mistgarr",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[311466] = {
					["type"] = "BUFF",
					["source"] = "Elyk-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[273104] = {
					["type"] = "BUFF",
					["source"] = "Elyk-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[311467] = {
					["type"] = "BUFF",
					["source"] = "Elyk-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[338321] = {
					["type"] = "BUFF",
					["source"] = "Diororo",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[195503] = {
					["type"] = "BUFF",
					["source"] = "Rosebudding-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[311468] = {
					["type"] = "BUFF",
					["source"] = "Elyk-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[337299] = {
					["type"] = "BUFF",
					["source"] = "Manaclawtwo-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[345228] = {
					["type"] = "BUFF",
					["source"] = "Bghero-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[300728] = {
					["source"] = "Zelbin-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[321444] = {
					["type"] = "BUFF",
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[311470] = {
					["type"] = "BUFF",
					["source"] = "Elyk-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[108366] = {
					["type"] = "BUFF",
					["source"] = "Tsumari-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[311471] = {
					["type"] = "BUFF",
					["source"] = "Elyk-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[6673] = {
					["type"] = "BUFF",
					["source"] = "Warrionator-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[116670] = {
					["source"] = "Mistgarr",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[324260] = {
					["source"] = "Jesstara-Thunderlord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[314791] = {
					["type"] = "BUFF",
					["source"] = "Jesstara-Thunderlord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[331422] = {
					["source"] = "Sentient Oil",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 167967,
				},
				[324773] = {
					["source"] = "Ezri-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[228626] = {
					["type"] = "DEBUFF",
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[133] = {
					["source"] = "Jesstara-Thunderlord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[311475] = {
					["type"] = "BUFF",
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[338804] = {
					["type"] = "BUFF",
					["source"] = "Meridias-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[334493] = {
					["source"] = "Weald Shimmermoth",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 164862,
				},
				[311476] = {
					["type"] = "BUFF",
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[974] = {
					["type"] = "BUFF",
					["source"] = "Tamp-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[122] = {
					["source"] = "Elyk-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[332705] = {
					["source"] = "Atal'ai High Priest",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 170490,
				},
				[311478] = {
					["type"] = "BUFF",
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1953] = {
					["source"] = "Elyk-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[334496] = {
					["type"] = "DEBUFF",
					["source"] = "Elyk-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[333729] = {
					["source"] = "Risen Bonesoldier",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 168949,
				},
				[269571] = {
					["type"] = "BUFF",
					["source"] = "Strixpaladin-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[332707] = {
					["source"] = "Atal'ai High Priest",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 170490,
				},
				[311480] = {
					["type"] = "BUFF",
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[332196] = {
					["source"] = "Headless Client",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 167963,
				},
				[127230] = {
					["type"] = "BUFF",
					["source"] = "Ixshel-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[311481] = {
					["type"] = "BUFF",
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[326059] = {
					["source"] = "Delínâ-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[321712] = {
					["type"] = "DEBUFF",
					["source"] = "Jesstara-Thunderlord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[212653] = {
					["type"] = "BUFF",
					["source"] = "Jesstara-Thunderlord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[30449] = {
					["source"] = "Jesstara-Thunderlord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[322736] = {
					["encounterID"] = 2395,
					["source"] = "Hakkar the Soulflayer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 164558,
				},
				[195072] = {
					["source"] = "Sytharyn-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[333734] = {
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[270564] = {
					["type"] = "BUFF",
					["source"] = "Garfur-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[319970] = {
					["type"] = "BUFF",
					["source"] = "Sutarman-Frostmourne",
					["encounterID"] = 2396,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[344732] = {
					["source"] = "Honiahaka-Perenolde",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[52174] = {
					["source"] = "Warrionator-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[311485] = {
					["type"] = "BUFF",
					["source"] = "Aethaele-Illidan",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[145205] = {
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[8679] = {
					["type"] = "BUFF",
					["source"] = "Anëi-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[326064] = {
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[108853] = {
					["source"] = "Jesstara-Thunderlord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[127871] = {
					["source"] = "Syrìo-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[131347] = {
					["source"] = "Sytharyn-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[21562] = {
					["type"] = "BUFF",
					["source"] = "Silkysilky-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[323764] = {
					["type"] = "BUFF",
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[333227] = {
					["type"] = "BUFF",
					["source"] = "Risen Warlord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 169905,
				},
				[246152] = {
					["type"] = "BUFF",
					["source"] = "Honiahaka-Perenolde",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[345504] = {
					["type"] = "BUFF",
					["source"] = "Invis Stalker",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 165959,
				},
				[176205] = {
					["type"] = "BUFF",
					["source"] = "Syrìo-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[84714] = {
					["source"] = "Elyk-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[202164] = {
					["type"] = "BUFF",
					["source"] = "Fanadian-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[8004] = {
					["source"] = "Greeblik-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[342181] = {
					["type"] = "BUFF",
					["source"] = "Mistgarr",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[264689] = {
					["type"] = "DEBUFF",
					["source"] = "Alecticia-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[344739] = {
					["type"] = "BUFF",
					["source"] = "Atal'ai Deathwalker's Spirit",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 170483,
				},
				[121536] = {
					["source"] = "Silkysilky-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[345251] = {
					["source"] = "Jesstara-Thunderlord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[190784] = {
					["source"] = "Lyselos-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[83244] = {
					["source"] = "Honiahaka-Perenolde",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[81262] = {
					["type"] = "BUFF",
					["source"] = "Efflorescence",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 47649,
				},
				[322746] = {
					["type"] = "DEBUFF",
					["encounterID"] = 2395,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[768] = {
					["type"] = "BUFF",
					["source"] = "Sutarman-Frostmourne",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[197690] = {
					["type"] = "BUFF",
					["source"] = "Bghero-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[311494] = {
					["type"] = "BUFF",
					["source"] = "Miltani-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[192106] = {
					["type"] = "BUFF",
					["source"] = "Lokobamf-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[317920] = {
					["type"] = "BUFF",
					["source"] = "Ketchikan-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[311495] = {
					["type"] = "BUFF",
					["source"] = "Strive-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[203277] = {
					["type"] = "BUFF",
					["source"] = "Cruckyocouch-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[292361] = {
					["type"] = "BUFF",
					["source"] = "Zalukala-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[23161] = {
					["type"] = "BUFF",
					["source"] = "Xivara-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[311497] = {
					["type"] = "BUFF",
					["source"] = "Masliri-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[292363] = {
					["type"] = "BUFF",
					["source"] = "Sanguilor-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[154797] = {
					["type"] = "BUFF",
					["source"] = "Mistgarr",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[2383] = {
					["type"] = "BUFF",
					["source"] = "Zalukala-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[311499] = {
					["type"] = "BUFF",
					["source"] = "Lyselos-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[164273] = {
					["type"] = "BUFF",
					["source"] = "Mytae-WyrmrestAccord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
			},
			["aura_frame1_anchor"] = {
				["y"] = 8,
				["side"] = 1,
			},
			["aura_timer_text_font"] = "Accidental Presidency",
			["aura_height"] = 12,
			["non_targeted_alpha_enabled"] = true,
			["cast_statusbar_bgtexture"] = "Melli",
			["saved_cvars"] = {
				["ShowClassColorInNameplate"] = "1",
				["nameplateOverlapV"] = "1.6000000238419",
				["ShowNamePlateLoseAggroFlash"] = "1",
				["nameplateShowEnemyMinus"] = "1",
				["NamePlateClassificationScale"] = "1",
				["nameplateShowFriendlyTotems"] = "0",
				["nameplatePersonalHideDelaySeconds"] = "0.2",
				["nameplateShowFriendlyPets"] = "0",
				["nameplatePersonalShowInCombat"] = "1",
				["nameplatePersonalShowWithTarget"] = "0",
				["nameplateResourceOnTarget"] = "0",
				["nameplateShowAll"] = "1",
				["nameplateMaxDistance"] = "100",
				["nameplateShowFriendlyMinions"] = "0",
				["nameplateSelfScale"] = "1.0",
				["nameplateTargetBehindMaxDistance"] = "30",
				["nameplateShowEnemies"] = "1",
				["NamePlateVerticalScale"] = "1",
				["nameplateShowSelf"] = "0",
				["nameplateSelfTopInset"] = "0.5",
				["nameplateMotionSpeed"] = "0.05",
				["nameplateGlobalScale"] = "1.0",
				["nameplateShowEnemyMinions"] = "1",
				["nameplateShowFriendlyNPCs"] = "0",
				["nameplateSelectedScale"] = "1.3499999046326",
				["nameplateShowFriends"] = "0",
				["nameplateMotion"] = "1",
				["nameplateMinScale"] = "1",
				["nameplateOtherTopInset"] = "0.085",
				["nameplateSelfBottomInset"] = "0.2",
				["nameplateTargetRadialPosition"] = "1",
				["nameplateShowFriendlyGuardians"] = "0",
				["NamePlateHorizontalScale"] = "1",
				["nameplateLargeTopInset"] = "0.085",
				["nameplateOccludedAlphaMult"] = "1",
				["nameplateSelfAlpha"] = "0.75",
				["nameplatePersonalShowAlways"] = "0",
			},
			["login_counter"] = 3261,
			["extra_icon_caster_name"] = false,
			["click_space_friendly"] = {
				120, -- [1]
				20, -- [2]
			},
			["aura_stack_font"] = "Accidental Presidency",
			["OptionsPanelDB"] = {
				["PlaterOptionsPanelFrame"] = {
					["scale"] = 1,
				},
			},
			["target_highlight_texture"] = "Interface\\AddOns\\Plater\\images\\selection_indicator2",
			["hover_highlight_alpha"] = 0.1499999910593033,
			["plate_config"] = {
				["player"] = {
					["spellpercent_text_font"] = "Expressway",
					["level_text_font"] = "Accidental Presidency",
					["actorname_text_font"] = "Accidental Presidency",
					["big_actortitle_text_font"] = "Accidental Presidency",
					["spellname_text_font"] = "Expressway",
					["click_through"] = true,
					["power_percent_text_font"] = "Expressway",
					["power_percent_text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
					},
					["percent_text_font"] = "Expressway",
					["big_actorname_text_font"] = "Accidental Presidency",
				},
				["friendlyplayer"] = {
					["big_actorname_text_size"] = 10,
					["spellpercent_text_font"] = "Expressway",
					["show_guild_name"] = true,
					["level_text_size"] = 8,
					["actorname_use_class_color"] = true,
					["cast"] = {
						120, -- [1]
					},
					["spellpercent_text_anchor"] = {
						["x"] = 1,
					},
					["big_actorname_text_shadow_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["spellpercent_text_outline"] = "NONE",
					["level_text_font"] = "Friz Quadrata TT",
					["actorname_text_font"] = "Expressway",
					["big_actorname_text_shadow_color_offset"] = {
						1, -- [1]
						-1, -- [2]
					},
					["mana_incombat"] = {
						nil, -- [1]
						4, -- [2]
					},
					["all_names"] = true,
					["big_actortitle_text_outline"] = "OUTLINE",
					["actorname_text_spacing"] = 7,
					["quest_color_enemy"] = {
						1, -- [1]
						0.369, -- [2]
						0, -- [3]
					},
					["only_thename"] = true,
					["big_actortitle_text_font"] = "Friz Quadrata TT",
					["percent_text_ooc"] = true,
					["level_text_anchor"] = {
						["y"] = -2.459999084472656,
						["side"] = 11,
					},
					["big_actortitle_text_shadow_color_offset"] = {
						1, -- [1]
						-1, -- [2]
					},
					["cast_incombat"] = {
						120, -- [1]
						8, -- [2]
					},
					["quest_enabled"] = true,
					["spellname_text_size"] = 9,
					["spellname_text_anchor"] = {
						["x"] = 3.409996032714844,
						["side"] = 10,
					},
					["big_actortitle_text_shadow_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["percent_text_anchor"] = {
						["y"] = -2,
						["x"] = 1.400001525878906,
						["side"] = 10,
					},
					["spellname_text_font"] = "Expressway",
					["big_actorname_text_outline"] = "OUTLINE",
					["quest_color_neutral"] = {
						1, -- [1]
						0.65, -- [2]
						0, -- [3]
					},
					["actorname_text_size"] = 8,
					["big_actorname_text_font"] = "Friz Quadrata TT",
					["spellpercent_text_size"] = 9,
					["big_actortitle_text_size"] = 10,
					["level_text_alpha"] = 1,
					["spellpercent_text_enabled"] = true,
					["spellname_text_color"] = {
						0.95294117647059, -- [1]
						[3] = 0.9921568627451,
					},
					["percent_text_font"] = "Expressway",
					["buff_frame_y_offset"] = 0,
					["percent_text_outline"] = "NONE",
					["percent_text_size"] = 8,
					["power_percent_text_font"] = "Accidental Presidency",
					["health_incombat"] = {
						120, -- [1]
						14, -- [2]
					},
					["health"] = {
						120, -- [1]
						14, -- [2]
					},
					["percent_show_health"] = true,
					["actorname_text_anchor"] = {
						["y"] = -3,
						["x"] = 1.699996948242188,
						["side"] = 1,
					},
					["percent_text_enabled"] = true,
					["mana"] = {
						nil, -- [1]
						4, -- [2]
					},
				},
				["friendlynpc"] = {
					["big_actorname_text_size"] = 10,
					["spellpercent_text_font"] = "Expressway",
					["level_text_size"] = 8,
					["cast"] = {
						120, -- [1]
						8, -- [2]
					},
					["spellpercent_text_anchor"] = {
						["x"] = 1,
					},
					["enabled"] = false,
					["spellpercent_text_outline"] = "NONE",
					["level_text_font"] = "Friz Quadrata TT",
					["spellname_text_color"] = {
						0.95294117647059, -- [1]
						[3] = 0.9921568627451,
					},
					["actorname_text_outline"] = "OUTLINE",
					["actorname_text_spacing"] = 7,
					["quest_color_enemy"] = {
						1, -- [1]
						0.369, -- [2]
						0, -- [3]
					},
					["big_actortitle_text_font"] = "Friz Quadrata TT",
					["spellpercent_text_size"] = 9,
					["level_text_anchor"] = {
						["y"] = -2.459999084472656,
						["side"] = 11,
					},
					["cast_incombat"] = {
						nil, -- [1]
						8, -- [2]
					},
					["percent_text_enabled"] = true,
					["spellname_text_anchor"] = {
						["x"] = 3.409996032714844,
						["side"] = 10,
					},
					["percent_text_anchor"] = {
						["y"] = -2,
						["x"] = 1.400001525878906,
						["side"] = 10,
					},
					["spellname_text_font"] = "Expressway",
					["only_names"] = false,
					["quest_color_neutral"] = {
						1, -- [1]
						0.65, -- [2]
						0, -- [3]
					},
					["actorname_text_size"] = 8,
					["spellname_text_size"] = 9,
					["big_actorname_text_font"] = "Friz Quadrata TT",
					["big_actortitle_text_size"] = 10,
					["percent_text_ooc"] = true,
					["level_text_alpha"] = 1,
					["spellpercent_text_enabled"] = true,
					["percent_text_font"] = "Expressway",
					["percent_text_outline"] = "NONE",
					["actorname_text_font"] = "Expressway",
					["power_percent_text_font"] = "Accidental Presidency",
					["health_incombat"] = {
						nil, -- [1]
						14, -- [2]
					},
					["health"] = {
						120, -- [1]
						14, -- [2]
					},
					["actorname_text_anchor"] = {
						["y"] = -3,
						["x"] = 1.699996948242188,
						["side"] = 1,
					},
					["percent_show_health"] = true,
					["percent_text_size"] = 8,
				},
				["enemynpc"] = {
					["spellpercent_text_font"] = "Expressway",
					["cast"] = {
						120, -- [1]
						8, -- [2]
					},
					["spellpercent_text_anchor"] = {
						["x"] = -1,
					},
					["spellname_text_outline"] = "NONE",
					["spellpercent_text_outline"] = "NONE",
					["level_text_font"] = "Friz Quadrata TT",
					["percent_text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
					},
					["spellname_text_color"] = {
						0.95294117647059, -- [1]
						[3] = 0.9921568627451,
					},
					["actorname_text_outline"] = "OUTLINE",
					["actorname_text_spacing"] = 7,
					["big_actortitle_text_font"] = "Friz Quadrata TT",
					["level_text_anchor"] = {
						["y"] = -2.459999084472656,
						["side"] = 11,
					},
					["cast_incombat"] = {
						nil, -- [1]
						8, -- [2]
					},
					["spellname_text_anchor"] = {
						["y"] = 0.1999969482421875,
						["x"] = 3.409996032714844,
						["side"] = 10,
					},
					["percent_text_anchor"] = {
						["y"] = -2,
						["x"] = 1.400001525878906,
						["side"] = 10,
					},
					["spellname_text_font"] = "Expressway",
					["big_actorname_text_font"] = "Friz Quadrata TT",
					["spellpercent_text_size"] = 9,
					["actorname_text_anchor"] = {
						["y"] = -3,
						["x"] = 1.699996948242188,
						["side"] = 1,
					},
					["percent_text_size"] = 8,
					["percent_text_font"] = "Expressway",
					["percent_text_outline"] = "NONE",
					["actorname_text_size"] = 8,
					["health_incombat"] = {
						nil, -- [1]
						14, -- [2]
					},
					["health"] = {
						120, -- [1]
						14, -- [2]
					},
					["power_percent_text_font"] = "Accidental Presidency",
					["level_text_alpha"] = 1,
					["actorname_text_font"] = "Expressway",
					["spellname_text_size"] = 9,
					["level_text_enabled"] = false,
				},
				["global_health_width"] = 120,
				["enemyplayer"] = {
					["spellpercent_text_font"] = "Expressway",
					["level_text_size"] = 8,
					["cast"] = {
						120, -- [1]
						8, -- [2]
					},
					["spellpercent_text_anchor"] = {
						["x"] = -1,
					},
					["spellpercent_text_outline"] = "NONE",
					["level_text_font"] = "Friz Quadrata TT",
					["percent_text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
					},
					["spellname_text_color"] = {
						0.95294117647059, -- [1]
						[3] = 0.9921568627451,
					},
					["mana_incombat"] = {
						120, -- [1]
						1, -- [2]
					},
					["all_names"] = true,
					["actorname_text_outline"] = "OUTLINE",
					["actorname_text_spacing"] = 7,
					["quest_color_enemy"] = {
						1, -- [1]
						0.369, -- [2]
						0, -- [3]
					},
					["big_actortitle_text_font"] = "Friz Quadrata TT",
					["spellpercent_text_size"] = 9,
					["level_text_anchor"] = {
						["y"] = -2.459999084472656,
						["side"] = 11,
					},
					["cast_incombat"] = {
						nil, -- [1]
						8, -- [2]
					},
					["spellname_text_anchor"] = {
						["y"] = 0.1999969482421875,
						["x"] = 3.409996032714844,
						["side"] = 10,
					},
					["percent_text_anchor"] = {
						["y"] = -2,
						["x"] = 1.400001525878906,
						["side"] = 10,
					},
					["power_percent_text_font"] = "Accidental Presidency",
					["spellname_text_font"] = "Expressway",
					["quest_color_neutral"] = {
						1, -- [1]
						0.65, -- [2]
						0, -- [3]
					},
					["mana"] = {
						120, -- [1]
						1, -- [2]
					},
					["big_actorname_text_font"] = "Friz Quadrata TT",
					["big_actorname_text_size"] = 10,
					["level_text_alpha"] = 1,
					["percent_text_size"] = 8,
					["big_actortitle_text_size"] = 10,
					["percent_text_font"] = "Expressway",
					["quest_enabled"] = true,
					["actorname_text_font"] = "Avant Garde",
					["health_incombat"] = {
						nil, -- [1]
						14, -- [2]
					},
					["health"] = {
						120, -- [1]
						14, -- [2]
					},
					["actorname_text_anchor"] = {
						["y"] = -3,
						["x"] = 1.699996948242188,
						["side"] = 1,
					},
					["spellname_text_size"] = 9,
					["percent_text_outline"] = "NONE",
					["actorname_text_size"] = 8,
					["level_text_enabled"] = false,
				},
				["global_health_height"] = 14,
			},
			["aura_y_offset"] = 8,
			["indicator_scale"] = 0.75,
			["npc_colors"] = {
				[131670] = {
					true, -- [1]
					false, -- [2]
					"palegreen", -- [3]
				},
				[129602] = {
					true, -- [1]
					false, -- [2]
					"navajowhite", -- [3]
				},
				[134284] = {
					true, -- [1]
					false, -- [2]
					"lightskyblue", -- [3]
				},
				[133870] = {
					true, -- [1]
					false, -- [2]
					"lightcoral", -- [3]
				},
				[134157] = {
					true, -- [1]
					false, -- [2]
					"peru", -- [3]
				},
				[136006] = {
					false, -- [1]
					false, -- [2]
					"blue", -- [3]
				},
				[132532] = {
					true, -- [1]
					false, -- [2]
					"palegreen", -- [3]
				},
				[144071] = {
					true, -- [1]
					false, -- [2]
					"lightskyblue", -- [3]
				},
				[134158] = {
					true, -- [1]
					false, -- [2]
					"navajowhite", -- [3]
				},
				[136549] = {
					true, -- [1]
					false, -- [2]
					"lightcoral", -- [3]
				},
				[134701] = {
					true, -- [1]
					false, -- [2]
					"maroon", -- [3]
				},
				[136295] = {
					true, -- [1]
					false, -- [2]
					"peru", -- [3]
				},
				[136934] = {
					true, -- [1]
					false, -- [2]
					"navajowhite", -- [3]
				},
				[134990] = {
					true, -- [1]
					false, -- [2]
					"honeydew", -- [3]
				},
				[128967] = {
					true, -- [1]
					false, -- [2]
					"palegreen", -- [3]
				},
				[138465] = {
					true, -- [1]
					false, -- [2]
					"lightcoral", -- [3]
				},
				[134417] = {
					true, -- [1]
					false, -- [2]
					"lightskyblue", -- [3]
				},
				[129366] = {
					true, -- [1]
					false, -- [2]
					"goldenrod", -- [3]
				},
				[139422] = {
					true, -- [1]
					false, -- [2]
					"lightskyblue", -- [3]
				},
				[136139] = {
					true, -- [1]
					false, -- [2]
					"peru", -- [3]
				},
				[137478] = {
					true, -- [1]
					false, -- [2]
					"lightskyblue", -- [3]
				},
				[133685] = {
					true, -- [1]
					false, -- [2]
					"plum", -- [3]
				},
				[131677] = {
					true, -- [1]
					false, -- [2]
					"lightskyblue", -- [3]
				},
				[134514] = {
					true, -- [1]
					false, -- [2]
					"lightgreen", -- [3]
				},
				[136076] = {
					true, -- [1]
					false, -- [2]
					"lightcoral", -- [3]
				},
				[127757] = {
					true, -- [1]
					false, -- [2]
					"lightcoral", -- [3]
				},
				[137511] = {
					true, -- [1]
					false, -- [2]
					"navajowhite", -- [3]
				},
				[137830] = {
					true, -- [1]
					false, -- [2]
					"navajowhite", -- [3]
				},
				[129367] = {
					true, -- [1]
					false, -- [2]
					"honeydew", -- [3]
				},
				[130435] = {
					false, -- [1]
					false, -- [2]
					"magenta", -- [3]
				},
				[133432] = {
					true, -- [1]
					false, -- [2]
					"lightskyblue", -- [3]
				},
				[128969] = {
					true, -- [1]
					false, -- [2]
					"goldenrod", -- [3]
				},
				[139425] = {
					false, -- [1]
					false, -- [2]
					"honeydew", -- [3]
				},
				[132126] = {
					true, -- [1]
					false, -- [2]
					"honeydew", -- [3]
				},
				[130404] = {
					true, -- [1]
					false, -- [2]
					"peru", -- [3]
				},
				[133593] = {
					true, -- [1]
					false, -- [2]
					"honeydew", -- [3]
				},
				[131585] = {
					true, -- [1]
					false, -- [2]
					"navajowhite", -- [3]
				},
				[133912] = {
					true, -- [1]
					false, -- [2]
					"dodgerblue", -- [3]
				},
				[135474] = {
					true, -- [1]
					false, -- [2]
					"dodgerblue", -- [3]
				},
				[131586] = {
					true, -- [1]
					false, -- [2]
					"peru", -- [3]
				},
				[134232] = {
					true, -- [1]
					false, -- [2]
					"goldenrod", -- [3]
				},
				[129369] = {
					true, -- [1]
					false, -- [2]
					"lightsalmon", -- [3]
				},
				[127106] = {
					true, -- [1]
					false, -- [2]
					"peru", -- [3]
				},
				[131587] = {
					true, -- [1]
					false, -- [2]
					"peru", -- [3]
				},
				[137484] = {
					true, -- [1]
					false, -- [2]
					"lightskyblue", -- [3]
				},
				[137516] = {
					true, -- [1]
					false, -- [2]
					"lightsalmon", -- [3]
				},
				[130485] = {
					true, -- [1]
					false, -- [2]
					"peru", -- [3]
				},
				[131492] = {
					true, -- [1]
					false, -- [2]
					"lightskyblue", -- [3]
				},
				[129529] = {
					true, -- [1]
					false, -- [2]
					"goldenrod", -- [3]
				},
				[137517] = {
					true, -- [1]
					false, -- [2]
					"peru", -- [3]
				},
				[137103] = {
					true, -- [1]
					false, -- [2]
					"lightsalmon", -- [3]
				},
				[130661] = {
					true, -- [1]
					false, -- [2]
					"lightgreen", -- [3]
				},
				[138187] = {
					true, -- [1]
					false, -- [2]
					"paleturquoise", -- [3]
				},
				[134139] = {
					true, -- [1]
					false, -- [2]
					"lightskyblue", -- [3]
				},
				[137486] = {
					true, -- [1]
					false, -- [2]
					"lightskyblue", -- [3]
				},
				[131685] = {
					true, -- [1]
					false, -- [2]
					"lightskyblue", -- [3]
				},
				[129227] = {
					false, -- [1]
					false, -- [2]
					"maroon", -- [3]
				},
				[134331] = {
					true, -- [1]
					false, -- [2]
					"lightskyblue", -- [3]
				},
				[138061] = {
					false, -- [1]
					false, -- [2]
					"magenta", -- [3]
				},
				[127315] = {
					true, -- [1]
					false, -- [2]
					"plum", -- [3]
				},
				[134364] = {
					true, -- [1]
					false, -- [2]
					"honeydew", -- [3]
				},
				[133345] = {
					true, -- [1]
					false, -- [2]
					"goldenrod", -- [3]
				},
				[129547] = {
					true, -- [1]
					false, -- [2]
					"olivedrab", -- [3]
				},
				[134174] = {
					true, -- [1]
					false, -- [2]
					"honeydew", -- [3]
				},
				[137521] = {
					true, -- [1]
					false, -- [2]
					"cornflowerblue", -- [3]
				},
				[138063] = {
					false, -- [1]
					false, -- [2]
					"blue", -- [3]
				},
				[141283] = {
					true, -- [1]
					false, -- [2]
					"navajowhite", -- [3]
				},
				[136470] = {
					true, -- [1]
					false, -- [2]
					"honeydew", -- [3]
				},
				[138064] = {
					false, -- [1]
					false, -- [2]
					"blue", -- [3]
				},
				[131817] = {
					false, -- [1]
					false, -- [2]
					"magenta", -- [3]
				},
				[141284] = {
					true, -- [1]
					false, -- [2]
					"lightskyblue", -- [3]
				},
				[131818] = {
					false, -- [1]
					false, -- [2]
					"plum", -- [3]
				},
				[141285] = {
					true, -- [1]
					false, -- [2]
					"lightgreen", -- [3]
				},
				[136249] = {
					true, -- [1]
					false, -- [2]
					"plum", -- [3]
				},
				[131436] = {
					true, -- [1]
					false, -- [2]
					"navajowhite", -- [3]
				},
				[129788] = {
					true, -- [1]
					false, -- [2]
					"honeydew", -- [3]
				},
				[136186] = {
					true, -- [1]
					false, -- [2]
					"honeydew", -- [3]
				},
				[135007] = {
					true, -- [1]
					false, -- [2]
					"lightskyblue", -- [3]
				},
				[134338] = {
					true, -- [1]
					false, -- [2]
					"navajowhite", -- [3]
				},
				[127111] = {
					true, -- [1]
					false, -- [2]
					"lightskyblue", -- [3]
				},
				[135167] = {
					true, -- [1]
					false, -- [2]
					"peru", -- [3]
				},
				[128434] = {
					true, -- [1]
					false, -- [2]
					"palegreen", -- [3]
				},
				[135263] = {
					true, -- [1]
					false, -- [2]
					"maroon", -- [3]
				},
				[139949] = {
					true, -- [1]
					false, -- [2]
					"honeydew", -- [3]
				},
				[122984] = {
					true, -- [1]
					false, -- [2]
					"peru", -- [3]
				},
				[128435] = {
					false, -- [1]
					false, -- [2]
					"aqua", -- [3]
				},
				[135329] = {
					true, -- [1]
					false, -- [2]
					"plum", -- [3]
				},
				[134150] = {
					true, -- [1]
					false, -- [2]
					"navajowhite", -- [3]
				},
				[122969] = {
					true, -- [1]
					false, -- [2]
					"honeydew", -- [3]
				},
				[134629] = {
					true, -- [1]
					false, -- [2]
					"navajowhite", -- [3]
				},
				[136005] = {
					false, -- [1]
					false, -- [2]
					"blue", -- [3]
				},
				[135241] = {
					true, -- [1]
					false, -- [2]
					"peru", -- [3]
				},
				[135235] = {
					true, -- [1]
					false, -- [2]
					"goldenrod", -- [3]
				},
				[133482] = {
					true, -- [1]
					false, -- [2]
					"maroon", -- [3]
				},
				[134418] = {
					true, -- [1]
					false, -- [2]
					"dodgerblue", -- [3]
				},
				[134144] = {
					true, -- [1]
					false, -- [2]
					"lightgreen", -- [3]
				},
				[134012] = {
					true, -- [1]
					false, -- [2]
					"lightsalmon", -- [3]
				},
				[122972] = {
					true, -- [1]
					false, -- [2]
					"lightsalmon", -- [3]
				},
				[126928] = {
					false, -- [1]
					false, -- [2]
					"navajowhite", -- [3]
				},
				[135204] = {
					true, -- [1]
					false, -- [2]
					"honeydew", -- [3]
				},
				[131666] = {
					true, -- [1]
					false, -- [2]
					"honeydew", -- [3]
				},
				[129600] = {
					true, -- [1]
					false, -- [2]
					"lightskyblue", -- [3]
				},
				[130488] = {
					true, -- [1]
					false, -- [2]
					"lightsalmon", -- [3]
				},
				[133436] = {
					true, -- [1]
					false, -- [2]
					"lightskyblue", -- [3]
				},
				[134599] = {
					true, -- [1]
					false, -- [2]
					"lightskyblue", -- [3]
				},
				[133852] = {
					true, -- [1]
					false, -- [2]
					"olivedrab", -- [3]
				},
				[131858] = {
					true, -- [1]
					false, -- [2]
					"dodgerblue", -- [3]
				},
				[133430] = {
					true, -- [1]
					false, -- [2]
					"cornflowerblue", -- [3]
				},
				[137713] = {
					true, -- [1]
					false, -- [2]
					"paleturquoise", -- [3]
				},
				[136214] = {
					true, -- [1]
					false, -- [2]
					"plum", -- [3]
				},
				[135258] = {
					false, -- [1]
					false, -- [2]
					"peru", -- [3]
				},
				[136353] = {
					true, -- [1]
					false, -- [2]
					"royalblue", -- [3]
				},
				[134600] = {
					true, -- [1]
					false, -- [2]
					"peru", -- [3]
				},
				[138255] = {
					true, -- [1]
					false, -- [2]
					"maroon", -- [3]
				},
				[126918] = {
					true, -- [1]
					false, -- [2]
					"lightskyblue", -- [3]
				},
				[133835] = {
					true, -- [1]
					false, -- [2]
					"goldenrod", -- [3]
				},
				[135365] = {
					true, -- [1]
					false, -- [2]
					"plum", -- [3]
				},
				[122971] = {
					false, -- [1]
					false, -- [2]
					"magenta", -- [3]
				},
				[126919] = {
					true, -- [1]
					false, -- [2]
					"dodgerblue", -- [3]
				},
				[137716] = {
					false, -- [1]
					false, -- [2]
					"blue", -- [3]
				},
				[134137] = {
					true, -- [1]
					false, -- [2]
					"dodgerblue", -- [3]
				},
				[129370] = {
					true, -- [1]
					false, -- [2]
					"lightskyblue", -- [3]
				},
				[132491] = {
					true, -- [1]
					false, -- [2]
					"palegreen", -- [3]
				},
				[129559] = {
					true, -- [1]
					false, -- [2]
					"navajowhite", -- [3]
				},
				[135239] = {
					true, -- [1]
					false, -- [2]
					"paleturquoise", -- [3]
				},
				[134251] = {
					true, -- [1]
					false, -- [2]
					"honeydew", -- [3]
				},
				[125977] = {
					true, -- [1]
					false, -- [2]
					"plum", -- [3]
				},
				[130436] = {
					false, -- [1]
					false, -- [2]
					"aqua", -- [3]
				},
				[122973] = {
					true, -- [1]
					false, -- [2]
					"lightskyblue", -- [3]
				},
			},
			["cast_statusbar_spark_half"] = true,
			["hook_data"] = {
				{
					["Enabled"] = false,
					["Revision"] = 141,
					["Options"] = {
					},
					["LastHookEdited"] = "",
					["Author"] = "Ahwa-Azralon",
					["OptionsValues"] = {
					},
					["Desc"] = "Adds extra effects to execute range and allow to setup two execute ranges for classes with execute when the unit has almost full healh. See the constructor script for options.",
					["Hooks"] = {
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --execute detection, if true the script will handle the execute percent\n    --while false Plater will automatically trigger the execute range\n    --you only want to set this to true in case of Plater not detecting the execute range correctly\n    envTable.UseCustomExecutePercent = true\n    --execute percent, if not detecting automatic, this is the percent to active the execute range\n    --use from zero to one, 0.20 is equal to 20% of the unit life\n    envTable.ExecutePercent = 0.20\n    \n    --second execute range (UseCustomExecutePercent must be enabled)\n    envTable.SecondRangeStart = 0.999\n    envTable.SecondRangeEnd = 0.8\n    \n    --allow this script to change the nameplate color when the unit is in execute range\n    envTable.CanChangeColor = true\n    --change the health bar color to this color when the unit is in execute range\n    --color can be set as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}\n    envTable.ExecuteColor = \"green\"\n    \n    --border color\n    envTable.CanChangeBorderColor = false\n    envTable.BorderColor = \"red\"\n    \n    --hide the default health divisor and the health execute indicator\n    envTable.HideHealthDivisor = false\n    --if not hidden, adjust the health divisor settings and the health execute indicator\n    envTable.HealthDivisorAlpha = 0.5\n    envTable.HealthDivisorColor = \"white\"\n    envTable.HealthExecuteIndicatorAlpha = 0.15\n    envTable.HealthExecuteIndicatorColor = \"darkred\"\n    \n    \n    --private (internal functions)\n    do\n        function envTable.UnitInExecuteRange (unitFrame, divisorPercent)\n            --check if can change the execute color\n            if (envTable.CanChangeColor) then\n                Plater.SetNameplateColor (unitFrame, envTable.ExecuteColor)\n            end\n            \n            if (envTable.CanChangeBorderColor) then\n                Plater.SetBorderColor (unitFrame, envTable.BorderColor)\n            end\n            \n            if (envTable.HideHealthDivisor) then\n                unitFrame.healthBar.healthCutOff:Hide() \n                unitFrame.healthBar.executeRange:Hide()\n                \n            else\n                envTable.UpdateHealthDivisor (unitFrame, divisorPercent)\n                \n            end\n        end\n        \n        function envTable.UpdateHealthDivisor (unitFrame, divisorPercent)\n            local healthBar = unitFrame.healthBar\n            \n            healthBar.healthCutOff:Show()\n            healthBar.healthCutOff:SetVertexColor (DetailsFramework:ParseColors (envTable.HealthDivisorColor))\n            healthBar.healthCutOff:SetAlpha (envTable.HealthDivisorAlpha)\n            \n            healthBar.executeRange:Show()\n            healthBar.executeRange:SetVertexColor (DetailsFramework:ParseColors (envTable.HealthExecuteIndicatorColor))\n            healthBar.executeRange:SetAlpha (envTable.HealthExecuteIndicatorAlpha)\n            \n            if (envTable.UseCustomExecutePercent) then\n                healthBar.healthCutOff:ClearAllPoints()\n                healthBar.executeRange:ClearAllPoints()\n                \n                healthBar.healthCutOff:SetSize (healthBar:GetHeight(), healthBar:GetHeight())\n                healthBar.healthCutOff:SetPoint (\"center\", healthBar, \"left\", healthBar:GetWidth() * divisorPercent, 0)\n                \n                healthBar.executeRange:SetTexCoord (0, envTable.ExecutePercent, 0, 1)\n                healthBar.executeRange:SetHeight (healthBar:GetHeight())\n                healthBar.executeRange:SetPoint (\"left\", healthBar, \"left\", 0, 0)\n                healthBar.executeRange:SetPoint (\"right\", healthBar.healthCutOff, \"center\")\n            end\n            \n        end\n    end\n    \nend",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (envTable.UseCustomExecutePercent) then\n        \n        --manual detection\n        local healthBar = unitFrame.healthBar\n        local percent = healthBar.CurrentHealth / healthBar.CurrentHealthMax\n        \n        if (percent <= envTable.ExecutePercent) then\n            envTable.UnitInExecuteRange (unitFrame, envTable.ExecutePercent)\n            envTable.InExecuteRange = true\n            \n        elseif (percent < envTable.SecondRangeStart and percent >= envTable.SecondRangeEnd) then\n            envTable.UnitInExecuteRange (unitFrame, envTable.SecondRangeEnd)\n            envTable.InExecuteRange = true\n            \n        else\n            if (envTable.InExecuteRange) then\n                unitFrame.healthBar.healthCutOff:Hide() \n                unitFrame.healthBar.executeRange:Hide()\n                Plater.RefreshNameplateColor (unitFrame)\n                Plater.SetBorderColor (unitFrame)\n                envTable.InExecuteRange = false\n            end\n        end\n        \n    else\n        \n        --auto detection\n        if (unitFrame.InExecuteRange) then\n            envTable.UnitInExecuteRange (unitFrame, 0)\n        end\n        \n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
					},
					["Prio"] = 99,
					["Time"] = 1596903792,
					["PlaterCore"] = 1,
					["HooksTemp"] = {
					},
					["Name"] = "Advanced Execute Range",
					["Icon"] = 135358,
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["affix"] = {
						},
						["race"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
				}, -- [1]
				{
					["Enabled"] = true,
					["Revision"] = 45,
					["Options"] = {
					},
					["LastHookEdited"] = "Constructor",
					["Author"] = "Ditador-Azralon",
					["OptionsValues"] = {
					},
					["Desc"] = "Change the color of the aura timer by it's time left",
					["Hooks"] = {
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --colors for each time bracket\n    envTable.Colors = {\n        critical = \"red\",\n        warning = \"yellow\",\n        okay = \"white\",\n    }\n    \n    --time amount to enter in warning or critical state\n    envTable.Timers = {\n        critical = 4.9,\n        warning = 8,\n    }\n    \nend\n\n\n",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    local auras = unitFrame.BuffFrame.PlaterBuffList\n    \n    for _, auraIcon in ipairs (auras) do\n        if (auraIcon:IsVisible()) then\n            if (auraIcon.RemainingTime < envTable.Timers.critical) then\n                Plater:SetFontColor (auraIcon.TimerText, envTable.Colors.critical)\n                \n            elseif (auraIcon.RemainingTime < envTable.Timers.warning) then\n                Plater:SetFontColor (auraIcon.TimerText, envTable.Colors.warning)\n                \n            else\n                Plater:SetFontColor (auraIcon.TimerText, envTable.Colors.okay)\n            end \n        end\n        \n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
					},
					["Prio"] = 99,
					["Time"] = 1600015324,
					["PlaterCore"] = 1,
					["HooksTemp"] = {
					},
					["Name"] = "Paint Aura Timers",
					["Icon"] = "Interface\\Timer\\Challenges-Logo",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["affix"] = {
						},
						["race"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
				}, -- [2]
				{
					["Enabled"] = true,
					["Revision"] = 130,
					["Options"] = {
					},
					["LastHookEdited"] = "",
					["Author"] = "????????-Illidan",
					["OptionsValues"] = {
					},
					["Desc"] = "Config aura borders",
					["Hooks"] = {
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --border thickness\n    local size = 1 \n    \n    for index, auraIcon in ipairs (unitFrame.BuffFrame.PlaterBuffList) do\n        if (auraIcon:IsShown()) then\n            \n            if (not auraIcon.PixelPerfectBorder) then\n                auraIcon.PixelPerfectBorder = CreateFrame (\"frame\", nil, auraIcon, \"NamePlateFullBorderTemplate\")\n            end\n            \n            local r, g, b = auraIcon:GetBackdropBorderColor()\n            auraIcon:SetBackdropBorderColor (0, 0, 0, 0)\n            \n            auraIcon.PixelPerfectBorder:SetVertexColor (r, g, b)\n            auraIcon.PixelPerfectBorder:SetBorderSizes (size, size, size, size)\n            auraIcon.PixelPerfectBorder:UpdateSizes()\n            \n            auraIcon.Icon:ClearAllPoints()\n            auraIcon.Icon:SetAllPoints()\n            \n            auraIcon.Border:Hide() --hide plater default border\n        end\n    end\n    \n    for index, auraIcon in ipairs (unitFrame.BuffFrame2.PlaterBuffList) do\n        if (auraIcon:IsShown()) then\n            \n            if (not auraIcon.PixelPerfectBorder) then\n                auraIcon.PixelPerfectBorder = CreateFrame (\"frame\", nil, auraIcon, \"NamePlateFullBorderTemplate\")\n            end\n            \n            local r, g, b = auraIcon:GetBackdropBorderColor()\n            auraIcon:SetBackdropBorderColor (0, 0, 0, 0)\n            \n            auraIcon.PixelPerfectBorder:SetVertexColor (r, g, b)\n            auraIcon.PixelPerfectBorder:SetBorderSizes (size, size, size, size)\n            auraIcon.PixelPerfectBorder:UpdateSizes()            \n            \n            auraIcon.Icon:ClearAllPoints()\n            auraIcon.Icon:SetAllPoints()\n            \n            auraIcon.Border:Hide() --hide plater default border\n        end\n    end    \nend",
					},
					["Prio"] = 99,
					["Time"] = 1605782247,
					["PlaterCore"] = 1,
					["HooksTemp"] = {
					},
					["Name"] = "Advanced Debuff Border",
					["Icon"] = 133006,
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["affix"] = {
						},
						["race"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
				}, -- [3]
				{
					["Enabled"] = true,
					["Revision"] = 46,
					["Options"] = {
					},
					["LastHookEdited"] = "",
					["Author"] = "????????-Illidan",
					["OptionsValues"] = {
					},
					["Desc"] = "Debuff timer show decimal values",
					["Hooks"] = {
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --minimum time left to take effect\n    envTable.MinTime = 9.999\n    \nend",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    for index, auraIcon in ipairs (unitFrame.BuffFrame.PlaterBuffList) do\n        if (auraIcon:IsShown()) then\n            if (auraIcon.RemainingTime < envTable.MinTime) then\n                auraIcon.TimerText:SetText (format (\"%.1f\", auraIcon.RemainingTime))\n            end\n        end\n    end\n    \n    for index, auraIcon in ipairs (unitFrame.BuffFrame2.PlaterBuffList) do\n        if (auraIcon:IsShown()) then\n            if (auraIcon.RemainingTime < envTable.MinTime) then            \n                auraIcon.TimerText:SetText (format (\"%.1f\", auraIcon.RemainingTime))\n            end\n        end        \n    end    \nend",
					},
					["Prio"] = 99,
					["Time"] = 1600571224,
					["PlaterCore"] = 1,
					["HooksTemp"] = {
					},
					["Name"] = "Decimal Debuff Timer",
					["Icon"] = 609811,
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["affix"] = {
						},
						["race"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
				}, -- [4]
				{
					["Enabled"] = true,
					["Revision"] = 85,
					["Options"] = {
					},
					["LastHookEdited"] = "Nameplate Updated",
					["Author"] = "?????-Illidan",
					["OptionsValues"] = {
					},
					["Desc"] = "Format Buff Special icons like the regular aura icons.",
					["Hooks"] = {
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --    if false then return end\n    \n    for _, iconFrame in ipairs (unitFrame.ExtraIconFrame.IconPool) do\n        \n        unitFrame.ExtraIconFrame.options.show_text = true\n        \n        local profile = Plater.db.profile\n        \n        Plater.SetAnchor (iconFrame.CountdownText, profile.aura_timer_text_anchor)\n        Plater:SetFontSize (iconFrame.CountdownText, profile.aura_timer_text_size)\n        Plater:SetFontFace (iconFrame.CountdownText, profile.aura_timer_text_font)\n        \n        Plater.SetFontOutlineAndShadow (iconFrame.CountdownText, profile.aura_timer_text_outline, profile.aura_timer_text_shadow_color, profile.aura_timer_text_shadow_color_offset[1], profile.aura_timer_text_shadow_color_offset[2])\n        \n        iconFrame.Cooldown:SetEdgeTexture (profile.aura_cooldown_edge_texture)\n        iconFrame.Cooldown:SetReverse (profile.aura_cooldown_reverse)\n        iconFrame.Cooldown:SetDrawSwipe (profile.aura_cooldown_show_swipe)        \n        \n    end\n    \nend",
					},
					["Prio"] = 99,
					["Time"] = 1605783246,
					["PlaterCore"] = 1,
					["HooksTemp"] = {
					},
					["Name"] = "Buff Special Mod",
					["Icon"] = 136139,
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["affix"] = {
						},
						["race"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
				}, -- [5]
				{
					["Enabled"] = true,
					["Revision"] = 17,
					["Options"] = {
					},
					["LastHookEdited"] = "",
					["Author"] = "Ditador-Azralon",
					["OptionsValues"] = {
					},
					["Desc"] = "Set the unit name to be above the target shading texture.",
					["Hooks"] = {
						["Target Changed"] = "function (self, unitId, unitFrame, envTable)\n    unitFrame.unitName:SetDrawLayer (\"overlay\", 7)\nend\n\n\n\n\n\n\n\n\n",
					},
					["Prio"] = 99,
					["Time"] = 1600015358,
					["PlaterCore"] = 1,
					["HooksTemp"] = {
					},
					["Name"] = "Unit Name Over Target Shading",
					["Icon"] = 237377,
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["affix"] = {
						},
						["race"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
				}, -- [6]
				{
					["Enabled"] = true,
					["Revision"] = 24,
					["Options"] = {
					},
					["LastHookEdited"] = "",
					["Author"] = "Ditador-Azralon",
					["OptionsValues"] = {
					},
					["Desc"] = "Set the spark height to the same size of the cast bar.",
					["Hooks"] = {
						["Cast Start"] = "function (self, unitId, unitFrame, envTable)\n    \n    self.Spark:SetHeight (self:GetHeight())\n    \nend\n\n\n",
						["Cast Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    self.Spark:SetHeight (self:GetHeight())\n    \nend\n\n\n",
					},
					["Prio"] = 99,
					["Time"] = 1605782244,
					["PlaterCore"] = 1,
					["HooksTemp"] = {
					},
					["Name"] = "Adjust Spark Size",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\spark6",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["affix"] = {
						},
						["race"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
				}, -- [7]
				{
					["Enabled"] = true,
					["Revision"] = 78,
					["Options"] = {
					},
					["LastHookEdited"] = "Constructor",
					["Author"] = "Izimode-Azralon",
					["OptionsValues"] = {
					},
					["Desc"] = "Show power bar for some units.",
					["Hooks"] = {
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --power bar options:\n    \n    --for which units it should\n    envTable.ShowForEnemyPlayers = true\n    envTable.ShowForEnemyNpcs = false\n    \n    --specific npcs, can be the npc name or npcId\n    --this list work even if the ShowForEnemyNpcs is false\n    envTable.SpecificNpcs = {\n        [\"the rock\"] = true, --npc name\n        [225] = true, --npcId\n    }\n    \n    --anchor the power bar to\n    envTable.Anchor = {\n        side = 13, --inside the healthbar, bottom side\n        x = 0, \n        y = 0,\n    }\n    \n    --power bar height\n    envTable.Height = 1\n    \n    --power bar percent text\n    envTable.PercentTextEnabled = false\n    envTable.PercentTextAnchor = {\n        side = 7, --top right\n        x = 2, \n        y = 0,\n    }\n    \n    \n    --private\n    function envTable.ShowPowerbar (unitFrame)\n        unitFrame.powerBar:SetUnit (unitFrame.unit)\n        envTable.UpdatePowerbar (unitFrame)\n    end\n    \n    function envTable.UpdatePowerbar (unitFrame)\n        local powerBar = unitFrame.powerBar\n        Plater.SetAnchor (powerBar, envTable.Anchor, unitFrame.healthBar)\n        powerBar:SetSize (unitFrame.healthBar:GetWidth(), envTable.Height)\n        \n        envTable.SavePowerBarSize (unitFrame, envTable.Height)\n        \n        if (envTable.PercentTextEnabled) then\n            powerBar.percentText:Show()\n            --copy the font from the health percent\n            Plater:SetFontFace (powerBar.percentText, Plater.GetConfig (unitFrame).percent_text_font)\n            Plater:SetFontSize (powerBar.percentText, Plater.GetConfig (unitFrame).percent_text_size)\n            Plater.SetAnchor (powerBar.percentText, envTable.PercentTextAnchor)\n        else\n            powerBar.percentText:Hide()\n        end\n    end\n    \n    function envTable.CanShowPowerBarForUnit (unitFrame)\n        --check if the is in the special list to force show\n        local forceShowPowerBar = envTable.SpecificNpcs [unitFrame.namePlateNpcId] or envTable.SpecificNpcs [unitFrame.namePlateUnitName] or envTable.SpecificNpcs [unitFrame.namePlateUnitNameLower]\n        if (forceShowPowerBar) then\n            envTable.ShowPowerbar (unitFrame)\n            \n            --check if the unit is a enemy player\n        elseif (unitFrame.ActorType == \"enemyplayer\") then\n            if (envTable.ShowForEnemyPlayers) then\n                envTable.ShowPowerbar (unitFrame)\n            end\n            \n            --check if the unit is a enemy npc\n        elseif (unitFrame.ActorType == \"enemynpc\") then\n            if (envTable.ShowForEnemyNpcs) then\n                envTable.ShowPowerbar (unitFrame)\n            end\n        end\n    end\n    \n    function envTable.SavePowerBarSize (unitFrame, height)\n        local plateConfigs = Plater.db.profile.plate_config [unitFrame.ActorType]\n        plateConfigs.mana[1] = plateConfigs.health[1]\n        plateConfigs.mana[2] = height\n        plateConfigs.mana_incombat[1] = plateConfigs.health_incombat[1]\n        plateConfigs.mana_incombat[2] = height\n    end\nend\n\n\n\n\n\n",
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    envTable.CanShowPowerBarForUnit (unitFrame)    \nend",
					},
					["Prio"] = 99,
					["Time"] = 1605782842,
					["PlaterCore"] = 1,
					["HooksTemp"] = {
					},
					["Name"] = "Power Bar",
					["Icon"] = "Interface/Addons/Plater/Media/fire_64",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["affix"] = {
						},
						["race"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
				}, -- [8]
				{
					["OptionsValues"] = {
					},
					["HooksTemp"] = {
					},
					["Hooks"] = {
						["Nameplate Created"] = "function (self, unitId, unitFrame, envTable)\n    envTable.addHook(unitFrame)\nend\n\n\n",
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    envTable.addHook(unitFrame)\nend\n\n\n",
						["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    unitFrame.healthBar.customShieldHookNeedsUpdate = true\nend",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    local hb = unitFrame.healthBar\n    if hb.customShieldHookNeedsUpdate and hb.displayedUnit then\n        hb:UNIT_MAXHEALTH()\n        hb.customShieldHookNeedsUpdate = false\n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Initialization"] = "function (modTable)\n    modTable.LibSharedMedia = LibStub:GetLibrary (\"LibSharedMedia-3.0\")\nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable, modTable)\n    \n    --settings: (changing this requires a /reload)\n    local shieldTexture = \"\"\n    --local shieldTexture = \"Details Flat\"\n    \n    \n    --init\n    local hb = unitFrame.healthBar\n    local unit = hb.displayedUnit\n    if shieldTexture and shieldTexture ~= \"\" then\n        local texture = modTable.LibSharedMedia:Fetch(\"statusbar\", shieldTexture)\n        hb.Settings.ShieldIndicatorTexture = texture or [[Interface\\RaidFrame\\Shield-Fill]]\n        hb.shieldAbsorbIndicator:SetTexture (hb.Settings.ShieldIndicatorTexture, true, true)\n    else\n        hb.Settings.ShieldIndicatorTexture = [[Interface\\RaidFrame\\Shield-Fill]]\n        hb.shieldAbsorbIndicator:SetTexture (hb.Settings.ShieldIndicatorTexture, true, true)\n    end\n    \n    -- ensure settings are up to date... workardound till fix in Plater core.\n    unitFrame.healthBar.Settings.ShowShields = Plater.db.profile.show_shield_prediction\n    \n    -- overwrite to add custom text\n    function Plater.UpdateLifePercentText (healthBar, unitId, showHealthAmount, showPercentAmount, showDecimals) -- ~health\n        \n        --get the cached health amount for performance\n        local currentHealth, maxHealth, absorb = healthBar.CurrentHealth, healthBar.CurrentHealthMax, healthBar.currentAbsorb\n        \n        if (showHealthAmount and showPercentAmount) then\n            local percent = currentHealth / maxHealth * 100\n            \n            if (showDecimals) then\n                if (percent < 10) then\n                    healthBar.lifePercent:SetText (Plater.FormatNumber (currentHealth) .. \" (\" .. format (\"%.2f\", percent) .. \"%)\")\n                    \n                elseif (percent < 99.9) then\n                    healthBar.lifePercent:SetText (Plater.FormatNumber (currentHealth) .. \" (\" .. format (\"%.1f\", percent) .. \"%)\")\n                else\n                    healthBar.lifePercent:SetText (Plater.FormatNumber (currentHealth) .. \" (100%)\")\n                end\n            else\n                healthBar.lifePercent:SetText (Plater.FormatNumber (currentHealth) .. \" (\" .. floor (percent) .. \"%)\")\n            end\n            \n        elseif (showHealthAmount) then\n            healthBar.lifePercent:SetText (Plater.FormatNumber (currentHealth))\n            \n        elseif (showPercentAmount) then\n            local percent = currentHealth / maxHealth * 100\n            \n            if (showDecimals) then\n                if (percent < 10) then\n                    healthBar.lifePercent:SetText (format (\"%.2f\", percent) .. \"%\")\n                    \n                elseif (percent < 99.9) then\n                    healthBar.lifePercent:SetText (format (\"%.1f\", percent) .. \"%\")\n                else\n                    healthBar.lifePercent:SetText (\"100%\")\n                end\n            else\n                healthBar.lifePercent:SetText (floor (percent) .. \"%\")\n            end\n            \n        else\n            healthBar.lifePercent:SetText (\"\")\n        end\n        \n        -- CUSTOM HERE --\n        if (showHealthAmount or showPercentAmount) and healthBar.currentAbsorb and healthBar.currentAbsorb > 0 then\n            healthBar.lifePercent:SetText(healthBar.lifePercent:GetText() .. \"  -  \" .. Plater.FormatNumber(healthBar.currentAbsorb))\n        end\n        -- CUSTOM END --\n    end\n    \n    \n    -- overwrite UpdateHealPrediction on the healthBar\n    function envTable.addHook(unitFrame)\n        local hb = unitFrame.healthBar\n        \n        if not hb.isCustomShieldHook then\n            --health and absorbs prediction from Plater core, reworked to integrate shields into the health bar\n            hb.UpdateHealPrediction = function (self)\n                local currentHealth = self.currentHealth\n                local currentHealthMax = self.currentHealthMax\n                local healthPercent = currentHealth / currentHealthMax\n                \n                if (not currentHealthMax or currentHealthMax <= 0) then\n                    return\n                end\n                \n                --order is: the health of the unit > damage absorb > heal absorb > incoming heal\n                local width = self:GetWidth()\n                \n                hb.shieldAbsorbIndicator:Hide()\n                hb.shieldAbsorbGlow:Hide()\n                \n                if not self.displayedUnit then return end\n                \n                if (self.Settings.ShowHealingPrediction) then\n                    --incoming heal on the unit from all sources\n                    local unitHealIncoming = UnitGetIncomingHeals (self.displayedUnit) or 0\n                    --heal absorbs\n                    local unitHealAbsorb = UnitGetTotalHealAbsorbs (self.displayedUnit) or 0\n                    \n                    if (unitHealIncoming > 0) then\n                        --calculate what is the percent of health incoming based on the max health the player has\n                        local incomingPercent = unitHealIncoming / currentHealthMax\n                        self.incomingHealIndicator:Show()\n                        self.incomingHealIndicator:SetWidth (max (1, min (width * incomingPercent, abs (healthPercent - 1) * width)))\n                        self.incomingHealIndicator:SetPoint (\"topleft\", self, \"topleft\", width * healthPercent, 0)\n                        self.incomingHealIndicator:SetPoint (\"bottomleft\", self, \"bottomleft\", width * healthPercent, 0)\n                    else\n                        self.incomingHealIndicator:Hide()\n                    end\n                    \n                    if (unitHealAbsorb > 0) then\n                        local healAbsorbPercent = unitHealAbsorb / currentHealthMax\n                        self.healAbsorbIndicator:Show()\n                        self.healAbsorbIndicator:SetWidth (max (1, min (width * healAbsorbPercent, abs (healthPercent - 1) * width)))\n                        self.healAbsorbIndicator:SetPoint (\"topleft\", self, \"topleft\", width * healthPercent, 0)\n                        self.healAbsorbIndicator:SetPoint (\"bottomleft\", self, \"bottomleft\", width * healthPercent, 0)\n                    else\n                        self.healAbsorbIndicator:Hide()\n                    end\n                end\n                \n                if (self.Settings.ShowShields) then\n                    --damage absorbs\n                    local unitDamageAbsorb = UnitGetTotalAbsorbs (self.displayedUnit) or 0\n                    self.currentAbsorb = unitDamageAbsorb\n                    \n                    if (unitDamageAbsorb > 0) then\n                        local curHealthTotal = unitDamageAbsorb + currentHealth\n                        local damageAbsorbPercent\n                        local healthPercentAbsorb\n                        if curHealthTotal > currentHealthMax then\n                            damageAbsorbPercent = unitDamageAbsorb / curHealthTotal\n                            healthPercentAbsorb = currentHealth / curHealthTotal\n                            self:SetMinMaxValues (0, curHealthTotal)\n                        else \n                            damageAbsorbPercent = unitDamageAbsorb / currentHealthMax\n                            healthPercentAbsorb = currentHealth / currentHealthMax\n                            self:SetMinMaxValues (0, currentHealthMax)\n                        end\n                        --print(healthPercentAbsorb, currentHealth, unitDamageAbsorb, damageAbsorbPercent)\n                        \n                        self.shieldAbsorbIndicator:Show()\n                        \n                        \n                        self.shieldAbsorbIndicator:SetWidth (width * damageAbsorbPercent)\n                        self.shieldAbsorbIndicator:SetPoint (\"topleft\", self, \"topleft\", width * healthPercentAbsorb, 0)\n                        self.shieldAbsorbIndicator:SetPoint (\"bottomleft\", self, \"bottomleft\", width * healthPercentAbsorb, 0)\n                        \n                        \n                    else\n                        self.shieldAbsorbIndicator:Hide()\n                    end\n                end\n                \n                hb.isCustomShieldHook = true\n            end\n            \n            if hb.displayedUnit then\n                hb.shieldAbsorbIndicator:Hide()\n                hb.shieldAbsorbGlow:Hide()\n                hb:UNIT_MAXHEALTH()\n            else\n                hb.customShieldHookNeedsUpdate = true\n            end\n            \n        end\n    end\n    \nend",
					},
					["Time"] = 1605782243,
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["affix"] = {
						},
						["race"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["url"] = "https://wago.io/VtPjNl8Mg/4",
					["Icon"] = 135940,
					["Enabled"] = true,
					["Revision"] = 1033,
					["semver"] = "1.0.3",
					["Author"] = "Elaiana-Proudmoore",
					["Desc"] = "Adds absorbs to the health bar as full health value.",
					["Prio"] = 99,
					["version"] = 4,
					["PlaterCore"] = 1,
					["Name"] = "Absorb Shields in Healthbar",
					["LastHookEdited"] = "",
					["Options"] = {
					},
				}, -- [9]
				{
					["OptionsValues"] = {
					},
					["HooksTemp"] = {
					},
					["Hooks"] = {
						["Cast Start"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.UpdateBorder (unitFrame)\n    \nend\n\n\n",
						["Destructor"] = "function (self, unitId, unitFrame, envTable)\n    if (unitFrame.castBar.CastBarBorder) then\n        unitFrame.castBar.CastBarBorder:Hide()\n    end    \nend",
						["Cast Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.UpdateBorder (unitFrame)\n    \nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings\n    \n    --hide the icon of the spell, may require /reload after changing\n    envTable.HideIcon = false\n    \n    --border settings\n    envTable.BorderThickness = 1\n    envTable.BorderColor = \"black\"\n    \n    --private\n    --update the border\n    function envTable.UpdateBorder (unitFrame)\n        local castBar = unitFrame.castBar\n        \n        local r, g, b, a = DetailsFramework:ParseColors (envTable.BorderColor)\n        castBar.CastBarBorder:SetVertexColor (r, g, b, a)\n        \n        local size = envTable.BorderThickness\n        castBar.CastBarBorder:SetBorderSizes (size, size, size, size)\n        castBar.CastBarBorder:UpdateSizes()        \n        \n        if (envTable.HideIcon) then\n            castBar.Icon:Hide()\n        end\n        \n        castBar.CastBarBorder:Show()\n    end\n    \n    --create thee border\n    if (not unitFrame.castBar.CastBarBorder) then\n        unitFrame.castBar.CastBarBorder = CreateFrame (\"frame\", nil, unitFrame.castBar, \"NamePlateFullBorderTemplate\")\n    end\n    \nend\n\n\n\n\n",
					},
					["Time"] = 1596431484,
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["affix"] = {
						},
						["race"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["url"] = "https://wago.io/szRqTPTUp/1",
					["Icon"] = 133004,
					["Enabled"] = true,
					["Revision"] = 101,
					["semver"] = "1.0.0",
					["Author"] = "Izimode-Azralon",
					["Desc"] = "Adds a pixels perfect border around the cast bar.",
					["Prio"] = 99,
					["version"] = 1,
					["PlaterCore"] = 1,
					["Name"] = "Cast Bar Border",
					["LastHookEdited"] = "",
					["Options"] = {
					},
				}, -- [10]
				{
					["OptionsValues"] = {
					},
					["HooksTemp"] = {
					},
					["Hooks"] = {
						["Cast Start"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.UpdateIconPosition (unitFrame)\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Cast Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.UpdateIconPosition (unitFrame)\n    self.ThrottleUpdate = -1\n    \nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings:\n    --show cast icon\n    envTable.ShowIcon = true\n    --anchor icon on what side\n    envTable.IconAnchor = \"left\" --accep 'left' 'right'\n    --fine tune the size of the icon\n    envTable.IconSizeOffset = 0\n    \n    --shield for non interruptible casts\n    envTable.ShowShield = false\n    envTable.ShieldTexture = [[Interface\\GROUPFRAME\\UI-GROUP-MAINTANKICON]]\n    envTable.ShieldDesaturated = true\n    envTable.ShieldColor = {1, 1, 1 ,1}\n    envTable.ShieldSize = {10, 12}\n    \n    --private:\n    function envTable.UpdateIconPosition (unitFrame)\n        local castBar = unitFrame.castBar\n        local icon = castBar.Icon\n        local shield = castBar.BorderShield\n        \n        if (envTable.ShowIcon) then\n            icon:ClearAllPoints()\n            \n            if (envTable.IconAnchor == \"left\") then\n                icon:SetPoint (\"topright\", unitFrame.healthBar, \"topleft\", -1, envTable.IconSizeOffset)\n                icon:SetPoint (\"bottomright\", unitFrame.castBar, \"bottomleft\", -1, 0)    \n                \n            elseif (envTable.IconAnchor == \"right\") then\n                icon:SetPoint (\"topleft\", unitFrame.healthBar, \"topright\", 1, envTable.IconSizeOffset)\n                icon:SetPoint (\"bottomleft\", unitFrame.castBar, \"bottomright\", 1, 0)\n                \n            end\n            \n            icon:SetWidth (icon:GetHeight())\n            icon:Show()\n            \n        else\n            icon:Hide()\n            \n        end\n        \n        if (envTable.ShowShield and not castBar.canInterrupt) then\n            shield:Show()\n            shield:SetAlpha (1)\n            shield:SetTexCoord (0, 1, 0, 1)\n            shield:SetVertexColor (1, 1, 1, 1)\n            \n            shield:SetTexture (envTable.ShieldTexture)\n            shield:SetDesaturated (envTable.ShieldDesaturated)\n            \n            if (not envTable.ShieldDesaturated) then\n                shield:SetVertexColor (DetailsFramework:ParseColors (envTable.ShieldColor))\n            end\n            \n            shield:SetSize (unpack (envTable.ShieldSize))\n            \n            shield:ClearAllPoints()\n            shield:SetPoint (\"center\", castBar, \"left\", 0, 0)\n            \n        else\n            shield:Hide()\n            \n        end\n        \n    end\nend",
					},
					["Time"] = 1600571225,
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["affix"] = {
						},
						["race"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["url"] = "https://wago.io/SR0FJSEDZ/1",
					["Icon"] = "Interface\\Buttons\\UI-Quickslot2",
					["Enabled"] = true,
					["Revision"] = 127,
					["semver"] = "1.0.0",
					["Author"] = "Ditador-Azralon",
					["Desc"] = "Move the icon of the spell cast to the left or right side of the nameplate.",
					["Prio"] = 99,
					["version"] = 1,
					["PlaterCore"] = 1,
					["Name"] = "Cast Icon Anchor",
					["LastHookEdited"] = "",
					["Options"] = {
					},
				}, -- [11]
				{
					["OptionsValues"] = {
					},
					["HooksTemp"] = {
					},
					["Hooks"] = {
						["Cast Start"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.BuildFrames (unitFrame)\n    \nend\n\n\n",
						["Destructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.castBar.IconOverlayFrame) then\n        unitFrame.castBar.IconOverlayFrame:Hide()\n    end\n    \nend\n\n\n\n\n",
						["Cast Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.BuildFrames (unitFrame)\n    \nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.AnchorSide = \"left\"\n    envTable.BorderThickness = 1\n    envTable.BorderColor = \"black\"\n    \n    --private\n    function envTable.BuildFrames (unitFrame)\n        local castBar = unitFrame.castBar\n        \n        local r, g, b, a = DetailsFramework:ParseColors (envTable.BorderColor)\n        castBar.IconBorder:SetVertexColor (r, g, b, a)\n        \n        local size = envTable.BorderThickness\n        castBar.IconBorder:SetBorderSizes (size, size, size, size)\n        castBar.IconBorder:UpdateSizes()\n        \n        local icon = castBar.Icon\n        if (envTable.AnchorSide == \"left\") then\n            icon:ClearAllPoints()\n            icon:SetPoint (\"topright\", unitFrame.healthBar, \"topleft\")\n            icon:SetPoint (\"bottomright\", castBar, \"bottomleft\")\n            icon:SetWidth (icon:GetHeight())\n            \n        elseif (envTable.AnchorSide == \"right\") then\n            icon:ClearAllPoints()\n            icon:SetPoint (\"topleft\", unitFrame.healthBar, \"topright\")\n            icon:SetPoint (\"bottomleft\", castBar, \"bottomright\")\n            icon:SetWidth (icon:GetHeight())\n            \n        end\n        \n        icon:Show()\n        castBar.IconOverlayFrame:Show()\n    end\n    \n    if (not unitFrame.castBar.IconOverlayFrame) then\n        --icon support frame\n        unitFrame.castBar.IconOverlayFrame = CreateFrame (\"frame\", nil, unitFrame.castBar)\n        unitFrame.castBar.IconOverlayFrame:SetPoint (\"topleft\", unitFrame.castBar.Icon, \"topleft\")\n        unitFrame.castBar.IconOverlayFrame:SetPoint (\"bottomright\", unitFrame.castBar.Icon, \"bottomright\")\n        \n        unitFrame.castBar.IconBorder = CreateFrame (\"frame\", nil,  unitFrame.castBar.IconOverlayFrame, \"NamePlateFullBorderTemplate\")\n    end    \n    \nend\n\n\n\n\n",
					},
					["Time"] = 1600571225,
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["affix"] = {
						},
						["race"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["url"] = "https://wago.io/T37kZgkmc/1",
					["Icon"] = 133004,
					["Enabled"] = true,
					["Revision"] = 40,
					["semver"] = "1.0.0",
					["Author"] = "Izimode-Azralon",
					["Desc"] = "Adds a pixels perfect border around the cast bar spell icon.",
					["Prio"] = 99,
					["version"] = 1,
					["PlaterCore"] = 1,
					["Name"] = "Cast Icon Border",
					["LastHookEdited"] = "",
					["Options"] = {
					},
				}, -- [12]
				{
					["OptionsValues"] = {
					},
					["HooksTemp"] = {
					},
					["Hooks"] = {
						["Nameplate Added"] = "\n\n-- exported function Plater.UpdatePlateSize() from Plater.lua\n--this is for advanced users which wants to reorder the nameplate frame at their desire\n\n\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --check if there's a type of unit on this nameplate\n    local plateFrame = unitFrame:GetParent()\n    if (not plateFrame.actorType) then\n        return\n    end\n    \n    --get all the frames and cache some variables\n    local ACTORTYPE_ENEMY_PLAYER = \"enemyplayer\"\n    local profile = Plater.db.profile\n    local DB_PLATE_CONFIG = profile.plate_config\n    local isInCombat = Plater.IsInCombat()\n    local actorType = plateFrame.actorType\n    \n    local unitFrame = plateFrame.unitFrame\n    local healthBar = unitFrame.healthBar\n    local castBar = unitFrame.castBar\n    local powerBar = unitFrame.powerBar\n    local buffFrame1 = unitFrame.BuffFrame\n    local buffFrame2 = unitFrame.BuffFrame2\n    \n    --use in combat bars when in pvp\n    if (plateFrame.actorType == ACTORTYPE_ENEMY_PLAYER) then\n        if ((Plater.ZoneInstanceType == \"pvp\" or Plater.ZoneInstanceType == \"arena\") and DB_PLATE_CONFIG.player.pvp_always_incombat) then\n            isInCombat = true\n        end\n    end\n    \n    --get the config for this actor type\n    local plateConfigs = DB_PLATE_CONFIG [actorType]\n    --get the config key based if the player is in combat\n    local castBarConfigKey, healthBarConfigKey, manaConfigKey = Plater.GetHashKey (isInCombat)\n    \n    --get the width and height from what the user set in the options panel\n    local healthBarWidth, healthBarHeight = unitFrame.customHealthBarWidth or plateConfigs [healthBarConfigKey][1], unitFrame.customHealthBarHeight or plateConfigs [healthBarConfigKey][2]\n    local castBarWidth, castBarHeight = unitFrame.customCastBarWidth or plateConfigs [castBarConfigKey][1], unitFrame.customCastBarHeight or plateConfigs [castBarConfigKey][2]\n    local powerBarWidth, powerBarHeight = unitFrame.customPowerBarHeight or plateConfigs [manaConfigKey][1], unitFrame.customPowerBarHeight or plateConfigs [manaConfigKey][2]\n    \n    --calculate the offset for the cast bar, this is done due to the cast bar be anchored to topleft and topright\n    local castBarOffSetX = (healthBarWidth - castBarWidth) / 2\n    local castBarOffSetY = plateConfigs.castbar_offset\n    \n    --calculate offsets for the power bar\n    local powerBarOffSetX = (healthBarWidth - powerBarWidth) / 2\n    local powerBarOffSetY = 0\n    \n    --calculate the size deviation for pets\n    local unitType = Plater.GetUnitType (plateFrame)\n    if (unitType == \"pet\") then\n        healthBarHeight = healthBarHeight * Plater.db.profile.pet_height_scale\n        healthBarWidth = healthBarWidth * Plater.db.profile.pet_width_scale\n        \n    elseif (unitType == \"minus\") then\n        healthBarHeight = healthBarHeight * Plater.db.profile.minor_height_scale\n        healthBarWidth = healthBarWidth * Plater.db.profile.minor_width_scale\n    end\n    \n    --unit frame - is set to be the same size as the plateFrame\n    unitFrame:ClearAllPoints()\n    unitFrame:SetAllPoints()\n    \n    --calculates the health bar anchor points\n    --it will always be placed in the center of the nameplate area (where it accepts mouse clicks) \n    local xOffSet = (plateFrame:GetWidth() - healthBarWidth) / 2\n    local yOffSet = (plateFrame:GetHeight() - healthBarHeight) / 2\n    \n    --set the health bar point\n    healthBar:ClearAllPoints()\n    PixelUtil.SetPoint (healthBar, \"topleft\", unitFrame, \"topleft\", xOffSet + profile.global_offset_x, -yOffSet + profile.global_offset_y)\n    PixelUtil.SetPoint (healthBar, \"bottomright\", unitFrame, \"bottomright\", -xOffSet + profile.global_offset_x, yOffSet + profile.global_offset_y)\n    \n    --set the cast bar point and size\n    castBar:ClearAllPoints()\n    PixelUtil.SetPoint (castBar, \"topleft\", healthBar, \"bottomleft\", castBarOffSetX, castBarOffSetY)\n    PixelUtil.SetPoint (castBar, \"topright\", healthBar, \"bottomright\", -castBarOffSetX, castBarOffSetY)\n    PixelUtil.SetHeight (castBar, castBarHeight)\n    PixelUtil.SetSize (castBar.Icon, castBarHeight, castBarHeight)\n    PixelUtil.SetSize (castBar.BorderShield, castBarHeight * 1.4, castBarHeight * 1.4)\n    \n    --set the power bar point and size\n    powerBar:ClearAllPoints()\n    PixelUtil.SetPoint (powerBar, \"topleft\", healthBar, \"bottomleft\", powerBarOffSetX, powerBarOffSetY)\n    PixelUtil.SetPoint (powerBar, \"topright\", healthBar, \"bottomright\", -powerBarOffSetX, powerBarOffSetY)\n    PixelUtil.SetHeight (powerBar, powerBarHeight)\n    \n    --power bar are hidden by default, show it if there's a custom size for it\n    if (unitFrame.customPowerBarWidth and unitFrame.customPowerBarHeight) then\n        powerBar:SetUnit (unitFrame.unit)\n    end\n    \n    --aura frames\n    local bf1Anchor = Plater.db.profile.aura_frame1_anchor\n    Plater.SetAnchor (buffFrame1, {side = bf1Anchor.side, x = bf1Anchor.x, y = bf1Anchor.y + plateConfigs.buff_frame_y_offset}, unitFrame.healthBar, (Plater.db.profile.aura_grow_direction or 2) == 2)\n    \n    local bf2Anchor = Plater.db.profile.aura_frame2_anchor\n    Plater.SetAnchor (buffFrame2, {side = bf2Anchor.side, x = bf2Anchor.x, y = bf2Anchor.y + plateConfigs.buff_frame_y_offset}, unitFrame.healthBar, (Plater.db.profile.aura2_grow_direction or 2) == 2)\n    \nend\n\n\n",
					},
					["Time"] = 1605782427,
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["affix"] = {
						},
						["race"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["url"] = "",
					["Icon"] = 574574,
					["Enabled"] = false,
					["Revision"] = 97,
					["semver"] = "",
					["Author"] = "Kastfall-Azralon",
					["Desc"] = "Function Plater.UpdatePlateSize from Plater.lua exported to scritps.",
					["Prio"] = 99,
					["version"] = -1,
					["PlaterCore"] = 1,
					["Name"] = "Reorder Nameplate [Plater]",
					["LastHookEdited"] = "",
					["Options"] = {
					},
				}, -- [13]
				{
					["OptionsValues"] = {
					},
					["LastHookEdited"] = "",
					["Hooks"] = {
						["Initialization"] = "function (modTable)\n    \n    --ATTENTION: after enabling this mod, you may have to adjust the anchor point at the Buff Settings tab\n    \n    local sortByTime = false\n    local invertSort = false\n    \n    --which auras goes first, assign a value (any number), bigger value goes first\n    local priority = {\n        [\"Vampiric Touch\"] = 50,\n        [\"Shadow Word: Pain\"] = 22,\n        [\"Mind Flay\"] = 5,\n        [\"Pistol Shot\"] = 50,\n        [\"Marked for Death\"] = 99,\n    }\n    \n    -- Sort function - do not touch\n    Plater.db.profile.aura_sort = true\n    \n    \n    function Plater.AuraIconsSortFunction (aura1, aura2)\n        local p1 = priority[aura1.SpellId] or priority[aura1.SpellName] or 1\n        local p2 = priority[aura2.SpellId] or priority[aura2.SpellName] or 1\n        \n        if sortByTime and p1 == p2 then\n            if invertSort then\n                return (aura1.Duration == 0 and 99999999 or aura1.RemainingTime or 0) > (aura2.Duration == 0 and 99999999 or aura2.RemainingTime or 0)\n            else\n                return (aura1.Duration == 0 and 99999999 or aura1.RemainingTime or 0) < (aura2.Duration == 0 and 99999999 or aura2.RemainingTime or 0)\n            end\n        else\n            if invertSort then\n                 return p1 < p2\n            else\n                return p1 > p2\n            end\n        end\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
					},
					["Time"] = 1608663128,
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["race"] = {
						},
						["encounter_ids"] = {
						},
						["affix"] = {
						},
					},
					["url"] = "",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura_reorder",
					["Enabled"] = false,
					["Revision"] = 356,
					["semver"] = "",
					["Author"] = "Ditador-Azralon",
					["Desc"] = "Reorder buffs and debuffs following the settings set in the constructor.",
					["Name"] = "Aura Reorder [Plater]",
					["PlaterCore"] = 1,
					["version"] = -1,
					["HooksTemp"] = {
					},
					["Options"] = {
					},
				}, -- [14]
				{
					["OptionsValues"] = {
					},
					["HooksTemp"] = {
					},
					["Hooks"] = {
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    local raidMark = Plater.GetRaidMark (unitFrame)\n    \n    local color = envTable.MarkToColor[raidMark]\n    \n    if raidMark then\n        \n        Plater.SetNameplateColor (unitFrame, color)\n        envTable.HasRaidMark = true\n        \n    end\n    \nend\n\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.MarkToColor = {\n        [1] = \"#d9cf45\",--YellowStar\n        [2] = \"#ed820f\", --Orange Circle\n        [3] = \"#b30fd6\", --Purple Diamond\n        [4] = \"#24a824\", --Green Triangle\n        [5] = \"#99bfd9\", --Silver Moon\n        [6] = \"#00a3ff\", --Blue Square\n        [7] = \"#d12e2e\", --Red Cross\n        [8] = \"#e3d4bd\", --White Skull    \n    }\n    \nend\n\n\n",
						["Raid Target"] = "function (self, unitId, unitFrame, envTable)\n    \n    local raidMark = Plater.GetRaidMark (unitFrame)    \n    \n    if (not raidMark) then\n        if envTable.HasRaidMark then\n            \n            Plater.RefreshNameplateColor(unitFrame)\n            envTable.HasRaidMark = nil\n            \n        end\n        \n    end\n    \nend\n\n\n\n\n\n\n\n\n",
					},
					["Time"] = 1606369046,
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["affix"] = {
						},
						["race"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["url"] = "https://wago.io/tEQKn0Ns8/1",
					["Icon"] = "INTERFACE\\ICONS\\Achievement_DoubleRainbow",
					["Enabled"] = false,
					["Revision"] = 210,
					["semver"] = "1.0.0",
					["Author"] = "Fragile-烈焰峰",
					["Desc"] = "",
					["Prio"] = 99,
					["version"] = 1,
					["PlaterCore"] = 1,
					["Name"] = "Target Mark Color Change",
					["LastHookEdited"] = "",
					["Options"] = {
					},
				}, -- [15]
				{
					["OptionsValues"] = {
					},
					["LastHookEdited"] = "Constructor",
					["Hooks"] = {
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable, modTable)\n    modTable.updateInterruptId (unitFrame)\nend\n\n\n",
						["Cast Update"] = "function (self, unitId, unitFrame, envTable, modTable)\n    unitFrame.castBar:UpdateCastColor()\nend",
						["Player Talent Update"] = "function (self, unitId, unitFrame, envTable, modTable)\n    modTable.updateInterruptIDs()\n    modTable.updateInterruptId (unitFrame)\nend\n\n\n",
						["Initialization"] = "function (modTable)\n    \n    -- settings:\n    local noKickReadyColor = modTable.config.noKickReadyColor or \"blue\"\n    local kickReadyInTimeColor = modTable.config.kickReadyInTimeColor or \"purple\"\n    local kickReadyInTimeGraceTime = modTable.config. kickReadyInTimeGraceTime or 0.5 --sec - additional time on the CD to account for reaction, lag, etc\n    local checkCovenant = true\n    \n    \n    -- functions:\n    \n    -- determine interrupt spell according to spec\n    function modTable.updateInterruptIDs ()\n        local specId = GetSpecializationInfo(GetSpecialization())\n        local interruptIDs = {} -- contains: [spellID] = <is player ability>, false meaning pet or weird workarounds needed\n        if Plater.PlayerClass == \"ROGUE\" then\n            interruptIDs[1766] = true\n        elseif Plater.PlayerClass == \"DEATHKNIGHT\" then\n            interruptIDs[47528] = true\n        elseif Plater.PlayerClass == \"DEMONHUNTER\" then\n            interruptIDs[183752] = true\n        elseif Plater.PlayerClass == \"DRUID\" then\n            if specId == 103 or specId == 104 then\n                interruptIDs[106839] = true -- feral/guardian\n            elseif specId == 102 then\n                interruptIDs[78675] = true -- moonkin\n            end\n        elseif Plater.PlayerClass == \"HUNTER\" then\n            if specId == 255 then\n                interruptIDs[187707] = true -- SV\n            else\n                interruptIDs[147362] = true -- BM/MS\n            end\n        elseif Plater.PlayerClass == \"MONK\" then\n            if specId == 268 or specId == 269 then\n                interruptIDs[116705] = true --WW/BM\n            end\n        elseif Plater.PlayerClass == \"PALADIN\" then\n            if specId == 66 or specId == 70 then\n                interruptIDs[96231] = true --prot/ret\n            end\n            if specId == 66 then\n                interruptIDs[31935] = true --prot\n                if checkCovenant and IsPlayerSpell(304971) then\n                    interruptIDs[304971] = true --kyrian\n                end\n            end\n        elseif Plater.PlayerClass == \"SHAMAN\" then\n            interruptIDs[57994] = true\n        elseif Plater.PlayerClass == \"WARRIOR\" then\n            interruptIDs[6552] = true\n        elseif Plater.PlayerClass == \"MAGE\" then\n            interruptIDs[2139] = true\n        elseif Plater.PlayerClass == \"PRIEST\" then\n            if specId == 258 then\n                interruptIDs[15487] = true\n            end\n        elseif Plater.PlayerClass == \"WARLOCK\" then\n            interruptIDs[119910] = 119898 --Spell Lock (command ability)\n            if IsPlayerSpell(108503) then --GoSac\n                interruptIDs[132409] = 119898 --sacrificed Spell Lock (command ability)\n            end\n            if specId == 266 then\n                interruptIDs[119914] = 119898 --demo/fel guard  Axe Toss (command ability)\n            end\n        end\n        modTable.interruptSpellIDs = interruptIDs\n    end\n    \n    function modTable.updateInterruptId (unitFrame)\n        if not modTable.interruptSpellIDs then\n            modTable.updateInterruptIDs()\n        end\n        unitFrame.castBar.interruptSpellIDs = modTable.interruptSpellIDs\n    end\n    \n    function modTable.setCastColorFunction (unitFrame)\n        -- overwrite the color function:\n        unitFrame.castBar.GetCastColor = function (self)\n            \n            local interruptCD, interruptReadyInTime = nil, false\n            if self.interruptSpellIDs and UnitCanAttack(\"player\", self.unit) then\n                \n                for interruptSpellId, playerAbility in pairs(self.interruptSpellIDs) do\n                    if playerAbility == true then\n                        \n                        if IsSpellKnown(interruptSpellId) then\n                            local cdStart, cdDur =  GetSpellCooldown(interruptSpellId)\n                            local tmpInterruptCD = (cdStart > 0 and  cdDur - (GetTime() - cdStart)) or 0\n                            if not interruptCD or (tmpInterruptCD < interruptCD) then\n                                interruptCD = tmpInterruptCD\n                            end\n                        end\n                    else\n                        if type(playerAbility) == \"number\" and FindSpellOverrideByID(playerAbility) then\n                            local cdStart, cdDur =  GetSpellCooldown(interruptSpellId)\n                            local tmpInterruptCD = (cdStart > 0 and  cdDur - (GetTime() - cdStart)) or 0\n                            if not interruptCD or (tmpInterruptCD < interruptCD) then\n                                interruptCD = tmpInterruptCD\n                            end\n                        end\n                    end\n                end\n                \n                if not interruptCD then\n                    interruptCD = 0\n                end\n                \n                if self.channeling then\n                    interruptReadyInTime = (interruptCD + kickReadyInTimeGraceTime) < self.value\n                    --print(interruptCD, self.value, interruptCD < self.value)\n                else\n                    interruptReadyInTime = (interruptCD + kickReadyInTimeGraceTime) < (self.maxValue - self.value)\n                    --print(interruptCD, self.maxValue, self.value, interruptCD < (self.maxValue - self.value))\n                end\n            end\n            \n            if not interruptCD then\n                interruptCD = 0\n            end\n            \n            if (not self.canInterrupt) then\n                return self.Colors.NonInterruptible\n                \n            elseif (self.failed) then\n                return self.Colors.Failed\n                \n            elseif (self.interrupted) then\n                return self.Colors.Interrupted\n                \n            elseif (self.finished) then\n                return self.Colors.Finished\n                \n            elseif interruptCD > 0 and interruptReadyInTime then\n                return kickReadyInTimeColor\n                \n            elseif interruptCD > 0 then\n                return noKickReadyColor\n                \n            elseif (self.channeling) then\n                return self.Colors.Channeling\n                \n            else        \n                return self.Colors.Casting\n                \n            end\n        end\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable, modTable)\n    modTable.updateInterruptId (unitFrame)\n    modTable.setCastColorFunction (unitFrame)\nend",
					},
					["Time"] = 1612670992,
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["affix"] = {
						},
						["race"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["url"] = "https://wago.io/jHilJiXiY/16",
					["Icon"] = 132219,
					["Enabled"] = true,
					["Revision"] = 405,
					["semver"] = "1.0.15",
					["Author"] = "Viash-Thrall",
					["Desc"] = "Sets the cast bar color to the specified one if your interrupt spell is not ready. Uses other Plater color settings otherwise.",
					["Prio"] = 99,
					["Name"] = "Interrupt not ready Cast Color",
					["PlaterCore"] = 1,
					["version"] = 16,
					["HooksTemp"] = {
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable, modTable)\n    modTable.updateInterruptId (unitFrame)\nend\n\n\n",
						["Cast Update"] = "function (self, unitId, unitFrame, envTable, modTable)\n    unitFrame.castBar:UpdateCastColor()\nend",
						["Player Talent Update"] = "function (self, unitId, unitFrame, envTable, modTable)\n    modTable.updateInterruptIDs()\n    modTable.updateInterruptId (unitFrame)\nend\n\n\n",
						["Initialization"] = "function (modTable)\n    \n    -- settings:\n    local noKickReadyColor = modTable.config.noKickReadyColor or \"blue\"\n    local kickReadyInTimeColor = modTable.config.kickReadyInTimeColor or \"purple\"\n    local kickReadyInTimeGraceTime = modTable.config. kickReadyInTimeGraceTime or 0.5 --sec - additional time on the CD to account for reaction, lag, etc\n    local checkCovenant = true\n    \n    \n    -- functions:\n    \n    -- determine interrupt spell according to spec\n    function modTable.updateInterruptIDs ()\n        local specId = GetSpecializationInfo(GetSpecialization())\n        local interruptIDs = {} -- contains: [spellID] = <is player ability>, false meaning pet or weird workarounds needed\n        if Plater.PlayerClass == \"ROGUE\" then\n            interruptIDs[1766] = true\n        elseif Plater.PlayerClass == \"DEATHKNIGHT\" then\n            interruptIDs[47528] = true\n        elseif Plater.PlayerClass == \"DEMONHUNTER\" then\n            interruptIDs[183752] = true\n        elseif Plater.PlayerClass == \"DRUID\" then\n            if specId == 103 or specId == 104 then\n                interruptIDs[106839] = true -- feral/guardian\n            elseif specId == 102 then\n                interruptIDs[78675] = true -- moonkin\n            end\n        elseif Plater.PlayerClass == \"HUNTER\" then\n            if specId == 255 then\n                interruptIDs[187707] = true -- SV\n            else\n                interruptIDs[147362] = true -- BM/MS\n            end\n        elseif Plater.PlayerClass == \"MONK\" then\n            if specId == 268 or specId == 269 then\n                interruptIDs[116705] = true --WW/BM\n            end\n        elseif Plater.PlayerClass == \"PALADIN\" then\n            if specId == 66 or specId == 70 then\n                interruptIDs[96231] = true --prot/ret\n            end\n            if specId == 66 then\n                interruptIDs[31935] = true --prot\n                if checkCovenant and IsPlayerSpell(304971) then\n                    interruptIDs[304971] = true --kyrian\n                end\n            end\n        elseif Plater.PlayerClass == \"SHAMAN\" then\n            interruptIDs[57994] = true\n        elseif Plater.PlayerClass == \"WARRIOR\" then\n            interruptIDs[6552] = true\n        elseif Plater.PlayerClass == \"MAGE\" then\n            interruptIDs[2139] = true\n        elseif Plater.PlayerClass == \"PRIEST\" then\n            if specId == 258 then\n                interruptIDs[15487] = true\n            end\n        elseif Plater.PlayerClass == \"WARLOCK\" then\n            interruptIDs[119910] = 119898 --Spell Lock (command ability)\n            if IsPlayerSpell(108503) then --GoSac\n                interruptIDs[132409] = 119898 --sacrificed Spell Lock (command ability)\n            end\n            if specId == 266 then\n                interruptIDs[119914] = 119898 --demo/fel guard  Axe Toss (command ability)\n            end\n        end\n        modTable.interruptSpellIDs = interruptIDs\n    end\n    \n    function modTable.updateInterruptId (unitFrame)\n        if not modTable.interruptSpellIDs then\n            modTable.updateInterruptIDs()\n        end\n        unitFrame.castBar.interruptSpellIDs = modTable.interruptSpellIDs\n    end\n    \n    function modTable.setCastColorFunction (unitFrame)\n        -- overwrite the color function:\n        unitFrame.castBar.GetCastColor = function (self)\n            \n            local interruptCD, interruptReadyInTime = nil, false\n            if self.interruptSpellIDs and UnitCanAttack(\"player\", self.unit) then\n                \n                for interruptSpellId, playerAbility in pairs(self.interruptSpellIDs) do\n                    if playerAbility == true then\n                        \n                        if IsSpellKnown(interruptSpellId) then\n                            local cdStart, cdDur =  GetSpellCooldown(interruptSpellId)\n                            local tmpInterruptCD = (cdStart > 0 and  cdDur - (GetTime() - cdStart)) or 0\n                            if not interruptCD or (tmpInterruptCD < interruptCD) then\n                                interruptCD = tmpInterruptCD\n                            end\n                        end\n                    else\n                        if type(playerAbility) == \"number\" and FindSpellOverrideByID(playerAbility) then\n                            local cdStart, cdDur =  GetSpellCooldown(interruptSpellId)\n                            local tmpInterruptCD = (cdStart > 0 and  cdDur - (GetTime() - cdStart)) or 0\n                            if not interruptCD or (tmpInterruptCD < interruptCD) then\n                                interruptCD = tmpInterruptCD\n                            end\n                        end\n                    end\n                end\n                \n                if not interruptCD then\n                    interruptCD = 0\n                end\n                \n                if self.channeling then\n                    interruptReadyInTime = (interruptCD + kickReadyInTimeGraceTime) < self.value\n                    --print(interruptCD, self.value, interruptCD < self.value)\n                else\n                    interruptReadyInTime = (interruptCD + kickReadyInTimeGraceTime) < (self.maxValue - self.value)\n                    --print(interruptCD, self.maxValue, self.value, interruptCD < (self.maxValue - self.value))\n                end\n            end\n            \n            if not interruptCD then\n                interruptCD = 0\n            end\n            \n            if (not self.canInterrupt) then\n                return self.Colors.NonInterruptible\n                \n            elseif (self.failed) then\n                return self.Colors.Failed\n                \n            elseif (self.interrupted) then\n                return self.Colors.Interrupted\n                \n            elseif (self.finished) then\n                return self.Colors.Finished\n                \n            elseif interruptCD > 0 and interruptReadyInTime then\n                return kickReadyInTimeColor\n                \n            elseif interruptCD > 0 then\n                return noKickReadyColor\n                \n            elseif (self.channeling) then\n                return self.Colors.Channeling\n                \n            else        \n                return self.Colors.Casting\n                \n            end\n        end\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable, modTable)\n    modTable.updateInterruptId (unitFrame)\n    modTable.setCastColorFunction (unitFrame)\nend",
					},
					["Options"] = {
						{
							["Type"] = 1,
							["Name"] = "Kick not Ready Color",
							["Value"] = {
								0, -- [1]
								0, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["Key"] = "noKickReadyColor",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "",
						}, -- [1]
						{
							["Type"] = 1,
							["Name"] = "Kick Ready in Time Color",
							["Value"] = {
								0.50196078431373, -- [1]
								0, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["Key"] = "kickReadyInTimeColor",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "",
						}, -- [2]
						{
							["Type"] = 2,
							["Max"] = 1,
							["Desc"] = "",
							["Min"] = 0,
							["Fraction"] = true,
							["Value"] = 0.5,
							["Name"] = "Reaction grace Time",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Key"] = "kickReadyInTimeGraceTime",
						}, -- [3]
					},
				}, -- [16]
				{
					["OptionsValues"] = {
					},
					["HooksTemp"] = {
					},
					["Hooks"] = {
						["Nameplate Created"] = "function (self, unitId, unitFrame, envTable)\n    \n    --run constructor!\n    --constructor is executed only once when any script of the hook runs.\n    \nend\n\n\n",
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if need update the amount of combo points shown\n    if (envTable.LastPlayerTalentUpdate > envTable.LastUpdate) then\n        envTable.UpdateComboPointAmount()\n    end    \n    \n    if (unitFrame.namePlateIsTarget and not unitFrame.IsSelf) then\n        envTable.ComboPointFrame:Show()\n        envTable.UpdateComboPoints()\n        \n    else\n        envTable.ComboPointFrame:Hide()\n    end    \n    \nend\n\n\n",
						["Target Changed"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if this nameplate is the current target\n    if (unitFrame.namePlateIsTarget and not unitFrame.IsSelf) then\n        envTable.ComboPointFrame:Show()\n        envTable.UpdateComboPoints()\n    else\n        envTable.ComboPointFrame:Hide()\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Player Power Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateIsTarget and not unitFrame.IsSelf) then\n        envTable.UpdateComboPoints()\n    end\n    \n    \nend\n\n\n\n\n\n\n",
						["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.ComboPointFrame:Hide()\n    \nend\n\n\n",
						["Destructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.ComboPointFrame:Hide()\n    \nend\n\n\n\n\n",
						["Player Talent Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    --update the amount of comboo points shown when the player changes talents or specialization\n    envTable.UpdateComboPointAmount()\n    \n    --save the time of the last talent change\n    envTable.LastPlayerTalentUpdate = GetTime()\n    \n    \nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    --settings\n    local anchors = {\n        {\"bottom\", unitFrame.healthBar, \"top\", 0, 24},\n    }\n    \n    local sizes = {\n        width = 12,\n        height = 12,\n        scale = 1,\n    }\n    \n    local textures = {\n        backgroundTexture = [[Interface\\PLAYERFRAME\\ClassOverlayComboPoints]],\n        backgroundTexCoords = {0/128, 21/128, 101/128, 122/128},\n        \n        comboPointTexture = [[Interface\\PLAYERFRAME\\ClassOverlayComboPoints]],\n        comboPointTexCoords = {3/128, 18/128, 81/128, 96/128},\n    }\n    \n    local frameLevel = 1000\n    local frameStrata = \"high\"    \n    \n    --private\n    do\n        --store combo points frames on this table\n        envTable.ComboPoints = {}\n        --save when the player changed talents or spec\n        envTable.LastPlayerTalentUpdate = GetTime()\n        --save when this nameplate got a combo point amount and alignment update        \n        \n        --build combo points frame anchor (combo point are anchored to this)\n        if (not unitFrame.PlaterComboPointFrame) then\n            local hostFrame = CreateFrame (\"frame\", nil, unitFrame)\n            hostFrame.ComboPointFramesPool = {}\n            unitFrame.PlaterComboPointFrame = hostFrame\n            envTable.ComboPointFrame = hostFrame\n            envTable.ComboPointFrame:SetScale (sizes.scale)\n            \n            --DetailsFramework:ApplyStandardBackdrop (envTable.ComboPointFrame) --debug anchor size\n            \n            --animations\n            local onPlayShowAnimation = function (animation)\n                --stop the hide animation if it's playing\n                if (animation:GetParent():GetParent().HideAnimation:IsPlaying()) then\n                    animation:GetParent():GetParent().HideAnimation:Stop()\n                end\n                \n                animation:GetParent():Show()\n            end\n            \n            local onPlayHideAnimation = function (animation)\n                --stop the show animation if it's playing\n                if (animation:GetParent():GetParent().ShowAnimation:IsPlaying()) then\n                    animation:GetParent():GetParent().ShowAnimation:Stop()\n                end\n            end        \n            local onStopHideAnimation = function (animation)\n                animation:GetParent():Hide()       \n            end\n            \n            local createAnimations = function (comboPoint)\n                --on show\n                comboPoint.ShowAnimation = Plater:CreateAnimationHub (comboPoint.comboPointTexture, onPlayShowAnimation, nil)\n                Plater:CreateAnimation (comboPoint.ShowAnimation, \"scale\", 1, 0.1, 0, 0, 1, 1)\n                Plater:CreateAnimation (comboPoint.ShowAnimation, \"alpha\", 1, 0.1, .5, 1)\n                Plater:CreateAnimation (comboPoint.ShowAnimation, \"scale\", 2, 0.1, 1.2, 1.2, 1, 1)\n                \n                --on hide\n                comboPoint.HideAnimation = Plater:CreateAnimationHub (comboPoint.comboPointTexture, onPlayHideAnimation, onStopHideAnimation)\n                Plater:CreateAnimation (comboPoint.HideAnimation, \"scale\", 1, 0.1, 1, 1, 0, 0)\n                Plater:CreateAnimation (comboPoint.HideAnimation, \"alpha\", 1, 0.1, 1, 0)\n            end\n            \n            --build combo point frame        \n            for i =1, 10 do \n                local f = CreateFrame (\"frame\", nil, envTable.ComboPointFrame)\n                f:SetSize (sizes.width, sizes.height)\n                tinsert (envTable.ComboPoints, f)\n                tinsert (unitFrame.PlaterComboPointFrame.ComboPointFramesPool, f)\n                \n                local backgroundTexture = f:CreateTexture (nil, \"background\")\n                backgroundTexture:SetTexture (textures.backgroundTexture)\n                backgroundTexture:SetTexCoord (unpack (textures.backgroundTexCoords))\n                backgroundTexture:SetSize (sizes.width, sizes.height)\n                backgroundTexture:SetPoint (\"center\")\n                \n                local comboPointTexture = f:CreateTexture (nil, \"artwork\")\n                comboPointTexture:SetTexture (textures.comboPointTexture)\n                comboPointTexture:SetTexCoord (unpack (textures.comboPointTexCoords))\n                \n                comboPointTexture:SetSize (sizes.width, sizes.height)\n                comboPointTexture:SetPoint (\"center\")\n                comboPointTexture:Hide()            \n                \n                f.IsActive = false\n                \n                f.backgroundTexture = backgroundTexture\n                f.comboPointTexture = comboPointTexture\n                \n                createAnimations (f)\n            end\n            \n        else\n            envTable.ComboPointFrame = unitFrame.PlaterComboPointFrame\n            envTable.ComboPointFrame:SetScale (sizes.scale)\n            envTable.ComboPoints = unitFrame.PlaterComboPointFrame.ComboPointFramesPool\n            \n        end            \n        \n        envTable.ComboPointFrame:SetFrameLevel (frameLevel)\n        envTable.ComboPointFrame:SetFrameStrata (frameStrata)\n        \n        function envTable.UpdateComboPoints()\n            local comboPoints = UnitPower (\"player\", Enum.PowerType.ComboPoints)\n            \n            for i = 1, envTable.TotalComboPoints do\n                local thisComboPoint = envTable.ComboPoints [i]\n                \n                if (i <= comboPoints ) then\n                    --combo point enabled\n                    if (not thisComboPoint.IsActive) then\n                        thisComboPoint.ShowAnimation:Play()\n                        thisComboPoint.IsActive = true\n                        \n                    end\n                    \n                else\n                    --combo point disabled\n                    if (thisComboPoint.IsActive) then\n                        thisComboPoint.HideAnimation:Play()\n                        thisComboPoint.IsActive = false\n                        \n                    end\n                end\n            end\n            \n            \n        end\n        \n        function envTable.UpdateComboPointAmount()\n            local namePlateWidth = Plater.db.profile.plate_config.enemynpc.health_incombat[1]\n            local comboPoints = UnitPowerMax (\"player\", Enum.PowerType.ComboPoints)\n            local reservedSpace = (namePlateWidth - sizes.width * comboPoints)  / comboPoints \n            \n            --store the total amount of combo points\n            envTable.TotalComboPoints = comboPoints\n            \n            --update anchor frame\n            envTable.ComboPointFrame:SetWidth (namePlateWidth)\n            envTable.ComboPointFrame:SetHeight (20)\n            envTable.ComboPointFrame:ClearAllPoints()\n            for i = 1, #anchors do\n                local anchor = anchors[i]\n                envTable.ComboPointFrame:SetPoint (unpack (anchor))\n            end        \n            \n            --\n            for i = 1, #envTable.ComboPoints do\n                envTable.ComboPoints[i]:Hide()\n                envTable.ComboPoints[i]:ClearAllPoints()\n            end\n            \n            for i = 1, comboPoints do\n                local comboPoint = envTable.ComboPoints[i]\n                if i == 1 then\n                    comboPoint:SetPoint (\"left\", envTable.ComboPointFrame, \"left\", reservedSpace/2, 0)\n                else\n                    comboPoint:SetPoint (\"left\", envTable.ComboPoints[i-1], \"right\", reservedSpace, 0)\n                end\n                \n                comboPoint:Show()\n            end\n            \n            envTable.LastUpdate = GetTime()\n            \n            envTable.UpdateComboPoints()\n        end\n        \n        --initialize\n        envTable.UpdateComboPointAmount()\n        envTable.ComboPointFrame:Hide()\n    end\n    \n    \nend",
					},
					["Time"] = 1603567332,
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
							["Enabled"] = true,
							["DRUID"] = true,
							["ROGUE"] = true,
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["affix"] = {
						},
						["race"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
							["103"] = true,
							["Enabled"] = true,
						},
					},
					["url"] = "",
					["Icon"] = 135426,
					["Enabled"] = false,
					["Revision"] = 254,
					["Options"] = {
					},
					["Author"] = "Izimode-Azralon",
					["Desc"] = "Show combo points above the nameplate for Druid Feral and Rogues.",
					["Name"] = "Combo Points [Plater]",
					["PlaterCore"] = 1,
					["semver"] = "",
					["LastHookEdited"] = "",
					["version"] = -1,
				}, -- [17]
				{
					["OptionsValues"] = {
					},
					["HooksTemp"] = {
					},
					["Hooks"] = {
						["Nameplate Updated"] = "\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    local text = unitFrame.healthBar.unitName:GetText()\n    \n    local  FirstName  = { [144747] = true, -- pakus-aspect\n        [144767]  = true, -- gonks-aspect\n        [144963]  = true, -- kimbuls-aspect \n        [144941] = true } -- akundas-aspect    \n    \n    \n    \n    \n    if (text) then\n        local  a ,b, c ,d ,e ,f=  strsplit(\" \",text,5)   \n        if not FirstName [unitFrame.namePlateNpcId] then \n            unitFrame.healthBar.unitName:SetText (f or e or d or c or b or a)  \n        else\n            unitFrame.healthBar.unitName:SetText (a) \n        end\n    end    \n    \nend\n\n\n\n\n\n\n\n\n\n\n",
					},
					["Time"] = 1605800298,
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["affix"] = {
						},
						["race"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["url"] = "https://wago.io/N_8CWRftW/2",
					["Icon"] = 134331,
					["Enabled"] = false,
					["Revision"] = 102,
					["semver"] = "1.0.1",
					["Author"] = "Izimode-Azralon",
					["Desc"] = "Show Last Name only.",
					["Prio"] = 99,
					["version"] = 2,
					["PlaterCore"] = 1,
					["Options"] = {
					},
					["LastHookEdited"] = "Nameplate Updated",
					["Name"] = "Last Name Only",
				}, -- [18]
			},
			["aura_width"] = 22,
			["health_statusbar_bgcolor"] = {
				0.043137254901961, -- [1]
				0.043137254901961, -- [2]
				0.043137254901961, -- [3]
				0.5, -- [4]
			},
			["pet_width_scale"] = 0.9999999403953552,
			["quick_hide"] = true,
			["target_highlight_color"] = {
				1, -- [1]
				1, -- [2]
			},
			["resources"] = {
				["y_offset"] = 1,
				["y_offset_target"] = 9,
				["scale"] = 0.79999995231628,
			},
			["click_space"] = {
				120, -- [1]
				20, -- [2]
			},
			["extra_icon_auras"] = {
				277242, -- [1]
			},
			["aura2_grow_direction"] = 1,
			["castbar_target_outline"] = "NONE",
			["range_check_in_range_or_target_alpha_friendlies"] = 0.89999997615814,
			["not_affecting_combat_enabled"] = true,
			["castbar_target_color"] = {
				1, -- [1]
				1, -- [2]
			},
			["pet_height_scale"] = 0.9999999403953552,
			["aura_x_offset"] = 0,
			["range_check_alpha_friendlies"] = 0.64999997615814,
			["healthbar_framelevel"] = 0,
			["cast_statusbar_spark_offset"] = -13,
			["health_statusbar_bgtexture"] = "Smooth",
			["indicator_raidmark_anchor"] = {
				["y"] = 10.83999633789063,
				["x"] = 1.80999755859375,
			},
			["color_override_colors"] = {
				[3] = {
					nil, -- [1]
					0.2784313, -- [2]
					0.2078431, -- [3]
				},
				[4] = {
					1, -- [1]
					0.83921568627451, -- [2]
					0, -- [3]
				},
				[5] = {
					0.29019607843137, -- [1]
					1, -- [2]
					0.19607843137255, -- [3]
				},
			},
			["tank"] = {
				["colors"] = {
					["anothertank"] = {
						1, -- [1]
						1, -- [2]
					},
					["aggro"] = {
						0.047058823529412, -- [1]
						1, -- [2]
						0, -- [3]
					},
					["pulling"] = {
						nil, -- [1]
						0.97254901960784, -- [2]
					},
				},
			},
			["aura_tracker"] = {
				["buff_tracked"] = {
					["280001"] = true,
				},
				["debuff"] = {
					224991, -- [1]
					277950, -- [2]
				},
				["debuff_banned"] = {
					["214968"] = true,
					["199721"] = true,
					["273977"] = true,
				},
				["buff_banned"] = {
					["206150"] = true,
					["333553"] = true,
					["61574"] = true,
					["61573"] = true,
				},
			},
			["castbar_target_show"] = true,
			["cast_statusbar_color"] = {
				nil, -- [1]
				0.85882352941176, -- [2]
				nil, -- [3]
				0.96000000089407, -- [4]
			},
			["update_throttle"] = 0.09999999403953552,
			["castbar_framelevel"] = 0,
			["indicator_extra_raidmark"] = false,
			["aura_stack_anchor"] = {
				["y"] = -4.5,
				["side"] = 7,
			},
			["not_affecting_combat_alpha"] = 0.5,
			["aura_cooldown_show_swipe"] = false,
			["use_health_animation"] = true,
			["target_highlight_alpha"] = 0.6299999952316284,
			["news_frame"] = {
				["PlaterNewsFrame"] = {
					["scale"] = 1,
				},
			},
			["first_run3"] = true,
			["indicator_raidmark_scale"] = 0.699999988079071,
			["cast_statusbar_spark_alpha"] = 0.7199999690055847,
			["target_shady_alpha"] = 0.59999996423721,
			["health_selection_overlay"] = "Melli Dark",
			["target_highlight_height"] = 12,
			["version"] = 23,
			["cast_statusbar_bgcolor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.79781, -- [4]
			},
			["show_interrupt_author"] = false,
			["health_animation_time_dilatation"] = 2.869999885559082,
			["extra_icon_auras_mine"] = {
				["224991"] = true,
			},
			["cast_statusbar_color_interrupted"] = {
				nil, -- [1]
				0.10196078431373, -- [2]
				0.10196078431373, -- [3]
			},
			["no_spellname_length_limit"] = true,
			["range_check_in_range_or_target_alpha"] = 1,
			["aura_timer_text_size"] = 10,
			["extra_icon_show_timer"] = false,
			["number_region_first_run"] = true,
			["border_color"] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				1, -- [4]
			},
			["cast_statusbar_fadeout_time"] = 0.4899999797344208,
			["aura_height2"] = 12,
			["script_data_trash"] = {
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \n    if (not unitFrame.spitefulTexture) then\n        unitFrame.spitefulTexture = unitFrame.healthBar:CreateTexture(nil, \"overlay\", nil, 6)\n        unitFrame.spitefulTexture:SetPoint('right', 0, 0)\n        unitFrame.spitefulTexture:SetSize(27, 14)\n        unitFrame.spitefulTexture:SetColorTexture(.3, .3, 1, .7)\n        \n        unitFrame.spitefulText = unitFrame.healthBar:CreateFontString(nil, \"overlay\", \"GameFontNormal\", 6)\n        DetailsFramework:SetFontFace (unitFrame.spitefulText, \"2002\")\n        unitFrame.spitefulText:SetPoint(\"right\", unitFrame.spitefulTexture, \"right\", -2, 0)\n        unitFrame.spitefulText:SetJustifyH(\"right\")\n        \n        unitFrame.spitefulTexture:Hide()\n        unitFrame.spitefulText:Hide()\n    end\n    \n    function envTable.UpdateSpitefulWidget(unitFrame)\n        \n        local r, g, b, a = Plater:ParseColors(scriptTable.config.bgColor)\n        unitFrame.spitefulTexture:SetColorTexture(r, g, b, a)\n        unitFrame.spitefulTexture:SetSize(scriptTable.config.bgWidth, unitFrame.healthBar:GetHeight())   \n        Plater:SetFontSize(unitFrame.spitefulText, scriptTable.config.textSize)\n        Plater:SetFontColor(unitFrame.spitefulText, scriptTable.config.textColor)\n        \n        local currentHealth = unitFrame.healthBar.CurrentHealth\n        local maxHealth = unitFrame.healthBar.CurrentHealthMax\n        \n        local healthPercent = currentHealth / maxHealth * 100\n        local timeToDie = format(\"%.1fs\", healthPercent / 8)\n        unitFrame.spitefulText:SetText(timeToDie)\n        \n        unitFrame.spitefulText:Show()\n        unitFrame.spitefulTexture:Show()\n        \n        if scriptTable.config.switchTargetName then\n            local plateFrame = unitFrame.PlateFrame\n            local target = UnitName(unitFrame.namePlateUnitToken .. \"target\") or UnitName(unitFrame.namePlateUnitToken)\n            if target and target ~= \"\" then\n                plateFrame.namePlateUnitName = target\n                Plater.UpdateUnitName (plateFrame)\n            end\n        end\n        \n        if scriptTable.config.useTargetingColor then\n            local targeted = UnitIsUnit(unitFrame.namePlateUnitToken .. \"target\", \"player\")\n            if targeted then\n                Plater.SetNameplateColor (unitFrame, scriptTable.config.targetingColor)\n            end\n        end\n    end\nend",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    if (unitFrame.spitefulTexture) then\n        unitFrame.spitefulText:Hide()\n        unitFrame.spitefulTexture:Hide()    \n    end\nend\n\n\n\n\n\n",
					["OptionsValues"] = {
					},
					["ScriptType"] = 3,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.UpdateSpitefulWidget(unitFrame)\nend\n\n\n",
					["Time"] = 1609281290,
					["url"] = "",
					["Icon"] = 135945,
					["Enabled"] = true,
					["Revision"] = 132,
					["semver"] = "",
					["Author"] = "Symantec-Azralon",
					["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["Desc"] = "Time to die Spiteful affix",
					["NpcNames"] = {
						"174773", -- [1]
					},
					["Name"] = "M+ Spiteful",
					["SpellIds"] = {
					},
					["PlaterCore"] = 1,
					["version"] = -1,
					["Options"] = {
						{
							["Type"] = 2,
							["Max"] = 50,
							["Desc"] = "",
							["Min"] = 10,
							["Fraction"] = false,
							["Value"] = 27,
							["Name"] = "Width",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Key"] = "bgWidth",
						}, -- [1]
						{
							["Type"] = 1,
							["Name"] = "Background Color",
							["Value"] = {
								0.5058823529411764, -- [1]
								0.07058823529411765, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["Key"] = "bgColor",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "",
						}, -- [2]
						{
							["Type"] = 6,
							["Name"] = "Option 5",
							["Value"] = 0,
							["Key"] = "option5",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [3]
						{
							["Type"] = 2,
							["Max"] = 24,
							["Desc"] = "",
							["Min"] = 7,
							["Fraction"] = false,
							["Value"] = 8,
							["Name"] = "Text Size",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Key"] = "textSize",
						}, -- [4]
						{
							["Type"] = 1,
							["Name"] = "Text Color",
							["Value"] = {
								1, -- [1]
								0.5843137254901961, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Key"] = "textColor",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "",
						}, -- [5]
						{
							["Type"] = 6,
							["Key"] = "option7",
							["Value"] = 0,
							["Name"] = "Option 7",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [6]
						{
							["Type"] = 4,
							["Key"] = "switchTargetName",
							["Value"] = false,
							["Name"] = "Show Target instead of Name",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "",
						}, -- [7]
						{
							["Type"] = 6,
							["Key"] = "option8",
							["Value"] = 0,
							["Name"] = "Option 8",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [8]
						{
							["Type"] = 4,
							["Key"] = "useTargetingColor",
							["Value"] = false,
							["Name"] = "Change Color if targeting You",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "",
						}, -- [9]
						{
							["Type"] = 1,
							["Key"] = "targetingColor",
							["Value"] = {
								0.5058823529411764, -- [1]
								0.07058823529411765, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["Name"] = "Color if targeting You",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "",
						}, -- [10]
					},
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.UpdateSpitefulWidget(unitFrame)\nend\n\n\n",
					["__TrashAt"] = 1612243605,
				}, -- [1]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --settings (require a /reload after editing any setting)\n    do\n        --blink and glow\n        envTable.BlinkEnabled = scriptTable.config.blinkEnabled\n        envTable.GlowEnabled = scriptTable.config.glowEnabled \n        envTable.ChangeNameplateColor = scriptTable.config.changeNameplateColor;\n        envTable.TimeLeftToBlink = scriptTable.config.timeleftToBlink;\n        envTable.BlinkSpeed = scriptTable.config.blinkSpeed; \n        envTable.BlinkColor = scriptTable.config.blinkColor; \n        envTable.BlinkMaxAlpha = scriptTable.config.blinkMaxAlpha; \n        envTable.NameplateColor = scriptTable.config.nameplateColor; \n        \n        --text color\n        envTable.TimerColorEnabled = scriptTable.config.timerColorEnabled \n        envTable.TimeLeftWarning = scriptTable.config.timeLeftWarning;\n        envTable.TimeLeftCritical = scriptTable.config.timeLeftCritical;\n        envTable.TextColor_Warning = scriptTable.config.warningColor; \n        envTable.TextColor_Critical = scriptTable.config.criticalColor; \n        \n        --list of spellIDs to ignore\n        envTable.IgnoredSpellID = {\n            [12] = true, --use a simple comma here\n            [13] = true,\n        }\n    end\n    \n    \n    --private\n    do\n        envTable.blinkTexture = Plater:CreateImage (self, \"\", 1, 1, \"overlay\")\n        envTable.blinkTexture:SetPoint ('center', 0, 0)\n        envTable.blinkTexture:Hide()\n        \n        local onPlay = function()\n            envTable.blinkTexture:Show() \n            envTable.blinkTexture.color = envTable.BlinkColor\n        end\n        local onStop = function()\n            envTable.blinkTexture:Hide()  \n        end\n        envTable.blinkAnimation = Plater:CreateAnimationHub (envTable.blinkTexture, onPlay, onStop)\n        Plater:CreateAnimation (envTable.blinkAnimation, \"ALPHA\", 1, envTable.BlinkSpeed / 2, 0, envTable.BlinkMaxAlpha)\n        Plater:CreateAnimation (envTable.blinkAnimation, \"ALPHA\", 2, envTable.BlinkSpeed / 2, envTable.BlinkMaxAlpha, 0)\n        \n        envTable.glowEffect = envTable.glowEffect or Plater.CreateIconGlow (self)\n        --envTable.glowEffect:Show() --envTable.glowEffect:Hide()\n        \n    end\n    \nend\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.blinkAnimation:Stop()\n    envTable.blinkTexture:Hide()\n    envTable.blinkAnimation:Stop()\n    envTable.glowEffect:Stop()\n    Plater:SetFontColor (self.Cooldown.Timer, Plater.db.profile.aura_timer_text_color)\nend\n\n\n",
					["OptionsValues"] = {
					},
					["ScriptType"] = 1,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    local timeLeft = envTable._RemainingTime\n    \n    --check if the spellID isn't being ignored\n    if (envTable.IgnoredSpellID [envTable._SpellID]) then\n        return\n    end\n    \n    --check the time left and start or stop the blink animation and also check if the time left is > zero\n    if ((envTable.BlinkEnabled or envTable.GlowEnabled) and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftToBlink) then\n            --blink effect\n            if (envTable.BlinkEnabled) then\n                if (not envTable.blinkAnimation:IsPlaying()) then\n                    envTable.blinkAnimation:Play()\n                end\n            end\n            --glow effect\n            if (envTable.GlowEnabled) then\n                envTable.glowEffect:Show()\n            end\n            --nameplate color\n            if (envTable.ChangeNameplateColor) then\n                Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n            end\n        else\n            --blink effect\n            if (envTable.blinkAnimation:IsPlaying()) then\n                envTable.blinkAnimation:Stop()\n            end\n            --glow effect\n            if (envTable.GlowEnabled and envTable.glowEffect:IsShown()) then\n                envTable.glowEffect:Hide()\n            end\n        end\n    end\n    \n    --timer color\n    if (envTable.TimerColorEnabled and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftCritical) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Critical)\n        elseif (timeLeft < envTable.TimeLeftWarning) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Warning)        \n        else\n            Plater:SetFontColor (self.Cooldown.Timer, Plater.db.profile.aura_timer_text_color)\n        end\n    end\n    \nend",
					["Time"] = 1604354808,
					["url"] = "",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura_blink",
					["Enabled"] = true,
					["Revision"] = 331,
					["semver"] = "",
					["Author"] = "Izimode-Azralon",
					["Initialization"] = "					function (scriptTable)\n						--insert code here\n						\n					end\n				",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.blinkTexture:SetSize (self:GetSize())\n    \nend\n\n\n",
					["NpcNames"] = {
					},
					["Name"] = "Aura - Blink by Time Left [Plater]",
					["version"] = -1,
					["PlaterCore"] = 1,
					["SpellIds"] = {
					},
					["Desc"] = "Blink, change the number and nameplate color. Add the debuffs int he trigger box. Set settings on constructor script.",
					["Options"] = {
						{
							["Type"] = 6,
							["Key"] = "option10",
							["Value"] = 0,
							["Name"] = "Blank Space",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [1]
						{
							["Type"] = 5,
							["Key"] = "option17",
							["Value"] = "Enter the spell name or spellID in the Add Trigger box and hit \"Add\".",
							["Name"] = "Option 17",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [2]
						{
							["Type"] = 6,
							["Key"] = "option10",
							["Value"] = 0,
							["Name"] = "Blank Space",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [3]
						{
							["Type"] = 4,
							["Key"] = "blinkEnabled",
							["Value"] = true,
							["Name"] = "Blink Enabled",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "set to 'false' to disable blink",
						}, -- [4]
						{
							["Type"] = 4,
							["Key"] = "glowEnabled",
							["Value"] = true,
							["Name"] = "Glow Enabled",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "set to 'false' to disable glows",
						}, -- [5]
						{
							["Type"] = 4,
							["Key"] = "changeNameplateColor",
							["Value"] = true,
							["Name"] = "Change NamePlate Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "set to 'true' to enable nameplate color change",
						}, -- [6]
						{
							["Type"] = 2,
							["Max"] = 20,
							["Desc"] = "in seconds, affects the blink effect only",
							["Min"] = 1,
							["Key"] = "timeleftToBlink",
							["Value"] = 3,
							["Name"] = "Timeleft to Blink",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = true,
						}, -- [7]
						{
							["Type"] = 2,
							["Max"] = 3,
							["Desc"] = "time to complete a blink loop",
							["Min"] = 0.5,
							["Key"] = "blinkSpeed",
							["Value"] = 1,
							["Name"] = "Blink Speed",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = true,
						}, -- [8]
						{
							["Type"] = 2,
							["Max"] = 1,
							["Desc"] = "max transparency in the animation loop (1.0 is full opaque)",
							["Min"] = 0.1,
							["Key"] = "blinkMaxAlpha",
							["Value"] = 0.6,
							["Name"] = "Blink Max Alpha",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = true,
						}, -- [9]
						{
							["Type"] = 1,
							["Key"] = "blinkColor",
							["Value"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["Name"] = "Blink Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "color of the blink",
						}, -- [10]
						{
							["Type"] = 1,
							["Key"] = "",
							["Value"] = {
								0.28627450980392, -- [1]
								0.003921568627451, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Name"] = "Nameplate Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "nameplate color if ChangeNameplateColor is true",
						}, -- [11]
						{
							["Type"] = 6,
							["Key"] = "option10",
							["Value"] = 0,
							["Name"] = "Blank Space",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [12]
						{
							["Type"] = 4,
							["Key"] = "timerColorEnabled",
							["Value"] = true,
							["Name"] = "Timer Color Enabled",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "set to 'false' to disable changes in the color of the time left text",
						}, -- [13]
						{
							["Type"] = 2,
							["Max"] = 20,
							["Desc"] = "in seconds, affects the color of the text",
							["Min"] = 1,
							["Key"] = "timeLeftWarning",
							["Value"] = 8,
							["Name"] = "Time Left Warning",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = true,
						}, -- [14]
						{
							["Type"] = 2,
							["Max"] = 10,
							["Desc"] = "in seconds, affects the color of the text",
							["Min"] = 1,
							["Key"] = "timeLeftCritical",
							["Value"] = 3,
							["Name"] = "Time Left Critical",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = true,
						}, -- [15]
						{
							["Type"] = 1,
							["Key"] = "warningColor",
							["Value"] = {
								1, -- [1]
								0.87058823529412, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Name"] = "Warning Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "color when the time left entered in a warning zone",
						}, -- [16]
						{
							["Type"] = 1,
							["Key"] = "criticalColor",
							["Value"] = {
								1, -- [1]
								0.074509803921569, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Name"] = "Critical Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "color when the time left is critical",
						}, -- [17]
					},
					["__TrashAt"] = 1612243605,
				}, -- [2]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \n    envTable.lifePercent = {\n        --npcId         percent divisions\n        [154564] = {80, 30},   --debug\n        [164451] = {40}, --dessia the decapirator - theater of pain\n        [164463] = {40}, --Paceran the Virulent - theater of pain\n        [164461] = {40}, -- Sathel the Accursed - theater of pain\n        [165946]= {50}, -- ~mordretha - thather of pain\n        [164501] = {70, 40, 10}, --mistcaller - tina scythe\n        [164218] = {70, 40}, --Lord Chamberlain - Halls of Atonement\n    }\n    \n    function envTable.CreateMarker(unitFrame)\n        unitFrame.healthMarker = unitFrame.healthBar:CreateTexture(nil, \"overlay\")\n        unitFrame.healthMarker:SetColorTexture(1, 1, 1)\n        unitFrame.healthMarker:SetSize(1, unitFrame.healthBar:GetHeight())\n        \n        unitFrame.healthOverlay = unitFrame.healthBar:CreateTexture(nil, \"overlay\")\n        unitFrame.healthOverlay:SetColorTexture(1, 1, 1)\n        unitFrame.healthOverlay:SetSize(1, unitFrame.healthBar:GetHeight())\n    end\n    \n    function envTable.UpdateMarkers(unitFrame)\n        local markersTable = envTable.lifePercent[envTable._NpcID]\n        if (markersTable) then\n            local unitLifePercent = envTable._HealthPercent / 100\n            for i, percent in ipairs(markersTable) do\n                percent = percent / 100\n                if (unitLifePercent > percent) then\n                    if (not unitFrame.healthMarker) then\n                        envTable.CreateMarker(unitFrame)\n                    end\n                    \n                    unitFrame.healthMarker:Show()\n                    local width = unitFrame.healthBar:GetWidth()\n                    unitFrame.healthMarker:SetPoint(\"left\", unitFrame.healthBar, \"left\", width*percent, 0)\n                    \n                    local overlaySize = width * (unitLifePercent - percent)\n                    unitFrame.healthOverlay:SetWidth(overlaySize)\n                    unitFrame.healthOverlay:SetPoint(\"left\", unitFrame.healthMarker, \"right\", 0, 0)\n                    \n                    unitFrame.healthMarker:SetVertexColor(Plater:ParseColors(scriptTable.config.indicatorColor))\n                    unitFrame.healthMarker:SetAlpha(scriptTable.config.indicatorAlpha)\n                    \n                    unitFrame.healthOverlay:SetVertexColor(Plater:ParseColors(scriptTable.config.fillColor))\n                    unitFrame.healthOverlay:SetAlpha(scriptTable.config.fillAlpha)\n                    \n                    return\n                end\n            end --end for\n            \n            if (unitFrame.healthMarker and unitFrame.healthMarker:IsShown()) then\n                unitFrame.healthMarker:Hide()\n                unitFrame.healthOverlay:Hide()\n            end\n        end\n    end\nend      \n\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    if (unitFrame.healthMarker) then\n        unitFrame.healthMarker:Hide()\n        unitFrame.healthOverlay:Hide()\n    end\nend\n\n\n\n\n",
					["OptionsValues"] = {
					},
					["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.UpdateMarkers(unitFrame)\nend\n\n\n",
					["ScriptType"] = 3,
					["__TrashAt"] = 1613183697,
					["Time"] = 1606506781,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\health_indicator",
					["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \n    envTable.lifePercent = {\n        --npcId         percent divisions\n        [154564] = {80, 30},   --debug\n        [164451] = {40}, --dessia the decapirator - theater of pain\n        [164463] = {40}, --Paceran the Virulent - theater of pain\n        [164461] = {40}, -- Sathel the Accursed - theater of pain\n        [165946]= {50}, -- ~mordretha - thather of pain\n        [164501] = {70, 40, 10}, --mistcaller - tina scythe\n        [164218] = {70, 40}, --Lord Chamberlain - Halls of Atonement\n    }\n    \n    function envTable.CreateMarker(unitFrame)\n        unitFrame.healthMarker = unitFrame.healthBar:CreateTexture(nil, \"overlay\")\n        unitFrame.healthMarker:SetColorTexture(1, 1, 1)\n        unitFrame.healthMarker:SetSize(1, unitFrame.healthBar:GetHeight())\n        \n        unitFrame.healthOverlay = unitFrame.healthBar:CreateTexture(nil, \"overlay\")\n        unitFrame.healthOverlay:SetColorTexture(1, 1, 1)\n        unitFrame.healthOverlay:SetSize(1, unitFrame.healthBar:GetHeight())\n    end\n    \n    function envTable.UpdateMarkers(unitFrame)\n        local markersTable = envTable.lifePercent[envTable._NpcID]\n        if (markersTable) then\n            local unitLifePercent = envTable._HealthPercent / 100\n            for i, percent in ipairs(markersTable) do\n                percent = percent / 100\n                if (unitLifePercent > percent) then\n                    if (not unitFrame.healthMarker) then\n                        envTable.CreateMarker(unitFrame)\n                    end\n                    \n                    unitFrame.healthMarker:Show()\n                    local width = unitFrame.healthBar:GetWidth()\n                    unitFrame.healthMarker:SetPoint(\"left\", unitFrame.healthBar, \"left\", width*percent, 0)\n                    \n                    local overlaySize = width * (unitLifePercent - percent)\n                    unitFrame.healthOverlay:SetWidth(overlaySize)\n                    unitFrame.healthOverlay:SetPoint(\"left\", unitFrame.healthMarker, \"right\", 0, 0)\n                    \n                    unitFrame.healthMarker:SetVertexColor(Plater:ParseColors(scriptTable.config.indicatorColor))\n                    unitFrame.healthMarker:SetAlpha(scriptTable.config.indicatorAlpha)\n                    \n                    unitFrame.healthOverlay:SetVertexColor(Plater:ParseColors(scriptTable.config.fillColor))\n                    unitFrame.healthOverlay:SetAlpha(scriptTable.config.fillAlpha)\n                    \n                    return\n                end\n            end --end for\n            \n            if (unitFrame.healthMarker and unitFrame.healthMarker:IsShown()) then\n                unitFrame.healthMarker:Hide()\n                unitFrame.healthOverlay:Hide()\n            end\n        end\n    end\nend      \n\n\n\n\n\n",
					["NpcNames"] = {
						"164451", -- [1]
						"164463", -- [2]
						"164461", -- [3]
						"165946", -- [4]
						"164501", -- [5]
						"164218", -- [6]
					},
					["Options"] = {
						{
							["Type"] = 5,
							["Key"] = "option1",
							["Value"] = "Add markers into the health bar to remind you about boss abilities at life percent.",
							["Name"] = "Option 1",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [1]
						{
							["Type"] = 6,
							["Key"] = "",
							["Value"] = 0,
							["Name"] = "blank line",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [2]
						{
							["Type"] = 1,
							["Key"] = "indicatorColor",
							["Value"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["Name"] = "Vertical Line Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "Indicator color.",
						}, -- [3]
						{
							["Type"] = 2,
							["Max"] = 1,
							["Desc"] = "Indicator alpha.",
							["Min"] = 0.1,
							["Key"] = "indicatorAlpha",
							["Value"] = 0.79,
							["Name"] = "Vertical Line Alpha",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = true,
						}, -- [4]
						{
							["Type"] = 6,
							["Key"] = "",
							["Value"] = 0,
							["Name"] = "blank line",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [5]
						{
							["Type"] = 1,
							["Key"] = "fillColor",
							["Value"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["Name"] = "Fill Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "Fill color.",
						}, -- [6]
						{
							["Type"] = 2,
							["Max"] = 1,
							["Desc"] = "Fill alpha.",
							["Min"] = 0,
							["Key"] = "fillAlpha",
							["Value"] = 0.2,
							["Name"] = "Fill Alpha",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = true,
						}, -- [7]
					},
					["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    if (unitFrame.healthMarker) then\n        unitFrame.healthMarker:Hide()\n        unitFrame.healthOverlay:Hide()\n    end\nend\n\n\n\n\n",
					["Revision"] = 109,
					["semver"] = "",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.UpdateMarkers(unitFrame)\nend\n\n\n",
					["SpellIds"] = {
					},
					["Author"] = "Aelerolor-Torghast",
					["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["Desc"] = "Place a marker into the health bar to indicate when the unit will change phase or cast an important spell.",
					["Name"] = "Unit - Health Markers [P]",
					["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.UpdateMarkers(unitFrame)\nend\n\n\n",
					["version"] = -1,
					["PlaterCore"] = 1,
					["Enabled"] = true,
					["url"] = "",
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.UpdateMarkers(unitFrame)\nend\n\n\n",
					["Temp_Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
				}, -- [3]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --settings\n    envTable.NameplateSizeOffset = scriptTable.config.castBarHeight\n    envTable.ShowArrow = scriptTable.config.showArrow\n    envTable.ArrowAlpha = scriptTable.config.arrowAlpha\n    envTable.HealthBarColor = scriptTable.config.healthBarColor\n    \n    --creates the spark to show the cast progress inside the health bar\n    envTable.overlaySpark = envTable.overlaySpark or Plater:CreateImage (unitFrame.healthBar)\n    envTable.overlaySpark:SetBlendMode (\"ADD\")\n    envTable.overlaySpark.width = 16\n    envTable.overlaySpark.height = 36\n    envTable.overlaySpark.alpha = .9\n    envTable.overlaySpark.texture = [[Interface\\AddOns\\Plater\\images\\spark3]]\n    \n    envTable.topArrow = envTable.topArrow or Plater:CreateImage (unitFrame.healthBar)\n    envTable.topArrow:SetBlendMode (\"ADD\")\n    envTable.topArrow.width = scriptTable.config.arrowWidth\n    envTable.topArrow.height = scriptTable.config.arrowHeight\n    envTable.topArrow.alpha = envTable.ArrowAlpha\n    envTable.topArrow.texture = [[Interface\\BUTTONS\\Arrow-Down-Up]]\n    \n    --scale animation\n    envTable.smallScaleAnimation = envTable.smallScaleAnimation or Plater:CreateAnimationHub (unitFrame.healthBar)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 1, 0.075, 1, 1, 1.08, 1.08)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 2, 0.075, 1, 1, 0.95, 0.95)    \n    --envTable.smallScaleAnimation:Play() --envTable.smallScaleAnimation:Stop()\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, scriptTable.config.shakeDuration, scriptTable.config.shakeAmplitude, scriptTable.config.shakeFrequency, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))    \n    \n    --update the config for the skake here so it wont need a /reload\n    envTable.FrameShake.OriginalAmplitude = scriptTable.config.shakeAmplitude\n    envTable.FrameShake.OriginalDuration = scriptTable.config.shakeDuration\n    envTable.FrameShake.OriginalFrequency = scriptTable.config.shakeFrequency\nend\n\n\n\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    Plater.StopDotAnimation(unitFrame.healthBar, envTable.dotAnimation)\n    \n    envTable.overlaySpark:Hide()\n    envTable.topArrow:Hide()\n    \n    Plater.RefreshNameplateColor (unitFrame)\n    \n    envTable.smallScaleAnimation:Stop()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)\nend\n\n\n",
					["OptionsValues"] = {
					},
					["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.overlaySpark:Show()\n    \n    if (envTable.ShowArrow) then\n        envTable.topArrow:Show()\n    end\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    envTable.smallScaleAnimation:Play()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \n    envTable.overlaySpark.height = nameplateHeight + 5\n    \n    envTable.dotAnimation = Plater.PlayDotAnimation(unitFrame.healthBar, 2, scriptTable.config.dotColor, scriptTable.config.xOffset, scriptTable.config.yOffset)\n    \n    \nend",
					["ScriptType"] = 2,
					["__TrashAt"] = 1613183744,
					["Time"] = 1607230870,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar_red",
					["semver"] = "",
					["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --settings\n    envTable.NameplateSizeOffset = scriptTable.config.castBarHeight\n    envTable.ShowArrow = scriptTable.config.showArrow\n    envTable.ArrowAlpha = scriptTable.config.arrowAlpha\n    envTable.HealthBarColor = scriptTable.config.healthBarColor\n    \n    --creates the spark to show the cast progress inside the health bar\n    envTable.overlaySpark = envTable.overlaySpark or Plater:CreateImage (unitFrame.healthBar)\n    envTable.overlaySpark:SetBlendMode (\"ADD\")\n    envTable.overlaySpark.width = 16\n    envTable.overlaySpark.height = 36\n    envTable.overlaySpark.alpha = .9\n    envTable.overlaySpark.texture = [[Interface\\AddOns\\Plater\\images\\spark3]]\n    \n    envTable.topArrow = envTable.topArrow or Plater:CreateImage (unitFrame.healthBar)\n    envTable.topArrow:SetBlendMode (\"ADD\")\n    envTable.topArrow.width = scriptTable.config.arrowWidth\n    envTable.topArrow.height = scriptTable.config.arrowHeight\n    envTable.topArrow.alpha = envTable.ArrowAlpha\n    envTable.topArrow.texture = [[Interface\\BUTTONS\\Arrow-Down-Up]]\n    \n    --scale animation\n    envTable.smallScaleAnimation = envTable.smallScaleAnimation or Plater:CreateAnimationHub (unitFrame.healthBar)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 1, 0.075, 1, 1, 1.08, 1.08)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 2, 0.075, 1, 1, 0.95, 0.95)    \n    --envTable.smallScaleAnimation:Play() --envTable.smallScaleAnimation:Stop()\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, scriptTable.config.shakeDuration, scriptTable.config.shakeAmplitude, scriptTable.config.shakeFrequency, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))    \n    \n    --update the config for the skake here so it wont need a /reload\n    envTable.FrameShake.OriginalAmplitude = scriptTable.config.shakeAmplitude\n    envTable.FrameShake.OriginalDuration = scriptTable.config.shakeDuration\n    envTable.FrameShake.OriginalFrequency = scriptTable.config.shakeFrequency\nend\n\n\n\n\n\n\n\n",
					["NpcNames"] = {
					},
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.overlaySpark:Show()\n    \n    if (envTable.ShowArrow) then\n        envTable.topArrow:Show()\n    end\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    envTable.smallScaleAnimation:Play()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \n    envTable.overlaySpark.height = nameplateHeight + 5\n    \n    envTable.dotAnimation = Plater.PlayDotAnimation(unitFrame.healthBar, 2, scriptTable.config.dotColor, scriptTable.config.xOffset, scriptTable.config.yOffset)\n    \n    \nend",
					["Enabled"] = true,
					["Revision"] = 527,
					["Options"] = {
						{
							["Type"] = 6,
							["Key"] = "option1",
							["Value"] = 0,
							["Name"] = "Option 1",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [1]
						{
							["Type"] = 5,
							["Key"] = "option2",
							["Value"] = "Plays a special animation showing the explosion time.",
							["Name"] = "Option 2",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [2]
						{
							["Type"] = 6,
							["Key"] = "option3",
							["Value"] = 0,
							["Name"] = "Option 3",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [3]
						{
							["Type"] = 2,
							["Max"] = 6,
							["Desc"] = "Increases the health bar height by this value",
							["Min"] = 0,
							["Key"] = "castBarHeight",
							["Value"] = 3,
							["Name"] = "Health Bar Height Mod",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [4]
						{
							["Type"] = 1,
							["Key"] = "healthBarColor",
							["Value"] = {
								1, -- [1]
								0.5843137254902, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Name"] = "Health Bar Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "Changes the health bar color to this one.",
						}, -- [5]
						{
							["Type"] = 6,
							["Key"] = "option7",
							["Value"] = 0,
							["Name"] = "Option 7",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [6]
						{
							["Type"] = 5,
							["Key"] = "option6",
							["Value"] = "Arrow:",
							["Name"] = "Arrow:",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [7]
						{
							["Type"] = 4,
							["Key"] = "showArrow",
							["Value"] = true,
							["Name"] = "Show Arrow",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "Show an arrow above the nameplate showing the cast bar progress.",
						}, -- [8]
						{
							["Type"] = 2,
							["Max"] = 1,
							["Desc"] = "Arrow alpha.",
							["Min"] = 0,
							["Key"] = "arrowAlpha",
							["Value"] = 0.5,
							["Name"] = "Arrow Alpha",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = true,
						}, -- [9]
						{
							["Type"] = 2,
							["Max"] = 12,
							["Desc"] = "Arrow Width.",
							["Min"] = 4,
							["Key"] = "arrowWidth",
							["Value"] = 8,
							["Name"] = "Arrow Width",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [10]
						{
							["Type"] = 2,
							["Max"] = 12,
							["Desc"] = "Arrow Height.",
							["Min"] = 4,
							["Key"] = "arrowHeight",
							["Value"] = 8,
							["Name"] = "Arrow Height",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [11]
						{
							["Type"] = 6,
							["Key"] = "option13",
							["Value"] = 0,
							["Name"] = "Option 13",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [12]
						{
							["Type"] = 5,
							["Key"] = "option12",
							["Value"] = "Dot Animation:",
							["Name"] = "Dot Animation:",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [13]
						{
							["Type"] = 1,
							["Key"] = "dotColor",
							["Value"] = {
								1, -- [1]
								0.6156862745098, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Name"] = "Dot Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "Adjust the color of the dot animation.",
						}, -- [14]
						{
							["Type"] = 2,
							["Max"] = 10,
							["Desc"] = "Dot X Offset",
							["Min"] = -10,
							["Key"] = "xOffset",
							["Value"] = 4,
							["Name"] = "Dot X Offset",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [15]
						{
							["Type"] = 2,
							["Max"] = 10,
							["Desc"] = "Dot Y Offset",
							["Min"] = -10,
							["Key"] = "yOffset",
							["Value"] = 3,
							["Name"] = "Dot Y Offset",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [16]
					},
					["Name"] = "Cast - Ultra Important [P]",
					["Prio"] = 99,
					["Author"] = "Bombad�o-Azralon",
					["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["Desc"] = "Used on casts that make the mob explode or transform if the cast passes.",
					["version"] = -1,
					["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --update the percent\n    envTable.overlaySpark:SetPoint (\"left\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100)-9, 0)\n    \n    envTable.topArrow:SetPoint (\"bottomleft\", unitFrame.healthBar, \"topleft\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100) - 4, 2 )\n    \n    --forces the script to update on a 60Hz base\n    self.ThrottleUpdate = 0.016\n    \n    --update the health bar color coloring from yellow to red\n    --Plater.SetNameplateColor (unitFrame, max (envTable._CastPercent/100, .66), abs (envTable._CastPercent/100 - 1), 0, 1)\n    \n    Plater.SetNameplateColor (unitFrame, envTable.HealthBarColor)\nend\n\n\n",
					["SpellIds"] = {
						320230, -- [1]
						322903, -- [2]
						334625, -- [3]
					},
					["PlaterCore"] = 1,
					["Temp_Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    Plater.StopDotAnimation(unitFrame.healthBar, envTable.dotAnimation)\n    \n    envTable.overlaySpark:Hide()\n    envTable.topArrow:Hide()\n    \n    Plater.RefreshNameplateColor (unitFrame)\n    \n    envTable.smallScaleAnimation:Stop()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)\nend\n\n\n",
					["url"] = "",
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --update the percent\n    envTable.overlaySpark:SetPoint (\"left\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100)-9, 0)\n    \n    envTable.topArrow:SetPoint (\"bottomleft\", unitFrame.healthBar, \"topleft\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100) - 4, 2 )\n    \n    --forces the script to update on a 60Hz base\n    self.ThrottleUpdate = 0.016\n    \n    --update the health bar color coloring from yellow to red\n    --Plater.SetNameplateColor (unitFrame, max (envTable._CastPercent/100, .66), abs (envTable._CastPercent/100 - 1), 0, 1)\n    \n    Plater.SetNameplateColor (unitFrame, envTable.HealthBarColor)\nend\n\n\n",
				}, -- [4]
			},
			["castbar_target_anchor"] = {
				["y"] = 9.5,
				["side"] = 11,
			},
			["script_auto_imported"] = {
				["Unit - Important"] = 11,
				["Aura - Buff Alert"] = 13,
				["Cast - Very Important"] = 11,
				["Explosion Affix M+"] = 11,
				["Aura - Debuff Alert"] = 11,
				["Cast - Ultra Important"] = 11,
				["Cast - Big Alert"] = 11,
				["Unit - Show Energy"] = 11,
				["Cast - Small Alert"] = 11,
				["Blink by Time Left"] = 1,
				["Aura - Invalidate Unit"] = 1,
				["Color Change"] = 1,
				["Unit - Health Markers"] = 12,
				["Unit - Main Target"] = 11,
				["Aura - Blink Time Left"] = 12,
				["Aura Border Color"] = 1,
				["Countdown"] = 11,
				["Unit Power"] = 1,
				["Cast - Frontal Cone"] = 11,
				["Fixate"] = 11,
				["Cast - Tank Interrupt"] = 11,
				["Auto Set Skull"] = 11,
				["Spiteful Affix"] = 3,
				["Fixate On You"] = 11,
			},
			["castbar_target_font"] = "Expressway",
			["dps"] = {
				["colors"] = {
					["aggro"] = {
						nil, -- [1]
						0.047058823529412, -- [2]
					},
					["pulling"] = {
						nil, -- [1]
						0.96078431372549, -- [2]
						0.95294117647059, -- [3]
					},
				},
			},
			["extra_icon_show_enrage"] = true,
			["cast_statusbar_texture"] = "Melli Dark",
			["aura2_x_offset"] = 0,
			["aura_cooldown_reverse"] = false,
			["cast_statusbar_spark_width"] = 25,
			["patch_version"] = 13,
		},
	},
}
