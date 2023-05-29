return {
	Properties = {
		Looping = false,
		Priority = Enum.AnimationPriority.Action
	},
	Keyframes = {
		[0] = {
			["HumanoidRootPart"] = {
				["Torso"] = {
					["Right Arm"] = {
					},
					["Left Arm"] = {
					},
					["Right Leg"] = {
					},
					["Left Leg"] = {
					},
					["Head"] = {
					},
				},
			},
		},
		[1] = {
			["HumanoidRootPart"] = {
				["Torso"] = {
					CFrame = CFrame.Angles(0, 0, math.rad(33.805)),
					["Right Arm"] = {
						CFrame = CFrame.new(0.198, -0.047, -0.196) * CFrame.Angles(math.rad(85.657), math.rad(85.027), math.rad(-4.354)),
					},
					["Left Arm"] = {
						CFrame = CFrame.new(-0.084, -0.373, -0.232) * CFrame.Angles(0, math.rad(-70.015), math.rad(-88.637)),
					},
					["Right Leg"] = {
						CFrame = CFrame.new(-0.026, -0.037, -0.015) * CFrame.Angles(0, math.rad(-30.023), math.rad(0.63)),
					},
					["Left Leg"] = {
						CFrame = CFrame.new(-0.003, -0.066, 0.007) * CFrame.Angles(math.rad(-4.927), math.rad(30.252), math.rad(-2.521)),
					},
					["Head"] = {
						CFrame = CFrame.new(0.003, -0.011, -0.093) * CFrame.Angles(math.rad(-0.516), math.rad(0.057), math.rad(-37.643)),
					},
				},
			},
		},
	}
}