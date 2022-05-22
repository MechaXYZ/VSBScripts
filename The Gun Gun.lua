local debug = false
local bounce = false
local speed = 500
local maxdist = 1000
local gravity = Vector3.new(0, 0, 0)
local bmin = -3
local bmax = 3
local http = game:GetService("HttpService")
local f = http:GetAsync("https://raw.githubusercontent.com/MechaXYZ/VSBScripts/main/FastCast%20Module")
local FastCast = loadstring(f)()
	FastCast.DebugLogging = debug
	FastCast.VisualizeCasts = debug
local caster = FastCast.new()
local params = RaycastParams.new()
	params.IgnoreWater = true
	params.FilterType = Enum.RaycastFilterType.Blacklist
	params.FilterDescendantsInstances = {owner.Character}
local bullets = Instance.new("Folder", script)
	bullets.Name = "bullets"
local temp = Instance.new("SpawnLocation")
	temp.Enabled = false
	temp.Material = Enum.Material.Neon
	temp.BrickColor = BrickColor.new("Bright yellow")
	temp.CanCollide = false
	temp.Anchored = true
	temp.Size = Vector3.new(.2, .2, .2)
	temp.Shape = Enum.PartType.Ball
local at0, at1 = Instance.new("Attachment", temp), Instance.new("Attachment", temp)
	at0.CFrame = CFrame.new(-.1, 0, 0)
	at1.CFrame = CFrame.new(.1, 0, 0)
local trl = Instance.new("Trail", temp)
	trl.Attachment0 = at0
	trl.Attachment1 = at1
	trl.Color = ColorSequence.new(temp.Color)
	trl.WidthScale = NumberSequence.new(1, 0)
	trl.Lifetime = .35

local function findhum(p)
	local hum = p:FindFirstAncestorOfClass("Model", true) and p:FindFirstAncestorOfClass("Model", true):FindFirstChildOfClass("Humanoid")
	if hum then
		return hum
	else
		return false
	end
end

local function canbounce(cast, res, vel)
    local hits = cast.UserData.Hits
    if (hits == nil) then
        cast.UserData.Hits = 1
    else
        cast.UserData.Hits += 1
    end
    if (cast.UserData.Hits > 3) then
        return false
    end
    local hit = res.Instance
    if hit ~= nil then
        local humanoid = findhum(hit)
        if humanoid then
            humanoid.Health -= 10
        end
    end
    return true
end

local behavior = FastCast.newBehavior()
behavior.RaycastParams = params
behavior.MaxDistance = maxdist
behavior.HighFidelityBehavior = FastCast.HighFidelityBehavior.Default
behavior.Acceleration = gravity
behavior.AutoIgnoreContainer = true
behavior.CosmeticBulletContainer = bullets
behavior.CosmeticBulletTemplate = temp

local function reflect(norm, bnorm)
    return bnorm - (2 * bnorm:Dot(norm) * norm)
end

function hitfunc(cast, res, vel, bullet)
    local p = res.Position
    local normal = res.Normal
    local hit = res.Instance
    if hit ~= nil then
        local humanoid = findhum(hit)
        if humanoid then
            humanoid.Health -= 10
        end
    end
end
 
function bouncefunc(cast, res, vel, bullet)
    local position = res.Position
    local normal = res.Normal 
    local norm = reflect(normal, vel.Unit)
    cast:SetVelocity(norm * vel.Magnitude) 
    cast:SetPosition(position)  
end
 
function update(cast, so, sdir, length, segmentVelocity, bullet)
    if bullet == nil then return end
    local blength = bullet.Size.Z / 2
    local cf = CFrame.new(so, so + sdir)
    bullet.CFrame = cf * CFrame.new(0, 0, -(length - blength))
end
 
function terminate(cast)
    local bullet = cast.RayInfo.CosmeticBulletObject
    if bullet ~= nil then
		bullet:Destroy()
	end
end

caster.RayHit:Connect(hitfunc)
caster.RayPierced:Connect(bouncefunc)
caster.LengthChanged:Connect(update)
caster.CastTerminating:Connect(terminate)

local function shoot(pos, direction)
	local rnd = Random.new()
	local rad = math.rad
    local dcf = CFrame.new(Vector3.new(), direction)
    local direction = (dcf * CFrame.Angles(rad(rnd:NextNumber(bmin, bmax)), rad(rnd:NextNumber(bmin, bmax)), rad(rnd:NextNumber(bmin, bmax)))).lookVector
    local newspeed = (direction * speed)
    if bounce then
        CastBehavior.CanPierceFunction = canbounce
    end
    local b = caster:Fire(pos, direction, newspeed, behavior)
end

local gungun = Instance.new("Tool", owner.Backpack)
	gungun.Name = "The Gun Gun"
	gungun.ToolTip = "You should fire it!"
	gungun.Grip = CFrame.new(.85, -.25, 0) * CFrame.Angles(0, math.rad(90), 0)
local h = Instance.new("SpawnLocation", gungun)
	h.Name = "Handle"
	h.Enabled = false
	h.CanCollide = false
	h.Massless = true
	h.Archivable = true
	h.Size = Vector3.new(2.9, 1.4, .4)
local msh = Instance.new("SpecialMesh", h)
	msh.MeshId = 'rbxassetid://9700148913'
	msh.TextureId = 'rbxassetid://9700186025'
	msh.Scale = Vector3.new(1, 1, 1)

local rad = math.rad
local tw = game:GetService("TweenService")

local function angle(min, max)
	local rnd = Random.new()
	-- return CFrame.Angles(rad(rnd:NextNumber(min, max)), rad(rnd:NextNumber(min, max)), rad(rnd:NextNumber(min, max)))
	return CFrame.Angles(rad(rnd:NextInteger(min, max)), rad(rnd:NextInteger(min, max)), rad(rnd:NextInteger(min, max)))
end

local function clone(cf, sprd, p)
	local a = h:Clone()
	a.Parent = p
	a.CanCollide = false
	a.Name = "Gun Gun Gun"
	a.Anchored = true
	a.CFrame = cf * angle(-(sprd), sprd)
	return a
end
local fire = Instance.new("Sound", game:GetService("VRService"))
	fire.SoundId = 'rbxassetid://196561491'
	fire.Volume = 1
	fire.EmitterSize = 10
	fire.PlayOnRemove = true
local click = Instance.new("Sound", game:GetService("VRService"))
	click.SoundId = 'rbxassetid://1136276162'
	click.Volume = 2
	click.EmitterSize = 10
	click.PlayOnRemove = true
local count = 0
gungun.Activated:Connect(function()
	click.Parent = h
	click.Parent = nil
	local olddir = (h.CFrame * CFrame.new(-350, 0, 0)).p
	count += 1
	local sprd = 0
	local faketbl = Instance.new("Model", script)
	faketbl.Name = "Gun Gun Gun Group #" ..count
	local new = clone(h.CFrame, sprd, faketbl)
	local cf = new.CFrame * CFrame.new(-3, 0, 0)
	tw:Create(new, TweenInfo.new(.35), {CFrame = cf}):Play()
	new:SetAttribute("sprd", 1)
	task.wait(.5)
	for i = 1, 7 do
		click.Parent = h
		click.Parent = nil
		sprd += (3 + (i * 2))
		for _, v in pairs(faketbl:GetChildren()) do
			local new = clone(v.CFrame, v:GetAttribute("sprd"), faketbl)
			local cf = new.CFrame * CFrame.new(-(3 + (i / 4)), 0, 0)
			tw:Create(new, TweenInfo.new(.35), {CFrame = cf}):Play()
			local rnd = math.random(-1, 1)
			local sprd2 = v:GetAttribute("sprd")
			if rnd == 0 or rnd == 1 then
				new:SetAttribute("sprd", (sprd2 + (2 * i)))
			elseif rnd == -1 then
				new:SetAttribute("sprd", (sprd2 - (2 * i)))
			end
		end
		task.wait(.5)
	end
	print(#faketbl:GetChildren())
	task.wait(.5)
	for _, v in pairs(faketbl:GetChildren()) do
		coroutine.wrap(function()
		-- tw:Create(v, TweenInfo.new(.5), {CFrame = CFrame.lookAt(v.Position, olddir)}):Play()
		task.wait(math.random(1, 5) / 10)
			for i = 1, math.random(15, 20) do
				fire.Parent = v
				fire.Parent = nil
				local ang = angle(-3, 3)
				shoot(v.Position, ((v.CFrame * CFrame.Angles(0, math.rad(90), 0)) * ang).lookVector * 25)
				local rnd = Random.new()
				task.wait(rnd:NextNumber(.25, .5))
			end
			v.Parent = script
			tw:Create(v, TweenInfo.new(.5), {Transparency = 1, CFrame = v.CFrame * CFrame.new(0, -.75, 0)}):Play()
			task.wait(.5)
			v:Destroy()
		end)()
	end
end)
