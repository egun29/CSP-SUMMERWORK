local upgradeCost = 0.60
local clickDetector = script.Parent.ClickDetector
local oneTimePurchase = false

clickDetector.MouseClick:Connect(function(player)
	local cash = player.leaderstats.Cash

	if oneTimePurchase then return end

	if cash.Value >= upgradeCost then
		cash.Value -= upgradeCost
		local upgradesOwned = player.PlayerStats.UpgradesOwned.Value
		local multiplier = math.min(3, 1 + (upgradesOwned * 0.1))
		player.PlayerStats.PassiveRateMultiplier.Value *= multiplier
		player.PlayerStats.UpgradesOwned.Value += 1
		oneTimePurchase = true
	end
end)
