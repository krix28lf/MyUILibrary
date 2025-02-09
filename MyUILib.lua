local MyUILib = {}

function MyUILib:CreateWindow(title, size, position, color)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.ResetOnSpawn = false

    local Window = Instance.new("Frame")
    Window.Parent = ScreenGui
    Window.Size = size or UDim2.new(0, 350, 0, 300)
    Window.Position = position or UDim2.new(0.3, 0, 0.3, 0)
    Window.BackgroundColor3 = color or Color3.fromRGB(40, 40, 40)
    Window.Active = true
    Window.Draggable = true

    local UICorner = Instance.new("UICorner")
    UICorner.Parent = Window

    local Title = Instance.new("TextLabel")
    Title.Parent = Window
    Title.Size = UDim2.new(1, 0, 0.15, 0)
    Title.BackgroundTransparency = 1
    Title.Text = title or "UI Window"
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 18
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)

    local ContentFrame = Instance.new("Frame")
    ContentFrame.Parent = Window
    ContentFrame.Size = UDim2.new(1, 0, 0.85, 0)
    ContentFrame.Position = UDim2.new(0, 0, 0.15, 0)
    ContentFrame.BackgroundTransparency = 1

    local Layout = Instance.new("UIListLayout")
    Layout.Parent = ContentFrame
    Layout.Padding = UDim.new(0, 5)
    Layout.FillDirection = Enum.FillDirection.Vertical
    Layout.SortOrder = Enum.SortOrder.LayoutOrder

    return { Window = Window, Content = ContentFrame } -- 🔹 Retourne bien un tableau contenant Content !
end

-- 🔹 Ajout de AddCategory dans MyUILib
function MyUILib.AddCategory(parent, name)
    local CategoryFrame = Instance.new("Frame")
    CategoryFrame.Parent = parent.Content
    CategoryFrame.Size = UDim2.new(1, 0, 0, 30)
    CategoryFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

    local UICorner = Instance.new("UICorner")
    UICorner.Parent = CategoryFrame

    local Title = Instance.new("TextLabel")
    Title.Parent = CategoryFrame
    Title.Size = UDim2.new(1, 0, 1, 0)
    Title.Text = name
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 16
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1

    local ContentFrame = Instance.new("Frame")
    ContentFrame.Parent = parent.Content
    ContentFrame.Size = UDim2.new(1, 0, 0, 0)
    ContentFrame.BackgroundTransparency = 1

    local Layout = Instance.new("UIListLayout")
    Layout.Parent = ContentFrame
    Layout.Padding = UDim.new(0, 5)
    Layout.FillDirection = Enum.FillDirection.Vertical
    Layout.SortOrder = Enum.SortOrder.LayoutOrder

    return { Frame = ContentFrame }
end

return MyUILib
