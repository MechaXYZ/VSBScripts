-- all made by KrYn0MoRe(AlmightyToast)
-- I changed everything to spawn locations so you won't hit the part limit in VSB
-- also removed sounds so you won't hit the sound limit in VSB
-- also added night and fog
game:GetService("Lighting").TimeOfDay = "07:00:00"
game:GetService("Lighting").FogStart = 30
game:GetService("Lighting").FogEnd = 700
game:GetService("Lighting").FogColor = Color3.new()
game:GetService("Lighting").OutdoorAmbient = Color3.new(.1,.1,.1)
game:GetService("Lighting").Ambient = Color3.new()
game:GetService("Lighting").ShadowSoftness = math.huge
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
local allpurpose = Instance.new("Sound", game:GetService("VRService"))
allpurpose.EmitterSize = 10
allpurpose.Volume = .75
allpurpose.PlayOnRemove = true
local zombie_folder = Instance.new("Folder")
zombie_folder.Parent = script
local zombies = {}
local killed = 0
local curr_total_score = #game:GetService("Players"):GetPlayers()*500
local score_to_drop = (#game:GetService("Players"):GetPlayers()*500+2000)
local insta = false
local doublepoints = 1

local cf = CFrame.new;
local ang = CFrame.Angles;
local rad = math.rad;
local sin = math.sin;
local cos = math.cos;

local function weld(parent, part0, part1, c0, c1)
	local newweld = Instance.new("Weld");
	newweld.Parent = parent;
	newweld.Part0 = part0;
	newweld.Part1 = part1;
	newweld.C0 = c0;
	newweld.C1 = c1;
	return newweld;
end;

local anim_ref = {
	Neck_C0 = cf(0, 1, 0) * ang(rad(-90), rad(0), rad(180));
	Neck_C1 = cf(0, -0.5, 0) * ang(rad(-90), rad(0), rad(180));
	Right_Shoulder_C0 = cf(1, 0.5, 0) * ang(rad(0), rad(90), rad(0));
	Right_Shoulder_C1 = cf(-0.5, 0.5, 0) * ang(rad(0), rad(90), rad(0));
	Left_Shoulder_C0 = cf(-1, 0.5, 0) * ang(rad(0), rad(-90), rad(0));
	Left_Shoulder_C1 = cf(0.5, 0.5, 0) * ang(rad(0), rad(-90), rad(0));
	Right_Hip_C0 = cf(1, -1, 0) * ang(rad(0), rad(90), rad(0));
	Right_Hip_C1 = cf(0.5, 1, 0) * ang(rad(0), rad(90), rad(0));
	Left_Hip_C0 = cf(-1, -1, 0) * ang(rad(0), rad(-90), rad(0));
	Left_Hip_C1 = cf(-0.5, 1, 0) * ang(rad(0), rad(-90), rad(0));
};

local walk_anim = {
	{
		Enum.EasingDirection.Out;
		anim_ref.Neck_C0;
		anim_ref.Right_Shoulder_C0 * ang(rad(0), rad(0), rad(100));
		anim_ref.Left_Shoulder_C0 * ang(rad(0), rad(0), rad(-90));
		anim_ref.Right_Hip_C0 * ang(rad(0), rad(0), rad(-30));
		anim_ref.Left_Hip_C0 * ang(rad(0), rad(0), rad(-30));
	};
	{
		Enum.EasingDirection.In;
		anim_ref.Neck_C0;
		anim_ref.Right_Shoulder_C0 * ang(rad(0), rad(0), rad(90));
		anim_ref.Left_Shoulder_C0 * ang(rad(0), rad(0), rad(-100));
		anim_ref.Right_Hip_C0 * ang(rad(0), rad(0), rad(0));
		anim_ref.Left_Hip_C0 * ang(rad(0), rad(0), rad(0));
	};
	{
		Enum.EasingDirection.Out;
		anim_ref.Neck_C0;
		anim_ref.Right_Shoulder_C0 * ang(rad(0), rad(0), rad(80));
		anim_ref.Left_Shoulder_C0 * ang(rad(0), rad(0), rad(-90));
		anim_ref.Right_Hip_C0 * ang(rad(0), rad(0), rad(30));
		anim_ref.Left_Hip_C0 * ang(rad(0), rad(0), rad(30));
	};
	{
		Enum.EasingDirection.InOut;
		anim_ref.Neck_C0;
		anim_ref.Right_Shoulder_C0 * ang(rad(0), rad(0), rad(90));
		anim_ref.Left_Shoulder_C0 * ang(rad(0), rad(0), rad(-80));
		anim_ref.Right_Hip_C0 * ang(rad(0), rad(0), rad(0));
		anim_ref.Left_Hip_C0 * ang(rad(0), rad(0), rad(0));
	};
};

local function tween_joint(joint, easing_direction, animation_data)
	local tween_data = TweenInfo.new(
		0.1,
		Enum.EasingStyle.Sine,
		easing_direction,
		0,
		false
	);
	local new_tween = game:GetService("TweenService"):Create(
		joint,
		tween_data,
		{C0 = animation_data}
	);
	new_tween:Play();
end;

local function animate_joints(table_1, table_2)
	for Integer = 1, #table_1 do
		local Joint = table_1[Integer];
		local Joint_Easing_Direction = table_2[1];
		local Joint_Animation = table_2[Integer + 1];
		tween_joint(Joint, Joint_Easing_Direction, Joint_Animation)
	end;
end;

--\/--

local function create(walkspeed,health)
	local function sandbox(var,func)
		local env = getfenv(func)
		local newenv = setmetatable({},{
			__index = function(self,k)
				if k == "script" then
					return var
				else
					return env[k]
				end
			end,
		})
		setfenv(func, newenv)
		return func
	end
	local cors = {}
	local mas = Instance.new("Model",game:GetService("Lighting"))
	local Model0 = Instance.new("Model")
	local Part1 = Instance.new("Part")
	local SpecialMesh2 = Instance.new("SpecialMesh")
	local Decal3 = Instance.new("Decal")
	local Part4 = Instance.new("Part")
	local Part5 = Instance.new("Part")
	local Part6 = Instance.new("Part")
	local Part7 = Instance.new("Part")
	local Part8 = Instance.new("Part")
	local Humanoid9 = Instance.new("Humanoid")
	local Script10 = Instance.new("Script")
	Model0.Name = "Zombie"
	Model0.Parent = mas
	Model0.PrimaryPart = Part1
	Part1.Name = "Head"
	Part1.Parent = Model0
	Part1.CFrame = CFrame.new(14.4682684, 4.49999714, 13.7751303, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part1.Position = Vector3.new(14.4682684, 4.49999714, 13.7751303)
	Part1.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
	Part1.Size = Vector3.new(2, 1, 1)
	Part1.BrickColor = BrickColor.new("Really black")
	Part1.CanCollide = true
	Part1.TopSurface = Enum.SurfaceType.Smooth
	Part1.brickColor = BrickColor.new("Really red")
	Part1.FormFactor = Enum.FormFactor.Symmetric
	Part1.formFactor = Enum.FormFactor.Symmetric
	SpecialMesh2.Parent = Part1
	SpecialMesh2.Scale = Vector3.new(1.25, 1.25, 1.25)
	Decal3.Name = "face"
	Decal3.Parent = Part1
	Decal3.Texture = "rbxassetid://319473813"
	Part4.Name = "Torso"
	Part4.Parent = Model0
	Part4.CFrame = CFrame.new(14.4682684, 2.99999905, 13.7751303, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part4.Position = Vector3.new(14.4682684, 2.99999905, 13.7751303)
	Part4.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
	Part4.Size = Vector3.new(2, 2, 1)
	Part4.BrickColor = BrickColor.new("Brown")
	Part4.CanCollide = true
	Part4.LeftParamA = 0
	Part4.LeftParamB = 0
	Part4.LeftSurface = Enum.SurfaceType.Smooth
	Part4.RightParamA = 0
	Part4.RightParamB = 0
	Part4.RightSurface = Enum.SurfaceType.Smooth
	Part4.brickColor = BrickColor.new("Really red")
	Part4.FormFactor = Enum.FormFactor.Symmetric
	Part4.formFactor = Enum.FormFactor.Symmetric
	Part5.Name = "Left Arm"
	Part5.Parent = Model0
	Part5.CFrame = CFrame.new(12.9682684, 2.99999905, 13.7751303, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part5.Position = Vector3.new(12.9682684, 2.99999905, 13.7751303)
	Part5.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
	Part5.Size = Vector3.new(1, 2, 1)
	Part5.BrickColor = BrickColor.new("Really black")
	Part5.CanCollide = true
	Part5.brickColor = BrickColor.new("Really red")
	Part5.FormFactor = Enum.FormFactor.Symmetric
	Part5.formFactor = Enum.FormFactor.Symmetric
	Part6.Name = "Right Arm"
	Part6.Parent = Model0
	Part6.CFrame = CFrame.new(15.9682684, 2.99999905, 13.7751303, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part6.Position = Vector3.new(15.9682684, 2.99999905, 13.7751303)
	Part6.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
	Part6.Size = Vector3.new(1, 2, 1)
	Part6.BrickColor = BrickColor.new("Really black")
	Part6.CanCollide = true
	Part6.brickColor = BrickColor.new("Really red")
	Part6.FormFactor = Enum.FormFactor.Symmetric
	Part6.formFactor = Enum.FormFactor.Symmetric
	Part7.Name = "Left Leg"
	Part7.Parent = Model0
	Part7.CFrame = CFrame.new(13.9682684, 1, 13.7751303, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part7.Position = Vector3.new(13.9682684, 1, 13.7751303)
	Part7.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
	Part7.Size = Vector3.new(1, 2, 1)
	Part7.BottomSurface = Enum.SurfaceType.Smooth
	Part7.BrickColor = BrickColor.new("Really black")
	Part7.CanCollide = true
	Part7.brickColor = BrickColor.new("Really red")
	Part7.FormFactor = Enum.FormFactor.Symmetric
	Part7.formFactor = Enum.FormFactor.Symmetric
	Part8.Name = "Right Leg"
	Part8.Parent = Model0
	Part8.CFrame = CFrame.new(14.9682684, 1, 13.7751303, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part8.Position = Vector3.new(14.9682684, 1, 13.7751303)
	Part8.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
	Part8.Size = Vector3.new(1, 2, 1)
	Part8.BottomSurface = Enum.SurfaceType.Smooth
	Part8.BrickColor = BrickColor.new("Really black")
	Part8.CanCollide = true
	Part8.brickColor = BrickColor.new("Really red")
	Part8.FormFactor = Enum.FormFactor.Symmetric
	Part8.formFactor = Enum.FormFactor.Symmetric
	-- @ Brannon1964802
	local Weld11 = weld(Part4, Part4, Part1, anim_ref.Neck_C0, anim_ref.Neck_C1); -- head
	local Weld12 = weld(Part4, Part4, Part5, anim_ref.Right_Shoulder_C0, anim_ref.Right_Shoulder_C1); -- right arm
	local Weld13 = weld(Part4, Part4, Part6, anim_ref.Left_Shoulder_C0, anim_ref.Left_Shoulder_C1); -- left arm
	local Weld14 = weld(Part4, Part4, Part7, anim_ref.Right_Hip_C0, anim_ref.Right_Hip_C1); -- right leg
	local Weld15 = weld(Part4, Part4, Part8, anim_ref.Left_Hip_C0, anim_ref.Left_Hip_C1); -- left leg
	local joints_table = {
		Weld11; -- Neck
		Weld12; -- Right Shoulder
		Weld13; -- Left Shoulder
		Weld14; -- Right Hip
		Weld15; -- Left Hip
	};
	local anim_num = Random.new():NextInteger(1, 4);
	--
	Humanoid9.WalkSpeed = walkspeed
	Humanoid9.AutoJumpEnabled = true
	if insta then
		Humanoid9.MaxHealth = 1
		Humanoid9.Health = 1
	else
		Humanoid9.MaxHealth = health
		Humanoid9.Health = health
	end
	Humanoid9.Parent = Model0
	Humanoid9.LeftLeg = Part7
	Humanoid9.RightLeg = Part8
	Humanoid9.Torso = Part4
	Script10.Parent = Humanoid9
	
	local jumpcol = Instance.new("Part",Humanoid9)
	jumpcol.Size = Vector3.new(4,5,2)
	jumpcol.Anchored = false
	jumpcol.CanCollide = false
	jumpcol.Transparency = 1

	local jumpweld = Instance.new("Weld")
	jumpweld.Parent = Part4
	jumpweld.Part0 = Part4
	jumpweld.Part1 = jumpcol
	jumpweld.C0 = Part4.CFrame:Inverse()
	jumpweld.C1 = jumpcol.CFrame:Inverse()
	jumpweld.C0 = CFrame.new(0,0,-2)
	
	jumpcol.Touched:Connect(function(obj)
		if obj and obj.Parent and obj.CanCollide == true and 1 > obj.Transparency and (obj.Size.X+obj.Size.Y+obj.Size.Z) > 3 and (not obj.Parent:FindFirstChildOfClass("Humanoid") and obj.Name:lower() ~= 'base' and obj.Name:lower() ~= 'baseplate') then
			Humanoid9.Jump = true
		end
	end)

	local dead = false

	for i,v in pairs(Model0:GetChildren()) do
		pcall(function()
			if v:IsA("BasePart") then
				v.Anchored = false
				v.Touched:Connect(function(obj)
					if obj and obj.Parent then
						local hum = obj.Parent:FindFirstChildOfClass("Humanoid")
						if hum and not dead and not hum:FindFirstChild('zombie cod hit') then
							if hum.Parent.Name == "Zombie" then return end
							--hum.MaxHealth = 100
							local confirm = Instance.new("ObjectValue")
							confirm.Name = 'zombie cod hit'
							confirm.Parent = hum
							game:GetService("Debris"):AddItem(confirm,0.5)
							hum:TakeDamage(20)
							--hum.MaxHealth = 100
						end
					end
				end)
			end
		end)
	end

	table.insert(zombies,#zombies + 1,Model0)
	
	local oldhealth = Humanoid9.Health
	
	Humanoid9.HealthChanged:Connect(function(newhealth)
		if (oldhealth > newhealth) and insta then
			Humanoid9.Health = 0
		end
	end)
	
	Humanoid9.Died:Connect(
		function()
			dead = true
			-- zombie:Destroy()
			killed += 1
			if insta then
				curr_total_score += 90*doublepoints
			else
				curr_total_score += 100*doublepoints
			end
			if curr_total_score >= score_to_drop then
				--curr_total_score = 0
				score_to_drop = score_to_drop * 1.15
				drop_power_up(Part4.CFrame)
			end
			table.remove(zombies,table.find(zombies,Model0))
			Model0:BreakJoints()
			for i,v in pairs(Model0:GetChildren()) do
				if v:IsA("BasePart") then
					game:GetService("TweenService"):Create(v,TweenInfo.new(1),{Transparency = 1}):Play()
				end
			end
			game:GetService("Debris"):AddItem(Model0,3)
			if zombie then
				zombie:Destroy()
			end
			pcall(function()
				local deaths = {1851243003,1847611644,1851233093}
				allpurpose.SoundId = "rbxassetid://" .. tostring(deaths[math.random(1,#deaths)])
				allpurpose.Volume = .5
				allpurpose.Parent = Part4
				allpurpose.Parent = nil
			end)
		end
	)
	
	table.insert(
		cors,
		sandbox(
			Script10,
			function()
				local function find_target(pos)
					local list = workspace:GetChildren()
					local torso = nil
					local dist = math.huge
					local temp = nil
					local human = nil
					local temp2 = nil
					for x = 1, #list do
						temp2 = list[x]
						if (temp2.className == "Model") and (temp2.Name ~= "Zombie") then
							temp = temp2:FindFirstChild("HumanoidRootPart")
							human = temp2:FindFirstChildOfClass("Humanoid")
							if (temp ~= nil) and (human ~= nil) and (human.Health > 0)  then
								if (temp.Position - pos).magnitude < dist then
									torso = temp
									dist = (temp.Position - pos).magnitude
								end
							end
						end
					end
					return torso
				end
				local pathfindingservice = game:GetService("PathfindingService")
				
				local function travel(paths)
					for n,path in pairs(paths) do
						if path.Action == Enum.PathWaypointAction.Jump then
							Humanoid9.Jump = true
						elseif path.Action == Enum.PathWaypointAction.Walk then
							Humanoid9:MoveTo(path.Position)
						end
					end
				end
				
				local function find(targ1,targ2)
					if targ1 and targ2 then else --[[warn("Target(s) non-existant.")]] return end
					local path = pathfindingservice:FindPathAsync(targ1.Position,targ2.Position)
					local paths = path:GetWaypoints()
					if path.Status == Enum.PathStatus.Success then
						travel(paths)
					elseif path.Status == Enum.PathStatus.NoPath then
						--warn("No paths found.")
					end
				end
			end
		)
	)
	for i,v in pairs(mas:GetChildren()) do
		v.Parent = zombie_folder
	end
	for i,v in pairs(mas:GetChildren()) do
		v.Parent = zombie_folder
		pcall(function() v:MakeJoints() end)
	end
	mas:Destroy()
	for i,v in pairs(cors) do
		task.spawn(function()
			pcall(v)
		end)
	end
	Model0.PrimaryPart.CFrame = Model0.PrimaryPart.CFrame+Vector3.new(math.random(-100,100),100,math.random(-100,100))
end

local sgui1,sgui2
local Model0 = Instance.new("Model")
local Part1 = Instance.new("Part")
local Part2 = Instance.new("Part")
local Part3 = Instance.new("Part")
local Part4 = Instance.new("Part")
sgui1 = Instance.new("SurfaceGui")
local TextLabel6 = Instance.new("TextBox")
local TextLabel7 = Instance.new("TextBox")
local TextLabel8 = Instance.new("TextBox")
local TextLabel9 = Instance.new("TextBox")
sgui2 = Instance.new("SurfaceGui")
local TextLabel11 = Instance.new("TextBox")
local TextLabel12 = Instance.new("TextBox")
local TextLabel13 = Instance.new("TextBox")
local TextLabel14 = Instance.new("TextBox")
local Part15 = Instance.new("Part")
local Part16 = Instance.new("Part")
local Part17 = Instance.new("Part")
local Part18 = Instance.new("Part")
local Part19 = Instance.new("Part")
local Part20 = Instance.new("Part")
local Part21 = Instance.new("Part")
Model0.Name = "board"
Model0.Parent = script
Part1.Parent = Model0
Part1.CFrame = CFrame.new(26.5802822, 8.40005589, -10.3351679, 0.964379668, 3.73066141e-05, -0.264521897, -3.59999867e-05, 1, 9.78730986e-06, 0.264521897, 8.41014369e-08, 0.964379668)
Part1.Orientation = Vector3.new(0, -15.3400002, 0)
Part1.Position = Vector3.new(26.5802822, 8.40005589, -10.3351679)
Part1.Rotation = Vector3.new(0, -15.3400002, 0)
Part1.Color = Color3.new(0.290196, 0.290196, 0.290196)
Part1.Size = Vector3.new(2, 2, 2)
Part1.Anchored = true
Part1.BottomSurface = Enum.SurfaceType.Smooth
Part1.BrickColor = BrickColor.new("Dark taupe")
Part1.Material = Enum.Material.CorrodedMetal
Part1.TopSurface = Enum.SurfaceType.Smooth
Part1.brickColor = BrickColor.new("Dark taupe")
Part1.FormFactor = Enum.FormFactor.Symmetric
Part1.formFactor = Enum.FormFactor.Symmetric
Part1.Shape = Enum.PartType.Ball
Part2.Parent = Model0
Part2.CFrame = CFrame.new(26.5800686, 0.200047001, -10.3355341, 0.964379668, 3.73066141e-05, -0.264521897, -3.59999867e-05, 1, 9.78730986e-06, 0.264521897, 8.41014369e-08, 0.964379668)
Part2.Orientation = Vector3.new(0, -15.3400002, 0)
Part2.Position = Vector3.new(26.5800686, 0.200047001, -10.3355341)
Part2.Rotation = Vector3.new(0, -15.3400002, 0)
Part2.Color = Color3.new(0.290196, 0.290196, 0.290196)
Part2.Size = Vector3.new(2, 0.400000006, 2)
Part2.Anchored = true
Part2.BottomSurface = Enum.SurfaceType.Smooth
Part2.BrickColor = BrickColor.new("Dark taupe")
Part2.Material = Enum.Material.CorrodedMetal
Part2.TopSurface = Enum.SurfaceType.Smooth
Part2.brickColor = BrickColor.new("Dark taupe")
Part2.FormFactor = Enum.FormFactor.Plate
Part2.formFactor = Enum.FormFactor.Plate
Part3.Parent = Model0
Part3.CFrame = CFrame.new(15.0073481, 0.200421005, -13.5090256, 0.964379668, 3.73066141e-05, -0.264521897, -3.59999867e-05, 1, 9.78730986e-06, 0.264521897, 8.41014369e-08, 0.964379668)
Part3.Orientation = Vector3.new(0, -15.3400002, 0)
Part3.Position = Vector3.new(15.0073481, 0.200421005, -13.5090256)
Part3.Rotation = Vector3.new(0, -15.3400002, 0)
Part3.Color = Color3.new(0.290196, 0.290196, 0.290196)
Part3.Size = Vector3.new(2, 0.400000006, 2)
Part3.Anchored = true
Part3.BottomSurface = Enum.SurfaceType.Smooth
Part3.BrickColor = BrickColor.new("Dark taupe")
Part3.Material = Enum.Material.CorrodedMetal
Part3.TopSurface = Enum.SurfaceType.Smooth
Part3.brickColor = BrickColor.new("Dark taupe")
Part3.FormFactor = Enum.FormFactor.Plate
Part3.formFactor = Enum.FormFactor.Plate
Part4.Name = "Main"
Part4.Parent = Model0
Part4.CFrame = CFrame.new(20.7938061, 4.80028963, -11.9221039, 0.964379668, 3.73066141e-05, -0.264521897, -3.59999867e-05, 1, 9.78730986e-06, 0.264521897, 8.41014369e-08, 0.964379668)
Part4.Orientation = Vector3.new(0, -15.3400002, 0)
Part4.Position = Vector3.new(20.7938061, 4.80028963, -11.9221039)
Part4.Rotation = Vector3.new(0, -15.3400002, 0)
Part4.Color = Color3.new(0.623529, 0.631373, 0.67451)
Part4.Size = Vector3.new(10, 6.4000001, 1)
Part4.Anchored = true
Part4.BottomSurface = Enum.SurfaceType.Smooth
Part4.BrickColor = BrickColor.new("Fossil")
Part4.Material = Enum.Material.SmoothPlastic
Part4.TopSurface = Enum.SurfaceType.Smooth
Part4.brickColor = BrickColor.new("Fossil")
Part4.FormFactor = Enum.FormFactor.Plate
Part4.formFactor = Enum.FormFactor.Plate
local PointLight0 = Instance.new("PointLight")
PointLight0.Parent = Part4
PointLight0.Color = Color3.new(0.666667, 0.666667, 0.666667)
PointLight0.Brightness = 7
sgui1.Parent = Part4
sgui1.LightInfluence = 1
sgui1.Face = Enum.NormalId.Back
sgui1.ClipsDescendants = true
sgui1.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
TextLabel6.Name = "needed"
TextLabel6.Parent = sgui1
TextLabel6.Position = UDim2.new(0, 0, 0.5, 0)
TextLabel6.Size = UDim2.new(1, 0, 0.25, 0)
TextLabel6.BackgroundColor = BrickColor.new("Light grey metallic")
TextLabel6.BackgroundColor3 = Color3.new(0.670588, 0.670588, 0.670588)
TextLabel6.BorderColor = BrickColor.new("Really black")
TextLabel6.BorderColor3 = Color3.new(0, 0, 0)
TextLabel6.Font = Enum.Font.SourceSans
TextLabel6.FontSize = Enum.FontSize.Size14
TextLabel6.Text = "needed to kill: 0"
TextLabel6.TextColor = BrickColor.new("Institutional white")
TextLabel6.TextColor3 = Color3.new(1, 1, 1)
TextLabel6.TextScaled = true
TextLabel6.TextSize = 14
TextLabel6.TextStrokeTransparency = 0
TextLabel6.TextWrap = true
TextLabel6.TextWrapped = true
TextLabel7.Name = "round"
TextLabel7.Parent = sgui1
TextLabel7.Size = UDim2.new(1, 0, 0.25, 0)
TextLabel7.BackgroundColor = BrickColor.new("Light grey metallic")
TextLabel7.BackgroundColor3 = Color3.new(0.670588, 0.670588, 0.670588)
TextLabel7.BorderColor = BrickColor.new("Really black")
TextLabel7.BorderColor3 = Color3.new(0, 0, 0)
TextLabel7.Font = Enum.Font.SourceSans
TextLabel7.FontSize = Enum.FontSize.Size14
TextLabel7.Text = "round: 0"
TextLabel7.TextColor = BrickColor.new("Institutional white")
TextLabel7.TextColor3 = Color3.new(1, 1, 1)
TextLabel7.TextScaled = true
TextLabel7.TextSize = 14
TextLabel7.TextStrokeTransparency = 0
TextLabel7.TextWrap = true
TextLabel7.TextWrapped = true
TextLabel8.Name = "current"
TextLabel8.Parent = sgui1
TextLabel8.Position = UDim2.new(0, 0, 0.25, 0)
TextLabel8.Size = UDim2.new(1, 0, 0.25, 0)
TextLabel8.BackgroundColor = BrickColor.new("Light grey metallic")
TextLabel8.BackgroundColor3 = Color3.new(0.670588, 0.670588, 0.670588)
TextLabel8.BorderColor = BrickColor.new("Really black")
TextLabel8.BorderColor3 = Color3.new(0, 0, 0)
TextLabel8.Font = Enum.Font.SourceSans
TextLabel8.FontSize = Enum.FontSize.Size14
TextLabel8.Text = "zombies: 0"
TextLabel8.TextColor = BrickColor.new("Institutional white")
TextLabel8.TextColor3 = Color3.new(1, 1, 1)
TextLabel8.TextScaled = true
TextLabel8.TextSize = 14
TextLabel8.TextStrokeTransparency = 0
TextLabel8.TextWrap = true
TextLabel8.TextWrapped = true
TextLabel9.Name = "health"
TextLabel9.Parent = sgui1
TextLabel9.Position = UDim2.new(0, 0, 0.75, 0)
TextLabel9.Size = UDim2.new(1, 0, 0.25, 0)
TextLabel9.BackgroundColor = BrickColor.new("Light grey metallic")
TextLabel9.BackgroundColor3 = Color3.new(0.670588, 0.670588, 0.670588)
TextLabel9.BorderColor = BrickColor.new("Really black")
TextLabel9.BorderColor3 = Color3.new(0, 0, 0)
TextLabel9.Font = Enum.Font.SourceSans
TextLabel9.FontSize = Enum.FontSize.Size14
TextLabel9.Text = "zombie healths: 50"
TextLabel9.TextColor = BrickColor.new("Institutional white")
TextLabel9.TextColor3 = Color3.new(1, 1, 1)
TextLabel9.TextScaled = true
TextLabel9.TextSize = 14
TextLabel9.TextStrokeTransparency = 0
TextLabel9.TextWrap = true
TextLabel9.TextWrapped = true
sgui2.Parent = Part4
sgui2.LightInfluence = 1
sgui2.ClipsDescendants = true
sgui2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
TextLabel11.Name = "needed"
TextLabel11.Parent = sgui2
TextLabel11.Position = UDim2.new(0, 0, 0.5, 0)
TextLabel11.Size = UDim2.new(1, 0, 0.25, 0)
TextLabel11.BackgroundColor = BrickColor.new("Light grey metallic")
TextLabel11.BackgroundColor3 = Color3.new(0.670588, 0.670588, 0.670588)
TextLabel11.BorderColor = BrickColor.new("Really black")
TextLabel11.BorderColor3 = Color3.new(0, 0, 0)
TextLabel11.Font = Enum.Font.SourceSans
TextLabel11.FontSize = Enum.FontSize.Size14
TextLabel11.Text = "needed to kill: 0"
TextLabel11.TextColor = BrickColor.new("Institutional white")
TextLabel11.TextColor3 = Color3.new(1, 1, 1)
TextLabel11.TextScaled = true
TextLabel11.TextSize = 14
TextLabel11.TextStrokeTransparency = 0
TextLabel11.TextWrap = true
TextLabel11.TextWrapped = true
TextLabel12.Name = "round"
TextLabel12.Parent = sgui2
TextLabel12.Size = UDim2.new(1, 0, 0.25, 0)
TextLabel12.BackgroundColor = BrickColor.new("Light grey metallic")
TextLabel12.BackgroundColor3 = Color3.new(0.670588, 0.670588, 0.670588)
TextLabel12.BorderColor = BrickColor.new("Really black")
TextLabel12.BorderColor3 = Color3.new(0, 0, 0)
TextLabel12.Font = Enum.Font.SourceSans
TextLabel12.FontSize = Enum.FontSize.Size14
TextLabel12.Text = "round: 0"
TextLabel12.TextColor = BrickColor.new("Institutional white")
TextLabel12.TextColor3 = Color3.new(1, 1, 1)
TextLabel12.TextScaled = true
TextLabel12.TextSize = 14
TextLabel12.TextStrokeTransparency = 0
TextLabel12.TextWrap = true
TextLabel12.TextWrapped = true
TextLabel13.Name = "current"
TextLabel13.Parent = sgui2
TextLabel13.Position = UDim2.new(0, 0, 0.25, 0)
TextLabel13.Size = UDim2.new(1, 0, 0.25, 0)
TextLabel13.BackgroundColor = BrickColor.new("Light grey metallic")
TextLabel13.BackgroundColor3 = Color3.new(0.670588, 0.670588, 0.670588)
TextLabel13.BorderColor = BrickColor.new("Really black")
TextLabel13.BorderColor3 = Color3.new(0, 0, 0)
TextLabel13.Font = Enum.Font.SourceSans
TextLabel13.FontSize = Enum.FontSize.Size14
TextLabel13.Text = "zombies: 0"
TextLabel13.TextColor = BrickColor.new("Institutional white")
TextLabel13.TextColor3 = Color3.new(1, 1, 1)
TextLabel13.TextScaled = true
TextLabel13.TextSize = 14
TextLabel13.TextStrokeTransparency = 0
TextLabel13.TextWrap = true
TextLabel13.TextWrapped = true
TextLabel14.Name = "health"
TextLabel14.Parent = sgui2
TextLabel14.Position = UDim2.new(0, 0, 0.75, 0)
TextLabel14.Size = UDim2.new(1, 0, 0.25, 0)
TextLabel14.BackgroundColor = BrickColor.new("Light grey metallic")
TextLabel14.BackgroundColor3 = Color3.new(0.670588, 0.670588, 0.670588)
TextLabel14.BorderColor = BrickColor.new("Really black")
TextLabel14.BorderColor3 = Color3.new(0, 0, 0)
TextLabel14.Font = Enum.Font.SourceSans
TextLabel14.FontSize = Enum.FontSize.Size14
TextLabel14.Text = "zombie healths: 50"
TextLabel14.TextColor = BrickColor.new("Institutional white")
TextLabel14.TextColor3 = Color3.new(1, 1, 1)
TextLabel14.TextScaled = true
TextLabel14.TextSize = 14
TextLabel14.TextStrokeTransparency = 0
TextLabel14.TextWrap = true
TextLabel14.TextWrapped = true
Part15.Parent = Model0
Part15.CFrame = CFrame.new(20.7939053, 8.20028591, -11.921978, 0.964379668, 3.73066141e-05, -0.264521897, -3.59999867e-05, 1, 9.78730986e-06, 0.264521897, 8.41014369e-08, 0.964379668)
Part15.Orientation = Vector3.new(0, -15.3400002, 0)
Part15.Position = Vector3.new(20.7939053, 8.20028591, -11.921978)
Part15.Rotation = Vector3.new(0, -15.3400002, 0)
Part15.Color = Color3.new(0.290196, 0.290196, 0.290196)
Part15.Size = Vector3.new(10, 0.400000006, 2)
Part15.Anchored = true
Part15.BottomSurface = Enum.SurfaceType.Smooth
Part15.BrickColor = BrickColor.new("Dark taupe")
Part15.Material = Enum.Material.DiamondPlate
Part15.TopSurface = Enum.SurfaceType.Smooth
Part15.brickColor = BrickColor.new("Dark taupe")
Part15.FormFactor = Enum.FormFactor.Plate
Part15.formFactor = Enum.FormFactor.Plate
Part16.Parent = Model0
Part16.CFrame = CFrame.new(26.5801468, 4.20004416, -10.3353882, 0.964379668, 3.73066141e-05, -0.264521897, -3.59999867e-05, 1, 9.78730986e-06, 0.264521897, 8.41014369e-08, 0.964379668)
Part16.Orientation = Vector3.new(0, -15.3400002, 0)
Part16.Position = Vector3.new(26.5801468, 4.20004416, -10.3353882)
Part16.Rotation = Vector3.new(0, -15.3400002, 0)
Part16.Color = Color3.new(0.290196, 0.290196, 0.290196)
Part16.Size = Vector3.new(2, 7.5999999, 2)
Part16.Anchored = true
Part16.BottomSurface = Enum.SurfaceType.Smooth
Part16.BrickColor = BrickColor.new("Dark taupe")
Part16.Material = Enum.Material.Slate
Part16.TopSurface = Enum.SurfaceType.Smooth
Part16.brickColor = BrickColor.new("Dark taupe")
Part16.FormFactor = Enum.FormFactor.Plate
Part16.formFactor = Enum.FormFactor.Plate
Part17.Parent = Model0
Part17.CFrame = CFrame.new(26.5802383, 8.20008278, -10.3352356, 0.964379668, 3.73066141e-05, -0.264521897, -3.59999867e-05, 1, 9.78730986e-06, 0.264521897, 8.41014369e-08, 0.964379668)
Part17.Orientation = Vector3.new(0, -15.3400002, 0)
Part17.Position = Vector3.new(26.5802383, 8.20008278, -10.3352356)
Part17.Rotation = Vector3.new(0, -15.3400002, 0)
Part17.Color = Color3.new(0.290196, 0.290196, 0.290196)
Part17.Size = Vector3.new(2, 0.400000006, 2)
Part17.Anchored = true
Part17.BottomSurface = Enum.SurfaceType.Smooth
Part17.BrickColor = BrickColor.new("Dark taupe")
Part17.Material = Enum.Material.CorrodedMetal
Part17.TopSurface = Enum.SurfaceType.Smooth
Part17.brickColor = BrickColor.new("Dark taupe")
Part17.FormFactor = Enum.FormFactor.Plate
Part17.formFactor = Enum.FormFactor.Plate
Part18.Parent = Model0
Part18.CFrame = CFrame.new(15.0075159, 8.20044613, -13.5087223, 0.964379668, 3.73066141e-05, -0.264521897, -3.59999867e-05, 1, 9.78730986e-06, 0.264521897, 8.41014369e-08, 0.964379668)
Part18.Orientation = Vector3.new(0, -15.3400002, 0)
Part18.Position = Vector3.new(15.0075159, 8.20044613, -13.5087223)
Part18.Rotation = Vector3.new(0, -15.3400002, 0)
Part18.Color = Color3.new(0.290196, 0.290196, 0.290196)
Part18.Size = Vector3.new(2, 0.400000006, 2)
Part18.Anchored = true
Part18.BottomSurface = Enum.SurfaceType.Smooth
Part18.BrickColor = BrickColor.new("Dark taupe")
Part18.Material = Enum.Material.CorrodedMetal
Part18.TopSurface = Enum.SurfaceType.Smooth
Part18.brickColor = BrickColor.new("Dark taupe")
Part18.FormFactor = Enum.FormFactor.Plate
Part18.formFactor = Enum.FormFactor.Plate
Part19.Parent = Model0
Part19.CFrame = CFrame.new(15.0074244, 4.20044899, -13.5088778, 0.964379668, 3.73066141e-05, -0.264521897, -3.59999867e-05, 1, 9.78730986e-06, 0.264521897, 8.41014369e-08, 0.964379668)
Part19.Orientation = Vector3.new(0, -15.3400002, 0)
Part19.Position = Vector3.new(15.0074244, 4.20044899, -13.5088778)
Part19.Rotation = Vector3.new(0, -15.3400002, 0)
Part19.Color = Color3.new(0.290196, 0.290196, 0.290196)
Part19.Size = Vector3.new(2, 7.5999999, 2)
Part19.Anchored = true
Part19.BottomSurface = Enum.SurfaceType.Smooth
Part19.BrickColor = BrickColor.new("Dark taupe")
Part19.Material = Enum.Material.Slate
Part19.TopSurface = Enum.SurfaceType.Smooth
Part19.brickColor = BrickColor.new("Dark taupe")
Part19.FormFactor = Enum.FormFactor.Plate
Part19.formFactor = Enum.FormFactor.Plate
Part20.Parent = Model0
Part20.CFrame = CFrame.new(15.0075464, 8.40045357, -13.5086679, 0.964379668, 3.73066141e-05, -0.264521897, -3.59999867e-05, 1, 9.78730986e-06, 0.264521897, 8.41014369e-08, 0.964379668)
Part20.Orientation = Vector3.new(0, -15.3400002, 0)
Part20.Position = Vector3.new(15.0075464, 8.40045357, -13.5086679)
Part20.Rotation = Vector3.new(0, -15.3400002, 0)
Part20.Color = Color3.new(0.290196, 0.290196, 0.290196)
Part20.Size = Vector3.new(2, 2, 2)
Part20.Anchored = true
Part20.BottomSurface = Enum.SurfaceType.Smooth
Part20.BrickColor = BrickColor.new("Dark taupe")
Part20.Material = Enum.Material.CorrodedMetal
Part20.TopSurface = Enum.SurfaceType.Smooth
Part20.brickColor = BrickColor.new("Dark taupe")
Part20.FormFactor = Enum.FormFactor.Symmetric
Part20.formFactor = Enum.FormFactor.Symmetric
Part20.Shape = Enum.PartType.Ball
Part21.Parent = Model0
Part21.CFrame = CFrame.new(20.7939053, 1.40021086, -11.921978, 0.964379668, 3.73066141e-05, -0.264521897, -3.59999867e-05, 1, 9.78730986e-06, 0.264521897, 8.41014369e-08, 0.964379668)
Part21.Orientation = Vector3.new(0, -15.3400002, 0)
Part21.Position = Vector3.new(20.7939053, 1.40021086, -11.921978)
Part21.Rotation = Vector3.new(0, -15.3400002, 0)
Part21.Color = Color3.new(0.290196, 0.290196, 0.290196)
Part21.Size = Vector3.new(10, 0.400000006, 2)
Part21.Anchored = true
Part21.BottomSurface = Enum.SurfaceType.Smooth
Part21.BrickColor = BrickColor.new("Dark taupe")
Part21.Material = Enum.Material.DiamondPlate
Part21.TopSurface = Enum.SurfaceType.Smooth
Part21.brickColor = BrickColor.new("Dark taupe")
Part21.FormFactor = Enum.FormFactor.Plate
Part21.formFactor = Enum.FormFactor.Plate

local ws = 13 -- default is 13
local default_health = 50 -- default 50
local health = default_health -- default is default_health
local healthboost = 100 -- default is 100
local cap = 24 -- default is 24
local needed = 9 -- default is cap or 9
local round = 0

local in_progress = false

local powerups = {
	function(pos) -- insta kill
		local skull = Instance.new("Part")
		local SpecialMesh1 = Instance.new("SpecialMesh")
		skull.Parent = script
		skull.CFrame = CFrame.new(-44.8135376, 6.18395519, 15.4456863, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		skull.Position = Vector3.new(-44.8135376, 6.18395519, 15.4456863)
		skull.Color = Color3.new(1, 1, 0)
		skull.Transparency = 0.30000001192093
		skull.Size = Vector3.new(2.5, 2.5, 2.5)
		skull.Anchored = true
		skull.BrickColor = BrickColor.new("New Yeller")
		skull.CanCollide = false
		skull.Material = Enum.Material.Neon
		skull.brickColor = BrickColor.new("New Yeller")
		SpecialMesh1.Parent = skull
		SpecialMesh1.MeshId = "rbxassetid://4770583"
		SpecialMesh1.Scale = Vector3.new(5, 5, 5)
		SpecialMesh1.MeshType = Enum.MeshType.FileMesh
		
		local sine = 0
		local used = false
		
		skull.CFrame = pos
		skull.Rotation = Vector3.new(0, 0, 0)
		
		task.spawn(function()
			while skull and not used do
				sine = sine+5*task.wait()*30
				skull.CFrame = skull.CFrame*CFrame.new(0,0 + .05 * math.cos(sine/40),0)*CFrame.Angles(0,math.rad(1),0)
			end
		end)
		
		task.spawn(function()
			task.wait(12)
			for i = 1,10 do
				if not skull or used then break end
				game:GetService("TweenService"):Create(skull,TweenInfo.new(1/i),{Transparency = 1}):Play()
				task.wait(1/i)
				game:GetService("TweenService"):Create(skull,TweenInfo.new(1/i),{Transparency = 0.3}):Play()
				task.wait(1/i)
			end
			game:GetService("TweenService"):Create(skull,TweenInfo.new(1),{Transparency = 1}):Play()
			task.wait(1)
			if skull and not used then
				skull:Destroy()
			end
		end)
		
		skull.Touched:Connect(function(obj)
			local char,hum
			pcall(function()
				char = obj.Parent
			end)
			pcall(function()
				hum = char:FindFirstChildOfClass("Humanoid")
			end)
			if char and char.Name ~= "Zombie" and hum and hum.Health > 0 then else return end
			used = true
			allpurpose.SoundId = "rbxassetid://131961137"
			allpurpose.Volume = 2
			allpurpose.Parent = script
 			allpurpose.Parent = nil
			skull:Destroy()
			task.spawn(function()
				for i,v in pairs(zombies) do
					if v:FindFirstChildOfClass("Humanoid") then
						v:FindFirstChildOfClass("Humanoid").MaxHealth = 1
						v:FindFirstChildOfClass("Humanoid").Health = 1
					end
				end
				task.wait()
				insta = true
				task.wait(30)
				for i,v in pairs(zombies) do
					if v:FindFirstChildOfClass("Humanoid") then
						v:FindFirstChildOfClass("Humanoid").MaxHealth = health
						v:FindFirstChildOfClass("Humanoid").Health = health
					end
				end
				insta = false
			end)
		end)
	end;
	function(pos) -- nuke
		local nuke = Instance.new("Part")
		local SpecialMesh1 = Instance.new("SpecialMesh")
		nuke.Parent = script
		nuke.CFrame = CFrame.new(-46.8135376, 6.18395519, 17.2851868, 1, 0, 0, 0, -4.37113883e-08, 1, 0, -1, -4.37113883e-08)
		nuke.Orientation = Vector3.new(-90, 0, 0)
		nuke.Position = Vector3.new(-46.8135376, 6.18395519, 17.2851868)
		nuke.Rotation = Vector3.new(-90, 0, 0)
		nuke.Color = Color3.new(1, 1, 0)
		nuke.Transparency = 0.3
		nuke.Size = Vector3.new(2, 4.3210001, 2)
		nuke.Anchored = true
		nuke.BottomSurface = Enum.SurfaceType.Smooth
		nuke.BrickColor = BrickColor.new("New Yeller")
		nuke.CanCollide = false
		nuke.Material = Enum.Material.Neon
		nuke.TopSurface = Enum.SurfaceType.Smooth
		nuke.brickColor = BrickColor.new("New Yeller")
		SpecialMesh1.Parent = nuke
		SpecialMesh1.MeshId = "rbxassetid://1365466023"
		SpecialMesh1.Scale = Vector3.new(0.0500000007, 0.0500000007, 0.0500000007)
		SpecialMesh1.MeshType = Enum.MeshType.FileMesh
		
		local sine = 0
		local used = false
		
		nuke.CFrame = pos
		nuke.Rotation = Vector3.new(-90, 0, 0)
		
		task.spawn(function()
			while nuke and not used do
				sine = sine+5*task.wait()*30
				nuke.CFrame = nuke.CFrame*CFrame.new(0,0,0 + .05 * math.cos(sine/40))*CFrame.Angles(0,0,math.rad(1))
			end
		end)
		
		task.spawn(function()
			task.wait(12)
			for i = 1,10 do
				if not nuke or used then break end
				game:GetService("TweenService"):Create(nuke,TweenInfo.new(1/i),{Transparency = 1}):Play()
				task.wait(1/i)
				game:GetService("TweenService"):Create(nuke,TweenInfo.new(1/i),{Transparency = 0.3}):Play()
				task.wait(1/i)
			end
			game:GetService("TweenService"):Create(nuke,TweenInfo.new(1),{Transparency = 1}):Play()
			task.wait(1)
			if nuke and not used then
				nuke:Destroy()
			end
		end)
		
		nuke.Touched:Connect(function(obj)
			local char,hum
			pcall(function()
				char = obj.Parent
			end)
			pcall(function()
				hum = char:FindFirstChildOfClass("Humanoid")
			end)
			if char and char.Name ~= "Zombie" and hum and hum.Health > 0 then else return end
			used = true
			allpurpose.SoundId = "rbxassetid://131961140"
			allpurpose.Volume = 2
			allpurpose.Parent = script
			allpurpose.Parent = nil
			nuke:Destroy()
			for i,v in pairs(zombies) do
				if v:FindFirstChildOfClass("Humanoid") then
					v:FindFirstChildOfClass("Humanoid").Health = 0
				end
			end
		end)
	end;
	function(pos) -- x2
		local x2 = Instance.new("Part")
		local SpecialMesh1 = Instance.new("SpecialMesh")
		x2.Name = "x2"
		x2.Parent = workspace
		x2.CFrame = CFrame.new(39.7900085, 1.5, 15.2500124, 1, 4.37113847e-08, 4.37113918e-08, 4.37113954e-08, 7.91139954e-15, -1, -4.37113883e-08, 1, 4.35868543e-15)
		x2.Orientation = Vector3.new(90, 0, 0)
		x2.Position = Vector3.new(39.7900085, 1.5, 15.2500124)
		x2.Rotation = Vector3.new(90, 0, 0)
		x2.Color = Color3.new(1, 1, 0)
		x2.Transparency = 0.30000001192093
		x2.Size = Vector3.new(2.5, 2.5, 2.5)
		x2.Anchored = true
		x2.CanCollide = false
		x2.BottomSurface = Enum.SurfaceType.Smooth
		x2.BrickColor = BrickColor.new("New Yeller")
		x2.Material = Enum.Material.Neon
		x2.TopSurface = Enum.SurfaceType.Smooth
		x2.brickColor = BrickColor.new("New Yeller")
		SpecialMesh1.Parent = x2
		SpecialMesh1.MeshId = "rbxassetid://920722180"
		SpecialMesh1.Scale = Vector3.new(0.0500000007, 0.0500000007, 0.0500000007)
		SpecialMesh1.MeshType = Enum.MeshType.FileMesh
		
		local sine = 0
		local used = false
		
		x2.CFrame = pos
		x2.Rotation = Vector3.new(90, 0, 0)
		
		task.spawn(function()
			while x2 and not used do
				sine = sine+5*task.wait()*30
				x2.CFrame = x2.CFrame*CFrame.new(0,0,0 + .05 * math.cos(sine/40))*CFrame.Angles(0,0,math.rad(1))
			end
		end)
		
		task.spawn(function()
			task.wait(12)
			for i = 1,10 do
				if not x2 or used then break end
				game:GetService("TweenService"):Create(x2,TweenInfo.new(1/i),{Transparency = 1}):Play()
				task.wait(1/i)
				game:GetService("TweenService"):Create(x2,TweenInfo.new(1/i),{Transparency = 0.3}):Play()
				task.wait(1/i)
			end
			game:GetService("TweenService"):Create(x2,TweenInfo.new(1),{Transparency = 1}):Play()
			task.wait(1)
			if x2 and not used then
				x2:Destroy()
			end
		end)
		
		x2.Touched:Connect(function(obj)
			local char,hum
			pcall(function()
				char = obj.Parent
			end)
			pcall(function()
				hum = char:FindFirstChildOfClass("Humanoid")
			end)
			if char and char.Name ~= "Zombie" and hum and hum.Health > 0 then else return end
			used = true
			allpurpose.SoundId = "rbxassetid://131149750"
			allpurpose.Volume = 2
			allpurpose.Parent = script
 			allpurpose.Parent = nil
			x2:Destroy()
			task.spawn(function()
				doublepoints = 2
				task.wait(30)
				doublepoints = 1
			end)
		end)
	end;
}

function drop_power_up(pos)
	curr_total_score = 0
	powerups[math.random(1,#powerups)](pos)
end

function round_set()
	round += 1
	if 10 > round then
		health = default_health+(round*healthboost)
	else
		health = health+(health*0.1)
	end
	cap = 24+(#game:GetService("Players"):GetPlayers()-1)*6
	if cap > 50 then
		cap = 50
	end
	--needed = (round*0.15)*cap
	--cap = 24
	needed += 3
	killed = 0
	insta = false
end

task.spawn(function()
	while true do
		allpurpose.SoundId = "rbxassetid://2564305185"
		allpurpose.Volume = 2
		allpurpose.Parent = script
 		allpurpose.Parent = nil
		task.wait(2)
		round_set()
		in_progress = true
		repeat task.wait(1) until killed >= needed
		in_progress = false
		allpurpose.SoundId = "rbxassetid://2564305451"
		allpurpose.Volume = 2
		allpurpose.Parent = script
 		allpurpose.Parent = nil
		task.wait(8.1)
		for i,v in pairs(zombies) do
			table.remove(zombies,i)
		end
	end
end)

local function find_target(pos)
	local list = workspace:GetChildren()
	local torso = nil
	local dist = math.huge
	local temp = nil
	local human = nil
	local temp2 = nil
	for x = 1, #list do
		temp2 = list[x]
		if (temp2.className == "Model") and temp2.Name ~= "Zombie" and not temp2:IsDescendantOf(script) then
			temp = temp2:FindFirstChild("HumanoidRootPart")
			human = temp2:FindFirstChildOfClass("Humanoid")
			if (temp ~= nil) and (human ~= nil) and (human.Health > 0)  then
				if (temp.Position - pos).magnitude < dist then
					torso = temp
					dist = (temp.Position - pos).magnitude
				end
			end
		end
	end
	return torso
end
local pathfindingservice = game:GetService("PathfindingService")

local function checkw(t)
	local ci = 3
	if ci > #t then
		ci = 3
	end
	if t[ci] == nil and ci < #t then
		repeat ci += 1 task.wait() until t[ci] ~= nil
		return Vector3.new(1,0,0) + t[ci]
	else
		ci = 3
		return t[ci]
	end
end

local function travel(paths,h)
	local confirm = Instance.new("ObjectValue")
	confirm.Name = 'Moving'
	confirm.Parent = h
	for n,path in pairs(paths) do
		if path.Action == Enum.PathWaypointAction.Jump then
			h.Jump = true
		else
			h:MoveTo(paths)
		end
	end
	pcall(function()
		h:FindFirstChild("Moving"):Destroy()
	end)
end
local function find(targ1,targ2,h)
	if targ1 and targ2 and not h:FindFirstChild("Moving") then else --[[warn("Target(s) non-existant.")]] return end
	local path = pathfindingservice:FindPathAsync(targ1.Position,targ2.Position)
	local paths = path:GetWaypoints()
	if path.Status == Enum.PathStatus.Success then
		task.spawn(function()
			travel(targ1,targ2,paths,h);
		end);
	elseif path.Status == Enum.PathStatus.NoPath then
		--warn("No paths found.")
	end
end

local sw = 0

function swait()
	sw += 1
	if sw >= 50 then
		task.wait(0); sw = 0;
	end
end

task.spawn(function()
	while true do
		for i,v in pairs(zombies) do
			local h = v:FindFirstChildOfClass("Humanoid")
			local rp = v:FindFirstChild("Torso") or v:FindFirstChild("Head")
			if v and v.Parent and h and rp then
				local target = find_target(rp.Position);
				if target ~= nil then
					h:MoveTo(target.Position);
					--find(rp,target,h);
				end;
			else
				table.remove(zombies,i);
				killed += 1;
			end;
			swait();
		end
		task.wait(.1);
	end
end)

task.spawn(function()
	while true do
		if in_progress and cap > #zombies and needed > killed and (needed-killed) > #zombies then
			create(ws,health)
		end
		for i,v in pairs(sgui1:GetChildren()) do
			if v.Name == 'current' then
				v.Text = 'zombies alive: ' .. tostring(#zombies)
			elseif v.Name == 'needed' then
				v.Text = 'zombies to kill: ' .. tostring(needed-killed)
			elseif v.Name == 'round' then
				v.Text = 'round: ' .. tostring(round)
			elseif v.Name == 'health' then
				v.Text = 'zombie healths: ' .. tostring(math.floor(health))
			end
		end
		for i,v in pairs(sgui2:GetChildren()) do
			if v.Name == 'current' then
				v.Text = 'zombies alive: ' .. tostring(#zombies)
			elseif v.Name == 'needed' then
				v.Text = 'zombies to kill: ' .. tostring(needed-killed)
			elseif v.Name == 'round' then
				v.Text = 'round: ' .. tostring(round)
			elseif v.Name == 'health' then
				v.Text = 'zombie healths: ' .. tostring(health)
			end
		end
		cap = 24+(#game:GetService("Players"):GetPlayers()-1)*6
		task.wait(1)
	end
end)

local plr = owner

plr.Chatted:Connect(function(msg)
	if msg:lower():sub(1,6) == "spawn/" then
		local choice = msg:sub(7)
		if tonumber(choice) then
			task.spawn(function()
				for i = 0,choice,1 do
					create(ws,health)
					task.wait()
				end
			end)
			warn("Spawned " ..choice.. " zombie(s).")
		end
	end
	if msg:lower():sub(1,5) == "nuke/" then
		local powerup = Instance.new("Sound",script)
		powerup.SoundId = "rbxassetid://131961140"
		powerup.Volume = 2
		powerup:Play()
		for i,v in pairs(zombies) do
			if v:FindFirstChildOfClass("Humanoid") then
				v:FindFirstChildOfClass("Humanoid").Health = 0
			end
		end
		warn("Nuked all zombies.")
	end
	if msg:lower():sub(1,6) == "insta/" then
		local choice = msg:sub(7)
		if tonumber(choice) then
			local powerup = Instance.new("Sound",script)
			powerup.SoundId = "rbxassetid://131961137"
			powerup.Volume = 2
			powerup:Play()
			task.spawn(function()
				insta = true
				for i,v in pairs(zombies) do
					if v:FindFirstChildOfClass("Humanoid") then
						v:FindFirstChildOfClass("Humanoid").MaxHealth = 1
						v:FindFirstChildOfClass("Humanoid").Health = 1
					end
				end
				task.wait(choice)
				warn("Insta-kill is now gone.")
				for i,v in pairs(zombies) do
					if v:FindFirstChildOfClass("Humanoid") then
						v:FindFirstChildOfClass("Humanoid").MaxHealth = health
						--v:FindFirstChildOfClass("Humanoid").Health = health
					end
				end
				insta = false
			end)
			warn("Zombies are now insta-kill for " ..choice.. " seconds.")
		end
	end
	if msg:lower():sub(1,6) == "round/" then
		local choice = msg:sub(7)
		choice = math.floor(choice)
		if tonumber(choice) and choice > 0 then
			round = choice
			killed = needed
			if round > 10 then
				health = default_health+(healthboost*9)
			elseif 10 > round then
				health = default_health+(healthboost*round)
			end
			if round > 10 then
				for i = 1,round-10 do
					health = health+(health*0.1)
				end
			end
			local powerup = Instance.new("Sound",script)
			powerup.SoundId = "rbxassetid://131961140"
			powerup.Volume = 2
			powerup:Play()
			for i,v in pairs(zombies) do
				if v:FindFirstChildOfClass("Humanoid") then
					v:FindFirstChildOfClass("Humanoid").Health = 0
				end
			end
			task.wait(1.5)
			needed = 24+(3*round)
			warn("Round is now: " .. round .. ".")
		end
	end
end)
