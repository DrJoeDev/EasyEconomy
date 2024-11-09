--[[
   _  ______                ______                                       _  
  | ||  ____|              |  ____|                                     | | 
 / __) |__   __ _ ___ _   _| |__   ___ ___  _ __   ___  _ __ ___  _   _/ __)
 \__ \  __| / _` / __| | | |  __| / __/ _ \| '_ \ / _ \| '_ ` _ \| | | \__ \
 (   / |___| (_| \__ \ |_| | |___| (_| (_) | | | | (_) | | | | | | |_| (   /
  |_||______\__,_|___/\__, |______\___\___/|_| |_|\___/|_| |_| |_|\__, ||_| 
                       __/ |                                       __/ |    
                      |___/                                       |___/
                      
   !WARNING: THIS FRAMEWORK IS CURRENTLY IN DEVELOPMENT, IF THERE IS A MISSING FEATURE OR A BUG, WRITE IN ISSUES IN GITHUB OR YOU CAN WRITE IN COMMENT SECTION YOUR PROBLEM OR OPINION IN DEVFORUM POST!                    
   By: DrJoeDev
   Current Version: 0.0.1
   Description: "EasyEconomy is a framework that adding economy in your game, In this framework there is investment system, randomiser algoritm of stock market,cryptocurrency creation,
   gui framework for create a analysis of currency state, and better datastore modification. If you interesed of this information. First you need import module in ReplicatedStorage or 
   change parent of module on ReplicatedStorage, Second you need add script in StarterPlayerScripts, and write two lines of codes, which is you need run function _Start() and initialize 
   with a function _InitRun(). And we are done, we run a framework."
]]--


local EE = {}
EE.__index = EE

function EE._Start(Module : ModuleScript)
	local newEconomy = setmetatable({},EE)
	
	newEconomy.Config = require(Module)
	newEconomy.Payday = newEconomy.Config.Payday
	newEconomy.Cooldown = newEconomy.Config.CooldownPayday
	
	return newEconomy
end

function EE:_Init()
	local InvesmentService = require(script.InvesmemtService)
	local NewInvesment = InvesmentService._Start(self.Config)
	
	EE._CreateLeaderstats(true)
	
	NewInvesment:_EnableRandomizer()
end

function EE._CreateLeaderstats(Create : boolean)
	local Leaderstats = Instance.new("Folder")
	Leaderstats.Name = "leaderstats"
	Leaderstats.Parent = game.Players.LocalPlayer
	
	EE._CreateCoin("Money",Leaderstats)
end

function EE._CreateCoin(Name : string, leaderstats : Folder)
	local Coin = Instance.new("IntValue")
	Coin.Name = Name
	Coin.Parent = leaderstats
	Coin.Value = 0
end

function EE:EnablePayday(Enable : boolean, Coin : IntValue)

	while true do
		Coin.Value = Coin.Value + self.Payday
		wait(self.Cooldown)
	end
end


return EE