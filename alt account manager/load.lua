--[[---------------------------------------------------------------------------------------------------------------------------
  __   __     ______     __  __     __     ______     __  __     ______    
 /\ "-.\ \   /\  __ \   /\_\_\_\   /\ \   /\  __ \   /\ \/\ \   /\  ___\   
 \ \ \-.  \  \ \ \/\ \  \/_/\_\/_  \ \ \  \ \ \/\ \  \ \ \_\ \  \ \___  \  
  \ \_\\"\_\  \ \_____\   /\_\/\_\  \ \_\  \ \_____\  \ \_____\  \/\_____\ 
   \/_/ \/_/   \/_____/   \/_/\/_/   \/_/   \/_____/   \/_____/   \/_____/

   Made by stunt & ksu | Alt account manager (Main loader)

---------------------------------------------------------------------------------------------------------------------------]]--

if not game:IsLoaded() then game.Loaded:Wait() end

-------------------------------------------------------------------------------------------------------------------------------

-- im 34 years old and im dyin i dont know where to run
local plrs = game:GetService("Players")
local plr = plrs.LocalPlayer
local rs = game:GetService("ReplicatedStorage")
local ts = game:GetService("TweenService")
local uis = game:GetService("UserInputService")
local sgui = game:GetService("StarterGui")
local targetui = gethui() or game:GetService("CoreGui") or plr:WaitForChild("PlayerGui")

-------------------------------------------------------------------------------------------------------------------------------

local exists = targetui:FindFirstChild("alt account manager")
if exists then exists:Destroy() end 

local gui = Instance.new("ScreenGui")
gui.Name = "alt account manager"
gui.ResetOnSpawn = false
gui.Parent = targetui

-------------------------------------------------------------------------------------------------------------------------------

local function hi(text, dur, button1, callback)
	task.spawn(function()
		sgui:SetCore("SendNotification", {
			Title = "alt account manager",
			Text = text,
			Duration = dur or 2,
			
			Button1 = button1 or nil,
			Callback = callback and callback() or nil,
		})
	end)
end

hi("script successfully loaded", 999, "cool")

-------------------------------------------------------------------------------------------------------------------------------

local mainframe = Instance.new("Frame")
mainframe.Size = UDim2.new(0, 350, 0, 304)
mainframe.AnchorPoint = Vector2.new(0.5, 0.5)
mainframe.Position = UDim2.new(0.5, 0, 0.5, 0)
mainframe.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mainframe.BackgroundTransparency = 1
mainframe.BorderSizePixel = 0
mainframe.Draggable = true
mainframe.Active = true
mainframe.Parent = gui

local toptab = Instance.new("Frame")
toptab.Size = UDim2.new(1, -56, 0, 26)
toptab.BackgroundTransparency = 0.6
toptab.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
toptab.BackgroundTransparency = 0.6
toptab.BorderSizePixel = 0
toptab.Parent = mainframe

local container = Instance.new("Frame")
container.Size = UDim2.new(1, -50, 1, -106)
container.Position = UDim2.new(0, 50, 0, 106)
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

close.Activated:Connect(function()
	hi("press F1 to show ui", 1)
end)

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

minimize.Activated:Connect(function()
	hi("ui minimized", 1)
end)

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

local slot1 = Instance.new("ImageButton")
slot1.Size = UDim2.new(0, 48, 0, 48)
slot1.Position = UDim2.new(0, 0, 0, 28)
slot1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
slot1.BackgroundTransparency = 0.6
slot1.BorderSizePixel = 0
slot1.Parent = slotscontainer

local slot2 = Instance.new("ImageButton")
slot2.Size = UDim2.new(0, 48, 0, 48)
slot2.Position = UDim2.new(0, 0, 0, (48 * 2) - 18)
slot2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
slot2.BackgroundTransparency = 0.6
slot2.BorderSizePixel = 0
slot2.Parent = slotscontainer

local slot3 = Instance.new("ImageButton")
slot3.Size = UDim2.new(0, 48, 0, 48)
slot3.Position = UDim2.new(0, 0, 0, (48 * 3) - 16)
slot3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
slot3.BackgroundTransparency = 0.6
slot3.BorderSizePixel = 0
slot3.Parent = slotscontainer

local slot4 = Instance.new("ImageButton")
slot4.Size = UDim2.new(0, 48, 0, 48)
slot4.Position = UDim2.new(0, 0, 0, (48 * 4) - 14)
slot4.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
slot4.BackgroundTransparency = 0.6
slot4.BorderSizePixel = 0
slot4.Parent = slotscontainer

local slot5 = Instance.new("ImageButton")
slot5.Size = UDim2.new(0, 48, 0, 48)
slot5.Position = UDim2.new(0, 0, 0, (48 * 5) - 12)
slot5.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
slot5.BackgroundTransparency = 0.6
slot5.BorderSizePixel = 0
slot5.Parent = slotscontainer

-------------------------------------------------------------------------------------------------------------------------------

local profilepicturedisplay = Instance.new("ImageLabel")
profilepicturedisplay.Size = UDim2.new(0, 63, 0, 63)
profilepicturedisplay.Image = "rbxthumb://type=AvatarHeadShot&id=1&w=420&h=420"
profilepicturedisplay.Position = UDim2.new(0, 6, 0, 6)
profilepicturedisplay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
profilepicturedisplay.BackgroundTransparency = 1
profilepicturedisplay.BorderSizePixel = 0
profilepicturedisplay.Parent = userdisplay

local displaynamedisplay = Instance.new("TextLabel")
displaynamedisplay.Size = UDim2.new(0, 120, 0, 18)
displaynamedisplay.Position = UDim2.new(0, 75, 0, 6)
displaynamedisplay.Text = "????????????????????"
displaynamedisplay.TextColor3 = Color3.fromRGB(255, 255, 255)
displaynamedisplay.TextSize = 18
displaynamedisplay.Font = Enum.Font.SourceSansBold
displaynamedisplay.BackgroundTransparency = 1
displaynamedisplay.BorderSizePixel = 0
displaynamedisplay.TextXAlignment = Enum.TextXAlignment.Left
displaynamedisplay.Parent = userdisplay

local usernamedisplay = Instance.new("TextLabel")
usernamedisplay.Size = UDim2.new(0, 120, 0, 18)
usernamedisplay.Position = UDim2.new(0, 75, 0, 22)
usernamedisplay.Text = "(@????????????????????)"
usernamedisplay.TextColor3 = Color3.fromRGB(255, 255, 255)
usernamedisplay.TextSize = 14
usernamedisplay.Font = Enum.Font.SourceSans
usernamedisplay.BackgroundTransparency = 1
usernamedisplay.BorderSizePixel = 0
usernamedisplay.TextXAlignment = Enum.TextXAlignment.Left
usernamedisplay.Parent = userdisplay

-------------------------------------------------------------------------------------------------------------------------------
