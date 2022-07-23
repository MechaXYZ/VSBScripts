local re = Instance.new("RemoteEvent", owner.PlayerGui)
print("Click on someone to control him/her")
local oldchar = owner.Character
re.OnServerEvent:Connect(function(plr, targ)
for i, v in pairs(targ:GetDescendants()) do
	if v:IsA("BasePart") and v.Anchored == false then
		v:SetNetworkOwner(owner)
	end
end
if targ:FindFirstChild("Animate") then
	targ.Animate.Disabled = true
	task.wait()
	targ.Animate.Disabled = false
end
owner.Character = targ
oldchar.Parent = nil
task.wait()
oldchar.Parent = workspace
oldchar = owner.Character
end)
NLS([[
local re = script.Parent
local cam = workspace.CurrentCamera
cam.CameraType = 'Custom'
local m = owner:GetMouse()
local function setcam()
	for i = 1, 5 do
		pcall(function()
			cam.CameraType = 'Custom'
			cam.CameraSubject = owner.Character.Humanoid
		end)
	end
end
local function HasHumanoid(p)
	if p:FindFirstAncestorOfClass("Model", true) and p:FindFirstAncestorOfClass("Model", true):FindFirstChildOfClass("Humanoid") then
		return p:FindFirstAncestorOfClass("Model", true)
	else
		return false
	end
end
m.Button1Down:Connect(function()
	if m.Target and HasHumanoid(m.Target) then
		local oldchar = owner.Character
		re:FireServer(HasHumanoid(m.Target))
		repeat task.wait() until owner.Character ~= oldchar
		owner.Character.Humanoid:SetStateEnabled("Dead", false)
		setcam()
	end
end)
]], re)
