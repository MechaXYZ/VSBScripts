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
local Hint = Instance.new("Hint",script)
local HC = Instance.new("Part")
HC.Name = "HitboxCheck"
HC.Anchored = true
HC.Locked = true
HC.Size = Vector3.new(2.5,2.5,600)
HC.Transparency = 1
HC.CanCollide = false
HC.Touched:Connect(function()
end)
local Color = BrickColor.new("White")
local Choice = math.random(1,6)
if Choice == 1 then
	Color = BrickColor.new("Bright red")
elseif Choice == 2 then
	Color = BrickColor.new("Bright yellow")
elseif Choice == 3 then
	Color = BrickColor.new("Bright green")
elseif Choice == 4 then
	Color = BrickColor.new("Bright blue")
elseif Choice == 5 then
	Color = BrickColor.new("Bright violet")
end
local S = Instance.new("Sound",script)
S.SoundId = "rbxasset://sounds/bass.mp3"
S.Volume = 0.35
local PartA = Instance.new("Part")
PartA.Transparency = 1
PartA.CanCollide = false
local SA = Instance.new("Sound",PartA)
SA.SoundId = "rbxasset://sounds/bass.mp3"
SA.Volume = 2.4
SA.PlayOnRemove = true
SA.TimePosition = 0.2
local PartB = Instance.new("Part")
PartB.Transparency = 1
PartB.CanCollide = false
local SB = Instance.new("Sound",PartB)
SB.SoundId = "rbxasset://sounds/electronicpingshort.wav"
SB.Volume = 2.4
SB.PlayOnRemove = true
SB.TimePosition = 0.2
local PartC = Instance.new("Part")
PartC.Transparency = 1
PartC.CanCollide = false
local SC = Instance.new("Sound",PartC)
SC.SoundId = "rbxasset://sounds/snap.mp3"
SC.Volume = 2.4
SC.PlayOnRemove = true
SC.TimePosition = 0.2
PartA.Anchored = true
PartB.Anchored = true
PartC.Anchored = true

function DeathSound(pos)
	for i = 1,17 do
		if SB and SB.Parent then
			local P = 1.55+i*0.05
			if i%2 == 0 then
				P = (P-0.05)/2
			end
			SB.PlaybackSpeed = P
		end
		if PartB then
			PartB.Position = pos
			PartB.Parent = script
			PartB.Parent = nil
		end
		wait(0.06)
	end
	for i = 1,20 do
		if SC and SC.Parent then
			SC.PlaybackSpeed = i * 0.1
		end
		if PartC then
			PartC.Position = pos
			PartC.Parent = script
			PartC.Parent = nil
		end
		wait(0.02)
	end
	for i = 1,20 do
		if SC and SC.Parent then
			SC.PlaybackSpeed = 2.1 - i * 0.1
		end
		if PartC then
			PartC.Position = pos
			PartC.Parent = script
			PartC.Parent = nil
		end
		wait(0.02)
	end
end
function HitSound(pos)
	local Choice = math.random(1,3)
	if Choice == 1 then
		for i = 1,10 do
			if SC and SC.Parent then
				SC.PlaybackSpeed = 1.5 - i * 0.1
			end
			if PartC then
				PartC.Position = pos
				PartC.Parent = script
				PartC.Parent = nil
			end
			wait(0.04)
		end
	elseif Choice == 2 then
		for i = 1,2 do
			if SC and SC.Parent then
				SC.PlaybackSpeed = 0.6
			end
			if PartC then
				PartC.Position = pos
				PartC.Parent = script
				PartC.Parent = nil
			end
			wait(0.04)
		end
		for i = 1,2 do
			if SC and SC.Parent then
				SC.PlaybackSpeed = 1.2
			end
			if PartC then
				PartC.Position = pos
				PartC.Parent = script
				PartC.Parent = nil
			end
			wait(0.04)
		end
	elseif Choice == 3 then
		for i = 1,5 do
			if SC and SC.Parent then
				SC.PlaybackSpeed = i * 0.25
			end
			if PartC then
				PartC.Position = pos
				PartC.Parent = script
				PartC.Parent = nil
			end
			wait(0.04)
		end
	end
end
function BANG(pos)
	local M = math.random(100,140)/100
	for i = 1,2 do
		if SC and SC.Parent then
			SC.PlaybackSpeed = 0.8*M
		end
		if PartC then
			PartC.Position = pos
			PartC.Parent = script
			PartC.Parent = nil
		end
		wait(0.04)
	end
	for i = 1,10 do
		if SC and SC.Parent then
			SC.PlaybackSpeed = 0.325*M - i * 0.02
		end
		if PartC then
			PartC.Position = pos
			PartC.Parent = script
			PartC.Parent = nil
		end
		wait(0.04)
	end
end
function ZAP(pos)
	for i = 1,6 do
		if SA and SA.Parent then
			SA.PlaybackSpeed = 2.3 * math.random(1,2)
		end
		if PartA then
			PartA.Position = pos
			PartA.Parent = script
			PartA.Parent = nil
		end
		wait(0.04)
	end
	for i = 1,6 do
		if SA and SA.Parent then
			SA.PlaybackSpeed = 1.15 * math.random(1,2)
		end
		if PartA then
			PartA.Position = pos
			PartA.Parent = script
			PartA.Parent = nil
		end
		wait(0.04)
	end
end
function Shatter(pos)
	for i = 1,20 do
		if SB and SB.Parent then
			SB.PlaybackSpeed = math.random(160,420) / 100
		end
		if PartB then
			PartB.Position = pos
			PartB.Parent = script
			PartB.Parent = nil
		end
		if SC and SC.Parent then
			SC.PlaybackSpeed = math.random(150,250) / 100
		end
		if PartC then
			PartC.Position = pos
			PartC.Parent = script
			PartC.Parent = nil
		end
		wait(math.random(1,i)/100)
	end
end
function Kaboom(pos)
	local Choice = math.random(1,3)
	if Choice == 1 then
		for i = 1,30 do
			if SC and SC.Parent then
				SC.PlaybackSpeed = 0.6 - i * 0.015
			end
			if PartC then
				PartC.Position = pos
				PartC.Parent = script
				PartC.Parent = nil
			end
			wait(0.06)
		end
	elseif Choice == 2 then
		for i = 1,20 do
			if SC and SC.Parent then
				SC.PlaybackSpeed = (2/i)+0.2
			end
			if PartC then
				PartC.Position = pos
				PartC.Parent = script
				PartC.Parent = nil
			end
			wait(0.02)
		end
	elseif Choice == 3 then
		for i = 1,3 do
			if SC and SC.Parent then
				SC.PlaybackSpeed = 3.4
			end
			if PartC then
				PartC.Position = pos
				PartC.Parent = script
				PartC.Parent = nil
			end
			wait(0.03)
		end
		for i = 1,20 do
			if SC and SC.Parent then
				SC.PlaybackSpeed = 1.4 - i * 0.06
			end
			if PartC then
				PartC.Position = pos
				PartC.Parent = script
				PartC.Parent = nil
			end
			wait(0.03)
		end
	end
end
function FallSound(pos)
	for i = 1,30 do
		if SB and SB.Parent then
			SB.PlaybackSpeed = 4 - i * 0.06
		end
		if PartB then
			PartB.Position = pos
			PartB.Parent = script
			PartB.Parent = nil
		end
		wait(0.06)
	end
end
function LaunchSound(pos)
	for i = 1,20 do
		if SC and SC.Parent then
			SC.PlaybackSpeed = i * 0.1
		end
		if PartC then
			PartC.Position = pos
			PartC.Parent = script
			PartC.Parent = nil
		end
		wait(0.02)
	end
	for i = 1,20 do
		if SA and SA.Parent then
			SA.PlaybackSpeed = 10 - i * 0.26
		end
		if PartA then
			PartA.Position = pos
			PartA.Parent = script
			PartA.Parent = nil
		end
		if SC and SC.Parent then
			SC.PlaybackSpeed = 2.1 - i * 0.1
		end
		if PartC then
			PartC.Position = pos
			PartC.Parent = script
			PartC.Parent = nil
		end
		wait(0.02)
	end
end
function Dong(pos)
	if SA and SA.Parent then
		SA.PlaybackSpeed = 9.2
	end
	if PartA then
		PartA.Position = pos
		PartA.Parent = script
		PartA.Parent = nil
	end
	if SB and SB.Parent then
		SB.PlaybackSpeed = 2.64
	end
	if PartB then
		PartB.Position = pos
		PartB.Parent = script
		PartB.Parent = nil
	end
	if SC and SC.Parent then
		SC.PlaybackSpeed = 2
	end
	if PartC then
		PartC.Position = pos
		PartC.Parent = script
		PartC.Parent = nil
	end
	wait(0.06)
	for i = 1,4 do
		if SA and SA.Parent then
			SA.PlaybackSpeed = 12.6
		end
		if PartA then
			PartA.Position = pos
			PartA.Parent = script
			PartA.Parent = nil
		end
		if SB and SB.Parent then
			SB.PlaybackSpeed = 3.6
		end
		if PartB then
			PartB.Position = pos
			PartB.Parent = script
			PartB.Parent = nil
		end
		wait(0.06)
	end
end

function KillChar(Char,T,bc)
	delay(0,function()
		if T.Position.Y < workspace.FallenPartsDestroyHeight then
			FallSound(T.Position)
			delay(0,function()
				Shatter(T.Position)
			end)
			BANG(T.Position)
		else
			DeathSound(T.Position)
		end
	end)
	local D = Char:GetDescendants()
	for i = 1,#D do
		if D[i]:IsA("TouchTransmitter") then
			D[i]:Destroy()
		end
	end
	for i = 1,17 do
		local Color = bc
		if i % 2 == 0 then
			Color = BrickColor.new("Institutional white")
		end
		if Char and Char.Parent then
			local C = Char:GetChildren()
			for i = 1,#C do
				if C[i]:IsA("BasePart") then
					C[i].Material = Enum.Material.Neon
					C[i].BrickColor = Color
					C[i].Velocity = Vector3.new()
					C[i].CanCollide = false
				end
			end
		end
		wait(0.06)
	end
	for i = 1,33 do
		local Color = bc
		if i % 2 ~= 0 then
			Color = BrickColor.new("Institutional white")
		end
		if Char and Char.Parent then
			local C = Char:GetChildren()
			for i = 1,#C do
				if C[i]:IsA("BasePart") then
					C[i].Material = Enum.Material.Neon
					C[i].BrickColor = Color
					C[i].Transparency = C[i].Transparency + 0.03
				end
			end
		end
		wait(0.06)
	end
	if Char and Char.Parent ~= nil then
		Char:Destroy()
	end
end
function Speech(a,b)
	for i = 1,string.len(a) do
		if S and string.sub(a,i,i) ~= " " then
			S.PlaybackSpeed = 1.6
			S.TimePosition = 0.2
			S:Play()
		elseif S then
			S:Stop()
		end
		wait(0.04)
	end
	if S then
		S:Stop()
	end
	wait(0.04)
	for i = 1,string.len(b) do
		if S and string.sub(b,i,i) ~= " " then
			S.PlaybackSpeed = 1.9
			S.TimePosition = 0.2
			S:Play()
		elseif S then
			S:Stop()
		end
		wait(0.04)
	end
	if S then
		S:Stop()
	end
end
function NearNumber(a,b)
	if a + 0.375 >= b and a - 0.375 <= b then
		return true
	else
		return false
	end
end
function NameMatch(a)
	local name = string.lower(a.Name)
	if name == "lava" or name == "hazard" or name == "spike" or name == "spikes" or name == "hurt" or name == "bomb" or name == "subspacetripmine" or name == "mine" or name == "damage" or name == "caltrop" or name == "acid" or name == "fire" or name == "ninjastickybomb" or name == "landmine" or name == "rocket" or name == "leftrocket" or name == "rightrocket" or name == "rocketclone" or name == "missile" or name == "hedgehog" or name == "blueblur" or name == "laser" or name == "kaboom" or name == "fusebomb" or name == "projectile" or name == "bullet" or name == "deadly" or name == "electric" or name == "electricity" or name == "flame" or name == "blade" or name == "sharp" or name == "explosion" or name == "zap" or name == "lightning" then
		return true
	else
		return false
	end
end
local RegHits = 0
function Shoot(C,bc,f,s,b,B,I,wr)
	local Bong = false
	local Confirm = false
	local function CountHit()
		if not Confirm then
			Confirm = true
			RegHits = RegHits + 1
			delay(0,function()
				wr.PlaybackSpeed = 1
				wr.TimePosition = 0.2
				wr:Play()
				wait(0.06)
				wr.PlaybackSpeed = 1.75
				wr.TimePosition = 0.2
				wr:Play()
			end)
		end
	end
	local P = Instance.new("Part",script)
	P.Name = "Laser"
	P.Anchored = true
	P.Locked = true
	P.Size = Vector3.new(1,1,10)
	P.Material = Enum.Material.Neon
	P.CFrame = C
	local HitTag = Instance.new("StringValue",P)
	HitTag.Name = "HitTag"
	HitTag.Value = "2 "..Color.Name
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
	if f == true and s == true then
		P.CFrame = P.CFrame * CFrame.new(0,0,0,-0.05,0,0,1)
	end
	P.BrickColor = bc
	P.Velocity = P.CFrame.lookVector * 80
	local Range = 16
	if f == true then
		Range = 32
		P.Name = "Kaboom"
		P.Velocity = P.CFrame.lookVector * 320 + Vector3.new(0,100,0)
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
				if Humanoid and not (Humanoid:FindFirstChild("creator") and Humanoid:FindFirstChild("creator"):IsA("ObjectValue") and Humanoid.creator.Value == nil) then
					Humanoid:TakeDamage(35)
					if f == true then
						Humanoid:TakeDamage(2013)
						delay(0,function()
							Dong(hit.Position)
						end)
						delay(0,function()
							Shatter(hit.Position)
						end)
					end
					local creator = Instance.new("ObjectValue",Humanoid)
					creator.Name = "creator"
					game:GetService("Debris"):AddItem(creator,0.14)
					delay(0,function()
						HitSound(hit.Position)
					end)
					if B.Size.X.Scale < 16 then
						B.StudsOffsetWorldSpace = hit.Position
						B.Size = UDim2.new(16,0,16,0)
						I.ImageColor3 = bc.Color
					end
					CountHit()
				end
				if hit.Parent then
					local Tag2 = hit.Parent:FindFirstChild("FakeHumanoid")
					if Tag2 then
						Tag2.Value = "2 "..Color.Name
						CountHit()
					end
				end
			end
		end
	end)
	for i = 1,Range do
		if P and P.Parent then
			if f == true then
				if SB and SB.Parent then
					SB.PlaybackSpeed = 4 - i * 0.06
				end
				if PartB then
					PartB.Position = P.Position
					PartB.Parent = script
					PartB.Parent = nil
				end
				if SC and SC.Parent then
					SC.PlaybackSpeed = 2 - i * 0.05
				end
				if PartC then
					PartC.Position = P.Position
					PartC.Parent = script
					PartC.Parent = nil
				end
			end
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
								if Humanoid and not (Humanoid:FindFirstChild("creator") and Humanoid:FindFirstChild("creator"):IsA("ObjectValue") and Humanoid.creator.Value == nil) then
									Humanoid:TakeDamage(35)
									if f == true then
										Humanoid:TakeDamage(2013)
										delay(0,function()
											Dong(T[i].Position)
										end)
										delay(0,function()
											Shatter(T[i].Position)
										end)
									end
									local creator = Instance.new("ObjectValue",Humanoid)
									creator.Name = "creator"
									game:GetService("Debris"):AddItem(creator,0.14)
									delay(0,function()
										HitSound(T[i].Position)
									end)
									if B.Size.X.Scale < 16 then
										B.StudsOffsetWorldSpace = T[i].Position
										B.Size = UDim2.new(16,0,16,0)
										I.ImageColor3 = bc.Color
									end
									CountHit()
								end
								if T[i].Parent then
									local Tag2 = T[i].Parent:FindFirstChild("FakeHumanoid")
									if Tag2 then
										Tag2.Value = "2 "..Color.Name
										CountHit()
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
	if P and P.Parent then
		P.CFrame = P.CFrame * CFrame.new(0,0,-5)
		if f == true and s == true then
			P.CFrame = P.CFrame * CFrame.new(0,0,0,0.05,0,0,1)
			P.Velocity = P.CFrame.lookVector * 240 + Vector3.new(0,240,0)
		end
		P.Shape = Enum.PartType.Ball
		if f == true then
			P.BrickColor = bc
			P.Size = Vector3.new(42,42,42)
			local Explosion = Instance.new("Explosion")
			Explosion.Position = P.Position
			Explosion.BlastRadius = 21
			Explosion.BlastPressure = 1000000
			Explosion.Visible = false
			Explosion.Parent = game.Workspace
			local P1 = Instance.new("SurfaceLight",P)
			P1.Angle = 130
			P1.Brightness = 40
			P1.Range = 60
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
			local function Hit(part)
				if part and part.Parent:FindFirstChildWhichIsA("Humanoid") then
					part.Parent:FindFirstChildWhichIsA("Humanoid"):TakeDamage(2048)
					local creator = Instance.new("ObjectValue",part.Parent:FindFirstChildWhichIsA("Humanoid"))
					creator.Name = "creator"
					if not Bong then
						Bong = true
						delay(0,function()
							BANG(part.Position)
						end)
					end
					game:GetService("Debris"):AddItem(creator,0.14)
					CountHit()
				elseif part and part.Parent:FindFirstChild("FakeHumanoid") and part.Parent.FakeHumanoid:IsA("StringValue") then
					part.Parent.FakeHumanoid.Value = "2 "..Color.Name
					CountHit()
				end
			end
			Explosion.Hit:Connect(Hit)
			delay(0,function()
				Kaboom(P.Position)
			end)
			delay(0,function()
				for i = 1,11 do
					if B.Size.X.Scale < 42 then
						B.StudsOffsetWorldSpace = P.Position
						B.Size = UDim2.new(42,0,42,0)
						if i%2 == 1 then
							I.ImageColor3 = bc.Color
						else
							I.ImageColor3 = Color3.new(1,1,1)
						end
					end
					wait(0.04)
				end
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
			if T[i] and T[i].Parent then
				local Humanoid = T[i].Parent:FindFirstChildWhichIsA("Humanoid")
				if Humanoid and not (Humanoid:FindFirstChild("creator") and Humanoid:FindFirstChild("creator"):IsA("ObjectValue") and Humanoid.creator.Value == nil) then
					Humanoid:TakeDamage(35)
					if f == true then
						Humanoid:TakeDamage(2013)
					end
					local creator = Instance.new("ObjectValue",Humanoid)
					creator.Name = "creator"
					game:GetService("Debris"):AddItem(creator,0.14)
					delay(0,function()
						HitSound(T[i].Position)
					end)
					if B.Size.X.Scale < 16 then
						B.StudsOffsetWorldSpace = T[i].Position
						B.Size = UDim2.new(16,0,16,0)
						I.ImageColor3 = bc.Color
					end
					CountHit()
				end
				if T[i].Parent then
					local Tag2 = T[i].Parent:FindFirstChild("FakeHumanoid")
					if Tag2 then
						Tag2.Value = "2 "..Color.Name
						CountHit()
					end
				end
			end
		end
		if f == true then
			for i = 1,10 do
				if P and P.Parent then
					P.Transparency = P.Transparency + 0.1
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
local Brightness = BrickColor.new("Dark stone grey")
local Pick = math.random(1,2)
if Pick == 1 then
	Brightness = BrickColor.new("Black")
end
function Ready()
	local MoveDirection = Vector3.new(0,0,0)
	local RunAwayDirection = Vector3.new(0,0,0)
	local RunAwayTimer = 0
	local Jump = false
	local Bla = false
	Spawned = Spawned + 1
	local FakeChar = Instance.new("Model",script)
	FakeChar.Name = "2NPC"..tostring(Spawned)
	local Head = Instance.new("Part",FakeChar)
	Head.Name = "H"
	Head.Size = Vector3.new(1,1,1)
	Head.Anchored = true
	Head.Locked = true
	Head.Material = Enum.Material.Neon
	local Torso = Instance.new("Part",FakeChar)
	Torso.Name = "T"
	Torso.Size = Vector3.new(2,2,1)
	Torso.Anchored = true
	Torso.Locked = true
	Torso.Material = Enum.Material.Neon
	Torso.Orientation = Vector3.new(0,90,0)
	local LeftArm = Instance.new("Part",FakeChar)
	LeftArm.Name = "LA"
	LeftArm.Size = Vector3.new(1,2,1)
	LeftArm.Anchored = true
	LeftArm.Locked = true
	LeftArm.Material = Enum.Material.Neon
	LeftArm.CanCollide = false
	local RightArm = Instance.new("Part",FakeChar)
	RightArm.Name = "RA"
	RightArm.Size = Vector3.new(1,2,1)
	RightArm.Anchored = true
	RightArm.Locked = true
	RightArm.Material = Enum.Material.Neon
	RightArm.CanCollide = false
	local LeftLeg = Instance.new("Part",FakeChar)
	LeftLeg.Name = "LL"
	LeftLeg.Size = Vector3.new(1,2,1)
	LeftLeg.Anchored = true
	LeftLeg.Locked = true
	LeftLeg.Material = Enum.Material.Neon
	local RightLeg = Instance.new("Part",FakeChar)
	RightLeg.Name = "RL"
	RightLeg.Size = Vector3.new(1,2,1)
	RightLeg.Anchored = true
	RightLeg.Locked = true
	RightLeg.Material = Enum.Material.Neon
	local Blast = Instance.new("Part",FakeChar)
	Blast.Name = "B"
	Blast.Size = Vector3.new(1,1,3)
	Blast.Anchored = true
	Blast.Locked = true
	Blast.Material = Enum.Material.Neon
	Blast.CanCollide = false
	Blast.Touched:Connect(function() end)
	local TouchInt = Blast:FindFirstChildWhichIsA("TouchTransmitter")
	if TouchInt then
		TouchInt:Destroy()
	end
	local PointLight = Instance.new("PointLight",Blast)
	PointLight.Range = 14
	PointLight.Shadows = true
	PointLight.Brightness = 5
	local SpotLight = Instance.new("SpotLight",Blast)
	SpotLight.Range = 60
	SpotLight.Shadows = true
	SpotLight.Brightness = 5
	local Left = Instance.new("Part",FakeChar)
	Left.Name = "L"
	Left.Size = Vector3.new(0.125,0.375,0.05)
	Left.Anchored = true
	Left.Locked = true
	Left.CanCollide = false
	Left.Transparency = 1
	local LD = Instance.new("Decal",Left)
	LD.Texture = "rbxasset://textures/CollisionGroupsEditor/unchecked.png"
	local Right = Instance.new("Part",FakeChar)
	Right.Name = "R"
	Right.Size = Vector3.new(0.125,0.375,0.05)
	Right.Anchored = true
	Right.Locked = true
	Right.CanCollide = false
	Right.Transparency = 1
	local RD = Instance.new("Decal",Right)
	RD.Texture = "rbxasset://textures/CollisionGroupsEditor/unchecked.png"
	Torso.Position = Vector3.new(math.random(-200,200),150,math.random(-200,200))
	local A = Instance.new("Attachment",Blast)
	A.Position = Vector3.new(0,0,-1.5)
	local BA0 = Instance.new("Attachment",Blast)
	BA0.Position = Vector3.new(-0.5,0,1.5)
	local BA1 = Instance.new("Attachment",Blast)
	BA1.Position = Vector3.new(0.5,0,1.5)
	local ShipTrail = Instance.new("Trail",script)
	ShipTrail.Color = ColorSequence.new(Blast.Color)
	ShipTrail.Transparency = NumberSequence.new(0,1)
	ShipTrail.MinLength = 0.02
	ShipTrail.Lifetime = 0.3
	ShipTrail.FaceCamera = true
	ShipTrail.Attachment0 = BA0
	ShipTrail.Attachment1 = BA1
	local Beam = Instance.new("Beam",script)
	Beam.Attachment0 = A
	Beam.FaceCamera = true
	local BBG = Instance.new("BillboardGui",FakeChar)
	BBG.Size = UDim2.new(20,0,5,0)
	BBG.LightInfluence = 0.25
	BBG.StudsOffsetWorldSpace = Vector3.new(0,3,0)
	BBG.Adornee = Head
	local TL = Instance.new("TextLabel",BBG)
	TL.AnchorPoint = Vector2.new(0.5,0.5)
	TL.Position = UDim2.new(0.5,0,0.5,0)
	TL.Size = UDim2.new(1.25,0,1.25,0)
	TL.BackgroundTransparency = 1
	TL.TextStrokeTransparency = 1
	TL.TextScaled = true
	TL.Font = Enum.Font.Code
	TL.TextColor3 = Color3.new(0,1,0)
	TL.TextStrokeColor3 = Color3.new(0,0,0)
	TL.TextTransparency = 1
	TL.Text = "> 2 "..Color.Name
	local Bill = Instance.new("BillboardGui",script)
	Bill.Size = UDim2.new(0,0,0,0)
	local Image = Instance.new("ImageLabel",Bill)
	Image.Image = "rbxasset://textures/DevConsole/Close.png"
	Image.Size = UDim2.new(1,0,1,0)
	Image.Position = UDim2.new(0.5,0,0.5,0)
	Image.AnchorPoint = Vector2.new(0.5,0.5)
	Image.BackgroundTransparency = 1
	local Bill2 = Instance.new("BillboardGui",script)
	Bill2.Size = UDim2.new(0,0,0,0)
	local Image2 = Instance.new("ImageLabel",Bill2)
	Image2.Image = "rbxasset://textures/Cursors/Gamepad/PointerOver.png"
	Image2.Size = UDim2.new(1,0,1,0)
	Image2.Position = UDim2.new(0.5,0,0.5,0)
	Image2.AnchorPoint = Vector2.new(0.5,0.5)
	Image2.BackgroundTransparency = 1
	local Bill3 = Instance.new("BillboardGui",script)
	Bill3.StudsOffsetWorldSpace = Torso.Position
	local Image3 = Instance.new("ImageLabel",Bill3)
	Image3.Image = "rbxasset://textures/DevConsole/Maximize.png"
	Image3.Size = UDim2.new(1,0,1,0)
	Image3.Position = UDim2.new(0.5,0,0.5,0)
	Image3.AnchorPoint = Vector2.new(0.5,0.5)
	Image3.BackgroundTransparency = 1
	if Color.Name ~= "White" then
		local TeamColor = Color
		Image3.ImageColor3 = Color.Color
	else
		Image3.ImageColor3 = Color3.new(1,0,1)
	end
	Head.CFrame = Torso.CFrame * CFrame.new(0,1.5,0)
	LeftArm.CFrame = Torso.CFrame * CFrame.new(-1.5,1.5,0.5,-2.25,0,0,1)
	RightArm.CFrame = Torso.CFrame * CFrame.new(1.5,1.5,0.5,-2.25,0,0,1)
	Blast.CFrame = RightArm.CFrame * CFrame.new(0,-2.25,-0.5,-1,0,0,1)
	LeftLeg.CFrame = Torso.CFrame * CFrame.new(-0.5,-1.6,-0.7,0.1,0,0,1)
	RightLeg.CFrame = Torso.CFrame * CFrame.new(0.5,-1.3,-0.95,0.25,0,0,1)
	Left.CFrame = Head.CFrame * CFrame.new(-0.1875,0.1875,-0.5)
	Right.CFrame = Head.CFrame * CFrame.new(0.1875,0.1875,-0.5)
	delay(0,function()
		LaunchSound(Torso.Position)
	end)
	for i = 1,8 do
		wait(0.05)
		Bill3.Size = Bill3.Size + UDim2.new(4,0,4,0)
	end
	TL.TextTransparency = 0
	TL.TextStrokeTransparency = 0
	Head.Material = Enum.Material.Metal
	Torso.Material = Enum.Material.DiamondPlate
	LeftArm.Material = Enum.Material.Metal
	RightArm.Material = Enum.Material.Metal
	Blast.Material = Enum.Material.Metal
	LeftLeg.Material = Enum.Material.DiamondPlate
	RightLeg.Material = Enum.Material.DiamondPlate
	local SoundA = Instance.new("Sound",Torso)
	SoundA.SoundId = "rbxasset://sounds/bass.mp3"
	SoundA.Volume = 1.4
	local SoundB = Instance.new("Sound",Torso)
	SoundB.SoundId = "rbxasset://sounds/electronicpingshort.wav"
	SoundB.Volume = 1.4
	local SoundC = Instance.new("Sound",Torso)
	SoundC.SoundId = "rbxasset://sounds/snap.mp3"
	SoundC.Volume = 1.4
	local function ShootSound()
		for i = 1,6 do
			if SoundA and SoundA.Parent then
				SoundA.PlaybackSpeed = 10 - i * 0.8
				SoundA.TimePosition = 0.2
				SoundA:Play()
			end
			if i < 3 and SoundC and SoundC.Parent then
				SoundC.PlaybackSpeed = 2
				SoundC.TimePosition = 0.2
				SoundC:Play()
			elseif i == 3 and SoundC and SoundC.Parent then
				SoundC:Stop()
			end
			wait(0.02)
		end
		if SoundA and SoundA.Parent then
			SoundA:Stop()
		end
	end
	local function OW()
		for i = 1,3 do
			if SoundA then
				SoundA.PlaybackSpeed = 9 + i * 0.3
				SoundA.TimePosition = 0.2
				SoundA:Play()
			end
			wait(0.04)
		end
		for i = 1,4 do
			if SoundA then
				SoundA.PlaybackSpeed = 9.75 - i * 0.6
				SoundA.TimePosition = 0.2
				SoundA:Play()
			end
			wait(0.04)
		end
		if SoundA then
			SoundA:Stop()
		end
	end
	local function AOW()
		for i = 1,40 do
			local P = 2.5 + (i + 38) * 0.15
			if i > 8 then
				P = 9 - (i - 4) * 0.15
			end
			if SoundA then
				SoundA.PlaybackSpeed = P
				SoundA.TimePosition = 0.2
				SoundA:Play()
			end
			wait(0.04)
		end
		if SoundA then
			SoundA:Stop()
		end
	end
	local function Collide()
		local Choice = math.random(1,2)
		if Choice == 1 then
			for i = 1,3 do
				if SoundC and SoundC.Parent then
					SoundC.PlaybackSpeed = 1
					SoundC.TimePosition = 0.2
					SoundC:Play()
				end
				wait(0.04)
			end
		elseif Choice == 2 then
			for i = 1,2 do
				if SoundC and SoundC.Parent then
					SoundC.PlaybackSpeed = 0.9
					SoundC.TimePosition = 0.2
					SoundC:Play()
				end
				wait(0.04)
				if SoundC and SoundC.Parent then
					SoundC:Stop()
				end
				wait(0.04)
			end
		end
		if SoundC and SoundC.Parent then
			SoundC:Stop()
		end
	end
	local function RecoverSound()
		for i = 1,15 do
			if SoundB and SoundB.Parent then
				SoundB.PlaybackSpeed = i * 0.3
				SoundB.TimePosition = 0.2
				SoundB:Play()
			end
			wait(0.06)
		end
		if SoundB and SoundB.Parent then
			SoundB:Stop()
		end
	end
	local function SwingSound()
		for i = 1,5 do
			if SoundC and SoundC.Parent then
				SoundC.PlaybackSpeed = 1 + i * 0.1
				SoundC.TimePosition = 0.2
				SoundC:Play()
			end
			wait(0.04)
		end
		if SoundC and SoundC.Parent then
			SoundC:Stop()
		end
	end
	local function Swoosh()
		local M = math.random(80,140)/100
		for i = 1,5 do
			if SoundC and SoundC.Parent then
				SoundC.PlaybackSpeed = 0.5*M + i * 0.12
				SoundC.TimePosition = 0.2
				SoundC:Play()
			end
			wait(0.04)
		end
		for i = 1,5 do
			if SoundC and SoundC.Parent then
				SoundC.PlaybackSpeed = 1.1*M - i * 0.12
				SoundC.TimePosition = 0.2
				SoundC:Play()
			end
			wait(0.04)
		end
		if SoundC and SoundC.Parent then
			SoundC:Stop()
		end
	end
	local function Ding()
		if SoundA and SoundA.Parent then
			SoundA.PlaybackSpeed = 12.5
			SoundA.TimePosition = 0.1
			SoundA:Play()
		end
		if SoundB and SoundB.Parent then
			SoundB.PlaybackSpeed = 3.6
			SoundB.TimePosition = 0.1
			SoundB:Play()
		end
		wait(0.06)
		for i = 1,4 do
			if SoundA and SoundA.Parent then
				SoundA.PlaybackSpeed = 19
				SoundA.TimePosition = 0.1
				SoundA:Play()
			end
			if SoundB and SoundB.Parent then
				SoundB.PlaybackSpeed = 5.3
				SoundB.TimePosition = 0.1
				SoundB:Play()
			end
			wait(0.06)
		end
	end
	local function AHAHA()
		for i = 1,6 do
			SoundA.PlaybackSpeed = 4+i*0.3
			SoundA.TimePosition = 0.2
			SoundA:Play()
			wait(0.03)
		end
		for e = 1,9 do
			for i = 1,4 do
				SoundA.PlaybackSpeed = 6-(e*0.4)+(i*0.6)
				SoundA.TimePosition = 0.2
				SoundA:Play()
				wait(0.03)
			end
		end
		SoundA:Stop()
	end
	local function EHAHA()
		for i = 1,6 do
			SoundA.PlaybackSpeed = 3+i*0.175
			SoundA.TimePosition = 0.2
			SoundA:Play()
			wait(0.03)
		end
		for e = 1,9 do
			for i = 1,4 do
				SoundA.PlaybackSpeed = 4-(e*0.2)+(i*0.4)
				SoundA.TimePosition = 0.2
				SoundA:Play()
				wait(0.03)
			end
		end
		SoundA:Stop()
	end
	local function YAH()
		for i = 1,3 do
			if SoundA then
				SoundA.PlaybackSpeed = i * 3
				SoundA.TimePosition = 0.2
				SoundA:Play()
			end
			wait(0.03)
		end
		for i = 1,2 do
			if SoundA then
				SoundA.PlaybackSpeed = 9
				SoundA.TimePosition = 0.2
				SoundA:Play()
			end
			wait(0.03)
		end
		for i = 1,8 do
			if SoundA then
				SoundA.PlaybackSpeed = 6 - i * 0.3
				SoundA.TimePosition = 0.2
				SoundA:Play()
			end
			wait(0.04)
		end
		if SoundA then
			SoundA:Stop()
		end
	end
	local function YO()
		for i = 1,3 do
			if SoundA then
				SoundA.PlaybackSpeed = i * 2
				SoundA.TimePosition = 0.2
				SoundA:Play()
			end
			wait(0.03)
		end
		for i = 1,2 do
			if SoundA then
				SoundA.PlaybackSpeed = 6
				SoundA.TimePosition = 0.2
				SoundA:Play()
			end
			wait(0.03)
		end
		for i = 1,5 do
			if SoundA then
				SoundA.PlaybackSpeed = 4 - i * 0.3
				SoundA.TimePosition = 0.2
				SoundA:Play()
			end
			wait(0.04)
		end
		if SoundA then
			SoundA:Stop()
		end
	end
	local Mid = 0.7
	local HP = 5
	local Heal = 250
	local Fire = -20
	local LastSuper = false
	local Hurt = 2
	local ChatTimer = 0
	local LandTimer = 4
	local FallTimer = 0
	local EmoteTimer = 0
	local FallLoop = 0
	local Hit = false
	local ExtraHit = false
	local Bump = 0
	local Down = 200
	local Stuck = 25
	local Stopped = false
	local AnimFrame = 0
	local Text = ""
	local LastStep = BrickColor.new()
	local BlinkTimer = 125
	local Show = 0
	local Downed = false
	local NobodyTimer = 75
	local NobodyLoop = 0
	local IdleTimer = 750
	local LaughTimer = 0
	local Sliding = false
	local OhNo = false
	local function Chat(text)
		if TL then
			Text = text
			TL.Text = text
		end
		ChatTimer = 75 + string.len(text)
		Hint.Text = [[




]]..text
		Show = Show - 1
		delay(2.5,function()
			if Show == 0 then
				Hint.Text = [[




Set 2 NPC: ]]..Color.Name.." / Health: "..tostring(HP).." / Total: "..Spawned.." / Landed: "..tostring(RegHits)
			end
			Show = Show + 1
		end)
	end
	local function AAAAH()
		if IdleTimer > 0 or EmoteTimer < 25 then
			delay(0,function()
				AOW()
			end)
		end
		EmoteTimer = 35
	end
	local function Laugh()
		if LaughTimer <= 10 then
			local Type = math.random(1,2)
			if Type == 1 then
				Chat("AHAHA")
				delay(0,function()
					AHAHA()
				end)
			elseif Type == 2 then
				Chat("EHAHA")
				delay(0,function()
					EHAHA()
				end)
			end
		end
		LaughTimer = 45
	end
	local Tag = Instance.new("StringValue",FakeChar)
	Tag.Name = "FakeHumanoid"
	local function Added(item)
		if item:IsA("Explosion") then
			local function ExplosionHit(part)
				if part == Torso then
					Hit = true
					ExtraHit = true
					Bump = math.max(35,Bump)
					local Directed = (Torso.Position - item.Position)
					if Directed.X ~= 0 or Directed.Y ~= 0 or Directed.Z ~= 0 then
						Torso.Velocity = Torso.Velocity + Directed.unit * 160
						if LandTimer >= 0 and Torso.Velocity.Y < 0 then
							Torso.Velocity = Vector3.new(Torso.Velocity.X,-Torso.Velocity.Y,Torso.Velocity.Z)
						end
					end
					if HP > 0 then
						delay(0,function()
							OW()
						end)
					end
				end
			end
			item.Hit:Connect(ExplosionHit)
		end
	end
	game.Workspace.DescendantAdded:Connect(Added)
	Torso.Touched:Connect(function(hit)
		if hit and hit.Parent ~= FakeChar and (hit.CanCollide or NameMatch(hit) or hit:FindFirstChildWhichIsA("TouchTransmitter")) then
			if (hit.Velocity - Torso.Velocity).Magnitude > 32 then
				Bump = math.max(16,Bump)
				delay(0,function()
					Collide()
				end)
				if Bill2.Size.X.Scale < 8 then
					Bill2.StudsOffsetWorldSpace = Torso.Position
					Bill2.Size = UDim2.new(8,0,8,0)
					Image2.ImageColor3 = Torso.Color
				end
				if HP > 0 then
					delay(0,function()
						OW()
					end)
				end
			end
			if (hit.Velocity - Torso.Velocity).Magnitude > 160 or NameMatch(hit) then
				Hit = true
			end
			if (hit.Velocity - Torso.Velocity).Magnitude > 320 or string.lower(hit.Name) == "blade" or string.lower(hit.Name) == "kaboom" or string.lower(hit.Name) == "explosion" or string.lower(hit.Name) == "electric" or string.lower(hit.Name) == "electricity" or string.lower(hit.Name) == "zap" or string.lower(hit.Name) == "lightning" then
				ExtraHit = true
				if string.lower(hit.Name) == "electric" or string.lower(hit.Name) == "electricity" or string.lower(hit.Name) == "zap" or string.lower(hit.Name) == "lightning" then
					if Bump < 80 then
						delay(0,function()
							ZAP(Torso.Position)
						end)
					end
					Bump = 100
				end
			end
		end
	end)
	local n = 0
	local l = 1
	local a = 0
	local function Play()
		local pitch = 1
		n = n + 1
		a = a + 1
		if n > 64 then
			n = 1
			l = l + 1
			if l > 4 then
				l = 1
			end
		end
		if a > 4 then
			a = 1
		end
		if l <= 2 then
			if n == 1 then
				pitch = 3.6
			elseif (n >= 2 and n <= 9) or (n >= 14 and n <= 15) then
				pitch = 1.8
			elseif n == 10 then
				pitch = 2.64
			elseif n == 11 then
				pitch = 3.6
			elseif n == 12 then
				pitch = 4.2
			elseif n == 13 then
				pitch = 4.8
			elseif n == 16 then
				pitch = 4.24
			elseif n == 17 then
				pitch = 2.8
			elseif (n >= 18 and n <= 25) or (n >= 30 and n <= 31) then
				pitch = 1.4
			elseif n == 26 then
				pitch = 2.64
			elseif n == 27 then
				pitch = 3.6
			elseif n == 28 then
				pitch = 4.2
			elseif n == 29 then
				pitch = 4.8
			elseif n == 32 then
				pitch = 4.24
			elseif n == 33 then
				pitch = 2.4
			elseif (n >= 34 and n <= 41) or (n >= 46 and n <= 47) then
				pitch = 1.2
			elseif n == 42 then
				pitch = 2.64
			elseif n == 43 then
				pitch = 3.6
			elseif n == 44 then
				pitch = 4.2
			elseif n == 45 then
				pitch = 4.8
			elseif n == 48 then
				pitch = 4.24
			elseif n == 49 then
				pitch = 2.64
			elseif (n >= 50 and n <= 57) or (n >= 62 and n <= 63) then
				pitch = 1.32
			elseif n == 58 then
				pitch = 2.64
			elseif n == 59 then
				pitch = 3.6
			elseif n == 60 then
				pitch = 4.2
			elseif n == 61 then
				pitch = 4.8
			elseif n == 64 then
				pitch = 4.24
			end
		else
			if n == 1 then
				pitch = 0.9
			elseif n == 2 then
				pitch = 1.8
			elseif n == 3 or n == 5 then
				pitch = 1.6
			elseif n == 4 or n == 6 or n == 8 or n == 14 then
				pitch = 1.4
			elseif n == 7 or n == 9 or n == 11 or n == 13 or n == 15 then
				pitch = 1.325
			elseif n == 10 or n == 12 or n == 16 then
				pitch = 1.2
			elseif n == 17 then
				pitch = 0.7
			elseif n == 18 or n == 20 then
				pitch = 0.788
			elseif n == 19 or n == 21 or n == 23 then
				pitch = 0.9
			elseif n == 22 or n == 24 or n == 26 then
				pitch = 1
			elseif n == 25 or n == 27 or n == 29 then
				pitch = 1.09
			elseif n == 28 or n == 30 then
				pitch = 1.2
			elseif n == 31 then
				pitch = 1.325
			elseif n == 32 then
				pitch = 1.425
			elseif n == 33 then
				pitch = 0.6
			elseif n == 34 then
				pitch = 1.2
			elseif n == 35 or n == 37 then
				pitch = 1.075
			elseif n == 36 or n == 38 or n == 40 or n == 46 then
				pitch = 0.933
			elseif n == 39 or n == 41 or n == 43 or n == 45 or n == 47 then
				pitch = 0.883
			elseif n == 42 or n == 44 or n == 48 then
				pitch = 0.8
			elseif n == 49 then
				pitch = 0.675
			elseif n == 50 or n == 52 then
				pitch = 0.75
			elseif n == 51 or n == 53 or n == 55 then
				pitch = 0.85
			elseif n == 54 or n == 56 or n == 58 then
				pitch = 0.9
			elseif n == 57 or n == 59 or n == 61 then
				pitch = 1
			elseif n == 60 or n == 62 then
				pitch = 1.05
			elseif n == 63 then
				pitch = 1.18
			elseif n == 64 then
				pitch = 1.35
			end
			pitch = pitch * 2
		end
		if SoundA and SoundA.Parent then
			SoundA.PlaybackSpeed = pitch
			SoundA.TimePosition = 0.12
			SoundA.Playing = true
		end
	end
	if Spawned % 4 == 0 then
		delay(2,function()
			local mess = math.random(1,4)
			if mess == 1 then
				Chat("When I go down again, I'm taking a break!")
			elseif mess == 2 then
				Chat("That hit hard...")
			elseif mess == 3 then
				Chat("I can go down once, but I'll keep fighting!")
			elseif mess == 4 then
				Chat("I better hope this doesn't happen again!")
			end
		end)
	end
	while FakeChar and FakeChar.Parent and Torso and Torso.Parent == FakeChar and Head and Head.Parent == FakeChar and Down > 0 and Torso.Position.Y > game.Workspace.FallenPartsDestroyHeight do
		if Show == 0 then
			Hint.Text = [[




Set 2 NPC: ]]..Color.Name.." / Health: "..tostring(HP).." / Total: "..Spawned.." / Landed: "..tostring(RegHits)
		end
		Bill.Size = Bill.Size - UDim2.new(1,0,1,0)
		if Bill.Size.X.Scale <= 0 then
			Bill.Size = UDim2.new(0,0,0,0)
		end
		Bill2.Size = Bill2.Size - UDim2.new(1,0,1,0)
		if Bill2.Size.X.Scale <= 0 then
			Bill2.Size = UDim2.new(0,0,0,0)
		end
		Bill3.Size = Bill3.Size - UDim2.new(0.25,0,0.25,0)
		if Bill3.Size.X.Scale <= 0 then
			Bill3.Size = UDim2.new(0,0,0,0)
		end
		RunAwayTimer = RunAwayTimer - 1
		Bla = false
		Jump = false
		if RunAwayTimer <= 0 and HP > 0 then
			local E = {}
			local D = game.Workspace:GetDescendants()
			for i = 1,#D do
				if D[i]:IsA("BasePart") and D[i].Parent ~= FakeChar then
					if D[i].Parent:FindFirstChildWhichIsA("Humanoid") then
						if D[i].Parent:FindFirstChildWhichIsA("Humanoid").Health > 0 then
							table.insert(E,D[i])
						end
					elseif D[i].Parent:FindFirstChild("FakeHumanoid") then
						local H = D[i].Parent:FindFirstChild("H")
						local T = D[i].Parent:FindFirstChild("T")
						if H and T and H:IsA("BasePart") and T:IsA("BasePart") and (H.Material ~= Enum.Material.Neon or T.Material ~= Enum.Material.Neon) then
							table.insert(E,D[i])
						end
					end
				end
			end
			local Target = nil
			local ClosestDist = math.huge
			for i = 1,#E do
				local Dist = (E[i].Position - Blast.Position).Magnitude
				if Dist < 600 and Dist < ClosestDist and E[i].Position.Y - 30 < Blast.Position.Y and E[i].Position.Y + 15 > Blast.Position.Y then
					Target = E[i]
					ClosestDist = Dist
				end
			end
			if Target then
				NobodyTimer = 25
				NobodyLoop = 0
				local Pos = Target.Position
				if (Pos - Blast.Position).Magnitude < 30 then
					RunAwayTimer = 24
					RunAwayDirection = Vector3.new(1,0,0)
					if HP > 0 and math.random(1,9) == 1 then
						Chat("Not far enough? Move back!")
					end
					local Choose = math.random(1,8)
					if Choose == 1 then
						RunAwayDirection = Vector3.new(1,0,0)
					elseif Choose == 2 then
						RunAwayDirection = Vector3.new(Mid,0,Mid)
					elseif Choose == 3 then
						RunAwayDirection = Vector3.new(0,0,1)
					elseif Choose == 4 then
						RunAwayDirection = Vector3.new(-Mid,0,Mid)
					elseif Choose == 5 then
						RunAwayDirection = Vector3.new(-1,0,0)
					elseif Choose == 6 then
						RunAwayDirection = Vector3.new(-Mid,0,-Mid)
					elseif Choose == 7 then
						RunAwayDirection = Vector3.new(0,0,-1)
					elseif Choose == 8 then
						RunAwayDirection = Vector3.new(Mid,0,-Mid)
					end
				end
				local Offset = Pos - Blast.Position
				if Offset.X < -5 then
					Offset = Vector3.new(-1,Offset.Y,Offset.Z)
				elseif Offset.X > 5 then
					Offset = Vector3.new(1,Offset.Y,Offset.Z)
				else
					Offset = Vector3.new(0,Offset.Y,Offset.Z)
				end
				if Offset.Z < -5 then
					Offset = Vector3.new(Offset.X,Offset.Y,-1)
				elseif Offset.Z > 5 then
					Offset = Vector3.new(Offset.X,Offset.Y,1)
				else
					Offset = Vector3.new(Offset.X,Offset.Y,0)
				end
				if Offset ~= Vector3.new(0,0,0) then
					local Stored = Vector3.new(0,0,0)
					Stored = Vector3.new(Offset.X,0,Offset.Z).unit
					Offset = Stored
				end
				MoveDirection = Offset
				local Checked = false
				HC.Parent = script
				HC.CFrame = Torso.CFrame * CFrame.new(1.5,0.5,-5)
				HC.CFrame = HC.CFrame * CFrame.new(0,0,-300)
				local Touching = HC:GetTouchingParts()
				for i = 1,#Touching do
					if Touching[i] == Target then
						Checked = true
					end
				end
				HC.Parent = nil
				if Fire <= -2 and Checked then
					Bla = true
					if HP > 0 and ChatTimer <= 0 and math.random(1,6) == 1 then
						Chat("Fire away!")
					end
				end
				if Pos.Y - Blast.Position.Y > 2 and not OhNo then
					Jump = true
				end
			else
				NobodyTimer = NobodyTimer - 1
				if (NobodyTimer <= 0 and NobodyLoop < 10) or NobodyTimer <= -1500 then
					if NobodyLoop == 9 then
						Laugh()
					else
						AAAAH()
					end
					NobodyTimer = 75
					NobodyLoop = NobodyLoop + 1
				end
				local Offset = Vector3.new(0,3,-80) - Blast.Position
				if NobodyLoop < 10 and (EmoteTimer > 0 or NobodyTimer < 13 or Offset.Magnitude > 7) then
					if Offset ~= Vector3.new(0,0,0) then
						local Stored = Vector3.new(0,0,0)
						Stored = Vector3.new(Offset.X,0,Offset.Z).unit
						Offset = Stored
					end
					MoveDirection = Offset
				else
					MoveDirection = Vector3.new()
				end
			end
		elseif HP > 0 then
			MoveDirection = RunAwayDirection
			if not OhNo then
				Jump = true
			end
			local D = game.Workspace:GetDescendants()
			for i = 1,#D do
				if D[i]:IsA("BasePart") and D[i].Parent ~= FakeChar then
					if D[i].Parent:FindFirstChildWhichIsA("Humanoid") then
						if D[i].Parent:FindFirstChildWhichIsA("Humanoid").Health > 0 and (D[i].Position - Blast.Position).Magnitude < 2 then
							Bla = true
						end
					elseif D[i].Parent:FindFirstChild("FakeHumanoid") then
						local H = D[i].Parent:FindFirstChild("H")
						local T = D[i].Parent:FindFirstChild("T")
						if H and T and H:IsA("BasePart") and T:IsA("BasePart") and (H.Material ~= Enum.Material.Neon or T.Material ~= Enum.Material.Neon) and (D[i].Position - Blast.Position).Magnitude < 2 then
							Bla = true
						end
					end
				end
			end
		end
		local Direction2 = MoveDirection
		if HP <= 0 then
			if Downed == false then
				Jump = true
			else
				Jump = false
			end
		end
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
		if HP <= 0 then
			Direction = "Idle"
		end
		if Direction == "Idle" and Bump < 0 and Hurt < 0 and HP > 0 and LandTimer >= 0 then
			IdleTimer = IdleTimer - 1
		else
			IdleTimer = 750
			n = 0
			l = 1
			a = 0
		end
		if LandTimer >= 0 and (Torso.Velocity*Vector3.new(1,0,1)).Magnitude > 55 and not Jump then
			OhNo = true
		else
			OhNo = false
		end
		local Mv = 0.75
		local Movements = 10
		if LandTimer < 0 then
			Mv = 0.97
			Movements = 7
			Sliding = false
		elseif Sliding then
			Mv = 0.93
			Movements = 5
		end
		Torso.Velocity = Vector3.new(Torso.Velocity.X * Mv,Torso.Velocity.Y,Torso.Velocity.Z * Mv)
		if Direction == "Right" then
			Torso.Orientation = Vector3.new(0,270,0)
			if Bla == false and Bump <= 0 then
				Torso.Velocity = Torso.Velocity + Vector3.new(1,0,0) * Movements
			end
		elseif Direction == "DownRight" then
			Torso.Orientation = Vector3.new(0,225,0)
			if Bla == false and Bump <= 0 then
				Torso.Velocity = Torso.Velocity + Vector3.new(Mid,0,Mid) * Movements
			end
		elseif Direction == "Down" then
			Torso.Orientation = Vector3.new(0,180,0)
			if Bla == false and Bump <= 0 then
				Torso.Velocity = Torso.Velocity + Vector3.new(0,0,1) * Movements
			end
		elseif Direction == "DownLeft" then
			Torso.Orientation = Vector3.new(0,135,0)
			if Bla == false and Bump <= 0 then
				Torso.Velocity = Torso.Velocity + Vector3.new(-Mid,0,Mid) * Movements
			end
		elseif Direction == "Left" then
			Torso.Orientation = Vector3.new(0,90,0)
			if Bla == false and Bump <= 0 then
				Torso.Velocity = Torso.Velocity + Vector3.new(-1,0,0) * Movements
			end
		elseif Direction == "UpLeft" then
			Torso.Orientation = Vector3.new(0,45,0)
			if Bla == false and Bump <= 0 then
				Torso.Velocity = Torso.Velocity + Vector3.new(-Mid,0,-Mid) * Movements
			end
		elseif Direction == "Up" then
			Torso.Orientation = Vector3.new(0,0,0)
			if Bla == false and Bump <= 0 then
				Torso.Velocity = Torso.Velocity + Vector3.new(0,0,-1) * Movements
			end
		elseif Direction == "UpRight" then
			Torso.Orientation = Vector3.new(0,315,0)
			if Bla == false and Bump <= 0 then
				Torso.Velocity = Torso.Velocity + Vector3.new(Mid,0,-Mid) * Movements
			end
		end
		if Bump > 35 then
			if Bump == 36 then
				if SoundA and SoundA.Parent then
					SoundA:Stop()
				end
				if SoundC and SoundC.Parent then
					SoundC:Stop()
				end
			else
				if SoundA and SoundA.Parent then
					SoundA.PlaybackSpeed = 2.3 * math.random(1,2)
					SoundA.TimePosition = 0.2
					SoundA:Play()
				end
				if SoundC and SoundC.Parent then
					SoundC.PlaybackSpeed = 1.4
					SoundC.TimePosition = 0.2
					SoundC:Play()
				end
			end
			local randzap = math.random(1,2)
			if Bump % 2 == 0 then
				Head.CFrame = Torso.CFrame * CFrame.new(0,1.5,0)
				if LeftArm then
					LeftArm.CFrame = Torso.CFrame * CFrame.new(-1.5,1.5,0.5,-2.25,0,0,1)
				end
				if RightArm then
					RightArm.CFrame = Torso.CFrame * CFrame.new(1.5,1.5,0.5,-2.25,0,0,1)
				end
				if Blast then
					if RightArm and RightArm.Parent == FakeChar then
						Blast.CFrame = RightArm.CFrame * CFrame.new(0,-2.25,-0.5,-1,0,0,1)
					else
						Blast.CFrame = Torso.CFrame * CFrame.new(-1.25,1.5,0,0,0,0,1)
					end
				end
				if LeftLeg then
					LeftLeg.CFrame = Torso.CFrame * CFrame.new(-0.5,-1.6,-0.7,0.1,0,0,1)
				end
				if RightLeg then
					RightLeg.CFrame = Torso.CFrame * CFrame.new(0.5,-1.3,-0.95,0.25,0,0,1)
				end
				if Bill.Size.X.Scale < 4 then
					Bill.StudsOffsetWorldSpace = Torso.Position
					Bill.Size = UDim2.new(4,0,4,0)
					if randzap == 1 then
						Image.ImageColor3 = Torso.Color
					else
						Image.ImageColor3 = Color3.new(1,1,0)
					end
				end
			else
				Head.CFrame = Torso.CFrame * CFrame.new(0,1.5,0)
				if LeftArm then
					LeftArm.CFrame = Torso.CFrame * CFrame.new(-0.75,1.25,-0.25,5,-2,0,1)
				end
				if RightArm then
					RightArm.CFrame = Torso.CFrame * CFrame.new(1.5,0.2,-0.5,0.65,0,0,1)
				end
				if Blast then
					if RightArm and RightArm.Parent == FakeChar then
						Blast.CFrame = RightArm.CFrame * CFrame.new(0,-2.25,-0.5,-1,0,0,1)
					else
						Blast.CFrame = Torso.CFrame * CFrame.new(-1.25,1.5,0,0,0,0,1)
					end
				end
				if LeftLeg then
					LeftLeg.CFrame = Torso.CFrame * CFrame.new(-0.75,-1,-1,1,0.1,-0.1,1)
				end
				if RightLeg then
					RightLeg.CFrame = Torso.CFrame * CFrame.new(0.75,-1,-1,1,-0.1,0.1,1)
				end
				if Bill.Size.X.Scale < 4 then
					Bill.StudsOffsetWorldSpace = Torso.Position
					Bill.Size = UDim2.new(4,0,4,0)
					if randzap == 1 then
						Image.ImageColor3 = Color3.new(1,1,1)
					else
						Image.ImageColor3 = Color3.new(0,0,1)
					end
				end
			end
		elseif Bump > 13 or Hurt > 0 or (Hurt > -6 and HP <= 0) then
			if Hurt % 2 == 0 then
				Head.CFrame = Torso.CFrame * CFrame.new(0,1.5,0)
				if LeftArm then
					LeftArm.CFrame = Torso.CFrame * CFrame.new(-1.5,1.5,0.5,-2.25,0,0,1)
				end
				if RightArm then
					RightArm.CFrame = Torso.CFrame * CFrame.new(1.5,1.5,0.5,-2.25,0,0,1)
				end
				if Blast then
					if RightArm and RightArm.Parent == FakeChar then
						Blast.CFrame = RightArm.CFrame * CFrame.new(0,-2.25,-0.5,-1,0,0,1)
					else
						Blast.CFrame = Torso.CFrame * CFrame.new(-1.25,1.5,0,0,0,0,1)
					end
				end
				if LeftLeg then
					LeftLeg.CFrame = Torso.CFrame * CFrame.new(-0.5,-1.6,-0.7,0.1,0,0,1)
				end
				if RightLeg then
					RightLeg.CFrame = Torso.CFrame * CFrame.new(0.5,-1.3,-0.95,0.25,0,0,1)
				end
			else
				Head.CFrame = Torso.CFrame * CFrame.new(0,1.5,0)
				if LeftArm then
					LeftArm.CFrame = Torso.CFrame * CFrame.new(-1.5,1.5,0.5,-2.55,0,0,1)
				end
				if RightArm then
					RightArm.CFrame = Torso.CFrame * CFrame.new(1.5,1.5,0.5,-1.85,0,0,1)
				end
				if Blast then
					if RightArm and RightArm.Parent == FakeChar then
						Blast.CFrame = RightArm.CFrame * CFrame.new(0,-2.25,-0.5,-1,0,0,1)
					else
						Blast.CFrame = Torso.CFrame * CFrame.new(-1.25,1.5,0,0,0,0,1)
					end
				end
				if LeftLeg then
					LeftLeg.CFrame = Torso.CFrame * CFrame.new(-0.5,-1.4,-0.9,0.2,0,0,1)
				end
				if RightLeg then
					RightLeg.CFrame = Torso.CFrame * CFrame.new(0.5,-1.4,-0.8,0.1,0,0,1)
				end
			end
		elseif HP > 0 then
			if FallTimer >= 38 or EmoteTimer > 0 then
				if IdleTimer <= 0 then
					Play()
					IdleTimer = 0
					Head.CFrame = Torso.CFrame * CFrame.new(0,1.5,-0.25,-0.2,-0.2,0,1)
					if LeftArm then
						if a % 2 == 0 then
							if SoundC and SoundC.Parent then
								SoundC.PlaybackSpeed = 1
								SoundC.TimePosition = 0.2
								SoundC:Play()
							end
							LeftArm.CFrame = Torso.CFrame * CFrame.new(-0.7,0.425,-0.9,1.2,0,1.3,1)
						else
							if SoundC and SoundC.Parent then
								SoundC.PlaybackSpeed = 1.4
								SoundC.TimePosition = 0.2
								SoundC:Play()
							end
							LeftArm.CFrame = Torso.CFrame * CFrame.new(-0.7,0.35,-1,0.9,0,0.8,1)
						end
					end
					if RightArm then
						RightArm.CFrame = Torso.CFrame * CFrame.new(1.3,0.35,-0.5,0.8,0.2,-0.2,1)
					end
					if Blast then
						if RightArm and RightArm.Parent == FakeChar then
							Blast.CFrame = RightArm.CFrame * CFrame.new(0,-2.25,-0.5,-1,0,0,1)
						else
							Blast.CFrame = Torso.CFrame * CFrame.new(-1.25,1.5,0,0,0,0,1)
						end
					end
					if LeftLeg then
						LeftLeg.CFrame = Torso.CFrame * CFrame.new(-0.7,-1.9,0,0,0,-0.1,1)
					end
					if RightLeg then
						RightLeg.CFrame = Torso.CFrame * CFrame.new(0.7,-1.9,0,0,0,0.1,1)
					end
				else
					if (FallTimer >= 38 and FallTimer % 2 == 0) or (FallTimer < 38 and EmoteTimer % 2 == 0) then
						Head.CFrame = Torso.CFrame * CFrame.new(0,1.5,0)
						if LeftArm then
							LeftArm.CFrame = Torso.CFrame * CFrame.new(-1.5,1.5,0.5,-2.25,0,0,1)
						end
						if RightArm then
							RightArm.CFrame = Torso.CFrame * CFrame.new(1.5,1.5,0.5,-2.25,0,0,1)
						end
						if Blast then
							if RightArm and RightArm.Parent == FakeChar then
								Blast.CFrame = RightArm.CFrame * CFrame.new(0,-2.25,-0.5,-1,0,0,1)
							else
								Blast.CFrame = Torso.CFrame * CFrame.new(-1.25,1.5,0,0,0,0,1)
							end
						end
						if LeftLeg then
							LeftLeg.CFrame = Torso.CFrame * CFrame.new(-0.5,-1.5,0.7,-0.5,0,0,1)
						end
						if RightLeg then
							RightLeg.CFrame = Torso.CFrame * CFrame.new(0.5,-1.8,0.6,-0.25,0,0,1)
						end
					else
						Head.CFrame = Torso.CFrame * CFrame.new(0,1.5,0)
						if LeftArm then
							LeftArm.CFrame = Torso.CFrame * CFrame.new(-1.5,1.5,0.5,-2.55,0,0,1)
						end
						if RightArm then
							RightArm.CFrame = Torso.CFrame * CFrame.new(1.5,1.5,0.5,-1.85,0,0,1)
						end
						if Blast then
							if RightArm and RightArm.Parent == FakeChar then
								Blast.CFrame = RightArm.CFrame * CFrame.new(0,-2.25,-0.5,-1,0,0,1)
							else
								Blast.CFrame = Torso.CFrame * CFrame.new(-1.25,1.5,0,0,0,0,1)
							end
						end
						if LeftLeg then
							LeftLeg.CFrame = Torso.CFrame * CFrame.new(-0.5,-1.3,0.7,-0.8,0,0,1)
						end
						if RightLeg then
							RightLeg.CFrame = Torso.CFrame * CFrame.new(0.5,-1.8,0.3,-0.15,0,0,1)
						end
					end
				end
			elseif Bump > 0 then
				Head.CFrame = Torso.CFrame * CFrame.new(0,1.5,0)
				if LeftArm then
					LeftArm.CFrame = Torso.CFrame * CFrame.new(-0.75,1.25,-0.25,5,-2,0,1)
				end
				if RightArm then
					RightArm.CFrame = Torso.CFrame * CFrame.new(1.5,0.2,-0.5,0.65,0,0,1)
				end
				if Blast then
					if RightArm and RightArm.Parent == FakeChar then
						Blast.CFrame = RightArm.CFrame * CFrame.new(0,-2.25,-0.5,-1,0,0,1)
					else
						Blast.CFrame = Torso.CFrame * CFrame.new(-1.25,1.5,0,0,0,0,1)
					end
				end
				if LeftLeg then
					LeftLeg.CFrame = Torso.CFrame * CFrame.new(-0.75,-1,-1,1,0.1,-0.1,1)
				end
				if RightLeg then
					RightLeg.CFrame = Torso.CFrame * CFrame.new(0.75,-1,-1,1,-0.1,0.1,1)
				end
			elseif LandTimer < 0 then
				Head.CFrame = Torso.CFrame * CFrame.new(0,1.5,0)
				if LeftArm then
					LeftArm.CFrame = Torso.CFrame * CFrame.new(-1.5,0,0.5,-0.5,0,0,1)
				end
				if RightArm then
					RightArm.CFrame = Torso.CFrame * CFrame.new(1.5,0.5,-0.5,1,0,0,1)
				end
				if Blast then
					if RightArm and RightArm.Parent == FakeChar then
						Blast.CFrame = RightArm.CFrame * CFrame.new(0,-2.25,-0.5,-1,0,0,1)
					else
						Blast.CFrame = Torso.CFrame * CFrame.new(-1.25,1.5,0,0,0,0,1)
					end
				end
				if LeftLeg then
					LeftLeg.CFrame = Torso.CFrame * CFrame.new(-0.5,-1.6,-0.7,0.1,0,0,1)
				end
				if RightLeg then
					RightLeg.CFrame = Torso.CFrame * CFrame.new(0.5,-1.5,1,-0.7,0,0,1)
				end
			elseif IdleTimer < 0 then
				if IdleTimer < -3 then
					Play()
					IdleTimer = 0
				end
				if a == 1 then
					Head.CFrame = Torso.CFrame * CFrame.new(0,1.5,-0.065,-0.065,0,0,1)
					if LeftArm then
						LeftArm.CFrame = Torso.CFrame * CFrame.new(-1.7,0,0,0,0,-0.2,1)
					end
					if RightArm then
						RightArm.CFrame = Torso.CFrame * CFrame.new(1.4,0.335,-0.5,0.635,0.06,-0.1,1)
					end
					if Blast then
						if RightArm and RightArm.Parent == FakeChar then
							Blast.CFrame = RightArm.CFrame * CFrame.new(0,-2.25,-0.5,-1,0,0,1)
						else
							Blast.CFrame = Torso.CFrame * CFrame.new(-1.25,1.5,0,0,0,0,1)
						end
					end
					if LeftLeg then
						LeftLeg.CFrame = Torso.CFrame * CFrame.new(-0.5,-1.7,-0.3,-0.1,0,0,1)
					end
					if RightLeg then
						RightLeg.CFrame = Torso.CFrame * CFrame.new(0.5,-1.8,-0.1)
					end
				elseif a == 2 then
					Head.CFrame = Torso.CFrame * CFrame.new(0,1.5,-0.1,-0.1,0,0,1)
					if LeftArm then
						LeftArm.CFrame = Torso.CFrame * CFrame.new(-1.6,0,-0.1,0.1,0,-0.1,1)
					end
					if RightArm then
						RightArm.CFrame = Torso.CFrame * CFrame.new(1.4,0.3,-0.5,0.6,0.05,-0.1,1)
					end
					if Blast then
						if RightArm and RightArm.Parent == FakeChar then
							Blast.CFrame = RightArm.CFrame * CFrame.new(0,-2.25,-0.5,-1,0,0,1)
						else
							Blast.CFrame = Torso.CFrame * CFrame.new(-1.25,1.5,0,0,0,0,1)
						end
					end
					if LeftLeg then
						LeftLeg.CFrame = Torso.CFrame * CFrame.new(-0.5,-1.95,-0.2)
					end
					if RightLeg then
						RightLeg.CFrame = Torso.CFrame * CFrame.new(0.5,-2,-0.05,-0.025,0,0,1)
					end
				elseif a == 3 then
					Head.CFrame = Torso.CFrame * CFrame.new(0,1.5,-0.035,-0.035,0,0,1)
					if LeftArm then
						LeftArm.CFrame = Torso.CFrame * CFrame.new(-1.55,0,0,0,0,-0.05,1)
					end
					if RightArm then
						RightArm.CFrame = Torso.CFrame * CFrame.new(1.4,0.365,-0.5,0.675,0.04,-0.1,1)
					end
					if Blast then
						if RightArm and RightArm.Parent == FakeChar then
							Blast.CFrame = RightArm.CFrame * CFrame.new(0,-2.25,-0.5,-1,0,0,1)
						else
							Blast.CFrame = Torso.CFrame * CFrame.new(-1.25,1.5,0,0,0,0,1)
						end
					end
					if LeftLeg then
						LeftLeg.CFrame = Torso.CFrame * CFrame.new(-0.5,-1.7,-0.3,-0.1,0,0,1)
					end
					if RightLeg then
						RightLeg.CFrame = Torso.CFrame * CFrame.new(0.5,-1.8,-0.1)
					end
				elseif a == 4 then
					Head.CFrame = Torso.CFrame * CFrame.new(0,1.5,0)
					if LeftArm then
						LeftArm.CFrame = Torso.CFrame * CFrame.new(-1.6,0,0.1,-0.1,0,-0.1,1)
					end
					if RightArm then
						RightArm.CFrame = Torso.CFrame * CFrame.new(1.4,0.4,-0.5,0.7,0.05,-0.1,1)
					end
					if Blast then
						if RightArm and RightArm.Parent == FakeChar then
							Blast.CFrame = RightArm.CFrame * CFrame.new(0,-2.25,-0.5,-1,0,0,1)
						else
							Blast.CFrame = Torso.CFrame * CFrame.new(-1.25,1.5,0,0,0,0,1)
						end
					end
					if LeftLeg then
						LeftLeg.CFrame = Torso.CFrame * CFrame.new(-0.5,-1.95,-0.2)
					end
					if RightLeg then
						RightLeg.CFrame = Torso.CFrame * CFrame.new(0.5,-2,-0.05,-0.025,0,0,1)
					end
				end
			elseif IdleTimer < 32 then
				Head.CFrame = Torso.CFrame * CFrame.new(0,1.5,-0.25,-0.2,-0.2,0,1)
				if LeftArm then
					if (IdleTimer < 7) or (IdleTimer >= 11 and IdleTimer < 20) then
						LeftArm.CFrame = Torso.CFrame * CFrame.new(-0.7,0.425,-0.9,1.2,0,1.3,1)
					elseif IdleTimer < 11 then
						if IdleTimer == 10 then
							delay(0,function()
								Collide()
							end)
						end
						LeftArm.CFrame = Torso.CFrame * CFrame.new(-0.7,0.35,-1,0.9,0,0.8,1)
					elseif IdleTimer < 26 then
						LeftArm.CFrame = Torso.CFrame * CFrame.new(-1.2,0.425,-0.7,0.7,0,0.5,1)
					else
						LeftArm.CFrame = Torso.CFrame * CFrame.new(-1.3,0.425,-0.4,0.5,0,-0.1,1)
					end
				end
				if RightArm then
					RightArm.CFrame = Torso.CFrame * CFrame.new(1.3,0.35,-0.5,0.8,0.2,-0.2,1)
				end
				if Blast then
					if RightArm and RightArm.Parent == FakeChar then
						Blast.CFrame = RightArm.CFrame * CFrame.new(0,-2.25,-0.5,-1,0,0,1)
					else
						Blast.CFrame = Torso.CFrame * CFrame.new(-1.25,1.5,0,0,0,0,1)
					end
				end
				if LeftLeg then
					LeftLeg.CFrame = Torso.CFrame * CFrame.new(-0.7,-1.9,0,0,0,-0.1,1)
				end
				if RightLeg then
					RightLeg.CFrame = Torso.CFrame * CFrame.new(0.7,-1.9,0,0,0,0.1,1)
				end
			else
				if not (LaughTimer > 0 and LaughTimer % 5 > 1) and (LaughTimer > 0 and LaughTimer % 5 < 2) then
					Head.CFrame = Torso.CFrame * CFrame.new(0,1.4,0.2,0.3,0,0,1)
				else
					Head.CFrame = Torso.CFrame * CFrame.new(0,1.5,0)
				end
				if LeftArm then
					if OhNo then
						LeftArm.CFrame = Torso.CFrame * CFrame.new(-1.5,0.65,0.5,-1.25,0,0,1)
					elseif LaughTimer > 0 then
						LeftArm.CFrame = Torso.CFrame * CFrame.new(-0.7,0.425,-0.9,1.2,0,1.3,1)
					elseif Fire > 0 then
						LeftArm.CFrame = Torso.CFrame * CFrame.new(-1.6,0,0.3,-0.2,0,-0.1,1)
					elseif AnimFrame == 0 then
						LeftArm.CFrame = Torso.CFrame * CFrame.new(-1.6,0,0,0,0,-0.1,1)
					elseif AnimFrame == 1 then
						LeftArm.CFrame = Torso.CFrame * CFrame.new(-1.5,0,0.5,-0.5,0,-0.1,1)
					elseif AnimFrame == 2 then
						LeftArm.CFrame = Torso.CFrame * CFrame.new(-1.7,0,-0.1,0.1,0,-0.2,1)
					elseif AnimFrame == 3 then
						LeftArm.CFrame = Torso.CFrame * CFrame.new(-1.5,0,-0.5,0.5,0,-0.1,1)
					elseif AnimFrame == 4 then
						LeftArm.CFrame = Torso.CFrame * CFrame.new(-1.6,0,-0.1,-0.1,0,-0.1,1)
					end
				end
				if RightArm then
					if Fire > 0 or OhNo then
						RightArm.CFrame = Torso.CFrame * CFrame.new(1.5,0.5,-0.5,1,0,0,1)
					elseif AnimFrame == 0 then
						RightArm.CFrame = Torso.CFrame * CFrame.new(1.5,0.35,-0.5,0.8,0,0,1)
					elseif AnimFrame == 1 then
						RightArm.CFrame = Torso.CFrame * CFrame.new(1.5,0.3,-0.5,0.75,0.1,0,1)
					elseif AnimFrame == 2 then
						RightArm.CFrame = Torso.CFrame * CFrame.new(1.5,0.35,-0.5,0.8,0.05,0,1)
					elseif AnimFrame == 3 then
						RightArm.CFrame = Torso.CFrame * CFrame.new(1.5,0.25,-0.5,0.75,-0.1,0,1)
					elseif AnimFrame == 4 then
						RightArm.CFrame = Torso.CFrame * CFrame.new(1.5,0.3,-0.5,0.8,-0.05,0,1)
					end
				end
				if Blast then
					if RightArm and RightArm.Parent == FakeChar then
						Blast.CFrame = RightArm.CFrame * CFrame.new(0,-2.25,-0.5,-1,0,0,1)
					else
						Blast.CFrame = Torso.CFrame * CFrame.new(-1.25,1.5,0,0,0,0,1)
					end
				end
				if LeftLeg then
					if OhNo then
						LeftLeg.CFrame = Torso.CFrame * CFrame.new(-0.5,-1,-0.8,-0.1,0,0,1)
					elseif AnimFrame == 0 then
						LeftLeg.CFrame = Torso.CFrame * CFrame.new(-0.7,-1.9,0,0,0,-0.1,1)
					elseif AnimFrame == 1 then
						LeftLeg.CFrame = Torso.CFrame * CFrame.new(-0.5,-1.9,-0.1,-0.2,0,0,1)
					elseif AnimFrame == 2 then
						LeftLeg.CFrame = Torso.CFrame * CFrame.new(-0.5,-1.9,0.5,-0.25,0,0,1)
					elseif AnimFrame == 3 then
						LeftLeg.CFrame = Torso.CFrame * CFrame.new(-0.5,-1.6,0.6,-0.7,0,0,1)
					elseif AnimFrame == 4 then
						LeftLeg.CFrame = Torso.CFrame * CFrame.new(-0.5,-1.4,-0.8,0.1,0,0,1)
					end
				end
				if RightLeg then
					if OhNo then
						RightLeg.CFrame = Torso.CFrame * CFrame.new(0.5,-1.5,0.6,-0.95,0,0,1)
					elseif AnimFrame == 0 then
						RightLeg.CFrame = Torso.CFrame * CFrame.new(0.7,-1.9,0,0,0,0.1,1)
					elseif AnimFrame == 1 then
						RightLeg.CFrame = Torso.CFrame * CFrame.new(0.5,-1.6,0.6,-0.7,0,0,1)
					elseif AnimFrame == 2 then
						RightLeg.CFrame = Torso.CFrame * CFrame.new(0.5,-1.4,-0.8,0.1,0,0,1)
					elseif AnimFrame == 3 then
						RightLeg.CFrame = Torso.CFrame * CFrame.new(0.5,-1.9,-0.1,-0.2,0,0,1)
					elseif AnimFrame == 4 then
						RightLeg.CFrame = Torso.CFrame * CFrame.new(0.5,-1.9,0.5,-0.25,0,0,1)
					end
				end
			end
		else
			Head.CFrame = Torso.CFrame * CFrame.new(0,1.3,-0.4,-0.4,0,0,1)
			if LeftArm then
				LeftArm.CFrame = Torso.CFrame * CFrame.new(-1.5,-0.5,-0.5,0.2,0,0,1)
			end
			if RightArm then
				RightArm.CFrame = Torso.CFrame * CFrame.new(1.5,-0.5,-0.5,0.2,0,0,1)
			end
			if Blast then
				Blast.CFrame = Torso.CFrame * CFrame.new(2.5,-0.6,-2.5,0.15,-0.15,0,1)
			end
			if LeftLeg then
				LeftLeg.CFrame = Torso.CFrame * CFrame.new(-0.5,-0.5,-1,0.15,0,0,1)
			end
			if RightLeg then
				RightLeg.CFrame = Torso.CFrame * CFrame.new(0.5,-1.5,0.6,-0.75,0,0,1)
			end
		end
		if Direction ~= "Idle" and Bla == false then
			AnimFrame = AnimFrame + 1
			if AnimFrame > 4 then
				AnimFrame = 1
			end
		else
			AnimFrame = 0
		end
		if LandTimer < 0 and HP > 0 and FallTimer < 80 then
			FallTimer = FallTimer + 1
			local P = 2.5 + FallTimer * 0.15
			if FallTimer == 38 then
				Text = "AAAAH"
				TL.Text = "AAAAH"
				ChatTimer = 75 + string.len("AAAAH")
			end
			if FallTimer > 46 then
				P = 9 - (FallTimer - 42) * 0.15
			end
			if FallTimer > 50 and FallLoop < 2 then
				FallTimer = 38
				FallLoop = FallLoop + 1
			end
			if FallTimer > 14 and SoundA then
				SoundA.PlaybackSpeed = P
				SoundA.TimePosition = 0.2
				SoundA:Play()
			end
		elseif FallTimer >= 80 then
			FallTimer = FallTimer + 1
			if FallTimer == 81 and SoundA then
				SoundA:Stop()
			end
		end
		if LandTimer >= 0 or HP <= 0 then
			FallTimer = 0
			FallLoop = 0
		end
		if Fire > 0 or Fire < -30 then
			Blast.Material = Enum.Material.Neon
		else
			Blast.Material = Enum.Material.Metal
		end
		LandTimer = LandTimer - 1
		EmoteTimer = EmoteTimer - 1
		LaughTimer = LaughTimer - 1
		local AlreadyCollided = false
		local HeadCollided = false
		local TorsoTouched = false
		local Col = false
		local AH = false
		for i = 1,20 do
			local Bam = false
			Torso.Velocity = Vector3.new(Torso.Velocity.X,Torso.Velocity.Y - game.Workspace.Gravity * 0.002,Torso.Velocity.Z)
			local T = Torso:GetTouchingParts()
			for i = 1,#T do
				if T[i] and T[i].Parent and T[i].Parent ~= FakeChar then
					local HitTag = T[i]:FindFirstChild("HitTag")
					if HitTag and HitTag:IsA("StringValue") then
						Tag.Value = HitTag.Value
					end
				end
				if T[i] and string.lower(T[i].Name) == "heal" and HP < 5 and HP > 0 then
					HP = 5
					Bill3.StudsOffsetWorldSpace = Torso.Position
					Bill3.Size = UDim2.new(12,0,12,0)
					Image3.ImageColor3 = Torso.Color
					delay(0,function()
						RecoverSound()
					end)
				end
				if T[i] and T[i].Parent ~= FakeChar and ((T[i].CanCollide or NameMatch(T[i])) or (T[i].Size.Magnitude < 10 and T[i]:FindFirstChildWhichIsA("TouchTransmitter") and T[i].Name ~= "T")) then
					if T[i].CanCollide then
						TorsoTouched = true
					end
					if T[i].CanCollide and (T[i].Velocity - Torso.Velocity).Magnitude > 32 then
						Bump = math.max(16,Bump)
						Col = true
						if Bill2.Size.X.Scale < 8 then
							Bill2.StudsOffsetWorldSpace = Torso.Position
							Bill2.Size = UDim2.new(8,0,8,0)
							Image2.ImageColor3 = Torso.Color
						end
						AH = true
					end
					if NameMatch(T[i]) or (T[i].Size.Magnitude < 10 and T[i]:FindFirstChildWhichIsA("TouchTransmitter") and T[i].Name ~= "T") or (T[i].Velocity - Torso.Velocity).Magnitude > 160 then
						Hit = true
						if T[i].CanCollide and (T[i].Velocity - Torso.Velocity).Magnitude > 160 then
							Bump = math.max(35,Bump)
						end
					end
					if T[i].CanCollide and (T[i].Velocity - Torso.Velocity).Magnitude > 320 or string.lower(T[i].Name) == "blade" or string.lower(T[i].Name) == "kaboom" or string.lower(T[i].Name) == "explosion" or string.lower(T[i].Name) == "electric" or string.lower(T[i].Name) == "electricity" or string.lower(T[i].Name) == "zap" or string.lower(T[i].Name) == "lightning" then
						ExtraHit = true
						if string.lower(T[i].Name) == "electric" or string.lower(T[i].Name) == "electricity" or string.lower(T[i].Name) == "zap" or string.lower(T[i].Name) == "lightning" then
							if Bump < 80 then
								delay(0,function()
									ZAP(Torso.Position)
								end)
							end
							Bump = 100
						end
					end
					if T[i].CanCollide and AlreadyCollided == false then
						Torso.Velocity = T[i].Velocity - Torso.Velocity * 0.5
						if Stuck <= 19 then
							local MOV = (Torso.Position - T[i].Position)
							local mov = Vector3.new(MOV.X,0,MOV.Z).unit
							if MOV.Y > 0 then
								mov = mov + Vector3.new(0,0.5,0)
							end
							FakeChar:TranslateBy(Vector3.new(mov.X,mov.Y,mov.Z))
						end
						AlreadyCollided = true
					end
				end
			end
			local HeadTouch = Head:GetTouchingParts()
			for i = 1,#HeadTouch do
				if HeadTouch[i] and HeadTouch[i].CanCollide == true and HeadTouch[i].Parent ~= FakeChar then
					HeadCollided = true
					if (HeadTouch[i].Velocity - Torso.Velocity).Magnitude > 16 then
						Col = true
						if Bill2.Size.X.Scale < 8 then
							Bill2.StudsOffsetWorldSpace = Head.Position
							Bill2.Size = UDim2.new(8,0,8,0)
							Image2.ImageColor3 = Torso.Color
						end
						Torso.Velocity = Vector3.new(Torso.Velocity.X,-Torso.Velocity.Y,Torso.Velocity.Z)
					end
					if (HeadTouch[i].Velocity - Torso.Velocity).Magnitude > 32 then
						Bump = math.max(16,Bump)
						AH = true
					end
				end
			end
			if HeadCollided and not (Bump > 0 or Hurt > 0 or HP <= 0 or FallTimer > 38 or EmoteTimer > 0) then
				if LeftLeg then
					LeftLeg.CFrame = Torso.CFrame * CFrame.new(-0.5,-2,0)
				end
				if RightLeg then
					RightLeg.CFrame = Torso.CFrame * CFrame.new(0.5,-2,0)
				end
			end
			local LT = LeftLeg:GetTouchingParts()
			for i = 1,#LT do
				if LT[i] and LT[i].Parent and LT[i].Parent ~= FakeChar then
					local HitTag = LT[i]:FindFirstChild("HitTag")
					if HitTag and HitTag:IsA("StringValue") then
						Tag.Value = HitTag.Value
					end
				end
				if LT[i] and string.lower(LT[i].Name) == "heal" and HP < 5 and HP > 0 then
					HP = 5
					Bill3.StudsOffsetWorldSpace = Torso.Position
					Bill3.Size = UDim2.new(12,0,12,0)
					Image3.ImageColor3 = Torso.Color
					delay(0,function()
						RecoverSound()
					end)
				end
				if LT[i] and LT[i].Parent ~= FakeChar and ((LT[i].CanCollide or NameMatch(LT[i])) or (LT[i].Size.Magnitude < 10 and LT[i]:FindFirstChildWhichIsA("TouchTransmitter") and LT[i].Name ~= "T")) then
					if LT[i].CanCollide and (LT[i].Velocity - Torso.Velocity).Magnitude > 320 or string.lower(LT[i].Name) == "blade" or string.lower(LT[i].Name) == "kaboom" or string.lower(LT[i].Name) == "explosion" or string.lower(LT[i].Name) == "electric" or string.lower(LT[i].Name) == "electricity" or string.lower(LT[i].Name) == "zap" or string.lower(LT[i].Name) == "lightning" then
						ExtraHit = true
						if string.lower(LT[i].Name) == "electric" or string.lower(LT[i].Name) == "electricity" or string.lower(LT[i].Name) == "zap" or string.lower(LT[i].Name) == "lightning" then
							if Bump < 80 then
								delay(0,function()
									ZAP(Torso.Position)
								end)
							end
							Bump = 100
						end
					end
					if NameMatch(LT[i]) then
						Hit = true
					end
					if (LT[i].Velocity - Torso.Velocity).Magnitude > 160 then
						Hit = true
						if LT[i].CanCollide and AlreadyCollided == false then
							Torso.Velocity = LT[i].Velocity - Torso.Velocity * 0.5 + Vector3.new(0,10,0)
							Bump = math.max(35,Bump)
							AH = true
							AlreadyCollided = true
						end
					elseif LT[i].CanCollide and AlreadyCollided == false then
						Torso.Velocity = Vector3.new(Torso.Velocity.X,Torso.Velocity.Y * 0.12,Torso.Velocity.Z) + LT[i].Velocity + Vector3.new(0,10,0)
						AlreadyCollided = true
					end
					if LT[i].CanCollide then
						LastStep = LT[i].BrickColor
						if LT[i].Material == Enum.Material.Ice or LT[i].Material == Enum.Material.ForceField or LT[i]:FindFirstChild("Slippery") then
							Sliding = true
						else
							Sliding = false
						end
						if LandTimer < 0 then
							Col = true
							if Bill2.Size.X.Scale < 8 then
								Bill2.StudsOffsetWorldSpace = Torso.Position + Vector3.new(0,-2.8,0)
								Bill2.Size = UDim2.new(8,0,8,0)
								Image2.ImageColor3 = LastStep.Color
							end
						end
						LandTimer = 4
					end
				end
			end
			local RT = RightLeg:GetTouchingParts()
			for i = 1,#RT do
				if RT[i] and RT[i].Parent and RT[i].Parent ~= FakeChar then
					local HitTag = RT[i]:FindFirstChild("HitTag")
					if HitTag and HitTag:IsA("StringValue") then
						Tag.Value = HitTag.Value
					end
				end
				if RT[i] and string.lower(RT[i].Name) == "heal" and HP < 5 and HP > 0 then
					HP = 5
					Bill3.StudsOffsetWorldSpace = Torso.Position
					Bill3.Size = UDim2.new(12,0,12,0)
					Image3.ImageColor3 = Torso.Color
					delay(0,function()
						RecoverSound()
					end)
				end
				if RT[i] and RT[i].Parent ~= FakeChar and ((RT[i].CanCollide or NameMatch(RT[i])) or (RT[i].Size.Magnitude < 10 and RT[i]:FindFirstChildWhichIsA("TouchTransmitter") and RT[i].Name ~= "T")) then
					if RT[i].CanCollide and (RT[i].Velocity - Torso.Velocity).Magnitude > 320 or string.lower(RT[i].Name) == "blade" or string.lower(RT[i].Name) == "kaboom" or string.lower(RT[i].Name) == "explosion" or string.lower(RT[i].Name) == "electric" or string.lower(RT[i].Name) == "electricity" or string.lower(RT[i].Name) == "zap" or string.lower(RT[i].Name) == "lightning" then
						ExtraHit = true
						if string.lower(RT[i].Name) == "electric" or string.lower(RT[i].Name) == "electricity" or string.lower(RT[i].Name) == "zap" or string.lower(RT[i].Name) == "lightning" then
							if Bump < 80 then
								delay(0,function()
									ZAP(Torso.Position)
								end)
							end
							Bump = 100
						end
					end
					if NameMatch(RT[i]) then
						Hit = true
					end
					if (RT[i].Velocity - Torso.Velocity).Magnitude > 160 then
						Hit = true
						if RT[i].CanCollide and AlreadyCollided == false then
							Torso.Velocity = RT[i].Velocity - Torso.Velocity * 0.5 + Vector3.new(0,10,0)
							Bump = math.max(35,Bump)
							AH = true
							AlreadyCollided = true
						end
					elseif RT[i].CanCollide and AlreadyCollided == false then
						Torso.Velocity = Vector3.new(Torso.Velocity.X,Torso.Velocity.Y * 0.12,Torso.Velocity.Z) + RT[i].Velocity + Vector3.new(0,10,0)
						AlreadyCollided = true
					end
					if RT[i].CanCollide then
						LastStep = RT[i].BrickColor
						if RT[i].Material == Enum.Material.Ice or RT[i].Material == Enum.Material.ForceField or RT[i]:FindFirstChild("Slippery") then
							Sliding = true
						else
							Sliding = false
						end
						if LandTimer < 0 then
							Col = true
							if Bill2.Size.X.Scale < 8 then
								Bill2.StudsOffsetWorldSpace = Torso.Position + Vector3.new(0,-2.8,0)
								Bill2.Size = UDim2.new(8,0,8,0)
								Image2.ImageColor3 = LastStep.Color
							end
						end
						LandTimer = 4
					end
				end
			end
			FakeChar:TranslateBy(Vector3.new(Torso.Velocity.X * 0.002,Torso.Velocity.Y * 0.002,Torso.Velocity.Z * 0.002))
		end
		if Col then
			delay(0,function()
				Collide()
			end)
		end
		if AH and HP > 0 then
			delay(0,function()
				OW()
			end)
		end
		if Down == 150 and Jump == true and Downed == false then
			Downed = true
			HP = 3
			Bump = 0
			Heal = 200
			Bill3.StudsOffsetWorldSpace = Torso.Position
			Bill3.Size = UDim2.new(12,0,12,0)
			Image3.ImageColor3 = Torso.Color
			Torso.CFrame = Torso.CFrame * CFrame.new(0,0,0,0.15,0,0,1)
			local LastName = Tag.Value
			Tag.Value = ""
			Fire = -20
			delay(0,function()
				RecoverSound()
			end)
			delay(1.6,function()
				if HP > 0 then
					local Self = true
					local a = "I'm not going down this time"
					local Mess = math.random(1,3)
					if Mess == 1 then
						a = "Not just yet"
					elseif Mess == 2 then
						a = "Go for it again"
					end
					if LastName == "2 "..Color.Name then
						LastName = ""
					end
					if LastName ~= "" then
						a = a..", "..LastName.."!"
						Self = false
					else
						a = a.."!"
					end
					if not Self or math.random(1,3) == 1 then
						if true then
							Text = a
							TL.Text = a
							ChatTimer = 75 + string.len(a)
						end
					end
				end
			end)
		end
		if TorsoTouched == true then
			Stuck = Stuck - 1
			if Stuck <= 0 then
				Hit = true
			end
		else
			Stuck = 25
		end
		if HP > 0 then
			Down = 200
		else
			Down = Down - 1
		end
		if OhNo then
			SoundC.PlaybackSpeed = (Torso.Velocity*Vector3.new(1,0,1)).Magnitude/95
			SoundC.TimePosition = 0.2
			SoundC:Play()
			Stopped = false
			if Bill2.Size.X.Scale < 6 then
				Bill2.StudsOffsetWorldSpace = Torso.Position + Vector3.new(0,-1.4,0)
				Bill2.Size = UDim2.new(8,0,8,0)
				Image2.ImageColor3 = LastStep.Color
			end
		elseif AnimFrame == 2 and LandTimer > 0 and Bump <= 0 then
			if Sliding then
				SoundC.PlaybackSpeed = 2.5
			else
				SoundC.PlaybackSpeed = 1.2
			end
			SoundC.TimePosition = 0.2
			SoundC:Play()
			Stopped = false
			if Bill2.Size.X.Scale <= 4 then
				Bill2.StudsOffsetWorldSpace = LeftLeg.Position + Vector3.new(0,-0.8,0)
				Bill2.Size = UDim2.new(4,0,4,0)
				Image2.ImageColor3 = LastStep.Color
			end
		elseif AnimFrame == 4 and LandTimer > 0 and Bump <= 0 then
			if Sliding then
				SoundC.PlaybackSpeed = 1.5
			else
				SoundC.PlaybackSpeed = 0.8
			end
			SoundC.TimePosition = 0.2
			SoundC:Play()
			Stopped = false
			if Bill2.Size.X.Scale <= 4 then
				Bill2.StudsOffsetWorldSpace = RightLeg.Position + Vector3.new(0,-0.8,0)
				Bill2.Size = UDim2.new(4,0,4,0)
				Image2.ImageColor3 = LastStep.Color
			end
		elseif Stopped == false then
			SoundC:Stop()
			Stopped = true
		end
		if Hit and Hurt <= 0 then
			HP = HP - 1
			if Bill.Size.X.Scale < 16 then
				Bill.StudsOffsetWorldSpace = Torso.Position
				Bill.Size = UDim2.new(16,0,16,0)
				Image.ImageColor3 = Torso.Color
			end
			if ExtraHit then
				HP = HP - 1
				if Bill.Size.X.Scale < 24 then
					Bill.StudsOffsetWorldSpace = Torso.Position
					Bill.Size = UDim2.new(24,0,24,0)
					Image.ImageColor3 = Torso.Color
				end
				if Bill2.Size.X.Scale < 16 then
					Bill2.StudsOffsetWorldSpace = Torso.Position
					Bill2.Size = UDim2.new(16,0,16,0)
					Image2.ImageColor3 = Torso.Color
				end
				delay(0,function()
					BANG(Torso.Position)
				end)
				delay(0,function()
					Ding()
				end)
				delay(0,function()
					Shatter(Torso.Position)
				end)
			end
			Hurt = 2
			Heal = 250
			delay(0,function()
				HitSound(Torso.Position)
			end)
			if HP <= 0 and Down >= 200 then
				Head.Material = Enum.Material.CorrodedMetal
				RightArm.Material = Enum.Material.CorrodedMetal
				LeftLeg.Material = Enum.Material.CorrodedMetal
				delay(0,function()
					AOW()
				end)
				local a = "OW"
				if Tag.Value ~= "" and Tag.Value ~= "2 "..Color.Name then
					a = Tag.Value.." had me..."
				end
				Text = a
				TL.Text = a
				local H = Instance.new("Hint",game.Workspace)
				H.Text = a.." / ".."2 "..Color.Name
				game.Debris:AddItem(H,4)
				ChatTimer = 75 + string.len(a)
				Torso.CFrame = Torso.CFrame * CFrame.new(0,0,0,-0.15,0,0,1)
				local Match = game:GetService("Players"):FindFirstChild(Tag.Value)
				if Match and Match:IsA("Player") then
					if Match:FindFirstChild("leaderstats") and Match.leaderstats:FindFirstChild("Score") and Match.leaderstats.Score:IsA("NumberValue") then
						Match.leaderstats.Score.Value = Match.leaderstats.Score.Value + 4
					end
				end
			end
		else
			Hurt = Hurt - 1
		end
		if HP >= 5 then
			Heal = 250
		else
			Heal = Heal - 1
			if Heal <= 0 then
				HP = HP + 1
				Heal = 250
				Bill3.StudsOffsetWorldSpace = Torso.Position
				Bill3.Size = UDim2.new(6,0,6,0)
				Image3.ImageColor3 = Torso.Color
			end
		end
		if Bla and Fire <= -2 and HP > 0 then
			if Fire <= 0 and Direction ~= "Idle" and Blast then
				local ExplodingShot = (Fire <= -30)
				LastSuper = ExplodingShot
				local StraightShot = (LandTimer < 0)
				Blast.BrickColor = Torso.BrickColor
				local HitTag = Instance.new("StringValue",Blast)
				HitTag.Name = "HitTag"
				HitTag.Value = "2 "..Color.Name
				local T = Blast:GetTouchingParts()
				local Ping = false
				local Block = false
				local Confirm = false
				local function CountHit()
					if not Confirm then
						Confirm = true
						RegHits = RegHits + 1
						delay(0,function()
							SoundB.PlaybackSpeed = 1
							SoundB.TimePosition = 0.2
							SoundB:Play()
							wait(0.06)
							SoundB.PlaybackSpeed = 1.75
							SoundB.TimePosition = 0.2
							SoundB:Play()
						end)
					end
				end
				for i = 1,#T do
					if T[i] and T[i].Parent and T[i].Parent ~= FakeChar then
						Ping = true
						if T[i].CanCollide then
							Block = true
						end
						if Bill.Size.X.Scale < 16 then
							Bill.StudsOffsetWorldSpace = T[i].Position
							Bill.Size = UDim2.new(16,0,16,0)
							Image.ImageColor3 = Blast.Color
						end
						if ExplodingShot then
							delay(0.03,function()
								T[i]:BreakJoints()
							end)
							delay(0,function()
								HitSound(T[i].Position)
							end)
							delay(0,function()
								for a = 1,11 do
									if Bill.Size.X.Scale < 48 then
										Bill.StudsOffsetWorldSpace = T[i].Position
										Bill.Size = UDim2.new(48,0,48,0)
										if a < 11 then
											if a%2 == 1 then
												Image.ImageColor3 = Color3.new(1,1,0)
											else
												Image.ImageColor3 = Color3.new(0,0,1)
											end
										else
											Image.ImageColor3 = Blast.Color
										end
									end
									wait(0.04)
								end
							end)
						end
						local Humanoid = T[i].Parent:FindFirstChildWhichIsA("Humanoid")
						if Humanoid and not (Humanoid:FindFirstChild("creator") and Humanoid:FindFirstChild("creator"):IsA("ObjectValue") and Humanoid.creator.Value == nil) then
							Humanoid:TakeDamage(70)
							if ExplodingShot == true then
								Humanoid:TakeDamage(4026)
								delay(0,function()
									BANG(T[i].Position)
								end)
								delay(0,function()
									ZAP(T[i].Position)
								end)
								delay(0,function()
									Shatter(T[i].Position)
								end)
							end
							local creator = Instance.new("ObjectValue",Humanoid)
							creator.Name = "creator"
							if ExplodingShot then
								Humanoid.Sit = not Humanoid.Sit
							end
							game:GetService("Debris"):AddItem(creator,0.14)
							delay(0,function()
								HitSound(T[i].Position)
							end)
							CountHit()
						elseif Humanoid == nil and T[i]:GetMass() < 120 then
							delay(0.03,function()
								T[i]:BreakJoints()
							end)
							delay(0,function()
								HitSound(T[i].Position)
							end)
						end
						if T[i].Parent then
							local Tag2 = T[i].Parent:FindFirstChild("FakeHumanoid")
							if Tag2 then
								Tag2.Value = "2 "..Color.Name
								CountHit()
							end
						end
					end
				end
				if Ping == true then
					delay(0,function()
						Dong(Blast.Position)
					end)
					if ExplodingShot then
						if math.random(1,2) == 1 then
							if TL then
								Text = "YAH"
								TL.Text = "YAH"
							end
							ChatTimer = 75 + string.len("YAH")
							delay(0,function()
								YAH()
							end)
						else
							if TL then
								Text = "YO"
								TL.Text = "YO"
							end
							ChatTimer = 75 + string.len("YO")
							delay(0,function()
								YO()
							end)
						end
					end
				end
				if Block == false then
					delay(0,function()
						ShootSound()
					end)
				end
				if ExplodingShot then
					delay(0,function()
						Swoosh()
					end)
				end
				delay(0,function()
					if RightArm then
						RightArm.CFrame = Torso.CFrame * CFrame.new(1.5,0.5,-0.5,1,0,0,1)
					end
					if Blast and RightArm then
						Blast.CFrame = RightArm.CFrame * CFrame.new(0,-2.25,-0.5,-1,0,0,1)
					end
					if Block == false then
						if Blast then
							if Bill2.Size.X.Scale < 4 then
								Bill2.StudsOffsetWorldSpace = Blast.Position + Blast.CFrame.LookVector * 1.5
								Bill2.Size = UDim2.new(4,0,4,0)
								Image2.ImageColor3 = Blast.Color
							end
							if RightArm and RightArm.Parent == FakeChar then
								Blast.CFrame = RightArm.CFrame * CFrame.new(0,-2.25,-0.5,-1,0,0,1)
							else
								Blast.CFrame = Torso.CFrame * CFrame.new(-1.25,1.5,0,0,0,0,1)
							end
						end
						Shoot(Blast.CFrame * CFrame.new(0,0,-6),Blast.BrickColor,ExplodingShot,StraightShot,Beam,Bill2,Image2,SoundB)
					end
				end)
				Fire = 3
			end
		end
		if LandTimer == 1 then
			Jump = true
		end
		if Jump and HP > 0 and LandTimer > 0 and Bump <= 0 then
			Torso.Velocity = Vector3.new(Torso.Velocity.X,Torso.Velocity.Y + 50,Torso.Velocity.Z)
			LandTimer = 1
			FakeChar:TranslateBy(Vector3.new(0,0.2,0))
			local TouchLeg = false
			local LT = LeftLeg:GetTouchingParts()
			for i = 1,#LT do
				if LT[i] and LT[i].Parent ~= FakeChar and LT[i].CanCollide then
					TouchLeg = true
				end
			end
			local RT = RightLeg:GetTouchingParts()
			for i = 1,#RT do
				if RT[i] and RT[i].Parent ~= FakeChar and RT[i].CanCollide then
					TouchLeg = true
				end
			end
			if TouchLeg == false then
				delay(0,function()
					SwingSound()
				end)
			end
		end
		Fire = Fire - 1
		if Fire == -30 and math.random(1,6) == 1 and HP > 0 then
			Text = "Ready to blast!"
			TL.Text = "Ready to blast!"
			ChatTimer = 75 + string.len("Ready to blast!")
		end
		Bump = Bump - 1
		local C = FakeChar:GetChildren()
		for i = 1,#C do
			if C[i]:IsA("BasePart") then
				C[i].Anchored = true
				C[i].Velocity = Torso.Velocity
				if HP == 5 then
					C[i].BrickColor = BrickColor.new("Toothpaste")
				elseif HP == 4 then
					C[i].BrickColor = BrickColor.new("Lime green")
				elseif HP == 3 then
					C[i].BrickColor = BrickColor.new("New Yeller")
				elseif HP == 2 then
					C[i].BrickColor = BrickColor.new("Hot pink")
				elseif HP == 1 then
					C[i].BrickColor = BrickColor.new("Really red")
				else
					C[i].BrickColor = BrickColor.new("Really blue")
				end
			end
		end
		if Fire > 1 then
			Blast.Name = "Blade"
			Blast.CanCollide = true
			if LastSuper then
				Blast.Name = "Zap"
				Blast.Velocity = Blast.CFrame.lookVector * 800 + Vector3.new(0,400,0)
			else
				Blast.Velocity = Blast.CFrame.lookVector * 100 + Vector3.new(0,25,0)
			end
		else
			local HitTag = Blast:FindFirstChild("HitTag")
			if HitTag and HitTag:IsA("StringValue") then
				HitTag:Destroy()
			end
			Blast.Name = "B"
			Blast.CanCollide = false
		end
		Head.BrickColor = Brightness
		if LeftArm then
			LeftArm.BrickColor = Brightness
		end
		if RightArm then
			RightArm.BrickColor = Brightness
		end
		if ShipTrail then
			if HP == 5 then
				ShipTrail.Color = ColorSequence.new(Color3.new(0,1,1))
			elseif HP == 4 then
				ShipTrail.Color = ColorSequence.new(Color3.new(0,1,0))
			elseif HP == 3 then
				ShipTrail.Color = ColorSequence.new(Color3.new(1,1,0))
			elseif HP == 2 then
				ShipTrail.Color = ColorSequence.new(Color3.new(1,0,1))
			elseif HP == 1 then
				ShipTrail.Color = ColorSequence.new(Color3.new(1,0,0))
			else
				ShipTrail.Color = ColorSequence.new(Color3.new(0,0,1))
			end
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
			else
				TL.TextStrokeColor3 = Color3.new(0,0,1)
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
			TL.Text = "> 2 "..Color.Name
		end
		if Color.Name ~= "White" then
			local TeamColor = Color
			Torso.BrickColor = TeamColor
			if Blast then
				Blast.BrickColor = TeamColor
			end
			TL.TextColor3 = TeamColor.Color
		else
			Torso.BrickColor = Color
			if Blast then
				Blast.BrickColor = Color
			end
			TL.TextColor3 = Color.Color
		end
		if Blast and PointLight then
			PointLight.Color = Blast.Color
		end
		if Blast and SpotLight then
			if HP <= 2 then
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
				else
					SpotLight.Brightness = 5
				end
			else
				SpotLight.Brightness = 5
			end
		end
		LD.Color3 = Color3.new(0,0,0)
		RD.Color3 = Color3.new(0,0,0)
		if Fire < -30 and Fire % 2 == 0 then
			Blast.BrickColor = BrickColor.new("White")
		end
		BlinkTimer = BlinkTimer - 1
		if HP > 0 and BlinkTimer > 1 and Bump <= 0 then
			if not (LaughTimer > 0 and LaughTimer % 5 < 2) and (LaughTimer > 0 and LaughTimer % 5 > 1) then
				Left.CFrame = Head.CFrame * CFrame.new(-0.1875,0.25,-0.5)
				Right.CFrame = Head.CFrame * CFrame.new(0.1875,0.25,-0.5)
				Left.Size = Vector3.new(0.125,0.25,0.05)
				Right.Size = Vector3.new(0.125,0.25,0.05)
			elseif LaughTimer > 0 and LaughTimer % 5 < 2 then
				Left.CFrame = Head.CFrame * CFrame.new(-0.25,0.0625,-0.5)
				Right.CFrame = Head.CFrame * CFrame.new(0.25,0.0625,-0.5)
				Left.Size = Vector3.new(0.25,0.125,0.05)
				Right.Size = Vector3.new(0.25,0.125,0.05)
			else
				Left.CFrame = Head.CFrame * CFrame.new(-0.1875,0.1875,-0.5)
				Right.CFrame = Head.CFrame * CFrame.new(0.1875,0.1875,-0.5)
				Left.Size = Vector3.new(0.125,0.375,0.05)
				Right.Size = Vector3.new(0.125,0.375,0.05)
			end
			if Fire > 0 then
				LD.Color3 = Torso.Color
				RD.Color3 = Torso.Color
			elseif Fire < -30 and Fire % 2 == 0 then
				LD.Color3 = Torso.Color
			elseif Fire < -30 then
				LD.Color3 = Color3.new(1,1,1)
			end
			if FallTimer >= 38 or EmoteTimer > 0 or OhNo then
				LD.Color3 = Color3.new(1,1,1)
				RD.Color3 = Color3.new(1,1,1)
			end
		else
			if BlinkTimer <= 0 then
				BlinkTimer = 125
			end
			if Down >= 130 and HP <= 0 then
				if Down >= 150 or Down % 2 == 0 then
					LD.Color3 = Torso.Color
					RD.Color3 = Torso.Color
				end
			end
			if Down >= 150 and Down % 2 == 0 and Jump and HP <= 0 then
				LD.Color3 = Color3.new(1,1,1)
				RD.Color3 = Color3.new(1,1,1)
			end
			Left.CFrame = Head.CFrame * CFrame.new(-0.25,0.0625,-0.5)
			Right.CFrame = Head.CFrame * CFrame.new(0.25,0.0625,-0.5)
			Left.Size = Vector3.new(0.25,0.125,0.05)
			Right.Size = Vector3.new(0.25,0.125,0.05)
		end
		Hit = false
		ExtraHit = false
		wait(0.04)
	end
	LD.Color3 = Torso.Color
	RD.Color3 = Torso.Color
	local a = "That really hit!"
	if Tag.Value ~= "" then
		a = Tag.Value.." landed a good hit!"
	end
	if a ~= "That really hit!" or math.random(1,8) == 1 then
		if BBG and TL then
			local H = Instance.new("Hint",game.Workspace)
			H.Text = a.." ".."2 "..Color.Name.." is down!"
			game.Debris:AddItem(H,4)
			if Color.Name ~= "White" then
				TL.TextColor3 = Color.Color
			else
				TL.TextColor3 = Color.Color
			end
			TL.TextStrokeColor3 = Color3.new(0,0,0)
			TL.Text = a.." ".."2 "..Color.Name.." is down!"
		end
		if true then
			delay(0,function()
				Speech(a,"2 "..Color.Name.." is down!")
			end)
		end
	end
	Beam.Parent = nil
	ShipTrail.Parent = nil
	local Match = game:GetService("Players"):FindFirstChild(Tag.Value)
	if Match and Match:IsA("Player") then
		if Match:FindFirstChild("leaderstats") and Match.leaderstats:FindFirstChild("Score") and Match.leaderstats.Score:IsA("NumberValue") then
			Match.leaderstats.Score.Value = Match.leaderstats.Score.Value + 2
		end
	end
	KillChar(FakeChar,Torso,Torso.BrickColor)
	if Bill and Bill.Parent then
		Bill:Destroy()
	end
	if Bill2 and Bill2.Parent then
		Bill2:Destroy()
	end
	if Bill3 and Bill3.Parent then
		Bill3:Destroy()
	end
end
while true do
	wait(1.2)
	if Spawned % 4 == 0 and Spawned ~= 0 then
		if math.random(1,2) == 1 then
			Hint.Text = [[




That bot's going down!]]
			Speech("That bot's going down!","")
		else
			Hint.Text = [[




Alright, we got 'em!]]
			Speech("","Alright, we got 'em!")
		end
		wait(1)
		Color = BrickColor.new("White")
		local Choice = math.random(1,6)
		if Choice == 1 then
			Color = BrickColor.new("Bright red")
		elseif Choice == 2 then
			Color = BrickColor.new("Bright yellow")
		elseif Choice == 3 then
			Color = BrickColor.new("Bright green")
		elseif Choice == 4 then
			Color = BrickColor.new("Bright blue")
		elseif Choice == 5 then
			Color = BrickColor.new("Bright violet")
		end
		local Pick = math.random(1,2)
		if Pick == 1 then
			Brightness = BrickColor.new("Black")
		elseif Pick == 2 then
			Brightness = BrickColor.new("Dark stone grey")
		end
		for i = 1,300 do
			Hint.Text = [[




Set 2 ]]..Spawned.." down, 5 min break / "..300 - i.." / Landed: "..tostring(RegHits)
			if i > 290 then
				S.PlaybackSpeed = 1.6
				S:Play()
			end
			wait(1)
		end
	end
	Ready()
end
