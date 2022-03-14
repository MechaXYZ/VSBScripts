local quoteids = {6972319677, 4985415286, 1329648321, 6967247495, 9092703577, 5651641845}
local quotes = {"Let's go.", "*in gibberish* Everyone thinks I'm just a one-eyed bloody monster...", "Pootis!", "Aye, me bottle o' scrumpy!", "They're goin' ta bury whats left of ye in a soup can!", "*schadenfreude*"}
local teamtextureid = 1
local grenadetxt = 1
local stickybombtxt = 1
local team = "ROBLOX"
local teamcolor = Color3.new(1, 1, 1)
print([[
funni demoman script by mech 
say "red" or "blu" for teams
will give controls when you pick a team (pick red!1!)
]])
local con = owner.Chatted:Connect(function(msg)
if msg == 'red' then
teamtextureid = 9095599949
grenadetxt = 9092154799
stickybombtxt = 9096601798
teamcolor = Color3.new(1, 0, 0)
team = "RED"
owner.Character.Humanoid:SetAttribute(team, 1)
elseif msg == 'blu' then
teamtextureid = 9095673304
grenadetxt = 9096555742
stickybombtxt = 9097165719
teamcolor = Color3.new(0, 0, 1)
team = "BLU"
owner.Character.Humanoid:SetAttribute(team, 1)
end
end)
repeat task.wait() until teamtextureid ~= 1
con:Disconnect()
owner.Character.Humanoid.MaxHealth = 175
print([[
ok here are the controls
1, 2, and 3 - switch between grenade launcher, stickybomb launcher, and a bottle of scrumpy that was made in 1808
click - use your weapon
f - detonate stickybombs (you can only have 8 stickybombs, if you place a ninth one it will explode)
n - taunt
g - stop the script (will go back to third person so use it before you g/no.)
]])
if team == "BLU" then
print("aw you didn't pick red :(")
end
for i = 1, 10 do
task.wait()
owner.Character.Humanoid.Health += 7.5
end
local oldzoom = owner.CameraMaxZoomDistance
owner.CameraMaxZoomDistance = -1
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
owner.Character.Humanoid.WalkSpeed += (100/93)
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
mesh.MeshId = 'rbxassetid://9095599833'
mesh.TextureId = 'rbxassetid://' ..teamtextureid
mesh.Scale = Vector3.new(.1,.1,.1)
mesh.Offset = Vector3.new(0, 0, .25)
local healpart = Instance.new("SpawnLocation", owner.Character)
healpart.Name = "MedicHealPart"
healpart.CanCollide = false
healpart.Size = Vector3.new(25.643, 50, 16.977)/10
healpart.CanQuery = false
healpart.Enabled = false
healpart.Transparency = 1
healpart.CanTouch = false
local w = Instance.new("Weld", healpart)
w.Part0 = healpart
w.Part1 = tors
w.C1 = CFrame.new(0, 1, 0)
else
owner.Character.HumanoidRootPart.Transparency = 0
local mesh = Instance.new("SpecialMesh", owner.Character.HumanoidRootPart)
mesh.MeshId = 'rbxassetid://9095599833'
mesh.TextureId = 'rbxassetid://' ..teamtextureid
mesh.Scale = Vector3.new(.1,.1,.1)
mesh.Offset = Vector3.new(0, 2.5, .5)
local healpart = Instance.new("SpawnLocation", owner.Character)
healpart.Name = "MedicHealPart"
healpart.CanCollide = false
healpart.Size = Vector3.new(25.643, 50, 16.977)/10
healpart.CanQuery = false
healpart.Enabled = false
healpart.Transparency = 1
healpart.CanTouch = false
local w = Instance.new("Weld", healpart)
w.Part0 = healpart
w.Part1 = owner.Character.HumanoidRootPart
w.C1 = CFrame.new(0, 1, 0)
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
mesh.MeshId = 'rbxassetid://9095615704'
mesh.TextureId = 'rbxassetid://' ..teamtextureid
mesh.Scale = Vector3.new(.1,.1,.1)
mesh.Offset = Vector3.new(-.15, 1.35, .5)
local mesh = Instance.new("SpecialMesh", rl)
mesh.MeshId = 'rbxassetid://9095620651'
mesh.TextureId = 'rbxassetid://' ..teamtextureid
mesh.Scale = Vector3.new(.1,.1,.1)
mesh.Offset = Vector3.new(.15, 1.35, .5)
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
owner.Character.Head.Neck.C0 *= CFrame.new(0, 3.35, .45)
else
owner.Character.Torso.Neck.C0 *= CFrame.new(0, .45, 3.15)
end
local oldcf = head.CFrame
head.Anchored = true
head.CFrame = CFrame.new(0, 77.088/10, -1.096/10, 1, 0, 0, 0, 1, 0, 0, 0, 1)
local mesh = Instance.new("SpecialMesh" , head)
mesh.MeshId = 'rbxassetid://9095591413'
mesh.TextureId = 'rbxassetid://9095591960'
mesh.Scale = Vector3.new(.1,.1,.1)
local eye = Instance.new("SpawnLocation", head)
eye.CanCollide = false
eye.Size = Vector3.new(1.129, 0.827, 0.433)/10
eye.CanTouch = false
eye.Enabled = false
eye.CFrame = CFrame.new(1.504/10, 78.595/10, -3.825/10, 1, 0, 0, 0, 1, 0, 0, 0, 1)
eye.CanQuery = false
local w = Instance.new("WeldConstraint", owner.Character)
w.Part0 = head
w.Part1 = eye
task.wait()
local mesh = Instance.new("SpecialMesh" , eye)
mesh.MeshId = 'rbxassetid://9095577951'
mesh.TextureId = 'rbxassetid://9095648745'
mesh.Scale = Vector3.new(.1,.1,.1)
head.Anchored = false
head.CFrame = oldcf
pcall(function()
owner.Character.Head.face:Destroy()
end)
local allpurpose = Instance.new("Sound", game:GetService("VRService"))
allpurpose.EmitterSize = 10
allpurpose.SoundId = 'rbxassetid://7223640465'
allpurpose.Volume = 1.5
allpurpose.PlayOnRemove = true
local detonate = false
local sbcount = 0
local bombs = Instance.new("Folder", script)
bombs.Name = "Bombs"
local grenade = Instance.new("SpawnLocation")
grenade.Enabled = false
grenade.Size = Vector3.new(6.499, 6.499, 12.576)/12
grenade.Name = "Grenade"
local msh = Instance.new("SpecialMesh", grenade)
msh.MeshId = "rbxassetid://9092154686"
msh.TextureId = "rbxassetid://" ..grenadetxt
msh.Scale = Vector3.new(1, 1, 1)/12
local a1, a2 = Instance.new("Attachment"), Instance.new("Attachment")
a1.Parent = grenade 
a1.Position = Vector3.new(-.1,-.1,0)
a2.Parent = grenade
a2.Position = Vector3.new(.1,.1,0)
local t = Instance.new("Trail")
t.Parent = grenade
t.Attachment0 = a1
t.Attachment1 = a2
t.Color = ColorSequence.new(teamcolor)
t.WidthScale = NumberSequence.new(1,0)
t.Lifetime = .15
t.MinLength = 1
t.FaceCamera = true
local sb = Instance.new("SpawnLocation")
sb.Enabled = false
sb.Size = Vector3.new(6.499, 6.499, 12.576)/8
sb.Name = "Sticky Bomb"
local msh = Instance.new("SpecialMesh", sb)
msh.MeshId = "rbxassetid://7081280271"
msh.TextureId = "rbxassetid://" ..stickybombtxt
msh.Scale = Vector3.new(1, 1, 1)/8
local a1, a2 = Instance.new("Attachment"), Instance.new("Attachment")
a1.Parent = sb 
a1.Position = Vector3.new(-.5, -.5, 0)
a2.Parent = sb
a2.Position = Vector3.new(.5,.5,0)
local t = Instance.new("Trail")
t.Parent = sb
t.Attachment0 = a1
t.Attachment1 = a2
t.Color = ColorSequence.new(teamcolor)
t.WidthScale = NumberSequence.new(1,0)
t.Lifetime = .15
t.MinLength = 1
t.FaceCamera = true
local function HasHumanoid(p)
if p:FindFirstAncestorOfClass("Model", true) and p:FindFirstAncestorOfClass("Model", true):FindFirstChildOfClass("Humanoid") then
return p:FindFirstAncestorOfClass("Model", true):FindFirstChildOfClass("Humanoid")
else
return false
end
end
local function GetMass(model)
local mass = 0
for _, v in pairs(model:GetDescendants()) do
if v:IsA("BasePart") then
mass += v:GetMass()
end
end
return mass
end
local function Fire(cf, vel, what)
local bomb = what:Clone()
bomb.Parent = bombs
bomb.CFrame = cf
bomb.Velocity = vel
if what ~= sb then
game:GetService("Debris"):AddItem(bomb, 10)
end
if what == grenade then
local EOT = true
local hithums = {}
coroutine.wrap(function()
while task.wait() and bomb do
local params = OverlapParams.new()
params.FilterDescendantsInstances = {owner.Character, script}
params.FilterType = Enum.RaycastFilterType.Blacklist
for _, v in pairs(workspace:GetPartBoundsInBox(bomb.CFrame, bomb.Size * 1.15, params)) do
if HasHumanoid(v) and EOT == true then
EOT = false
local exp = Instance.new("Explosion", script)
exp.Position = bomb.Position
exp.BlastRadius = 10
exp.BlastPressure = 5
exp.DestroyJointRadiusPercent = 0
exp.ExplosionType = "CratersAndDebris"
allpurpose.SoundId = 'rbxassetid://290576683'
allpurpose.Parent = bomb
allpurpose.Parent = nil
exp.Hit:Connect(function(hit)
local hum = HasHumanoid(hit)
if hum and not table.find(hithums, hum) then
if hum.Parent ~= owner.Character then
hum.Health -= 35
else
hum.Health -= math.random(13.3, 25.55)
end
table.insert(hithums, hum)
local tors = hum.Parent:FindFirstChild("HumanoidRootPart") or hum.Parent:FindFirstChild("Torso")
local look = CFrame.new(tors.Position, exp.Position)
local bv = Instance.new("BodyVelocity", tors)
bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
bv.Velocity = (-(look.lookVector) * 75) + Vector3.new(0, 75, 0)
game:GetService("Debris"):AddItem(bv, .05)
coroutine.wrap(function()
task.wait(.75)
for i, v in pairs(hithums) do
if v == hum then
table.remove(hithums, i)
break
end
end
end)()
end
end)
elseif not HasHumanoid(v) and v:IsDescendantOf(script) == false and v:IsDescendantOf(owner.Character) == false and EOT == true then
EOT = false
task.wait(2.3)
local exp = Instance.new("Explosion", script)
exp.Position = bomb.Position
exp.BlastRadius = 10
exp.BlastPressure = 5
exp.DestroyJointRadiusPercent = 0
exp.ExplosionType = "CratersAndDebris"
allpurpose.SoundId = 'rbxassetid://290576683'
allpurpose.Parent = bomb
allpurpose.Parent = nil
exp.Hit:Connect(function(hit)
local hum = HasHumanoid(hit)
if hum and not table.find(hithums, hum) then
table.insert(hithums, hum)
if hum.Parent ~= owner.Character then
hum.Health -= 35
else
hum.Health -= math.random(13.3, 25.55)
end
local tors = hum.Parent:FindFirstChild("HumanoidRootPart") or hum.Parent:FindFirstChild("Torso")
local look = CFrame.new(tors.Position, exp.Position)
local bv = Instance.new("BodyVelocity", tors)
bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
bv.Velocity = (-(look.lookVector) * 75) + Vector3.new(0, 75, 0)
game:GetService("Debris"):AddItem(bv, .05)
coroutine.wrap(function()
task.wait(.75)
for i, v in pairs(hithums) do
if v == hum then
table.remove(hithums, i)
break
end
end
end)()
end
end)
bomb:Destroy()
end
end
end
end)()
end
if what == sb then
sbcount += 1
print("SB Count: " ..sbcount)
local hithums = {}
local stuck = false
coroutine.wrap(function()
while task.wait() and bomb do
local params = OverlapParams.new()
params.FilterDescendantsInstances = {owner.Character, script}
params.FilterType = Enum.RaycastFilterType.Blacklist
for _, v in pairs(workspace:GetPartBoundsInBox(bomb.CFrame, bomb.Size * 1.15, params)) do
if not HasHumanoid(v) and v:IsDescendantOf(script) == false and v:IsDescendantOf(owner.Character) == false and stuck == false then
stuck = true
bomb.Anchored = true
local wc = Instance.new("WeldConstraint", bomb)
wc.Part0 = bomb
wc.Part1 = v
bomb.Anchored = false
if sbcount > 8 then
task.wait(.5)
else
repeat task.wait() until detonate == true
end
allpurpose.SoundId = 'rbxassetid://290576683'
allpurpose.Parent = bomb
allpurpose.Parent = nil
local exp = Instance.new("Explosion", script)
exp.Position = bomb.Position
exp.BlastRadius = 10
exp.BlastPressure = 5
exp.DestroyJointRadiusPercent = 0
exp.ExplosionType = "CratersAndDebris"
sbcount -= 1
print("SB Count: " ..sbcount)
exp.Hit:Connect(function(hit, dist)
local hum = HasHumanoid(hit)
if hum and not table.find(hithums, hum) then
table.insert(hithums, hum)
if hum.Parent ~= owner.Character then
hum.Health -= (50 - dist)
else
hum.Health -= (25 - dist)
end
local tors = hum.Parent:FindFirstChild("HumanoidRootPart") or hum.Parent:FindFirstChild("Torso")
local look = CFrame.new(tors.Position, exp.Position)
local bv = Instance.new("BodyVelocity", tors)
bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
bv.Velocity = (-(look.lookVector) * 75) + Vector3.new(0, 75, 0)
game:GetService("Debris"):AddItem(bv, .05)
coroutine.wrap(function()
task.wait(.75)
for i, v in pairs(hithums) do
if v == hum then
table.remove(hithums, i)
break
end
end
end)()
end
end)
bomb:Destroy()
end
end
end
end)()
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
local mult = 10
local gl = Instance.new("SpawnLocation", script)
gl.Enabled = false
gl.Name = "Grenade Launcher"
gl.CanCollide = false
gl.Size = Vector3.new(14.217, 22.099, 47.294)/mult
gl.Position = Vector3.new(9.684, -5.591, -33.81)/mult
local msh = Instance.new("SpecialMesh", gl)
msh.MeshId = "rbxassetid://9092146635"
msh.TextureId = "rbxassetid://9092146799"
msh.Scale = Vector3.new(1, 1, 1)/mult
local vm = Instance.new("Model", script)
vm.Name = "ViewModels"
local hands = Instance.new("SpawnLocation", vm)
hands.Enabled = false
hands.Name = "GLHands"
hands.CanCollide = false
hands.Size = Vector3.new(16.845, 12.258, 32.533)/mult
hands.Position = Vector3.new(11.32, -13.185, -33.422)/mult
local msh = Instance.new("SpecialMesh", hands)
msh.MeshId = "rbxassetid://9092140916"
msh.TextureId = "rbxassetid://9092141060"
msh.Scale = Vector3.new(1, 1, 1)/mult
local arms = Instance.new("SpawnLocation", vm)
arms.Enabled = false
arms.Name = "GLArms"
arms.CanCollide = false
arms.Size = Vector3.new(24.787, 24.227, 48.65)/mult
arms.Position = Vector3.new(12.332, -14.063, -21.128)/mult
local msh = Instance.new("SpecialMesh", arms)
msh.MeshId = "rbxassetid://9092134300"
msh.TextureId = "rbxassetid://" ..teamtextureid
msh.Scale = Vector3.new(1, 1, 1)/mult
local sbl = Instance.new("SpawnLocation", script)
sbl.Enabled = false
sbl.Name = "Stickybomb Launcher"
sbl.CanCollide = false
sbl.Size = Vector3.new(14.315, 18.503, 29.699)/mult
sbl.Position = Vector3.new(12.242, -9.012, -36.877)/mult
local msh = Instance.new("SpecialMesh", sbl)
msh.MeshId = "rbxassetid://9092180309"
msh.TextureId = "rbxassetid://9092180502"
msh.Scale = Vector3.new(1, 1, 1)/mult
local hands2 = Instance.new("SpawnLocation", vm)
hands2.Enabled = false
hands2.Name = "SBLHand"
hands2.CanCollide = false
hands2.Size = Vector3.new(7.514, 8.667, 12.038)/mult
hands2.Position = Vector3.new(13.745, -13.558, -25.432)/mult
local msh = Instance.new("SpecialMesh", hands2)
msh.MeshId = "rbxassetid://9092170846"
msh.TextureId = "rbxassetid://9092141060"
msh.Scale = Vector3.new(1, 1, 1)/mult
local arms2 = Instance.new("SpawnLocation", vm)
arms2.Enabled = false
arms2.Name = "SBLArm"
arms2.CanCollide = false
arms2.Size = Vector3.new(8.707, 14.71, 25.138)/mult
arms2.Position = Vector3.new(13.866, -8.927, -9.316)/mult
local msh = Instance.new("SpecialMesh", arms2)
msh.MeshId = "rbxassetid://9092166513"
msh.TextureId = "rbxassetid://" ..teamtextureid
msh.Scale = Vector3.new(1, 1, 1)/mult
local bottle = Instance.new("SpawnLocation", script)
bottle.Enabled = false
bottle.Name = "Bottle"
bottle.CanCollide = false
bottle.Size = Vector3.new(10.274, 14.034, 13.922)/mult
bottle.Position = Vector3.new(10.98, 3.836, -27.926)/mult
local msh = Instance.new("SpecialMesh", bottle)
msh.MeshId = "rbxassetid://9103442575"
msh.TextureId = "rbxassetid://9103442727"
msh.Scale = Vector3.new(1, 1, 1)/mult
local bottle2 = Instance.new("SpawnLocation", script)
bottle2.Enabled = false
bottle2.Name = "Broken Bottle"
bottle2.CanCollide = false
bottle2.Size = Vector3.new(8.165, 10.816, 12.365)/mult
bottle2.Position = Vector3.new(9.917, 2.22, -28.711)/mult
bottle2.Transparency = 1
local msh = Instance.new("SpecialMesh", bottle2)
msh.MeshId = "rbxassetid://9103445501"
msh.TextureId = "rbxassetid://9103445714"
msh.Scale = Vector3.new(1, 1, 1)/mult
local hands3 = Instance.new("SpawnLocation", vm)
hands3.Enabled = false
hands3.Name = "BottleHand"
hands3.CanCollide = false
hands3.Size = Vector3.new(8.661, 9.68, 8.253)/mult
hands3.Position = Vector3.new(10.168, -1.054, -31.993)/mult
local msh = Instance.new("SpecialMesh", hands3)
msh.MeshId = "rbxassetid://9103432075"
msh.TextureId = "rbxassetid://9092141060"
msh.Scale = Vector3.new(1, 1, 1)/mult
local arms3 = Instance.new("SpawnLocation", vm)
arms3.Enabled = false
arms3.Name = "BottleArm"
arms3.CanCollide = false
arms3.Size = Vector3.new(8.825, 18.368, 23.636)/mult
arms3.Position = Vector3.new(13.992, -10.779, -23.032)/mult
local msh = Instance.new("SpecialMesh", arms3)
msh.MeshId = "rbxassetid://9103428445"
msh.TextureId = "rbxassetid://" ..teamtextureid
msh.Scale = Vector3.new(1, 1, 1)/mult
local la = Instance.new("SpawnLocation", script)
la.Enabled = false
la.Name = "LeftArm"
la.CanCollide = false
la.Size = Vector3.new(14.962, 35.014, 19.292)/mult
local msh = Instance.new("SpecialMesh", la)
msh.MeshId = "rbxassetid://9095607359"
msh.TextureId = "rbxassetid://" ..teamtextureid
msh.Scale = Vector3.new(1, 1, 1)/mult
local wc = Instance.new("Weld", script)
wc.Part0 = la
wc.Part1 = owner.Character.HumanoidRootPart
if owner.Character.Head:IsA("MeshPart") then
wc.C0 = CFrame.new(1.5, -2.35, -.35)
elseif owner.Character.Head:IsA("BasePart") and not owner.Character.Head:IsA("MeshPart") then
wc.C0 = CFrame.new(1.5, -2.35, -.35)
end
local wc = Instance.new("WeldConstraint", bottle)
wc.Part0 = bottle
wc.Part1 = bottle2
local wc = Instance.new("WeldConstraint", arms3)
wc.Part0 = arms3
wc.Part1 = hands3
local wc = Instance.new("WeldConstraint", bottle)
wc.Part0 = bottle
wc.Part1 = hands3
local wc = Instance.new("WeldConstraint", arms2)
wc.Part0 = arms2
wc.Part1 = hands2
local wc = Instance.new("WeldConstraint", sbl)
wc.Part0 = sbl
wc.Part1 = hands2
local wc = Instance.new("WeldConstraint", arms)
wc.Part0 = arms
wc.Part1 = hands
local wc = Instance.new("WeldConstraint", gl)
wc.Part0 = gl
wc.Part1 = hands
local w = Instance.new("Weld", script)
w.Part0 = gl
w.Part1 = owner.Character.HumanoidRootPart
local w2 = Instance.new("Weld", script)
w2.Part0 = sbl
w2.Part1 = owner.Character.HumanoidRootPart
local w3 = Instance.new("Weld", script)
w3.Part0 = bottle
w3.Part1 = owner.Character.HumanoidRootPart
local val = Instance.new("ObjectValue", owner.Character)
val.Name = "b"
val.Value = gl
local wc = SPRING.create()
local sway = SPRING.create()
local bobspeed = 1
local bobmod = .1
local alpha = .25
local hitcf = CFrame.new()
local function gb(addition, speed, modifier)
return math.sin(tick() * addition * speed) * modifier
end
local function chatfunc(text)
local chat = coroutine.wrap(function()
if owner.Character.Head:FindFirstChild("TalkingBillBoard")~= nil then
owner.Character.Head:FindFirstChild("TalkingBillBoard"):Destroy()
end
local naeeym2 = Instance.new("BillboardGui", owner.Character.Head)
naeeym2.Size = UDim2.new(50, 0, 50, 0)
naeeym2.StudsOffset = Vector3.new(0, -5, 0)
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
local swinging = false
local swingcfs = {CFrame.new(-.5, -2.5, -3) * CFrame.Angles(math.rad(-90), math.rad(150), 0), CFrame.new(-.5, -2.5, -3) * CFrame.Angles(math.rad(-90), 0, 0), CFrame.new(-.5, -2, -3) * CFrame.Angles(math.rad(-90), math.rad(180), 0)}
local swings = {7025242231, 6230941447}
local alph = .1
coroutine.wrap(function()
while task.wait() do
if bottle.Transparency == 0 or bottle2.Transparency == 0 then
hitcf = hitcf:Lerp(CFrame.Angles(0, 0, 0), alph)
else
hitcf = hitcf:Lerp(CFrame.Angles(0, 0, 0), .5)
end
end
end)()
local quote = Instance.new("Sound", owner.Character.Head)
quote.SoundId = 'rbxassetid://1'
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
sbl.Transparency = 1
arms2.Transparency = 1
hands2.Transparency = 1
la.Transparency = 1
bottle.Transparency = 1
bottle2.Transparency = 1
arms3.Transparency = 1
hands3.Transparency = 1
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
w2.C1 = w2.C1:Lerp(c1, alpha) * hitcf
w2.C1 = w2.C1:Lerp(c1 * CFrame.new(wcs.x / 2, wcs.y / 2,0), .25)
w2.C1 *= CFrame.Angles(0,-sw.x, sw.y)
w2.C1 = w2.C1:Lerp(w2.C1 * CFrame.Angles(0, wcs.y, wcs.x), .25)
w3.C1 = w3.C1:Lerp(c1, alpha) * hitcf
w3.C1 = w3.C1:Lerp(c1 * CFrame.new(wcs.x / 2, wcs.y / 2,0), .25)
w3.C1 *= CFrame.Angles(0,-sw.x, sw.y)
w3.C1 = w3.C1:Lerp(w3.C1 * CFrame.Angles(0, wcs.y, wcs.x), .25)
elseif mode == "d" then
owner.CameraMaxZoomDistance = oldzoom
script.Disabled = true
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
elseif mode == "grenades" then
allpurpose.SoundId = 'rbxassetid://7240670247'
allpurpose.Parent = gl
allpurpose.Parent = nil
Fire(gl.CFrame, ((cam * CFrame.Angles(math.rad(3), 0, 0)).lookVector * 89.224 * 1.5), grenade)
hitcf = CFrame.new(0, -.5, 1.25) * CFrame.Angles(math.rad(15), 0, 0)
elseif mode == "stickies" then
allpurpose.SoundId = 'rbxassetid://7240670247'
allpurpose.Parent = sbl
allpurpose.Parent = nil
Fire(sbl.CFrame, ((cam * CFrame.Angles(math.rad(3), 0, 0)).lookVector * 59.800625 * 2.25), sb)
hitcf = CFrame.new(0, -.5, 1.25) * CFrame.Angles(math.rad(15), 0, 0)
elseif mode == "detonate" then
detonate = true
task.wait(.05)
detonate = false
elseif mode == "kaboom!" then
w.C1 = CFrame.new(-2, -1, 0)
gl.Transparency = 0
arms.Transparency = 0
hands.Transparency = 0
sbl.Transparency = 1
arms2.Transparency = 1
hands2.Transparency = 1
la.Transparency = 1
bottle.Transparency = 1
bottle2.Transparency = 1
arms3.Transparency = 1
hands3.Transparency = 1
elseif mode == "ye appear to 'ave trodden on a mine!" then
w2.C1 = CFrame.new(-2, -1, 0)
gl.Transparency = 1
arms.Transparency = 1
hands.Transparency = 1
sbl.Transparency = 0
arms2.Transparency = 0
hands2.Transparency = 0
la.Transparency = 0
bottle.Transparency = 1
bottle2.Transparency = 1
arms3.Transparency = 1
hands3.Transparency = 1
elseif mode == "bottle of scrumpy" then
w3.C1 = CFrame.new(-2, -1, 0)
gl.Transparency = 1
arms.Transparency = 1
hands.Transparency = 1
sbl.Transparency = 1
arms2.Transparency = 1
hands2.Transparency = 1
la.Transparency = 0
bottle.Transparency = 0
bottle2.Transparency = 1
arms3.Transparency = 0
hands3.Transparency = 0
elseif mode == "swing" then
local q = math.random(1, #swingcfs)
allpurpose.SoundId = 'rbxassetid://' ..swings[math.random(1, #swings)]
allpurpose.Parent = bottle
allpurpose.Parent = nil
if q == 3 or q == 4 then
alph = .1
else
alph = .5
end
hitcf = swingcfs[q]
swinging = true
task.wait(.35)
swinging = false
end
end)
local sdb = false
coroutine.wrap(function()
while task.wait() do
for i, hit in pairs(workspace:GetPartBoundsInBox(bottle.CFrame, bottle.Size*1.15)) do
if hit:IsDescendantOf(owner.Character) == false and hit:IsDescendantOf(script) == false and HasHumanoid(hit) and sdb == false and swinging == true then
local h = HasHumanoid(hit)
if not h:GetAttribute(team) then
sdb = true
allpurpose.SoundId = 'rbxassetid://7350477734'
allpurpose.Parent = bottle
allpurpose.Parent = nil
if math.random(1, 8) == 1 then
if bottle2.Transparency == 1 then
allpurpose.SoundId = 'rbxassetid://2978605361'
allpurpose.Parent = bottle
allpurpose.Parent = nil
end
bottle2.Transparency = 0
bottle.Transparency = 1
h.Health -= math.random(45, 65)
else
h.Health -= math.random(20, 30)
end
task.wait(.35)
sdb = false
end
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
local offset = CFrame.new(1.5, -1, -3.35)
local offset2 = CFrame.new(1, -1.5, -3.25)
local offset3 = CFrame.new(1, .65, -2)
local whichoffset = offset
local aimoffset, delta = owner.Character.HumanoidRootPart.CFrame:ToObjectSpace(owner.Character.Head.CFrame * whichoffset), UIS:GetMouseDelta()
local weapon = "Grenade Launcher"
local mode = "grenades"
local cool = .6
local candetonate = false
m.Button1Down:Connect(function()
if cd then return end
cd = true
re:FireServer(mode, aimoffset, delta, deltat, c.CFrame)
if mode == "stickies" then
candetonate = false
coroutine.wrap(function()
task.wait(.7)
candetonate = true
end)()
end
task.wait(cool)
cd = false
end)
m.KeyDown:Connect(function(k)
if k == 'g' then
re:FireServer("d", aimoffset, delta, deltat, c.CFrame)
script:Destroy()
elseif k == 'n' then
re:FireServer("n", aimoffset, delta, deltat, c.CFrame)
elseif k == 'f' and candetonate == true then
candetonate = false
re:FireServer("detonate", aimoffset, delta, deltat, c.CFrame)
elseif k == '1' and (weapon == "Stickybomb Launcher" or weapon == "Bottle") then
re:FireServer("kaboom!", aimoffset, delta, deltat, c.CFrame)
weapon = "Grenade Launcher"
mode = "grenades"
cool = .6
whichoffset = offset
elseif k == '2' and (weapon == "Grenade Launcher" or weapon == "Bottle") then
re:FireServer("ye appear to 'ave trodden on a mine!", aimoffset, delta, deltat, c.CFrame)
weapon = "Stickybomb Launcher"
mode = "stickies"
cool = .6
whichoffset = offset2
elseif k == '3' and (weapon == "Grenade Launcher" or weapon == "Stickybomb Launcher") then
re:FireServer("bottle of scrumpy", aimoffset, delta, deltat, c.CFrame)
weapon = "Bottle"
mode = "swing"
cool = .8
whichoffset = offset3
end
end)
local function SetCharacterLocalTransparency(transparency)
for i,v in pairs(owner.Character:GetDescendants()) do
if v:IsA("BasePart") and v.Name ~= "Head" and v.Name ~= "fakehead" and v.Parent.Name ~= "fakehead" and v.Name ~= "headset" then
v.LocalTransparencyModifier = 0
end
end
end
if owner.Character.Head:IsA("MeshPart") then
owner.Character.Humanoid.CameraOffset = Vector3.new(0, 3, -1)
elseif owner.Character.Head:IsA("BasePart") and not owner.Character.Head:IsA("MeshPart") then
owner.Character.Humanoid.CameraOffset = Vector3.new(0, 3, -.8)
end
game:GetService("RunService").Heartbeat:Connect(function(dt)
pcall(function()
deltat = dt
SetCharacterLocalTransparency(0)
aimoffset, delta = owner.Character.HumanoidRootPart.CFrame:ToObjectSpace(owner.Character.Head.CFrame * whichoffset), UIS:GetMouseDelta()
re:FireServer("aim", aimoffset, delta, dt, c.CFrame)
end)
end)
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
local fake1 = gl:Clone()
fake1.Parent = bo
local fake2 = hands:Clone()
fake2.Parent = bo
local fake3 = arms:Clone()
fake3.Parent = bo
local fake4 = sbl:Clone()
fake4.Parent = bo
local fake5 = hands2:Clone()
fake5.Parent = bo
local fake55 = arms2:Clone()
fake55.Parent = bo
local fake6 =  bottle:Clone()
fake6.Parent = bo
local fake65 =  bottle2:Clone()
fake65.Parent = bo 
local fake7 = hands3:Clone()
fake7.Parent = bo
local fake8 = arms3:Clone()
fake8.Parent = bo
local fake9 = la:Clone()
fake9.Parent = bo
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
fake1.CFrame = gl.CFrame
fake2.CFrame = hands.CFrame
fake3.CFrame = arms.CFrame
fake4.CFrame = sbl.CFrame
fake5.CFrame = hands2.CFrame
fake55.CFrame = arms2.CFrame
fake6.CFrame = bottle.CFrame
fake65.CFrame = bottle2.CFrame
fake7.CFrame = hands3.CFrame
fake8.CFrame = arms3.CFrame
fake9.CFrame = la.CFrame
fake1.Transparency = gl.Transparency
fake2.Transparency = hands.Transparency
fake3.Transparency = arms.Transparency
fake4.Transparency = sbl.Transparency
fake5.Transparency = hands2.Transparency
fake55.Transparency = arms2.Transparency
fake6.Transparency = bottle.Transparency
fake65.Transparency = bottle2.Transparency
fake7.Transparency = hands3.Transparency
fake8.Transparency = arms3.Transparency
fake9.Transparency = la.Transparency
c.CFrame = CFrame.new(re.HumanoidRootPart.Position) * CFrame.new(0, 2, -5) * CFrame.Angles(0,math.rad(180),0)
re.HumanoidRootPart.CFrame = owner.Character.HumanoidRootPart.CFrame -- CFrame.Angles(owner.Character.HumanoidRootPart.CFrame:ToEulerAnglesXYZ())
for i, v in pairs(owner.Character:GetChildren()) do
if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
re[v.Name].bodw.C0 = owner.Character.HumanoidRootPart.CFrame:Inverse() * v.CFrame
end
end
end
