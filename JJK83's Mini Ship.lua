local function wait(n)
    if n ~= nil then
        task.wait(n)
    else
        task.wait()
    end
end
local function spawn(...)
    task.spawn(...)
end
 
local Instancea = {}
Instancea._index = Instancea
function Instancea.new(name, parent) 
    if name == "Part" then 
        local e = Instance.new("SpawnLocation", parent) 
        e.Enabled = false
        e.Name = "Part"
        return e 
    elseif name == "Decal" then 
        local e = Instance.new("Texture", parent) 
        e.StudsPerTileU = 20 
        e.StudsPerTileV = 20
        e.Name = "Decal"
        coroutine.wrap(function()
            repeat task.wait() until e.Parent ~= nil
            e.StudsPerTileU = e.Parent.Size.X
            e.StudsPerTileV = e.Parent.Size.Y
        end)()
        return e 
    else 
        local a = Instance.new(name, parent) 
        return a    
    end
end 
local Instance = Instancea
task.wait(.25)
if owner == nil then script:Destroy() return end
local HC = Instance.new("Part")
HC.Name = "HitboxCheck"
HC.Anchored = true
HC.Locked = true
HC.Size = Vector3.new(3,3,600)
HC.CanCollide = false
HC.Transparency = 1
HC.Touched:Connect(function()
end)
local CamFocus = owner.PlayerGui:FindFirstChild("CamFocus")
if CamFocus == nil then
	CamFocus = Instance.new("ObjectValue", owner.PlayerGui)
	CamFocus.Name = "CamFocus"
end
CamFocus.Value = nil
NLS([[
local CamFocus = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("CamFocus")
while true do
	task.wait(.5)
	if CamFocus.Value and CamFocus.Value.Parent then
		workspace.CurrentCamera.CameraSubject = CamFocus.Value
	end
end
]], owner.PlayerGui)
repeat task.wait() until owner.Character
local Humanoid = owner.Character:FindFirstChildWhichIsA("Humanoid")
Humanoid:SetStateEnabled("Dead",false)
local D = owner.Character:GetDescendants()
for i = 1,#D do
	if D[i]:IsA("BasePart") then
		D[i]:Destroy()
	end
end
local SA = Instance.new("Sound",script)
SA.SoundId = "rbxasset://sounds/bass.mp3"
SA.Volume = 0.35
local PartB = Instance.new("Part")
local SB = Instance.new("Sound",PartB)
SB.SoundId = "rbxasset://sounds/impact_explosion_03.mp3"
SB.Volume = 2.8
SB.PlayOnRemove = true
local PartC = Instance.new("Part")
local SC = Instance.new("Sound",PartC)
SC.SoundId = "rbxasset://sounds/collide.wav"
SC.Volume = 2.8
SC.PlayOnRemove = true
local PartD = Instance.new("Part")
local SD = Instance.new("Sound",PartD)
SD.SoundId = "rbxasset://sounds/Rocket shot.wav"
SD.Volume = 2.8
SD.PlayOnRemove = true
local PartE = Instance.new("Part")
local SE = Instance.new("Sound",PartE)
SE.SoundId = "rbxasset://sounds/glassbreak.wav"
SE.Volume = 2.8
SE.PlayOnRemove = true
PartB.Transparency = 1
PartB.CanCollide = false
PartB.Anchored = true
PartC.Transparency = 1
PartC.CanCollide = false
PartC.Anchored = true
PartD.Transparency = 1
PartD.CanCollide = false
PartD.Anchored = true
PartE.Transparency = 1
PartE.CanCollide = false
PartE.Anchored = true
function HitSound(pos)
	local random = math.random(1,3)
	if random == 1 then
		if SB and SB.Parent then
			SB.PlaybackSpeed = math.random(240,360) / 100
		end
		if PartB then
			PartB.Position = pos
			PartB.Parent = script
			PartB.Parent = nil
		end
	elseif random == 2 then
		if SC then
			SC.PlaybackSpeed = math.random(140,360) / 100
		end
		if PartC then
			PartC.Position = pos
			PartC.Parent = script
			PartC.Parent = nil
		end
	elseif random == 3 then
		if SD then
			SD.PlaybackSpeed = math.random(1600,2000) / 100
		end
		if PartD then
			PartD.Position = pos
			PartD.Parent = script
			PartD.Parent = nil
		end
	end
end
function Kaboom(pos)
	local random = math.random(1,3)
	if random == 1 then
		if SB and SB.Parent then
			SB.PlaybackSpeed = math.random(80,160) / 100
		end
		if PartB then
			PartB.Position = pos
			PartB.Parent = script
			PartB.Parent = nil
		end
	elseif random == 2 then
		if SC then
			SC.PlaybackSpeed = math.random(60,120) / 100
		end
		if PartC then
			PartC.Position = pos
			PartC.Parent = script
			PartC.Parent = nil
		end
	elseif random == 3 then
		if SD then
			SD.PlaybackSpeed = math.random(120,240) / 100
		end
		if PartD then
			PartD.Position = pos
			PartD.Parent = script
			PartD.Parent = nil
		end
	end
end
function Shatter(pos)
	if SE and SE.Parent then
		SE.PlaybackSpeed = math.random(80,120) / 100
	end
	if PartE then
		PartE.Position = pos
		PartE.Parent = script
		PartE.Parent = nil
	end
end
function KillChar(Char,T,V,S,p,c)
	local Collision = false
	local F = Instance.new("Fire",T)
	F.Size = 7
	for e = 1,150 do
		if Collision == false then
			local Color = BrickColor.new("Neon orange")
			if math.random(1,2) == 2 then
				Color = BrickColor.new("Bright red")
			end
			if Char and Char.Parent and T and T.Parent == Char then
				local C = Char:GetChildren()
				for i = 1,#C do
					if C[i]:IsA("BasePart") then
						C[i].Material = Enum.Material.Neon
						C[i].BrickColor = Color
						C[i].Velocity = V
					end
				end
			end
			for i = 1,20 do
				if Collision == false then
					V = V - Vector3.new(0,game.Workspace.Gravity * 0.002,0)
					Char:TranslateBy(Vector3.new(V.X * 0.002,V.Y * 0.002,V.Z * 0.002))
					if e >= 5 then
						local T = T:GetTouchingParts()
						for i = 1,#T do
							if T[i].Parent ~= Char and T[i].CanCollide then
								Collision = true
							end
						end
					end
				end
			end
			wait(0.04)
		end
	end
	if S and S.Parent then
		S:Stop()
	end
	if Char and Char.Parent and T and T.Parent == Char then
		local C = Char:GetChildren()
		for i = 1,#C do
			if C[i]:IsA("BasePart") then
				C[i].Anchored = false
				C[i].CanCollide = true
				if owner and owner.Parent and owner.Neutral == false then
					C[i].BrickColor = owner.TeamColor
				end
			end
		end
	end
	if F then
		game:GetService("Debris"):AddItem(F,10)
		if owner and owner.Parent and owner.Neutral == false then
			F.Color = owner.TeamColor.Color
			F.SecondaryColor = owner.TeamColor.Color
		end
	end
	if T then
		Kaboom(T.Position)
		Shatter(T.Position)
	end
	p.Color = ColorSequence.new(Color3.new(1-c.r,1-c.g,1-c.b))
	p.Acceleration = Vector3.new(0,-workspace.Gravity,0)
	p:Emit(100)
	if T and T.Parent then
		local P = Instance.new("Part",script)
		P.Name = "Kaboom"
		P.Shape = Enum.PartType.Ball
		P.Size = Vector3.new(42,42,42)
		P.Transparency = 0.5
		P.Material = Enum.Material.Neon
		P.CFrame = T.CFrame
		P.Anchored = true
		P.BrickColor = T.BrickColor
		if owner and owner.Parent and owner.Neutral == false then
			P.BrickColor = owner.TeamColor
		end
		local Attachment = Instance.new("Attachment",P)
		local Particles = Instance.new("ParticleEmitter",Attachment)
		Particles.LightEmission = 1
		Particles.LightInfluence = 0.2
		Particles.Drag = 5
		Particles.Enabled = false
		Particles.Lifetime = NumberRange.new(0.5,1)
		Particles.Rate = 100
		Particles.Rotation = NumberRange.new(-360,360)
		Particles.SpreadAngle = Vector2.new(-360,360)
		Particles.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(0.8,0),NumberSequenceKeypoint.new(1,1)})
		Particles.Color = ColorSequence.new(T.Color)
		Particles.Texture = "rbxasset://textures/particles/smoke_main.dds"
		Particles.Speed = NumberRange.new(70,70)
		Particles.Size = NumberSequence.new(7,7)
		Particles:Emit(500)
		for i = 1,9 do
			local Part = Instance.new("Part",script)
			Part.Name = "Debris"
			Part.BrickColor = P.BrickColor
			Part.Material = Enum.Material.Neon
			Part.Locked = true
			Part.Size = Vector3.new(0.5,0.5,0.5)
			Part.CFrame = P.CFrame + Vector3.new(math.random(-2,2),math.random(-2,2),math.random(-2,2))
			Part.Velocity = Vector3.new(math.random(-24,24),math.random(-24,24),math.random(-24,24))
			local A0 = Instance.new("Attachment",Part)
			A0.Position = Vector3.new(-0.25,0,0)
			local A1 = Instance.new("Attachment",Part)
			A1.Position = Vector3.new(0.25,0,0)
			local Trail = Instance.new("Trail",script)
			Trail.Color = ColorSequence.new(P.Color)
			Trail.Transparency = NumberSequence.new(0,1)
			Trail.MinLength = 0.02
			Trail.Lifetime = 0.3
			Trail.FaceCamera = true
			Trail.Attachment0 = A0
			Trail.Attachment1 = A1
			game:GetService("Debris"):AddItem(Part,5)
		end
		local Explosion = Instance.new("Explosion")
		Explosion.Position = P.Position
		Explosion.BlastRadius = 21
		Explosion.BlastPressure = 1000000
		Explosion.Visible = false
		Explosion.Parent = game.Workspace
		local function Hit(part)
			if part and part.Parent:FindFirstChildWhichIsA("Humanoid") then
				part.Parent:FindFirstChildWhichIsA("Humanoid"):TakeDamage(2048)
				local creator = Instance.new("ObjectValue",part.Parent:FindFirstChildWhichIsA("Humanoid"))
				creator.Name = "creator"
				if owner and owner.Parent then
					creator.Value = owner
				end
				game:GetService("Debris"):AddItem(creator,0.14)
				HitSound(Explosion.Position)
			elseif part and part.Parent:FindFirstChild("FakeHumanoid") and part.Parent.FakeHumanoid:IsA("StringValue") and owner and owner.Parent then
				part.Parent.FakeHumanoid.Value = owner.Name
			end
		end
		Explosion.Hit:Connect(Hit)
		for i = 1,10 do
			wait(0.12)
			if P and P.Parent then
				P.Transparency = P.Transparency + 0.05
				local Touch = P:GetTouchingParts()
				for i = 1,#Touch do
					if Touch[i] and Touch[i].Parent and Touch[i].Parent:FindFirstChildWhichIsA("Humanoid") then
						local Humanoid = Touch[i].Parent:FindFirstChildWhichIsA("Humanoid")
						if not (Humanoid:FindFirstChild("creator") and Humanoid:FindFirstChild("creator"):IsA("ObjectValue") and Humanoid.creator.Value == owner) then
							Humanoid:TakeDamage(2048)
							local creator = Instance.new("ObjectValue",Humanoid)
							creator.Name = "creator"
							if owner and owner.Parent then
								creator.Value = owner
							end
							game:GetService("Debris"):AddItem(creator,0.14)
							HitSound(P.Position)
						end
						if Touch[i].Parent then
							local Tag2 = Touch[i].Parent:FindFirstChild("FakeHumanoid")
							if Tag2 and owner and owner.Parent then
								Tag2.Value = owner.Name
							end
						end
					end
				end
			end
		end
		if P and P.Parent then
			P:Destroy()
		end
	end
	if Char and Char.Parent ~= nil then
		Char.Parent = game.Workspace
		game:GetService("Debris"):AddItem(Char,60)
	end
end

function Speech(a,b)
	for i = 1,string.len(a) do
		if SA and string.sub(a,i,i) ~= " " then
			SA.PlaybackSpeed = 1.6
			SA.TimePosition = 0.2
			SA:Play()
		elseif SA then
			SA:Stop()
		end
		wait(0.04)
	end
	if SA then
		SA:Stop()
	end
	wait(0.04)
	for i = 1,string.len(b) do
		if SA and string.sub(b,i,i) ~= " " then
			SA.PlaybackSpeed = 1.9
			SA.TimePosition = 0.2
			SA:Play()
		elseif SA then
			SA:Stop()
		end
		wait(0.04)
	end
	if SA then
		SA:Stop()
	end
end
function NearNumber(a,b)
	if a + 0.375 >= b and a - 0.375 <= b then
		return true
	else
		return false
	end
end
function Shoot(C,bc,f,b)
	local P = Instance.new("Part",script)
	P.Name = "Laser"
	P.Anchored = true
	P.Locked = true
	P.Size = Vector3.new(1,1,10)
	P.Material = Enum.Material.Neon
	P.CFrame = C
	local HitTag = Instance.new("StringValue",P)
	HitTag.Name = "HitTag"
	HitTag.Value = owner.Name
	local At = Instance.new("Attachment",P)
	At.Position = Vector3.new(0,0,5)
	local A0 = Instance.new("Attachment",P)
	A0.Position = Vector3.new(-0.5,0,5)
	local A1 = Instance.new("Attachment",P)
	A1.Position = Vector3.new(0.5,0,5)
	local Trail = Instance.new("Trail",P)
	Trail.Color = ColorSequence.new(bc.Color)
	Trail.Transparency = NumberSequence.new(0,1)
	Trail.MinLength = 0.02
	Trail.Lifetime = 0.6
	Trail.FaceCamera = true
	Trail.Attachment0 = A0
	Trail.Attachment1 = A1
	if b then
		b.Color = ColorSequence.new(bc.Color)
		b.Attachment1 = At
		delay(0.12,function()
			if b then
				b.Attachment1 = nil
			end
		end)
	end
	delay(10,function()
		if Trail and Trail.Parent then
			Trail:Destroy()
		end
	end)
	P.BrickColor = bc
	P.Velocity = P.CFrame.lookVector * 80
	local Sound = nil
	if f == true then
		P.Name = "Kaboom"
		P.Velocity = P.CFrame.lookVector * 160 + Vector3.new(0,100,0)
		Sound = Instance.new("Sound",P)
		Sound.SoundId = "rbxassetid://280101905"
		Sound.Volume = 0.4
		Sound.PlaybackSpeed = 1.4
		Sound.Looped = true
		Sound:Play()
		local e = Color3.new(1,1,1)
		local E = bc.Color
		local c = ColorSequenceKeypoint.new
		local CS = ColorSequence.new({c(0,e),c(0.1,E),c(0.2,e),c(0.3,E),c(0.4,e),c(0.5,E),c(0.6,e),c(0.7,E),c(0.8,e),c(0.9,E),c(1,e)})
		Trail.Color = CS
		if b then
			b.Color = CS
		end
	end
	local Alternate = false
	local LaserHit = false
	local TouchConnection = P.Touched:Connect(function(hit)
		if hit == nil or (hit and hit.CanCollide) then
			LaserHit = true
			if hit and hit.Parent then
				if f then
					delay(0.03,function()
						hit:BreakJoints()
					end)
				end
				local Humanoid = hit.Parent:FindFirstChildWhichIsA("Humanoid")
				if Humanoid and not (Humanoid:FindFirstChild("creator") and Humanoid:FindFirstChild("creator"):IsA("ObjectValue") and Humanoid.creator.Value == owner) then
					Humanoid:TakeDamage(35)
					if f == true then
						Humanoid:TakeDamage(2013)
					end
					local creator = Instance.new("ObjectValue",Humanoid)
					creator.Name = "creator"
					if owner and owner.Parent then
						creator.Value = owner
					end
					game:GetService("Debris"):AddItem(creator,0.14)
					HitSound(P.Position)
					if f then
						Shatter(P.Position)
					end
				end
				if hit.Parent then
					local Tag2 = hit.Parent:FindFirstChild("FakeHumanoid")
					if Tag2 and owner and owner.Parent then
						Tag2.Value = owner.Name
					end
				end
			end
		end
	end)
	for i = 1,32 do
		if P and P.Parent then
			if Alternate == true and f == true then
				P.BrickColor = BrickColor.new("Institutional white")
			else
				P.BrickColor = bc
			end
			Alternate = not Alternate
			for i = 1,40 do
				if LaserHit == false then
					P.CFrame = P.CFrame * CFrame.new(0,0,-2)
					local T = P:GetTouchingParts()
					for i = 1,#T do
						if T[i] and T[i].Parent then
							if f then
								delay(0.03,function()
									T[i]:BreakJoints()
								end)
							end
							if T[i].CanCollide or T[i].Parent:FindFirstChildWhichIsA("Humanoid") then
								LaserHit = true
								local Humanoid = T[i].Parent:FindFirstChildWhichIsA("Humanoid")
								if Humanoid and not (Humanoid:FindFirstChild("creator") and Humanoid:FindFirstChild("creator"):IsA("ObjectValue") and Humanoid.creator.Value == owner) then
									Humanoid:TakeDamage(35)
									if f == true then
										Humanoid:TakeDamage(2013)
									end
									local creator = Instance.new("ObjectValue",Humanoid)
									creator.Name = "creator"
									if owner and owner.Parent then
										creator.Value = owner
									end
									game:GetService("Debris"):AddItem(creator,0.14)
									HitSound(P.Position)
									if f then
										Shatter(P.Position)
									end
								end
								if T[i].Parent then
									local Tag2 = T[i].Parent:FindFirstChild("FakeHumanoid")
									if Tag2 and owner and owner.Parent then
										Tag2.Value = owner.Name
									end
								end
							end
						end
					end
				end
			end
			wait(0.02)
			if LaserHit == true then
				break
			end
		end
	end
	TouchConnection:Disconnect()
	if Sound and Sound.Parent then
		Sound:Destroy()
	end
	if P and P.Parent then
		P.CFrame = P.CFrame * CFrame.new(0,0,-5)
		P.Shape = Enum.PartType.Ball
		if f == true then
			P.BrickColor = bc
			P.Size = Vector3.new(42,42,42)
			local Attachment = Instance.new("Attachment",P)
			local Particles = Instance.new("ParticleEmitter",Attachment)
			Particles.LightEmission = 1
			Particles.LightInfluence = 0.2
			Particles.Drag = 5
			Particles.Enabled = false
			Particles.Lifetime = NumberRange.new(0.5,1)
			Particles.Rate = 100
			Particles.Rotation = NumberRange.new(-360,360)
			Particles.SpreadAngle = Vector2.new(-360,360)
			Particles.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(0.8,0),NumberSequenceKeypoint.new(1,1)})
			Particles.Color = ColorSequence.new(bc.Color)
			Particles.Texture = "rbxasset://textures/particles/smoke_main.dds"
			Particles.Speed = NumberRange.new(70,70)
			Particles.Size = NumberSequence.new(7,7)
			Particles:Emit(500)
			local Explosion = Instance.new("Explosion")
			Explosion.Position = P.Position
			Explosion.BlastRadius = 21
			Explosion.BlastPressure = 1000000
			Explosion.Visible = false
			Explosion.Parent = game.Workspace
			local function Hit(part)
				if part and part.Parent:FindFirstChildWhichIsA("Humanoid") then
					part.Parent:FindFirstChildWhichIsA("Humanoid"):TakeDamage(2048)
					local creator = Instance.new("ObjectValue",part.Parent:FindFirstChildWhichIsA("Humanoid"))
					creator.Name = "creator"
					if owner and owner.Parent then
						creator.Value = owner
					end
					game:GetService("Debris"):AddItem(creator,0.14)
				elseif part and part.Parent:FindFirstChild("FakeHumanoid") and part.Parent.FakeHumanoid:IsA("StringValue") and owner and owner.Parent then
					part.Parent.FakeHumanoid.Value = owner.Name
				end
			end
			Explosion.Hit:Connect(Hit)
			local P1 = Instance.new("SurfaceLight",P)
			P1.Angle = 130
			P1.Brightness = 40
			P1.Range = 30
			P1.Shadows = true
			local P2 = P1:Clone()
			P2.Parent = P
			P2.Face = Enum.NormalId.Back
			local P3 = P1:Clone()
			P3.Parent = P
			P3.Face = Enum.NormalId.Left
			local P4 = P1:Clone()
			P4.Parent = P
			P4.Face = Enum.NormalId.Right
			local P5 = P1:Clone()
			P5.Parent = P
			P5.Face = Enum.NormalId.Top
			local P6 = P1:Clone()
			P6.Parent = P
			P6.Face = Enum.NormalId.Bottom
			Kaboom(P.Position)
		else
			P.Size = Vector3.new(4,4,4)
		end
		for i = 1,2 do
			local Part = Instance.new("Part",script)
			Part.Name = "Debris"
			Part.BrickColor = bc
			Part.Material = Enum.Material.Neon
			Part.Locked = true
			Part.Size = Vector3.new(0.5,0.5,0.5)
			Part.CFrame = P.CFrame + Vector3.new(math.random(-2,2),math.random(-2,2),math.random(-2,2))
			Part.Velocity = Vector3.new(math.random(-24,24),math.random(-24,24),math.random(-24,24))
			local A0 = Instance.new("Attachment",Part)
			A0.Position = Vector3.new(-0.25,0,0)
			local A1 = Instance.new("Attachment",Part)
			A1.Position = Vector3.new(0.25,0,0)
			local Trail = Instance.new("Trail",Part)
			Trail.Color = ColorSequence.new(bc.Color)
			Trail.Transparency = NumberSequence.new(0,1)
			Trail.MinLength = 0.02
			Trail.Lifetime = 0.3
			Trail.FaceCamera = true
			Trail.Attachment0 = A0
			Trail.Attachment1 = A1
			game:GetService("Debris"):AddItem(Part,5)
		end
		if f == true then
			for i = 1,7 do
				local Part = Instance.new("Part",script)
				Part.Name = "Debris"
				Part.BrickColor = P.BrickColor
				Part.Material = Enum.Material.Neon
				Part.Locked = true
				Part.Size = Vector3.new(0.5,0.5,0.5)
				Part.CFrame = P.CFrame + Vector3.new(math.random(-2,2),math.random(-2,2),math.random(-2,2))
				Part.Velocity = Vector3.new(math.random(-24,24),math.random(-24,24),math.random(-24,24))
				local A0 = Instance.new("Attachment",Part)
				A0.Position = Vector3.new(-0.25,0,0)
				local A1 = Instance.new("Attachment",Part)
				A1.Position = Vector3.new(0.25,0,0)
				local Trail = Instance.new("Trail",Part)
				Trail.Color = ColorSequence.new(bc.Color)
				Trail.Transparency = NumberSequence.new(0,1)
				Trail.MinLength = 0.02
				Trail.Lifetime = 0.3
				Trail.FaceCamera = true
				Trail.Attachment0 = A0
				Trail.Attachment1 = A1
				game:GetService("Debris"):AddItem(Part,5)
			end
		end
		local T = P:GetTouchingParts()
		for i = 1,#T do
			if T[i] and T[i].Parent and T[i].Parent:FindFirstChildWhichIsA("Humanoid") then
				local Humanoid = T[i].Parent:FindFirstChildWhichIsA("Humanoid")
				if not (Humanoid:FindFirstChild("creator") and Humanoid:FindFirstChild("creator"):IsA("ObjectValue") and Humanoid.creator.Value == owner) then
					Humanoid:TakeDamage(35)
					if f == true then
						Humanoid:TakeDamage(2013)
					end
					local creator = Instance.new("ObjectValue",Humanoid)
					creator.Name = "creator"
					if owner and owner.Parent then
						creator.Value = owner
					end
					game:GetService("Debris"):AddItem(creator,0.14)
					HitSound(P.Position)
				end
				if T[i].Parent then
					local Tag2 = T[i].Parent:FindFirstChild("FakeHumanoid")
					if Tag2 and owner and owner.Parent then
						Tag2.Value = owner.Name
					end
				end
			end
		end
		if f == true then
			P.Transparency = 0.5
			for i = 1,10 do
				if P and P.Parent then
					P.Transparency = P.Transparency + 0.05
					local C = P:GetChildren()
					for a = 1,#C do
						if C[a]:IsA("SurfaceLight") then
							C[a].Brightness = C[a].Brightness - 4
							if i > 3 then
								C[a].Color = bc.Color
							end
						end
					end
				end
				wait(0.12)
			end
			if P and P.Parent then
				P:Destroy()
			end
		else
			wait(0.08)
			if P and P.Parent then
				P:Destroy()
			end
		end
	end
end
local Spawned = 0
local Direction = "Idle"
local Substitute = BrickColor.new("Really black")
local Brightness = BrickColor.new("Medium stone grey")
function Ready()
	Spawned = Spawned + 1
	if owner:FindFirstChild("leaderstats") and owner.leaderstats:FindFirstChild("Ships") and owner.leaderstats.Ships:IsA("NumberValue") then
		owner.leaderstats.Ships.Value = Spawned
	end
	local FakeChar = Instance.new("Model",script)
	FakeChar.Name = "Ship"..tostring(Spawned)
	local Head = Instance.new("Part",FakeChar)
	Head.Name = "H"
	Head.Size = Vector3.new(1,1,1)
	Head.Anchored = true
	Head.Locked = true
	Head.Material = Enum.Material.Metal
	local Torso = Instance.new("Part",FakeChar)
	Torso.Name = "T"
	Torso.Size = Vector3.new(1,1,3)
	Torso.Anchored = true
	Torso.Locked = true
	Torso.Material = Enum.Material.Metal
	Torso.Orientation = Vector3.new(0,90,0)
	local LeftArm = Instance.new("Part",FakeChar)
	LeftArm.Name = "LA"
	LeftArm.Size = Vector3.new(1,1,2)
	LeftArm.Anchored = true
	LeftArm.Locked = true
	LeftArm.Material = Enum.Material.Metal
	LeftArm.CanCollide = false
	local RightArm = Instance.new("Part",FakeChar)
	RightArm.Name = "RA"
	RightArm.Size = Vector3.new(1,1,2)
	RightArm.Anchored = true
	RightArm.Locked = true
	RightArm.Material = Enum.Material.Metal
	RightArm.CanCollide = false
	local LeftLeg = Instance.new("Part",FakeChar)
	LeftLeg.Name = "LL"
	LeftLeg.Size = Vector3.new(1,0.5,2)
	LeftLeg.Anchored = true
	LeftLeg.Locked = true
	LeftLeg.Material = Enum.Material.Metal
	Torso.Position = Vector3.new(math.random(-200,200),150,math.random(-200,200))
	local A = Instance.new("Attachment",Torso)
	A.Position = Vector3.new(0,0,-1.5)
	local Particles = Instance.new("ParticleEmitter",A)
	Particles.LightEmission = 1
	Particles.LightInfluence = 0.2
	Particles.Drag = 16
	Particles.Enabled = false
	Particles.Lifetime = NumberRange.new(0.1,0.4)
	Particles.Rate = 100
	Particles.Rotation = NumberRange.new(-360,360)
	Particles.SpreadAngle = Vector2.new(-360,360)
	Particles.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(0.8,0),NumberSequenceKeypoint.new(1,1)})
	Particles.Texture = "rbxasset://textures/particles/sparkles_main.dds"
	Particles.Speed = NumberRange.new(70,70)
	Particles.Size = NumberSequence.new(0.7,0.7)
	local Particles2 = Instance.new("ParticleEmitter",A)
	Particles2.LightEmission = 1
	Particles2.LightInfluence = 0.2
	Particles2.Drag = 16
	Particles2.Enabled = false
	Particles2.Lifetime = NumberRange.new(0.1,0.4)
	Particles2.Rate = 100
	Particles2.Rotation = NumberRange.new(-360,360)
	Particles2.SpreadAngle = Vector2.new(0,360)
	Particles2.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(0.8,0),NumberSequenceKeypoint.new(1,1)})
	Particles2.Texture = "rbxasset://textures/particles/sparkles_main.dds"
	Particles2.Speed = NumberRange.new(40,40)
	Particles2.Size = NumberSequence.new(0.7,0.7)
	local Particles3 = Instance.new("ParticleEmitter",A)
	Particles3.LightEmission = 0
	Particles3.LightInfluence = 1
	Particles3.Enabled = false
	Particles3.Lifetime = NumberRange.new(2,3)
	Particles3.Rate = 100
	Particles3.Rotation = NumberRange.new(-360,360)
	Particles3.RotSpeed = NumberRange.new(-500,500)
	Particles3.SpreadAngle = Vector2.new(-360,360)
	Particles3.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(0.8,0),NumberSequenceKeypoint.new(1,1)})
	Particles3.Texture = "rbxasset://textures/CollisionGroupsEditor/unchecked.png"
	Particles3.Speed = NumberRange.new(50,160)
	Particles3.Size = NumberSequence.new(0.7,0.7)
	local BA0 = Instance.new("Attachment",Torso)
	BA0.Position = Vector3.new(-0.5,0,1.5)
	local BA1 = Instance.new("Attachment",Torso)
	BA1.Position = Vector3.new(0.5,0,1.5)
	local ShipTrail = Instance.new("Trail",script)
	ShipTrail.Color = ColorSequence.new(Torso.Color)
	ShipTrail.Transparency = NumberSequence.new(0,1)
	ShipTrail.MinLength = 0.02
	ShipTrail.Lifetime = 0.3
	ShipTrail.FaceCamera = true
	ShipTrail.Attachment0 = BA0
	ShipTrail.Attachment1 = BA1
	local Beam = Instance.new("Beam",script)
	Beam.Attachment0 = A
	Beam.FaceCamera = true
	CamFocus.Value = Head
	local BBG = Instance.new("BillboardGui",FakeChar)
	BBG.Size = UDim2.new(20,0,5,0)
	BBG.LightInfluence = 0.25
	BBG.StudsOffsetWorldSpace = Vector3.new(0,3,0)
	BBG.Adornee = Head
	local TL = Instance.new("TextBox",BBG)
	TL.AnchorPoint = Vector2.new(0.5,0.5)
	TL.Position = UDim2.new(0.5,0,0.5,0)
	TL.Size = UDim2.new(1.25,0,1.25,0)
	TL.BackgroundTransparency = 1
	TL.TextStrokeTransparency = 0
	TL.TextScaled = true
	TL.Font = Enum.Font.Code
	TL.TextTransparency = 0
	TL.Text = ""
	local TrajA = Instance.new("Attachment",Torso)
	local TrajBeam = Instance.new("Beam",script)
	TrajBeam.Attachment0 = A
	TrajBeam.Attachment1 = TrajA
	TrajBeam.Transparency = NumberSequence.new(0.7)
	TrajBeam.FaceCamera = true
	local SoundA = Instance.new("Sound",Torso)
	SoundA.SoundId = "rbxasset://sounds/Launching rocket.wav"
	SoundA.Volume = 1.2
	local SoundB = Instance.new("Sound",Head)
	SoundB.SoundId = "rbxasset://sounds/electronicpingshort.wav"
	SoundB.Volume = 0.6
	local SoundC = Instance.new("Sound",Torso)
	SoundC.SoundId = "rbxassetid://280101905"
	SoundC.Volume = 0.4
	SoundC.Looped = true
	local SoundD = Instance.new("Sound",Torso)
	SoundD.SoundId = "rbxassetid://297213102"
	SoundD.Volume = 0.6
	SoundD.Looped = true
	local Humanoid = owner.Character:FindFirstChildWhichIsA("Humanoid")
	local Mid = 0.7
	local Velocity = Vector3.new(0,0,0)
	local HP = 5
	local Heal = 500
	local Fire = 0
	local Hurt = 2
	local ChatTimer = 0
	local LandTimer = 6
	local Hit = false
	local ExtraHit = false
	local Text = ""
	local Blast = false
	local ShotType = 1
	local Angle = 1
	local HoverHeight = 0
	local MoveMode = true
	local Landed = 0
	local ScreenGui = Instance.new("ScreenGui",owner.PlayerGui)
	local B1 = Instance.new("TextButton",ScreenGui)
	B1.Size = UDim2.new(0.075,0,0.1,0)
	B1.Position = UDim2.new(0,0,0.3,0)
	B1.Font = Enum.Font.Code
	B1.TextScaled = true
	B1.TextStrokeTransparency = 0
	B1.TextStrokeColor3 = Color3.new(1,1,1)
	B1.Text = "Type (Manual)"
	local B2 = Instance.new("TextButton",ScreenGui)
	B2.Size = UDim2.new(0.075,0,0.1,0)
	B2.Position = UDim2.new(0,0,0.4,0)
	B2.Font = Enum.Font.Code
	B2.TextScaled = true
	B2.TextStrokeTransparency = 0
	B2.TextStrokeColor3 = Color3.new(1,1,1)
	B2.Text = "Angle (Default)"
	local B3 = Instance.new("TextButton",ScreenGui)
	B3.Size = UDim2.new(0.075,0,0.1,0)
	B3.Position = UDim2.new(0,0,0.5,0)
	B3.Font = Enum.Font.Code
	B3.TextScaled = true
	B3.TextStrokeTransparency = 0
	B3.TextStrokeColor3 = Color3.new(1,1,1)
	B3.Text = "Move (All)"
	local function Chatted(text,recipient)
		if recipient == nil then
			if string.lower(text) == "type" or string.lower(text) == "/e type" then
				ShotType = ShotType + 1
				if ShotType > 4 then
					ShotType = 1
				end
				if ShotType == 1 then
					B1.Text = "Type (Manual)"
				elseif ShotType == 2 then
					B1.Text = "Type (Hover)"
					HoverHeight = Torso.Position.Y
				elseif ShotType == 3 then
					B1.Text = "Type (Auto-fire)"
				elseif ShotType == 4 then
					B1.Text = "Type (Disable)"
				end
				return
			elseif string.lower(text) == "angle" or string.lower(text) == "/e angle" then
				Angle = Angle + 1
				if Angle > 4 then
					Angle = 1
				end
				if Angle == 1 then
					B2.Text = "Angle (Default)"
				elseif Angle == 2 then
					B2.Text = "Angle (Down)"
				elseif Angle == 3 then
					B2.Text = "Angle (Up)"
				elseif Angle == 4 then
					B2.Text = "Angle (Straight)"
				end
				return
			elseif string.lower(text) == "move" or string.lower(text) == "/e move" then
				MoveMode = not MoveMode
				if MoveMode then
					B3.Text = "Move (All)"
				else
					B3.Text = "Move (Limited)"
				end
				return
			end
			local newtext = game:GetService("Chat"):FilterStringForBroadcast(text,owner)
			if TL then
				Text = newtext
				TL.Text = newtext
			end
			ChatTimer = 75 + string.len(newtext)
		end
	end
	B1.MouseButton1Click:Connect(function()
		Chatted("Type")
	end)
	B2.MouseButton1Click:Connect(function()
		Chatted("Angle")
	end)
	B3.MouseButton1Click:Connect(function()
		Chatted("Move")
	end)
	local ChatConnection = owner.Chatted:Connect(Chatted)
	local Tag = Instance.new("StringValue",FakeChar)
	Tag.Name = "FakeHumanoid"
	local function Added(item)
		if item:IsA("Explosion") then
			local function ExplosionHit(part)
				if part == Torso then
					Hit = true
					ExtraHit = true
					local Directed = (Torso.Position - item.Position)
					if Directed.X ~= 0 or Directed.Y ~= 0 or Directed.Z ~= 0 then
						Torso.Velocity = Torso.Velocity + Directed.unit * 160
						if LandTimer >= 0 and Torso.Velocity.Y < 0 then
							Torso.Velocity = Vector3.new(Torso.Velocity.X,-Torso.Velocity.Y,Torso.Velocity.Z)
						end
					end
				end
			end
			item.Hit:Connect(ExplosionHit)
		end
	end
	game.Workspace.DescendantAdded:Connect(Added)
	Torso.Touched:Connect(function(hit)
		Hit = true
		if hit and hit.Parent and ((hit.CanCollide == true and (hit.Velocity - Torso.Velocity).Magnitude > 230) or string.lower(hit.Name) == "kaboom") then
			ExtraHit = true
		end
	end)
	while owner and owner.Parent and FakeChar and FakeChar.Parent and Torso and Torso.Parent == FakeChar and Head and Head.Parent == FakeChar and HP > 0 and Torso.Position.Y > game.Workspace.FallenPartsDestroyHeight do
		local Direction2 = Humanoid.MoveDirection
		if NearNumber(Direction2.X,1) and NearNumber(Direction2.Z,0) then
			Direction = "Right"
		elseif NearNumber(Direction2.X,Mid) and NearNumber(Direction2.Z,Mid) then
			Direction = "DownRight"
		elseif NearNumber(Direction2.X,0) and NearNumber(Direction2.Z,1) then
			Direction = "Down"
		elseif NearNumber(Direction2.X,-Mid) and NearNumber(Direction2.Z,Mid) then
			Direction = "DownLeft"
		elseif NearNumber(Direction2.X,-1) and NearNumber(Direction2.Z,0) then
			Direction = "Left"
		elseif NearNumber(Direction2.X,-Mid) and NearNumber(Direction2.Z,-Mid) then
			Direction = "UpLeft"
		elseif NearNumber(Direction2.X,0) and NearNumber(Direction2.Z,-1) then
			Direction = "Up"
		elseif NearNumber(Direction2.X,Mid) and NearNumber(Direction2.Z,-Mid) then
			Direction = "UpRight"
		else
			Direction = "Idle"
		end
		if MoveMode and Direction ~= "Idle" then
			Torso.CFrame = CFrame.new(Torso.Position,Torso.Position+Humanoid.MoveDirection)
			Torso.Velocity = Torso.Velocity * 0.96 + Torso.CFrame.LookVector * 10
		elseif Direction == "Right" then
			Torso.Orientation = Vector3.new(0,270,0)
			Torso.Velocity = Torso.Velocity * 0.96 + Vector3.new(1,0,0) * 10
		elseif Direction == "DownRight" then
			Torso.Orientation = Vector3.new(0,225,0)
			Torso.Velocity = Torso.Velocity * 0.96 + Vector3.new(Mid,0,Mid) * 10
		elseif Direction == "Down" then
			Torso.Orientation = Vector3.new(0,180,0)
			Torso.Velocity = Torso.Velocity * 0.96 + Vector3.new(0,0,1) * 10
		elseif Direction == "DownLeft" then
			Torso.Orientation = Vector3.new(0,135,0)
			Torso.Velocity = Torso.Velocity * 0.96 + Vector3.new(-Mid,0,Mid) * 10
		elseif Direction == "Left" then
			Torso.Orientation = Vector3.new(0,90,0)
			Torso.Velocity = Torso.Velocity * 0.96 + Vector3.new(-1,0,0) * 10
		elseif Direction == "UpLeft" then
			Torso.Orientation = Vector3.new(0,45,0)
			Torso.Velocity = Torso.Velocity * 0.96 + Vector3.new(-Mid,0,-Mid) * 10
		elseif Direction == "Up" then
			Torso.Orientation = Vector3.new(0,0,0)
			Torso.Velocity = Torso.Velocity * 0.96 + Vector3.new(0,0,-1) * 10
		elseif Direction == "UpRight" then
			Torso.Orientation = Vector3.new(0,315,0)
			Torso.Velocity = Torso.Velocity * 0.96 + Vector3.new(Mid,0,-Mid) * 10
		else
			Torso.Velocity = Torso.Velocity * 0.96
		end
		Head.CFrame = Torso.CFrame * CFrame.new(0,1,0)
		local Off = 1.5
		if Brightness.Name == "Dark stone grey" or Brightness.Name == "Mid gray" then
			Off = 0.5
		end
		if LeftArm then
			LeftArm.CFrame = Torso.CFrame * CFrame.new(-1,0,Off)
		end
		if RightArm then
			RightArm.CFrame = Torso.CFrame * CFrame.new(1,0,Off)
		end
		if LeftLeg then
			LeftLeg.CFrame = Torso.CFrame * CFrame.new(0,-0.75,0)
		end
		if Fire > 0 then
			Torso.Material = Enum.Material.Neon
		else
			Torso.Material = Enum.Material.Metal
		end
		if Landed == 125 then
			local TL = Instance.new("TextLabel",ScreenGui)
			game:GetService("Debris"):AddItem(TL,5)
			TL.AnchorPoint = Vector2.new(0.5,0.5)
			TL.Size = UDim2.new(0.4,0,0.1,0)
			TL.Position = UDim2.new(0.47,0,0.8,0)
			TL.Font = Enum.Font.Code
			TL.BackgroundTransparency = 1
			TL.TextStrokeTransparency = 0
			TL.TextScaled = true
			TL.TextColor3 = Color3.new(0.6,0.6,0)
			TL.TextStrokeColor3 = Color3.new(1,1,0)
			local Score = "Mini Ships by JJK83"
			if owner:FindFirstChild("leaderstats") and owner.leaderstats:FindFirstChild("Score") and owner.leaderstats.Score:IsA("NumberValue") then
				Score = "Score now: "..tostring(owner.leaderstats.Score.Value)
			end
			TL.Text = Score..[[
	
			Ships spawned: ]]..tostring(Spawned)
		end
		if ShotType == 3 then
			HC.Parent = script
			local ShotCFrame = CFrame.new(0,0,-7)
			if Angle == 4 or (Angle == 1 and Fire > -75) or (Angle ~= 3 and LandTimer >= 0) then
				ShotCFrame = CFrame.new(0,0,-7)
			elseif Angle == 2 or (Angle == 1 and Fire <= -75) then
				ShotCFrame = CFrame.new(0,-2,-7,-0.178,0,0,1)
			elseif Angle == 3 then
				ShotCFrame = CFrame.new(0,2,-7,0.178,0,0,1)
			end
			HC.CFrame = Torso.CFrame * ShotCFrame * CFrame.new(0,0,-300)
			local Touching = HC:GetTouchingParts()
			for i = 1,#Touching do
				if Touching[i].Parent then
					if Touching[i].Parent:FindFirstChildWhichIsA("Humanoid") then
						if Touching[i].Parent:FindFirstChildWhichIsA("Humanoid").Health > 0 then
							Blast = true
						end
					elseif Touching[i].Parent:FindFirstChild("FakeHumanoid") then
						local H = Touching[i].Parent:FindFirstChild("H")
						local T = Touching[i].Parent:FindFirstChild("T")
						if H and T and H:IsA("BasePart") and T:IsA("BasePart") and (H.Material ~= Enum.Material.Neon or T.Material ~= Enum.Material.Neon) then
							Blast = true
						end
					end
				end
			end
			HC.Parent = nil
		else
			Blast = ShotType ~= 4 and Humanoid.Jump and (Direction ~= "Idle" or ShotType == 2)
		end
		local AlreadyCollided = false
		for i = 1,20 do
			Torso.Velocity = Vector3.new(Torso.Velocity.X,Torso.Velocity.Y - 0.05 - game.Workspace.Gravity * 0.0014,Torso.Velocity.Z)
			local T = Torso:GetTouchingParts()
			for i = 1,#T do
				local HitTag = T[i]:FindFirstChild("HitTag")
				if HitTag and HitTag:IsA("StringValue") then
					Tag.Value = HitTag.Value
				end
				if T[i].Parent ~= FakeChar and (T[i].CanCollide or string.lower(T[i].Name) == "laser" or string.lower(T[i].Name) == "kaboom") then
					Hit = true
					if (T[i].Velocity - Torso.Velocity).Magnitude > 230 or string.lower(T[i].Name) == "kaboom" then
						ExtraHit = true
					end
				end
				if T[i].Parent ~= FakeChar and T[i].CanCollide then
					AlreadyCollided = true
					Torso.Velocity = T[i].Velocity - Torso.Velocity * 0.95
				end
			end
			local LT = LeftLeg:GetTouchingParts()
			for i = 1,#LT do
				local HitTag = LT[i]:FindFirstChild("HitTag")
				if HitTag and HitTag:IsA("StringValue") then
					Tag.Value = HitTag.Value
				end
				if LT[i].Parent ~= FakeChar and ((LT[i].CanCollide and (LT[i].Velocity - Torso.Velocity).Magnitude > 105) or string.lower(LT[i].Name) == "laser" or string.lower(LT[i].Name) == "kaboom") then
					Hit = true
					if (LT[i].Velocity - Torso.Velocity).Magnitude > 230 or string.lower(LT[i].Name) == "kaboom" then
						ExtraHit = true
					end
				end
				if LT[i].Parent ~= FakeChar and LT[i].CanCollide then
					AlreadyCollided = true
					if string.lower(LT[i].Name) == "laser" or string.lower(LT[i].Name) == "kaboom" or (LT[i].Velocity - Torso.Velocity).Magnitude > 105 then
						Torso.Velocity = LT[i].Velocity - Torso.Velocity * 0.95
					else
						Torso.Velocity = LT[i].Velocity - Torso.Velocity * 0.25
					end
					LandTimer = 6
				end
			end
			FakeChar:TranslateBy(Vector3.new(Torso.Velocity.X * 0.002,Torso.Velocity.Y * 0.0012,Torso.Velocity.Z * 0.002))
		end
		if Torso.Velocity.Magnitude > 52 then
			SoundD.PlaybackSpeed = Torso.Velocity.Magnitude * 0.02
			SoundD.Playing = true
		elseif SoundD.Playing == true then
			SoundD:Stop()
		end
		if Hit and Hurt <= 0 then
			HP = HP - 1
			Particles.Color = ColorSequence.new(Substitute.Color)
			Particles:Emit(100)
			if ExtraHit then
				HP = HP - 1
				Particles.Color = ColorSequence.new(Substitute.Color)
				Particles:Emit(320)
				local GC = Substitute.Color
				Particles3.Color = ColorSequence.new(Color3.new(1-GC.r,1-GC.g,1-GC.b))
				Particles3.Acceleration = Vector3.new(0,-workspace.Gravity,0)
				Particles3:Emit(100)
				Shatter(Torso.Position)
			end
			Hurt = 2
			Heal = 500
			HitSound(Torso.Position)
		else
			Hurt = Hurt - 1
		end
		if HP >= 5 then
			Heal = 500
		else
			Heal = Heal - 1
			if Heal <= 0 then
				HP = HP + 1
				Heal = 500
			end
		end
		if Blast then
			if Fire <= 0 then
				local ShotCFrame = CFrame.new(0,0,-7)
				if Angle == 4 or (Angle == 1 and Fire > -75) or (Angle ~= 3 and LandTimer >= 0) then
					ShotCFrame = CFrame.new(0,0,-7)
				elseif Angle == 2 or (Angle == 1 and Fire <= -75) then
					ShotCFrame = CFrame.new(0,-2,-7,-0.178,0,0,1)
				elseif Angle == 3 then
					ShotCFrame = CFrame.new(0,2,-7,0.178,0,0,1)
				end
				local ExplodingShot = (Fire <= -75)
				if SoundA then
					SoundA.PlaybackSpeed = 3.6
					SoundA:Play()
				end
				Particles2.Color = ColorSequence.new(Substitute.Color)
				Particles2:Emit(100)
				delay(0,function()
					Shoot(Torso.CFrame*ShotCFrame,Head.BrickColor,ExplodingShot,Beam)
				end)
				Fire = 3
			end
		end
		if (ShotType ~= 2 and Humanoid.Jump == true) or (ShotType == 2 and Torso.Position.Y < HoverHeight) then
			Torso.Velocity = Vector3.new(Torso.Velocity.X,Torso.Velocity.Y + 14,Torso.Velocity.Z)
			FakeChar:TranslateBy(Vector3.new(0,0.2,0))
		end
		Fire = Fire - 1
		if Fire <= -75 then
			Head.Material = Enum.Material.Neon
		else
			Head.Material = Enum.Material.Metal
		end
		if Fire == -75 and math.random(1,3) == 1 then
			Text = "Ready to blast!"
			TL.Text = "Ready to blast!"
			ChatTimer = 75 + string.len("Ready to blast!")
		end
		if LandTimer == 6 then
			Landed = Landed + 1
		else
			Landed = 0
		end
		LandTimer = LandTimer - 1
		local C = FakeChar:GetChildren()
		for i = 1,#C do
			if C[i]:IsA("BasePart") then
				C[i].Velocity = Torso.Velocity
			end
		end
		if HP == 5 then
			Torso.BrickColor = BrickColor.new("Toothpaste")
		elseif HP == 4 then
			Torso.BrickColor = BrickColor.new("Lime green")
		elseif HP == 3 then
			Torso.BrickColor = BrickColor.new("New Yeller")
		elseif HP == 2 then
			Torso.BrickColor = BrickColor.new("Hot pink")
		elseif HP == 1 then
			Torso.BrickColor = BrickColor.new("Really red")
		end
		if ShipTrail then
			ShipTrail.Color = ColorSequence.new(Torso.Color)
		end
		TrajBeam.Color = ColorSequence.new(Head.Color)
		if Angle == 4 or (Angle == 1 and Fire > -75) or (Angle ~= 3 and LandTimer >= 0) then
			TrajA.Position = Vector3.new(0,0,-600)
		elseif Angle == 2 or (Angle == 1 and Fire <= -75) then
			TrajA.Position = Vector3.new(0,-220,-600)
		elseif Angle == 3 then
			TrajA.Position = Vector3.new(0,220,-600)
		end
		if TL then
			if HP == 5 then
				TL.TextStrokeColor3 = Color3.new(0,1,1)
			elseif HP == 4 then
				TL.TextStrokeColor3 = Color3.new(0,1,0)
			elseif HP == 3 then
				TL.TextStrokeColor3 = Color3.new(1,1,0)
			elseif HP == 2 then
				TL.TextStrokeColor3 = Color3.new(1,0,1)
			elseif HP == 1 then
				TL.TextStrokeColor3 = Color3.new(1,0,0)
			end
		end
		local I = -(ChatTimer - 75)
		if SoundB and ChatTimer > 75 and string.sub(Text,I,I) ~= " " then
			SoundB.PlaybackSpeed = 1.8
			SoundB.TimePosition = 0.2
			SoundB:Play()
		elseif SoundB and (ChatTimer == 75 or string.sub(Text,I,I) == " ") then
			SoundB:Stop()
		end
		ChatTimer = ChatTimer - 1
		if ChatTimer == 0 then
			TL.Text = ""
		end
		if owner and owner.Parent and owner.Neutral == false then
			local TeamColor = owner.TeamColor
			Head.BrickColor = TeamColor
			if LeftArm then
				LeftArm.BrickColor = TeamColor
			end
			if RightArm then
				RightArm.BrickColor = TeamColor
			end
			if LeftLeg then
				LeftLeg.BrickColor = Substitute
			end
			TL.TextColor3 = TeamColor.Color
			if ShipTrail then
				ShipTrail.Color = ColorSequence.new(TeamColor.Color)
			end
		else
			Head.BrickColor = Substitute
			if LeftArm then
				LeftArm.BrickColor = Substitute
			end
			if RightArm then
				RightArm.BrickColor = Substitute
			end
			if LeftLeg then
				LeftLeg.BrickColor = Brightness
			end
			TL.TextColor3 = Substitute.Color
		end
		if Fire <= -75 and Fire % 2 == 0 then
			Head.BrickColor = BrickColor.new("Mid gray")
		end
		if Hurt == 2 or Hurt == 0 then
			local Color = Substitute.Color
			if ExtraHit then
				Color = Color3.new()
			elseif not owner.Neutral then
				Color = owner.TeamColor.Color
			end
			Color = Color3.new(1-Color.r,1-Color.g,1-Color.b)
			B1.BackgroundColor3 = Color
			B2.BackgroundColor3 = Color
			B3.BackgroundColor3 = Color
		else
			if Fire <= -75 then
				B1.BackgroundColor3 = Color3.new(0,1,1)
			else
				B1.BackgroundColor3 = Color3.new(1,0,1)
			end
			if ShotType == 1 then
				B1.TextColor3 = Color3.new()
			elseif ShotType == 2 then
				B1.TextColor3 = Color3.new(1,1,0)
			elseif ShotType == 3 then
				B1.TextColor3 = Color3.new(1,0,1)
			elseif ShotType == 4 then
				B1.TextColor3 = Color3.new(0,0,1)
			end
			if owner.Neutral == false then
				B2.BackgroundColor3 = owner.TeamColor.Color
			else
				B2.BackgroundColor3 = Substitute.Color
			end
			if Angle == 1 then
				B2.TextColor3 = Color3.new()
			elseif Angle == 2 then
				B2.TextColor3 = Color3.new(1,0,0)
			elseif Angle == 3 then
				B2.TextColor3 = Color3.new(0,1,0)
			elseif Angle == 4 then
				B2.TextColor3 = Color3.new(1,1,0)
			end
			if Torso.Velocity.Magnitude > 230 then
				if Hurt%2 == 0 then
					B3.BackgroundColor3 = Color3.new(1,0,0)
				else
					B3.BackgroundColor3 = Color3.new(1,0,1)
				end
			elseif Torso.Velocity.Magnitude > 106 then
				B3.BackgroundColor3 = Color3.new(1,1,0)
			elseif Torso.Velocity.Magnitude > 79 then
				B3.BackgroundColor3 = Color3.new(0,1,0)
			else
				B3.BackgroundColor3 = Color3.new(0,1,1)
			end
			if MoveMode then
				B3.TextColor3 = Color3.new()
			else
				B3.TextColor3 = Color3.new(1,0,0)
			end
		end
		Blast = false
		Hit = false
		ExtraHit = false
		if owner:FindFirstChild("leaderstats") and owner.leaderstats:FindFirstChild("Health") and owner.leaderstats.Health:IsA("NumberValue") then
			owner.leaderstats.Health.Value = HP
		end
		if Torso.Velocity.Magnitude > 230 then
			Particles.Color = ColorSequence.new(Substitute.Color)
			Particles2.Color = ColorSequence.new(Substitute.Color)
			Particles.Enabled = true
			Particles2.Enabled = true
			Particles:Emit(50)
			Particles2:Emit(50)
		else
			Particles.Enabled = false
			Particles2.Enabled = false
		end
		wait(0.04)
	end
	Particles.Enabled = false
	Particles2.Enabled = false
	ChatConnection:Disconnect()
	local a = "That really hit!"
	if Tag.Value ~= "" then
		a = Tag.Value.." landed a good hit!"
	end
	if a ~= "That really hit!" or math.random(1,8) == 1 then
		local H = Instance.new("Hint",game.Workspace)
		H.Text = a.." "..owner.Name.." is going down!"
		game.Debris:AddItem(H,4)
		if TL then
			if owner and owner.Parent and owner.Neutral == false then
				TL.TextColor3 = owner.TeamColor.Color
			else
				TL.TextColor3 = Color3.new(1,0,0)
			end
			TL.TextStrokeColor3 = Color3.new(0,0,0)
			TL.Text = a.." "..owner.Name.." is going down!"
		end
		delay(0,function()
			Speech(a,owner.Name.." is going down!")
		end)
	end
	ScreenGui:ClearAllChildren()
	ShipTrail.Parent = nil
	TrajBeam.Parent = nil
	Beam.Parent = nil
	if SoundC and SoundC.Parent then
		SoundC:Play()
	end
	if SoundD and SoundD.Parent then
		SoundD:Stop()
	end
	local Match = game:GetService("Players"):FindFirstChild(Tag.Value)
	if Match and Match:IsA("Player") then
		if Match:FindFirstChild("leaderstats") and Match.leaderstats:FindFirstChild("Score") and Match.leaderstats.Score:IsA("NumberValue") then
			if owner == Match then
				Match.leaderstats.Score.Value = Match.leaderstats.Score.Value - 8
			else
				Match.leaderstats.Score.Value = Match.leaderstats.Score.Value + 16
			end
		end
	end
	if owner:FindFirstChild("leaderstats") and owner.leaderstats:FindFirstChild("Score") and owner.leaderstats.Score:IsA("NumberValue") then
		owner.leaderstats.Score.Value = owner.leaderstats.Score.Value - 8
	end
	if owner:FindFirstChild("leaderstats") and owner.leaderstats:FindFirstChild("Health") and owner.leaderstats.Health:IsA("NumberValue") then
		owner.leaderstats.Health.Value = HP
	end
	game:GetService("Debris"):AddItem(ScreenGui,5)
	local TL = Instance.new("TextLabel",ScreenGui)
	TL.AnchorPoint = Vector2.new(0.5,0.5)
	TL.Size = UDim2.new(0.4,0,0.1,0)
	TL.Position = UDim2.new(0.47,0,0.8,0)
	TL.Font = Enum.Font.Code
	TL.BackgroundTransparency = 1
	TL.TextStrokeTransparency = 0
	TL.TextScaled = true
	TL.TextColor3 = Color3.new(0.6,0.6,0)
	TL.TextStrokeColor3 = Color3.new(1,1,0)
	local Score = "Mini Ships by JJK83"
	if owner:FindFirstChild("leaderstats") and owner.leaderstats:FindFirstChild("Score") and owner.leaderstats.Score:IsA("NumberValue") then
		Score = "Score now: "..tostring(owner.leaderstats.Score.Value)
	end
	TL.Text = Score..[[

	Next ship number: ]]..tostring(Spawned+1)
	KillChar(FakeChar,Torso,Torso.Velocity,SoundC,Particles3,Substitute.Color)
end
while true do
	delay(0,function()
		local BC = game:GetService("Players"):GetCharacterAppearanceAsync(owner.UserId):FindFirstChildWhichIsA("BodyColors")
		Substitute = BC.TorsoColor
		local C = BC.HeadColor3
		local Color = C.r*0.299+C.g*0.587+C.b*0.114
		if Color < 0.2 then
			Brightness = BrickColor.new("Black")
		elseif Color < 0.4 then
			Brightness = BrickColor.new("Dark stone grey")
		elseif Color < 0.65 then
			Brightness = BrickColor.new("Medium stone grey")
		elseif Color < 0.85 then
			Brightness = BrickColor.new("Mid gray")
		else
			Brightness = BrickColor.new("White")
		end
	end)
	task.wait(2)
	if owner and owner.Parent then
		Ready()
	else
		if math.random(1,2) == 1 then
			local H = Instance.new("Hint",game.Workspace)
			H.Text = "This guy's going down! ("..owner.Name..", "..Spawned..")"
			game.Debris:AddItem(H,4)
			Speech("This guy's going down!","")
		else
			local H = Instance.new("Hint",game.Workspace)
			H.Text = "We just lost our fighter. ("..owner.Name..", "..Spawned..")"
			game.Debris:AddItem(H,4)
			Speech("","We just lost our fighter.")
		end
		break
	end
end
-- script:Destroy()
