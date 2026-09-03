local clickDetector = script.Parent.ClickDetector
local costs = {150, 350, 800, 1800, 4000}
local currentLevel = 0
local maxLevel = #costs

clickDetector.MouseClick:Connect(function(player)
    if currentLevel >= maxLevel then return end
    local cash = player.leaderstats.Cash
    local currentCost = costs[currentLevel + 1]

    if cash.Value >= currentCost then
        cash.Value -= currentCost
        player.PlayerStats.PassiveRateMultiplier.Value *= 1.5
        player.PlayerStats.Upgrade9Level.Value += 1
        player.PlayerStats.UpgradesOwned.Value += 1
        currentLevel += 1
    end
end)
