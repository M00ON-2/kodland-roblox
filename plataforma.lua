local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local part = script.Parent
local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut, -1, true)

local tween = TweenService:Create(part, tweenInfo, {
	CFrame = part.CFrame * CFrame.new(0, 0, -100)
})
	
tween:Play()

local ultimaPosicao = part.Position

RunService.Stepped:Connect(function (_, deltaTime)
	local atualPosicao = part.Position
	local deltaPosition = atualPosicao - ultimaPosicao
	
	local velocidade = deltaPosition / deltaTime
	
	part.AssemblyLinearVelocity = velocidade
	
	ultimaPosicao = atualPosicao
	
end)