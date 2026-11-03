-- SERVICES
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

-- EINSTELLUNGEN
local coin = script.Parent
local COIN_VALUE = 1       -- Wie viele Münzen man bekommt
local RESPAWN_TIME = 5     -- Sekunden, bis die Münze wieder auftaucht
local ROTATION_SPEED = 2   -- Dauer einer vollen Drehung in Sekunden

local isCollected = false

-- KONTINUIERLICHE ROTATION (ANIMATION)
local spinInfo = TweenInfo.new(ROTATION_SPEED, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1)
local spinTween = TweenService:Create(coin, spinInfo, {Orientation = coin.Orientation + Vector3.new(0, 360, 0)})
spinTween:Play()

-- BERÜHRUNG ABFANGEN
coin.Touched:Connect(function(hit)
	if isCollected then return end

	local character = hit.Parent
	if not character then return end

	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if not humanoid or humanoid.Health <= 0 then return end

	local player = Players:GetPlayerFromCharacter(character)
	if not player then return end

	local leaderstats = player:FindFirstChild("leaderstats")
	local coinsValue = leaderstats and leaderstats:FindFirstChild("Coins")

	if coinsValue then
		isCollected = true
		coinsValue.Value = coinsValue.Value + COIN_VALUE

		-- Münze unsichtbar machen
		coin.Transparency = 1
		
		-- Animation anhalten
		spinTween:Pause()

		-- Warten bis zum Respawn
		task.wait(RESPAWN_TIME)

		-- Münze wieder sichtbar machen
		coin.Transparency = 0
		
		-- Animation fortsetzen
		spinTween:Play()
		isCollected = false
	end
end)
