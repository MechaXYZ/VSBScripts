-- [[ SETUP ]] --

local plr = owner
local mode = "Shrink"
local multiplier = .5

-- [[ INSTANCES ]] -- 

local ray = Instance.new("Tool", owner.Backpack)
    ray.Name = "Size Ray"
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

local function size(m, scl, d)
    for i, v in pairs(m:GetDescendants()) do
        if v:IsA("JointInstance") then
            game:GetService("TweenService"):Create(v, TweenInfo.new(d), {C0 = CFrame.new((v.C0.Position * scl)) * (v.C0 - v.C0.Position)}):Play()
            game:GetService("TweenService"):Create(v, TweenInfo.new(d), {C1 = CFrame.new((v.C1.Position * scl)) * (v.C1 - v.C1.Position)}):Play()
        elseif v:IsA("SpecialMesh") and v.Parent.Name ~= "Head" and v.MeshType == "FileMesh" then
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
    local a = Instance.new("SpawnLocation", script)
    a.Enabled = false
    a.Material = "Neon"
    a.Color = txt.TextColor3
    a.Size = Vector3.new(.5, .5, .75)
    a.CanCollide = false
    a.CFrame = h.CFrame
    local bv = Instance.new("BodyVelocity", a)
    bv.MaxForce = Vector3.new(1, 1, 1) * math.huge
    bv.Velocity = plr.Character.HumanoidRootPart.CFrame.lookVector * 125
    a.Touched:Connect(function(hit)
        local m = hit:FindFirstAncestorOfClass("Model")
        if m and not m:FindFirstChildOfClass("Humanoid") then
            a:Destroy()
            size(m, multiplier, .5)
            multi.SoundId = "rbxassetid://130113415"
            multi.Parent = plr.Character.Head
            multi.Parent = nil
        end
    end)
end)
