local upgradeCost = 1
local clickDetector = script.Parent.ClickDetector
local oneTimePurchase = false

clickDetector.MouseClick:Connect(function(player)
	local resetTokens = player.PlayerStats.ResetTokens
	if oneTimePurchase then return end

	if resetTokens.Value >= upgradeCost then
		resetTokens.Value -= upgradeCost
		player.PlayerStats.HasUpgrade18.Value = true
		player.PlayerStats.UpgradesOwned.Value += 1
		oneTimePurchase = true
	end
end)
