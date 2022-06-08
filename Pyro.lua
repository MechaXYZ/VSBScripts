local function DamageIndicator(amount, parent, color, scolor)
local naeeym2 = Instance.new("BillboardGui" , parent)
naeeym2.Size = UDim2.new(0, 500, 0, 500)
naeeym2.StudsOffset = Vector3.new(0,0,0)
naeeym2.Name = "DamageIndicator"
local tecks2 = Instance.new("TextBox",naeeym2)
tecks2.BackgroundTransparency = 1
tecks2.BorderSizePixel = 0
tecks2.Text = tostring(amount)
tecks2.Font = "Arcade"
tecks2.TextSize = 35
tecks2.TextStrokeTransparency = 0
tecks2.TextColor3 = color
tecks2.TextStrokeColor3 = scolor
tecks2.Size = UDim2.new(1,0,.5,0)
game:GetService("TweenService"):Create(naeeym2, TweenInfo.new(1), {StudsOffset = Vector3.new(0,3,0)}):Play()
game:GetService("TweenService"):Create(tecks2, TweenInfo.new(1), {TextTransparency = 1, TextStrokeTransparency = 1}):Play()
game:GetService("Debris"):AddItem(naeeym2, 1)
end
local wedge = Instance.new("WedgePart");
wedge.Anchored = true;
wedge.TopSurface = Enum.SurfaceType.Smooth;
wedge.BottomSurface = Enum.SurfaceType.Smooth;
wedge.CanCollide = false
wedge.Transparency = 1
wedge.CanTouch = false
local function draw3dTriangle(a, b, c, parent, w1, w2)
	local ab, ac, bc = b - a, c - a, c - b;
	local abd, acd, bcd = ab:Dot(ab), ac:Dot(ac), bc:Dot(bc);
	if (abd > acd and abd > bcd) then
		c, a = a, c;
	elseif (acd > bcd and acd > abd) then
		a, b = b, a;
	end
	ab, ac, bc = b - a, c - a, c - b;
	local right = ac:Cross(ab).unit;
	local up = bc:Cross(right).unit;
	local back = bc.unit;
	local height = math.abs(ab:Dot(up));
	w1 = w1 or wedge:Clone();
	w1.Size = Vector3.new(15, height, math.abs(ab:Dot(back)));
	w1.CFrame = CFrame.fromMatrix((a + b)/2, right, up, back);
	w1.Parent = parent;
	w2 = w2 or wedge:Clone();
	w2.Size = Vector3.new(15, height, math.abs(ac:Dot(back)));
	w2.CFrame = CFrame.fromMatrix((a + c)/2, -right, up, -back);
	w2.Parent = parent;
	return w1, w2;
end
local w0, w1 = draw3dTriangle(Vector3.new(0, 0, -15), Vector3.new(0, 15, 0), Vector3.new(-15, 0, 0), owner.Character)
local new = w0:UnionAsync({w1})
new.Parent = owner.Character
new.Massless = true
new.CanCollide = false
new.Anchored = false
new.CanQuery = false
new.CanTouch = false
new.Transparency = 1
w0:Destroy()
w1:Destroy()
local hbw = Instance.new("Weld", owner.Character)
hbw.Part0 = new
hbw.Part1 = owner.Character.HumanoidRootPart
hbw.C1 = owner.Character.HumanoidRootPart.CFrame:ToObjectSpace((owner.Character.HumanoidRootPart.CFrame * CFrame.new(-6, 0, -8) * CFrame.Angles(math.rad(180), math.rad(-90), math.rad(90))) * CFrame.Angles(math.rad(-35), 0, 0))
local re = Instance.new("RemoteEvent", owner.Character)
re.Name = "pyroevent"
local val = Instance.new("ObjectValue", re)
val.Name = "val"
local rsc0 = owner.Character.Torso["Right Shoulder"].C0
local rsc1 = owner.Character.Torso["Right Shoulder"].C1
local lsc0 = owner.Character.Torso["Left Shoulder"].C0
local lsc1 = owner.Character.Torso["Left Shoulder"].C1
local Neck = Instance.new("Weld", owner.Character.Torso)
Neck.Part0 = owner.Character.Torso
Neck.Part1 = owner.Character.Head
Neck.C0 = CFrame.new(0, 1.5, 0)
local RS = Instance.new("Weld", owner.Character.Torso)
RS.Part0 = owner.Character.Head
RS.Part1 = owner.Character["Right Arm"]
RS.Enabled = false
local LS = Instance.new("Weld", owner.Character.Torso)
LS.Part0 = owner.Character.Head
LS.Part1 = owner.Character["Left Arm"]
LS.C0 = lsc0
LS.C1 = lsc1
LS.Enabled = false
local Tool0 = Instance.new("Tool")
local Part1 = Instance.new("Part")
local SpecialMesh2 = Instance.new("SpecialMesh")
Tool0.Name = "pyro's flamethrower"
Tool0.ToolTip = '"One shudders to imagine what inhuman thoughts lie behind that mask... what dreams of chronic and sustained cruelty?"'
Tool0.Parent = owner.Backpack
Tool0.RequiresHandle = false
Part1.Name = "the flamethrower"
Part1.Parent = Tool0
Part1.CanCollide = false
Part1.Size = Vector3.new(1.549, 2.302, 3.814)
SpecialMesh2.Parent = Part1
SpecialMesh2.MeshId = "rbxassetid://5944162005"
SpecialMesh2.TextureId = "rbxassetid://5944162183"
SpecialMesh2.Scale = Vector3.new(.1, .1, .1)
local equipped = false
local flaming = false
local grip = Instance.new("Weld", RS.Part1)
grip.Part0 = RS.Part1
grip.Part1 = Part1
local screams = {1080610583, 1106908778, 1106908778, 3483587416, 571884894, 565424177, 565423860, 1080625252}
local shoot = Instance.new("Sound", Part1)
shoot.SoundId = 'rbxassetid://5163167129'
shoot.Looped = true
shoot.EmitterSize = 12.5
shoot.Volume = 2
local crackle = Instance.new("Sound", owner.Character.Head)
crackle.SoundId = 'rbxassetid://239443642'
crackle.EmitterSize = 12.5
crackle.Volume = 1.5
crackle.PlayOnRemove = true
local screm = Instance.new("Sound", owner.Character.Head)
screm.SoundId = 'rbxassetid://' ..screams[math.random(1, #screams)]
screm.EmitterSize = 12.5
screm.Volume = 1
screm.PlayOnRemove = true
local equip = Instance.new("Sound", Part1)
equip.SoundId = 'rbxassetid://7380658184'
equip.EmitterSize = 12.5
equip.Volume = 3
local firecolors = {BrickColor.new("Fire Yellow"), BrickColor.new("Bright orange"), BrickColor.new("Flame reddish orange"), BrickColor.new("Bright yellow")}
local function createbullet()
    local bullet = Instance.new("SpawnLocation")
    bullet.Enabled = false
    bullet.Size = Vector3.new(.1,.1,.3)
    bullet.BrickColor = BrickColor.new("New Yeller")
    bullet.Material = Enum.Material.Neon
    bullet.Anchored = true
    bullet.CanCollide = false
    bullet.Name = "Bullet"
    bullet.Parent = script
    local a1 = Instance.new("Attachment")
    a1.Parent = bullet 
    a1.Position = Vector3.new(-0.1,-0.1,0)
 
    local a2 = Instance.new("Attachment")
    a2.Parent = bullet
    a2.Position = Vector3.new(0.1,0.1,0)
    coroutine.wrap(function()
    task.wait()
    local t = Instance.new("Trail")
    t.Parent = bullet
    t.Attachment0 = a1
    t.Attachment1 = a2
    t.Color = ColorSequence.new(bullet.Color)
    t.WidthScale = NumberSequence.new(1,0)
    t.Lifetime = 0.1
    t.MinLength = 1
    t.FaceCamera = true
    end)()
    return bullet
end
local alpha = 1
Tool0.Equipped:Connect(function()
equipped = true
end)
Tool0.Unequipped:Connect(function()
equipped = false
flaming = false
shoot:Stop()
RS.Part0 = owner.Character.Torso
LS.Part0 = owner.Character.Torso
for i = 1, 25 do
RS.C1 = RS.C1:Lerp(rsc1, alpha)
LS.C1 = LS.C1:Lerp(lsc1, alpha)
LS.C0 = LS.C0:Lerp(lsc0, alpha)
RS.C0 = RS.C0:Lerp(rsc0, alpha)
task.wait()
end
task.wait(.05)
RS.Enabled = false
LS.Enabled = false
RS.Part0 = owner.Character.Head
LS.Part0 = owner.Character.Head
end)
Tool0.Activated:Connect(function()
equip.SoundId = 'rbxassetid://139187200'
equip:Play()
flaming = true
shoot:Play()
end)
Tool0.Deactivated:Connect(function()
equip.SoundId = 'rbxassetid://1000204726'
equip:Play()
flaming = false
shoot:Stop()
end)
local function HasHumanoid(p)
if p:FindFirstAncestorOfClass("Model", true) and p:FindFirstAncestorOfClass("Model", true):FindFirstChildOfClass("Humanoid") then
return p:FindFirstAncestorOfClass("Model", true):FindFirstChildOfClass("Humanoid")
else
return false
end
end
local thing = {
	neck = CFrame.new(0, 1, 0, 0.747311652, 0, 0.664473772, 0, 1, 0, -0.664473772, 0, 0.747311652);
	RJ = CFrame.new(0, 0, 0, 0.747311592, 0, -0.664473712, 0, 1, 0, 0.664473712, 0, 0.747311592);
	LS = CFrame.new(0.474761963, -1.61745477, -1.20455933, -0.127145067, -0.88503027, -0.447834671, -0.836402416, 0.338357687, -0.431213528, 0.533165276, 0.319743276, -0.783262014);
	RS = CFrame.new(1.14480591, -1.47239065, 0.695491791, 0.972185493, -0.190045089, -0.136889026, 0.123703048, 0.912935674, -0.388903707, 0.198880106, 0.361152887, 0.911051929);
	grip = CFrame.new(-0.0976009369, -1.92251587, -1.31733322, -0.980839312, 0.117544398, -0.155363142, 0.158846945, 0.944226265, -0.288452089, 0.11279203, -0.307604104, -0.944805682);
}
grip.C0 = thing.grip * CFrame.Angles(0, math.pi, 0)
LS.C0 = thing.LS
RS.C0 = thing.RS
local hit = Vector3.new()
re.OnServerEvent:Connect(function(plr, what, pos)
if what == "point" then
hit = pos
end
end)
val.Value = Tool0
NLS([[
local re = script.Parent
local tool = re.val.Value
local eq = false
local m = owner:GetMouse()
tool.Equipped:Connect(function()
eq = true
end)
tool.Unequipped:Connect(function()
eq = false
end)
while task.wait() do
if eq == true then
re:FireServer("point", m.Hit.p)
local RootPosition = owner.Character.HumanoidRootPart.Position
local Direction = m.Hit.p - RootPosition
Direction = Vector3.new(Direction.X, 0, Direction.Z).Unit
local NewCFrame = CFrame.new(RootPosition, RootPosition + Direction) * CFrame.Angles(0, math.rad(-35), 0)
owner.Character.HumanoidRootPart.CFrame = NewCFrame
end
end
]], re)
coroutine.wrap(function()
while task.wait() do
--pcall(function()
if equipped == true then
RS.Enabled = true
LS.Enabled = true
Neck.Enabled = true
local hypot = (hit - owner.Character.Head.Position).Magnitude
local oppos = hit.Y - owner.Character.Head.Position.Y
local Pitch = math.asin(oppos / hypot)
local NewNeckCFrame = thing.neck * CFrame.Angles(Pitch + .2, 0, 0) * CFrame.new(0, 0.5, 0)
Neck.C0 = Neck.C0:Lerp(NewNeckCFrame, alpha)
RS.C1 = CFrame.new()
LS.C1 = CFrame.new()
LS.C0 = LS.C0:Lerp(thing.LS, alpha)
RS.C0 = RS.C0:Lerp(thing.RS, alpha)
else
Neck.Enabled = false
--[[
RS.C1 = RS.C1:Lerp(rsc1, alpha)
LS.C1 = LS.C1:Lerp(lsc1, alpha)
LS.C0 = LS.C0:Lerp(lsc0, alpha)
RS.C0 = RS.C0:Lerp(rsc0, alpha)
RS.Enabled = false
LS.Enabled = false
]]--
end
--end)
end
end)()
local flameat = Instance.new("Attachment", owner.Character.Head)
flameat.CFrame = CFrame.new(-.08, .47, -2.25)
-- flameat.Visible = true
local numk = NumberSequenceKeypoint.new
local btrans = NumberSequence.new{
numk(0, 1),
numk(.809, .225),
numk(1, 1)
}
local Table = {}
do local Array = Table
	Array.Collisions = function(Attachment, ParticleEmitter, MaxLifetimeValue)
		local Particle = Ray.new(Attachment.WorldCFrame.p,((Attachment.WorldCFrame * CFrame.new(0,0,-10).p)-Attachment.WorldCFrame.p).Unit*(2048+20))	
		local Exists,Collided = workspace:FindPartOnRay(Particle)
		workspace:FindPartOnRay(Particle)
		if Exists and not (Exists:FindFirstAncestorOfClass("Model") and Exists:FindFirstAncestorOfClass("Model"):FindFirstChildOfClass("Humanoid")) and Exists.CanCollide and Exists.Transparency ~= 1 then
			local Distance = (Collided-Attachment.WorldPosition).Magnitude
			local Collision_Time = NumberRange.new(Distance/ParticleEmitter.Speed.Min-0.0099)
			local CL = math.min(Collision_Time.Min, MaxLifetimeValue)
			ParticleEmitter.Lifetime = NumberRange.new(CL)
		elseif not Exists then
			ParticleEmitter.Lifetime = NumberRange.new(MaxLifetimeValue)
		end
	end	
end
local emitterammount = 6
local emitters = {}
		for i = 1, emitterammount do
		local pe = Instance.new("ParticleEmitter")
		pe.Texture = "rbxassetid://405886187"
        pe.Size = NumberSequence.new(.35, 0)
        pe.Transparency = NumberSequence.new(0, 1)
        pe.LightInfluence = 0
        pe.Drag = 0
		--pe.Color = ColorSequence.new(BrickColor.new("Bright yellow").Color)
        pe.Speed = NumberRange.new(15, 15)
        pe.Lifetime = NumberRange.new(5, 5)
        pe.Rate = 500
        pe.EmissionDirection = "Front"
        pe.Parent = flameat
        pe.RotSpeed = NumberRange.new(-360, 360)
        pe.SpreadAngle = Vector2.new(30, 45)
		pe.Brightness = 25
		if i == 2 or i == 3 then
		pe.Texture = "rbxassetid://6209088036"
		pe.Color = ColorSequence.new(BrickColor.new("Bright red").Color)
		pe.Brightness = 3
		elseif i == 4 or i == 5 then
		pe.Texture = "rbxassetid://133619974"
		pe.LightEmission = .8
		pe.Color = ColorSequence.new(Color3.new(0, 0, 1))
		end
		table.insert(emitters, pe)
		end
local flamedb = false
local burned = {}
local guicount = 0
coroutine.wrap(function()
while task.wait() do
flameat.WorldCFrame = Part1.CFrame * CFrame.new(-.08, .47, -2.25)
if flaming == true then
for i, pe in pairs(emitters) do
pe.Enabled = true
pe.EmissionDirection = "Front"
pe.Speed = NumberRange.new(25, 25)
pe.Lifetime = NumberRange.new(10, 10)
Table.Collisions(flameat, pe, 10)
end
local params = OverlapParams.new()
params.FilterDescendantsInstances = {owner.Character}
params.FilterType = Enum.RaycastFilterType.Blacklist
for i, hit in pairs(workspace:GetPartsInPart(new, params)) do
if hit:FindFirstAncestorOfClass("Model") and hit:FindFirstAncestorOfClass("Model"):FindFirstChildOfClass("Humanoid") and flamedb == false and hit:FindFirstAncestorOfClass("Model"):FindFirstChildOfClass("Humanoid").Health ~= 0 then
flamedb = true
local hum = hit:FindFirstAncestorOfClass("Model"):FindFirstChildOfClass("Humanoid")
hum.Health -= (hum.MaxHealth/65)
coroutine.wrap(function()
if guicount < 59 then
--DamageIndicator((hum.MaxHealth/100), hum.Parent.Head, Color3.new(1,0,0), Color3.new(.5,0,0))
guicount += 1
else
task.wait(1)
guicount = 0
end
end)()
if not table.find(burned, hum) then
table.insert(burned, hum)
pcall(function()
local fire = Instance.new("Fire", hit)
fire.Size = 5.5
game:GetService("Debris"):AddItem(fire, 11)
end)
screm.SoundId = 'rbxassetid://' ..screams[math.random(1, #screams)]
crackle.Parent = hum.Parent.Head
screm.Parent = hum.Parent.Head
crackle.Parent = nil
screm.Parent = nil
local oldws = hum.WalkSpeed
hum.WalkSpeed = 10
local tors = hum.Parent:FindFirstChild("HumanoidRootPart") or hum.Parent:FindFirstChild("Torso")
coroutine.wrap(function()
for i = 1, 10 do
hum.Health -= 2
DamageIndicator(2, hum.Parent.Head, Color3.new(1,0,0), Color3.new(.5,0,0))
if hum.Health <= 0 then break end
task.wait(1)
end
hum.WalkSpeed = oldws
task.wait(1)
for i, v in pairs(burned) do
if v == hum then
table.remove(burned, i)
end
end
end)()
end
task.wait()
flamedb = false
elseif not (hit:FindFirstAncestorOfClass("Model") and hit:FindFirstAncestorOfClass("Model"):FindFirstChildOfClass("Humanoid")) and hit.Name ~= "Base" then
hit.Material = "Neon"
hit.Anchored = false
hit.Massless = true
hit:BreakJoints()
if not hit:FindFirstChild("pyro fire") then
hit.BrickColor = firecolors[math.random(1, #firecolors)]
local fire = Instance.new("BoolValue", hit)
fire.Name = "pyro fire"
fire.Value = true
crackle.Parent = hit
crackle.Parent = nil
game:GetService("Debris"):AddItem(fire, 10)
coroutine.wrap(function()
for i = 1, 10 do
if hit:FindFirstChildOfClass("Decal") then
hit:FindFirstChildOfClass("Decal").Transparency += .1
end
if hit:FindFirstChildOfClass("Texture") then
hit:FindFirstChildOfClass("Texture").Transparency += .1
end
hit.Transparency += .1
task.wait(1)
end
hit:Destroy()
end)()
end
end
end
else
for i, pe in pairs(emitters) do
if equipped == false then
pe.Enabled = false
else
pe.Enabled = true
end
pe.EmissionDirection = "Top"
pe.Speed = NumberRange.new(5, 5)
pe.Lifetime = NumberRange.new(1, 1)
end
end
end
end)()
