local Players = game:GetService("Players")
--Amount of time between each passive-income tick
local BASE_TICK_INTERVAL = 1
--Prevents the tick interval from becoming faster/lower than 0.05 seconds
local MIN_TICK_INTERVAL = 0.05

Players.PlayerAdded:Connect(function(player)
  --Creates leaderboard stats
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

-- Create the player's Cash currency
	local cash = Instance.new("NumberValue")
	cash.Name = "Cash"
	cash.Value = 0
	cash.Parent = leaderstats

-- Creates the player's TimeFuel currency
	local timeFuel = Instance.new("NumberValue")
	timeFuel.Name = "TimeFuel"
	timeFuel.Value = 0
	timeFuel.Parent = leaderstats

--Creates the player's Gold currency
	local gold = Instance.new("NumberValue")
	gold.Name = "Gold"
	gold.Value = 0
	gold.Parent = leaderstats

--Creates the player's Reset Tokens currency
	local resetTokens = Instance.new("NumberValue")
	resetTokens.Name = "ResetTokens"
	resetTokens.Value = 0
	resetTokens.Parent = leaderstats

-- Creates a separate folder for stats that aren't shown on the default leaderboard
	local playerStats = Instance.new("Folder")
	playerStats.Name = "PlayerStats"
	playerStats.Parent = player

-- Tracks how many upgrades the player has unlcoked
	local upgradesOwned = Instance.new("IntValue")
	upgradesOwned.Name = "UpgradesOwned"
	upgradesOwned.Value = 0
	upgradesOwned.Parent = playerStats

-- Stores the player's base passive cash generation rate
	local passiveRate = Instance.new("NumberValue")
	passiveRate.Name = "PassiveRate"
	passiveRate.Value = 0
	passiveRate.Parent = playerStats

-- Multiplies the player's passive cash generation, starts at 1, providing no bonus until an upgrade increases the value
	local passiveRateMultiplier = Instance.new("NumberValue")
	passiveRateMultiplier.Name = "PassiveRateMultiplier"
	passiveRateMultiplier.Value = 1
	passiveRateMultiplier.Parent = playerStats

-- Stores how much TimeFuel the player generates per second/tick
	local timeFuelRate = Instance.new("NumberValue")
	timeFuelRate.Name = "TimeFuelRate"
	timeFuelRate.Value = 0
	timeFuelRate.Parent = playerStats

--Multiplies the player's TimeFuel generation rate, starts at 1, providing no bonus until an upgrade increases the value
	local timeFuelMultiplier = Instance.new("NumberValue")
	timeFuelMultiplier.Name = "TimeFuelMultiplier"
	timeFuelMultiplier.Value = 1
	timeFuelMultiplier.Parent = playerStats

-- Tracks the number of times player bought Upgrade 9
	local upgrade9Level = Instance.new("IntValue")
	upgrade9Level.Name = "Upgrade9Level"
	upgrade9Level.Value = 0
	upgrade9Level.Parent = playerStats

-- Tracks whether the player has bought Upgrade 6 or not
	local hasUpgrade6 = Instance.new("BoolValue")
	hasUpgrade6.Name = "HasUpgrade6"
	hasUpgrade6.Value = false
	hasUpgrade6.Parent = playerStats

-- Tracks whether the player has bought Upgrade 12 or not
	local hasUpgrade12 = Instance.new("BoolValue")
	hasUpgrade12.Name = "HasUpgrade12"
	hasUpgrade12.Value = false
	hasUpgrade12.Parent = playerStats

-- Tracks whether the player has bought Upgrade 17 or not
	local hasUpgrade17 = Instance.new("BoolValue")
	hasUpgrade17.Name = "HasUpgrade17"
	hasUpgrade17.Value = false
	hasUpgrade17.Parent = playerStats

-- Tracks whether the player has bought Upgrade 18 or not
	local hasUpgrade18 = Instance.new("BoolValue")
	hasUpgrade18.Name = "HasUpgrade18"
	hasUpgrade18.Value = false
	hasUpgrade18.Parent = playerStats

-- Tracks whether Reset 2 has been unlocked
	local hasReset2Unlocked = Instance.new("BoolValue")
	hasReset2Unlocked.Name = "HasReset2Unlocked"
	hasReset2Unlocked.Value = false
	hasReset2Unlocked.Parent = playerStats

-- Tracks whether the player's obbies have been unlocked
	local hasObbiesUnlocked = Instance.new("BoolValue")
	hasObbiesUnlocked.Name = "HasObbiesUnlocked"
	hasObbiesUnlocked.Value = false
	hasObbiesUnlocked.Parent = playerStats

-- Tracks whether the player has beaten the game
	local hasBeatenGame = Instance.new("BoolValue")
	hasBeatenGame.Name = "HasBeatenGame"
	hasBeatenGame.Value = false
	hasBeatenGame.Parent = playerStats

	task.spawn(function()
		while player:IsDescendantOf(Players) do
			--Makes a speedBoost that shortens time between each passive cash gain
			local speedBoost = 1 + (timeFuel.Value / 10)

			if hasUpgrade12.Value then
			--If the player has bought Upgrade 12, timeFuel provides a bigger bonus
				speedBoost = 1 + (timeFuel.Value / 5)
			end

			--Sets the currentTickInterval, with the base tick value being reduced by the speedBost value (curretly 1, so no reduction)
			--and also adds a min tick value so that the currentTickInterval cannot become negative
			local currentTickInterval = math.max(MIN_TICK_INTERVAL, BASE_TICK_INTERVAL / speedBoost)
			task.wait(currentTickInterval)

			local effectiveCashMultiplier = passiveRateMultiplier.Value
			--Combines the passiveRateMultiplier with a boost from timeFuel
			-- only if the player has Upgrade 6
			if hasUpgrade6.Value then

			--If the player has also obtained Ugrade 12, timeFuel's contribution recieves a 2x boost
				if hasUpgrade12.Value then
					effectiveCashMultiplier += (timeFuel.Value * 2)
				else
					effectiveCashMultiplier += timeFuel.Value
				end
			end

			--Formula for the total cash rate, taking the passive rate the player generates cash 
			--and multiplying by the effectiveCashMultipler
			local totalCashRate = passiveRate.Value * effectiveCashMultiplier
			if totalCashRate > 0 then

			--The gainedCash that the player receives is the rate they gain it by divided by the time it takes to gain that rate
				local gainedCash = totalCashRate / currentTickInterval

				if hasUpgrade17.Value then
			-- If the player has Upgrade 17 increase the gainedCash by taking it to the 1.05 power
				
					gainedCash = gainedCash ^ 1.05
				end

			-- Adds the final gainedCash to the player's cash
				cash.Value += gainedCash
			end
		end
	end)

	task.spawn(function()
		while player:IsDescendantOf(Players) do

			--Formula for timeFuel gain
			--Makes a speedBoost that shortens time between each timeFuel gain
			--If the player has bought Upgrade 12, timeFuel provides a bigger bonus--Combines the passiveRateMultiplier with a boost from timeFuel
			-- only if the player has Upgrade 6

			local speedBoost = 1 + (timeFuel.Value / 10)
			if hasUpgrade12.Value then
				speedBoost = 1 + (timeFuel.Value / 5)
			end

			--Sets the currentTickInterval, with the base tick value being reduced by the speedBost value (curretly 1, so no reduction)
			--and also adds a min tick value so that the currentTickInterval cannot become negative
			local currentTickInterval = math.max(MIN_TICK_INTERVAL, BASE_TICK_INTERVAL / speedBoost)
			task.wait(currentTickInterval)
			
			--Formula for the total timeFuel, taking the passive rate the player generates timeFuel 
			--and multiplying by the timeFuelMultiplier
			local totalTimeFuelRate = timeFuelRate.Value * timeFuelMultiplier.Value
			if totalTimeFuelRate > 0 then
				timeFuel.Value += (totalTimeFuelRate / currentTickInterval)
			end
		end
	end)
end)
