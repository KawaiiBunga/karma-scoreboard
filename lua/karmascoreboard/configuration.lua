KarmaScoreboard.Configuration = {}

local Configuration = KarmaScoreboard.Configuration

-------------------------------------------
-- USE THESE COLORS IN THE CONFIG BELOW! --
-------------------------------------------
White =  Color (255,255,255)
Black =  Color (0,0,0)
Red =    Color (255,0,0)
Yellow = Color (255,255,0)
Orange = Color (255,100,0)
Green =  Color (0,255,0)
Cyan =   Color (0,255,255)
Blue =   Color (0,0,255)
Purple = Color (140,0,255)
Pink =   Color (255,0,255)


------------------------------------------------------------------------------------------------------
-- IF YOU CHANGE ANYTHING IN HERE YOU WILL NEED TO REJOIN/RESTART YOUR SERVER FOR IT TO TAKE EFFECT --
------------------------------------------------------------------------------------------------------

Configuration.DarkRP                = true  -- Enable if using DarkRP, disable if sandbox (Will enable/disable job text/money)

------------------
-- Title Config --
------------------
Configuration.ServerTitle           = "Karma Classic DarkRP" -- Changes the head title
Configuration.ServerTitleColor      = White -- Changes the color of the title

---------------------
-- Name Row Config --
---------------------
Configuration.NameText              = "Name" -- Changes "Name" text
Configuration.NameOn                = true -- Turns on showing "Name" or not
Configuration.NameColor             = White -- Changes "Name" row text Color

--------------------
-- Job Row Config --
--------------------
Configuration.JobText               = "Job" -- Changes "Job" text
Configuration.JobColors             = true -- Changes if DarkRP jobs are colored or not (The same as set in your darkrpmodification/lua/darkrp_customthings/job.lua file)
Configuration.JobColorElse          = White -- If above is set to false, what color do you want the jobs text row to be?

----------------------
-- Kills Row Config --
----------------------
Configuration.KillsText             = "K" -- Changed "Kills" text
Configuration.KillsOn               = true -- Show Kills (true) or not (false)
Configuration.KillColor             = White -- Changes "Kills" text row color
-----------------------
-- Deaths Row Config --
-----------------------
Configuration.DeathsText            = "D" -- Changes "Deaths" text
Configuration.DeathsOn              = true -- Show deaths (true) or not (false)
Configuration.DeathColor            = White -- Changes "Deaths" text row color
---------------------
-- Rank Row Config --
---------------------
Configuration.RankText              = "Rank" -- Changes "Rank" text
Configuration.RankOn                = true -- Show ranks (true) or not (false)
Configuration.RankColor             = White -- Changes "Rank" text row color

---------------------
-- Ping Row Config --
---------------------
Configuration.PingText              = "Ping" -- Changes "Ping" - text
Configuration.PingOn                = true -- Show ping (true) or not (false)
Configuration.PingColor             = White -- Changes "Ping" text row color

--------------------------------
-- Show Online Players Config --
--------------------------------
Configuration.CurrentPlayersText    = "Current Players:" -- Changes "Current Players" text
Configuration.ShowOnlineCount       = true -- Shows online players at the bottom of the scoreboard
Configuration.OnlineColor           = White -- Changes "Online Count" text color
