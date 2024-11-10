local IS = {}
IS.__index = IS

function IS._Start(Config : ModuleScript)
	local newIS = {}
	
	newIS.Config = Config;
	newIS.RandomizerOfStock = newIS.Config.RandomizerEnable
	newIS.StockTable = newIS.Config.StockTable
	newIS.RandomizerChance = newIS.Config.RandomizerChance
	newIS.GUIE = require(script.Parent.GuiEconomy)
	
	setmetatable(newIS,IS)
	
	return newIS
end

function IS:_EnableRandomizer(EnableNotififcation : boolean)
	if self.RandomizerOfStock then
		local IsNotificationCreated = false
		
		while true do
			local newGUIE = self.GUIE._Start(self.Config)
			
			IsNotificationCreated = true
			local newRandomChance = Random.new():NextInteger(1,#self.RandomizerChance)
			local newRandomMath = Random.new():NextInteger(1,2)
			local newRandomStock = Random.new():NextInteger(1,#self.StockTable)
			if newRandomMath == 1 then
				local CurrentStock = self.StockTable[newRandomStock]
				local NewRandomizerChance = self.RandomizerChance[newRandomChance]
				CurrentStock.CurrentStock += NewRandomizerChance
				print(CurrentStock.Name .. " " .. CurrentStock.CurrentStock)
			elseif newRandomMath == 2 then
				local CurrentStock = self.StockTable[newRandomStock]
				local NewRandomizerChance = self.RandomizerChance[newRandomChance]
				CurrentStock.CurrentStock -= NewRandomizerChance
				print(CurrentStock.Name .. " " .. CurrentStock.CurrentStock)
			end
			
			if EnableNotififcation then
				newGUIE:_CreateNotification(
					"NotififcationStock",
					newRandomMath,
					self.RandomizerChance[newRandomChance],
					self.StockTable[newRandomStock].Name,
					self.StockTable[newRandomStock].CurrentStock
				)
			end
			
			task.wait(math.random(1,5))
			IsNotificationCreated = false
		end
	end
end


return IS