local id = owner.UserId
owner.CharacterAppearanceId = 32065
local old = owner.Character.HumanoidRootPart.CFrame
owner:LoadCharacter()
owner.Character.HumanoidRootPart.CFrame = old
owner.Character.Humanoid:ApplyDescription(game:GetService("Players"):GetHumanoidDescriptionFromUserId(id))
task.wait()
owner.CharacterAppearanceId = id
