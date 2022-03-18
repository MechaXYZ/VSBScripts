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
local SoundA = Instance.new("Sound",game:GetService("VRService"))
	SoundA.SoundId = "rbxasset://sounds/swordslash.wav"
	SoundA.Volume = 1
	SoundA.PlayOnRemove = true
	local SoundB = Instance.new("Sound",game:GetService("VRService"))
	SoundB.SoundId = "rbxasset://sounds/swordlunge.wav"
	SoundB.Volume = 1
	SoundB.PlayOnRemove = true
	local SoundC = Instance.new("Sound",game:GetService("VRService"))
	SoundC.SoundId = "rbxasset://sounds/flashbulb.wav"
	SoundC.Volume = 1.6
	SoundC.PlayOnRemove = true
	local SoundD = Instance.new("Sound",game:GetService("VRService"))
	SoundD.SoundId = "rbxasset://sounds/uuhhh.mp3"
	SoundD.Volume = 1.4
	SoundD.PlayOnRemove = true
	local SoundE = Instance.new("Sound",game:GetService("VRService"))
	SoundE.SoundId = "rbxasset://sounds/kerplunk.wav"
	SoundE.Volume = 1.8
	SoundE.PlayOnRemove = true
	local SoundF = Instance.new("Sound",game:GetService("VRService"))
	SoundF.SoundId = "rbxasset://sounds/electronicpingshort.wav"
	SoundF.Volume = 1.6
	SoundF.PlayOnRemove = true
	local SoundG = Instance.new("Sound",game:GetService("VRService"))
	SoundG.SoundId = "rbxasset://sounds/Rocket shot.wav"
	SoundG.Volume = 0.7
	SoundG.PlayOnRemove = true
local H = Instance.new("Hint",script)
local B1 = Instance.new("BillboardGui",script)
local T1 = Instance.new("TextBox",B1)
local B2 = Instance.new("BillboardGui",script)
local T2 = Instance.new("TextBox",B2)
local B3 = Instance.new("BillboardGui",script)
local T3 = Instance.new("TextBox",B3)
local B4 = Instance.new("BillboardGui",script)
local T4 = Instance.new("TextBox",B4)
local B5 = Instance.new("BillboardGui",script)
local T5 = Instance.new("TextBox",B5)
local Order = 1
local Timer1 = 0
local Timer2 = 0
local Timer3 = 0
local Timer4 = 0
local Timer5 = 0
local Heavy1 = false
local Heavy2 = false
local Heavy3 = false
local Heavy4 = false
local Heavy5 = false
function Damage(dmg,pos,color,crit)
	local BillboardGui
	if Order == 1 then
		BillboardGui = B1
		Timer1 = 28
	elseif Order == 2 then
		BillboardGui = B2
		Timer2 = 28
	elseif Order == 3 then
		BillboardGui = B3
		Timer3 = 28
	elseif Order == 4 then
		BillboardGui = B4
		Timer4 = 28
	elseif Order == 5 then
		BillboardGui = B5
		Timer5 = 28
	end
	BillboardGui.Size = UDim2.new(3, 0, 3, 0)
	BillboardGui.StudsOffsetWorldSpace = pos
	BillboardGui.AlwaysOnTop = true
	local TextLabel
	if Order == 1 then
		TextLabel = T1
	elseif Order == 2 then
		TextLabel = T2
	elseif Order == 3 then
		TextLabel = T3
	elseif Order == 4 then
		TextLabel = T4
	elseif Order == 5 then
		TextLabel = T5
	end
	TextLabel.BackgroundTransparency = 1
	TextLabel.Size = UDim2.new(1, 0, 1, 0)
	TextLabel.TextSize = 45
	TextLabel.TextStrokeTransparency = 0
	TextLabel.Visible = true
	if crit then
		TextLabel.TextSize = 100
	end
	local UseText = ""
	local DamageDone = dmg
	if DamageDone == "BLOCK" or DamageDone >= 8.75 then
		if Order == 1 then
			Heavy1 = true
		elseif Order == 2 then
			Heavy2 = true
		elseif Order == 3 then
			Heavy3 = true
		elseif Order == 4 then
			Heavy4 = true
		elseif Order == 5 then
			Heavy5 = true
		end
	else
		if Order == 1 then
			Heavy1 = false
		elseif Order == 2 then
			Heavy2 = false
		elseif Order == 3 then
			Heavy3 = false
		elseif Order == 4 then
			Heavy4 = false
		elseif Order == 5 then
			Heavy5 = false
		end
	end
	TextLabel.Text = dmg
	TextLabel.TextColor3 = color
	if color.r + color.g + color.b > 1.25 then
		TextLabel.TextStrokeColor3 = Color3.new(color.r - 0.25, color.g - 0.25,color.b - 0.25)
	elseif color.r + color.g + color.b <= 1.25 then
		TextLabel.TextStrokeColor3 = Color3.new(color.r + 0.25, color.g + 0.25,color.b + 0.25)
	end
	TextLabel.Font = Enum.Font.SciFi
	Order = Order + 1
	if Order >= 6 then
		Order = 1
	end
end

delay(0,function()
	while true do
		wait(0.05)
		Timer1 = Timer1 - 1
		Timer2 = Timer2 - 1
		Timer3 = Timer3 - 1
		Timer4 = Timer4 - 1
		Timer5 = Timer5 - 1
		B1.StudsOffsetWorldSpace = B1.StudsOffsetWorldSpace + Vector3.new(0,0.5,0)
		B2.StudsOffsetWorldSpace = B2.StudsOffsetWorldSpace + Vector3.new(0,0.5,0)
		B3.StudsOffsetWorldSpace = B3.StudsOffsetWorldSpace + Vector3.new(0,0.5,0)
		B4.StudsOffsetWorldSpace = B4.StudsOffsetWorldSpace + Vector3.new(0,0.5,0)
		B5.StudsOffsetWorldSpace = B5.StudsOffsetWorldSpace + Vector3.new(0,0.5,0)
		if Timer1 <= 0 then
			T1.Visible = false
		end
		if Timer2 <= 0 then
			T2.Visible = false
		end
		if Timer3 <= 0 then
			T3.Visible = false
		end
		if Timer4 <= 0 then
			T4.Visible = false
		end
		if Timer5 <= 0 then
			T5.Visible = false
		end
		if Heavy1 == true then
			T1.TextColor3 = Color3.new(1 - T1.TextColor3.r,1 - T1.TextColor3.g,1 - T1.TextColor3.b)
		end
		if Heavy2 == true then
			T2.TextColor3 = Color3.new(1 - T2.TextColor3.r,1 - T2.TextColor3.g,1 - T2.TextColor3.b)
		end
		if Heavy3 == true then
			T3.TextColor3 = Color3.new(1 - T3.TextColor3.r,1 - T3.TextColor3.g,1 - T3.TextColor3.b)
		end
		if Heavy4 == true then
			T4.TextColor3 = Color3.new(1 - T4.TextColor3.r,1 - T4.TextColor3.g,1 - T4.TextColor3.b)
		end
		if Heavy5 == true then
			T5.TextColor3 = Color3.new(1 - T5.TextColor3.r,1 - T5.TextColor3.g,1 - T5.TextColor3.b)
		end
	end
end)
local Spawned = 0
function Ready()
	local Color = BrickColor.new("Black")
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
	local LastPosition = Vector3.new(math.random(-200,200),250,math.random(-200,200))
	local Cooldown = false
	local Model
	local H
	local T
	local LA
	local RA
	local LL
	local RL
	local R
	local Humanoid
	local function r()
		return math.random(-3,3)
	end
	local function Create()
		if Cooldown == true then return end
		Model = Instance.new("Model",script)
		Model.Name = "SwordNPC "..Color.Name
		H = Instance.new("Part",Model)
		H.Name = "Head"
		H.Position = LastPosition + Vector3.new(r(),r(),r())
		H.Size = Vector3.new(2,1,1)
		H.TopSurface = Enum.SurfaceType.Smooth
		H.BrickColor = BrickColor.new("Dark stone grey")
		local face = Instance.new("Decal",H)
		face.Name = "face"
		face.Texture = "rbxasset://textures/face.png"
		local Mesh = Instance.new("SpecialMesh",H)
		Mesh.Scale = Vector3.new(1.25,1.25,1.25)
		T = Instance.new("Part",Model)
		T.Name = "Torso"
		T.Position = LastPosition + Vector3.new(r(),r(),r())
		T.Size = Vector3.new(2,2,1)
		T.LeftSurface = Enum.SurfaceType.Weld
		T.RightSurface = Enum.SurfaceType.Weld
		T.BrickColor = Color
		local roblox = Instance.new("Decal",T)
		roblox.Name = "roblox"
		LA = Instance.new("Part",Model)
		LA.Name = "Left Arm"
		LA.Position = LastPosition + Vector3.new(r(),r(),r())
		LA.Size = Vector3.new(1,2,1)
		LA.BrickColor = BrickColor.new("Dark stone grey")
		RA = Instance.new("Part",Model)
		RA.Name = "Right Arm"
		RA.Position = LastPosition + Vector3.new(r(),r(),r())
		RA.Size = Vector3.new(1,2,1)
		RA.BrickColor = BrickColor.new("Dark stone grey")
		LL = Instance.new("Part",Model)
		LL.Name = "Left Leg"
		LL.Position = LastPosition + Vector3.new(r(),r(),r())
		LL.Size = Vector3.new(1,2,1)
		LL.BottomSurface = Enum.SurfaceType.Smooth
		LL.BrickColor = BrickColor.new("Dark stone grey")
		RL = Instance.new("Part",Model)
		RL.Name = "Right Leg"
		RL.Position = LastPosition + Vector3.new(r(),r(),r())
		RL.Size = Vector3.new(1,2,1)
		RL.BottomSurface = Enum.SurfaceType.Smooth
		RL.BrickColor = BrickColor.new("Dark stone grey")
		R = Instance.new("Part",Model)
		R.Name = "HumanoidRootPart"
		R.Position = LastPosition + Vector3.new(r(),r(),r())
		R.Size = Vector3.new(2,2,1)
		R.Transparency = 1
	end
	local function Build()
		if Cooldown == false and Model and Model.Parent and H and H.Parent == Model and T and T.Parent == Model and LA and LA.Parent == Model and RA and RA.Parent == Model and LL and LL.Parent == Model and RL and RL.Parent == Model then
			Cooldown = true
			Humanoid = Instance.new("Humanoid")
			Model:BreakJoints()
			local C = Model:GetChildren()
			for i = 1,#C do
				if C[i]:IsA("BasePart") then
					C[i].CanCollide = true
					C[i].Anchored = false
				end
			end
			T.Name = "Torso"
			Model.PrimaryPart = H
			H.Name = "Head"
			H.CFrame = T.CFrame * CFrame.new(0,1.5,0)
			local N = Instance.new("Motor6D",T)
			N.Name = "Neck"
			N.Part0 = T
			N.Part1 = H
			N.C0 = CFrame.new(0,1,0,-1,0,0,0,0,1,0,1,-0)
			N.C1 = CFrame.new(0,-0.5,0,-1,0,0,0,0,1,0,1,-0)
			N.MaxVelocity = 0.1
			LA.Name = "Left Arm"
			LA.CFrame = T.CFrame * CFrame.new(-1.5,0,0,0,0,0,1)
			local LS = Instance.new("Motor6D",T)
			LS.Name = "Left Shoulder"
			LS.Part0 = T
			LS.Part1 = LA
			LS.C0 = CFrame.new(-1,0.5,0,0,0,-1,0,1,0,1,0,0)
			LS.C1 = CFrame.new(0.5,0.5,0,0,0,-1,0,1,0,1,0,0)
			LS.MaxVelocity = 0.1
			LS.DesiredAngle = 0.385
			RA.Name = "Right Arm"
			RA.CFrame = T.CFrame * CFrame.new(1.5,0,-0.5,0.25,0,0,1)
			local RS = Instance.new("Motor6D",T)
			RS.Name = "Right Shoulder"
			RS.Part0 = T
			RS.Part1 = RA
			RS.C0 = CFrame.new(1,0.5,0,0,0,1,0,1,-0,-1,0,0)
			RS.C1 = CFrame.new(-0.5,0.5,0,0,0,1,0,1,-0,-1,0,0)
			RS.MaxVelocity = 0.1
			RS.DesiredAngle = 1.57
			LL.Name = "Left Leg"
			LL.CFrame = T.CFrame * CFrame.new(-0.5,-2,-0.5,0.25,0,0,1)
			local LH = Instance.new("Motor6D",T)
			LH.Name = "Left Hip"
			LH.Part0 = T
			LH.Part1 = LL
			LH.C0 = CFrame.new(-1,-1,0,0,0,-1,0,1,0,1,0,0)
			LH.C1 = CFrame.new(-0.5,1,0,0,0,-1,0,1,0,1,0,0)
			LH.MaxVelocity = 0.1
			LH.DesiredAngle = -0.385
			RL.Name = "Right Leg"
			RL.CFrame = T.CFrame * CFrame.new(0.5,-2,0.5,-0.25,0,0,1)
			local RH = Instance.new("Motor6D",T)
			RH.Name = "Right Hip"
			RH.Part0 = T
			RH.Part1 = RL
			RH.C0 = CFrame.new(1,-1,0,0,0,1,0,1,0,-1,0,0)
			RH.C1 = CFrame.new(0.5,1,0,0,0,1,0,1,-0,-1,0,0)
			RH.MaxVelocity = 0.1
			RH.DesiredAngle = -0.385
			R.Name = "HumanoidRootPart"
			R.CFrame = T.CFrame
			local RJ = Instance.new("Motor6D",R)
			RJ.Name = "RootJoint"
			RJ.Part0 = R
			RJ.Part1 = T
			RJ.C0 = CFrame.new(0,0,0,-1,0,0,0,0,1,0,1,-0)
			RJ.C1 = CFrame.new(0,0,0,-1,0,0,0,0,1,0,1,-0)
			RJ.MaxVelocity = 0.1
			Humanoid.Parent = Model
			if Humanoid:FindFirstChildWhichIsA("Animator") == nil then
				Instance.new("Animator",Humanoid)
			end
			local function Died()
				game.Debris:AddItem(Model,1.5)
			end
			Humanoid.Died:Connect(Died)
			delay(0,function()
				while Humanoid and Humanoid:FindFirstAncestorWhichIsA("Workspace") do
					wait(1)
					Humanoid.Health = Humanoid.Health + 1
				end
			end)
			Cooldown = false
		else
			warn("how the come")
		end
	end
	Create()
	Build()
	local MoveDirection = Vector3.new(0,0,0)
	local RunAwayDirection Vector3.new(0,0,0)
	local RunAwayTimer = 0
	local Tool = Instance.new("Tool")
	Tool.Name = "Sword"
	Tool.TextureId = "rbxasset://textures/DevConsole/Close.png"
	Tool.GripPos = Vector3.new(0,-2,0.25)
	Tool.GripForward = Vector3.new(0,0.5,-0.85)
	local Blade = Instance.new("Part",Tool)
	Blade.Name = "Handle"
	Blade.Size = Vector3.new(0.2,4,1)
	local Choice = math.random(1,5)
	if Choice == 1 then
		Blade.BrickColor = BrickColor.new("Cyan")
	elseif Choice == 2 then
		Blade.BrickColor = BrickColor.new("Bright red")
	elseif Choice == 3 then
		Blade.BrickColor = BrickColor.new("Bright yellow")
	elseif Choice == 4 then
		Blade.BrickColor = BrickColor.new("Royal purple")
	elseif Choice == 5 then
		Blade.BrickColor = BrickColor.new("Forest green")
	end
	Blade.Material = Enum.Material.SmoothPlastic
	Blade.Locked = true
--a--
	local A = Instance.new("Attachment",Blade)
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
	local Bill = Instance.new("BillboardGui",script)
	Bill.Size = UDim2.new(16,0,16,0)
	local Image = Instance.new("ImageLabel",Bill)
	Image.Image = "rbxasset://textures/sparkle.png"
	Image.Size = UDim2.new(1,0,1,0)
	Image.Position = UDim2.new(0.5,0,0.5,0)
	Image.AnchorPoint = Vector2.new(0.5,0.5)
	Image.ImageTransparency = 1
	Image.BackgroundTransparency = 1
	local SelectionBox = Instance.new("SelectionBox",script)
	SelectionBox.LineThickness = 0.05
	SelectionBox.SurfaceTransparency = 0.5
	local Fire = 0
	local LastSuper = false
	local Alternate = false
	local Down = false
	local CurrentHumanoid = nil
	local CurrentHealth = 0
	local CurrentPlayer = nil
	local CritTimer = 0
	local function Pathfind(pos)
		local Points = game:GetService("PathfindingService"):ComputeRawPathAsync(R.Position,pos,300)
		local Co = Points:GetPointCoordinates()
		local Offset = Vector3.new(0,0,0)
		if Points.Status == Enum.PathStatus.Success or Points.Status == Enum.PathStatus.ClosestNoPath or Points.Status == Enum.PathStatus.ClosestOutOfRange then
			if #Co >= 3 then
				Offset = Co[3] - R.Position
				if Co[3].Y > R.Position.Y + 1 or Humanoid.Sit or Humanoid.PlatformStand then
					Humanoid.Jump = true
				end
			elseif #Co >= 2 then
				Offset = Co[2] - R.Position
				if Co[2].Y > R.Position.Y + 1 or Humanoid.Sit or Humanoid.PlatformStand then
					Humanoid.Jump = true
				end
			elseif #Co >= 1 then
				Offset = Co[1] - R.Position
				if Co[1].Y > R.Position.Y + 1 or Humanoid.Sit or Humanoid.PlatformStand then
					Humanoid.Jump = true
				end
			end
		end
		return Offset,Points.Status
	end
	local function HealthChanged(NewHealth)
		if CurrentHumanoid ~= nil and CurrentHumanoid.Parent then
			if CurrentHumanoid.Health < CurrentHealth and Fire > 6 then
				CurrentHumanoid.Health = CurrentHealth
				if SoundE then
					SoundE.PlaybackSpeed = 1.2
SoundE.Parent = Blade
SoundE.Parent = nil
				end
				if SoundF then
SoundF.Parent = Blade
SoundF.Parent = nil
				end
				if Blade then
					if Particles then
						if Player and Player.Neutral == false then
							Particles.Color = ColorSequence.new(Player.TeamColor.Color)
						else
							Particles.Color = ColorSequence.new(Color3.new(1-Blade.Color.r,1-Blade.Color.g,1-Blade.Color.b))
						end
						Particles:Emit(25)
					end
					if CritTimer < 0 then
						Bill.StudsOffsetWorldSpace = Blade.Position
						Bill.Size = UDim2.new(16,0,16,0)
						Image.ImageTransparency = 0
						if CurrentPlayer and CurrentPlayer.Neutral == false then
							Image.ImageColor3 = CurrentPlayer.TeamColor.Color
						else
							Image.ImageColor3 = Color3.new(1-Blade.Color.r,1-Blade.Color.g,1-Blade.Color.b)
						end
					end
					local t = CurrentHumanoid.Parent:FindFirstChild("Torso") or CurrentHumanoid.Parent:FindFirstChild("UpperTorso") or CurrentHumanoid.Parent:FindFirstChild("HumanoidRootPart")
					if t and t:IsA("BasePart") then
						Damage("BLOCK",t.Position,t.Color or Color3.new(1,0.4,0.15),false)
					end
				end
			elseif CurrentHumanoid.Health < CurrentHealth then
				local t = CurrentHumanoid.Parent:FindFirstChild("Torso") or CurrentHumanoid.Parent:FindFirstChild("UpperTorso") or CurrentHumanoid.Parent:FindFirstChild("HumanoidRootPart")
				if t and t:IsA("BasePart") then
					if CritTimer < 0 then
						Bill.StudsOffsetWorldSpace = t.Position
						Bill.Size = UDim2.new(16,0,16,0)
						Image.ImageTransparency = 0
						Image.ImageColor3 = t.Color
					end
					Damage(math.floor(CurrentHealth-CurrentHumanoid.Health),t.Position,t.Color or Color3.new(1,0.4,0.15),false)
				end
			end
			if CurrentHumanoid ~= nil then
				CurrentHealth = CurrentHumanoid.Health
			end
		end
	end
	local function Equipped()
		Fire = math.min(0,Fire)
		Tool.Enabled = true
		local Humanoid = Tool.Parent:FindFirstChildWhichIsA("Humanoid")
		if Humanoid then
			CurrentHumanoid = Humanoid
			CurrentHealth = Humanoid.Health
			CurrentPlayer = game:GetService("Players"):GetPlayerFromCharacter(Humanoid.Parent)
			Connection = Humanoid.HealthChanged:Connect(HealthChanged)
		end
	end
	local function Unequipped()
		local a = Connection
		if Connection then
			Connection:Disconnect()
		end
		CurrentHumanoid = nil
		CurrentPlayer = nil
	end
	Tool.Equipped:Connect(Equipped)
	Tool.Unequipped:Connect(Unequipped)
	local function Touched(hit)
		local Player = game:GetService("Players"):GetPlayerFromCharacter(Tool.Parent)
		local Humanoid = Tool.Parent:FindFirstChildWhichIsA("Humanoid")
		local oof = (Blade.Velocity-hit.Velocity).Magnitude > 70
		local OOF = ((Blade.Velocity-hit.Velocity).Magnitude > 400 or (oof and math.random(1,24) == 1))
		local Div = (OOF and 1) or 4
		if Humanoid and Humanoid:GetState() ~= Enum.HumanoidStateType.Dead and Fire > 0 then
			if hit and hit.Parent then
				local Humanoid = hit.Parent:FindFirstChildWhichIsA("Humanoid")
				if hit.Parent:IsA("Accoutrement") then
				elseif Humanoid then
					if Particles then
						Particles:Emit(25)
					end
					local Stored = Humanoid.Health
					Humanoid:TakeDamage((Blade.Velocity-hit.Velocity).Magnitude/Div+2)
					if Humanoid.Health == Stored then
						if SoundE then
							SoundE.PlaybackSpeed = 1.2
SoundE.Parent = Blade
SoundE.Parent = nil
						end
						if SoundF then
							SoundF.PlaybackSpeed = 2
SoundF.Parent = Blade
SoundF.Parent = nil
						end
					else
						if SoundE then
							SoundE.PlaybackSpeed = 1
SoundE.Parent = Blade
SoundE.Parent = nil
						end
					end
					local creator = Instance.new("ObjectValue",Humanoid)
					creator.Name = "creator"
					if Player and Player.Parent then
						creator.Value = Player
					end
					game:GetService("Debris"):AddItem(creator,0.2)
					local t = Humanoid.Parent:FindFirstChild("Torso") or Humanoid.Parent:FindFirstChild("UpperTorso") or Humanoid.Parent:FindFirstChild("HumanoidRootPart")
					if Blade and t and t:IsA("BasePart") then
						if CritTimer < 0 then
							Bill.StudsOffsetWorldSpace = t.Position
							Bill.Size = UDim2.new(16,0,16,0)
							Image.ImageTransparency = 0
							Image.ImageColor3 = t.Color
						end
						if not OOF and Humanoid.Health == Stored then
							if CritTimer < 0 then
								Bill.StudsOffsetWorldSpace = Blade.Position
								Bill.Size = UDim2.new(16,0,16,0)
								Image.ImageTransparency = 0
								if CurrentPlayer and CurrentPlayer.Neutral == false then
									Image.ImageColor3 = CurrentPlayer.TeamColor.Color
								else
									Image.ImageColor3 = Color3.new(1-Blade.Color.r,1-Blade.Color.g,1-Blade.Color.b)
								end
							end
							Damage("BLOCK",t.Position,t.Color or Color3.new(1,0.4,0.15),false)
						else
							Damage(math.floor((Blade.Velocity-hit.Velocity).Magnitude/Div+2),t.Position,t.Color or Color3.new(1,0.4,0.15),OOF)
						end
					end
					if (Blade.Velocity-hit.Velocity).Magnitude > 33 then
						if SoundD then
							SoundD.PlaybackSpeed = 1.14
SoundD.Parent = Blade
SoundD.Parent = nil
						end
					end
				elseif hit.Parent:IsA("Tool") and hit.Parent.Parent then
					if SoundE then
						SoundE.PlaybackSpeed = 1.2
SoundE.Parent = Blade
SoundE.Parent = nil
					end
					if SoundF then
						SoundF.PlaybackSpeed = 1.8
SoundF.Parent = Blade
SoundF.Parent = nil
					end
					if Blade and CritTimer < 0 then
						Bill.StudsOffsetWorldSpace = Blade.Position
						Bill.Size = UDim2.new(16,0,16,0)
						Image.ImageTransparency = 0
						if Player and Player.Neutral == false then
							Image.ImageColor3 = Player.TeamColor.Color
						else
							Image.ImageColor3 = Color3.new(1-Blade.Color.r,1-Blade.Color.g,1-Blade.Color.b)
						end
					end
				elseif Humanoid == nil and (Blade.Velocity-hit.Velocity).Magnitude > hit:GetMass() then
					if Particles then
						Particles:Emit(25)
					end
					if SoundE then
						SoundE.PlaybackSpeed = 2.5
SoundE.Parent = Blade
SoundE.Parent = nil
					end
				end
				if (Blade.Velocity-hit.Velocity).Magnitude > 68 then
					if SoundG then
						SoundG.PlaybackSpeed = math.random(1600,2000) / 100
SoundG.Parent = Blade
SoundG.Parent = nil
					end
				end
				local Tag2 = hit.Parent:FindFirstChild("FakeHumanoid")
				if Tag2 then
					Tag2.Value = Color.Name
				end
				if oof then
					if Particles then
						Particles:Emit(125)
					end
					if Humanoid == nil and hit.Anchored == false and hit.Size.Magnitude < 20 then
						Damage(math.floor((Blade.Velocity-hit.Velocity).Magnitude/Div+2),hit.Position,hit.Color,OOF)
					elseif hit.Anchored or hit.Size.Magnitude >= 20 then
						if SoundF then
							SoundF.PlaybackSpeed = 2.2
SoundF.Parent = Blade
SoundF.Parent = nil
						end
					end
					if OOF then
						if Particles then
							Particles:Emit(400)
						end
						Bill.StudsOffsetWorldSpace = Blade.Position
						Bill.Size = UDim2.new(40,0,40,0)
						Image.ImageTransparency = 0
						CritTimer = 20
						if CurrentPlayer and CurrentPlayer.Neutral == false then
							Image.ImageColor3 = CurrentPlayer.TeamColor.Color
						else
							Image.ImageColor3 = Color3.new(1-Blade.Color.r,1-Blade.Color.g,1-Blade.Color.b)
						end
						if Humanoid == nil then
							hit:BreakJoints()
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
						if SoundG then
							SoundG.PlaybackSpeed = math.random(120,240) / 100
SoundG.Parent = Blade
SoundG.Parent = nil
						end
					end
				end
			end
			if SoundC then
				SoundC.PlaybackSpeed = 1.6
SoundC.Parent = Blade
SoundC.Parent = nil
			end
			if Particles then
				if Player and Player.Neutral == false then
					Particles.Color = ColorSequence.new(Player.TeamColor.Color)
				else
					Particles.Color = ColorSequence.new(Color3.new(1-Blade.Color.r,1-Blade.Color.g,1-Blade.Color.b))
				end
				Particles:Emit(5)
			end
		end
	end
	Blade.Touched:Connect(Touched)
	local function ValueChange()
		if Tool.Enabled == false then
			if Blade and Fire <= 8 then
				Fire = 12
				local Player = game:GetService("Players"):GetPlayerFromCharacter(Tool.Parent)
				local Character = Tool.Parent
				local Humanoid
				if Character then
					Humanoid = Tool.Parent:FindFirstChildWhichIsA("Humanoid")
				end
				if Humanoid and Humanoid:GetState() ~= Enum.HumanoidStateType.Dead then
					local Super = Blade.Velocity.Magnitude > 26
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
						if Model then
							local R = Model:FindFirstChild("Right Shoulder",true)
							if R and R:IsA("Motor6D") then
								R.DesiredAngle = 0
								delay(0.4,function()
									if R then
										R.DesiredAngle = 1.57
									end
								end)
							end
						end
					end
					if Super then
						SoundB.PlaybackSpeed = 1.15
SoundB.Parent = Blade
SoundB.Parent = nil
					end
					if SoundA then
						SoundA.PlaybackSpeed = 1.4
SoundA.Parent = Blade
SoundA.Parent = nil
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
	Tool.Parent = Model
	local LookTimer = 5
	while Tool and Tool:FindFirstAncestorWhichIsA("DataModel") do
		RunAwayTimer = RunAwayTimer - 1
		local Attack = false
		LookTimer = LookTimer - 1
		if LookTimer <= 0 or RunAwayTimer > 0 then
			LookTimer = 5
			if RunAwayTimer <= 0 then
				local E = {}
				local D = game.Workspace:GetDescendants()
				for i = 1,#D do
					if D[i]:IsA("BasePart") and D[i].Parent ~= Model then
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
					local Dist = (E[i].Position - R.Position).Magnitude
					if Dist < 300 and Dist < ClosestDist then
						Target = E[i]
						ClosestDist = Dist
					end
				end
				if Target and Blade then
					Attack = true
					local TargetOff,Status = Pathfind(Target.Position)
					if Status == Enum.PathStatus.Success or Status == Enum.PathStatus.ClosestNoPath or Status == Enum.PathStatus.ClosestOutOfRange then
						MoveDirection = TargetOff
					else
						MoveDirection = Target.Position - R.Position
						if (Target.Position.Y > R.Position.Y + 1 and Humanoid:GetState() ~= Enum.HumanoidStateType.Climbing) or Humanoid.Sit or Humanoid.PlatformStand then
							Humanoid.Jump = true
						end
					end
				elseif (R.Position-Vector3.new(0,4,-80)).Magnitude < 300 then
					MoveDirection = Pathfind(Vector3.new(0,4,-80))
				else
					MoveDirection = Vector3.new(0,4,-80) - R.Position
				end
				if ClosestDist < 3 then
					local Pos = Target.Position
					RunAwayTimer = 4
					RunAwayDirection = R.CFrame.LookVector*-2
					RunAwayDirection = RunAwayDirection + (R.Position - Pos).unit * 8
					if math.random(1,2) == 1 then
						Humanoid.Jump = true
					end
				end
			else
				MoveDirection = Pathfind(R.Position + RunAwayDirection)
			end
		end
		if Humanoid and R then
			Humanoid.WalkToPoint = R.Position + MoveDirection
		end
		if Fire == 0 then
			Tool.Enabled = true
		end
		if (Attack and Fire <= math.random(4,8)) or Fire <= math.random(-10,3) then
			local b = Model:FindFirstChildWhichIsA("Tool")
			if b then
				b.Enabled = false
			end
		end
		if Tool.Parent then
			local Player = game:GetService("Players"):GetPlayerFromCharacter(Tool.Parent)
			local Character = Tool.Parent
			local Humanoid
			if Character then
				Humanoid = Tool.Parent:FindFirstChildWhichIsA("Humanoid")
			end
			SelectionBox.Color3 = Blade.Color
			if Blade.Velocity.Magnitude > 68 and Blade:FindFirstAncestorWhichIsA("Workspace") then
				SelectionBox.Adornee = Blade
				SelectionBox.SurfaceColor3 = Color3.new(1-Blade.Color.r,1-Blade.Color.g,1-Blade.Color.b)
			elseif Blade.Velocity.Magnitude > 26 and Blade:FindFirstAncestorWhichIsA("Workspace") then
				SelectionBox.Adornee = Blade
				SelectionBox.SurfaceColor3 = Color3.new(Blade.Color.r/1.7,Blade.Color.g/1.7,Blade.Color.b/1.7)
			else
				SelectionBox.Adornee = nil
			end
			Fire = Fire - 1
			if Fire > 0 and LastSuper then
				Tool.GripForward = Vector3.new(0,0.99,0.01)
				Tool.GripRight = Vector3.new(1,0,0.3)
			else
				Tool.GripForward = Vector3.new(0,0.5,-0.85)
				Tool.GripRight = Vector3.new(1,0,0)
			end
			if CritTimer < 0 then
				Image.ImageTransparency = Image.ImageTransparency + 0.2
			end
			CritTimer = CritTimer - 1
			if Fire == 8 then
				Tool.Enabled = true
			end
			if Player and Player.Parent and Player.Neutral == false then
				local TeamColor = Player.TeamColor
				Blade.BrickColor = TeamColor
			end
		end
		wait(0.04)
	end
	if Bill and Bill.Parent then
		Bill:Destroy()
	end
	if SelectionBox and SelectionBox.Parent then
		SelectionBox:Destroy()
	end
end
local Total = 0
while true do
	task.wait(.25)
	if Spawned < 10 then
		Spawned = Spawned + 1
		Total = Total + 1
		delay(0,function()
			Ready()
			Spawned = Spawned - 1
		end)
	end
	H.Text = "Total NPC entries: "..Total
end
