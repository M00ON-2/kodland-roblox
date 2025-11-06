local coin = script.Parent

coin.Touched:Connect(function(hit)
	local player = game.Players:GetPlayerFromCharacter(hit.Parent)
	if player then
		local leaderstats = player:FindFirstChild("leaderstats")
		if leaderstats then
			local coins = leaderstats:FindFirstChild("Coins")
			if coins then
				coins.Value = coins.Value + 1
				coin:Destroy() -- remove a moeda após coletar
			end
		end
	end
end)

while true do
	coin.Orientation = coin.Orientation + Vector3.new(0, 5, 0)
	wait(0.05)
end
