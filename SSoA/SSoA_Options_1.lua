-- taking of care the panel --
ssoaOptions1.TopTxt:SetText("Auction House notifications!")
-- taking care of the boxes --
ssoaOptions1Box1.TitleTxt:SetText("Selling Notifications")
ssoaOptions1Box2:SetPoint("TOP", ssoaOptions1Box1, "BOTTOM", 0, 0)
ssoaOptions1Box2.TitleTxt:SetText("Expired Notifications")
-- Checking the Saved Variables --
local function CheckSavedVariables()
	if SSoAsell["ChatFrame"] == 0 and SSoAsell["SsoaFrame"] == 0 then
		ssoaOptions1Box1PopOut1:SetText(ssoaOptions1Box1PopOut1Choice0.Text:GetText())
	elseif SSoAsell["ChatFrame"] == 1 and SSoAsell["SsoaFrame"] == 0 then
		ssoaOptions1Box1PopOut1:SetText(ssoaOptions1Box1PopOut1Choice1.Text:GetText())
	elseif SSoAsell["ChatFrame"] == 0 and SSoAsell["SsoaFrame"] == 1 then
		ssoaOptions1Box1PopOut1:SetText(ssoaOptions1Box1PopOut1Choice2.Text:GetText())
	elseif SSoAsell["ChatFrame"] == 1 and SSoAsell["SsoaFrame"] == 1 then
		ssoaOptions1Box1PopOut1:SetText(ssoaOptions1Box1PopOut1Choice3.Text:GetText())
	end
	if SSoAexpire["ChatFrame"] == 0 and SSoAexpire["SsoaFrame"] == 0 then
		ssoaOptions1Box2PopOut1:SetText(ssoaOptions1Box2PopOut1Choice0.Text:GetText())
	elseif SSoAexpire["ChatFrame"] == 1 and SSoAexpire["SsoaFrame"] == 0 then
		ssoaOptions1Box2PopOut1:SetText(ssoaOptions1Box2PopOut1Choice1.Text:GetText())
	elseif SSoAexpire["ChatFrame"] == 0 and SSoAexpire["SsoaFrame"] == 1 then
		ssoaOptions1Box2PopOut1:SetText(ssoaOptions1Box2PopOut1Choice2.Text:GetText())
	elseif SSoAexpire["ChatFrame"] == 1 and SSoAexpire["SsoaFrame"] == 1 then
		ssoaOptions1Box2PopOut1:SetText(ssoaOptions1Box2PopOut1Choice3.Text:GetText())
	end
	ssoaOptions1Box1PopOut2:SetText(SSoAsell["Sound"])
	ssoaOptions1Box1PopOut3:SetText(SSoAsell["Emote"])
	ssoaOptions1Box2PopOut2:SetText(SSoAexpire["Sound"])
	ssoaOptions1Box2PopOut3:SetText(SSoAexpire["Emote"])
end
-- function for the same things in pop out --
local function SamePopOut(popout, parent, self)
	popout.Text:SetText(self:GetText())
	parent:Hide()
end
-- function for the same things in pop out --
local function SamePopOutPlus(popout, parent, textv, self)
	textv = self.Text:GetText()
	popout.Text:SetText(self:GetText())
	parent:Hide()
end
-- Box 1 --
-- pop out 1, Selling Chat --
-- Enter --
ssoaOptions1Box1PopOut1:SetScript("OnEnter", function(self)
	ssoaEnteringMenus(self)
	GameTooltip:SetText(ssoaMainColor:WrapTextInColorCode("|A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16|a "..C_AddOns.GetAddOnMetadata("SSoA", "Title")).."|nWhere would you like,|nthe notification to be shown?") 
end)
-- leave --
ssoaOptions1Box1PopOut1:SetScript("OnLeave", ssoaLeavingMenus)
-- drop down --
ssoaClickPopOut(ssoaOptions1Box1PopOut1, ssoaOptions1Box1PopOut1Choice0)
-- naming --
ssoaOptions1Box1PopOut1Choice0.Text:SetText("None")
ssoaOptions1Box1PopOut1Choice1.Text:SetText("Deafult Chat")
ssoaOptions1Box1PopOut1Choice2.Text:SetText("SSoA Frame")
ssoaOptions1Box1PopOut1Choice3.Text:SetText("Both of them")
-- parent & sort --
for i = 1, 3, 1 do
	_G["ssoaOptions1Box1PopOut1Choice"..i]:SetParent(ssoaOptions1Box1PopOut1Choice0)
	_G["ssoaOptions1Box1PopOut1Choice"..i]:SetPoint("TOP", _G["ssoaOptions1Box1PopOut1Choice"..i-1], "BOTTOM", 0, 0)
end
-- choice 0 None --
ssoaOptions1Box1PopOut1Choice0:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		SSoAsell["ChatFrame"] = 0
		SSoAsell["SsoaFrame"] = 0
		SamePopOut(ssoaOptions1Box1PopOut1, ssoaOptions1Box1PopOut1Choice0, self)
	end
end)
-- choice 1 Deafult Chat --
ssoaOptions1Box1PopOut1Choice1:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		SSoAsell["ChatFrame"] = 1
		SSoAsell["SsoaFrame"] = 0
		SamePopOut(ssoaOptions1Box1PopOut1, ssoaOptions1Box1PopOut1Choice0, self)
	end
end)
-- choice 2 SSoA Frame --
ssoaOptions1Box1PopOut1Choice2:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		SSoAsell["ChatFrame"] = 0
		SSoAsell["SsoaFrame"] = 1
		SamePopOut(ssoaOptions1Box1PopOut1, ssoaOptions1Box1PopOut1Choice0, self)
	end
end)
-- choice 3 Both of them --
ssoaOptions1Box1PopOut1Choice3:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		SSoAsell["ChatFrame"] = 1
		SSoAsell["SsoaFrame"] = 1
		SamePopOut(ssoaOptions1Box1PopOut1, ssoaOptions1Box1PopOut1Choice0, self)
	end
end)
-- Box 1, pop out 2, Selling Sound --
-- Entere --
ssoaOptions1Box1PopOut2:SetScript("OnEnter", function(self)
	ssoaEnteringMenus(self)
	GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16|a "..ssoaMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("SSoA", "Title")).."|nWhich sound would you like to hear,|nwhen you sell an item at AH?") 
end)
-- leave --
ssoaOptions1Box1PopOut2:SetScript("OnLeave", ssoaLeavingMenus)
-- drop down --
ssoaClickPopOut(ssoaOptions1Box1PopOut2, ssoaOptions1Box1PopOut2Choice0)
-- naming --
ssoaOptions1Box1PopOut2Choice0.Text:SetText("None")
ssoaOptions1Box1PopOut2Choice1.Text:SetText("Auction House's Sound")
ssoaOptions1Box1PopOut2Choice2.Text:SetText("Cash Register Machine")
-- parent & sort --
for i = 1, 2, 1 do
	_G["ssoaOptions1Box1PopOut2Choice"..i]:SetParent(ssoaOptions1Box1PopOut2Choice0)
	_G["ssoaOptions1Box1PopOut2Choice"..i]:SetPoint("TOP", _G["ssoaOptions1Box1PopOut2Choice"..i-1], "BOTTOM", 0, 0)
end
-- choice 0 None --
ssoaOptions1Box1PopOut2Choice0:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		SamePopOutPlus(ssoaOptions1Box1PopOut2, ssoaOptions1Box1PopOut2Choice0, SSoAsell["Sound"], self)
	end
end)
-- choice 1 Auction House's Sound --
ssoaOptions1Box1PopOut2Choice1:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		SamePopOutPlus(ssoaOptions1Box1PopOut2, ssoaOptions1Box1PopOut2Choice0, SSoAsell["Sound"], self)
		PlaySound(5275, "Master")
	end
end)
-- choice 2 Cash Register Machine --
ssoaOptions1Box1PopOut2Choice2:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		SamePopOutPlus(ssoaOptions1Box1PopOut2, ssoaOptions1Box1PopOut2Choice0, SSoAsell["Sound"], self)
		PlaySoundFile("Interface\\AddOns\\SSoA\\Sounds\\CashRegisterSound.mp3", "Master")
	end
end)
-- Box 1, pop out 3, Selling Emote --
-- Enter --
ssoaOptions1Box1PopOut3:SetScript("OnEnter", function(self)
	ssoaEnteringMenus(self)
	GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16|a "..ssoaMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("SSoA", "Title")).."|nWhich eMote would you like to do,|nwhen you sell an item at AH?") 
end)
-- leave --
ssoaOptions1Box1PopOut3:SetScript("OnLeave", ssoaLeavingMenus)
-- drop down --
ssoaClickPopOut(ssoaOptions1Box1PopOut3, ssoaOptions1Box1PopOut3Choice0)
-- naming --
ssoaOptions1Box1PopOut3Choice0.Text:SetText("None")
ssoaOptions1Box1PopOut3Choice1.Text:SetText("Cheer")
ssoaOptions1Box1PopOut3Choice2.Text:SetText("Congratulate")
ssoaOptions1Box1PopOut3Choice3.Text:SetText("Dance")
ssoaOptions1Box1PopOut3Choice4.Text:SetText("WHOA")
-- parent & sort --
for i = 1, 4, 1 do
	_G["ssoaOptions1Box1PopOut3Choice"..i]:SetParent(ssoaOptions1Box1PopOut3Choice0)
	_G["ssoaOptions1Box1PopOut3Choice"..i]:SetPoint("TOP", _G["ssoaOptions1Box1PopOut3Choice"..i-1], "BOTTOM", 0, 0)
end
-- choice 0 None --
ssoaOptions1Box1PopOut3Choice0:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		SamePopOutPlus(ssoaOptions1Box1PopOut3, ssoaOptions1Box1PopOut3Choice0, SSoAsell["Emote"], self)
	end
end)
-- choice 1 Cheer --

ssoaOptions1Box1PopOut3Choice1:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		SamePopOutPlus(ssoaOptions1Box1PopOut3, ssoaOptions1Box1PopOut3Choice0, SSoAsell["Emote"], self)
		DoEmote("CHEER","none")
	end
end)
-- choice 2 Congratulate --
ssoaOptions1Box1PopOut3Choice2:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		SamePopOutPlus(ssoaOptions1Box1PopOut3, ssoaOptions1Box1PopOut3Choice0, SSoAsell["Emote"], self)
		DoEmote("Congratulate","none")
	end
end)
-- choice 3 Dance --
ssoaOptions1Box1PopOut3Choice3:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		SamePopOutPlus(ssoaOptions1Box1PopOut3, ssoaOptions1Box1PopOut3Choice0, SSoAsell["Emote"], self)
		DoEmote("Dance","none")
	end
end)
-- choice 4 WHOA --
ssoaOptions1Box1PopOut3Choice4:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		SamePopOutPlus(ssoaOptions1Box1PopOut3, ssoaOptions1Box1PopOut3Choice0, SSoAsell["Emote"], self)
		DoEmote("WHOA","none")
	end
end)
-- Box 2, pop out 1, Expired Chat --
-- Enter --
ssoaOptions1Box2PopOut1:SetScript("OnEnter", function(self)
	ssoaEnteringMenus(self)
	GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16|a "..ssoaMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("SSoA", "Title")).."|nWhere would you like,|nthe notification to be shown?") 
end)
-- leave --
ssoaOptions1Box2PopOut1:SetScript("OnLeave", ssoaLeavingMenus)
-- drop down --
ssoaClickPopOut(ssoaOptions1Box2PopOut1, ssoaOptions1Box2PopOut1Choice0)
-- naming --
ssoaOptions1Box2PopOut1Choice0.Text:SetText("None")
ssoaOptions1Box2PopOut1Choice1.Text:SetText("Deafult Chat")
ssoaOptions1Box2PopOut1Choice2.Text:SetText("SSoA Frame")
ssoaOptions1Box2PopOut1Choice3.Text:SetText("Both of them")
-- parent & sort --
for i = 1, 3, 1 do
	_G["ssoaOptions1Box2PopOut1Choice"..i]:SetParent(ssoaOptions1Box2PopOut1Choice0)
	_G["ssoaOptions1Box2PopOut1Choice"..i]:SetPoint("TOP", _G["ssoaOptions1Box2PopOut1Choice"..i-1], "BOTTOM", 0, 0)
end
-- choice 0 None --
ssoaOptions1Box2PopOut1Choice0:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		SSoAexpire["ChatFrame"] = 0
		SSoAexpire["SsoaFrame"] = 0
		SamePopOut(ssoaOptions1Box2PopOut1, ssoaOptions1Box2PopOut1Choice0, self)
	end
end)
-- choice 1 Deafult Chat --
ssoaOptions1Box2PopOut1Choice1:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		SSoAexpire["ChatFrame"] = 1
		SSoAexpire["SsoaFrame"] = 0
		SamePopOut(ssoaOptions1Box2PopOut1, ssoaOptions1Box2PopOut1Choice0, self)
	end
end)
-- choice 2 SSoA Frame --
ssoaOptions1Box2PopOut1Choice2:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		SSoAexpire["ChatFrame"] = 0
		SSoAexpire["SsoaFrame"] = 1
		SamePopOut(ssoaOptions1Box2PopOut1, ssoaOptions1Box2PopOut1Choice0, self)
	end
end)
-- choice 3 Both of them --
ssoaOptions1Box2PopOut1Choice3:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		SSoAexpire["ChatFrame"] = 1
		SSoAexpire["SsoaFrame"] = 1
		SamePopOut(ssoaOptions1Box2PopOut1, ssoaOptions1Box2PopOut1Choice0, self)
	end
end)
-- Box 2, pop out 2, Expired Sound --
-- Enter --
ssoaOptions1Box2PopOut2:SetScript("OnEnter", function(self)
	ssoaEnteringMenus(self)
	GameTooltip:SetText(ssoaMainColor:WrapTextInColorCode("|A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16|a "..C_AddOns.GetAddOnMetadata("SSoA", "Title")).."|nWhich sound would you like to hear,|nwhen an auction has been expired?") 
end)
-- leave --
ssoaOptions1Box2PopOut2:SetScript("OnLeave", ssoaLeavingMenus)
-- drop down --
ssoaClickPopOut(ssoaOptions1Box2PopOut2, ssoaOptions1Box2PopOut2Choice0)
-- naming --
ssoaOptions1Box2PopOut2Choice0.Text:SetText("None")
ssoaOptions1Box2PopOut2Choice1.Text:SetText("Zong")
ssoaOptions1Box2PopOut2Choice2.Text:SetText("Bells")
-- parent & sort --
for i = 1, 2, 1 do
	_G["ssoaOptions1Box2PopOut2Choice"..i]:SetParent(ssoaOptions1Box2PopOut2Choice0)
	_G["ssoaOptions1Box2PopOut2Choice"..i]:SetPoint("TOP", _G["ssoaOptions1Box2PopOut2Choice"..i-1], "BOTTOM", 0, 0)
end
-- choice 0 None --
ssoaOptions1Box2PopOut2Choice0:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		SamePopOutPlus(ssoaOptions1Box2PopOut2, ssoaOptions1Box2PopOut2Choice0, SSoAexpire["Sound"], self)
	end
end)
-- choice 1 Zong --
ssoaOptions1Box2PopOut2Choice1:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		SamePopOutPlus(ssoaOptions1Box2PopOut2, ssoaOptions1Box2PopOut2Choice0, SSoAexpire["Sound"], self)
		PlaySoundFile("Interface\\AddOns\\SSoA\\Sounds\\Zong.mp3", "Master")
	end
end)
-- choice 2 Bells --
ssoaOptions1Box2PopOut2Choice2:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		SamePopOutPlus(ssoaOptions1Box2PopOut2, ssoaOptions1Box2PopOut2Choice0, SSoAexpire["Sound"], self)
		PlaySoundFile("Interface\\AddOns\\SSoA\\Sounds\\Bells.mp3", "Master")
	end
end)
-- Box 2, pop out 3, Expired Emote --
-- Enter --
ssoaOptions1Box2PopOut3:SetScript("OnEnter", function(self)
	ssoaEnteringMenus(self)
	GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16|a "..ssoaMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("SSoA", "Title")).."|nWhich eMote would you like to do,|nwhen an auction has been expired?") 
end)
-- leave --
ssoaOptions1Box2PopOut3:SetScript("OnLeave", ssoaLeavingMenus)
-- drop down --
ssoaClickPopOut(ssoaOptions1Box2PopOut3, ssoaOptions1Box2PopOut3Choice0)
-- naming --
ssoaOptions1Box2PopOut3Choice0.Text:SetText("None")
ssoaOptions1Box2PopOut3Choice1.Text:SetText("Mourn")
ssoaOptions1Box2PopOut3Choice2.Text:SetText("Angry")
ssoaOptions1Box2PopOut3Choice3.Text:SetText("Violin")
ssoaOptions1Box2PopOut3Choice4.Text:SetText("OOPS")
-- paret & sort --
for i = 1, 4, 1 do
	_G["ssoaOptions1Box2PopOut3Choice"..i]:SetParent(ssoaOptions1Box2PopOut3Choice0)
	_G["ssoaOptions1Box2PopOut3Choice"..i]:SetPoint("TOP", _G["ssoaOptions1Box2PopOut3Choice"..i-1], "BOTTOM", 0, 0)
end
-- choice 0 None --
ssoaOptions1Box2PopOut3Choice0:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		SamePopOutPlus(ssoaOptions1Box2PopOut3, ssoaOptions1Box2PopOut3Choice0, SSoAexpire["Emote"], self)
	end
end)
-- choice 1 Mourn --
ssoaOptions1Box2PopOut3Choice1:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		SamePopOutPlus(ssoaOptions1Box2PopOut3, ssoaOptions1Box2PopOut3Choice0, SSoAexpire["Emote"], self)
		DoEmote("MOURN","none")
	end
end)
-- choice 2 Angry --
ssoaOptions1Box2PopOut3Choice2:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		SamePopOutPlus(ssoaOptions1Box2PopOut3, ssoaOptions1Box2PopOut3Choice0, SSoAexpire["Emote"], self)
		DoEmote("Angry","none")
	end
end)
-- choice 3 Violin --
ssoaOptions1Box2PopOut3Choice3:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		SamePopOutPlus(ssoaOptions1Box2PopOut3, ssoaOptions1Box2PopOut3Choice0, SSoAexpire["Emote"], self)
		DoEmote("Violin","none")
	end
end)
-- choice 4 OOPS --
ssoaOptions1Box2PopOut3Choice4:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		SamePopOutPlus(ssoaOptions1Box2PopOut3, ssoaOptions1Box2PopOut3Choice0, SSoAexpire["Emote"], self)
		DoEmote("OOPS","none")
	end
end)
-- Show the panel --
ssoaOptions1:HookScript("OnShow", function(self)
	CheckSavedVariables()
	ssoaOptions00Tab1.Text:SetTextColor(ssoaHighColor:GetRGB())
	ssoaOptions00Tab2.Text:SetTextColor(ssoaMainColor:GetRGB())
	ssoaOptions00Tab3.Text:SetTextColor(ssoaMainColor:GetRGB())
	ssoaOptions00Tab4.Text:SetTextColor(ssoaMainColor:GetRGB())
	if ssoaOptions2:IsShown() then ssoaOptions2:Hide() end
	if ssoaOptions3:IsShown() then ssoaOptions3:Hide() end
	if ssoaOptions4:IsShown() then ssoaOptions4:Hide() end
end)
