-------------------------------------------------------------------------------------------------------------------------------

if not game:IsLoaded() then game.Loaded:Wait() end local t = task.wait

-------------------------------------------------------------------------------------------------------------------------------

local plrs = game:GetService("Players")
local reps = game:GetService("ReplicatedStorage")
local rs = game:GetService("RunService")
local ts = game:GetService("TweenService")
local uis = game:GetService("UserInputService")
local sgui = game:GetService("StarterGui")
local tcs = game:GetService("TextChatService")
local pfs = game:GetService("PathfindingService")
local targetui = gethui() or game:GetService("CoreGui")
local getgenv = getgenv() or _G

local plr = plrs.LocalPlayer
local cam = workspace.CurrentCamera
local mouse = plr:GetMouse()
local user = plr.Name
local char = plr.Character or plr.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")
local root = char:WaitForChild("HumanoidRootPart")

-------------------------------------------------------------------------------------------------------------------------------

function updcharrefs(character)
	if not character then return end
	char = character

	local human = character:WaitForChild("Humanoid", 5)
	if not human then return end
	hum = human

	local hrp = character:WaitForChild("HumanoidRootPart", 5)
	if not hrp then return end
	root = hrp
end

if char then updcharrefs(plr.Character) end
plr.CharacterAdded:Connect(function(char) t() updcharrefs(char) end)

workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() cam = workspace.CurrentCamera end)

-------------------------------------------------------------------------------------------------------------------------------

local exists = targetui:FindFirstChild("alt account manager")
if exists then exists:Destroy() end 

local gui = Instance.new("ScreenGui")
gui.Name = "alt account manager"
gui.ResetOnSpawn = false
gui.Parent = targetui

-------------------------------------------------------------------------------------------------------------------------------

local function hi(text, dur, button)
	task.spawn(function()
		sgui:SetCore("SendNotification", {
			Title = "alt account manager",
			Text = text,
			Duration = dur or 2,

			Button1 = button or nil,
		})
	end)
end

local function descision(text, dur, button1text, button2text, button1callback, button2callback)
	local bindable = Instance.new("BindableFunction")

	function bindable.OnInvoke(response)
		if response:lower() == button1text then
			if button1callback then
				button1callback()
			end
		elseif response:lower() == button2text then
			if button2callback then
				button2callback()
			end
		end
	end

	sgui:SetCore("SendNotification", {
		Title = "alt account manager",
		Text = text,
		Duration = dur or 2,
		Button1 = button1text,
		Button2 = button2text,
		Callback = bindable
	})
end

-------------------------------------------------------------------------------------------------------------------------------

aamhandler = {}
aamhandler.handshakenclients = {}
aamhandler.id = "rbxassetid://248263260"
aamhandler.mainid = "rbxassetid://176236333"
aamhandler.recievedconfirmationid = "rbxassetid://181526230"
aamhandler.maincommandid = "rbxassetid://259438880"
aamhandler.cansend = true
aamhandler.commands = {}
aamhandler.waitingforaccounttype = true
aamhandler.alts = {}

local function ok(state) aamhandler.alt = state aamhandler.waitingforaccounttype = false end
descision("what are you", 999, "main", "alt", function() ok(false) end, function() ok(true) end)

repeat t() until not aamhandler.waitingforaccounttype
if aamhandler.alt then hi("now scanning for main account signal", 1) gui.Parent = reps end

-------------------------------------------------------------------------------------------------------------------------------

local mainframe = Instance.new("Frame")
mainframe.Size = UDim2.new(0, 350, 0, 304)
mainframe.AnchorPoint = Vector2.new(0.5, 0.5)
mainframe.Position = UDim2.new(0.5, 0, -1, 0)
mainframe.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mainframe.BackgroundTransparency = 1
mainframe.BorderSizePixel = 0
mainframe.Draggable = true
mainframe.Active = true
mainframe.Parent = gui

ts:Create(mainframe, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = UDim2.fromOffset(cam.ViewportSize.X / 2, cam.ViewportSize.Y / 2 - 51)}):Play()

local toptab = Instance.new("Frame")
toptab.Size = UDim2.new(1, -56, 0, 26)
toptab.BackgroundTransparency = 0.6
toptab.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
toptab.BackgroundTransparency = 0.6
toptab.BorderSizePixel = 0
toptab.Parent = mainframe

local container = Instance.new("Frame")
container.Size = UDim2.new(1, -50, 1, -162)
container.Position = UDim2.new(0, 50, 0, 134)
container.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
container.BackgroundTransparency = 0.6
container.BorderSizePixel = 0
container.Parent = mainframe

local slotscontainer = Instance.new("Frame")
slotscontainer.Size = UDim2.new(0, 48, 1, -28)
slotscontainer.Position = UDim2.new(0, 0, 0, 28)
slotscontainer.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
slotscontainer.BackgroundTransparency = 1
slotscontainer.BorderSizePixel = 0
slotscontainer.Parent = mainframe

local userdisplay = Instance.new("Frame")
userdisplay.Size = UDim2.new(1, -50, 0, 76)
userdisplay.Position = UDim2.new(0, 50, 0, 28)
userdisplay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
userdisplay.BackgroundTransparency = 0.6
userdisplay.BorderSizePixel = 0
userdisplay.Parent = mainframe

-------------------------------------------------------------------------------------------------------------------------------

local title = Instance.new("TextLabel")
title.Size = UDim2.new(0, 90, 0, 26)
title.Position = UDim2.new(0, 6, 0, 0)
title.BackgroundTransparency = 1
title.Text = "alt account manager"
title.Font = Enum.Font.SourceSansBold
title.TextSize = 18
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextXAlignment = Enum.TextXAlignment.Left
title.TextYAlignment = Enum.TextYAlignment.Center
title.Parent = toptab

local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 26, 0, 26)
close.Position = UDim2.new(1, 30, 0, 0)
close.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
close.BorderSizePixel = 0
close.BackgroundTransparency = 0.6
close.Text = "x"
close.Font = Enum.Font.SourceSansBold
close.TextSize = 18
close.TextColor3 = Color3.fromRGB(255, 255, 255)
close.TextYAlignment = Enum.TextYAlignment.Center
close.Parent = toptab
Instance.new("UIPadding", close).PaddingBottom = UDim.new(0, 2)

local minimize = Instance.new("TextButton")
minimize.Size = UDim2.new(0, 26, 0, 26)
minimize.Position = UDim2.new(1, 2, 0, 0)
minimize.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
minimize.BorderSizePixel = 0
minimize.BackgroundTransparency = 0.6
minimize.Text = "-"
minimize.Font = Enum.Font.SourceSansBold
minimize.TextSize = 18
minimize.TextColor3 = Color3.fromRGB(255, 255, 255)
minimize.TextYAlignment = Enum.TextYAlignment.Center
minimize.Parent = toptab
Instance.new("UIPadding", minimize).PaddingBottom = UDim.new(0, 2)

-------------------------------------------------------------------------------------------------------------------------------

local userlisttitle = Instance.new("TextLabel")
userlisttitle.Size = UDim2.new(1, 0, 0, 26)
userlisttitle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
userlisttitle.BackgroundTransparency = 0.6
userlisttitle.BorderSizePixel = 0
userlisttitle.Text = "alts"
userlisttitle.Font = Enum.Font.SourceSans
userlisttitle.TextSize = 14
userlisttitle.TextColor3 = Color3.fromRGB(255, 255, 255)
userlisttitle.TextYAlignment = Enum.TextYAlignment.Center
userlisttitle.Parent = slotscontainer

local selected = Instance.new("UIStroke")
selected.Color = Color3.fromRGB(102, 141, 226)
selected.Thickness = 5
selected.BorderOffset = UDim.new(0, -5)
selected.LineJoinMode = Enum.LineJoinMode.Miter

local slot1 = Instance.new("ImageButton")
slot1.Size = UDim2.new(0, 48, 0, 48)
slot1.Position = UDim2.new(0, 0, 0, 28)
slot1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
slot1.BackgroundTransparency = 0.6
slot1.BorderSizePixel = 0
slot1.Parent = slotscontainer
slot1.AutoButtonColor = false
selected.Parent = slot1

local user1 = Instance.new("ImageLabel")
user1.Size = UDim2.new(1, -10, 1, -10)
user1.AnchorPoint = Vector2.new(0.5, 0.5)
user1.Position = UDim2.new(0.5, 0, 0.5, 0)
user1.Image = "rbxthumb://type=AvatarHeadShot&id=1&w=420&h=420"
user1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
user1.BackgroundTransparency = 1
user1.Parent = slot1

local slot2 = Instance.new("ImageButton")
slot2.Size = UDim2.new(0, 48, 0, 48)
slot2.Position = UDim2.new(0, 0, 0, (48 * 2) - 18)
slot2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
slot2.BackgroundTransparency = 0.6
slot2.BorderSizePixel = 0
slot2.AutoButtonColor = false
slot2.Parent = slotscontainer

local user2 = Instance.new("ImageLabel")
user2.Size = UDim2.new(1, -10, 1, -10)
user2.AnchorPoint = Vector2.new(0.5, 0.5)
user2.Position = UDim2.new(0.5, 0, 0.5, 0)
user2.Image = "rbxthumb://type=AvatarHeadShot&id=1&w=420&h=420"
user2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
user2.BackgroundTransparency = 1
user2.Parent = slot2

local slot3 = Instance.new("ImageButton")
slot3.Size = UDim2.new(0, 48, 0, 48)
slot3.Position = UDim2.new(0, 0, 0, (48 * 3) - 16)
slot3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
slot3.BackgroundTransparency = 0.6
slot3.BorderSizePixel = 0
slot3.AutoButtonColor = false
slot3.Parent = slotscontainer

local user3 = Instance.new("ImageLabel")
user3.Size = UDim2.new(1, -10, 1, -10)
user3.AnchorPoint = Vector2.new(0.5, 0.5)
user3.Position = UDim2.new(0.5, 0, 0.5, 0)
user3.Image = "rbxthumb://type=AvatarHeadShot&id=1&w=420&h=420"
user3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
user3.BackgroundTransparency = 1
user3.Parent = slot3

local slot4 = Instance.new("ImageButton")
slot4.Size = UDim2.new(0, 48, 0, 48)
slot4.Position = UDim2.new(0, 0, 0, (48 * 4) - 14)
slot4.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
slot4.BackgroundTransparency = 0.6
slot4.BorderSizePixel = 0
slot4.AutoButtonColor = false
slot4.Parent = slotscontainer

local user4 = Instance.new("ImageLabel")
user4.Size = UDim2.new(1, -10, 1, -10)
user4.AnchorPoint = Vector2.new(0.5, 0.5)
user4.Position = UDim2.new(0.5, 0, 0.5, 0)
user4.Image = "rbxthumb://type=AvatarHeadShot&id=1&w=420&h=420"
user4.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
user4.BackgroundTransparency = 1
user4.Parent = slot4

local slot5 = Instance.new("ImageButton")
slot5.Size = UDim2.new(0, 48, 0, 48)
slot5.Position = UDim2.new(0, 0, 0, (48 * 5) - 12)
slot5.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
slot5.BackgroundTransparency = 0.6
slot5.BorderSizePixel = 0
slot5.AutoButtonColor = false
slot5.Parent = slotscontainer

local user5 = Instance.new("ImageLabel")
user5.Size = UDim2.new(1, -10, 1, -10)
user5.AnchorPoint = Vector2.new(0.5, 0.5)
user5.Position = UDim2.new(0.5, 0, 0.5, 0)
user5.Image = "rbxthumb://type=AvatarHeadShot&id=1&w=420&h=420"
user5.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
user5.BackgroundTransparency = 1
user5.Parent = slot5

-------------------------------------------------------------------------------------------------------------------------------

local profilepicturedisplay = Instance.new("ImageLabel")
profilepicturedisplay.Size = UDim2.new(0, 66, 0, 66)
profilepicturedisplay.Image = "rbxthumb://type=AvatarHeadShot&id=1&w=420&h=420"
profilepicturedisplay.Position = UDim2.new(0, 5, 0, 5)
profilepicturedisplay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
profilepicturedisplay.BackgroundTransparency = 1
profilepicturedisplay.BorderSizePixel = 0
profilepicturedisplay.Parent = userdisplay

local displaynamedisplay = Instance.new("TextLabel")
displaynamedisplay.Size = UDim2.new(0, 120, 0, 18)
displaynamedisplay.Position = UDim2.new(0, 76, 0, 6)
displaynamedisplay.Text = "OnlyTwentyCharacters"
displaynamedisplay.TextColor3 = Color3.fromRGB(255, 255, 255)
displaynamedisplay.TextSize = 18
displaynamedisplay.Font = Enum.Font.SourceSansBold
displaynamedisplay.BackgroundTransparency = 1
displaynamedisplay.TextXAlignment = Enum.TextXAlignment.Left
displaynamedisplay.Parent = userdisplay

local usernamedisplay = Instance.new("TextLabel")
usernamedisplay.Size = UDim2.new(0, 120, 0, 18)
usernamedisplay.Position = UDim2.new(0, 76, 0, 21)
usernamedisplay.Text = "(@onlytwentycharacters)"
usernamedisplay.TextColor3 = Color3.fromRGB(255, 255, 255)
usernamedisplay.TextSize = 14
usernamedisplay.Font = Enum.Font.SourceSans
usernamedisplay.BackgroundTransparency = 1
usernamedisplay.BorderSizePixel = 0
usernamedisplay.TextXAlignment = Enum.TextXAlignment.Left
usernamedisplay.Parent = userdisplay

local altiddisplay = Instance.new("TextLabel")
altiddisplay.Size = UDim2.new(0, 120, 0, 18)
altiddisplay.Position = UDim2.new(0, 76, 0, 40)
altiddisplay.Text = "alt id: 1"
altiddisplay.TextColor3 = Color3.fromRGB(255, 255, 255)
altiddisplay.TextSize = 18
altiddisplay.Font = Enum.Font.SourceSansBold
altiddisplay.BackgroundTransparency = 1
altiddisplay.TextXAlignment = Enum.TextXAlignment.Left
altiddisplay.Parent = userdisplay

local confirmedtimedisplay = Instance.new("TextLabel")
confirmedtimedisplay.Size = UDim2.new(0, 120, 0, 18)
confirmedtimedisplay.Position = UDim2.new(0, 76, 0, 53)
confirmedtimedisplay.Text = "registered on ??:??:??"
confirmedtimedisplay.TextColor3 = Color3.fromRGB(255, 255, 255)
confirmedtimedisplay.TextSize = 14
confirmedtimedisplay.Font = Enum.Font.SourceSans
confirmedtimedisplay.BackgroundTransparency = 1
confirmedtimedisplay.TextXAlignment = Enum.TextXAlignment.Left
confirmedtimedisplay.Parent = userdisplay

-------------------------------------------------------------------------------------------------------------------------------

local commandlisttitle = Instance.new("TextLabel")
commandlisttitle.Size = UDim2.new(1, -50, 0, 26)
commandlisttitle.Position = UDim2.new(0, 50, 0, 106)
commandlisttitle.Text = "list of commands"
commandlisttitle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
commandlisttitle.BackgroundTransparency = 0.6
commandlisttitle.BorderSizePixel = 0
commandlisttitle.Font = Enum.Font.SourceSansBold
commandlisttitle.TextSize = 18
commandlisttitle.TextColor3 = Color3.fromRGB(255, 255, 255)
commandlisttitle.TextYAlignment = Enum.TextYAlignment.Center
commandlisttitle.TextXAlignment = Enum.TextXAlignment.Left
commandlisttitle.Parent = mainframe
Instance.new("UIPadding", commandlisttitle).PaddingLeft = UDim.new(0, 6)

local commandbar = Instance.new("TextBox")
commandbar.Size = UDim2.new(1, -114, 0, 26)
commandbar.Position = UDim2.new(0, 50, 1, -26)
commandbar.PlaceholderText = "command bar"
commandbar.Text = ""
commandbar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
commandbar.BackgroundTransparency = 0.6
commandbar.BorderSizePixel = 0
commandbar.Font = Enum.Font.SourceSans
commandbar.TextSize = 14
commandbar.TextColor3 = Color3.fromRGB(255, 255, 255)
commandbar.TextYAlignment = Enum.TextYAlignment.Center
commandbar.TextXAlignment = Enum.TextXAlignment.Left
commandbar.Parent = mainframe
Instance.new("UIPadding", commandbar).PaddingLeft = UDim.new(0, 6)

local executebutton = Instance.new("TextButton")
executebutton.Size = UDim2.new(0, 62, 0, 26)
executebutton.Position = UDim2.new(1, -62, 1, -26)
executebutton.Text = "execute"
executebutton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
executebutton.BackgroundTransparency = 0.6
executebutton.BorderSizePixel = 0
executebutton.Font = Enum.Font.SourceSansBold
executebutton.TextSize = 18
executebutton.TextColor3 = Color3.fromRGB(255, 255, 255)
executebutton.TextYAlignment = Enum.TextYAlignment.Center
executebutton.Parent = mainframe

local function runCommandBar()
	local input = commandbar.Text
	if input ~= "" and input ~= " " then
		local parts = input:split(" ")
		local cmd = parts[1]:lower()
		local args = table.concat(parts, " ", 2)

		if cmd == "tptool" or cmd == "walktotool" then
			local commandFunc = aamhandler.commands[cmd]
			if commandFunc then
				commandFunc(args)
			end
		else
			aamhandler:broadcastcommand(input)
		end
	end
end

executebutton.MouseButton1Click:Connect(function()
	runCommandBar()
end)

commandbar.FocusLost:Connect(function(enterPressed)
	if enterPressed then
		runCommandBar()
		commandbar.Text = ""
	end
end)

-------------------------------------------------------------------------------------------------------------------------------

local commandslist = Instance.new("ScrollingFrame")
commandslist.Size = UDim2.new(1, -8, 1, -8)
commandslist.AnchorPoint = Vector2.new(0.5, 0.5)
commandslist.Position = UDim2.new(0.5, 0, 0.5, 0)
commandslist.BackgroundTransparency = 1
commandslist.ScrollBarImageTransparency = 1
commandslist.AutomaticCanvasSize = Enum.AutomaticSize.Y
commandslist.CanvasSize = UDim2.new(0, 0, 0, 0)
commandslist.Parent = container
Instance.new("UIPadding", commandslist).PaddingBottom = UDim.new(0, 3)

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 2)
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Parent = commandslist

local function addCommandEntry(commandName, commandDescription)
	local entry = Instance.new("TextLabel")
	entry.Name = commandName
	entry.Size = UDim2.new(1, 0, 0, 14)
	entry.BackgroundTransparency = 1
	entry.TextColor3 = Color3.fromRGB(255, 255, 255)
	entry.TextXAlignment = Enum.TextXAlignment.Left
	entry.Font = Enum.Font.SourceSans
	entry.TextSize = 14
	entry.Text = commandName .. " - " .. commandDescription

	entry.Parent = commandslist
end

-------------------------------------------------------------------------------------------------------------------------------

aamhandler.mainaccount = nil

aamhandler.animations = {
	check = Instance.new("Animation"),
	main = Instance.new("Animation")
}

aamhandler.tracks = {
	check = nil,
	main = nil
}

local slotButtons = {slot1, slot2, slot3, slot4, slot5}
local slotImages = {user1, user2, user3, user4, user5}

local function refreshGui()
	for i, slotImage in ipairs(slotImages) do
		local data = aamhandler.alts[i]
		if data then
			slotImage.Image = "rbxthumb://type=AvatarHeadShot&id=" .. data.UserId .. "&w=420&h=420"
			if i == #aamhandler.alts then
				profilepicturedisplay.Image = slotImage.Image
				displaynamedisplay.Text = data.DisplayName
				usernamedisplay.Text = "(@" .. data.Name .. ")"
				altiddisplay.Text = "alt id: ?"
				confirmedtimedisplay.Text = "registered on " .. (data.Timestamp or os.date("%H:%M:%S"))
			end
		end
	end
end

local selectedconn = nil

local function updateMainDisplay(index)
	for _, altData in ipairs(aamhandler.alts) do
		local altPlayer = plrs:FindFirstChild(altData.Name)
		if altPlayer and altPlayer.Character then
			local existing = altPlayer.Character:FindFirstChild("aamhighlight")
			if existing then if selectedconn then selectedconn:Disconnect() selectedconn = nil end existing:Destroy() end
		end
	end

	local data = aamhandler.alts[index]
	local targetButton = slotButtons[index]
	selected.Parent = targetButton or reps
	altiddisplay.Text = "alt id: " .. tostring(index)

	if data then
		profilepicturedisplay.Image = "rbxthumb://type=AvatarHeadShot&id=" .. data.UserId .. "&w=420&h=420"
		displaynamedisplay.Text = data.DisplayName
		usernamedisplay.Text = "(@" .. data.Name .. ")"
		confirmedtimedisplay.Text = "registered on " .. (data.Timestamp or os.date("%H:%M:%S"))

		local targetPlayer = plrs:FindFirstChild(data.Name)
		if targetPlayer and targetPlayer.Character then
			selectedconn = rs.Heartbeat:Connect(function()
				if not targetPlayer.Character:FindFirstChild("aamhighlight") then
					local highlight = Instance.new("Highlight")
					highlight.Name = "aamhighlight"
					highlight.FillTransparency = 1
					highlight.OutlineColor = selected.Color
					highlight.OutlineTransparency = 0
					highlight.Parent = targetPlayer.Character
				end
			end)
		end
	else
		profilepicturedisplay.Image = "rbxthumb://type=AvatarHeadShot&id=1&w=420&h=420"
		displaynamedisplay.Text = "OnlyTwentyCharacters"
		usernamedisplay.Text = "(@onlytwentycharacters)"
		confirmedtimedisplay.Text = "registered on 00:00:00"
	end
end

for i, button in ipairs(slotButtons) do
	local idLabel = Instance.new("TextLabel")
	idLabel.Size = UDim2.new(0, 9, 0, 10)
	idLabel.Position = UDim2.new(0, 0, 0, 0)
	idLabel.BackgroundTransparency = 1
	idLabel.TextColor3 = Color3.new(1, 1, 1)
	idLabel.Font = Enum.Font.SourceSans
	idLabel.TextSize = 12
	idLabel.Text = tostring(i)
	idLabel.Parent = button

	button.MouseButton1Click:Connect(function()
		updateMainDisplay(i)
	end)
end

function aamhandler:confirmTomain()
	local animator = hum:FindFirstChildOfClass("Animator")
	if animator then
		local confirmAnim = Instance.new("Animation")
		confirmAnim.AnimationId = fixid(aamhandler.recievedconfirmationid)
		local track = animator:LoadAnimation(confirmAnim)
		track:Play()
		track:AdjustWeight(0.0001)
		task.delay(0.1, function() track:Stop() end)
	end
end

function aamhandler:addcmd(name, func)
	aamhandler.commands[name:lower()] = func
end

function aamhandler:broadcastcommand(inputString)
	if aamhandler.alt or not aamhandler.cansend then return end
	aamhandler.cansend = false

	local fullId = aamhandler.maincommandid .. " " .. inputString
	aamhandler.animations.main.AnimationId = fullId

	local animator = hum:FindFirstChildOfClass("Animator")
	local track = animator:LoadAnimation(aamhandler.animations.main)

	track:Play()
	track:AdjustWeight(0.0001)

	task.delay(0.1, function()
		track:Stop()
		aamhandler.cansend = true
	end)
end

local function getMyAltId()
	for i, data in ipairs(aamhandler.alts) do
		if data.UserId == game.Players.LocalPlayer.UserId then
			return i
		end
	end
	return nil
end

function aamhandler:processincoming(player, animId)
	local cleanId = fixid(animId)
	local prefix = aamhandler.maincommandid

	if cleanId:sub(1, #prefix) == prefix then
		local fullCmdString = cleanId:sub(#prefix + 2)

		local parts = fullCmdString:split(" ")
		local cmd = parts[1] and parts[1]:lower()
		local idList = parts[2]
		local args = table.concat(parts, " ", 3)

		if cmd and idList then
			local myId = tostring(getMyAltId() or "1")
			local targetIds = idList:split(",")

			if idList:lower() == "all" or table.find(targetIds, myId) then
				local commandFunc = aamhandler.commands[cmd]
				if commandFunc then
					task.spawn(function() commandFunc(args or "") end)
				end
			end
		end
	end
end

function fixid(id)
	id = tostring(id)
	id = id:gsub("http://www%.roblox%.com/asset/%?id=", "rbxassetid://")
	id = id:gsub("https://www%.roblox%.com/asset/%?id=", "rbxassetid://")
	if not id:find("rbxassetid://") then
		id = "rbxassetid://" .. id
	end
	return id
end

function aamhandler:shakehands(player, animator)
	animator.AnimationPlayed:Connect(function(track)
		if not track or not track.Animation then return end
		local animId = fixid(track.Animation.AnimationId)

		if aamhandler.alt then
			if animId:find(aamhandler.mainid) then
				hi("main account signal detected", 1)
				aamhandler.mainaccount = player 
				aamhandler:confirmTomain()
			end

			aamhandler:processincoming(player, animId)
		else
			if animId == fixid(aamhandler.recievedconfirmationid) then
				local alreadyExists = false
				for _, data in pairs(aamhandler.alts) do
					if data.UserId == player.UserId then alreadyExists = true break end
				end

				if not alreadyExists then
					local newAlt = {
						Name = player.Name,
						DisplayName = player.DisplayName,
						UserId = player.UserId,
						Timestamp = os.date("%H:%M:%S")
					}
					table.insert(aamhandler.alts, newAlt)

					refreshGui()
					updateMainDisplay(#aamhandler.alts)
				end
			end

			if animId == fixid(aamhandler.id) and math.abs(track.WeightTarget - 0.001) < 0.001 then
				if not table.find(aamhandler.handshakenclients, player.Name) then
					table.insert(aamhandler.handshakenclients, player.Name)
				end
			end
		end
	end)
end

function aamhandler:monitor(player)
	local function added(char)
		local hum = char:WaitForChild("Humanoid", 10)
		local animator = hum and hum:WaitForChild("Animator", 10)
		if animator then
			aamhandler:shakehands(player, animator)
		end
	end

	if player.Character then added(player.Character) end
	player.CharacterAdded:Connect(added)
end

task.spawn(function()
	repeat t() until char
	for _, plr in ipairs(plrs:GetPlayers()) do aamhandler:monitor(plr) end plrs.PlayerAdded:Connect(function(plr) aamhandler:monitor(plr) end)
end)

function aamhandler:requesthandshake()
	if char then
		local broadcastId = aamhandler.alt and aamhandler.id or aamhandler.mainid

		aamhandler.animations.check.AnimationId = fixid(broadcastId)
		local animator = hum:FindFirstChildOfClass("Animator")

		if not aamhandler.tracks.check then
			aamhandler.tracks.check = animator:LoadAnimation(aamhandler.animations.check)
		end

		if animator and aamhandler.tracks.check then
			local track = aamhandler.tracks.check
			track.Priority = Enum.AnimationPriority.Action
			track:Play()
			track:AdjustWeight(0.0001)
			task.delay(0.1, function()
				track:Stop()
			end)
		end
	end
end

-------------------------------------------------------------------------------------------------------------------------------

task.spawn(function()
	repeat task.wait() until plrs.LocalPlayer.Character
	for _, plr in ipairs(plrs:GetPlayers()) do aamhandler:monitor(plr) end
	plrs.PlayerAdded:Connect(function(plr) aamhandler:monitor(plr) end)
end)

task.spawn(function()
	if not getgenv.aamhandler.checking then
		while task.wait(5) do aamhandler:requesthandshake() end
	end
	getgenv.aamhandler.checking = true
end)

-------------------------------------------------------------------------------------------------------------------------------

plrs.PlayerRemoving:Connect(function(player)
	if aamhandler.mainaccount == player then
		aamhandler.mainaccount = nil
		if getgenv.aamhandler.followconn then getgenv.aamhandler.followconn:Disconnect() getgenv.aamhandler.followconn = nil end
		hi("main account left")
		return
	end

	for i, altData in ipairs(aamhandler.alts) do
		if altData.UserId == player.UserId then
			if getgenv.aamhandler.followconn then
				getgenv.aamhandler.followconn:Disconnect()
				getgenv.aamhandler.followconn = nil
			end

			table.remove(aamhandler.alts, i)

			for _, slotImage in ipairs(slotImages) do
				slotImage.Image = "rbxthumb://type=AvatarHeadShot&id=1&w=420&h=420"
			end

			refreshGui()

			updateMainDisplay(0)

			hi("alt " .. player.Name .. " has left the server", 1)
			break
		end
	end
end)

-------------------------------------------------------------------------------------------------------------------------------

local hidden = false

close.Activated:Connect(function()
	mainframe.Visible = false
	hidden = true
	hi("press F1 to show ui", 1)
end)

uis.InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.F1 then
		hidden = not hidden

		if hidden then
			mainframe.Visible = false
			hi("press F1 to show ui", 1)
		else
			mainframe.Visible = true
		end
	end
end)

local minimized = false

minimize.Activated:Connect(function()
	minimized = not minimized

	if minimized then
		container.Visible = false
		slotscontainer.Visible = false
		userdisplay.Visible = false
		executebutton.Visible = false
		commandbar.Visible = false
		commandlisttitle.Visible = false
		mainframe.Size = UDim2.new(0, 350, 0, 26)
		mainframe.Position = mainframe.Position - UDim2.new(0, 0, 0, 139)
		minimize.Text = "+"
	else
		container.Visible = true
		slotscontainer.Visible = true
		userdisplay.Visible = true
		mainframe.Size = UDim2.new(0, 350, 0, 304)
		mainframe.Position = mainframe.Position + UDim2.new(0, 0, 0, 139)
		executebutton.Visible = true
		commandbar.Visible = true
		commandlisttitle.Visible = true
		minimize.Text = "-"
	end
end)

-------------------------------------------------------------------------------------------------------------------------------

getgenv.aamhandler = aamhandler
getgenv.fixid = fixid
getgenv.addCommandEntry = addCommandEntry

-------------------------------------------------------------------------------------------------------------------------------
