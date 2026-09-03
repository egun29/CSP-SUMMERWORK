local upgradeCostCash = 12
local upgradeCostTimeFuel = 30
local clickDetector = script.Parent.ClickDetector
local oneTimePurchase = false

clickDetector.MouseClick:Connect(function(player)
    local cash = player.leaderstats.Cash
    local timeFuel = player.PlayerStats.TimeFuel
    if oneTimePurchase then return end

    if cash.Value >= upgradeCostCash and timeFuel.Value >= upgradeCostTimeFuel then
        cash.Value -= upgradeCostCash
        timeFuel.Value -= upgradeCostTimeFuel
        player.PlayerStats.TimeFuelMultiplier.Value *= 2
        player.PlayerStats.UpgradesOwned.Value += 1
        oneTimePurchase = true
    end
end)
