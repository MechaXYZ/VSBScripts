local DEBUG = false
local BULLET_SPEED = 125
local BULLET_MAXDIST = 5000 
local BULLET_GRAVITY = Vector3.new()
local http = game:GetService("HttpService")
local f = http:GetAsync("https://raw.githubusercontent.com/MechaXYZ/VSBScripts/main/FastCast%20Module")
local FastCast = loadstring(f)()
local caster = FastCast.new()
local CastParams = RaycastParams.new()
CastParams.IgnoreWater = true
CastParams.FilterType = Enum.RaycastFilterType.Blacklist
CastParams.FilterDescendantsInstances = {owner.Character}
FastCast.DebugLogging = DEBUG
FastCast.VisualizeCasts = DEBUG
local function HasHumanoid(p)
    if p:FindFirstAncestorOfClass("Model", true) and p:FindFirstAncestorOfClass("Model", true):FindFirstChildOfClass("Humanoid") then
        return p:FindFirstAncestorOfClass("Model", true):FindFirstChildOfClass("Humanoid")
    else
        return false
    end
end
local bullets = Instance.new("Folder", script)
bullets.Name = "Bullets"
local bullet = Instance.new("SpawnLocation")
bullet.Enabled = false
bullet.BrickColor = BrickColor.new("Fire Yellow")
-- bullet.Material = "Neon"
bullet.Anchored = true
bullet.Material = "SmoothPlastic"
bullet.Size = Vector3.new(.2, .2, .2)
bullet.Shape = "Ball"
local at0, at1 = Instance.new("Attachment", bullet), Instance.new("Attachment", bullet)
at0.CFrame = CFrame.new(-.05, 0, 0)
at1.CFrame = CFrame.new(.05, 0, 0)
local trl = Instance.new("Trail", bullet)
trl.Attachment0 = at0
trl.Attachment1 = at1
trl.Lifetime = .5
trl.Color = ColorSequence.new(bullet.Color)
local CastBehavior = FastCast.newBehavior()
CastBehavior.RaycastParams = CastParams
CastBehavior.MaxDistance = BULLET_MAXDIST
CastBehavior.HighFidelityBehavior = FastCast.HighFidelityBehavior.Default
CastBehavior.Acceleration = BULLET_GRAVITY
CastBehavior.AutoIgnoreContainer = true
CastBehavior.CosmeticBulletContainer = bullets
CastBehavior.CosmeticBulletTemplate = bullet
local function addhole(pos, norm)
	local hole = Instance.new("SpawnLocation", script)
	hole.Enabled = false
	hole.Anchored = true
	hole.Transparency = 1
	hole.CanCollide = false
	hole.Size = Vector3.new(.65, .65, 0)
	hole.CFrame = CFrame.new(pos, pos + norm)  -- * CFrame.Angles(0, math.rad(90), 0)
	local txt = Instance.new("Texture", hole)
	txt.Texture = 'rbxassetid://4784881970'
	txt.StudsPerTileU = .65
	txt.StudsPerTileV = .65
	game:GetService("Debris"):AddItem(hole, 10)
	return hole
end
local function Reflect(surfaceNormal, bulletNormal)
    return bulletNormal - (2 * bulletNormal:Dot(surfaceNormal) * surfaceNormal)
end
function OnRayHit(cast, raycastResult, segmentVelocity, cosmeticBulletObject)
    local hitPart = raycastResult.Instance
    local hitPoint = raycastResult.Position
    local normal = raycastResult.Normal
    if hitPart ~= nil and hitPart.Parent ~= nil then
        local humanoid = HasHumanoid(hitPart)
        if humanoid then
            humanoid.Health -= math.random(5, 15) * 2.25
		else
			addhole(hitPoint, normal)
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
    local cosmeticBullet = cast.RayInfo.CosmeticBulletObject
    if cosmeticBullet ~= nil then
            cosmeticBullet:Destroy()
        end
end
caster.RayHit:Connect(OnRayHit)
caster.RayPierced:Connect(OnRayPierced)
caster.LengthChanged:Connect(OnRayUpdated)
caster.CastTerminating:Connect(OnRayTerminated)
local re = Instance.new("RemoteEvent", owner.PlayerGui)
	re.Name = "RipAndTearEvent"
local v = Instance.new("ObjectValue", re)
	v.Name = "val"
	v.Value = script
owner.Character.Humanoid.WalkSpeed = 20
for _, v in pairs(owner.Character:GetDescendants()) do
	if v:IsA("BasePart") or v:IsA("Decal") or v:IsA("Texture") then
		v.Transparency = 1
	end
end
local fps = 8
local div = 9
local walkframe = 1
local attack = false
local falling = false
local stunned = false
local doomguy_meshes = {
	["Walk 1"] = 9389382542,
	["Walk 2"] = 9389386346,
	["Walk 3"] = 9389392449,
	["Walk 4"] = 9389395408,
	["Jump"] = 9389402355,
	["Fire 1"] = 9389414904,
	["Fire 2"] = 9389414663,
	["Hurt"] = 9389403773
}
local rifle_meshes = {
	["Walk 1"] = 9389412344,
	["Walk 2"] = 9389411890,
	["Walk 3"] = 9389411587,
	["Walk 4"] = 9389411301,
	["Jump"] = 9389401701,
	["Fire 1"] = 9389414286,
	["Fire 2"] = 9389413821,
	["Hurt"] = 9389403359
}
local c0s = {
	["Walk 1"] = CFrame.new(1.63 / div, 25.132 / div, -.359 / div, 1, 0, 0, 0, 1, 0, 0, 0, 1),
	["Walk 2"] = CFrame.new(2.631 / div, 27.098 / div, -1.404 / div, 1, 0, 0, 0, 1, 0, 0, 0, 1),
	["Walk 3"] = CFrame.new(1.653 / div, 24.935 / div, .322 / div, 1, 0, 0, 0, 1, 0, 0, 0, 1),
	["Walk 4"] = CFrame.new(2.842 / div, 24.853 / div, 1.705 / div, 1, 0, 0, 0, 1, 0, 0, 0, 1),
	["Jump"] = CFrame.new(-2.475 / div, 41.302 / div, -5.413 / div, 1, 0, 0, 0, 1, 0, 0, 0, 1),
	["Fire 1"] = CFrame.new(.758 / div, 24.863 / div, -2.766 / div, 1, 0, 0, 0, 1, 0, 0, 0, 1),
	["Fire 2"] = CFrame.new(3.268 / div, 24.86 / div, -2.837 / div, 1, 0, 0, 0, 1, 0, 0, 0, 1),
	["Hurt"] = CFrame.new(-1.252 / div, 23.946 / div, -1.189 / div, 1, 0, 0, 0, 1, 0, 0, 0, 1)
}

local c1s = {
	["Walk 1"] = CFrame.new(-6.567 / div, 33.89 / div, -.492 / div, 1, 0, 0, 0, 1, 0, 0, 0, 1),
	["Walk 2"] = CFrame.new(-7.585 / div, 33.721 / div, -.756 / div, 1, 0, 0, 0, 1, 0, 0, 0, 1),
	["Walk 3"] = CFrame.new(-6.178 / div, 37.156 / div, 2.185 / div, 1, 0, 0, 0, 1, 0, 0, 0, 1),
	["Walk 4"] = CFrame.new(-8.166 / div, 33.392 / div, 4.913 / div, 1, 0, 0, 0, 1, 0, 0, 0, 1),
	["Jump"] = CFrame.new(-10.043 / div, 48.89 / div, -6.219 / div, 1, 0, 0, 0, 1, 0, 0, 0, 1),
	["Fire 1"] = CFrame.new(-5.397 / div, 32.509 / div, -10.428 / div, 1, 0, 0, 0, 1, 0, 0, 0, 1),
	["Fire 2"] = CFrame.new(1.681 / div, 31.488 / div, -9.907 / div, 1, 0, 0, 0, 1, 0, 0, 0, 1),
	["Hurt"] = CFrame.new(-9.667 / div, 34.028 / div, -1.619 / div, 1, 0, 0, 0, 1, 0, 0, 0, 1)
}
local footsteps = Instance.new("Sound", owner.Character.Head)
	footsteps.SoundId = 'rbxassetid://1977094302'
	footsteps.Volume = 1.25
	footsteps.PlaybackSpeed = 1.25
	footsteps.Looped = true
	footsteps:Play()
local box = Instance.new("SpawnLocation", owner.Character)
	box.Enabled = false
	box.CanCollide = false
	box.Massless = true
	box.Name = "box thing"
	box.Size = Vector3.new(27.475, 50, 27.283) / div
local rifle = Instance.new("SpawnLocation", owner.Character)
	rifle.Enabled = false
	rifle.CanCollide = false
	rifle.Massless = true
	rifle.Name = "rifle"
	rifle.Size = Vector3.new(7.361, 13.022, 36.831) / div
local rifw = Instance.new("Weld", rifle)
	rifw.Part0 = rifle
	rifw.Part1 = box
	rifw.C0 = c0s["Walk 1"]
	rifw.C1 = c1s["Walk 1"]
local boxw = Instance.new("Weld", box)
	boxw.Part0 = owner.Character.HumanoidRootPart
	boxw.Part1 = box
	boxw.C0 = CFrame.new(0, -.25, 0) * CFrame.Angles(0, -(math.pi/2), 0)
local guymsh = Instance.new("SpecialMesh", box)
	guymsh.MeshId = 'rbxassetid://' ..doomguy_meshes["Walk 1"]
	guymsh.TextureId = 'rbxassetid://9389382640'
	guymsh.Scale = Vector3.new(1, 1, 1) / div
local rifmsh = Instance.new("SpecialMesh", rifle)
	rifmsh.MeshId = 'rbxassetid://' ..rifle_meshes["Walk 1"]
	rifmsh.TextureId = 'rbxassetid://9389411358'
	rifmsh.Scale = Vector3.new(1, 1, 1) / div
local flash = Instance.new("PointLight", box)
	flash.Brightness = 20
	flash.Color = Color3.new(.75, .75, 0)
	flash.Range = 5
	flash.Enabled = false
local fire = Instance.new("Sound", game:GetService("VRService"))
	fire.SoundId = 'rbxassetid://6779445744'
	fire.Volume = 1.25
	fire.PlayOnRemove = true
	fire.EmitterSize = 15
local allpurpose = Instance.new("Sound", game:GetService("VRService"))
	allpurpose.SoundId = 'rbxassetid://678886685'
	allpurpose.Volume = 3
	allpurpose.PlayOnRemove = true
	allpurpose.EmitterSize = 15
local ap2 = Instance.new("Sound", owner.Character.Head)
	ap2.SoundId = 'rbxassetid://678886685'
	ap2.Volume = 2
	ap2.EmitterSize = 15
local name = Instance.new("BillboardGui", owner.Character.Head)
	name.Size = UDim2.new(50, 0, 50, 0)
	name.StudsOffset = Vector3.new(0, 2, 0)
	name.Name = "NameBoard"
	local txt = Instance.new("TextBox", name)
	txt.BackgroundTransparency = 1
	txt.BorderSizePixel = 0
	txt.Text = owner.DisplayName
	txt.Font = "Arcade"
	txt.TextWrapped = true
	txt.TextSize = 35
	txt.TextStrokeTransparency = 0
	txt.TextColor3 = Color3.new(.6, 0, 0)
	txt.TextStrokeColor3 = Color3.new(.35, 0, 0)
	txt.Size = UDim2.new(1, 0, .5,0)
local function chat(text)
	if owner.Character.Head:FindFirstChild("TalkingBillBoard") ~= nil then
		owner.Character.Head:FindFirstChild("TalkingBillBoard"):Destroy()
	end
	local naeeym2 = Instance.new("BillboardGui", owner.Character.Head)
	naeeym2.Size = UDim2.new(50, 0, 50, 0)
	naeeym2.StudsOffset = Vector3.new(0, 1, 0)
	naeeym2.Name = "TalkingBillBoard"
	local tecks2 = Instance.new("TextBox",naeeym2)
	tecks2.BackgroundTransparency = 1
	tecks2.BorderSizePixel = 0
	tecks2.Text = text
	tecks2.Font = "Arcade"
	tecks2.TextWrapped = true
	tecks2.TextSize = 35
	tecks2.TextStrokeTransparency = 0
	tecks2.TextColor3 = Color3.new(0, .75, 0)
	tecks2.TextStrokeColor3 = Color3.new(0, .5, 0)
	tecks2.Size = UDim2.new(1, 0, .5,0)
	task.wait(2)
	naeeym2:Destroy()
end
owner.Chatted:Connect(function(msg)
	allpurpose.SoundId = 'rbxassetid://678886685'
	allpurpose.Parent = owner.Character.Head allpurpose.Parent = nil	
	chat(msg)
end)
local function setrifgrip(name)
	rifw.C0 = c0s[name]
	rifw.C1 = c1s[name]
end
re.OnServerEvent:Connect(function(plr, what, cf, dir)
	if what == "fireanim" then
		fire.SoundId = 'rbxassetid://' ..cf
		fire.Parent = owner.Character.Head fire.Parent = nil
		attack = true
		flash.Enabled = true
		guymsh.MeshId = 'rbxassetid://' ..doomguy_meshes["Fire 1"]
		rifmsh.MeshId = 'rbxassetid://' ..rifle_meshes["Fire 1"]
		setrifgrip("Fire 1")
		task.wait(1/fps)
		guymsh.MeshId = 'rbxassetid://' ..doomguy_meshes["Fire 2"]
		rifmsh.MeshId = 'rbxassetid://' ..rifle_meshes["Fire 2"]
		setrifgrip("Fire 2")
		task.wait(1/fps)
		guymsh.MeshId = 'rbxassetid://' ..doomguy_meshes["Fire 1"]
		rifmsh.MeshId = 'rbxassetid://' ..rifle_meshes["Fire 1"]
		setrifgrip("Fire 1")
		task.wait(1/fps)
		flash.Enabled = false
		attack = false
	elseif what == "fire" then
		caster:Fire(cf.p, dir, BULLET_SPEED, CastBehavior)
	elseif what == "ssg reload" then
		ap2.SoundId = 'rbxassetid://5975125771'
		ap2:Play()
	elseif what == "run" then
		owner.Character.Humanoid.WalkSpeed = 45
	elseif what == "walk" then
		owner.Character.Humanoid.WalkSpeed = 20
	elseif what == "sg shell in" then
		allpurpose.SoundId = 'rbxassetid://8822193908'
		allpurpose.Parent = owner.Character.Head allpurpose.Parent = nil
	elseif what == "empty" then
		allpurpose.SoundId = 'rbxassetid://8628978369'
		allpurpose.Parent = owner.Character.Head allpurpose.Parent = nil
	elseif what == "sgpump" then
		allpurpose.SoundId = 'rbxassetid://7129228370'
		allpurpose.Parent = owner.Character.Head allpurpose.Parent = nil
	elseif what == "jump" then
		allpurpose.SoundId = 'rbxassetid://5121746630'
		allpurpose.Parent = owner.Character.Head allpurpose.Parent = nil
	end
end)
local oldhp = owner.Character.Humanoid.Health
owner.Character.Humanoid.FreeFalling:Connect(function(fall)
	falling = fall
end)
owner.Character.Humanoid.Jumping:Connect(function(jump)
	falling = jump
end)
owner.Character.Humanoid.HealthChanged:Connect(function(hp)
	if hp < oldhp then
		allpurpose.SoundId = 'rbxassetid://8090948798'
		allpurpose.Parent = box allpurpose.Parent = nil
		stunned = true
		guymsh.MeshId = 'rbxassetid://' ..doomguy_meshes["Hurt"]
		rifmsh.MeshId = 'rbxassetid://' ..rifle_meshes["Hurt"]
		setrifgrip("Hurt")	
		task.wait(1/4)
		stunned = false
	end
	oldhp = hp
end)
coroutine.wrap(function()
	while task.wait() do
		if attack == false and stunned == false then
			if owner.Character.Humanoid.MoveDirection ~= Vector3.new() and falling == false then
				walkframe += 1/fps
				local fr = math.floor(walkframe % 4)
				if fr == 0 then fr = 4 end
				guymsh.MeshId = 'rbxassetid://' ..doomguy_meshes["Walk " ..fr]
				rifmsh.MeshId = 'rbxassetid://' ..rifle_meshes["Walk " ..fr]
				footsteps.Volume = 1
				setrifgrip("Walk " ..fr)
			elseif owner.Character.Humanoid.MoveDirection == Vector3.new() and falling == false then
				guymsh.MeshId = 'rbxassetid://' ..doomguy_meshes["Walk 1"]
				rifmsh.MeshId = 'rbxassetid://' ..rifle_meshes["Walk 1"]
				footsteps.Volume = 0
				setrifgrip("Walk 1")
			elseif falling == true then
				guymsh.MeshId = 'rbxassetid://' ..doomguy_meshes["Jump"]
				rifmsh.MeshId = 'rbxassetid://' ..rifle_meshes["Jump"]
				footsteps.Volume = 0
				setrifgrip("Jump")
			end
		end
	end
end)()
workspace.DescendantRemoving:Connect(function(s)
	if s == script or s == owner.Character then
		owner.CameraMode = Enum.CameraMode.Classic
		owner.CameraMode = Enum.CameraMode.Classic
		script:ClearAllChildren()
		script.Disabled = true
	end
end)
NLS([[
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
		self.Velocity = self.Velocity + Vector3.new(x, y, z)
	end
	function spring.update(self, dt)
		local scaledDeltaTime = math.min(dt,1) * self.Speed / ITERATIONS	
		for i = 1, ITERATIONS do
			local iterationForce = self.Target - self.Position
			local acceleration	= (iterationForce * self.Force) / self.Mass
			acceleration = acceleration - (self.Velocity * self.Damping)
			self.Velocity = self.Velocity + (acceleration * scaledDeltaTime)
			self.Position = self.Position + (self.Velocity * scaledDeltaTime)
		end
	return self.Position
	end
	return spring
end
local re = script.Parent
local s = re.val.Value
local cam = workspace.CurrentCamera
local m = owner:GetMouse()
script.Parent = workspace
local div = 9
owner.Character.Humanoid.CameraOffset = Vector3.new(0, .55, 0)
local wc = SPRING.create()
local sway = SPRING.create()
local fire = SPRING.create()
local UIS = game:GetService("UserInputService")
local bobspeed = 1
local bobmod = .1
local cd = false
local canfire = true
local new = false
owner.CharacterAdded:Connect(function()
	new = true
end)
owner.CameraMode = Enum.CameraMode.LockFirstPerson
local function gb(addition, speed, modifier)
	return math.sin(tick() * addition * speed) * modifier
end
local info = {
	["Shotgun"] = {
		["Max"] = 8,
		["Ammo"] = 8,
		["Offset"] = CFrame.new(0, -2, 0) * CFrame.Angles(0, math.rad(-90), 0)
	},
	["SSG"] = {
		["Max"] = 2,
		["Ammo"] = 2,
		["Offset"] = CFrame.new(3, -3, 0) * CFrame.Angles(0, math.rad(-90), 0)
	}
}
local sg_meshes = {
	["Normal"] = 9390473641,
	["Pump A"] = 9390473247,
	["Pump B"] = 9390472878,
	["Pump C"] = 9390472638,
	["Reload Start A"] = 9399670462,
	["Reload Start B"] = 9400215299,
	["Reload Start C"] = 9400214153,
	["Reload A"] = 9399659074,
	["Reload B"] = 9399662597,
	["Reload C"] = 9399665241,
	["Reload D"] = 9399667752
}
local ssg_meshes = {
	["Normal"] = 9415219583,
	["Reload 1"] = 9415219276,
	["Reload 2"] = 9415219026,
	["Reload 3"] = 9415218803,
	["Reload 4"] = 9415218467,
	["Reload 5"] = 9415218333,
	["Reload 6"] = 9415218206,
	["Reload 7"] = 9415217970,
	["Reload 8"] = 9415217785,
	["Reload 9"] = 9415217613,
	["Reload 10"] = 9415217436,
	["Reload 11"] = 9415217277,
	["Reload 12"] = 9415216961,
	["Reload 13"] = 9415216748,
	["Reload 14"] = 9415216591,
	["Reload 15"] = 9415216352,
	["Reload 16"] = 9415216118,
	["Reload 17"] = 9415215948,
	["Reload 18"] = 9415215730
}
UIS.InputBegan:Connect(function(i, g)
	if i.KeyCode == Enum.KeyCode.LeftShift then
		re:FireServer("run", "a", "a")
	end
end)
UIS.InputEnded:Connect(function(i, g)
	if i.KeyCode == Enum.KeyCode.LeftShift then
		re:FireServer("walk", "a", "a")
	end
end)
local selected = info.Shotgun
local offset = info.Shotgun.Offset
local vm = Instance.new("Model", script)
	vm.Name = "Viewmodel"
local sg = Instance.new("SpawnLocation", vm)
	sg.Enabled = false
	sg.Name = "shotgun"
	sg.CanCollide = false
	sg.Anchored = true
	sg.Size = Vector3.new(50, 29.724, 24.016) / div
local sgmsh = Instance.new("SpecialMesh", sg)
	sgmsh.MeshId = 'rbxassetid://' ..sg_meshes["Normal"]
	sgmsh.TextureId = 'rbxassetid://9390473711'
	sgmsh.Scale = Vector3.new(1, 1, 1) / div
	sgmsh.Offset = Vector3.new(-2.55, 0, 0)
local ssg = Instance.new("SpawnLocation", vm)
	ssg.Enabled = false
	ssg.Name = "super shotgun"
	ssg.CanCollide = false
	ssg.Anchored = true
	ssg.Size = Vector3.new(50, 18.627, 39.804) / (div / 2)
	ssg.Transparency = 1
local ssgmsh = Instance.new("SpecialMesh", ssg)
	ssgmsh.MeshId = 'rbxassetid://' ..ssg_meshes["Normal"]
	ssgmsh.TextureId = 'rbxassetid://9415223601'
	ssgmsh.Scale = Vector3.new(1, 1, 1) / (div / 2)
	ssgmsh.Offset = Vector3.new(-1.55, 0, 0)
local fps = 16
local recoffset = CFrame.new()
coroutine.wrap(function()
	while task.wait() do
		recoffset = recoffset:Lerp(CFrame.new(), .25)
	end
end)()
local function sgpump()
	re:FireServer("sgpump", "A", "A")
	sgmsh.MeshId = 'rbxassetid://' ..sg_meshes["Pump A"]
	task.wait(1/fps)
	sgmsh.MeshId = 'rbxassetid://' ..sg_meshes["Pump B"]
	task.wait(1/fps)
	sgmsh.MeshId = 'rbxassetid://' ..sg_meshes["Pump C"]
	task.wait(1/(fps/2))
	sgmsh.MeshId = 'rbxassetid://' ..sg_meshes["Pump B"]
	task.wait(1/fps)
	sgmsh.MeshId = 'rbxassetid://' ..sg_meshes["Pump A"]
	task.wait(1/fps)
	sgmsh.MeshId = 'rbxassetid://' ..sg_meshes["Normal"]
end
local function spread(min, max)
	return CFrame.Angles(math.rad(math.random(min, max)), math.rad(math.random(min, max)), math.rad(math.random(min, max)))
end
local sgat = Instance.new("Attachment", sg)
sgat.CFrame = CFrame.new(-6, 1.35, -.95)
local ssgat = Instance.new("Attachment", ssg)
ssgat.CFrame = CFrame.new(-7.5, 1.35, 2)
local flash = Instance.new("ParticleEmitter", sgat)
	flash.Enabled = false
	flash.LockedToPart = true
	flash.Speed = NumberRange.new(0, 0)
	flash.Texture = 'rbxassetid://9400234823'
	flash.Rotation = NumberRange.new(-180, 180)
	flash.Lifetime = NumberRange.new(.15, .15)
	flash.Size = NumberSequence.new(1.5)
local function sgreload()
	if info.Shotgun.Ammo == info.Shotgun.Max then
		sgpump()
	else
	info.Shotgun.Offset = CFrame.new(0, -2, .75) * CFrame.Angles(0, math.rad(-90), 0) 
	sgmsh.MeshId = 'rbxassetid://' ..sg_meshes["Reload Start A"]
	task.wait(1/fps)
	sgmsh.MeshId = 'rbxassetid://' ..sg_meshes["Reload Start B"]
	task.wait(1/fps)
	sgmsh.MeshId = 'rbxassetid://' ..sg_meshes["Reload Start C"]
	task.wait(1/fps)
	for i = 1, (info.Shotgun.Max - info.Shotgun.Ammo)  do
		sgmsh.MeshId = 'rbxassetid://' ..sg_meshes["Reload A"]
		task.wait(1/fps)
		sgmsh.MeshId = 'rbxassetid://' ..sg_meshes["Reload B"]
		task.wait(1/fps)
		sgmsh.MeshId = 'rbxassetid://' ..sg_meshes["Reload C"]
		re:FireServer("sg shell in", "A", "A")
		info.Shotgun.Ammo = info.Shotgun.Ammo + 1
		task.wait(1/fps)
		sgmsh.MeshId = 'rbxassetid://' ..sg_meshes["Reload D"]
		task.wait(1/fps)
		sgmsh.MeshId = 'rbxassetid://' ..sg_meshes["Reload Start C"]
		task.wait(1/fps)
	end
	info.Shotgun.Ammo = info.Shotgun.Max
	sgmsh.MeshId = 'rbxassetid://' ..sg_meshes["Reload Start C"]
	task.wait(1/fps)
	sgmsh.MeshId = 'rbxassetid://' ..sg_meshes["Reload Start B"]
	task.wait(1/fps)
	sgmsh.MeshId = 'rbxassetid://' ..sg_meshes["Reload Start A"]
	task.wait(1/fps)
	sgmsh.MeshId = 'rbxassetid://' ..sg_meshes["Normal"]
	info.Shotgun.Offset = CFrame.new(0, -2, 0) * CFrame.Angles(0, math.rad(-90), 0)
	sgpump()
	end
end
local function ssgreload()
	canfire = false
	re:FireServer("ssg reload", "A", "A")
	info.SSG.Offset = CFrame.new(3.5, -3.5, 0) * CFrame.Angles(0, math.rad(-90), 0)
	for i = 1, 18 do
		ssgmsh.MeshId = 'rbxassetid://' ..ssg_meshes["Reload " ..tostring(i)]
		if i == 4 then
			task.wait(1/(fps/2))
		else
			task.wait(1/fps)
		end
	end
	info.SSG.Ammo = info.SSG.Max
	info.SSG.Offset = CFrame.new(3, -3, 0) * CFrame.Angles(0, math.rad(-90), 0)
	task.wait(1/fps)
	ssgmsh.MeshId = 'rbxassetid://' ..ssg_meshes["Normal"]
	canfire = true
end
local firing = false
local function sgfire()
		flash:Emit(1)
		firing = true
		info.Shotgun.Ammo = info.Shotgun.Ammo - 1
		coroutine.wrap(function()
			re:FireServer("fireanim", 6779445744, cam.CFrame.lookVector * 50)
			for i = 1, 7 do
				re:FireServer("fire", cam.CFrame, (cam.CFrame * spread(-8, 8)).lookVector * 50)
			end
		end)()
		local rand = math.random(50, 75) / 100
		recoffset = CFrame.new(.75, .25, 0) * CFrame.Angles(0, 0, math.rad(-6))
		fire:shove(Vector3.new(rand,-1.5,5))
		task.wait(.05)
		fire:shove(Vector3.new(-rand,1.5,-5))
		task.wait(.5)
		sgpump()
		task.wait(.05)
		firing = false
		if info.Shotgun.Ammo <= 0 then
			sgreload()
		end
		cd = false
		return
end
local function ssgfire(taken)
	flash:Emit(1)
	firing = true
	info.SSG.Ammo = info.SSG.Ammo - taken
	coroutine.wrap(function()
		re:FireServer("fireanim", 6839481031, cam.CFrame.lookVector * 50)
		for i = 1, taken * 10 do
			re:FireServer("fire", cam.CFrame, (cam.CFrame * spread(-8, 8)).lookVector * 50)
		end
	end)()
	local rand = math.random(50, 75) / 100
	recoffset = CFrame.new(.75, .25, 0) * CFrame.Angles(0, 0, math.rad(-6))
	fire:shove(Vector3.new(rand,-1.5,5))
	task.wait(.05)
	fire:shove(Vector3.new(-rand,1.5,-5))
	task.wait(.5)
	if info.SSG.Ammo <= 0 then
		ssgreload()
	end
	task.wait(.05)
	firing = false
end
m.KeyDown:Connect(function(k)
	if k == 'r' and canfire == true and firing == false then
		if selected == info.Shotgun then
			canfire = false
			sgreload()
			canfire = true
		elseif selected == info.SSG and info.SSG.Ammo ~= info.SSG.Max then
			canfire = false
			ssgreload()
			canfire = true
		end
	elseif k == 'q' and cd == false and canfire == true and firing == false then
		if selected == info.SSG and info.SSG.Ammo > 0 then
			cd = true
			flash.Parent = ssgat
			ssgfire(1)
			cd = false
			return
		end
	elseif k == '1' and firing == false and canfire == true and selected == info.SSG then
		selected = info.Shotgun
		ssg.Transparency = 1
		sg.Transparency = 0
		recoffset = CFrame.new(2.25, 0, 1.5)
	elseif k == '2' and firing == false and canfire == true and selected == info.Shotgun then
		selected = info.SSG
		sg.Transparency = 1
		ssg.Transparency = 0
		recoffset = CFrame.new(2.25, 0, 1.5)
	end
end)
m.Button1Down:Connect(function()
	if cd == false and canfire == true then
		cd = true
		if selected == info.Shotgun and info.Shotgun.Ammo > 0 then
			flash.Parent = sgat
			sgfire()
		elseif selected == info.SSG and info.SSG.Ammo == info.SSG.Max then
			flash.Parent = ssgat
			ssgfire(2)
		end
		cd = false
		return
	end
end)
local tsz = .1
local bsp = .1
local tilt = 0
local sv = 0
local function lerp(a, b, t)
	return a + (b - a) * t
end
local function calcsin(speed, intensity)
	sv = sv + speed 
	if sv > (math.pi * 2) then sv = 0 end
	local sy = intensity * math.sin(2 * sv)
	local sx = intensity * math.sin(sv)
	local cf = CFrame.new(sx, sy, 0)
	return cf
end
local psx = 0
local psy = 0
local cdj = false
local dj = false
local op = owner.Character.Humanoid.JumpPower
local tbj = .1
local djpm = 2
local function jp()
	if cdj and not dj then
		dj = true
		re:FireServer("jump", "A", "A")
		owner.Character.Humanoid.JumpPower = op * djpm
		owner.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
	end
end
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
local d = false
game:GetService("RunService").RenderStepped:Connect(function(dt)
	local s, e = pcall(function()
	       	if owner.Character == nil or owner.Character.Humanoid.Health <= 0 or not s or new == true then
            		owner.CameraMode = Enum.CameraMode.Classic
            		vm:Destroy()
            		script:ClearAllChildren()
           		script.Disabled = true
      		end
		local movedir = owner.Character.Humanoid.MoveDirection
		local mv = cam.CFrame:VectorToObjectSpace(movedir)
		tilt = math.clamp(lerp(tilt, mv.X * tsz, .1), -.25, .1) 
		local scf = calcsin(bsp, mv.Z)
		local lsx = lerp(psx, scf.X, .1)
		local lsy = lerp(psy, scf.Y, .1)
		cam.CFrame = cam.CFrame * CFrame.Angles(0, 0, -tilt) * CFrame.new(lsx, lsy, 0)
		psx = lsx
		psy = lsy
		local vel = (movedir * 10)
		local mdt = UIS:GetMouseDelta()
		sway:shove(Vector3.new(mdt.x / 200, mdt.y / 200))
		local msway = Vector3.new(gb(10,bobspeed,bobmod), gb(5,bobspeed,bobmod), gb(5,bobspeed,bobmod))
		wc:shove((msway / 25) * dt * 60 * vel.Magnitude)
		local sway = sway:update(dt)
		local wc = wc:update(dt)
		local recoil = fire:update(dt)
		cam.CFrame = cam.CFrame * CFrame.new(0, recoil.y, recoil.z) * CFrame.Angles(recoil.x, 0, 0)
		sg.CFrame = cam.CFrame:ToWorldSpace(selected.Offset * recoffset)
		sg.CFrame = sg.CFrame:ToWorldSpace(CFrame.new(wc.x / 2,wc.y / 2,0))
		sg.CFrame = sg.CFrame * CFrame.Angles(0,-sway.x,sway.y)
		sg.CFrame = sg.CFrame * CFrame.Angles(0,wc.y,wc.x)
--
		ssg.CFrame = cam.CFrame:ToWorldSpace(selected.Offset * recoffset)
		ssg.CFrame = ssg.CFrame:ToWorldSpace(CFrame.new(wc.x / 2,wc.y / 2,0))
		ssg.CFrame = ssg.CFrame * CFrame.Angles(0,-sway.x,sway.y)
		ssg.CFrame = ssg.CFrame * CFrame.Angles(0,wc.y,wc.x)
	end)
	if d == false and (not s) then
		d = true
		print(e)
	end
end)
]], re)
