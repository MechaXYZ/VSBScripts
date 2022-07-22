local bingchilling = Instance.new("Tool", owner.Backpack)
bingchilling.Name = "bing chilling"
bingchilling.ToolTip = "you can't xi me"
bingchilling.Grip = CFrame.new(0, -1.15, .15)
local h = Instance.new("SpawnLocation", bingchilling)
h.Name = "Handle"
h.Size = Vector3.new(.175, 1, .17)/1
h.Enabled = false
local msh = Instance.new("SpecialMesh", h)
msh.MeshId = 'rbxassetid://4946455465'
msh.TextureId = 'rbxassetid://4946455560'
msh.Scale = Vector3.new(5, 5, 5)/1

local loop = Instance.new("Sound", h)
loop.SoundId = 'rbxassetid://8732248431'
loop.Volume = .75
loop.EmitterSize = 10
loop.Looped = true
local chilling = Instance.new("Sound", game:GetService("VRService"))
chilling.SoundId = 'rbxassetid://7027478787' -- 8420244684, 8274265658
chilling.Volume = 5
-- chilling.PlayOnRemove = true

local cd = false
local chat = game:GetService("Chat")
local function quote()
	local head = bingchilling.Parent:FindFirstChild("Head")
	if not head then return end
	task.wait(.5)
	chat:Chat(head, "Good morning China.")
	task.wait(1.35)
	chat:Chat(head, "Now I have Bing Chilling (🍦🥶).")
	task.wait(1)
	chat:Chat(head, "I like Bing Chilling (🍦🥶) very much,")
	task.wait(1.5)
	chat:Chat(head, "but")
	task.wait(1)
	chat:Chat(head, "Fast and Furious 9")
	task.wait(1.25)
	chat:Chat(head, "compared with Bing Chilling (🍦🥶) ...")
	task.wait(1.5)
	chat:Chat(head, "Fast and Furious... Fast and Furious 9")
	task.wait(2)
	chat:Chat(head, "is my favorite.")
	task.wait(2)
	chat:Chat(head, "So now it is time for music,")
	task.wait(3)
	chat:Chat(head, "ready?")
	task.wait(2)
	chat:Chat(head, "1... 2... 3...")
	task.wait(2)
	chat:Chat(head, "Two weeks later,")
	task.wait(2)
	chat:Chat(head, "Fast and Furious 9...")
	task.wait(3)
	chat:Chat(head, "Two weeks later,")
	task.wait(1.5)
	chat:Chat(head, "Fast and Furious 9...")
	task.wait(3.5)
	chat:Chat(head, "Two weeks later,")
	task.wait(2)
	chat:Chat(head, "Fast and Furious 9...")
	task.wait(2.5)
	chat:Chat(head, "Do not forget.")
	task.wait(1)
	chat:Chat(head, "Do not miss it.")
	task.wait(1.5)
	chat:Chat(head, "Go to the theater")
	task.wait(1.5)
	chat:Chat(head, "watch Fast and Furious 9,")
	task.wait(1.5)
	chat:Chat(head, "because (this is a) excellent movie.")
	task.wait(2)
	chat:Chat(head, "The action is great.")
	task.wait(2)
	chat:Chat(head, "The movie is almost the same as Bing Chilling (🍦🥶),")
	task.wait(2)
	chat:Chat(head, "goodbye.")
	task.wait(1.5)
	bingchilling.GripForward = Vector3.new(0, -.759, -.651)
	bingchilling.GripPos = Vector3.new(1.5, -.5, .3)
	bingchilling.GripRight = Vector3.new(1, 0, 0)
	bingchilling.GripUp = Vector3.new(0, .25, -.759)
	task.wait(1)
	bingchilling.GripForward = Vector3.new()
	bingchilling.GripPos = Vector3.new()
	bingchilling.GripRight = Vector3.new()
	bingchilling.GripUp = Vector3.new()
	bingchilling.Grip = CFrame.new(0, -1.15, .15)
end

bingchilling.Equipped:Connect(function()
	loop:Resume()
end)

bingchilling.Unequipped:Connect(function()
	loop:Pause()
end)

bingchilling.Activated:Connect(function()
	if cd == false then
		cd = true
		chilling.Parent = bingchilling.Parent.Head
		-- chilling.Parent = nil
		chilling:Play()
		quote()
		chilling.Ended:Wait()
		cd = false
	end
end)
repeat task.wait() chat.BubbleChatEnabled = true until chat.BubbleChatEnabled == true
for i = 1, 50 do
	chat.BubbleChatEnabled = true
end
