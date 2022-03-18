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
function Ready()
	local Tool = Instance.new("Tool",owner.Backpack)
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
	local SoundA = Instance.new("Sound",Blade)
	SoundA.SoundId = "rbxasset://sounds/swordslash.wav"
	SoundA.Volume = 1
	local SoundB = Instance.new("Sound",Blade)
	SoundB.SoundId = "rbxasset://sounds/swordlunge.wav"
	SoundB.Volume = 1
	local SoundC = Instance.new("Sound",Blade)
	SoundC.SoundId = "rbxasset://sounds/flashbulb.wav"
	SoundC.Volume = 1.6
	local SoundD = Instance.new("Sound",Blade)
	SoundD.SoundId = "rbxasset://sounds/uuhhh.mp3"
	SoundD.Volume = 1.4
	local SoundE = Instance.new("Sound",Blade)
	SoundE.SoundId = "rbxasset://sounds/kerplunk.wav"
	SoundE.Volume = 1.8
	local SoundF = Instance.new("Sound",Blade)
	SoundF.SoundId = "rbxasset://sounds/electronicpingshort.wav"
	SoundF.Volume = 1.6
	local SoundG = Instance.new("Sound",Blade)
	SoundG.SoundId = "rbxasset://sounds/Rocket shot.wav"
	SoundG.Volume = 0.7
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
	local function HealthChanged(NewHealth)
		if CurrentHumanoid ~= nil and CurrentHumanoid.Parent then
			if CurrentHumanoid.Health < CurrentHealth and Fire > 6 then
				CurrentHumanoid.Health = CurrentHealth
				if SoundE then
					SoundE.PlaybackSpeed = 1.2
					SoundE:Play()
				end
				if SoundF then
					SoundF.PlaybackSpeed = 2.4
					SoundF:Play()
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
							SoundE:Play()
						end
						if SoundF then
							SoundF.PlaybackSpeed = 2
							SoundF:Play()
						end
					else
						if SoundE then
							SoundE.PlaybackSpeed = 1
							SoundE:Play()
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
							SoundD:Play()
						end
					end
				elseif hit.Parent:IsA("Tool") and hit.Parent.Parent then
					if SoundE then
						SoundE.PlaybackSpeed = 1.2
						SoundE:Play()
					end
					if SoundF then
						SoundF.PlaybackSpeed = 1.8
						SoundF:Play()
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
						SoundE:Play()
					end
				end
				if (Blade.Velocity-hit.Velocity).Magnitude > 68 then
					if SoundG then
						SoundG.PlaybackSpeed = math.random(1600,2000) / 100
						SoundG:Play()
					end
				end
				local Tag2 = hit.Parent:FindFirstChild("FakeHumanoid")
				if Tag2 and owner and owner.Parent then
					Tag2.Value = owner.Name
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
							SoundF:Play()
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
							SoundG:Play()
						end
					end
				end
			end
			if SoundC then
				SoundC.PlaybackSpeed = 1.6
				SoundC:Play()
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
					end
					if Super then
						SoundB.PlaybackSpeed = 1.15
						SoundB:Play()
					end
					if SoundA then
						SoundA.PlaybackSpeed = 1.4
						SoundA:Play()
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
Ready()
-- game:GetService("Debris"):AddItem(script)
