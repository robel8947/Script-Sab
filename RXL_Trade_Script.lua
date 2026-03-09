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
TitleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
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
TitleLabel.Font = Enum.Font.FredokaOne
TitleLabel.Text = "RXL Trade"
TitleLabel.TextColor3 = Color3.fromRGB(0, 150, 255)
TitleLabel.TextScaled = true
TitleLabel.TextSize = 24
TitleLabel.TextStrokeColor3 = Color3.fromRGB(0, 100, 200)
TitleLabel.TextStrokeTransparency = 0.3

-- Button Container
local ButtonContainer = Instance.new("Frame")
ButtonContainer.Name = "ButtonContainer"
ButtonContainer.Parent = MainFrame
ButtonContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ButtonContainer.BorderSizePixel = 0
ButtonContainer.Position = UDim2.new(0, 10, 0, 60)
ButtonContainer.Size = UDim2.new(1, -20, 1, -70)

-- Freeze Trade Checkbox
local FreezeTradeFrame = Instance.new("TextButton")
FreezeTradeFrame.Name = "FreezeTradeFrame"
FreezeTradeFrame.Parent = ButtonContainer
FreezeTradeFrame.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
FreezeTradeFrame.BorderSizePixel = 0
FreezeTradeFrame.Position = UDim2.new(0, 0, 0, 10)
FreezeTradeFrame.Size = UDim2.new(1, 0, 0, 40)
FreezeTradeFrame.Font = Enum.Font.SourceSans
FreezeTradeFrame.Text = ""
FreezeTradeFrame.TextColor3 = Color3.fromRGB(255, 255, 255)
FreezeTradeFrame.AutoButtonColor = false

local FreezeCheckbox = Instance.new("Frame")
FreezeCheckbox.Name = "FreezeCheckbox"
FreezeCheckbox.Parent = FreezeTradeFrame
FreezeCheckbox.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
FreezeCheckbox.BorderSizePixel = 0
FreezeCheckbox.Position = UDim2.new(0, 10, 0, 10)
FreezeCheckbox.Size = UDim2.new(0, 20, 0, 20)

local FreezeCheckIcon = Instance.new("TextLabel")
FreezeCheckIcon.Name = "FreezeCheckIcon"
FreezeCheckIcon.Parent = FreezeCheckbox
FreezeCheckIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FreezeCheckIcon.BackgroundTransparency = 1
FreezeCheckIcon.BorderSizePixel = 0
FreezeCheckIcon.Position = UDim2.new(0, 0, 0, 0)
FreezeCheckIcon.Size = UDim2.new(1, 0, 1, 0)
FreezeCheckIcon.Font = Enum.Font.SourceSansBold
FreezeCheckIcon.Text = "X"
FreezeCheckIcon.TextColor3 = Color3.fromRGB(0, 0, 0)
FreezeCheckIcon.TextScaled = true
FreezeCheckIcon.TextSize = 14

local FreezeTradeLabel = Instance.new("TextLabel")
FreezeTradeLabel.Name = "FreezeTradeLabel"
FreezeTradeLabel.Parent = FreezeTradeFrame
FreezeTradeLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FreezeTradeLabel.BackgroundTransparency = 1
FreezeTradeLabel.BorderSizePixel = 0
FreezeTradeLabel.Position = UDim2.new(0, 40, 0, 0)
FreezeTradeLabel.Size = UDim2.new(1, -40, 1, 0)
FreezeTradeLabel.Font = Enum.Font.SourceSansBold
FreezeTradeLabel.Text = "Freeze Trade"
FreezeTradeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
FreezeTradeLabel.TextScaled = true
FreezeTradeLabel.TextSize = 18

-- Auto Accept Checkbox
local AutoAcceptFrame = Instance.new("TextButton")
AutoAcceptFrame.Name = "AutoAcceptFrame"
AutoAcceptFrame.Parent = ButtonContainer
AutoAcceptFrame.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
AutoAcceptFrame.BorderSizePixel = 0
AutoAcceptFrame.Position = UDim2.new(0, 0, 0, 60)
AutoAcceptFrame.Size = UDim2.new(1, 0, 0, 40)
AutoAcceptFrame.Font = Enum.Font.SourceSans
AutoAcceptFrame.Text = ""
AutoAcceptFrame.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoAcceptFrame.AutoButtonColor = false

local AutoCheckbox = Instance.new("Frame")
AutoCheckbox.Name = "AutoCheckbox"
AutoCheckbox.Parent = AutoAcceptFrame
AutoCheckbox.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
AutoCheckbox.BorderSizePixel = 0
AutoCheckbox.Position = UDim2.new(0, 10, 0, 10)
AutoCheckbox.Size = UDim2.new(0, 20, 0, 20)

local AutoCheckIcon = Instance.new("TextLabel")
AutoCheckIcon.Name = "AutoCheckIcon"
AutoCheckIcon.Parent = AutoCheckbox
AutoCheckIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AutoCheckIcon.BackgroundTransparency = 1
AutoCheckIcon.BorderSizePixel = 0
AutoCheckIcon.Position = UDim2.new(0, 0, 0, 0)
AutoCheckIcon.Size = UDim2.new(1, 0, 1, 0)
AutoCheckIcon.Font = Enum.Font.SourceSansBold
AutoCheckIcon.Text = "X"
AutoCheckIcon.TextColor3 = Color3.fromRGB(0, 0, 0)
AutoCheckIcon.TextScaled = true
AutoCheckIcon.TextSize = 14

local AutoAcceptLabel = Instance.new("TextLabel")
AutoAcceptLabel.Name = "AutoAcceptLabel"
AutoAcceptLabel.Parent = AutoAcceptFrame
AutoAcceptLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AutoAcceptLabel.BackgroundTransparency = 1
AutoAcceptLabel.BorderSizePixel = 0
AutoAcceptLabel.Position = UDim2.new(0, 40, 0, 0)
AutoAcceptLabel.Size = UDim2.new(1, -40, 1, 0)
AutoAcceptLabel.Font = Enum.Font.SourceSansBold
AutoAcceptLabel.Text = "Auto Accept"
AutoAcceptLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoAcceptLabel.TextScaled = true
AutoAcceptLabel.TextSize = 18


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
    
    -- Only click ready button if not already ready
    for _, obj in ipairs(tradeWindow:GetDescendants()) do
        if obj:IsA("TextButton") and (obj.Text:lower():find("ready") or obj.Text:lower():find("accept")) then
            -- Check if button is not already in "ready" state
            if obj.Text:lower():find("ready") and not obj.Text:lower():find("unready") then
                obj:FireServer()
                break
            end
        end
    end
end

-- Checkbox Functions
local function updateFreezeCheckbox()
    if freezeTradeEnabled then
        FreezeCheckbox.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
        FreezeCheckIcon.Text = "✓"
        FreezeCheckIcon.TextColor3 = Color3.fromRGB(255, 255, 255)
    else
        FreezeCheckbox.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
        FreezeCheckIcon.Text = "X"
        FreezeCheckIcon.TextColor3 = Color3.fromRGB(0, 0, 0)
    end
end

local function updateAutoCheckbox()
    if autoAcceptEnabled then
        AutoCheckbox.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
        AutoCheckIcon.Text = "✓"
        AutoCheckIcon.TextColor3 = Color3.fromRGB(255, 255, 255)
    else
        AutoCheckbox.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
        AutoCheckIcon.Text = "X"
        AutoCheckIcon.TextColor3 = Color3.fromRGB(0, 0, 0)
    end
end

-- Button Functions
local function toggleFreezeTrade()
    freezeTradeEnabled = not freezeTradeEnabled
    updateFreezeCheckbox()
    
    if freezeTradeEnabled then
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
    updateAutoCheckbox()
    
    if autoAcceptEnabled then
        -- Start auto-accept loop with better performance
        spawn(function()
            while autoAcceptEnabled do
                local otherPlayer = findOtherPlayer()
                if otherPlayer and findTradeWindow() then
                    setPlayerReady(otherPlayer)
                end
                wait(1) -- Increased wait time to reduce FPS loss
            end
        end)
    end
end

-- Checkbox Connections
FreezeTradeFrame.MouseButton1Click:Connect(toggleFreezeTrade)
AutoAcceptFrame.MouseButton1Click:Connect(toggleAutoAccept)

-- Checkbox hover effects
local function animateCheckbox(frame)
    local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local scaleUp = TweenService:Create(frame, tweenInfo, {BackgroundColor3 = Color3.fromRGB(180, 0, 0)})
    local scaleDown = TweenService:Create(frame, tweenInfo, {BackgroundColor3 = Color3.fromRGB(150, 0, 0)})
    
    frame.MouseEnter:Connect(function()
        scaleUp:Play()
    end)
    
    frame.MouseLeave:Connect(function()
        scaleDown:Play()
    end)
end

animateCheckbox(FreezeTradeFrame)
animateCheckbox(AutoAcceptFrame)

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
