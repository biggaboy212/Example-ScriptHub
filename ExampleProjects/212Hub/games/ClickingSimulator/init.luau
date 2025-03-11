--!nocheck

local file = {}

function file.init(gameName)
    --// Imports
    local UI = require("core/ui.luau")
    local UISaveManager = require("core/uiSaveManager.luau")
    local UIInterfaceManager = require("core/uiInterfaceManager.luau")
    local Functions = require("core/functions.luau"); local GetService = Functions.SecureService

    --// Services
    local ReplicatedStorage: ReplicatedStorage = GetService("ReplicatedStorage")

    --// Game Instances
    local Packages: Folder = ReplicatedStorage.Packages
    local Knit: ModuleScript = Packages and Packages.Knit
    local Services: Folder = Knit and Knit.Services

    local GameServices = {
        ClickService = {Services.ClickService, Services.ClickService.RF},
    }

    local Remotes = {
        Click = GameServices.ClickService[2]:WaitForChild("Click", 50),
    }

    --// Variables
    local Flags = UI.Options

    --// Logic
    local Window = UI:CreateWindow({
        Title = "212 Hub | " .. gameName,
        SubTitle = "by biggaboy212",
        TabWidth = 160,
        Size = UDim2.fromOffset(580, 460),
        Acrylic = true,
        Theme = "Dark",
        MinimizeKey = Enum.KeyCode.LeftControl
    })

    local Tabs = {
        Main = Window:AddTab({ Title = "Main" }),
        Settings = Window:AddTab({ Title = "Settings" })
    }

    -- [[ MAIN TAB ]] --
    local AutoClickerTask = nil
    local AutoClickerLoop = function()
        while Flags["Auto Clicker Toggle"].Value do
            local DelaySlider = Flags["Auto Clicker Delay"]
            Remotes.Click:InvokeServer()
            task.wait(DelaySlider and DelaySlider.Value or 0)
        end
    end

    Tabs.Main:AddToggle("Auto Clicker Toggle", {
        Title = "Auto Clicker", 
        Description = "Automatically clicks for you.",
        Default = false,
        Callback = function(Value)
            if Value then
                AutoClickerTask = task.spawn(AutoClickerLoop)
            elseif AutoClickerTask then
                task.cancel(AutoClickerTask)
            end
        end
    })
    
    Tabs.Main:AddSlider("Auto Clicker Delay", {
        Title = "Auto Clicker Delay",
        Description = "The delay between clicks for the AutoClicker.",
        Default = 0.00,
        Min = 0.00,
        Max = 5.00,
        Rounding = 2.0,
        Callback = function(Value)
            if Flags["Auto Clicker Toggle"].Value and AutoClickerTask then
                task.cancel(AutoClickerTask)
                AutoClickerTask = task.spawn(AutoClickerLoop)
            end
        end
    })

    --// Initialize
    UISaveManager:SetLibrary(UI)
    UIInterfaceManager:SetLibrary(UI)

    UISaveManager:IgnoreThemeSettings()

    UISaveManager:SetIgnoreIndexes({})

    UIInterfaceManager:SetFolder("212Hub")
    UISaveManager:SetFolder("212Hub/"..gameName)

    UIInterfaceManager:BuildInterfaceSection(Tabs.Settings)
    UISaveManager:BuildConfigSection(Tabs.Settings)
    
    Window:SelectTab(1)
end

return file