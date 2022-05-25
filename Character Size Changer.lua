local currentsize = 1
local function size(scl)
	local Percent = scl / currentsize
	local Player = owner    
	local Humanoid = Player.Character:FindFirstChildOfClass("Humanoid")
	for i, v in pairs(Player.Character:GetDescendants()) do
		if v:IsA("JointInstance") then
				v.C0 = CFrame.new((v.C0.Position * Percent)) * (v.C0 - v.C0.Position)
        v.C1 = CFrame.new((v.C1.Position * Percent)) * (v.C1 - v.C1.Position)
		elseif v:IsA("SpecialMesh") and v.Parent.Name ~= "Head" then
				v.Scale = v.Scale * Percent
 		elseif v:IsA("BasePart") then
        v.Size = v.Size * Percent   
    end
	end
end
print([[
Commands
R6 = R6 Only command
R15 = R15 Only command
;size (num) -- Sizes character (R6),
;width (num) -- Changes character's width. (R15),
;height (num) -- Changes character's height. (R15),
;depth (num) -- Changes character's depth. (R15),
;head (num) -- Changes character's head scale. (R15),
;sizer15 (num) -- Changes character's width, depth, height, and head scale. (R15)
]])
owner.Chatted:Connect(function(msg)
if string.lower(string.sub(msg,1,5)) == ";size" and string.lower(string.sub(msg,1,8)) ~= ";sizer15" then
		if owner.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then warn([[Only for R6 characters! Use ;width, ;height, ;head, ;depth, or ;sizer15 for R15 characters!]]) return end
		local scl = string.lower(string.sub(msg,7,100))
size(scl)
currentsize = scl
elseif string.lower(string.sub(msg,1,6)) == ";width" then
		if owner.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then warn([[Only for R15 characters! Use ;size for R6 characters!]]) return end
		local scl = string.lower(string.sub(msg,8,100))
owner.Character.Humanoid.BodyWidthScale.Value = scl
elseif string.lower(string.sub(msg,1,7)) == ";height" then
		if owner.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then warn([[Only for R15 characters! Use ;size for R6 characters!]]) return end
		local scl = string.lower(string.sub(msg,9,100))
owner.Character.Humanoid.BodyHeightScale.Value = scl
elseif string.lower(string.sub(msg,1,6)) == ";depth" then
		if owner.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then warn([[Only for R15 characters! Use ;size for R6 characters!]]) return end
		local scl = string.lower(string.sub(msg,8,100))
owner.Character.Humanoid.BodyDepthScale.Value = scl
elseif string.lower(string.sub(msg,1,5)) == ";head" then
		if owner.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then warn([[Only for R15 characters! Use ;size for R6 characters!]]) return end
		local scl = string.lower(string.sub(msg,7,100))
owner.Character.Humanoid.HeadScale.Value = scl
elseif string.lower(string.sub(msg,1,8)) == ";sizer15" then
		if owner.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then warn([[Only for R15 characters! Use ;size for R6 characters!]]) return end
		local scl = string.lower(string.sub(msg,10,100))
owner.Character.Humanoid.BodyWidthScale.Value = scl
owner.Character.Humanoid.BodyHeightScale.Value = scl
owner.Character.Humanoid.BodyDepthScale.Value = scl
owner.Character.Humanoid.HeadScale.Value = scl
end
end)
