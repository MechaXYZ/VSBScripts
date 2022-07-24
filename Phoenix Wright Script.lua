-- [[ SETUP ]] --
print([[phoenix wright script by mechaxyz
	-- controls --
	e - desk slam
	z - objection
	x - hold it
	c - take that
	v - super objection (super meter must be full)
	b - combat mode toggle
	f - desk / normal mode]])
if owner.Character:WaitForChild("Humanoid").RigType == Enum.HumanoidRigType.R15 then -- // check if rigtype is r15 and change it to r6 since this script isn't for r15
	local id = owner.UserId
	owner.CharacterAppearanceId = 32065 -- // character appearance into an r6 user
	local old = owner.Character.HumanoidRootPart.CFrame -- // store the hrp cframe
	owner:LoadCharacter() -- // reload character
	owner.Character.HumanoidRootPart.CFrame = old -- // :LoadCharacter() makes you go back to spawn so set hrp cframe to old
	owner.Character.Humanoid:ApplyDescription(game:GetService("Players"):GetHumanoidDescriptionFromUserId(id)) -- // change appearance back to normal
	task.wait()
	owner.CharacterAppearanceId = id -- // change char appearance id back to normal
	print("You must be R6 to use this script! Automatically turned your RigType to R6.") -- // let them know
end
local re = Instance.new("RemoteEvent", owner.PlayerGui)
re.Name = "AceEvent"
local mult = .75 -- // 2.25
local deskmode = false
local cantoggle = true
local slamdb = false
local saydb = false
local combat = false
local canattack = true
local presentdb = false
local supermeter = 0
local maxsuper = 250
local oldws = owner.Character.Humanoid.WalkSpeed
local oldjp = owner.Character.Humanoid.JumpPower
local tw = game:GetService("TweenService")
local txtsv = game:GetService("TextService")
local blip = Instance.new("Sound", game:GetService("VRService"))
blip.SoundId = 'rbxassetid://131238032'
blip.Volume = .75
blip.PlayOnRemove = true
local slam = Instance.new("Sound", game:GetService("VRService"))
slam.SoundId = 'rbxassetid://131218412'
slam.Volume = 2
slam.PlayOnRemove = true
local deskgrind = Instance.new("Sound", game:GetService("VRService"))
deskgrind.SoundId = 'rbxassetid://1334583496'
deskgrind.Volume = 3
deskgrind.PlayOnRemove = true
local objection = Instance.new("Sound", game:GetService("VRService"))
objection.SoundId = 'rbxassetid://330859085'
objection.Volume = 1.5
objection.PlayOnRemove = true
local takethat = Instance.new("Sound", game:GetService("VRService"))
takethat.SoundId = 'rbxassetid://5838885932'
takethat.Volume = 1.5
takethat.PlayOnRemove = true
local holdit = Instance.new("Sound", game:GetService("VRService"))
holdit.SoundId = 'rbxassetid://5838886309'
holdit.Volume = 1.5
holdit.PlayOnRemove = true
local explode = Instance.new("Sound", game:GetService("VRService"))
explode.SoundId = 'rbxassetid://4418405082'
explode.Volume = 1.5
explode.PlayOnRemove = true
explode.EmitterSize = 15
local desk = Instance.new("SpawnLocation", nil) -- // parent it to nil because desk mode is disabled by default
desk.Enabled = false
desk.Material = "WoodPlanks"
desk.BrickColor = BrickColor.new("CGA brown")
desk.Size = Vector3.new(4.25, 3, 2)
desk.Anchored = true
desk.CanTouch = false
desk.CanQuery = false

local rs = owner.Character.Torso["Right Shoulder"]
local ls = owner.Character.Torso["Left Shoulder"]
local rh = owner.Character.Torso["Right Hip"]
local lh = owner.Character.Torso["Left Hip"]
local neck = owner.Character.Torso.Neck
local rj = owner.Character.HumanoidRootPart.RootJoint

local rsw = Instance.new("Weld", owner.Character)
rsw.Part0 = rs.Part0
rsw.Part1 = rs.Part1
rsw.C0 = rs.C0
rsw.C1 = rs.C1
rsw.Enabled = false
local lsw = Instance.new("Weld", owner.Character)
lsw.Part0 = ls.Part0
lsw.Part1 = ls.Part1
lsw.C0 = ls.C0
lsw.C1 = ls.C1
lsw.Enabled = false
local rhw = Instance.new("Weld", owner.Character)
rhw.Part0 = rh.Part0
rhw.Part1 = rh.Part1
rhw.C0 = rh.C0
rhw.C1 = rh.C1
rhw.Enabled = false
local lhw = Instance.new("Weld", owner.Character)
lhw.Part0 = lh.Part0
lhw.Part1 = lh.Part1
lhw.C0 = lh.C0
lhw.C1 = lh.C1
lhw.Enabled = false
local nw = Instance.new("Weld", owner.Character)
nw.Part0 = neck.Part0
nw.Part1 = neck.Part1
nw.C0 = neck.C0
nw.C1 = neck.C1
nw.Enabled = false
local rjw = Instance.new("Weld", owner.Character)
rjw.Part0 = rj.Part0
rjw.Part1 = rj.Part1
rjw.C0 = rj.C0
rjw.C1 = rj.C1
rjw.Enabled = false

local gui = Instance.new("ScreenGui" , owner.PlayerGui) -- // this is for the op super objection move
gui.Name = "Super Objection Bar"
local superbar = Instance.new("ImageLabel" , gui)
superbar.Size = UDim2.new(.185, 132, .02, 0)
superbar.SizeConstraint = "RelativeXY"
superbar.BackgroundTransparency = 0
superbar.BackgroundColor3 = Color3.new()
superbar.Position = UDim2.new(1, -250, 1, -75)
superbar.AnchorPoint = Vector2.new(.5, .5)
superbar.ZIndex = 1
local superbar2 = Instance.new("ImageLabel", superbar)
superbar2.BackgroundColor3 = Color3.new(0, 0, .75)
superbar2.BorderColor3 = Color3.new(0, 0, .35)
superbar2.BorderSizePixel = 2
superbar2.Size = UDim2.new(supermeter, 0, 1.21, 0)
superbar2.SizeConstraint = "RelativeXY"
superbar2.ClipsDescendants = true
superbar2.ZIndex = 1
superbar2.Position = UDim2.new(-.005, 0, -.09, 0)
local txt = Instance.new("TextLabel" , superbar)
txt.BackgroundTransparency = 1
txt.Text = "Super Objection"
txt.Font = "Arcade"
txt.TextStrokeTransparency = 0
txt.TextColor3 = Color3.new(1, 1, 1)
txt.TextStrokeColor3 = Color3.new()
txt.Size = UDim2.new(1, 0, .5, 0)
txt.AnchorPoint = Vector2.new(-.05, 0)
txt.Position = UDim2.new(0, 0, 0, -25)
txt.TextSize = 25

local says = { -- // this is a table for the later say and shout functions
	["objection"] = objection,
	["holdit"] = holdit,
	["takethat"] = takethat,
	["superobjection"] = objection
}
local images = { -- // this, too, is for the later say and shout functions
	["objection"] = 7310567079,
	["holdit"] = 7310574726,
	["takethat"] = 7310583060,
	["superobjection"] = 7310567079
}

-- [[ FUNCTIONS AND EVENTS ]] --

owner.CharacterAdded:Connect(function() -- // my script still works even after you die, except for the welds so make them again
	owner.Character:WaitForChild("Torso") -- // wait for torso since when CharacterAdded doesn't wait for the whole char to load
	
	rs = owner.Character.Torso["Right Shoulder"] -- // change the variables
	ls = owner.Character.Torso["Left Shoulder"]
	rh = owner.Character.Torso["Right Hip"]
	lh = owner.Character.Torso["Left Hip"]
	neck = owner.Character.Torso.Neck
	rj = owner.Character.HumanoidRootPart.RootJoint

	rsw = Instance.new("Weld", owner.Character)
	rsw.Part0 = rs.Part0
	rsw.Part1 = rs.Part1
	rsw.C0 = rs.C0
	rsw.C1 = rs.C1
	rsw.Enabled = false
	lsw = Instance.new("Weld", owner.Character)
	lsw.Part0 = ls.Part0
	lsw.Part1 = ls.Part1
	lsw.C0 = ls.C0
	lsw.C1 = ls.C1
	lsw.Enabled = false
	rhw = Instance.new("Weld", owner.Character)
	rhw.Part0 = rh.Part0
	rhw.Part1 = rh.Part1
	rhw.C0 = rh.C0
	rhw.C1 = rh.C1
	rhw.Enabled = false
	lhw = Instance.new("Weld", owner.Character)
	lhw.Part0 = lh.Part0
	lhw.Part1 = lh.Part1
	lhw.C0 = lh.C0
	lhw.C1 = lh.C1
	lhw.Enabled = false
	nw = Instance.new("Weld", owner.Character)
	nw.Part0 = neck.Part0
	nw.Part1 = neck.Part1
	nw.C0 = neck.C0
	nw.C1 = neck.C1
	nw.Enabled = false
	rjw = Instance.new("Weld", owner.Character)
	rjw.Part0 = rj.Part0
	rjw.Part1 = rj.Part1
	rjw.C0 = rj.C0
	rjw.C1 = rj.C1
	rjw.Enabled = false
end)

local function ipi(pages) -- // ipi stands for iterate page items, this is for getting a random friend for the super objection move.
	return coroutine.wrap(function()
		local pagenum = 1
		while true do
			for _, item in ipairs(pages:GetCurrentPage()) do
				coroutine.yield(item, pagenum)
			end
			if pages.IsFinished then
				break
			end
			pages:AdvanceToNextPageAsync()
			pagenum = pagenum + 1
		end
	end)
end

local function chat(text)
	 if owner.Character.Head:FindFirstChild("NameBox") then -- // check if there already is one name box
		 owner.Character.Head.NameBox:Destroy() -- // destroy it so it won't mix with the new one
	 end
    -- // name box, where the displayname is
    local name = Instance.new("BillboardGui", owner.Character.Head)
    name.StudsOffset = Vector3.new(-3.25, 6.58, 0)
    name.Size = UDim2.fromScale(5 * mult, 1.5 * mult)
    name.Adornee = owner.Character.Head
    name.Name = "NameBox"
    local nameframe = Instance.new("Frame", name)
    nameframe.BackgroundTransparency = .5
    nameframe.BackgroundColor3 = Color3.fromRGB(41, 42, 118)
    nameframe.Name = "NameFrame"
    nameframe.Size = UDim2.new(1, 0, 1, 0)
    center(nameframe) -- // the center function is in functions and events. if a function is global, it can be used BEFORE it's made. cool, right?
    local txt = Instance.new("TextBox", nameframe)
    txt.Text = owner.DisplayName
    txt.BackgroundTransparency = 1
    txt.Size = UDim2.new(.75, 0, .75, 0) -- // .75 because the text is too big at 1
    txt.Font = "Arcade" -- // couldn't use egomoose's custom font maker with wine so i'll use arcade
    txt.TextScaled = true
    txt.TextColor3 = Color3.new(1, 1, 1)
    center(txt)
    local round = Instance.new("UICorner", nameframe) -- // add rounded corners
    round.CornerRadius = UDim.new(0, 15)
    -- // the speech box, where the text is
    local speech = Instance.new("BillboardGui", name)
    speech.StudsOffset = Vector3.new(0, 4.5, 0)
    speech.Size = UDim2.fromScale(14 * mult, 4 * mult)
    speech.Adornee = owner.Character.Head
    speech.Name = "SpeechBox"
    local speechframe = Instance.new("Frame", speech)
    speechframe.BackgroundTransparency = .5
    speechframe.BackgroundColor3 = Color3.new() -- // leaving it blank is (0, 0, 0)
    speechframe.Name = "SpeechFrame"
    speechframe.Size = UDim2.new(1, 0, 1, 0)
    center(speechframe)
    local txt = Instance.new("TextBox", speechframe)
    txt.Text = ""
    txt.BackgroundTransparency = 1
    txt.Size = UDim2.new(.85, 0, .85, 0)
    txt.Font = "Arcade"
	 txt.TextXAlignment = Enum.TextXAlignment.Left
	 txt.TextYAlignment = Enum.TextYAlignment.Top
	 txt.TextWrapped = true
	 txt.TextSize = 15
    txt.TextColor3 = Color3.new(1, 1, 1)
    center(txt)
    local round = Instance.new("UICorner", speechframe)
    round.CornerRadius = UDim.new(0, 15)
	 for i = 1, #text do
        txt.Text = string.sub(text, 1, i)
        blip.Parent = owner.Character.Head
        blip.Parent = nil
        task.wait(.05)
    end
	 task.wait(1)
	 name:Destroy()
end

owner.Chatted:Connect(function(msg)
	if string.sub(msg, 1, 3) == "/e " then -- // check for /e messages because they aren't visible in chat
		-- // print("yes")
		return
	else
		coroutine.wrap(function()
			chat(msg)
		end)()
	end
	if msg == "/e free" then
		supermeter = maxsuper
	end
end)

function center(guiobj) -- // making a function to center stuff because i'm lazy
	guiobj.Position = UDim2.new(.5, 0, .5, 0)
	guiobj.AnchorPoint = Vector2.new(.5, .5)
end

local function findhum(p)
	if p:FindFirstAncestorOfClass("Model") then
		if p:FindFirstAncestorOfClass("Model"):FindFirstChildOfClass("Humanoid") then
			return p:FindFirstAncestorOfClass("Model"):FindFirstChildOfClass("Humanoid")
		else
			return false
		end
	else
		return false
	end
end

local function objectanim(t, t2, w)
	rsw.Enabled = true
	lsw.Enabled = true
	nw.Enabled = true
	rjw.Enabled = true
	tw:Create(lsw, TweenInfo.new(t), {C0 = ls.C0 * CFrame.new(0, -.5, .5) * CFrame.Angles(math.rad(-90), 0, 0)}):Play() -- // did you know phoenix actually objects with his LEFT hand?
	tw:Create(rsw, TweenInfo.new(t), {C0 = rs.C0 * CFrame.Angles(math.rad(-25), 0, 0)}):Play()
	tw:Create(rjw, TweenInfo.new(t), {C0 = rj.C0 * CFrame.Angles(0, 0, math.rad(-90))}):Play()
	tw:Create(nw, TweenInfo.new(t), {C0 = neck.C0 * CFrame.Angles(0, 0, math.rad(90))}):Play()
	task.wait(w)
	if deskmode == true then -- // check if desk mode is enabled before going back to normal
		tw:Create(rsw, TweenInfo.new(.05), {C0 = rs.C0 * CFrame.Angles(0, 0, math.rad(80))}):Play()
		tw:Create(lsw, TweenInfo.new(.05), {C0 = ls.C0 * CFrame.Angles(0, 0, math.rad(-80))}):Play()
	else
		tw:Create(lsw, TweenInfo.new(t2), {C0 = ls.C0}):Play()
		tw:Create(rsw, TweenInfo.new(t2), {C0 = rs.C0}):Play()
	end
	tw:Create(rjw, TweenInfo.new(t2), {C0 = rj.C0}):Play()
	tw:Create(nw, TweenInfo.new(t2), {C0 = neck.C0}):Play()
	task.wait(t2)
	nw.Enabled = false
	rjw.Enabled = false
	if deskmode == true then -- // check again
		rsw.Enabled = true
		lsw.Enabled = true
	else
		rsw.Enabled = false
		lsw.Enabled = false		
	end
end

local function present(offset)
	local pickedup = false
	local evidence = Instance.new("Tool", workspace)
	evidence.Name = "Evidence"
	evidence.ToolTip = "take that noob"
	evidence.Grip = CFrame.new(.25, -.35, -.15)
	local p = Instance.new("SpawnLocation")
	p.Name = "Handle"
	p.Enabled = false
	p.Size = Vector3.new(1, 1.5, .1)
	p.Color = Color3.new(1, 1, 1)
	p.CFrame = (owner.Character.HumanoidRootPart.CFrame * CFrame.new(0, .5, -3))
	if combat == true then
		p.Parent = script
		p.CFrame *= offset
		evidence:Destroy()
	else
		p.Parent = evidence
	end
	local bv = Instance.new("BodyVelocity", p)
	bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
	bv.Velocity = p.CFrame.lookVector * 50
	if combat == true then
		bv.Velocity = p.CFrame.lookVector * 125
	end
	local bg = Instance.new("BodyGyro", p)
	bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
	bg.CFrame = CFrame.new()
	local got = {}
	coroutine.wrap(function()
		while pickedup == false do
			task.wait()
			bg.CFrame *= CFrame.Angles(math.rad(8), 0, 0)
			if combat == false then
				pcall(function() -- // pcall because line 201 errors when you turn off combat mode and evidence is nil
					if evidence then
						if evidence.Parent:FindFirstChild("Humanoid") then
							pickedup = true
							bg:Destroy()
							bv:Destroy()
						end
					end
				end)
			elseif combat == true then
				for _, hit in pairs(workspace:GetPartBoundsInBox(p.CFrame, Vector3.new(2, 1.5, 2))) do
					if hit and hit:IsDescendantOf(owner.Character) == false and hit:IsDescendantOf(script) == false and not table.find(got, hit) then
						table.insert(got, hit)
						p.Massless = true
						local w = Instance.new("WeldConstraint", p) -- // weld the evidence to the hit part so it flies off with the part
						w.Part0 = p
						w.Part1 = hit
					end
				end
			end
		end
	end)()
end

local function ring(super)
	local db = false
	local p = Instance.new("SpawnLocation", script)
	p.Enabled = false
	p.Size = Vector3.new(1, .05, 1)
	p.Anchored = true
	p.CanCollide = false
	p.CanTouch = false
	p.Transparency = .25
	p.CFrame = owner.Character.HumanoidRootPart.CFrame * CFrame.new(0, -2.75, 0)
	local msh = Instance.new("SpecialMesh", p)
	msh.MeshId = 'rbxassetid://1058822174'
	msh.Scale = Vector3.new(.5, .05, .5)
	tw:Create(p, TweenInfo.new(.5), {Size = Vector3.new(25, .05, 25), Transparency = 1}):Play()
	tw:Create(msh, TweenInfo.new(.5), {Scale = Vector3.new(12.5, .05, 12.5)}):Play()
	coroutine.wrap(function()
		local got = {owner.Character.Humanoid}
		while db == false do
			task.wait()
			for _, hit in pairs(workspace:GetPartBoundsInBox(p.CFrame, p.Size * 1.05)) do
		 		if hit and findhum(hit) then
					if not table.find(got, findhum(hit)) then
						local hum = findhum(hit)
						local tors = hum.Parent:FindFirstChild("Torso") or hum.Parent:FindFirstChild("HumanoidRootPart")
						table.insert(got, hum)
						hum.PlatformStand = true
						tors.Velocity = (CFrame.new(hum.Parent.Head.Position, owner.Character.Torso.Position).lookVector * -35) + Vector3.new(0, 40, 0)
						hum.Health -=  15
						if super == false and hum.Health <= 0 then
							supermeter += 3
						end
						coroutine.wrap(function()
							task.wait(1.5)
							hum.PlatformStand = false
						end)()
					end
				end
			end
		end
	end)()
	task.wait(.505)
	db = true
	p:Destroy()
end

local function shout(what)
	-- // print(what)
	local db = false
	local p = Instance.new("SpawnLocation", script)
	p.Enabled = false
	p.Size = Vector3.new(7.5, 30, 7.5)
	p.Anchored = true
	p.CanCollide = false
	p.CanTouch = false
	p.Transparency = .25
	p.CFrame = (owner.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -7.5)) * CFrame.Angles(math.rad(90), 0, 0)
	local msh = Instance.new("SpecialMesh", p)
	msh.MeshId = 'rbxassetid://20329976'
	msh.Scale = Vector3.new(7.5, 15, 7.5)
	tw:Create(p, TweenInfo.new(.5), {CFrame = p.CFrame * CFrame.new(0, -25, 0), Transparency = 1}):Play()
	coroutine.wrap(function()
		local got = {owner.Character.Humanoid}
		while db == false do
			task.wait()
			for _, hit in pairs(workspace:GetPartBoundsInBox(p.CFrame, p.Size * 1.05)) do
		 		if hit and findhum(hit) then
					if not table.find(got, findhum(hit)) then
						local hum = findhum(hit)
						local tors = hum.Parent:FindFirstChild("Torso") or hum.Parent:FindFirstChild("HumanoidRootPart")
						table.insert(got, hum)
						if what == "objection" then
							hum.PlatformStand = true
							if deskmode == true then -- // buff all attacks when in deskmode since you're stuck and can't really aim
								tors.Velocity = p.CFrame.UpVector * -100
								hum.Health -= 50
								if hum.Health <= 0 then
									supermeter += 5
								end
							else
								tors.Velocity = p.CFrame.UpVector * -50
								hum.Health -= 25
								if hum.Health <= 0 then
									supermeter += 4
								end
							end
							coroutine.wrap(function()
								task.wait(1.5)
								hum.PlatformStand = false
							end)()
						elseif what == "holdit" then
							hum.Sit = true
							coroutine.wrap(function()
								if deskmode == true then
									if hum.Health <= 0 then
										supermeter += 2
									end
									task.wait(5)
								else
									if hum.Health <= 0 then
										supermeter += 1
									end
									task.wait(2.5)
								end
								hum.Sit = false
							end)()
							-- // return -- // debounce
						end
					end
				end
			end
		end
	end)()
	task.wait(.505)
	db = true
	p:Destroy()
end

local function giantshout()
	-- // print(what)
	local shouting = true
	local mult = 10
	local db = false
	local p = Instance.new("SpawnLocation", script)
	p.Enabled = false
	p.Size = Vector3.new(7.5, 30, 7.5) * mult
	p.Anchored = true
	p.CanCollide = false
	p.CanTouch = false
	p.Transparency = .25
	p.CFrame = (owner.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -(7.5 * mult))) * CFrame.Angles(math.rad(90), 0, 0)
	local msh = Instance.new("SpecialMesh", p)
	msh.MeshId = 'rbxassetid://20329976'
	msh.Scale = Vector3.new(7.5, 15, 7.5) * mult
	tw:Create(p, TweenInfo.new(3), {CFrame = p.CFrame * CFrame.new(0, -(25 * mult), 0), Transparency = 1}):Play()
	explode.Parent = p
	explode.Parent = nil
	coroutine.wrap(function()
		while shouting == true do
			task.wait(.25)
			ring(true)
		end
	end)()
	coroutine.wrap(function()
		local got = {owner.Character.Humanoid}
		while db == false do
			task.wait()
			for _, hit in pairs(workspace:GetPartBoundsInBox(p.CFrame, p.Size * 1.05)) do
		 		if hit and findhum(hit) then
					if not table.find(got, findhum(hit)) and hit:IsDescendantOf(script) == false and hit:IsDescendantOf(owner.Character) == false then
						local hum = findhum(hit)
						local tors = hum.Parent:FindFirstChild("Torso") or hum.Parent:FindFirstChild("HumanoidRootPart")
						table.insert(got, hum)
						hum.PlatformStand = true
						tors.Velocity = p.CFrame.UpVector * -500
						hit:BreakJoints()
					end
				elseif hit:IsA("BasePart") and not findhum(hit) and hit:IsDescendantOf(script) == false and hit.Name ~= "Base" and  hit:IsDescendantOf(owner.Character) == false then
					hit.Anchored = false
					hit:BreakJoints()
					hit.Velocity = p.CFrame.UpVector * -650
				end
			end
		end
	end)()
	task.wait(3.05)
	db = true
	p:Destroy()
	shouting = false
end

local function superobject()
	supermeter = 0 -- // reset the super meter, we can't have everyone spamming the op move can we?
	owner.Character.Humanoid.WalkSpeed = 0 -- // set ws and jp to 0 because this move is gonna be op
	owner.Character.Humanoid.JumpPower = 0
	local ph = game:GetService("PhysicsService")
	local name = "SuperObject " ..owner.DisplayName
	local name2 = "SuperObject2 " ..owner.DisplayName
	pcall(function()
		ph:CreateCollisionGroup(name)
		ph:CreateCollisionGroup(name2)
	end)
	local cg = ph:GetCollisionGroupId(name)
	local cg2 = ph:GetCollisionGroupId(name2)
	ph:CollisionGroupSetCollidable(name, name2, false)
	for i, v in pairs(owner.Character:GetDescendants()) do
		pcall(function()
			if v:IsA("BasePart") then
				ph:SetPartCollisionGroup(v, name)
			end
		end)
	end
	local objecting = true
	canattack = false
	local friends = game:GetService("Players"):GetFriendsAsync(owner.UserId) -- // get friendpages
	local ids = {}
	for i, v in ipi(friends) do
		table.insert(ids, i.Id) -- // insert id of each friend
	end
	if #ids == 0 then -- // if this guy has no friends (sad), then insert roblox because idk
		table.insert(usernames, 1)
	end
	local desc = game:GetService("Players"):GetHumanoidDescriptionFromUserId(ids[math.random(1, #ids)])
	local friend = game:GetService("Players"):CreateHumanoidModelFromDescription(desc, Enum.HumanoidRigType.R6)
	friend.HumanoidRootPart.Anchored = true
	friend.Parent = script
	-- // friend.Humanoid:Destroy() -- // destroy humanoid
	friend.HumanoidRootPart.CFrame = owner.Character.HumanoidRootPart.CFrame -- // * CFrame.new(-2, 0, 0)
	-- // Instance.new("AnimationController", friend) -- // add animationcontroller
	for _, v in pairs(friend:GetDescendants()) do
		if v:IsA("BasePart") then
			v.Material = "SmoothPlastic"
			v.Transparency = 1
			v.CanCollide = false -- // set cancollide to false
			v.CanTouch = false
			v.CanQuery = false
			ph:SetPartCollisionGroup(v, name2)
			if v.Name ~= "HumanoidRootPart" then -- // leave out the hrp since it's supposed to be invisible
				tw:Create(v, TweenInfo.new(1), {Transparency = .5}):Play()
			else
				tw:Create(v, TweenInfo.new(1), {CFrame = owner.Character.HumanoidRootPart.CFrame * CFrame.new(-2, 0, 0)}):Play()
			end
		end
	end
	for _, v in pairs(owner.Character:GetChildren()) do 
		if v:IsA("BasePart") and v.Name ~= 'HumanoidRootPart' then
			local fakepart = friend:FindFirstChild(v.Name)
			local w = Instance.new("Weld")
			w.Part0 = friend.HumanoidRootPart
			w.Part1 = fakepart
			w.Parent = fakepart
		end
	end
	coroutine.wrap(function()
		while objecting == true do
			pcall(function()
				task.wait()
				for _, v in pairs(owner.Character:GetChildren()) do
					coroutine.wrap(function()
						pcall(function() 
							if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
								local fakepart = friend:FindFirstChild(v.Name)
								local w = fakepart.Weld
								w.C0 = owner.Character.HumanoidRootPart.CFrame:Inverse() * v.CFrame
							end
						end)
					end)()
				end
			end)
		end
	end)()
	coroutine.wrap(function()
		objectanim(1, .5, 4)
	end)()
	task.wait(2)
	coroutine.wrap(giantshout)()
	task.wait(2)
	coroutine.wrap(function()
		for _, v in pairs(friend:GetDescendants()) do
			if v:IsA("BasePart") then
				if v.Name ~= "HumanoidRootPart" then
					tw:Create(v, TweenInfo.new(.5), {Transparency = 1}):Play()
				else
					tw:Create(v, TweenInfo.new(.5), {CFrame = owner.Character.HumanoidRootPart.CFrame}):Play()
				end
			end
		end
	end)()
	task.wait(.5)
	objecting = false
	canattack = true
	friend:Destroy()
	owner.Character.Humanoid.WalkSpeed = oldws
	owner.Character.Humanoid.JumpPower = oldjp
	says["superobjection"].Pitch = 1
end

local function say(what)
	if saydb == false then
		 if owner.Character.Head:FindFirstChild("SayGui") then
		 	 owner.Character.Head.SayGui:Destroy()
		 end
	    saydb = true
		 if what == "takethat" then
		 	if combat == true then
		 		coroutine.wrap(function() -- // make more evidence in combat mode since the evidence is small
					local min = -1.5
					local max = 1.5
					local amount = 4
					if deskmode == true then
						amount = 8
					end
					for i = 1, amount do
						local rnd = Random.new()
						present(CFrame.new(rnd:NextNumber(min, max), rnd:NextNumber(min/2, max/2), rnd:NextNumber(min, max)))
					end
				end)()
			else
				coroutine.wrap(present)()
			end
		 end
		 if combat == true and what ~= "superobjection" then
		 	coroutine.wrap(function()
				shout(what)
			end)()
		 end
		 coroutine.wrap(function()
		 	 if what ~= "superobjection" then
		 		 objectanim(.15, .25, .75)
			 else
			 	 says[what].Pitch = .5
			 end
		 end)()
	    says[what].Parent = owner.Character.Head
	    says[what].Parent = nil
	    local saygui = Instance.new("BillboardGui", owner.Character.Head)
	    saygui.Size = UDim2.new(1, 0, 1, 0)
	    saygui.StudsOffset = Vector3.new(0, 5.5, 0)
	    saygui.Adornee = owner.Character.Head
		 saygui.Name = "SayGui"
		 local fakeframe = Instance.new("Frame", saygui) -- // trying this so the gui wont enlarge
		 fakeframe.BorderSizePixel = 0
		 fakeframe.BackgroundTransparency = 1
		 fakeframe.Size = UDim2.new(10, 0, 7.5, 0)
		 center(fakeframe)
	    local img = Instance.new("ImageLabel", fakeframe)
	    img.Image = 'rbxassetid://' ..images[what]
	    img.Size = UDim2.new(1, 0, 1, 0)
		 img.BackgroundTransparency = 1
		 img.BorderSizePixel = 0
		 img.Name = "ObjectionImage"
		 center(img)
		 local min = -.5
		 local max = .5
		 local w = .015
		 if what == "superobjection" then
		 	 w = .07
		 end
	    for i = 1, math.random(10, 20) do
	    	local rnd = Random.new()
	    	saygui.StudsOffset = Vector3.new(rnd:NextNumber(min, max), 5 + rnd:NextNumber(min, max), 0)
	    	task.wait(w)
	    end
	    saygui.StudsOffset = Vector3.new(0, 5, 0)
		 coroutine.wrap(function()
		 	task.wait(.15)
			saydb = false
		 end)()
	    task.wait(.5)
	    saygui:Destroy()
	end
end
local function deskslam(intro)
	if deskmode == true and slamdb == false then
		slamdb = true
		if intro == false then
			tw:Create(rsw, TweenInfo.new(.1), {C0 = rs.C0 * CFrame.Angles(0, 0, math.rad(105))}):Play()
			tw:Create(lsw, TweenInfo.new(.1), {C0 = ls.C0 * CFrame.Angles(0, 0, math.rad(-105))}):Play()
			task.wait(.1)
		end
		tw:Create(rsw, TweenInfo.new(.05), {C0 = rs.C0 * CFrame.Angles(0, 0, math.rad(80))}):Play()
		tw:Create(lsw, TweenInfo.new(.05), {C0 = ls.C0 * CFrame.Angles(0, 0, math.rad(-80))}):Play()
		task.wait(.05)
		if combat == true then
			coroutine.wrap(function()
				ring(false)
			end)()
		end
		slam.Parent = owner.Character.Head
		slam.Parent = nil
		local cf = desk.CFrame
		local min = -.5
		local max = .5
		for i = 1, math.random(5, 15) do
			local rnd = Random.new()
			desk.CFrame = cf * CFrame.new(rnd:NextNumber(min, max), rnd:NextNumber(min, max), rnd:NextNumber(min, max))
			task.wait(.01)
		end
		desk.CFrame = cf
		task.wait(.05)
		slamdb = false
	end
end
local function desktoggle()
	if cantoggle == false then return end
	if deskmode == false then
		deskmode = true
		cantoggle = false
		canattack = false
		owner.Character.Humanoid.WalkSpeed = 0
		owner.Character.Humanoid.JumpPower = 0
		repeat task.wait() until owner.Character.Humanoid.FloorMaterial ~= "Air"
		task.wait()
		rsw.Enabled = true
		lsw.Enabled = true
		local z = -1.65
		local cf = owner.Character.HumanoidRootPart.CFrame
		owner.Character.HumanoidRootPart.Anchored = true
		deskgrind.Parent = owner.Character.Head
		deskgrind.Parent = nil
		desk.Parent = script
		desk.CFrame = cf * CFrame.new(0, -10, z)
		tw:Create(rsw, TweenInfo.new(1), {C0 = rs.C0 * CFrame.Angles(0, 0, math.rad(125))}):Play()
		tw:Create(lsw, TweenInfo.new(1), {C0 = ls.C0 * CFrame.Angles(0, 0, math.rad(-125))}):Play()
		local rise = tw:Create(desk, TweenInfo.new(1), {CFrame = cf * CFrame.new(0, -1.75, z)})
		rise:Play()
		rise.Completed:Wait()
		task.wait(.5)
		deskslam(true)
		task.wait(.25)
		cantoggle = true
		canattack = true
	elseif deskmode == true then
		deskmode = false
		cantoggle = false
		canattack = false
		local z = -1.65
		local cf = owner.Character.HumanoidRootPart.CFrame
		deskgrind.Parent = owner.Character.Head
		deskgrind.Parent = nil
		local rise = tw:Create(desk, TweenInfo.new(1), {CFrame = cf * CFrame.new(0, -10, z)})
		rise:Play()
		rise.Completed:Wait()
		desk.Parent = nil
		tw:Create(rsw, TweenInfo.new(.25), {C0 = rs.C0}):Play()
		tw:Create(lsw, TweenInfo.new(.25), {C0 = ls.C0}):Play()
		task.wait(.25)
		rsw.Enabled = false
		lsw.Enabled = false
		owner.Character.HumanoidRootPart.Anchored = false
		owner.Character.Humanoid.WalkSpeed = oldws
		owner.Character.Humanoid.JumpPower = oldjp
		canattack = true
		task.wait(.5)
		cantoggle = true
	end
end

re.OnServerEvent:Connect(function(plr, what)
	if what == "desktoggle" and canattack == true then
		desktoggle()
	elseif what == "deskslam" and canattack == true then
		deskslam(false)
	elseif what == "objection" and canattack == true then
		say("objection")
	elseif what == "holdit" and canattack == true then
		say("holdit")
	elseif what == "takethat" and canattack == true then
		say("takethat")
	elseif what == "combat" then
		if combat == true then
			combat = false
		elseif combat == false then
			combat = true
		end
		print("Combat mode: " ..tostring(combat))
	elseif what == "superobjection" and combat == true and supermeter == maxsuper and canattack == true then
		coroutine.wrap(superobject)()
		task.wait(1)
		say("superobjection")
	end
end)

coroutine.wrap(function()
	while task.wait() do
		supermeter = math.clamp(supermeter, 0, maxsuper) -- // clamp the super meter
		tw:Create(superbar2, TweenInfo.new(.25), {Size = UDim2.new(supermeter / maxsuper, 0, 1.21, 0)}):Play() -- // update the size
	end
end)()

-- [[ LOCALSCRIPT ]] --
NLS([[
local re = script.Parent
local m = owner:GetMouse()
m.KeyDown:Connect(function(k)
	if k == 'f' then
		re:FireServer("desktoggle")
	elseif k == 'e' then
		re:FireServer("deskslam")
	elseif k == 'z' then
		re:FireServer("objection")
	elseif k == 'x' then
		re:FireServer("holdit")
	elseif k == 'c' then
		re:FireServer("takethat")
	elseif k == 'v' then
		re:FireServer("superobjection")
	elseif k == 'b' then
		re:FireServer("combat")
	end
end)
]], re)
