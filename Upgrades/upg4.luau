local upgradeCost = 0.40
local clickDetector = script.Parent.ClickDetector
local currentLevel = 0
local maxLevel = 5
clickDetector.MouseClick:Connect(function(player)
	if currentLevel >= maxLevel then
		return
	end
	local cash = player.leaderstats.Cash
	if cash.Value >= upgradeCost then
		cash.Value -= upgradeCost
		player.PlayerStats.PassiveRate.Value += 0.01
		player.PlayerStats.UpgradesOwned.Value += 1
		currentLevel += 1
		upgradeCost *= 2
	end
end)
