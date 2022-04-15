local re = Instance.new("RemoteEvent" , owner.PlayerGui)
re.Name = 'HideEvent'
local re2 = Instance.new("RemoteEvent" , owner.PlayerGui)
re2.Name = 'KeyDownEvent'
owner.Character = nil
local blendercam = Instance.new("SpawnLocation", Instance.new("WorldModel", script))
blendercam.Enabled = false
blendercam.Name = owner.Name.. "'s Blender Camera"
blendercam.Anchored = true
blendercam.CanTouch = false
blendercam.CanQuery = false
blendercam.CanCollide = false
blendercam.CFrame = CFrame.new(0, 5, 0)
blendercam.BrickColor = BrickColor.new("Br. yellowish orange")
local suzanne = Instance.new("SpawnLocation", script)
suzanne.Enabled = false
suzanne.Name = "SUZANNE."
suzanne.CFrame = blendercam.CFrame
suzanne.Size = Vector3.new()
suzanne.Anchored = true
suzanne.Transparency = 1
local msh = Instance.new("SpecialMesh", suzanne)
msh.MeshId = 'rbxassetid://8603513099'
msh.Scale = Vector3.new(0, .2, .1)
coroutine.wrap(function()
while task.wait() do
pcall(function()
suzanne.CFrame = blendercam.CFrame * CFrame.new(0, -1.5, 10) * CFrame.Angles(0, math.pi, 0)
end)
end
end)()
local er = Instance.new("Sound", game:GetService("VRService"))
er.SoundId = 'rbxassetid://7207301949'
er.Volume = 1.5
er.PlayOnRemove = true
local real = Instance.new("Sound", game:GetService("VRService"))
real.SoundId = 'rbxassetid://5892326438'
real.Volume = 1.5
real.PlayOnRemove = true
function chatfunc(text)
local chat = coroutine.wrap(function()
if blendercam:FindFirstChild("TalkingBillBoard")~= nil then
blendercam:FindFirstChild("TalkingBillBoard"):destroy()
end
local naeeym2 = Instance.new("BillboardGui",blendercam)
naeeym2.Size = UDim2.new(0, 500, 0, 500)
naeeym2.StudsOffset = Vector3.new(0,2.5,0)
naeeym2.Name = "TalkingBillBoard"
local tecks2 = Instance.new("TextBox",naeeym2)
tecks2.BackgroundTransparency = 1
tecks2.BorderSizePixel = 0
tecks2.Text = ""
tecks2.Font = "Arcade"
tecks2.TextScaled = true
tecks2.TextSize = 35
tecks2.TextStrokeTransparency = 0
tecks2.TextColor3 = BrickColor.new("Br. yellowish orange").Color
tecks2.TextStrokeColor3 = BrickColor.new("Bright orange").Color
tecks2.Size = UDim2.new(1,0,0.5,0)
for c = 1,string.len(text),1 do
tecks2.Text = string.sub(text,1,c)
er.TimePosition = .1
er.Parent = blendercam
er.Parent = nil
task.wait(.065)
end
end)
chat()
end
owner.Chatted:Connect(function(msg)
if string.sub(msg, 1, 2) ~= '/e' then
chatfunc(msg)
end
end)
local ccf
local cammesh = Instance.new("SpecialMesh" , blendercam)
cammesh.MeshId = 'rbxassetid://6551300916'
cammesh.Scale = Vector3.new(3,3,3)
local vel = 125
re.OnServerEvent:Connect(function(plr, cf, attack, mode)
blendercam.CFrame = cf * CFrame.Angles(0,math.rad(180),0)
ccf = cf
if attack == true and mode == "Normal" then
local suzanne = Instance.new("SpawnLocation" , script)
suzanne.Enabled = false
suzanne.Name = "SUZANNE."
suzanne.CFrame = cf * CFrame.new(math.random(-1.5, 1.5), math.random(-1.5, 1.5), -5)
suzanne.Size = Vector3.new(3, 3.5, 3)
suzanne.Velocity = cf.lookVector * vel
coroutine.wrap(function()
task.wait(.5)
real.Parent = suzanne
real.Parent = nil
end)()
local msh = Instance.new("SpecialMesh", suzanne)
msh.MeshId = 'rbxassetid://8603513099'
msh.Scale = Vector3.new(.1, .1, .1)
local at0 = Instance.new("Attachment" , suzanne)
at0.Position = Vector3.new(1.5, 0, 0)
local at1 = Instance.new("Attachment", suzanne)
at1.Position = Vector3.new(-1.5, 0, 0)
local trl = Instance.new("Trail" , suzanne)
trl.Attachment0 = at0
trl.Attachment1 = at1
trl.Lifetime = .5
trl.WidthScale = NumberSequence.new(1, 0)
trl.Color = ColorSequence.new(suzanne.Color)
local db = false
game:GetService("Debris"):AddItem(suzanne, 2.05)
suzanne.Touched:Connect(function(hit)
if hit:FindFirstAncestorOfClass("Model") and hit:FindFirstAncestorOfClass("Model") ~= owner.Character and hit:FindFirstAncestorOfClass("Model"):FindFirstChildOfClass("Humanoid") and db == false then
db = true
hit:FindFirstAncestorOfClass("Model"):FindFirstChildOfClass("Humanoid").Health = 
hit:FindFirstAncestorOfClass("Model"):FindFirstChildOfClass("Humanoid").Health -hit:FindFirstAncestorOfClass("Model"):FindFirstChildOfClass("Humanoid").MaxHealth/10
end
end)
end
end)
local con
local guy
local speed = .25
re2.OnServerEvent:Connect(function(plr, key, target)
if key == 'r' then
guy = target
guy.Anchored = true
con = game:GetService("RunService").Heartbeat:Connect(function()
pcall(function()
guy.CFrame = ccf * CFrame.new(0,0,-10) * CFrame.Angles(0,math.rad(180),0)
end)
end)
elseif key == 'z' then
guy.Anchored = false
if con then con:Disconnect() end
elseif key == 'f' then
suzanne.Transparency = 0
game:GetService("TweenService"):Create(suzanne, TweenInfo.new(speed), {Size = Vector3.new(9, 8, 3)}):Play()
game:GetService("TweenService"):Create(msh, TweenInfo.new(speed), {Scale = Vector3.new(.3, .2, .1)}):Play()
real.Parent = suzanne
real.Parent = nil
elseif key == 'y' then
game:GetService("TweenService"):Create(suzanne, TweenInfo.new(speed), {Size = Vector3.new()}):Play()
game:GetService("TweenService"):Create(msh, TweenInfo.new(speed), {Scale = Vector3.new(0, .2, .1)}):Play()
task.wait(1)
suzanne.Transparency = 1
end
end)
NLS([[
local re2 = owner.PlayerGui.KeyDownEvent
local re = owner.PlayerGui.HideEvent
local m = owner:GetMouse()
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local pelting = false
local camera = workspace.CurrentCamera
local thing = "Normal"
camera.CameraType = Enum.CameraType.Scriptable
local grabbing = false
local deb = false
local barrierupdaze = false
m.KeyDown:Connect(function(k)
pcall(function()
if k == 'r' and grabbing == false and m.Target ~= workspace.Base then
grabbing = true
re2:FireServer('r', m.Target)
elseif k == 'r' and grabbing == true then
grabbing = false
re2:FireServer('z', m.Target)
elseif k == 'f' and barrierupdaze == false and deb == false then
deb = true
barrierupdaze = true
task.wait(.35)
deb = false
re2:FireServer('f', m.Hit)
elseif k == 'f' and barrierupdaze == true and deb == false then
deb = true
barrierupdaze = false
re2:FireServer('y', m.Hit)
task.wait(.35)
deb = false
end
end)
end)
local x = 0
local y = 0
local angle = Instance.new("CFrameValue")
local position = camera.CFrame.p

local nVec = {
	[Enum.KeyCode.A] = Vector3.new(-1, 0, 0),
	[Enum.KeyCode.D] = Vector3.new(1, 0, 0),
	[Enum.KeyCode.S] = Vector3.new(0, 0, 1),
	[Enum.KeyCode.W] = Vector3.new(0, 0, -1),
	[Enum.KeyCode.Q] = Vector3.new(0, -1, 0),
	[Enum.KeyCode.E] = Vector3.new(0, 1, 0)
}

local Vec = {}

local speed = 1.25

UISTable = {}

function UISTable.InputBegan(input)
	if nVec[input.KeyCode] then
		Vec[input.KeyCode] = nVec[input.KeyCode]
	elseif input.UserInputType == Enum.UserInputType.MouseButton2 then
		UserInputService.MouseBehavior = Enum.MouseBehavior.LockCurrentPosition
	elseif input.KeyCode == Enum.KeyCode.LeftShift then
		speed = 0.25
	elseif input.KeyCode == Enum.KeyCode.T then
	pelting = true
	end
end

function UISTable.InputChanged(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		x = (x - math.rad(input.Delta.X))%(2*math.pi)
		y = math.clamp(y - math.rad(input.Delta.Y), math.rad(-89), math.rad(89))
		TweenService:Create(
			angle,
			TweenInfo.new(
				0.1,
				Enum.EasingStyle.Quad,
				Enum.EasingDirection.Out,
				0,
				false,
				0
			),
			{Value = CFrame.Angles(0, x, 0) * CFrame.Angles(y, 0, 0)}
		):Play()
	elseif input.UserInputType == Enum.UserInputType.MouseWheel then
		position = position + angle.Value * Vector3.new(0, 0, 5*input.Position.Z)
	end
end

function UISTable.InputEnded(input)
	if nVec[input.KeyCode] then
		Vec[input.KeyCode] = nil
	elseif input.UserInputType == Enum.UserInputType.MouseButton2 then
		UserInputService.MouseBehavior = Enum.MouseBehavior.Default
	elseif input.KeyCode == Enum.KeyCode.LeftShift then
		speed = 1.25
	elseif input.KeyCode == Enum.KeyCode.T then
	pelting = false
	end
end

for k, fn in pairs(UISTable) do
	UserInputService[k]:Connect(fn)
end
local function DefaultCam(dt)
	local move = Vector3.new()
	for _, v in pairs(Vec) do
		move = move + v
	end
	camera.CFrame = angle.Value + position
	position = position + angle.Value * (move * speed)
end
RunService.RenderStepped:Connect(function(dt)
DefaultCam(dt)
re:FireServer(camera.CFrame, pelting, thing)
end)
]], re)
while task.wait() do
owner.Character = nil
end
