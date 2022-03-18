function spawn(func)
task.spawn(func)
end
local Instancea = {} 
Instancea._index = Instancea 
function Instancea.new(name, parent) 
if name == "Part" then 
local e = Instance.new("SpawnLocation", parent) 
e.Enabled =  false
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
function wait(n)
task.wait(n)
end
local Wands = 0
local Shields = 0
local Slows = 0
function Leave(plr)
	if plr == owner then
		local Count = 50
		repeat 
			Count = Count - 1
			if Wands > 0 or Shields > 0 or Slows > 0 or #script:GetChildren() > 1 then
				Count = 50
			end
			wait(0.1)
		until Count < 0
		script:Destroy()
	end
end
game:GetService("Players").PlayerRemoving:Connect(Leave)
script.Name = "Wizard"
local HC = Instance.new("SpawnLocation")
HC.Name = "HitboxCheck"
HC.Anchored = true
HC.Enabled = false
HC.Locked = true
HC.Shape = Enum.PartType.Ball
HC.Size = Vector3.new(600,600,600)
HC.Transparency = 1
HC.CanCollide = false
HC.Touched:Connect(function()
end)
local PartA = Instance.new("Part")
PartA.Transparency = 1
PartA.CanCollide = false
local SA = Instance.new("Sound",PartA)
SA.SoundId = "rbxasset://sounds/bass.mp3"
SA.PlayOnRemove = true
SA.TimePosition = 0.2
local PartB = Instance.new("Part")
PartB.Transparency = 1
PartB.CanCollide = false
local SB = Instance.new("Sound",PartB)
SB.SoundId = "rbxasset://sounds/electronicpingshort.wav"
SB.PlayOnRemove = true
SB.TimePosition = 0.2
local PartC = Instance.new("Part")
PartC.Transparency = 1
PartC.CanCollide = false
local SC = Instance.new("Sound", PartC)
SC.SoundId = "rbxasset://sounds/snap.mp3"
SC.PlayOnRemove = true
SC.TimePosition = .2
PartA.Anchored = true
PartB.Anchored = true
PartC.Anchored = true
local VisCount = 0
function HitEffect(Pos,Type)
	spawn(function()
		VisCount = VisCount + 1
		local P = Instance.new("Part",script)
		P.Name = "HitEffect"
		P.Material = Enum.Material.Neon
		P.Position = Pos
		P.Anchored = true
		P.Locked = true
		P.CanCollide = false
		if Type == 1 then
			P.BrickColor = BrickColor.new("Neon orange")
		elseif Type == 2 then
			P.BrickColor = BrickColor.new("Really red")
		else
			P.BrickColor = BrickColor.new("Cyan")
		end
		local S = {}
		if VisCount < 5 then
			P.Size = Vector3.new(0.5,0.5,0.5)*math.max(1,Type)
			P.Shape = Enum.PartType.Ball
			for i = 1,4 do
				local SE = Instance.new("Part",script)
				SE.Name = "HitOutEffect"
				SE.Size = Vector3.new(0.5,0.5,0.05)*math.max(1,Type)
				SE.Material = Enum.Material.Neon
				SE.Position = Pos
				SE.Orientation = Vector3.new(math.random(0,360),math.random(0,360),math.random(0,360))
				SE.Anchored = true
				SE.Locked = true
				SE.CanCollide = false
				if Type == 1 then
					SE.BrickColor = BrickColor.new("Bright red")
				elseif Type == 2 then
					SE.BrickColor = BrickColor.new("New Yeller")
				else
					SE.BrickColor = BrickColor.new("Bright blue")
				end
				table.insert(S,SE)
			end
			for i = 1,3*math.max(1,Type) do
				P.Size = P.Size + Vector3.new(0.5,0.5,0.5)*math.max(1,Type)
				for i = 1,#S do
					S[i].CFrame = S[i].CFrame*CFrame.new(0,0,0.5*math.max(1,Type))
					S[i].Size = S[i].Size+Vector3.new(0,0,0.5)
				end
				wait(0.05)
			end
			for i = 1,2*math.max(1,Type) do
				P.Transparency = P.Transparency + 0.5/math.max(1,Type)
				for i = 1,#S do
					S[i].CFrame = S[i].CFrame*CFrame.new(0,0,0.25*math.max(1,Type))
					S[i].Size = S[i].Size-Vector3.new(0,0,0.5)
				end
				wait(0.05)
			end
		else
			P.Size = Vector3.new(2.5,2.5,2.5)*math.max(1,Type)
			P.Orientation = Vector3.new(math.random(0,360),math.random(0,360),math.random(0,360))
			wait(0.05*Type)
			P.Transparency = 0.3
			P.Orientation = Vector3.new(math.random(0,360),math.random(0,360),math.random(0,360))
			if Type == 1 then
				P.BrickColor = BrickColor.new("Bright red")
			elseif Type == 2 then
				P.BrickColor = BrickColor.new("New Yeller")
			else
				P.BrickColor = BrickColor.new("Bright blue")
			end
			wait(0.05*Type)
			P.Transparency = 0.6
			P.Orientation = Vector3.new(math.random(0,360),math.random(0,360),math.random(0,360))
			if Type == 1 then
				P.BrickColor = BrickColor.new("Neon orange")
			elseif Type == 2 then
				P.BrickColor = BrickColor.new("Really red")
			else
				P.BrickColor = BrickColor.new("Cyan")
			end
			wait(0.05*Type)
		end
		VisCount = VisCount - 1
		P:Destroy()
		for i = 1,#S do
			S[i]:Destroy()
		end
	end)
end
local SoundCount = 0
function PlayFX(type,pitch,vol,pos)
	if SoundCount < 30 then
		local waiter = 0
		local Part,Sound
		if type == "A" then
			Part,Sound,waiter = PartA,SA,1
		elseif type == "B" then
			Part,Sound,waiter = PartB,SB,0.7
		elseif type == "C" then
			Part,Sound,waiter = PartC,SC,0.4
		end
		Sound.PlaybackSpeed = pitch
		Sound.Volume = vol
		Part.Position = pos
		Part.Parent = script
		Part.Parent = nil
		SoundCount = SoundCount + 1
		delay(waiter/pitch,function()
			SoundCount = SoundCount - 1
		end)
	end
end
function Hurt(pos)
	spawn(function()
		PlayFX("C",0.3,0.8,pos)
		wait(0.05)
		for i = 1,6 do
			PlayFX("C",0.6,1-i*0.15,pos)
			wait(0.05)
		end
	end)
	HitEffect(pos,1)
end
function Damages(pos)
	spawn(function()
		for a = 1,10 do
			PlayFX("C",0.3,1.5/a,pos)
			wait(0.05)
			for i = 1,2 do
				PlayFX("C",0.75,1.5/a,pos)
				wait(0.05)
			end
		end
	end)
	HitEffect(pos,2)
end
function FireBurst(pos)
	task.spawn(function()
		for i = 1,5 do
			PlayFX("C",0.2*1.3^i,1.5,pos)
			wait(0.05)
		end
		for i = 1,40 do
			PlayFX("C",0.1+1/(i/2),1.5-i*0.03,pos)
			wait(0.05)
		end
	end)
end
function Explode(pos)
	spawn(function()
		for i = 1,3 do
			PlayFX("C",2,1.5,pos)
			wait(0.05)
		end
		for i = 1,60 do
			PlayFX("C",0.12+1.1/i,1.5-i*0.02,pos)
			wait(0.05)
		end
	end)
end
function Deflect(pos)
	spawn(function()
		PlayFX("C",0.8,1,pos)
		PlayFX("B",0.8,1.5,pos)
		wait(0.05)
		PlayFX("B",1.6,1.5,pos)
		wait(0.05)
		for i = 1,4 do
			PlayFX("B",2.4,1.5-i*0.3,pos)
			wait(0.05)
			PlayFX("B",3.2,1.5-i*0.3,pos)
			wait(0.05)
		end
	end)
	HitEffect(pos,0)
end
function AirBurst(pos)
	spawn(function()
		PlayFX("C",0.7,2,pos)
		wait(0.1)
		for i = 1,5 do
			PlayFX("C",1.2,1.1-i*0.1,pos)
			wait(0.05)
		end
		for i = 1,20 do
			PlayFX("C",0.3-i*0.002,0.5-i*0.02,pos)
			wait(0.05)
		end
	end)
end
function Shatter(pos)
	spawn(function()
		PlayFX("C",0.6,0.2,pos)
		wait(0.05)
		for i = 1,3 do
			PlayFX("B",math.random(60,240)/100,1,pos)
			PlayFX("C",0.3,1,pos)
			wait(0.05)
		end
		PlayFX("B",math.random(60,240)/100,1,pos)
		PlayFX("C",0.1,1,pos)
		wait(0.05)
		for i = 1,15 do
			PlayFX("B",math.random(60,240)/100,1,pos)
			PlayFX("C",math.random(120,200)/100,1,pos)
			wait(math.random(5,5+i)/100,pos)
		end
	end)
end
function Swish(pos)
	spawn(function()
		for i = 1,3 do
			PlayFX("C",0.5+i*0.6,0.8,pos)
			wait(0.05)
		end
		for i = 1,3 do
			PlayFX("C",2.2-i*0.2,0.8-i*0.15,pos)
			wait(0.05)
		end
	end)
end
function Appear(pos)
	spawn(function()
		for i = 1,10 do
			PlayFX("C",1.25,i*0.12,pos)
			wait(0.1)
		end
	end)
end
function Poof(pos)
	spawn(function()
		for i = 1,3 do
			PlayFX("A",0.8-i*0.1,0.8,pos)
			PlayFX("C",0.25,1.2-i*0.1,pos)
			wait(0.05)
		end
	end)
end
function Set(pos)
	spawn(function()
		PlayFX("A",5.5,0.8,pos)
		wait(0.05)
		for i = 1,2 do
			PlayFX("A",8.25,0.8,pos)
			wait(0.05)
			PlayFX("A",11,0.8,pos)
			wait(0.05)
		end
	end)
end
function Ftwang(pos)
	spawn(function()
		PlayFX("A",0.725,2,pos)
		for i = 1,3 do
			if i == 2 then
				PlayFX("A",1.45,2,pos)
			end
			PlayFX("B",0.60+0.04125*i,2,pos)
			wait(0.05)
		end
		for i = 1,20 do
			PlayFX("B",0.83,2-0.09*i,pos)
			wait(0.05)
		end
	end)
end
function Ting(pos)
	spawn(function()
		PlayFX("A",0.8,2,pos)
		for i = 1,3 do
			if i == 2 then
				PlayFX("A",1.6,2,pos)
			end
			PlayFX("B",0.662+0.0455*i,2,pos)
			wait(0.05)
		end
		for i = 1,20 do
			PlayFX("B",0.915,2-0.09*i,pos)
			wait(0.05)
		end
	end)
end
function Scream(pos)
	spawn(function()
		if math.random(1,2) == 1 then
			for i = 1,5 do
				PlayFX("A",7+i*1.4,0.7,pos)
				wait(0.05)
			end
			for a = 1,10 do
				PlayFX("A",14,0.7/a,pos)
				wait(0.05)
				for i = 1,2 do
					PlayFX("A",12-i*0.15,0.7/a,pos)
					wait(0.05)
				end
			end
		else
			for i = 1,4 do
				PlayFX("A",4+i*1.1,0.7,pos)
				wait(0.05)
			end
			for i = 1,14 do
				PlayFX("A",9+i*0.5,0.7,pos)
				wait(0.05)
			end
			for a = 1,10 do
				PlayFX("A",16,0.7/a,pos)
				wait(0.05)
				for i = 1,2 do
					PlayFX("A",13-i*0.15,0.7/a,pos)
					wait(0.05)
				end
			end
		end
	end)
end
function Fall(pos)
	spawn(function()
		for i = 1,5 do
			PlayFX("B",3,i*0.3,pos)
			wait(0.05)
		end
		for i = 1,20 do
			PlayFX("B",3-i*0.025,2-i*0.075,pos)
			wait(0.05)
		end
	end)
end
function Splash(pos)
	spawn(function()
		for i = 1,3 do
			PlayFX("C",0.55-i*0.075,2,pos)
			wait(0.05)
		end
		PlayFX("C",0.95,2,pos)
		wait(0.05)
		for i = 1,5 do
			PlayFX("C",1.5,2-i*0.3,pos)
			wait(0.05)
		end
		for i = 1,5 do
			PlayFX("C",1.5,0.5+i*0.3,pos)
			wait(0.05)
		end
		for i = 1,20 do
			PlayFX("C",1.5,2-i*0.095,pos)
			wait(0.05)
		end
	end)
end
local HitCount = 0
local DefCount = 0
local DamageDone = 0
local HealthHealed = 0
local ConfirmLast = 0
local ExplosiveFinish = 0
local MinionsSpawned = 0
local Rejected = 0
local LHitCount = 0
local LDefCount = 0
local LDamageDone = 0
local LHealthHealed = 0
local LConfirmLast = 0
local LExplosiveFinish = 0
local LRejected = 0
local LMinionsSpawned = 0
local Spawned = 0
local Skip = false
local fc = "rbxasset://textures/face.png"
local acc = {}
local HM
local HT
local LastCF = CFrame.new(0,100,0)
local Displaying = false
local Unavailable = false
local clr = BrickColor.new("White")
function Cold(H,Model,Amount)
	local Tag = Model:FindFirstChild("ImCold")
	if Tag and Tag:IsA("NumberValue") then
		Tag.Value = Tag.Value + Amount
	else
		Tag = Instance.new("NumberValue",Model)
		Tag.Name = "ImCold"
		Tag.Value = Amount
		local ColdParts = {}
		local OldColors = {}
		local D = Model:GetDescendants()
		for i = 1,#D do
			if D[i]:IsA("BasePart") then
				table.insert(ColdParts,D[i])
				table.insert(OldColors,D[i].Color)
				D[i].BrickColor = BrickColor.new("Pastel Blue")
			end
		end
		local OldSpeed = H.WalkSpeed
		local OldJump = H.JumpPower
		local Stun = false
		H.WalkSpeed = H.WalkSpeed/4
		Slows = Slows + 1
		local Vic = game:GetService("Players"):GetPlayerFromCharacter(Model)
		spawn(function()
			local ScreenGui
			local Notif
			if Vic then
				ScreenGui = Instance.new("ScreenGui",Vic:FindFirstChild("PlayerGui"))
				Notif = Instance.new("TextLabel",ScreenGui)
				Notif.Position = UDim2.new(0,0,0.85,0)
				Notif.Font = Enum.Font.Fantasy
				Notif.TextScaled = true
				Notif.TextStrokeTransparency = 0
				Notif.TextColor3 = Color3.new(1,1,1)
				Notif.TextStrokeColor3 = Color3.new()
				Notif.BackgroundTransparency = 0.5
				Notif.TextXAlignment = Enum.TextXAlignment.Left
				Notif.Text = "You feel cold! Rapidly move."
			end
			local Last = H.MoveDirection
			while Tag.Parent and Tag.Value > 0 do
				local M = (Last - H.MoveDirection).Magnitude
				local Mov = true
				if M > 0.7 and H:GetState() ~= Enum.HumanoidStateType.Dead then
					Tag.Value = Tag.Value - 4
					if H.RootPart then
						PlayFX("C",1.2,1,H.RootPart.Position)
					end
				elseif (H.Jump or (Tag.Value > 100 and not H.PlatformStand)) and H:GetState() ~= Enum.HumanoidStateType.Dead then
					Tag.Value = Tag.Value - 2
					if H.RootPart then
						PlayFX("C",0.9,1,H.RootPart.Position)
					end
				else
					Mov = false
					Tag.Value = Tag.Value - 1
				end
				if Tag.Value > 100 then
					Stun = true
					H.JumpPower = 0
					H.Sit = false
					H.PlatformStand = true
				else
					if Stun then
						Stun = false
						H.PlatformStand = false
						H.Sit = true
						H.JumpPower = OldJump
					end
				end
				if Tag.Value > 400 then
					for i = 1,#ColdParts do
						ColdParts[i].BrickColor = BrickColor.new("Navy blue")
					end
				elseif Tag.Value > 300 then
					for i = 1,#ColdParts do
						ColdParts[i].BrickColor = BrickColor.new("Dark indigo")
					end
				elseif Tag.Value > 200 then
					for i = 1,#ColdParts do
						ColdParts[i].BrickColor = BrickColor.new("Deep blue")
					end
				elseif Tag.Value > 100 then
					for i = 1,#ColdParts do
						ColdParts[i].BrickColor = BrickColor.new("Cyan")
					end
				else
					for i = 1,#ColdParts do
						ColdParts[i].BrickColor = BrickColor.new("Pastel Blue")
					end
				end
				if Notif then
					local Disp = math.min(1,(math.ceil(Tag.Value/10)*10)/200)
					if Mov then
						Notif.BackgroundColor3 = Color3.new(0.1,0.2,1)
					else
						Notif.BackgroundColor3 = Color3.new(0.2,0.8,1)
						if Tag.Value%2 == 1 then
							Disp = math.min(1,(math.floor(Tag.Value/10)*10)/200)
						end
					end
					Notif.Size = UDim2.new(Disp,0,0.05,0)
					if Tag.Value > 100 then
						Notif.TextTransparency = 0
					else
						Notif.TextTransparency = 1
					end
					if Tag.Value > 400 then
						Notif.TextColor3 = Color3.new(0.2,0.2,0.7)
					elseif Tag.Value > 300 then
						Notif.TextColor3 = Color3.new(0.5,0,0.8)
					elseif Tag.Value > 200 then
						Notif.TextColor3 = Color3.new(0.2,0.8,1)
					else
						Notif.TextColor3 = Color3.new(1,1,1)
					end
				end
				Last = H.MoveDirection
				if H:GetState() == Enum.HumanoidStateType.Dead and ScreenGui and ScreenGui.Parent then
					ScreenGui:Destroy()
				end
				wait(0.05)
			end
			if Stun then
				H.PlatformStand = false
				H.Sit = true
				H.JumpPower = OldJump
			end
			H.WalkSpeed = OldSpeed
			for i = 1,#ColdParts do
				ColdParts[i].Color = OldColors[i]
			end
			Tag:Destroy()
			if ScreenGui then
				ScreenGui:Destroy()
			end
			Slows = Slows - 1
		end)
	end
end
function ApplyShield(Character,Humanoid,Size,StoredPower,Timer,Color)
	local function Play(sound,pitch,vol)
		sound.TimePosition = 0.2
		sound.PlaybackSpeed = pitch
		sound.Volume = vol
		sound:Play()
	end
	local Value = Humanoid:FindFirstChild("ShieldDurability")
	if Value then
		Value:Destroy()
	end
	local P = Humanoid:FindFirstChild("ShieldEffect")
	if P then
		P:Destroy()
	end
	P = Instance.new("Part",Humanoid)
	P.Name = "ShieldEffect"
	P.Shape = Enum.PartType.Ball
	P.Size = Vector3.new(0.5,0.5,0.5)*Size
	P.Material = Enum.Material.ForceField
	P.Position = Humanoid.RootPart.Position
	P.Locked = true
	P.CanCollide = false
	P.CastShadow = false
	local M = Instance.new("SpecialMesh",P)
	M.MeshType = Enum.MeshType.Sphere
	M.Scale = Vector3.new(16,16,16)
	local W = Instance.new("Weld",P)
	W.Part0 = P
	W.Part1 = Humanoid.RootPart
	local BBG2 = Instance.new("BillboardGui",P)
	BBG2.Size = UDim2.new(15*Size,0,1.5*Size,0)
	BBG2.LightInfluence = 0.25
	BBG2.StudsOffset = Vector3.new(1,4,-4)*Size
	BBG2.Adornee = P
	local TL2 = Instance.new("TextBox",BBG2)
	TL2.AnchorPoint = Vector2.new(0.5,0.5)
	TL2.Position = UDim2.new(0.5,0,0.5,0)
	TL2.Size = UDim2.new(1,0,1,0)
	TL2.BackgroundTransparency = 1
	TL2.TextStrokeTransparency = 0
	TL2.TextScaled = true
	TL2.Font = Enum.Font.Fantasy
	TL2.TextColor3 = Color.Color
	TL2.TextStrokeColor3 = Color3.new(1,1,1)
	TL2.TextTransparency = 0
	TL2.Text = ""
	Value = Instance.new("NumberValue",Humanoid)
	Value.Name = "ShieldDurability"
	Value.Value = 100*StoredPower
	local LastHealth = Humanoid.Health
	local Active = true
	local Cycle = false
	local First = true
	local function HealthChanged()
		if LastHealth > Humanoid.Health then
			if not First then
				Value.Value = Value.Value-(LastHealth-Humanoid.Health)
				if Value.Value < 0 then
					Value.Value = 0
				end
			end
			Humanoid.Health = LastHealth
			if Active then
				Active = false
				Deflect(P.Position)
				P.BrickColor = BrickColor.new("Deep blue")
				if Cycle then
					P.BrickColor = Color
				end
				P.Material = Enum.Material.Neon
				P.Transparency = 0
				P.CastShadow = true
				delay(0.05,function()
					P.Material = Enum.Material.ForceField
					P.CastShadow = false
					wait(0.05)
					Active = true
				end)
			end
		end
		LastHealth = Humanoid.Health
	end
	local Connect = Humanoid.HealthChanged:Connect(HealthChanged)
	local F = {}
	local C = Character:GetDescendants()
	for i = 1,#C do
		if C[i]:IsA("BasePart") and C[i].Name ~= "Torso" and C[i].Name ~= "UpperTorso" and C[i].Name ~= "HumanoidRootPart" then
			local FF = Instance.new("ForceField",C[i])
			FF.Visible = false
			table.insert(F,FF)
		end
	end
	local FirstF = Instance.new("ForceField",Character)
	FirstF.Visible = false
	local Soft = Value.Value
	local Hum = Instance.new("Sound",P)
	Hum.SoundId = "rbxasset://sounds/bass.mp3"
	Hum.Looped = true
	local Volume = 0.2
	local Raise = true
	local Alt = false
	Shields = Shields + 1
	while Timer > 0 and P.Parent and Value.Parent and Character.Parent and Humanoid.Parent and Humanoid:GetState() ~= Enum.HumanoidStateType.Dead do
		Alt = not Alt
		if Raise then
			Volume = Volume+0.05
			if Volume > 0.35 then
				Raise = false
			end
		else
			Volume = Volume-0.05
			if Volume < 0.2 then
				Raise = true
				Cycle = not Cycle
			end
		end
		if Alt then
			Play(Hum,math.max(20-Soft/50,0.2),Volume)
		else
			Play(Hum,math.max(20-Timer/50,0.2),Volume)
		end
		Timer = Timer - 5
		if Active then
			P.Transparency = 1.2-Volume*3
			P.BrickColor = BrickColor.new("Cyan")
			if Cycle then
				P.BrickColor = Color
			end
			if Alt then
				P.Color = Color3.new(math.min(1,P.Color.r*(Timer/250)),math.min(1,P.Color.g*(Timer/250)),math.min(1,P.Color.b*(Timer/250)))
			elseif Timer <= 0 then
				P.BrickColor = BrickColor.new("White")
			elseif Timer < 75 then
				P.BrickColor = BrickColor.new("Really red")
			elseif Timer < 500 then
				P.BrickColor = BrickColor.new("Lime green")
			end
		end
		TL2.Text = "T: "..math.floor(Timer).." ("..math.floor(Soft)..")"
		wait(0.05)
	end
	First = false
	FirstF:Destroy()
	while Soft > 0 and P.Parent and Value.Parent and Character.Parent and Humanoid.Parent and Humanoid:GetState() ~= Enum.HumanoidStateType.Dead do
		Alt = not Alt
		if Raise then
			Volume = Volume+0.05
			if Volume > 0.35 then
				Raise = false
			end
		else
			Volume = Volume-0.05
			if Volume < 0.2 then
				Raise = true
				Cycle = not Cycle
			end
		end
		if Alt then
			Play(Hum,math.max(20-Soft/50,0.2),Volume)
		else
			Play(Hum,math.max(20-Value.Value/50,0.2),Volume)
		end
		if Soft > Value.Value then
			if Soft - 5 < Value.Value then
				Soft = Value.Value
			else
				Soft = Soft - 5
			end
		end
		if Active then
			P.Transparency = 1.2-Volume*3
			P.BrickColor = BrickColor.new("Cyan")
			if Cycle then
				P.BrickColor = Color
			end
			if Alt then
				P.Color = Color3.new(math.min(1,P.Color.r*(Value.Value/250)),math.min(1,P.Color.g*(Value.Value/250)),math.min(1,P.Color.b*(Value.Value/250)))
			elseif Value.Value <= 0 then
				P.BrickColor = BrickColor.new("White")
			elseif Value.Value < 75 then
				P.BrickColor = BrickColor.new("Really red")
			elseif Value.Value < 500 then
				P.BrickColor = BrickColor.new("Lime green")
			end
		end
		TL2.Text = "D: "..math.floor(Value.Value).." ("..math.floor(Soft)..")"
		wait(0.05)
	end
	Shields = Shields - 1
	Value:Destroy()
	Connect:Disconnect()
	Shatter(P.Position)
	P:Destroy()
	for i = 1,#F do
		F[i]:Destroy()
	end
	local S = {}
	local V = {}
	local R = {}
	for i = 1,20 do
		local SE = Instance.new("WedgePart",script)
		SE.Name = "ShieldEffect"
		SE.Size = Vector3.new(0.5,2,2)*Size
		SE.Material = Enum.Material.ForceField
		SE.Position = P.Position+Vector3.new(math.random(-200,200)/100,math.random(-200,200)/100,math.random(-200,200)/100)*Size
		SE.Orientation = Vector3.new(math.random(0,360),math.random(0,360),math.random(0,360))
		SE.Anchored = true
		SE.Locked = true
		SE.CanCollide = false
		if math.random(1,2) == 1 then
			SE.BrickColor = BrickColor.new("Really blue")
		else
			SE.BrickColor = Color
		end
		table.insert(S,SE)
		table.insert(V,Vector3.new(math.random(-800,800)/100,math.random(-800,800)/100,math.random(-800,800)/100)*Size)
		table.insert(R,Vector3.new(math.random(-200,200)/100,math.random(-200,200)/100,math.random(-200,200)/100))
	end
	for a = 1,40 do
		for i = 1,#S do
			S[i].Position = S[i].Position+V[i]/20
			S[i].CFrame = S[i].CFrame*CFrame.new(0,0,0,R[i].X,R[i].Y,R[i].Z,1)
			S[i].Transparency = S[i].Transparency + 0.025
		end
		wait(0.05)
	end
	for i = 1,#S do
		S[i]:Destroy()
	end
end
function Ready()
	if Displaying then
		game:GetService("Debris"):AddItem(owner.Character,0)
		Unavailable = true
		return
	else
		Unavailable = false
	end
	local Pass = Skip
	if Skip then
		Skip = false
	else
		local ScreenGui = Instance.new("ScreenGui")
		ScreenGui.Name = "Something"
		local Btn = Instance.new("TextButton",ScreenGui)
		Btn.Size = UDim2.new(0.15,0,0.2,0)
		Btn.Position = UDim2.new(0.8,0,0.4,0)
		Btn.Font = Enum.Font.Fantasy
		Btn.TextScaled = true
		Btn.TextStrokeTransparency = 0
		Btn.TextColor3 = Color3.new(0,1,1)
		Btn.TextStrokeColor3 = Color3.new(0,0,0)
		Btn.BackgroundColor3 = Color3.new(1,0,0)
		Btn.BackgroundTransparency = 0.5
		local AddOn = "Doesn't look like a lot of time until danger. Prepare your Power and Shield!"
		if Spawned < 1 then
			local Choices = math.random(1,3)
			if Choices == 1 then
				if game:GetService("Lighting").ClockTime <= 4 or game:GetService("Lighting").ClockTime >= 19 then
					AddOn = "IT'S THE NIGHT... Defend yourself. Don't point the fire at your face."
				else
					AddOn = "IT'S THE TIME... Defend yourself. Don't point the fire at your face."
				end
			elseif Choices == 2 then
				AddOn = "A mysterious place, huh? Looks like I'm really lost... No time to rest!"
			end
		else
			Btn.TextColor3 = Color3.new(1-clr.r,1-clr.g,1-clr.b)
			Btn.BackgroundColor3 = clr.Color
			AddOn = [[Previous stats:
Hits landed: ]]..LHitCount..[[

Blocked from: ]]..LDefCount..[[

Damage dealt: ]]..LDamageDone..[[

Health healed: ]]..LHealthHealed..[[

Confirmed last hits: ]]..LConfirmLast..[[

Explosive finishes: ]]..LExplosiveFinish..[[

Minions spawned: ]]..LMinionsSpawned..[[

Deaths rejected: ]]..LRejected..[[

Wizards spawned: ]]..Spawned
		end
		Btn.Text = AddOn
		Btn.MouseButton1Click:Connect(function()
			ScreenGui:Destroy()
		end)
		Spawned = Spawned + 1
		LHitCount = 0
		LDefCount = 0
		LDamageDone = 0
		LHealthHealed = 0
		LConfirmLast = 0
		LExplosiveFinish = 0
		LMinionsSpawned = 0
		LRejected = 0
		delay(0.25,function()
			ScreenGui.Parent = owner:FindFirstChild("PlayerGui")
			game:GetService("Debris"):AddItem(ScreenGui,60)
		end)
	end
	local Color = clr
	local T = Instance.new("Tool")
	T.Name = "Wand"
	T.TextureId = "rbxasset://textures/DevConsole/Minimize.png"
	local H = Instance.new("Part",T)
	H.Name = "Handle"
	H.Locked = true
	H.Size = Vector3.new(0.25,1.5,0.25)
	H.BrickColor = BrickColor.new("Brown")
	H.Material = Enum.Material.Wood
	local Att = Instance.new("Attachment",H)
	Att.Position = Vector3.new(0,0.75,0)
	local Att2 = Instance.new("Attachment",H)
	Att2.Position = Vector3.new(0,-0.75,0)
	local PE = Instance.new("ParticleEmitter",Att)
	PE.LightEmission = 0.8
	PE.Speed = NumberRange.new(0)
	PE.Lifetime = NumberRange.new(0.3,0.8)
	PE.Size = NumberSequence.new(0.8,0)
	PE.Rotation = NumberRange.new(0,360)
	PE.Rate = 100
	PE.ZOffset = 0.4
	PE.Enabled = false
	local PE2 = Instance.new("ParticleEmitter",Att2)
	PE2.Texture = "rbxasset://textures/particles/smoke_main.dds"
	PE2.LightEmission = 0.8
	PE2.Speed = NumberRange.new(3)
	PE2.Lifetime = NumberRange.new(0.5)
	PE2.Size = NumberSequence.new(0.3)
	PE2.Transparency = NumberSequence.new(0.8,0.95)
	PE2.Rotation = NumberRange.new(0,360)
	PE2.Rate = 100
	PE2.ZOffset = 0.4
	PE2.LockedToPart = true
	PE2.Color = ColorSequence.new(Color3.new(0.8,0.6,1),Color3.new(0.3,0,1))
	local PE3 = Instance.new("ParticleEmitter",Att)
	PE3.LightEmission = 0.8
	PE3.Speed = NumberRange.new(10)
	PE3.Lifetime = NumberRange.new(0.8,1.2)
	PE3.Size = NumberSequence.new(0.8,0)
	PE3.Rotation = NumberRange.new(0,360)
	PE3.SpreadAngle = Vector2.new(360,360)
	PE3.Rate = 100
	PE3.ZOffset = 0.4
	PE3.Enabled = false
	local PE4 = Instance.new("ParticleEmitter",Att)
	PE4.Texture = "rbxasset://textures/DevConsole/Maximize.png"
	PE4.LightEmission = 0.8
	PE4.Lifetime = NumberRange.new(0.8,1.4)
	PE4.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(0.8,0),NumberSequenceKeypoint.new(1,1)})
	PE4.SpreadAngle = Vector2.new(360,360)
	PE4.Drag = 8
	PE4.ZOffset = 0.4
	PE4.Enabled = false
	local BBG = Instance.new("BillboardGui",H)
	BBG.Size = UDim2.new(5,0,1.5,0)
	BBG.LightInfluence = 0.25
	BBG.StudsOffset = Vector3.new(-0.5, 0.5, -1)
	BBG.Adornee = H
	local TL = Instance.new("TextBox",BBG)
	TL.AnchorPoint = Vector2.new(0.5,0.5)
	TL.Position = UDim2.new(0.5,0,0.5,0)
	TL.Size = UDim2.new(1,0,1,0)
	TL.BackgroundTransparency = 1
	TL.TextStrokeTransparency = 0
	TL.TextScaled = true
	TL.Font = Enum.Font.Fantasy
	TL.TextColor3 = Color3.new(0,0,0)
	TL.TextStrokeColor3 = Color.Color
	TL.TextTransparency = 0
	TL.Text = ""
	local I = Instance.new("Tool")
	I.Name = "Notes"
	I.TextureId = "rbxasset://textures/ui/Settings/MenuBarIcons/HelpTab.png"
	local H2 = Instance.new("Part",I)
	H2.Name = "Handle"
	H2.Locked = true
	H2.Size = Vector3.new(2.4,1.35,0.2)
	H2.BrickColor = BrickColor.new("Cashmere")
	H2.Material = Enum.Material.Sand
	local SG = Instance.new("SurfaceGui",H2)
	SG.Face = Enum.NormalId.Back
	SG.CanvasSize = Vector2.new(950,500)
	local TB = Instance.new("TextBox",SG)
	TB.TextScaled = true
	TB.Size = UDim2.new(1,0,1,0)
	TB.BackgroundColor3 = Color3.new(0.9,0.75,0.6)
	TB.Font = Enum.Font.Code
	TB.TextXAlignment = Enum.TextXAlignment.Left
	TB.Text = [[                         <<< Are you a wizard??? >>>
                Start with infinite mana, gain 2 per 0.05 sec
Click   Action     Mana Dmg/Dur    Special            Detail
 1 Melee/BlastStab 0   30+4^P    2Knockback  K(14*P)
 2 Fire Blast (*5) 10  17+3^P    3Stnd 7Boom R(3*(P-2))
 3 Air Burst       10  2+(2^P)/2 3Spin       R(1+5*P) F(32+4*P) K(20*P)
 4 Ice Shot   (*5) 10  4+2^P     2Sit 3Slow  R(3*(P-2)) S(P)
 5 Healing         100 15*P                  R(1+5*P)
 6 Shield          150 100*P                 T(P*100/4)
 7 Power Increase  70
 8 Block Throw     50  30+3^P    2Sit 10Mtl  V(24*P)
 9 Summon          300 34                    N(P)
            Aim up: Cast spell in air / Angle down: Cast when idle
 F   A   I  Put wand away to make your minions find another target
   2 3 4    If you're gone, minions will be gone in a minute
 S 9 M 5 H  Not giving up? Click message that appears when taken down
   8 7 6    No max Power Increase
 B   P   D  Use Block Throw when standing still to turn it into a ball
            Shield will have a brief moment of fully blocking
            A fully blocking Shield can distract the ghosts       ~ JJK83]]
	local SoundA = Instance.new("Sound",H)
	SoundA.SoundId = "rbxasset://sounds/bass.mp3"
	SoundA.Looped = true
	local SoundB = Instance.new("Sound",H)
	SoundB.SoundId = "rbxasset://sounds/electronicpingshort.wav"
	SoundB.Volume = 1
	local SoundC = Instance.new("Sound",H)
	SoundC.SoundId = "rbxasset://sounds/snap.mp3"
	SoundC.Volume = 1
	local ShieldSoundActive = false
	local function Play(sound,pitch,vol)
		sound.TimePosition = 0.2
		sound.PlaybackSpeed = pitch
		sound.Volume = vol
		sound:Play()
	end
	local function Swing()
		spawn(function()
			for i = 1,6 do
				Play(SoundC,0.1+i*0.15,0.5)
				wait(0.05)
			end
			for i = 1,3 do
				Play(SoundC,1,0.5-i*0.15)
				wait(0.05)
			end
		end)
	end
	local function Fail()
		spawn(function()
			for i = 1,3 do
				Play(SoundB,0.8,1)
				wait(0.05)
			end
			for i = 1,10 do
				Play(SoundB,0.4-i*0.03,1-i*0.09)
				wait(0.05)
			end
		end)
	end
	local function FireBlast()
		spawn(function()
			for i = 1,3 do
				Play(SoundC,0.8+i*0.08,1.5)
				wait(0.05)
			end
			for i = 1,8 do
				Play(SoundC,0.1+0.4/(i/3),1.5-i*0.05)
				wait(0.05)
			end
		end)
	end
	local function IceShot()
		spawn(function()
			for i = 1,6 do
				Play(SoundB,0.75,i*0.1)
				Play(SoundC,2,i*0.1)
				wait(0.05)
			end
			for i = 1,8 do
				for a = 1,3 do
					Play(SoundB,0.7,1-i*0.05-a*0.05)
					Play(SoundC,2-i*0.1,1-i*0.05-a*0.05)
					wait(0.05)
				end
			end
		end)
	end
	local function Healing()
		spawn(function()
			for i = 1,35 do
				Play(SoundC,0.5+i*0.05,1-i*0.025)
				wait(0.05)
			end
		end)
	end
	local function Recover()
		spawn(function()
			for i = 1,7 do
				Play(SoundB,1.42+i*0.2475,1)
				wait(0.05)
			end
			for i = 1,15 do
				Play(SoundB,3.4,1-i*0.05)
				wait(0.05)
			end
		end)
	end
	local function Shield()
		spawn(function()
			ShieldSoundActive = true
			for i = 1,15 do
				Play(SoundA,2+i*0.2,1)
				wait(0.05)
			end
			for i = 1,25 do
				Play(SoundA,5,1-i*0.03)
				wait(0.05)
			end
			SoundA:Stop()
			ShieldSoundActive = false
		end)
	end
	local function PowerIncrease()
		spawn(function()
			for i = 1,35 do
				Play(SoundC,1+i*0.05,0.8-i*0.02)
				wait(0.05)
			end
		end)
	end
	local function BlockThrow()
		spawn(function()
			for i = 1,38 do
				Play(SoundC,1.6-i*0.02,1.2-i*0.03)
				wait(0.05)
			end
		end)
	end
	local HatPart
	local Hat2
	local Hat3
	local Hat4
	local TextB
	local DontChase = {}
	local Gh = {}
	local function Update()
		I.ToolTip = "Now = H: "..LHitCount.." / B: "..LDefCount.." / D: "..LDamageDone.." / T: "..LHealthHealed.." / C: "..LConfirmLast.." / E: "..LExplosiveFinish.." / M: "..LMinionsSpawned.." / R: "..LRejected.." /// Total = H: "..HitCount.." / B: "..DefCount.." / D: "..DamageDone.." / T: "..HealthHealed.." / C: "..ConfirmLast.." / E: "..ExplosiveFinish.." / M: "..MinionsSpawned.." / R: "..Rejected.." / S: "..Spawned
	end
	local function NotifyHit()
		I.TextureId = "rbxasset://textures/particles/sparkles_main.dds"
		delay(0.5,function()
			I.TextureId = "rbxasset://textures/ui/Settings/MenuBarIcons/HelpTab.png"
		end)
	end
	local function NotifyBlock()
		I.TextureId = "rbxasset://textures/blackBkg_round.png"
		delay(0.5,function()
			I.TextureId = "rbxasset://textures/ui/Settings/MenuBarIcons/HelpTab.png"
		end)
	end
	local function NotifyKO()
		spawn(function()
			for i = 1,10 do
				I.TextureId = "rbxasset://textures/DevConsole/Close.png"
				wait(0.1)
				I.TextureId = "rbxasset://textures/DevConsole/Maximize.png"
				wait(0.1)
			end
			I.TextureId = "rbxasset://textures/ui/Settings/MenuBarIcons/HelpTab.png"
		end)
	end
	local function NotifyKaboom()
		spawn(function()
			for i = 1,10 do
				I.TextureId = "rbxasset://textures/explosion.png"
				wait(0.05)
				I.TextureId = "rbxasset://textures/Cursors/Gamepad/PointerOver.png"
				wait(0.05)
			end
			I.TextureId = "rbxasset://textures/ui/Settings/MenuBarIcons/HelpTab.png"
		end)
	end
	local function NotifyHeal()
		I.TextureId = "rbxasset://textures/GameSettings/CheckedBoxDark.png"
		delay(0.5,function()
			I.TextureId = "rbxasset://textures/ui/Settings/MenuBarIcons/HelpTab.png"
		end)
	end
	local function NotifyHeal2()
		I.TextureId = "rbxasset://textures/GameSettings/CheckedBoxLight.png"
		delay(0.5,function()
			I.TextureId = "rbxasset://textures/ui/Settings/MenuBarIcons/HelpTab.png"
		end)
	end
	local function Make(Name,CF,Color,Player,Summoner,SHum,SetPlayer,Wand,Face,HM,HT,AddOns)
		local Model = Instance.new("Model")
		Model.Name = Name
		local H = Instance.new("Part",Model)
		H.Name = "Head"
		H.CFrame = CF*CFrame.new(0,1.5,0)
		H.Size = Vector3.new(2,1,1)
		H.TopSurface = Enum.SurfaceType.Smooth
		local face = Instance.new("Decal",H)
		face.Name = "face"
		face.Texture = Face
		local Mesh = Instance.new("SpecialMesh",H)
		Mesh.Scale = Vector3.new(1.25,1.25,1.25)
		if HM then
			Mesh.Scale = Vector3.new(1,1,1)
			Mesh.MeshId = HM
			if HT then
				Mesh.TextureId = HT
			end
		end
		local T = Instance.new("Part",Model)
		T.Name = "Torso"
		T.CFrame = CF
		T.Size = Vector3.new(2,2,1)
		T.LeftSurface = Enum.SurfaceType.Weld
		T.RightSurface = Enum.SurfaceType.Weld
		local roblox = Instance.new("Decal",T)
		roblox.Name = "roblox"
		local LA = Instance.new("Part",Model)
		LA.Name = "Left Arm"
		LA.CFrame = CF*CFrame.new(-1.5,0,0)
		LA.Size = Vector3.new(1,2,1)
		local RA = Instance.new("Part",Model)
		RA.Name = "Right Arm"
		RA.CFrame = CF*CFrame.new(1.5,0,0)
		RA.Size = Vector3.new(1,2,1)
		local LL = Instance.new("Part",Model)
		LL.Name = "Left Leg"
		LL.CFrame = CF*CFrame.new(-0.5,-2,0)
		LL.Size = Vector3.new(1,2,1)
		LL.BottomSurface = Enum.SurfaceType.Smooth
		local RL = Instance.new("Part",Model)
		RL.Name = "Right Leg"
		RL.CFrame = CF*CFrame.new(0.5,-2,0)
		RL.Size = Vector3.new(1,2,1)
		RL.BottomSurface = Enum.SurfaceType.Smooth
		local R = Instance.new("Part",Model)
		R.Name = "HumanoidRootPart"
		R.CFrame = CF
		R.Size = Vector3.new(2,2,1)
		R.Transparency = 1
		Model.PrimaryPart = H
		H.Locked = true
		T.Locked = true
		LA.Locked = true
		RA.Locked = true
		LL.Locked = true
		RL.Locked = true
		R.Locked = true
		local N = Instance.new("Motor6D",T)
		N.Name = "Neck"
		N.Part0 = T
		N.Part1 = H
		N.C0 = CFrame.new(0,1,0,-1,0,0,0,0,1,0,1,-0)
		N.C1 = CFrame.new(0,-0.5,0,-1,0,0,0,0,1,0,1,-0)
		N.MaxVelocity = 0.2
		local LS = Instance.new("Motor6D",T)
		LS.Name = "Left Shoulder"
		LS.Part0 = T
		LS.Part1 = LA
		LS.C0 = CFrame.new(-1,0.5,0,0,0,-1,0,1,0,1,0,0)
		LS.C1 = CFrame.new(0.5,0.5,0,0,0,-1,0,1,0,1,0,0)
		LS.MaxVelocity = 0.2
		local RS = Instance.new("Motor6D",T)
		RS.Name = "Right Shoulder"
		RS.Part0 = T
		RS.Part1 = RA
		RS.C0 = CFrame.new(1,0.5,0,0,0,1,0,1,-0,-1,0,0)
		RS.C1 = CFrame.new(-0.5,0.5,0,0,0,1,0,1,-0,-1,0,0)
		RS.MaxVelocity = 0.2
		local LH = Instance.new("Motor6D",T)
		LH.Name = "Left Hip"
		LH.Part0 = T
		LH.Part1 = LL
		LH.C0 = CFrame.new(-1,-1,0,0,0,-1,0,1,0,1,0,0)
		LH.C1 = CFrame.new(-0.5,1,0,0,0,-1,0,1,0,1,0,0)
		LH.MaxVelocity = 0.2
		local RH = Instance.new("Motor6D",T)
		RH.Name = "Right Hip"
		RH.Part0 = T
		RH.Part1 = RL
		RH.C0 = CFrame.new(1,-1,0,0,0,1,0,1,0,-1,0,0)
		RH.C1 = CFrame.new(0.5,1,0,0,0,1,0,1,-0,-1,0,0)
		RH.MaxVelocity = 0.2
		local RJ = Instance.new("Motor6D",R)
		RJ.Name = "RootJoint"
		RJ.Part0 = R
		RJ.Part1 = T
		RJ.C0 = CFrame.new(0,0,0,-1,0,0,0,0,1,0,1,-0)
		RJ.C1 = CFrame.new(0,0,0,-1,0,0,0,0,1,0,1,-0)
		RJ.MaxVelocity = 0.2
		N.DesiredAngle = 0.385
		LS.DesiredAngle = 0.385
		RS.DesiredAngle = 1.57
		LH.DesiredAngle = -0.385
		RH.DesiredAngle = -0.385
		RJ.DesiredAngle = -0.385
		local FCA = Instance.new("Attachment",H)
		FCA.Name = "FaceCenterAttachment"
		local FFA = Instance.new("Attachment",H)
		FFA.Name = "FaceFrontAttachment"
		FFA.Position = Vector3.new(0,0,-0.6)
		local HrA = Instance.new("Attachment",H)
		HrA.Name = "HairAttachment"
		HrA.Position = Vector3.new(0,0.6,0)
		local HtA = Instance.new("Attachment",H)
		HtA.Name = "HatAttachment"
		HtA.Position = Vector3.new(0,0.6,0)
		local BBA = Instance.new("Attachment",T)
		BBA.Name = "BodyBackAttachment"
		BBA.Position = Vector3.new(0,0,0.5)
		local BFA = Instance.new("Attachment",T)
		BFA.Name = "BodyFrontAttachment"
		BFA.Position = Vector3.new(0,0,-0.5)
		local LCA = Instance.new("Attachment",T)
		LCA.Name = "LeftCollarAttachment"
		LCA.Position = Vector3.new(-1,1,0)
		local NA = Instance.new("Attachment",T)
		NA.Name = "NeckAttachment"
		NA.Position = Vector3.new(0,1,0)
		local RCA = Instance.new("Attachment",T)
		RCA.Name = "RightCollarAttachment"
		RCA.Position = Vector3.new(1,1,0)
		local WBA = Instance.new("Attachment",T)
		WBA.Name = "WaistBackAttachment"
		WBA.Position = Vector3.new(0,-1,0.5)
		local WCA = Instance.new("Attachment",T)
		WCA.Name = "WaistCenterAttachment"
		WCA.Position = Vector3.new(0,-1,0)
		local WFA = Instance.new("Attachment",T)
		WFA.Name = "WaistFrontAttachment"
		WFA.Position = Vector3.new(0,-1,-0.5)
		local LGA = Instance.new("Attachment",LA)
		LGA.Name = "LeftGripAttachment"
		LGA.Position = Vector3.new(0,-1,0)
		local LSA = Instance.new("Attachment",LA)
		LSA.Name = "LeftShoulderAttachment"
		LSA.Position = Vector3.new(0,1,0)
		local RGA = Instance.new("Attachment",RA)
		RGA.Name = "RightGripAttachment"
		RGA.Position = Vector3.new(0,-1,0)
		local RSA = Instance.new("Attachment",RA)
		RSA.Name = "RightShoulderAttachment"
		RSA.Position = Vector3.new(0,1,0)
		local LFA = Instance.new("Attachment",LL)
		LFA.Name = "LeftFootAttachment"
		local RFA = Instance.new("Attachment",RL)
		RFA.Name = "RightFootAttachment"
		local RtA = Instance.new("Attachment",R)
		RtA.Name = "RootAttachment"
		local Humanoid = Instance.new("Humanoid",Model)
		Humanoid.BreakJointsOnDeath = false
		Humanoid.WalkSpeed = 24
		Instance.new("Animator",Humanoid)
		local pof = true
		local function Died()
			pof = false
			local Amount = 1
			if SetPlayer then
				Amount = 3.5
			end
			game:GetService("Debris"):AddItem(Model,Amount)
			N.DesiredAngle = 0
			LS.DesiredAngle = -3.14
			RS.DesiredAngle = 3.14
			LH.DesiredAngle = -1.57
			RH.DesiredAngle = 1.57
			RJ.DesiredAngle = 0
			wait(0.25)
			LH.DesiredAngle = 0
			RH.DesiredAngle = 0
		end
		Humanoid.Died:Connect(Died)
		local In = true
		table.insert(Gh,Model)
		local function Changed(property)
			if property == "Parent" and Model.Parent == nil then
				if In then
					In = false
					pof = false
					local P = Instance.new("Part",script)
					P.Name = "VanishEffect"
					P.Shape = Enum.PartType.Ball
					P.Size = Vector3.new(1,1,1)
					P.Transparency = 1
					P.Material = Enum.Material.Neon
					P.Position = R.Position
					P.Anchored = true
					P.Locked = true
					P.CanCollide = false
					P.BrickColor = Color
					Poof(P.Position)
					for i = 1,10 do
						P.Transparency = P.Transparency - 0.05
						P.Size = P.Size + Vector3.new(0.5,0.5,0.5)
						wait(0.05)
					end
					for i = 1,5 do
						P.Transparency = P.Transparency + 0.1
						wait(0.05)
					end
					P:Destroy()
				end
			end
		end
		Model.Changed:Connect(Changed)
		local function Changed2(property)
			if property == "Parent" and Summoner.Parent == nil and pof then
				pof = false
				game:GetService("Debris"):AddItem(Model,60+table.find(Gh,Model)*0.5)
			end
		end
		if Summoner then
			Summoner.Changed:Connect(Changed2)
			Changed2("Parent")
			if SHum then
				SHum.Died:Connect(function()
					if pof then
						pof = false
						game:GetService("Debris"):AddItem(Model,60+table.find(Gh,Model)*0.5)
					end
				end)
			end
		end
		if SetPlayer then
			SetPlayer.Character = Model
		end
		for i = 1,#AddOns do
			AddOns[i]:Clone().Parent = Model
		end
		local D = Model:GetDescendants()
		for i = 1,#D do
			if D[i]:IsA("BasePart") then
				D[i].BrickColor = Color
				D[i].CustomPhysicalProperties = PhysicalProperties.new(Enum.Material.Plastic)
				D[i].Material = Enum.Material.ForceField
			end
		end
		spawn(function()
			local L = Instance.new("PointLight",R)
			L.Range = 5
			L.Color = Color.Color
			local P = Instance.new("Part",script)
			P.Name = "AppearEffect"
			P.Shape = Enum.PartType.Ball
			P.Size = Vector3.new(1,1,1)
			P.Transparency = 1
			P.Material = Enum.Material.Neon
			P.CFrame = CF+Vector3.new(0,-2,0)
			P.Anchored = true
			P.Locked = true
			P.CanCollide = false
			P.BrickColor = Color
			if not SetPlayer then
				Appear(P.Position)
			end
			for i = 1,10 do
				P.Transparency = P.Transparency - 0.1
				P.Size = P.Size + Vector3.new(0.25,0.25,0.25)
				P.Position = P.Position + Vector3.new(0,0.125,0)
				if not SetPlayer then
					wait(0.1)
				end
			end
			Poof(P.Position)
			if not SetPlayer then
				Model.Parent = script
				P:Destroy()
			else
				game:GetService("Debris"):AddItem(P,0.25)
			end
			local Targ
			local Hum
			local Count = 0
			local LastAttack = 0
			table.insert(DontChase,Humanoid)
			local Bill
			local Image
			local ScreenGui
			local Btn
			local Atk = true
			if SetPlayer then
				if SetPlayer.Parent and game:GetService("Players"):GetPlayerFromCharacter(Model) == SetPlayer then
					local Gui = SetPlayer:FindFirstChildWhichIsA("PlayerGui") 
					if Gui then
						Bill = Instance.new("BillboardGui",Gui)
						Bill.Size = UDim2.new(8,0,8,0)
						Bill.AlwaysOnTop = true
						Image = Instance.new("ImageLabel",Bill)
						Image.Image = "rbxasset://textures/MouseLockedCursor.png"
						Image.Size = UDim2.new(1,0,1,0)
						Image.Position = UDim2.new(0.5,0,0.5,0)
						Image.AnchorPoint = Vector2.new(0.5,0.5)
						Image.BackgroundTransparency = 1
						Image.ImageTransparency = 1
						Image.ImageColor3 = Color.Color
						ScreenGui = Instance.new("ScreenGui",Gui)
						ScreenGui.Name = "Toggle"
						Btn = Instance.new("TextButton",ScreenGui)
						Btn.Size = UDim2.new(0.075,0,0.1,0)
						Btn.Position = UDim2.new(0.875,0,0.2,0)
						Btn.Font = Enum.Font.Fantasy
						Btn.TextScaled = true
						Btn.TextStrokeTransparency = 0
						Btn.TextColor3 = Color3.new(1-Color.r,1-Color.g,1-Color.b)
						Btn.TextStrokeColor3 = Color3.new(0,0,0)
						Btn.BackgroundColor3 = Color.Color
						Btn.BackgroundTransparency = 0.5
						Btn.Text = "Attack by running: On"
						Btn.MouseButton1Click:Connect(function()
							Atk = not Atk
							if Atk then
								Btn.Text = "Attack by running: On"
							else
								Btn.Text = "Attack by running: Off"
							end
						end)
					end
				else
					game:GetService("Debris"):AddItem(Model,1)
				end
			end
			spawn(function()
				while In do
					wait(1)
					Humanoid.Health = Humanoid.Health + 1
				end
			end)
			local Speed = 0
			local Tool
			local ToolAnim = "Slash"
			local LastToolAnim = 0
			local Look = false
			local AnimFrame = 0
			local State = Humanoid:GetState()
			local LastGround = 0
			local function FallCheck(st)
				if st == Enum.HumanoidStateType.FallingDown or st == Enum.HumanoidStateType.PlatformStanding or st == Enum.HumanoidStateType.Ragdoll or st == Enum.HumanoidStateType.Physics then
					return true
				else
					return false
				end
			end
			local function RunCheck(st)
				if st == Enum.HumanoidStateType.Running or st == Enum.HumanoidStateType.RunningNoPhysics then
					return true
				else
					return false
				end
			end
			local function StateChanged(old,new)
				State = new
			end
			Humanoid.StateChanged:Connect(StateChanged)
			local function Movement(spd)
				Speed = spd
			end
			Humanoid.Running:Connect(Movement)
			Humanoid.Climbing:Connect(Movement)
			Humanoid.Swimming:Connect(Movement)
			spawn(function()
				while In do
					Tool = Model:FindFirstChildWhichIsA("Tool")
					if Tool then
						local A = Tool:FindFirstChild("toolanim")
						if A and A:IsA("StringValue") then
							LastToolAnim = workspace.DistributedGameTime
							ToolAnim = A.Value
							game:GetService("Debris"):AddItem(A,0.2)
							if not FallCheck(State) and workspace.DistributedGameTime <= LastAttack + 0.75 then
								if ToolAnim == "Lunge" then
									N.DesiredAngle = 0
									LS.DesiredAngle = 0.7
									RS.DesiredAngle = 1.57
									LH.DesiredAngle = 1.57
									RH.DesiredAngle = 0.7
									RJ.DesiredAngle = 0
								elseif ToolAnim == "Slash" then
									RS.DesiredAngle = 0
								end
							end
						end
					end
					wait(0.05)
				end
			end)
			spawn(function()
				while In and Humanoid:GetState() ~= Enum.HumanoidStateType.Dead do
					if RunCheck(State) then
						LastGround = workspace.DistributedGameTime
					end
					if workspace.DistributedGameTime <= LastAttack + 0.75 then
						wait(0.05)
					else
						local Action = 0
						if Tool then
							if workspace.DistributedGameTime < LastToolAnim + 0.25 then
								if ToolAnim == "Lunge" then
									N.DesiredAngle = 0
									LS.DesiredAngle = 0.7
									RS.DesiredAngle = 1.57
									LH.DesiredAngle = 1.57
									RH.DesiredAngle = 0.7
									RJ.DesiredAngle = 0
									Action = 3
								elseif ToolAnim == "Slash" then
									RS.DesiredAngle = 0
									Action = 2
								end
							else
								RS.DesiredAngle = 1.57
								Action = 1
							end
						end
						if FallCheck(State) then
							AnimFrame = 0
							if ToolAnim ~= "Lunge" or workspace.DistributedGameTime > LastToolAnim + 0.25 then
								N.DesiredAngle = 0
								RJ.DesiredAngle = 0
								LS.DesiredAngle = -3.14
								if not Tool then
									RS.DesiredAngle = 3.14
								end
								LH.DesiredAngle = 1.57
								RH.DesiredAngle = -1.57
							end
							wait(0.25)
							while FallCheck(Humanoid:GetState()) do
								if workspace.DistributedGameTime > LastAttack + 0.75 then
									N.DesiredAngle = 0
									RJ.DesiredAngle = 0
									LS.DesiredAngle = -3.14
									if not Tool then
										RS.DesiredAngle = 3.14
									end
									LH.DesiredAngle = 0
									RH.DesiredAngle = 0
									if Tool then
										if workspace.DistributedGameTime < LastToolAnim + 0.25 then
											if ToolAnim == "Lunge" then
												N.DesiredAngle = 0
												LS.DesiredAngle = 0.7
												RS.DesiredAngle = 1.57
												LH.DesiredAngle = 1.57
												RH.DesiredAngle = 0.7
												RJ.DesiredAngle = 0
												Action = 3
											elseif ToolAnim == "Slash" then
												RS.DesiredAngle = 0
												Action = 2
											end
										else
											RS.DesiredAngle = 1.57
											Action = 1
										end
									end
								end
								wait(0.05)
							end
						elseif State == Enum.HumanoidStateType.Freefall then
							AnimFrame = 0
							if ToolAnim ~= "Lunge" or workspace.DistributedGameTime > LastToolAnim + 0.25 then
								if R.Velocity.Y > 1 or workspace.DistributedGameTime < LastGround + 0.15 then
									if not Look then
										N.DesiredAngle = 0
										RJ.DesiredAngle = 0
									end
									LS.DesiredAngle = 0.7
									if not Tool then
										RS.DesiredAngle = -0.7
									end
									LH.DesiredAngle = 0.7
									RH.DesiredAngle = -0.7
								else
									if not Look then
										N.DesiredAngle = 0
										RJ.DesiredAngle = 0
									end
									LS.DesiredAngle = -3.6
									if not Tool then
										RS.DesiredAngle = 3.6
									end
									LH.DesiredAngle = -0.7
									RH.DesiredAngle = 0.3
								end
							end
							wait(0.05)
						elseif State == Enum.HumanoidStateType.Climbing then
							if math.abs(Speed) > 0.1 then
								if Speed > 0 then
									AnimFrame = AnimFrame + 1
									if AnimFrame > 4 then
										AnimFrame = 1
									end
								else
									AnimFrame = AnimFrame - 1
									if AnimFrame < 1 then
										AnimFrame = 4
									end
								end
								if AnimFrame == 1 then
									if ToolAnim ~= "Lunge" or workspace.DistributedGameTime > LastToolAnim + 0.25 then
										if not Look then
											N.DesiredAngle = 0
											RJ.DesiredAngle = 0
										end
										LS.DesiredAngle = -1.2
										if not Tool then
											RS.DesiredAngle = 1.9
										end
										LH.DesiredAngle = -0.7
										RH.DesiredAngle = 0
									end
								elseif AnimFrame == 2 then
									if ToolAnim ~= "Lunge" or workspace.DistributedGameTime > LastToolAnim + 0.25 then
										if not Look then
											N.DesiredAngle = 0
											RJ.DesiredAngle = 0
										end
										LS.DesiredAngle = -1.4
										if not Tool then
											RS.DesiredAngle = 1.6
										end
										LH.DesiredAngle = -0.5
										RH.DesiredAngle = 0.3
									end
								elseif AnimFrame == 3 then
									if ToolAnim ~= "Lunge" or workspace.DistributedGameTime > LastToolAnim + 0.25 then
										if not Look then
											N.DesiredAngle = 0
											RJ.DesiredAngle = 0
										end
										LS.DesiredAngle = -1.9
										if not Tool then
											RS.DesiredAngle = 1.2
										end
										LH.DesiredAngle = 0
										RH.DesiredAngle = 0.7
									end
								else
									if ToolAnim ~= "Lunge" or workspace.DistributedGameTime > LastToolAnim + 0.25 then
										if not Look then
											N.DesiredAngle = 0
											RJ.DesiredAngle = 0
										end
										LS.DesiredAngle = -1.6
										if not Tool then
											RS.DesiredAngle = 1.4
										end
										LH.DesiredAngle = -0.3
										RH.DesiredAngle = 0.5
									end
								end
								wait(0.15)
							else
								AnimFrame = 0
								if ToolAnim ~= "Lunge" or workspace.DistributedGameTime > LastToolAnim + 0.25 then
									if not Look then
										N.DesiredAngle = 0
										RJ.DesiredAngle = 0
									end
									LS.DesiredAngle = -1.57
									if not Tool then
										RS.DesiredAngle = 1.57
									end
									LH.DesiredAngle = -0.5
									RH.DesiredAngle = 0.5
								end
								wait(0.05)
							end
						elseif RunCheck(State) and Speed > 0.1 then
							AnimFrame = AnimFrame + 1
							if AnimFrame > 4 then
								AnimFrame = 1
							end
							if Speed > 20 then
								if AnimFrame == 1 then
									if ToolAnim ~= "Lunge" or workspace.DistributedGameTime > LastToolAnim + 0.25 then
										if not Look then
											N.DesiredAngle = -0.07
											RJ.DesiredAngle = 0.1
										end
										LS.DesiredAngle = -1.45
										if not Tool then
											RS.DesiredAngle = 1.45
										end
										LH.DesiredAngle = 0.9
										RH.DesiredAngle = -1.1
									end
									wait(0.15)
								elseif AnimFrame == 3 then
									if ToolAnim ~= "Lunge" or workspace.DistributedGameTime > LastToolAnim + 0.25 then
										if not Look then
											N.DesiredAngle = 0.07
											RJ.DesiredAngle = -0.1
										end
										LS.DesiredAngle = -1.45
										if not Tool then
											RS.DesiredAngle = 1.45
										end
										LH.DesiredAngle = 0.45
										RH.DesiredAngle = -0.65
									end
									wait(0.15)
								else
									if ToolAnim ~= "Lunge" or workspace.DistributedGameTime > LastToolAnim + 0.25 then
										if not Look then
											N.DesiredAngle = 0
											RJ.DesiredAngle = 0
										end
										LS.DesiredAngle = -1.57
										if not Tool then
											RS.DesiredAngle = 1.57
										end
										LH.DesiredAngle = 0.75
										RH.DesiredAngle = -0.8
									end
									wait(0.1)
								end
							else
								if AnimFrame == 1 then
									if ToolAnim ~= "Lunge" or workspace.DistributedGameTime > LastToolAnim + 0.25 then
										if not Look then
											N.DesiredAngle = 0
											RJ.DesiredAngle = 0
										end
										LS.DesiredAngle = 0.7
										if not Tool then
											RS.DesiredAngle = 0.7
										end
										LH.DesiredAngle = -0.7
										RH.DesiredAngle = -0.7
									end
								elseif AnimFrame == 3 then
									if ToolAnim ~= "Lunge" or workspace.DistributedGameTime > LastToolAnim + 0.25 then
										if not Look then
											N.DesiredAngle = 0
											RJ.DesiredAngle = 0
										end
										LS.DesiredAngle = -0.7
										if not Tool then
											RS.DesiredAngle = -0.7
										end
										LH.DesiredAngle = 0.7
										RH.DesiredAngle = 0.7
									end
								else
									if ToolAnim ~= "Lunge" or workspace.DistributedGameTime > LastToolAnim + 0.25 then
										if not Look then
											N.DesiredAngle = 0
											RJ.DesiredAngle = 0
										end
										LS.DesiredAngle = 0
										if not Tool then
											RS.DesiredAngle = 0
										end
										LH.DesiredAngle = 0
										RH.DesiredAngle = 0
									end
								end
								wait(0.15)
							end
						elseif State == Enum.HumanoidStateType.Swimming then
							AnimFrame = AnimFrame + 1
							if AnimFrame > 4 then
								AnimFrame = 1
							end
							if AnimFrame == 1 then
								if ToolAnim ~= "Lunge" or workspace.DistributedGameTime > LastToolAnim + 0.25 then
									if not Look then
										N.DesiredAngle = -0.07
										RJ.DesiredAngle = 0.1
									end
									LS.DesiredAngle = -3.5
									if not Tool then
										RS.DesiredAngle = 1.5
									end
									LH.DesiredAngle = 0.7
									RH.DesiredAngle = 0.7
								end
							elseif AnimFrame == 2 then
								if ToolAnim ~= "Lunge" or workspace.DistributedGameTime > LastToolAnim + 0.25 then
									if not Look then
										N.DesiredAngle = 0
										RJ.DesiredAngle = 0
									end
									LS.DesiredAngle = -1.9
									if not Tool then
										RS.DesiredAngle = 0.8
									end
									LH.DesiredAngle = 0.3
									RH.DesiredAngle = 0.3
								end
							elseif AnimFrame == 3 then
								if ToolAnim ~= "Lunge" or workspace.DistributedGameTime > LastToolAnim + 0.25 then
									if not Look then
										N.DesiredAngle = 0.07
										RJ.DesiredAngle = -0.1
									end
									LS.DesiredAngle = -1.5
									if not Tool then
										RS.DesiredAngle = 3.5
									end
									LH.DesiredAngle = -0.7
									RH.DesiredAngle = -0.7
								end
							else
								if ToolAnim ~= "Lunge" or workspace.DistributedGameTime > LastToolAnim + 0.25 then
									if not Look then
										N.DesiredAngle = 0
										RJ.DesiredAngle = 0
									end
									LS.DesiredAngle = -0.8
									if not Tool then
										RS.DesiredAngle = 1.9
									end
									LH.DesiredAngle = -0.3
									RH.DesiredAngle = -0.3
								end
							end
							wait(0.25)
						elseif State == Enum.HumanoidStateType.Seated then
							AnimFrame = 0
							if not Look then
								N.DesiredAngle = 0
								RJ.DesiredAngle = 0
							end
							LS.DesiredAngle = -1.57
							if not Tool then
								RS.DesiredAngle = 1.57
							end
							LH.DesiredAngle = -1.57
							RH.DesiredAngle = 1.57
							wait(0.05)
						else
							AnimFrame = 0
							if ToolAnim ~= "Lunge" or workspace.DistributedGameTime > LastToolAnim + 0.25 then
								if not Look then
									N.DesiredAngle = 0
									RJ.DesiredAngle = 0
									LS.DesiredAngle = 0
									if not Tool then
										RS.DesiredAngle = 0
									end
									LH.DesiredAngle = 0
									RH.DesiredAngle = 0
								end
							end
							wait(0.05)
						end
					end
				end
			end)
			local function Pathfind(pos)
				local Points = game:GetService("PathfindingService"):ComputeRawPathAsync(R.Position,pos,300)
				local Co = Points:GetPointCoordinates()
				local Offset = Vector3.new(0,0,0)
				local Jump1 = false
				local Jump2 = false
				local Jump3 = false
				local Find1
				local Find2
				local Find3
				if Points.Status == Enum.PathStatus.Success or Points.Status == Enum.PathStatus.ClosestNoPath or Points.Status == Enum.PathStatus.ClosestOutOfRange then
					local From = R.Position
					if Co[1] then
						Find1 = Co[1]
						if Co[1].Y > From.Y + 1 or Humanoid.Sit or Humanoid.PlatformStand then
							Jump1 = true
						end
						From = Co[1]
						if Co[2] then
							Find2 = Co[2]
							if Co[2].Y > From.Y + 1 or Humanoid.Sit or Humanoid.PlatformStand then
								Jump2 = true
							end
							From = Co[2]
							if Co[3] then
								Find3 = Co[3]
								if Co[3].Y > From.Y + 1 or Humanoid.Sit or Humanoid.PlatformStand then
									Jump3 = true
								end
							end
						end
					end
				end
				return Points.Status,Jump1,Jump2,Jump3,Find1,Find2,Find3
			end
			local function Check()
				HC.Parent = script
				HC.CFrame = R.CFrame
				local Touching = HC:GetTouchingParts()
				HC.Parent = nil
				local Dist = math.huge
				local Select
				local Hm
				for i = 1,#Touching do
					local Ch = Touching[i].Parent
					if Ch and Ch:FindFirstChildWhichIsA("ForceField") == nil and Ch ~= Summoner then
						local Plr = game:GetService("Players"):GetPlayerFromCharacter(Ch)
						if not Player or not Plr or (Player ~= Plr and (Player.Neutral or Plr.Neutral or Player.TeamColor.Name ~= Plr.TeamColor.Name)) then
							local Hu = Touching[i].Parent:FindFirstChildWhichIsA("Humanoid")
							if Hu and Hu.Health > 0 and Hu:GetState() ~= Enum.HumanoidStateType.Dead  and not table.find(DontChase,Hu) then
								local EP = Hu.RootPart
								if EP == nil then
									EP = Hu.Parent:FindFirstChildWhichIsA("BasePart")
								end
								if EP and (EP.Position-R.Position).Magnitude < Dist then
									Dist = (EP.Position-R.Position).Magnitude
									Select = EP
									Hm = Hu
								end
							end
						end
					end
				end
				if Select and Hm then
					Targ = Select
					Hum = Hm
					if Bill and Image then
						Bill.Adornee = Targ
						Image.ImageTransparency = 0.5
					end
				else
					Targ = nil
					Hum = nil
					if Bill and Image then
						Bill.Adornee = nil
						Image.ImageTransparency = 1
					end
				end
			end
			local function LookAnim()
				if Humanoid:GetState() ~= Enum.HumanoidStateType.Dead then
					if ToolAnim ~= "Lunge" or workspace.DistributedGameTime > LastToolAnim + 0.25 then
						N.DesiredAngle = 0.4
						RJ.DesiredAngle = 0.2
						if RunCheck(State) and Speed <= 0.1 then
							LS.DesiredAngle = 0.5
							if not Tool then
								RS.DesiredAngle = 0.5
							end
							LH.DesiredAngle = -0.3
							RH.DesiredAngle = -0.3
						end
					end
					wait(0.6)
					if Humanoid:GetState() ~= Enum.HumanoidStateType.Dead then
						if ToolAnim ~= "Lunge" or workspace.DistributedGameTime > LastToolAnim + 0.25 then
							N.DesiredAngle = -0.4
							RJ.DesiredAngle = -0.2
							if RunCheck(State) and Speed <= 0.1 then
								LS.DesiredAngle = -0.5
								if not Tool then
									RS.DesiredAngle = -0.5
								end
								LH.DesiredAngle = 0.15
								RH.DesiredAngle = 0.15
							end
						end
					end
					wait(0.3)
				end
			end
			Check()
			spawn(function()
				while Humanoid:GetState() ~= Enum.HumanoidStateType.Dead and In do
					if Btn and Btn.Parent then
						if Atk and (not SetPlayer or Humanoid.MoveDirection.X ~= 0 or Humanoid.MoveDirection.Z ~= 0) then
							Btn.TextStrokeColor3 = Color3.new(1,1,1)
						else
							Btn.TextStrokeColor3 = Color3.new(0,0,0)
						end
					end
					if Targ and Targ:FindFirstAncestorWhichIsA("Workspace") and Hum and Hum:FindFirstAncestorWhichIsA("Workspace") and Hum.Health > 0 then
						local Dist = (Targ.Position-R.Position).Magnitude
						if Atk and Dist < R.Size.Magnitude*1.75 and workspace.DistributedGameTime > LastAttack + 0.75 and (not SetPlayer or Humanoid.MoveDirection.X ~= 0 or Humanoid.MoveDirection.Z ~= 0) then
							if Btn and Btn.Parent then
								Btn.TextStrokeColor3 = Color.Color
							end
							LastAttack = workspace.DistributedGameTime
							if not SetPlayer then
								Humanoid.WalkToPoint = Targ.Position
							end
							if ToolAnim ~= "Lunge" or workspace.DistributedGameTime > LastToolAnim + 0.25 then
								if not Look then
									N.DesiredAngle = 0.2
									RJ.DesiredAngle = -0.25
								end
								LS.DesiredAngle = -0.2
								RS.DesiredAngle = 3
								LH.DesiredAngle = -0.5
								RH.DesiredAngle = -0.5
							end
							Swish(R.Position)
							wait(0.15)
							if Btn and Btn.Parent then
								if Atk and (not SetPlayer or Humanoid.MoveDirection.X ~= 0 or Humanoid.MoveDirection.Z ~= 0) then
									Btn.TextStrokeColor3 = Color3.new(1,1,1)
								else
									Btn.TextStrokeColor3 = Color3.new(0,0,0)
								end
							end
							if (ToolAnim ~= "Lunge" or workspace.DistributedGameTime > LastToolAnim + 0.25) and Humanoid:GetState() ~= Enum.HumanoidStateType.Dead then
								if not Look then
									N.DesiredAngle = -0.4
									RJ.DesiredAngle = 0.5
								end
								LS.DesiredAngle = 0.5
								RS.DesiredAngle = 0.8
								LH.DesiredAngle = -0.8
								RH.DesiredAngle = -0.8
							end
							Dist = (Targ.Position-R.Position).Magnitude
							if Dist < R.Size.Magnitude*1.75 and Humanoid:GetState() ~= Enum.HumanoidStateType.Dead and In and (not SetPlayer or Humanoid.MoveDirection.X ~= 0 or Humanoid.MoveDirection.Z ~= 0) then
								local Stored = Hum.Health
								local creator = Instance.new("ObjectValue",Hum)
								creator.Name = "creator"
								if Player and Player.Parent then
									creator.Value = Player
								end
								game:GetService("Debris"):AddItem(creator,0.1)
								Hum:TakeDamage(34)
								if Hum.Health >= Stored then
									Deflect(Targ.Position)
									DefCount = DefCount + 1
									LDefCount = LDefCount + 1
									NotifyBlock()
									Update()
								else
									HitCount = HitCount + 1
									LHitCount = LHitCount + 1
									DamageDone = DamageDone + math.max(0,math.min(math.ceil(Stored),34))
									LDamageDone = LDamageDone + math.max(0,math.min(math.ceil(Stored),34))
									if Stored > 0 and Hum.Health <= 0 then
										ConfirmLast = ConfirmLast + 1
										LConfirmLast = LConfirmLast + 1
										NotifyKO()
									else
										NotifyHit()
									end
									Update()
									Hurt(Targ.Position)
								end
							end
							if not SetPlayer then
								Humanoid.WalkToPoint = Targ.Position
							end
							wait(0.15)
							if not SetPlayer then
								Humanoid.WalkToPoint = (R.CFrame*CFrame.new(-1,0,5)).Position
							end
							wait(0.2)
						else
							if not SetPlayer then
								local Status,Jump1,Jump2,Jump3,Find1,Find2,Find3 = Pathfind(Targ.Position)
								if Status == Enum.PathStatus.Success or Status == Enum.PathStatus.ClosestNoPath or Status == Enum.PathStatus.ClosestOutOfRange and Find1 then
									Humanoid.WalkToPoint = R.Position+(Find1-R.Position).Unit*32
									if Jump1 then
										Humanoid.Jump = true
										Humanoid.Sit = false
									end
									if Find2 then
										Humanoid.WalkToPoint = R.Position+(Find2-R.Position).Unit*32
										if Jump2 then
											Humanoid.Jump = true
											Humanoid.Sit = false
										end
										wait(0.05)
										if Find3 then
											Humanoid.WalkToPoint = R.Position+(Find3-R.Position).Unit*32
											if Jump3 then
												Humanoid.Jump = true
												Humanoid.Sit = false
											end
											wait(0.05)
										end
									end
									wait(0.15)
								elseif Dist < 100 then
									Humanoid.WalkToPoint = Targ.Position
									if (Targ.Position.Y > R.Position.Y + 1 and Humanoid:GetState() ~= Enum.HumanoidStateType.Climbing) or Humanoid.Sit or Humanoid.PlatformStand then
										Humanoid.Jump = true
										Humanoid.Sit = false
									end
									wait(0.2)
								else
									Count = Count + 1
									wait(0.1)
								end
							else
								wait(0.05)
							end
						end
						Count = Count + 1
						if Count > 19 then
							Count = 0
							Check()
						end
					elseif Summoner and Summoner:FindFirstAncestorWhichIsA("Workspace") and SHum and SHum:FindFirstAncestorWhichIsA("Workspace") and SHum:GetState() ~= Enum.HumanoidStateType.Dead then
						Targ = nil
						Hum = nil
						if Bill and Image then
							Bill.Adornee = nil
							Image.ImageTransparency = 1
						end
						local RP = SHum.RootPart
						if RP == nil then
							RP = SHum.Parent:FindFirstChildWhichIsA("BasePart")
						end
						if RP and (RP.Position-R.Position).Magnitude < 100 then
							local Goal = RP.Position+RP.CFrame.LookVector*RP.Size.Z*-12+(RP.CFrame.LookVector*math.min(table.find(Gh,Model)*-3,80))
							local Status,Jump1,Jump2,Jump3,Find1,Find2,Find3 = Pathfind(Goal)
							if Status == Enum.PathStatus.Success or Status == Enum.PathStatus.ClosestNoPath or Status == Enum.PathStatus.ClosestOutOfRange and Find1 then
								if (R.Position-Goal).Magnitude < 10 then
									Humanoid.WalkToPoint = Find1
								else
									Humanoid.WalkToPoint = R.Position+(Find1-R.Position).Unit*32
								end
								if Jump1 then
									Humanoid.Jump = true
									Humanoid.Sit = false
								end
								if Find2 then
									if (R.Position-Goal).Magnitude < 10 then
										Humanoid.WalkToPoint = Find2
									else
										Humanoid.WalkToPoint = R.Position+(Find2-R.Position).Unit*32
									end
									if Jump2 then
										Humanoid.Jump = true
										Humanoid.Sit = false
									end
									wait(0.05)
									if Find3 then
										if (R.Position-Goal).Magnitude < 10 then
											Humanoid.WalkToPoint = Find3
										else
											Humanoid.WalkToPoint = R.Position+(Find3-R.Position).Unit*32
										end
										if Jump3 then
											Humanoid.Jump = true
											Humanoid.Sit = false
										end
										wait(0.05)
									end
								end
							end
							wait(0.15)
							local WandHeld = false
							if Wand and Wand.Parent == Summoner and SHum and SHum:GetState() ~= Enum.HumanoidStateType.Dead then
								WandHeld = true
							end
							Count = Count + 1
							if Count > 4 and not WandHeld then
								Count = 0
								Check()
							end
						else
							Count = 0
							local Status,Jump1,Jump2,Jump3,Find1,Find2,Find3 = Pathfind(R.Position+Vector3.new(math.random(-32,32),0,math.random(-32,32)))
							if Status == Enum.PathStatus.Success or Status == Enum.PathStatus.ClosestNoPath or Status == Enum.PathStatus.ClosestOutOfRange and Find1 then
								Humanoid.WalkToPoint = Find1
								if Jump1 then
									Humanoid.Jump = true
									Humanoid.Sit = false
								end
								if Find2 then
									Humanoid.WalkToPoint = Find2
									if Jump2 then
										Humanoid.Jump = true
										Humanoid.Sit = false
									end
									wait(0.05)
									if Find3 then
										Humanoid.WalkToPoint = Find3
										if Jump3 then
											Humanoid.Jump = true
											Humanoid.Sit = false
										end
										wait(0.05)
									end
								end
							end
							wait(math.random(75,200)/100)
							Look = true
							LookAnim()
							Check()
							if Targ and Humanoid:GetState() ~= Enum.HumanoidStateType.Dead then
								if ToolAnim ~= "Lunge" or workspace.DistributedGameTime > LastToolAnim + 0.25 then
									N.DesiredAngle = 0
									RJ.DesiredAngle = 0
									if RunCheck(State) and Speed <= 0.1 then
										LS.DesiredAngle = -2.5
										if not Tool then
											RS.DesiredAngle = 0.3
										end
										LH.DesiredAngle = 0.1
										RH.DesiredAngle = 0.1
									end
								end
							end
							wait(0.3)
							Look = false
						end
					else
						Targ = nil
						Hum = nil
						if Bill and Image then
							Bill.Adornee = nil
							Image.ImageTransparency = 1
						end
						Count = 0
						if not SetPlayer then
							local Status,Jump1,Jump2,Jump3,Find1,Find2,Find3 = Pathfind(R.Position+Vector3.new(math.random(-32,32),0,math.random(-32,32)))
							if Status == Enum.PathStatus.Success or Status == Enum.PathStatus.ClosestNoPath or Status == Enum.PathStatus.ClosestOutOfRange and Find1 then
								Humanoid.WalkToPoint = Find1
								if Jump1 then
									Humanoid.Jump = true
									Humanoid.Sit = false
								end
								if Find2 then
									Humanoid.WalkToPoint = Find2
									if Jump2 then
										Humanoid.Jump = true
										Humanoid.Sit = false
									end
									wait(0.05)
									if Find3 then
										Humanoid.WalkToPoint = Find2
										if Jump3 then
											Humanoid.Jump = true
											Humanoid.Sit = false
										end
										wait(0.05)
									end
								end
							end
						end
						wait(math.random(75,200)/100)
						Look = true
						LookAnim()
						Check()
						if Targ and Humanoid:GetState() ~= Enum.HumanoidStateType.Dead then
							if ToolAnim ~= "Lunge" or workspace.DistributedGameTime > LastToolAnim + 0.25 then
								N.DesiredAngle = 0
								RJ.DesiredAngle = 0
								if RunCheck(State) and Speed <= 0.1 then
									LS.DesiredAngle = -2.5
									if not Tool then
										RS.DesiredAngle = 0.3
									end
									LH.DesiredAngle = -0.1
									RH.DesiredAngle = -0.1
								end
							end
						end
						wait(0.3)
						Look = false
					end
				end
				if Bill and Bill.Parent then
					Bill:Destroy()
				end
				if ScreenGui and ScreenGui.Parent then
					ScreenGui:Destroy()
				end
				table.remove(DontChase,table.find(DontChase,Humanoid))
				table.remove(Gh,table.find(Gh,Model))
			end)
		end)
		return Model
	end
	local Ch = owner.Character
	if Ch then
		local Hu = Ch:FindFirstChildWhichIsA("Humanoid")
		if Hu and Hu.RootPart and Hu:GetState() ~= Enum.HumanoidStateType.Dead then
			table.insert(DontChase,Hu)
			Hu.BreakJointsOnDeath = false
			local RP = Hu.RootPart
			local In = true
			local Agh = false
			local Triggered = false
			local NowThatsALottaDamage = false
			local Allowed = false
			if not Pass then
				spawn(function()
					ApplyShield(Ch,Hu,1,0,500,BrickColor.new("Really blue"))
				end)
			end
			delay(1,function()
				Allowed = true
			end)
			local function Gone()
				if not Triggered and owner.Parent and not Displaying then
					Triggered = true
					Displaying = true
					local ScreenGui = Instance.new("ScreenGui",owner:FindFirstChild("PlayerGui"))
					ScreenGui.Name = "Goodbye"
					local Btn = Instance.new("TextButton",ScreenGui)
					Btn.Size = UDim2.new(0.075,0,0.1,0)
					Btn.Position = UDim2.new(0.8,0,0.3,0)
					Btn.Font = Enum.Font.Fantasy
					Btn.TextScaled = true
					Btn.TextStrokeTransparency = 0
					Btn.TextColor3 = Color3.new(1-Color.r,1-Color.g,1-Color.b)
					Btn.TextStrokeColor3 = Color3.new(0,0,0)
					Btn.BackgroundColor3 = Color.Color
					Btn.BackgroundTransparency = 0.5
					local First = ""
					local AddOn = "Did they actually get you?"
					local C = Hu:GetChildren()
					local Found
					for i = 1,#C do
						if C[i].Name == "creator" and C[i]:IsA("ObjectValue") then
							if C[i].Value ~= nil then
								Found = C[i].Value
								if C[i].Value ~= owner then
									First = C[i].Value.Name.." was after you. "
								else
									First = "You had yourself. "
								end
							elseif not Found then
								First = "It felt like someone else was after you. "
							end
						end
					end
					local Choices = math.random(1,3)
					if Choices == 1 then
						AddOn = "Now isn't the time to make a fall..."
					elseif Choices == 2 then
						AddOn = "Go for it again!"
					end
					Btn.Text = First..AddOn
					Btn.MouseButton1Click:Connect(function()
						Skip = true
					end)
					delay(3,function()
						ScreenGui:Destroy()
						Displaying = false
						if owner.Parent and Skip then
							local MM = Make(owner.Name,LastCF+Vector3.new(0,2,0),Color,owner,nil,nil,owner,nil,fc,HM,HT,acc)
							table.insert(DontChase,MM:FindFirstChildWhichIsA("Humanoid"))
							MM.Parent = workspace
							Rejected = Rejected + 1
							LRejected = LRejected + 1
						elseif owner.Parent and Unavailable then
							owner:LoadCharacter()
						end
					end)
					local ScreenGui2
					local Btn2
					if Found and Found:IsA("Player") then
						ScreenGui2 = Instance.new("ScreenGui",Found:FindFirstChild("PlayerGui"))
						ScreenGui2.Name = "Gotcha"
						game:GetService("Debris"):AddItem(ScreenGui2,10)
						Btn2 = Instance.new("TextButton",ScreenGui2)
						Btn2.Size = UDim2.new(0.075,0,0.1,0)
						Btn2.Position = UDim2.new(0.875,0,0.3,0)
						Btn2.Font = Enum.Font.Fantasy
						Btn2.TextScaled = true
						Btn2.TextStrokeTransparency = 0
						Btn2.TextColor3 = Color3.new(1-Color.r,1-Color.g,1-Color.b)
						Btn2.TextStrokeColor3 = Color3.new(0,0,0)
						Btn2.BackgroundColor3 = Color.Color
						Btn2.BackgroundTransparency = 0.5
						local AddOn2 = "Does "..owner.Name.." really know what's going on?"
						if Choices == 1 then
							AddOn2 = "Nobody knows how "..owner.Name.." feels..."
						elseif Choices == 2 then
							AddOn2 = "That's certain to leave a nasty mark on "..owner.Name.."!"
						end
						Btn2.Text = AddOn2
						Btn2.MouseButton1Click:Connect(function()
							ScreenGui2:Destroy()
						end)
					end
					if NowThatsALottaDamage then
						spawn(function()
							for i = 1,10 do
								wait(0.05)
								Btn.Position = UDim2.new(0.8,0,0.28,0)
								if Btn2 then
									Btn2.Position = UDim2.new(0.875,0,0.28,0)
								end
								wait(0.05)
								Btn.Position = UDim2.new(0.8,0,0.3,0)
								if Btn2 then
									Btn2.Position = UDim2.new(0.875,0,0.3,0)
								end
							end
						end)
					end
				end
			end
			local function Changed(property)
				if property == "Parent" and (Ch.Parent == nil or Hu.Parent ~= Ch) then
					if In then
						In = false
						wait()
						Gone()
						if not Pass and Agh and Hu.Parent == Ch then
							local Tool = Ch:FindFirstChildWhichIsA("Tool")
							if Tool then
								game:GetService("Debris"):AddItem(Tool,0)
							end
							game:GetService("Debris"):AddItem(Ch,300)
							Ch.Parent = workspace
						end
					end
				end
			end
			Ch.Changed:Connect(Changed)
			Hu.Changed:Connect(Changed)
			local Hd = Ch:FindFirstChild("Head")
			local W1
			if Hd and Hd:IsA("BasePart") then
				if not Pass then
					HatPart = Instance.new("Part",Hu)
					HatPart.Name = "HatPart"
					HatPart.Material = Enum.Material.Sand
					HatPart.Size = Vector3.new(1.5,0.25,1.5)
					HatPart.CFrame = Hd.CFrame*CFrame.new(0,0.5,0)
					HatPart.Locked = true
					HatPart.CanCollide = false
					HatPart.Massless = true
					HatPart.BrickColor = Color
					W1 = Instance.new("Weld",HatPart)
					W1.Part0 = HatPart
					W1.Part1 = Hd
					W1.C0 = CFrame.new(0,-0.5,0)
					Hat2 = Instance.new("Part",Hu)
					Hat2.Name = "Hat2"
					Hat2.Material = Enum.Material.Sand
					Hat2.Size = Vector3.new(0.5,0.5,0.5)
					Hat2.CFrame = HatPart.CFrame*CFrame.new(0,0.375,0)
					Hat2.Locked = true
					Hat2.CanCollide = false
					Hat2.Massless = true
					Hat2.BrickColor = Color
					local W2 = Instance.new("Weld",Hat2)
					W2.Part0 = Hat2
					W2.Part1 = HatPart
					W2.C0 = CFrame.new(0,-0.375,0)
					Hat3 = Instance.new("Part",Hu)
					Hat3.Name = "Hat3"
					Hat3.Material = Enum.Material.SmoothPlastic
					Hat3.Size = Vector3.new(0.75,0.25,0.75)
					Hat3.CFrame = Hat2.CFrame*CFrame.new(0,-0.125,0)
					Hat3.Locked = true
					Hat3.CanCollide = false
					Hat3.Massless = true
					Hat3.BrickColor = BrickColor.new("Brown")
					local W3 = Instance.new("Weld",Hat3)
					W3.Part0 = Hat3
					W3.Part1 = Hat2
					W3.C0 = CFrame.new(0,0.125,0)
					Hat4 = Instance.new("Part",Hu)
					Hat4.Name = "Hat4"
					Hat4.Material = Enum.Material.Sand
					Hat4.Size = Vector3.new(0.25,0.25,0.25)
					Hat4.CFrame = Hat2.CFrame*CFrame.new(0,0.375,0)
					Hat4.Locked = true
					Hat4.CanCollide = false
					Hat4.Massless = true
					Hat4.BrickColor = Color
					local W4 = Instance.new("Weld",Hat4)
					W4.Part0 = Hat4
					W4.Part1 = Hat2
					W4.C0 = CFrame.new(0.0625,-0.375,-0.0625)
				end
			end
			local Bill = Instance.new("BillboardGui",RP)
			Bill.Size = UDim2.new(15,0,2,0)
			Bill.LightInfluence = 0.25
			Bill.StudsOffset = Vector3.new(0,6,0)
			Bill.Adornee = RP
			TextB = Instance.new("TextBox",Bill)
			TextB.AnchorPoint = Vector2.new(0.5,0.5)
			TextB.Position = UDim2.new(0.5,0,0.5,0)
			TextB.Size = UDim2.new(1,0,1,0)
			TextB.BackgroundTransparency = 1
			TextB.TextStrokeTransparency = 0
			TextB.TextScaled = true
			TextB.Font = Enum.Font.Fantasy
			TextB.TextColor3 = Color.Color
			TextB.TextStrokeColor3 = Color3.new()
			TextB.TextTransparency = 0
			TextB.Text = ""
			local SoundV = Instance.new("Sound",RP)
			SoundV.SoundId = "rbxasset://sounds/bass.mp3"
			SoundV.Looped = true
			local Interrupt = 0
			local function AAAAH()
				spawn(function()
					if math.random(1,2) == 1 then
						for i = 1,5 do
							Play(SoundV,7+i*1.4,0.7)
							wait(0.05)
						end
						for i = 1,25 do
							Play(SoundV,12-i*0.15,0.7-i*0.02)
							wait(0.05)
						end
					else
						for i = 1,4 do
							Play(SoundV,4+i*1.1,0.7)
							wait(0.05)
						end
						for i = 1,14 do
							Play(SoundV,9+i*0.5,0.7)
							task.wait(0.05)
						end
						for i = 1, 23 do
							Play(SoundV,13-i*0.15,0.7-i*0.03)
							task.wait(0.05)
						end
					end
					SoundV:Stop()
				end)
			end
			local function AOW()
				spawn(function()
					for i = 1,3 do
						Play(SoundV,4.9+i*1.4,0.7)
						wait(0.05)
					end
					for i = 1,15 do
						Play(SoundV,7-i*0.2,0.7-i*0.04)
						wait(0.05)
					end
					SoundV:Stop()
				end)
			end
			local function OW()
				spawn(function()
					for i = 1,4 do
						if Interrupt > 3 then break end
						Play(SoundV,4.5+i*0.6,0.7)
						wait(0.05)
					end
					for i = 1,7 do
						if Interrupt > 3 then break end
						Play(SoundV,6.9+i*0.3,0.7)
						wait(0.05)
					end
					for i = 1,8 do
						if Interrupt > 3 then break end
						Play(SoundV,7.9-i*0.25,0.7-i*0.06)
						wait(0.05)
					end
					if Interrupt <= 3 then
						SoundV:Stop()
						Interrupt = 0
					end
				end)
			end
			local function Ouch()
				spawn(function()
					for i = 1,2 do
						if Interrupt > 2 then break end
						Play(SoundV,2.2+i*0.7,0.55)
						wait(0.05)
					end
					for i = 1,8 do
						if Interrupt > 2 then break end
						Play(SoundV,6.4-i*0.4,0.55-i*0.06)
						wait(0.05)
					end
					if Interrupt <= 2 then
						SoundV:Stop()
						Interrupt = 0
					end
				end)
			end
			local function Uh()
				spawn(function()
					for i = 1,5 do
						if Interrupt > 1 then break end
						Play(SoundV,1.6-i*0.15,0.5-i*0.08)
						wait(0.05)
					end
					if Interrupt <= 1 then
						SoundV:Stop()
						Interrupt = 0
					end
				end)
			end
			local function Blah()
				local Rand1 = math.random(350,420)/100
				local Rand2 = math.random(-30,40)/100
				if Hu.Health < 100 then
					Rand1 = Rand1-0.1
				end
				if Hu.Health <= 75 then
					Rand1 = Rand1-0.1
				end
				if Hu.Health <= 50 then
					Rand1 = Rand1-0.2
				end
				if Hu.Health <= 25 then
					Rand1 = Rand1-0.2
				end
				for i = 1,math.random(2,5) do
					if Interrupt > 0 then break end
					Play(SoundV,Rand1+Rand2*i,0.8)
					wait(0.05)
				end
				if Interrupt == 0 then
					SoundV:Stop()
				end
				wait(0.05)
			end
			local function RoughTalk()
				local Rand1 = math.random(480,570)/100
				local Rand2 = math.random(-70,100)/100
				if Hu.Health < 100 then
					Rand1 = Rand1-0.1
				end
				if Hu.Health <= 75 then
					Rand1 = Rand1-0.1
				end
				if Hu.Health <= 50 then
					Rand1 = Rand1-0.2
				end
				if Hu.Health <= 25 then
					Rand1 = Rand1-0.2
				end
				for i = 1,math.random(2,5) do
					if Interrupt > 0 then break end
					Play(SoundV,Rand1+Rand2*i,0.8)
					wait(0.05)
				end
				if Interrupt == 0 then
					SoundV:Stop()
				end
				wait(0.05)
			end
			local function End()
				local Rand1 = math.random(320,380)/100
				local Rand2 = math.random(-30,-10)/100
				if Hu.Health < 100 then
					Rand1 = Rand1-0.1
				end
				if Hu.Health <= 75 then
					Rand1 = Rand1-0.1
				end
				if Hu.Health <= 50 then
					Rand1 = Rand1-0.2
				end
				if Hu.Health <= 25 then
					Rand1 = Rand1-0.2
				end
				for i = 1,math.random(2,5) do
					if Interrupt > 0 then break end
					Play(SoundV,Rand1+Rand2*i,0.8)
					wait(0.05)
				end
				if Interrupt == 0 then
					SoundV:Stop()
				end
				wait(0.15)
			end
			local function Oh()
				local Rand1 = math.random(320,380)/100
				local Rand2 = math.random(-15,-8)/100
				if Hu.Health < 100 then
					Rand1 = Rand1-0.1
				end
				if Hu.Health <= 75 then
					Rand1 = Rand1-0.1
				end
				if Hu.Health <= 50 then
					Rand1 = Rand1-0.2
				end
				if Hu.Health <= 25 then
					Rand1 = Rand1-0.2
				end
				for i = 1,math.random(5,15) do
					if Interrupt > 0 then break end
					Play(SoundV,Rand1+Rand2*i,0.8)
					wait(0.05)
				end
				if Interrupt == 0 then
					SoundV:Stop()
				end
				wait(0.05)
			end
			local function Huh()
				local Rand1 = math.random(350,420)/100
				local Rand2 = math.random(20,70)/100
				if Hu.Health < 100 then
					Rand1 = Rand1-0.1
				end
				if Hu.Health <= 75 then
					Rand1 = Rand1-0.1
				end
				if Hu.Health <= 50 then
					Rand1 = Rand1-0.2
				end
				if Hu.Health <= 25 then
					Rand1 = Rand1-0.2
				end
				for i = 1,math.random(4,7) do
					if Interrupt > 0 then break end
					Play(SoundV,Rand1+Rand2*i,0.8)
					wait(0.05)
				end
				if Interrupt == 0 then
					SoundV:Stop()
				end
				wait(0.05)
			end
			local function Wow()
				local Rand1 = math.random(370,450)/100
				local Rand2 = math.random(40,90)/100
				if Hu.Health < 100 then
					Rand1 = Rand1-0.1
				end
				if Hu.Health <= 75 then
					Rand1 = Rand1-0.1
				end
				if Hu.Health <= 50 then
					Rand1 = Rand1-0.2
				end
				if Hu.Health <= 25 then
					Rand1 = Rand1-0.2
				end
				for i = 1,math.random(2,4) do
					if Interrupt > 0 then break end
					Rand1 = Rand1+Rand2*2
					Play(SoundV,Rand1,0.8)
					wait(0.05)
				end
				for i = 1,math.random(4,6) do
					if Interrupt > 0 then break end
					Rand1 = Rand1-Rand2
					Play(SoundV,Rand1,0.8)
					wait(0.05)
				end
				if Interrupt == 0 then
					SoundV:Stop()
				end
				wait(0.05)
			end
			local function Wha()
				local Rand1 = math.random(370,450)/100
				local Rand2 = math.random(30,60)/100
				if Hu.Health < 100 then
					Rand1 = Rand1-0.1
				end
				if Hu.Health <= 75 then
					Rand1 = Rand1-0.1
				end
				if Hu.Health <= 50 then
					Rand1 = Rand1-0.2
				end
				if Hu.Health <= 25 then
					Rand1 = Rand1-0.2
				end
				for i = 1,math.random(8,14) do
					if Interrupt > 0 then break end
					Rand1 = Rand1+Rand2*2
					Play(SoundV,Rand1,0.8)
					wait(0.05)
				end
				if Interrupt == 0 then
					SoundV:Stop()
				end
				wait(0.05)
			end
			local function AAH()
				if math.random(1,2) == 1 then
					for i = 1,5 do
						if Interrupt > 0 then break end
						Play(SoundV,7+i*1.4,0.7)
						wait(0.05)
					end
					for i = 1,25 do
						if Interrupt > 0 then break end
						Play(SoundV,12-i*0.15,0.7-i*0.02)
						wait(0.05)
					end
				else
					for i = 1,4 do
						if Interrupt > 0 then break end
						Play(SoundV,4+i*1.1,0.7)
						wait(0.05)
					end
					for i = 1,14 do
						if Interrupt > 0 then break end
						Play(SoundV,9+i*0.5,0.7)
						wait(0.05)
					end
					for i = 1,23 do
						if Interrupt > 0 then break end
						Play(SoundV,13-i*0.15,0.7-i*0.03)
						wait(0.05)
					end
				end
				if Interrupt <= 0 then
					SoundV:Stop()
				end
				wait(0.05)
			end
			local function EEE()
				Play(SoundV,15,0.8)
				wait(0.05)
				if Interrupt == 0 then
					SoundV:Stop()
				end
				wait(0.05)
			end
			local HP = Hu.Health
			local Recorded = Hu.Health
			local LastHurt = 0
			local Dmg = 0
			local function HealthChanged()
				if Hu:GetState() ~= Enum.HumanoidStateType.Dead and Hu.Health < HP then
					LastHurt = workspace.DistributedGameTime
					Dmg = Hu.Health - HP
					if Hu:GetState() ~= Enum.HumanoidStateType.Dead then
						Recorded = Hu.Health
					end
					if Hu.Health > 0 then
						if Dmg <= math.random(-50,-20) and Interrupt < 3 then
							Interrupt = 3
							OW()
						elseif Dmg <= math.random(-15,-5) and Interrupt < 2 then
							Interrupt = 2
							Ouch()
						elseif Interrupt < 1 then
							Interrupt = 1
							Uh()
						end
					end
				end
				HP = Hu.Health
			end
			Hu.HealthChanged:Connect(HealthChanged)
			local function Died()
				if not Agh then
					Agh = true
					Interrupt = 5
					local Dif = math.abs(Recorded)
					if workspace.DistributedGameTime <= LastHurt + 0.2 then
						Dif = math.max(Dif,-Dmg)
					end
					if Dif >= 60 then
						NowThatsALottaDamage = true
					end
					Gone()
					if RP:FindFirstAncestorWhichIsA("Workspace") then
						if Dif >= math.random(25000,50000) or RP.Velocity.Magnitude >= 300 then
							AAAAH()
						else
							AOW()
						end
					elseif Allowed then
						Scream(RP.Position)
					end
					if Allowed and (RP.Position.Y <= workspace.FallenPartsDestroyHeight or #RP:GetJoints() > 0) then
						delay(1.25,function()
							if RP.Velocity.Y < -100 then
								Fall(RP.Position)
							end
							wait(2)
							if RP.Position.Y <= workspace.FallenPartsDestroyHeight then
								Splash(RP.Position)
							end
						end)
					end
					game:GetService("Debris"):AddItem(Bill,10)
					if not Pass then
						spawn(function()
							local LScript = script.StopAnim:Clone()
							LScript.Parent = Hu
							LScript.Disabled = false
							game:GetService("Debris"):AddItem(LScript)
							wait(0.4)
							local LS = Ch:FindFirstChild("Left Shoulder",true)
							local RS = Ch:FindFirstChild("Right Shoulder",true)
							local LH = Ch:FindFirstChild("Left Hip",true)
							local RH = Ch:FindFirstChild("Right Hip",true)
							if LS and LS:IsA("Motor6D") then
								LS.MaxVelocity = 0.2
								LS.DesiredAngle = -3.14
							end
							if RS and RS:IsA("Motor6D") then
								RS.MaxVelocity = 0.2
								RS.DesiredAngle = 3.14
							end
							if LH and LH:IsA("Motor6D") then
								LH.MaxVelocity = 0.2
								LH.DesiredAngle = -1.57
							end
							if RH and RH:IsA("Motor6D") then
								RH.MaxVelocity = 0.2
								RH.DesiredAngle = 1.57
							end
							wait(0.25)
							if LH and LH:IsA("Motor6D") then
								LH.DesiredAngle = 0
							end
							if RH and RH:IsA("Motor6D") then
								RH.DesiredAngle = 0
							end
						end)
					end
					if HatPart and HatPart.Parent and W1 then
						HatPart.CanCollide = true
						Hat2.CanCollide = true
						W1:Destroy()
						local BV = Instance.new("BodyVelocity",HatPart)
						BV.MaxForce = Vector3.new(1000000,1000000,1000000)
						BV.Velocity = (HatPart.CFrame.UpVector*0.45-HatPart.CFrame.LookVector*0.6)*math.min(250,Dif)
						game:GetService("Debris"):AddItem(BV,math.min(10,math.max(0.2,Dif/1500)))
						if Dif >= 20 then
							spawn(function()
								local SoundF = Instance.new("Sound",HatPart)
								SoundF.SoundId = "rbxasset://sounds/electronicpingshort.wav"
								SoundF.Looped = true
								local P = 1.3
								for i = 1,400 do
									if i > 10 and HatPart.Velocity.Y < 5 then
										break
									end
									P = P + math.max(0,0.15-i/400)
									Play(SoundF,P,0.8)
									wait(0.05)
								end
								for i = 1,10 do
									P = P/1.1
									Play(SoundF,P,0.8-i*0.06)
									wait(0.05)
								end
								SoundF:Destroy()
							end)
						end
					end
				end
			end
			Hu.Died:Connect(Died)
			local ChatTimer = 60
			local Text = ""
			local Add = {}
			local ToSay = {}
			local Talking = false
			local Speak = false
			local function Chatted(msg)
				if string.sub(msg,1,3) ~= "/e " then
					msg = game:GetService("Chat"):FilterStringAsync(msg,owner,owner)
					local Current = 0
					local Times = 0
					local MultType = 0
					local Letters = ""
					local Hard = true
					local function Throw()
						if Times >= 4 then
							Current = 9
						end
						table.insert(Add,Letters)
						table.insert(ToSay,Current)
						Current = 0
						Times = 0
						MultType = 0
						Letters = ""
						Hard = true
					end
					if Talking then
						Letters = " "
						Throw()
					else
						Talking = true
					end
					for i = 1,string.len(msg) do
						local txt = string.sub(msg,i,i)
						Letters = Letters..txt
						if Current == 2 or Current == 3 then
							if txt == "." then
								Current = 3
							else
								Throw()
							end
						elseif Current == 4 then
							if txt == "!" then
								Current = 7
							else
								Throw()
							end
						elseif Current == 5 then
							if txt == "?" then
								Current = 7
							else
								Throw()
							end
						elseif txt == "." then
							Current = 2
						elseif txt == "?" then
							Current = 4
						elseif txt == "!" then
							Current = 5
						elseif txt == "," or txt == "-" or txt == ":" or txt == ";" or txt == "~" then
							Throw()
							Throw()
						elseif txt == "#" then
							Current = 6
							Throw()
						elseif txt ~= " " then
							if string.upper(txt) ~= txt then
								Hard = false
							end
							if Times < 4 then
								if string.lower(txt) == "a" then
									if MultType ~= 1 then
										MultType = 1
										Times = 1
									else
										Times = Times + 1
									end
								elseif string.lower(txt) == "e" then
									if MultType ~= 2 then
										MultType = 2
										Times = 1
									else
										Times = Times + 1
									end
								else
									Times = 0
								end
							end
							if Hard then
								Current = 8
							else
								Current = 1
							end
						else
							Throw()
						end
					end
					if Letters ~= "" then
						Throw()
					end
				end
			end
			local Connect = owner.Chatted:Connect(Chatted)
			spawn(function()
				while In and Hu:GetState() ~= Enum.HumanoidStateType.Dead do
					if Hu.RootPart and not Displaying then
						LastCF = Hu.RootPart.CFrame
					end
					wait(0.05)
				end
			end)
			local EquipSpam = 0
			local function ChildAdded(item)
				if item:IsA("Tool") then
					EquipSpam = EquipSpam + 1
					delay(2,function()
						EquipSpam = EquipSpam - 1
					end)
					if In and Hu:GetState() ~= Enum.HumanoidStateType.Dead and Interrupt == 0 and Add[1] == nil and not Speak then
						if item.Name == "Notes" then
							if EquipSpam >= 5 then
								table.insert(Add,"")
								table.insert(ToSay,7)
							elseif EquipSpam >= 3 then
								table.insert(Add,"")
								table.insert(ToSay,8)
							else
								table.insert(Add,"")
								table.insert(ToSay,1)
								table.insert(Add,"")
								table.insert(ToSay,4)
							end
						else
							if EquipSpam >= 5 then
								table.insert(Add,"")
								table.insert(ToSay,3)
							elseif EquipSpam >= 3 then
								table.insert(Add,"")
								table.insert(ToSay,8)
							else
								table.insert(Add,"")
								table.insert(ToSay,1)
								table.insert(Add,"")
								table.insert(ToSay,2)
							end
						end
					end
				end
			end
			Ch.ChildAdded:Connect(ChildAdded)
			spawn(function()
				while In and Hu:GetState() ~= Enum.HumanoidStateType.Dead do
					if Interrupt > 0 or Add[1] == nil then
						ChatTimer = ChatTimer - 1
						if Add[1] == nil and ChatTimer <= 0 then
							Text = ""
							TextB.Text = ""
							Talking = false
						end
						if Interrupt == 0 then
							local Tool = Ch:FindFirstChildWhichIsA("Tool")
							if Tool then
								local A = Tool:FindFirstChild("toolanim")
								if A and A:IsA("StringValue") then
									local ToolAnim = A.Value
									game:GetService("Debris"):AddItem(A,0.2)
									if ToolAnim == "Slash" or ToolAnim == "Lunge" then
										table.insert(Add,"")
										table.insert(ToSay,5)
									end
								end
							end
						end
						wait(0.05)
					else
						Speak = true
						if Add[1] ~= "" then
							ChatTimer = 60
						end
						Text = Text..Add[1]
						TextB.Text = Text
						table.remove(Add,1)
						if ToSay[1] == 1 then
							Blah()
						elseif ToSay[1] == 2 then
							End()
						elseif ToSay[1] == 3 then
							Oh()
						elseif ToSay[1] == 4 then
							Huh()
						elseif ToSay[1] == 5 then
							Wow()
						elseif ToSay[1] == 6 then
							EEE()
						elseif ToSay[1] == 7 then
							Wha()
						elseif ToSay[1] == 8 then
							RoughTalk()
						elseif ToSay[1] == 9 then
							AAH()
						else
							wait(0.05)
						end
						table.remove(ToSay,1)
						if Hu.Health < 100 then
							wait(0.05)
						end
						if Hu.Health <= 75 then
							wait(0.05)
						end
						if Hu.Health <= 50 then
							wait(0.1)
						end
						if Hu.Health <= 25 then
							wait(0.1)
						end
						Speak = false
					end
				end
				if Connect then
					Connect:Disconnect()
				end
			end)
		end
	end
	T.Parent = owner.Backpack
	T.Grip = CFrame.new(0,-0.75,0)
	I.Parent = owner.Backpack
	I.Grip = CFrame.new(1.65,-0.25,0)
	Update()
	local PL = Instance.new("PointLight",H)
	PL.Range = 3
	PL.Shadows = true
	local Neutral = owner.Neutral
	spawn(function()
		if not Pass then
			local App = game:GetService("Players"):GetCharacterAppearanceAsync(owner.UserId)
			fc = "rbxasset://textures/face.png"
			acc = {}
			HM = nil
			HT = nil
			local C = App:GetChildren()
			for i = 1,#C do
				if C[i].Archivable and (C[i]:IsA("Accessory") or C[i]:IsA("Hat") or C[i]:IsA("Shirt") or C[i]:IsA("Pants") or C[i]:IsA("ShirtGraphic")) then
					local Cl = C[i]:Clone()
					table.insert(acc,Cl)
				elseif C[i].Name == "R6" then
					local C2 = C[i]:GetChildren()
					for ii = 1,#C2 do
						local Cl = C2[ii]:Clone()
						table.insert(acc,Cl)
					end
				elseif C[i]:IsA("SpecialMesh") then
					HM = C[i].MeshId
					HT = C[i].TextureId
				elseif C[i]:IsA("Decal") then
					fc = C[i].Texture
				end
			end
			if Neutral then
				Color = App["Body Colors"].TorsoColor
				clr = Color
				TL.TextStrokeColor3 = Color.Color
				if TextB then
					TextB.TextColor3 = Color.Color
				end
				if HatPart then
					HatPart.BrickColor = Color
					Hat2.BrickColor = Color
					Hat4.BrickColor = Color
				end
			end
		end
	end)
	if not Neutral then
		Color = owner.TeamColor
		clr = Color
		H.BrickColor = Color
		PE2.Color = ColorSequence.new(owner.TeamColor.Color,Color3.new(1,1,1))
		TL.TextStrokeColor3 = Color.Color
		if TextB then
			TextB.TextColor3 = Color.Color
		end
		if HatPart then
			HatPart.BrickColor = Color
			Hat2.BrickColor = Color
			Hat3.BrickColor = BrickColor.new(Color3.new(1-Color.Color.r,1-Color.Color.g,1-Color.Color.b))
			Hat4.BrickColor = Color
		end
	end
	local Cast = 0
	local Power = 0
	local SwingId = 0
	local Shoot = false
	local Shots = 0
	local Yah = 0
	local Mana = math.huge
	local Buzz = 0.5
	local BuzzInc = true
	local MeleeHit = {}
	local SwingKnocked = {}
	local SwingPower = 1
	local SwingBlast = false
	owner.Chatted:Connect(function(msg)
	if string.lower(string.sub(msg, 1, 4)) == 'pow/' and tonumber(string.sub(msg, 5, #msg)) ~= nil then
	Power = tonumber(string.sub(msg, 5, #msg))
	PowerIncrease()
	end
	end)
	local function Perform()
		local Character = T.Parent
		local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
		local Player = game:GetService("Players"):GetPlayerFromCharacter(Character)
		if Humanoid and Humanoid.RootPart and Humanoid:GetState() ~= Enum.HumanoidStateType.Dead then
			if Cast == 2 then
				Shoot = 1
				Shots = 5
			elseif Cast == 3 then
				Shoot = 2
			elseif Cast == 4 then
				Shoot = 3
				Shots = 5
			elseif Cast == 5 then
				Shoot = 4
			elseif Cast == 6 then
				Shoot = 5
			elseif Cast == 7 and Mana >= 70 then
				Power = Power + 1
				PowerIncrease()
				PE2.Transparency = NumberSequence.new(math.max(0,0.8-(Power-1)*0.04),math.max(0.1,0.95-(Power-1)*0.04))
				PE3.Color = ColorSequence.new(Color3.new(1,1,0))
				PE3.Acceleration = Vector3.new()
				PE3.Enabled = true
				delay(0.5,function()
					PE3.Enabled = false
				end)
				Mana = Mana - 70
				Cast = 0
			elseif Cast == 8 then
				Shoot = 7
			elseif Cast == 9 then
				Shoot = 8
			else
				if Cast ~= 0 and Cast ~= 1 then
					PE3.Color = ColorSequence.new(Color3.new(1,1,0))
					PE3.Acceleration = Vector3.new(0,-100,0)
					PE3.Enabled = true
					delay(0.5,function()
						PE3.Enabled = false
					end)
					Fail()
				end
				Cast = 0
			end
		end
	end
	local function Activated()
		local Character = T.Parent
		local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
		local Player = game:GetService("Players"):GetPlayerFromCharacter(Character)
		if Humanoid and Humanoid.RootPart and Humanoid:GetState() ~= Enum.HumanoidStateType.Dead then
			SwingPower = Power
			SwingBlast = false
			if Shoot then
				local toolanim = Instance.new("StringValue",T)
				toolanim.Name = "toolanim"
				toolanim.Value = "Lunge"
				local Size = Humanoid.RootPart.Size.Magnitude/3
				local From = Humanoid.RootPart.CFrame*CFrame.new(Humanoid.RootPart.Size.X*0.75,Humanoid.RootPart.Size.Y*0.25,Humanoid.RootPart.Size.Z*-3)
				local Aim = CFrame.new(0,-15,-100)
				if Power > 10 then
					Aim = CFrame.new(0,-8,-100)
				end
				local Air = false
				local Move = false
				local Dir = false
				if Humanoid.Jump or Humanoid:GetState() == Enum.HumanoidStateType.Jumping or Humanoid:GetState() == Enum.HumanoidStateType.Freefall or Humanoid:GetState() == Enum.HumanoidStateType.Climbing then
					Air = true
				end
				if Humanoid.MoveDirection.X ~= 0 or Humanoid.MoveDirection.Z ~= 0 then
					Move = true
				end
				if Air and not Move then
					Aim = CFrame.new(0,100,0)
				elseif Move then
					Aim = CFrame.new(0,0,-100)
				end
				if (not Humanoid.AutoRotate or Humanoid.WalkSpeed < 0.005 or Humanoid:GetState() == Enum.HumanoidStateType.FallingDown or Humanoid:GetState() == Enum.HumanoidStateType.Ragdoll or Humanoid:GetState() == Enum.HumanoidStateType.Physics or Humanoid:GetState() == Enum.HumanoidStateType.PlatformStanding or Humanoid:GetState() == Enum.HumanoidStateType.Seated or Humanoid:GetState() == Enum.HumanoidStateType.Swimming) and Move then
					Dir = true
				end
				T.Grip = CFrame.new(0,-0.75,0,1,0,0,1)
				PE3.Enabled = true
				PE3.Acceleration = Vector3.new()
				Yah = Yah + 1
				delay(0.5,function()
					Yah = Yah - 1
					if (Cast == 0 or Shots > 0) and Yah == 0 then
						T.Grip = CFrame.new(0,-0.75,0)
					end
					PE3.Enabled = false
				end)
				local StoredPower = Power
				local Stored = Cast
				local StoredShots = Shots
				Shots = Shots - 1
				if Shots < 1 then
					Shots = 0
					Power = math.max(1,Power-1)
					Cast = 0
					Shoot = false
				end
				PE2.Transparency = NumberSequence.new(math.max(0,0.8-(Power-1)*0.04),math.max(0.1,0.95-(Power-1)*0.04))
				if Stored == 2 then
					PE3.Color = ColorSequence.new(Color3.new(1,0.5,0))
				elseif Stored == 3 then
					PE3.Color = ColorSequence.new(Color3.new(1,1,1))
				elseif Stored == 4 then
					PE3.Color = ColorSequence.new(Color3.new(0.2,0.8,1))
				elseif Stored == 5 then
					PE3.Color = ColorSequence.new(Color3.new(0,1,0))
				elseif Stored == 6 then
					PE3.Color = ColorSequence.new(Color3.new(0.1,0.2,1))
				elseif Stored == 8 then
					PE3.Color = ColorSequence.new(Color3.new(1,0.5,1))
				elseif Stored == 9 then
					PE3.Color = ColorSequence.new(Color3.new(1,0.2,0.2))
				end
				if Stored == 2 and Mana >= 10 then
					FireBlast()
					Mana = Mana - 10
					local Shot = Instance.new("Part",script)
					Shot.Name = "Fire"
					Shot.Locked = true
					Shot.CanCollide = false
					Shot.Size = Vector3.new(1,1,3)*Size
					if Dir then
						Shot.CFrame = CFrame.new(From.Position,From.Position+Humanoid.MoveDirection*100)
					else
						Shot.CFrame = CFrame.new(From.Position,(From*Aim).Position)
					end
					Shot.BrickColor = BrickColor.new("Neon orange")
					Shot.Material = Enum.Material.Neon
					Shot.Velocity = Shot.CFrame.LookVector*160*Size
					Shot:SetNetworkOwner(nil)
					local L = Instance.new("PointLight",Shot)
					L.Color = Shot.Color
					L.Brightness = 10
					L.Range = 12
					L.Shadows = true
					local BV = Instance.new("BodyVelocity",Shot)
					BV.Velocity = Shot.CFrame.LookVector*160*Size
					BV.MaxForce = Vector3.new(400000,400000,400000)
					local BG = Instance.new("BodyGyro",Shot)
					BG.CFrame = Shot.CFrame
					BG.MaxTorque = Vector3.new(4000000,4000000,4000000)
					game:GetService("Debris"):AddItem(Shot,30)
					local Dont = Character
					local Attacker = Player
					local Kaboom = StoredPower > 6 and StoredShots > 3
					local Collided = false
					local Blast = false
					local Hit = {}
					local Active = true
					local function Touched(hit)
						if hit and hit.Parent and (Dont == nil or not hit:IsDescendantOf(Dont)) then
							local H = hit.Parent:FindFirstChildWhichIsA("Humanoid")
							if H and not table.find(Hit,H) then
								local Stored = H.Health
								local creator = Instance.new("ObjectValue",H)
								creator.Name = "creator"
								if Attacker and Attacker.Parent then
									creator.Value = Attacker
								end
								game:GetService("Debris"):AddItem(creator,0.1)
								H:TakeDamage(17+3^StoredPower)
								if H.Health >= Stored then
									if Active then
										Active = false
										Deflect(hit.Position)
										delay(0.1,function()
											Active = true
										end)
									end
									DefCount = DefCount + 1
									LDefCount = LDefCount + 1
									NotifyBlock()
									Update()
									Dont = hit.Parent
									Attacker = game:GetService("Players"):GetPlayerFromCharacter(hit.Parent)
									if (Shot.Position-hit.Position).Magnitude > 0 then
										Shot.Velocity = -Shot.Velocity
										BV.Velocity = -BV.Velocity
									end
								else
									if StoredPower > 2 then
										H.Sit = false
									end
									HitCount = HitCount + 1
									LHitCount = LHitCount + 1
									DamageDone = DamageDone + math.max(0,math.min(math.ceil(Stored),17+3^StoredPower))
									LDamageDone = LDamageDone + math.max(0,math.min(math.ceil(Stored),17+3^StoredPower))
									if Stored > 0 and H.Health <= 0 then
										ConfirmLast = ConfirmLast + 1
										LConfirmLast = LConfirmLast + 1
										NotifyKO()
									else
										NotifyHit()
									end
									Update()
									if 17+3^StoredPower >= 60 then
										Damages(hit.Position)
									else
										Hurt(hit.Position)
									end
									table.insert(Hit,H)
									Collided = true
								end
							elseif (not hit:IsA("Terrain") or table.find(Shot:GetTouchingParts(),hit)) and hit.CanCollide then
								Collided = true
							end
							if Collided and not Blast then
								Blast = true
								if StoredPower < 3 then
									PlayFX("C",0.15,1,Shot.Position)
									Shot:Destroy()
									local P = Instance.new("Part",script)
									P.Name = "Smoke"
									P.Shape = Enum.PartType.Ball
									P.Size = Vector3.new(2,2,2)*Size
									P.Transparency = 0.1
									P.Material = Enum.Material.Neon
									P.Position = Shot.Position
									P.Anchored = true
									P.Locked = true
									P.CanCollide = false
									local Colors = {Color.Name,"Bright red",Color.Name,"Bright red",Color.Name,"Bright red","Crimson","Dark stone grey","Black","Really black"}
									for i = 1,10 do
										P.BrickColor = BrickColor.new(Colors[i])
										wait(0.05)
										P.Transparency = P.Transparency + 0.075
										P.Position = P.Position + Vector3.new(0,0.2,0)
									end
									P:Destroy()
								elseif StoredShots > 3 then
									local P = Instance.new("Part",script)
									P.Name = "Fire"
									P.Shape = Enum.PartType.Ball
									P.Size = Vector3.new(3,3,3)*(StoredPower-2)*Size
									P.Material = Enum.Material.Neon
									P.Position = Shot.Position
									P.Anchored = true
									P.Locked = true
									P.CanCollide = false
									local P2 = Instance.new("Part",script)
									P2.Name = "FireEffect"
									P2.Shape = Enum.PartType.Ball
									P2.Size = Vector3.new(3,3,3)*(StoredPower-2)*Size
									P2.Material = Enum.Material.Neon
									P2.Position = Shot.Position
									P2.Anchored = true
									P2.Locked = true
									P2.CanCollide = false
									local M = Instance.new("SpecialMesh",P)
									M.MeshType = Enum.MeshType.Sphere
									M.Scale = Vector3.new(0.5,0.5,0.5)
									local M2 = Instance.new("SpecialMesh",P2)
									M2.MeshType = Enum.MeshType.Sphere
									M2.Scale = Vector3.new(0.5,0.5,0.5)
									local function Touched(hit)
										if hit and hit.Parent then
											local H = hit.Parent:FindFirstChildWhichIsA("Humanoid")
											if H and not table.find(Hit,H) then
												local Stored = H.Health
												local creator = Instance.new("ObjectValue",H)
												creator.Name = "creator"
												if Attacker and Attacker.Parent then
													creator.Value = Attacker
												end
												game:GetService("Debris"):AddItem(creator,0.1)
												H:TakeDamage(17+3^StoredPower)
												table.insert(Hit,H)
												if H.Health >= Stored then
													Deflect(hit.Position)
													DefCount = DefCount + 1
													LDefCount = LDefCount + 1
													NotifyBlock()
													Update()
												else
													HitCount = HitCount + 1
													LHitCount = LHitCount + 1
													DamageDone = DamageDone + math.max(0,math.min(math.ceil(Stored),17+3^StoredPower))
													LDamageDone = LDamageDone + math.max(0,math.min(math.ceil(Stored),17+3^StoredPower))
													if Stored > 0 and H.Health <= 0 then
														ConfirmLast = ConfirmLast + 1
														LConfirmLast = LConfirmLast + 1
														NotifyKO()
													else
														NotifyHit()
													end
													Update()
													if StoredPower > 2 then
														H.Sit = false
													end
													if 17+3^StoredPower >= 60 then
														Damages(hit.Position)
													else
														Hurt(hit.Position)
													end
												end
											end
										end
									end
									P.Touched:Connect(Touched)
									if Kaboom then
										P.Name = "Explosion"
										local E = Instance.new("Explosion",workspace)
										E.BlastRadius = 0.75*(StoredPower-2)*Size
										E.BlastPressure = 3500000
										E.Position = P.Position
										E.Hit:Connect(function(part)
											if part and part.Parent and part.Parent:FindFirstChildWhichIsA("ForceField") == nil then
												local H = part.Parent:FindFirstChildWhichIsA("Humanoid")
												if H and H:GetState() ~= Enum.HumanoidStateType.Dead then
													if part.Name == "Torso" or part.Name == "UpperTorso" then
														ExplosiveFinish = ExplosiveFinish + 1
														LExplosiveFinish = LExplosiveFinish + 1
														NotifyKaboom()
														Update()
													end
												end
											end
											Touched(part)
										end)
										Explode(P.Position)
									else
										FireBurst(P.Position)
									end
									local P1 = Instance.new("SurfaceLight",P)
									P1.Angle = 130
									P1.Brightness = 40
									P1.Range = 30+StoredPower*2*Size
									P1.Shadows = true
									local F = Enum.NormalId:GetEnumItems()
									local L = {}
									for a = 1,#F do
										local Light = P1
										if a > 1 then
											Light = P1:Clone()
											Light.Parent = P
										end
										Light.Face = F[a]
										table.insert(L,Light)
									end
									for i = 1,10 do
										P.BrickColor = BrickColor.new("Bright red")
										M.Scale = Vector3.new(1,1,1)
										P.Transparency = 0.55-i/20+0.1
										if Kaboom and i < 10 and i%2 == 0 then
											P.Transparency = 0
											P.BrickColor = BrickColor.new("Cool yellow")
											M.Scale = Vector3.new(0.5,0.5,0.5)
										elseif i%2 == 0 then
											P.BrickColor = Color
										end
										P2.Transparency = 0.55-i/20
										P2.BrickColor = BrickColor.new("Neon orange")
										if i%2 == 1 then
											P2.BrickColor = Color
										end
										M2.Scale = Vector3.new(0.25+i*0.05,0.25+i*0.05,0.25+i*0.05)
										if i > 5 then
											for a = 1,#L do
												L[a].Color = P.Color
												L[a].Brightness = L[a].Brightness - 4
											end
										end
										local T = P:GetTouchingParts()
										for a = 1,#T do
											Touched(T[a])
										end
										wait(0.05)
									end
									P.Transparency = 0.1
									P2.Transparency = 0
									for i = 1,5 do
										P.BrickColor = BrickColor.new("Bright red")
										P.Transparency = P.Transparency + 0.2
										if i%2 == 0 then
											P.BrickColor = Color
										end
										P2.BrickColor = BrickColor.new("Neon orange")
										P2.Transparency = P2.Transparency + 0.2
										if i%2 == 1 then
											P2.BrickColor = Color
										end
										for a = 1,#L do
											L[a].Color = P2.Color
											L[a].Brightness = L[a].Brightness - 4
										end
										local T = P:GetTouchingParts()
										for a = 1,#T do
											Touched(T[a])
										end
										wait(0.05)
									end
									P:Destroy()
									P2:Destroy()
								end
							end
						end
					end
					Shot.Touched:Connect(Touched)
					local Travel = 0
					while Shot.Parent do
						Travel = Travel + 1
						if Travel < 38 and not Collided then
							PlayFX("C",2-Travel*0.05,0.5,Shot.Position)
						end
						if Travel%3 == 0 then
							Shot.BrickColor = BrickColor.new("Neon orange")
						elseif Travel%3 == 1 then
							Shot.BrickColor = BrickColor.new("Bright red")
							if Kaboom then
								Shot.BrickColor = BrickColor.new("White")
							end
						else
							Shot.BrickColor = Color
						end
						L.Color = Shot.Color
						wait(0.05)
					end
				elseif Stored == 3 and Mana >= 10 then
					Mana = Mana - 10
					AirBurst(Humanoid.RootPart.Position)
					if Move or Air then
						Humanoid.Sit = false
						Humanoid.PlatformStand = false
						local BV = Humanoid.RootPart:FindFirstChildWhichIsA("BodyVelocity")
						if BV then
							BV:Destroy()
						end
						BV = Instance.new("BodyVelocity",Humanoid.RootPart)
						BV.MaxForce = Vector3.new(1000000,1000000,1000000)
						BV.Velocity = Humanoid.RootPart.CFrame.LookVector*(32+4*StoredPower)*Size
						if Dir then
							BV.Velocity = Humanoid.MoveDirection*(32+4*StoredPower)*Size
						end
						if not Move then
							BV.Velocity = Vector3.new()
						end
						if Air then
							BV.Velocity = BV.Velocity + Vector3.new(0,32+4*StoredPower,0)*Size
						end
						game:GetService("Debris"):AddItem(BV,0.8)
					end
					local P = Instance.new("Part",script)
					P.Name = "Pressure"
					P.Shape = Enum.PartType.Ball
					P.Size = Vector3.new(1,1,1)*StoredPower*Size
					P.Transparency = 1
					P.Material = Enum.Material.Glass
					P.Position = Humanoid.RootPart.Position
					P.Anchored = true
					P.Locked = true
					P.CanCollide = false
					local Dont = Character
					local Attacker = Player
					local Hit = {}
					local Knocked = {}
					local function Touched(hit)
						if hit and hit.Parent and (Dont == nil or not hit:IsDescendantOf(Dont)) then
							local H = hit.Parent:FindFirstChildWhichIsA("Humanoid")
							if H and not table.find(Hit,H) then
								local Stored = H.Health
								local creator = Instance.new("ObjectValue",H)
								creator.Name = "creator"
								if Attacker and Attacker.Parent then
									creator.Value = Attacker
								end
								game:GetService("Debris"):AddItem(creator,0.1)
								H:TakeDamage(2+(2^StoredPower)/2)
								table.insert(Hit,H)
								if H.Health >= Stored then
									Deflect(hit.Position)
									DefCount = DefCount + 1
									LDefCount = LDefCount + 1
									NotifyBlock()
									Update()
								else
									HitCount = HitCount + 1
									LHitCount = LHitCount + 1
									DamageDone = DamageDone + math.max(0,math.min(math.ceil(Stored),2+(2^StoredPower)/2))
									LDamageDone = LDamageDone + math.max(0,math.min(math.ceil(Stored),2+(2^StoredPower)/2))
									if Stored > 0 and H.Health <= 0 then
										ConfirmLast = ConfirmLast + 1
										LConfirmLast = LConfirmLast + 1
										NotifyKO()
									else
										NotifyHit()
									end
									Update()
									if 2+(2^StoredPower)/2 >= 60 then
										Damages(hit.Position)
									else
										Hurt(hit.Position)
									end
								end
							end
							if not table.find(Knocked,hit) then
								table.insert(Knocked,hit)
								if (hit.Position-P.Position).Magnitude > 0 then
									local BV = Instance.new("BodyVelocity",hit)
									BV.MaxForce = Vector3.new(1000000,1000000,1000000)
									BV.Velocity = (hit.Position-P.Position).Unit*20*StoredPower*Size
									game:GetService("Debris"):AddItem(BV,0.2)
								end
								if StoredPower > 2 and not hit.Anchored then
									local BAV = Instance.new("BodyAngularVelocity",hit)
									BAV.AngularVelocity = Vector3.new(math.random(-100,100),math.random(-100,100),math.random(-100,100))
									BAV.MaxTorque = Vector3.new(4000000,4000000,4000000)
									game:GetService("Debris"):AddItem(BAV,0.2)
								end
							end
						end
					end
					P.Touched:Connect(Touched)
					for i = 1,10 do
						P.Transparency = P.Transparency - 0.05
						P.Size = P.Size + Vector3.new(0.5,0.5,0.5)*StoredPower*Size
						if i%2 == 0 then
							P.BrickColor = BrickColor.new("Mid gray")
						else
							P.BrickColor = Color
						end
						local T = P:GetTouchingParts()
						for a = 1,#T do
							Touched(T[a])
						end
						wait(0.05)
					end
					for i = 1,5 do
						P.Transparency = P.Transparency + 0.1
						if i%2 == 0 then
							P.BrickColor = BrickColor.new("Mid gray")
						else
							P.BrickColor = Color
						end
						local T = P:GetTouchingParts()
						for a = 1,#T do
							Touched(T[a])
						end
						wait(0.05)
					end
					P:Destroy()
				elseif Stored == 4 and Mana >= 10 then
					Mana = Mana - 10
					IceShot()
					local Shot = Instance.new("Part",script)
					Shot.Name = "Ice"
					Shot.Locked = true
					Shot.CanCollide = false
					Shot.Size = Vector3.new(2,2,2)*Size
					Shot.Material = Enum.Material.Neon
					Shot.Transparency = 0.7
					Shot.Shape = Enum.PartType.Ball
					local E1 = Instance.new("Part",Shot)
					E1.Name = "IceEffect"
					E1.Locked = true
					E1.CanCollide = false
					E1.Size = Vector3.new(0.5,2.5,0.5)*Size
					E1.Material = Enum.Material.Ice
					local E2 = Instance.new("Part",Shot)
					E2.Name = "IceEffect"
					E2.Locked = true
					E2.CanCollide = false
					E2.Size = Vector3.new(2.5,0.5,0.5)*Size
					E2.Material = Enum.Material.Ice
					local E3 = Instance.new("Part",Shot)
					E3.Name = "IceEffect"
					E3.Locked = true
					E3.CanCollide = false
					E3.Size = Vector3.new(0.5,0.5,2.5)*Size
					E3.Material = Enum.Material.Ice
					local W1 = Instance.new("Weld",Shot)
					W1.Part0 = Shot
					W1.Part1 = E1
					local W2 = Instance.new("Weld",Shot)
					W2.Part0 = Shot
					W2.Part1 = E2
					local W3 = Instance.new("Weld",Shot)
					W3.Part0 = Shot
					W3.Part1 = E3
					if Dir then
						Shot.CFrame = CFrame.new(From.Position,From.Position+Humanoid.MoveDirection*100)
					else
						Shot.CFrame = CFrame.new(From.Position,(From*Aim).Position)
					end
					Shot.BrickColor = BrickColor.new("Medium blue")
					E1.BrickColor = Shot.BrickColor
					E2.BrickColor = Shot.BrickColor
					E3.BrickColor = Shot.BrickColor
					Shot.Material = Enum.Material.Neon
					Shot.Velocity = Shot.CFrame.LookVector*160*Size
					Shot:SetNetworkOwner(nil)
					local L = Instance.new("PointLight",Shot)
					L.Color = Shot.Color
					L.Brightness = 10
					L.Range = 12
					L.Shadows = true
					local BV = Instance.new("BodyVelocity",Shot)
					BV.Velocity = Shot.CFrame.LookVector*160*Size
					BV.MaxForce = Vector3.new(400000,400000,400000)
					local BAV = Instance.new("BodyAngularVelocity",Shot)
					BAV.AngularVelocity = Vector3.new(math.random(-10,10),math.random(-10,10),math.random(-10,10))
					BAV.MaxTorque = Vector3.new(4000000,4000000,4000000)
					game:GetService("Debris"):AddItem(Shot,30)
					local Dont = Character
					local Attacker = Player
					local Collided = false
					local Blast = false
					local Hit = {}
					local Active = true
					local function Touched(hit)
						if hit and hit.Parent and (Dont == nil or not hit:IsDescendantOf(Dont)) then
							local H = hit.Parent:FindFirstChildWhichIsA("Humanoid")
							if H and not table.find(Hit,H) then
								local Stored = H.Health
								local creator = Instance.new("ObjectValue",H)
								creator.Name = "creator"
								if Attacker and Attacker.Parent then
									creator.Value = Attacker
								end
								game:GetService("Debris"):AddItem(creator,0.1)
								H:TakeDamage(4+2^StoredPower)
								if H.Health >= Stored then
									if Active then
										Active = false
										Deflect(hit.Position)
										delay(0.1,function()
											Active = true
										end)
									end
									DefCount = DefCount + 1
									LDefCount = LDefCount + 1
									NotifyBlock()
									Update()
									Dont = hit.Parent
									Attacker = game:GetService("Players"):GetPlayerFromCharacter(hit.Parent)
									if (Shot.Position-hit.Position).Magnitude > 0 then
										Shot.Velocity = -Shot.Velocity
										BV.Velocity = -BV.Velocity
									end
								else
									if StoredPower > 1 then
										local Tag = hit.Parent:FindFirstChild("ImCold")
										if not (Tag and Tag:IsA("NumberValue")) or Tag.Value <= 100 then
											H.Sit = true
										end
									end
									HitCount = HitCount + 1
									LHitCount = LHitCount + 1
									DamageDone = DamageDone + math.max(0,math.min(math.ceil(Stored),4+2^StoredPower))
									LDamageDone = LDamageDone + math.max(0,math.min(math.ceil(Stored),4+2^StoredPower))
									if Stored > 0 and H.Health <= 0 then
										ConfirmLast = ConfirmLast + 1
										LConfirmLast = LConfirmLast + 1
										NotifyKO()
									else
										NotifyHit()
									end
									Update()
									if 4+2^StoredPower >= 60 then
										Damages(hit.Position)
									else
										Hurt(hit.Position)
									end
									table.insert(Hit,H)
									if StoredPower > 2 then
										local Amount = 20*StoredPower
										Cold(H,hit.Parent,Amount)
									end
									Collided = true
								end
							elseif (not hit:IsA("Terrain") or table.find(Shot:GetTouchingParts(),hit)) and hit.CanCollide then
								Collided = true
							end
							if Collided and not Blast then
								Blast = true
								if StoredPower < 3 then
									PlayFX("C",1.2,1,Shot.Position)
									Shot:Destroy()
									local P = Instance.new("Part",script)
									P.Name = "Frost"
									P.Shape = Enum.PartType.Ball
									P.Size = Vector3.new(2,2,2)*Size
									P.Transparency = 0.1
									P.Material = Enum.Material.Neon
									P.Position = Shot.Position
									P.Anchored = true
									P.Locked = true
									P.CanCollide = false
									local Colors = {Color.Name,"Medium blue",Color.Name,"Medium blue",Color.Name,"Medium blue","Pastel Blue","White","Medium blue","Dark blue"}
									for i = 1,10 do
										P.BrickColor = BrickColor.new(Colors[i])
										wait(0.05)
										P.Transparency = P.Transparency + 0.075
										P.Position = P.Position + Vector3.new(0,0.2,0)
									end
									P:Destroy()
								elseif StoredShots > 3 then
									local P = Instance.new("Part",script)
									P.Name = "Ice"
									P.Shape = Enum.PartType.Ball
									P.Size = Vector3.new(3,3,3)*(StoredPower-2)*Size
									P.Material = Enum.Material.Ice
									P.Position = Shot.Position
									P.Anchored = true
									P.Locked = true
									P.CanCollide = false
									local P2 = Instance.new("Part",script)
									P2.Name = "IceEffect"
									P2.Shape = Enum.PartType.Ball
									P2.Size = Vector3.new(3,3,3)*(StoredPower-2)*Size
									P2.Material = Enum.Material.Neon
									P2.Position = Shot.Position
									P2.Anchored = true
									P2.Locked = true
									P2.CanCollide = false
									local M = Instance.new("SpecialMesh",P)
									M.MeshType = Enum.MeshType.Sphere
									M.Scale = Vector3.new(0.5,0.5,0.5)
									local M2 = Instance.new("SpecialMesh",P2)
									M2.MeshType = Enum.MeshType.Sphere
									M2.Scale = Vector3.new(0.5,0.5,0.5)
									local function Touched(hit)
										if hit and hit.Parent then
											local H = hit.Parent:FindFirstChildWhichIsA("Humanoid")
											if H and not table.find(Hit,H) then
												local Stored = H.Health
												local creator = Instance.new("ObjectValue",H)
												creator.Name = "creator"
												if Attacker and Attacker.Parent then
													creator.Value = Attacker
												end
												game:GetService("Debris"):AddItem(creator,0.1)
												H:TakeDamage(4+2^StoredPower)
												table.insert(Hit,H)
												if H.Health >= Stored then
													Deflect(hit.Position)
													DefCount = DefCount + 1
													LDefCount = LDefCount + 1
													NotifyBlock()
													Update()
												else
													if StoredPower > 1 then
														local Tag = hit.Parent:FindFirstChild("ImCold")
														if not (Tag and Tag:IsA("NumberValue")) or Tag.Value <= 100 then
															H.Sit = true
														end
													end
													HitCount = HitCount + 1
													LHitCount = LHitCount + 1
													DamageDone = DamageDone + math.max(0,math.min(math.ceil(Stored),4+2^StoredPower))
													LDamageDone = LDamageDone + math.max(0,math.min(math.ceil(Stored),4+2^StoredPower))
													if Stored > 0 and H.Health <= 0 then
														ConfirmLast = ConfirmLast + 1
														LConfirmLast = LConfirmLast + 1
														NotifyKO()
													else
														NotifyHit()
													end
													Update()
													if 4+2^StoredPower >= 60 then
														Damages(hit.Position)
													else
														Hurt(hit.Position)
													end
													if StoredPower > 2 then
														local Amount = 20*StoredPower
														Cold(H,hit.Parent,Amount)
													end
												end
											end
										end
									end
									P.Touched:Connect(Touched)
									Shatter(P.Position)
									for i = 1,10 do
										P.BrickColor = BrickColor.new("Cyan")
										M.Scale = Vector3.new(1,1,1)
										P.Transparency = 0.55-i/20+0.1
										if i%2 == 0 then
											P.BrickColor = Color
										end
										P2.Transparency = 0.55-i/20
										P2.BrickColor = BrickColor.new("Pastel Blue")
										if i%2 == 1 then
											P2.BrickColor = Color
										end
										M2.Scale = Vector3.new(0.25+i*0.05,0.25+i*0.05,0.25+i*0.05)
										local T = P:GetTouchingParts()
										for a = 1,#T do
											Touched(T[a])
										end
										wait(0.05)
									end
									P.Transparency = 0.1
									P2.Transparency = 0
									for i = 1,5 do
										P.BrickColor = BrickColor.new("Cyan")
										P.Transparency = P.Transparency + 0.2
										if i%2 == 0 then
											P.BrickColor = Color
										end
										P2.BrickColor = BrickColor.new("Pastel Blue")
										P2.Transparency = P2.Transparency + 0.2
										if i%2 == 1 then
											P2.BrickColor = Color
										end
										local T = P:GetTouchingParts()
										for a = 1,#T do
											Touched(T[a])
										end
										wait(0.05)
									end
									P:Destroy()
									P2:Destroy()
								end
							end
						end
					end
					Shot.Touched:Connect(Touched)
					local Travel = 0
					while Shot.Parent do
						Travel = Travel + 1
						if Travel < 40 and not Collided then
							PlayFX("C",0.35-Travel*0.005,0.25-Travel*0.005,Shot.Position)
						end
						if Travel%3 == 0 then
							Shot.BrickColor = BrickColor.new("Steel blue")
						elseif Travel%3 == 1 then
							Shot.BrickColor = BrickColor.new("Medium blue")
							if StoredPower > 2 and StoredShots > 3 then
								Shot.BrickColor = BrickColor.new("White")
							end
						else
							Shot.BrickColor = Color
						end
						L.Color = Shot.Color
						wait(0.05)
					end
				elseif Stored == 5 and Mana >= 100 then
					Mana = Mana - 100
					PE4.Color = ColorSequence.new(Color3.new(1,1,0))
					PE4.Size = NumberSequence.new(0.4*StoredPower,0.4*StoredPower)
					PE4.Speed = NumberRange.new(0,15*StoredPower)
					PE4.Acceleration = Vector3.new(0,5*StoredPower,0)
					PE4.Rate = StoredPower*200
					local e = Color3.new(0,1,0)
					local E = Color.Color
					local c = ColorSequenceKeypoint.new
					local CS = ColorSequence.new({c(0,e),c(0.1,E),c(0.2,e),c(0.3,E),c(0.4,e),c(0.5,E),c(0.6,e),c(0.7,E),c(0.8,e),c(0.9,E),c(1,e)})
					PE4.Color = CS
					PE4.Enabled = true
					delay(0.2,function()
						PE4.Enabled = false
					end)
					Healing()
					local Healed = {}
					local P = Instance.new("Part",script)
					P.Name = "Heal"
					P.Shape = Enum.PartType.Ball
					P.Size = Vector3.new(1,1,1)*StoredPower*Size
					P.Transparency = 1
					P.Material = Enum.Material.Neon
					P.Position = Humanoid.RootPart.Position
					P.Anchored = true
					P.Locked = true
					P.CanCollide = false
					P.BrickColor = BrickColor.new("Lime green")
					local function Touched(hit)
						if hit and hit.Parent then
							local H = hit.Parent:FindFirstChildWhichIsA("Humanoid")
							if H and H:GetState() ~= Enum.HumanoidStateType.Dead and not table.find(Healed,H) then
								table.insert(Healed,H)
								if H.Health + 15*StoredPower < H.MaxHealth then
									HealthHealed = HealthHealed + 15*StoredPower
									LHealthHealed = LHealthHealed + 15*StoredPower
									NotifyHeal()
									Update()
									H.Health = H.Health + 15*StoredPower
									Recover()
								elseif H.Health < H.MaxHealth then
									HealthHealed = HealthHealed + math.ceil(H.MaxHealth-H.Health)
									LHealthHealed = LHealthHealed + math.ceil(H.MaxHealth-H.Health)
									NotifyHeal2()
									Update()
									H.Health = H.MaxHealth
									Recover()
								end
							end
						end
					end
					P.Touched:Connect(Touched)
					for i = 1,10 do
						P.Transparency = P.Transparency - 0.1
						P.Size = P.Size + Vector3.new(0.5,0.5,0.5)*math.min(StoredPower,20)*Size
						if i%3 ~= 0 then
							P.BrickColor = BrickColor.new("Lime green")
						else
							P.BrickColor = Color
						end
						local T = P:GetTouchingParts()
						for a = 1,#T do
							Touched(T[a])
						end
						wait(0.05)
					end
					for i = 1,5 do
						P.Transparency = P.Transparency + 0.2
						if i%3 ~= 2 then
							P.BrickColor = BrickColor.new("Lime green")
						else
							P.BrickColor = Color
						end
						local T = P:GetTouchingParts()
						for a = 1,#T do
							Touched(T[a])
						end
						wait(0.05)
					end
					P:Destroy()
				elseif Stored == 6 and Mana >= 150 then
					Mana = Mana - 150
					Shield()
					ApplyShield(Character,Humanoid,Size,StoredPower,StoredPower*100/4,Color)
				elseif Stored == 8 and Mana >= 50 then
					Mana = Mana - 50
					if StoredPower > 2 then
						BlockThrow()
					end
					local Shot = Instance.new("Part",script)
					Shot.Name = "Block"
					Shot.Locked = true
					Shot.Size = Vector3.new(8,8,8)*Size
					Shot.CFrame = Humanoid.RootPart.CFrame*CFrame.new(0,2,-7*Size)
					if Dir then
						Shot.Velocity = Humanoid.MoveDirection*32*StoredPower*Size
					else
						Shot.Velocity = CFrame.new(From.Position,(From*Aim).Position).LookVector*32*StoredPower*Size
					end
					Shot.BrickColor = BrickColor.new("Pink")
					Shot.Material = Enum.Material.Neon
					local Round = false
					local Sel
					if not Air and not Move then
						Sel = Instance.new("SelectionSphere",Shot)
						Sel.Transparency = 0.3
						Shot.Shape = Enum.PartType.Ball
						Shot.Name = "Ball"
						Round = true
					else
						Sel = Instance.new("SelectionBox",Shot)
					end
					Sel.Color3 = Color3.new(1,0.5,0)
					Sel.Adornee = Shot
					local L = Instance.new("PointLight",Shot)
					L.Color = Shot.Color
					L.Brightness = 10
					L.Range = 12
					L.Shadows = true
					local After = false
					delay(270,function()
						After = true
						Shot.BrickColor = BrickColor.new("Royal purple")
						L.Color = Shot.Color
						wait(300)
						for i = 1,20 do
							for a = 1,5 do
								Shot.Transparency = 0.5-a*0.1
								wait(0.05)
							end
							wait(0.75)
						end
						for i = 1,20 do
							Shot.Transparency = 1
							wait(0.25)
							Shot.Transparency = 0
							wait(0.25)
						end
						Shot:Destroy()
					end)
					local Dont = Character
					local Attacker = Player
					local Hit = {}
					local Active = true
					local Settled = false
					local Heavy = StoredPower >= 10
					if Heavy then
						if math.random(1,2) == 1 then
							Shot.Material = Enum.Material.DiamondPlate
						else
							Shot.Material = Enum.Material.CorrodedMetal
						end
					end
					local Connect
					spawn(function()
						while not Settled and Shot.Parent do
							Shot.BrickColor = BrickColor.new("Pink")
							L.Color = Shot.Color
							wait(0.1)
							if Settled then
								break
							end
							Shot.BrickColor = Color
							L.Color = Shot.Color
							wait(0.1)
						end
					end)
					local function Touched(hit)
						if hit and hit.Parent and (Dont == nil or not hit:IsDescendantOf(Dont)) then
							local H = hit.Parent:FindFirstChildWhichIsA("Humanoid")
							if H and not table.find(Hit,H) then
								local Stored = H.Health
								local creator = Instance.new("ObjectValue",H)
								creator.Name = "creator"
								if Attacker and Attacker.Parent then
									creator.Value = Attacker
								end
								game:GetService("Debris"):AddItem(creator,0.1)
								H:TakeDamage(30+3^StoredPower)
								table.insert(Hit,H)
								if H.Health >= Stored then
									Deflect(hit.Position)
									DefCount = DefCount + 1
									LDefCount = LDefCount + 1
									NotifyBlock()
									Update()
								else
									if StoredPower > 1 then
										local Tag = hit.Parent:FindFirstChild("ImCold")
										if not (Tag and Tag:IsA("NumberValue")) or Tag.Value <= 100 then
											H.Sit = true
										end
									end
									HitCount = HitCount + 1
									LHitCount = LHitCount + 1
									DamageDone = DamageDone + math.max(0,math.min(math.ceil(Stored),30+3^StoredPower))
									LDamageDone = LDamageDone + math.max(0,math.min(math.ceil(Stored),30+3^StoredPower))
									if Stored > 0 and H.Health <= 0 then
										ConfirmLast = ConfirmLast + 1
										LConfirmLast = LConfirmLast + 1
										NotifyKO()
									else
										NotifyHit()
									end
									Update()
									if 30+3^StoredPower >= 60 then
										Damages(hit.Position)
									else
										Hurt(hit.Position)
									end
									table.insert(Hit,H)
								end
								if Heavy then
									if Round then
										Ting(Shot.Position)
									else
										Ftwang(Shot.Position)
									end
								end
								wait(0.75)
								if Shot.Velocity.Magnitude < 32 and Connect and not Settled then
									Connect:Disconnect()
									Settled = true
									Shot.Material = Enum.Material.Neon
									spawn(function()
										for i = 1,3 do
											Shot.BrickColor = BrickColor.new("White")
											L.Color = Shot.Color
											wait(0.05)
											Shot.BrickColor = BrickColor.new("Royal purple")
											L.Color = Shot.Color
											wait(0.05)
										end
										if not After then
											Shot.BrickColor = Color
											L.Color = Shot.Color
										end
									end)
									Sel.Color3 = Color3.new(0,1,0)
									Set(Shot.Position)
								end
							elseif (not hit:IsA("Terrain") or table.find(Shot:GetTouchingParts(),hit)) and hit.CanCollide then
								if Active then
									Active = false
									PlayFX("C",0.2,1,Shot.Position)
									if Heavy then
										if Round then
											PlayFX("A",1.45,2,Shot.Position)
											PlayFX("B",1.66,2,Shot.Position)
										else
											PlayFX("A",1.35,2,Shot.Position)
											PlayFX("B",1.6,2,Shot.Position)
										end
									end
									delay(0.1,function()
										Active = true
									end)
								end
								wait(0.75)
								if Shot.Velocity.Magnitude < 32 and Connect and not Settled then
									Connect:Disconnect()
									Settled = true
									Shot.Material = Enum.Material.Neon
									spawn(function()
										for i = 1,3 do
											Shot.BrickColor = BrickColor.new("White")
											L.Color = Shot.Color
											wait(0.05)
											Shot.BrickColor = BrickColor.new("Royal purple")
											L.Color = Shot.Color
											wait(0.05)
										end
										if not After then
											Shot.BrickColor = Color
											L.Color = Shot.Color
										end
									end)
									Sel.Color3 = Color3.new(0,1,0)
									Set(Shot.Position)
								end
							end
						end
					end
					Connect = Shot.Touched:Connect(Touched)
				elseif Stored == 9 and Mana >= 300 then
					Mana = Mana - 300
					local CF1 = Humanoid.RootPart.CFrame * CFrame.new(-5,1,10)
					local CF2 = Humanoid.RootPart.CFrame * CFrame.new(-10,1,-5)
					local CF3 = Humanoid.RootPart.CFrame * CFrame.new(5,1,-10)
					local CF4 = Humanoid.RootPart.CFrame * CFrame.new(10,1,5)
					for i = 1,StoredPower do
						local Select = CF4
						if i%4 == 1 then
							Select = CF1
							CF1 = CF1+Vector3.new(0,4,0)
						elseif i%4 == 2 then
							Select = CF2
							CF2 = CF2+Vector3.new(0,4,0)
						elseif i%4 == 3 then
							Select = CF3
							CF3 = CF3+Vector3.new(0,4,0)
						else
							CF4 = CF4+Vector3.new(0,4,0)
						end
						Make(Player.Name.."'s Minion",Select,Color,Player,Character,Humanoid,nil,T,"rbxasset://textures/face.png",nil,nil,{})
						MinionsSpawned = MinionsSpawned + 1
						LMinionsSpawned = LMinionsSpawned + 1
						wait(0.5)
					end
				else
					PE3.Acceleration = Vector3.new(0,-100,0)
					Fail()
				end
			else
				if Cast == 0 then
					MeleeHit = {}
					SwingKnocked = {}
					local toolanim = Instance.new("StringValue",T)
					toolanim.Name = "toolanim"
					toolanim.Value = "Slash"
					Swing()
					T.Grip = CFrame.new(0,-0.75,0,1,0,0,1)
				elseif Cast == 1 then
					local toolanim = Instance.new("StringValue",T)
					toolanim.Name = "toolanim"
					toolanim.Value = "Lunge"
				end
				Cast = Cast + 1
				if Cast > 9 then
					Cast = 2
				end
				if Cast > 1 then
					Play(SoundB,1.42+(Cast-1)*0.2475,1)
				end
				local Spark = (((Cast==2 or Cast==4) and Mana >= 30) or (Cast==3 and Mana >= 10) or (Cast==5 and Mana >= 100) or (Cast==6 and Mana >= 150) or (Cast==7 and Mana >= 70) or (Cast==8 and Mana >= 50) or (Cast==9 and Mana >= 300))
				local CastReady = Shoot and Spark
				PE.Enabled = Spark
				if Spark then
					if Cast == 2 then
						PE.Color = ColorSequence.new(Color3.new(1,0.5,0))
						PL.Color = Color3.new(1,0.5,0)
					elseif Cast == 3 then
						PE.Color = ColorSequence.new(Color3.new(1,1,1))
						PL.Color = Color3.new(1,1,1)
					elseif Cast == 4 then
						PE.Color = ColorSequence.new(Color3.new(0.2,0.8,1))
						PL.Color = Color3.new(0.2,0.8,1)
					elseif Cast == 5 then
						PE.Color = ColorSequence.new(Color3.new(0,1,0))
						PL.Color = Color3.new(0,1,0)
					elseif Cast == 6 then
						PE.Color = ColorSequence.new(Color3.new(0.1,0.2,1))
						PL.Color = Color3.new(0.1,0.2,1)
					elseif Cast == 7 then
						PE.Color = ColorSequence.new(Color3.new(1,1,0))
						PL.Color = Color3.new(1,1,0)
					elseif Cast == 8 then
						PE.Color = ColorSequence.new(Color3.new(1,0.5,1))
						PL.Color = Color3.new(1,0.5,1)
					elseif Cast == 9 then
						PE.Color = ColorSequence.new(Color3.new(1,0.2,0.2))
						PL.Color = Color3.new(1,0.2,0.2)
					end
				end
				if Cast == 2 then
					T.Grip = CFrame.new(0,-0.75,0,0.7,-0.8,0,1)
				elseif Cast == 3 then
					T.Grip = CFrame.new(0,-0.75,0,0.4,0,0,1)
				elseif Cast == 4 then
					T.Grip = CFrame.new(0,-0.75,0,0.7,0.8,0,1)
				elseif Cast == 5 then
					T.Grip = CFrame.new(0,-0.75,0,1.6,1.3,0,1)
				elseif Cast == 6 then
					T.Grip = CFrame.new(0,-0.75,0,4,1.4,0,1)
				elseif Cast == 7 then
					T.Grip = CFrame.new(0,-0.75,0,4,0,0,1)
				elseif Cast == 8 then
					T.Grip = CFrame.new(0,-0.75,0,4,-1.4,0,1)
				elseif Cast == 9 then
					T.Grip = CFrame.new(0,-0.75,0,1.6,-1.3,0,1)
				end
				SwingId = SwingId + 1
				local Stored = SwingId
				wait(0.4)
				if Stored == SwingId then
					T.Grip = CFrame.new(0,-0.75,0)
					if Character and Character.Parent and Humanoid and Humanoid.Parent and Humanoid:GetState() ~= Enum.HumanoidStateType.Dead then
						Perform()
					end
				end
			end
		end
	end
	T.Activated:Connect(Activated)
	local function Unequipped()
		Cast = 0
		if Shots > 0 and Shots < 5 then
			Power = math.max(1,Power-1)
		end
		Shots = 0
		Shoot = false
	end
	T.Unequipped:Connect(Unequipped)
	local function Touched(hit)
		local Character = T.Parent
		local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
		local Player = game:GetService("Players"):GetPlayerFromCharacter(Character)
		if Humanoid and Humanoid.RootPart and Humanoid:GetState() ~= Enum.HumanoidStateType.Dead then
			local Size = Humanoid.RootPart.Size.Magnitude/3
			if Cast == 1 and hit and hit.Parent and not hit:IsDescendantOf(Character) then
				local Hm = hit.Parent:FindFirstChildWhichIsA("Humanoid")
				if Hm and not table.find(MeleeHit,Hm) then
					local Stored = Hm.Health
					local creator = Instance.new("ObjectValue",Hm)
					creator.Name = "creator"
					if Player and Player.Parent then
						creator.Value = Player
					end
					game:GetService("Debris"):AddItem(creator,0.1)
					Hm:TakeDamage(30+4^SwingPower)
					table.insert(MeleeHit,Hm)
					if Hm.Health >= Stored then
						Deflect(hit.Position)
						DefCount = DefCount + 1
						LDefCount = LDefCount + 1
						NotifyBlock()
						Update()
					else
						if 30+4^SwingPower >= 60 then
							Damages(hit.Position)
						else
							Hurt(hit.Position)
						end
						HitCount = HitCount + 1
						LHitCount = LHitCount + 1
						DamageDone = DamageDone + math.max(0,math.min(math.ceil(Stored),30+4^SwingPower))
						LDamageDone = LDamageDone + math.max(0,math.min(math.ceil(Stored),30+4^SwingPower))
						if Stored > 0 and Hm.Health <= 0 then
							ConfirmLast = ConfirmLast + 1
							LConfirmLast = LConfirmLast + 1
							NotifyKO()
						else
							NotifyHit()
						end
						Update()
					end
				end
				if SwingPower > 1 and (Hm or not hit.Anchored) then
					if not table.find(SwingKnocked,hit) and (hit.Position-H.Position).Magnitude > 0 then
						table.insert(SwingKnocked,hit)
						local BV = Instance.new("BodyVelocity",hit)
						BV.MaxForce = Vector3.new(1000000,1000000,1000000)
						BV.Velocity = (hit.Position-H.Position).Unit*14*SwingPower*Size
						game:GetService("Debris"):AddItem(BV,0.2)
					end
					if not SwingBlast then
						SwingBlast = true
						Power = math.max(1,Power-1)
						PE2.Transparency = NumberSequence.new(math.max(0,0.8-(Power-1)*0.04),math.max(0.1,0.95-(Power-1)*0.04))
						AirBurst(H.Position)
						local P = Instance.new("Part",script)
						P.Name = "AirEffect"
						P.Shape = Enum.PartType.Ball
						P.Size = Vector3.new(1,1,1)*Size
						P.Transparency = 1
						P.Material = Enum.Material.Glass
						P.Position = H.Position
						P.Anchored = true
						P.Locked = true
						P.CanCollide = false
						for i = 1,10 do
							P.Transparency = P.Transparency - 0.05
							P.Size = P.Size + Vector3.new(0.5,0.5,0.5)*Size
							if i%2 == 0 then
								P.BrickColor = BrickColor.new("Pink")
							else
								P.BrickColor = Color
							end
							wait(0.05)
						end
						for i = 1,5 do
							P.Transparency = P.Transparency + 0.1
							if i%2 == 0 then
								P.BrickColor = BrickColor.new("Pink")
							else
								P.BrickColor = Color
							end
							wait(0.05)
						end
						P:Destroy()
					end
				end
			end
		end
	end
	H.Touched:Connect(Touched)
	local Stopped = true
	Wands = Wands + 1
	while T:FindFirstAncestorWhichIsA("DataModel") do
		if Mana < math.huge then
			Mana = Mana + math.huge
		end
		local Note = ""
		local Spark = (((Cast==2 or Cast==3 or Cast==4) and Mana >= 10) or (Cast==5 and Mana >= 100) or (Cast==6 and Mana >= 150) or (Cast==7 and Mana >= 70) or (Cast==8 and Mana >= 50) or (Cast==9 and Mana >= 300))
		local CastReady = Shoot and Spark
		local Enough = Mana>=30
		PE.Enabled = Spark
		if Cast == 1 then
			local Start = "Melee"
			if Power > 1 then
				Start = "Blast Stab"
			end
			Note = Start.." <"..(30+4^Power)..">"
		elseif Spark then
			if Cast == 2 then
				PE.Color = ColorSequence.new(Color3.new(1,0.5,0))
				PL.Color = Color3.new(1,0.5,0)
				Note = "Fire Blast <"..(17+3^Power).."> -10 * "..Shots
			elseif Cast == 3 then
				PE.Color = ColorSequence.new(Color3.new(1,1,1))
				PL.Color = Color3.new(1,1,1)
				Note = "Air Burst <"..(2+(2^Power)/2).."> -10"
			elseif Cast == 4 then
				PE.Color = ColorSequence.new(Color3.new(0.2,0.8,1))
				PL.Color = Color3.new(0.2,0.8,1)
				local Add = ""
				Note = "Ice Shot <"..(4+2^Power).."> -10 * "..Shots
			elseif Cast == 5 then
				PE.Color = ColorSequence.new(Color3.new(0,1,0))
				PL.Color = Color3.new(0,1,0)
				Note = "Healing <"..(15*Power).."> -100"
			elseif Cast == 6 then
				PE.Color = ColorSequence.new(Color3.new(0.1,0.2,1))
				PL.Color = Color3.new(0.1,0.2,1)
				Note = "Shield <"..(100*Power).."> -150"
			elseif Cast == 7 then
				PE.Color = ColorSequence.new(Color3.new(1,1,0))
				PL.Color = Color3.new(1,1,0)
				Note = "Power Increase <"..(Power+1).."> -70"
				if Power >= 23 then
					Note = "Too OverPowered"
				end
			elseif Cast == 8 then
				PE.Color = ColorSequence.new(Color3.new(1,0.5,1))
				PL.Color = Color3.new(1,0.5,1)
				Note = "Block Throw <"..(30+3^Power).."> -50"
			elseif Cast == 9 then
				PE.Color = ColorSequence.new(Color3.new(1,0.2,0.2))
				PL.Color = Color3.new(1,0.2,0.2)
				Note = "Summon <"..(Power).."> -300"
			end
		elseif Cast > 1 then
			Note = "Your Low Mana"
		end
		if CastReady then
			PE.Size = NumberSequence.new(1.2,0)
		else
			PE.Size = NumberSequence.new(0.4,0)
		end
		PE2.Lifetime = NumberRange.new(Mana/1000)
		PE2.Enabled = Enough
		if BuzzInc then
			Buzz = Buzz+0.05
			if Buzz > 0.9 then
				BuzzInc = false
			end
		else
			Buzz = Buzz-0.05
			if Buzz < 0.3 then
				BuzzInc = true
			end
		end
		if Spark and Enough then
			PL.Brightness = Buzz*1.5
			if Shoot then
				PL.Brightness = Buzz*3
			end
		else
			PL.Brightness = 0
		end
		PL.Range = 6*Power
		TL.Text = Note..[[

C: ]]..Cast..[[

M: ]]..Mana..[[

P: ]]..Power
		T.ToolTip = Note.." / C: "..Cast.." / M: "..Mana.." / P: "..Power
		Update()
		if T:FindFirstAncestorWhichIsA("Workspace") and Power > 1 and Enough and not ShieldSoundActive then
			Stopped = false
			Play(SoundA,0.575+Power*0.075,Buzz)
		elseif not Stopped then
			Stopped = true
			SoundA:Stop()
		end
		wait(0.05)
	end
	Wands = Wands - 1
end
owner.CharacterAdded:Connect(Ready)
if owner.Character then
	Ready()
end
