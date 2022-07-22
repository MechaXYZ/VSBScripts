warn([[
😱 scary ghost 😱 script by mechaxyz 😱

😱 controls 😱

😱 e - toggle hunting mode 😱

😱 x - teleport to where your mouse is 😱

😱 f - toggle flight 😱

😱 thats it 😱
]])
owner.Character.Humanoid.WalkSpeed = 13.5
local random = Random.new()
local letters = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','!','?','/','1','2','3','4','5','6','7','8','9','0',';',':','@'}
 
function getRandomLetter()
	return letters[random:NextInteger(1,#letters)]
end
 
function getRandomString(length, includeCapitals)
	local length = length or 10
	local str = ''
	for i=1,length do
		local randomLetter = getRandomLetter()
		if includeCapitals and random:NextNumber() > .5 then
			randomLetter = string.upper(randomLetter)
		end
		str = str .. randomLetter
	end
	return str
end
local re = Instance.new("RemoteEvent" , owner.Character)
re.Name = 'GhostEvent'
local re2 = Instance.new("RemoteEvent" , owner.Character)
re2.Name = 'KeyDownEvent'
local ack = Instance.new("Sound" , owner.Character.Head)
ack.SoundId = 'rbxassetid://13061809'
ack.Volume = 1
ack.Pitch = .1
ack.Looped = true
ack:Play()
local ack = Instance.new("Sound" , owner.Character.Head)
ack.SoundId = 'rbxassetid://13061810'
ack.Volume = 2.25
local scream = Instance.new("Sound" , owner.Character.Head)
scream.SoundId = 'rbxassetid://94247611'
scream.TimePosition = .5
scream.Volume = 1
local activate = Instance.new("Sound" , owner.Character.Head)
activate.SoundId = 'rbxassetid://297569488'
activate.Volume = 1
local scream2 = Instance.new("Sound" , owner.Character.Head)
scream2.SoundId = 'rbxassetid://94247729'
scream2.Volume = 1
local snap = Instance.new("Sound" , owner.Character.Head)
snap.SoundId = 'rbxassetid://198606040'
snap.Volume = 1
owner.Character.Humanoid.DisplayName = getRandomString(math.random(1,15), true)
if owner.Character:FindFirstChildOfClass("Shirt") then
owner.Character:FindFirstChildOfClass("Shirt"):Destroy()
end
if owner.Character:FindFirstChildOfClass("ShirtGraphic") then
owner.Character:FindFirstChildOfClass("ShirtGraphic"):Destroy()
end
if owner.Character:FindFirstChildOfClass("Pants") then
owner.Character:FindFirstChildOfClass("Pants"):Destroy()
end
re.OnServerEvent:Connect(function(plr, pos, look, move)
owner.Character.HumanoidRootPart.CFrame = CFrame.new(owner.Character.HumanoidRootPart.Position, owner.Character.HumanoidRootPart.Position + look) * move
end)
owner.Character.Humanoid.BreakJointsOnDeath = false
owner.Character.Humanoid.MaxHealth = math.huge * math.huge ^ math.huge
owner.Character.Humanoid.Health = math.huge * math.huge ^ math.huge
owner.Character.Humanoid.HealthChanged:Connect(function()
owner.Character.Humanoid.MaxHealth = math.huge * math.huge ^ math.huge
owner.Character.Humanoid.Health = math.huge * math.huge ^ math.huge
end)
local PhysService = game:GetService("PhysicsService")
local name = owner.Name.. "'s Non Collidable Group"
local name2 = owner.Name.. "'s Collision Group"
 
pcall(function()
PhysService:CreateCollisionGroup(name)
PhysService:CreateCollisionGroup(name2)
end)
PhysService:CollisionGroupSetCollidable(name, name2, false)
local function NoCollide(model)
for k,v in pairs (model:GetDescendants()) do
   if v:IsA("Part") then
    PhysService:SetPartCollisionGroup(v,name)
   end
  end
end
pcall(function()
for i, v in pairs(game:GetDescendants()) do
if v:IsA("BasePart") and v:IsDescendantOf(owner.Character) == false and not v:FindFirstAncestorOfClass("WorldModel") and v.Name ~= 'Base' then
PhysService:SetPartCollisionGroup(v, name)
end
end
end)
game.DescendantAdded:Connect(function(part)
if part:IsA("BasePart") and part:IsDescendantOf(owner.Character) == false and not part:FindFirstAncestorOfClass("WorldModel") and part.Name ~= 'Base' then
PhysService:SetPartCollisionGroup(part,name)
end
end)
for i,v  in pairs(game:GetService("Players"):GetPlayers()) do
if v ~= owner and v.Character then
NoCollide(v.Character)
else
for i,v2  in pairs(owner.Character:GetDescendants()) do
if v2:IsA("Part") then
PhysService:SetPartCollisionGroup(v2,name2)
end
end
end
end
game:GetService("Players").PlayerAdded:Connect(function(plr)
plr.CharacterAdded:Wait()
NoCollide(plr.Character)
end)
local attackmode = false
local con = nil
local db = false
local at0 = Instance.new("Attachment" , owner.Character.Head)
at0.CFrame = CFrame.new(.15,.1,-.75)
local at1 = Instance.new("Attachment" , owner.Character.Head)
at1.CFrame = CFrame.new(-.15,.1,-.75)
local pe = Instance.new("Fire")
pe.Parent = at0
pe.Heat = 5
pe.Color = Color3.fromRGB(255,0,0)
pe.SecondaryColor = Color3.fromRGB(255,255,255)
pe.Size = 2.5
pe.Enabled = false
local pe2 = Instance.new("Fire")
pe2.Parent = at1
pe2.Heat = 5
pe2.Enabled = false
pe2.Color = Color3.fromRGB(125,0,0)
pe2.SecondaryColor = Color3.fromRGB(255,0,0)
pe2.Size = 2.5
local flying = false
local p0 = Instance.new("Part" , owner.Character.Head)
p0.Name = 'Right Eye'
p0.Material = 'Neon'
p0.CanCollide = false
p0.BrickColor = BrickColor.new("Bright red")
p0.Size = Vector3.new(.15,.2,.1)
local w = Instance.new("Weld" , owner.Character.Head)
w.Part0 = p0
w.Part1 = owner.Character.Head
w.C1 = CFrame.new(.15,.2,-.6)
local p1 = Instance.new("Part" , owner.Character.Head)
p1.Name = 'Left Eye'
p1.Material = 'Neon'
p1.CanCollide = false
p1.BrickColor = BrickColor.new("Bright red")
p1.Size = Vector3.new(.15,.2,.1)
local w = Instance.new("Weld" , owner.Character.Head)
w.Part0 = p1
w.Part1 = owner.Character.Head
w.C1 = CFrame.new(-.15,.2,-.6)
p0.Transparency = 1
p1.Transparency = 1
re2.OnServerEvent:Connect(function(plr, k, location)
if k == 'e' and attackmode == false then
attackmode = true
activate:Play()
owner.Character.Humanoid.WalkSpeed = 28
pe.Enabled = true
pe2.Enabled = true
p0.Transparency = 0
p1.Transparency = 0
con = owner.Character.HumanoidRootPart.Touched:Connect(function(hit)
if hit and hit:IsDescendantOf(owner.Character) == false and hit:FindFirstAncestorOfClass("Model") and hit:FindFirstAncestorOfClass("Model"):FindFirstChildOfClass("Humanoid") and hit:FindFirstAncestorOfClass("Model"):FindFirstChildOfClass("Humanoid").Health ~= 0 and db == false then
db = true
hit:FindFirstAncestorOfClass("Model"):BreakJoints()
for i,  a in pairs(hit:FindFirstAncestorOfClass("Model"):GetDescendants()) do
coroutine.wrap(function()
if a:IsA("Part") then
task.wait(1)
game:GetService("TweenService"):Create(a, TweenInfo.new(.8), {CFrame = a.CFrame * CFrame.new(0,5,0)}):Play()
game:GetService("TweenService"):Create(a, TweenInfo.new(.5), {Color = Color3.fromRGB(0,0,0)}):Play()
game:GetService("TweenService"):Create(a, TweenInfo.new(.75), {Transparency = 1}):Play()
task.wait(.8)
a:Destroy()
end
end)()
end
local rand = math.random(1, 2)
if rand == 1 then
scream.TimePosition = .5
scream:Play()
elseif rand == 2 then
scream2:Play()
end
snap:Play()
wait(1)
db = false
end
end)
elseif k == 'q' and attackmode == true then
attackmode = false
owner.Character.Humanoid.WalkSpeed = 13.5
p0.Transparency = 1
p1.Transparency = 1
pe.Enabled = false
pe2.Enabled = false
if con then con:Disconnect() end
elseif k == 'f' and flying == true then
flying = false
owner.Character.Humanoid.PlatformStand = false
owner.Character.HumanoidRootPart.Anchored = false
elseif k == 'g' and flying == false then
flying = true
owner.Character.Humanoid.PlatformStand = true
owner.Character.HumanoidRootPart.Anchored = true
elseif k == 'x' and flying == false and location then
owner.Character.HumanoidRootPart.Position = location
ack:Play()
end
end)
for i, v in pairs(owner.Character:GetDescendants()) do
coroutine.wrap(function()
if v:IsA("Accessory") then
v:Destroy()
end
if v:IsA("Part") and v.Name ~= 'HumanoidRootPart' and v.Name ~= 'Right Eye' and v.Name ~= 'Left Eye' then
v.BrickColor = BrickColor.new("Really black")
v.Transparency = 0.25
end
end)()
end
local smoke = Instance.new("Smoke" , owner.Character.Torso)
smoke.Color = Color3.new(0,0,0)
smoke.Opacity = .75
smoke.RiseVelocity = 0
smoke.Size = 3.5
local plrchar = owner.Character
local col = BrickColor.new("Really black")
plrchar["Body Colors"].HeadColor = col
plrchar["Body Colors"].LeftArmColor = col
plrchar["Body Colors"].RightArmColor = col
plrchar["Body Colors"].LeftLegColor = col
plrchar["Body Colors"].RightLegColor = col
plrchar["Body Colors"].TorsoColor = col
NLS([[
local anim = Instance.new("Animation")
anim.AnimationId = 'rbxassetid://183294396'
anim.Name = 'HuntingAnimation'
local anim2 = Instance.new("Animation")
anim2.AnimationId = 'rbxassetid://180416148'
anim2.Name = 'HuntedAnimation'
local animtr2 = owner.Character.Humanoid:LoadAnimation(anim2)
local animtr = owner.Character.Humanoid:LoadAnimation(anim)
local c = workspace.CurrentCamera
local player = game:GetService("Players").LocalPlayer
local userInput = game:GetService("UserInputService")
local rs = game:GetService("RunService")
local re = player.Character.GhostEvent
local re2 = player.Character.KeyDownEvent
local selected = false
local speed = 60
local lastUpdate = 0
local m = owner:GetMouse()
local attackmode = false
local flying = false
local camera = workspace.CurrentCamera
local con = nil
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
 
local player = Players.LocalPlayer
 

local depthOfFieldEffect = Instance.new("DepthOfFieldEffect")
depthOfFieldEffect.Parent = workspace.CurrentCamera
local bloomEffect = Instance.new("BloomEffect")
bloomEffect.Parent = workspace.CurrentCamera
local colorCorrectionEffect = Instance.new("ColorCorrectionEffect")
colorCorrectionEffect.Parent = game:GetService("Lighting")
 
-- Effect constants
local EFFECT_DELAY = 0  -- Seconds
local EFFECT_DURATION = .25  -- Seconds
local TINT_COLOR = Color3.fromRGB(200, 45, 45)
 
-- Create a "TweenInfo" used for the duration of both the blur and color effects
local deathEffectInfo = TweenInfo.new(
	EFFECT_DURATION,
	Enum.EasingStyle.Linear,
	Enum.EasingDirection.Out,
	0,
	false,
	EFFECT_DELAY)
 
-- Create tweens using specific goals for blur and color
local tweenColorGoal = {
	TintColor = TINT_COLOR
	-- Other properties to customize based off the "ColorCorrectionEffect" instance
}
local tweenColor = TweenService:Create(colorCorrectionEffect, deathEffectInfo, tweenColorGoal)
local tweenFocus = TweenService:Create(depthOfFieldEffect, deathEffectInfo, {FarIntensity = 1})
local tweenFocus2 = TweenService:Create(depthOfFieldEffect, deathEffectInfo, {NearIntensity = 1})
local tweenFocus3 = TweenService:Create(depthOfFieldEffect, deathEffectInfo, {FocusDistance = 5})
local tweenFocus35 = TweenService:Create(depthOfFieldEffect, deathEffectInfo, {InFocusRadius = 10})
local tweenBloom = TweenService:Create(bloomEffect, deathEffectInfo, {Intensity = 0.5})
local tweenBloom2 = TweenService:Create(bloomEffect, deathEffectInfo, {Size = 50})
local tweenBloom3 = TweenService:Create(bloomEffect, deathEffectInfo, {Threshold = .8})
local tweenColor2 = TweenService:Create(colorCorrectionEffect, deathEffectInfo, {Enabled = false})
local tweenFocus2 = TweenService:Create(depthOfFieldEffect, deathEffectInfo, {FarIntensity = 0})
local tweenFocus22 = TweenService:Create(depthOfFieldEffect, deathEffectInfo, {NearIntensity = 0})
local tweenFocus32 = TweenService:Create(depthOfFieldEffect, deathEffectInfo, {FocusDistance = 0})
local tweenFocus352 = TweenService:Create(depthOfFieldEffect, deathEffectInfo, {InFocusRadius = 0})
local tweenBloom2 = TweenService:Create(bloomEffect, deathEffectInfo, {Intensity = 0})
local tweenBloom22 = TweenService:Create(bloomEffect, deathEffectInfo, {Size = 0})
local tweenBloom32 = TweenService:Create(bloomEffect, deathEffectInfo, {Threshold = 0})
local function playDeathTween()
	colorCorrectionEffect.Enabled = true
	depthOfFieldEffect.Enabled = true
	bloomEffect.Enabled = true
	tweenColor:Play()
	tweenFocus:Play()
	tweenFocus2:Play()
	tweenFocus3:Play()
	tweenFocus35:Play()
	tweenBloom:Play()
	tweenBloom2:Play()
	tweenBloom3:Play()
end
local function setupDeathTween()
 tweenColor2:Play()
	tweenFocus2:Play()
	tweenFocus22:Play()
	tweenFocus32:Play()
	tweenFocus352:Play()
	tweenBloom2:Play()
	tweenBloom22:Play()
	tweenBloom32:Play()
wait(.25)
	depthOfFieldEffect.Enabled = false
	colorCorrectionEffect.Enabled = false
	bloomEffect.Enabled = false
	colorCorrectionEffect.TintColor = Color3.fromRGB(255, 255, 255)
 	end
local ga = false
local oldcf = nil
local con = nil
local db = false
m.KeyDown:Connect(function(k)
if k == 'e' and attackmode == false then
attackmode = true
animtr:Play()
animtr:AdjustSpeed(0)
con = owner.Character.HumanoidRootPart.Touched:Connect(function(hit)
if hit and hit:IsDescendantOf(owner.Character) == false and hit:FindFirstAncestorOfClass("Model") and hit:FindFirstAncestorOfClass("Model"):FindFirstChildOfClass("Humanoid") and hit:FindFirstAncestorOfClass("Model"):FindFirstChildOfClass("Humanoid").Health ~= 0 and db == false then
db = true
animtr2:Play()
animtr2:AdjustWeight(10)
animtr2:AdjustSpeed(5)
coroutine.wrap(function()
wait(1)
db = false
end)()
end
end)
re2:FireServer('e' , m.Hit.p)
coroutine.wrap(function()
playDeathTween()
end)()
elseif k == 'e' and attackmode == true then
attackmode = false
animtr:Stop()
if con then con:Disconnect() end
re2:FireServer('q' , m.Hit.p)
coroutine.wrap(function()
setupDeathTween()
end)()
elseif k == 'f' and flying == true then
flying = false
re2:FireServer('f' , m.Hit.p)
elseif k == 'f' and flying == false then
flying = true
re2:FireServer('g')
elseif k == 'x' and flying == false then
re2:FireServer('x' , m.Hit.p)
end
end)
local function getNextMovement(deltaTime)
	local nextMove = Vector3.new()
	if userInput:IsKeyDown("A") or userInput:IsKeyDown("Left") then
		nextMove = Vector3.new(-1,0,0)
	elseif userInput:IsKeyDown("D") or userInput:IsKeyDown("Right") then
		nextMove = Vector3.new(1,0,0)
	end
	if userInput:IsKeyDown("W") or userInput:IsKeyDown("Up") then
		nextMove = nextMove + Vector3.new(0,0,-1)
	elseif userInput:IsKeyDown("S") or userInput:IsKeyDown("Down") then
		nextMove = nextMove + Vector3.new(0,0,1)
	end
	if userInput:IsKeyDown("Space") then
		nextMove = nextMove + Vector3.new(0,1,0)
	elseif userInput:IsKeyDown("LeftControl") then
		nextMove = nextMove + Vector3.new(0,-1,0)
	end
	return CFrame.new(nextMove * (speed * deltaTime) )
end


	local char = player.Character
		local root = char:WaitForChild("HumanoidRootPart")

		lastUpdate = tick()
		
	rs.Heartbeat:Connect(function(delta)
		pcall(function()
			if flying == true then
			local look = (c.Focus.p-c.CFrame.p).Unit
			local move = getNextMovement(delta)
			local pos = root.Position
			root.Velocity = Vector3.new()
			re:FireServer(root.Position, look, move)
			lastUpdate = tick()
		end
		end)
		end)
while wait() do
pcall(function()
for i,v  in pairs(owner.Character.Humanoid:GetPlayingAnimationTracks()) do
coroutine.wrap(function()
pcall(function()
if v ~= animtr and v ~= animtr2 and attackmode == false then
v:AdjustSpeed(.3)
elseif v ~= animtr and v ~= animtr2 and attackmode == true then
v:AdjustSpeed(1.7)
end
end)
end)()
end
end)
end
]], owner.Character)
owner.Character.Head.face:Destroy()
local oldc0 = owner.Character.Torso.Neck.C0
coroutine.wrap(function()
while true do 
task.wait()
owner.Character.Humanoid.DisplayName = getRandomString(math.random(1,15), true)
end
end)()
local snap2 = Instance.new("Sound" , owner.Character.Head)
snap2.SoundId = 'rbxassetid://198606040'
while task.wait(math.random(5, 8)) do
owner.Character.Torso.Neck.C0 = oldc0 * CFrame.Angles(math.rad(math.random(-80,80)),math.rad(math.random(-80,80)),math.rad(math.random(-80,80)))
snap2:Play()
wait(.1)
snap2:Stop()
owner.Character.Torso.Neck.C0 = oldc0
end
