-- register frame --
local zlave = CreateFrame("Frame")
zlave:RegisterEvent("ADDON_LOADED")
-- create options global variables --
local function CreateOptionsGV()
-- on enter options --
	function ssoaEnteringMenus(self)
		GameTooltip_ClearStatusBars(GameTooltip)
		GameTooltip:SetOwner(self, "ANCHOR_TOP", 0, 0)
	end
-- on leave options --
	function ssoaLeavingMenus()
		GameTooltip:Hide()
	end
-- click on Pop Out --
	function ssoaClickPopOut(var1, var2)
		var1:SetScript("OnClick", function(self, button, down)
			if button == "LeftButton" and down == false then
				if not var2:IsShown() then
					var2:Show()
				else
					var2:Hide()
				end
			end
		end)
	end
end
-- Events time --
local function EventsTime(self, event, arg1, arg2, arg3)
	if event == "ADDON_LOADED" and arg1 == "SSoA_Options" then
		CreateOptionsGV()
-- tab background --
		ssoaOptions00.BGtexture:SetGradient("VERTICAL", ssoaNoHighColor, ssoaMainColor)
-- drop down --
		ssoaClickPopOut(ssoaOptions1Box1PopOut1, ssoaOptions1Box1PopOut1Choice0)
-- leave --
		ssoaOptions1Box1PopOut1:SetScript("OnLeave", ssoaLeavingMenus)
-- drop down --
		ssoaClickPopOut(ssoaOptions1Box1PopOut2, ssoaOptions1Box1PopOut2Choice0)
-- leave --
		ssoaOptions1Box1PopOut2:SetScript("OnLeave", ssoaLeavingMenus)
-- drop down --
		ssoaClickPopOut(ssoaOptions1Box1PopOut3, ssoaOptions1Box1PopOut3Choice0)
-- leave --
		ssoaOptions1Box1PopOut3:SetScript("OnLeave", ssoaLeavingMenus)
-- drop down --
		ssoaClickPopOut(ssoaOptions1Box2PopOut1, ssoaOptions1Box2PopOut1Choice0)
-- leave --
		ssoaOptions1Box2PopOut1:SetScript("OnLeave", ssoaLeavingMenus)
-- drop down --
		ssoaClickPopOut(ssoaOptions1Box2PopOut2, ssoaOptions1Box2PopOut2Choice0)
-- leave --
		ssoaOptions1Box2PopOut2:SetScript("OnLeave", ssoaLeavingMenus)
-- drop down --
		ssoaClickPopOut(ssoaOptions1Box2PopOut3, ssoaOptions1Box2PopOut3Choice0)
-- leave --
		ssoaOptions1Box2PopOut3:SetScript("OnLeave", ssoaLeavingMenus)
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
-- leave --
		ssoaOptions3Box1EditBox1.WritingLine:HookScript("OnLeave", ssoaLeavingMenus)
		ssoaOptions3Box2PopOut1:SetScript("OnLeave", ssoaLeavingMenus)
		ssoaClickPopOut(ssoaOptions3Box2PopOut1, ssoaOptions3Box2PopOut1Choice0)
		ssoaOptions3Box3PopOut1:SetScript("OnLeave", ssoaLeavingMenus)
		ssoaClickPopOut(ssoaOptions3Box3PopOut1, ssoaOptions3Box3PopOut1Choice0)
	end
end
zlave:SetScript("OnEvent", EventsTime)
