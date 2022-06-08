for i, v in pairs(owner.Character:GetChildren()) do 
if v:IsA("BasePart") and v.Name ~= "Head" then
v.Transparency = 1
end
end
owner.Character.Archivable = true
local fakemod = Instance.new("Model" , owner.Character)
fakemod.Name = "R6 Body"
local rl = Instance.new("SpawnLocation" , fakemod)
rl.Size = Vector3.new(1,2,1)
rl.Enabled = false
rl.CanCollide = false
rl.Name = "Right Leg"
rl.Material = "SmoothPlastic"
rl.Color = owner.Character.RightLowerLeg.Color
local w = Instance.new("Weld" , rl)
w.Part0 = rl
w.Part1 = owner.Character.RightLowerLeg
w.C1 = CFrame.new(0,.25,0)
local ll = Instance.new("SpawnLocation" , fakemod)
ll.Size = Vector3.new(1,2,1)
ll.Enabled = false
ll.CanCollide = false
ll.Name = "Left Leg"
ll.Material = "SmoothPlastic"
ll.Color = owner.Character.LeftLowerLeg.Color
local w = Instance.new("Weld" , ll)
w.Part0 = ll
w.Part1 = owner.Character.LeftLowerLeg
w.C1 = CFrame.new(0,.25,0)
local ra = Instance.new("SpawnLocation" , fakemod)
ra.Size = Vector3.new(1,2,1)
ra.Enabled = false
ra.CanCollide = false
ra.Name = "Right Arm"
ra.Material = "SmoothPlastic"
ra.Color = owner.Character.RightLowerArm.Color
local w = Instance.new("Weld" , ra)
w.Part0 = ra
w.Part1 = owner.Character.RightLowerArm
w.C1 = CFrame.new(0,.25,0)
local la = Instance.new("SpawnLocation" , fakemod)
la.Size = Vector3.new(1,2,1)
la.Enabled = false
la.CanCollide = false
la.Name = "Left Arm"
la.Material = "SmoothPlastic"
la.Color = owner.Character.LeftLowerArm.Color
local w = Instance.new("Weld" , la)
w.Part0 = la
w.Part1 = owner.Character.LeftLowerArm
w.C1 = CFrame.new(0,.25,0)
local tors = Instance.new("SpawnLocation" , fakemod)
tors.Size = Vector3.new(2,2,1)
tors.Enabled = false
tors.Name = "Torso"
tors.CanCollide = false
tors.Material = "SmoothPlastic"
tors.Color = owner.Character.UpperTorso.Color
local w = Instance.new("Weld" , tors)
w.Part0 = tors
w.Part1 = owner.Character.UpperTorso
w.C1 = CFrame.new(0,-.15,0)
local g = owner.Character.Humanoid:Clone()
g.RigType = Enum.HumanoidRigType.R6
g.RequiresNeck = false
g.MaxHealth = 0/0
g.Health = 0/0
g.Parent = fakemod
g.PlatformStand = true
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
   if v:IsA("BasePart") then
    PhysService:SetPartCollisionGroup(v,name)
	PhysService:SetPartCollisionGroup(owner.Character.HumanoidRootPart, name2)
   end
  end
end
NoCollide(fakemod)
for i ,v in pairs(owner.Character:GetDescendants()) do
if v:IsA("Shirt") then
v:Clone().Parent = fakemod
elseif v:IsA("ShirtGraphic") then
v:Clone().Parent = fakemod
elseif v:IsA("Pants") then
v:Clone().Parent = fakemod
elseif v:IsA("BasePart") and v:IsDescendantOf(fakemod) == false then
PhysService:SetPartCollisionGroup(v,name2)
end
end
for i, v in pairs(fakemod:GetDescendants()) do
if v:IsA("BasePart") then
v.CanTouch = false
v.CanCollide = false
v.Massless = true
v.CanQuery = false
end
end
