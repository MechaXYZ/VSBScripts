--Converted with ttyyuu12345's model to script plugin v4
function sandbox(var,func)
	local env = getfenv(func)
	local newenv = setmetatable({},{
		__index = function(self,k)
			if k=="script" then
				return var
			else
				return env[k]
			end
		end,
	})
	setfenv(func,newenv)
	return func
end
cors = {}
mas = Instance.new("Model",game:GetService("Lighting"))
Model0 = Instance.new("Model")
Part1 = Instance.new("Part")
Part2 = Instance.new("Part")
Part3 = Instance.new("Part")
Part4 = Instance.new("Part")
Part5 = Instance.new("Part")
Part6 = Instance.new("Part")
Part7 = Instance.new("Part")
Part8 = Instance.new("Part")
Part9 = Instance.new("Part")
Part10 = Instance.new("Part")
Part11 = Instance.new("Part")
Part12 = Instance.new("Part")
Part13 = Instance.new("Part")
Part14 = Instance.new("Part")
Part15 = Instance.new("Part")
Part16 = Instance.new("Part")
Part17 = Instance.new("Part")
Part18 = Instance.new("Part")
Part19 = Instance.new("Part")
Part20 = Instance.new("Part")
Part21 = Instance.new("Part")
Part22 = Instance.new("Part")
Part23 = Instance.new("Part")
Part24 = Instance.new("Part")
Part25 = Instance.new("Part")
SpotLight26 = Instance.new("SpotLight")
Part27 = Instance.new("Part")
Part28 = Instance.new("Part")
Part29 = Instance.new("Part")
Part30 = Instance.new("Part")
Part31 = Instance.new("Part")
Part32 = Instance.new("Part")
Part33 = Instance.new("Part")
Part34 = Instance.new("Part")
Part35 = Instance.new("Part")
Part36 = Instance.new("Part")
Part37 = Instance.new("Part")
Part38 = Instance.new("Part")
Script39 = Instance.new("Script")
Part40 = Instance.new("Part")
Script41 = Instance.new("Script")
Part42 = Instance.new("Part")
Script43 = Instance.new("Script")
Model0.Name = "rak"
Model0.Parent = mas
Part1.Parent = Model0
Part1.CFrame = CFrame.new(-69.5558014, 33.3152847, 13.1319828, 1, 0, 1.1920929e-07, 0, 1, 0, -1.1920929e-07, 0, 1)
Part1.Position = Vector3.new(-69.5558014, 33.3152847, 13.1319828)
Part1.Size = Vector3.new(28.3000031, 11.5999985, 16.0799961)
Part1.Anchored = true
Part1.BottomSurface = Enum.SurfaceType.Smooth
Part1.TopSurface = Enum.SurfaceType.Smooth
Part2.Parent = Model0
Part2.CFrame = CFrame.new(-98.0408249, 33.3152847, 58.8419914, 1, 0, 1.1920929e-07, 0, 1, 0, -1.1920929e-07, 0, 1)
Part2.Position = Vector3.new(-98.0408249, 33.3152847, 58.8419914)
Part2.Size = Vector3.new(1.46998382, 11.5999985, 12.0599937)
Part2.Anchored = true
Part2.BottomSurface = Enum.SurfaceType.Smooth
Part2.TopSurface = Enum.SurfaceType.Smooth
Part3.Parent = Model0
Part3.CFrame = CFrame.new(-127.775841, 53.0602951, 47.3596268, 1, 0, 1.1920929e-07, 0, 1, 0, -1.1920929e-07, 0, 1)
Part3.Position = Vector3.new(-127.775841, 53.0602951, 47.3596268)
Part3.Size = Vector3.new(0.820000052, 4.54999399, 11.7599878)
Part3.Anchored = true
Part3.BottomSurface = Enum.SurfaceType.Smooth
Part3.TopSurface = Enum.SurfaceType.Smooth
Part4.Parent = Model0
Part4.CFrame = CFrame.new(-41.5358276, 33.3152847, 57.561985, 1, 0, 1.1920929e-07, 0, 1, 0, -1.1920929e-07, 0, 1)
Part4.Position = Vector3.new(-41.5358276, 33.3152847, 57.561985)
Part4.Size = Vector3.new(5.94000626, 11.5999985, 0.599999666)
Part4.Anchored = true
Part4.BottomSurface = Enum.SurfaceType.Smooth
Part4.TopSurface = Enum.SurfaceType.Smooth
Part5.Parent = Model0
Part5.CFrame = CFrame.new(-89.6199799, 57.6389847, 2.74315643, 1, 0, 1.1920929e-07, 0, 1, 0, -1.1920929e-07, 0, 1)
Part5.Position = Vector3.new(-89.6199799, 57.6389847, 2.74315643)
Part5.Color = Color3.new(0.905882, 0.905882, 0.92549)
Part5.Transparency = 0.5
Part5.Size = Vector3.new(116.530037, 1.00000131, 128.280029)
Part5.Anchored = true
Part5.BottomSurface = Enum.SurfaceType.Smooth
Part5.BrickColor = BrickColor.new("Pearl")
Part5.Material = Enum.Material.Glass
Part5.TopSurface = Enum.SurfaceType.Smooth
Part5.brickColor = BrickColor.new("Pearl")
Part6.Parent = Model0
Part6.CFrame = CFrame.new(-64.1708221, 33.3152847, 46.3919716, 1, 0, 1.1920929e-07, 0, 1, 0, -1.1920929e-07, 0, 1)
Part6.Position = Vector3.new(-64.1708221, 33.3152847, 46.3919716)
Part6.Size = Vector3.new(15.430006, 11.5999985, 0.98001045)
Part6.Anchored = true
Part6.BottomSurface = Enum.SurfaceType.Smooth
Part6.TopSurface = Enum.SurfaceType.Smooth
Part7.Parent = Model0
Part7.CFrame = CFrame.new(-104.085823, 33.3152847, 52.9819984, 1, 0, 1.1920929e-07, 0, 1, 0, -1.1920929e-07, 0, 1)
Part7.Position = Vector3.new(-104.085823, 33.3152847, 52.9819984)
Part7.Size = Vector3.new(13.5599833, 11.5999985, 0.339994758)
Part7.Anchored = true
Part7.BottomSurface = Enum.SurfaceType.Smooth
Part7.TopSurface = Enum.SurfaceType.Smooth
Part8.Parent = Model0
Part8.CFrame = CFrame.new(-135.980835, 41.425293, 52.8419724, 1, 0, 1.1920929e-07, 0, 1, 0, -1.1920929e-07, 0, 1)
Part8.Position = Vector3.new(-135.980835, 41.425293, 52.8419724)
Part8.Size = Vector3.new(17.2300014, 27.8199978, 0.819987893)
Part8.Anchored = true
Part8.BottomSurface = Enum.SurfaceType.Smooth
Part8.TopSurface = Enum.SurfaceType.Smooth
Part9.Parent = Model0
Part9.CFrame = CFrame.new(-21.1111717, 35.3887558, -18.6473217, 1, 0, 1.1920929e-07, 0, 1, 0, -1.1920929e-07, 0, 1)
Part9.Position = Vector3.new(-21.1111717, 35.3887558, -18.6473217)
Part9.Size = Vector3.new(10, 1.89999998, 24.3500004)
Part9.Anchored = true
Part9.BottomSurface = Enum.SurfaceType.Smooth
Part9.TopSurface = Enum.SurfaceType.Smooth
Part10.Parent = Model0
Part10.CFrame = CFrame.new(-144.755798, 41.425293, 44.4069939, 1, 0, 1.1920929e-07, 0, 1, 0, -1.1920929e-07, 0, 1)
Part10.Position = Vector3.new(-144.755798, 41.425293, 44.4069939)
Part10.Size = Vector3.new(0.619977117, 27.8199978, 17.6899891)
Part10.Anchored = true
Part10.BottomSurface = Enum.SurfaceType.Smooth
Part10.TopSurface = Enum.SurfaceType.Smooth
Part11.Parent = Model0
Part11.CFrame = CFrame.new(-127.775841, 41.425293, 38.5519791, 1, 0, 1.1920929e-07, 0, 1, 0, -1.1920929e-07, 0, 1)
Part11.Position = Vector3.new(-127.775841, 41.425293, 38.5519791)
Part11.Size = Vector3.new(0.820000052, 27.8199978, 5.97998762)
Part11.Anchored = true
Part11.BottomSurface = Enum.SurfaceType.Smooth
Part11.TopSurface = Enum.SurfaceType.Smooth
Part12.Parent = Model0
Part12.CFrame = CFrame.new(-44.3806229, 33.3152847, 47.7669754, 1, 0, 1.1920929e-07, 0, 1, 0, -1.1920929e-07, 0, 1)
Part12.Position = Vector3.new(-44.3806229, 33.3152847, 47.7669754)
Part12.Size = Vector3.new(0.580008984, 11.5999985, 20.1899986)
Part12.Anchored = true
Part12.BottomSurface = Enum.SurfaceType.Smooth
Part12.TopSurface = Enum.SurfaceType.Smooth
Part13.Parent = Model0
Part13.CFrame = CFrame.new(-71.5858231, 33.3152847, 33.121994, 1, 0, 1.1920929e-07, 0, 1, 0, -1.1920929e-07, 0, 1)
Part13.Position = Vector3.new(-71.5858231, 33.3152847, 33.121994)
Part13.Size = Vector3.new(0.600006461, 11.5999985, 27.52001)
Part13.Anchored = true
Part13.BottomSurface = Enum.SurfaceType.Smooth
Part13.TopSurface = Enum.SurfaceType.Smooth
Part14.Parent = Model0
Part14.CFrame = CFrame.new(-56.4158249, 33.3152847, 42.2769737, 1, 0, 1.1920929e-07, 0, 1, 0, -1.1920929e-07, 0, 1)
Part14.Position = Vector3.new(-56.4158249, 33.3152847, 42.2769737)
Part14.Size = Vector3.new(0.740005672, 11.5999985, 9.21001053)
Part14.Anchored = true
Part14.BottomSurface = Enum.SurfaceType.Smooth
Part14.TopSurface = Enum.SurfaceType.Smooth
Part15.Parent = Model0
Part15.CFrame = CFrame.new(-127.795807, 33.3152847, 44.4069939, 1, 0, 1.1920929e-07, 0, 1, 0, -1.1920929e-07, 0, 1)
Part15.Position = Vector3.new(-127.795807, 33.3152847, 44.4069939)
Part15.Size = Vector3.new(34.539978, 11.5999985, 17.6899891)
Part15.Anchored = true
Part15.BottomSurface = Enum.SurfaceType.Smooth
Part15.TopSurface = Enum.SurfaceType.Smooth
Part16.Parent = Model0
Part16.CFrame = CFrame.new(-69.6008301, 13.3892269, -60.3507843, 1, 0, 1.1920929e-07, 0, 1, 0, -1.1920929e-07, 0, 1)
Part16.Position = Vector3.new(-69.6008301, 13.3892269, -60.3507843)
Part16.Size = Vector3.new(28.2100067, 11.5999985, 16.0799961)
Part16.Anchored = true
Part16.BottomSurface = Enum.SurfaceType.Smooth
Part16.TopSurface = Enum.SurfaceType.Smooth
Part17.Parent = Model0
Part17.CFrame = CFrame.new(-14.0961647, 32.7595406, 13.7692919, 1, 0, 1.1920929e-07, 0, 1, 0, -1.1920929e-07, 0, 1)
Part17.Position = Vector3.new(-14.0961647, 32.7595406, 13.7692919)
Part17.Size = Vector3.new(24.2000065, 1.900002, 16.0799961)
Part17.Anchored = true
Part17.BottomSurface = Enum.SurfaceType.Smooth
Part17.TopSurface = Enum.SurfaceType.Smooth
Part18.Parent = Model0
Part18.CFrame = CFrame.new(-50.7158127, 33.3152847, 37.9219818, 1, 0, 1.1920929e-07, 0, 1, 0, -1.1920929e-07, 0, 1)
Part18.Position = Vector3.new(-50.7158127, 33.3152847, 37.9219818)
Part18.Size = Vector3.new(12.140008, 11.5999985, 0.5)
Part18.Anchored = true
Part18.BottomSurface = Enum.SurfaceType.Smooth
Part18.TopSurface = Enum.SurfaceType.Smooth
Part19.Parent = Model0
Part19.CFrame = CFrame.new(-96.3349762, 6.03002548, 26.494545, 1, 0, 1.1920929e-07, 0, 1, 0, -1.1920929e-07, 0, 1)
Part19.Position = Vector3.new(-96.3349762, 6.03002548, 26.494545)
Part19.Size = Vector3.new(5.77000332, 5.84000158, 39.420002)
Part19.Anchored = true
Part19.BottomSurface = Enum.SurfaceType.Smooth
Part19.TopSurface = Enum.SurfaceType.Smooth
Part20.Parent = Model0
Part20.CFrame = CFrame.new(-136.21582, 41.425293, 35.8919907, 1, 0, 1.1920929e-07, 0, 1, 0, -1.1920929e-07, 0, 1)
Part20.Position = Vector3.new(-136.21582, 41.425293, 35.8919907)
Part20.Size = Vector3.new(17.6999779, 27.8199978, 0.659989297)
Part20.Anchored = true
Part20.BottomSurface = Enum.SurfaceType.Smooth
Part20.TopSurface = Enum.SurfaceType.Smooth
Part21.Parent = Model0
Part21.CFrame = CFrame.new(-69.6008224, 25.0892754, -39.0436134, 1, 0, 1.1920929e-07, 0, 1, 0, -1.1920929e-07, 0, 1)
Part21.Position = Vector3.new(-69.6008224, 25.0892754, -39.0436134)
Part21.Size = Vector3.new(28.2100067, 11.5999985, 16.0799961)
Part21.Anchored = true
Part21.BottomSurface = Enum.SurfaceType.Smooth
Part21.TopSurface = Enum.SurfaceType.Smooth
Part22.Parent = Model0
Part22.CFrame = CFrame.new(-69.6008224, 25.0892754, -11.8053627, 1, 0, 1.1920929e-07, 0, 1, 0, -1.1920929e-07, 0, 1)
Part22.Position = Vector3.new(-69.6008224, 25.0892754, -11.8053627)
Part22.Size = Vector3.new(28.2100067, 11.5999985, 16.0799961)
Part22.Anchored = true
Part22.BottomSurface = Enum.SurfaceType.Smooth
Part22.TopSurface = Enum.SurfaceType.Smooth
Part23.Parent = Model0
Part23.CFrame = CFrame.new(-38.7108231, 33.3152847, 61.0670013, 1, 0, 1.1920929e-07, 0, 1, 0, -1.1920929e-07, 0, 1)
Part23.Position = Vector3.new(-38.7108231, 33.3152847, 61.0670013)
Part23.Size = Vector3.new(0.50999999, 11.5999985, 7.60999918)
Part23.Anchored = true
Part23.BottomSurface = Enum.SurfaceType.Smooth
Part23.TopSurface = Enum.SurfaceType.Smooth
Part24.Parent = Model0
Part24.CFrame = CFrame.new(-127.775841, 41.425293, 50.2496223, 1, 0, 1.1920929e-07, 0, 1, 0, -1.1920929e-07, 0, 1)
Part24.Position = Vector3.new(-127.775841, 41.425293, 50.2496223)
Part24.Size = Vector3.new(0.820000052, 27.8199978, 5.97998762)
Part24.Anchored = true
Part24.BottomSurface = Enum.SurfaceType.Smooth
Part24.TopSurface = Enum.SurfaceType.Smooth
Part25.Parent = Model0
Part25.CFrame = CFrame.new(-136.215805, 55.5802803, 44.4069939, 1, 0, 1.1920929e-07, 0, 1, 0, -1.1920929e-07, 0, 1)
Part25.Position = Vector3.new(-136.215805, 55.5802803, 44.4069939)
Part25.Size = Vector3.new(17.6999817, 1.00999987, 17.6899891)
Part25.Anchored = true
Part25.BottomSurface = Enum.SurfaceType.Smooth
Part25.TopSurface = Enum.SurfaceType.Smooth
SpotLight26.Parent = Part25
SpotLight26.Face = Enum.NormalId.Bottom
SpotLight26.Brightness = 10
Part27.Parent = Model0
Part27.CFrame = CFrame.new(-21.1111755, 41.7837601, -49.2218666, 1, 0, 1.1920929e-07, 0, 1, 0, -1.1920929e-07, 0, 1)
Part27.Position = Vector3.new(-21.1111755, 41.7837601, -49.2218666)
Part27.Size = Vector3.new(10, 14.6900005, 24.3500004)
Part27.Anchored = true
Part27.BottomSurface = Enum.SurfaceType.Smooth
Part27.TopSurface = Enum.SurfaceType.Smooth
Part28.Parent = Model0
Part28.CFrame = CFrame.new(-68.6158142, 33.3152847, 64.4120026, 1, 0, 1.1920929e-07, 0, 1, 0, -1.1920929e-07, 0, 1)
Part28.Position = Vector3.new(-68.6158142, 33.3152847, 64.4120026)
Part28.Size = Vector3.new(60.3199921, 11.5999985, 0.919999182)
Part28.Anchored = true
Part28.BottomSurface = Enum.SurfaceType.Smooth
Part28.TopSurface = Enum.SurfaceType.Smooth
Part29.Parent = Model0
Part29.CFrame = CFrame.new(-38.7676239, 42.7599678, 14.092886, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part29.Position = Vector3.new(-38.7676239, 42.7599678, 14.092886)
Part29.Size = Vector3.new(0.419999987, 0.419999987, 17.1567993)
Part29.Anchored = true
Part29.BottomSurface = Enum.SurfaceType.Smooth
Part29.TopSurface = Enum.SurfaceType.Smooth
Part30.Parent = Model0
Part30.CFrame = CFrame.new(-98.4399872, 4.47502708, 38.164547, 1, 0, 1.1920929e-07, 0, 1, 0, -1.1920929e-07, 0, 1)
Part30.Position = Vector3.new(-98.4399872, 4.47502708, 38.164547)
Part30.Size = Vector3.new(9.98000336, 8.95000172, 16.0799961)
Part30.Anchored = true
Part30.BottomSurface = Enum.SurfaceType.Smooth
Part30.TopSurface = Enum.SurfaceType.Smooth
Part31.Parent = Model0
Part31.CFrame = CFrame.new(-89.2249908, 6.31502914, 4.24838257, 1, 0, 1.1920929e-07, 0, 1, 0, -1.1920929e-07, 0, 1)
Part31.Position = Vector3.new(-89.2249908, 6.31502914, 4.24838257)
Part31.Size = Vector3.new(9.73000145, 12.6300049, 16.0799961)
Part31.Anchored = true
Part31.BottomSurface = Enum.SurfaceType.Smooth
Part31.TopSurface = Enum.SurfaceType.Smooth
Part32.Parent = Model0
Part32.CFrame = CFrame.new(-73.7849884, 8.47172356, -38.3179054, 1, 0, 1.1920929e-07, 0, 1, 0, -1.1920929e-07, 0, 1)
Part32.Position = Vector3.new(-73.7849884, 8.47172356, -38.3179054)
Part32.Size = Vector3.new(40.6099968, 1.48000002, 16.0799961)
Part32.Anchored = true
Part32.BottomSurface = Enum.SurfaceType.Smooth
Part32.TopSurface = Enum.SurfaceType.Smooth
Part33.Parent = Model0
Part33.CFrame = CFrame.new(1.73805618, 51.4494057, -51.241127, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part33.Position = Vector3.new(1.73805618, 51.4494057, -51.241127)
Part33.Size = Vector3.new(1, 1, 16.5400009)
Part33.Anchored = true
Part33.BottomSurface = Enum.SurfaceType.Smooth
Part33.TopSurface = Enum.SurfaceType.Smooth
Part34.Parent = Model0
Part34.CFrame = CFrame.new(17.3959675, 50.352726, -51.241127, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part34.Position = Vector3.new(17.3959675, 50.352726, -51.241127)
Part34.Size = Vector3.new(1, 1, 16.5400009)
Part34.Anchored = true
Part34.BottomSurface = Enum.SurfaceType.Smooth
Part34.TopSurface = Enum.SurfaceType.Smooth
Part35.Parent = Model0
Part35.CFrame = CFrame.new(32.4930077, 49.3134193, -51.241127, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part35.Position = Vector3.new(32.4930077, 49.3134193, -51.241127)
Part35.Size = Vector3.new(1, 1, 16.5400009)
Part35.Anchored = true
Part35.BottomSurface = Enum.SurfaceType.Smooth
Part35.TopSurface = Enum.SurfaceType.Smooth
Part36.Parent = Model0
Part36.CFrame = CFrame.new(47.8780708, 48.2167397, -51.241127, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part36.Position = Vector3.new(47.8780708, 48.2167397, -51.241127)
Part36.Size = Vector3.new(1, 1, 16.5400009)
Part36.Anchored = true
Part36.BottomSurface = Enum.SurfaceType.Smooth
Part36.TopSurface = Enum.SurfaceType.Smooth
Part37.Parent = Model0
Part37.CFrame = CFrame.new(71.2726517, 40.0720901, -51.241127, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part37.Position = Vector3.new(71.2726517, 40.0720901, -51.241127)
Part37.Size = Vector3.new(32.6699982, 1, 16.5400009)
Part37.Anchored = true
Part37.BottomSurface = Enum.SurfaceType.Smooth
Part37.TopSurface = Enum.SurfaceType.Smooth
Part38.Name = "tp"
Part38.Parent = Model0
Part38.CFrame = CFrame.new(-81.5750046, 73.5007095, 3.30316925, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part38.Position = Vector3.new(-81.5750046, 73.5007095, 3.30316925)
Part38.Color = Color3.new(0, 1, 0)
Part38.Size = Vector3.new(12.4299984, 12.4299984, 12.4299984)
Part38.Anchored = true
Part38.BottomSurface = Enum.SurfaceType.Smooth
Part38.BrickColor = BrickColor.new("Lime green")
Part38.CanCollide = false
Part38.Material = Enum.Material.ForceField
Part38.Reflectance = 1
Part38.TopSurface = Enum.SurfaceType.Smooth
Part38.brickColor = BrickColor.new("Lime green")
Part38.Shape = Enum.PartType.Ball
Script39.Parent = Part38
table.insert(cors,sandbox(Script39,function()
function lol(part)
	if part.Parent:findFirstChildOfClass("Humanoid") and part.Parent:findFirstChild("Head") then
		part.Parent:findFirstChild("Head").CFrame = script.Parent.Parent.tp2.CFrame
	end
end
script.Parent.Touched:connect(lol)
local function animate()
	while true do
		local thatcf = script.Parent.CFrame
		for i = 0,0.1 , 0.001 do
			script.Parent.CFrame = script.Parent.CFrame:lerp(thatcf * CFrame.new(0,-1,0),i)
			game:GetService("RunService").Heartbeat:wait()
		end
		local thatcf = script.Parent.CFrame
		for i = 0,0.1 , 0.001 do
			script.Parent.CFrame = script.Parent.CFrame:lerp(thatcf * CFrame.new(0,1,0),i)
			game:GetService("RunService").Heartbeat:wait()
		end
	end
end
spawn(animate)
end))
Part40.Name = "tp"
Part40.Parent = Model0
Part40.CFrame = CFrame.new(77.4303665, 45.544323, -50.6221237, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part40.Position = Vector3.new(77.4303665, 45.544323, -50.6221237)
Part40.Color = Color3.new(0, 1, 0)
Part40.Size = Vector3.new(5.26999998, 5.26999998, 5.26999998)
Part40.Anchored = true
Part40.BottomSurface = Enum.SurfaceType.Smooth
Part40.BrickColor = BrickColor.new("Lime green")
Part40.CanCollide = false
Part40.Material = Enum.Material.ForceField
Part40.Reflectance = 1
Part40.TopSurface = Enum.SurfaceType.Smooth
Part40.brickColor = BrickColor.new("Lime green")
Part40.Shape = Enum.PartType.Ball
Script41.Parent = Part40
table.insert(cors,sandbox(Script41,function()
function lol(part)
	if part.Parent:findFirstChildOfClass("Humanoid") and part.Parent:findFirstChild("Head") then
		part.Parent:findFirstChild("Head").CFrame = script.Parent.Parent.tp2.CFrame
	end
end
script.Parent.Touched:connect(lol)
local function animate()
	while true do
		local thatcf = script.Parent.CFrame
		for i = 0,0.1 , 0.001 do
			script.Parent.CFrame = script.Parent.CFrame:lerp(thatcf * CFrame.new(0,-1,0),i)
			game:GetService("RunService").Heartbeat:wait()
		end
		local thatcf = script.Parent.CFrame
		for i = 0,0.1 , 0.001 do
			script.Parent.CFrame = script.Parent.CFrame:lerp(thatcf * CFrame.new(0,1,0),i)
			game:GetService("RunService").Heartbeat:wait()
		end
	end
end
spawn(animate)
end))
Part42.Name = "tp2"
Part42.Parent = Model0
Part42.CFrame = CFrame.new(-135.635315, 50.0945625, 44.5450058, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part42.Position = Vector3.new(-135.635315, 50.0945625, 44.5450058)
Part42.Color = Color3.new(1, 0, 0)
Part42.Size = Vector3.new(4, 4, 4)
Part42.Anchored = true
Part42.BottomSurface = Enum.SurfaceType.Smooth
Part42.BrickColor = BrickColor.new("Really red")
Part42.CanCollide = false
Part42.Material = Enum.Material.ForceField
Part42.Reflectance = 1
Part42.TopSurface = Enum.SurfaceType.Smooth
Part42.brickColor = BrickColor.new("Really red")
Part42.Shape = Enum.PartType.Ball
Script43.Parent = Part42
table.insert(cors,sandbox(Script43,function()
local function animate()
	while true do
		local thatcf = script.Parent.CFrame
		for i = 0,0.1 , 0.001 do
			script.Parent.CFrame = script.Parent.CFrame:lerp(thatcf * CFrame.new(0,-1,0),i)
			game:GetService("RunService").Heartbeat:wait()
		end
		local thatcf = script.Parent.CFrame
		for i = 0,0.1 , 0.001 do
			script.Parent.CFrame = script.Parent.CFrame:lerp(thatcf * CFrame.new(0,1,0),i)
			game:GetService("RunService").Heartbeat:wait()
		end
	end
end
spawn(animate)
end))
for i,v in pairs(mas:GetChildren()) do
	v.Parent = workspace
	pcall(function() v:MakeJoints() end)
end
mas:Destroy()
for i,v in pairs(cors) do
	spawn(function()
		pcall(v)
	end)
end
