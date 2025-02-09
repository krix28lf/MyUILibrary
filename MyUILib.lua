local Library = {}

-- Création de l'interface principale
function Library:CreateWindow(Title)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    local Window = Instance.new("Frame")
    Window.Size = UDim2.new(0, 500, 0, 350)
    Window.Position = UDim2.new(0.25, 0, 0.2, 0)
    Window.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Window.Parent = ScreenGui

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Text = Title
    TitleLabel.Size = UDim2.new(1, 0, 0, 30)
    TitleLabel.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.Parent = Window

    local Container = Instance.new("Frame")
    Container.Size = UDim2.new(1, -10, 1, -40)
    Container.Position = UDim2.new(0, 5, 0, 35)
    Container.BackgroundTransparency = 1
    Container.Parent = Window

    return {Gui = ScreenGui, Main = Window, Container = Container}
end

return Library

function Library:AddCategory(Window, Name)
    local Category = Instance.new("Frame")
    Category.Size = UDim2.new(1, 0, 0, 30)
    Category.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Category.Parent = Window.Container

    local Label = Instance.new("TextLabel")
    Label.Text = Name
    Label.Size = UDim2.new(1, 0, 1, 0)
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.BackgroundTransparency = 1
    Label.Parent = Category

    local Container = Instance.new("Frame")
    Container.Size = UDim2.new(1, 0, 0, 0)
    Container.Position = UDim2.new(0, 0, 1, 0)
    Container.BackgroundTransparency = 1
    Container.Parent = Category

    return Container
end

function Library:AddButton(Category, Name, Callback)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, 0, 0, 30)
    Button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.Text = Name
    Button.Parent = Category

    Button.MouseButton1Click:Connect(Callback)
end

function Library:AddToggle(Category, Name, Callback)
    local Toggle = Instance.new("TextButton")
    Toggle.Size = UDim2.new(1, 0, 0, 30)
    Toggle.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    Toggle.Text = Name .. " [OFF]"
    Toggle.Parent = Category

    local State = false
    Toggle.MouseButton1Click:Connect(function()
        State = not State
        Toggle.Text = Name .. (State and " [ON]" or " [OFF]")
        Callback(State)
    end)
end
