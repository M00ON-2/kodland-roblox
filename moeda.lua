local moeda = script.Parent
local valor = 1 -- valor de cada moeda
local coletada = false -- evita múltiplas coletas

moeda.Touched:Connect(function(hit)
	if coletada then return end -- já foi coletada

	local player = game.Players:GetPlayerFromCharacter(hit.Parent)
	if player then
		local leaderstats = player:FindFirstChild("leaderstats")
		local moedas = leaderstats and leaderstats:FindFirstChild("Moedas")

		if moedas then
			coletada = true -- marca como coletada
			moedas.Value += valor

			moeda.Transparency = 1
			moeda.CanTouch = false

			task.wait(0.1)
			moeda:Destroy()
		end
	end
end)

local coin = script.Parent
while task.wait(0.05) do
	coin.Orientation += Vector3.new(0, 5, 0)
end
