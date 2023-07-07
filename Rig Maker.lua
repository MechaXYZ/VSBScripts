return function(rig)
    if rig == "R6" then
        local Model0 = Instance.new("Model")
        local Part1 = Instance.new("Part")
        local SpecialMesh2 = Instance.new("SpecialMesh")
        local Part4 = Instance.new("Part")
        local Part5 = Instance.new("Part")
        local Part6 = Instance.new("Part")
        local Part7 = Instance.new("Part")
        local Part8 = Instance.new("Part")
        local Humanoid9 = Instance.new("Humanoid")
        Model0.Name = "Character"
        Model0.PrimaryPart = Part1
        Part1.Name = "Head"
        Part1.Parent = Model0
        Part1.Size = Vector3.new(2, 1, 1)
        Part1.CanCollide = true
        Part4.Name = "Torso"
        Part4.Parent = Model0
        Part4.Size = Vector3.new(2, 2, 1)
        Part4.CanCollide = true
        Part5.Name = "Left Arm"
        Part5.Parent = Model0
        Part5.Size = Vector3.new(1, 2, 1)
        Part5.CanCollide = true
        Part6.Name = "Right Arm"
        Part6.Parent = Model0
        Part6.Size = Vector3.new(1, 2, 1)
        Part6.CanCollide = true
        Part7.Name = "Left Leg"
        Part7.Parent = Model0
        Part7.Size = Vector3.new(1, 2, 1)
        Part7.CanCollide = true
        Part8.Name = "Right Leg"
        Part8.Parent = Model0
        Part8.Size = Vector3.new(1, 2, 1)
        Part8.CanCollide = true
        SpecialMesh2.Parent = Part1
        SpecialMesh2.Scale = Vector3.new(1.25, 1.25, 1.25)

        local hrp = Instance.new("Part", Model0)
        hrp.Name = "HumanoidRootPart"
        hrp.Size = Vector3.new(2, 2, 1)
        hrp.CanCollide = false
        hrp.Transparency = 1

        local rl = Part8
        local ll = Part7
        local ra = Part6
        local la = Part5
        local tors = Part4
        local head = Part1
        local nc = Instance.new("Motor6D", tors)
        nc.Name = "Neck"
        nc.Part0 = tors
        nc.Part1 = head
        nc.C0 = CFrame.new(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
        nc.C1 = CFrame.new(0, -.5, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
        nc.MaxVelocity = .1
        local rs = Instance.new("Motor6D", tors)
        rs.Name = "Right Shoulder"
        rs.Part0 = tors
        rs.Part1 = ra
        rs.C0 = CFrame.new(1, .5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
        rs.C1 = CFrame.new(-.5, .5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
        rs.MaxVelocity = .1
        local ls = Instance.new("Motor6D", tors)
        ls.Name = "Left Shoulder"
        ls.Part0 = tors
        ls.Part1 = la
        ls.C0 = CFrame.new(-1, .5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        ls.C1 = CFrame.new(.5, .5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        ls.MaxVelocity = .15
        local rh = Instance.new("Motor6D", tors)
        rh.Name = "Right Hip"
        rh.Part0 = tors
        rh.Part1 = rl
        rh.C0 = CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
        rh.C1 = CFrame.new(.5, 1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
        rh.MaxVelocity = .1
        local lh = Instance.new("Motor6D", tors)
        lh.Name = "Left Hip"
        lh.Part0 = tors
        lh.Part1 = ll
        lh.C0 = CFrame.new(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        lh.C1 = CFrame.new(-.5, 1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        lh.MaxVelocity = .1
        local rj = Instance.new("Motor6D", hrp)
        rj.Name = "RootJoint"
        rj.Part0 = hrp
        rj.Part1 = tors

        Humanoid9.Parent = Model0
        Humanoid9.LeftLeg = ll
        Humanoid9.RightLeg = rl
        Humanoid9.Torso = Part4

        local face = Instance.new("Decal", Model0.Head)
        face.Face = "Front"
        face.Name = "face"
        face.Texture = "rbxasset://textures/face.png"

        return Model0
    end
end
