local upgradeCost = 15
local clickDetector = script.Parent.ClickDetector
local oneTimePurchase = false

clickDetector.MouseClick:Connect(function(player)
    local currency3 = player.PlayerStats.Currency3
    if oneTimePurchase then return end

    if currency3.Value >= upgradeCost then
        currency3.Value -= upgradeCost
        player.PlayerStats.HasUpgrade12.Value = true
        player.PlayerStats.UpgradesOwned.Value += 1
        oneTimePurchase = true
    end
end)
