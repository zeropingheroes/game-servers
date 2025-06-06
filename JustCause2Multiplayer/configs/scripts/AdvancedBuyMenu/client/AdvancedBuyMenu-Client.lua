function BuyMenu:__init()
    self.active = false
	
	BuyMenuLineColor	=	Color(255, 255, 255, 255)
	BuyMenuMoneyColor	=	Color(255, 255, 255, 255)
	
    self.window = Window.Create()
    self.window:SetSizeRel( Vector2( 0.5, 0.5 ) )
    self.window:SetPositionRel( Vector2( 0.5, 0.5 ) - self.window:GetSizeRel()/2 )
    self.window:SetVisible( self.active )
    self.window:SetTitle( "Advanced Buy Menu" )
    self.window:Subscribe( "WindowClosed", self, self.Close )

    self.tab_control = TabControl.Create( self.window )
    self.tab_control:SetDock( GwenPosition.Fill )

    local base1 = BaseWindow.Create( self.window )
    base1:SetDock( GwenPosition.Bottom )
    base1:SetSize( Vector2( self.window:GetSize().x, 32 ) )

    local background = Rectangle.Create( base1 )
    background:SetSizeRel( Vector2( 0.5, 1.0 ) )
    background:SetDock( GwenPosition.Fill )
    background:SetColor( Color( 0, 0, 0, 100 ) )

    self.money_text = Label.Create( background )
    self.money_text:SetDock( GwenPosition.Fill )
    self.money_text:SetAlignment( GwenPosition.Center )
    self.money_text:SetTextColor(BuyMenuMoneyColor)

    self:UpdateMoneyString()

    self.buy_button = Button.Create( base1 )
    self.buy_button:SetWidthAutoRel(0.5)
    self.buy_button:SetText( "Buy" )
    self.buy_button:SetDock( GwenPosition.Right )
    self.buy_button:Subscribe( "Press", self, self.Buy )

    self.categories = {}

    self.tone1 = Color( 255, 255, 255 )
    self.tone2 = Color( 255, 255, 255 )
	
	self.tone1Picker = nil
	self.tone2Picker = nil

    self:CreateItems()
    self:LoadCategories()

    self.sort_dir = false
    self.last_column = -1
	
	player_hats = {}
	player_coverings = {}
	player_hairs = {}
	player_faces = {}
	player_necks = {}
	player_backs = {}
	player_torso = {}
	player_righthand = {}
	player_lefthand = {}
	player_legs = {}
	player_rightfoot = {}
	player_leftfoot = {}

    Events:Subscribe( "Render", self, self.Render )
    Events:Subscribe( "KeyUp", self, self.KeyUp )
    Events:Subscribe( "LocalPlayerInput", self, self.LocalPlayerInput )
    Events:Subscribe( "LocalPlayerMoneyChange", self, self.LocalPlayerMoneyChange )
    Events:Subscribe( "ModuleLoad", self, self.ModulesLoad )
    Events:Subscribe( "ModulesLoad", self, self.ModulesLoad )
    Events:Subscribe( "ModuleUnload", self, self.ModuleUnload )
	
	Events:Subscribe("Render", self, self.RenderAppearanceHat)
	Events:Subscribe("PlayerNetworkValueChange", self, self.PlayerValueChangeAppearance)
	Events:Subscribe("EntitySpawn", self, self.EntitySpawnAppearance)
	Events:Subscribe("EntityDespawn", self, self.EntityDespawnAppearance)
	Events:Subscribe("ModuleLoad", self, self.ModuleLoadAppearance)
	Events:Subscribe("ModuleUnload", self, self.ModuleUnloadAppearance)
	
	-- Load color from server
	Network:Subscribe("BuyMenuSavedColor", self, self.SavedColor)
	
	-- Get color from server
	Network:Send("BuyMenuGetSaveColor")
end

function BuyMenu:RenderAppearanceHat()
	for p in Client:GetStreamedPlayers() do
		self:MoveAppearance(p)
	end
	self:MoveAppearance(LocalPlayer)
end

function BuyMenu:CreateAppearance(player)
	self:RemoveAppearance(player)	
	local hatModel = player:GetValue("AppearanceHat")
	local coveringModel = player:GetValue("AppearanceCovering")
	local hairModel = player:GetValue("AppearanceHair")
	local faceModel = player:GetValue("AppearanceFace")
	local neckModel = player:GetValue("AppearanceNeck")
	local backModel = player:GetValue("AppearanceBack")
	local torsoModel = player:GetValue("AppearanceTorso")
	local righthandModel = player:GetValue("AppearanceRightHand")
	local lefthandModel = player:GetValue("AppearanceLeftHand")
	local legsModel = player:GetValue("AppearanceLegs")
	local rightfootModel = player:GetValue("AppearanceRightFoot")
	local leftfootModel = player:GetValue("AppearanceLeftFoot")
	if hatModel ~= nil and string.len(hatModel) >= 10 then
			player_hats[player:GetId()] = ClientStaticObject.Create({
			position = player:GetBonePosition("ragdoll_Head"),
			angle = player:GetBoneAngle("ragdoll_Head"),
			model = hatModel
			})
	else
		if player_hats[player:GetId()] ~= nil then
			if IsValid( player_hats[player:GetId()], false ) then
				player_hats[player:GetId()]:Remove()
			end
			player_hats[player:GetId()] = nil
		end
	end
	if coveringModel ~= nil and string.len(coveringModel) >= 10 then
			player_coverings[player:GetId()] = ClientStaticObject.Create({
			position = player:GetBonePosition("ragdoll_Head"),
			angle = player:GetBoneAngle("ragdoll_Head"),
			model = coveringModel
			})
	else
		if player_coverings[player:GetId()] ~= nil then
			if IsValid( player_coverings[player:GetId()], false ) then
				player_coverings[player:GetId()]:Remove()
			end
			player_coverings[player:GetId()] = nil
		end
	end
	if hairModel ~= nil and string.len(hairModel) >= 10 then
		player_hairs[player:GetId()] = ClientStaticObject.Create({
		position = player:GetBonePosition("ragdoll_Head"),
		angle = player:GetBoneAngle("ragdoll_Head"),
		model = hairModel
		})
	else
		if player_hairs[player:GetId()] ~= nil then
			if IsValid( player_hairs[player:GetId()], false ) then
				player_hairs[player:GetId()]:Remove()
			end
			player_hairs[player:GetId()] = nil
		end
	end
	if faceModel ~= nil and string.len(faceModel) >= 10 then
			player_faces[player:GetId()] = ClientStaticObject.Create({
			position = player:GetBonePosition("ragdoll_Head"),
			angle = player:GetBoneAngle("ragdoll_Head"),
			model = faceModel
			})
	else
		if player_faces[player:GetId()] ~= nil then
			if IsValid( player_faces[player:GetId()], false ) then
				player_faces[player:GetId()]:Remove()
			end
			player_faces[player:GetId()] = nil
		end
	end
	if neckModel ~= nil and string.len(neckModel) >= 10 then
			player_necks[player:GetId()] = ClientStaticObject.Create({
			position = player:GetBonePosition("ragdoll_Head"),
			angle = player:GetBoneAngle("ragdoll_Head"),
			model = neckModel
			})
	else
		if player_necks[player:GetId()] ~= nil then
			if IsValid( player_necks[player:GetId()], false ) then
				player_necks[player:GetId()]:Remove()
			end
			player_necks[player:GetId()] = nil
		end
	end
	if backModel ~= nil and string.len(backModel) >= 10 then
			player_backs[player:GetId()] = ClientStaticObject.Create({
			position = player:GetBonePosition("ragdoll_Spine1"),
			angle = player:GetBoneAngle("ragdoll_Spine1"),
			model = backModel
			})
	else
		if player_backs[player:GetId()] ~= nil then
			if IsValid( player_backs[player:GetId()], false ) then
				player_backs[player:GetId()]:Remove()
			end
			player_backs[player:GetId()] = nil
		end
	end
	if torsoModel ~= nil and string.len(torsoModel) >= 10 then
			player_torso[player:GetId()] = ClientStaticObject.Create({
			position = player:GetBonePosition("ragdoll_Spine1"),
			angle = player:GetBoneAngle("ragdoll_Spine1"),
			model = torsoModel
			})
	else
		if player_torso[player:GetId()] ~= nil then
			if IsValid( player_torso[player:GetId()], false ) then
				player_torso[player:GetId()]:Remove()
			end
			player_torso[player:GetId()] = nil
		end
	end
	if righthandModel ~= nil and string.len(righthandModel) >= 10 then
			player_righthand[player:GetId()] = ClientStaticObject.Create({
			position = player:GetBonePosition("ragdoll_RightForeArm"),
			angle = player:GetBoneAngle("ragdoll_RightForeArm"),
			model = righthandModel
			})
	else
		if player_righthand[player:GetId()] ~= nil then
			if IsValid( player_righthand[player:GetId()], false ) then
				player_righthand[player:GetId()]:Remove()
			end
			player_righthand[player:GetId()] = nil
		end
	end
	if lefthandModel ~= nil and string.len(lefthandModel) >= 10 then
		player_lefthand[player:GetId()] = ClientStaticObject.Create({
		position = player:GetBonePosition("ragdoll_LeftForeArm"),
		angle = player:GetBoneAngle("ragdoll_LeftForeArm"),
		model = lefthandModel
		})
	else
		if player_lefthand[player:GetId()] ~= nil then
			if IsValid( player_lefthand[player:GetId()], false ) then
				player_lefthand[player:GetId()]:Remove()
			end
			player_lefthand[player:GetId()] = nil
		end
	end
	if legsModel ~= nil and string.len(legsModel) >= 10 then
			player_legs[player:GetId()] = ClientStaticObject.Create({
			position = player:GetBonePosition("ragdoll_Hips"),
			angle = player:GetBoneAngle("ragdoll_Hips"),
			model = legsModel
			})
	else
		if player_legs[player:GetId()] ~= nil then
			if IsValid( player_legs[player:GetId()], false ) then
				player_legs[player:GetId()]:Remove()
			end
			player_legs[player:GetId()] = nil
		end
	end
	if rightfootModel ~= nil and string.len(rightfootModel) >= 10 then
			player_rightfoot[player:GetId()] = ClientStaticObject.Create({
			position = player:GetBonePosition("ragdoll_RightFoot"),
			angle = player:GetBoneAngle("ragdoll_RightFoot"),
			model = rightfootModel
			})
	else
		if player_rightfoot[player:GetId()] ~= nil then
			if IsValid( player_rightfoot[player:GetId()], false ) then
				player_rightfoot[player:GetId()]:Remove()
			end
			player_rightfoot[player:GetId()] = nil
		end
	end
	if leftfootModel ~= nil and string.len(leftfootModel) >= 10 then
			player_leftfoot[player:GetId()] = ClientStaticObject.Create({
			position = player:GetBonePosition("ragdoll_LeftFoot"),
			angle = player:GetBoneAngle("ragdoll_LeftFoot"),
			model = leftfootModel
			})
	else
		if player_leftfoot[player:GetId()] ~= nil then
			if IsValid( player_leftfoot[player:GetId()], false ) then
				player_leftfoot[player:GetId()]:Remove()
			end
			player_leftfoot[player:GetId()] = nil
		end
	end
end

function BuyMenu:RemoveAppearance(player)
	if player_hats[player:GetId()] ~= nil then
		if IsValid( player_hats[player:GetId()], false ) then
			player_hats[player:GetId()]:Remove()
		end
		player_hats[player:GetId()] = nil
	end
	if player_coverings[player:GetId()] ~= nil then
		if IsValid( player_coverings[player:GetId()], false ) then
			player_coverings[player:GetId()]:Remove()
		end
		player_coverings[player:GetId()] = nil
	end
	if player_hairs[player:GetId()] ~= nil then
		if IsValid( player_hairs[player:GetId()], false ) then
			player_hairs[player:GetId()]:Remove()
		end
		player_hairs[player:GetId()] = nil
	end
	if player_faces[player:GetId()] ~= nil then
		if IsValid( player_faces[player:GetId()], false ) then
			player_faces[player:GetId()]:Remove()
		end
		player_faces[player:GetId()] = nil
	end
	if player_necks[player:GetId()] ~= nil then
		if IsValid( player_necks[player:GetId()], false ) then
			player_necks[player:GetId()]:Remove()
		end
		player_necks[player:GetId()] = nil
	end
	if player_backs[player:GetId()] ~= nil then
		if IsValid( player_backs[player:GetId()], false ) then
			player_backs[player:GetId()]:Remove()
		end
		player_backs[player:GetId()] = nil
	end
	
	if player_torso[player:GetId()] ~= nil then
		if IsValid( player_torso[player:GetId()], false ) then
			player_torso[player:GetId()]:Remove()
		end
		player_torso[player:GetId()] = nil
	end
	if player_righthand[player:GetId()] ~= nil then
		if IsValid( player_righthand[player:GetId()], false ) then
			player_righthand[player:GetId()]:Remove()
		end
		player_righthand[player:GetId()] = nil
	end
	if player_lefthand[player:GetId()] ~= nil then
		if IsValid( player_lefthand[player:GetId()], false ) then
			player_lefthand[player:GetId()]:Remove()
		end
		player_lefthand[player:GetId()] = nil
	end
	if player_legs[player:GetId()] ~= nil then
		if IsValid( player_legs[player:GetId()], false ) then
			player_legs[player:GetId()]:Remove()
		end
		player_legs[player:GetId()] = nil
	end
	if player_rightfoot[player:GetId()] ~= nil then
		if IsValid( player_rightfoot[player:GetId()], false ) then
			player_rightfoot[player:GetId()]:Remove()
		end
		player_rightfoot[player:GetId()] = nil
	end
	if player_leftfoot[player:GetId()] ~= nil then
		if IsValid( player_leftfoot[player:GetId()], false ) then
			player_leftfoot[player:GetId()]:Remove()
		end
		player_leftfoot[player:GetId()] = nil
	end
end

function BuyMenu:MoveAppearance(player)
	if IsValid(player) then
		local hat = player_hats[player:GetId()]
		local covering = player_coverings[player:GetId()]
		local hair = player_hairs[player:GetId()]
		local face = player_faces[player:GetId()]
		local neck = player_necks[player:GetId()]
		local back = player_backs[player:GetId()]
		local torso = player_torso[player:GetId()]
		local righthand = player_righthand[player:GetId()]
		local lefthand = player_lefthand[player:GetId()]
		local legs = player_legs[player:GetId()]
		local rightfoot = player_rightfoot[player:GetId()]
		local leftfoot = player_leftfoot[player:GetId()]

		if hat ~= nil and IsValid(hat) then
			hat:SetAngle(player:GetBoneAngle("ragdoll_Head"))
			local AppearanceOffset = hat:GetAngle() * Vector3(0,1.62,.03)
			hat:SetPosition(player:GetBonePosition("ragdoll_Head") - AppearanceOffset) 
		end
		if covering ~= nil and IsValid(covering) then
			covering:SetAngle(player:GetBoneAngle("ragdoll_Head"))
			local AppearanceOffset = covering:GetAngle() * Vector3(0,1.62,.03)
			covering:SetPosition(player:GetBonePosition("ragdoll_Head") - AppearanceOffset) 
		end
		if hair ~= nil and IsValid(hair) then
			hair:SetAngle(player:GetBoneAngle("ragdoll_Head"))
			local AppearanceOffset = hair:GetAngle() * Vector3(0,1.61,.03)
			hair:SetPosition(player:GetBonePosition("ragdoll_Head") - AppearanceOffset) 
		end
		if face ~= nil and IsValid(face) then
			face:SetAngle(player:GetBoneAngle("ragdoll_Head"))
			local AppearanceOffset = face:GetAngle() * Vector3(0,1.65,.0375)
			face:SetPosition(player:GetBonePosition("ragdoll_Head") - AppearanceOffset) 
		end
		if neck ~= nil and IsValid(neck) then
			neck:SetAngle(player:GetBoneAngle("ragdoll_Head"))
			local AppearanceOffset = neck:GetAngle() * Vector3(0,1.54,.065)
			neck:SetPosition(player:GetBonePosition("ragdoll_Head") - AppearanceOffset) 
		end
		if back ~= nil and IsValid(back) then
			back:SetAngle(player:GetBoneAngle("ragdoll_Spine1"))
			local AppearanceOffset = back:GetAngle() * Vector3(0,1.225,0.05)
			back:SetPosition(player:GetBonePosition("ragdoll_Spine1") - AppearanceOffset) 
		end

		if torso ~= nil and IsValid(torso) then
			torso:SetAngle(player:GetBoneAngle("ragdoll_Spine1"))
			local AppearanceOffset = torso:GetAngle() * Vector3(0,1.225,0.05)
			torso:SetPosition(player:GetBonePosition("ragdoll_Spine1") - AppearanceOffset) 
		end
		if righthand ~= nil and IsValid(righthand) then
			righthand:SetAngle(player:GetBoneAngle("ragdoll_RightForeArm"))
			local AppearanceOffset = righthand:GetAngle() * Vector3(0,0,0)
			righthand:SetPosition(player:GetBonePosition("ragdoll_RightForeArm") - AppearanceOffset) 
		end
		if lefthand ~= nil and IsValid(lefthand) then
			lefthand:SetAngle(player:GetBoneAngle("ragdoll_LeftForeArm"))
			local AppearanceOffset = lefthand:GetAngle() * Vector3(0,0,0)
			lefthand:SetPosition(player:GetBonePosition("ragdoll_LeftForeArm") - AppearanceOffset) 
		end
		if legs ~= nil and IsValid(legs) then
			legs:SetAngle(player:GetBoneAngle("ragdoll_Hips"))
			local AppearanceOffset = legs:GetAngle() * Vector3(0,0,0)
			legs:SetPosition(player:GetBonePosition("ragdoll_Hips") - AppearanceOffset) 
		end
		if rightfoot ~= nil and IsValid(rightfoot) then
			rightfoot:SetAngle(player:GetBoneAngle("ragdoll_RightFoot"))
			local AppearanceOffset = rightfoot:GetAngle() * Vector3(0,0,0)
			rightfoot:SetPosition(player:GetBonePosition("ragdoll_RightFoot") - AppearanceOffset) 
		end
		if leftfoot ~= nil and IsValid(leftfoot) then
			leftfoot:SetAngle(player:GetBoneAngle("ragdoll_LeftFoot"))
			local AppearanceOffset = leftfoot:GetAngle() * Vector3(0,0,0)
			leftfoot:SetPosition(player:GetBonePosition("ragdoll_LeftFoot") - AppearanceOffset) 
		end
	end
end

function BuyMenu:PlayerValueChangeAppearance(args)
	if args.key == "AppearanceHat" or 
	args.key == "AppearanceCovering" or
	args.key == "AppearanceHair" or
	args.key == "AppearanceFace" or
	args.key == "AppearanceNeck" or
	args.key == "AppearanceBack" or
	args.key == "AppearanceTorso" or
	args.key == "AppearanceRightHand" or
	args.key == "AppearanceLeftHand" or
	args.key == "AppearanceLegs" or
	args.key == "AppearanceRightFoot" or
	args.key == "AppearanceLeftFoot" then
	self:CreateAppearance(args.player)
	end
end

function BuyMenu:EntitySpawnAppearance(args)
	if args.entity.__type == "Player" then
		self:CreateAppearance(args.entity)
	end
end

function BuyMenu:EntityDespawnAppearance(args)
	if args.entity.__type == "Player" then
		self:RemoveAppearance(args.entity)
	end
end

function BuyMenu:ModuleLoadAppearance()
	for p in Client:GetStreamedPlayers() do
		self:CreateAppearance(p)
	end
	self:CreateAppearance(LocalPlayer)
end

function BuyMenu:ModuleUnloadAppearance()
	for k, v in pairs(player_hats) do
		if IsValid(v, false) then
			v:Remove()
		end
	end
	for k, v in pairs(player_coverings) do
		if IsValid(v, false) then
			v:Remove()
		end
	end
	for k, v in pairs(player_hairs) do
		if IsValid(v, false) then
			v:Remove()
		end
	end
	for k, v in pairs(player_faces) do
		if IsValid(v, false) then
			v:Remove()
		end
	end
	for k, v in pairs(player_necks) do
		if IsValid(v, false) then
			v:Remove()
		end
	end
	for k, v in pairs(player_backs) do
		if IsValid(v, false) then
			v:Remove()
		end
	end
	for k, v in pairs(player_torso) do
		if IsValid(v, false) then
			v:Remove()
		end
	end
	for k, v in pairs(player_righthand) do
		if IsValid(v, false) then
			v:Remove()
		end
	end
	for k, v in pairs(player_lefthand) do
		if IsValid(v, false) then
			v:Remove()
		end
	end
	for k, v in pairs(player_legs) do
		if IsValid(v, false) then
			v:Remove()
		end
	end
	for k, v in pairs(player_rightfoot) do
		if IsValid(v, false) then
			v:Remove()
		end
	end
	for k, v in pairs(player_leftfoot) do
		if IsValid(v, false) then
			v:Remove()
		end
	end
end

function BuyMenu:SavedColor(args)
	if self.tone1Picker == nil or self.tone2Picker == nil then return end

	local tone1 = args.tone1
	local tone2 = args.tone2
	
	self.tone1 = tone1
	self.tone2 = tone2
	self.tone1Picker:SetColor(self.tone1)
	self.tone2Picker:SetColor(self.tone2)
end

function BuyMenu:CreateCategory( category_name )
    local t = {}
    t.window = BaseWindow.Create( self.window )
    t.window:SetDock( GwenPosition.Fill )
    t.button = self.tab_control:AddPage( category_name, t.window )

    t.tab_control = TabControl.Create( t.window )
    t.tab_control:SetDock( GwenPosition.Fill )

    t.categories = {}

    self.categories[category_name] = t

    return t
end

function BuyMenu:SortFunction( column, a, b )
    if column ~= -1 then
        self.last_column = column
    elseif column == -1 and self.last_column ~= -1 then
        column = self.last_column
    else
        column = 0
    end

    local a_value = a:GetCellText(column)
    local b_value = b:GetCellText(column)

    if column == 1 then
        local a_num = tonumber(a_value)
        local b_num = tonumber(b_value)

        if a_num ~= nil and b_num ~= nil then
            a_value = a_num
            b_value = b_num
        end
    end

    if self.sort_dir then
        return a_value > b_value
    else
        return a_value < b_value
    end
end

function BuyMenu:CreateSubCategory( category, subcategory_name )
    local t = {}
    t.window = BaseWindow.Create( self.window )
    t.window:SetDock( GwenPosition.Fill )
    t.button = category.tab_control:AddPage( subcategory_name, t.window )

    t.listbox = SortedList.Create( t.window )
    t.listbox:SetDock( GwenPosition.Fill )
    t.listbox:AddColumn( "Item" )
    t.listbox:AddColumn( "Price", 128 )
    t.listbox:SetSort( self, self.SortFunction )

    t.listbox:Subscribe( "SortPress",
        function(button)
            self.sort_dir = not self.sort_dir
        end)

    category.categories[subcategory_name] = t

    return t
end

function BuyMenu:LoadCategories()
    for category_id, category in ipairs(self.items) do
        local category_table = self:CreateCategory(self.id_types[category_id])

        for _, subcategory_name in ipairs(category[1]) do
            local subcategory = category[subcategory_name]

            local subcategory_table = 
                self:CreateSubCategory( category_table, subcategory_name )

            local item_id = 0

            for _, entry in pairs(subcategory) do
                item_id = item_id + 1
                local row = subcategory_table.listbox:AddItem( entry:GetName() )
				row:SetTextColor(BuyMenuLineColor)
                row:SetDataNumber( "id", item_id )

                row:SetCellText( 1, tostring(entry:GetPrice()) )

                entry:SetListboxItem( row )
            end
        end

        -- Slightly hacky
        if category_id == self.types.Vehicle then
            local window = BaseWindow.Create( self.window )
            window:SetDock( GwenPosition.Fill )
            category_table.tab_control:AddPage( "Colours", window )

            local tab_control = TabControl.Create( window )
            tab_control:SetDock( GwenPosition.Fill )

            self.tone1Picker = HSVColorPicker.Create()
            tab_control:AddPage( "Tone 1", self.tone1Picker )
            self.tone1Picker:SetDock( GwenPosition.Fill )
			
            self.tone1Picker:Subscribe( "ColorChanged", function()
				self.tone1 = self.tone1Picker:GetColor()
				self.colorChanged = true
			end )
			
            self.tone1Picker:SetColor( Color( 255, 255, 255 ) )
            self.tone1 = self.tone1Picker:GetColor()

            self.tone2Picker = HSVColorPicker.Create()
            tab_control:AddPage( "Tone 2", self.tone2Picker )
            self.tone2Picker:SetDock( GwenPosition.Fill )
			
            self.tone2Picker:Subscribe( "ColorChanged", function()
				self.tone2 = self.tone2Picker:GetColor() 
				self.colorChanged = true
			end )
			
            self.tone2Picker:SetColor( Color( 255, 255, 255 ) )
            self.tone2 = self.tone2Picker:GetColor()
			--	Sets the default color to the Player's color	--
			self.tone1Picker:SetColor(LocalPlayer:GetColor())
			self.tone2Picker:SetColor(LocalPlayer:GetColor())
            
            local setColorBtn = Button.Create(window)
            setColorBtn:SetText("Set Color")
            setColorBtn:SetDock( GwenPosition.Bottom )
            setColorBtn:Subscribe( "Down", function()
                Network:Send( "ColorChanged", { tone1 = self.tone1, tone2 = self.tone2 } )
            end )
        end
    end
end

function BuyMenu:UpdateMoneyString( money )
    if money == nil then
        money = LocalPlayer:GetMoney()
    end

    self.money_text:SetText( 
        string.format( "Money: $%i",
                        money ) )
end

function BuyMenu:LocalPlayerMoneyChange( args )
    self:UpdateMoneyString( args.new_money )
end

function BuyMenu:GetActive()
    return self.active
end

function BuyMenu:SetActive( active )
    if self.active ~= active then
        if active == true and LocalPlayer:GetWorld() ~= DefaultWorld then
            Chat:Print( "You are not in the main world!", Color( 255, 0, 0 ) )
            return
        end

        self.active = active
        Mouse:SetVisible( self.active )
		if not self.active and self.colorChanged then
			self.colorChanged = false
			Network:Send("BuyMenuSaveColor", {tone1 = self.tone1, tone2 = self.tone2})
		end
    end
end

function BuyMenu:Render()
    local is_visible = self.active and (Game:GetState() == GUIState.Game)

    if self.window:GetVisible() ~= is_visible then
        self.window:SetVisible( is_visible )
    end

    if self.active then
        Mouse:SetVisible( true )
    end
end

function BuyMenu:KeyUp( args )
    if args.key == string.byte('B') then
        self:SetActive( not self:GetActive() )
    end
end

function BuyMenu:LocalPlayerInput( args )
    if self.active and Game:GetState() == GUIState.Game then
        return false
    end
end

function BuyMenu:ModulesLoad()
    Events:Fire( "HelpAddItem",
        {
            name = "Advanced Buy Menu",
            text = 
                "Press B to open the buymenu. Then select an item and click Buy.\n" ..
                "Any vehicles you buy through the buy menu will be removed when you leave the server.\n" ..
                "Models and appearances will appear again the next time you join.\n" ..
                "\n:: Advanced Buymenu with Templates, Decals, Hats, Saved Colors, and Saved Appearance System was made by JasonMRC, of the Problem Solvers with some help from Eraknelo.\n" ..
                "\n:: Buymenu with Categorized Tabs was made by Urik Kane.\n" ..
                "\n:: The Original Buymenu Script was made by Philpax, a Developer of JC2-MP.\n"
        } )
end

function BuyMenu:ModuleUnload()
    Events:Fire( "HelpRemoveItem",
        {
            name = "Advanced Buy Menu"
        } )
end

function BuyMenu:Buy( args )
    local category_name = self.tab_control:GetCurrentTab():GetText()
    local category = self.categories[category_name]

    local subcategory_name = category.tab_control:GetCurrentTab():GetText() 
    local subcategory = category.categories[subcategory_name]

    if subcategory == nil then return end

    local listbox = subcategory.listbox

    local first_selected_item = listbox:GetSelectedRow()

    if first_selected_item ~= nil then
        local index = first_selected_item:GetDataNumber( "id" )
        Network:Send( "PlayerFired", { self.types[category_name], subcategory_name, index, self.tone1, self.tone2 } )
        self:SetActive( false )
    end
end

function BuyMenu:Close( args )
    self:SetActive( false )
end

local buy_menu = BuyMenu()
