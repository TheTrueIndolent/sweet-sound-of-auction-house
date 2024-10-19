-- Move the Tabs --
ssoaOptions00:RegisterForDrag("LeftButton")
ssoaOptions00:SetScript("OnDragStart", ssoaOptions00.StartMoving)
ssoaOptions00:SetScript("OnDragStop", ssoaOptions00.StopMovingOrSizing)
-- taking care of the Tabs --
-- naming --
ssoaOptions00Tab1.Text:SetText("Notifications")
ssoaOptions00Tab2.Text:SetText("SSoA Frame")
ssoaOptions00Tab3.Text:SetText("Profiles")
-- sort & hiding the texts --
for i = 2, 3, 1 do
	_G["ssoaOptions00Tab"..i]:SetPoint("TOP", _G["ssoaOptions00Tab"..i-1], "BOTTOM", 0, 0)
	_G["ssoaOptions00Tab"..i-1].CenterTxt:Hide()
end
ssoaOptions00Tab3.CenterTxt:SetText("Thank you for using this amazing add-on!|nYou are a |cff00CED1Funky|r and a |cffFF0055Groovy|r person!|nMay the good |cff9400D3Mojo|r be with you!")
ssoaOptions00.BGtexture:ClearAllPoints()
ssoaOptions00.BGtexture:SetPoint("TOPRIGHT", ssoaOptions00, "TOPRIGHT", 0, 0)
ssoaOptions00.BGtexture:SetPoint("BOTTOMLEFT", ssoaOptions00Tab3, "BOTTOMLEFT", 0, -128)
-- clicking on the tabs --
for i = 1, 3, 1 do
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
	for i = 1, 3, 1 do
		if _G["ssoaOptions"..i]:IsShown() then _G["ssoaOptions"..i]:Hide() end
	end
end)

