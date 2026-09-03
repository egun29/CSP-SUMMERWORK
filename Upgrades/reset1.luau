local clickDetector = script.Parent.ClickDetector

clickDetector.MouseClick:Connect(function(player)
	local cash = player.leaderstats.Cash
	local timeFuel = player.PlayerStats.TimeFuel
	local gold = player.PlayerStats.Gold
	local currentCash = cash.Value

	if currentCash <= 0 then return end

	local logMultiplier = 25
	if player.PlayerStats.HasUpgrade18.Value == true then
		logMultiplier = 50
	end

	local earnedGold = math.floor(logMultiplier * math.log10(4 + (currentCash / 6767)))

	if earnedGold > 0 then
		gold.Value = earnedGold
		cash.Value = 0
		timeFuel.Value = 0
		player.PlayerStats.TimeFuelRate.Value = 0
		player.PlayerStats.TimeFuelMultiplier.Value = 1
		player.PlayerStats.PassiveRate.Value = 0
		player.PlayerStats.PassiveRateMultiplier.Value = 1
	end
end)
