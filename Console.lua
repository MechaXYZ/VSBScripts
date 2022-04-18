print([[
c/ (code) to run a script
x/ (code) to run a local script
]])
local Hand = "Left"
local TweenService = game:GetService("TweenService")
local Info = TweenInfo.new(.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
local RunService = game:GetService("RunService")
local Character = owner.Character
local Torso = Character.Torso
local Neck = Torso.Neck
local OldNeckC0 = Neck.C0
local OldNeckC1 = Neck.C1
local RightArm = Character["Right Arm"]
local LeftArm = Character["Left Arm"]
local RightShoulder = Instance.new("Weld", Torso)
RightShoulder.Part0 = Torso
RightShoulder.Part1 = RightArm
local LeftShoulder = Instance.new("Weld", Torso)
LeftShoulder.Part0 = Torso
LeftShoulder.Part1 = LeftArm
RightShoulder.C1 = CFrame.new(-0.5, 0.5, 0)
LeftShoulder.C1 = CFrame.new(0.5, 0.5, 0)
RightShoulder.Enabled = false
LeftShoulder.Enabled = false
local function Smooth(Part)
	Part.TopSurface = Enum.SurfaceType.SmoothNoOutlines
	Part.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
	Part.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
	Part.RightSurface = Enum.SurfaceType.SmoothNoOutlines
	Part.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
	Part.BackSurface = Enum.SurfaceType.SmoothNoOutlines
end

local Keyboard = Instance.new("SpawnLocation")
Keyboard.BrickColor = BrickColor.new("Really black")
Keyboard.Material = Enum.Material.Neon
--Keyboard.Transparency = .1
Keyboard.Size = Vector3.new(5, 0, 2)
Keyboard.CanCollide = false
Keyboard.Enabled = false
Keyboard.Locked = true
Smooth(Keyboard)
local KeyboardWeld = Instance.new("Weld")
KeyboardWeld.Part0 = Torso
KeyboardWeld.Part1 = Keyboard
KeyboardWeld.C0 = CFrame.new(0, 0, -2) * CFrame.Angles(.25, 0, 0)
KeyboardWeld.Parent = Keyboard
Keyboard.Parent = Character
local Light = Instance.new("PointLight")
Light.Brightness = 1.5
Light.Range = 12
Light.Parent = Keyboard
local Screen = Instance.new("SpawnLocation")
Screen.BrickColor = BrickColor.new("Really black")
Screen.Material = Enum.Material.Neon
--Screen.Transparency = 0.3
Screen.Massless = true
Screen.Name = "Screen"
Screen.Size = Vector3.new(10, 5, 0)
Screen.CanCollide = false
Screen.Enabled = false
Screen.Locked = true
Smooth(Screen)
local ScreenWeld = Instance.new("Weld")
ScreenWeld.Part0 = Torso
ScreenWeld.Part1 = Screen
ScreenWeld.C0 = CFrame.new(0, 3.5, -4.5) * CFrame.Angles(.1, 0, 0)
local Gui = Instance.new("SurfaceGui")
Gui.Face = "Back"
Gui.Adornee = Screen
Gui.ClipsDescendants = true
--Gui.AlwaysOnTop = true
Gui.Parent = Screen
Gui.ZOffset = 50
Gui.Brightness = 150
local Text = Instance.new("TextBox")
Text.BackgroundTransparency = 1
Text.Position = UDim2.new(0, 0, 0, 0)
Text.Size = UDim2.new(.95, 0, .95, 0)
Text.TextColor3 = Color3.new(1, 1, 1)
Text.Font = Enum.Font.Code
Text.MultiLine = true
Text.RichText = true
Text.TextEditable = false
Text.TextWrapped = true
Text.TextSize = 23
Text.TextXAlignment = Enum.TextXAlignment.Left
Text.TextYAlignment = Enum.TextYAlignment.Top
Text.Text = ""
Text.Parent = Gui
ScreenWeld.Parent = Screen
Screen.Parent = Character
local TypeSound = Instance.new("Sound")
TypeSound.SoundId = "rbxassetid://265970978"
TypeSound.PlaybackSpeed = 1.15
TypeSound.Volume = .5
TypeSound.Parent = Keyboard
TypeSound.EmitterSize = 10
TypeSound.PlayOnRemove = true
--TypeSound.Looped = true
--TypeSound:Play()
local longparagraph = [[
🚨 STOP! 🚨 YES, STOP RIGHT NOW! GIVE ME YOUR ⚠️ ATTENTION ⚠️FOR 50 SECONDS ⏱️ and I will show you how you can get unlimited Robux 💵 on Roblox. Yes, you can generate UNLIMITED Robux 💵right now! All you would need to do is click the link 🔗 below ⬇️to open the generator. After that, you will need to fill in your username, and select the Robux! Then, you are ready to go ✅! This will ONLY work today 📅. Yes, ONLY today. So, if you want to generate an unlimited amount of Robux 💵, click the link 🔗below ⬇️right now. This process will ONLY take one minute of your time, and will give you unlimited Robux 💵without ANY risk ⛔. Click the link 🔗below ⬇️right now, and enjoy it! The instructions will be on the link 🔗below ⬇️. Click on it RIGHT now ⏲️. Goodbye!
Wanna know how to get 99999999 robux! WARNING: THIS IS NOT A SCAM THIS IS NOT A SCAM! 1. Copy and paste this comment on only 2 games 2. Press F5 3. Logout and login 4. Look at your robux You have 9k
guess 🤔 what guys 🤯 never ❌ever ❗ restart 📴 your phone 🤳 or whatever electronics 💻 you are using 🤷‍♀️ bc you'll restart 😱 everything 😢 Check out RBX.COM 💹 to claim 👉 your free 🤑 prize 😭😭 oh okay 😐 btw I'm a real person 🙆‍♂️ not ❌ a bot 🤖🤖 my name 😤 is jimmy🙂

]]
local Symbols = {
["Tab"] = "	",
["Hash"] = "#",
["Space"] = " ",
["Dollar"] = "$",
["QuotedDouble"] = '"',
["Percent"] = "%",
["Ampersand"] = "&",
["Quote"] = "'", 
["LeftParenthesis"] = "(",
["RightParenthesis"] = ")",
["Asterisk"] = "*",
["Plus"] = "+",
["Minus"] = "-",
["Comma"] = [[,]],
["Slash"] = "/",
["One"] = "1",
["Two"] = "2",
["Three"] = "3",
["Four"] = "4",
["Five"] = "5",
["Six"] = "6",
["Seven"] = "7",
["Eight"] = "8",
["Nine"] = "9",
["Zero"] = "0",
["Colon"] = ":",
["Semicolon"] = ";",
["LessThan"] = "<",
["GreaterThan"] = ">",
["Equals"] = "=",
["Question"] = "?",
["At"] = "@",
["LeftBracket"] = "{",
["RightBracket"] = "}",
["BackSlash"] = [[\]],
["Caret"] = "^",
["Underscore"] = "_",
["Backquote"] = "`",
["Return"] = [[

]]
}
local GUI = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextButton = Instance.new("TextButton")
local TextButton2 = Instance.new("TextButton")
local TextBox = Instance.new("TextBox")
GUI.Name = "TextGUI"
GUI.Parent = owner.PlayerGui
Frame.Parent = GUI
Frame.BackgroundColor3 = BrickColor.new("Really black").Color
Frame.Position = UDim2.new(1, -187, 1, -116)
Frame.AnchorPoint = Vector2.new(.5, .5)
Frame.Size = UDim2.new(0, 300, 0, 150)
Frame.Active = true
Frame.BorderColor3 = Color3.new(1, 1, 1)
Frame.BorderSizePixel = 2
Frame.Draggable = true
TextBox.RichText = true
TextBox.Parent = Frame
TextBox.BackgroundTransparency = 1
TextBox.TextStrokeTransparency = 0
TextBox.TextStrokeColor3 = Color3.new(.7, .7, .7)
TextBox.TextColor3 = Color3.new(1, 1, 1)
TextBox.Position = UDim2.new(0, 50, 0, 20)
TextBox.Size = UDim2.new(0, 200, 0, 30)
TextBox.Font = Enum.Font.Code
TextBox.Text = "Insert Text Here"
TextBox.TextSize = 30
TextBox.TextScaled = true
TextBox.TextWrapped = true
TextButton.Parent = Frame
TextButton.BackgroundTransparency = 1
TextButton.TextStrokeTransparency = 0
TextButton.TextStrokeColor3 = Color3.new(.7, .7, .7)
TextButton.TextColor3 = Color3.new(1, 1, 1)
TextButton.Position = UDim2.new(0, 25, 0, 90)
TextButton.Size = UDim2.new(0, 100, 0, 50)
TextButton.Font = Enum.Font.Code
TextButton.TextSize = 30
TextButton.Text = "Run"
TextButton.Name = "RunText"
TextButton2.Parent = Frame
TextButton2.Name = "ClearText"
TextButton2.BackgroundTransparency = 1
TextButton2.TextStrokeTransparency = 0
TextButton2.TextStrokeColor3 = Color3.new(.7, .7, .7)
TextButton2.TextColor3 = Color3.new(1, 1, 1)
TextButton2.Position = UDim2.new(0, 175, 0, 90)
TextButton2.Size = UDim2.new(0, 100, 0, 50)
TextButton2.Font = Enum.Font.Code
TextButton2.Text = "Clear"
TextButton2.TextSize = 30
local Value = Instance.new("ObjectValue")
Value.Parent = owner.Character
Value.Value = Screen
Value.Name = "ScreenValue"
local Value = Instance.new("ObjectValue")
Value.Parent = owner.Character
Value.Value = GUI
Value.Name = "TextValue"
local Remote = Instance.new("RemoteEvent", Value)
Remote.Name = "TypeEvent"
local Remote2 = Instance.new("RemoteEvent", Value)
Remote2.Name = "RunTextEvent"
local Typing = false
Remote.OnServerEvent:Connect(function(plr, txt, type)
if type == true then
Typing = true
RightShoulder.Enabled = true
LeftShoulder.Enabled = true
RightShoulder.C0 = owner.Character.Torso["Right Shoulder"].C0
--RightShoulder.C1 = owner.Character.Torso["Right Shoulder"].C1
LeftShoulder.C0 = owner.Character.Torso["Left Shoulder"].C0
--LeftShoulder.C1 = owner.Character.Torso["Left Shoulder"].C1
local Sine = math.sin(tick() * 8)/8
	TweenService:Create(Neck, TweenInfo.new(0), {C0 = CFrame.new(0, 1, 0) * CFrame.Angles(0.2 + Sine / 4, (math.random() - 0.5) / 2, 0)}):Play()
	TweenService:Create(Neck, TweenInfo.new(0), {C1 = CFrame.new(0, -.5, 0)}):Play()
	TweenService:Create(RightShoulder, TweenInfo.new(0), {C0 = CFrame.new(1, 0.6 + math.random() / 4, -math.random() * 0.7)
			* CFrame.Angles(1.5 + Sine * math.random(), -Sine / 4, -(0.5 + 2 * Sine * math.random()))}):Play()

		TweenService:Create(LeftShoulder, TweenInfo.new(0), {C0 = CFrame.new(-1, 0.6 + math.random() / 4, -math.random() * 0.7)
			* CFrame.Angles(1.5 - Sine * math.random(), Sine / 4, 0.5 + 2 * Sine * math.random())}):Play()
elseif type == false then
Typing = false
RightShoulder.Enabled = false
LeftShoulder.Enabled = false
for i = 1, 5 do
Neck.C0 = OldNeckC0
Neck.C1 = OldNeckC1
end
end
if type == nil then
Text.Text = txt
TypeSound.Pitch = .5 + math.random() / 5
TypeSound.Parent = Keyboard
TypeSound.Parent = nil
if Typing == true then
if Hand == "Left" and Typing == true then
Hand = "Right"
local Sine = math.sin(tick() * 8)/8
	TweenService:Create(Neck, Info, {C0 = CFrame.new(0, 1, 0) * CFrame.Angles(0.2 + Sine / 4, (math.random() - 0.5) / 2, 0)}):Play()
		
		TweenService:Create(LeftShoulder, Info, {C0 = CFrame.new(-1, 0.6 + math.random() / 4, -math.random() * 0.7)
			* CFrame.Angles(1.5 - Sine * math.random(), Sine / 4, 0.5 + 2 * Sine * math.random())}):Play()
elseif Hand == "Right" and Typing == true then
Hand = "Left"
local Sine = math.sin(tick() * 8)/8
	TweenService:Create(Neck, Info, {C0 = CFrame.new(0, 1, 0) * CFrame.Angles(0.2 + Sine / 4, (math.random() - 0.5) / 2, 0)}):Play()

TweenService:Create(RightShoulder, Info, {C0 = CFrame.new(1, 0.6 + math.random() / 4, -math.random() * 0.7)
			* CFrame.Angles(1.5 + Sine * math.random(), -Sine / 4, -(0.5 + 2 * Sine * math.random()))}):Play()
end
end
end
end)
Remote2.OnServerEvent:Connect(function(plr, txt)
if string.lower(string.sub(txt, 1, 2)) == 'c/' then
loadstring(string.sub(txt, 3, #txt))()
elseif string.lower(string.sub(txt, 1, 2)) == 'x/' then
NLS(string.sub(txt, 3, #txt), owner.PlayerGui)
end
end)
NLS([[
local UDim2_new = UDim2.new
local UserInputService = game:GetService("UserInputService")
local DraggableObject       = {}
DraggableObject.__index     = DraggableObject
-- Sets up a new draggable object
function DraggableObject.new(Object)
    local self          = {}
    self.Object         = Object
    self.DragStarted    = nil
    self.DragEnded      = nil
    self.Dragged        = nil
    self.Dragging       = false
    
    setmetatable(self, DraggableObject)
    
    return self
end
 
-- Enables dragging
function DraggableObject:Enable()
    local object            = self.Object
    local dragInput         = nil
    local dragStart         = nil
    local startPos          = nil
    local preparingToDrag   = false
    
    -- Updates the element
    local function update(input)
        local delta         = input.Position - dragStart
        local newPosition   = UDim2_new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        object.Position     = newPosition
    
        return newPosition
    end
    
    self.InputBegan = object.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            preparingToDrag = true
            
            
            local connection 
            connection = input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End and (self.Dragging or preparingToDrag) then
                    self.Dragging = false
                    connection:Disconnect()
                    
                    if self.DragEnded and not preparingToDrag then
                        self.DragEnded()
                    end
                    
                    preparingToDrag = false
                end
            end)
        end
    end)
    
    self.InputChanged = object.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    
    self.InputChanged2 = UserInputService.InputChanged:Connect(function(input)
        if object.Parent == nil then
            self:Disable()
            return
        end
        
        if preparingToDrag then
            preparingToDrag = false
            
            if self.DragStarted then
                self.DragStarted()
            end
            
            self.Dragging   = true
            dragStart       = input.Position
            startPos        = object.Position
        end
        
        if input == dragInput and self.Dragging then
            local newPosition = update(input)
            
            if self.Dragged then
                self.Dragged(newPosition)
            end
        end
    end)
end
 
-- Disables dragging
function DraggableObject:Disable()
    self.InputBegan:Disconnect()
    self.InputChanged:Disconnect()
    self.InputChanged2:Disconnect()
    
    if self.Dragging then
        self.Dragging = false
        
        if self.DragEnded then
            self.DragEnded()
        end
    end
end
local Remote = script.Parent.TypeEvent
local Remote2 = script.Parent.RunTextEvent
local GUI = script.Parent.Value
local TextBox = GUI.Frame.TextBox
local TextButton = GUI.Frame.RunText
local TextButton2 = GUI.Frame.ClearText
local Screen = script.Parent.Parent.ScreenValue
local Drag = DraggableObject.new(GUI.Frame)
Drag:Enable()
TextBox.Text = ""
TextBox.PlaceholderText = "Insert Text"
owner.Chatted:Connect(function(Message)
if Message == "clear/" or Message == "clr/" then
TextBox.Text = ""
end
end)
TextBox.ClearTextOnFocus = false
TextBox.Focused:Connect(function()
Remote:FireServer("StartType", true)
end)
TextBox.FocusLost:Connect(function(EnterPressed)
if EnterPressed then
TextBox.Text ..= "\n"
TextBox:CaptureFocus()
else
Remote:FireServer("StopType", false)
end
end)
TextBox:GetPropertyChangedSignal("Text"):Connect(function()
Remote:FireServer(TextBox.Text)
end)
TextButton.MouseButton1Click:Connect(function()
Remote2:FireServer(TextBox.Text)
end)
TextButton2.MouseButton1Click:Connect(function()
TextBox.Text = ""
end)
]], Value)
coroutine.wrap(function()
for i = 1, #longparagraph do
Text.Text = string.sub(longparagraph, 1, i)
task.wait(1/50)
end
end)
--[[
RunService.Heartbeat:Connect(function()
if Typing == true then
	local Sine = math.sin(tick() * 8)/8
	RightShoulder.Enabled = true
	LeftShoulder.Enabled = true
	Neck.C0 = Neck.C0:Lerp(CFrame.new(0, 1, 0) * CFrame.Angles(0.2 + Sine / 4, (math.random() - 0.5) / 2, 0), 1 )
		Neck.C1 = CFrame.new(0, -0.5, 0)
		RightShoulder.C0 = RightShoulder.C0:Lerp(CFrame.new(1, 0.6 + math.random() / 4, -math.random() * 0.7)
			* CFrame.Angles(1.5 + Sine * math.random(), -Sine / 4, -(0.5 + 2 * Sine * math.random())), 1)
		
		LeftShoulder.C0 = LeftShoulder.C0:Lerp(CFrame.new(-1, 0.6 + math.random() / 4, -math.random() * 0.7)
			* CFrame.Angles(1.5 - Sine * math.random(), Sine / 4, 0.5 + 2 * Sine * math.random()), 1)
else
		RightShoulder.Enabled = false
			LeftShoulder.Enabled = false
				Neck.C0 = OldNeckC0
			Neck.C1 = OldNeckC1
end
end)
]]--
