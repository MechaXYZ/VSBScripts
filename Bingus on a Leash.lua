--[[ SETUP ]] --

local leash = Instance.new("Tool", owner.Backpack)
    leash.Name = "bingus on a leash"
    leash.ToolTip = "he bites"
    leash.Grip = CFrame.new(0, 0, -.6)
local h = Instance.new("SpawnLocation", leash)
    h.Enabled = false
    h.Name = "Handle"
    h.Size = Vector3.new(1.1, 1.1, .5)
    h.BrickColor = BrickColor.new("Tr. Red")
    h.Material = "SmoothPlastic"
    h.Massless = true
local bingus = Instance.new("SpawnLocation", h)
    bingus.Enabled = false
    bingus.Name = "Bingus"
    bingus.Size = Vector3.new(2.609, 2.609, 2.609)
    bingus.Massless = true
local ears = Instance.new("SpawnLocation", h)
    ears.Enabled = false
    ears.Name = "Ears"
    ears.Size = Vector3.new(2.398, 2.891, .377)
    ears.Massless = true
    ears.CanCollide = false
local msh = Instance.new("SpecialMesh", ears)
    msh.MeshId = "rbxassetid://5660900600"
    msh.TextureId = "rbxassetid://9543390109"
    msh.Scale = Vector3.new(2.398, 3.262, 0.652)

local leashstart = Instance.new("Attachment", h)
local leashend = Instance.new("Attachment", bingus)

local rope = Instance.new("RopeConstraint", h)
    rope.Attachment0 = leashstart
    rope.Attachment1 = leashend
    rope.Length = 8
    rope.Restitution = 1
    rope.Color = h.BrickColor
    rope.Visible = true
-- bv for attacking
local bv = Instance.new("BodyVelocity", bingus)
    -- bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    bv.MaxForce = Vector3.new()

-- welds
local w = Instance.new("Weld", h)
    w.Name = "Ears Weld"
    w.Part0 = ears
    w.Part1 = bingus
    w.C0 = CFrame.new(.009, -1.772, .165)

local function txt(face, id)
    local text = Instance.new("Texture", bingus)
        text.Name = face
        text.Face = face
        text.Texture = "rbxassetid://" .. id
        text.StudsPerTileU = 2.609
        text.StudsPerTileV = 2.609
    return text
end

-- textures
local top = txt("Top", 9543391827)
local bottom = txt("Bottom", 9543391827)
local left = txt("Left", 9543390109)
local right = txt("Right", 9543390109)
local front = txt("Front", 9508006574)
local back = txt("Back", 9543391827)

leash.Activated:Connect(function()
    local rnd = Random.new()
    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    bv.Velocity = (leash.Parent.HumanoidRootPart.CFrame.lookVector * 50) + Vector3.new(0, 50, 0)
    task.wait(.05)
    bv.MaxForce = Vector3.new()
    bv.Velocity = Vector3.new()
    bingus.RotVelocity = Vector3.new(rnd:NextNumber(-5, 5), rnd:NextNumber(-5, 5), rnd:NextNumber(-5, 5))
end)
