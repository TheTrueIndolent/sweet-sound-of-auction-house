--taking care of the panel --
ssoaOptions2.TopTxt:SetText("SSoA Frame!")
-- taking care of the boxes --
ssoaOptions2Box1.TitleTxt:SetText("Visibility")
ssoaOptions2Box2.TitleTxt:SetText("Position")
ssoaOptions2Box2.CenterText:SetText("|A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16|a The SSoA frame is now unlocked and you can move it with the "..ssoaHighColor:WrapTextInColorCode("Left Button").." of your mouse.|nJust click and drag with the "..ssoaHighColor:WrapTextInColorCode("Left Click").."!")
ssoaOptions2Box3:SetPoint("TOPLEFT", ssoaOptions2Box1, "BOTTOMLEFT", 0, 0)
ssoaOptions2Box3.TitleTxt:SetText("Width and Height")
ssoaOptions2Box4:SetPoint("TOPLEFT", ssoaOptions2Box2, "BOTTOMLEFT", 0, 0)
ssoaOptions2Box4.TitleTxt:SetText("Text's time visible and background's opacity")
ssoaOptions2Box5:SetPoint("TOPLEFT", ssoaOptions2Box3, "BOTTOMLEFT", 0, 0)
ssoaOptions2Box5.TitleTxt:SetText("Content and font size")
-- Checking the Saved Variables --
local function CheckSavedVariables()
	if SSoAframeOpt["Show"] == 0 then
		ssoaOptions2Box1PopOut1:SetText(ssoaOptions2Box1PopOut1Choice0.Text:GetText())
	elseif SSoAframeOpt["Show"] == 1 then
		ssoaOptions2Box1PopOut1:SetText(ssoaOptions2Box1PopOut1Choice1.Text:GetText())
	end
	ssoaOptions2Box3Slider1.Slider:SetValue(SSoAframeOpt["Width"])
	ssoaOptions2Box3Slider2.Slider:SetValue(SSoAframeOpt["Height"])
	ssoaOptions2Box4Slider1.Slider:SetValue(SSoAframeOpt["Duration"])
	ssoaOptions2Box4Slider2.Slider:SetValue(SSoAframeOpt["BackgroundOpacity"]*100)
	if SSoAframeOpt["Loot"] == 1 then
		ssoaOptions2Box5CheckButton1:SetChecked(true)
		ssoaOptions2Box5CheckButton1.Text:SetTextColor(ssoaMainColor:GetRGB())
	else
		ssoaOptions2Box5CheckButton1:SetChecked(false)
		ssoaOptions2Box5CheckButton1.Text:SetTextColor(0.35, 0.35, 0.35, 0.8)
	end
	if SSoAframeOpt["Money"] == 1 then
		ssoaOptions2Box5CheckButton2:SetChecked(true)
		ssoaOptions2Box5CheckButton2.Text:SetTextColor(ssoaMainColor:GetRGB())
	else
		ssoaOptions2Box5CheckButton2:SetChecked(false)
		ssoaOptions2Box5CheckButton2.Text:SetTextColor(0.35, 0.35, 0.35, 0.8)
	end
	if SSoAframeOpt["Currency"] == 1 then
		ssoaOptions2Box5CheckButton3:SetChecked(true)
		ssoaOptions2Box5CheckButton3.Text:SetTextColor(ssoaMainColor:GetRGB())
	else
		ssoaOptions2Box5CheckButton3:SetChecked(false)
		ssoaOptions2Box5CheckButton3.Text:SetTextColor(0.35, 0.35, 0.35, 0.8)
	end
	ssoaOptions2Box5PopOut1.Text:SetText(SSoAframeOpt["Fonts"])
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
-- Box 1, pop out 1, Visibility of SSoA frame --
-- naming --
ssoaOptions2Box1PopOut1Choice0.Text:SetText("Hide")
ssoaOptions2Box1PopOut1Choice1.Text:SetText("Show")
-- sort --
ssoaOptions2Box1PopOut1Choice1:SetParent(ssoaOptions2Box1PopOut1Choice0)
ssoaOptions2Box1PopOut1Choice1:SetPoint("TOP", ssoaOptions2Box1PopOut1Choice0, "BOTTOM", 0, 0)
-- enter --
ssoaOptions2Box1PopOut1:SetScript("OnEnter", function(self)
	ssoaEnteringMenus(self)
	GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16|a "..ssoaMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("SSoA", "Title")).."|nWould you like,|nthe SSoA frame to be shown?") 
end)
-- clicking --
for i = 0, 1, 1 do
	_G["ssoaOptions2Box1PopOut1Choice"..i]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			ssoaOptions2Box1PopOut1.Text:SetText(self.Text:GetText())
			ssoaOptions2Box1PopOut1Choice0:Hide()
			if self.Text:GetText() == "Hide" then
				SSoAframeOpt["Show"] = 0
				if ssoaTextyFrame:IsShown() then ssoaTextyFrame:Hide() end
			elseif self.Text:GetText() == "Show" then
				SSoAframeOpt["Show"] = 1
				if not ssoaTextyFrame:IsShown() then ssoaTextyFrame:Show() end
			end
		end
	end)
end
-- Box 3, Slider 1, Width of SSoA frame --
ssoaOptions2Box3Slider1.MinText:SetText(128)
ssoaOptions2Box3Slider1.MaxText:SetText(640)
ssoaOptions2Box3Slider1.Slider:SetMinMaxValues(128, 640)
-- slider 1 on enter --
ssoaOptions2Box3Slider1.Slider:SetScript("OnEnter", function(self)
	ssoaEnteringMenus(self)
	GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16|a "..ssoaMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("SSoA", "Title")).."|nYou can also use your mousewheel|nor the buttons to the edge|nto change the value!") 
end)

-- slider 1 mousewheel --
ssoaOptions2Box3Slider1.Slider:SetScript("OnMouseWheel", MouseWheelSlider)
-- On Value Changed --
ssoaOptions2Box3Slider1.Slider:SetScript("OnValueChanged", function (self, value, userInput)
	ssoaOptions2Box3Slider1.TopText:SetText("SSoA frame's width: "..self:GetValue())
	SSoAframeOpt["Width"] = self:GetValue()
	ssoaTextyFrame:SetWidth(SSoAframeOpt["Width"])
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
-- slider 2 mousewheel --
ssoaOptions2Box3Slider2.Slider:SetScript("OnMouseWheel", MouseWheelSlider)
-- On Value Changed --
ssoaOptions2Box3Slider2.Slider:SetScript("OnValueChanged", function (self, value, userInput)
	ssoaOptions2Box3Slider2.TopText:SetText("SSoA frame's height: "..self:GetValue())
	SSoAframeOpt["Height"] = self:GetValue()
	ssoaTextyFrame:SetHeight(SSoAframeOpt["Height"])
end)
-- Box 4, Slider 1, Text's Time Visible of SSoA frame --
ssoaOptions2Box4Slider1.MinText:SetText(5)
ssoaOptions2Box4Slider1.MaxText:SetText(360)
ssoaOptions2Box4Slider1.Slider:SetMinMaxValues(5, 360)
-- slider 1 on enter --
ssoaOptions2Box4Slider1.Slider:SetScript("OnEnter", function(self)
	ssoaEnteringMenus(self)
	GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16|a "..ssoaMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("SSoA", "Title")).."|nYou can also use your mousewheel|nor the buttons to the edge|nto change the value!") 
end)
-- slider 1 mousewheel --
ssoaOptions2Box4Slider1.Slider:SetScript("OnMouseWheel", MouseWheelSlider)
-- On Value Changed --
ssoaOptions2Box4Slider1.Slider:SetScript("OnValueChanged", function (self, value, userInput)
	ssoaOptions2Box4Slider1.TopText:SetText("Text's Time Visible: "..self:GetValue().." sec")
	SSoAframeOpt["Duration"] = self:GetValue()
	ssoaFrameDuration()
end)
-- Box 4, Slider 2, Opacity of Background of SSoA frame --
ssoaOptions2Box4Slider2.MinText:SetText(0.10)
ssoaOptions2Box4Slider2.MaxText:SetText(1)
ssoaOptions2Box4Slider2.Slider:SetMinMaxValues(10, 100)
-- slider 2 on enter --
ssoaOptions2Box4Slider2.Slider:SetScript("OnEnter", function(self)
	ssoaEnteringMenus(self)
	GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16|a "..ssoaMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("SSoA", "Title")).."|nYou can also use your mousewheel|nor the buttons to the edge|nto change the value!") 
end)
-- slider 2 mousewheel --
ssoaOptions2Box4Slider2.Slider:SetScript("OnMouseWheel", MouseWheelSlider)
-- On Value Changed --
ssoaOptions2Box4Slider2.Slider:SetScript("OnValueChanged", function (self, value, userInput)
	ssoaOptions2Box4Slider2.TopText:SetText("Background's Opacity: "..self:GetValue()/100)
	SSoAframeOpt["BackgroundOpacity"] = self:GetValue()/100
	ssoaFrameDuration()
end)
-- Box 5 --
-- check button 1 Loot --
ssoaOptions2Box5CheckButton1.Text:SetText("Loot")
ssoaOptions2Box5CheckButton1:SetScript("OnEnter", function(self)
	ssoaEnteringMenus(self)
	GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16|a "..ssoaMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("SSoA", "Title")).."|nCheck me! if you want the loot|nto be shown at SSoA frame!") 
end)
ssoaOptions2Box5CheckButton1:SetScript("OnLeave", ssoaLeavingMenus)
ssoaOptions2Box5CheckButton1:SetScript("OnClick", function (self, button)
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
ssoaOptions2Box5CheckButton2.Text:SetText("Money")
ssoaOptions2Box5CheckButton2:SetScript("OnEnter", function(self)
	ssoaEnteringMenus(self)
	GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16|a "..ssoaMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("SSoA", "Title")).."|nCheck me! if you want the money|nto be shown at SSoA frame!") 
end)
ssoaOptions2Box5CheckButton2:SetScript("OnLeave", ssoaLeavingMenus)
ssoaOptions2Box5CheckButton2:SetScript("OnClick", function (self, button)
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
ssoaOptions2Box5CheckButton3.Text:SetText("Currency")
ssoaOptions2Box5CheckButton3:SetScript("OnEnter", function(self)
	ssoaEnteringMenus(self)
	GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16|a "..ssoaMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("SSoA", "Title")).."|nCheck me! if you want the curencies|nto be shown at SSoA frame!") 
end)
ssoaOptions2Box5CheckButton3:SetScript("OnLeave", ssoaLeavingMenus)
ssoaOptions2Box5CheckButton3:SetScript("OnClick", function (self, button)
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
-- Box 5, pop out 1, font size --
-- Enter --
ssoaOptions2Box5PopOut1:SetScript("OnEnter", function(self)
	ssoaEnteringMenus(self)
	GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16|a "..ssoaMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("SSoA", "Title")).."|nChoose the font's size!") 
end)
-- naming --
ssoaOptions2Box5PopOut1Choice0.Text:SetText("11")
ssoaOptions2Box5PopOut1Choice1.Text:SetText("12")
ssoaOptions2Box5PopOut1Choice2.Text:SetText("13")
ssoaOptions2Box5PopOut1Choice3.Text:SetText("14")
ssoaOptions2Box5PopOut1Choice4.Text:SetText("15")
ssoaOptions2Box5PopOut1Choice5.Text:SetText("16")
ssoaOptions2Box5PopOut1Choice6.Text:SetText("17")
ssoaOptions2Box5PopOut1Choice7.Text:SetText("18")
-- parent & sort --
for i = 1, 7, 1 do
	_G["ssoaOptions2Box5PopOut1Choice"..i]:SetParent(ssoaOptions2Box5PopOut1Choice0)
	_G["ssoaOptions2Box5PopOut1Choice"..i]:SetPoint("TOP", _G["ssoaOptions2Box5PopOut1Choice"..i-1], "BOTTOM", 0, 0)
end
-- click --
for i = 0, 7, 1 do
	_G["ssoaOptions2Box5PopOut1Choice"..i]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			SSoAframeOpt["Fonts"] = tonumber(self:GetText())
			ssoaOptions2Box5PopOut1.Text:SetText(self:GetText())
			ssoaOptions2Box5PopOut1Choice0:Hide()
			ssoaFrameFonts()
		end
	end)
end
-- Function for stoping the movement --
local function StopMoving(self)
	SSoAframeOpt["X"] = Round(self:GetLeft())
	SSoAframeOpt["Y"] = Round(self:GetBottom())
	self:StopMovingOrSizing()
end
ssoaTextyFrame:SetScript("OnDragStart", ssoaTextyFrame.StartMoving)
ssoaTextyFrame:SetScript("OnDragStop", function(self) StopMoving(self) end)
-- drop down --
ssoaClickPopOut(ssoaOptions2Box1PopOut1, ssoaOptions2Box1PopOut1Choice0)
-- leave --
ssoaOptions2Box1PopOut1:SetScript("OnLeave", ssoaLeavingMenus)
-- slider 1 on leave --
ssoaOptions2Box3Slider1.Slider:SetScript("OnLeave", ssoaLeavingMenus)
-- slider 2 on leave --
ssoaOptions2Box3Slider2.Slider:SetScript("OnLeave", ssoaLeavingMenus)
-- slider 1 on leave --
ssoaOptions2Box4Slider1.Slider:SetScript("OnLeave", ssoaLeavingMenus)
-- slider 2 on leave --
ssoaOptions2Box4Slider2.Slider:SetScript("OnLeave", ssoaLeavingMenus)
-- drop down --
ssoaClickPopOut(ssoaOptions2Box5PopOut1, ssoaOptions2Box5PopOut1Choice0)
-- leave --
ssoaOptions2Box5PopOut1:SetScript("OnLeave", ssoaLeavingMenus)
-- Show the panel --
ssoaOptions2:HookScript("OnShow", function(self)
	CheckSavedVariables()
	ssoaOptions00Tab1.Text:SetTextColor(ssoaMainColor:GetRGB())
	ssoaOptions00Tab2.Text:SetTextColor(ssoaHighColor:GetRGB())
	ssoaOptions00Tab3.Text:SetTextColor(ssoaMainColor:GetRGB())
	if ssoaOptions1:IsShown() then ssoaOptions1:Hide() end
	if ssoaOptions3:IsShown() then ssoaOptions3:Hide() end
-- taking care of the Move Frame --
	ssoaTextyFrame:SetScript("OnEnter", function(self)
		ssoaEnteringMenus(self)
		GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("SSoA", "IconAtlas")..":16:16|a "..ssoaMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("SSoA", "Title")).."|nLeft click and drag to move me!")
	end)
	ssoaTextyFrame:SetScript("OnLeave", ssoaLeavingMenus)
-- Moving the Move Frame --
	ssoaTextyFrame:RegisterForDrag("LeftButton")
end)
-- Hide the panel --
ssoaOptions2:SetScript("OnHide", function(self)
	ssoaTextyFrame:RegisterForDrag("None")
	ssoaTextyFrame:SetScript("OnEnter", nil)
	ssoaTextyFrame:SetScript("OnLeave", nil)
end)
