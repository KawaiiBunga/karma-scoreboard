-----------------------------------------------------------------------------------
--IF YOU ARE LOOKING FOR THE CONFIG IT IS CONFIGURATION.LUA IN THIS SAME FOLDER!---
--IF YOU DON'T KNOW WHAT YOU'RE DOING, STAY OUT OF THIS FILE OR YOU WILL BREAK IT!- 
-----------------------------------------------------------------------------------

local Configuration = KarmaScoreboard.Configuration

hook.Add("InitPostEntity", "InitFadminRemove", function() -- Remove defaults
    hook.Remove("ScoreboardShow", "FAdmin_scoreboard")
    hook.Remove("ScoreboardHide", "FAdmin_scoreboard")
end) 

surface.CreateFont( "KarmaTitle", { font = "Roboto", size = 36, weight = 750,} )
surface.CreateFont( "karma_20", {font = "Roboto", size = 20, weight = 500,} )

local White = Color( 255,255,255 )
local Black = Color( 0,0,0 )
self = KarmaScoreboard
local MuteIcon = Material( "materials/roguescoreboard/mute.png" )

local function ToggleScoreboard(toggle)
	if toggle then 
		local scrw,scrh = ScrW(), ScrH()
		KarmaScoreboard = vgui.Create("DFrame")
		KarmaScoreboard:SetTitle("")
		KarmaScoreboard:SetSize(scrw * 1, scrh * 1)
		KarmaScoreboard:Center()
		KarmaScoreboard:MakePopup()
		KarmaScoreboard:ShowCloseButton(false)
		KarmaScoreboard:SetDraggable(false)
		KarmaScoreboard.Paint = function(self,w,h)
			surface.SetDrawColor(0,0,0,200)
			surface.DrawRect(0,0,w,h)

			draw.DrawText(  Configuration.ServerTitle, "KarmaTitle", w / 2, 20, Configuration.ServerTitleColor, TEXT_ALIGN_CENTER)

			if Configuration.NameOn then
				draw.DrawText(	Configuration.NameText,   "karma_20", w / 12, h * .12, Configuration.NameColor, TEXT_ALIGN_CENTER)
			end

			if Configuration.DarkRP then
				draw.DrawText(	Configuration.JobText,    "karma_20", w / 2, h * .12, Configuration.JobColor, TEXT_ALIGN_CENTER)
			end

			if Configuration.KillsText then
				draw.DrawText(  Configuration.KillsText,   "karma_20", w / 1.4, h * .12, Configuration.KillColor, TEXT_ALIGN_CENTER)
			end

			if Configuration.DeathsText then
				draw.DrawText(  Configuration.DeathsText,  "karma_20", w / 1.3, h * .12, Configuration.DeathColor, TEXT_ALIGN_CENTER)
			end

			if Configuration.RankOn then
				draw.DrawText(  Configuration.RankText,    "karma_20", w / 1.2, h * .12, Configuration.RankColor, TEXT_ALIGN_CENTER)
			end

			if Configuration.PingOn then
				draw.DrawText(	Configuration.PingText,    "karma_20", w / 1.1, h * .12, Configuration.PingColor, TEXT_ALIGN_CENTER)
			end 

			if Configuration.ShowOnlineCount then
				local Pcount = table.Count( player.GetAll() )
				draw.DrawText(  Configuration.CurrentPlayersText .. " " .. Pcount, "karma_20", w / 2, h - 114, Configuration.OnlineColor, TEXT_ALIGN_CENTER)
			end
		end 

		local ScrollMain = KarmaScoreboard:Add("DScrollPanel")
			ScrollMain:Center()
			ScrollMain:SetPos( KarmaScoreboard:GetWide(), KarmaScoreboard:GetWide() / 2, 300)
			ScrollMain:SetSize( KarmaScoreboard:GetWide(), KarmaScoreboard:GetTall() - 420)
			ScrollMain.VBar:SetHideButtons(true)
			ScrollMain.VBar.Paint = function() end
			ScrollMain.VBar:SetWide(0)
			ScrollMain.VBar.btnUp.Paint = ScrollMain.VBar.Paint
			ScrollMain.VBar.btnDown.Paint = ScrollMain.VBar.Paint
			ScrollMain.VBar.btnGrip.Paint = function(self, w, h) 
		end

		local ypos = 0
		for k, v in pairs(player.GetAll()) do
			local playerPanel = vgui.Create("DPanel", ScrollMain)
			local CommandBase = vgui.Create("Panel", SubMenu)
			local name = v:Name()
			local job = v:getDarkRPVar("job")
			local ping = v:Ping()
			local kills = v:Frags()
			local deaths = v:Deaths()
			local rank = v:GetUserGroup()
			local TeamColor = team.GetColor(v:Team())
			local PlayerMute = vgui.Create("DImageButton",PlayerBar)

			playerPanel:SetPos(0, ypos)
			playerPanel:SetSize(KarmaScoreboard:GetWide(), KarmaScoreboard:GetTall() * .05)


			playerPanel.Paint = function( self, w, h)
				if IsValid(v) then
					ply = LocalPlayer()	
					surface.SetDrawColor(0,0,0,150)
					surface.DrawRect(0,0,w,h)

					if Configuration.NameOn then
						draw.DrawText(name, "karma_20", w /12, h /4, Configuration.NameColor, TEXT_ALIGN_CENTER)
					end

					if Configuration.DarkRP then
						if Configuration.JobColors then
							draw.DrawText(job, "karma_20", w /2, h /4, TeamColor, TEXT_ALIGN_CENTER)
						else
							draw.DrawText(job, "karma_20", w /2, h /4, JobColorElse, TEXT_ALIGN_CENTER)
						end
					end
					
					if Configuration.KillsOn then
						draw.DrawText(kills, "karma_20", w / 1.4, h /4, Configuration.KillColor, TEXT_ALIGN_CENTER)
					end

					if Configuration.DeathsOn then
						draw.DrawText(deaths, "karma_20", w / 1.3, h /4, Configuration.DeathColor, TEXT_ALIGN_CENTER)
					end

					if Configuration.RankOn then
						draw.DrawText(rank, "karma_20", w /1.2, h /4, Configuration.RankColor, TEXT_ALIGN_CENTER)
					end

					if Configuration.PingOn then
						draw.DrawText(ping, "karma_20", w /1.1, h /4, Configuration.PingColor, TEXT_ALIGN_CENTER)
					end
				

					
				end
			end

			ypos = ypos + playerPanel:GetTall() * 1

			local CommandList = vgui.Create("DPanelList", CommandBase)
			CommandList:EnableVerticalScrollbar( true )
			ScrollMain:Center()
			ScrollMain:SetPos( 0, KarmaScoreboard:GetTall() * .15 )
			ScrollMain:SetSize( KarmaScoreboard:GetWide(), KarmaScoreboard:GetTall() * .71 )
		end
	else
		if IsValid(KarmaScoreboard) then	
			KarmaScoreboard:Remove()
		end
	end
end

hook.Add("ScoreboardShow", "KarmaOpenScoreboard", function() 
	ToggleScoreboard(true)
	return false
end)

hook.Add("ScoreboardHide", "KarmaHideScoreboard", function()
	ToggleScoreboard(false)
end)
