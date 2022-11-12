-- made by https://v3rmillion.net/member.php?action=profile&uid=603166


local GUI = Instance.new("ScreenGui", game.CoreGui)
local Frame = Instance.new("Frame", GUI)
local title = Instance.new("TextLabel")
local close = Instance.new("TextButton")
local box = Instance.new("TextBox")
local play = Instance.new("TextButton")
local ac = Instance.new("TextButton")

GUI.Name = "GUI"

Frame.BackgroundColor3 = Color3.fromRGB(58, 58, 58)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.0828947425, 0, 0.198133111, 0)
Frame.Size = UDim2.new(0, 166, 0, 163)
Frame.Draggable = true
Frame.Active = true

title.Parent = Frame
title.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
title.BorderSizePixel = 0
title.Size = UDim2.new(0, 166, 0, 16)
title.Font = Enum.Font.SourceSansBold
title.Text = "  Retail Tycoon GUI"
title.TextColor3 = Color3.fromRGB(189, 189, 189)
title.TextScaled = true
title.TextSize = 14
title.TextWrapped = true
title.TextXAlignment = Enum.TextXAlignment.Left

close.Parent = Frame
close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
close.BackgroundTransparency = 1.000
close.Position = UDim2.new(0.903614461, 0, 0, 0)
close.Size = UDim2.new(0, 16, 0, 16)
close.Font = Enum.Font.SourceSansBold
close.Text = "X"
close.TextColor3 = Color3.fromRGB(66, 135, 245)
close.TextSize = 14
close.TextYAlignment = Enum.TextYAlignment.Top

box.Parent = Frame
box.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
box.BackgroundTransparency = 0.9
box.BorderColor3 = Color3.fromRGB(17, 17, 17)
box.Position = UDim2.new(0,50,0,33)
box.Size = UDim2.new(0, 69, 0, 12)
box.Font = Enum.Font.SourceSansBold
box.PlaceholderColor3 = Color3.fromRGB(189, 189, 189)
box.Text = ""
box.TextColor3 = Color3.fromRGB(189, 189, 189)
box.TextSize = 10

play.Parent = Frame
play.Active = false
play.BackgroundColor3 = Color3.fromRGB(81, 81, 81)
play.BackgroundTransparency = 0.3
play.Position = box.Position + UDim2.new(0, 76, 0, 0)
play.Size = UDim2.new(0, 30, 0, 12)
play.Font = Enum.Font.SourceSansBold
play.Text = "Play"
play.TextColor3 = Color3.fromRGB(189, 189, 189)
play.TextSize = 12
play.TextYAlignment = Enum.TextYAlignment.Top
play.AutoButtonColor = false
play.BorderSizePixel = 0

idlbl = title:clone()
idlbl.Parent = Frame
idlbl.Text = "ID:"
idlbl.TextSize = 12
idlbl.TextScaled = false
idlbl.Position = box.Position - UDim2.new(0, 26, 0, 0)
idlbl.Size = play.Size
idlbl.BackgroundTransparency = 1

musiclbl = idlbl:clone()
musiclbl.Parent = Frame
musiclbl.Text = "In-store Music"
musiclbl.Position = idlbl.Position - UDim2.new(0,10,0,16)
musiclbl.Size = title.Size

ac.Parent = Frame
ac.Active = false
ac.BackgroundColor3 = Color3.fromRGB(81, 81, 81)
ac.BackgroundTransparency = 0.3
ac.Position = UDim2.new(0.0659999996, 0, 0.451000005, 0)
ac.Size = UDim2.new(.875, 0, 0, 17)
ac.Font = Enum.Font.SourceSansBold
ac.Text = "Auto Clean"
ac.TextColor3 = Color3.fromRGB(189, 189, 189)
ac.TextSize = 14
ac.TextWrapped = true
ac.BorderSizePixel = 0
ac.AutoButtonColor = false

am = ac:clone()
am.Parent = Frame
am.Position = UDim2.new(0.0662650615, 0, 0.587912202, 0)
am.Text = "Auto Collect Money Tree(s)"

fs = am:clone()
fs.Parent = Frame
fs.Position = am.Position + UDim2.new(0,0,0,22)
fs.Text = "Always 5 Star Rating"

ac.Size = UDim2.new(.4, 0, 0, 17)

arstck = ac:clone()
arstck.Parent = Frame
arstck.Position = ac.Position - UDim2.new(0,0,0,22)
arstck.TextWrapped = false
arstck.Text = "Auto Restock"
arstck.TextSize = 13

ar = ac:clone()
ar.Parent = Frame
ar.Position = ac.Position + UDim2.new(0, 78, 0, 0)
ar.Text = "Auto Arrest"

ais = ar:clone()
ais.Text = "Inf Storage"
ais.Parent = Frame
ais.Position = ar.Position - UDim2.new(0,0,0,22)

am:clone()

credits = title:clone()
credits.Parent = Frame
credits.Position = UDim2.new(0, 0, 0.875, 0)
credits.BackgroundTransparency = 1
credits.Text = "  bvthxry#0001 / Waiting"

function tween(i,s,p)
    game:GetService("TweenService"):Create(i, TweenInfo.new(s), p):play()
end

function toggle(button, bool)
	tween(button, .1, {BackgroundColor3 = bool and Color3.fromRGB(66, 135, 245) or Color3.fromRGB(81,81,81)})
end

close.MouseButton1Click:connect(function()
    if loops then 
	    for loop, _ in pairs(loops) do
	        loops[loop] = false
        end
    end
    
	for i, v in pairs(Frame:GetChildren())do
	    tween(v, .1, {BackgroundTransparency = 1, TextTransparency = 1})
	end
	
	tween(Frame, .1, {BackgroundTransparency = 1})
	wait(.1)
	GUI:Destroy()
end)

local tycoon
repeat
    tycoon = workspace.Functions.GetTycoon:InvokeServer()
    wait()
until tycoon
credits.Text = "  bvthxry#0001 / Loaded"


local debs = {
    restock = false
}

local loops = {
    clean = {
        e = false,
        f = function()
            for i, v in pairs(tycoon.Tiles:GetChildren()) do 
                if v:FindFirstChild("Spill") then
                    for i = 1, v.Spill.Amount.Value do 
                        spawn(function()
                            workspace.Functions.CleanSpill:FireServer(v.Spill)
                        end)
                    end
                end
            end
        end
    },
    collecttreemoney = {
        e = false,
        f = function()
            for i, v in pairs(tycoon.Tiles:GetDescendants())do
		        if v:IsA("Part") and v.Name == "TreeMoney" then
		        	firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 0)
		        	firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 1)
		        end
	        end
        end
    },
    arrest = {
        e = false,
        f = function()
            for i,v in pairs(workspace.NPCModel:children()) do 
                if v:FindFirstChild("HitboxPart") then
                    workspace.Functions.CatchRobber:FireServer(tonumber(tycoon.Name:match("%d+")), v.Num.Value)
                end
            end
        end
    },
    fivestars = {
        e = false,
        f = function()
            workspace.Functions.EditTycoon:FireServer(tycoon,"Rating",5.1)
        end
    },
    infstorage = {
        e = false,
        f = function()
            tycoon.Storage.Max.Value = 9e9
        end
    },
    restock = {
        e = false,
        debounce = false,
        f = function()
            if debs.restock then return end
            for _, t in pairs(tycoon.Tiles:GetChildren()) do
                for i, displayitem in pairs(t:GetChildren()) do
                    if displayitem:IsA("Model") and displayitem:FindFirstChild("Item") then
                        spawn(function()
                            workspace.Functions.Restock:InvokeServer(tycoon, displayitem)
                        end)
                    end
                end
            end
            debs.restock = true
            delay(7, function()
                debs.restock = false
            end)
        end
    },
}

ac.MouseButton1Click:connect(function()
	loops.clean.e = not loops.clean.e 
	toggle(ac, loops.clean.e)
end)

arstck.MouseButton1Click:connect(function()
	loops.restock.e = not loops.restock.e 
	toggle(arstck, loops.restock.e)
end)

fs.MouseButton1Click:connect(function()
	loops.fivestars.e = not loops.fivestars.e
	toggle(fs, loops.fivestars.e)
end)

ais.MouseButton1Click:connect(function()
    loops.infstorage.e = not loops.infstorage.e 
	toggle(ais, loops.infstorage.e)
end)

am.MouseButton1Click:connect(function()
	loops.collecttreemoney.e = not loops.collecttreemoney.e 
	toggle(am, loops.collecttreemoney.e)
end)

ar.MouseButton1Click:connect(function()
	loops.arrest.e = not loops.arrest.e 
	toggle(ar, loops.arrest.e)
end)

play.MouseButton1Click:connect(function()
	workspace.Functions.EditTycoon:FireServer(tycoon, "Song", tonumber(box.Text:match("%d+")))
	toggle(play, true)
	wait(5/60)
	toggle(play, false)
end)

while wait(1) do
    for i, loop in next, loops do 
        if loop.e then
            spawn(loop.f)
        end
    end
end
