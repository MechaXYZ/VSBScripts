local quoteids = {5589196168, 6544927564, 6083193447, 993905304, 5659911488, 998679945, 993908890, 993907407}
local quotes = {"Oops! That was not medicine.", "Medic gaming!", "Hahahahahahaha!", "Gesundheit!", "Hahahahaha! Hohohohaha!", "Horrido!", "Raus, raus!", "Forward!"}
local teamtextureid = 1
local teamhandtexture = 1
local medipacktexture = 1
local mediguntexture = 1
local sgtexture = 1
local syringetexture = 1
local crossid = 1
local teamcolor = Color3.new(1, 1, 1)
local team = "ROBLOX"
print([[
funni medic script by mech 
say "red" or "blu" for teams
will give controls when you pick a team (pick red!1!)
]])
local con = owner.Chatted:Connect(function(msg)
if msg == 'red' then
teamtextureid = 9032998392
teamhandtexture = 9029967023
medipacktexture = 9032989352
mediguntexture = 9021800315
sgtexture = 9033220191
syringetexture = 9034162682
crossid = 22583542
teamcolor = Color3.new(1, 0, 0)
team = "RED"
owner.Character.Humanoid:SetAttribute(team, 1)
elseif msg == 'blu' then
teamtextureid = 9033225386
teamhandtexture = 9033538808
medipacktexture = 9033461092
mediguntexture = 9029971838
sgtexture = 9033221490
syringetexture = 9034128131
crossid = 9034432341
teamcolor = Color3.new(0, 0, 1)
team = "BLU"
owner.Character.Humanoid:SetAttribute(team, 1)
end
end)
repeat task.wait() until teamtextureid ~= 1
con:Disconnect()
owner.Character.Humanoid.MaxHealth = 150
print([[
ok here are the controls
1, 2, and 3 - switch between scary syringe medicine gun, medigun (no übercharge because lazy) , and bonesaw
click - use your weapon
n - taunt
g - stop the script (will go back to third person so use it before you g/no.)
]])
if team == "BLU" then
print("aw you didn't pick red :(")
end
for i = 1, 20 do
task.wait()
owner.Character.Humanoid.Health += 2.5
end
local ws = 16 + (16/7)
owner.Character.Humanoid.WalkSpeed = ws
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
w.C1 = CFrame.new(0, .5, 0)
local mesh = Instance.new("SpecialMesh", tors)
mesh.MeshId = 'rbxassetid://9032985969'
mesh.TextureId = 'rbxassetid://' ..teamtextureid
mesh.Scale = Vector3.new(.13,.13,.13)
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
mesh.MeshId = 'rbxassetid://9032985969'
mesh.TextureId = 'rbxassetid://' ..teamtextureid
mesh.Scale = Vector3.new(.13,.13,.13)
mesh.Offset = Vector3.new(0, .5, .5)
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
local medipack = Instance.new("SpawnLocation", owner.Character)
medipack.Enabled = false
medipack.Name = "Medipack"
medipack.CanCollide = false
medipack.Size = Vector3.new(21.868, 24.769, 8.185)/8
local msh = Instance.new("SpecialMesh", medipack)
msh.MeshId = "rbxassetid://9032989020"
msh.TextureId = "rbxassetid://" ..medipacktexture
msh.Scale = Vector3.new(1, 1, 1)/8
local w = Instance.new("Weld", owner.Character)
w.Part0 = medipack
w.Part1 = owner.Character.HumanoidRootPart
w.C1 = CFrame.new(0, 2.5, 1.25)
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
w.C1 = CFrame.new(0, .3, 0)
w2.Part0 = rl
w2.Part1 = owner.Character.RightLowerLeg
w2.C1 = CFrame.new(0, .3, 0)
end
local mesh = Instance.new("SpecialMesh", ll)
mesh.MeshId = 'rbxassetid://9032993690'
mesh.TextureId = 'rbxassetid://' ..teamtextureid
mesh.Scale = Vector3.new(.1,.1,.1)
mesh.Offset = Vector3.new(.1, 1.2, .25)
local mesh = Instance.new("SpecialMesh", rl)
mesh.MeshId = 'rbxassetid://9032997864'
mesh.TextureId = 'rbxassetid://' ..teamtextureid
mesh.Scale = Vector3.new(.1,.1,.1)
mesh.Offset = Vector3.new(-.1, 1.2, .25)
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
owner.Character.Head.Neck.C0 *= CFrame.new(0, 2.5, 0)
else
owner.Character.Torso.Neck.C0 *= CFrame.new(0, 0, 2.5)
end
local oldcf = head.CFrame
head.Anchored = true
head.CFrame = CFrame.new()
head.Position = Vector3.new(0, 77.324, -1.59)/10
local mesh = Instance.new("SpecialMesh" , head)
mesh.MeshId = 'rbxassetid://9033661109'
mesh.TextureId = 'rbxassetid://9033661254'
mesh.Scale = Vector3.new(.1,.1,.1)
if head.Name == "fakehead" then
mesh.Offset = Vector3.new(0, -7.5, 0)
end
local eyes = Instance.new("SpawnLocation", head)
eyes.CanCollide = false
eyes.Size = Vector3.new(3.01, 0.525, 0.402)/10
eyes.CanTouch = false
eyes.Enabled = false
eyes.CanQuery = false
eyes.Name = "eyes"
eyes.Position = Vector3.new(0, 78.949, -4.191)/10
local w = Instance.new("WeldConstraint", owner.Character)
w.Part0 = head
w.Part1 = eyes
local mesh = Instance.new("SpecialMesh" , eyes)
mesh.MeshId = 'rbxassetid://9033207551'
mesh.TextureId = 'rbxassetid://9033745786'
mesh.Scale = Vector3.new(.1, .1, .1)
if head.Name == "fakehead" then
mesh.Offset = Vector3.new(0, -7.5, 0)
end
local glasses = Instance.new("SpawnLocation", owner.Character)
glasses.CanCollide = false
glasses.Size = Vector3.new(6.311, 1.936, 6.63)/10
glasses.CanTouch = false
glasses.Enabled = false
glasses.CanQuery = false
glasses.Name = "glasses"
glasses.Position = Vector3.new(0, 78.612, -2.149)/10
local mesh = Instance.new("SpecialMesh", glasses)
mesh.MeshId = 'rbxassetid://9032973545'
mesh.TextureId = 'rbxassetid://9032974335'
mesh.Scale = Vector3.new(.1,.1,.1)
if head.Name == "fakehead" then
mesh.Offset = Vector3.new(0, -7.5, 0)
end
local w = Instance.new("WeldConstraint", owner.Character)
w.Part0 = head
w.Part1 = glasses
head.CFrame = oldcf
head.Anchored = false
pcall(function()
owner.Character.Head.face:Destroy()
end)
local DEBUG = false
local PIERCE = false
local BULLET_SPEED = 1000
local BULLET_MAXDIST = 1250
local BULLET_GRAVITY = Vector3.new(0, -workspace.Gravity, 0)
local BULLET_SPREAD = 0
local http = game:GetService("HttpService")
local f = http:GetAsync("https://raw.githubusercontent.com/MechaXYZ/VSBScripts/main/FastCast%20Module")
local FastCast = loadstring(f)()
local caster = FastCast.new()
local CastParams = RaycastParams.new()
CastParams.IgnoreWater = true
CastParams.FilterType = Enum.RaycastFilterType.Blacklist
CastParams.FilterDescendantsInstances = {owner.Character}
-- FastCast.DebugLogging = DEBUG
FastCast.VisualizeCasts = DEBUG
local syringes = Instance.new("Folder", script)
syringes.Name = "Syringes"
local syringe = Instance.new("SpawnLocation")
syringe.Enabled = false
syringe.Size = Vector3.new(.145, .1543, .9156)
syringe.Anchored = true
syringe.CanCollide = false
syringe.Name = "Syringe"
syringe.Parent = syringes
local msh = Instance.new("SpecialMesh", syringe)
msh.MeshId = "rbxassetid://9034162604"
msh.TextureId = "rbxassetid://" ..syringetexture
msh.Scale = Vector3.new(.1, .1, .1)
local a1, a2 = Instance.new("Attachment"), Instance.new("Attachment")
a1.Parent = syringe 
a1.Position = Vector3.new(-.0725,-.07715,0)
a2.Parent = syringe
a2.Position = Vector3.new(.0725, .07715,0)
local t = Instance.new("Trail")
t.Parent = syringe
t.Attachment0 = a1
t.Attachment1 = a2
t.Color = ColorSequence.new(teamcolor)
t.WidthScale = NumberSequence.new(1, 0)
t.Lifetime = .2
t.Brightness = 2
t.FaceCamera = true
function CanRayPierce(cast)
if (cast.UserData.Hits == nil) then
cast.UserData.Hits = 1
else
cast.UserData.Hits += 1
end
if (cast.UserData.Hits > 3) then
return false
end
return true
end
local CastBehavior = FastCast.newBehavior()
CastBehavior.RaycastParams = CastParams
CastBehavior.MaxDistance = BULLET_MAXDIST
CastBehavior.HighFidelityBehavior = FastCast.HighFidelityBehavior.Default
CastBehavior.Acceleration = BULLET_GRAVITY
CastBehavior.AutoIgnoreContainer = true
CastBehavior.CosmeticBulletContainer = syringes
CastBehavior.CosmeticBulletTemplate = syringe
local function Reflect(surfaceNormal, bulletNormal)
return bulletNormal - (2 * bulletNormal:Dot(surfaceNormal) * surfaceNormal)
end
local function HasHumanoid(p)
if p:FindFirstAncestorOfClass("Model", true) and p:FindFirstAncestorOfClass("Model", true):FindFirstChildOfClass("Humanoid") then
return p:FindFirstAncestorOfClass("Model", true):FindFirstChildOfClass("Humanoid")
else
return false
end
end
function OnRayHit(cast, raycastResult, segmentVelocity, cosmeticBulletObject)
cosmeticBulletObject.Anchored = true
local hitPart = raycastResult.Instance
local hitPoint = raycastResult.Position
local normal = raycastResult.Normal
if hitPart ~= nil and hitPart.Parent ~= nil and HasHumanoid(hitPart) then 
if not HasHumanoid(hitPart):GetAttribute(team) then
HasHumanoid(hitPart).Health -= math.random(12, 23)
local w = Instance.new("WeldConstraint", hitPart)
w.Part0 = cosmeticBulletObject
w.Part1 = hitPart
end
end
end
function OnRayPierced(cast, raycastResult, segmentVelocity, cosmeticBulletObject)
local position = raycastResult.Position
local normal = raycastResult.Normal	
local newNormal = Reflect(normal, segmentVelocity.Unit)
cast:SetVelocity(newNormal * segmentVelocity.Magnitude)	
cast:SetPosition(position)
end
function OnRayUpdated(cast, segmentOrigin, segmentDirection, length, segmentVelocity, cosmeticBulletObject)
if cosmeticBulletObject == nil then return end
local bulletLength = cosmeticBulletObject.Size.Z / 2
local baseCFrame = CFrame.new(segmentOrigin, segmentOrigin + segmentDirection)
cosmeticBulletObject.CFrame = baseCFrame * CFrame.new(0, 0, -(length - bulletLength))
end
function OnRayTerminated(cast) 
local bullet = cast.RayInfo.CosmeticBulletObject
bullet.Trail.Enabled = false
end
caster.RayHit:Connect(OnRayHit)
caster.RayPierced:Connect(OnRayPierced)
caster.LengthChanged:Connect(OnRayUpdated)
caster.CastTerminating:Connect(OnRayTerminated)
local function Fire(pos, direction)
	local directionalCF = CFrame.new(Vector3.new(), direction)
	local direction = (directionalCF * CFrame.Angles(math.rad(math.random(-BULLET_SPREAD, BULLET_SPREAD)), math.rad(math.random(-BULLET_SPREAD, BULLET_SPREAD)), math.rad(math.random(-BULLET_SPREAD, BULLET_SPREAD)))).LookVector
	if PIERCE then
		CastBehavior.CanPierceFunction = CanRayPierce
	end
	local simBullet = caster:Fire(pos, direction, BULLET_SPEED, CastBehavior)
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
local checkcon = nil
local mult = 10
local medigun = Instance.new("SpawnLocation", script)
medigun.Enabled = false
medigun.Name = "Medi Gun"
medigun.Transparency = 1
medigun.CanCollide = false
medigun.Size = Vector3.new(12.815, 19.999, 35.064)/mult
medigun.Position = Vector3.new(14.321, -14.26, -50.355)/mult
local msh = Instance.new("SpecialMesh", medigun)
msh.MeshId = "rbxassetid://9029971538"
msh.TextureId = "rbxassetid://" ..mediguntexture
msh.Scale = Vector3.new(1, 1, 1)/mult
local beamstart = Instance.new("Attachment", medigun)
beamstart.CFrame = CFrame.new(-.25, .6, -1.65)
local beamend = Instance.new("Attachment", owner.Character.Head)
local healbeam = Instance.new("Beam", script)
healbeam.Attachment0 = beamstart
healbeam.Attachment1 = beamend
healbeam.Texture = 'rbxassetid://9030319981'
healbeam.Segments = 100
healbeam.FaceCamera = true
healbeam.Brightness = 1000
healbeam.Enabled = false
healbeam.Color = ColorSequence.new(teamcolor)
healbeam.Width0 = .75
healbeam.Width1 = .75
healbeam.TextureLength = .2
healbeam.TextureSpeed = 2
local healeffect = Instance.new("ParticleEmitter", beamend)
healeffect.Enabled = false
healeffect.Speed = NumberRange.new(5, 5)
healeffect.Texture = "rbxassetid://" ..crossid
healeffect.Size = NumberSequence.new(.35)
healeffect.Orientation = "FacingCamera"
healeffect.Transparency = NumberSequence.new(0, 1)
healeffect.EmissionDirection = "Top"
healeffect.Drag = 0
healeffect.Lifetime = NumberRange.new(2.25, 2.25)
healeffect.Rate = 5
healeffect.VelocitySpread = 0
healeffect.RotSpeed = NumberRange.new(3, 10)
healeffect.SpreadAngle = Vector2.new(5, 8)
local t = .5
local s = .25
coroutine.wrap(function()
while task.wait() do
game:GetService("TweenService"):Create(healbeam, TweenInfo.new(t), {CurveSize0 = -s}):Play()
game:GetService("TweenService"):Create(healbeam, TweenInfo.new(t), {CurveSize1 = -s}):Play()
task.wait(t)
game:GetService("TweenService"):Create(healbeam, TweenInfo.new(t), {CurveSize0 = s}):Play()
game:GetService("TweenService"):Create(healbeam, TweenInfo.new(t), {CurveSize1 = s}):Play()
task.wait(t)
end
end)()
local sg = Instance.new("SpawnLocation", script)
sg.Enabled = false
sg.Name = "Syringe Gun"
sg.CanCollide = false
sg.Size = Vector3.new(8.089, 20.604, 28.549)/mult
sg.Position = Vector3.new(9.684, -10.418, -42.064)/mult
local msh = Instance.new("SpecialMesh", sg)
msh.MeshId = "rbxassetid://9033203991"
msh.TextureId = "rbxassetid://" ..sgtexture
msh.Scale = Vector3.new(1, 1, 1)/mult
local at = Instance.new("Attachment", sg)
at.CFrame = CFrame.new(0, 0, -(sg.Size.Z/1.85))
local pe = Instance.new("ParticleEmitter")
pe.Enabled = false
pe.Name = "flash"
pe.Speed = NumberRange.new(0, 0)
pe.Color = ColorSequence.new(teamcolor)
pe.LightEmission = 0
pe.LightInfluence = 1
pe.Texture = "rbxassetid://386535299"
pe.Size = NumberSequence.new(.35)
pe.LockedToPart = true
pe.Orientation = "FacingCamera"
pe.EmissionDirection = "Front"
pe.Drag = 0
pe.Lifetime = NumberRange.new(.1, .1)
pe.Rate = 20
pe.SpreadAngle = Vector2.new(0, 0)
pe.VelocitySpread = 0
pe.RotSpeed = NumberRange.new(-360, 360)
pe.Rotation = NumberRange.new(-180, 180)
pe.Parent = nil
local vm = Instance.new("Model", script)
vm.Name = "ViewModel"
local hands = Instance.new("SpawnLocation", vm)
hands.Enabled = false
hands.Name = "MedigunHands"
hands.CanCollide = false
hands.Transparency = 1
hands.Size = Vector3.new(23.19, 19.934, 29.9)/mult
hands.Position = Vector3.new(12.536, -14.719, -37.591)/mult
local msh = Instance.new("SpecialMesh", hands)
msh.MeshId = "rbxassetid://9029966642"
msh.TextureId = "rbxassetid://" ..teamhandtexture
msh.Scale = Vector3.new(1, 1, 1)/mult
local arms = Instance.new("SpawnLocation", vm)
arms.Enabled = false
arms.Name = "MedigunArms"
arms.Transparency = 1
arms.CanCollide = false
arms.Size = Vector3.new(27.322, 20.193, 31.206)/mult
arms.Position = Vector3.new(13.058, -15.576, -26.924)/mult
local msh = Instance.new("SpecialMesh", arms)
msh.MeshId = "rbxassetid://9029954505"
msh.TextureId = "rbxassetid://" ..teamtextureid
msh.Scale = Vector3.new(1, 1, 1)/mult
local hands2 = Instance.new("SpawnLocation", vm)
hands2.Enabled = false
hands2.Name = "SGHands"
hands2.CanCollide = false
hands2.Size = Vector3.new(19.224, 12.328, 29.746)/mult
hands2.Position = Vector3.new(9.946, -14.739, -36.734)/mult
local msh = Instance.new("SpecialMesh", hands2)
msh.MeshId = "rbxassetid://9029762718"
msh.TextureId = "rbxassetid://" ..teamhandtexture
msh.Scale = Vector3.new(1, 1, 1)/mult
local arms2 = Instance.new("SpawnLocation", vm)
arms2.Enabled = false
arms2.Name = "SGArms"
arms2.CanCollide = false
arms2.Size = Vector3.new(29.937, 15.655, 31.457)/mult
arms2.Position = Vector3.new(6.084, -18.332, -25.216)/mult
local msh = Instance.new("SpecialMesh", arms2)
msh.MeshId = "rbxassetid://9029750293"
msh.TextureId = "rbxassetid://" ..teamtextureid
msh.Scale = Vector3.new(1, 1, 1)/mult
local bonesaw = Instance.new("SpawnLocation", script)
bonesaw.Enabled = false
bonesaw.Name = "Bonesaw"
bonesaw.CanCollide = false
bonesaw.Size = Vector3.new(4.89, 29.198, 15.572)/mult
bonesaw.Position = Vector3.new(11.974, -0.658, -35.287)/mult
bonesaw.Transparency = 1
local msh = Instance.new("SpecialMesh", bonesaw)
msh.MeshId = "rbxassetid://9072666583"
msh.TextureId = "rbxassetid://9072666805"
msh.Scale = Vector3.new(1, 1, 1)/mult
local hands3 = Instance.new("SpawnLocation", vm)
hands3.Enabled = false
hands3.Name = "BonesawHand"
hands3.CanCollide = false
hands3.Size = Vector3.new(8.411, 15.22, 11.849)/mult
hands3.Position = Vector3.new(14.467, -13.993, -28.73)/mult
hands3.Transparency = 1
local msh = Instance.new("SpecialMesh", hands3)
msh.MeshId = "rbxassetid://9072661665"
msh.TextureId = "rbxassetid://" ..teamhandtexture
msh.Scale = Vector3.new(1, 1, 1)/mult
local arms3 = Instance.new("SpawnLocation", vm)
arms3.Enabled = false
arms3.Name = "BonesawArm"
arms3.CanCollide = false
arms3.Size = Vector3.new(8.993, 10.158, 19.288)/mult
arms3.Position = Vector3.new(14.431, -21.046, -19.647)/mult
arms3.Transparency = 1
local msh = Instance.new("SpecialMesh", arms3)
msh.MeshId = "rbxassetid://9072656467"
msh.TextureId = "rbxassetid://" ..teamtextureid
msh.Scale = Vector3.new(1, 1, 1)/mult
local la = Instance.new("SpawnLocation", vm)
la.Enabled = false
la.Name = "LeftArm"
la.CanCollide = false
la.Transparency = 1
la.Size = Vector3.new(15.237, 34.934, 13.604)/mult
local msh = Instance.new("SpecialMesh", la)
msh.MeshId = "rbxassetid://9072873646"
msh.TextureId = "rbxassetid://" ..teamtextureid
msh.Scale = Vector3.new(1, 1, 1)/mult
local wc = Instance.new("WeldConstraint", hands3)
wc.Part0 = arms3
wc.Part1 = hands3
local wc = Instance.new("WeldConstraint", bonesaw)
wc.Part0 = bonesaw
wc.Part1 = hands3
local w3 = Instance.new("Weld", script)
w3.Part0 = bonesaw
w3.Part1 = owner.Character.HumanoidRootPart
local wc = Instance.new("WeldConstraint", hands2)
wc.Part0 = arms2
wc.Part1 = hands2
local wc = Instance.new("WeldConstraint", sg)
wc.Part0 = sg
wc.Part1 = hands2
local wc = Instance.new("WeldConstraint", hands)
wc.Part0 = arms
wc.Part1 = hands
local wc = Instance.new("WeldConstraint", medigun)
wc.Part0 = medigun
wc.Part1 = hands
local wc = Instance.new("Weld", la)
wc.Part0 = owner.Character.HumanoidRootPart
wc.Part1 = la
if owner.Character.Head:IsA("MeshPart") then
wc.C0 = CFrame.new(-1.49, 1.5, -.5)
elseif owner.Character.Head:IsA("BasePart") and not owner.Character.Head:IsA("MeshPart") then
wc.C0 = CFrame.new(-1.49, 1.5, 0)
end
local w = Instance.new("Weld", script)
w.Part0 = medigun
w.Part1 = owner.Character.HumanoidRootPart
local w2 = Instance.new("Weld", script)
w2.Part0 = sg
w2.Part1 = owner.Character.HumanoidRootPart
local swinging = false
local swingcfs = {CFrame.new(-.5, -2, -3) * CFrame.Angles(math.rad(-90), math.rad(170), 0), CFrame.new(-.5, -2, -3) * CFrame.Angles(math.rad(-90), 0, 0), CFrame.new(-.5, -2, -3) * CFrame.Angles(math.rad(-90), math.rad(180), 0), CFrame.new(-.5, -2, -3) * CFrame.Angles(math.rad(-90), math.rad(-180), 0)}
local val = Instance.new("StringValue", owner.Character)
val.Name = "b"
val.Value = team
local wc = SPRING.create()
local sway = SPRING.create()
local bobspeed = 1
local bobmod = .1
local alpha = .25
local hitcf = CFrame.new()
local function gb(addition, speed, modifier)
return math.sin(tick() * addition * speed) * modifier
end
local alph = .1
coroutine.wrap(function()
while task.wait() do
hitcf = hitcf:Lerp(CFrame.Angles(0, 0, 0), alph)
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
local heal = Instance.new("Sound", medigun)
heal.EmitterSize = 10
heal.SoundId = 'rbxassetid://7380846790'
heal.Volume = 1.25
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
neck.C0 = neckc0 * CFrame.Angles(theta, 0, 0)
end
end
local humtoheal = nil
coroutine.wrap(function()
while task.wait(.05) do
if humtoheal ~= nil then
humtoheal.Health += .625
end
end
end)()
local swings = {7025242231, 6230941447}
local qcd = false
local re = Instance.new("RemoteEvent", val)
re.OnServerEvent:Connect(function(plr, mode, c1, delta, dt, cam, t)
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
w2.C1 = w2.C1:Lerp(w.C1 * CFrame.Angles(0, wcs.y, wcs.x), .25)
w3.C1 = w3.C1:Lerp(c1, alpha) * hitcf
w3.C1 = w3.C1:Lerp(c1 * CFrame.new(wcs.x / 2, wcs.y / 2,0), .25)
w3.C1 *= CFrame.Angles(0,-sw.x, sw.y)
w3.C1 = w3.C1:Lerp(w.C1 * CFrame.Angles(0, wcs.y, wcs.x), .25)
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
elseif mode == "healbeam" then
if t:GetAttribute(team) then
beamend.CFrame = CFrame.new(0, .75, 0)
beamend.Parent = t.Parent.MedicHealPart
else
beamend.CFrame = CFrame.new()
beamend.Parent = t.Parent:FindFirstChild("HumanoidRootPart") or t.Parent:FindFirstChild("Torso")
end
healbeam.Enabled = true
healeffect.Parent = beamend.Parent
healeffect.Enabled = true
humtoheal = t
if ws < t.WalkSpeed then
owner.Character.Humanoid.WalkSpeed = t.WalkSpeed
end
heal:Play()
checkcon = workspace.DescendantRemoving:Connect(function(p)
if p == beamend then
humtoheal = nil
healeffect.Parent = beamend
beamend.Parent = owner.Character.Head
-- task.wait()
re:FireClient(owner, "stop!")
end
end)
coroutine.wrap(function()
while task.wait() do
if (beamend.WorldPosition - beamstart.WorldPosition).Magnitude > 65 then
humtoheal = nil
healeffect.Parent = beamend
beamend.Parent = owner.Character.Head
-- task.wait()
re:FireClient(owner, "stop!")
break
end
end
end)()
elseif mode == "stophealing" then
print("stopped healing")
if checkcon then checkcon:Disconnect() end
beamend.Parent = owner.Character.Head
healeffect.Parent = beamend
healeffect.Enabled = false
healbeam.Enabled = false
humtoheal = nil
owner.Character.Humanoid.WalkSpeed = ws
heal:Stop()
elseif mode == "syringefire" then
allpurpose.SoundId = 'rbxassetid://7380760146'
allpurpose.Parent = sg
allpurpose.Parent = nil
coroutine.wrap(function()
pe.Parent = at
pe.Enabled = true
pe:Emit(1)
task.wait(.05)
pe.Enabled = false
pe.Parent = nil
end)()
Fire(sg.Position, cam.lookVector * 10)
hitcf = CFrame.new(0, .5, .3) * CFrame.Angles(math.rad(35), 0, 0)
elseif mode == "sg" then
w2.C1 = CFrame.new(-2, -1, 0)
sg.Transparency = 0
arms2.Transparency = 0
hands2.Transparency = 0
arms.Transparency = 1
hands.Transparency = 1
medigun.Transparency = 1
bonesaw.Transparency = 1
arms3.Transparency = 1
hands3.Transparency = 1
la.Transparency = 1
elseif mode == "MEDIC!" then
w.C1 = CFrame.new(-2, -1, 0)
sg.Transparency = 1
arms2.Transparency = 1
hands2.Transparency = 1
arms.Transparency = 0
hands.Transparency = 0
medigun.Transparency = 0
bonesaw.Transparency = 1
arms3.Transparency = 1
hands3.Transparency = 1
la.Transparency = 1
elseif mode == "swing" then
local q = math.random(1, #swingcfs)
allpurpose.SoundId = 'rbxassetid://' ..swings[math.random(1, #swings)]
allpurpose.Parent = bonesaw
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
elseif mode == "i'm going to saw through your bones" then
sg.Transparency = 1
arms2.Transparency = 1
hands2.Transparency = 1
arms.Transparency = 1
hands.Transparency = 1
medigun.Transparency = 1
bonesaw.Transparency = 0
arms3.Transparency = 0
hands3.Transparency = 0
la.Transparency = 0
end
end)
local function HasHumanoid(p)
if p:FindFirstAncestorOfClass("Model", true) and p:FindFirstAncestorOfClass("Model", true):FindFirstChildOfClass("Humanoid") then
return p:FindFirstAncestorOfClass("Model", true):FindFirstChildOfClass("Humanoid")
else
return false
end
end
local sdb = false
coroutine.wrap(function()
while task.wait() do
for i, hit in pairs(workspace:GetPartBoundsInBox(bonesaw.CFrame, bonesaw.Size*1.15)) do
if hit:IsDescendantOf(owner.Character) == false and hit:IsDescendantOf(script) == false and HasHumanoid(hit) and sdb == false and swinging == true then
local h = HasHumanoid(hit)
if not h:GetAttribute(team) then
sdb = true
allpurpose.SoundId = 'rbxassetid://175024455'
allpurpose.Parent = bonesaw
allpurpose.Parent = nil
h.Health -= math.random(20, 30)
task.wait(.35)
sdb = false
end
end
end
end
end)()
NLS([[
local team = script.Parent.Value
local re = script.Parent.RemoteEvent
local UIS = game:GetService("UserInputService")
local m = owner:GetMouse()
local cd = false
script.Parent = workspace
local deltat = 0
local c = workspace.CurrentCamera
local offset = CFrame.new(.55, -1.65, -3.25) * CFrame.Angles(0, .005,0)
local offset2 = CFrame.new(.75,-.75,-2.75) * CFrame.Angles(0, .005,0)
local offset3 = CFrame.new(1,.25,-2) * CFrame.Angles(0, .005,0)
local aimoffset, delta = owner.Character.HumanoidRootPart.CFrame:ToObjectSpace(owner.Character.Head.CFrame * offset), UIS:GetMouseDelta()
local whichoffset = offset2
if owner.Character.Head:IsA("MeshPart") then
owner.Character.Humanoid.CameraOffset = Vector3.new(0, 2.15, -1)
elseif owner.Character.Head:IsA("BasePart") and not owner.Character.Head:IsA("MeshPart") then
owner.Character.Humanoid.CameraOffset = Vector3.new(0, 2.3, -.8)
end
local healing = false
re.OnClientEvent:Connect(function(w)
if w == "stop!" then
healing = false
offset = CFrame.new(.6,-1.25,-3) * CFrame.Angles(0, .005,0)
re:FireServer("stophealing", aimoffset, delta, deltat, c.CFrame, "a")
task.wait(.25)
cd = false
end
end)
local function HasHumanoid(p)
if p:FindFirstAncestorOfClass("Model", true) and p:FindFirstAncestorOfClass("Model", true):FindFirstChildOfClass("Humanoid") then
return p:FindFirstAncestorOfClass("Model", true):FindFirstChildOfClass("Humanoid")
else
return false
end
end
local weapon = "Syringe Gun"
local cool = .105
local mode = "syringefire"
m.KeyDown:Connect(function(k)
if k == 'g' then
re:FireServer("d", aimoffset, delta, deltat, c.CFrame)
script.Disabled = true
elseif k == 'n' then
re:FireServer("n", aimoffset, delta, deltat, c.CFrame)
elseif k == '1' and (weapon == "Medi Gun" or weapon == "Bonesaw") then
weapon = "Syringe Gun"
cool = .105
mode = "syringefire"
whichoffset = offset2
re:FireServer("sg", aimoffset, delta, deltat, c.CFrame, "ae")
elseif k == '2' and (weapon == "Syringe Gun" or weapon == "Bonesaw") then
weapon = "Medi Gun"
cool = .25
mode = "healbeam"
whichoffset = offset
re:FireServer("MEDIC!", aimoffset, delta, deltat, c.CFrame, "ae")
elseif k == '3' and (weapon == "Medi Gun" or weapon == "Syringe Gun") then
weapon = "Bonesaw"
cool = .8
mode = "swing"
whichoffset = offset3
re:FireServer("i'm going to saw through your bones", aimoffset, delta, deltat, c.CFrame, "ae")
end
end)
m.Button1Down:Connect(function()
if cd then return end
if mode == "healbeam" then
if healing == false and m.Target and HasHumanoid(m.Target) and (HasHumanoid(m.Target):GetAttribute(team) or (HasHumanoid(m.Target):GetAttribute("RED") == nil and HasHumanoid(m.Target):GetAttribute("BLU") == nil)) then
healing = true
healing = true
cd = true
offset = CFrame.new(.6,-1.25,-2.85) * CFrame.Angles(math.rad(8), .005,0)
whichoffset = offset
re:FireServer(mode, aimoffset, delta, deltat, c.CFrame, HasHumanoid(m.Target))
end
else
cd = true
re:FireServer(mode, aimoffset, delta, deltat, c.CFrame, "A")
task.wait(cool)
cd = false
end
end)
m.Button1Up:Connect(function()
if healing == true then
healing = false
offset = CFrame.new(.6,-1.25,-3) * CFrame.Angles(0, .005,0)
whichoffset = offset
re:FireServer("stophealing", aimoffset, delta, deltat, c.CFrame, "a")
task.wait(.25)
cd = false
end
end)
local function SetCharacterLocalTransparency(transparency)
for i,v in pairs(owner.Character:GetDescendants()) do
if v:IsA("BasePart") and v.Name ~= "Head" and v.Name ~= "fakehead" and v.Parent.Name ~= "fakehead" and v.Name ~= "glasses" then
v.LocalTransparencyModifier = 0
end
end
end
game:GetService("RunService").Heartbeat:Connect(function(dt)
pcall(function()
deltat = dt
SetCharacterLocalTransparency(0)
aimoffset, delta = owner.Character.HumanoidRootPart.CFrame:ToObjectSpace(owner.Character.Head.CFrame * whichoffset), UIS:GetMouseDelta()
re:FireServer("aim", aimoffset, delta, dt, c.CFrame, "a")
local x, y, z = c.CFrame:ToEulerAnglesXYZ()
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
local fake1 = medigun:Clone()
fake1.Parent = bo
local fake2 = hands:Clone()
fake2.Parent = bo
local fake3 = arms:Clone()
fake3.Parent = bo
local fake4 = sg:Clone()
fake4.Parent = bo
local fake5 = hands2:Clone()
fake5.Parent = bo
local fake55 = arms2:Clone()
fake55.Parent = bo
local fake6 =  bonesaw:Clone()
fake6.Parent = bo
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
if v.Name == "Head" and owner.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
w.C1 = CFrame.new(0, 7.75, 0)
end
end
end
c.CFrame = CFrame.new(0,0,-8) * CFrame.Angles(0,math.rad(180),0)
while task.wait() do
fake1.CFrame = medigun.CFrame
fake2.CFrame = hands.CFrame
fake3.CFrame = arms.CFrame
fake4.CFrame = sg.CFrame
fake5.CFrame = hands2.CFrame
fake55.CFrame = arms2.CFrame
fake6.CFrame = bonesaw.CFrame
fake7.CFrame = hands3.CFrame
fake8.CFrame = arms3.CFrame
fake9.CFrame = la.CFrame
fake1.Transparency = medigun.Transparency
fake2.Transparency = hands.Transparency
fake3.Transparency = arms.Transparency
fake4.Transparency = sg.Transparency
fake5.Transparency = hands2.Transparency
fake55.Transparency = arms2.Transparency
fake6.Transparency = bonesaw.Transparency
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
