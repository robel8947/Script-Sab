-- RXL Trade Script for Roblox
-- Created for Volt Executor
-- Features: Freeze Trade and Auto Accept

-- Version en une ligne pour execution directe:
-- loadstring(game:HttpGet("TON_URL_ICI"))()

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

-- UI Creation
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "RXLTrade"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
MainFrame.Size = UDim2.new(0, 300, 0, 200)
MainFrame.Draggable = true
MainFrame.Active = true

-- Title Bar
local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Parent = MainFrame
MainFrame.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
TitleBar.BorderSizePixel = 0
TitleBar.Position = UDim2.new(0, 0, 0, 0)
TitleBar.Size = UDim2.new(1, 0, 0, 40)

-- Title Label
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "TitleLabel"
TitleLabel.Parent = TitleBar
TitleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.BackgroundTransparency = 1
TitleLabel.BorderSizePixel = 0
TitleLabel.Position = UDim2.new(0, 0, 0, 0)
TitleLabel.Size = UDim2.new(1, 0, 1, 0)
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.Text = "RXL Trade"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextScaled = true
TitleLabel.TextSize = 24

-- Button Container
local ButtonContainer = Instance.new("Frame")
ButtonContainer.Name = "ButtonContainer"
ButtonContainer.Parent = MainFrame
ButtonContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ButtonContainer.BorderSizePixel = 0
ButtonContainer.Position = UDim2.new(0, 10, 0, 60)
ButtonContainer.Size = UDim2.new(1, -20, 1, -70)

-- Freeze Trade Button
local FreezeTradeButton = Instance.new("TextButton")
FreezeTradeButton.Name = "FreezeTradeButton"
FreezeTradeButton.Parent = ButtonContainer
FreezeTradeButton.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
FreezeTradeButton.BorderSizePixel = 0
FreezeTradeButton.Position = UDim2.new(0, 0, 0, 10)
FreezeTradeButton.Size = UDim2.new(1, 0, 0, 40)
FreezeTradeButton.Font = Enum.Font.SourceSansBold
FreezeTradeButton.Text = "Freeze Trade"
FreezeTradeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FreezeTradeButton.TextScaled = true
FreezeTradeButton.TextSize = 18

-- Auto Accept Button
local AutoAcceptButton = Instance.new("TextButton")
AutoAcceptButton.Name = "AutoAcceptButton"
AutoAcceptButton.Parent = ButtonContainer
AutoAcceptButton.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
AutoAcceptButton.BorderSizePixel = 0
AutoAcceptButton.Position = UDim2.new(0, 0, 0, 60)
AutoAcceptButton.Size = UDim2.new(1, 0, 0, 40)
AutoAcceptButton.Font = Enum.Font.SourceSansBold
AutoAcceptButton.Text = "Auto Accept"
AutoAcceptButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoAcceptButton.TextScaled = true
AutoAcceptButton.TextSize = 18

-- Status Labels
local FreezeStatus = Instance.new("TextLabel")
FreezeStatus.Name = "FreezeStatus"
FreezeStatus.Parent = ButtonContainer
FreezeStatus.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
FreezeStatus.BorderSizePixel = 0
FreezeStatus.Position = UDim2.new(0, 0, 0, 110)
FreezeStatus.Size = UDim2.new(1, 0, 0, 20)
FreezeStatus.Font = Enum.Font.SourceSans
FreezeStatus.Text = "Freeze Trade: OFF"
FreezeStatus.TextColor3 = Color3.fromRGB(255, 255, 255)
FreezeStatus.TextScaled = true
FreezeStatus.TextSize = 14

local AutoStatus = Instance.new("TextLabel")
AutoStatus.Name = "AutoStatus"
AutoStatus.Parent = ButtonContainer
AutoStatus.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
AutoStatus.BorderSizePixel = 0
AutoStatus.Position = UDim2.new(0, 0, 0, 135)
AutoStatus.Size = UDim2.new(1, 0, 0, 20)
AutoStatus.Font = Enum.Font.SourceSans
AutoStatus.Text = "Auto Accept: OFF"
AutoStatus.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoStatus.TextScaled = true
AutoStatus.TextSize = 14

-- Variables
local freezeTradeEnabled = false
local autoAcceptEnabled = false
local frozenPlayer = nil
local connection = nil

-- Utility Functions
local function findTradeWindow()
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("Frame") and obj.Name:lower():find("trade") then
            return obj
        end
    end
    return nil
end

local function findOtherPlayer()
    local tradeWindow = findTradeWindow()
    if not tradeWindow then return nil end
    
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            return player
        end
    end
    return nil
end

local function freezePlayer(player)
    if not player or not player.Character then return end
    
    -- Freeze character movement
    if player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.WalkSpeed = 0
        player.Character.Humanoid.JumpPower = 0
    end
    
    -- Disable tools
    for _, tool in ipairs(player.Character:GetChildren()) do
        if tool:IsA("Tool") then
            tool.CanBeDropped = false
        end
    end
end

local function unfreezePlayer(player)
    if not player or not player.Character then return end
    
    -- Restore movement
    if player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.WalkSpeed = 16
        player.Character.Humanoid.JumpPower = 50
    end
    
    -- Enable tools
    for _, tool in ipairs(player.Character:GetChildren()) do
        if tool:IsA("Tool") then
            tool.CanBeDropped = true
        end
    end
end

local function setPlayerReady(player)
    -- Try to find and click ready button for other player
    local tradeWindow = findTradeWindow()
    if not tradeWindow then return end
    
    for _, obj in ipairs(tradeWindow:GetDescendants()) do
        if obj:IsA("TextButton") and (obj.Text:lower():find("ready") or obj.Text:lower():find("accept")) then
            obj:FireServer()
            break
        end
    end
end

-- Button Functions
local function toggleFreezeTrade()
    freezeTradeEnabled = not freezeTradeEnabled
    
    if freezeTradeEnabled then
        FreezeTradeButton.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
        FreezeStatus.Text = "Freeze Trade: ON"
        
        -- Start monitoring for trade partners
        connection = RunService.Heartbeat:Connect(function()
            local otherPlayer = findOtherPlayer()
            if otherPlayer and otherPlayer ~= frozenPlayer then
                if frozenPlayer then
                    unfreezePlayer(frozenPlayer)
                end
                frozenPlayer = otherPlayer
                freezePlayer(frozenPlayer)
            elseif frozenPlayer and not findTradeWindow() then
                unfreezePlayer(frozenPlayer)
                frozenPlayer = nil
            end
        end)
    else
        FreezeTradeButton.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
        FreezeStatus.Text = "Freeze Trade: OFF"
        
        if connection then
            connection:Disconnect()
            connection = nil
        end
        
        if frozenPlayer then
            unfreezePlayer(frozenPlayer)
            frozenPlayer = nil
        end
    end
end

local function toggleAutoAccept()
    autoAcceptEnabled = not autoAcceptEnabled
    
    if autoAcceptEnabled then
        AutoAcceptButton.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
        AutoStatus.Text = "Auto Accept: ON"
        
        -- Start auto-accept loop
        spawn(function()
            while autoAcceptEnabled do
                local otherPlayer = findOtherPlayer()
                if otherPlayer then
                    setPlayerReady(otherPlayer)
                end
                wait(0.5)
            end
        end)
    else
        AutoAcceptButton.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
        AutoStatus.Text = "Auto Accept: OFF"
    end
end

-- Button Connections
FreezeTradeButton.MouseButton1Click:Connect(toggleFreezeTrade)
AutoAcceptButton.MouseButton1Click:Connect(toggleAutoAccept)

-- UI Animations
local function animateButton(button)
    local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local scaleUp = TweenService:Create(button, tweenInfo, {Size = UDim2.new(1, 0, 0, 45)})
    local scaleDown = TweenService:Create(button, tweenInfo, {Size = UDim2.new(1, 0, 0, 40)})
    
    button.MouseEnter:Connect(function()
        scaleUp:Play()
    end)
    
    button.MouseLeave:Connect(function()
        scaleDown:Play()
    end)
end

animateButton(FreezeTradeButton)
animateButton(AutoAcceptButton)

-- Notification System
local function showNotification(message)
    local notification = Instance.new("Frame")
    notification.Name = "Notification"
    notification.Parent = ScreenGui
    notification.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    notification.BorderSizePixel = 0
    notification.Position = UDim2.new(0.5, -150, 0, -50)
    notification.Size = UDim2.new(0, 300, 0, 40)
    notification.ZIndex = 1000
    
    local label = Instance.new("TextLabel")
    label.Name = "Label"
    label.Parent = notification
    label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    label.BackgroundTransparency = 1
    label.BorderSizePixel = 0
    label.Position = UDim2.new(0, 0, 0, 0)
    label.Size = UDim2.new(1, 0, 1, 0)
    label.Font = Enum.Font.SourceSans
    label.Text = message
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextScaled = true
    label.TextSize = 14
    
    -- Animate notification
    local tweenIn = TweenService:Create(notification, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -150, 0, 20)})
    local tweenOut = TweenService:Create(notification, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.new(0.5, -150, 0, -50)})
    
    tweenIn:Play()
    tweenIn.Completed:Connect(function()
        wait(2)
        tweenOut:Play()
        tweenOut.Completed:Connect(function()
            notification:Destroy()
        end)
    end)
end

-- Keybinds
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.F then
        toggleFreezeTrade()
        showNotification("Freeze Trade: " .. (freezeTradeEnabled and "ON" or "OFF"))
    elseif input.KeyCode == Enum.KeyCode.A then
        toggleAutoAccept()
        showNotification("Auto Accept: " .. (autoAcceptEnabled and "ON" or "OFF"))
    end
end)

-- Initial notification
showNotification("RXL Trade Script Loaded!")
showNotification("Press F for Freeze Trade, A for Auto Accept")

print("RXL Trade Script successfully loaded!")
print("Features: Freeze Trade (F), Auto Accept (A)")
