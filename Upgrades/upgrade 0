
local upgradeCost = 0
local clickDetector = script.Parent.ClickDetector
local oneTimePurchase = false

clickDetector.MouseClick:Connect(function(player)
	local cash = player.leaderstats.Cash
	if oneTimePurchase then
		return
	end
	if cash.Value >= upgradeCost then
		cash.Value -= upgradeCost
		player.PlayerStats.PassiveRate.Value += 0.01
		player.PlayerStats.UpgradesOwned.Value += 1

		oneTimePurchase = true
	end
end)
