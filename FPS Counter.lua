local naeeym2 = Instance.new("BillboardGui", owner.Character.Head)
naeeym2.Size = UDim2.new(0, 500, 0, 500)
naeeym2.StudsOffset = Vector3.new(0,1,0)
naeeym2.Name = "FPSBoard"
local tecks2 = Instance.new("TextBox",naeeym2)
tecks2.BackgroundTransparency = 1
tecks2.BorderSizePixel = 0
tecks2.Text = "a"
tecks2.Font = "Cartoon"
tecks2.RichText = true
tecks2.TextWrapped = true
tecks2.TextSize = 35
tecks2.TextStrokeTransparency = 0
tecks2.TextColor3 = Color3.new(1,1,1)
tecks2.TextStrokeColor3 = Color3.new()
tecks2.Size = UDim2.new(1,0,0.5,0)
local RunService = game:GetService("RunService")
local TimeFunction = RunService:IsRunning() and time or os.clock

local LastIteration, Start
local FrameUpdateTable = {}

local function HeartbeatUpdate()
pcall(function()
	LastIteration = TimeFunction()
	for Index = #FrameUpdateTable, 1, -1 do
		FrameUpdateTable[Index + 1] = FrameUpdateTable[Index] >= LastIteration - 1 and FrameUpdateTable[Index] or nil
	end
	FrameUpdateTable[1] = LastIteration
local fps = math.floor(TimeFunction() - Start >= 1 and #FrameUpdateTable or #FrameUpdateTable / (TimeFunction() - Start))
if fps < 20 then
tecks2.TextStrokeColor3 = Color3.new(.5, 0, 0)
tecks2.TextColor3 = Color3.new(.75, 0, 0)
elseif fps < 40 and fps > 20 then
tecks2.TextStrokeColor3 = Color3.new(1, .5, 0)
tecks2.TextColor3 = Color3.new(.75, .25, 0)
elseif fps > 50 then
tecks2.TextStrokeColor3 = Color3.new(0, .75, 0)
tecks2.TextColor3 = Color3.new(0, .55, 0)
end
tecks2.Text = fps.. " FPS"
end)
end
Start = TimeFunction()
RunService.Heartbeat:Connect(HeartbeatUpdate)
