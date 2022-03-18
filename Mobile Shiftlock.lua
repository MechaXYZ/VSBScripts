local ls = [[
local val = Instance.new("BoolValue" , owner.Character)
val.Name = "InShiftLock"
val.Value = false
local plr = owner
local m = owner:GetMouse()
local rotation = Instance.new("BodyGyro")
rotation.P = 1000000
rotation.Name = "ShiftLockGyro"
rotation.Parent = owner.Character.HumanoidRootPart
local currentval = val.Value
owner.CharacterAdded:Connect(function()
owner.Character:WaitForChild("HumanoidRootPart")
local ad = Instance.new("BodyGyro")
ad.P = 1000000
ad.Name = "ShiftLockGyro"
ad.Parent = owner.Character.HumanoidRootPart
rotation = ad
local g = Instance.new("BoolValue" , owner.Character)
g.Name = "InShiftLock"
g.Value = currentval
val = g
end)
workspace.DescendantRemoving:Connect(function(a)
pcall(function()
if a == rotation then
local ad = Instance.new("BodyGyro")
ad.P = 1000000
ad.Name = "ShiftLockGyro"
ad.Parent = owner.Character.HumanoidRootPart
rotation = ad
end
if a == val then
local g = Instance.new("BoolValue" , owner.Character)
g.Name = "InShiftLock"
g.Value = currentval
val = g
end
end)
end)
local UIS = game:GetService("UserInputService")
local function LockCenter()
pcall(function()
rotation.CFrame = m.Origin
UIS.MouseBehavior = Enum.MouseBehavior.LockCenter
end)
end
local MouseLockedCursor = "rbxasset://textures/MouseLockedCursor.png"
local ShiftLockConnection = nil
local function ShiftLock(active)
if active == true then
		owner.Character.Humanoid.CameraOffset = Vector3.new(1.75,0,0)
		rotation.MaxTorque = Vector3.new(0, math.huge, 0)
		ShiftLockConnection = game:GetService("RunService").RenderStepped:Connect(function()
		pcall(function()
		for i = 1, 15 do
		LockCenter()
		end
		end)
		end)
		else
		owner.Character.Humanoid.CameraOffset = Vector3.new(0,0,0)
		rotation.MaxTorque = Vector3.new(0, 0, 0)
		if ShiftLockConnection then ShiftLockConnection:Disconnect() end
	end
end
local ShiftLocked = false
UIS.InputBegan:Connect(function(key, gpc)
if gpc then return end
if (key.KeyCode == Enum.KeyCode.LeftShift or key.KeyCode == Enum.KeyCode.RightShift) and ShiftLocked == false then
ShiftLocked = true
ShiftLock(true)
val.Value = true
currentval = val.Value
m.Icon = MouseLockedCursor
elseif (key.KeyCode == Enum.KeyCode.LeftShift or key.KeyCode == Enum.KeyCode.RightShift) and ShiftLocked == true then
ShiftLocked = false
ShiftLock(false)
val.Value = false
currentval = val.Value
m.Icon = ""
end
end)
if UIS.KeyboardEnabled == false then
ShiftLocked = true
ShiftLock(true)
val.Value = true
currentval = val.Value
m.Icon = MouseLockedCursor
end
]]
NLS(ls, owner.PlayerGui)
