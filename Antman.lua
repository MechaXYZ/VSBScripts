-- [[ SETUP ]] --

warn([[antman script by mecha
    i recommend using r6
    z - shrink
    x - grow]])
local currentsize = owner.Character.Head.Size.Y
local tw = game:GetService("TweenService")
local re = Instance.new("RemoteEvent", owner.PlayerGui)
    re.Name = "SizeEvent"
local delay = Instance.new("NumberValue", re)
    delay.Name = "Delay"
    delay.Value = 1
local sd = Instance.new("NumberValue", re)
    sd.Name = "Shrink"
    sd.Value = 2
local gd = Instance.new("NumberValue", re)
    gd.Name = "Grow"
    gd.Value = 2
local morph = Instance.new("Sound", game:GetService("VRService"))
    morph.SoundId = "rbxassetid://130113415"
    morph.Volume = .5
    morph.PlayOnRemove = true
    morph.EmitterSize = 8
local function size(scl, d)
    local Percent = scl / currentsize
    local Player = owner    
    local Humanoid = Player.Character:FindFirstChildOfClass("Humanoid")
    for i, v in pairs(Player.Character:GetDescendants()) do
        if v:IsA("JointInstance") then
            tw:Create(v, TweenInfo.new(d), {
                C0 = CFrame.new((v.C0.Position * Percent)) * (v.C0 - v.C0.Position),
                C1 = CFrame.new((v.C1.Position * Percent)) * (v.C1 - v.C1.Position)
            }):Play()
		elseif v:IsA("SpecialMesh") and (v.Parent.Name ~= "Head" or v.MeshType == Enum.MeshType.FileMesh) then
			tw:Create(v, TweenInfo.new(d), {Scale = v.Scale * Percent}):Play()
 		elseif v:IsA("BasePart") then
            tw:Create(v, TweenInfo.new(d), {Size = v.Size * Percent}):Play() 
        end
    end
end
re.OnServerEvent:Connect(function(plr, what, type)
    morph.Parent = owner.Character.Head
    morph.Parent = nil
    local hum = owner.Character:FindFirstChildOfClass("Humanoid")
    if what == "shrink" then
        if type == Enum.HumanoidRigType.R6 then
            size(currentsize / (sd.Value), delay.Value)
        elseif type == Enum.HumanoidRigType.R15 then
            tw:Create(hum.BodyWidthScale, TweenInfo.new(delay.Value), {Value = currentsize / (sd.Value)}):Play()
            tw:Create(hum.BodyHeightScale, TweenInfo.new(delay.Value), {Value = currentsize / (sd.Value)}):Play()
            tw:Create(hum.BodyDepthScale, TweenInfo.new(delay.Value), {Value = currentsize / (sd.Value)}):Play()
            tw:Create(hum.HeadScale, TweenInfo.new(delay.Value), {Value = currentsize / (sd.Value)}):Play()
        end
        local jp = hum.JumpPower
        -- tw:Create(hum, TweenInfo.new(delay.Value), {JumpPower = jp / (sd.Value / 2)}):Play()
    elseif what == "grow" then
        if type == Enum.HumanoidRigType.R6 then
            size(currentsize * (gd.Value), delay.Value)
        elseif type == Enum.HumanoidRigType.R15 then
            tw:Create(hum.BodyWidthScale, TweenInfo.new(delay.Value), {Value = currentsize * (gd.Value)}):Play()
            tw:Create(hum.BodyHeightScale, TweenInfo.new(delay.Value), {Value = currentsize * (gd.Value)}):Play()
            tw:Create(hum.BodyDepthScale, TweenInfo.new(delay.Value), {Value = currentsize * (gd.Value)}):Play()
            tw:Create(hum.HeadScale, TweenInfo.new(delay.Value), {Value = currentsize * (gd.Value)}):Play()
        end
        local jp = hum.JumpPower
        -- tw:Create(hum, TweenInfo.new(delay.Value), {JumpPower = jp * (gd.Value / 2.5)}):Play()
    end
end)

-- [[ LOCALSCRIPT ]] --
NLS([[
    -- SETUP --
    local re = script.Parent
    local delay = re.Delay.Value
    local sd = re.Shrink.Value
    local gd = re.Grow.Value
    local tw = game:GetService("TweenService")
    local cam = workspace.CurrentCamera
    local currentfov = cam.FieldOfView
    local m = owner:GetMouse()
    local db = false
    m.KeyDown:Connect(function(k)
        if k == 'z' and db == false then
            db = true
            local tween = tw:Create(cam, TweenInfo.new(delay), {FieldOfView = currentfov / sd})
            local tween2
            if owner.Character.Head.Size.Y > 1 then
                tween2 = tw:Create(owner.Character.Humanoid, TweenInfo.new(delay), {CameraOffset = owner.Character.Humanoid.CameraOffset + Vector3.new(0, -((currentfov / 70) * (sd / 2)), 0)})
            else
                tween2 = tw:Create(owner.Character.Humanoid, TweenInfo.new(delay), {CameraOffset = owner.Character.Humanoid.CameraOffset + Vector3.new(0, -(((currentfov / 70) / sd) * (owner.Character.Head.Size.Y * sd)), 0)})
            end
            re:FireServer("shrink", owner.Character.Humanoid.RigType)
            tween:Play()
            tween2:Play()
            tween.Completed:Wait()
            -- if (currentfov / sd) < 1 or (currentfov / sd) > 120 then
                currentfov = currentfov / sd
            -- else
                -- currentfov = cam.FieldOfView
            -- end
            task.wait(.05)
            db = false
        elseif k == 'x' and db == false then
            db = true
            local tween = tw:Create(cam, TweenInfo.new(delay), {FieldOfView = currentfov * gd})
            local tween2 = tw:Create(owner.Character.Humanoid, TweenInfo.new(delay), {CameraOffset = owner.Character.Humanoid.CameraOffset + Vector3.new(0, ((currentfov / 70) * gd), 0)})
            re:FireServer("grow", owner.Character.Humanoid.RigType)
            tween:Play()
            tween2:Play()
            tween.Completed:Wait()
            -- if (currentfov * gd) > 120 or (currentfov * gd) < 1 then
                currentfov = currentfov * gd
            -- else
                -- currentfov = cam.FieldOfView
            -- end
            task.wait(.05)
            db = false
        end
    end)
]], re)

-- [[ CURRENT SIZE LOOP ]] --
coroutine.wrap(function()
    while task.wait() do
        pcall(function()
            currentsize = owner.Character.Head.Size.Y
        end)
    end
end)()
