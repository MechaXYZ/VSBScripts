--[[ SETUP ]] --

local stuffs = {8819872349, 8819783960, 8819900535, 8819782435, 8819733010}

local leash = Instance.new("Tool", owner.Backpack)
    leash.Name = "ben on a leash"
    leash.ToolTip = "he bites"
    leash.Grip = CFrame.new(0, 0, -.6)
local h = Instance.new("SpawnLocation", leash)
    h.Enabled = false
    h.Name = "Handle"
    h.Size = Vector3.new(1.1, 1.1, .5)
    h.BrickColor = BrickColor.new("Tr. Red")
    h.Material = "SmoothPlastic"
    h.Massless = true
local ben = Instance.new("SpawnLocation", h)
    ben.Enabled = false
    ben.Name = "ben"
    ben.Size = Vector3.new(2.609, 2.609, 2.609)
    ben.Massless = true
local ears = Instance.new("SpawnLocation", h)
    ears.Enabled = false
    ears.Name = "Ears"
    ears.Size = Vector3.new(4, 2.2, 1)
    ears.Massless = true
    ears.CanCollide = false
local msh = Instance.new("SpecialMesh", ears)
    msh.MeshId = "rbxassetid://10871984"
    msh.TextureId = "rbxassetid://10871968"
    msh.Scale = Vector3.new(2.1, 1.833, 1.05)

local leashstart = Instance.new("Attachment", h)
local leashend = Instance.new("Attachment", ben)

local rope = Instance.new("RopeConstraint", h)
    rope.Attachment0 = leashstart
    rope.Attachment1 = leashend
    rope.Length = 8
    rope.Restitution = 1
    rope.Color = h.BrickColor
    rope.Visible = true
-- bv for attacking
local bv = Instance.new("BodyVelocity", ben)
    -- bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    bv.MaxForce = Vector3.new()

-- welds
local w = Instance.new("Weld", h)
    w.Name = "Ears Weld"
    w.Part0 = ears
    w.Part1 = ben
    w.C0 = CFrame.new(0, -.1, .5)

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

local s = Instance.new("Sound", game:GetService("VRService"))
	s.SoundId = 'rbxassetid://' .. stuffs[math.random(1, #stuffs)]
	s.EmitterSize = 10
	s.PlayOnRemove = true
leash.Activated:Connect(function()
	s.SoundId = 'rbxassetid://' .. stuffs[math.random(1, #stuffs)]
	s.Parent = ben
	s.Parent = nil
    local rnd = Random.new()
    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    bv.Velocity = (leash.Parent.HumanoidRootPart.CFrame.lookVector * 50) + Vector3.new(0, 50, 0)
    task.wait(.05)
    bv.MaxForce = Vector3.new()
    bv.Velocity = Vector3.new()
    ben.RotVelocity = Vector3.new(rnd:NextNumber(-5, 5), rnd:NextNumber(-5, 5), rnd:NextNumber(-5, 5))
end)
