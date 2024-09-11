-- Colors --
ssoaMainColor = CreateColorFromRGBAHexString("F0E68CFF")
ssoaHighColor = CreateColorFromRGBAHexString("00BFFFFF")
ssoaNoMainColor = CreateColorFromRGBAHexString("F0E68C00")
ssoaNoHighColor = CreateColorFromRGBAHexString("00BFFF00")
ssoaNoColor = CreateColorFromRGBAHexString("00000000")
-- function for opening the options --
function ssoaOpenMenuPanel()
	if not ssoaOptions00:IsShown() then
		ssoaOptions00:Show ()
	else
		ssoaOptions00:Hide()
	end
end
-- Slash Command --
SLASH_SWEETSOUNDOFAUCTIONHOUSE1, SLASH_SWEETSOUNDOFAUCTIONHOUSE2 = '/ssoa', '/sweetsoundofauctionhouse'
function SlashCmdList.SWEETSOUNDOFAUCTIONHOUSE(msg, editBox)
	ssoaOpenMenuPanel()
end
-- Mini Map Button Functions --
-- Clicky Clicky --
function ssoaMinimapClick(addonName, buttonName)
	if buttonName == "LeftButton" then
		ssoaOpenMenuPanel()
	end
end
-- On Enter --
function ssoaMinimapOnEnter()
	GameTooltip_ClearStatusBars(GameTooltip)
	GameTooltip_SetDefaultAnchor(GameTooltip, UIParent)
	GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16|a "..C_AddOns.GetAddOnMetadata("SSoA", "Title").."|nClick: "..ssoaMainColor:WrapTextInColorCode("Open the main panel of settings!")) 
	GameTooltip:Show()
end
-- On Leave --
function ssoaMinimapOnLeave()
	GameTooltip:Hide()
end
-- Options Menu --
-- on enter mouse options --
function ssoaEnteringMenus(self)
	GameTooltip_ClearStatusBars(GameTooltip)
	GameTooltip:SetOwner(self, "ANCHOR_NONE")
	GameTooltip:ClearAllPoints()
	GameTooltip:SetPoint("RIGHT", self, "LEFT", 0, 0)
end
-- on leave mouse options --
function ssoaLeavingMenus()
	GameTooltip:Hide()
end
-- click on Pop Out --
function ssoaClickPopOut(var1, var2)
	var1:SetScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			if not var2:IsShown() then
				var2:Show()
				PlaySound(855, "Master")
			else
				var2:Hide()
			end
		end
	end)
end
-- Some Variables --
ssoaTime = 0
ssoaCounter = 0
