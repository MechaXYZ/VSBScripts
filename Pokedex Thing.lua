local function floor(vec3)
return Vector3.new(math.floor(vec3.X),math.floor(vec3.Y),math.floor(vec3.Z))
end
local function normcf(cf)
return cf.p
end
local a = game:GetService("HttpService"):GetAsync("http://country.io/names.json")
local a2 = game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/citation-style-language/locales/master/locales.json")
local countries = game:GetService("HttpService"):JSONDecode(a)
local langs = game:GetService("HttpService"):JSONDecode(a2)

local console = Instance.new("SpawnLocation" , script)
console.Enabled = false
console.Size = Vector3.new(5,0,.2)
console.CanCollide = false
console.Anchored = true
console.Name = 'Console'
console.Material = 'SmoothPlastic'
console.BrickColor = BrickColor.Black()
console.Transparency = 1
local open = Instance.new("Sound" , owner.Character.Head)
open.SoundId = 'rbxassetid://491134771'
open.Volume = 1.5
workspace.DescendantRemoving:Connect(function(p)
if p:IsA("Sound") and p == open then
local aopen = Instance.new("Sound" , owner.Character.Head)
aopen.SoundId = 'rbxassetid://491134771'
aopen.Volume = 1.5
open = aopen
end
end)
local re = Instance.new("RemoteEvent" , owner.PlayerGui)
re.Name = 'TypeEvent'
local ga = Instance.new("SurfaceGui")
ga.Parent = console
ga.Adornee = console
ga.Face = 'Back'
ga.Name = 'GUI'
ga.Active = true
ga.CanvasSize = Vector2.new(775,775)
--ga.Brightness = 50
local ack = Instance.new("TextBox" , ga)
ack.BackgroundTransparency = 1
ack.Font = 'Code'
ack.TextSize = 50
ack.Text = ' '
ack.RichText = true
ack.TextScaled = true
ack.AnchorPoint = Vector2.new(.5,.5)
ack.Position = UDim2.new(.5,0,.5,0)
ack.Size = UDim2.new(0, 775, 0, 775)
ack.TextColor3 = Color3.new(1, 1, 1)
ack.MultiLine = true
coroutine.wrap(function()
while console ~= nil do
task.wait()
pcall(function()
console.CFrame = owner.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-5)
end)
end
end)()
local function iterPageItems(pages)
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
local function up(txt)
local str = string.sub(txt, 1, 3) 
str ..= string.upper(string.sub(txt, 4, 5))
return str
end
re.OnServerEvent:Connect(function(plr, targ, action)
if targ:IsA("Player") and action == "CheckPlayer" then
coroutine.wrap(function()
open:Play()
task.wait(.5)
open:Stop()
end)()
local rand = Random.new()
local rand1 = math.floor(rand:NextNumber(100, 999))
local rand2 =  math.floor(rand:NextNumber(100, 999))
local rand3 =  math.floor(rand:NextNumber(10, 99))
local rand35 =  math.floor(rand:NextNumber(10, 99))
game:GetService("TweenService"):Create(console, TweenInfo.new(.5), {Size = Vector3.new(5,5,.2)}):Play()
console.Transparency = .35
ack.TextTransparency = 0
local friendPages = game:GetService("Players"):GetFriendsAsync(targ.UserId)
local usernames = {}
for item, pageNo in iterPageItems(friendPages) do
table.insert(usernames, item.Username)
end
if #usernames == 0 then
table.insert(usernames, "has no friends and is depressed")
end
   local country = countries[game:GetService("LocalizationService"):GetCountryRegionForPlayerAsync(targ)]
local locale = targ.LocaleId
if #locale == 5 then
locale = up(locale)
end
local lang = langs["language-names"][locale][2]
local oslocale = game:GetService("LocalizationService").SystemLocaleId
if #locale == 5 then
oslocale = up(oslocale)
end
local oslang = langs["language-names"][oslocale][2]
local policyinf = game:GetService("PolicyService"):GetPolicyInfoForPlayerAsync(targ)
local age
local china
if #policyinf.AllowedExternalLinkReferences == 0 then
age = [[<font color="rgb(255, 0, 0)">Under 13</font>]]
else
age = [[<font color="rgb(0, 255, 0)">Over 13</font>]]
end
if tostring(policyinf.IsSubjectToChinaPolicies) == "true" then
china = [[<font color="rgb(255, 0, 0)">YES</font>]]
else
china = [[<font color="rgb(0, 255, 0)">false</font>]]
end
ack.Text = [[
Name: ]] ..targ.Name.. [[

Display Name: ]] ..targ.Character:FindFirstChildOfClass("Humanoid").DisplayName.. [[

Account Age: ]] ..targ.AccountAge.. [[ day(s),
]] ..math.floor(targ.AccountAge/7).. [[ week(s), ]]..math.floor(targ.AccountAge/30.417).. [[ month(s),
]] ..math.floor(targ.AccountAge/365).. [[ year(s)
IP Address:  ]] ..tostring(rand1).. [[.]] ..tostring(rand2).. [[.]] ..tostring(rand3).. [[.]] ..tostring(rand35).. [[

Age: ]] ..age.. [[

Country: ]] ..tostring(country).. [[

Account Language: ]] ..tostring(lang).. [[

Operating System Language: ]] ..tostring(oslang).. [[

Paid Random Items Restricted: ]] ..tostring(policyinf.ArePaidRandomItemsRestricted).. [[

Paid Item Trading Allowed: ]] ..tostring(policyinf.IsPaidItemTradingAllowed).. [[

UNDER CHINESE POLICIES!?!?: ]] ..china.. [[

Humanoid State: ]] ..targ.Character:FindFirstChildOfClass("Humanoid"):GetState().Name.. [[

No. of Children Instances: ]] ..tostring(#targ.Character:GetChildren()).. [[

No. of Descendant Instances: ]] ..tostring(#targ.Character:GetDescendants()).. [[

Health: ]] ..targ.Character:FindFirstChildOfClass("Humanoid").Health.. [[

User ID: ]] ..targ.UserId.. [[

Random Friend: ]] ..usernames[math.random(1,#usernames)].. [[

Rig Type: ]] ..targ.Character:FindFirstChildOfClass("Humanoid").RigType.Name.. [[

]]
elseif targ:IsA("BasePart") and action == "CheckPart" then
coroutine.wrap(function()
open:Play()
task.wait(.5)
open:Stop()
end)()
local r, g, b = tostring(math.floor(targ.Color.R*255)), tostring(math.floor(targ.Color.G*255)), tostring(math.floor(targ.Color.B*255))
local start = [[<font color="rgb(]]..r..[[,]]..g..[[,]]..b..[[)">]]
local bc = start..[[]]..tostring(targ.BrickColor)..[[</font>]]
local c = start..[[]]..r..[[, ]]..g..[[, ]]..b..[[</font>]]

game:GetService("TweenService"):Create(console, TweenInfo.new(.5), {Size = Vector3.new(5,5,.2)}):Play()
console.Transparency = .35
ack.TextTransparency = 0
ack.Text = [[
Name: ]] ..targ.Name.. [[

Class Name: ]]..targ.ClassName.. [[

Anchored: ]] ..tostring(targ.Anchored).. [[

Parent: ]] ..targ.Parent:GetFullName().. [[

CanCollide: ]] ..tostring(targ.CanCollide).. [[

CanTouch: ]] ..tostring(targ.CanTouch).. [[

CanQuery: ]] ..tostring(targ.CanQuery).. [[

Velocity: ]] ..tostring(floor(targ.Velocity)).. [[

Collision Group ID: ]] ..tostring(targ.CollisionGroupId).. [[

Center Of Mass: ]] ..tostring(floor(targ.CenterOfMass)).. [[

Brick Color: ]] ..bc.. [[

Color: ]] ..c.. [[

Material: ]] ..tostring(targ.Material).. [[

Transparency: ]] ..tostring(targ.Transparency).. [[

Position: ]] ..tostring(floor(targ.Position)).. [[

CFrame: ]] ..tostring(targ.CFrame).. [[

Orientation: ]] ..tostring(floor(targ.Orientation)).. [[

Rotation: ]] ..tostring(floor(targ.Rotation)).. [[

Massless: ]] ..tostring(targ.Massless).. [[

Mass: ]] ..tostring(math.floor(targ.Mass)).. [[

No. of Children Instances: ]] ..tostring(#targ:GetChildren()).. [[

No. of Descendants Instance: ]] ..tostring(#targ:GetDescendants()).. [[

]]
elseif targ:IsA("Model") and action == "CheckNPC" then
coroutine.wrap(function()
open:Play()
task.wait(.5)
open:Stop()
end)()
game:GetService("TweenService"):Create(console, TweenInfo.new(.5), {Size = Vector3.new(5,5,.2)}):Play()
console.Transparency = .35
ack.TextTransparency = 0
ack.Text = [[
Name: ]] ..targ.Name.. [[

Display Name: ]] ..targ:FindFirstChildOfClass("Humanoid").DisplayName.. [[

Parent: ]] ..targ.Parent:GetFullName().. [[

Humanoid State: ]] ..targ:FindFirstChildOfClass("Humanoid"):GetState().Name.. [[

Walk Speed: ]] ..tostring(targ:FindFirstChildOfClass("Humanoid").WalkSpeed).. [[

Jump Power: ]] ..tostring(targ:FindFirstChildOfClass("Humanoid").JumpPower).. [[

Primary Part: ]] ..tostring(targ.PrimaryPart).. [[

No. of Children Instances: ]] ..tostring(#targ:GetChildren()).. [[

No. of Descendant Instances: ]] ..tostring(#targ:GetDescendants()).. [[

]]
elseif action == "Close" then
coroutine.wrap(function()
open.TimePosition = .5
open:Play()
wait(.5)
open.TimePosition = 0
open:Stop()
end)()
game:GetService("TweenService"):Create(console, TweenInfo.new(.5), {Size = Vector3.new(5,0,.2)}):Play()
console.Transparency = .35
ack.TextTransparency = 1
wait(.5)
console.Transparency = 1
end
end)
NLS([[
local re = script.Parent
local m = owner:GetMouse()
local opened = false
m.KeyDown:Connect(function(k)
pcall(function()
if k == 'e' and m.Target and m.Target:FindFirstAncestorOfClass("Model") and game:GetService("Players"):GetPlayerFromCharacter(m.Target:FindFirstAncestorOfClass("Model")) and opened == false then
local target = game:GetService("Players"):GetPlayerFromCharacter(m.Target:FindFirstAncestorOfClass("Model"))
re:FireServer(target, "CheckPlayer")
opened = true
elseif k == 'e' and m.Target and m.Target.Name ~= "Base" and not m.Target.Parent:FindFirstChildOfClass("Humanoid")  and opened == false then
re:FireServer(m.Target, "CheckPart")
opened = true
elseif k == 'e' and m.Target and m.Target:FindFirstAncestorOfClass("Model") and m.Target:FindFirstAncestorOfClass("Model"):FindFirstChildOfClass("Humanoid") and not game:GetService("Players"):GetPlayerFromCharacter(m.Target:FindFirstAncestorOfClass("Model")) and opened == false then
opened = true
re:FireServer(m.Target:FindFirstAncestorOfClass("Model"), "CheckNPC")
elseif k == 'e' and opened == true then
opened = false
re:FireServer(owner, "Close")
end
end)
end)
m.KeyDown:Connect(function(k)
if k == 'f' and opened == false then
re:FireServer(owner, "CheckPlayer")
opened = true
elseif k == 'f' and opened == true then
opened = false
re:FireServer(owner, "Close")
end
end)
print("E on something to check its stats/info, F to do a self check.")
]], re)
