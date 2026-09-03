local clickDetector = script.Parent.ClickDetector
local costs = {1, 3, 8, 20, 50}
local currentLevel = 0
local maxLevel = #costs

clickDetector.MouseClick:Connect(function(player)
    if currentLevel >= maxLevel then return end
    local currency3 = player.PlayerStats.Currency3
    local currentCost = costs[currentLevel + 1]

    if currency3.Value >= currentCost then
        currency3.Value -= currentCost
        player.PlayerStats.PassiveRateMultiplier.Value *= 2.5
        player.PlayerStats.UpgradesOwned.Value += 1
        currentLevel += 1
    end
end)
