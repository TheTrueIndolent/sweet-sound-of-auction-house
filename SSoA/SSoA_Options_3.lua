-- taking care of the panel --
ssoaOptions3.TopTxt:SetText("SSoA Frame! (part II)")
-- taking care of the boxes --
ssoaOptions3Box1.TitleTxt:SetText("Text's time visible and background's opacity")
ssoaOptions3Box2:SetPoint("TOP", ssoaOptions3Box1, "BOTTOM", 0, 0)
ssoaOptions3Box2.TitleTxt:SetText("Content and font size")
-- Checking the Saved Variables --
local function CheckSavedVariables()
	ssoaOptions3Box1Slider1.Slider:SetValue(SSoAframeOpt["Duration"])
	ssoaOptions3Box1Slider2.Slider:SetValue(SSoAframeOpt["BackgroundOpacity"]*100)
	if SSoAframeOpt["Loot"] == 1 then
		ssoaOptions3Box2CheckButton1:SetChecked(true)
		ssoaOptions3Box2CheckButton1.Text:SetTextColor(ssoaMainColor:GetRGB())
	else
		ssoaOptions3Box2CheckButton1:SetChecked(false)
		ssoaOptions3Box2CheckButton1.Text:SetTextColor(0.35, 0.35, 0.35, 0.8)
	end
	if SSoAframeOpt["Money"] == 1 then
		ssoaOptions3Box2CheckButton2:SetChecked(true)
		ssoaOptions3Box2CheckButton2.Text:SetTextColor(ssoaMainColor:GetRGB())
	else
		ssoaOptions3Box2CheckButton2:SetChecked(false)
		ssoaOptions3Box2CheckButton2.Text:SetTextColor(0.35, 0.35, 0.35, 0.8)
	end
	if SSoAframeOpt["Currency"] == 1 then
		ssoaOptions3Box2CheckButton3:SetChecked(true)
		ssoaOptions3Box2CheckButton3.Text:SetTextColor(ssoaMainColor:GetRGB())
	else
		ssoaOptions3Box2CheckButton3:SetChecked(false)
		ssoaOptions3Box2CheckButton3.Text:SetTextColor(0.35, 0.35, 0.35, 0.8)
	end
	ssoaOptions3Box2PopOut1.Text:SetText(SSoAframeOpt["Fonts"])
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
-- Box 1, Slider 1, Text's Time Visible of SSoA frame --
ssoaOptions3Box1Slider1.MinText:SetText(5)
ssoaOptions3Box1Slider1.MaxText:SetText(360)
ssoaOptions3Box1Slider1.Slider:SetMinMaxValues(5, 360)
-- slider 1 on enter --
ssoaOptions3Box1Slider1.Slider:SetScript("OnEnter", function(self)
	ssoaEnteringMenus(self)
	GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16|a "..ssoaMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("SSoA", "Title")).."|nYou can also use your mousewheel|nor the buttons to the edge|nto change the value!") 
end)
-- slider 1 on leave --
ssoaOptions3Box1Slider1.Slider:SetScript("OnLeave", ssoaLeavingMenus)
-- slider 1 mousewheel --
ssoaOptions3Box1Slider1.Slider:SetScript("OnMouseWheel", MouseWheelSlider)
-- On Value Changed --
ssoaOptions3Box1Slider1.Slider:SetScript("OnValueChanged", function (self, value, userInput)
	ssoaOptions3Box1Slider1.TopText:SetText("Text's Time Visible: "..self:GetValue().." sec")
	SSoAframeOpt["Duration"] = self:GetValue()
	ssoaFrameDuration()
end)
-- Box 1, Slider 2, Opacity of Background of SSoA frame --
ssoaOptions3Box1Slider2.MinText:SetText(0.10)
ssoaOptions3Box1Slider2.MaxText:SetText(1)
ssoaOptions3Box1Slider2.Slider:SetMinMaxValues(10, 100)
-- slider 2 on enter --
ssoaOptions3Box1Slider2.Slider:SetScript("OnEnter", function(self)
	ssoaEnteringMenus(self)
	GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16|a "..ssoaMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("SSoA", "Title")).."|nYou can also use your mousewheel|nor the buttons to the edge|nto change the value!") 
end)
-- slider 2 on leave --
ssoaOptions3Box1Slider2.Slider:SetScript("OnLeave", ssoaLeavingMenus)
-- slider 2 mousewheel --
ssoaOptions3Box1Slider2.Slider:SetScript("OnMouseWheel", MouseWheelSlider)
-- On Value Changed --
ssoaOptions3Box1Slider2.Slider:SetScript("OnValueChanged", function (self, value, userInput)
	ssoaOptions3Box1Slider2.TopText:SetText("Background's Opacity: "..self:GetValue()/100)
	SSoAframeOpt["BackgroundOpacity"] = self:GetValue()/100
	ssoaFrameDuration()
end)
-- Box 2 --
-- check button 1 Loot --
ssoaOptions3Box2CheckButton1.Text:SetText("Loot")
ssoaOptions3Box2CheckButton1:SetScript("OnEnter", function(self)
	ssoaEnteringMenus(self)
	GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16|a "..ssoaMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("SSoA", "Title")).."|nCheck me! if you want the loot|nto be shown at SSoA frame!") 
end)
ssoaOptions3Box2CheckButton1:SetScript("OnLeave", ssoaLeavingMenus)
ssoaOptions3Box2CheckButton1:SetScript("OnClick", function (self, button)
	if button == "LeftButton" then
		if self:GetChecked() == true then
			SSoAframeOpt["Loot"] = 1
			self.Text:SetTextColor(ssoaMainColor:GetRGB())
		elseif self:GetChecked() == false then
			SSoAframeOpt["Loot"] = 0
			self.Text:SetTextColor(0.35, 0.35, 0.35, 0.8)
		end
	end
end)
-- check button 2 Money --
ssoaOptions3Box2CheckButton2.Text:SetText("Money")
ssoaOptions3Box2CheckButton2:SetScript("OnEnter", function(self)
	ssoaEnteringMenus(self)
	GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16|a "..ssoaMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("SSoA", "Title")).."|nCheck me! if you want the money|nto be shown at SSoA frame!") 
end)
ssoaOptions3Box2CheckButton2:SetScript("OnLeave", ssoaLeavingMenus)
ssoaOptions3Box2CheckButton2:SetScript("OnClick", function (self, button)
	if button == "LeftButton" then
		if self:GetChecked() == true then
			SSoAframeOpt["Money"] = 1
			self.Text:SetTextColor(ssoaMainColor:GetRGB())
		elseif self:GetChecked() == false then
			SSoAframeOpt["Money"] = 0
			self.Text:SetTextColor(0.35, 0.35, 0.35, 0.8)
		end
	end
end)
-- check button 3 Currency --
ssoaOptions3Box2CheckButton3.Text:SetText("Currency")
ssoaOptions3Box2CheckButton3:SetScript("OnEnter", function(self)
	ssoaEnteringMenus(self)
	GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16|a "..ssoaMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("SSoA", "Title")).."|nCheck me! if you want the curencies|nto be shown at SSoA frame!") 
end)
ssoaOptions3Box2CheckButton3:SetScript("OnLeave", ssoaLeavingMenus)
ssoaOptions3Box2CheckButton3:SetScript("OnClick", function (self, button)
	if button == "LeftButton" then
		if self:GetChecked() == true then
			SSoAframeOpt["Currency"] = 1
			self.Text:SetTextColor(ssoaMainColor:GetRGB())
		elseif self:GetChecked() == false then
			SSoAframeOpt["Currency"] = 0
			self.Text:SetTextColor(0.35, 0.35, 0.35, 0.8)
		end
	end
end)
-- Box 2, pop out 1, font size --
-- Enter --
ssoaOptions3Box2PopOut1:SetScript("OnEnter", function(self)
	ssoaEnteringMenus(self)
	GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16|a "..ssoaMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("SSoA", "Title")).."|nChoose the font's size!") 
end)
-- leave --
ssoaOptions3Box2PopOut1:SetScript("OnLeave", ssoaLeavingMenus)
-- drop down --
ssoaClickPopOut(ssoaOptions3Box2PopOut1, ssoaOptions3Box2PopOut1Choice0)
-- naming --
ssoaOptions3Box2PopOut1Choice0.Text:SetText("12")
ssoaOptions3Box2PopOut1Choice1.Text:SetText("14")
ssoaOptions3Box2PopOut1Choice2.Text:SetText("16")
ssoaOptions3Box2PopOut1Choice3.Text:SetText("18")
-- parent & sort --
for i = 1, 3, 1 do
	_G["ssoaOptions3Box2PopOut1Choice"..i]:SetParent(ssoaOptions3Box2PopOut1Choice0)
	_G["ssoaOptions3Box2PopOut1Choice"..i]:SetPoint("TOP", _G["ssoaOptions3Box2PopOut1Choice"..i-1], "BOTTOM", 0, 0)
end
-- click --
for i = 0, 3, 1 do
	_G["ssoaOptions3Box2PopOut1Choice"..i]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			SSoAframeOpt["Fonts"] = tonumber(self:GetText())
			ssoaOptions3Box2PopOut1.Text:SetText(self:GetText())
			ssoaOptions3Box2PopOut1Choice0:Hide()
			ssoaFrameFonts()
		end
	end)
end
-- Show the panel --
ssoaOptions3:HookScript("OnShow", function(self)
	CheckSavedVariables()
	ssoaOptions00Tab1.Text:SetTextColor(ssoaMainColor:GetRGB())
	ssoaOptions00Tab2.Text:SetTextColor(ssoaMainColor:GetRGB())
	ssoaOptions00Tab3.Text:SetTextColor(ssoaHighColor:GetRGB())
	ssoaOptions00Tab4.Text:SetTextColor(ssoaMainColor:GetRGB())
	if ssoaOptions1:IsShown() then ssoaOptions1:Hide() end
	if ssoaOptions2:IsShown() then ssoaOptions2:Hide() end
	if ssoaOptions4:IsShown() then ssoaOptions4:Hide() end
end)
