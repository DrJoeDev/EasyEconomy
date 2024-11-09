--[[
Put config module in localscript
]]--


return {
	["VERSION"] = "0.0.1";
	
	["Payday"] = 250;
	["CooldownPayday"] = 5;
	
	["RandomizerEnable"] = true;
	["StockTable"] = {
		[1] = {
			["Name"] = "$JOEC";
			["CurrentStock"] = 1;
		};
		[2] = {
			["Name"] = "$PIZD";
			["CurrentStock"] = 0.5;
		};
	};
	["RandomizerChance"] = {
		[1] = 0.0001;
		[2] = 0.0002;
		[3] = 0.0003;
		[4] = 0.0004;
		[5] = 0.0005;
		[6] = 0.0006;
		[7] = 0.0007;
		[8] = 0.0008;
		[9] = 0.0009;
		[10] = 0.0010;
		[11] = 0.0020;
		[12] = 0.0030;
		[13] = 0.0040;
	};
}