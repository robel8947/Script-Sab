-- RXL Trade Script - Version Simple et Stable
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")

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
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.Text = "RXL Trade"
TitleLabel.TextColor3 = Color3.fromRGB(0, 150, 255)
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
local freezeEnabled = false
local autoEnabled = false
local frozenPlayer = nil
local mainLoop = nil

-- Functions
local function findTradeWindow()
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("ScreenGui") or obj:IsA("Frame") then
            local name = obj.Name:lower()
            if name:find("trade") or name:find("offer") then
                return obj
            end
        end
    end
    return nil
end

local function getOtherPlayer()
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character then
            return p
        end
    end
    return nil
end

local function freezePlayer(p)
    if not p or not p.Character then return end
    local h = p.Character:FindFirstChild("Humanoid")
    if h then
        h.WalkSpeed = 0
        h.JumpPower = 0
    end
end

local function unfreezePlayer(p)
    if not p or not p.Character then return end
    local h = p.Character:FindFirstChild("Humanoid")
    if h then
        h.WalkSpeed = 16
        h.JumpPower = 50
    end
end

local function forceAutoAccept()
    local trade = findTradeWindow()
    if not trade then return end
    
    for _, obj in ipairs(trade:GetDescendants()) do
        if obj:IsA("TextButton") then
            local txt = obj.Text:lower()
            if txt:find("ready") or txt:find("prêt") or txt:find("accept") then
                pcall(function()
                    obj:FireServer()
                    obj:Activate()
                end)
                break
            end
        end
    end
end

local function updateCheckboxes()
    if freezeEnabled then
        FreezeCheckbox.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
        FreezeCheckIcon.Text = "✓"
        FreezeCheckIcon.TextColor3 = Color3.fromRGB(255, 255, 255)
    else
        FreezeCheckbox.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
        FreezeCheckIcon.Text = "X"
        FreezeCheckIcon.TextColor3 = Color3.fromRGB(0, 0, 0)
    end
    
    if autoEnabled then
        AutoCheckbox.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
        AutoCheckIcon.Text = "✓"
        AutoCheckIcon.TextColor3 = Color3.fromRGB(255, 255, 255)
    else
        AutoCheckbox.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
        AutoCheckIcon.Text = "X"
        AutoCheckIcon.TextColor3 = Color3.fromRGB(0, 0, 0)
    end
end

local function startMainLoop()
    mainLoop = task.spawn(function()
        while freezeEnabled or autoEnabled do
            if findTradeWindow() then
                if freezeEnabled then
                    local other = getOtherPlayer()
                    if other then
                        if other ~= frozenPlayer then
                            if frozenPlayer then
                                unfreezePlayer(frozenPlayer)
                            end
                            frozenPlayer = other
                            freezePlayer(other)
                        end
                    end
                end
                
                if autoEnabled then
                    forceAutoAccept()
                end
            else
                if frozenPlayer then
                    unfreezePlayer(frozenPlayer)
                    frozenPlayer = nil
                end
            end
            task.wait(2)
        end
    end)
end

local function toggleFreeze()
    freezeEnabled = not freezeEnabled
    updateCheckboxes()
    
    if freezeEnabled and not mainLoop then
        startMainLoop()
    elseif not freezeEnabled and not autoEnabled then
        mainLoop = nil
        if frozenPlayer then
            unfreezePlayer(frozenPlayer)
            frozenPlayer = nil
        end
    end
end

local function toggleAuto()
    autoEnabled = not autoEnabled
    updateCheckboxes()
    
    if autoEnabled and not mainLoop then
        startMainLoop()
    elseif not autoEnabled and not freezeEnabled then
        mainLoop = nil
    end
end

-- Connections
FreezeTradeFrame.MouseButton1Click:Connect(toggleFreeze)
AutoAcceptFrame.MouseButton1Click:Connect(toggleAuto)

-- Animations
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

-- Notifications
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
    
    local tweenIn = TweenService:Create(notification, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -150, 0, 20)})
    local tweenOut = TweenService:Create(notification, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.new(0.5, -150, 0, -50)})
    
    tweenIn:Play()
    tweenIn.Completed:Connect(function()
        task.wait(2)
        tweenOut:Play()
        tweenOut.Completed:Connect(function()
            notification:Destroy()
        end)
    end)
end

showNotification("RXL Trade Loaded!")
print("RXL Trade Script Loaded Successfully!")
