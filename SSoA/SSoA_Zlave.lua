-- create some global variables --
local function CreateGlobalVariables()
-- colors --
	ssoaMainColor = CreateColorFromRGBAHexString("F0E68CFF")
	ssoaHighColor = CreateColorFromRGBAHexString("00BFFFFF")
	ssoaNoMainColor = CreateColorFromRGBAHexString("F0E68C00")
	ssoaNoHighColor = CreateColorFromRGBAHexString("00BFFF00")
-- function for opening the options --
	local function ssoaShowMenu()
		if not InCombatLockdown() then
			local _, loaded = C_AddOns.IsAddOnLoaded("SSoA_Options")
			local loadable, reason = C_AddOns.IsAddOnLoadable("SSoA_Options" , nil , true)
			if loadable and not loaded then
				C_AddOns.LoadAddOn("SSoA_Options")
				if not ssoaOptions00:IsShown() then
					ssoaOptions00:Show ()
				else
					ssoaOptions00:Hide()
				end
			elseif loadable and loaded then
				if not ssoaOptions00:IsShown() then
					ssoaOptions00:Show ()
				else
					ssoaOptions00:Hide()
				end
			else
				ssoaTime = GameTime_GetTime(false)
				DEFAULT_CHAT_FRAME:AddMessage(ssoaTime.."|A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16|a ["..ssoaMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("SSoA", "Title")).."] The addon with the name "..ssoaMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("SSoA_Options", "Title")).." is "..reason.."!")
			end
		else
			ssoaTime = GameTime_GetTime(false)
			DEFAULT_CHAT_FRAME:AddMessage(ssoaTime.."|A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16|a ["..ssoaMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("SSoA", "Title")).."] You can't do this, while you are in combat!")
		end
	end
-- Mini Map Button Functions --
	AddonCompartmentFrame:RegisterAddon({
		text = ssoaMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("SSoA", "Title")),
		icon = C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas"),
		notCheckable = true,
		func = function(button, menuInputData, menu)
			local buttonName = menuInputData.buttonName
			if buttonName == "LeftButton" then
				ssoaShowMenu()
			end
		end,
		funcOnEnter = function(button)
			MenuUtil.ShowTooltip(button, function(tooltip)
			tooltip:SetOwner(button, "ANCHOR_TOP", 0, 0)
			tooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16|a "..ssoaMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("SSoA", "Title")).."|nLeft Click: "..ssoaMainColor:WrapTextInColorCode("Open the main panel of settings!"))
			end)
		end,
		funcOnLeave = function(button)
			MenuUtil.HideTooltip(button)
		end,
	})
-- Slash Command --
	RegisterNewSlashCommand(ssoaShowMenu, "ssoa", "sweetsoundofauctionhouse")
-- function for the visibility of SSoA frame --
	function ssoaFrameVisibility()
		if SSoAframeOpt["Show"] == 1 then
			ssoaTextyFrame:ClearAllPoints()
			ssoaTextyFrame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", SSoAframeOpt["X"], SSoAframeOpt["Y"])
			ssoaTextyFrame:SetWidth(SSoAframeOpt["Width"])
			ssoaTextyFrame:SetHeight(SSoAframeOpt["Height"])
			ssoaTextyFrame:Show()
		elseif SSoAframeOpt["Show"] == 0 then
			ssoaTextyFrame:ClearAllPoints()
			ssoaTextyFrame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", SSoAframeOpt["X"], SSoAframeOpt["Y"])
			ssoaTextyFrame:SetWidth(SSoAframeOpt["Width"])
			ssoaTextyFrame:SetHeight(SSoAframeOpt["Height"])
			ssoaTextyFrame:Hide()
		end
	end
-- function for the fonts of SSoA frame --
	function ssoaFrameFonts()
		--ssoaTextyFrame:SetTextColor(ssoaMainColor:GetRGB())
		if SSoAframeOpt["Fonts"] == 11 then
			ssoaTextyFrame:SetFontObject("ssoa_NormalShadowFonts_11")
		elseif SSoAframeOpt["Fonts"] == 12 then
			ssoaTextyFrame:SetFontObject("ssoa_NormalShadowFonts_12")
		elseif SSoAframeOpt["Fonts"] == 13 then
			ssoaTextyFrame:SetFontObject("ssoa_NormalShadowFonts_13")
		elseif SSoAframeOpt["Fonts"] == 14 then
			ssoaTextyFrame:SetFontObject("ssoa_NormalShadowFonts_14")
		elseif SSoAframeOpt["Fonts"] == 15 then
			ssoaTextyFrame:SetFontObject("ssoa_NormalShadowFonts_15")
		elseif SSoAframeOpt["Fonts"] == 16 then
			ssoaTextyFrame:SetFontObject("ssoa_NormalShadowFonts_16")
		elseif SSoAframeOpt["Fonts"] == 17 then
			ssoaTextyFrame:SetFontObject("ssoa_NormalShadowFonts_17")
		elseif SSoAframeOpt["Fonts"] == 18 then
			ssoaTextyFrame:SetFontObject("ssoa_NormalShadowFonts_18")
		end
		ssoaTextyFrame:SetTextColor(ssoaMainColor:GetRGB())
	end
-- function for the duretion of SSoA frame --
	function ssoaFrameDuration()
		ssoaTextyFrame:SetTimeVisible(SSoAframeOpt["Duration"])
		ssoaTextyFrame.BGtexture1:SetAlpha(SSoAframeOpt["BackgroundOpacity"])
		ssoaTextyFrame.TopRightTexture:SetAlpha(SSoAframeOpt["BackgroundOpacity"])
		ssoaTextyFrame.TopLeftTexture:SetAlpha(SSoAframeOpt["BackgroundOpacity"])
		ssoaTextyFrame.BGtexture2:SetAlpha(SSoAframeOpt["BackgroundOpacity"])
		ssoaTextyFrame.Title:SetAlpha(SSoAframeOpt["BackgroundOpacity"])
	end
end
-- Loading First Time the Variables --
local function FirstTimeSavedVariables()
	if SSoArNumber == nil then SSoArNumber = 0 end
	if SSoArProfile == nil then SSoArProfile ={} end
	if SSoArCounterLoading == nil or SSoArCounterLoading ~= nil then SSoArCounterLoading = 0 end
	if SSoArCounterDeleting == nil or SSoArCounterDeleting ~= nil then SSoArCounterDeleting = 0 end
	if SSoAsell == nil then
		SSoAsell = {
			Sound = "Cash Register Machine",
			Emote = "Cheer",
			ChatFrame = 1,
			SsoaFrame = 0,
		}
	end
	if SSoAexpire == nil then
		SSoAexpire = {
			Sound = "Zong",
			Emote = "Violin",
			ChatFrame = 1,
			SsoaFrame = 0,
		}
	end
	if SSoAframeOpt == nil then
		SSoAframeOpt = {
			Show = 0,
			X = 580,
			Y = 410,
			Width = 304,
			Height = 80,
			Loot = 0,
		}
	end
	if SSoAframeOpt["Fonts"] == nil then SSoAframeOpt["Fonts"] = 16 end
	if SSoAframeOpt["Duration"] == nil then SSoAframeOpt["Duration"] = 180 end
	if SSoAframeOpt["BackgroundOpacity"] == nil then SSoAframeOpt["BackgroundOpacity"] = 1 end
	if SSoAframeOpt["Money"] == nil then SSoAframeOpt["Money"] = 0 end
	if SSoAframeOpt["Currency"] == nil then SSoAframeOpt["Currency"] = 0 end
end
-- Scrolling Functions --
local function ScrollFrame_OnMouseWheel(self, delta)
	if delta == 1 then self:ScrollUp() elseif delta == -1 then self:ScrollDown() end
end
-- Taking care of the SSoA frame --
ssoaTextyFrame:SetScript("OnMouseWheel", ScrollFrame_OnMouseWheel)
ssoaTextyFrame:RegisterEvent("PLAYER_LOGIN")
ssoaTextyFrame:RegisterEvent("AUCTION_HOUSE_SHOW_FORMATTED_NOTIFICATION")
ssoaTextyFrame:RegisterEvent("CHAT_MSG_MONEY")
ssoaTextyFrame:RegisterEvent("CHAT_MSG_LOOT")
ssoaTextyFrame:RegisterEvent("CHAT_MSG_CURRENCY")
ssoaTextyFrame:SetJustifyH("LEFT")
ssoaTextyFrame:SetInsertMode(2)
ssoaTextyFrame:SetHyperlinksEnabled(true)
ssoaTextyFrame:SetScript("OnHyperlinkClick", ChatFrame_OnHyperlinkShow)

-- Function for the Selling Sounds --
local function SellingSounds()
	if SSoAsell["Sound"] == "Auction House's Sound" then
		PlaySound(5275, "Master")
	elseif SSoAsell["Sound"] == "Cash Register Machine" then
		PlaySoundFile("Interface\\AddOns\\SSoA\\Sounds\\CashRegisterSound.mp3", "Master")
	end
end
-- Function for the Selling Emotes --
local function SellingEmote()
	if SSoAsell["Emote"] == "Cheer" then
		DoEmote("CHEER", "none")
	elseif SSoAsell["Emote"] == "Congratulate" then
		DoEmote("Congratulate", "none")
	elseif SSoAsell["Emote"] == "Dance" then
		DoEmote("Dance", "none")
	elseif SSoAsell["Emote"] == "WHOA" then
		DoEmote("WHOA", "none")
	end
end
-- Function for Expiring Sounds --
local function ExpiringSounds()
	if SSoAexpire["Sound"] == "Zong" then
		PlaySoundFile("Interface\\AddOns\\SSoA\\Sounds\\Zong.mp3", "Master")
	elseif SSoAexpire["Sound"] == "Bells" then
		PlaySoundFile("Interface\\AddOns\\SSoA\\Sounds\\Bells.mp3", "Master")
	end
end
-- Function for Expiring Emotes --
local function ExpiringEmote()
	if SSoAexpire["Emote"] == "Mourn" then
		DoEmote("MOURN", "none")
	elseif SSoAexpire["Emote"] == "Angry" then
		DoEmote("Angry", "none")
	elseif SSoAexpire["Emote"] == "Violin" then
		DoEmote("Violin", "none")
	elseif SSoAexpire["Emote"] == "OOPS" then
		DoEmote("OOPS", "none")
	end
end
-- Events time --
local function EventsTime(self, event, arg1, arg2, arg3)
	if event == "PLAYER_LOGIN" then
		CreateGlobalVariables()
		FirstTimeSavedVariables()
		ssoaFrameVisibility()
		ssoaFrameFonts()
		ssoaFrameDuration()
	elseif event == "CHAT_MSG_MONEY" then
		if SSoAframeOpt["Money"] == 1 then
			ssoaTime = GameTime_GetTime(false)
			self:AddMessage("[|cnWHITE_FONT_COLOR:"..ssoaTime.."|r] "..arg1)
		end
	elseif event == "CHAT_MSG_LOOT" then
		if SSoAframeOpt["Loot"] == 1 then
			ssoaTime = GameTime_GetTime(false)
			self:AddMessage("[|cnWHITE_FONT_COLOR:"..ssoaTime.."|r] "..arg1)
		end
	elseif event == "CHAT_MSG_CURRENCY" then
		if SSoAframeOpt["Currency"] == 1 then
			ssoaTime = GameTime_GetTime(false)
			self:AddMessage("[|cnWHITE_FONT_COLOR:"..ssoaTime.."|r] "..arg1)
		end
	elseif event == "AUCTION_HOUSE_SHOW_FORMATTED_NOTIFICATION" and arg1 == 4 then
		ssoaTime = GameTime_GetTime(false)
		if SSoAsell["ChatFrame"] == 1 then
			DEFAULT_CHAT_FRAME:AddMessage("["..ssoaTime.."] Your Auction for "..ssoaHighColor:WrapTextInColorCode(arg2).." has been |cnDARKYELLOW_FONT_COLOR:sold|r")
		end
		if SSoAsell["SsoaFrame"] == 1 then
			self:AddMessage("[|cnWHITE_FONT_COLOR:"..ssoaTime.."|r] Your Auction for "..ssoaHighColor:WrapTextInColorCode(arg2).." has been |cnDARKYELLOW_FONT_COLOR:sold|r")
		end
		SellingSounds()
		SellingEmote()
	elseif event == "AUCTION_HOUSE_SHOW_FORMATTED_NOTIFICATION" and arg1 == 5 then
		ssoaTime = GameTime_GetTime(false)
		if SSoAexpire["ChatFrame"] == 1 then
			DEFAULT_CHAT_FRAME:AddMessage("["..ssoaTime.."|r] Your Auction for "..ssoaHighColor:WrapTextInColorCode(arg2).." has been |cFF991A4Dexpired|r")
		end
		if SSoAexpire["SsoaFrame"] == 1 then
			self:AddMessage("[|cnWHITE_FONT_COLOR:"..ssoaTime.."|r] Your Auction for "..ssoaHighColor:WrapTextInColorCode(arg2).." has been |cFF991A4Dexpired|r")
		end
		ExpiringSounds()
		ExpiringEmote()
	end
end
ssoaTextyFrame:SetScript("OnEvent", EventsTime)
