local GUIE = {}
GUIE.__index = GUIE

function GUIE._Start(Config : ModuleScript)
	local newGUIE = setmetatable({},GUIE)
	
	newGUIE.Config = Config
	
	return newGUIE
end

function GUIE:_CreateNotification(TypeNotification : string, RandomMath : number, Chance : number, StockName : string, CurrentStock : number)
	local TweenService = game:GetService("TweenService")
	
	local Info = TweenInfo.new(
		0.5,
		Enum.EasingStyle.Sine,
		Enum.EasingDirection.In,
		0,
		false,
		0
	)
	
	if TypeNotification == "NotififcationStock" then
		local Notification = script.Notification:Clone()
		Notification.Parent = game.Players.LocalPlayer.PlayerGui
		
		if RandomMath == 1 then
			Notification.Frame.TextLabel.Text = StockName .. " Is increased in " .. Chance .. "%, Current Stock is " .. CurrentStock
			Notification.Frame.TextLabel.TextColor3 = Color3.new(0,1,0)
		elseif RandomMath == 2 then
			Notification.Frame.TextLabel.Text = StockName .. " Is decreased in " .. Chance .. "%, Current Stock is " .. CurrentStock
			Notification.Frame.TextLabel.TextColor3 = Color3.new(1,0,0)
		end
		
		game:GetService("SoundService").Notification:Play()
		
		TweenService:Create(Notification.Frame,Info,{Position = UDim2.new(0.174,0,0.9,0)}):Play()
		TweenService:Create(Notification.Frame.TextLabel,Info,{TextTransparency = 0}):Play()
		task.wait(3)
		TweenService:Create(Notification.Frame,Info,{Position = UDim2.new(0.174,0,1,0)}):Play()
		TweenService:Create(Notification.Frame.TextLabel,Info,{TextTransparency = 1}):Play()
		
	end
end

return GUIE