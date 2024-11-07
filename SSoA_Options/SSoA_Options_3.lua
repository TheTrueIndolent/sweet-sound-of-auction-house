-- taking care of the panel --
ssoaOptions3.TopTxt:SetText("Create, load, and delete profiles!")
ssoaOptions3Box1.TitleTxt:SetText("Create a profile!")
ssoaOptions3Box2:SetPoint("TOP", ssoaOptions3Box1, "BOTTOM", 0, 0)
ssoaOptions3Box2.TitleTxt:SetText("Load a profile!")
ssoaOptions3Box3:SetPoint("TOP", ssoaOptions3Box2, "BOTTOM", 0, 0)
ssoaOptions3Box3.TitleTxt:SetText("Delete a profile!")
ssoaOptions3Box3.CenterTxt:SetText("|A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16|a "..ssoaHighColor:WrapTextInColorCode("Note: ").."When you "..ssoaHighColor:WrapTextInColorCode("SAVE")..", "..ssoaHighColor:WrapTextInColorCode("LOAD")..", or "..ssoaHighColor:WrapTextInColorCode("DELETE").." a Profile, the UI will be RELOADED!")
-- some variables --
local NameExist = false
-- finding keys --
local function FindingKeys()
	local Keys = 0
	for k, v in pairs(SSoArProfile) do
		Keys = Keys + 1
	end
	SSoArNumber = Keys
end
-- coping the tables --
local function CopyTable(k)
	SSoAsell = SSoArProfile[k]["Sell"]
	SSoAexpire = SSoArProfile[k]["Expire"]
	SSoAframeOpt = SSoArProfile[k]["Frame"]
end
-- deleting keys --
local function DeletingKeys(self)
	for k, v in pairs(SSoArProfile) do
		if k == self:GetText() then
		SSoArProfile[k] = nil
		end
	end
end
-- functions for loading the profiles --
local function LoadingProfiles()
	if SSoArCounterLoading == 0 and SSoArNumber > 0 then
		for k, v in pairs(SSoArProfile) do
			SSoArCounterLoading = SSoArCounterLoading + 1
			local button = CreateFrame("Button" , "ssoaOptions3Box2PopOut1Choice"..SSoArCounterLoading, ssoaOptions3Box2PopOut1Choice0, "ssoaPopOutButton")
			_G["ssoaOptions3Box2PopOut1Choice"..SSoArCounterLoading]:SetPoint("TOP","ssoaOptions3Box2PopOut1Choice"..SSoArCounterLoading - 1, "BOTTOM", 0, 0)
			_G["ssoaOptions3Box2PopOut1Choice"..SSoArCounterLoading].Text:SetText(k)
			_G["ssoaOptions3Box2PopOut1Choice"..SSoArCounterLoading]:SetScript("OnClick", function(self, button, down)
				if button == "LeftButton" and down == false then
					CopyTable(k)
					C_UI.Reload()
				end
			end)
		end
	end
end
-- functions for deleting the profiles --
local function DeletingProfiles()
	if SSoArCounterDeleting == 0 and SSoArNumber > 0 then
		for k, v in pairs(SSoArProfile) do
			SSoArCounterDeleting = SSoArCounterDeleting + 1
			local button = CreateFrame("Button" , "ssoaOptions3Box3PopOut1Choice"..SSoArCounterDeleting, ssoaOptions3Box3PopOut1Choice0, "ssoaPopOutButton")
			_G["ssoaOptions3Box3PopOut1Choice"..SSoArCounterDeleting]:SetPoint("TOP","ssoaOptions3Box3PopOut1Choice"..SSoArCounterDeleting - 1, "BOTTOM", 0, 0)
			_G["ssoaOptions3Box3PopOut1Choice"..SSoArCounterDeleting].Text:SetText(k)
			_G["ssoaOptions3Box3PopOut1Choice"..SSoArCounterDeleting]:SetScript("OnClick", function(self, button, down)
				if button == "LeftButton" and down == false then
					DeletingKeys(self)
					C_UI.Reload()
				end
			end)
		end
	end
end
-- taking care of the edit box --
-- width and height --
local fontFile, height, flags = ssoaOptions3Box1EditBox1.WritingLine:GetFont()
ssoaOptions3Box1EditBox1.WritingLine:SetHeight(height)
ssoaOptions3Box1EditBox1:SetWidth(ssoaOptions3Box1:GetWidth()*0.65)
ssoaOptions3Box1EditBox1:SetHeight(ssoaOptions3Box1EditBox1.WritingLine:GetHeight()*1.75)
ssoaOptions3Box1EditBox1.WritingLine:SetWidth(ssoaOptions3Box1EditBox1:GetWidth()*0.95)
-- entering, leaving --
ssoaOptions3Box1EditBox1.WritingLine:HookScript("OnEnter", function(self)
	ssoaEnteringMenus(self)
	GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16|a "..ssoaMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("SSoA", "Title")).."|nWrite a name for your profile in the Edit Box and|npress enter to save your settings/options!") 
end)
-- pressing enter --
ssoaOptions3Box1EditBox1.WritingLine:SetScript("OnEnterPressed", function(self)
	if self:HasText() then
		EditBox_HighlightText(self)
		local name = self:GetText()
		for k, v in pairs(SSoArProfile) do
			if k == name then
				NameExist = true
			else
				NameExist = false
			end
			if NameExist then
				local ssoaTime = GameTime_GetTime(false)
				DEFAULT_CHAT_FRAME:AddMessage(ssoaTime.." |A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16|a ["..ssoaMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("SSoA", "Title")).."] This Profile already exist please try another name!")
				return
			end
		end
		SSoArNumber = SSoArNumber + 1
		SSoArProfile[name] = {Sell = SSoAsell, Expire = SSoAexpire, Frame = SSoAframeOpt}
		C_UI.Reload()
	else
		local ssoaTime = GameTime_GetTime(false)
		DEFAULT_CHAT_FRAME:AddMessage(ssoaTime.." |A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16|a ["..ssoaMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("SSoA", "Title")).."] Please enter a name for your profile!")
	end
end)
-- Popout 1, entering, leaving, click --
ssoaOptions3Box2PopOut1:SetWidth(ssoaOptions3Box2:GetWidth()*0.65)
ssoaOptions3Box2PopOut1:SetScript("OnEnter", function(self)
	ssoaEnteringMenus(self)
	GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16|a "..ssoaMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("SSoA", "Title")).."|nSelect one of the profiles to be "..ssoaHighColor:WrapTextInColorCode("LOADED!")) 
end)
ssoaOptions3Box2PopOut1Choice0:SetScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		local ssoaTime = GameTime_GetTime(false)
		DEFAULT_CHAT_FRAME:AddMessage(ssoaTime.." |A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16|a ["..ssoaMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("SSoA", "Title")).."] I did nothing, I literally do nothing as button!")
		ssoaOptions3Box2PopOut1Choice0:Hide()
	end
end)
-- naming --
ssoaOptions3Box2PopOut1Choice0.Text:SetText("Nothing")
-- Popout 1, entering, leaving, click --
ssoaOptions3Box3PopOut1:SetWidth(ssoaOptions3Box3:GetWidth()*0.65)
ssoaOptions3Box3PopOut1:SetScript("OnEnter", function(self)
	ssoaEnteringMenus(self)
	GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16|a "..ssoaMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("SSoA", "Title")).."|nSelect one of the profiles to be "..ssoaHighColor:WrapTextInColorCode("DELETED!")) 
end)
ssoaOptions3Box3PopOut1Choice0:SetScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		local ssoaTime = GameTime_GetTime(false)
		DEFAULT_CHAT_FRAME:AddMessage(ssoaTime.." |A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16|a ["..ssoaMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("SSoA", "Title")).."] I did nothing, I literally do nothing as button!")
		ssoaOptions3Box3PopOut1Choice0:Hide()
	end
end)
-- naming --
ssoaOptions3Box3PopOut1Choice0.Text:SetText("Nothing")
-- leave --
ssoaOptions3Box1EditBox1.WritingLine:HookScript("OnLeave", ssoaLeavingMenus)
ssoaOptions3Box2PopOut1:SetScript("OnLeave", ssoaLeavingMenus)
ssoaClickPopOut(ssoaOptions3Box2PopOut1, ssoaOptions3Box2PopOut1Choice0)
ssoaOptions3Box3PopOut1:SetScript("OnLeave", ssoaLeavingMenus)
ssoaClickPopOut(ssoaOptions3Box3PopOut1, ssoaOptions3Box3PopOut1Choice0)
-- Showing the panel --
ssoaOptions3:HookScript("OnShow", function(self)
	FindingKeys()
	LoadingProfiles()
	DeletingProfiles()
	ssoaOptions3Box2PopOut1.Text:SetText("Click me")
	ssoaOptions3Box3PopOut1.Text:SetText("Click me")
	if ssoaOptions2:IsShown() then ssoaOptions2:Hide() end
	if ssoaOptions1:IsShown() then ssoaOptions1:Hide() end
	ssoaOptions00Tab1.Text:SetTextColor(ssoaMainColor:GetRGB())
	ssoaOptions00Tab2.Text:SetTextColor(ssoaMainColor:GetRGB())
	ssoaOptions00Tab3.Text:SetTextColor(ssoaHighColor:GetRGB())
end)
-- taking of the options panels --
for i = 1, 3, 1 do
	_G["ssoaOptions"..i]:ClearAllPoints()
	_G["ssoaOptions"..i]:SetPoint("TOPLEFT", ssoaOptions00, "TOPLEFT", 0, 0)
	_G["ssoaOptions"..i].BGtexture:SetAlpha(1)
	_G["ssoaOptions"..i].CenterTxt:Hide()
	_G["ssoaOptions"..i].BottomTxt:Hide()
	_G["ssoaOptions"..i].BottomLeftTxt:Hide()
end
