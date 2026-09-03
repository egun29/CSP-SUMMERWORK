local upgradeCost = 0.25
local clickDetector = script.Parent.ClickDetector
local oneTimePurchase = false
clickDetector.MouseClick:Connect(function(player)
	local cash = player.leaderstats.Cash
	if oneTimePurchase then
		return
	end
	if cash.Value >= upgradeCost then
		cash.Value -= upgradeCost
		player.PlayerStats.PassiveRateMultiplier.Value *= 1.5
		player.PlayerStats.UpgradesOwned.Value += 1
		oneTimePurchase = true
	end
end)
