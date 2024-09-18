-- taking care of the panel --
ssoaOptions0.BGtexture:SetAlpha(0.70)
ssoaOptions0.TopTxt:SetText("It would be good when you open the"..ssoaHighColor:WrapTextInColorCode(" Options' Panel ").."to close the other ones so you can watch what changes you are making!")
ssoaOptions0.CenterTxt:SetText("|A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16|a "..C_AddOns.GetAddOnMetadata("SSoA", "Title").." is an add on that enchants the notifications from the Auction House!|n|nPress the button below to open the options panel!")
ssoaOptions0.BottomTxt:SetText("Thank you for using this amazing add-on!|nYou are a |cff00CED1Funky|r and a |cffFF0055Groovy|r person!|nMay the good |cff9400D3Mojo|r be with you!")
-- button 1 options panel --
-- enter --
ssoaOptions0Button1.Text:SetText("Options Panel")
ssoaOptions0Button1:SetScript("OnEnter", function(self)
	ssoaEnteringMenus(self)
	GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16|a "..C_AddOns.GetAddOnMetadata("SSoA", "Title").."|nClick: "..ssoaMainColor:WrapTextInColorCode("Open the main panel of settings!"))
end)
-- leave --
ssoaOptions0Button1:SetScript("OnLeave", ssoaLeavingMenus)
-- click --
ssoaOptions0Button1:SetScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		ssoaOpenMenuPanel()
	end
end)
-- Move the Tabs --
ssoaOptions00:RegisterForDrag("LeftButton")
ssoaOptions00:SetScript("OnDragStart", ssoaOptions00.StartMoving)
ssoaOptions00:SetScript("OnDragStop", ssoaOptions00.StopMovingOrSizing)
-- taking care of the Tabs --
-- naming --
ssoaOptions00Tab1.Text:SetText("Notifications")
ssoaOptions00Tab2.Text:SetText("SSoA Frame I")
ssoaOptions00Tab3.Text:SetText("SSoA Frame II")
ssoaOptions00Tab4.Text:SetText("Profiles")
-- sort & hiding the texts --
for i = 2, 4, 1 do
	_G["ssoaOptions00Tab"..i]:SetPoint("TOP", _G["ssoaOptions00Tab"..i-1], "BOTTOM", 0, 0)
	_G["ssoaOptions00Tab"..i-1].CenterTxt:Hide()
end
ssoaOptions00Tab4.CenterTxt:SetText("Thank you for using this amazing add-on!|nYou are a |cff00CED1Funky|r and a |cffFF0055Groovy|r person!|nMay the good |cff9400D3Mojo|r be with you!")
-- tab background --
ssoaOptions00.BGtexture:SetGradient("VERTICAL", ssoaNoColor, ssoaHighColor)
ssoaOptions00.BGtexture:ClearAllPoints()
ssoaOptions00.BGtexture:SetPoint("TOPRIGHT", ssoaOptions00, "TOPRIGHT", 0, 0)
ssoaOptions00.BGtexture:SetPoint("BOTTOMLEFT", ssoaOptions00Tab4, "BOTTOMLEFT", 0, -128)
-- clicking on the tabs --
for i = 1, 4, 1 do
	_G["ssoaOptions00Tab"..i]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			if not _G["ssoaOptions"..i]:IsShown() then _G["ssoaOptions"..i]:Show() end
		end
	end)
end
-- showing the tabs --
ssoaOptions00:SetScript("OnShow", function(self)
	if not ssoaOptions1:IsShown() then ssoaOptions1:Show() end
end)
-- hiding the tabs --
ssoaOptions00:HookScript("OnHide", function(self)
	for i = 1, 4, 1 do
		if _G["ssoaOptions"..i]:IsShown() then _G["ssoaOptions"..i]:Hide() end
	end
end)
-- Events Time --
local function EventsTime(self, event, arg1, arg2, arg3, arg4)
	if event == "PLAYER_LOGIN" then
		local category = Settings.RegisterCanvasLayoutCategory(self, "SSoA")
		category:SetName("|A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16:0:-6|a "..C_AddOns.GetAddOnMetadata("SSoA", "Title"))
		Settings.RegisterAddOnCategory(category)
	end
end
ssoaOptions0:SetScript("OnEvent", EventsTime)
