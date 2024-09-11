-- taking care of the panel --
ssoaOptions2.TopTxt:SetText("SSoA Frame! (part I)")
-- taking care of the boxes --
ssoaOptions2Box1.TitleTxt:SetText("Visibility")
ssoaOptions2Box2:SetPoint("TOP", ssoaOptions2Box1, "BOTTOM", 0, 0)
ssoaOptions2Box2.TitleTxt:SetText("Position")
ssoaOptions2Box2.CenterText:SetText("|A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16|a The SSoA frame is now unlocked and you can move it with the "..ssoaHighColor:WrapTextInColorCode("Left Button").." of your mouse.|nJust click and drag with the "..ssoaHighColor:WrapTextInColorCode("Left Click").."!")
ssoaOptions2Box3:SetPoint("TOP", ssoaOptions2Box2, "BOTTOM", 0, 0)
ssoaOptions2Box3.TitleTxt:SetText("Width and Height")
-- Checking the Saved Variables --
local function CheckSavedVariables()
	if SSoAframeOpt["Show"] == 0 then
		ssoaOptions2Box1PopOut1:SetText(ssoaOptions2Box1PopOut1Choice0.Text:GetText())
		if ssoaMoverFrame:IsShown() then ssoaMoverFrame:Hide() end
	elseif SSoAframeOpt["Show"] == 1 then
		ssoaOptions2Box1PopOut1:SetText(ssoaOptions2Box1PopOut1Choice1.Text:GetText())
		if not ssoaMoverFrame:IsShown() then ssoaMoverFrame:Show() end
	end
	ssoaOptions2Box3Slider1.Slider:SetValue(SSoAframeOpt["Width"])
	ssoaOptions2Box3Slider2.Slider:SetValue(SSoAframeOpt["Height"])
end
-- Mouse Wheel on Sliders --
local function MouseWheelSlider(self, delta)
	if delta == 1 then
		PlaySound(858, "Master")
		self:SetValue(self:GetValue() + 1)
	elseif delta == -1 then
		PlaySound(858, "Master")
		self:SetValue(self:GetValue() - 1)
	end
end
-- taking care of the Move Frame --
ssoaMoverFrame:SetScript("OnEnter", function(self)
	ssoaEnteringMenus(self)
	GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16|a "..ssoaMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("SSoA", "Title")).."|nLeft click and drag to move me!")
end)
ssoaMoverFrame:SetScript("OnLeave", ssoaLeavingMenus)
-- Function for stoping the movement --
local function StopMoving(self)
	SSoAframeOpt["X"] = Round(self:GetLeft())
	SSoAframeOpt["Y"] = Round(self:GetBottom())
	self:StopMovingOrSizing()
end
-- Moving the Move Frame --
ssoaMoverFrame:RegisterForDrag("LeftButton")
ssoaMoverFrame:SetScript("OnDragStart", ssoaMoverFrame.StartMoving)
ssoaMoverFrame:SetScript("OnDragStop", function(self) StopMoving(self) end)
-- Box 1, pop out 1, Visibility of SSoA frame --
-- Enter --
ssoaOptions2Box1PopOut1:SetScript("OnEnter", function(self)
	ssoaEnteringMenus(self)
	GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16|a "..ssoaMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("SSoA", "Title")).."|nWould you like,|nthe SSoA frame to be shown?") 
end)
-- leave --
ssoaOptions2Box1PopOut1:SetScript("OnLeave", ssoaLeavingMenus)
-- drop down --
ssoaClickPopOut(ssoaOptions2Box1PopOut1, ssoaOptions2Box1PopOut1Choice0)
-- naming --
ssoaOptions2Box1PopOut1Choice0.Text:SetText("Hide")
ssoaOptions2Box1PopOut1Choice1.Text:SetText("Show")
-- sort & clicking --
-- choice 0 Hide --
ssoaOptions2Box1PopOut1Choice0:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		SSoAframeOpt["Show"] = 0
		ssoaOptions2Box1PopOut1.Text:SetText(self:GetText())
		ssoaOptions2Box1PopOut1Choice0:Hide()
		if ssoaMoverFrame:IsShown() then ssoaMoverFrame:Hide() end
	end
end)
-- choice 1 Show --
ssoaOptions2Box1PopOut1Choice1:SetParent(ssoaOptions2Box1PopOut1Choice0)
ssoaOptions2Box1PopOut1Choice1:SetPoint("TOP", ssoaOptions2Box1PopOut1Choice0, "BOTTOM", 0, 0)
ssoaOptions2Box1PopOut1Choice1:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		SSoAframeOpt["Show"] = 1
		ssoaOptions2Box1PopOut1.Text:SetText(self:GetText())
		ssoaOptions2Box1PopOut1Choice0:Hide()
		if not ssoaMoverFrame:IsShown() then ssoaMoverFrame:Show() end
	end
end)
-- Box 3, Slider 1, Width of SSoA frame --
ssoaOptions2Box3Slider1.MinText:SetText(128)
ssoaOptions2Box3Slider1.MaxText:SetText(640)
ssoaOptions2Box3Slider1.Slider:SetMinMaxValues(128, 640)
-- slider 1 on enter --
ssoaOptions2Box3Slider1.Slider:SetScript("OnEnter", function(self)
	ssoaEnteringMenus(self)
	GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16|a "..ssoaMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("SSoA", "Title")).."|nYou can also use your mousewheel|nor the buttons to the edge|nto change the value!") 
end)
-- slider 1 on leave --
ssoaOptions2Box3Slider1.Slider:SetScript("OnLeave", ssoaLeavingMenus)
-- slider 1 mousewheel --
ssoaOptions2Box3Slider1.Slider:SetScript("OnMouseWheel", MouseWheelSlider)
-- On Value Changed --
ssoaOptions2Box3Slider1.Slider:SetScript("OnValueChanged", function (self, value, userInput)
	ssoaOptions2Box3Slider1.TopText:SetText("SSoA frame's width: "..self:GetValue())
	SSoAframeOpt["Width"] = self:GetValue()
	ssoaMoverFrame:SetWidth(SSoAframeOpt["Width"])
end)
-- Box 3, Slider 2, Height of SSoA frame --
ssoaOptions2Box3Slider2.MinText:SetText(40)
ssoaOptions2Box3Slider2.MaxText:SetText(160)
ssoaOptions2Box3Slider2.Slider:SetMinMaxValues(40, 160)
-- slider 2 on enter --
ssoaOptions2Box3Slider2.Slider:SetScript("OnEnter", function(self)
	ssoaEnteringMenus(self)
	GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16|a "..ssoaMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("SSoA", "Title")).."|nYou can also use your mousewheel|nor the buttons to the edge|nto change the value!") 
end)
-- slider 2 on leave --
ssoaOptions2Box3Slider2.Slider:SetScript("OnLeave", ssoaLeavingMenus)
-- slider 2 mousewheel --
ssoaOptions2Box3Slider2.Slider:SetScript("OnMouseWheel", MouseWheelSlider)
-- On Value Changed --
ssoaOptions2Box3Slider2.Slider:SetScript("OnValueChanged", function (self, value, userInput)
	ssoaOptions2Box3Slider2.TopText:SetText("SSoA frame's height: "..self:GetValue())
	SSoAframeOpt["Height"] = self:GetValue()
	ssoaMoverFrame:SetHeight(SSoAframeOpt["Height"])
end)
-- Show the panel --
ssoaOptions2:HookScript("OnShow", function(self)
	CheckSavedVariables()
	if ssoaTextyFrame:IsShown() then ssoaTextyFrame:Hide() end
	ssoaOptions00Tab1.Text:SetTextColor(ssoaMainColor:GetRGB())
	ssoaOptions00Tab2.Text:SetTextColor(ssoaHighColor:GetRGB())
	ssoaOptions00Tab3.Text:SetTextColor(ssoaMainColor:GetRGB())
	ssoaOptions00Tab4.Text:SetTextColor(ssoaMainColor:GetRGB())
	if ssoaOptions1:IsShown() then ssoaOptions1:Hide() end
	if ssoaOptions3:IsShown() then ssoaOptions3:Hide() end
	if ssoaOptions4:IsShown() then ssoaOptions4:Hide() end
end)
-- Hide the panel --
ssoaOptions2:SetScript("OnHide", function(self)
	if ssoaMoverFrame:IsShown() then ssoaMoverFrame:Hide() end
	ssoaFrameVisibility()
	ssoaFrameFonts()
end)
