--!nocheck

local file = {}

function file.init(gameName)
    --// Imports
    local UI = require("core/ui.luau")
    local UISaveManager = require("core/uiSaveManager.luau")
    local UIInterfaceManager = require("core/uiInterfaceManager.luau")
    local Functions = require("core/functions.luau"); local GetService = Functions.SecureService

    --// Services
    local Workspace: Workspace = GetService("Workspace")
    local ReplicatedStorage: ReplicatedStorage = GetService("ReplicatedStorage")

    --// Game Instances
    local Power: Folder = ReplicatedStorage.Power
    local PowerHolder: Folder = Workspace.PowerHolder
    local GemHolder: Folder = Workspace.GemHolder

    local Remotes = {
        FightUpdater = Power:WaitForChild("FightUpdater", 30)
    }

    --// Variables
    local Flags = UI.Options
    local LocalPlayer: Player = Functions.GetPlayer()

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
            Remotes.FightUpdater:FireServer()
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

    local function AutoCollect(Holder, Flag, ItemName)
        while Flags[Flag].Value do
            local Character = Functions.GetCharacter(LocalPlayer)
            local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
            
            if HumanoidRootPart then
                for _, Child in ipairs(Holder:GetChildren()) do
                    if Child.Name == ItemName then
                        local TouchInterest = Child:FindFirstChildOfClass("TouchTransmitter")
                        if TouchInterest then
                            firetouchinterest(HumanoidRootPart, Child, 0)
                            task.wait()
                            firetouchinterest(HumanoidRootPart, Child, 1)
                        end
                    end
                end
            end
            
            task.wait(0.5)
        end
    end

    local AutoCollectPowerTask, AutoCollectGemTask

    local AutoCollectPowerLoop, AutoCollectGemLoop = function()
        AutoCollect(PowerHolder, "Auto Collect Power Toggle", "Power")
    end, function()
        AutoCollect(GemHolder, "Auto Collect Gems Toggle", "Gem")
    end

    Tabs.Main:AddToggle("Auto Collect Power Toggle", {
        Title = "Auto Collect Power", 
        Description = "Automatically collects power for you.",
        Default = false,
        Callback = function(Value)
            if Value then
                AutoCollectPowerTask = task.spawn(AutoCollectPowerLoop)
            elseif AutoCollectPowerTask then
                task.cancel(AutoCollectPowerTask)
            end
        end
    })

    Tabs.Main:AddToggle("Auto Collect Gems Toggle", {
        Title = "Auto Collect Gems", 
        Description = "Automatically collects gems for you.",
        Default = false,
        Callback = function(Value)
            if Value then
                AutoCollectGemTask = task.spawn(AutoCollectGemLoop)
            elseif AutoCollectGemTask then
                task.cancel(AutoCollectGemTask)
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