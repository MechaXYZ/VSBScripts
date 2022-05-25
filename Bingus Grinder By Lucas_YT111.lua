local part = Instance.new("Part", script)
    part.Size = Vector3.new(6,7,10)
    part.Anchored = true
    part.Material = "Metal"
    part.CFrame = owner.Character.Head.CFrame * CFrame.new(0,-1,-5)
local decal = Instance.new("Decal", part)
    decal.Texture = "rbxassetid://9719802056"
    decal.Face = "Left"
local screengui2 = Instance.new("SurfaceGui", part)
    screengui2.Face = Enum.NormalId.Right
local tl = Instance.new("TextBox", screengui2)
    tl.Size = UDim2.new(.5, 0, .5, 0)
    tl.BackgroundTransparency = 1
    tl.Position = UDim2.new(.5, 0, .5,0)
    tl.AnchorPoint = Vector2.new(.5, .5)
    tl.Text = "The Bingus Meat Grinder"
    tl.TextSize = 80
local death = Instance.new("Sound", part)
    death.Volume = 2
    death.SoundId = "rbxassetid://7432086508"
    death.Looped = true
    death.PlaybackSpeed = 1.25
local part2 = Instance.new("Part", script)
    part2.Size = Vector3.new(5.5, 3, 3)
    part2.Anchored = true
    part2.CanCollide = false
    part2.CFrame = owner.Character.Head.CFrame * CFrame.new(0, -2.5, -1)
local part3 = Instance.new("Part", script)
    part3.Size = Vector3.new(5.5, 3, 3)
    part3.Anchored = true
    part3.CanCollide = false
    part3.Color = Color3.fromRGB(70, 70, 70)
    part2.Color = Color3.fromRGB(70, 70, 70)
    part3.CFrame = owner.Character.Head.CFrame * CFrame.new(0, 0, -1)
    part3.Shape = "Cylinder"
    part2.Shape = "Cylinder"
    part2.Material = "Concrete"
    part3.Material = "Concrete"
local rayblacklist = {}
local p = Instance.new("SpawnLocation")
    p.Enabled = false  
    p.Transparency = 1
    p.Size = Vector3.new(.25, .25, .25)
    p.Name = "bloodyhujijahuyugtfvfyh"
local attachment0 = Instance.new("Attachment", p)
local attachment1 = Instance.new("Attachment", p)
    attachment1.CFrame = CFrame.new(0, .125, 0)
    attachment0.CFrame = CFrame.new(0, -.125, 0)
local trail = Instance.new("Trail", p)
    trail.Attachment0 = attachment0
    trail.Attachment1 = attachment1
    trail.Lifetime = .5
    trail.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)}
    trail.WidthScale = NumberSequence.new{NumberSequenceKeypoint.new(0, 1),NumberSequenceKeypoint.new(1, 0)}
    trail.MaxLength = 0
    trail.MinLength = 0.1
    trail.LightEmission = 0
    trail.LightInfluence = 1
    trail.TextureLength = 1
    trail.TextureMode = "Stretch"
    trail.Color = ColorSequence.new(Color3.fromRGB(85, 0, 0))
local min = -15
local max = 15
local function splat(times)
    for i = 1, (2 * times) do
        task.wait()
        coroutine.wrap(function()
            local b = p:Clone()
            b.Parent = script
            b.Position = part.Position + part.CFrame.lookVector * -5
            b.Velocity = part.CFrame.lookVector * -(Random.new():NextNumber(15, 30)) + part.CFrame.rightVector * Random.new():NextNumber(min,max) + part.CFrame.upVector * (Random.new():NextNumber(min, max) + 15)
            table.insert(rayblacklist,b)
            b.Touched:Connect(function(what)
	            local params = RaycastParams.new()
	            params.FilterDescendantsInstances = {rayblacklist}
	            params.FilterType = Enum.RaycastFilterType.Blacklist
	            local result = workspace:Raycast(b.Position,b.Velocity + Vector3.new(0, -3, 0), params)
                    if result then
                        local bloodpartfloor = Instance.new("SpawnLocation", workspace)
                        bloodpartfloor.Enabled = false
                        bloodpartfloor.CanCollide = false
                        bloodpartfloor.Anchored = true
                        table.insert(rayblacklist,bloodpartfloor)
                        bloodpartfloor.Size = Vector3.new(.005, .005, .005)
                        bloodpartfloor.CanCollide = false
                        bloodpartfloor.Material = "Glass"
                        bloodpartfloor.Shape = "Cylinder"
                        b:Destroy()
                        bloodpartfloor.Position = result.Position
                        local whathit = result.Instance
		                local currentRightVector = whathit.CFrame.RightVector
		                local upVector = result.Normal
		                local newFacialVector = currentRightVector:Cross(upVector)
                        bloodpartfloor.CFrame = CFrame.fromMatrix(bloodpartfloor.Position, currentRightVector, upVector, newFacialVector) * CFrame.Angles(0, 0, math.rad(90))
                        bloodpartfloor.BrickColor = BrickColor.new("Maroon")
                        game:GetService("Debris"):AddItem(bloodpartfloor, 25)
                        local random = Random.new():NextNumber(.25, 2)
                        local tweenService = game:GetService("TweenService")
                        local timeToFade = .25
                        local object = bloodpartfloor
                        local tweenInfo = TweenInfo.new(timeToFade)
                        local goal = {}
                        goal.Size = Vector3.new(.005, random, random)
                        local grow = tweenService:Create(object, tweenInfo, goal)
                        grow:Play()
                    end
                end)
            end)()
        end
    end
local db = false
part.Touched:Connect(function(wha)
    if wha:FindFirstChild("BingusAlive") and wha:FindFirstChild("BingusAlive").Value == true and not db then
        db = true
        wha:FindFirstChild("BingusAlive").Value = false
        wha.CanQuery = false
        wha.Anchored = true
        wha.CFrame = part.CFrame * CFrame.new(0, 0, 5)
        death:Play()
        local cf = part.CFrame * CFrame.new(0, 0, 5)
        for i = 1, 20 do
        cf = cf:Lerp(part.CFrame * CFrame.new(0, 0, 1), .02)
        wha.CFrame = cf * CFrame.Angles(0,math.rad(180),0) * CFrame.new(Random.new():NextNumber(-.0625, .0625),Random.new():NextNumber(-.0625, .0625),0)
        splat(math.random(1, 3))
        task.wait(.00825)
    end
    death:Stop()
    wha:Destroy()
    task.wait()
    db = false
    end
end)
