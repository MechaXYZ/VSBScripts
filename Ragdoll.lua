local Instancea = {} 
Instancea._index = Instancea 
function Instancea.new(name, parent) 
if name == "Part" then 
local e = Instance.new("SpawnLocation", parent) 
e.Enabled =  false
e.CanCollide = true
return e 
elseif name == "Decal" then 
local e = Instance.new("Texture", parent) 
e.StudsPerTileU = 100 
e.StudsPerTileV = 100
return e 
else 
local a = Instance.new(name, parent) 
return a 
end
end 
local Instance = Instancea
            local limbcollider = Instance.new("Part", owner.Character:findFirstChild("Right Arm"))
                limbcollider.Size = Vector3.new(1.4,1,1)
                limbcollider.Transparency = 1
                limbcollider.Name = "LimbCollider"
                local limbcolliderweld = Instance.new("Weld", limbcollider)
                limbcolliderweld.Part0 = owner.Character:findFirstChild("Right Arm")
                limbcolliderweld.Part1 = limbcollider
                limbcolliderweld.C0 = CFrame.fromEulerAnglesXYZ(0,0,math.pi/2) * CFrame.new(-0.3,0,0)
            local limbcollider2 = Instance.new("Part", owner.Character:findFirstChild("Left Arm"))
                limbcollider2.Size = Vector3.new(1.4,1,1)
                limbcollider2.Transparency = 1
                limbcollider2.Name = "LimbCollider"
                local limbcolliderweld2 = Instance.new("Weld", limbcollider2)
                limbcolliderweld2.Part0 = owner.Character:findFirstChild("Left Arm")
                limbcolliderweld2.Part1 = limbcollider2
                limbcolliderweld2.C0 = CFrame.fromEulerAnglesXYZ(0,0,math.pi/2) * CFrame.new(-0.3,0,0)
            local limbcollider3 = Instance.new("Part", owner.Character.Head)
                limbcollider3.Size = Vector3.new(0.5,0.5,0.5)
                limbcollider3.Shape = "Ball"
                limbcollider3.Transparency = 1
                limbcollider3.Name = "LimbCollider"
                local limbcolliderweld = Instance.new("Weld", limbcollider3)
                limbcolliderweld.Part0 = owner.Character.Head
                limbcolliderweld.Part1 = limbcollider3
                limbcolliderweld.C0 = CFrame.fromEulerAnglesXYZ(0,0,math.pi/2) * CFrame.new(-0.3,0,0)
local density = 1
local friction = 1
local elasticity = 2
local frictionWeight = 1
local elasticityWeight = 5
local physProperties = PhysicalProperties.new(density, friction, elasticity, frictionWeight, elasticityWeight)
    for i,v in pairs(owner.Character:GetDescendants()) do
pcall(function()
        if v:IsA("Motor6D") then
            v.Enabled = false
end
end)
end
function the()
            local Socket = Instance.new("BallSocketConstraint")
            local a1 = Instance.new("Attachment")
            local a2 = Instance.new("Attachment")
            a1.Parent = owner.Character["Left Arm"]
            a2.Parent = owner.Character.Torso
            Socket.Parent = owner.Character["Left Arm"]
            Socket.Attachment0 = a1
            Socket.Attachment1 = a2
            a1.WorldCFrame = a1.Parent.CFrame * CFrame.new(0,0.5,0)
            a2.WorldCFrame = a2.Parent.CFrame * CFrame.new(-1.5,0.5,0)
Socket.LimitsEnabled = true
end
function the5()
            local Socket = Instance.new("BallSocketConstraint")
            local a1 = Instance.new("Attachment")
            local a2 = Instance.new("Attachment")
            a1.Parent = owner.Character["Left Leg"]
            a2.Parent = owner.Character.Torso
            Socket.Parent = owner.Character["Left Leg"]
            Socket.Attachment0 = a1
            Socket.Attachment1 = a2
            a1.WorldCFrame = a1.Parent.CFrame * CFrame.new(0,0.5,0)
            a2.WorldCFrame = a2.Parent.CFrame * CFrame.new(-0.5,-1.5,0)
Socket.LimitsEnabled = true
end
function the6()
            local Socket = Instance.new("BallSocketConstraint")
            local a1 = Instance.new("Attachment")
            local a2 = Instance.new("Attachment")
            a1.Parent = owner.Character["Right Leg"]
            a2.Parent = owner.Character.Torso
            Socket.Parent = owner.Character["Right Leg"]
            Socket.Attachment0 = a1
            Socket.Attachment1 = a2
Socket.LimitsEnabled = true
            a1.WorldCFrame = a1.Parent.CFrame * CFrame.new(0,0.5,0)
            a2.WorldCFrame = a2.Parent.CFrame * CFrame.new(0.5,-1.5,0)
            local limbcollider = Instance.new("Part", owner.Character:findFirstChild("Right Leg"))
                limbcollider.Size = Vector3.new(1.4,1,1)
                limbcollider.Transparency = 1
                limbcollider.Name = "LimbCollider"
                local limbcolliderweld = Instance.new("Weld", limbcollider)
                limbcolliderweld.Part0 = owner.Character:findFirstChild("Right Leg")
                limbcolliderweld.Part1 = limbcollider
                limbcolliderweld.C0 = CFrame.fromEulerAnglesXYZ(0,0,math.pi/2) * CFrame.new(-0.3,0,0)
            local limbcollider2 = Instance.new("Part", owner.Character:findFirstChild("Left Leg"))
                limbcollider2.Size = Vector3.new(1.4,1,1)
                limbcollider2.Transparency = 1
                limbcollider2.Name = "LimbCollider"
                local limbcolliderweld2 = Instance.new("Weld", limbcollider2)
                limbcolliderweld2.Part0 = owner.Character:findFirstChild("Left Leg")
                limbcolliderweld2.Part1 = limbcollider2
                limbcolliderweld2.C0 = CFrame.fromEulerAnglesXYZ(0,0,math.pi/2) * CFrame.new(-0.3,0,0)
end
function the4()
            local Socket = Instance.new("BallSocketConstraint")
            local a1 = Instance.new("Attachment")
            local a2 = Instance.new("Attachment")
            a1.Parent = owner.Character.HumanoidRootPart
            a2.Parent = owner.Character.Torso
            Socket.Parent = owner.Character.HumanoidRootPart
            Socket.Attachment0 = a1
            Socket.Attachment1 = a2
            a1.WorldCFrame = a1.Parent.CFrame
            a2.WorldCFrame = a1.Parent.CFrame
Socket.LimitsEnabled = true
end
function the3()
            local Socket = Instance.new("BallSocketConstraint")
            local a1 = Instance.new("Attachment")
            local a2 = Instance.new("Attachment")
            a1.Parent = owner.Character.Head
            a2.Parent = owner.Character.Torso
            Socket.Parent = owner.Character.Head
            Socket.Attachment0 = a1
            Socket.Attachment1 = a2
            a1.WorldCFrame = a1.Parent.CFrame * CFrame.new(0,-0.5,0)
            a2.WorldCFrame = a2.Parent.CFrame * CFrame.new(0,1.0625,0)
Socket.TwistLimitsEnabled = true
Socket.LimitsEnabled = true
end
function the2()
            local Socket = Instance.new("BallSocketConstraint")
            local a1 = Instance.new("Attachment")
            local a2 = Instance.new("Attachment")
            a1.Parent = owner.Character["Right Arm"]
            a2.Parent = owner.Character.Torso
            Socket.Parent = owner.Character["Right Arm"]
            Socket.Attachment0 = a1
            Socket.Attachment1 = a2
            a1.WorldCFrame = a1.Parent.CFrame * CFrame.new(0,0.5,0)
            a2.WorldCFrame = a2.Parent.CFrame * CFrame.new(1.5,0.5,0)
Socket.LimitsEnabled = true
end
the()
the2()
the3()
the4()
the5()
the6()
owner.Character.Humanoid.RequiresNeck = false
owner.Character.Humanoid.PlatformStand = true
for i,v in pairs(owner.Character:GetDescendants()) do
if v:IsA("BasePart") then
local nocollide = Instance.new("NoCollisionConstraint", owner.Character.HumanoidRootPart)
nocollide.Part0 = v
nocollide.Part1 = owner.Character.HumanoidRootPart
local nocollide = Instance.new("NoCollisionConstraint", owner.Character.Torso)
nocollide.Part0 = v
nocollide.Part1 = owner.Character.Torso
v.CustomPhysicalProperties = physProperties
end
end
local ids = {6837727169, 6837727725, 6837726415, 6837724677, 6837689373, 6837725727}
local bodyhit = Instance.new("Sound", owner.Character.Torso)
bodyhit.SoundId = "rbxassetid://220025741"
bodyhit.Volume = 1
bodyhit.EmitterSize = 10
bodyhit.PlayOnRemove = true
local bg = Instance.new("BillboardGui", owner.PlayerGui)
bg.Adornee = nil
bg.Size = UDim2.new(0, 100, 0, 100)
bg.Name = "LockOnBG"
bg.AlwaysOnTop = true
local e = Instance.new("ImageLabel", bg)
e.ImageTransparency = 1
e.Image = 'rbxassetid://8628864911'
e.BackgroundTransparency = 1
e.Size = UDim2.new(1, 0, 1, 0)
e.ImageColor3 = Color3.fromRGB(255, 0, 0)
e.Rotation = 5
owner.Character.Torso.Touched:Connect(function(hit)
if owner.Character.Torso.Velocity.Z <= -5 then
local rand = math.random(1,#ids)
bodyhit.SoundId = "rbxassetid://" ..ids[rand]
bodyhit.TimePosition = .2
bodyhit.Parent = owner.Character.Head
bodyhit.Parent = nil
end
end)
NLS([[
local e = owner.PlayerGui:WaitForChild("LockOnBG").ImageLabel
local bg = e.Parent
workspace.CurrentCamera.CameraSubject = owner.Character.Torso
local m = owner:GetMouse()
local held = false
local target = nil
local rocket = Instance.new("RocketPropulsion", owner.Character.Torso)
rocket.CartoonFactor = 1000
rocket.MaxSpeed = 10000
rocket.ThrustD = 100000
rocket.ThrustP = 5000
rocket.MaxThrust = 100000
rocket.TargetRadius = 1000000
rocket.MaxTorque = Vector3.new(4e6, 4e6, 4e6)
m.KeyDown:Connect(function(k)
if k == 'f' then
held = true
elseif k == 't' and target == nil and m.Target and m.Target ~= "Base" then
target = m.Target
rocket.Target = target
rocket:Fire()
elseif k == 'g' then
target = nil
end
end)
m.KeyUp:Connect(function(k)
if k == 'f' then
held = false
rocket:Abort()
end
end)
game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
    e.Rotation = e.Rotation + 1
    if held == true and target ~= nil then
   	rocket:Fire()
	elseif held == true and target == nil then
	owner.Character.Torso.Velocity = CFrame.new(owner.Character.Torso.Position, m.Hit.p).lookVector * 125
	end
	if target == nil then
	workspace.CurrentCamera.CameraType = "Custom"
	workspace.CurrentCamera.CameraSubject = owner.Character.Torso
	elseif target ~= nil then
	local B = target.Position
    local A = owner.Character.HumanoidRootPart.Position
	local Offset = CFrame.new(-5, 1, 3)
	local V = A * Offset
    workspace.CurrentCamera.CameraType = "Scriptable"
    workspace.CurrentCamera.CFrame = CFrame.new(V, B)
	end
	end)
	end)
]], owner.Character)
