local MyUILib = {}

-- 📌 Création d'une Fenêtre Principale
function MyUILib:CreateWindow(title, size, position, color)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.ResetOnSpawn = false -- Garde l'UI après la réapparition

    local Window = Instance.new("Frame")
    Window.Parent = ScreenGui
    Window.Size = size or UDim2.new(0, 350, 0, 250)
    Window.Position = position or UDim2.new(0.3, 0, 0.3, 0)
    Window.BackgroundColor3 = color or Color3.fromRGB(40, 40, 40)
    Window.Active = true
    Window.Draggable = true -- Permet de déplacer la fenêtre

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

    return Window
end

-- 📌 Ajout d'un Bouton
function MyUILib:AddButton(parent, text, callback)
    local Button = Instance.new("TextButton")
    Button.Parent = parent
    Button.Size = UDim2.new(0.8, 0, 0.2, 0)
    Button.Position = UDim2.new(0.1, 0, 0.4, 0)
    Button.BackgroundColor3 = Color3.fromRGB(100, 100, 250)
    Button.Text = text or "Bouton"
    Button.Font = Enum.Font.Gotham
    Button.TextSize = 16
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)

    local UICorner = Instance.new("UICorner")
    UICorner.Parent = Button

    Button.MouseButton1Click:Connect(function()
        if callback then
            callback()
        end
    end)

    return Button
end

-- 📌 Ajout d'un Toggle (ON/OFF)
function MyUILib:AddToggle(parent, text, defaultState, callback)
    local ToggleButton = Instance.new("TextButton")
    ToggleButton.Parent = parent
    ToggleButton.Size = UDim2.new(0.8, 0, 0.2, 0)
    ToggleButton.Position = UDim2.new(0.1, 0, 0.6, 0)
    ToggleButton.BackgroundColor3 = defaultState and Color3.fromRGB(50, 200, 50) or Color3.fromRGB(200, 50, 50)
    ToggleButton.Text = defaultState and "ON" or "OFF"
    ToggleButton.Font = Enum.Font.Gotham
    ToggleButton.TextSize = 16
    ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)

    local UICorner = Instance.new("UICorner")
    UICorner.Parent = ToggleButton

    local isOn = defaultState

    ToggleButton.MouseButton1Click:Connect(function()
        isOn = not isOn -- Change l'état du toggle

        ToggleButton.BackgroundColor3 = isOn and Color3.fromRGB(50, 200, 50) or Color3.fromRGB(200, 50, 50)
        ToggleButton.Text = isOn and "ON" or "OFF"

        if callback then
            callback(isOn) -- Retourne l'état du toggle à la fonction callback
        end
    end)

    return ToggleButton
end

-- 📌 Ajout d'un Bouton de Fermeture
function MyUILib:AddCloseButton(parent)
    local CloseButton = Instance.new("TextButton")
    CloseButton.Parent = parent
    CloseButton.Size = UDim2.new(0, 25, 0, 25)
    CloseButton.Position = UDim2.new(0.95, 0, 0.02, 0)
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    CloseButton.Text = "X"
    CloseButton.Font = Enum.Font.SourceSans
    CloseButton.TextSize = 14
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)

    local UICorner = Instance.new("UICorner")
    UICorner.Parent = CloseButton

    CloseButton.MouseButton1Click:Connect(function()
        parent.Parent:Destroy()
    end)

    return CloseButton
end

return MyUILib
