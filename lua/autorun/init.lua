KarmaScoreboard = KarmaScoreboard or {}

function KarmaScoreboard.LoadingSV(filePath)
	if SERVER then
		include(filePath)
	end
end

function KarmaScoreboard.LoadingCL(filePath)
	AddCSLuaFile(filePath)
	if CLIENT then
		include(filePath)
	end
end

function KarmaScoreboard.LoadingSH(filePath)
	AddCSLuaFile(filePath)
	include(filePath)
end

KarmaScoreboard.LoadingSH("KarmaScoreboard/configuration.lua")
KarmaScoreboard.LoadingCL("KarmaScoreboard/cl_scoreboard.lua")


if SERVER then
end