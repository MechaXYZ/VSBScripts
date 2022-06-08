-- [[ SETUP ]] --

warn([[size raygun by mecha
f - switch modes.]])
local plr = owner
local mode = "Shrink"
local multiplier = .5

-- [[ INSTANCES ]] -- 

local ray = Instance.new("Tool", owner.Backpack)
    ray.Name = "Size Raygun"
    ray.ToolTip = "F to switch modes."
    ray.Grip = CFrame.new(0, -.5, 1.25)
local h = Instance.new("SpawnLocation", ray)
    h.Enabled = false
    h.Massless = true
    h.Name = "Handle"
    h.CanCollide = false
    h.Size = Vector3.new(.85, .85, 3)
    h.Material = "SmoothPlastic"
    h.BrickColor = BrickColor.new("Dark stone grey")
local a0 = Instance.new("Attachment", h)
	a0.Position = Vector3.new(0, 0, -1.5)
local b0 = Instance.new("Attachment", h)
	b0.Position = Vector3.new(-.415, 0, 1.5)
local b1 = Instance.new("Attachment", h)
	b1.Position = Vector3.new(.415, 0, 1.5)
local trail = Instance.new("Trail",script)
    trail.Color = ColorSequence.new(h.Color)
	trail.Transparency = NumberSequence.new(0, 1)
	trail.MinLength = .02
	trail.Lifetime = .3
	trail.FaceCamera = true
	trail.Attachment0 = b0
	trail.Attachment1 = b1
    trail.WidthScale = NumberSequence.new(1, 0)
local beam = Instance.new("Beam", script)
	beam.Attachment0 = a0
    beam.FaceCamera = true
    beam.Width0 = .5
    beam.Width1 = .5

local gui = Instance.new("SurfaceGui", h)
    gui.Name = "TextGUI"
    gui.Face = "Right"
    gui.Brightness = 25
    gui.CanvasSize = Vector2.new(300, 85)
local txt = Instance.new("TextBox" , gui)
    txt.Font = 'Fantasy'
    txt.Text = "Shrink"
    txt.TextScaled = true
    txt.AnchorPoint = Vector2.new(.5, .5)
    txt.Position = UDim2.new(.5, 0, .5, 0)
    txt.Size = UDim2.new(0, 150, 0, 42.5)
    txt.TextStrokeTransparency = 0
    txt.BackgroundColor3 = Color3.new()
    txt.TextStrokeColor3 = Color3.new()
    txt.TextColor3 = Color3.fromRGB(255, 0, 0)
    txt.BorderSizePixel = 1.5
    txt.BorderColor3 = txt.TextColor3
    txt.MultiLine = true

local multi = Instance.new("Sound", game:GetService("VRService"))
    multi.Volume = .5
    multi.PlayOnRemove = true
    multi.EmitterSize = 8
local switchprompt = Instance.new("ProximityPrompt", h)
    switchprompt.Enabled = true
    switchprompt.MaxActivationDistance = 10000
    switchprompt.Style = "Custom"
    switchprompt.ClickablePrompt = false
    switchprompt.RequiresLineOfSight = false
    switchprompt.HoldDuration = 0
    switchprompt.KeyboardKeyCode = Enum.KeyCode.F

-- [[ FUNCTIONS AND EVENTS ]] -- 

local function set(m, c, mult)
    multi.SoundId = "rbxassetid://12221990"
    multi.Parent = plr.Character.Head
    multi.Parent = nil
    mode = m
    multiplier = mult
    txt.Text = mode
    txt.TextColor3 = c
    txt.BorderSizePixel = 1.5
    txt.BorderColor3 = txt.TextColor3
end

local function cp(part, propTable)
	if not part:IsA("BasePart")then
		error("1st argument must be a BasePart")
	end
	if type(propTable) ~= "table" then
		error("2nd argument must be a table")
	end
	
	if not part.CustomPhysicalProperties then
		part.CustomPhysicalProperties = PhysicalProperties.new(part.Material) -- uses the material's physical properties as a basis for the part
	end
	local orig = part.CustomPhysicalProperties
	
	local density = propTable.Density or orig.Density
	local friction = propTable.Friction or orig.Friction
	local elasticity = propTable.Elasticity or orig.Elasticity
	local frictionWeight = propTable.FrictionWeight or orig.FrictionWeight
	local elasticityWeight = propTable.ElasticityWeight or orig.ElasticityWeight
	
	part.CustomPhysicalProperties = PhysicalProperties.new(density, friction, elasticity, frictionWeight, elasticityWeight)
end

-- size for entire models, but not humanoids
local function size(m, scl, d)
    for i, v in pairs(m:GetDescendants()) do
        if v:IsA("JointInstance") then
            game:GetService("TweenService"):Create(v, TweenInfo.new(d), {C0 = CFrame.new((v.C0.Position * scl)) * (v.C0 - v.C0.Position)}):Play()
            game:GetService("TweenService"):Create(v, TweenInfo.new(d), {C1 = CFrame.new((v.C1.Position * scl)) * (v.C1 - v.C1.Position)}):Play()
        elseif v:IsA("SpecialMesh") and v.Parent.Name ~= "Head" and v.MeshType == Enum.MeshType.FileMesh then
            game:GetService("TweenService"):Create(v, TweenInfo.new(d), {Scale = v.Scale * scl}):Play()
        elseif v:IsA("BasePart") then
            local anchor = v.Anchored
            v.Anchored = true
            game:GetService("TweenService"):Create(v, TweenInfo.new(d), {Size = v.Size * scl}):Play()
            game:GetService("TweenService"):Create(v, TweenInfo.new(d), {CFrame = CFrame.new(v.CFrame.X * scl, v.CFrame.Y * scl, v.CFrame.Z * scl) * CFrame.Angles(v.CFrame:ToEulerAnglesXYZ())}):Play()
            v.Anchored = anchor
        end
    end
end

-- size for humanoids + individual parts
local function size2(m, scl, d)
    if m:IsA("BasePart") then
        game:GetService("TweenService"):Create(m, TweenInfo.new(d), {Size = m.Size * scl}):Play()
        game:GetService("TweenService"):Create(m, TweenInfo.new(d), {CFrame = CFrame.new(m.CFrame.X * scl, m.CFrame.Y * scl, m.CFrame.Z * scl) * CFrame.Angles(m.CFrame:ToEulerAnglesXYZ())}):Play()
    end
    for i, v in pairs(m:GetDescendants()) do
        if v:IsA("JointInstance") then
            game:GetService("TweenService"):Create(v, TweenInfo.new(d), {C0 = CFrame.new((v.C0.Position * scl)) * (v.C0 - v.C0.Position)}):Play()
            game:GetService("TweenService"):Create(v, TweenInfo.new(d), {C1 = CFrame.new((v.C1.Position * scl)) * (v.C1 - v.C1.Position)}):Play()
        elseif v:IsA("SpecialMesh") and (v.Parent.Name ~= "Head" or v.MeshType == Enum.MeshType.FileMesh) then
            game:GetService("TweenService"):Create(v, TweenInfo.new(d), {Scale = v.Scale * scl}):Play()
        elseif v:IsA("BasePart") then
            game:GetService("TweenService"):Create(v, TweenInfo.new(d), {Size = v.Size * scl}):Play()
            local props = {Friction = v.Friction * scl}
            cp(v, props)
        end
    end
end

function shoot(cf, bc, b)
	local p = Instance.new("SpawnLocation", script)
    p.Enabled = false
	p.Name = "Laser"
	p.Anchored = true
	p.Size = Vector3.new(.5, .5, 10)
	p.Material = Enum.Material.Neon
	p.CFrame = cf
	local at = Instance.new("Attachment", p)
	at.Position = Vector3.new(0, 0, 5)
	local a0 = Instance.new("Attachment", p)
	a0.Position = Vector3.new(-.25, 0, 5)
	local a1 = Instance.new("Attachment", p)
	a1.Position = Vector3.new(.25, 0, 5)
	local trl = Instance.new("Trail", script)
	trl.Color = ColorSequence.new(bc)
	trl.Transparency = NumberSequence.new(0, 1)
	trl.MinLength = .02
	trl.Lifetime = .6
	trl.FaceCamera = true
	trl.Attachment0 = a0
	trl.Attachment1 = a1
	if b then
		b.Color = ColorSequence.new(bc)
		b.Attachment1 = at
		task.delay(.12, function()
			if b then
				b.Attachment1 = nil
			end
		end)
	end
	task.delay(10, function()
		if trl and trl.Parent then
			trl:Destroy()
		end
	end)
	p.Color = bc
	p.Velocity = p.CFrame.lookVector * 80
    return p
end
switchprompt.Triggered:Connect(function(p)
    if p == plr then
        if mode == "Shrink" then
            set("Grow", Color3.fromRGB(0, 255, 0), 2)
        elseif mode == "Grow" then
            set("Shrink", Color3.fromRGB(255, 0, 0), .5)
        end
    end
end)

ray.Equipped:Connect(function()
    plr = game:GetService("Players"):GetPlayerFromCharacter(ray.Parent)
    -- print(plr)
end)

ray.Activated:Connect(function()
    multi.SoundId = "rbxassetid://130113322"
    multi.Parent = plr.Character.Head
    multi.Parent = nil
    local a = shoot(h.CFrame, txt.TextColor3, beam)
    local gothit = false
    for i = 1, 128 do
        if gothit == true then
            break
        end
        -- task.wait(.1)
        if a and a.Parent then
            for i = 1, 40 do
                a.CFrame = a.CFrame * CFrame.new(0, 0, -2)
                for _, hit in pairs(workspace:GetPartBoundsInBox(a.CFrame, a.Size * 1.05)) do
                    local m = hit:FindFirstAncestorOfClass("Model")
                    repeat
                        m = m:FindFirstAncestorOfClass("Model")
                    until m:FindFirstAncestorOfClass("Model") == nil
                    if (m and not m:FindFirstChildOfClass("Humanoid")) then
                        task.wait(.025)
                        gothit = true
                        a:Destroy()
                        size(m, multiplier, 1)
                        multi.SoundId = "rbxassetid://130113415"
                        multi.Parent = plr.Character.Head
                        multi.Parent = nil
                        gothit = true
                        break
                    elseif (m and m:FindFirstChildOfClass("Humanoid") and m ~= plr.Character) or (not m and hit ~= a and hit ~= h and (hit.Name ~= "Base" and hit.Parent ~= script)) then
                        task.wait(.025)
                        gothit = true
                        a:Destroy()
                        if m then
                            size2(m, multiplier, 1)
                        else
                            size2(hit, multiplier, 1)
                            -- print(hit)
                        end
                        multi.SoundId = "rbxassetid://130113415"
                        multi.Parent = plr.Character.Head
                        multi.Parent = nil
                        gothit = true
                        break
                    end
                    if gothit == true then
                        break
                    end
                end
                if gothit == true then
                    break
                end
            end
            if gothit == true then
                break
            end
            task.wait(.025)
        end
    end
end)
