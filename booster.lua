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
		local coins = leaderstats:FindFirstChild("Moedas")
		if coins and coins.Value >= price then
			coins.Value -= price
			humanoid.WalkSpeed = speedBoost
			print(player.Name .. " comprou super speed!")

			task.wait(5)
			humanoid.WalkSpeed = normalSpeed
		end
	end
end)

local part = script.Parent
local t = 0

while true do
	local r = math.sin(t) * 0.5 + 0.5
	local g = math.sin(t + 2) * 0.5 + 0.5
	local b = math.sin(t + 4) * 0.5 + 0.5

	part.Color = Color3.new(r, g, b)
	t += 0.05
	task.wait()
end
