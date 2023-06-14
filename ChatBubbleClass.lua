local font = "SourceSans"
local fontsize = "Size24"
local fsi = 24
local lh = fsi + 10
local th = 14
local wp = 30
local fs = 1.5

local mw = 400
local mh = 250
local e = "..."
local mcml = 128
local mcmle = mcml - string.len(e) - 1

local nbd = 65
local mbd = 100

local colors = {
    ["WHITE"] = "dub",
	["BLUE"] = "blu",
	["GREEN"] = "gre",
	["RED"] = "red" 
}

local function ll(msg, min, max)
	return min + (max - min) * math.min(string.len(msg) / 75, 1)
end

local function ccbm(f, sc)
	local cbm = Instance.new("ImageLabel")
	cbm.Name = "ChatBubble"
	cbm.ScaleType = "Slice"
	cbm.SliceCenter = sc
	cbm.Image = "rbxasset://textures/" .. tostring(f) .. ".png"
	cbm.BackgroundTransparency = 1
	cbm.BorderSizePixel = 0
	cbm.Size = UDim2.new(1, 0, 1, 0)
	cbm.Position = UDim2.new()

	return cbm
end

local function ccbt(p, s)
	local ccbt = Instance.new("ImageLabel")
	ccbt.Name = "ChatBubbleTail"
	ccbt.Image = "rbxasset://textures/ui/dialog_tail.png"
	ccbt.BackgroundTransparency = 1
	ccbt.BorderSizePixel = 0
	ccbt.Position = p
	ccbt.Size = s

	return ccbt
end

local function ccbwt(f, p, s, sc)
	local cbm = ccbm(f, sc)

	local cbt = ccbt(p, s)
	cbt.Parent = cbm

	return cbm
end

local function cscbwt(f, fss, p, sc)
	local cbm = ccbm(f, sc)

	local fr = Instance.new("Frame", cbm)
	fr.Name = "ChatBubbleTailFrame"
	fr.BackgroundTransparency = 1
	fr.SizeConstraint = "RelativeXX"
	fr.Position = UDim2.new(.5, 0, 1, 0)
	fr.Size = UDim2.new(fss, 0, fss, 0)

	local cbt = ccbt(p, UDim2.new(1, 0, .5, 0))
	cbt.Parent = frame

	return cbm
end

local function cci(f, d, y)
	local r = Instance.new("ImageLabel")
	r.Name = "DialogPlaceholder"
	r.Image = "rbxasset://textures/" .. tostring(f) .. ".png"
	r.BackgroundTransparency = 1
	r.BorderSizePixel = 0
	r.Position = UDim2.new(0, 0, -1.25, 0)
	r.Size = UDim2.new(1, 0, 1, 0)

	local i = Instance.new("ImageLabel", r)
	i.Name = "DotDotDot"
	i.Image = "rbxasset://textures/" .. tostring(d) .. ".png"
	i.BackgroundTransparency = 1
	i.BorderSizePixel = 0
	i.Position = UDim2.new(.001, 0, y, 0)
	i.Size = UDim2.new(1, 0, .7, 0)

	return r
end

local function cf()
	local this = {}
	this.data = {}

	local emptyEvent = Instance.new("BindableEvent")
	this.Emptied = emptyEvent.Event

	function this:Size()
		return table.getn(this.data)
	end

	function this:Empty()
		return this:Size() <= 0
	end

	function this:PopFront()
		table.remove(this.data, 1)
		if this:Empty() then
            emptyEvent:Fire()
        end
	end

	function this:Front()
		return this.data[1]
	end

	function this:Get(index)
		return this.data[index]
	end

	function this:PushBack(value)
		table.insert(this.data, value)
	end

	function this:GetData()
		return this.data
	end

	return this
end

local function ccc()
	local this = {}

	this.Fifo = cf()
	this.BillboardGui = nil

	return this
end

local function cm()
	local this = {}
	this.data = {}
	local count = 0

	function this:Size()
		return count
	end

	function this:Erase(key)
		if this.data[key] then count = count - 1 end
		this.data[key] = nil
	end

	function this:Set(key, value)
		this.data[key] = value
		if value then count = count + 1 end
	end

	function this:Get(key)
		if not key then return end
		if not this.data[key] then
			this.data[key] = ccc()
			local emptiedCon = nil
			emptiedCon = this.data[key].Fifo.Emptied:connect(function()
				emptiedCon:disconnect()
				this:Erase(key)
			end)
		end
		return this.data[key]
	end

	function this:GetData()
		return this.data
	end

	return this
end

local function ccl(m, bc, ilp)
	local this = {}
    
	function this:ComputeBubbleLifetime(m, is)
	    if is then
	        return ll(m, 8, 15)
	    else
	    	return ll(m, 12, 20)
	    end
    end

	this.Origin = nil
	this.RenderBubble = nil
	this.Message = m
	this.BubbleDieDelay = this:ComputeBubbleLifetime(m, ilp)
	this.BubbleColor = bc
	this.IsLocalPlayer = ilp

	return this
end

local function cpcl(p, m, ilp)
	local this = ccl(m, colors.WHITE, ilp)

	if p then
		this.User = p.Name
		this.Origin = p.Character
	end

	return this
end

local function cgcl(o, m, ilp, bc)
	local this = ccl(m, bc, ilp)
	this.Origin = o

	return this
end

local ChatBubbleClass = {}
ChatBubbleClass.ChatBubble = {}
ChatBubbleClass.ChatBubbleWithTail = {}
ChatBubbleClass.ScalingChatBubbleWithTail = {}
ChatBubbleClass.CharacterSortedMsg = cm()

local function icbt(cbt, fn, ifn, ii, sr)
	ChatBubbleClass.ChatBubble[cbt] = ccbm(fn, sr)
	ChatBubbleClass.ChatBubbleWithTail[cbt] = ccbwt(fn, UDim2.new(.5, -(th), 1, ii and -1 or 0), UDim2.new(0, 30, 0, th), sr)
	ChatBubbleClass.ScalingChatBubbleWithTail[cbt] = cscbwt(fn, .5, UDim2.new(-.5, 0, 0, ii and -1 or 0), sr)
end

icbt(colors.WHITE, "ui/dialog_white", "ui/chatBubble_white_notify_bkg", false, Rect.new(5, 5, 15, 15))
icbt(colors.BLUE, "ui/dialog_blue", "ui/chatBubble_blue_notify_bkg", true, Rect.new(7, 7, 33, 33))
icbt(colors.RED, "ui/dialog_red", "ui/chatBubble_red_notify_bkg", true, Rect.new(7, 7, 33, 33))
icbt(colors.GREEN, "ui/dialog_green", "ui/chatBubble_green_notify_bkg", true, Rect.new(7, 7, 33, 33))

local function createBillboardInstance(a)
	local bbg = Instance.new("BillboardGui", a)
	bbg.Adornee = a
	bbg.Size = UDim2.new(0, mw, 0, mh)
	bbg.StudsOffset = Vector3.new(0, 3, 2)
	bbg.MaxDistance = 100

	local bbf = Instance.new("Frame", bbg)
	bbf.Name = "BillboardFrame"
	bbf.Size = UDim2.new(1, 0, 1,0 )
	bbf.Position = UDim2.new(0, 0, -.5, 0)
	bbf.BackgroundTransparency = 1

	local bbcrc = nil
	bbcrc = bbf.ChildRemoved:connect(function()
		if table.getn(bbf:GetChildren()) <= 1 then
			bbcrc:disconnect()
			bbg:Destroy()
		end
	end)

	ChatBubbleClass:CreateSmallTalkBubble(colors.WHITE).Parent = bbf

	return bbg
end

function ChatBubbleClass:SanitizeChatLine(msg)
	if string.len(msg) > mcmle then
		return string.sub(msg, 1, mcmle + string.len(e))
	else
		return msg
	end
end

function ChatBubbleClass:CreateBubbleText(m)
	local bt = Instance.new("TextBox")
	bt.Name = "BubbleText"
	bt.BackgroundTransparency = 1
	bt.Position = UDim2.new(0, wp / 2, 0, 0)
	bt.Size = UDim2.new(1, -(wp) , 1, 0)
	bt.Font = font
	-- // if shouldClipInGameChat then
	-- // 	bubbleText.ClipsDescendants = true
	-- // end
	bt.TextWrapped = true
	bt.FontSize = fontsize
	bt.Text = m
	bt.Visible = false

	return bt
end

function ChatBubbleClass:CreateSmallTalkBubble(cbt)
	local stb = ChatBubbleClass.ScalingChatBubbleWithTail[cbt]:Clone()
	stb.Name = "SmallTalkBubble"
	stb.AnchorPoint = Vector2.new(0, .5)
	stb.Position = UDim2.new(0, 0, .5, 0)
	stb.Visible = false

	local text = ChatBubbleClass:CreateBubbleText("...")
	text.TextScaled = true
	text.TextWrapped = false
	text.Visible = true
	text.Parent = smallTalkBubble

	return stb
end

local function cbi(a)
	local bbg = Instance.new("BillboardGui", a)
	bbg.Adornee = a
	bbg.Size = UDim2.new(0, mw, 0, mh)
	bbg.StudsOffset = Vector3.new(0, 3, 2)
	-- // bbg.Parent = bcsg

	local bbf = Instance.new("Frame", bbg)
	bbf.Name = "BillboardFrame"
	bbf.Size = UDim2.new(1, 0, 1, 0)
	bbf.Position = UDim2.new(0, 0, -.5, 0)
	bbf.BackgroundTransparency = 1

	local bbcrc = nil
	bbcrc = billboardFrame.ChildRemoved:connect(function()
		if table.getn(bbf:GetChildren()) <= 1 then
			bbcrc:disconnect()
			bbg:Destroy()
		end
	end)

	ChatBubbleClass:CreateSmallTalkBubble(colors.WHITE).Parent = bbf

	return cbi
end

function ChatBubbleClass:CreateBillboardGuiHelper(i, oc)
	if i and not ChatBubbleClass.CharacterSortedMsg:Get(i)["BillboardGui"] then
		if not oc then
			if i:IsA("BasePart") then
				local bbg = createBillboardInstance(i)
				ChatBubbleClass.CharacterSortedMsg:Get(i)["BillboardGui"] = bbg
				return
			end
		end

		if i:IsA("Model") then
			local h = i:FindFirstChild("Head")
			if h and h:IsA("BasePart") then
				local bbg = createBillboardInstance(h)
				ChatBubbleClass.CharacterSortedMsg:Get(i)["BillboardGui"] = bbg
			end
		end
	end
end

local function dtbo(o)
	if not o then
        return 100000
    end

	return 100000 -- // (o.Position - workspace.CurrentCamera.CFrame.Position).Magnitude
end

local function ipolp(a)
	if a and game:GetService("Players"):FindFirstChild("LocalPlayer") then
        if game:GetService("Players").LocalPlayer.Character then
		    return a:IsDescendantOf(game:GetService("Players").LocalPlayer.Character)
        end
    else
        return false
	end
end

function ChatBubbleClass:SetBillboardLODNear(bbg)
	local ilp = ipolp(bbg.Adornee)

	bbg.Size = UDim2.new(0, mw, 0, mh)
	bbg.StudsOffset = Vector3.new(0, 3, ilp and 2 or .1)
	bbg.Enabled = true

	for _, v in pairs(bbg.BillboardFrame:GetChildren()) do
        if v.Name ~= "SmallTalkBubble" then
            v.Visible = true
        else
            v.Visible = false
        end
    end
end

function ChatBubbleClass:SetBillboardLODDistant(bbg)
	local ilp = ipolp(bbg.Adornee)

	bbg.Size = UDim2.new(4, 0, 3, 0)
	bbg.StudsOffset = Vector3.new(0, 3, ilp and 2 or .1)
	bbg.Enabled = true

	for _, v in pairs(bbg.BillboardFrame:GetChildren()) do
        if v.Name ~= "SmallTalkBubble" then
            v.Visible = true
        else
            v.Visible = false
        end
    end
end

function ChatBubbleClass:SetBillboardLODVeryFar(bbg)
	bbg.Enabled = false
end

function ChatBubbleClass:SetBillboardGuiLOD(bbg, o)
	if not o then return end

	if o:IsA("Model") then
		local head = o:FindFirstChild("Head")
		if not head then
            origin = origin.PrimaryPart
		else
            origin = head
        end
	end

	local bd = dtbo(o)
	ChatBubbleClass:SetBillboardLODNear(bbg)

	-- // if bd < nbd then
	-- // 	ChatBubbleClass:SetBillboardLODNear(bbg)
	-- // elseif bd >= nbd and bd < mbd then
	-- // 	ChatBubbleClass:SetBillboardLODDistant(bbg)
	-- // else
	-- // 	ChatBubbleClass:SetBillboardLODVeryFar(bbg)
	-- // end
end

function ChatBubbleClass:CameraCFrameChanged()
	for i, v in pairs(ChatBubbleClass.CharacterSortedMsg:GetData()) do
		local pbbg = v["BillboardGui"]
		if pbbg then
            ChatBubbleClass:SetBillboardGuiLOD(pbbg, i)
        end
	end
end

function ChatBubbleClass:UpdateChatLinesForOrigin(o, cby)
	local bq = ChatBubbleClass.CharacterSortedMsg:Get(o).Fifo
	local bqs = bq:Size()
	local bqd = bq:GetData()
	if table.getn(bqd) <= 1 then
        return
    end

	for i = (table.getn(bqd) - 1), 1, -1 do
		local v = bqd[i]
		local b = v.RenderBubble
		if not b then
            return
        end

		local bp = bqs - i + 1

		if bp > 1 then
			local t = b:FindFirstChild("ChatBubbleTail")
			if t then
                t:Destroy()
            end

			local bt = b:FindFirstChild("BubbleText")
			if bt then
                bt.TextTransparency = .5
            end
		end

		local uv = UDim2.new(b.Position.X.Scale, b.Position.X.Offset,
		1, cby - b.Size.Y.Offset - th)
		b:TweenPosition(uv, "Out", "Bounce", .1, true)
		cby = cby - b.Size.Y.Offset - th
	end
end

function ChatBubbleClass:DestroyBubble(bq, btd)
	if not bq then
        return
    end

	if bq:Empty() then
        return
    end

	local b = bq:Front().RenderBubble
	if not b then
		bq:PopFront()
	 	return
	end

	coroutine.wrap(function()
		while bq:Front().RenderBubble ~= btd do
			task.wait()
		end

		b = bq:Front().RenderBubble

		local tb = 0
		local bt = b:FindFirstChild("BubbleText")
		local btl = b:FindFirstChild("ChatBubbleTail")

		while b and b.ImageTransparency < 1 do
			tb = task.wait()

			if b then
				local fa = tb * fs
				b.ImageTransparency += fa

				if bt then 
                    bt.TextTransparency += fa
                end

				if btl then
                    btl.ImageTransparency += fa
                end
			end
		end

		if b then
			b:Destroy()
			bq:PopFront()
		end
	end)()
end

function ChatBubbleClass:CreateChatLineRender(i, l, oc, f)
	if not i then
        return
    end

	if not ChatBubbleClass.CharacterSortedMsg:Get(i)["BillboardGui"] then
		ChatBubbleClass:CreateBillboardGuiHelper(i, oc)
	end

	local bbg = ChatBubbleClass.CharacterSortedMsg:Get(i)["BillboardGui"]

	if bbg then
		local cbr = ChatBubbleClass.ChatBubbleWithTail[l.BubbleColor]:Clone()
		cbr.Visible = false
		local bt = ChatBubbleClass:CreateBubbleText(l.Message)

		bt.Parent = cbr
		cbr.Parent = bbg.BillboardFrame

		l.RenderBubble = cbr

		local ctb = game:GetService("TextService"):GetTextSize(bt.Text, fsi, font, Vector2.new(mw, mh))

		local bws = math.max((ctb.X + wp) / mw, .1)
		local nol = (ctb.Y / fsi)

		cbr.Size = UDim2.new()
		cbr.Position = UDim2.new(.5, 0, 1, 0)

		local ncboy = nol * lh

		cbr:TweenSizeAndPosition(
            UDim2.new(bws, 0, 0, ncboy),
		    UDim2.new((1 - bws) / 2, 0, 1, -(ncboy)),
		    Enum.EasingDirection.Out, 
			Enum.EasingStyle.Elastic,
            .1,
            true,
		    function()
                bt.Visible = true
            end
        )

		ChatBubbleClass:SetBillboardGuiLOD(bbg, l.Origin)
		ChatBubbleClass:UpdateChatLinesForOrigin(l.Origin, -(ncboy))

		task.delay(l.BubbleDieDelay, function()
			ChatBubbleClass:DestroyBubble(f, cbr)
		end)
	end
end

function ChatBubbleClass:OnPlayerChatMessage(sp, m, tp)
	if not ChatBubbleClass:BubbleChatEnabled() then
        return
    end

	local lp = owner
	local fo = true -- // lp ~= nil and sp ~= lp

	local sm = ChatBubbleClass:SanitizeChatLine(m)

	local l = cpcl(sp, sm, not fo)

	if sp and l.Origin then
		local f = ChatBubbleClass.CharacterSortedMsg:Get(l.Origin).Fifo
		f:PushBack(l)
		ChatBubbleClass:CreateChatLineRender(sp.Character, l, true, f)
	end
end

function ChatBubbleClass:OnGameChatMessage(o, m, c)
	local lp = owner
	local fo = true

	local bc = colors.WHITE

	if c == Enum.ChatColor.Blue then
        bc = colors.BLUE
	elseif c == Enum.ChatColor.Green then
        bc = colors.GREEN
	elseif c == Enum.ChatColor.Red then
        bc = colors.RED
    end

	local sm = ChatBubbleClass:SanitizeChatLine(m)
	local l = cgcl(o, sm, not fo, bc)

	ChatBubbleClass.CharacterSortedMsg:Get(l.Origin).Fifo:PushBack(l)
	ChatBubbleClass:CreateChatLineRender(o, l, false, ChatBubbleClass.CharacterSortedMsg:Get(l.Origin).Fifo)
end

function ChatBubbleClass:BubbleChatEnabled()
    --[[
        local clientChatModules = ChatService:FindFirstChild("ClientChatModules")
        if clientChatModules then
            local chatSettings = clientChatModules:FindFirstChild("ChatSettings")
            if chatSettings then
                local chatSettings = require(chatSettings)
                if chatSettings.BubbleChatEnabled ~= nil then
                    return chatSettings.BubbleChatEnabled
                end
            end
        end
        return PlayersService.BubbleChat
    ]]--

    return true
end

function ChatBubbleClass:ShowOwnFilteredMessage()
	local ccm = game:GetService("Chat"):FindFirstChild("ClientChatModules")

	if ccm then
		local cs = ccn:FindFirstChild("ChatSettings")
		if cs then
			cs = require(cs)
			return cs.ShowUserOwnFilteredMessage
		end
	end

	return false
end

function fp(pn)
	for _, v in pairs(game:GetService("Players"):GetPlayers()) do
		if v.Name == pn then
			return v
		end
	end
end

function ChatBubbleClass:Chat(obj, msg, color)
	ChatBubbleClass:OnGameChatMessage(obj, msg, color)
end

return ChatBubbleClass
