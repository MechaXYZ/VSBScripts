local function getplr(n)
	local plr
    for i,v in pairs(game.Players:GetPlayers()) do 
		if v.DisplayName:lower():sub(1, #n) == n:lower() then
    		plr = v
			break
    	end
    end
	return plr
end
local function readonly(tab)
	local userdata = newproxy(true)
	local metatable = getmetatable(userdata)
	metatable.__index = tab
	metatable.__metatable = userdata
	return userdata
end
local function add(plr)
	local dname = string.lower(plr.DisplayName)
		_G[dname] = readonly({
			name = plr.Name,
			splode = function()
				getplr(dname):Explode()
			end,
			sit = function()
				local char = getplr(dname).Character or getplr(dname).CharacterAdded:Wait()
				char:WaitForChild("Humanoid").Sit = true
			end,
			jump = function()
				local char = getplr(dname) or getplr(dname).CharacterAdded:Wait()
				char:WaitForChild("Humanoid").Jump = true
			end,
			chat = function(msg)
				local char = getplr(dname) or getplr(dname).CharacterAdded:Wait()
				game:GetService("Chat"):Chat(char:WaitForChild("Head"), msg)
			end
		})
end
for _, v in pairs(game:GetService("Players"):GetPlayers()) do
	add(v)
end
game:GetService("Players").PlayerAdded:Connect(add)
