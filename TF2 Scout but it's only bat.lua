local quoteids = {5801619105, 7143729883, 1543462253, 1543509902, 6699227382, 1018518369}
local quotes = {"Nice hustle tons of fun! Next, time eat a salad!", "Sweet.", "Amplus Tripudio!", "Paidum Celeris!", "Pop quiz: How long's it take to beat a moron to death? BAMP! Sorry, time's up, ya dead!", "Who wants some-a this?"}
local teamtextureid = 1
local team = "ROBLOX"
print('say "blu" for blu team, say "red" for red team')
print("note: press g to reset zoom before you g/no. or g/ns")
local con = owner.Chatted:Connect(function(msg)
if msg == 'red' then
teamtextureid = 8974239397
team = "RED"
owner.Character.Humanoid:SetAttribute(team, 1)
elseif msg == 'blu' then
teamtextureid = 8978104105
team = "BLU"
owner.Character.Humanoid:SetAttribute(team, 1)
end
end)
repeat task.wait() until teamtextureid ~= 1
con:Disconnect()
for i, v in pairs(owner.Character:GetChildren()) do
if string.find(v.Name, "Arm") or string.find(v.Name, "Hand") then
-- v:Destroy()
v.Transparency = 1
elseif v:IsA("Accessory") then
v:Destroy()
elseif string.find(v.Name, "Torso") then
v.Transparency = 1
end
end
owner.Character.Humanoid.WalkSpeed *= 1.5
if owner.Character:FindFirstChild("UpperTorso") then
local tors = Instance.new("SpawnLocation", owner.Character)
tors.Name = "FakeTorso"
tors.CanCollide = false
tors.Size = Vector3.new(2, 2, 1)
tors.CanQuery = false
tors.Enabled = false
tors.CanTouch = false
local w = Instance.new("Weld", tors)
w.Part0 = tors
w.Part1 = owner.Character.UpperTorso
w.C1 = CFrame.new(0, 2.5, 0)
local mesh = Instance.new("SpecialMesh", tors)
mesh.MeshId = 'rbxassetid://8974238936'
mesh.TextureId = 'rbxassetid://' ..teamtextureid
mesh.Scale = Vector3.new(.1,.1,.1)
mesh.Offset = Vector3.new(0, 0, .25)
else
owner.Character.HumanoidRootPart.Transparency = 0
local mesh = Instance.new("SpecialMesh", owner.Character.HumanoidRootPart)
mesh.MeshId = 'rbxassetid://8974238936'
mesh.TextureId = 'rbxassetid://' ..teamtextureid
mesh.Scale = Vector3.new(.1,.1,.1)
mesh.Offset = Vector3.new(0, 2.5, .5)
end
local ll, rl
if owner.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
ll = owner.Character["Left Leg"]
rl = owner.Character["Right Leg"]
else
for i, v in pairs(owner.Character:GetChildren()) do
if string.find(v.Name, "Leg") or string.find(v.Name, "Foot") then
v.Transparency = 1
end
end
ll, rl = Instance.new("SpawnLocation", owner.Character), Instance.new("SpawnLocation", owner.Character)
ll.Name = "fakell"
ll.Enabled = false
ll.Size = Vector3.new(1, 2, 1)
ll.CanCollide = false
ll.CanQuery = false
ll.CanTouch = false
rl.Name = "fakerl"
rl.Enabled = false
rl.Size = Vector3.new(1, 2, 1)
rl.CanCollide = false
rl.CanQuery = false
rl.CanTouch = false
local w, w2 = Instance.new("Weld", ll), Instance.new("Weld", rl)
w.Part0 = ll
w.Part1 = owner.Character.LeftLowerLeg
w.C1 = CFrame.new(0,.25,0)
w2.Part0 = rl
w2.Part1 = owner.Character.RightLowerLeg
w2.C1 = CFrame.new(0,.25,0)
end
local mesh = Instance.new("SpecialMesh", ll)
mesh.MeshId = 'rbxassetid://8975463209'
mesh.TextureId = 'rbxassetid://' ..teamtextureid
mesh.Scale = Vector3.new(.1,.1,.1)
mesh.Offset = Vector3.new(0, 1.15, .25)
local mesh = Instance.new("SpecialMesh", rl)
mesh.MeshId = 'rbxassetid://8975451744'
mesh.TextureId = 'rbxassetid://' ..teamtextureid
mesh.Scale = Vector3.new(.1,.1,.1)
mesh.Offset = Vector3.new(-.5, 1.15, .25)
local head = owner.Character.Head
if head:IsA("MeshPart") then
head.Transparency = 1
head = Instance.new("SpawnLocation", owner.Character)
head.Name = "fakehead"
head.Enabled = false
head.Size = Vector3.new(2, 1, 1)
head.CanCollide = false
head.CanQuery = false
head.CanTouch = false
local w = Instance.new("Weld", head)
w.Part0 = head
w.Part1 = owner.Character.Head
-- w.C1 = CFrame.new(0, 2.5, 0)
owner.Character.Head.Neck.C0 *= CFrame.new(0, 2.65, -.25)
else
owner.Character.Torso.Neck.C0 *= CFrame.new(0, 0, 2.5)
end
local mesh = Instance.new("SpecialMesh" , head)
mesh.MeshId = 'rbxassetid://863723265'
mesh.TextureId = 'rbxassetid://863723378'
mesh.Scale = Vector3.new(.1,.1,.1)
local eyes = Instance.new("SpawnLocation", head)
eyes.CanCollide = false
eyes.Size = Vector3.new(0.359, 0.069, 0.053)
eyes.CanTouch = false
eyes.Enabled = false
eyes.CanQuery = false
local w = Instance.new("Weld", owner.Character)
w.Part0 = head
w.Part1 = eyes
w.C1 = CFrame.new(23.343, 7.017, -20.291, 1, 0, 0, 0, 1, 0, 0, 0, 1)
w.C0 = CFrame.new(23.343, 7.139, -20.614, 1, 0, 0, 0, 1, 0, 0, 0, 1)
local mesh = Instance.new("SpecialMesh" , eyes)
mesh.MeshId = 'rbxassetid://863723693'
mesh.TextureId = 'rbxassetid://863723700'
mesh.Scale = Vector3.new(.105,.105,.105)
mesh.Offset = Vector3.new(0, 0,-.015)
local headset = Instance.new("SpawnLocation", owner.Character)
headset.CanCollide = false
headset.Size = Vector3.new(0.849, 1.001, 1.111)
headset.CanTouch = false
headset.Enabled = false
headset.CanQuery = false
headset.Name = "headset"
local mesh = Instance.new("SpecialMesh" , headset)
mesh.MeshId = 'rbxassetid://863725424'
mesh.TextureId = 'rbxassetid://863725625'
mesh.Scale = Vector3.new(.1,.1,.1)
local w = Instance.new("Weld", owner.Character)
w.Part0 = head
w.Part1 = headset
w.C1 = CFrame.new(23.343, 7.017, -20.291, 1, 0, 0, 0, 1, 0, 0, 0, 1)
w.C0 = CFrame.new(23.249, 7.192, -20.436, 1, 0, 0, 0, 1, 0, 0, 0, 1)
pcall(function()
owner.Character.Head.face:Destroy()
end)
local swinging = false
local function HasHumanoid(p)
if p:FindFirstAncestorOfClass("Model", true) and p:FindFirstAncestorOfClass("Model", true):FindFirstChildOfClass("Humanoid") then
return p:FindFirstAncestorOfClass("Model", true):FindFirstChildOfClass("Humanoid")
else
return false
end
end
local ITERATIONS = 8
local SPRING = {}
function SPRING.create(self, mass, force, damping, speed)
local spring = {
Target = Vector3.new();
Position = Vector3.new();
Velocity = Vector3.new();
Mass = mass or 5;
Force = force or 50;
Damping = damping or 4;
Speed = speed  or 4;
}
function spring.shove(self, force)
local x, y, z	= force.X, force.Y, force.Z
if x ~= x or x == math.huge or x == -math.huge then
x	= 0
end
if y ~= y or y == math.huge or y == -math.huge then
y	= 0
end
if z ~= z or z == math.huge or z == -math.huge then
z	= 0
end
self.Velocity	= self.Velocity + Vector3.new(x, y, z)
end
function spring.update(self, dt)
local scaledDeltaTime = math.min(dt,1) * self.Speed / ITERATIONS	
for i = 1, ITERATIONS do
local iterationForce = self.Target - self.Position
local acceleration	= (iterationForce * self.Force) / self.Mass
acceleration -= (self.Velocity * self.Damping)
self.Velocity += (acceleration * scaledDeltaTime)
self.Position += (self.Velocity * scaledDeltaTime)
end
return self.Position
end
return spring
end
local swingcfs = {CFrame.new(-.5, -3, -1) * CFrame.Angles(math.rad(-90), 0, 0), hitcf = CFrame.new(-.5, -3, -1) * CFrame.Angles(math.rad(-90), math.rad(125), 0), CFrame.new(-.5, -2, -3) * CFrame.Angles(math.rad(-90), 0, 0)}
local mult = 10
local bat = Instance.new("SpawnLocation", script)
bat.Enabled = false
bat.Name = "Bat"
bat.CanCollide = false
bat.Size = Vector3.new(5.995, 29.94, 3.781)/mult
bat.Position = Vector3.new(7.95, -0.109, -31.496)/mult
local msh = Instance.new("SpecialMesh", bat)
msh.MeshId = "rbxassetid://9008046088"
msh.TextureId = "rbxassetid://9008046655"
msh.Scale = Vector3.new(1, 1, 1)/mult
local vm = Instance.new("Model", script)
vm.Name = "ViewModel"
local ra = Instance.new("SpawnLocation", vm)
ra.Enabled = false
ra.Name = "RightArm"
ra.CanCollide = false
ra.Size = Vector3.new(12.568, 19.287, 26.768)/mult
ra.Position = Vector3.new(10.949, -16.536, -20.962)/mult
local msh = Instance.new("SpecialMesh", ra)
msh.MeshId = "rbxassetid://9008033718"
msh.TextureId = "rbxassetid://9008033862"
msh.Scale = Vector3.new(1, 1, 1)/mult
local la = Instance.new("SpawnLocation", vm)
la.Enabled = false
la.Name = "LeftArm"
la.CanCollide = false
la.Size = Vector3.new(8.328, 34.481, 9.271)/mult
local msh = Instance.new("SpecialMesh", la)
msh.MeshId = "rbxassetid://9008036520"
msh.TextureId = "rbxassetid://9008036575"
msh.Scale = Vector3.new(1, 1, 1)/mult
local wc = Instance.new("WeldConstraint", bat)
wc.Part0 = bat
wc.Part1 = ra
local wc = Instance.new("Weld", la)
wc.Part0 = owner.Character.HumanoidRootPart
wc.Part1 = la
if owner.Character.Head:IsA("MeshPart") then
wc.C0 = CFrame.new(-1.05, 1.35, -.25)
elseif owner.Character.Head:IsA("BasePart") and not owner.Character.Head:IsA("MeshPart") then
wc.C0 = CFrame.new(-1.05, 1.35, .25)
end
local w = Instance.new("Weld", script)
w.Part0 = bat
w.Part1 = owner.Character.HumanoidRootPart
local val = Instance.new("ObjectValue", owner.Character)
val.Name = "b"
val.Value = bat
local wc = SPRING.create()
local sway = SPRING.create()
local bobspeed = 1
local bobmod = .1
local alpha = .25
local hitcf = CFrame.new()
local function gb(addition, speed, modifier)
return math.sin(tick() * addition * speed) * modifier
end
coroutine.wrap(function()
while task.wait() do
hitcf = hitcf:Lerp(CFrame.Angles(0, 0, 0), .5)
end
end)()
local mass = 0
for i, v in pairs(owner.Character:GetChildren()) do
if v:IsA("BasePart") then
mass += v:GetMass()
end
end
local function chatfunc(text)
local chat = coroutine.wrap(function()
if owner.Character.Head:FindFirstChild("TalkingBillBoard")~= nil then
owner.Character.Head:FindFirstChild("TalkingBillBoard"):destroy()
end
local naeeym2 = Instance.new("BillboardGui", owner.Character.Head)
naeeym2.Size = UDim2.new(0, 500, 0, 500)
naeeym2.StudsOffset = Vector3.new(0,3,0)
naeeym2.Name = "TalkingBillBoard"
local tecks2 = Instance.new("TextBox",naeeym2)
tecks2.BackgroundTransparency = 1
tecks2.BorderSizePixel = 0
tecks2.Text = ""
tecks2.Font = "Bodoni"
tecks2.TextWrapped = true
tecks2.TextSize = 35
tecks2.TextStrokeTransparency = 0
tecks2.TextColor3 = Color3.new(1, 1, 1)
tecks2.TextStrokeColor3 = Color3.new()
tecks2.Size = UDim2.new(1, 0, .5,0)
for c = 1, #text, 1 do
tecks2.Text = string.sub(text, 1, c)
task.wait(.05)
end
task.wait(1.5)
for i = 1, 50 do
tecks2.TextStrokeTransparency += .05
tecks2.TextTransparency += .05
end
naeeym2:Destroy()
end)
chat()
end
local allpurpose = Instance.new("Sound", game:GetService("VRService"))
allpurpose.EmitterSize = 10
allpurpose.SoundId = 'rbxassetid://7223640465'
allpurpose.Volume = 1.5
allpurpose.PlayOnRemove = true
local bonk = Instance.new("Sound", owner.Character.Head)
bonk.SoundId = 'rbxassetid://130944130'
bonk.Volume = .75
local swings = {7025242231, 6230941447}
local quote = Instance.new("Sound", owner.Character.Head)
quote.SoundId = 'rbxassetid://' ..quoteids[1]
quote.Volume = 1.25
local waist = owner.Character:FindFirstChild("Waist", true)
local waistc0 = CFrame.new()
if waist then
waistc0 = waist.C0
end
local neckc0 = owner.Character:FindFirstChild("Neck", true).C0
local function pointheadtocam(cf)
local body = owner.Character.HumanoidRootPart
local neck = owner.Character:FindFirstChild("Neck", true)
local theta = math.asin(cf.LookVector.Y)
local camera_angle = math.atan2(cf.LookVector.X, cf.LookVector.Z)
local body_angle = math.atan2(body.CFrame.LookVector.X, body.CFrame.LookVector.Z)
local theta2 = (camera_angle-body_angle)%(2*math.pi)
if theta2 > math.pi/2 and theta2 < math.pi*1.5 then
theta2 = math.pi-theta2
end
if owner.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then 
neck.C0 = neckc0 * CFrame.Angles(-(theta), 0, 0)
elseif owner.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
-- waist.C0 = waistc0 * CFrame.Angles(theta*.5, 0, 0)
neck.C0 = neckc0 * CFrame.Angles(theta, 0, 0)
end
end
local qcd = false
local re = Instance.new("RemoteEvent", val)
re.OnServerEvent:Connect(function(plr, mode, c1, delta, dt, cam)
if mode == "aim" then
pointheadtocam(cam)
local vel = owner.Character.HumanoidRootPart.Velocity
local msway = Vector3.new(gb(10, bobspeed, bobmod), gb(5, bobspeed, bobmod), gb(5, bobspeed, bobmod))
sway:shove(Vector3.new(delta.X / 500, delta.Y / 500))
wc:shove((msway / 25) * dt * 60 * vel.Magnitude)
local sw = sway:update(dt)
local wcs = wc:update(dt)
w.C1 = w.C1:Lerp(c1, alpha) * hitcf
w.C1 = w.C1:Lerp(c1 * CFrame.new(wcs.x / 2, wcs.y / 2,0), .25)
w.C1 *= CFrame.Angles(0,-sw.x, sw.y)
w.C1 = w.C1:Lerp(w.C1 * CFrame.Angles(0, wcs.y, wcs.x), .25)
elseif mode == "d" then
owner.CameraMaxZoomDistance = oldzoom
script:Destroy()
elseif mode == "n" then
if qcd then return end
qcd = true
local q = math.random(1, #quoteids)
quote.SoundId = 'rbxassetid://' ..quoteids[q]
chatfunc(quotes[q])
quote:Play()
quote.Ended:Wait()
task.wait(.5)
qcd = false
elseif mode == "swing" then
local q = math.random(1, #swingcfs)
allpurpose.SoundId = 'rbxassetid://' ..swings[math.random(1, #swings)]
allpurpose.Parent = bat
allpurpose.Parent = nil
hitcf = swingcfs[q]
swinging = true
task.wait(.25)
swinging = false
end
end)
local sdb = false
coroutine.wrap(function()
while task.wait() do
for i, hit in pairs(workspace:GetPartBoundsInBox(bat.CFrame, bat.Size*1.15)) do
if hit:IsDescendantOf(owner.Character) == false and hit:IsDescendantOf(script) == false and HasHumanoid(hit) and sdb == false and swinging == true then
sdb = true
allpurpose.SoundId = 'rbxassetid://175024455'
allpurpose.Parent = bat
allpurpose.Parent = nil
bonk:Play()
local h = HasHumanoid(hit)
h.Health -= math.random(20, 30)
task.wait(.35)
sdb = false
end
end
end
end)()
NLS([[
local g = script.Parent.Value
local re = script.Parent.RemoteEvent
local UIS = game:GetService("UserInputService")
local m = owner:GetMouse()
local cd = false
script.Parent = workspace
local deltat = 0
local c = workspace.CurrentCamera
local offset = CFrame.new(.5, .15, -2) * CFrame.Angles(0, .005,0)
local aimoffset, delta = owner.Character.HumanoidRootPart.CFrame:ToObjectSpace(owner.Character.Head.CFrame * offset), UIS:GetMouseDelta()
m.KeyDown:Connect(function(k)
if k == 'g' then
re:FireServer("d", aimoffset, delta, deltat, c.CFrame)
script:Destroy()
elseif k == 'n' then
re:FireServer("n", aimoffset, delta, deltat, c.CFrame)
end
end)
m.Button1Down:Connect(function()
if cd then return end
cd = true
re:FireServer("swing", aimoffset, delta, deltat, c.CFrame)
task.wait(.5)
cd = false
end)
local function SetCharacterLocalTransparency(transparency)
    for i,v in pairs(owner.Character:GetDescendants()) do
       if v:IsA("BasePart") and v.Name ~= "Head" and v.Name ~= "fakehead" and v.Parent.Name ~= "fakehead" and v.Name ~= "headset" then
          v.LocalTransparencyModifier = 0
       end
    end
end
if owner.Character.Head:IsA("MeshPart") then
owner.Character.Humanoid.CameraOffset = Vector3.new(0, 2.5, -1)
elseif owner.Character.Head:IsA("BasePart") and not owner.Character.Head:IsA("MeshPart") then
owner.Character.Humanoid.CameraOffset = Vector3.new(0, 2.65, -.8)
end
game:GetService("RunService").Heartbeat:Connect(function(dt)
pcall(function()
deltat = dt
SetCharacterLocalTransparency(0)
aimoffset, delta = owner.Character.HumanoidRootPart.CFrame:ToObjectSpace(owner.Character.Head.CFrame * offset), UIS:GetMouseDelta()
re:FireServer("aim", aimoffset, delta, dt, c.CFrame)
local x, y, z = c.CFrame:ToEulerAnglesXYZ()
end)
end)
local UIS = game:GetService("UserInputService")
local cdj = false
local dj = false
local op = owner.Character.Humanoid.JumpPower
local tbj = .1
local djpm = 2
function jp()
if cdj and not dj then
dj = true
owner.Character.Humanoid.JumpPower = op * djpm
owner.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
end
end
dj = false
cdj = false
owner.Character.Humanoid.StateChanged:connect(function(old, new)
if new == Enum.HumanoidStateType.Landed then
cdj = false
dj = false
owner.Character.Humanoid.JumpPower = op
elseif new == Enum.HumanoidStateType.Freefall then
task.wait(tbj)
cdj = true
end
end)
UIS.JumpRequest:connect(jp)
]], val)
task.wait()
local g = Instance.new("ScreenGui", owner.PlayerGui)
g.Name = "ea"
local b = Instance.new("Frame" , g)
b.Size = UDim2.new(0,225,0,300)
b.BackgroundTransparency = 1
b.AnchorPoint = Vector2.new(.5,.5)
b.Position = UDim2.new(1, -187, 1, -175)
local c = workspace.Camera:Clone()
c.CameraType = "Scriptable"
c.FieldOfView = 70
local ga = Instance.new("ViewportFrame" , b)
ga.Size = UDim2.new(1, 0, 1, 0)
ga.CurrentCamera = c
ga.BackgroundTransparency = 1
local bo = Instance.new("WorldModel", ga)
owner.Character.Archivable = true
local re = owner.Character:Clone()
re.Parent = bo
re.Humanoid.DisplayName = " "
re.Humanoid.PlatformStand = true
local fake1 = la:Clone()
fake1.Parent = bo
local fake2 = ra:Clone()
fake2.Parent = bo
local fake3 = bat:Clone()
fake3.Parent = bo
for i, v in pairs(owner.Character:GetChildren()) do
if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
local p = re[v.Name]
local w = Instance.new("Weld", p)
w.Part0 = re.HumanoidRootPart
w.Part1 = p
w.Name = "bodw"
end
end
c.CFrame = CFrame.new(0,0,-8) * CFrame.Angles(0,math.rad(180),0)
while task.wait() do
fake1.CFrame = la.CFrame
fake2.CFrame = ra.CFrame
fake3.CFrame = bat.CFrame
c.CFrame = CFrame.new(re.HumanoidRootPart.Position) * CFrame.new(0, 2, -5) * CFrame.Angles(0,math.rad(180),0)
re.HumanoidRootPart.CFrame = owner.Character.HumanoidRootPart.CFrame -- CFrame.Angles(owner.Character.HumanoidRootPart.CFrame:ToEulerAnglesXYZ())
for i, v in pairs(owner.Character:GetChildren()) do
if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
re[v.Name].bodw.C0 = owner.Character.HumanoidRootPart.CFrame:Inverse() * v.CFrame
end
end
end
