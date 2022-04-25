local naeeym2 = Instance.new("BillboardGui",owner.Character.Head)
naeeym2.Size = UDim2.new(0, 500, 0, 500)
naeeym2.StudsOffset = Vector3.new(0,3,0)
naeeym2.Name = "ServerAgeGUI"
local tecks2 = Instance.new("TextBox",naeeym2)
tecks2.BackgroundTransparency = 1
tecks2.BorderSizePixel = 0
tecks2.TextSize = 35
tecks2.Font = "Bodoni"
tecks2.TextStrokeTransparency = 0
tecks2.TextColor3 = Color3.fromRGB(255,255,255)
tecks2.TextStrokeColor3 = Color3.fromRGB(0,0,0)
tecks2.Size = UDim2.new(1,0,0.5,0)
while task.wait() do
	pcall(function()
	local age = time()
    local seconds = math.floor(age)
    local minutes = math.floor(age / 60)
    local hours = math.floor(age / 60 / 60)
    local seconds = seconds - (minutes * 60)
    local minutes = minutes - (hours * 60)
    if hours < 1 then
        if minutes < 1 then
            tecks2.Text = "Server Age: " ..seconds.." second(s)"
        else
            tecks2.Text = "Server Age: " ..minutes.." minute(s), "..seconds.." second(s)"
        end
    else
        tecks2.Text = "Server Age: " ..hours.." hour(s), "..minutes.." minute(s), "..seconds.." second(s)"
    end
	end)
end
