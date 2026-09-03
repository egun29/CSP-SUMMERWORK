local clickDetector = script.Parent.ClickDetector

clickDetector.MouseClick:Connect(function(player)
	local stats = player.PlayerStats
	if stats.HasReset2Unlocked.Value == true then
		stats.ResetTokens.Value += 1
		player.leaderstats.Cash.Value = 0
		stats.TimeFuel.Value = 0
		stats.TimeFuelRate.Value = 0
		stats.TimeFuelMultiplier.Value = 1
		stats.Currency3.Value = 0
		stats.PassiveRate.Value = 0
		stats.PassiveRateMultiplier.Value = 1
	end
end)
