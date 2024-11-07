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
