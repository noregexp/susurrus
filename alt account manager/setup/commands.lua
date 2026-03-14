--[[---------------------------------------------------------------------------------------------------------------------------
  __   __     ______     __  __     __     ______     __  __     ______    
 /\ "-.\ \   /\  __ \   /\_\_\_\   /\ \   /\  __ \   /\ \/\ \   /\  ___\   
 \ \ \-.  \  \ \ \/\ \  \/_/\_\/_  \ \ \  \ \ \/\ \  \ \ \_\ \  \ \___  \  
  \ \_\\"\_\  \ \_____\   /\_\/\_\  \ \_\  \ \_____\  \ \_____\  \/\_____\ 
   \/_/ \/_/   \/_____/   \/_/\/_/   \/_/   \/_____/   \/_____/   \/_____/

   Made by stunt & ksu | Alt account manager (Commands)

---------------------------------------------------------------------------------------------------------------------------]]--

local t = task.wait
local plrs = game:GetService("Players")
local rs = game:GetService("RunService")
local tcs = game:GetService("TextChatService")

local plr = plrs.LocalPlayer
local cam = workspace.CurrentCamera
local mouse = plr:GetMouse()

local getgenv = getgenv() or _G
local aam = getgenv.aam
local addCommandEntry = getgenv.addCommandEntry

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

aam.addcmd("tp", function(args)
	local targetChar

	if args == "me" and aam.mainaccount then
		targetChar = aam.mainaccount.Character
	else
		local targetPlayer = plrs:FindFirstChild(args)
		if targetPlayer then targetChar = targetPlayer.Character end
	end

	if targetChar and targetChar:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("HumanoidRootPart") then
		char.HumanoidRootPart.CFrame = targetChar.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
	end
end)

addCommandEntry("tp [id] [target]", "teleports the alt to the target")

-------------------------------------------------------------------------------------------------------------------------------

aam.followconn = nil

aam.addcmd("follow", function(args)
	if aam.followconn then aam.followconn:Disconnect() end
	local targetPlayer = plrs:FindFirstChild(args) or aam.mainaccount

	if targetPlayer and targetPlayer.Character then
		local tChar = targetPlayer.Character
		aam.followconn = rs.Heartbeat:Connect(function()
			local tRoot = tChar:FindFirstChild("HumanoidRootPart")
			if not tRoot or not root or not char.Parent then 
				if aam.followconn then aam.followconn:Disconnect() end
				return 
			end

			local distance = (tRoot.Position - root.Position).Magnitude
			if distance > 5 then
				hum:MoveTo(tRoot.Position)
			else
				hum:Move(Vector3.new(0,0,0))
			end
		end)
	end
end)

addCommandEntry("follow [id] [target]", "makes the alt follow the target")

aam.addcmd("unfollow", function()
	if aam.followconn then
		aam.followconn:Disconnect()
		aam.followconn = nil
	end
	if hum then hum:Move(Vector3.new(0,0,0)) end
end)

addCommandEntry("unfollow [id]", "makes the alt stop following the target")

-------------------------------------------------------------------------------------------------------------------------------

aam.addcmd("say", function(args)
	tcs.TextChannels.RBXGeneral:SendAsync(args)
end)

addCommandEntry("say [id] [text]", "makes the alt say the target text")

-------------------------------------------------------------------------------------------------------------------------------

local function createDynamicTool(altId, mode)
	local cleanId = altId:match("^%s*(.-)%s*$")
	local toolName = mode .. " " .. cleanId

	if plr.Backpack:FindFirstChild(toolName) or (char and char:FindFirstChild(toolName)) then 
		return 
	end

	local tool = Instance.new("Tool")
	tool.Name = toolName
	tool.RequiresHandle = false
	tool.Parent = plr.Backpack

	tool.Activated:Connect(function()
		local pos = mouse.Hit.Position
		local cmdMode = (mode == "tp") and "tpto" or "walkto"

		local posString = string.format("%.2f,%.2f,%.2f", pos.X, pos.Y, pos.Z)
		aam.broadcastcommand(cmdMode .. " " .. cleanId .. " " .. posString)
	end)
end

aam.addcmd("tptool", function(args)
	local ids = args:split(",")
	for _, id in ipairs(ids) do
		createDynamicTool(id, "tp")
	end
end)

aam.addcmd("walktotool", function(args)
	local ids = args:split(",")
	for _, id in ipairs(ids) do
		createDynamicTool(id, "walkto")
	end
end)

aam.addcmd("tpto", function(args)
	local coords = args:split(",")
	if #coords >= 3 then
		local x, y, z = tonumber(coords[1]), tonumber(coords[2]), tonumber(coords[3])
		if x and y and z then
			local targetPos = Vector3.new(x, y, z)
			root.CFrame = CFrame.new(targetPos + Vector3.new(0, 3, 0))
		end
	end
end)

addCommandEntry("tptool [id]", "gives you a teleport tool for the alt")

aam.addcmd("walkto", function(args)
	local coords = args:split(",")
	if #coords >= 3 then
		local x, y, z = tonumber(coords[1]), tonumber(coords[2]), tonumber(coords[3])
		if x and y and z then
			local targetPos = Vector3.new(x, y, z)
			if aam.followconn then aam.followconn:Disconnect() aam.followconn = nil end
			hum:MoveTo(targetPos)
		end
	end
end)

addCommandEntry("walktotool [id]", "gives you a walkto tool for the alt")

-------------------------------------------------------------------------------------------------------------------------------
