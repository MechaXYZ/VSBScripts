-- // PartCache Module
-- // Table

local Table

do
	--[[
		To use: local table = require(this)
		(Yes, override table.)

		Written by EtiTheSpirit. Adds custom functions to the `table` value provided by roblox (in normal cases, this would simply modify `table`, but Roblox has disabled that so we need to use a proxy)
		
		CHANGES:
			3 December 2019 @ 11:07 PM CST:
				+ Added table.join
				
				
			21 November 2019 @ 6:50 PM CST:
				+ Added new method bodies to skip/take using Luau's new methods. Drastic speed increases achieved. CREDITS: Halalaluyafail3 (See https://devforum.roblox.com/t/sandboxed-table-system-add-custom-methods-to-table/391177/12?u=etithespirit)
				+ Added table.retrieve as proposed by ^ under the name "table.range" as this name relays what it does a bit better, I think.
				+ Added table.skipAndTake as an alias method.

	--]]

	local RNG = Random.new()
	Table = {}

	for index, value in pairs(table) do
		Table[index] = value
	end

	-- // Returns true if the table contains the specified value.
	Table.contains = function (tbl, value)
		return Table.indexOf(tbl, value) ~= nil -- // This is kind of cheatsy but it promises the best performance.
	end

	-- // A combo of table.find and table.keyOf -- // This first attempts to find the ordinal index of your value, then attempts to find the lookup key if it can't find an ordinal index.
	Table.indexOf = function (tbl, value)
		local fromFind = table.find(tbl, value)
		if fromFind then return fromFind end
		
		return Table.keyOf(tbl, value)
	end

	-- // Returns the key of the specified value, or nil if it could not be found. Unlike IndexOf, this searches every key in the table, not just ordinal indices (arrays)
	-- // This is inherently slower due to how lookups work, so if your table is structured like an array, use table.find
	Table.keyOf = function (tbl, value)
		for index, obj in pairs(tbl) do
			if obj == value then
				return index
			end
		end
		return nil
	end

	-- // ONLY SUPPORTS ORDINAL TABLES (ARRAYS). Skips *n* objects in the table, and returns a new table that contains indices (n + 1) to (end of table)
	Table.skip = function (tbl, n)
		return table.move(tbl, n+1, #tbl, 1, table.create(#tbl-n))
	end

	-- // ONLY SUPPORTS ORDINAL TABLES (ARRAYS). Takes *n* objects from a table and returns a new table only containing those objects.
	Table.take = function (tbl, n)
		return table.move(tbl, 1, n, 1, table.create(n))
	end

	-- // ONLY SUPPORTS ORDINAL TABLES (ARRAYS). Takes the range of entries in this table in the range [start, finish] and returns that range as a table.
	Table.range = function (tbl, start, finish)
		return table.move(tbl, start, finish, 1, table.create(finish - start + 1))
	end

	-- // ONLY SUPPORTS ORDINAL TABLES (ARRAYS). An alias that calls table.skip(skip), and then takes [take] entries from the resulting table.
	Table.skipAndTake = function (tbl, skip, take)
		return table.move(tbl, skip + 1, skip + take, 1, table.create(take))
	end

	-- // ONLY SUPPORTS ORDINAL TABLES (ARRAYS). Selects a random object out of tbl
	Table.random = function (tbl)
		return tbl[RNG:NextInteger(1, #tbl)]
	end

	-- // ONLY SUPPORTS ORDINAL TABLES (ARRAYS). Merges tbl0 and tbl1 together.
	Table.join = function (tbl0, tbl1)
		local nt = table.create(#tbl0 + #tbl1)
		-- // local t2 = table.move(tbl0, 1, #tbl0, 1, nt)
		return table.move(tbl1, 1, #tbl1, #tbl0 + 1, nt)
	end

	-- // ONLY SUPPORTS ORDINAL TABLES (ARRAYS). Removes the specified object from this array.
	Table.removeObject = function (tbl, obj)
		local index = Table.indexOf(tbl, obj)
		if index then
			table.remove(tbl, index)
		end
	end

	-- // ONLY SUPPORTS ORDINAL TABLES (ARRAYS). Allocates a new table by getting the length of the current table and increasing its capacity by the specified amount.
	-- // This uses Roblox's table.create function.
	Table.expand = function (tbl, byAmount)
		if byAmount < 0 then
			error("Cannot expand a table by a negative amount of objects.")
		end
		
		local newtbl = table.create(#tbl + byAmount)
		for i = 1, #tbl do
			newtbl[i] = tbl[i]
		end
		return newtbl
	end
end

-- // PartCache

local PartCacheStatic

do
	--[[
		PartCache V4.0 by Xan the Dragon // Eti the Spirit -- // RBX 18406183
		Update V4.0 has added Luau Strong Type Enforcement.
		
		Creating parts is laggy, especially if they are supposed to be there for a split second and/or need to be made frequently.
		This module aims to resolve this lag by pre-creating the parts and CFraming them to a location far away and out of sight.
		When necessary, the user can get one of these parts and CFrame it to where they need, then return it to the cache when they are done with it.
		
		According to someone instrumental in Roblox's backend technology, zeuxcg (https://devforum.roblox.com/u/zeuxcg/summary)...
			>> CFrame is currently the only "fast" property in that you can change it every frame without really heavy code kicking in. Everything else is expensive.
			
			- https://devforum.roblox.com/t/event-that-fires-when-rendering-finishes/32954/19
		
		This alone should ensure the speed granted by this module.
			
			
		HOW TO USE THIS MODULE:
		
		Look at the bottom of my thread for an API! https://devforum.roblox.com/t/partcache-for-all-your-quick-part-creation-needs/246641
	--]]

	local table = Table

	-----------------------------------------------------------
	-------------------- // MODULE DEFINITION --------------------
	-----------------------------------------------------------

	PartCacheStatic = {}
	PartCacheStatic.__index = PartCacheStatic
	PartCacheStatic.__type = "PartCache" -- // For compatibility with TypeMarshaller

	-- // TYPE DEFINITION: Part Cache Instance
	export type PartCache = {
		Open: {[number]: BasePart},
		InUse: {[number]: BasePart},
		CurrentCacheParent: Instance,
		Template: BasePart,
		ExpansionSize: number
	}

	-----------------------------------------------------------
	----------------------- // STATIC DATA -----------------------
	-----------------------------------------------------------					

	-- // A CFrame that's really far away. Ideally. You are free to change this as needed.
	local CF_REALLY_FAR_AWAY = CFrame.new(0, 10e8, 0)

	-- // Format params: methodName, ctorName
	local ERR_NOT_INSTANCE = "Cannot statically invoke method '%s' - It is an instance method. Call it on an instance of this class created via %s"

	-- // Format params: paramName, expectedType, actualType
	-- // local ERR_INVALID_TYPE = "Invalid type for parameter '%s' (Expected %s, got %s)"

	-----------------------------------------------------------
	------------------------ // UTILITIES ------------------------
	-----------------------------------------------------------

	-- // Similar to assert but warns instead of errors.
	local function assertwarn(requirement: boolean, messageIfNotMet: string)
		if requirement == false then
			warn(messageIfNotMet)
		end
	end

	-- // Dupes a part from the template.
	local function MakeFromTemplate(template: BasePart, currentCacheParent: Instance): BasePart
		local part: BasePart = template:Clone()
		-- // ^ Ignore W000 type mismatch between Instance and BasePart. False alert.
		
		part.CFrame = CF_REALLY_FAR_AWAY
		part.Anchored = true
		part.Parent = currentCacheParent
		return part
	end

	function PartCacheStatic.new(template: BasePart, numPrecreatedParts: number?, currentCacheParent: Instance?): PartCache
		local newNumPrecreatedParts: number = numPrecreatedParts or 5
		local newCurrentCacheParent: Instance = currentCacheParent or workspace
		
		-- // PrecreatedParts value.
		-- // Same thing. Ensure it's a number, ensure it's not negative, warn if it's really huge or 0.
		assert(numPrecreatedParts > 0, "PrecreatedParts can not be negative!")
		assertwarn(numPrecreatedParts ~= 0, "PrecreatedParts is 0! This may have adverse effects when initially using the cache.")
		assertwarn(template.Archivable, "The template's Archivable property has been set to false, which prevents it from being cloned. It will temporarily be set to true.")
		
		local oldArchivable = template.Archivable
		template.Archivable = true
		local newTemplate: BasePart = template:Clone()
		-- // ^ Ignore W000 type mismatch between Instance and BasePart. False alert.
		
		template.Archivable = oldArchivable
		template = newTemplate
		
		local object: PartCache = {
			Open = {},
			InUse = {},
			CurrentCacheParent = newCurrentCacheParent,
			Template = template,
			ExpansionSize = 10
		}
		setmetatable(object, PartCacheStatic)
		
		-- // Below: Ignore type mismatch nil | number and the nil | Instance mismatch on the table.insert line.
		for _ = 1, newNumPrecreatedParts do
			table.insert(object.Open, MakeFromTemplate(template, object.CurrentCacheParent))
		end
		object.Template.Parent = nil
		
		return object
		-- // ^ Ignore mismatch here too
	end

	-- // Gets a part from the cache, or creates one if no more are available.
	function PartCacheStatic:GetPart(): BasePart
		assert(getmetatable(self) == PartCacheStatic, ERR_NOT_INSTANCE:format("GetPart", "PartCache.new"))
		
		if #self.Open == 0 then
			-- // warn("No parts available in the cache! Creating [" .. self.ExpansionSize .. "] new part instance(s) - this amount can be edited by changing the ExpansionSize property of the PartCache instance... (This cache now contains a grand total of " .. tostring(#self.Open + #self.InUse + self.ExpansionSize) .. " parts.)")
			for _ = 1, self.ExpansionSize, 1 do
				table.insert(self.Open, MakeFromTemplate(self.Template, self.CurrentCacheParent))
			end
		end
		local part = self.Open[#self.Open]
		self.Open[#self.Open] = nil
		table.insert(self.InUse, part)
		return part
	end

	-- // Returns a part to the cache.
	function PartCacheStatic:ReturnPart(part: BasePart)
		assert(getmetatable(self) == PartCacheStatic, ERR_NOT_INSTANCE:format("ReturnPart", "PartCache.new"))
		
		local index = table.indexOf(self.InUse, part)
		if index ~= nil then
			table.remove(self.InUse, index)
			table.insert(self.Open, part)
			part.CFrame = CF_REALLY_FAR_AWAY
			part.Anchored = true
		else
			error("Attempted to return part \"" .. part.Name .. "\" (" .. part:GetFullName() .. ") to the cache, but it's not in-use! Did you call this on the wrong part?")
		end
	end

	-- // Sets the parent of all cached parts.
	function PartCacheStatic:SetCacheParent(newParent: Instance)
		assert(getmetatable(self) == PartCacheStatic, ERR_NOT_INSTANCE:format("SetCacheParent", "PartCache.new"))
		assert(newParent:IsDescendantOf(workspace) or newParent == workspace, "Cache parent is not a descendant of Workspace! Parts should be kept where they will remain in the visible world.")
		
		self.CurrentCacheParent = newParent
		for i = 1, #self.Open do
			self.Open[i].Parent = newParent
		end
		for i = 1, #self.InUse do
			self.InUse[i].Parent = newParent
		end
	end

	-- // Adds numParts more parts to the cache.
	function PartCacheStatic:Expand(numParts: number): ()
		assert(getmetatable(self) == PartCacheStatic, ERR_NOT_INSTANCE:format("Expand", "PartCache.new"))
		if numParts == nil then
			numParts = self.ExpansionSize
		end
		
		for _ = 1, numParts do
			table.insert(self.Open, MakeFromTemplate(self.Template, self.CurrentCacheParent))
		end
	end

	-- // Destroys this cache entirely. Use this when you don't need this cache object anymore.
	function PartCacheStatic:Dispose()
		assert(getmetatable(self) == PartCacheStatic, ERR_NOT_INSTANCE:format("Dispose", "PartCache.new"))
		for i = 1, #self.Open do
			self.Open[i]:Destroy()
		end
		for i = 1, #self.InUse do
			self.InUse[i]:Destroy()
		end
		self.Template:Destroy()
		self.Open = {}
		self.InUse = {}
		self.CurrentCacheParent = nil
		
		self.GetPart = nil
		self.ReturnPart = nil
		self.SetCacheParent = nil
		self.Expand = nil
		self.Dispose = nil
	end
end

-- // LightningBolt Module

local LightningBolt

do
	--[[
		Procedural Lightning Effect Module. By Quasiduck
		License: https://github.com/SamyBlue/Lightning-Beams/blob/main/LICENSE
		See README for guide on how to use or scroll down to see all properties in LightningBolt.new
		All properties update in real-time except PartCount which requires a new LightningBolt to change
		i.e. You can change a property at any time after a LightningBolt instance is created and it will still update the look of the bolt
	--]]

	local PARTS_IN_CACHE = 1000 -- // Recommend setting higher if you intend to use LightningSparks
	local clock = os.clock
	local workspace, RunService = game:GetService("Workspace"), game:GetService("RunService")
	local parent = script

	--*Part Cache Setup
	-- // New parts automatically get added to cache if more parts are requested for use where a warning is thrown

	local BoltPart = Instance.new("Part") -- // Template primitive that will make up the entire bolt
	BoltPart.TopSurface, BoltPart.BottomSurface = 0, 0
	BoltPart.Anchored, BoltPart.CanCollide = true, false
	BoltPart.Locked, BoltPart.CastShadow = true, false
	BoltPart.CanTouch, BoltPart.CanQuery = false, false
	BoltPart.Shape = "Cylinder"
	BoltPart.Name = "BoltPart"
	BoltPart.Material = Enum.Material.Neon
	BoltPart.Color = Color3.new(1, 1, 1)
	BoltPart.Transparency = 1

	local PartCache = PartCacheStatic
	local LightningCache = PartCache.new(BoltPart, PARTS_IN_CACHE)
	LightningCache:SetCacheParent(parent)

	--*

	local function CubicBezier(PercentAlongBolt, p0, p1, p2, p3)
		return p0 * (1 - PercentAlongBolt) ^ 3
			+ p1 * 3 * PercentAlongBolt * (1 - PercentAlongBolt) ^ 2
			+ p2 * 3 * (1 - PercentAlongBolt) * PercentAlongBolt ^ 2
			+ p3 * PercentAlongBolt ^ 3
	end

	local function DiscretePulse(PercentAlongBolt, TimePassed, s, k, f, min, max) -- // See https://www.desmos.com/calculator/hg5h4fpfim for demonstration
		return math.clamp(k / (2 * f) - math.abs((PercentAlongBolt - TimePassed * s + 0.5 * k) / f), min, max)
	end

	local function ExtrudeCenter(PercentAlongBolt)
		return math.exp(-5000 * (PercentAlongBolt - 0.5) ^ 10)
	end

	local function NoiseBetween(x, y, z, min, max)
		return min + (max - min) * (math.noise(x, y, z) + 0.5)
	end

	local xInverse = CFrame.lookAt(Vector3.new(), Vector3.new(1, 0, 0)):inverse()
	local offsetAngle = math.cos(math.rad(90))

	local ActiveBranches = {} -- // Contains all LightningBolt instances

	LightningBolt = {} -- // Define new class
	LightningBolt.__type = "LightningBolt"
	LightningBolt.__index = LightningBolt

	-- // Small tip: You don't need to use actual Roblox Attachments below. You can also create "fake" ones as follows:
	--[[
		local A1, A2 = {}, {}
		A1.WorldPosition, A1.WorldAxis = chosenPos1, chosenAxis1
		A2.WorldPosition, A2.WorldAxis = chosenPos2, chosenAxis2
		local NewBolt = LightningBolt.new(A1, A2, 40)
	--]]

	function LightningBolt.new(Attachment0, Attachment1, PartCount)
		local self = setmetatable({}, LightningBolt)
		PartCount = PartCount or 30

		--*Main (default) Properties--

		-- // Bolt Appearance Properties

		self.Enabled = true -- // Hides bolt without removing any parts when false
		self.Attachment0, self.Attachment1 = Attachment0, Attachment1 -- // Bolt originates from Attachment0 and ends at Attachment1
		self.CurveSize0, self.CurveSize1 = 0, 0 -- // Works similarly to roblox beams. See https://dk135eecbplh9.cloudfront.net/assets/blt160ad3fdeadd4ff2/BeamCurve1.png
		self.MinRadius, self.MaxRadius = 0, 2.4 -- // Governs the amplitude of fluctuations throughout the bolt
		self.Frequency = 1 -- // Governs the frequency of fluctuations throughout the bolt. Lower this to remove jittery-looking lightning
		self.AnimationSpeed = 7 -- // Governs how fast the bolt oscillates (i.e. how fast the fluctuating wave travels along bolt)
		self.Thickness = 1 -- // The thickness of the bolt
		self.MinThicknessMultiplier, self.MaxThicknessMultiplier = 0.2, 1 -- // Multiplies Thickness value by a fluctuating random value between MinThicknessMultiplier and MaxThicknessMultiplier along the Bolt

		-- // Bolt Kinetic Properties

		--[[
			Allows for fading in (or out) of the bolt with time. Can also create a "projectile" bolt
			Recommend setting AnimationSpeed to 0 if used as projectile (for better aesthetics)
			Works by passing a "wave" function which travels from left to right where the wave height represents opacity (opacity being 1 - Transparency)
			See https://www.desmos.com/calculator/hg5h4fpfim to help customise the shape of the wave with the below properties
		--]]
		self.MinTransparency, self.MaxTransparency = 0, 1
		self.PulseSpeed = 2 -- // Bolt arrives at Attachment1 1/PulseSpeed seconds later
		self.PulseLength = 1000000
		self.FadeLength = 0.2
		self.ContractFrom = 0.5 -- // Parts shorten or grow once their Transparency exceeds this value. Set to a value above 1 to turn effect off. See https://imgur.com/OChA441

		-- // Bolt Color Properties

		self.Color = Color3.new(1, 1, 1) -- // Can be a Color3 or ColorSequence
		self.ColorOffsetSpeed = 3 -- // Sets speed at which ColorSequence travels along Bolt

		--*

		--*Advanced Properties--

		--[[
			Allows you to pass a custom space curve for the bolt to be defined along
			Constraints: 
				-First input passed must be a parameter representing PercentAlongBolt between values 0 and 1
			Example: self.SpaceCurveFunction = VivianiCurve(PercentAlongBolt)
		--]]
		self.SpaceCurveFunction = CubicBezier

		--[[
			Allows you to pass a custom opacity profile which controls the opacity along the bolt
			Constraints: 
				-First input passed must be a parameter representing PercentAlongBolt between values 0 and 1
				-Second input passed must be a parameter representing TimePassed since instantiation 
			Example: self.OpacityProfileFunction = MovingSineWave(PercentAlongBolt, TimePassed)
			Note: You may want to set self.ContractFrom to a value above 1 if you pass a custom opacity profile as contraction was designed to work with DiscretePulse
		--]]
		self.OpacityProfileFunction = DiscretePulse

		--[[
			Allows you to pass a custom radial profile which controls the radius of control points along the bolt
			Constraints: 
				-First input passed must be a parameter representing PercentAlongBolt between values 0 and 1
		--]]
		self.RadialProfileFunction = ExtrudeCenter
		--*

		--! Private vars are prefixed with an underscore (e.g. self._Parts) and should not be changed manually

		self._Parts = {} -- // The BoltParts which make up the Bolt

		for i = 1, PartCount do
			self._Parts[i] = LightningCache:GetPart()
		end

		self._PartsHidden = false
		self._DisabledTransparency = 1
		self._StartT = clock()
		self._RanNum = math.random() * 100
		self._RefIndex = #ActiveBranches + 1

		ActiveBranches[self._RefIndex] = self

		return self
	end

	function LightningBolt:Destroy()
		ActiveBranches[self._RefIndex] = nil

		for i = 1, #self._Parts do
			LightningCache:ReturnPart(self._Parts[i])
		end

		self = nil
	end

	-- // Calls Destroy() after TimeLength seconds where a dissipating effect takes place in the meantime
	function LightningBolt:DestroyDissipate(TimeLength, Strength)
		TimeLength = TimeLength or 0.2
		Strength = Strength or 0.5
		local DissipateStartT = clock()
		local start, mid, goal = self.MinTransparency, self.ContractFrom, self.ContractFrom
			+ 1 / (#self._Parts * self.FadeLength)
		local StartRadius = self.MaxRadius
		local StartMinThick = self.MinThicknessMultiplier
		local DissipateLoop

		DissipateLoop = RunService.Heartbeat:Connect(function()
			local TimeSinceDissipate = clock() - DissipateStartT
			self.MinThicknessMultiplier = StartMinThick + (-2 - StartMinThick) * TimeSinceDissipate / TimeLength

			if TimeSinceDissipate < TimeLength * 0.4 then
				local interp = (TimeSinceDissipate / (TimeLength * 0.4))
				self.MinTransparency = start + (mid - start) * interp
			elseif TimeSinceDissipate < TimeLength then
				local interp = ((TimeSinceDissipate - TimeLength * 0.4) / (TimeLength * 0.6))
				self.MinTransparency = mid + (goal - mid) * interp
				self.MaxRadius = StartRadius * (1 + Strength * interp)
				self.MinRadius = self.MinRadius + (self.MaxRadius - self.MinRadius) * interp
			else
				-- // Destroy Bolt
				local TimePassed = clock() - self._StartT
				local Lifetime = (self.PulseLength + 1) / self.PulseSpeed

				if TimePassed < Lifetime then -- // prevents Destroy()ing twice
					self:Destroy()
				end

				-- // Disconnect Loop
				DissipateLoop:Disconnect()
				DissipateLoop = nil
			end
		end)
	end

	function LightningBolt:_UpdateGeometry(
		BPart,
		PercentAlongBolt,
		TimePassed,
		ThicknessNoiseMultiplier,
		PrevPoint,
		NextPoint
	)
		-- // Compute opacity for this particular section
		local MinOpa, MaxOpa = 1 - self.MaxTransparency, 1 - self.MinTransparency
		local Opacity = self.OpacityProfileFunction(
			PercentAlongBolt,
			TimePassed,
			self.PulseSpeed,
			self.PulseLength,
			self.FadeLength,
			MinOpa,
			MaxOpa
		)

		-- // Compute thickness for this particular section
		local Thickness = self.Thickness * ThicknessNoiseMultiplier * Opacity
		Opacity = Thickness > 0 and Opacity or 0

		-- // Compute + update sizing and orientation of this particular section
		local contractf = 1 - self.ContractFrom
		local PartsN = #self._Parts
		if Opacity > contractf then
			BPart.Size = Vector3.new((NextPoint - PrevPoint).Magnitude, Thickness, Thickness)
			BPart.CFrame = CFrame.lookAt((PrevPoint + NextPoint) * 0.5, NextPoint) * xInverse
			BPart.Transparency = 1 - Opacity
		elseif Opacity > contractf - 1 / (PartsN * self.FadeLength) then
			local interp = (1 - (Opacity - (contractf - 1 / (PartsN * self.FadeLength))) * PartsN * self.FadeLength)
				* (PercentAlongBolt < TimePassed * self.PulseSpeed - 0.5 * self.PulseLength and 1 or -1)
			BPart.Size = Vector3.new((1 - math.abs(interp)) * (NextPoint - PrevPoint).Magnitude, Thickness, Thickness)
			BPart.CFrame = CFrame.lookAt(
					PrevPoint + (NextPoint - PrevPoint) * (math.max(0, interp) + 0.5 * (1 - math.abs(interp))),
					NextPoint
				)
				* xInverse
			BPart.Transparency = 1 - Opacity
		else
			BPart.Transparency = 1
		end
	end

	function LightningBolt:_UpdateColor(BPart, PercentAlongBolt, TimePassed)
		if typeof(self.Color) == "Color3" then
			BPart.Color = self.Color
		else -- // ColorSequence
			local t1 = (self._RanNum + PercentAlongBolt - TimePassed * self.ColorOffsetSpeed) % 1
			local keypoints = self.Color.Keypoints
			for i = 1, #keypoints - 1 do
				if keypoints[i].Time < t1 and t1 < keypoints[i + 1].Time then
					BPart.Color = keypoints[i].Value:lerp(
						keypoints[i + 1].Value,
						(t1 - keypoints[i].Time) / (keypoints[i + 1].Time - keypoints[i].Time)
					)
					break
				end
			end
		end
	end

	function LightningBolt:_Disable()
		self.Enabled = false
		for _, BPart in ipairs(self._Parts) do
			BPart.Transparency = self._DisabledTransparency
		end
	end

	RunService.Heartbeat:Connect(function()
		debug.profilebegin("LightningBolt") -- // Create performance profile

		for _, ThisBranch in pairs(ActiveBranches) do
			if ThisBranch.Enabled == true then
				ThisBranch._PartsHidden = false

				-- // Extract important variables
				local MinRadius, MaxRadius = ThisBranch.MinRadius, ThisBranch.MaxRadius
				local Parts = ThisBranch._Parts
				local PartsN = #Parts
				local RanNum = ThisBranch._RanNum
				local spd = ThisBranch.AnimationSpeed
				local freq = ThisBranch.Frequency
				local MinThick, MaxThick = ThisBranch.MinThicknessMultiplier, ThisBranch.MaxThicknessMultiplier
				local TimePassed = clock() - ThisBranch._StartT
				local SpaceCurveFunction, RadialProfileFunction =
					ThisBranch.SpaceCurveFunction, ThisBranch.RadialProfileFunction
				local Lifetime = (ThisBranch.PulseLength + 1) / ThisBranch.PulseSpeed

				-- // Extract control points
				local a0, a1, CurveSize0, CurveSize1 =
					ThisBranch.Attachment0, ThisBranch.Attachment1, ThisBranch.CurveSize0, ThisBranch.CurveSize1
				local p0, p1, p2, p3 = a0.WorldPosition, a0.WorldPosition
					+ a0.WorldAxis * CurveSize0, a1.WorldPosition
					- a1.WorldAxis * CurveSize1, a1.WorldPosition

				-- // Initialise iterative scheme for generating points along space curve
				local init = SpaceCurveFunction(0, p0, p1, p2, p3)
				local PrevPoint, bezier0 = init, init

				-- // Update
				if TimePassed < Lifetime then
					for i = 1, PartsN do
						local BPart = Parts[i]
						local PercentAlongBolt = i / PartsN

						-- // Compute noisy inputs
						local input, input2 = (spd * -TimePassed)
							+ freq * 10 * PercentAlongBolt
							- 0.2
							+ RanNum * 4, 5 * ((spd * 0.01 * -TimePassed) / 10 + freq * PercentAlongBolt)
							+ RanNum * 4
						local noise0 = NoiseBetween(5 * input, 1.5, 5 * 0.2 * input2, 0, 0.1 * 2 * math.pi)
							+ NoiseBetween(0.5 * input, 1.5, 0.5 * 0.2 * input2, 0, 0.9 * 2 * math.pi)
						local noise1 = NoiseBetween(3.4, input2, input, MinRadius, MaxRadius)
							* RadialProfileFunction(PercentAlongBolt)
						local thicknessNoise = NoiseBetween(2.3, input2, input, MinThick, MaxThick)

						-- // Find next point along space curve
						local bezier1 = SpaceCurveFunction(PercentAlongBolt, p0, p1, p2, p3)

						-- // Find next point along bolt
						local NextPoint = i ~= PartsN
								and (CFrame.new(bezier0, bezier1) * CFrame.Angles(0, 0, noise0) * CFrame.Angles(
								math.acos(math.clamp(NoiseBetween(input2, input, 2.7, offsetAngle, 1), -1, 1)),
								0,
								0
							) * CFrame.new(0, 0, -noise1)).Position
							or bezier1

						ThisBranch:_UpdateGeometry(BPart, PercentAlongBolt, TimePassed, thicknessNoise, PrevPoint, NextPoint)

						ThisBranch:_UpdateColor(BPart, PercentAlongBolt, TimePassed)

						PrevPoint, bezier0 = NextPoint, bezier1
					end
				else
					ThisBranch:Destroy()
				end
			else -- // Enabled = false
				if ThisBranch._PartsHidden == false then
					ThisBranch._PartsHidden = true
					ThisBranch:_Disable()
				end
			end
		end

		debug.profileend()
	end)
end

-- // LightningSparks Submodule

local LightningSparks

do
	-- // Adds sparks effect to a Lightning Bolt
	local ActiveSparks = {}

	local rng = Random.new()
	LightningSparks = {}
	LightningSparks.__index = LightningSparks

	function LightningSparks.new(LightningBoltInstance, MaxSparkCount)
		local self = setmetatable({}, LightningSparks)

		--*Main (default) properties--

		self.Enabled = true -- // Stops spawning sparks when false
		self.LightningBolt = LightningBoltInstance -- // Bolt which sparks fly out of
		self.MaxSparkCount = MaxSparkCount or 10 -- // Max number of sparks visible at any given instance
		self.MinSpeed, self.MaxSpeed = 4, 6 -- // Min and max PulseSpeeds of sparks
		self.MinDistance, self.MaxDistance = 3, 6 -- // Governs how far sparks travel away from main bolt
		self.MinPartsPerSpark, self.MaxPartsPerSpark = 8, 10 -- // Adjustable

		--*

		self.SparksN = 0
		self.SlotTable = {}
		self.RefIndex = #ActiveSparks + 1

		ActiveSparks[self.RefIndex] = self

		return self
	end

	function LightningSparks:Destroy()
		ActiveSparks[self.RefIndex] = nil

		for i, v in pairs(self.SlotTable) do
			if v._Parts[1].Parent == nil then
				self.SlotTable[i] = nil -- // Removes reference to prevent memory leak
			end
		end

		self.SlotTable = nil
		self = nil
	end

	function RandomVectorOffset(v, maxAngle) -- // returns uniformly-distributed random unit vector no more than maxAngle radians away from v
		return (CFrame.lookAt(Vector3.new(), v) * CFrame.Angles(0, 0, rng:NextNumber(0, 2 * math.pi)) * CFrame.Angles(
			math.acos(rng:NextNumber(math.cos(maxAngle), 1)),
			0,
			0
		)).LookVector
	end

	game:GetService("RunService").Heartbeat:Connect(function()
		for _, ThisSpark in pairs(ActiveSparks) do
			if ThisSpark.Enabled == true and ThisSpark.SparksN < ThisSpark.MaxSparkCount then
				local Bolt = ThisSpark.LightningBolt

				if Bolt._Parts[1].Parent == nil then
					ThisSpark:Destroy()
					return
				end

				local BoltParts = Bolt._Parts
				local BoltPartsN = #BoltParts

				local opaque_parts = {}

				for part_i = 1, #BoltParts do -- // Fill opaque_parts table
					if BoltParts[part_i].Transparency < 0.3 then -- // minimum opacity required to be able to generate a spark there
						opaque_parts[#opaque_parts + 1] = (part_i - 0.5) / BoltPartsN
					end
				end

				local minSlot, maxSlot

				if #opaque_parts ~= 0 then
					minSlot, maxSlot = math.ceil(opaque_parts[1] * ThisSpark.MaxSparkCount),
						math.ceil(opaque_parts[#opaque_parts] * ThisSpark.MaxSparkCount)
				end

				for _ = 1, rng:NextInteger(1, ThisSpark.MaxSparkCount - ThisSpark.SparksN) do
					if #opaque_parts == 0 then
						break
					end

					local available_slots = {}

					for slot_i = minSlot, maxSlot do -- // Fill available_slots table
						if ThisSpark.SlotTable[slot_i] == nil then -- // check slot doesn't have existing spark
							available_slots[#available_slots + 1] = slot_i
						end
					end

					if #available_slots ~= 0 then
						local ChosenSlot = available_slots[rng:NextInteger(1, #available_slots)]
						local localTrng = rng:NextNumber(-0.5, 0.5)
						local ChosenT = (ChosenSlot - 0.5 + localTrng) / ThisSpark.MaxSparkCount

						local dist, ChosenPart = 10, 1

						for opaque_i = 1, #opaque_parts do
							local testdist = math.abs(opaque_parts[opaque_i] - ChosenT)
							if testdist < dist then
								dist, ChosenPart = testdist, math.floor((opaque_parts[opaque_i] * BoltPartsN + 0.5) + 0.5)
							end
						end

						local Part = BoltParts[ChosenPart]

						-- // Make new spark--

						local A1, A2 = {}, {}
						A1.WorldPosition = Part.Position + localTrng * Part.CFrame.RightVector * Part.Size.X
						A2.WorldPosition = A1.WorldPosition
							+ RandomVectorOffset(Part.CFrame.RightVector, math.pi / 4)
								* rng:NextNumber(ThisSpark.MinDistance, ThisSpark.MaxDistance)
						A1.WorldAxis = (A2.WorldPosition - A1.WorldPosition).Unit
						A2.WorldAxis = A1.WorldAxis
						local NewSpark = LightningBolt.new(
							A1,
							A2,
							rng:NextInteger(ThisSpark.MinPartsPerSpark, ThisSpark.MaxPartsPerSpark)
						)

						-- // NewSpark.MaxAngleOffset = math.rad(70)
						NewSpark.MinRadius, NewSpark.MaxRadius = 0, 0.8
						NewSpark.AnimationSpeed = 0
						NewSpark.Thickness = Part.Size.Y / 2
						NewSpark.MinThicknessMultiplier, NewSpark.MaxThicknessMultiplier = 1, 1
						NewSpark.PulseLength = 0.5
						NewSpark.PulseSpeed = rng:NextNumber(ThisSpark.MinSpeed, ThisSpark.MaxSpeed)
						NewSpark.FadeLength = 0.25
						local cH, _, cV = Color3.toHSV(Part.Color)
						NewSpark.Color = Color3.fromHSV(cH, 0.5, cV)

						ThisSpark.SlotTable[ChosenSlot] = NewSpark

						--
					end
				end
			end

			-- // Update SparksN--

			local slotsInUse = 0

			for i, v in pairs(ThisSpark.SlotTable) do
				if v._Parts[1].Parent ~= nil then
					slotsInUse = slotsInUse + 1
				else
					ThisSpark.SlotTable[i] = nil -- // Removes reference to prevent memory leak
				end
			end

			ThisSpark.SparksN = slotsInUse

			--
		end
	end)
end

-- // LightningExplosion Submodule

local LightningExplosion

do
	-- // Converting needed ParticleEmitters
	-- // ExplosionBrightspot

	local ExplosionBrightspot = Instance.new("ParticleEmitter")
	ExplosionBrightspot.ZOffset = 2
	ExplosionBrightspot.Brightness = 1
	ExplosionBrightspot.LightEmission = 1
	ExplosionBrightspot.LightInfluence = 0
	ExplosionBrightspot.Name = "ExplosionBrightspot"
	ExplosionBrightspot.Squash = NumberSequence.new(0)
	ExplosionBrightspot.Texture = "rbxassetid://243098098"
	ExplosionBrightspot.Transparency = NumberSequence.new(0)
	ExplosionBrightspot.Color = ColorSequence.new(Color3.new(0, 1, 0))
	
	ExplosionBrightspot.Drag = 0
	ExplosionBrightspot.Rate = 1000
	ExplosionBrightspot.Enabled = false
	ExplosionBrightspot.Speed = NumberRange.new(0, 0)
	ExplosionBrightspot.SpreadAngle = Vector2.new(0, 0)
	ExplosionBrightspot.RotSpeed = NumberRange.new(0, 0)
	ExplosionBrightspot.Rotation = NumberRange.new(0, 360)
	ExplosionBrightspot.Lifetime = NumberRange.new(.2, .2)

	ExplosionBrightspot.Size = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 10),
		NumberSequenceKeypoint.new(.117, .211),
		NumberSequenceKeypoint.new(.342, 9.526),
		NumberSequenceKeypoint.new(.479, .842),
		NumberSequenceKeypoint.new(.673, 9.789),
		NumberSequenceKeypoint.new(.793, 1.632),
		NumberSequenceKeypoint.new(1, 10)
	})


	-- // GlareEmitter

	local GlareEmitter = Instance.new("ParticleEmitter")
	GlareEmitter.ZOffset = 15
	GlareEmitter.Brightness = 1
	GlareEmitter.LightEmission = 1
	GlareEmitter.LightInfluence = 0
	GlareEmitter.Name = "GlareEmitter"
	GlareEmitter.Size = NumberSequence.new(30)
	GlareEmitter.Squash = NumberSequence.new(0)
	GlareEmitter.Texture = "rbxassetid://243660364"
	GlareEmitter.Color = ColorSequence.new(Color3.new(0, 1, 0))

	GlareEmitter.Drag = 0
	GlareEmitter.Rate = 5555
	GlareEmitter.Enabled = false
	GlareEmitter.Speed = NumberRange.new(0, 0)
	GlareEmitter.RotSpeed = NumberRange.new(0, 0)
	GlareEmitter.Rotation = NumberRange.new(0, 360)
	GlareEmitter.Lifetime = NumberRange.new(.1, .1)
	GlareEmitter.SpreadAngle = Vector2.new(360, 360)

	GlareEmitter.Transparency = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 1),
		NumberSequenceKeypoint.new(.5, .744),
		NumberSequenceKeypoint.new(1, 1)
	})

	-- // PlasmaEmitter

	local PlasmaEmitter = Instance.new("ParticleEmitter")
	PlasmaEmitter.ZOffset = 5
	PlasmaEmitter.Brightness = 1
	PlasmaEmitter.LightEmission = 1
	PlasmaEmitter.LightInfluence = 1
	PlasmaEmitter.Name = "PlasmaEmitter"
	PlasmaEmitter.Size = NumberSequence.new(18)
	PlasmaEmitter.Squash = NumberSequence.new(0)
	PlasmaEmitter.Color = ColorSequence.new(Color3.new(0, 1, 0))
	PlasmaEmitter.Texture = "rbxasset://textures/particles/sparkles_main.dds"

	PlasmaEmitter.Drag = 0
	PlasmaEmitter.Rate = 10000
	PlasmaEmitter.Enabled = false
	PlasmaEmitter.RotSpeed = NumberRange.new(0, 0)
	PlasmaEmitter.Speed = NumberRange.new(100, 100)
	PlasmaEmitter.SpreadAngle = Vector2.new(90, 90)
	PlasmaEmitter.Rotation = NumberRange.new(0, 360)
	PlasmaEmitter.Lifetime = NumberRange.new(.1, .2)

	PlasmaEmitter.Transparency = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 1),
		NumberSequenceKeypoint.new(1, .3)
	})

	-- // Properties do not update in realtime here
	-- // i.e. You can't change explosion properties at any time beyond the initial function execution

	local rng_v = Random.new()
	local clock = os.clock

	function RandomVectorOffsetBetween(v, minAngle, maxAngle) -- // returns uniformly-distributed random unit vector no more than maxAngle radians away from v and no less than minAngle radians
		return (CFrame.lookAt(Vector3.new(), v)*CFrame.Angles(0, 0, rng_v:NextNumber(0, 2*math.pi))*CFrame.Angles(math.acos(rng_v:NextNumber(math.cos(maxAngle), math.cos(minAngle))), 0, 0)).LookVector
	end


	local ActiveExplosions = {}


	LightningExplosion = {}
	LightningExplosion.__index = LightningExplosion

	function LightningExplosion.new(Position, Size, NumBolts, Color, BoltColor, UpVector)
		local self = setmetatable({}, LightningExplosion)
		
		-- // Main (default) Properties--
		
			self.Size = Size or 1 -- // Value between 0 and 1 (1 for largest)
			self.NumBolts = NumBolts or 14 -- // Number of lightning bolts shot out from explosion
			self.Color = Color or ColorSequence.new(Color3.new(1, 0, 0), Color3.new(0, 0, 1)) -- // Can be a Color3 or ColorSequence
			self.BoltColor = BoltColor or Color3.new(0.3, 0.3, 1) -- // Can be a Color3 or ColorSequence
			self.UpVector = UpVector or Vector3.new(0, 1, 0) -- // Can be used to "rotate" the explosion
		
		--
		
		local parent = script
		
		local part = Instance.new("Part")
		part.Name = "LightningExplosion"
		part.Anchored = true
		part.CanCollide = false
		part.Locked = true
		part.CastShadow = false
		part.Transparency = 1
		part.Size = Vector3.new(0.05, 0.05, 0.05)
		part.CFrame = CFrame.lookAt(Position + Vector3.new(0, 0.5, 0), Position + Vector3.new(0, 0.5, 0) + self.UpVector)*CFrame.lookAt(Vector3.new(), Vector3.new(0, 1, 0)):inverse()
		part.Parent = parent
		
		local attach = Instance.new("Attachment")
		attach.Parent = part
		attach.CFrame = CFrame.new()
		
		local partEmit1 = ExplosionBrightspot:Clone()
		local partEmit2 = GlareEmitter:Clone()
		local partEmit3 = PlasmaEmitter:Clone()
		
		local size = math.clamp(self.Size, 0, 1)
		
		partEmit2.Size = NumberSequence.new(30*size)
		partEmit3.Size = NumberSequence.new(18*size)
		partEmit3.Speed = NumberRange.new(100*size)
		
		partEmit1.Parent = attach
		partEmit2.Parent = attach
		partEmit3.Parent = attach
		
		local color = self.Color
		
		if typeof(color) == "Color3" then
			partEmit2.Color, partEmit3.Color = ColorSequence.new(color), ColorSequence.new(color)
			local cH, cS, cV = Color3.toHSV(color)
			partEmit1.Color = ColorSequence.new(Color3.fromHSV(cH, 0.5, cV))
		else -- // ColorSequence
			partEmit2.Color, partEmit3.Color = color, color
			local keypoints = color.Keypoints 
			for i = 1, #keypoints do
				local cH, cS, cV = Color3.toHSV(keypoints[i].Value)
				keypoints[i] = ColorSequenceKeypoint.new(keypoints[i].Time, Color3.fromHSV(cH, 0.5, cV))
			end
			partEmit1.Color = ColorSequence.new(keypoints)
		end
		
		partEmit1.Enabled, partEmit2.Enabled, partEmit3.Enabled = true, true, true
		
		local bolts = {}
		
		for i = 1, self.NumBolts do
			local A1, A2 = {}, {}

			A1.WorldPosition, A1.WorldAxis = attach.WorldPosition, RandomVectorOffsetBetween(self.UpVector, math.rad(65), math.rad(80))
			A2.WorldPosition, A2.WorldAxis = attach.WorldPosition + A1.WorldAxis*rng_v:NextNumber(20, 40)*1.4*size, RandomVectorOffsetBetween(-self.UpVector, math.rad(70), math.rad(110))
			-- // local curve0, curve1 = rng_v:NextNumber(0, 10)*size, rng_v:NextNumber(0, 10)*size
			local NewBolt = LightningBolt.new(A1, A2, 10)
			NewBolt.AnimationSpeed = 0
	--		NewBolt.Thickness = 1 --*size
			NewBolt.Color = self.BoltColor
			NewBolt.PulseLength = 0.8
			NewBolt.ColorOffsetSpeed = 20
			NewBolt.Frequency = 3
			NewBolt.MinRadius, NewBolt.MaxRadius = 0, 4*size
			NewBolt.FadeLength = 0.4
			NewBolt.PulseSpeed = 5
			NewBolt.MinThicknessMultiplier, NewBolt.MaxThicknessMultiplier = 0.7, 1

			local NewSparks = LightningSparks.new(NewBolt)
			NewSparks.MinDistance, NewSparks.MaxDistance = 7.5, 10
			
			NewBolt.Velocity = (A2.WorldPosition - A1.WorldPosition).Unit*0.1*size
			-- // NewBolt.v0, NewBolt.v1 = rng_v:NextNumber(0, 5)*size, rng_v:NextNumber(0, 5)*size
			
			bolts[#bolts + 1] = NewBolt
		end
		
		self.Bolts = bolts
		self.Attachment = attach
		self.Part = part
		self.StartT = clock()
		self.RefIndex = #ActiveExplosions + 1

		ActiveExplosions[self.RefIndex] = self

		return self
	end

	function LightningExplosion:Destroy()
		ActiveExplosions[self.RefIndex] = nil
		self.Part:Destroy()
		
		for i = 1, #self.Bolts do
			self.Bolts[i] = nil
		end
		
		self = nil
	end

	game:GetService("RunService").Heartbeat:Connect(function ()
		
		for _, ThisExplosion in pairs(ActiveExplosions) do
			
			local timePassed = clock() - ThisExplosion.StartT
			local attach = ThisExplosion.Attachment
			
			if timePassed < .7 then 
				
				if timePassed > .2 then
					attach.ExplosionBrightspot.Enabled, attach.GlareEmitter.Enabled, attach.PlasmaEmitter.Enabled = false, false, false
				end
				
				for i = 1, #ThisExplosion.Bolts do 
					
					local currBolt = ThisExplosion.Bolts[i]
					currBolt.Attachment1.WorldPosition = currBolt.Attachment1.WorldPosition + currBolt.Velocity
					-- // currBolt.CurveSize0, currBolt.CurveSize1 = currBolt.CurveSize0 + currBolt.v0, currBolt.CurveSize1 + currBolt.v1
					
				end
				
			else
				
				ThisExplosion:Destroy()
				
			end
			
		end
		
	end)
end

return LightningBolt, LightningSparks, LightningExplosion
