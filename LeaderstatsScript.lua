-- SERVICES
local Players = game:GetService("Players")

-- SPIELER-BEITRITT HANDHABEN
Players.PlayerAdded:Connect(function(player)
	-- Erstellt den offiziellen "leaderstats"-Ordner für Roblox
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	-- Münz-Wert hinzufügen
	local coins = Instance.new("IntValue")
	coins.Name = "Coins"
	coins.Value = 0
	coins.Parent = leaderstats
end)
