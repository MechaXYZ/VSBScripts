local div = 10
local norm = CFrame.new(2, -.35, 0) * CFrame.Angles(0, math.rad(90), 0)
local cd = CFrame.new(2, -.35, 0) * CFrame.Angles(0, math.rad(90), 0) * CFrame.Angles(math.rad(-15), 0, 0)
local pg = Instance.new("Tool", owner.Backpack)
pg.Name = "Plasma Rifle / Gun"
pg.TextureId = 'rbxassetid://9466582763'
pg.Grip = norm
local h = Instance.new("SpawnLocation", pg)
h.Name = "Handle"
h.Enabled = false
h.Size = Vector3.new(50, 14.815, 7.407) / div
local msh = Instance.new("SpecialMesh", h)
msh.MeshId = 'rbxassetid://9399413808'
msh.TextureId = 'rbxassetid://9399413886'
msh.Scale = Vector3.new(1, 1, 1) / div
local fire = Instance.new("Sound", h)
fire.SoundId = 'rbxassetid://624611843'
fire.Volume = .75
fire.EmitterSize = 10
local exp = Instance.new("Sound", game:GetService("VRService"))
exp.SoundId = 'rbxassetid://7034869369'
exp.Volume = .75
exp.EmitterSize = 10
exp.PlayOnRemove = true
local canfire = true
local firing = false
pg.Activated:Connect(function()
	if canfire then
		firing = true
	end
end)
pg.Deactivated:Connect(function()
	firing = false
	canfire = false
	pg.Grip = cd
	task.wait(.57142857142)
	pg.Grip = norm
	canfire = true
end)
pg.Unequipped:Connect(function()
	firing = false
end)
local tw = game:GetService("TweenService")
local mult = 5
local function spread(mn, mx)
	local r = math.random
	local a = math.rad
	return CFrame.Angles(a(r(mn, mx)), a(r(mn, mx)), a(r(mn, mx)))
end
local function HasHumanoid(p)
    if p:FindFirstAncestorOfClass("Model", true) and p:FindFirstAncestorOfClass("Model", true):FindFirstChildOfClass("Humanoid") then
        return p:FindFirstAncestorOfClass("Model", true):FindFirstChildOfClass("Humanoid")
    else
        return false
    end
end
local function check(pls)
	local hums = {}
	while task.wait() do
		for _, hit in pairs(workspace:GetPartBoundsInBox(pls.CFrame, pls.Size * 1.05)) do
			local hum = HasHumanoid(hit)
			if hum and not table.find(hums, hum) then
				table.insert(hums, hum)
				hum.Health -= math.random(5, 10)
			end
		end
	end
end
local function explode(pls)
	exp.Parent = pls exp.Parent = nil
	pls.Anchored = true
	local inner = pls:FindFirstChild("Inner")
	game:GetService("TweenService"):Create(pls, TweenInfo.new(.5), {Size = pls.Size * mult, Transparency = 1}):Play()
	game:GetService("TweenService"):Create(inner, TweenInfo.new(.5), {Size = inner.Size * mult, Transparency = 1}):Play()
	coroutine.wrap(function()
		check(pls)
	end)()
	task.wait(.5)
	pls:Destroy()
end
local angles = CFrame.new(-2.65, .15, 0) * CFrame.Angles(0, (math.rad(90)), 0)
local function shoot()
 	local pls = Instance.new("SpawnLocation", script)
	pls.Enabled = false
	pls.Name = "Plasma Ball"
	pls.Size = Vector3.new(.85, .85, .85)
	pls.CFrame = h.CFrame * angles
	pls.CanCollide = false
	pls.Shape = "Ball"
	pls.Material = "Neon"
	pls.Transparency = .15
	pls.Color = Color3.fromRGB(52, 52, 252)
	-- pls.Transparency = 1
	local inner = Instance.new("SpawnLocation", pls)
	inner.Enabled = false
	inner.Size = pls.Size * .75
	inner.CanCollide = false
	inner.Shape = "Ball"
	inner.Name = "Inner"
	inner.CanTouch = false
	inner.Material = "Neon"
	-- inner.Transparency = .15
	inner.Color = Color3.fromRGB(196, 196, 252)
	local w = Instance.new("Weld", pls)
	w.Part0 = inner
	w.Part1 = pls
	local gothit = false
	pls.Touched:Connect(function(hit)
		if gothit then return end
		if hit:IsDescendantOf(script) == false and hit:IsDescendantOf(owner.Character) == false and hit ~= h then
			gothit = true
			explode(pls)
		end
	end)
	local bv = Instance.new("BodyVelocity", pls)
	bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
	bv.Velocity = (pls.CFrame * spread(-5, 5)).lookVector * 192.4
	game:GetService("Debris"):AddItem(pls, 5)
	--[[
 	commenting this out because tusk is absolute trash
	local bbg = Instance.new("BillboardGui", pls)
	bbg.Adornee = pls
	bbg.Size = UDim2.new(1, 0, 1, 0)
	local img = Instance.new("ImageLabel", bbg)
	img.Image = 'rbxassetid://9467981934'
	img.BackgroundTransparency = 1
	img.AnchorPoint = Vector2.new(.5, .5)
	img.Position = UDim2.new(1, 0, 1, 0)
	img.Size = UDim2.new(2, 0, 2, 0)
	]]--
end
local rate = .01
local rpm = 1/12
coroutine.wrap(function()
	while task.wait(rpm) do
		if firing == true then
			fire:Play()
		end
	end
end)()
coroutine.wrap(function()
	while task.wait(rate) do
		if firing == true then
			shoot()
		end
	end
end)()
