--[[ SETUP ]] --

local pm = game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/MechaXYZ/VSBScripts/main/SimplePath%20Module.lua")
local simplepath = loadstring(pm)()
local stuffs = {8819872349, 8819783960, 8819900535, 8819782435, 8819733010}
local model = Instance.new("Model", script)
    model.Name = "ben"
local ben = Instance.new("SpawnLocation", model)
    ben.Enabled = false
    ben.Name = "HumanoidRootPart"
    ben.Size = Vector3.new(2.609, 2.609, 2.609)
    model.PrimaryPart = ben
local head = Instance.new("SpawnLocation", model)
    head.Enabled = false
    head.Name = "Head"
    head.Size = Vector3.new()
    head.Transparency = 0
    head.CanCollide = false
local torso = Instance.new("SpawnLocation", model)
    torso.Enabled = false
    torso.Name = "Torso"
    torso.Size = Vector3.new()
    torso.Transparency = 0
    torso.CanCollide = false
local ears = Instance.new("SpawnLocation", model)
    ears.Enabled = false
    ears.Name = "Ears"
    ears.Size = Vector3.new(4, 2.2, 1)
    ears.Massless = true
    ears.CanCollide = false
local msh = Instance.new("SpecialMesh", ears)
    msh.MeshId = "rbxassetid://10871984"
    msh.TextureId = "rbxassetid://10871968"
    msh.Scale = Vector3.new(2.1, 1.833, 1.05)

-- lucas and bain wanted me to add this boolvalue

local alive = Instance.new("BoolValue", ben)
	alive.Name = "BenAlive"
	alive.Value = true
-- bv for kicking
local bv = Instance.new("BodyVelocity", ben)
    -- bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    bv.MaxForce = Vector3.new()

-- welds
local w = Instance.new("Weld", model)
    w.Name = "Ears Weld"
    w.Part0 = ears
    w.Part1 = ben
    w.C0 = CFrame.new(0, -.1, .5)
local w = Instance.new("Weld", torso)
    w.Part0 = ben
    w.Part1 = head
    w.Name = "Neck"
local m6d = Instance.new("Motor6D", ben)
    m6d.Part0 = ben
    m6d.Part1 = torso
    m6d.Name = "RootJoint"

local function txt(face, id)
    local text = Instance.new("Texture", ben)
        text.Name = face
        text.Face = face
        text.Texture = "rbxassetid://" .. id
        text.StudsPerTileU = 2.609
        text.StudsPerTileV = 2.609
    return text
end

-- textures
local top = txt("Top", 9137838693)
local bottom = txt("Bottom", 6787972241)
local left = txt("Left", 9137838693)
local right = txt("Right", 9137838693)
local front = txt("Front", 9137685752)
local back = txt("Back", 9137838693)

local hum = Instance.new("Humanoid")
    hum.RequiresNeck = false
    hum.DisplayName = "ben"
    hum.Parent = model
    -- test: hum:MoveTo(Vector3.new(50, 0, 0))

hum.Died:Connect(function()
	alive.Value = false
end)
-- funny kicking
local kick = Instance.new("ProximityPrompt", ben)
    kick.Enabled = true
    kick.MaxActivationDistance = 8  
    kick.ClickablePrompt = false
    kick.RequiresLineOfSight = false
    kick.HoldDuration = 0 -- .25
    kick.ObjectText = "" -- "ben"
    kick.ActionText = "" -- "kick him!"
    kick.KeyboardKeyCode = Enum.KeyCode.E
kick.Triggered:Connect(function(plr)
    local rnd = Random.new()
    ben.Massless = true
    hum.PlatformStand = true
    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    bv.Velocity = (plr.Character.HumanoidRootPart.CFrame.lookVector * 50) + Vector3.new(0, 50, 0)
    task.wait(.05)
    bv.MaxForce = Vector3.new()
    bv.Velocity = Vector3.new()
    ben.RotVelocity = Vector3.new(rnd:NextNumber(-5, 5), rnd:NextNumber(-5, 5), rnd:NextNumber(-5, 5))
    task.wait(1.95)
	if alive.Value == true then
    	hum.PlatformStand = false
	end
    ben.Massless = false
end)

-- [[ ON WITH THE AI! ]] --

local function checksight(m, c)
    --[[
    local dist = (c.Position - m.Position).Magnitude
    if dist < 100 then -- in range
        return true
    else -- out of range
        return false
    end
    ]]--
    return false
end

local path = simplepath.new(model)
local goal = nil
-- path.Visualize = true

path.Blocked:Connect(function()
    if goal then
            pcall(function()
            hum:MoveTo(goal.Position, goal)
            hum.Jump = true
            path:Run(goal)
        end)
    end
end)

path.WaypointReached:Connect(function()
    path:Stop(goal)
end)

path.Error:Connect(function(e)
    -- print(e)
    if e == "ComputationError" or e == "TargetUnreachable" then
        if goal then
            pcall(function()
                m.Humanoid:MoveTo(goal.Position, goal)
                if e == "ComputationError" and not touching(ben.CFrame, Vector3.new(5, 5, 5), "TrussPart") then
                    hum.Jump = true
                end
                path:Run(goal)
            end)
        end
    end
end)

local function wander()
    local rnd = Random.new()
    local sprd = 50
    local pos = (ben.CFrame * CFrame.new(rnd:NextNumber(-(sprd), sprd), rnd:NextNumber(-(sprd), sprd), rnd:NextNumber(-(sprd), sprd))).Position
    path:Run(pos)
end
local s = Instance.new("Sound", ben)
	s.SoundId = 'rbxassetid://' .. stuffs[math.random(1, #stuffs)]
	s.EmitterSize = 10
coroutine.wrap(function()
    while task.wait(1) and alive.Value == true do
        -- goal = simplepath.GetNearestCharacter(m.HumanoidRootPart.Position):FindFirstChildWhichIsA("BasePart")
        if checksight(ben, goal) then
            if spotted == false then
                spotted = true
            end
            path:Run(goal)
        elseif not checksight(ben, goal) then
            spotted = false
            wander()
            local rnd = Random.new()
			s.SoundId = 'rbxassetid://' .. stuffs[math.random(1, #stuffs)]
			s:Play()
            task.wait(rnd:NextNumber(1.5, 2))
        end
    end
end)()
