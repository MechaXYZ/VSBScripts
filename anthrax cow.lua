local cow = Instance.new("Tool", owner.Backpack)
	cow.Name = "diseased cow head"
	cow.ToolTip = "includes anthrax"
	cow.Grip = CFrame.new(1, 0, .15) * CFrame.Angles(0, math.rad(35), 0)
local h = Instance.new("SpawnLocation", cow)
	h.Name = "Handle"
	h.Size = Vector3.new(22.169, 11.667, 19.253) / 9
	h.Enabled = false
local msh = Instance.new("SpecialMesh", h)
	msh.MeshId = 'rbxassetid://9368998314'
	msh.TextureId = 'rbxassetid://9368998411'
	msh.Scale = Vector3.new(1, 1, 1) / 9

local rs = owner.Character.Torso["Right Shoulder"]
local ls = owner.Character.Torso["Left Shoulder"]
local rs1 = rs.C0 * CFrame.new(0, 0, 0, 0.342, -0.883, 0.321, 0.94, 0.321, -0.117, 0, 0.342, 0.94)
local ls1 = ls.C0 * CFrame.new(0, 0, 0, 0.342, 0.883, -0.321, -0.94, 0.321, -0.117, 0, 0.342, 0.94)

local w1 = Instance.new("Weld", owner.Character)
	w1.Part0 = owner.Character.Torso
	w1.Part1 = owner.Character["Right Arm"]
	w1.C0 = rs.C0
	w1.C1 = rs.C1
    w1.Enabled = false
local w2 = Instance.new("Weld", owner.Character)
	w2.Part0 = owner.Character.Torso
	w2.Part1 = owner.Character["Left Arm"]
	w2.C0 = ls.C0
	w2.C1 = ls.C1
    w2.Enabled = false

local smoke = Instance.new("Sound", game:GetService("VRService"))
	smoke.SoundId = 'rbxassetid://4962360929'
	smoke.Volume = 1.5
	smoke.PlayOnRemove = true
    smoke.EmitterSize = 10
local moo = Instance.new("Sound", game:GetService("VRService"))
	moo.SoundId = 'rbxassetid://688110369'
	moo.Volume = 1.5
	moo.PlayOnRemove = true
    moo.EmitterSize = 10
    local equip = Instance.new("Sound", game:GetService("VRService"))
	equip.SoundId = 'rbxassetid://769464514'
	equip.Volume = 1.5
	equip.PlayOnRemove = true
    equip.EmitterSize = 10
local allpurpose = Instance.new("Sound", game:GetService("VRService"))
    allpurpose.SoundId = 'rbxassetid://8105751144'
    allpurpose.Volume = 1.75
    allpurpose.PlayOnRemove = true
    allpurpose.EmitterSize = 10

local pe = Instance.new("ParticleEmitter")
	pe.Speed = NumberRange.new(8, 8)
	-- pe.Texture = 'rbxassetid://249338959'
    pe.Drag = 1
	pe.Color = ColorSequence.new(Color3.new(1, 1, 0))
    pe.Lifetime = NumberRange.new(1, 2)
    pe.Rate = 5000
    pe.SpreadAngle = Vector2.new(-65, 65)
    pe.VelocitySpread = 180
    -- pe.Parent = nil

local function ps(p, s)
	s.Parent = p
	s.Parent = nil
end

local function hashum(p)
	if p:FindFirstAncestorOfClass("Model", true) and p:FindFirstAncestorOfClass("Model", true):FindFirstChildOfClass("Humanoid") then
		return p:FindFirstAncestorOfClass("Model", true):FindFirstChildOfClass("Humanoid")
	else
		return false
	end
end

local function check(cf, size)
	for _, v in pairs(workspace:GetPartBoundsInBox(cf, size)) do
		if hashum(v) then
            local hum = hashum(v)
			hum.Health -= .25
            hum.WalkSpeed -= .5
		end
	end
end

local db = false

local function mist(head)
	ps(head, moo)
	ps(head, smoke)
	task.wait(.5)
	pe.Parent = head
	local misted = true
	coroutine.wrap(function()
		while misted == true and task.wait(.05) do
			pe.Parent = head
			pe:Emit(5)
			check(head.CFrame * CFrame.new(0, 3.25, 0), Vector3.new(10, 6.5, 10))
		end
	end)()
	task.wait(12)
	misted = false
	task.wait(3)
	pe.Parent = nil
	head:Destroy()
    h.Transparency = 0
	task.wait(1)
	db = false
end

owner.Character.ChildAdded:Connect(function(t)
    if t == cow then
        w1.Enabled = true
        w2.Enabled = true
        equip.SoundId = 'rbxassetid://769464514'
        allpurpose.SoundId = 'rbxassetid://5811965308'
        ps(h, equip)
        ps(h, allpurpose)
        game:GetService("TweenService"):Create(w1, TweenInfo.new(.5), {C0 = rs1}):Play()
        game:GetService("TweenService"):Create(w2, TweenInfo.new(.5), {C0 = ls1}):Play()
    end
end)

cow.Unequipped:Connect(function()
    equip.SoundId = 'rbxassetid://8169233194'
    ps(h, equip)
    game:GetService("TweenService"):Create(w1, TweenInfo.new(.5), {C0 = rs.C0}):Play()
    game:GetService("TweenService"):Create(w2, TweenInfo.new(.5), {C0 = ls.C0}):Play()
    task.wait(.5)
    w1.Enabled = false
    w2.Enabled = false
end)

local throwsounds = {8105751144, 8105752093, 8105753417}

cow.Activated:Connect(function()
	if db == false then
		db = true
        allpurpose.SoundId = 'rbxassetid://' ..throwsounds[math.random(1, #throwsounds)]
        ps(h, allpurpose)
		local new = h:Clone()
		new.Parent = script
		new.CFrame = h.CFrame * CFrame.new(0, 0, -1)
		new.CanCollide = true
        new.Velocity = (cow.Parent.HumanoidRootPart.CFrame.lookVector * 35) + Vector3.new(0, 40, 0)
        h.Transparency = 1
		task.wait(1.5)
		mist(new)
	end
end)
