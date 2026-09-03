local baseCost = 15
local clickDetector = script.Parent.ClickDetector
local currentLevel = 0
local maxLevel = 5

clickDetector.MouseClick:Connect(function(player)
    if currentLevel >= maxLevel then return end
    local cash = player.leaderstats.Cash
    local upgrade9Level = player.PlayerStats.Upgrade9Level.Value
    local dynamicCost = (baseCost * (2 ^ currentLevel)) / (2 ^ upgrade9Level)

    if cash.Value >= dynamicCost then
        cash.Value -= dynamicCost
        player.PlayerStats.PassiveRateMultiplier.Value *= 1.2
        player.PlayerStats.UpgradesOwned.Value += 1
        currentLevel += 1
    end
end)
