-- [[ SETUP ]] --

local Model0 = Instance.new("Model")
local Part1 = Instance.new("SpawnLocation")
local SpecialMesh2 = Instance.new("SpecialMesh")
local Part4 = Instance.new("SpawnLocation")
local Part5 = Instance.new("SpawnLocation")
local Part6 = Instance.new("SpawnLocation")
local Part7 = Instance.new("SpawnLocation")
local Part8 = Instance.new("SpawnLocation")
Part1.Enabled = false
Part4.Enabled = false
Part5.Enabled = false
Part6.Enabled = false
Part7.Enabled = false
Part8.Enabled = false
local Humanoid9 = Instance.new("Humanoid")
Model0.Name = "Carl"
Model0.Parent = script
Model0.PrimaryPart = Part4
Part1.Name = "Head"
Part1.Parent = Model0
Part1.Size = Vector3.new(2, 1, 1)
Part1.CanCollide = true
Part1.Color = Color3.fromRGB(204, 142, 105)
Part4.Name = "Torso"
Part4.Parent = Model0
Part4.Size = Vector3.new(2, 2, 1)
Part4.CanCollide = true
Part4.Color = Color3.fromRGB(106, 57, 9)
Part5.Name = "Left Arm"
Part5.Parent = Model0
Part5.Size = Vector3.new(1, 2, 1)
Part5.CanCollide = true
Part5.Color = Color3.fromRGB(204, 142, 105)
Part6.Name = "Right Arm"
Part6.Parent = Model0
Part6.Size = Vector3.new(1, 2, 1)
Part6.CanCollide = true
Part6.Color = Color3.fromRGB(204, 142, 105)
Part7.Name = "Left Leg"
Part7.Parent = Model0
Part7.Size = Vector3.new(1, 2, 1)
Part7.CanCollide = true
Part7.Color = Color3.fromRGB(204, 142, 105)
Part8.Name = "Right Leg"
Part8.Parent = Model0
Part8.Size = Vector3.new(1, 2, 1)
Part8.CanCollide = true
Part8.Color = Color3.fromRGB(204, 142, 105)
SpecialMesh2.Parent = Part1
SpecialMesh2.Scale = Vector3.new(1.25, 1.25, 1.25)
local rl = Part8
local ll = Part7
local ra = Part6
local la = Part5
local tors = Part4
local head = Part1
local nc = Instance.new("Motor6D" , tors)
nc.Name = 'Neck'
nc.Part0 = tors
nc.Part1 = head
nc.C0 = CFrame.new(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
nc.C1 = CFrame.new(0, -0.5, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
nc.MaxVelocity = 0.10000000149012
local rs = Instance.new("Motor6D" , tors)
rs.Name = 'Right Shoulder'
rs.Part0 = tors
rs.Part1 = ra
rs.C0 = CFrame.new(1, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
rs.C1 = CFrame.new(-0.5, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
rs.MaxVelocity = 0.15000000596046
local ls = Instance.new("Motor6D" , tors)
ls.Name = 'Left Shoulder'
ls.Part0 = tors
ls.Part1 = la
ls.C0 = CFrame.new(-1, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
ls.C1 = CFrame.new(0.5, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
ls.MaxVelocity = 0.15000000596046
local rh = Instance.new("Motor6D" , tors)
rh.Name = 'Right Hip'
rh.Part0 = tors
rh.Part1 = rl
rh.C0 = CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
rh.C1 = CFrame.new(0.5, 1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
rh.MaxVelocity = 0.10000000149012
local lh = Instance.new("Motor6D" , tors)
lh.Name = 'Left Hip'
lh.Part0 = tors
lh.Part1 = ll
lh.C0 = CFrame.new(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
lh.C1 = CFrame.new(-0.5, 1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
lh.MaxVelocity = 0.10000000149012
Humanoid9.Parent = Model0
Humanoid9.DisplayName = 'Carl the NPC'
Humanoid9.LeftLeg = ll
Humanoid9.RightLeg = rl
Humanoid9.Torso = Part4
local face = Instance.new("Texture", Model0.Head)
face.Texture = "rbxassetid://8560915"
face.StudsPerTileU = 100
face.StudsPerTileV = 100

-- [[ CHATBOT BY LUITRIXX ]] --

-- Services
local SS = game:GetService("ServerStorage")
local TS = game:GetService("TextService")

local HTTP = game:GetService("HttpService") 
NS(HTTP:GetAsync("https://raw.githubusercontent.com/MechaXYZ/VSBScripts/main/Old%20Roblox%20Animations.lua", true), Model0)

-- Functions
local function FetchResponse(q, Id)
    local res = ""
	local Request
	local Success, Err = pcall(function()
		Request = HTTP:RequestAsync(
			{
				Url = "https://api.luiboard.com/ai/v1/fetch?message=" .. tostring(q),
				Method = "GET",
				Headers = {
					["Content-Type"] = "application/json",
					["apikey"] = "l597-u609-ieaf-b6b5-ob73-ad24-r1b0-d196",
                    ["name"] = "Carl",
					["id"] = tostring(Id)
				},
			}
		)
	end)
	if not(Success)then
		res = "Sorry, something happened. Please ask me again."
	else
		local Pattern,PatternTable = "\\([ntr])", {n = "\n", t ="\t", r = " "}
		local Pattern2 = "([\"])"
		local FetchedResponse = HTTP:JSONDecode(Request.Body)
		local Response = string.gsub(FetchedResponse.Response:gsub(Pattern, PatternTable), "[\"\\]", "")
		local FilteredResponse = ""
		local success, err = pcall(function()
			-- FilteredResponse = TS:FilterStringAsync(Response, Id)
		end)
		if not success then
			res = "Sorry, I didn't get that. Could you say it again?"
		else
			res = Response
		end
	end
    return res
end

-- [[ CHAT ]] --

local function ChatEvent(plr)
    plr.Chatted:Connect(function(msg)
        -- print("a")
        if not Model0 or not Model0:FindFirstChild("Torso") or not Model0:FindFirstChild("Head") then
            return
        end
        if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and (plr.Character:FindFirstChild("HumanoidRootPart").Position - Model0.Torso.Position).Magnitude <= 15 then
            local resp = FetchResponse(msg:match("[%P]+"), plr.UserId)
            game:GetService("Chat"):Chat(Model0.Head, resp)
        end
    end)
end

table.foreach(game:GetService("Players"):GetPlayers(), function(i, v) ChatEvent(v) end) -- pretty noice

repeat
    task.wait()
    game:GetService("Chat").BubbleChatEnabled = true
until game:GetService("Chat").BubbleChatEnabled == true -- repeat loop because for some reason bubble chat doesn't work when you respawn
game:GetService("Players").PlayerAdded:Connect(ChatEvent)

-- [[ EOF ]] --