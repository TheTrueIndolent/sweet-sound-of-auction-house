--taking care of the panel --
ssoaOptions1.TopTxt:SetText("Auction House notifications!")
-- taking care of the boxes --
ssoaOptions1Box1.TitleTxt:SetText("Selling Notifications")
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
-- Box 1 --
-- pop out 1, Selling Chat --
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
-- enter --
ssoaOptions1Box1PopOut1:SetScript("OnEnter", function(self)
	ssoaEnteringMenus(self)
	GameTooltip:SetText(ssoaMainColor:WrapTextInColorCode("|A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16|a "..C_AddOns.GetAddOnMetadata("SSoA", "Title")).."|nWhere would you like,|nthe notification to be shown?") 
end)
-- click --
for i = 0, 3, 1 do
	_G["ssoaOptions1Box1PopOut1Choice"..i]:HookScript("OnClick", function(self, button, down)
		ssoaOptions1Box1PopOut1.Text:SetText(self.Text:GetText())
		ssoaOptions1Box1PopOut1Choice0:Hide()
		if self.Text:GetText() == "None" then
			SSoAsell["ChatFrame"] = 0
			SSoAsell["SsoaFrame"] = 0
		elseif self.Text:GetText() == "Deafult Chat" then
			SSoAsell["ChatFrame"] = 1
			SSoAsell["SsoaFrame"] = 0
		elseif self.Text:GetText() == "SSoA Frame" then
			SSoAsell["ChatFrame"] = 0
			SSoAsell["SsoaFrame"] = 1
		elseif self.Text:GetText() == "Both of them" then
			SSoAsell["ChatFrame"] = 1
			SSoAsell["SsoaFrame"] = 1
		end
	end)
end
-- Box 1, pop out 2, Selling Sound --
-- naming --
ssoaOptions1Box1PopOut2Choice0.Text:SetText("None")
ssoaOptions1Box1PopOut2Choice1.Text:SetText("Auction House's Sound")
ssoaOptions1Box1PopOut2Choice2.Text:SetText("Cash Register Machine")
-- parent & sort --
for i = 1, 2, 1 do
	_G["ssoaOptions1Box1PopOut2Choice"..i]:SetParent(ssoaOptions1Box1PopOut2Choice0)
	_G["ssoaOptions1Box1PopOut2Choice"..i]:SetPoint("TOP", _G["ssoaOptions1Box1PopOut2Choice"..i-1], "BOTTOM", 0, 0)
end
-- enter --
ssoaOptions1Box1PopOut2:SetScript("OnEnter", function(self)
	ssoaEnteringMenus(self)
	GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16|a "..ssoaMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("SSoA", "Title")).."|nWhich sound would you like to hear,|nwhen you sell an item at AH?") 
end)
-- clicking --
for i = 0, 2, 1 do
	_G["ssoaOptions1Box1PopOut2Choice"..i]:HookScript("OnClick", function(self, button, down)
		ssoaOptions1Box1PopOut2.Text:SetText(self.Text:GetText())
		SSoAsell["Sound"] = self.Text:GetText()
		ssoaOptions1Box1PopOut2Choice0:Hide()
		if SSoAsell["Sound"] == "None" then
			ssoaTime = GameTime_GetTime(false)
			DEFAULT_CHAT_FRAME:AddMessage(ssoaTime.."|A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16|a ["..ssoaMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("SSoA", "Title")).."] There will be no sound when your auction is sold!")
		elseif SSoAsell["Sound"] == "Auction House's Sound" then
			PlaySound(5275, "Master")
		elseif SSoAsell["Sound"] == "Cash Register Machine" then
			PlaySoundFile("Interface\\AddOns\\SSoA\\Sounds\\CashRegisterSound.mp3", "Master")
		end
	end)
end
-- Box 1, pop out 3, Selling Emote --
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
-- enter --
ssoaOptions1Box1PopOut3:SetScript("OnEnter", function(self)
	ssoaEnteringMenus(self)
	GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16|a "..ssoaMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("SSoA", "Title")).."|nWhich eMote would you like to do,|nwhen you sell an item at AH?") 
end)
-- click --
for i = 0, 4, 1 do
	_G["ssoaOptions1Box1PopOut3Choice"..i]:HookScript("OnClick", function(self, button, down)
		ssoaOptions1Box1PopOut3.Text:SetText(self.Text:GetText())
		SSoAsell["Emote"] = self.Text:GetText()
		ssoaOptions1Box1PopOut3Choice0:Hide()
		if SSoAsell["Emote"] == "None" then
			ssoaTime = GameTime_GetTime(false)
			DEFAULT_CHAT_FRAME:AddMessage(ssoaTime.."|A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16|a ["..ssoaMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("SSoA", "Title")).."] There will be no eMote when your auction is sold!")
		elseif SSoAsell["Emote"] == "Cheer" then
			DoEmote("CHEER","none")
		elseif SSoAsell["Emote"] == "Congratulate" then
			DoEmote("Congratulate","none")
		elseif SSoAsell["Emote"] == "Dance" then
			DoEmote("Dance","none")
		elseif SSoAsell["Emote"] == "WHOA" then
			DoEmote("WHOA","none")
		end
	end)
end
-- Box 2, pop out 1, Expired Chat --
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
-- enter --
ssoaOptions1Box2PopOut1:SetScript("OnEnter", function(self)
	ssoaEnteringMenus(self)
	GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16|a "..ssoaMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("SSoA", "Title")).."|nWhere would you like,|nthe notification to be shown?") 
end)
-- click --
for i = 0, 3, 1 do
	_G["ssoaOptions1Box2PopOut1Choice"..i]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			ssoaOptions1Box2PopOut1.Text:SetText(self.Text:GetText())
			ssoaOptions1Box2PopOut1Choice0:Hide()
			if self.Text:GetText() == "None" then
				SSoAexpire["ChatFrame"] = 0
				SSoAexpire["SsoaFrame"] = 0
			elseif self.Text:GetText() == "Deafult Chat" then
				SSoAexpire["ChatFrame"] = 1
				SSoAexpire["SsoaFrame"] = 0
			elseif self.Text:GetText() == "SSoA Frame" then
				SSoAexpire["ChatFrame"] = 0
				SSoAexpire["SsoaFrame"] = 1
			elseif self.Text:GetText() == "Both of them" then
				SSoAexpire["ChatFrame"] = 1
				SSoAexpire["SsoaFrame"] = 1
			end
		end
	end)
end
-- Box 2, pop out 2, Expired Sound --
-- naming --
ssoaOptions1Box2PopOut2Choice0.Text:SetText("None")
ssoaOptions1Box2PopOut2Choice1.Text:SetText("Zong")
ssoaOptions1Box2PopOut2Choice2.Text:SetText("Bells")
-- parent & sort --
for i = 1, 2, 1 do
	_G["ssoaOptions1Box2PopOut2Choice"..i]:SetParent(ssoaOptions1Box2PopOut2Choice0)
	_G["ssoaOptions1Box2PopOut2Choice"..i]:SetPoint("TOP", _G["ssoaOptions1Box2PopOut2Choice"..i-1], "BOTTOM", 0, 0)
end
-- enter --
ssoaOptions1Box2PopOut2:SetScript("OnEnter", function(self)
	ssoaEnteringMenus(self)
	GameTooltip:SetText(ssoaMainColor:WrapTextInColorCode("|A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16|a "..C_AddOns.GetAddOnMetadata("SSoA", "Title")).."|nWhich sound would you like to hear,|nwhen an auction has been expired?") 
end)
-- click --
for i = 0, 2, 1 do
	_G["ssoaOptions1Box2PopOut2Choice"..i]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			ssoaOptions1Box2PopOut2.Text:SetText(self.Text:GetText())
			SSoAexpire["Sound"] = self.Text:GetText()
			ssoaOptions1Box2PopOut2Choice0:Hide()
			if SSoAexpire["Sound"] == "None" then
				ssoaTime = GameTime_GetTime(false)
				DEFAULT_CHAT_FRAME:AddMessage(ssoaTime.."|A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16|a ["..ssoaMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("SSoA", "Title")).."] There will be no sound when your auction is expired!")
			elseif SSoAexpire["Sound"] == "Zong" then
				PlaySoundFile("Interface\\AddOns\\SSoA\\Sounds\\Zong.mp3", "Master")
			elseif SSoAexpire["Sound"] == "Bells" then
				PlaySoundFile("Interface\\AddOns\\SSoA\\Sounds\\Bells.mp3", "Master")
			end
		end
	end)
end
-- Box 2, pop out 3, Expired Emote --
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
-- enter --
ssoaOptions1Box2PopOut3:SetScript("OnEnter", function(self)
	ssoaEnteringMenus(self)
	GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16|a "..ssoaMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("SSoA", "Title")).."|nWhich eMote would you like to do,|nwhen an auction has been expired?") 
end)
-- click --
for i = 0, 4, 1 do
	_G["ssoaOptions1Box2PopOut3Choice"..i]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			ssoaOptions1Box2PopOut3.Text:SetText(self.Text:GetText())
			SSoAexpire["Emote"] = self.Text:GetText()
			ssoaOptions1Box2PopOut3Choice0:Hide()
			if SSoAexpire["Emote"] == "None" then
				ssoaTime = GameTime_GetTime(false)
				DEFAULT_CHAT_FRAME:AddMessage(ssoaTime.."|A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16|a ["..ssoaMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("SSoA", "Title")).."] There will be no eMote when your auction is expired!")
			elseif SSoAexpire["Emote"] == "Mourn" then
				DoEmote("MOURN","none")
			elseif SSoAexpire["Emote"] == "Angry" then
				DoEmote("Angry","none")
			elseif SSoAexpire["Emote"] == "Violin" then
				DoEmote("Violin","none")
			elseif SSoAexpire["Emote"] == "OOPS" then
				DoEmote("OOPS","none")
			end
		end
	end)
end
-- Show the panel --
ssoaOptions1:HookScript("OnShow", function(self)
	CheckSavedVariables()
	ssoaOptions00Tab1.Text:SetTextColor(ssoaHighColor:GetRGB())
	ssoaOptions00Tab2.Text:SetTextColor(ssoaMainColor:GetRGB())
	ssoaOptions00Tab3.Text:SetTextColor(ssoaMainColor:GetRGB())
	if ssoaOptions2:IsShown() then ssoaOptions2:Hide() end
	if ssoaOptions3:IsShown() then ssoaOptions3:Hide() end
end)
