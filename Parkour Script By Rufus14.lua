--By Rufus14
heartbeat = game:GetService("RunService").Heartbeat
--owner = game:GetService("Players")[script.Parent.Name]
NLS([[
for i,v in pairs(game.ReplicatedStorage:GetChildren()) do
	if v.Name == "ParkourRemote" then
		v:destroy()
	end
end
local remote = game.ReplicatedStorage:WaitForChild("ParkourRemote")
owner = game:GetService("Players").LocalPlayer
mouse = owner:GetMouse()
workspace.CurrentCamera.FieldOfView = 115
owner.CameraMode = "LockFirstPerson"
local part = Instance.new("Part", owner.Character.Head)
part.Size = Vector3.new(0.1,0.1,0.1)
part.Transparency = 1
part.CanCollide = false
part.Name = "camera"
part:BreakJoints()
local weld = Instance.new("Weld", part)
weld.Part0 = owner.Character.Head
weld.Part1 = part
weld.C0 = CFrame.new(0,0,-1)
workspace.CurrentCamera.CameraSubject = part
owner.Character.Head.Transparency = 1
cangoup = true
rolling = false
if owner.Character.Head:findFirstChildOfClass("Decal") then
	owner.Character.Head:findFirstChildOfClass("Decal").Transparency = 1
end
function death()
	local color = Instance.new("ColorCorrectionEffect", workspace.CurrentCamera)
	game.Debris:AddItem(color, 5)
	local deathsound = Instance.new("Sound", workspace.CurrentCamera)
	deathsound.SoundId = "rbxassetid://1038809455"
	deathsound.Volume = 10
	for i,v in pairs(owner.Character.Head:GetChildren()) do
		if v.ClassName == "Sound" then
			v:destroy()
		end
	end
	for i = 1,8 do
		color.Brightness = color.Brightness + 0.135
		workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * CFrame.fromEulerAnglesXYZ(0.04,0,0)
		game:GetService("RunService").RenderStepped:wait()
	end
	deathsound:Play()
	workspace.CurrentCamera.FieldOfView = 70
	workspace.CurrentCamera.CameraSubject = workspace
	workspace.CurrentCamera.CFrame = CFrame.new(9999999999999,9999999999999,9999999999999)
	wait(4.5)
	owner.CameraMode = "Classic"
	workspace.CurrentCamera.CameraSubject = owner.Character
end
owner.Character:findFirstChildOfClass("Humanoid").Died:connect(death)
function action(key)
	key = key:lower()
	if key == "e" then
		remote:FireServer("slide")
	end
	if key == "c" then
		remote:FireServer("rollon")
	end
end
function undoaction(key)
	key = key:lower()
	if key == "c" then
		remote:FireServer("rolloff")
	end
end
mouse.KeyDown:connect(action)
mouse.KeyUp:connect(undoaction)
function mouseaction()
	remote:FireServer("kick")
end
mouse.Button2Down:connect(mouseaction)
function mouseaction2()
	remote:FireServer("punch")
end
mouse.Button1Down:connect(mouseaction2)
function visiblebody()
	if owner.Character.HumanoidRootPart:findFirstChild("FALLING") then
		workspace.CurrentCamera.CFrame = owner.Character.Head.CFrame * CFrame.new(0,0,-1)
		workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * CFrame.fromEulerAnglesXYZ(math.random(-1,1)/100,math.random(-1,1)/100,math.random(-1,1)/100)
	end
	if owner.Character.HumanoidRootPart:findFirstChild("ow") then
		workspace.CurrentCamera.CFrame = owner.Character.Head.CFrame * CFrame.new(0,0,-1)
	end
	if owner.Character.HumanoidRootPart:findFirstChild("rolling") then
		rolling = true
		workspace.CurrentCamera.CFrame = owner.Character.Head.CFrame * CFrame.new(0,0,-1)
	end
	if not owner.Character.HumanoidRootPart:findFirstChild("rolling") and rolling then
		rolling = false
	end
	if not owner.Character.HumanoidRootPart:findFirstChild("goingup") and not owner.Character.HumanoidRootPart.Anchored and not owner.Character.HumanoidRootPart:findFirstChild("sliding") and not owner.Character.HumanoidRootPart:findFirstChild("FALLING") and not owner.Character.HumanoidRootPart:findFirstChild("ow") and not owner.Character.HumanoidRootPart:findFirstChild("climbing") and not owner.Character:findFirstChildOfClass("Humanoid").PlatformStand and not owner.Character:findFirstChildOfClass("Humanoid").Sit then
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,Vector3.new(mouse.Hit.p.x,game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position.y,mouse.Hit.p.z))
	end
	if owner.Character.HumanoidRootPart:findFirstChild("goingup") and cangoup then
		cangoup = false
		local function lookup()
			for i = 1,15 do
				workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * CFrame.fromEulerAnglesXYZ(0.05,0,0)
				game:GetService("RunService").RenderStepped:wait()
			end
		end
		spawn(lookup)
	end
	if not owner.Character.HumanoidRootPart:findFirstChild("goingup") and not cangoup then
		cangoup = true
		local function lookup()
			for i = 1,15 do
				workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * CFrame.fromEulerAnglesXYZ(-0.05,0,0)
				game:GetService("RunService").RenderStepped:wait()
			end
		end
		spawn(lookup)
	end
	for i,v in pairs(owner.Character:GetChildren()) do
		if v.ClassName == "Part" and v.Name ~= "Head" then
			v.LocalTransparencyModifier = 0
		end
		if v.ClassName == "Accessory" then
			v.Handle.Transparency = 1
		end
	end
end
game:GetService("RunService").RenderStepped:connect(visiblebody)
]], owner.Character)
wait(0.8)
local remote = Instance.new("RemoteEvent", game.ReplicatedStorage)
remote.Name = "ParkourRemote"
humanoidofowner = owner.Character:findFirstChildOfClass("Humanoid")
humanoidofowner.CameraOffset = Vector3.new(0,0,-1)
rootpart = owner.Character:findFirstChild("HumanoidRootPart")
local rightarm = Instance.new("Weld", owner.Character.Torso)
rightarm.Part0 = owner.Character.Torso
rightarm.Part1 = owner.Character["Right Arm"]
rightarm.C0 = CFrame.new(1.5,0,0)
rightarm.Name = "RightArmWeld"
local rightleg = Instance.new("Weld", owner.Character.Torso)
rightleg.Part0 = owner.Character.Torso
rightleg.Part1 = owner.Character["Right Leg"]
rightleg.C0 = CFrame.new(0.5,-2,0)
rightleg.Name = "RightLegWeld"
local leftarm = Instance.new("Weld", owner.Character.Torso)
leftarm.Part0 = owner.Character.Torso
leftarm.Part1 = owner.Character["Left Arm"]
leftarm.C0 = CFrame.new(-1.5,0,0)
leftarm.Name = "LeftArmWeld"
local leftleg = Instance.new("Weld", owner.Character.Torso)
leftleg.Part0 = owner.Character.Torso
leftleg.Part1 = owner.Character["Left Leg"]
leftleg.C0 = CFrame.new(-0.5,-2,0)
leftleg.Name = "LeftLegWeld"
local head = Instance.new("Weld", owner.Character.Torso)
head.Part0 = owner.Character.Torso
head.Part1 = owner.Character.Head
head.C0 = CFrame.new(0,1.5,0)
head.Name = "HeadWeld"
local humanoidrootpart = Instance.new("Weld", owner.Character.HumanoidRootPart)
humanoidrootpart.Part0 = owner.Character.HumanoidRootPart
humanoidrootpart.Part1 = owner.Character.Torso
humanoidrootpart.Name = "HumanoidRootPartWeld"
owner.Character.HumanoidRootPart.CanCollide = false
humanoidofowner.WalkSpeed = 25
local footstep = Instance.new("Sound", owner.Character.Head)
footstep.SoundId = "rbxassetid://379611235"
footstep:Play()
footstep.Volume = 0.3
local ambient = Instance.new("Sound", owner.Character.Head)
ambient.SoundId = "rbxassetid://469593664"
ambient.Looped = true
ambient:Play()
ambient.Volume = 1
local musicwhat = math.random(1,5)
if musicwhat == 1 then
	ambient.SoundId = "rbxassetid://937509512"
	ambient.Volume = 0.1
elseif musicwhat == 2 then
	ambient.SoundId = "rbxassetid://314649261"
	ambient.Volume = 0.5
elseif musicwhat == 3 then
	ambient.SoundId = "rbxassetid://370577229"
	ambient.Volume = 0.5
elseif musicwhat == 4 then
	ambient.SoundId = "rbxassetid://145907444"
	ambient.Volume = 1
end
local jumpsound = Instance.new("Sound", owner.Character.Head)
jumpsound.SoundId = "rbxassetid://1188430348"
jumpsound.PlaybackSpeed = 1.5
local swoosh = Instance.new("Sound", owner.Character.Head)
swoosh.SoundId = "rbxassetid://2706199011"
swoosh.PlaybackSpeed = 1
local swoosh2 = Instance.new("Sound", owner.Character.Head)
swoosh2.SoundId = "rbxassetid://596439421"
swoosh2.PlaybackSpeed = 0.7
local bodyhit = Instance.new("Sound", owner.Character.Head)
bodyhit.SoundId = "rbxassetid://261338552"
local kickhit = Instance.new("Sound", owner.Character.Head)
kickhit.SoundId = "rbxassetid://220025675"
if owner.Character.Head:findFirstChild("FreeFalling") then
	owner.Character.Head:findFirstChild("FreeFalling").Volume = 5
end
running = false
jumping = false
cananimate = true
canplayjump = true
victimdude = nil
cando = true
trytoroll = false
waitforbounce = 0
function run()
	while heartbeat:wait() do
		if rootpart.Velocity.x < -4 or rootpart.Velocity.x > 4 or rootpart.Velocity.z < -4 or rootpart.Velocity.z > 4 and not jumping and cananimate then
			running = true
		else
			running = false
		end
	end
end
function rip()
	cananimate = false
	jumpsound.Volume = 0
	local fallvelocity = Instance.new("BodyVelocity", owner.Character.HumanoidRootPart)
	fallvelocity.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
	fallvelocity.Velocity = Vector3.new(0,-140,0)
	fallvelocity.Name = "FALLING"
	local function aaafalling()
		while heartbeat:wait() do
			for i = 0,0.5 , 0.03 do
				rightarm.C0 = rightarm.C0:lerp(CFrame.new(1.17411232, -0.132110596, -0.264811039, 0.859451294, 0.511213899, 0.00197864277, -0.470952272, 0.793257236, -0.385936379, -0.198865607, 0.330761641, 0.92252332),i)
				leftarm.C0 = leftarm.C0:lerp(CFrame.new(-1.6866436, 0.623382568, 0.115309238, 0.807834744, 0.565451264, -0.166336611, 0.572863281, -0.819640577, -0.00413560122, -0.138674706, -0.0919472426, -0.986060381),i)
				leftleg.C0 = leftleg.C0:lerp(CFrame.new(-0.5, -1.25210571, 0.862024784, 1, 0, 0, 0, 0.173650429, 0.984807372, 0, -0.984807432, 0.173650429),i)
				rightleg.C0 = rightleg.C0:lerp(CFrame.new(0.5, -1.34194946, -0.939673424, 1, 0, 0, 0, 0.342017591, -0.93969363, 0, 0.93969357, 0.342017591),i)
				head.C0 = head.C0:lerp(CFrame.new(0, 1.38299561, -0.321393013, 1, 0, 0, 0, 0.766044021, 0.642788172, 0, -0.642788112, 0.766044021),i)
				heartbeat:wait()
			end
			for i = 0,0.5 , 0.03 do
				rightarm.C0 = rightarm.C0:lerp(CFrame.new(1.66958046, 0.703216553, -0.101788998, 0.859451294, -0.479707241, -0.176704615, -0.470952272, -0.877416015, 0.0913519114, -0.198865607, 0.00470691221, -0.980015516),i)
				leftarm.C0 = leftarm.C0:lerp(CFrame.new(-1.139925, -0.19039917, -0.0615525246, 0.807834744, -0.527976871, 0.261998922, 0.572863281, 0.807906568, -0.138255939, -0.138674706, 0.26177752, 0.95511359),i)
				leftleg.C0 = leftleg.C0:lerp(CFrame.new(-0.5, -1.42044067, -1.06244373, 1, 0, 0, 0, 0.342018187, -0.939693332, 0, 0.939693332, 0.342018157),i)
				rightleg.C0 = rightleg.C0:lerp(CFrame.new(0.5, -1.34197998, 0.939681053, 1, 0, 0, 0, 0.34202221, 0.939691842, 0, -0.939691901, 0.34202221),i)
				head.C0 = head.C0:lerp(CFrame.new(0, 1.38299561, -0.321393013, 1, 0, 0, 0, 0.766044021, 0.642788172, 0, -0.642788112, 0.766044021),i)
				heartbeat:wait()
			end
		end
	end
	spawn(aaafalling)
	while rootpart.Velocity.y <= -138 do
		humanoidrootpart.C0 = humanoidrootpart.C0 * CFrame.fromEulerAnglesXYZ(-0.02,-0.02,-0.02)
		heartbeat:wait()
	end
	fallvelocity:destroy()
	owner.Character:BreakJoints()
end
function checkfall()
	while heartbeat:wait() do
		if rootpart.Velocity.y <= -100 and rootpart.Velocity.y > -140 then
			local owe = true
			while rootpart.Velocity.y <= -100 do
				if rootpart.Velocity.y <= -140 then
					owe = false
					trytoroll = false
					rip()
					break
				end
				heartbeat:wait()
			end
			if not trytoroll then
				cananimate = false
				local ow = Instance.new("BoolValue", owner.Character.HumanoidRootPart)
				ow.Name = "ow"
				if owe then
					humanoidofowner:TakeDamage(math.random(30,60))
				end
				bodyhit.TimePosition = 1
				bodyhit:Play()
				humanoidofowner.WalkSpeed = 0
				humanoidofowner.JumpPower = 0
				for i = 0,1 , 0.07 do
					rightarm.C0 = rightarm.C0:lerp(CFrame.new(1.5, 1.99996758, 0, 1, 0, 0, 0, -1, 3.06768015e-06, 0, -3.06768015e-06, -1),i)
					leftarm.C0 = leftarm.C0:lerp(CFrame.new(-1.5, 1.99996758, 0, 1, 0, 0, 0, -1, 2.89283503e-06, 0, -2.8928348e-06, -1),i)
					leftleg.C0 = leftleg.C0:lerp(CFrame.new(-0.5,-2,0),i)
					rightleg.C0 = rightleg.C0:lerp(CFrame.new(0.5,-2,0),i)
					humanoidrootpart.C0 = humanoidrootpart.C0:lerp(CFrame.new(0, -2.59994507, 7.62939453e-06, 1, 0, 0, 0, 2.99218186e-06, 1, 0, -1, 2.99218186e-06),i)
					head.C0 = head.C0:lerp(CFrame.new(0, 1.17099237, 0.469848633, 1, 0, 0, 0, 0.342022657, -0.939691782, 0, 0.939691782, 0.342022657),i)
					heartbeat:wait()
				end
				wait(1.5)
				for i = 0,0.5 , 0.01 do
					rightarm.C0 = rightarm.C0:lerp(CFrame.new(1.5, 1.60122919, -0.346038818, 1, 0, 0, 0, -0.766045034, -0.64278692, 0, 0.64278692, -0.766044974),i)
					leftarm.C0 = leftarm.C0:lerp(CFrame.new(-1.5, 1.38657951, -0.39642334, 1, 0, 0, 0, -0.866026163, -0.499998719, 0, 0.499998719, -0.866026103),i)
					leftleg.C0 = leftleg.C0:lerp(CFrame.new(-0.5, -1.19998217, -0.799987793, 1, 0, 0, 0, 1, -2.9802577e-06, 0, 2.98025748e-06, 1),i)
					rightleg.C0 = rightleg.C0:lerp(CFrame.new(0.5, -0.946397305, -0.892822266, 1, 0, 0, 0, 0.866024852, -0.500001073, 0, 0.500001073, 0.866024852),i)
					humanoidrootpart.C0 = humanoidrootpart.C0:lerp(CFrame.new(0, -1.79995728, 5.7220459e-06, 1, 0, 0, 0, 2.99218186e-06, 1, 0, -1, 2.99218186e-06),i)
					head.C0 = head.C0:lerp(CFrame.new(0, 1.43299055, 0.25, 1, 0, 0, 0, 0.866025031, -0.500000775, 0, 0.500000775, 0.866025031),i)
					heartbeat:wait()
				end
				for i = 0,0.5 , 0.01 do
					rightarm.C0 = rightarm.C0:lerp(CFrame.new(1.39581108, 0.355163574, -0.668273926, 1, 0, 0, 0, 0.342021942, -0.93969202, 0, 0.939691961, 0.342021972),i)
					leftarm.C0 = leftarm.C0:lerp(CFrame.new(-1.5, 0.375061035, -0.835845947, 1, 0, 0, 0, 0.64279002, -0.766042411, 0, 0.766042411, 0.64279002),i)
					leftleg.C0 = leftleg.C0:lerp(CFrame.new(-0.5, -1.18479919, -0.626342773, 1, 0, 0, 0, 0.984807968, 0.173647031, 0, -0.173647031, 0.984807968),i)
					rightleg.C0 = rightleg.C0:lerp(CFrame.new(0.5, -0.399993896, -1.03918457, 1, 0, 0, 0, 0.866026759, -0.499997824, 0, 0.499997854, 0.8660267),i)
					humanoidrootpart.C0 = humanoidrootpart.C0:lerp(CFrame.new(0, -0.989624023, -0.177854538, 1, 0, 0, 0, 0.642787755, 0.766044319, 0, -0.766044378, 0.642787755),i)
					head.C0 = head.C0:lerp(CFrame.new(0, 1.4329834, 0.25, 1, 0, 0, 0, 0.866026878, -0.499997526, 0, 0.499997526, 0.866026819),i)
					heartbeat:wait()
				end
				humanoidofowner.WalkSpeed = 25
				humanoidofowner.JumpPower = 50
				cananimate = true
				cando = true
				ow:destroy()
			else
				for i,v in pairs(owner.Character.Head:GetChildren()) do
					if v.Name == "goup" then
						v:destroy()
					end
				end
				cananimate = false
				trytoroll = false
				waitforbounce = 4
				local rollvelocity = Instance.new("BodyVelocity", owner.Character.HumanoidRootPart)
				rollvelocity.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
				rollvelocity.Velocity = owner.Character.HumanoidRootPart.CFrame.lookVector * 20
				rollvelocity.Name = "rolling"
				local rarmc0 = rightarm.C0
				local larmc0 = leftarm.C0
				local llegc0 = leftleg.C0
				local rlegc0 = rightleg.C0
				local humrootc0 = humanoidrootpart.C0
				local headc0 = head.C0
				for i = 0,1 , 0.12 do
					rightarm.C0 = rarmc0:lerp(CFrame.new(1.29883575, 0.820416212, -0.554986477, 0.939694643, 0.342014492, 3.29469119e-10, 0.171007738, -0.469848752, -0.866024554, -0.296192914, 0.813798726, -0.500001431),i)
					leftarm.C0 = larmc0:lerp(CFrame.new(-1.29883575, 0.820416212, -0.554986477, 0.939694643, -0.342014492, -3.29469119e-10, -0.171007738, -0.469848752, -0.866024554, 0.296192914, 0.813798726, -0.500001431),i)
					leftleg.C0 = llegc0:lerp(CFrame.new(-0.5, 0.167815685, -1.17003536, 1, 0, 0, 0, 0.984807789, -0.173648298, 0, 0.173648298, 0.984807789),i)
					rightleg.C0 = rlegc0:lerp(CFrame.new(0.5, 0.227622986, -1.20567513, 1, 0, 0, 0, 0.98480773, -0.17364873, 0, 0.17364873, 0.98480773),i)
					humanoidrootpart.C0 = humrootc0:lerp(CFrame.new(0, -1.82676482, 0.100003719, 1, 0, 0, 0, 0.500001073, 0.866024792, 0, -0.866024852, 0.500001013),i)
					head.C0 = headc0:lerp(CFrame.new(0, 1.46982503, -0.171005249, 1, 0, 0, 0, 0.939693511, 0.3420178, 0, -0.3420178, 0.939693511),i)
					heartbeat:wait()
				end
				local rarmc0 = rightarm.C0
				local larmc0 = leftarm.C0
				local llegc0 = leftleg.C0
				local rlegc0 = rightleg.C0
				local humrootc0 = humanoidrootpart.C0
				local headc0 = head.C0
				for i = 0,1 , 0.12 do
					rightarm.C0 = rarmc0:lerp(CFrame.new(1.29883575, 0.820416212, -0.554986477, 0.939694643, 0.342014492, 3.29469119e-10, 0.171007738, -0.469848752, -0.866024554, -0.296192914, 0.813798726, -0.500001431),i)
					leftarm.C0 = larmc0:lerp(CFrame.new(-1.29883575, 0.820416212, -0.554986477, 0.939694643, -0.342014492, -3.29469119e-10, -0.171007738, -0.469848752, -0.866024554, 0.296192914, 0.813798726, -0.500001431),i)
					leftleg.C0 = llegc0:lerp(CFrame.new(-0.5, 0.167815685, -1.17003536, 1, 0, 0, 0, 0.984807789, -0.173648298, 0, 0.173648298, 0.984807789),i)
					rightleg.C0 = rlegc0:lerp(CFrame.new(0.5, 0.227622986, -1.20567513, 1, 0, 0, 0, 0.98480773, -0.17364873, 0, 0.17364873, 0.98480773),i)
					humanoidrootpart.C0 = humrootc0:lerp(CFrame.new(0, -1.12325001, -0.233205318, 1, 0, 0, 0, -0.766044676, 0.642787397, 0, -0.642787397, -0.766044617),i)
					head.C0 = headc0:lerp(CFrame.new(0, 1.43298388, -0.249996901, 1, 0, 0, 0, 0.866023958, 0.500002503, 0, -0.500002503, 0.866023958),i)
					heartbeat:wait()
				end
				local rarmc0 = rightarm.C0
				local larmc0 = leftarm.C0
				local llegc0 = leftleg.C0
				local rlegc0 = rightleg.C0
				local humrootc0 = humanoidrootpart.C0
				local headc0 = head.C0
				for i = 0,1 , 0.12 do
					rightarm.C0 = rarmc0:lerp(CFrame.new(1.3388443, 0.487123013, -0.620485306, 0.939694762, 0.26199764, 0.219843194, 0.171007395, 0.196747974, -0.96542573, -0.296192944, 0.944800317, 0.140079498),i)
					leftarm.C0 = larmc0:lerp(CFrame.new(-1.3388443, 0.487123013, -0.620485306, 0.939694762, -0.26199764, -0.219843194, -0.171007395, 0.196747974, -0.96542573, 0.296192944, 0.944800317, 0.140079498),i)
					leftleg.C0 = llegc0:lerp(CFrame.new(-0.5, -1.92927122, -0.671936512, 1, 0, 0, 0, 0.984808266, 0.173645824, 0, -0.173645824, 0.984808207),i)
					rightleg.C0 = rlegc0:lerp(CFrame.new(0.5, -1.15108776, -0.61528492, 1, 0, 0, 0, 0.984808207, 0.173645645, 0, -0.17364563, 0.984808207),i)
					humanoidrootpart.C0 = humrootc0:lerp(CFrame.new(0, -2.35371089, -0.496735096, 1, 0, 0, 0, -0.342021734, -0.93969214, 0, 0.93969202, -0.342021763),i)
					head.C0 = headc0:lerp(CFrame.new(0, 1.17099142, -0.469834805, 1, 0, 0, 0, 0.342019647, 0.939692855, 0, -0.939692914, 0.342019588),i)
					heartbeat:wait()
				end
				cananimate = true
				rollvelocity:destroy()
				cando = true
				local function checkfix()
					wait(1)
					if not cando then
						cando = true
					end
				end
				spawn(checkfix)
			end
		end
	end
end
spawn(run)
spawn(checkfall)
punchanim = 0
function doaction(plr, what)
	if plr == owner then
		if cando then
			cando = false
			cananimate = false
			if what == "rollon" and not owner.Character.HumanoidRootPart:findFirstChild("FALLING") and not owner.Character.HumanoidRootPart:findFirstChild("rolling") then
				trytoroll = true
				cando = true
				cananimate = true
			end
			if what == "rolloff" and not owner.Character.HumanoidRootPart:findFirstChild("FALLING") and not owner.Character.HumanoidRootPart:findFirstChild("rolling") then
				trytoroll = false
				cando = true
				cananimate = true
			end
			if what == "slide" and not owner.Character.HumanoidRootPart:findFirstChild("ow") and not owner.Character.HumanoidRootPart:findFirstChild("sliding") and not owner.Character.HumanoidRootPart:findFirstChild("FALLING") and not owner.Character.HumanoidRootPart:findFirstChild("goingup") and not owner.Character.HumanoidRootPart.Anchored then
				humanoidofowner.WalkSpeed = 0
				humanoidofowner.JumpPower = 0
				swoosh:Play()
				local velocitie = Instance.new("BodyVelocity", owner.Character.HumanoidRootPart)
				velocitie.MaxForce = Vector3.new(math.huge,0,math.huge)
				velocitie.Velocity = owner.Character.HumanoidRootPart.CFrame.lookVector * 50
				velocitie.Name = "sliding"
				local waitt = 0
				local function less()
					while wait() do
						velocitie.Velocity = velocitie.Velocity / 1.09
						if waitt < 20 then
							waitt = waitt + 1
						end
						if velocitie.Velocity.z <= 4 and velocitie.Velocity.x <= 4 and waitt == 20 then
							humanoidofowner.WalkSpeed = 25
							humanoidofowner.JumpPower = 50
							velocitie:destroy()
							if not owner.Character.HumanoidRootPart:findFirstChild("ow") then
								cananimate = true
								cando = true
							end
							break
						end
					end
				end
				spawn(less)
				for i = 0,1 , 0.02 do
					if not cananimate and not owner.Character.HumanoidRootPart:findFirstChild("ow") then
						rightarm.C0 = rightarm.C0:lerp(CFrame.new(1.88513184, 0.728400707, -0.51874733, 0.0509149656, -0.979093194, 0.196937039, 0.995125353, 0.0330599695, -0.0929127932, 0.0844595507, 0.200707689, 0.976003647),i)
						leftarm.C0 = leftarm.C0:lerp(CFrame.new(-1.63573742, 0.101630211, 0.237347126, 0.777682304, 0.62453258, -0.0718980953, -0.42115736, 0.602484405, 0.677966893, 0.46672985, -0.496962368, 0.731567979),i)
						leftleg.C0 = leftleg.C0:lerp(CFrame.new(-0.499998093, -1.98477411, 0.173640728, 1, -1.57809765e-07, 5.05698472e-06, -7.22707682e-07, 0.984808326, 0.173644975, -5.00756369e-06, -0.173644975, 0.984808326),i)
						rightleg.C0 = rightleg.C0:lerp(CFrame.new(0.500001907, -1.99996758, -9.05990601e-06, 1, 7.22725019e-07, 5.00756187e-06, -7.22707682e-07, 1, -3.44990485e-06, -5.00756369e-06, 3.44990121e-06, 1),i)
						humanoidrootpart.C0 = humanoidrootpart.C0:lerp(CFrame.new(-0.0606842041, -2.26575327, -0.0902328491, 0.936354458, -0.111619428, -0.332838684, -0.330426246, 0.0400053002, -0.942983687, 0.118570611, 0.992945492, 0.000577152357),i)
						head.C0 = head.C0:lerp(CFrame.new(-0.0664100647, 1.29971933, -0.608807564, 0.997187197, -0.0242519826, 0.0709199831, -0.0628080666, 0.245970294, 0.967240393, -0.0409017019, -0.968973994, 0.243755192),i)
						heartbeat:wait()
					end
				end
			elseif what == "kick" and not owner.Character.HumanoidRootPart:findFirstChild("ow") and not owner.Character.HumanoidRootPart:findFirstChild("sliding") and not owner.Character.HumanoidRootPart:findFirstChild("FALLING") and not owner.Character.HumanoidRootPart:findFirstChild("goingup") and not owner.Character.HumanoidRootPart.Anchored then
				humanoidofowner.WalkSpeed = 0
				humanoidofowner.JumpPower = 0
				swoosh2:Play()
				swoosh:Play()
				cananimate = false
				for i = 0,0.5 , 0.08 do
					if not cananimate and not owner.Character.HumanoidRootPart:findFirstChild("ow") then
						rightarm.C0 = rightarm.C0:lerp(CFrame.new(1.5,0,0),i)
						leftarm.C0 = leftarm.C0:lerp(CFrame.new(-1.5,0,0),i)
						leftleg.C0 = leftleg.C0:lerp(CFrame.new(-0.5, -0.200000286, -0.799999714, 1, -2.37121791e-16, -3.55271368e-15, -2.84206045e-15, 0.999999821, -2.086162e-07, 5.04870979e-29, 2.08616243e-07, 0.999999881) * CFrame.new(0,-1,0),i)
						rightleg.C0 = rightleg.C0:lerp(CFrame.new(0.866977453, -1.76958275, 0, 0.866026938, -0.499997377, 3.14493657e-12, 0.499997377, 0.866026938, 2.68155637e-12, -4.06437037e-12, -7.49839589e-13, 1),i)
						humanoidrootpart.C0 = humanoidrootpart.C0:lerp(CFrame.new(0, 0, 0, 2.17665985e-07, 1.25670709e-07, -1, -0.500001013, 0.866024852, 7.60486888e-13, 0.866024852, 0.500000954, 2.51339628e-07),i)
						head.C0 = head.C0:lerp(CFrame.new(-0.262776613, 1.02028942, -0.846868515, 0.593996942, -0.730470955, 0.337016225, -0.38534075, 0.109389521, 0.916267753, -0.706172943, -0.674126267, -0.216503173),i)
						heartbeat:wait()
					end
				end
				local function kicksuccessful()
					kickhit:Play()
					local velocitie = Instance.new("BodyVelocity", victimdude.Head)
					velocitie.MaxForce = Vector3.new(math.huge,0,math.huge)
					velocitie.Velocity = owner.Character.HumanoidRootPart.CFrame.lookVector * 15
					velocitie.Name = "woosh"
					game.Debris:AddItem(velocitie, 0.3)
					local hprandom = math.random(10,30)
					if victimdude:findFirstChildOfClass("Humanoid").Health <= hprandom then
						victimdude:BreakJoints()
						ragdollkill(victimdude)
					else
						victimdude:findFirstChildOfClass("Humanoid").Health = victimdude:findFirstChildOfClass("Humanoid").Health - hprandom
					end
					if victimdude:findFirstChild("Torso") then
						victimdude.Torso.CFrame = CFrame.new(victimdude.Torso.Position, owner.Character.HumanoidRootPart.Position)
						local owweld = Instance.new("Weld", victimdude.Torso)
						owweld.Part0 = victimdude.Torso
						owweld.Part1 = victimdude.Head
						owweld.C0 = CFrame.new(0,(victimdude.Torso.Size.y/2) + (victimdude.Head.Size.y/2),0)
						owweld.C0 = owweld.C0 * CFrame.fromEulerAnglesXYZ(1,0,0) * CFrame.new(0,0,0.5)
						for i = 0,1 , 0.02 do
							owweld.C0 = owweld.C0:lerp(CFrame.new(0,(victimdude.Torso.Size.y/2) + (victimdude.Head.Size.y/2),0),i)
							heartbeat:wait()
						end
					elseif victimdude:findFirstChild("UpperTorso") then
						victimdude.UpperTorso.CFrame = CFrame.new(victimdude.UpperTorso.Position, owner.Character.HumanoidRootPart.Position)
						local owweld = Instance.new("Weld", victimdude.UpperTorso)
						owweld.Part0 = victimdude.UpperTorso
						owweld.Part1 = victimdude.Head
						owweld.C0 = CFrame.new(0,(victimdude.UpperTorso.Size.y/2) + (victimdude.Head.Size.y/2),0)
						owweld.C0 = owweld.C0 * CFrame.fromEulerAnglesXYZ(1,0,0) * CFrame.new(0,0,0.5)
						for i = 0,1 , 0.02 do
							owweld.C0 = owweld.C0:lerp(CFrame.new(0,(victimdude.UpperTorso.Size.y/2) + (victimdude.Head.Size.y/2),0),i)
							heartbeat:wait()
						end
					end
					local hisws = victimdude:findFirstChildOfClass("Humanoid").WalkSpeed
					local hisjp = victimdude:findFirstChildOfClass("Humanoid").JumpPower
					victimdude:findFirstChildOfClass("Humanoid").JumpPower = 0
					victimdude:findFirstChildOfClass("Humanoid").WalkSpeed = 0
					for i,v in pairs(victimdude:GetChildren()) do
						if v.ClassName == "Script" or v.ClassName == "LocalScript" then
							v.Disabled = true
						end
					end
					if victimdude:findFirstChildOfClass("Humanoid").MaxHealth > 300 then
						victimdude:findFirstChildOfClass("Humanoid").MaxHealth = 300
					end
					local function unstun()
						wait(math.random(2,3))
						victimdude:findFirstChildOfClass("Humanoid").JumpPower = hisjp
						victimdude:findFirstChildOfClass("Humanoid").WalkSpeed = hisws
						for i,v in pairs(victimdude:GetChildren()) do
							if v.ClassName == "Script" or v.ClassName == "LocalScript" then
								v.Disabled = false
							end
						end
					end
					spawn(unstun)
				end
				for i = 0.1,1 , 0.08 do
					if not cananimate and not owner.Character.HumanoidRootPart:findFirstChild("ow") then
						rightarm.C0 = rightarm.C0:lerp(CFrame.new(0.793737411, -0.0435829163, -0.377206802, 0.589972556, 0.802474499, -0.0892586261, -0.776380658, 0.533454716, -0.335647464, -0.221733078, 0.267321438, 0.937749267),i)
						leftarm.C0 = leftarm.C0:lerp(CFrame.new(-1.5,0,0),i)
						leftleg.C0 = leftleg.C0:lerp(CFrame.new(-1.06697655, -2.11598873, 0, 0.866026878, 0.499997646, 6.74289184e-13, -0.499997675, 0.866026819, 4.07409696e-12, 1.45308602e-12, -3.8654197e-12, 1),i)
						rightleg.C0 = rightleg.C0:lerp(CFrame.new(1.56865537, -1.46542549, 0, 0.342022985, -0.939691603, 6.78452086e-13, 0.939691603, 0.342022985, 4.07827938e-12, -4.06437037e-12, -7.57329637e-13, 1),i)
						humanoidrootpart.C0 = humanoidrootpart.C0:lerp(CFrame.new(0, 0, 0, 8.59631086e-08, 2.36182032e-07, -1, -0.939691782, 0.342022538, 7.5707241e-13, 0.342022568, 0.939691782, 2.51339628e-07),i)
						head.C0 = head.C0:lerp(CFrame.new(-0.0669679642, 1.10865688, -0.957942963, 0.808011353, -0.338849306, 0.481973886, -0.399515122, 0.286124706, 0.870930731, -0.433018923, -0.896277785, 0.0958165824),i)
						heartbeat:wait()
					end
				end
				for i,v in pairs(workspace:GetChildren()) do
					if v.ClassName == "Model" then
						local thathumanoid = v:findFirstChildOfClass("Humanoid")
						local thathead = v:findFirstChild("Head")
						if thathumanoid and thathead then
							if (thathead.Position - owner.Character["Left Leg"].Position).magnitude < 3 then
								victimdude = v
								spawn(kicksuccessful)
							end
						end
					end
				end
				for i = 0,0.5 , 0.08 do
					if not cananimate and not owner.Character.HumanoidRootPart:findFirstChild("ow") then
						rightarm.C0 = rightarm.C0:lerp(CFrame.new(1.5,0,0),i)
						leftarm.C0 = leftarm.C0:lerp(CFrame.new(-1.5,0,0),i)
						leftleg.C0 = leftleg.C0:lerp(CFrame.new(-0.5, -0.200000286, -0.799999714, 1, -2.37121791e-16, -3.55271368e-15, -2.84206045e-15, 0.999999821, -2.086162e-07, 5.04870979e-29, 2.08616243e-07, 0.999999881) * CFrame.new(0,-1,0),i)
						rightleg.C0 = rightleg.C0:lerp(CFrame.new(0.866977453, -1.76958275, 0, 0.866026938, -0.499997377, 3.14493657e-12, 0.499997377, 0.866026938, 2.68155637e-12, -4.06437037e-12, -7.49839589e-13, 1),i)
						humanoidrootpart.C0 = humanoidrootpart.C0:lerp(CFrame.new(0, 0, 0, 2.17665985e-07, 1.25670709e-07, -1, -0.500001013, 0.866024852, 7.60486888e-13, 0.866024852, 0.500000954, 2.51339628e-07),i)
						head.C0 = head.C0:lerp(CFrame.new(-0.262776613, 1.02028942, -0.846868515, 0.593996942, -0.730470955, 0.337016225, -0.38534075, 0.109389521, 0.916267753, -0.706172943, -0.674126267, -0.216503173),i)
						heartbeat:wait()
					end
				end
				humanoidofowner.WalkSpeed = 25
				humanoidofowner.JumpPower = 50
				cananimate = true
				cando = true
			elseif what == "punch" and not owner.Character.HumanoidRootPart:findFirstChild("ow") and not owner.Character.HumanoidRootPart:findFirstChild("sliding") and not owner.Character.HumanoidRootPart:findFirstChild("FALLING") and not owner.Character.HumanoidRootPart:findFirstChild("goingup") and not owner.Character.HumanoidRootPart.Anchored then
				cananimate = false
				cando = false
				if punchanim == 0 then
					punchanim = 1
					for i = 0,1 , 0.15 do
						if not cananimate and not owner.Character.HumanoidRootPart:findFirstChild("ow") then
							rightarm.C0 = rightarm.C0:lerp(CFrame.new(1.93298721, 0.399990082, -0.616035461, -2.2650172e-06, 0.866024196, 0.500002205, 1, 2.85937426e-06, -4.22538534e-07, -1.79562221e-06, 0.500002205, -0.866024256),i)
							leftarm.C0 = leftarm.C0:lerp(CFrame.new(-2.10411453, 0.813013554, -0.249991417, 0.173650935, 0.85286659, -0.492406279, -0.984807372, 0.150386363, -0.0868250355, 1.0099742e-06, 0.500002563, 0.866023898),i)
							leftleg.C0 = leftleg.C0:lerp(CFrame.new(-0.5,-2,0),i)
							rightleg.C0 = rightleg.C0:lerp(CFrame.new(0.5,-2,0),i)
							humanoidrootpart.C0 = humanoidrootpart.C0:lerp(CFrame.new(0, 0, 0, 0.336828679, 0.0593937114, -0.939690828, -0.173650339, 0.984807372, 1.02145373e-06, 0.925414562, 0.163177282, 0.342025071),i)
							head.C0 = head.C0:lerp(CFrame.new(-0.0665130615, 1.49237728, -0.055811882, 0.64278388, -0.133025259, 0.754409134, 5.5879454e-08, 0.984807193, 0.173651397, -0.766047537, -0.111620277, 0.633018196),i)
							heartbeat:wait()
						end
					end
					swoosh:Play()
					swoosh2:Play()
					local rarmc0 = rightarm.C0
					local larmc0 = leftarm.C0
					local llegc0 = leftleg.C0
					local rlegc0 = rightleg.C0
					local humrootc0 = humanoidrootpart.C0
					local headc0 = head.C0
					for i = 0,1 , 0.2 do
						if not cananimate and not owner.Character.HumanoidRootPart:findFirstChild("ow") then
							rightarm.C0 = rarmc0:lerp(CFrame.new(1.97320461, 0.399998665, -1.04105949, 1.41556848e-06, -0.342017621, 0.93969363, 1, 2.79749133e-06, -4.88219996e-07, -2.46180457e-06, 0.93969363, 0.342017621),i)
							leftarm.C0 = larmc0:lerp(CFrame.new(-1.96173954, 0.431951523, -0.401452065, 0.173648983, 0.336830288, -0.925414264, -0.98480767, 0.059396144, -0.163174972, 3.76260778e-06, 0.939690173, 0.342027068),i)
							leftleg.C0 = llegc0:lerp(CFrame.new(-0.5,-2,0),i)
							rightleg.C0 = rlegc0:lerp(CFrame.new(0.5,-2,0),i)
							humanoidrootpart.C0 = humrootc0:lerp(CFrame.new(0, 0, 0, 0.866028965, -2.58095861e-06, 0.49999398, 1.49011055e-06, 1, 2.58099067e-06, -0.49999398, -1.49016603e-06, 0.866028965),i)
							head.C0 = headc0:lerp(CFrame.new(-0.0665092468, 1.49237823, -0.0558137894, 0.854564965, -0.133018151, -0.502020836, 0.171007037, 0.984808207, 0.0301566627, 0.49038282, -0.11161992, 0.864329636),i)
							heartbeat:wait()
						end
					end
					local function punchsuccessful()
						kickhit:Play()
						for i,v in pairs(victimdude:GetChildren()) do
							if v.ClassName == "Script" or v.ClassName == "LocalScript" then
								v.Disabled = true
							end
						end
						if victimdude:findFirstChildOfClass("Humanoid").MaxHealth > 300 then
							victimdude:findFirstChildOfClass("Humanoid").MaxHealth = 300
						end
						local function unstun()
							if victimdude:findFirstChild("Torso") then
								victimdude.Torso.CFrame = CFrame.new(victimdude.Torso.Position, owner.Character.HumanoidRootPart.Position)
								local owweld = Instance.new("Weld", victimdude.Torso)
								owweld.Part0 = victimdude.Torso
								owweld.Part1 = victimdude.Head
								owweld.C0 = CFrame.new(0,(victimdude.Torso.Size.y/2) + (victimdude.Head.Size.y/2),0)
								owweld.C0 = owweld.C0 * CFrame.fromEulerAnglesXYZ(0,-1,-0.3)
								for i = 0,1 , 0.04 do
									owweld.C0 = owweld.C0:lerp(CFrame.new(0,(victimdude.Torso.Size.y/2) + (victimdude.Head.Size.y/2),0),i)
									heartbeat:wait()
								end
							elseif victimdude:findFirstChild("UpperTorso") then
								victimdude.UpperTorso.CFrame = CFrame.new(victimdude.UpperTorso.Position, owner.Character.HumanoidRootPart.Position)
								local owweld = Instance.new("Weld", victimdude.UpperTorso)
								owweld.Part0 = victimdude.UpperTorso
								owweld.Part1 = victimdude.Head
								owweld.C0 = CFrame.new(0,(victimdude.UpperTorso.Size.y/2) + (victimdude.Head.Size.y/2),0)
								owweld.C0 = owweld.C0 * CFrame.fromEulerAnglesXYZ(0,-1,-0.3)
								for i = 0,1 , 0.04 do
									owweld.C0 = owweld.C0:lerp(CFrame.new(0,(victimdude.UpperTorso.Size.y/2) + (victimdude.Head.Size.y/2),0),i)
									heartbeat:wait()
								end
							end
							wait(0.5)
							for i,v in pairs(victimdude:GetChildren()) do
								if v.ClassName == "Script" or v.ClassName == "LocalScript" then
									v.Disabled = false
								end
							end
						end
						spawn(unstun)
						local velocitie = Instance.new("BodyVelocity", victimdude.Head)
						velocitie.MaxForce = Vector3.new(math.huge,0,math.huge)
						velocitie.Velocity = owner.Character.HumanoidRootPart.CFrame.lookVector * 0
						velocitie.Name = "woosh"
						game.Debris:AddItem(velocitie, 0.3)
						local hprandom = math.random(10,30)
						if victimdude:findFirstChildOfClass("Humanoid").Health <= hprandom then
							local dofinishornot = math.random(1,3)
							if dofinishornot == 1 then
								finish(victimdude)
							else
								victimdude:BreakJoints()
								ragdollkill(victimdude)
							end
						else
							victimdude:findFirstChildOfClass("Humanoid").Health = victimdude:findFirstChildOfClass("Humanoid").Health - hprandom
						end
					end
					for i,v in pairs(workspace:GetChildren()) do
						if v.ClassName == "Model" then
							local thathumanoid = v:findFirstChildOfClass("Humanoid")
							local thathead = v:findFirstChild("Head")
							if thathumanoid and thathead and v ~= owner.Character then
								if (thathead.Position - owner.Character["Right Arm"].Position).magnitude < 3 then
									victimdude = v
									spawn(punchsuccessful)
								end
							end
						end
					end
					for i = 0.4,1 , 0.2 do
						if not cananimate and not owner.Character.HumanoidRootPart:findFirstChild("ow") then
							rightarm.C0 = rightarm.C0:lerp(CFrame.new(1.71537304, 0.399996281, -1.06364822, 2.44383e-06, 0.173639908, 0.98480922, 1, -1.99457554e-06, -2.12984583e-06, 1.59445005e-06, 0.98480922, -0.173639923),i)
							leftarm.C0 = leftarm.C0:lerp(CFrame.new(-1.79822016, 0.430157661, -0.45993042, -0.153337717, 0.336819142, -0.928999722, -0.981225491, 0.0593929365, 0.183491513, 0.116979472, 0.939694285, 0.321388364),i)
							leftleg.C0 = leftleg.C0:lerp(CFrame.new(-0.5,-2,0),i)
							rightleg.C0 = rightleg.C0:lerp(CFrame.new(0.5,-2,0),i)
							humanoidrootpart.C0 = humanoidrootpart.C0:lerp(CFrame.new(0, 0, 0, -0.500006795, 2.5073964e-06, 0.866021514, -0.150380597, 0.984808087, -0.086826697, -0.8528651, -0.173646778, -0.492410332),i)
							head.C0 = head.C0:lerp(CFrame.new(-0.0372924805, 1.49856281, -0.00446796417, -0.645966768, -0.0745923966, -0.759712398, -0.0414872579, 0.997174025, -0.0626318753, 0.76223737, -0.00893972628, -0.64723587),i)
							heartbeat:wait()
						end
					end
				elseif punchanim == 1 then
					punchanim = 0
					for i = 0,1 , 0.15 do
						if not cananimate and not owner.Character.HumanoidRootPart:findFirstChild("ow") then
							rightarm.C0 = rightarm.C0:lerp(CFrame.new(2.1286068, 0.309746742, 9.53674316e-07, 0.342020094, -0.939692497, 0, 0.939692378, 0.342020094, 3.7252903e-09, 0, 1.49011612e-08, 0.99999994),i)
							leftarm.C0 = leftarm.C0:lerp(CFrame.new(-2.08530402, 0.47922802, -0.542467117, 0.133022159, -0.754406393, -0.642787516, -0.984807551, -0.173648119, 6.70552254e-08, -0.111618951, 0.633022189, -0.766044319),i)
							leftleg.C0 = leftleg.C0:lerp(CFrame.new(-0.5,-2,0),i)
							rightleg.C0 = rightleg.C0:lerp(CFrame.new(0.5,-2,0),i)
							humanoidrootpart.C0 = humanoidrootpart.C0:lerp(CFrame.new(0, 0, 0, 0.171010107, -0.0301536899, 0.98480773, 0.173648149, 0.98480773, 0, -0.969846249, 0.171010047, 0.173648223),i)
							head.C0 = head.C0:lerp(CFrame.new(0.0855047703, 1.49240398, -0.0150756836, 0.173647955, 0.171010062, -0.969846249, 2.0081643e-09, 0.98480767, 0.173648164, 0.984807789, -0.0301536545, 0.171009883),i)
							heartbeat:wait()
						end
					end
					swoosh:Play()
					swoosh2:Play()
					local rarmc0 = rightarm.C0
					local larmc0 = leftarm.C0
					local llegc0 = leftleg.C0
					local rlegc0 = rightleg.C0
					local humrootc0 = humanoidrootpart.C0
					local headc0 = head.C0
					for i = 0,1 , 0.2 do
						if not cananimate and not owner.Character.HumanoidRootPart:findFirstChild("ow") then
							rightarm.C0 = rarmc0:lerp(CFrame.new(1.95028019, 0.161817551, -0.321393967, 0.342020154, -0.719846487, 0.604022563, 0.939692378, 0.262002617, -0.219846219, 0, 0.642787337, 0.766044319),i)
							leftarm.C0 = larmc0:lerp(CFrame.new(-1.33039951, 0.548686981, -1.71805, 0.0301536396, -0.171010137, -0.98480773, -0.984807491, -0.173648149, 4.68975934e-08, -0.171010077, 0.96984601, -0.173648),i)
							leftleg.C0 = llegc0:lerp(CFrame.new(-0.5,-2,0),i)
							rightleg.C0 = rlegc0:lerp(CFrame.new(0.5,-2,0),i)
							humanoidrootpart.C0 = humrootc0:lerp(CFrame.new(0, 0, 0, 0.866025448, 5.58793545e-09, -0.49999994, 1.01929922e-08, 0.99999994, 2.80050241e-08, 0.49999994, -1.49011612e-08, 0.866025329),i)
							head.C0 = headc0:lerp(CFrame.new(0.0102343559, 1.49909019, 0.0283493996, 0.868718624, 0.0204696581, 0.494882613, 0.0103131672, 0.998181343, -0.0593911484, -0.495198429, 0.0566980243, 0.866927505),i)
							heartbeat:wait()
						end
					end
					local function punchsuccessful()
						kickhit:Play()
						for i,v in pairs(victimdude:GetChildren()) do
							if v.ClassName == "Script" or v.ClassName == "LocalScript" then
								v.Disabled = true
							end
						end
						if victimdude:findFirstChildOfClass("Humanoid").MaxHealth > 300 then
							victimdude:findFirstChildOfClass("Humanoid").MaxHealth = 300
						end
						local function unstun()
							if victimdude:findFirstChild("Torso") then
								victimdude.Torso.CFrame = CFrame.new(victimdude.Torso.Position, owner.Character.HumanoidRootPart.Position)
								local owweld = Instance.new("Weld", victimdude.Torso)
								owweld.Part0 = victimdude.Torso
								owweld.Part1 = victimdude.Head
								owweld.C0 = CFrame.new(0,(victimdude.Torso.Size.y/2) + (victimdude.Head.Size.y/2),0)
								owweld.C0 = owweld.C0 * CFrame.fromEulerAnglesXYZ(0,1,-0.3)
								for i = 0,1 , 0.04 do
									owweld.C0 = owweld.C0:lerp(CFrame.new(0,(victimdude.Torso.Size.y/2) + (victimdude.Head.Size.y/2),0),i)
									heartbeat:wait()
								end
							elseif victimdude:findFirstChild("UpperTorso") then
								victimdude.UpperTorso.CFrame = CFrame.new(victimdude.UpperTorso.Position, owner.Character.HumanoidRootPart.Position)
								local owweld = Instance.new("Weld", victimdude.UpperTorso)
								owweld.Part0 = victimdude.UpperTorso
								owweld.Part1 = victimdude.Head
								owweld.C0 = CFrame.new(0,(victimdude.UpperTorso.Size.y/2) + (victimdude.Head.Size.y/2),0)
								owweld.C0 = owweld.C0 * CFrame.fromEulerAnglesXYZ(0,1,-0.3)
								for i = 0,1 , 0.04 do
									owweld.C0 = owweld.C0:lerp(CFrame.new(0,(victimdude.UpperTorso.Size.y/2) + (victimdude.Head.Size.y/2),0),i)
									heartbeat:wait()
								end
							end
							wait(0.5)
							for i,v in pairs(victimdude:GetChildren()) do
								if v.ClassName == "Script" or v.ClassName == "LocalScript" then
									v.Disabled = false
								end
							end
						end
						spawn(unstun)
						local velocitie = Instance.new("BodyVelocity", victimdude.Head)
						velocitie.MaxForce = Vector3.new(math.huge,0,math.huge)
						velocitie.Velocity = owner.Character.HumanoidRootPart.CFrame.lookVector * 0
						velocitie.Name = "woosh"
						game.Debris:AddItem(velocitie, 0.3)
						local hprandom = math.random(10,30)
						if victimdude:findFirstChildOfClass("Humanoid").Health <= hprandom then
							local dofinishornot = math.random(1,2)
							if dofinishornot == 1 then
								finish(victimdude)
							else
								victimdude:BreakJoints()
								ragdollkill(victimdude)
							end
						else
							victimdude:findFirstChildOfClass("Humanoid").Health = victimdude:findFirstChildOfClass("Humanoid").Health - hprandom
						end
					end
					for i,v in pairs(workspace:GetChildren()) do
						if v.ClassName == "Model" then
							local thathumanoid = v:findFirstChildOfClass("Humanoid")
							local thathead = v:findFirstChild("Head")
							if thathumanoid and thathead and v ~= owner.Character then
								if (thathead.Position - owner.Character["Left Arm"].Position).magnitude < 3 then
									victimdude = v
									spawn(punchsuccessful)
								end
							end
						end
					end
					for i = 0.4,1 , 0.2 do
						if not cananimate and not owner.Character.HumanoidRootPart:findFirstChild("ow") then
							rightarm.C0 = rightarm.C0:lerp(CFrame.new(2.05306506, 0.124407291, -0.0868234634, 0.342020094, -0.92541641, 0.163175479, 0.939692318, 0.336824, -0.0593910292, -1.3038516e-08, 0.173647821, 0.984807789),i)
							leftarm.C0 = leftarm.C0:lerp(CFrame.new(-0.958778858, 0.899198532, -1.33199215, 0.0301536173, -0.938373387, -0.344304562, -0.984807372, -0.0868240297, 0.150383741, -0.171010122, 0.334539413, -0.926735342),i)
							leftleg.C0 = leftleg.C0:lerp(CFrame.new(-0.5,-2,0),i)
							rightleg.C0 = rightleg.C0:lerp(CFrame.new(0.5,-2,0),i)
							humanoidrootpart.C0 = humanoidrootpart.C0:lerp(CFrame.new(0, 0, 0, 0.171010032, -0.0301536787, -0.98480773, 0.173648193, 0.98480767, 1.01929949e-08, 0.969846189, -0.171010077, 0.173648074),i)
							head.C0 = head.C0:lerp(CFrame.new(0.0968837738, 1.48970509, 0.0283184052, 0.00577832758, 0.193767488, 0.981030107, 0.0565908253, 0.979411006, -0.193780988, -0.998380601, 0.0566370524, -0.005306229),i)
							heartbeat:wait()
						end
					end
				end
				cananimate = true
				cando = true
			end
		end
	end
end
remote.OnServerEvent:connect(doaction)
cannnnn = true
function checkjump()
	while wait() do
		if rootpart.Velocity.y > 4 or rootpart.Velocity.y < -4 and cananimate then
			jumping = true
			if canplayjump and rootpart.Velocity.y > 4 then
				jumpsound:Play()
			end
			canplayjump = false
			if waitforbounce <= 0 then
				local thing = Instance.new("Part", owner.Character.Head)
				thing.Size = Vector3.new(0.5,0.5,0.5)
				thing.Transparency = 1
				thing.CanCollide = false
				thing.Name = "goup"
				thing:BreakJoints()
				local weld = Instance.new("Weld", thing)
				weld.Part0 = owner.Character.Head
				weld.Part1 = thing
				weld.C0 = CFrame.new(0,0,-1.5)
				local function bounceup(wall)
					if cannnnn and wall.CanCollide then
						if wall.Size.x > wall.Size.z and wall.Size.x > wall.Size.y and wall.Size.z <= 1 and wall.Size.y <= 1 or wall.Size.z > wall.Size.x and wall.Size.z > wall.Size.y and wall.Size.x <= 1 and wall.Size.y <= 1 then
							cannnnn = false
							cananimate = false
							owner.Character.HumanoidRootPart.Anchored = true
							local gotin = false
							waitforbounce = 1
							thing:destroy()
							swoosh:Play()
							local detector = Instance.new("Part", wall)
							detector.Anchored = true
							detector.CanCollide = false
							detector.Transparency = 0
							detector.Name = "detector"
							detector.Size = Vector3.new(1,1,1)
							detector.CFrame = owner.Character.HumanoidRootPart.CFrame
							detector.CFrame = CFrame.new(detector.CFrame.x,wall.CFrame.y,detector.CFrame.z) * CFrame.new(0,-wall.Size.y/2,0)
							detector.CFrame = detector.CFrame * (owner.Character.HumanoidRootPart.CFrame - owner.Character.HumanoidRootPart.Position)
							detector.CFrame = detector.CFrame * CFrame.new(0,-2.5,-2)
							local detectframe = detector.CFrame
							detector:Destroy()
							local velocity = Instance.new("BodyVelocity", owner.Character.HumanoidRootPart)
							velocity.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
							velocity.Velocity = Vector3.new(0,0,0)
							velocity.Name = "goingup"
							for i = 0,0.7 , 0.06 do
								if not cananimate then
									owner.Character.HumanoidRootPart.CFrame = owner.Character.HumanoidRootPart.CFrame:lerp(detectframe,i)
									rightarm.C0 = rightarm.C0:lerp(CFrame.new(1.49999905, 1.14999866, -1.1258328, 1, 0, 0, 0, -0.499999791, -0.866025209, 0, 0.866025269, -0.499999821),i)
									leftarm.C0 = leftarm.C0:lerp(CFrame.new(-1.5, 1.10250282, -1.15195012, 1, 0, 0, 0, -0.463464141, -0.886115372, 0, 0.886115432, -0.463464141),i)
									leftleg.C0 = leftleg.C0:lerp(CFrame.new(-0.5, -1.76604462, -0.642787695, 1, 0, 0, 0, 0.76604408, -0.642787576, 0, 0.642787635, 0.76604414),i)
									rightleg.C0 = rightleg.C0:lerp(CFrame.new(0.5, -1.76604462, -0.642787695, 1, 0, 0, 0, 0.76604408, -0.642787576, 0, 0.642787635, 0.76604414),i)
									humanoidrootpart.C0 = humanoidrootpart.C0:lerp(CFrame.new(0, 0, 0, 1, 0, 0, 0, 0.49999994, -0.866025329, 0, 0.866025329, 0.49999994),i)
									head.C0 = head.C0:lerp(CFrame.new(0, 1.09780407, -0.743051291, 1, 0, 0, 0, 0.342019796, 0.939692438, 0, -0.939692438, 0.342019796),i)
									heartbeat:wait()
								end
							end
							owner.Character.HumanoidRootPart.Anchored = false
							velocity.Velocity = owner.Character.HumanoidRootPart.CFrame.lookVector * 30 + Vector3.new(0,20,0)
							local yeea = true
							local function smaller()
								wait(0.4)
								yeea = false
								velocity:destroy()
							end
							spawn(smaller)
							local function smallerevenmore()
								while yeea do
									velocity.Velocity = velocity.Velocity - Vector3.new(0,1,0)
									heartbeat:wait()
								end
							end
							spawn(smallerevenmore)
							cannnnn = true
							for i = 1,20 do
								if cannnnn then
									heartbeat:wait()
									humanoidrootpart.C0 = humanoidrootpart.C0 * CFrame.fromEulerAnglesXYZ(-0.04,0,0)
								end
							end
							cananimate = true
						else
							cannnnn = false
							cananimate = false
							local climbingg = Instance.new("BoolValue", owner.Character.HumanoidRootPart)
							climbingg.Name = "climbing"
							local gotin = false
							waitforbounce = 4
							thing:destroy()
							swoosh:Play()
							local detector = Instance.new("Part", wall)
							detector.Anchored = true
							detector.CanCollide = false
							detector.Transparency = 1
							detector.Name = "detector"
							detector.Size = Vector3.new(1,1,1)
							detector.CFrame = owner.Character.HumanoidRootPart.CFrame
							detector.CFrame = CFrame.new(detector.CFrame.x,wall.CFrame.y,detector.CFrame.z) * CFrame.new(0,wall.Size.y/2,0)
							detector.CFrame = detector.CFrame * (owner.Character.HumanoidRootPart.CFrame - owner.Character.HumanoidRootPart.Position)
							detector.CFrame = detector.CFrame * CFrame.new(0,0,-2)
							for i,v in pairs(owner.Character.HumanoidRootPart:GetChildren()) do
								if v.ClassName == "BodyVelocity" then
									v:destroy()
								end
							end
							local velocity = Instance.new("BodyVelocity", owner.Character.HumanoidRootPart)
							velocity.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
							velocity.Velocity = Vector3.new(0,20,0)
							velocity.Name = "goingup"
							local function smaller()
								while wait() do
									velocity.Velocity = velocity.Velocity - Vector3.new(0,1.2,0)
									if velocity.Velocity.y < -20 then
										velocity:destroy()
										if not gotin then
											cananimate = true
											cannnnn = true
											climbingg:destroy()
											for i,v in pairs(wall:GetChildren()) do
												if v.Name == "detector" then
													v:destroy()
												end
											end--]]
											for i,v in pairs(owner.Character.HumanoidRootPart:GetChildren()) do
												if v.ClassName == "BodyVelocity" then
													v:destroy()
												end
											end
										end
										break
									end
									if (owner.Character.Head.Position - detector.Position).magnitude < 2.5 and not owner.Character.HumanoidRootPart.Anchored then
										gotin = true
										jumping = false
										owner.Character.HumanoidRootPart.Anchored = true
										local detectframe = detector.CFrame
										for i,v in pairs(wall:GetChildren()) do
											if v.Name == "detector" then
												v:destroy()
											end
										end--]]
										for i,v in pairs(owner.Character.HumanoidRootPart:GetChildren()) do
											if v.ClassName == "BodyVelocity" then
												v:destroy()
											end
										end
										local look = owner.Character.HumanoidRootPart.CFrame
										for i = 0,0.6 , 0.04 do
											if not cananimate then
												owner.Character.HumanoidRootPart.CFrame = owner.Character.HumanoidRootPart.CFrame:lerp(detectframe,i)
												rightarm.C0 = rightarm.C0:lerp(CFrame.new(1.5, 0.25, -0.433013916, 1, 0, 0, 0, 0.49999994, -0.866025329, 0, 0.866025329, 0.5),i)
												leftarm.C0 = leftarm.C0:lerp(CFrame.new(-1.5, 0.116978168, -0.321393967, 1, 0, 0, 0, 0.766044199, -0.642787635, 0, 0.642787695, 0.766044259),i)
												leftleg.C0 = leftleg.C0:lerp(CFrame.new(-0.5, -1.12599897, -0.237342834, 1, 0, 1.74845553e-07, -5.98007261e-08, 0.939692378, 0.342020333, -1.64301071e-07, -0.342020363, 0.939692497),i)
												rightleg.C0 = rightleg.C0:lerp(CFrame.new(0.5, -1.0328021, -0.203876495, 1, 0, 0, 0, 0.866025209, 0.50000006, 0, -0.500000119, 0.866025269),i)
												humanoidrootpart.C0 = humanoidrootpart.C0:lerp(CFrame.new(0, 0, 0, 1, 0, 0, 0, 0.866025448, 0.499999851, 0, -0.499999851, 0.866025448),i)
												head.C0 = head.C0:lerp(CFrame.new(0, 1.46984625, 0.171009064, 1, 0, 0, 0, 0.939692616, -0.342020005, 0, 0.342020005, 0.939692616),i)
												heartbeat:wait()
											end
										end
										local look = owner.Character.HumanoidRootPart.CFrame
										owner.Character.HumanoidRootPart.Anchored = false
										for i = 0,0.6 , 0.04 do
											if not cananimate then
												owner.Character.HumanoidRootPart.CFrame = owner.Character.HumanoidRootPart.CFrame:lerp(look * CFrame.new(0,3.5,-2),i)
												rightarm.C0 = rightarm.C0:lerp(CFrame.new(1.5, 0.116979599, 0.321393967, 1, 0, 0, 0, 0.766044319, 0.642787337, 0, -0.642787457, 0.766044319),i)
												leftarm.C0 = leftarm.C0:lerp(CFrame.new(-1.5, 0.116979599, 0.321393967, 1, 0, 0, 0, 0.766044497, 0.642787158, 0, -0.642787218, 0.766044497),i)
												leftleg.C0 = leftleg.C0:lerp(CFrame.new(-0.5, -0.919174194, -0.390861511, 1, 3.0361619e-08, 1.7218926e-07, -5.9800719e-08, 0.984807491, 0.173648387, -1.64301042e-07, -0.173648387, 0.984807491),i)
												rightleg.C0 = rightleg.C0:lerp(CFrame.new(0.5, -0.967840195, -0.420351028, 1, 0, 0, 0, 0.984807491, 0.173648387, 0, -0.173648387, 0.984807491),i)
												humanoidrootpart.C0 = humanoidrootpart.C0:lerp(CFrame.new(0, 0, 0, 1, 0, 0, 0, 0.866025209, -0.500000119, 0, 0.500000119, 0.866025209),i)
												head.C0 = head.C0:lerp(CFrame.new(0, 1.43301201, -0.249999046, 1, 0, 0, 0, 0.866024971, 0.500000238, 0, -0.500000238, 0.866024971),i)
												heartbeat:wait()
											end
										end
										climbingg:destroy()
										cannnnn = true
										cananimate = true
									end
								end
							end
							spawn(smaller)
							for i = 0,0.4 , 0.025 do
								if not cananimate and not gotin then
									rightarm.C0 = rightarm.C0:lerp(CFrame.new(1.5, 0.992403984, -0.0868244171, 1, 0, 0, 0, -0.98480767, -0.173648283, 0, 0.173648298, -0.98480773),i)
									leftarm.C0 = leftarm.C0:lerp(CFrame.new(-1.5, 0.116977692, -0.321393967, 1, 0, 0, 0, 0.766044259, -0.642787695, 0, 0.642787755, 0.766044319),i)
									leftleg.C0 = leftleg.C0:lerp(CFrame.new(-0.5, -1.9396925, 0.342020035, 1, 0, 1.74845553e-07, -5.98007333e-08, 0.939692497, 0.342020333, -1.64301071e-07, -0.342020363, 0.939692557),i)
									rightleg.C0 = rightleg.C0:lerp(CFrame.new(0.5, -0.954449654, -0.603649139, 1, 0, 0, 0, 0.99999994, 1.7881392e-07, 0, -1.78813934e-07, 1),i)
									humanoidrootpart.C0 = humanoidrootpart.C0:lerp(CFrame.new(0,0,0),i)
									head.C0 = head.C0:lerp(CFrame.new(0, 1.43301296, 0.25, 1, 0, 0, 0, 0.866025388, -0.5, 0, 0.5, 0.866025388),i)
									heartbeat:wait()
								end
							end
						end
					end
				end
				thing.Touched:connect(bounceup)
			end
		else
			if owner.Character.Head:findFirstChild("goup") then
				owner.Character.Head:findFirstChild("goup"):destroy()
			end
			canplayjump = true
			jumping = false
		end
	end
end
spawn(checkjump)
function finish(character)
	if not character:findFirstChild("UpperTorso") and character:findFirstChildOfClass("Humanoid").Health > 0 then
		local whatfinisher = math.random(1,2)
		cananimate = false
		cando = false
		humanoidofowner.WalkSpeed = 0
		humanoidofowner.JumpPower = 0
		for i,v in pairs(character:GetChildren()) do
			if v.ClassName == "Script" or v.ClassName == "LocalScript" then
				v.Disabled = true
			end
		end
		if whatfinisher == 1 and character:findFirstChild("Left Arm") and character:findFirstChild("Left Leg") and character:findFirstChild("Right Leg") then
			if not character:findFirstChild("HumanoidRootPart") then
				local fakeroot = Instance.new("Part", character)
				fakeroot.Size = Vector3.new(2,2,1)
				fakeroot.Name = "HumanoidRootPart"
				fakeroot.Transparency = 1
				fakeroot.CFrame = character.Torso.CFrame
				fakeroot:BreakJoints()
			end
			local rightarmm = Instance.new("Weld", character.Torso)
			rightarmm.Part0 = character.Torso
			rightarmm.Part1 = character["Right Arm"]
			rightarmm.C0 = CFrame.new(1.5,0,0)
			rightarmm.Name = "RightArmWeld"
			local rightlegg = Instance.new("Weld", character.Torso)
			rightlegg.Part0 = character.Torso
			rightlegg.Part1 = character["Right Leg"]
			rightlegg.C0 = CFrame.new(0.5,-2,0)
			rightlegg.Name = "RightLegWeld"
			local leftlegg = Instance.new("Weld", character.Torso)
			leftlegg.Part0 = character.Torso
			leftlegg.Part1 = character["Left Leg"]
			leftlegg.C0 = CFrame.new(-0.5,-2,0)
			leftlegg.Name = "LeftLegWeld"
			local headd = Instance.new("Weld", character.Torso)
			headd.Part0 = character.Torso
			headd.Part1 = character.Head
			headd.C0 = CFrame.new(0,1.5,0)
			headd.Name = "HeadWeld"
			local humanoidrootpartt = Instance.new("Weld", character.HumanoidRootPart)
			humanoidrootpartt.Part0 = character.HumanoidRootPart
			humanoidrootpartt.Part1 = character.Torso
			humanoidrootpartt.Name = "HumanoidRootPartWeld"
			character:findFirstChildOfClass("Humanoid").WalkSpeed = 0
			character:findFirstChildOfClass("Humanoid").JumpPower = 0
			for i = 0,1 , 0.08 do
				rightarm.C0 = rightarm.C0:lerp(CFrame.new(-0.347203255, 0.913836479, -0.716785431, 0.766044378, 0.642787516, 0, 0.321393788, -0.383022249, -0.866025329, -0.556670368, 0.663413942, -0.50000006),i)
				leftarm.C0 = leftarm.C0:lerp(CFrame.new(-1.5, 0.821393967, -0.383022308, 0.99999994, 0, 0, 0, -0.642787457, -0.766044497, 0, 0.766044557, -0.642787516),i)
				leftleg.C0 = leftleg.C0:lerp(CFrame.new(-0.5,-2,0),i)
				rightleg.C0 = rightleg.C0:lerp(CFrame.new(0.5,-2,0),i)
				humanoidrootpart.C0 = humanoidrootpart.C0:lerp(CFrame.new(0,0,0),i)
				head.C0 = head.C0:lerp(CFrame.new(0,1.5,0),i)
				rightarmm.C0 = rightarmm.C0:lerp(CFrame.new(1.5, 0.933005095, -0.25, 1, -0, 0, 0, -0.866018534, -0.499996036, 0, 0.5, -0.866025388),i)
				cananimate = false
				cando = false
				heartbeat:wait()
			end
			swoosh:Play()
			for i = 0,1 , 0.08 do
				rightarm.C0 = rightarm.C0:lerp(CFrame.new(-0.0860614777, -0.0532417297, -0.650289536, 0.379258692, 0.842225015, 0.383170784, 0.166806862, 0.345090806, -0.923627436, -0.910130858, 0.414209276, -0.00961020589),i)
				leftarm.C0 = leftarm.C0:lerp(CFrame.new(-1.5, 0.00136232376, -0.198532104, 1, 0, 0, 0, 0.890729427, -0.454533815, 0, 0.454533845, 0.890729487),i)
				leftleg.C0 = leftleg.C0:lerp(CFrame.new(-0.5,-2,0),i)
				rightleg.C0 = rightleg.C0:lerp(CFrame.new(0.5,-2,0),i)
				humanoidrootpart.C0 = humanoidrootpart.C0:lerp(CFrame.new(0, 0, 0, 0.766044438, 0, 0.642787576, 0, 0.999992132, 0, -0.642787576, 0, 0.766044438),i)
				head.C0 = head.C0:lerp(CFrame.new(0, 1.49065351, -0.0962247849, 1, 0, 0, 0, 0.981306791, 0.192449972, 0, -0.192449972, 0.981306791),i)
				--
				cananimate = false
				cando = false
				rightarmm.C0 = rightarmm.C0:lerp(CFrame.new(1.5,0,0),i)
				humanoidrootpartt.C0 = humanoidrootpartt.C0:lerp(CFrame.new(0,0.5,0),i)
				heartbeat:wait()
			end
			for i = 0,1 , 0.04 do
				rightarm.C0 = rightarm.C0:lerp(CFrame.new(1.1859808, -0.054599762, -1.11998844, 0.992945373, 0.116977721, -0.0193826258, -0.103294089, 0.773099244, -0.625817776, -0.0582219958, 0.623405039, 0.779728591),i)
				leftarm.C0 = leftarm.C0:lerp(CFrame.new(-0.554852486, -0.182450294, -1.34047794, 0.642787635, -0.492403775, -0.586824059, -0.262002528, 0.578531981, -0.772434652, 0.719846308, 0.650260985, 0.242862105),i)
				leftleg.C0 = leftleg.C0:lerp(CFrame.new(-0.5, -1.64278793, 0.766043663, 1, 0, 0, 0, 0.642787457, 0.766044438, 0, -0.766044497, 0.642787516),i)
				rightleg.C0 = rightleg.C0:lerp(CFrame.new(1.10000038, -0.826352119, -0.984807968, 1, 0, 0, 0, 0.98480773, -0.173648149, 0, 0.173648149, 0.984807789),i)
				humanoidrootpart.C0 = humanoidrootpart.C0:lerp(CFrame.new(0, 0, 0, 1, 0, 0, 0, 0.642787635, -0.766044438, 0, 0.766044438, 0.642787635),i)
				head.C0 = head.C0:lerp(CFrame.new(0, 1.32139444, -0.383022308, 1, 0, 0, 0, 0.642787635, 0.766044438, 0, -0.766044438, 0.642787635),i)
				--
				leftlegg.C0 = leftlegg.C0:lerp(CFrame.new(-0.5, -1.49999237, -0.866015434, 0.999999762, -8.58400284e-08, -2.98023224e-08, 0, 0.499995828, -0.866025329, -7.4505806e-08, 0.866018713, 0.499999791),i)
				rightarmm.C0 = rightarmm.C0:lerp(CFrame.new(1.5, 0.749998093, 0.43300724, 0.999999702, 7.43086304e-08, 2.98023224e-08, -2.98023224e-08, -0.499996036, 0.866025269, -7.4505806e-08, -0.866018593, -0.50000006),i)
				humanoidrootpartt.C0 = humanoidrootpartt.C0:lerp(CFrame.new(0.367198944, -0.246408224, 0.930528641, -0.342020124, -0.813797832, 0.469845951, -1.78812527e-07, 0.499995708, 0.866018772, -0.939692497, 0.29619813, -0.171010032),i)
				rightlegg.C0 = rightlegg.C0:lerp(CFrame.new(0.5, -1.49999428, -0.866015434, 0.999999762, -9.0885095e-08, -2.98023224e-08, 0, 0.499995947, -0.866025329, -7.4505806e-08, 0.866018653, 0.49999994),i)
				heartbeat:wait()
			end
			kickhit:Play()
			for i = 0,0.8 , 0.06 do
				rightarm.C0 = rightarm.C0:lerp(CFrame.new(1.61715126, -0.19429493, -0.389017105, 0.992945373, 0.116552323, 0.0217949748, -0.103294089, 0.940518022, -0.323660791, -0.0582220107, 0.319126159, 0.945922256),i)
				leftarm.C0 = leftarm.C0:lerp(CFrame.new(-1.50154877, 0.246703148, -0.416801453, 0.999303818, 0.00836935267, -0.0363574326, -0.0330905914, 0.648926377, -0.760131419, 0.0172314793, 0.76080519, 0.648751557),i)
				leftleg.C0 = leftleg.C0:lerp(CFrame.new(-0.5, -1.91925335, 0.771346092, 1, -1.77635684e-15, 3.55271368e-15, 5.26663487e-16, 0.766044199, 0.642787814, 0, -0.642787874, 0.766044319),i)
				rightleg.C0 = rightleg.C0:lerp(CFrame.new(1.10000038, -1.60939121, -1.50965118, 1, -3.55271368e-15, -1.77635684e-15, 1.31103537e-15, 0.653455138, -0.75696516, -3.5527141e-15, 0.75696522, 0.653455257),i)
				humanoidrootpart.C0 = humanoidrootpart.C0:lerp(CFrame.new(0, 0.128557444, -0.153208733, 1, 0, 0, 0, 0.766044497, -0.642787635, 0, 0.642787635, 0.766044497) * CFrame.fromEulerAnglesXYZ(-0.4,0,0),i)
				head.C0 = head.C0:lerp(CFrame.new(0, 1.32139444, -0.383022308, 1, 0, 0, 0, 0.642787635, 0.766044438, 0, -0.766044438, 0.642787635),i)
				--
				headd.C0 = headd.C0:lerp(CFrame.new(-0.311040878, 1.39147186, -1.00135803e-05, 0.782955527, -0.622077763, 7.86021985e-08, 0.622077823, 0.782955468, 6.79979621e-06, -4.29154261e-06, -5.27504062e-06, 1),i)
				leftlegg.C0 = leftlegg.C0:lerp(CFrame.new(-0.5, -1.49999237, -0.866015434, 0.999999762, -8.58400284e-08, -2.98023224e-08, 0, 0.499995828, -0.866025329, -7.4505806e-08, 0.866018713, 0.499999791),i)
				rightarmm.C0 = rightarmm.C0:lerp(CFrame.new(1.5, 0.749998093, 0.43300724, 0.999999702, 7.43086304e-08, 2.98023224e-08, -2.98023224e-08, -0.499996036, 0.866025269, -7.4505806e-08, -0.866018593, -0.50000006),i)
				humanoidrootpartt.C0 = humanoidrootpartt.C0:lerp(CFrame.new(0.367198944, -0.246408224, 0.930528641, -0.342020124, -0.813797832, 0.469845951, -1.78812527e-07, 0.499995708, 0.866018772, -0.939692497, 0.29619813, -0.171010032),i)
				rightlegg.C0 = rightlegg.C0:lerp(CFrame.new(0.5, -1.49999428, -0.866015434, 0.999999762, -9.0885095e-08, -2.98023224e-08, 0, 0.499995947, -0.866025329, -7.4505806e-08, 0.866018653, 0.49999994),i)
				heartbeat:wait()
			end
			if character:findFirstChild("Torso") then
				for i,v in pairs(character.Torso:GetChildren()) do
					if v.ClassName == "Weld" or v.ClassName == "Motor6D" then
						v:destroy()
					end
				end
			end
			local vel = Instance.new("BodyVelocity", character:findFirstChild("Torso"))
			vel.MaxForce = Vector3.new(math.huge,0,math.huge)
			vel.Velocity = owner.Character.HumanoidRootPart.CFrame.lookVector * 10
			local function spawned()
				ragdollkill(character)
			end
			spawn(spawned)
		elseif whatfinisher == 2 and character:findFirstChild("Left Arm") and character:findFirstChild("Left Leg") and character:findFirstChild("Right Leg") then
			if not character:findFirstChild("HumanoidRootPart") then
				local fakeroot = Instance.new("Part", character)
				fakeroot.Size = Vector3.new(2,2,1)
				fakeroot.Name = "HumanoidRootPart"
				fakeroot.Transparency = 1
				fakeroot.CFrame = character.Torso.CFrame
				fakeroot:BreakJoints()
			end
			local rightarmm = Instance.new("Weld", character.Torso)
			rightarmm.Part0 = character.Torso
			rightarmm.Part1 = character["Right Arm"]
			rightarmm.C0 = CFrame.new(1.5,0,0)
			rightarmm.Name = "RightArmWeld"
			local rightlegg = Instance.new("Weld", character.Torso)
			rightlegg.Part0 = character.Torso
			rightlegg.Part1 = character["Right Leg"]
			rightlegg.C0 = CFrame.new(0.5,-2,0)
			rightlegg.Name = "RightLegWeld"
			local leftlegg = Instance.new("Weld", character.Torso)
			leftlegg.Part0 = character.Torso
			leftlegg.Part1 = character["Left Leg"]
			leftlegg.C0 = CFrame.new(-0.5,-2,0)
			leftlegg.Name = "LeftLegWeld"
			local headd = Instance.new("Weld", character.Torso)
			headd.Part0 = character.Torso
			headd.Part1 = character.Head
			headd.C0 = CFrame.new(0,1.5,0)
			headd.Name = "HeadWeld"
			local leftarmm = Instance.new("Weld", character.Torso)
			leftarmm.Part0 = character.Torso
			leftarmm.Part1 = character["Left Arm"]
			leftarmm.C0 = CFrame.new(-1.5,0,0)
			leftarmm.Name = "LeftArmWeld"
			local humanoidrootpartt = Instance.new("Weld", character.HumanoidRootPart)
			humanoidrootpartt.Part0 = character.HumanoidRootPart
			humanoidrootpartt.Part1 = character.Torso
			humanoidrootpartt.Name = "HumanoidRootPartWeld"
			character:findFirstChildOfClass("Humanoid").WalkSpeed = 0
			character:findFirstChildOfClass("Humanoid").JumpPower = 0
			for i = 0,1 , 0.08 do
				rightarm.C0 = rightarm.C0:lerp(CFrame.new(-0.347203255, 0.913836479, -0.716785431, 0.766044378, 0.642787516, 0, 0.321393788, -0.383022249, -0.866025329, -0.556670368, 0.663413942, -0.50000006),i)
				leftarm.C0 = leftarm.C0:lerp(CFrame.new(-1.5, 0.821393967, -0.383022308, 0.99999994, 0, 0, 0, -0.642787457, -0.766044497, 0, 0.766044557, -0.642787516),i)
				leftleg.C0 = leftleg.C0:lerp(CFrame.new(-0.5,-2,0),i)
				rightleg.C0 = rightleg.C0:lerp(CFrame.new(0.5,-2,0),i)
				humanoidrootpart.C0 = humanoidrootpart.C0:lerp(CFrame.new(0,0,0),i)
				head.C0 = head.C0:lerp(CFrame.new(0,1.5,0),i)
				rightarmm.C0 = rightarmm.C0:lerp(CFrame.new(1.5, 0.933005095, -0.25, 1, -0, 0, 0, -0.866018534, -0.499996036, 0, 0.5, -0.866025388),i)
				cananimate = false
				cando = false
				heartbeat:wait()
			end
			swoosh:Play()
			for i = 0,1 , 0.08 do
				rightarm.C0 = rightarm.C0:lerp(CFrame.new(-0.0860614777, -0.0532417297, -0.650289536, 0.379258692, 0.842225015, 0.383170784, 0.166806862, 0.345090806, -0.923627436, -0.910130858, 0.414209276, -0.00961020589),i)
				leftarm.C0 = leftarm.C0:lerp(CFrame.new(-1.5, 0.00136232376, -0.198532104, 1, 0, 0, 0, 0.890729427, -0.454533815, 0, 0.454533845, 0.890729487),i)
				leftleg.C0 = leftleg.C0:lerp(CFrame.new(-0.5,-2,0),i)
				rightleg.C0 = rightleg.C0:lerp(CFrame.new(0.5,-2,0),i)
				humanoidrootpart.C0 = humanoidrootpart.C0:lerp(CFrame.new(0, 0, 0, 0.766044438, 0, 0.642787576, 0, 0.999992132, 0, -0.642787576, 0, 0.766044438),i)
				head.C0 = head.C0:lerp(CFrame.new(0, 1.49065351, -0.0962247849, 1, 0, 0, 0, 0.981306791, 0.192449972, 0, -0.192449972, 0.981306791),i)
				--
				cananimate = false
				cando = false
				rightarmm.C0 = rightarmm.C0:lerp(CFrame.new(1.5,0,0),i)
				humanoidrootpartt.C0 = humanoidrootpartt.C0:lerp(CFrame.new(0,0.5,0),i)
				heartbeat:wait()
			end
			--zium
			for i = 0,0.8 , 0.06 do
				rightarm.C0 = rightarm.C0:lerp(CFrame.new(1.4773941, 0.333595514, -0.662953377, -0.102069035, 0.060344018, -0.992945373, -0.994496286, 0.0175344925, 0.103294067, 0.0236439742, 0.998023689, 0.0582221746),i)
				leftarm.C0 = leftarm.C0:lerp(CFrame.new(0.0886116028, 0.633853912, -1.34011459, 0.642787635, -0.719846368, -0.262002528, -0.262002468, 0.11480581, -0.958214104, 0.719846308, 0.684573472, -0.114805803),i)
				leftleg.C0 = leftleg.C0:lerp(CFrame.new(-0.5,-2,0),i)
				rightleg.C0 = rightleg.C0:lerp(CFrame.new(0.5,-2,0),i)
				humanoidrootpart.C0 = humanoidrootpart.C0:lerp(CFrame.new(0,0,0),i)
				head.C0 = head.C0:lerp(CFrame.new(0, 1.49240375, -0.0868234634, 1, 0, 0, 0, 0.98480773, 0.173648149, 0, -0.173648149, 0.98480773),i)
				--
				leftarmm.C0 = leftarmm.C0:lerp(CFrame.new(-1.5, 0.586824417, -0.492403984, 1, 0, 8.8817842e-16, 0, -0.173648149, -0.984807551, -1.33050135e-16, 0.984807611, -0.173648164),i)
				headd.C0 = headd.C0:lerp(CFrame.new(0, 1.46984577, -0.171010256, 1, 0, 0, 0, 0.939692438, 0.342020303, -1.33050135e-16, -0.342020303, 0.939692438),i)
				leftlegg.C0 = leftlegg.C0:lerp(CFrame.new(-0.5, -1.5, 0.866025209, 1, 0, 0, 0, 0.5, 0.86602509, -1.33050135e-16, -0.86602515, 0.50000006),i)
				rightarmm.C0 = rightarmm.C0:lerp(CFrame.new(1.5, 0.75, 0.433012247, 0.99999994, -4.4408921e-16, 0, 0, -0.50000006, 0.86602515, -1.33050082e-16, -0.866025209, -0.500000119),i)
				humanoidrootpartt.C0 = humanoidrootpartt.C0:lerp(CFrame.new(0, 0, 0.799999237, 1.19248806e-08, -0.99999994, 4.47034836e-08, 0, 4.47034836e-08, 0.99999994, -1, -1.19248798e-08, 6.66133815e-16),i)
				rightlegg.C0 = rightlegg.C0:lerp(CFrame.new(0.5, -1.64278698, -0.766044378, 0.99999994, 0, 0, 0, 0.642787397, -0.766044319, -1.33050082e-16, 0.766044378, 0.642787457),i)
				heartbeat:wait()
			end
			character.HumanoidRootPart.CFrame = character.HumanoidRootPart.CFrame * CFrame.fromEulerAnglesXYZ(0,0,1)
			if character:findFirstChild("Torso") then
				for i,v in pairs(character.Torso:GetChildren()) do
					if v.ClassName == "Weld" or v.ClassName == "Motor6D" then
						v:destroy()
					end
				end
			end
			local function spawned()
				ragdollkill(character)
			end
			spawn(spawned)
		end
		cananimate = true
		cando = true
		humanoidofowner.WalkSpeed = 25
		humanoidofowner.JumpPower = 50
	else
		ragdollkill(character)
	end
end
function ragdollkill(character)
	local victimshumanoid = character:findFirstChildOfClass("Humanoid")
	if not character:findFirstChild("UpperTorso") then
		character.Archivable = true
		for i,v in pairs(character:GetChildren()) do
			if v.ClassName == "Sound" then
				v:remove()
			end
			for q,w in pairs(v:GetChildren()) do
				if w.ClassName == "Sound" then
					w:remove()
				end
			end
		end
		local ragdoll = character:Clone()
		ragdoll:findFirstChildOfClass("Humanoid").Health = 0
		if ragdoll:findFirstChild("Health") then
			if ragdoll:findFirstChild("Health").ClassName == "Script" then
				ragdoll:findFirstChild("Health").Disabled = true
			end
		end
		for i,v in pairs(character:GetChildren()) do
			if v.ClassName == "Part" or v.ClassName == "ForceField" or v.ClassName == "Accessory" or v.ClassName == "Hat" then
				v:destroy()
			end
		end
		for i,v in pairs(character:GetChildren()) do
			if v.ClassName == "Accessory" then
				local attachment1 = v.Handle:findFirstChildOfClass("Attachment")
				if attachment1 then
					for q,w in pairs(character:GetChildren()) do
						if w.ClassName == "Part" then
							local attachment2 = w:findFirstChild(attachment1.Name)
							if attachment2 then
								local hinge = Instance.new("HingeConstraint", v.Handle)
								hinge.Attachment0 = attachment1
								hinge.Attachment1 = attachment2
								hinge.LimitsEnabled = true
								hinge.LowerAngle = 0
								hinge.UpperAngle = 0
							end
						end
					end
				end
			end
		end
		ragdoll.Parent = workspace
		if ragdoll:findFirstChild("Right Arm") then
			local glue = Instance.new("Glue", ragdoll.Torso)
			glue.Part0 = ragdoll.Torso
			glue.Part1 = ragdoll:findFirstChild("Right Arm")
			glue.C0 = CFrame.new(1.5, 0.5, 0, 0, 0, 1, 0, 1, 0, -1, 0, 0)
			glue.C1 = CFrame.new(0, 0.5, 0, 0, 0, 1, 0, 1, 0, -1, 0, 0)
			local limbcollider = Instance.new("Part", ragdoll:findFirstChild("Right Arm"))
			limbcollider.Size = Vector3.new(1.4,1,1)
			limbcollider.Shape = "Cylinder"
			limbcollider.Transparency = 1
			limbcollider.Name = "LimbCollider"
			local limbcolliderweld = Instance.new("Weld", limbcollider)
			limbcolliderweld.Part0 = ragdoll:findFirstChild("Right Arm")
			limbcolliderweld.Part1 = limbcollider
			limbcolliderweld.C0 = CFrame.fromEulerAnglesXYZ(0,0,math.pi/2) * CFrame.new(-0.3,0,0)
		end
		if ragdoll:findFirstChild("Left Arm") then
			local glue = Instance.new("Glue", ragdoll.Torso)
			glue.Part0 = ragdoll.Torso
			glue.Part1 = ragdoll:findFirstChild("Left Arm")
			glue.C0 = CFrame.new(-1.5, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
			glue.C1 = CFrame.new(0, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
			local limbcollider = Instance.new("Part", ragdoll:findFirstChild("Left Arm"))
			limbcollider.Size = Vector3.new(1.4,1,1)
			limbcollider.Shape = "Cylinder"
			limbcollider.Name = "LimbCollider"
			limbcollider.Transparency = 1
			local limbcolliderweld = Instance.new("Weld", limbcollider)
			limbcolliderweld.Part0 = ragdoll:findFirstChild("Left Arm")
			limbcolliderweld.Part1 = limbcollider
			limbcolliderweld.C0 = CFrame.fromEulerAnglesXYZ(0,0,math.pi/2) * CFrame.new(-0.3,0,0)
		end
		if ragdoll:findFirstChild("Left Leg") then
			local glue = Instance.new("Glue", ragdoll.Torso)
			glue.Part0 = ragdoll.Torso
			glue.Part1 = ragdoll:findFirstChild("Left Leg")
			glue.C0 = CFrame.new(-0.5, -1, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0)
			glue.C1 = CFrame.new(-0, 1, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0)
			local limbcollider = Instance.new("Part", ragdoll:findFirstChild("Left Leg"))
			limbcollider.Size = Vector3.new(1.4,1,1)
			limbcollider.Shape = "Cylinder"
			limbcollider.Name = "LimbCollider"
			limbcollider.Transparency = 1
			local limbcolliderweld = Instance.new("Weld", limbcollider)
			limbcolliderweld.Part0 = ragdoll:findFirstChild("Left Leg")
			limbcolliderweld.Part1 = limbcollider
			limbcolliderweld.C0 = CFrame.fromEulerAnglesXYZ(0,0,math.pi/2) * CFrame.new(-0.3,0,0)
		end
		if ragdoll:findFirstChild("Right Leg") then
			local glue = Instance.new("Glue", ragdoll.Torso)
			glue.Part0 = ragdoll.Torso
			glue.Part1 = ragdoll:findFirstChild("Right Leg")
			glue.C0 = CFrame.new(0.5, -1, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0)
			glue.C1 = CFrame.new(0, 1, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0)
			local limbcollider = Instance.new("Part", ragdoll:findFirstChild("Right Leg"))
			limbcollider.Size = Vector3.new(1.4,1,1)
			limbcollider.Shape = "Cylinder"
			limbcollider.Name = "LimbCollider"
			limbcollider.Transparency = 1
			local limbcolliderweld = Instance.new("Weld", limbcollider)
			limbcolliderweld.Part0 = ragdoll:findFirstChild("Right Leg")
			limbcolliderweld.Part1 = limbcollider
			limbcolliderweld.C0 = CFrame.fromEulerAnglesXYZ(0,0,math.pi/2) * CFrame.new(-0.3,0,0)
		end
		if ragdoll:findFirstChild("Head") and ragdoll.Torso:findFirstChild("NeckAttachment") then
			local HeadAttachment = Instance.new("Attachment", ragdoll["Head"])
			HeadAttachment.Position = Vector3.new(0, -0.5, 0)
			local connection = Instance.new('HingeConstraint', ragdoll["Head"])
			connection.LimitsEnabled = true
			connection.Attachment0 = ragdoll.Torso.NeckAttachment
			connection.Attachment1 = HeadAttachment
			connection.UpperAngle = 60
			connection.LowerAngle = -60
		elseif ragdoll:findFirstChild("Head") and not ragdoll.Torso:findFirstChild("NeckAttachment") then
			local hedweld = Instance.new("Weld", ragdoll.Torso)
			hedweld.Part0 = ragdoll.Torso
			hedweld.Part1 = ragdoll.Head
			hedweld.C0 = CFrame.new(0,1.5,0)
		end
		game.Debris:AddItem(ragdoll, 30)
		local function doremove()
			wait(0.3)
			for q,w in pairs(ragdoll:GetChildren()) do
				if w.ClassName == "BodyVelocity" then
					w:destroy()
				end
				for e,r in pairs(w:GetChildren()) do
					if r.ClassName == "BodyVelocity" then
						r:destroy()
					end
				end
			end
		end
		spawn(doremove)
		wait(1)
		if ragdoll:findFirstChildOfClass("Humanoid") then
			ragdoll:findFirstChildOfClass("Humanoid").PlatformStand = true
		end
		if ragdoll:findFirstChild("HumanoidRootPart") then
			ragdoll:findFirstChild("HumanoidRootPart"):destroy()
		end
	elseif character:findFirstChild("UpperTorso") then
		character.Archivable = true
		for i,v in pairs(character:GetChildren()) do
			if v.ClassName == "Sound" then
				v:remove()
			end
			for q,w in pairs(v:GetChildren()) do
				if w.ClassName == "Sound" then
					w:remove()
				end
			end
		end
		local ragdoll = character:Clone()
		ragdoll:findFirstChildOfClass("Humanoid").Health = 0
		if ragdoll:findFirstChild("Health") then
			if ragdoll:findFirstChild("Health").ClassName == "Script" then
				ragdoll:findFirstChild("Health").Disabled = true
			end
		end
		for i,v in pairs(character:GetChildren()) do
			if v.ClassName == "Part" or v.ClassName == "ForceField" or v.ClassName == "Accessory" or v.ClassName == "Hat" or v.ClassName == "MeshPart" then
				v:destroy()
			end
		end
		for i,v in pairs(character:GetChildren()) do
			if v.ClassName == "Accessory" then
				local attachment1 = v.Handle:findFirstChildOfClass("Attachment")
				if attachment1 then
					for q,w in pairs(character:GetChildren()) do
						if w.ClassName == "Part" or w.ClassName == "MeshPart" then
							local attachment2 = w:findFirstChild(attachment1.Name)
							if attachment2 then
								local hinge = Instance.new("HingeConstraint", v.Handle)
								hinge.Attachment0 = attachment1
								hinge.Attachment1 = attachment2
								hinge.LimitsEnabled = true
								hinge.LowerAngle = 0
								hinge.UpperAngle = 0
							end
						end
					end
				end
			end
		end
		ragdoll.Parent = workspace
		local Humanoid = ragdoll:findFirstChildOfClass("Humanoid")
		Humanoid.PlatformStand = true
		local function makeballconnections(limb, attachementone, attachmenttwo, twistlower, twistupper)
			local connection = Instance.new('BallSocketConstraint', limb)
			connection.LimitsEnabled = true
			connection.Attachment0 = attachementone
			connection.Attachment1 = attachmenttwo
			connection.TwistLimitsEnabled = true
			connection.TwistLowerAngle = twistlower
			connection.TwistUpperAngle = twistupper
			local limbcollider = Instance.new("Part", limb)
			limbcollider.Size = Vector3.new(0.1,1,1)
			limbcollider.Shape = "Cylinder"
			limbcollider.Transparency = 1
			limbcollider:BreakJoints()
			local limbcolliderweld = Instance.new("Weld", limbcollider)
			limbcolliderweld.Part0 = limb
			limbcolliderweld.Part1 = limbcollider
			limbcolliderweld.C0 = CFrame.fromEulerAnglesXYZ(0,0,math.pi/2)
		end
		local function makehingeconnections(limb, attachementone, attachmenttwo, lower, upper)
			local connection = Instance.new('HingeConstraint', limb)
			connection.LimitsEnabled = true
			connection.Attachment0 = attachementone
			connection.Attachment1 = attachmenttwo
			connection.LimitsEnabled = true
			connection.LowerAngle = lower
			connection.UpperAngle = upper
			local limbcollider = Instance.new("Part", limb)
			limbcollider.Size = Vector3.new(0.1,1,1)
			limbcollider.Shape = "Cylinder"
			limbcollider.Transparency = 1
			limbcollider:BreakJoints()
			local limbcolliderweld = Instance.new("Weld", limbcollider)
			limbcolliderweld.Part0 = limb
			limbcolliderweld.Part1 = limbcollider
			limbcolliderweld.C0 = CFrame.fromEulerAnglesXYZ(0,0,math.pi/2)
		end
		local HeadAttachment = Instance.new("Attachment", Humanoid.Parent.Head)
		HeadAttachment.Position = Vector3.new(0, -0.5, 0)
		makehingeconnections(Humanoid.Parent.Head, HeadAttachment, ragdoll.UpperTorso.NeckAttachment, -50, 50)
		makehingeconnections(Humanoid.Parent.LowerTorso, Humanoid.Parent.LowerTorso.WaistRigAttachment, Humanoid.Parent.UpperTorso.WaistRigAttachment, -50, 50)
		makeballconnections(Humanoid.Parent.LeftUpperArm, Humanoid.Parent.LeftUpperArm.LeftShoulderRigAttachment, Humanoid.Parent.UpperTorso.LeftShoulderRigAttachment, -200, 200, 180)
		makehingeconnections(Humanoid.Parent.LeftLowerArm, Humanoid.Parent.LeftLowerArm.LeftElbowRigAttachment, Humanoid.Parent.LeftUpperArm.LeftElbowRigAttachment, 0, -60)
		makehingeconnections(Humanoid.Parent.LeftHand, Humanoid.Parent.LeftHand.LeftWristRigAttachment, Humanoid.Parent.LeftLowerArm.LeftWristRigAttachment, -20, 20)
		--
		makeballconnections(Humanoid.Parent.RightUpperArm, Humanoid.Parent.RightUpperArm.RightShoulderRigAttachment, Humanoid.Parent.UpperTorso.RightShoulderRigAttachment, -200, 200, 180)
		makehingeconnections(Humanoid.Parent.RightLowerArm, Humanoid.Parent.RightLowerArm.RightElbowRigAttachment, Humanoid.Parent.RightUpperArm.RightElbowRigAttachment, 0, -60)
		makehingeconnections(Humanoid.Parent.RightHand, Humanoid.Parent.RightHand.RightWristRigAttachment, Humanoid.Parent.RightLowerArm.RightWristRigAttachment, -20, 20)
		--
		makeballconnections(Humanoid.Parent.RightUpperLeg, Humanoid.Parent.RightUpperLeg.RightHipRigAttachment, Humanoid.Parent.LowerTorso.RightHipRigAttachment, -80, 80, 80)
		makehingeconnections(Humanoid.Parent.RightLowerLeg, Humanoid.Parent.RightLowerLeg.RightKneeRigAttachment, Humanoid.Parent.RightUpperLeg.RightKneeRigAttachment, 0, 60)
		makehingeconnections(Humanoid.Parent.RightFoot, Humanoid.Parent.RightFoot.RightAnkleRigAttachment, Humanoid.Parent.RightLowerLeg.RightAnkleRigAttachment, -20, 20)
		--
		makeballconnections(Humanoid.Parent.LeftUpperLeg, Humanoid.Parent.LeftUpperLeg.LeftHipRigAttachment, Humanoid.Parent.LowerTorso.LeftHipRigAttachment, -80, 80, 80)
		makehingeconnections(Humanoid.Parent.LeftLowerLeg, Humanoid.Parent.LeftLowerLeg.LeftKneeRigAttachment, Humanoid.Parent.LeftUpperLeg.LeftKneeRigAttachment, 0, 60)
		makehingeconnections(Humanoid.Parent.LeftFoot, Humanoid.Parent.LeftFoot.LeftAnkleRigAttachment, Humanoid.Parent.LeftLowerLeg.LeftAnkleRigAttachment, -20, 20)
		for i,v in pairs(Humanoid.Parent:GetChildren()) do
			if v.ClassName == "Accessory" then
				local attachment1 = v.Handle:findFirstChildOfClass("Attachment")
				if attachment1 then
					for q,w in pairs(Humanoid.Parent:GetChildren()) do
						if w.ClassName == "Part" then
							local attachment2 = w:findFirstChild(attachment1.Name)
							if attachment2 then
								local hinge = Instance.new("HingeConstraint", v.Handle)
								hinge.Attachment0 = attachment1
								hinge.Attachment1 = attachment2
								hinge.LimitsEnabled = true
								hinge.LowerAngle = 0
								hinge.UpperAngle = 0
							end
						end
					end
				end
			end
		end
		for i,v in pairs(ragdoll:GetChildren()) do
			for q,w in pairs(v:GetChildren()) do
				if w.ClassName == "Motor6D"--[[ and w.Name ~= "Neck"--]] then
					w:destroy()
				end
			end
		end
		if ragdoll:findFirstChild("HumanoidRootPart") then
			ragdoll.HumanoidRootPart.Anchored = true
			ragdoll.HumanoidRootPart.CanCollide = false
		end
		if ragdoll:findFirstChildOfClass("Humanoid") then
			ragdoll:findFirstChildOfClass("Humanoid").PlatformStand = true
		end
		local function doremove()
			wait(0.3)
			if ragdoll:findFirstChild("HumanoidRootPart") then
				ragdoll.HumanoidRootPart.Anchored = true
				ragdoll.HumanoidRootPart.CanCollide = false
			end
			for q,w in pairs(ragdoll:GetChildren()) do
				if w.ClassName == "BodyVelocity" then
					w:destroy()
				end
				for e,r in pairs(w:GetChildren()) do
					if r.ClassName == "BodyVelocity" then
						r:destroy()
					end
				end
			end
		end
		spawn(doremove)
		game.Debris:AddItem(ragdoll, 30)
	end
end
while game:GetService("RunService").Heartbeat:wait() do
	if cananimate then
		if waitforbounce > 0 then
			waitforbounce = waitforbounce - 1
		end
	end
	if jumping then
		for i = 0,0.6 , 0.09 do
			if jumping and cananimate and not owner.Character.HumanoidRootPart:findFirstChild("ow") then
				rightarm.C0 = rightarm.C0:lerp(CFrame.new(1.5, 0.328983307, 0.469837666, 1, 0, 0, 0, 0.342022061, 0.939691961, 0, -0.93969202, 0.342022061),i)
				leftarm.C0 = leftarm.C0:lerp(CFrame.new(-1.5, 0.586815834, -0.492397785, 1, 0, 0, 0, -0.173650756, -0.984807312, 0, 0.984807312, -0.173650786),i)
				leftleg.C0 = leftleg.C0:lerp(CFrame.new(-0.5, -1.34200048, 0.939681053, 1, 0, 0, 0, 0.342022181, 0.939691961, 0, -0.939691901, 0.34202221),i)
				rightleg.C0 = rightleg.C0:lerp(CFrame.new(0.5, -1.34199452, -0.939673424, 1, 0, 0, 0, 0.34201777, -0.93969357, 0, 0.939693511, 0.34201777),i)
				humanoidrootpart.C0 = humanoidrootpart.C0:lerp(CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 2.98025861e-06, 0, -2.98025907e-06, 1),i)
				head.C0 = head.C0:lerp(CFrame.new(0, 1.49997473, -4.29153442e-06, 1, 0, 0, 0, 1, 2.98025861e-06, 0, -2.98025907e-06, 1),i)
				game:GetService("RunService").Heartbeat:wait()
			end
		end
	end
	if running and not jumping and cananimate then
		local rarmc0 = rightarm.C0
		local larmc0 = leftarm.C0
		local llegc0 = leftleg.C0
		local rlegc0 = rightleg.C0
		local humrootc0 = humanoidrootpart.C0
		local headc0 = head.C0
		for i = 0,1 , 0.16 do
			if running and not jumping and cananimate and not owner.Character.HumanoidRootPart:findFirstChild("ow") then
				rightarm.C0 = rarmc0:lerp(CFrame.new(1.68157005, 0.0485486984, 0.884954453, 0.98480773, -0.171010077, 0.0301536564, 0.0593911707, 0.494882554, 0.866927743, -0.163175955, -0.851966381, 0.497520655),i)
				leftarm.C0 = larmc0:lerp(CFrame.new(-1.5, 0.671010017, -0.469846725, 1, 0, 0, 0, -0.342020094, -0.939692557, 0, 0.939692616, -0.342020124),i)
				leftleg.C0 = llegc0:lerp(CFrame.new(-0.5, -1.34202051, 0.939691544, 1, 3.55271368e-15, 0, -7.10542736e-15, 0.342020154, 0.939692616, 1.77635705e-15, -0.939692616, 0.342020154),i)
				rightleg.C0 = rlegc0:lerp(CFrame.new(0.5, -1.04278755, -1.56604576, 1, 0, 0, 0, 0.642787635, -0.766044319, 0, 0.766044378, 0.642787755),i)
				humanoidrootpart.C0 = humrootc0:lerp(CFrame.new(0, 0.18793869, -0.068403244, 1, 0, 0, 0, 0.939692497, 0.342020482, 0, -0.342020482, 0.939692497) * CFrame.new(0,-0.4,0),i)
				head.C0 = headc0:lerp(CFrame.new(0, 1.46984625, 0.171009064, 1, 0, 0, 0, 0.939692497, -0.342020482, 0, 0.342020482, 0.939692497),i)
				game:GetService("RunService").Heartbeat:wait()
			end
		end
		local rarmc0 = rightarm.C0
		local larmc0 = leftarm.C0
		local llegc0 = leftleg.C0
		local rlegc0 = rightleg.C0
		local humrootc0 = humanoidrootpart.C0
		local headc0 = head.C0
		for i = 0,1 , 0.16 do
			if running and not jumping and cananimate and not owner.Character.HumanoidRootPart:findFirstChild("ow") then
				rightarm.C0 = rarmc0:lerp(CFrame.new(1.56195927, -0.0699324608, 0.119949341, 0.98480773, -0.0868241489, 0.1503838, 0.0593911782, 0.982209623, 0.17814827, -0.163175985, -0.166510344, 0.972444296),i)
				leftarm.C0 = larmc0:lerp(CFrame.new(-1.51513863, -0.129981518, -0.155303955, 0.998369873, 0.0540187061, 0.0184263606, -0.0462776423, 0.955111921, -0.292607933, -0.0334055424, 0.291278243, 0.956054926),i)
				leftleg.C0 = llegc0:lerp(CFrame.new(-0.5, -0.863191605, -0.37587738, 1, 3.55271368e-15, 0, -7.10542736e-15, 0.342020154, 0.939692616, 1.77635705e-15, -0.939692616, 0.342020154),i)
				rightleg.C0 = rlegc0:lerp(CFrame.new(0.5, -2.06334591, 0.204090118, 1, 8.8817842e-16, 0, -8.8817842e-16, 0.98480767, 0.173648238, 0, -0.173648268, 0.98480773),i)
				humanoidrootpart.C0 = humrootc0:lerp(CFrame.new(0, 0, 0, 1, 0, 0, 0, 0.939692497, 0.342020482, 0, -0.342020482, 0.939692497) * CFrame.new(0,-0.4,0),i)
				head.C0 = headc0:lerp(CFrame.new(0, 1.46984673, 0.171010971, 1, 0, 0, 0, 0.939692497, -0.342020482, 0, 0.342020482, 0.939692497),i)
				game:GetService("RunService").Heartbeat:wait()
			end
		end
		footstep:Play()
		local rarmc0 = rightarm.C0
		local larmc0 = leftarm.C0
		local llegc0 = leftleg.C0
		local rlegc0 = rightleg.C0
		local humrootc0 = humanoidrootpart.C0
		local headc0 = head.C0
		for i = 0,1 , 0.16 do
			if running and not jumping and cananimate and not owner.Character.HumanoidRootPart:findFirstChild("ow") then
				rightarm.C0 = rarmc0:lerp(CFrame.new(1.5, 0.671010017, -0.469846725, 1, 0, 0, 0, -0.342020035, -0.939692616, 0, 0.939692676, -0.342020065),i)
				leftarm.C0 = larmc0:lerp(CFrame.new(-1.48023987, -0.0610394478, 0.792190552, 0.998369932, -0.0087661799, 0.0563976094, -0.0462775454, 0.454015464, 0.889791071, -0.033405453, -0.890950739, 0.452869713),i)
				leftleg.C0 = llegc0:lerp(CFrame.new(-0.5, -1.26786566, -1.64663887, 1, 0, 0, 0, 0.642787933, -0.76604414, 0, 0.76604414, 0.642787993),i)
				rightleg.C0 = rlegc0:lerp(CFrame.new(0.5, -1.42055845, 0.970134735, 1, 0, 0, 3.55271368e-15, 0.342020154, 0.939692616, 0, -0.939692616, 0.342020154),i)
				humanoidrootpart.C0 = humrootc0:lerp(CFrame.new(0, 0.18793869, -0.068403244, 1, 0, 0, 0, 0.939692497, 0.342020482, 0, -0.342020482, 0.939692497) * CFrame.new(0,-0.4,0),i)
				head.C0 = headc0:lerp(CFrame.new(0, 1.46984673, 0.171010971, 1, 0, 0, 0, 0.939692497, -0.342020482, 0, 0.342020482, 0.939692497),i)
				game:GetService("RunService").Heartbeat:wait()
			end
		end
		local rarmc0 = rightarm.C0
		local larmc0 = leftarm.C0
		local llegc0 = leftleg.C0
		local rlegc0 = rightleg.C0
		local humrootc0 = humanoidrootpart.C0
		local headc0 = head.C0
		for i = 0,1 , 0.16 do
			if running and not jumping and cananimate and not owner.Character.HumanoidRootPart:findFirstChild("ow") then
				rightarm.C0 = rarmc0:lerp(CFrame.new(1.54040813, 0.09547472, 0.0500869751, 0.984807611, -0.0593915023, 0.163176641, 0.059391439, 0.998222768, 0.00488311052, -0.163176671, 0.00488239527, 0.986584723),i)
				leftarm.C0 = larmc0:lerp(CFrame.new(-1.49622726, 0.0558686256, 0.152441025, 0.998369813, 0.0444596186, 0.03579133, -0.0462785624, 0.99758935, 0.0517075658, -0.0334061533, -0.0532796681, 0.998020709),i)
				leftleg.C0 = llegc0:lerp(CFrame.new(-0.5, -1.93537951, 0.411506653, 1, 0, 0, 0, 0.939692199, 0.342021108, 0, -0.342021137, 0.939692259),i)
				rightleg.C0 = rlegc0:lerp(CFrame.new(0.5, -0.941730499, -0.345434189, 1, 0, 0, 3.55271368e-15, 0.342020154, 0.939692616, 0, -0.939692616, 0.342020154),i)
				humanoidrootpart.C0 = humrootc0:lerp(CFrame.new(0, 0, 0, 1, 0, 0, 0, 0.939692497, 0.342020482, 0, -0.342020482, 0.939692497) * CFrame.new(0,-0.4,0),i)
				head.C0 = headc0:lerp(CFrame.new(0, 1.46984625, 0.171010971, 1, 0, 0, 0, 0.939692497, -0.342020482, 0, 0.342020482, 0.939692497),i)
				game:GetService("RunService").Heartbeat:wait()
			end
		end
		footstep:Play()
	else
		for i = 0,0.6 , 0.08 do
			if not running and not jumping and cananimate and not owner.Character.HumanoidRootPart:findFirstChild("ow") then
				rightarm.C0 = rightarm.C0:lerp(CFrame.new(1.54167557, 0.0454807281, 1.90734863e-06, 0.99619472, -0.0871554986, 0, 0.0871554837, 0.996194661, -4.4408921e-16, 0, 0, 1),i)
				leftarm.C0 = leftarm.C0:lerp(CFrame.new(-1.54167461, 0.0454807281, 0, 0.99619472, 0.0871554986, 0, -0.0871554837, 0.996194661, -4.4408921e-16, 0, 0, 1),i)
				leftleg.C0 = leftleg.C0:lerp(CFrame.new(-0.589057922, -2.03977203, 1.90734863e-06, 0.99619472, 0.0871554986, 0, -0.0871554837, 0.996194661, -4.4408921e-16, 0, 0, 1),i)
				rightleg.C0 = rightleg.C0:lerp(CFrame.new(0.589058876, -2.03977203, 0, 0.99619472, -0.0871554986, 0, 0.0871554837, 0.996194661, -4.4408921e-16, 0, 0, 1),i)
				humanoidrootpart.C0 = humanoidrootpart.C0:lerp(CFrame.new(0, 0, 0, 0.98480773, 0, -0.173648283, 0, 1, 0, 0.173648283, 0, 0.98480773),i)
				head.C0 = head.C0:lerp(CFrame.new(0, 1.5, 0, 0.98480773, 0, 0.173648283, 0, 1, 0, -0.173648283, 0, 0.98480773),i)
				game:GetService("RunService").Heartbeat:wait()
			end
		end
	end
end
