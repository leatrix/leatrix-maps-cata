




-- Leatrix Maps for all game versions (The War Within, Cataclysm Classic and Classic Era) are now under a single
-- CurseForge project.  This is curseforge.com/wow/addons/leatrix-maps.

-- To continue to use Leatrix Maps and receive updates, you need to remove this copy of Leatrix Maps, find
-- Leatrix Maps on CurseForge App, CurseForge website or leatrix.com and install it from there.


















local waitFrame = CreateFrame("FRAME")
waitFrame:RegisterEvent("PLAYER_LOGIN")
waitFrame:SetScript("OnEvent", function()


C_Timer.After(2, function()

	local function MakeTx(frame, title, x, y)
		local text = frame:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
		text:SetPoint("TOPLEFT", x, y)
		text:SetText(title)
		return text
	end

	local function CreateCloseButton(parent, w, h, anchor, x, y)
		local btn = CreateFrame("BUTTON", nil, parent)
		btn:SetSize(w, h)
		btn:SetPoint(anchor, x, y)
		btn:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
		btn:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
		btn:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
		btn:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
		return btn
	end

	local function CreateCloseButton(parent, w, h, anchor, x, y)
		local btn = CreateFrame("BUTTON", nil, parent)
		btn:SetSize(w, h)
		btn:SetPoint(anchor, x, y)
		btn:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
		btn:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
		btn:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
		btn:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
		return btn
	end

	local frame = CreateFrame("FRAME", nil, UIParent)

	frame:SetSize(780, 266); frame:SetFrameStrata("FULLSCREEN_DIALOG"); frame:SetFrameLevel(100)
	frame.close = CreateCloseButton(frame, 30, 30, "TOPRIGHT", 0, 0)
	frame.close:SetScript("OnClick", function()
		C_PartyInfo.DoCountdown(60)
		C_Timer.After(60, function() frame:Hide() end)
	end)
	frame.tex = frame:CreateTexture(nil, "BACKGROUND"); frame.tex:SetAllPoints(); frame.tex:SetColorTexture(0.05, 0.05, 0.05, 0.9)
	frame:ClearAllPoints(); frame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)

	MakeTx(frame, "WARNING !!!  YOU MUST DO THIS RIGHT NOW TO CONTINUE USING LEATRIX MAPS !!!", 10, -10)
	MakeTx(frame, "WARNING !!!  YOU MUST DO THIS RIGHT NOW TO CONTINUE USING LEATRIX MAPS !!!", 10, -30)
	MakeTx(frame, "WARNING !!!  YOU MUST DO THIS RIGHT NOW TO CONTINUE USING LEATRIX MAPS !!!", 10, -50)

	MakeTx(frame, "- REMOVE THIS COPY of the Leatrix Maps addon RIGHT NOW.", 10, -90)
	MakeTx(frame, "- FIND the Leatrix Maps addon on CurseForge App, CurseForge website or leatrix.com.", 10, -120)
	MakeTx(frame, "- INSTALL Leatrix Maps from there.", 10, -150)

	MakeTx(frame, "The reason for this is that the Leatrix Maps project has MOVED.", 10, -190)
	MakeTx(frame, "The new project for all game versions is at curseforge.com/wow/addons/leatrix-maps", 10, -210)

	frame:SetPoint("CENTER", UIParent, "CENTER", 0, -768)

	local startY, endX, endY, duration, elapsedTime = -768, 0, -100, 2.5, 0

	C_Timer.After(22, function()
		PlaySoundFile("Interface\\AddOns\\Leatrix_Maps\\audio.mp3", "MASTER")
	end)

	frame:SetScript("OnUpdate", function(self, elapsed)
		elapsedTime = elapsedTime + elapsed
		if elapsedTime < duration then
			local progress = elapsedTime / duration
			local newY = startY + (endY - startY) * progress
			self:SetPoint("CENTER", UIParent, "CENTER", 0, newY)
		else
			self:SetPoint("CENTER", UIParent, "CENTER", 0, endY)
			self:SetScript("OnUpdate", nil)
		end
	end)



				local petEB = CreateFrame("EditBox", nil, frame)
				petEB:SetPoint("TOPLEFT", frame, "BOTTOMLEFT", 10, 36)
				petEB:SetTextInsets(2, 2, 2, 2)
				petEB:SetFontObject("GameFontNormalLarge")
				petEB:SetTextColor(1.0, 1.0, 1.0, 1)
				petEB:SetBlinkSpeed(0)
				petEB:SetAltArrowKeyMode(true)
				petEB:SetFrameLevel(5000)
				petEB:SetSize(600, 20)



				local function RefreshPets()
					petEB:SetText("https://www.curseforge.com/wow/addons/leatrix-maps")
					petEB:HighlightText()
					petEB:SetFocus()
				end

				RefreshPets()

				petEB:SetScript("OnEscapePressed", function()
					C_PartyInfo.DoCountdown(60)
					C_Timer.After(60, function() frame:Hide() end)
				end)
				petEB:SetScript("OnEnterPressed", function() petEB:HighlightText() end)
				petEB:SetScript("OnMouseDown", function() petEB:ClearFocus() end)
				petEB:SetScript("OnMouseUp", function() petEB:HighlightText() end)
				petEB:SetScript("OnChar", RefreshPets)
				petEB:SetScript("OnKeyUp", RefreshPets)

				petEB.tiptext = "Install Leatrix Maps from here.  Press CTRL/C to copy."
				petEB:SetScript("OnEnter", function()
					RefreshPets()
					GameTooltip:SetOwner(petEB, "ANCHOR_TOP")
					GameTooltip:SetText(petEB.tiptext, nil, nil, nil, nil, true)
				end)
				petEB:HookScript("OnLeave", GameTooltip_Hide)


end)

end)