-- Services
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- Variables
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local dragging = false
local dragInput, mousePos, framePos

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "RoundedGui"
screenGui.Parent = playerGui

-- Function to create a notification
local function createNotification(text, duration)
    -- Create frame for notification
    local notificationFrame = Instance.new("Frame")
    notificationFrame.Size = UDim2.new(0, 300, 0, 100)
    notificationFrame.Position = UDim2.new(0.5, -150, 0.1, 0)
    notificationFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    notificationFrame.BackgroundTransparency = 0.5
    notificationFrame.BorderSizePixel = 0
    notificationFrame.Parent = screenGui

    -- UICorner for rounded edges
    local frameCorner = Instance.new("UICorner")
    frameCorner.CornerRadius = UDim.new(0, 12)
    frameCorner.Parent = notificationFrame

    -- Create text label for notification
    local notificationText = Instance.new("TextLabel")
    notificationText.Size = UDim2.new(1, 0, 1, 0)
    notificationText.Position = UDim2.new(0, 0, 0, 0)
    notificationText.BackgroundTransparency = 1
    notificationText.TextColor3 = Color3.fromRGB(255, 255, 255)
    notificationText.Text = text
    notificationText.Font = Enum.Font.GothamBold
    notificationText.TextSize = 24
    notificationText.Parent = notificationFrame

    -- Destroy the notification after the specified duration
    delay(duration, function()
        notificationFrame:Destroy()
    end)
end

-- Theme setup
local theme = {
    BackgroundColor = Color3.fromRGB(30, 30, 30),
    ButtonColor = Color3.fromRGB(60, 60, 60),
    TextColor = Color3.fromRGB(255, 255, 255),
    BorderRadius = UDim.new(0, 12)
}

-- Create frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 450, 0, 350)
frame.Position = UDim2.new(0.5, -150, 0.5, -100)
frame.BackgroundColor3 = theme.BackgroundColor
frame.Active = true -- Make frame draggable
frame.Parent = screenGui

-- UICorner for rounded edges
local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = theme.BorderRadius
frameCorner.Parent = frame

-- Create title text
local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(1, 0, 0, 50) -- Full width, 50 pixels height
titleText.Position = UDim2.new(0, 0, 0, 0) -- Top center
titleText.BackgroundTransparency = 1 -- No background
titleText.TextColor3 = theme.TextColor
titleText.Text = "MyMenu"
titleText.Font = Enum.Font.GothamBold -- Custom font
titleText.TextSize = 24 -- Font size
titleText.Parent = frame

-- Create checkbox
local checkbox = Instance.new("TextButton")
checkbox.Size = UDim2.new(0, 30, 0, 30)
checkbox.Position = UDim2.new(1, -40, 0, 10) -- Positioned at the top right corner with some padding
checkbox.BackgroundColor3 = theme.ButtonColor
checkbox.TextColor3 = theme.TextColor
checkbox.Text = "☐"
checkbox.Parent = frame

-- UICorner for rounded checkbox
local checkboxCorner = Instance.new("UICorner")
checkboxCorner.CornerRadius = theme.BorderRadius
checkboxCorner.Parent = checkbox

-- Toggle checkbox state
local isChecked = false
checkbox.MouseButton1Click:Connect(function()
    isChecked = not isChecked
    checkbox.Text = isChecked and "☑" or "☐"
end)

-- Function to be executed while the checkbox is checked
local function executeWhileChecked()
    while isChecked do
        -- Dein Code hier
        print("Checkbox ist aktiviert!")
        wait(1) -- Warte eine Sekunde vor dem erneuten Überprüfen
    end
end

-- Create button
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 140, 0, 40)
button.Position = UDim2.new(0.3, -100, 0.2, -25)
button.BackgroundColor3 = theme.ButtonColor
button.TextColor3 = theme.TextColor
button.Text = "Universal Aimbot"
button.Parent = frame

-- UICorner for rounded button
local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = theme.BorderRadius
buttonCorner.Parent = button

local button2 = Instance.new("TextButton")
button2.Size = UDim2.new(0, 140, 0, 40)
button2.Position = UDim2.new(0.3, -100, 0.35, -25) -- Adjusted Y position
button2.BackgroundColor3 = theme.ButtonColor
button2.TextColor3 = theme.TextColor
button2.Text = "Infinite Yield"
button2.Parent = frame

-- UICorner for rounded button2
local button2Corner = Instance.new("UICorner")
button2Corner.CornerRadius = theme.BorderRadius
button2Corner.Parent = button2

local button3 = Instance.new("TextButton")
button3.Size = UDim2.new(0, 140, 0, 40)
button3.Position = UDim2.new(0.3, -100, 0.50, -25) -- Adjusted Y position
button3.BackgroundColor3 = theme.ButtonColor
button3.TextColor3 = theme.TextColor
button3.Text = "Backdoor App"
button3.Parent = frame

-- UICorner for rounded button3
local button3Corner = Instance.new("UICorner")
button3Corner.CornerRadius = theme.BorderRadius
button3Corner.Parent = button3

-- Smooth transition on hover
local function onHover(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        button.BackgroundColor3 = theme.BackgroundColor
    end
end

local function onLeave(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        button.BackgroundColor3 = theme.ButtonColor
    end
end

button.MouseEnter:Connect(onHover)
button.MouseLeave:Connect(onLeave)

-- Button click function
button.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Aimbot-V2/main/Resources/Scripts/Main.lua"))()
end)

button2.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

button3.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Its-LALOL/LALOL-Hub/main/Backdoor-Scanner/script'))()
end)

-- Dragging functionality
local function update(input)
    local delta = input.Position - mousePos
    frame.Position = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
end

frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        mousePos = input.Position
        framePos = frame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        update(input)
    end
end)

-- Execute the function while checkbox is checked
RunService.RenderStepped:Connect(function()
    if isChecked then
        executeWhileChecked()
    end
end)
