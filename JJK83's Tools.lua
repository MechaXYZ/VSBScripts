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
local SA = Instance.new("Sound",script)
SA.SoundId = "rbxasset://sounds/bass.mp3"
SA.Volume = 0.35
local PartB = Instance.new("Part")
local SB = Instance.new("Sound",PartB)
SB.SoundId = "rbxasset://sounds/impact_explosion_03.mp3"
SB.Volume = 1.4
SB.PlayOnRemove = true
local PartC = Instance.new("Part")
local SC = Instance.new("Sound",PartC)
SC.SoundId = "rbxasset://sounds/collide.wav"
SC.Volume = 1.4
SC.PlayOnRemove = true
local PartD = Instance.new("Part")
local SD = Instance.new("Sound",PartD)
SD.SoundId = "rbxasset://sounds/Rocket shot.wav"
SD.Volume = 1.4
SD.PlayOnRemove = true
PartB.Anchored = true
PartC.Anchored = true
PartD.Anchored = true
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
local function Kaboom(pos)
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
function BombsAway(T,V,S,o)
	local Collision = false
	local F = Instance.new("Fire",T)
	F.Size = 4
	F.Color = T.Color
	F.SecondaryColor = T.Color
	for e = 1,150 do
		if Collision == false then
			for i = 1,20 do
				if Collision == false then
					V = V - Vector3.new(0,game.Workspace.Gravity * 0.002,0)
					T.CFrame = T.CFrame + Vector3.new(V.X * 0.002,V.Y * 0.002,V.Z * 0.002)
					if e >= 5 then
						local T = T:GetTouchingParts()
						for i = 1,#T do
							if T[i].CanCollide then
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
	if T and T.Parent then
		T.Material = Enum.Material.Neon
			T.Transparency = 0.95
			T.CanCollide = false
		if o and o.Parent and o.Neutral == false then
			T.BrickColor = o.TeamColor
		end
	end
	if F then
		if o and o.Parent and o.Neutral == false then
			F.Color = o.TeamColor.Color
			F.SecondaryColor = o.TeamColor.Color
		end
	end
	delay(0,function()
		if T then
			Kaboom(T.Position)
		end
	end)
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
		if o and o.Parent and o.Neutral == false then
			P.BrickColor = o.TeamColor
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
				if o and o.Parent then
					creator.Value = o
				end
				game:GetService("Debris"):AddItem(creator,0.2)
				delay(0,function()
					HitSound(Explosion.Position)
				end)
			elseif part and part.Parent:FindFirstChild("FakeHumanoid") and part.Parent.FakeHumanoid:IsA("StringValue") and o and o.Parent then
				part.Parent.FakeHumanoid.Value = o.Name
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
						if not (Humanoid:FindFirstChild("creator") and Humanoid:FindFirstChild("creator"):IsA("ObjectValue") and Humanoid.creator.Value == o) then
							Humanoid:TakeDamage(2048)
							local creator = Instance.new("ObjectValue",Humanoid)
							creator.Name = "creator"
							if o and o.Parent then
								creator.Value = o
							end
							game:GetService("Debris"):AddItem(creator,0.2)
							delay(0,function()
								HitSound(P.Position)
							end)
						end
						local Tag2 = Touch[i].Parent:FindFirstChild("FakeHumanoid")
						if Tag2 and o and o.Parent then
							Tag2.Value = o.Name
						end
					end
				end
			end
		end
		if P and P.Parent then
			P:Destroy()
		end
	end
	if T and T.Parent ~= nil then
		T.Name = "Effect"
		game:GetService("Debris"):AddItem(T,10)
	end
end
function NearNumber(a,b)
	if a + 0.375 >= b and a - 0.375 <= b then
		return true
	else
		return false
	end
end
function Shoot(C,bc,f,s,b,o)
	local P = Instance.new("Part",script)
	P.Name = "Laser"
	P.Anchored = true
	P.Locked = true
	P.Size = Vector3.new(1,1,10)
	P.Material = Enum.Material.Neon
	P.CFrame = C
	local At = Instance.new("Attachment",P)
	At.Position = Vector3.new(0,0,5)
	local A0 = Instance.new("Attachment",P)
	A0.Position = Vector3.new(-0.5,0,5)
	local A1 = Instance.new("Attachment",P)
	A1.Position = Vector3.new(0.5,0,5)
	local Trail = Instance.new("Trail",script)
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
	if f == true and s == true then
		P.CFrame = P.CFrame * CFrame.new(0,0,0,-0.25,0,0,1)
	end
	P.BrickColor = bc
	P.Velocity = P.CFrame.lookVector * 80
	local Alternate = false
	local LaserHit = false
	local TouchConnection = P.Touched:Connect(function(hit)
		if hit == nil or (hit and hit.CanCollide) then
			LaserHit = true
			if hit and hit.Parent then
				local Humanoid = hit.Parent:FindFirstChildWhichIsA("Humanoid")
				if Humanoid and not (Humanoid:FindFirstChild("creator") and Humanoid:FindFirstChild("creator"):IsA("ObjectValue") and Humanoid.creator.Value == o) then
					Humanoid:TakeDamage(35)
					if f == true then
						Humanoid:TakeDamage(2013)
					end
					local creator = Instance.new("ObjectValue",Humanoid)
					creator.Name = "creator"
					if o and o.Parent then
						creator.Value = o
					end
					game:GetService("Debris"):AddItem(creator,0.2)
					delay(0,function()
						HitSound(P.Position)
					end)
				end
				local Tag2 = hit.Parent:FindFirstChild("FakeHumanoid")
				if Tag2 and o and o.Parent then
					Tag2.Value = o.Name
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
							if T[i].CanCollide or T[i].Parent:FindFirstChildWhichIsA("Humanoid") then
								LaserHit = true
								local Humanoid = T[i].Parent:FindFirstChildWhichIsA("Humanoid")
								if Humanoid and not (Humanoid:FindFirstChild("creator") and Humanoid:FindFirstChild("creator"):IsA("ObjectValue") and Humanoid.creator.Value == o) then
									Humanoid:TakeDamage(35)
									if f == true then
										Humanoid:TakeDamage(2013)
									end
									local creator = Instance.new("ObjectValue",Humanoid)
									creator.Name = "creator"
									if o and o.Parent then
										creator.Value = o
									end
									game:GetService("Debris"):AddItem(creator,0.2)
									delay(0,function()
										HitSound(P.Position)
									end)
								end
								local Tag2 = T[i].Parent:FindFirstChild("FakeHumanoid")
								if Tag2 and o and o.Parent then
									Tag2.Value = o.Name
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
					if o and o.Parent then
						creator.Value = o
					end
					game:GetService("Debris"):AddItem(creator,0.2)
				elseif part and part.Parent:FindFirstChild("FakeHumanoid") and part.Parent.FakeHumanoid:IsA("StringValue") and o and o.Parent then
					part.Parent.FakeHumanoid.Value = o.Name
				end
			end
			Explosion.Hit:Connect(Hit)
			delay(0,function()
				Kaboom(P.Position)
			end)
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
			local Trail = Instance.new("Trail",script)
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
				local Trail = Instance.new("Trail",script)
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
				if not (Humanoid:FindFirstChild("creator") and Humanoid:FindFirstChild("creator"):IsA("ObjectValue") and Humanoid.creator.Value == o) then
					Humanoid:TakeDamage(35)
					if f == true then
						Humanoid:TakeDamage(2013)
					end
					local creator = Instance.new("ObjectValue",Humanoid)
					creator.Name = "creator"
					if o and o.Parent then
						creator.Value = o
					end
					game:GetService("Debris"):AddItem(creator,0.2)
					delay(0,function()
						HitSound(P.Position)
					end)
				end
				local Tag2 = T[i].Parent:FindFirstChild("FakeHumanoid")
				if Tag2 and o and o.Parent then
					Tag2.Value = o.Name
				end
			end
		end
		if f == true then
			P.Transparency = 0.5
			for i = 1,10 do
				if P and P.Parent then
					P.Transparency = P.Transparency + 0.05
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
function ReadyBlaster()
	local Tool = Instance.new("Tool",owner.Backpack)
	Tool.Name = "Blaster"
	Tool.TextureId = "rbxasset://textures/MouseLockedCursor.png"
	Tool.GripPos = Vector3.new(0,-0.5,1.25)
	local Torso = Instance.new("Part",Tool)
	Torso.Name = "Handle"
	Torso.Size = Vector3.new(1,1,3)
	Torso.BrickColor = BrickColor.new("Medium stone grey")
	Torso.Locked = true
	local PointLight = Instance.new("PointLight",Torso)
	PointLight.Range = 14
	PointLight.Shadows = true
	PointLight.Brightness = 5
	local SpotLight = Instance.new("SpotLight",Torso)
	SpotLight.Range = 60
	SpotLight.Shadows = true
	SpotLight.Brightness = 5
	local SoundA = Instance.new("Sound",Torso)
	SoundA.SoundId = "rbxasset://sounds/Launching rocket.wav"
	SoundA.Volume = 1.2
	local A = Instance.new("Attachment",Torso)
	A.Position = Vector3.new(0,0,-1.5)
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
	Fire = 0
	local HP = owner.Character:FindFirstChildWhichIsA("Humanoid")
	local function Equipped()
		Fire = math.max(-72,Fire)
		for i = 1,3 do
			wait(0.04)
		end
		local toolanim = Instance.new("StringValue",Tool)
		toolanim.Name = "toolanim"
		toolanim.Value = "Lunge"
	end
	Tool.Equipped:Connect(Equipped)
	local function ValueChange()
		if Tool.Enabled == false then
			if Torso and Fire <= 0 then
				local Player = game:GetService("Players"):GetPlayerFromCharacter(Tool.Parent)
				local Character = Tool.Parent
				local Humanoid
				if Character then
					Humanoid = Tool.Parent:FindFirstChildWhichIsA("Humanoid")
				end
				if Humanoid:GetState() ~= Enum.HumanoidStateType.Dead then
					local ExplodingShot = (Fire <= -75)
					if SoundA then
						SoundA.PlaybackSpeed = 3.6
						SoundA:Play()
					end
					local BombLaunch = (Humanoid.MoveDirection.X == 0 and Humanoid.MoveDirection.Z == 0)
					delay(0,function()
						Shoot(((Torso.CFrame + Torso.Velocity * 0.002) * CFrame.new(0,0,-6)),Torso.BrickColor,ExplodingShot,false,Beam,Player)
					end)
					delay(0,function()
						if ExplodingShot == true and BombLaunch == true then
							local Part = Instance.new("Part",script)
							Part.Name = "Bomb"
							Part.Anchored = true
							Part.Locked = true
							Part.Material = Enum.Material.Metal
							Part.BrickColor = Torso.BrickColor
							Part.Size = Vector3.new(1,2,1)
							Part.CFrame = Torso.CFrame * CFrame.new(0,4,-2)
							local SoundC = Instance.new("Sound",Part)
							SoundC.SoundId = "rbxassetid://280101905"
							SoundC.Volume = 0.4
							SoundC.Looped = true
							SoundC:Play()
							BombsAway(Part,Torso.Velocity + Vector3.new(0,180,0),SoundC,Player)
						end
					end)
					Fire = 3
				end
			end
		end
	end
	Tool:GetPropertyChangedSignal("Enabled"):Connect(ValueChange)
	local function Activated()
		Tool.Enabled = false
		local toolanim = Instance.new("StringValue",Tool)
		toolanim.Name = "toolanim"
		toolanim.Value = "Lunge"
	end
	Tool.Activated:Connect(Activated)
	while Tool and Tool:FindFirstAncestorWhichIsA("DataModel") do
		Fire = Fire - 1
		if Fire == 0 then
			Tool.Enabled = true
		end
		if Torso and (Fire <= -75 or Fire > 0) then
			Torso.Material = Enum.Material.Neon
		elseif Torso then
			Torso.Material = Enum.Material.Metal
		end
		Tool.ToolTip = "H = "..math.ceil(HP.Health)
		if Torso then
			if HP.Health > 80 then
				Torso.BrickColor = BrickColor.new("Toothpaste")
				if ShipTrail then
					ShipTrail.Color = ColorSequence.new(Color3.new(0,1,1))
				end
			elseif HP.Health > 60 then
				Torso.BrickColor = BrickColor.new("Lime green")
				if ShipTrail then
					ShipTrail.Color = ColorSequence.new(Color3.new(0,1,0))
				end
			elseif HP.Health > 40 then
				Torso.BrickColor = BrickColor.new("New Yeller")
				if ShipTrail then
					ShipTrail.Color = ColorSequence.new(Color3.new(1,1,0))
				end
			elseif HP.Health > 20 then
				Torso.BrickColor = BrickColor.new("Hot pink")
				if ShipTrail then
					ShipTrail.Color = ColorSequence.new(Color3.new(1,0,1))
				end
			else
				Torso.BrickColor = BrickColor.new("Really red")
				if ShipTrail then
					ShipTrail.Color = ColorSequence.new(Color3.new(1,0,0))
				end
			end
		end
		if owner and owner.Parent and owner.Neutral == false then
			local TeamColor = owner.TeamColor
			Torso.BrickColor = TeamColor
		end
		if Torso and PointLight then
			PointLight.Color = Torso.Color
		end
		if Torso and SpotLight then
			if HP.Health <= 40 then
				if SpotLight.Brightness == 5 then
					SpotLight.Brightness = 3.5
				elseif SpotLight.Brightness == 3.5 then
					SpotLight.Brightness = 1.5
				elseif SpotLight.Brightness == 1.5 then
					SpotLight.Brightness = 1
				elseif SpotLight.Brightness == 1 then
					SpotLight.Brightness = 2.5
				elseif SpotLight.Brightness == 2.5 then
					SpotLight.Brightness = 4.5
				elseif SpotLight.Brightness == 4.5 then
					SpotLight.Brightness = 5
				end
			else
				SpotLight.Brightness = 5
			end
		end
		wait(0.04)
	end
end
local function Hit(hit,p,d,s)
	if hit and hit.Parent then
		local Humanoid = hit.Parent:FindFirstChildWhichIsA("Humanoid")
		if Humanoid then
			if p then
				p:Emit(16)
			end
			Humanoid.Health = Humanoid.Health + 3
			if s then
				Humanoid.Health = Humanoid.Health + 24
				if d then
					d.PlaybackSpeed = 1.2
					d:Play()
				end
			end
			
		end
	end
end
function ReadyMedic()
	local Tool = Instance.new("Tool",owner.Backpack)
	Tool.Name = "Medic"
	Tool.TextureId = "rbxasset://textures/DevConsole/Maximize.png"
	Tool.GripPos = Vector3.new(0.4,0,1)
	local Torso = Instance.new("Part",Tool)
	Torso.Name = "Handle"
	Torso.Size = Vector3.new(1,2,3)
	Torso.BrickColor = BrickColor.new("Medium stone grey")
	Torso.Material = Enum.Material.Wood
	Torso.Locked = true
	local SoundA = Instance.new("Sound",Torso)
	SoundA.SoundId = "rbxasset://sounds/swordslash.wav"
	SoundA.Volume = 1.2
	local SoundB = Instance.new("Sound",Torso)
	SoundB.SoundId = "rbxasset://sounds/swordlunge.wav"
	SoundB.Volume = 1.2
	local SoundC = Instance.new("Sound",Torso)
	SoundC.SoundId = "rbxasset://sounds/flashbulb.wav"
	SoundC.Volume = 1.2
	local SoundD = Instance.new("Sound",Torso)
	SoundD.SoundId = "rbxasset://sounds/hit.wav"
	SoundD.Volume = 1.2
	local A = Instance.new("Attachment",Torso)
	local Particles = Instance.new("ParticleEmitter",A)
	Particles.LightEmission = 1
	Particles.LightInfluence = 0.2
	Particles.Drag = 16
	Particles.Enabled = false
	Particles.Lifetime = NumberRange.new(0.8,1.4)
	Particles.Rate = 100
	Particles.EmissionDirection = Enum.NormalId.Top
	Particles.SpreadAngle = Vector2.new(-360,360)
	Particles.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(0.8,0),NumberSequenceKeypoint.new(1,1)})
	Particles.Texture = "rbxasset://textures/DevConsole/Maximize.png"
	Particles.Acceleration = Vector3.new(0,40,0)
	Particles.Speed = NumberRange.new(40,40)
	Particles.Size = NumberSequence.new(0.7,0.7)
	local BA0 = Instance.new("Attachment",Torso)
	BA0.Position = Vector3.new(-0.5,0,0.5)
	local BA1 = Instance.new("Attachment",Torso)
	BA1.Position = Vector3.new(0.5,0,0.5)
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
	Fire = 0
	local CurrentHumanoid
	local LastSuper = false
	local function Equipped()
		Fire = math.max(-55,math.min(0,Fire))
		Tool.Enabled = true
		local Humanoid = Tool.Parent:FindFirstChildWhichIsA("Humanoid")
		if Humanoid then
			CurrentHumanoid = Humanoid
		end
	end
	local function Unequipped()
		if CurrentHumanoid then
			CurrentHumanoid = nil
		end
	end
	Tool.Equipped:Connect(Equipped)
	Tool.Unequipped:Connect(Unequipped)
	local function Touched(hit)
		local Humanoid = Tool.Parent:FindFirstChildWhichIsA("Humanoid")
		if Humanoid and Humanoid:GetState() ~= Enum.HumanoidStateType.Dead and Fire > 0 then
			Hit(hit,Particles,SoundD,LastSuper)
			if Particles then
				Particles.Color = ColorSequence.new(Torso.Color)
			end
			if SoundC then
				SoundC.PlaybackSpeed = 1.6
				SoundC:Play()
			end
		end
	end
	Torso.Touched:Connect(Touched)
	local function ValueChange()
		if Tool.Enabled == false then
			if Torso and Fire <= -24 then
				local Player = game:GetService("Players"):GetPlayerFromCharacter(Tool.Parent)
				local Character = Tool.Parent
				local Humanoid
				if Character then
					Humanoid = Tool.Parent:FindFirstChildWhichIsA("Humanoid")
				end
				if Humanoid and Humanoid:GetState() ~= Enum.HumanoidStateType.Dead then
					local Super = (Fire <= -75)
					LastSuper = false
					if Super == true then
						LastSuper = true
					end
					if Super then
						local toolanim = Instance.new("StringValue",Tool)
						toolanim.Name = "toolanim"
						toolanim.Value = "Lunge"
					else
						local toolanim = Instance.new("StringValue",Tool)
						toolanim.Name = "toolanim"
						toolanim.Value = "Slash"
					end
					if Super == true then
						SoundB.PlaybackSpeed = 1.75
						SoundB:Play()
					end
					if SoundA then
						SoundA.PlaybackSpeed = 1.4
						SoundA:Play()
					end
					Fire = 12
					if Super == true then
						Fire = 16
					end
				end
			end
		end
	end
	Tool:GetPropertyChangedSignal("Enabled"):Connect(ValueChange)
	local function Activated()
		Tool.Enabled = false
	end
	Tool.Activated:Connect(Activated)
	while Tool and Tool:FindFirstAncestorWhichIsA("DataModel") do
		Fire = Fire - 1
		if Fire == 0 then
			if CurrentHumanoid then
				if LastSuper then
					CurrentHumanoid.Health = CurrentHumanoid.Health + 480
					SoundD.PlaybackSpeed = 1.2
					SoundD:Play()
				else
					CurrentHumanoid.Health = CurrentHumanoid.Health + 12
				end
			end
		end
		if Fire == -24 then
			Tool.Enabled = true
		end
		if Torso and Fire <= -75 then
			Torso.Material = Enum.Material.Neon
		elseif Torso then
			Torso.Material = Enum.Material.Wood
		end
		if Torso then
			if Fire < 0 and Fire > -24 then
				Torso.BrickColor = BrickColor.new("Hot pink")
				if ShipTrail then
					ShipTrail.Color = ColorSequence.new(Color3.new(1,0,1))
				end
			else
				Torso.BrickColor = BrickColor.new("Lime green")
				if ShipTrail then
					ShipTrail.Color = ColorSequence.new(Color3.new(0,1,0))
				end
			end
		end
		if owner and owner.Parent and owner.Neutral == false then
			local TeamColor = owner.TeamColor
			Torso.BrickColor = TeamColor
		end
		wait(0.04)
	end
end
local PartB = Instance.new("Part")
local SB = Instance.new("Sound",PartB)
SB.SoundId = "rbxasset://sounds/impact_explosion_03.mp3"
SB.Volume = 1.4
SB.PlayOnRemove = true
local PartC = Instance.new("Part")
local SC = Instance.new("Sound",PartC)
SC.SoundId = "rbxasset://sounds/collide.wav"
SC.Volume = 1.4
SC.PlayOnRemove = true
local PartD = Instance.new("Part")
local SD = Instance.new("Sound",PartD)
SD.SoundId = "rbxasset://sounds/Rocket shot.wav"
SD.Volume = 1.4
SD.PlayOnRemove = true
PartB.Anchored = true
PartC.Anchored = true
PartD.Anchored = true
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
local function Kaboom(pos)
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
function BombsAway(T,t,S,o)
	local Collision = false
	local Yikes = false
	local LastPos = T.Position
	local F = Instance.new("Fire",T)
	F.Size = 4
	F.Color = T.Color
	F.SecondaryColor = T.Color
	F.Enabled = false
	if T and T.Parent then
		local P = Instance.new("Part")
		P.Name = "Kaboom"
		P.Shape = Enum.PartType.Ball
		P.Size = Vector3.new(42,42,42)
		P.Transparency = 0.5
		P.Material = Enum.Material.Neon
		P.Anchored = true
		P.BrickColor = T.BrickColor
		if o and o.Parent and o.Neutral == false then
			P.BrickColor = o.TeamColor
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
		local Explosion = Instance.new("Explosion")
		Explosion.BlastRadius = 21
		Explosion.BlastPressure = 1000000
		Explosion.Visible = false
		local function Hit(part)
			if part and part.Parent:FindFirstChildWhichIsA("Humanoid") then
				part.Parent:FindFirstChildWhichIsA("Humanoid"):TakeDamage(2048)
				local creator = Instance.new("ObjectValue",part.Parent:FindFirstChildWhichIsA("Humanoid"))
				creator.Name = "creator"
				if o and o.Parent then
					creator.Value = o
				end
				game:GetService("Debris"):AddItem(creator,0.2)
				delay(0,function()
					HitSound(Explosion.Position)
				end)
			elseif part and part.Parent:FindFirstChild("FakeHumanoid") and part.Parent.FakeHumanoid:IsA("StringValue") and o and o.Parent then
				part.Parent.FakeHumanoid.Value = o.Name
			end
		end
		Explosion.Hit:Connect(Hit)
		wait(2)
		if T and T.Parent then
			T.Transparency = 0.93
			if t and t.Parent then
				t.Transparency = 1
			end
		end
		local function Touched(hit)
			if hit == nil or hit.Parent == nil then
				Collision = true
			elseif hit and hit.Parent and (hit.CanCollide == true or hit.Parent:FindFirstChildWhichIsA("Humanoid")) then
				Collision = true
				if game:GetService("Players"):GetPlayerFromCharacter(hit.Parent) == o then
					Yikes = true
				end
			end
		end
		if T then
			T.Touched:Connect(Touched)
		end
		local function DescendantAdded(item)
			if item:IsA("Explosion") then
				local function Hit(part)
					if part == T then
						Collision = true
					end
				end
				item.Hit:Connect(Hit)
			end
		end
		game.Workspace.DescendantAdded:Connect(DescendantAdded)
		for i = 1,720 do
			if Collision or T == nil or T.Parent == nil then
				break
			else
				LastPos = T.Position
				local T = T:GetTouchingParts()
				for i = 1,#T do
					if T[i].CanCollide or T[i].Parent:FindFirstChildWhichIsA("Humanoid") then
						Collision = true
						if game:GetService("Players"):GetPlayerFromCharacter(T[i].Parent) == o then
							Yikes = true
						end
					end
				end
				if i == 720 then
					Yikes = true
				end
			end
			wait(0.25)
		end
		if T and T.Parent then
			T.Transparency = 0
			if t and t.Parent then
				t.Transparency = 0
			end
			if o and o.Parent and o.Neutral == false then
				T.BrickColor = o.TeamColor
			end
			if Yikes then
				if S then
					S:Play()
				end
				for i = 1,13 do
					if T then
						T.Material = Enum.Material.Neon
					end
					wait(0.1)
					if T then
						T.Material = Enum.Material.Metal
					end
					wait(0.1)
				end
			end
			if T then
				LastPos = T.Position
				T.Material = Enum.Material.Neon
			end
		end
		if F then
			F.Enabled = true
			if o and o.Parent and o.Neutral == false then
				F.Color = o.TeamColor.Color
				F.SecondaryColor = o.TeamColor.Color
			end
		end
		P.Position = LastPos
		P.Parent = script
		Explosion.Position = LastPos
		Explosion.Parent = game.Workspace
		Particles:Emit(500)
		delay(0,function()
			if T then
				Kaboom(T.Position)
			end
		end)
		if S and S.Parent then
			S:Stop()
		end
		for i = 1,10 do
			wait(0.12)
			if P and P.Parent then
				P.Transparency = P.Transparency + 0.05
				local Touch = P:GetTouchingParts()
				for i = 1,#Touch do
					if Touch[i] and Touch[i].Parent and Touch[i].Parent:FindFirstChildWhichIsA("Humanoid") then
						local Humanoid = Touch[i].Parent:FindFirstChildWhichIsA("Humanoid")
						if not (Humanoid:FindFirstChild("creator") and Humanoid:FindFirstChild("creator"):IsA("ObjectValue") and Humanoid.creator.Value == o) then
							Humanoid:TakeDamage(2048)
							local creator = Instance.new("ObjectValue",Humanoid)
							creator.Name = "creator"
							if o and o.Parent then
								creator.Value = o
							end
							game:GetService("Debris"):AddItem(creator,0.2)
							delay(0,function()
								HitSound(P.Position)
							end)
						end
						local Tag2 = Touch[i].Parent:FindFirstChild("FakeHumanoid")
						if Tag2 and o and o.Parent then
							Tag2.Value = o.Name
						end
					end
				end
			end
		end
		if P and P.Parent then
			P:Destroy()
		end
	end
	if T and T.Parent ~= nil then
		T.Name = "Effect"
		game:GetService("Debris"):AddItem(T,10)
	end
end
function NameMatch(a)
	local name = string.lower(a.Name)
	if name == "torso" or name == "uppertorso" or name == "humanoidrootpart" or name == "t" or name == "bomb" or name == "subspacetripmine" or name == "mine" or name == "handle" or name == "caltrop" or name == "darttrap" or name == "trickortrap" or name == "ninjastickybomb" or name == "landmine" or name == "rocket" or name == "leftrocket" or name == "rightrocket" or name == "rocketclone" or name == "missile" or name == "hedgehog" or name == "blueblur" or name == "laser" or name == "fusebomb" or name == "projectile" then
		return true
	else
		return false
	end
end
function Hit(hit,p,o,d,s,t,a,B,I)
	local OOF = math.random(1,10) == 1
	if hit and hit.Parent then
		local Humanoid = hit.Parent:FindFirstChildWhichIsA("Humanoid")
		if Humanoid then
			if p then
				p:Emit(100)
			end
			Humanoid:TakeDamage(16)
			local creator = Instance.new("ObjectValue",Humanoid)
			creator.Name = "creator"
			if o and o.Parent then
				creator.Value = o
			end
			game:GetService("Debris"):AddItem(creator,0.2)
			if s then
				Humanoid:TakeDamage(20)
				if d then
					d.PlaybackSpeed = 1.14
					d:Play()
				end
				if OOF then
					Humanoid:TakeDamage(1164)
				end
			end
			if a then
				a.PlaybackSpeed = 1
				a:Play()
			end
		elseif Humanoid == nil and (hit:GetMass() < 120 or (s and hit:GetMass() < 2400)) then
			if p then
				p:Emit(100)
			end
			hit:BreakJoints()
			if a then
				a.PlaybackSpeed = 1
				a:Play()
			end
		end
		local Tag2 = hit.Parent:FindFirstChild("FakeHumanoid")
		if Tag2 and o and o.Parent then
			Tag2.Value = o.Name
		end
		if s == true then
			if p then
				p:Emit(100)
			end
			if OOF then
				B.StudsOffsetWorldSpace = t.Position
				I.ImageColor3 = t.Color
				I.ImageTransparency = 0
				hit:BreakJoints()
				p:Emit(320)
				HitSound(hit.Position)
				if hit.Anchored == false and hit.Size.Magnitude < 20 then
					hit.Transparency = 0.5
					local Parent = hit.Parent
					if Parent:IsA("Tool") or Parent:IsA("Accoutrement") then
						local FoundOtherPart = false
						local D = Parent:GetDescendants()
						for i = 1,#D do
							if D[i]:IsA("BasePart") and D[i] ~= hit then
								FoundOtherPart = true
							end
						end
						if FoundOtherPart == false then
							game:GetService("Debris"):AddItem(Parent,0.5)
						end
					end
					game:GetService("Debris"):AddItem(hit,0.5)
				end
			end
		end
	end
end
function ReadySword()
	local Tool = Instance.new("Tool",owner.Backpack)
	Tool.Name = "Sword"
	Tool.TextureId = "rbxasset://textures/DevConsole/Close.png"
	Tool.GripPos = Vector3.new(0,-2,0.25)
	Tool.GripForward = Vector3.new(0,0.5,-0.85)
	local Torso = Instance.new("Part",Tool)
	Torso.Name = "Handle"
	Torso.Size = Vector3.new(0.2,4,1)
	Torso.BrickColor = BrickColor.new("Medium stone grey")
	Torso.Material = Enum.Material.Metal
	Torso.Locked = true
	Torso.CustomPhysicalProperties = PhysicalProperties.new(Enum.Material.Metal)
	local PointLight = Instance.new("PointLight",Torso)
	PointLight.Range = 21
	PointLight.Shadows = true
	PointLight.Brightness = 5
	local SoundA = Instance.new("Sound",Torso)
	SoundA.SoundId = "rbxasset://sounds/swordslash.wav"
	SoundA.Volume = 1.2
	local SoundB = Instance.new("Sound",Torso)
	SoundB.SoundId = "rbxasset://sounds/swordlunge.wav"
	SoundB.Volume = 1.2
	local SoundC = Instance.new("Sound",Torso)
	SoundC.SoundId = "rbxasset://sounds/flashbulb.wav"
	SoundC.Volume = 1.2
	local SoundD = Instance.new("Sound",Torso)
	SoundD.SoundId = "rbxasset://sounds/uuhhh.mp3"
	SoundD.Volume = 1.2
	local SoundE = Instance.new("Sound",Torso)
	SoundE.SoundId = "rbxasset://sounds/kerplunk.wav"
	SoundE.Volume = 1.2
	local SoundF = Instance.new("Sound",Torso)
	SoundF.SoundId = "rbxasset://sounds/bass.mp3"
	SoundF.Volume = 1.2
	local A = Instance.new("Attachment",Torso)
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
	local BA0 = Instance.new("Attachment",Torso)
	BA0.Position = Vector3.new(0,2,0.5)
	local BA1 = Instance.new("Attachment",Torso)
	BA1.Position = Vector3.new(0,-2,0.5)
	local ShipTrail = Instance.new("Trail",script)
	ShipTrail.Color = ColorSequence.new(Torso.Color)
	ShipTrail.Transparency = NumberSequence.new(0,1)
	ShipTrail.MinLength = 0.02
	ShipTrail.Lifetime = 0.3
	ShipTrail.Attachment0 = BA0
	ShipTrail.Attachment1 = BA1
	local Beam = Instance.new("Beam",script)
	Beam.Attachment0 = A
	local Bill = Instance.new("BillboardGui",script)
	Bill.Size = UDim2.new(16,0,16,0)
	local Image = Instance.new("ImageLabel",Bill)
	Image.Image = "rbxasset://textures/sparkle.png"
	Image.Size = UDim2.new(1,0,1,0)
	Image.Position = UDim2.new(0.5,0,0.5,0)
	Image.AnchorPoint = Vector2.new(0.5,0.5)
	Image.ImageTransparency = 1
	Image.BackgroundTransparency = 1
	local Alternate = 0
	local Fire = 0
	local Detect = 6
	local HP = owner.Character:FindFirstChildWhichIsA("Humanoid")
	local LastDist = math.huge
	local LastSuper = false
	local LastLaunch = false
	local Stood = false
	local function Equipped()
		Fire = math.max(-20,math.min(0,Fire))
		Tool.Enabled = true
	end
	Tool.Equipped:Connect(Equipped)
	local function Touched(hit)
		local Player = game:GetService("Players"):GetPlayerFromCharacter(Tool.Parent)
		local Humanoid = Tool.Parent:FindFirstChildWhichIsA("Humanoid")
		if Humanoid and Humanoid:GetState() ~= Enum.HumanoidStateType.Dead and Fire > 0 then
			Hit(hit,Particles,Player,SoundD,LastSuper,Torso,SoundE,Bill,Image)
			if SoundC then
				SoundC.PlaybackSpeed = 1.6
				SoundC:Play()
			end
			if Particles then
				Particles.Color = ColorSequence.new(Torso.Color)
				Particles:Emit(16)
			end
		end
	end
	Torso.Touched:Connect(Touched)
	local function ValueChange()
		if Tool.Enabled == false then
			if Torso and Fire <= 0 then
				local Player = game:GetService("Players"):GetPlayerFromCharacter(Tool.Parent)
				local Character = Tool.Parent
				local Humanoid
				if Character then
					Humanoid = Tool.Parent:FindFirstChildWhichIsA("Humanoid")
				end
				if Humanoid and Humanoid:GetState() ~= Enum.HumanoidStateType.Dead then
					Tool.GripForward = Vector3.new(0,0.99,0.01)
					local Super = (Fire <= -30)
					local LaunchDirection = Vector3.new(0,0,0)
					local Launch = false
					if Humanoid.MoveDirection.X ~= 0 or Humanoid.MoveDirection.Z ~= 0 then
						LaunchDirection = Torso.CFrame.UpVector
						Launch = true
					end
					if Humanoid:GetState() ~= Enum.HumanoidStateType.Running and Humanoid:GetState() ~= Enum.HumanoidStateType.RunningNoPhysics then
						LaunchDirection = LaunchDirection + Vector3.new(0,2,0)
						if Launch == true then
							LaunchDirection = LaunchDirection + Vector3.new(0,-1,0)
						end
						Launch = true
					end
					LastSuper = false
					LastLaunch = false
					if Super == true then
						LastSuper = true
					end
					if Launch == true then
						LastLaunch = true
					else
						Tool.GripForward = Vector3.new(0,0.5,-0.85)
					end
					if Super and Launch then
						local toolanim = Instance.new("StringValue",Tool)
						toolanim.Name = "toolanim"
						toolanim.Value = "Lunge"
					else
						local toolanim = Instance.new("StringValue",Tool)
						toolanim.Name = "toolanim"
						toolanim.Value = "Slash"
					end
					if Super and Humanoid.MoveDirection.X == 0 and Humanoid.MoveDirection.Z == 0 then
						Stood = true
					else
						Stood = false
					end
					if Super == true and Launch == true then
						SoundB.PlaybackSpeed = 1.15
						SoundB:Play()
						if Humanoid.SeatPart == nil then
							Humanoid.PlatformStand = false
							Humanoid.Sit = false
							Humanoid.Jump = true
						elseif LaunchDirection.Y > 0 then
							LaunchDirection = Vector3.new(LaunchDirection.X,LaunchDirection.Y * 0.2,LaunchDirection.Z)
						end
						local BodyVelocity = Instance.new("BodyVelocity",Torso)
						BodyVelocity.MaxForce = Vector3.new(1000000,100000,1000000)
						BodyVelocity.Velocity = LaunchDirection * 60
						game:GetService("Debris"):AddItem(BodyVelocity,0.6)
					end
					if SoundA then
						SoundA.PlaybackSpeed = 1.4
						SoundA:Play()
					end
					Fire = 12
					if Super == true then
						Fire = 16
					end
				end
			end
		end
	end
	Tool:GetPropertyChangedSignal("Enabled"):Connect(ValueChange)
	local function Activated()
		Tool.Enabled = false
	end
	Tool.Activated:Connect(Activated)
	while Tool and Tool:FindFirstAncestorWhichIsA("DataModel") do
		if Tool.Parent then
			local Player = game:GetService("Players"):GetPlayerFromCharacter(Tool.Parent)
			local Character = Tool.Parent
			local Humanoid
			if Character then
				Humanoid = Tool.Parent:FindFirstChildWhichIsA("Humanoid")
			end
			if Detect <= 0 then
				LastDist = math.huge
			end
			if Tool:FindFirstAncestorWhichIsA("Workspace") and Detect <= 0 then
				Detect = 6
				local E = {}
				local D = game.Workspace:GetDescendants()
				for i = 1,#D do
					if D[i]:IsA("BasePart") and D[i].Parent and D[i].Parent ~= Character and D[i].Parent:IsA("Tool") == false and D[i].Parent:IsA("Accoutrement") == false  then
						if NameMatch(D[i]) or D[i]:FindFirstChildWhichIsA("TouchTransmitter") then
							table.insert(E,D[i])
						end
					end
				end
				local ClosestDist = math.huge
				for i = 1,#E do
					local Dist = (E[i].Position - Torso.Position).Magnitude
					if Dist < 126 then 
						if Dist < ClosestDist then
							ClosestDist = Dist
						end
						local SelectionBox = Instance.new("SelectionBox",script)
						SelectionBox.LineThickness = 0.05
						SelectionBox.Color3 = Torso.Color
						SelectionBox.SurfaceColor3 = E[i].Color
						SelectionBox.SurfaceTransparency = 0.5
						SelectionBox.Adornee = E[i]
						delay(0.12,function()
							SelectionBox:Destroy()
						end)
						if Dist <= 31.5 then
							delay(0.12,function()
								local SelectionBox = Instance.new("SelectionBox",script)
								SelectionBox.LineThickness = 0.05
								SelectionBox.Color3 = Torso.Color
								SelectionBox.SurfaceColor3 = E[i].Color
								SelectionBox.SurfaceTransparency = 0.5
								SelectionBox.Adornee = E[i]
								delay(0.12,function()
									SelectionBox:Destroy()
								end)
							end)
						end
					end
				end
				if SoundF then
					SoundF.Volume = (126 - ClosestDist) / 150
					if ClosestDist <= 126 then
						SoundF.PlaybackSpeed = 1.6
						SoundF.TimePosition = 0.2
						SoundF:Play()
						if ClosestDist <= 31.5 then
							delay(0.12,function()
								SoundF.PlaybackSpeed = 1.2
								SoundF.TimePosition = 0.2
								SoundF:Play()
							end)
						end
					else
						SoundF:Stop()
					end
				end
				LastDist = ClosestDist
			end
			if LastSuper and Fire == 0 and Humanoid and Humanoid.MoveDirection.X == 0 and Humanoid.MoveDirection.Z == 0 and Stood then
				local Part = Instance.new("Part",script)
				Part.Name = "Bomb"
				Part.Locked = true
				Part.Material = Enum.Material.Metal
				Part.BrickColor = Torso.BrickColor
				Part.Size = Vector3.new(1.5,1,1.5)
				Part.Position = Torso.Position
				local Part2 = Part:Clone()
				Part2.Name = "BombBase"
				Part2.Size = Vector3.new(1.75,1,1.75)
				Part2.Parent = Part
				Part2.BrickColor = BrickColor.new("Dark stone grey")
				local Weld = Instance.new("Weld",Part)
				Weld.Part0 = Part
				Weld.Part1 = Part2
				Weld.C0 = CFrame.new(0,-1,0)
				local SoundG = Instance.new("Sound",Part)
				SoundG.SoundId = "rbxasset://sounds/Rocket whoosh 01.wav"
				SoundG.Volume = 0.4
				delay(0,function()
					BombsAway(Part,Part2,SoundG,Player)
				end)
			end
			if Fire > 0 then
				if LastSuper and LastLaunch then
					Tool.GripForward = Vector3.new(0,0.99,0.01)
				else
					Tool.GripForward = Vector3.new(0,0.5,-0.85)
				end
			else
				Tool.GripForward = Vector3.new(0,0.5,-0.85)
			end
			Image.ImageTransparency = Image.ImageTransparency + 0.1
			Fire = Fire - 1
			Detect = Detect - 1
			if Fire == 0 then
				Tool.Enabled = true
			end
			if Torso and Fire <= -30 then
				Torso.Material = Enum.Material.Neon
			elseif Torso then
				Torso.Material = Enum.Material.Metal
			end
			Tool.ToolTip = "D = "..math.ceil(LastDist)
			if LastDist == math.huge then
				Tool.ToolTip = "D = ???"
			end
			if Torso then
				if LastDist > 126 then
					Torso.BrickColor = BrickColor.new("Toothpaste")
					if ShipTrail then
						ShipTrail.Color = ColorSequence.new(Color3.new(0,1,1))
					end
				elseif LastDist > 94.5 then
					Torso.BrickColor = BrickColor.new("Lime green")
					if ShipTrail then
						ShipTrail.Color = ColorSequence.new(Color3.new(0,1,0))
					end
				elseif LastDist > 63 then
					Torso.BrickColor = BrickColor.new("New Yeller")
					if ShipTrail then
						ShipTrail.Color = ColorSequence.new(Color3.new(1,1,0))
					end
				elseif LastDist > 31.5 then
					Torso.BrickColor = BrickColor.new("Hot pink")
					if ShipTrail then
						ShipTrail.Color = ColorSequence.new(Color3.new(1,0,1))
					end
				else
					Torso.BrickColor = BrickColor.new("Really red")
					if ShipTrail then
						ShipTrail.Color = ColorSequence.new(Color3.new(1,0,0))
					end
				end
			end
			if owner and owner.Parent and owner.Neutral == false then
				local TeamColor = owner.TeamColor
				Torso.BrickColor = TeamColor
			end
			if Torso and PointLight then
				Alternate = Alternate + 1
				if Alternate > 8 then
					Alternate = 0
				end
				if Alternate <= 3 then
					PointLight.Color = Color3.new(1,1,1)
				else
					PointLight.Color = Torso.Color
				end
				if HP.Health <= 40 then
					if PointLight.Brightness == 5 then
						PointLight.Brightness = 3.5
					elseif PointLight.Brightness == 3.5 then
						PointLight.Brightness = 1.5
					elseif PointLight.Brightness == 1.5 then
						PointLight.Brightness = 1
					elseif PointLight.Brightness == 1 then
						PointLight.Brightness = 2.5
					elseif PointLight.Brightness == 2.5 then
						PointLight.Brightness = 4.5
					elseif PointLight.Brightness == 4.5 then
						PointLight.Brightness = 5
					end
				else
					PointLight.Brightness = 5
				end
			end
		end
		wait(0.04)
	end
end
local PartB = Instance.new("Part")
local SB = Instance.new("Sound",PartB)
SB.SoundId = "rbxasset://sounds/impact_explosion_03.mp3"
SB.Volume = 1.4
SB.PlayOnRemove = true
local PartC = Instance.new("Part")
local SC = Instance.new("Sound",PartC)
SC.SoundId = "rbxasset://sounds/collide.wav"
SC.Volume = 1.4
SC.PlayOnRemove = true
local PartD = Instance.new("Part")
local SD = Instance.new("Sound",PartD)
SD.SoundId = "rbxasset://sounds/Rocket shot.wav"
SD.Volume = 1.4
SD.PlayOnRemove = true
PartB.Anchored = true
PartC.Anchored = true
PartD.Anchored = true
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
local function Kaboom(pos)
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
function NearNumber(a,b)
	if a + 0.375 >= b and a - 0.375 <= b then
		return true
	else
		return false
	end
end
local function Hit(hit,p,o,d,s,t)
	if hit and hit.Parent then
		local Humanoid = hit.Parent:FindFirstChildWhichIsA("Humanoid")
		if Humanoid then
			if p then
				p:Emit(100)
			end
			Humanoid:TakeDamage(12)
			local creator = Instance.new("ObjectValue",Humanoid)
			creator.Name = "creator"
			if o and o.Parent then
				creator.Value = o
			end
			game:GetService("Debris"):AddItem(creator,0.2)
			if s then
				Humanoid:TakeDamage(588)
				if d then
					d.PlaybackSpeed = 1.175
					d:Play()
				end
			end
			delay(0,function()
				HitSound(hit.Position)
			end)
		elseif Humanoid == nil and (hit:GetMass() < 120 or (s and hit:GetMass() < 2400)) then
			if p then
				p:Emit(100)
			end
			hit:BreakJoints()
			delay(0,function()
				HitSound(hit.Position)
			end)
		end
		local Tag2 = hit.Parent:FindFirstChild("FakeHumanoid")
		if Tag2 and o and o.Parent then
			Tag2.Value = o.Name
		end
		if s == true then
			if p then
				p:Emit(100)
			end
			delay(0,function()
				HitSound(hit.Position)
			end)
			local Direction = (hit.Position - t.Position).unit
			local BodyForce = Instance.new("BodyForce",hit)
			BodyForce.Force = Direction * 160000
			game:GetService("Debris"):AddItem(BodyForce,0.2)
			if math.random(1,32) == 1 then
				hit:BreakJoints()
				p:Emit(320)
				Kaboom(hit.Position)
			end
		end
	end
end
function ReadyShield()
	local Tool = Instance.new("Tool",owner.Backpack)
	Tool.Name = "Shield"
	Tool.TextureId = "rbxasset://textures/blackBkg_round.png"
	Tool.GripPos = Vector3.new(1,0.5,0.5)
	local Torso = Instance.new("Part",Tool)
	Torso.Name = "Handle"
	Torso.Size = Vector3.new(4,4,1)
	Torso.BrickColor = BrickColor.new("Medium stone grey")
	Torso.Material = Enum.Material.Metal
	Torso.Locked = true
	Torso.CustomPhysicalProperties = PhysicalProperties.new(Enum.Material.Metal)
	local SoundA = Instance.new("Sound",Torso)
	SoundA.SoundId = "rbxasset://sounds/swordslash.wav"
	SoundA.Volume = 1.2
	local SoundB = Instance.new("Sound",Torso)
	SoundB.SoundId = "rbxasset://sounds/Shoulder fired rocket.wav"
	SoundB.Volume = 1.2
	local SoundC = Instance.new("Sound",Torso)
	SoundC.SoundId = "rbxasset://sounds/flashbulb.wav"
	SoundC.Volume = 1.2
	local SoundD = Instance.new("Sound",Torso)
	SoundD.SoundId = "rbxasset://sounds/Kid saying Ouch.wav"
	SoundD.Volume = 1.2
	local A = Instance.new("Attachment",Torso)
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
	local BA0 = Instance.new("Attachment",Torso)
	BA0.Position = Vector3.new(-2,0,0.5)
	local BA1 = Instance.new("Attachment",Torso)
	BA1.Position = Vector3.new(2,0,0.5)
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
	local Bill = Instance.new("BillboardGui",script)
	Bill.Size = UDim2.new(16,0,16,0)
	local Image = Instance.new("ImageLabel",Bill)
	Image.Image = "rbxasset://textures/sparkle.png"
	Image.Size = UDim2.new(1,0,1,0)
	Image.Position = UDim2.new(0.5,0,0.5,0)
	Image.AnchorPoint = Vector2.new(0.5,0.5)
	Image.ImageTransparency = 1
	Image.BackgroundTransparency = 1
	Fire = 0
	local Resistance = 200
	local Connection
	local CurrentHumanoid
	local CurrentHealth
	local LastSuper = false
	local function HealthChanged(NewHealth)
		if CurrentHumanoid ~= nil then
			if CurrentHumanoid.Health < CurrentHealth then
				Resistance = Resistance - math.min(CurrentHealth - CurrentHumanoid.Health,60)
				CurrentHumanoid.Health = CurrentHealth
				if Torso then
					HitSound(Torso.Position)
					Bill.StudsOffsetWorldSpace = Torso.Position
					Image.ImageColor3 = Torso.Color
					Image.ImageTransparency = 0
				end
				if Resistance <= 0 then
					local Player = game:GetService("Players"):GetPlayerFromCharacter(CurrentHumanoid.Parent)
					if Player then
						Tool.Parent = Player:FindFirstChildWhichIsA("Backpack")
					else
						Tool.Parent = nil
					end
				end
			end
			if CurrentHumanoid ~= nil then
				CurrentHealth = CurrentHumanoid.Health
			end
		end
	end
	local function Equipped()
		Resistance = math.max(80,Resistance)
		Fire = math.max(-55,math.min(0,Fire))
		Tool.Enabled = true
		local Humanoid = Tool.Parent:FindFirstChildWhichIsA("Humanoid")
		if Humanoid then
			CurrentHumanoid = Humanoid
			CurrentHealth = Humanoid.Health
			Connection = Humanoid.HealthChanged:Connect(HealthChanged)
		end
	end
	local function Unequipped()
		local a = Connection
		local b = CurrentHumanoid
		if a then
			a:Disconnect()
		end
		if CurrentHumanoid then
			CurrentHumanoid = nil
		end
		local ch = b.Health
		local Connect = b.HealthChanged:Connect(function(NewHealth)
			if b.Health < ch then
				if Torso then
					HitSound(Torso.Position)
					Bill.StudsOffsetWorldSpace = Torso.Position
					Image.ImageColor3 = Torso.Color
					Image.ImageTransparency = 0
				end
				b.Health = ch
			end
			ch = b.Health
		end)
		delay(0.8,function()
			Connect:Disconnect()
		end)
	end
	Tool.Equipped:Connect(Equipped)
	Tool.Unequipped:Connect(Unequipped)
	local function Touched(hit)
		local Player = game:GetService("Players"):GetPlayerFromCharacter(Tool.Parent)
		local Humanoid = Tool.Parent:FindFirstChildWhichIsA("Humanoid")
		if Humanoid and Humanoid:GetState() ~= Enum.HumanoidStateType.Dead and Fire > 0 then
			Hit(hit,Particles,Player,SoundD,LastSuper,Torso)
			if SoundC then
				SoundC.PlaybackSpeed = 1.6
				SoundC:Play()
			end
			if Particles then
				Particles.Color = ColorSequence.new(Torso.Color)
				Particles:Emit(16)
			end
		end
	end
	Torso.Touched:Connect(Touched)
	local function ValueChange()
		if Tool.Enabled == false then
			if Torso and Fire <= 0 then
				local Player = game:GetService("Players"):GetPlayerFromCharacter(Tool.Parent)
				local Character = Tool.Parent
				local Humanoid
				if Character then
					Humanoid = Tool.Parent:FindFirstChildWhichIsA("Humanoid")
				end
				if Humanoid and Humanoid:GetState() ~= Enum.HumanoidStateType.Dead then
					local Super = (Fire <= -75)
					local LaunchDirection = Vector3.new(0,0,0)
					local Launch = false
					if Humanoid.MoveDirection.X ~= 0 or Humanoid.MoveDirection.Z ~= 0 then
						LaunchDirection = Torso.CFrame.lookVector
						Launch = true
					end
					if Humanoid:GetState() ~= Enum.HumanoidStateType.Running and Humanoid:GetState() ~= Enum.HumanoidStateType.RunningNoPhysics then
						LaunchDirection = LaunchDirection + Vector3.new(0,2,0)
						if Launch == true then
							LaunchDirection = LaunchDirection + Vector3.new(0,-1,0)
						end
						Launch = true
					end
					LastSuper = false
					if Super == true then
						LastSuper = true
					end
					if Super and Launch then
						local toolanim = Instance.new("StringValue",Tool)
						toolanim.Name = "toolanim"
						toolanim.Value = "Lunge"
					else
						local toolanim = Instance.new("StringValue",Tool)
						toolanim.Name = "toolanim"
						toolanim.Value = "Slash"
					end
					if Super == true and Launch == true then
						SoundB.PlaybackSpeed = 1.75
						SoundB:Play()
						if Humanoid.SeatPart == nil then
							Humanoid.PlatformStand = false
							Humanoid.Sit = false
							Humanoid.Jump = true
						elseif LaunchDirection.Y > 0 then
							LaunchDirection = Vector3.new(LaunchDirection.X,LaunchDirection.Y * 0.2,LaunchDirection.Z)
						end
						local BodyVelocity = Instance.new("BodyVelocity",Torso)
						BodyVelocity.MaxForce = Vector3.new(1000000,100000,1000000)
						BodyVelocity.Velocity = LaunchDirection * 120
						game:GetService("Debris"):AddItem(BodyVelocity,0.6)
					end
					if SoundA then
						SoundA.PlaybackSpeed = 1.4
						SoundA:Play()
					end
					Fire = 12
					if Super == true then
						Fire = 16
					end
				end
			end
		end
	end
	Tool:GetPropertyChangedSignal("Enabled"):Connect(ValueChange)
	local function Activated()
		Tool.Enabled = false
	end
	Tool.Activated:Connect(Activated)
	while Tool and Tool:FindFirstAncestorWhichIsA("DataModel") do
		Image.ImageTransparency = Image.ImageTransparency + 0.1
		Torso.CanCollide = true
		Resistance = math.min(200,Resistance + 0.125)
		Fire = Fire - 1
		if Fire == 0 then
			Tool.Enabled = true
		end
		if Torso and Fire <= -75 then
			Torso.Material = Enum.Material.Neon
		elseif Torso then
			Torso.Material = Enum.Material.Metal
		end
		Tool.ToolTip = "R = "..math.ceil(Resistance)
		if Torso then
			if Resistance > 160 then
				Torso.BrickColor = BrickColor.new("Toothpaste")
				if ShipTrail then
					ShipTrail.Color = ColorSequence.new(Color3.new(0,1,1))
				end
			elseif Resistance > 120 then
				Torso.BrickColor = BrickColor.new("Lime green")
				if ShipTrail then
					ShipTrail.Color = ColorSequence.new(Color3.new(0,1,0))
				end
			elseif Resistance > 80 then
				Torso.BrickColor = BrickColor.new("New Yeller")
				if ShipTrail then
					ShipTrail.Color = ColorSequence.new(Color3.new(1,1,0))
				end
			elseif Resistance > 40 then
				Torso.BrickColor = BrickColor.new("Hot pink")
				if ShipTrail then
					ShipTrail.Color = ColorSequence.new(Color3.new(1,0,1))
				end
			else
				Torso.BrickColor = BrickColor.new("Really red")
				if ShipTrail then
					ShipTrail.Color = ColorSequence.new(Color3.new(1,0,0))
				end
			end
		end
		if owner and owner.Parent and owner.Neutral == false then
			local TeamColor = owner.TeamColor
			Torso.BrickColor = TeamColor
		end
		wait(0.04)
	end
end
owner.Chatted:Connect(function(msg)
	if msg == "tool/blaster" then
		ReadyBlaster()
	elseif msg == "tool/medic" then
		ReadyMedic()
	elseif msg == "tool/sword" then
		ReadySword()
	elseif msg == "tool/shield" then
		ReadyShield()
	elseif msg == "tool/all" then
		coroutine.wrap(function()
			ReadyBlaster()
		end)()
		coroutine.wrap(function()
			ReadyMedic()
		end)()
		coroutine.wrap(function()
			ReadySword()
		end)()
		coroutine.wrap(function()
			ReadyShield()
		end)()
	end
end)
print([[
JJK83's Tools
Say tool/(tool name here) to get a tool, for example: tool/medic
Tools:
1. blaster
2. medic
3. sword
4. shield
5. all (gives all tools)
]])
