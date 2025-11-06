-- Script: SpeedBoost 
local boostPart = script.Parent
local price = 3
local speedBoost = 100
local normalSpeed = 16

boostPart.Touched:Connect(function(hit)
	local player = game.Players:GetPlayerFromCharacter(hit.Parent)
	if not player then return end

	local leaderstats = player:FindFirstChild("leaderstats")
	local humanoid = hit.Parent:FindFirstChild("Humanoid")

	if leaderstats and humanoid then
		local coins = leaderstats:FindFirstChild("Coins")
		if coins and coins.Value >= price then
			coins.Value -= price
			humanoid.WalkSpeed = speedBoost
			print(player.Name .. " comprou super speed!")

			task.wait(5)
			humanoid.WalkSpeed = normalSpeed
		else
			print("Moedas insuficientes!")
		end
	end
end)
