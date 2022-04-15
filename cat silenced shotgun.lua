local DEBUG = false
local PIERCE = false
local BULLET_SPEED = 1000
local BULLET_MAXDIST = 10000
local BULLET_GRAVITY = Vector3.new()
local MIN_BULLET_SPREAD_ANGLE = 1
local MAX_BULLET_SPREAD_ANGLE = 4
local http = game:GetService("HttpService")
local f = http:GetAsync("https://raw.githubusercontent.com/MechaXYZ/VSBScripts/main/FastCast%20Module")
local FastCast = loadstring(f)()
local caster = FastCast.new()
local CastParams = RaycastParams.new()
	CastParams.IgnoreWater = true
	CastParams.FilterType = Enum.RaycastFilterType.Blacklist
	CastParams.FilterDescendantsInstances = {owner.Character, Tool0}
	-- FastCast.DebugLogging = DEBUG
	FastCast.VisualizeCasts = DEBUG
local function HasHumanoid(p)
	if p:FindFirstAncestorOfClass("Model", true) and p:FindFirstAncestorOfClass("Model", true):FindFirstChildOfClass("Humanoid") then
		return p:FindFirstAncestorOfClass("Model", true):FindFirstChildOfClass("Humanoid")
	else
		return false
	end
end
local function CanRayPierce(cast, rayResult, segmentVelocity)
	local hits = cast.UserData.Hits
	if (hits == nil) then
		cast.UserData.Hits = 1
	else
		cast.UserData.Hits += 1
	end
	if (cast.UserData.Hits > 3) then
		return false
	end
	local hitPart = rayResult.Instance
	if hitPart ~= nil and hitPart.Parent ~= nil then
		local humanoid = HasHumanoid(hitPart)
		if humanoid then
			humanoid.Health -= 10
		end
	end
	return true
end

local CastBehavior = FastCast.newBehavior()
	CastBehavior.RaycastParams = CastParams
	CastBehavior.MaxDistance = BULLET_MAXDIST
	CastBehavior.HighFidelityBehavior = FastCast.HighFidelityBehavior.Default
	CastBehavior.Acceleration = BULLET_GRAVITY
	CastBehavior.AutoIgnoreContainer = true

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
			humanoid.Health -= 10
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
		if CastBehavior.CosmeticBulletProvider ~= nil then
			CastBehavior.CosmeticBulletProvider:ReturnPart(cosmeticBullet)
		else
			cosmeticBullet:Destroy()
		end
	end
end
caster.RayHit:Connect(OnRayHit)
caster.RayPierced:Connect(OnRayPierced)
caster.LengthChanged:Connect(OnRayUpdated)
caster.CastTerminating:Connect(OnRayTerminated)

local function Fire(pos, direction)
    local directionalCF = CFrame.new(Vector3.new(), direction)
    local direction = (directionalCF * CFrame.fromOrientation(0, 0, math.random(1, math.pi)) * CFrame.fromOrientation(math.rad(math.random(MIN_BULLET_SPREAD_ANGLE, MAX_BULLET_SPREAD_ANGLE)), 0, 0)).LookVector
    -- local myMovementSpeed = humanoidRootPart.Velocity
    local modifiedBulletSpeed = (direction * BULLET_SPEED)
    if PIERCE then
        CastBehavior.CanPierceFunction = CanRayPierce
    end
    local simBullet = caster:Fire(pos, direction, modifiedBulletSpeed, CastBehavior)
end

local shotgun = Instance.new("Tool", owner.Backpack)
shotgun.Name = "cat silenced shotgun"
shotgun.ToolTip = "e"
shotgun.Grip = CFrame.new(-.5, 0, -2) * CFrame.Angles(0, math.pi, math.rad(90))
local h = Instance.new("SpawnLocation", shotgun)
h.Enabled = false
h.Massless = true
h.Name = "Handle"
h.CanCollide = false
h.Size = Vector3.new(1.53, 0.332, 5.785)
local cat = Instance.new("SpawnLocation", h)
cat.Enabled = false
cat.Massless = true
cat.Name = "cat"
cat.Size = Vector3.new(32.093, 25.012, 50) / 10
local w = Instance.new("Weld", h)
w.Part0 = cat
w.Part1 = h
w.C0 = CFrame.Angles(0, 0, math.pi)
w.C1 = CFrame.new(.6, .2, 2.25) * CFrame.Angles(0, math.pi, math.rad(-90))
local msh = Instance.new("SpecialMesh", cat)
msh.MeshId = 'rbxassetid://9375209950'
msh.TextureId = 'rbxassetid://9375210232'
msh.Scale = Vector3.new(.1, .1, .1)
local msh = Instance.new("SpecialMesh", h)
msh.MeshId = 'rbxassetid://437965699'
msh.TextureId = 'rbxassetid://459027629'
msh.Scale = Vector3.new(.1, .1, .1)
local fire = Instance.new("Sound", game:GetService("VRService"))
fire.SoundId = 'rbxassetid://8684640388'
fire.Volume = .75
fire.EmitterSize = 10
fire.PlayOnRemove = true
local meows = {5104257032, 2349952507, 7128655475, 362658560, 8593059632}
local allpurpose = Instance.new("Sound", game:GetService("VRService"))
allpurpose.SoundId = 'rbxassetid://' ..meows[math.random(1, #meows)]
allpurpose.Volume = 2
allpurpose.EmitterSize = 10
allpurpose.PlayOnRemove = true
local recoil = CFrame.new()
local function play(sound)
	sound.Parent = h
	sound.Parent = nil
end
coroutine.wrap(function()
	while task.wait() do
		recoil = recoil:Lerp(CFrame.Angles(0, 0, 0), .15)
		shotgun.Grip = CFrame.new(-.5, 0, -2) * CFrame.Angles(0, math.pi, math.rad(90)) * recoil
	end
end)()
shotgun.Equipped:Connect(function()
		CastParams.FilterDescendantsInstances = {shotgun.Parent, shotgun}
end)
shotgun.Activated:Connect(function()
	allpurpose.SoundId = 'rbxassetid://' ..meows[math.random(1, #meows)]
	play(allpurpose)
	play(fire)
	recoil = CFrame.new(-.25, 0, -.5) * CFrame.Angles(math.rad(-15), 0, 0)
	for i = 1, 7 do
		Fire(h.Position, shotgun.Parent.HumanoidRootPart.CFrame.lookVector * 50)
	end
end)
