local upgradeCost = 5
local clickDetector = script.Parent.ClickDetector
local oneTimePurchase = false
clickDetector.MouseClick:Connect(function(player)
    local cash = player.leaderstats.Cash
    if oneTimePurchase then
        return
    end
    if cash.Value >= upgradeCost then
        cash.Value -= upgradeCost
        local timeFuel = player.PlayerStats.TimeFuel
        player.PlayerStats.PassiveRateMultiplier.Value += timeFuel.Value
        player.PlayerStats.UpgradesOwned.Value += 1
        oneTimePurchase = true
    end
end)
