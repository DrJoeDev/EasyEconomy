local RS = game:GetService("ReplicatedStorage")
local EzEconomy = require(RS.EasyEconomy)

local Economy = EzEconomy._Start(script.Config)

Economy:_Init()