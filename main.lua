getgenv().autoTap = false
getgenv().autoRebirth = false
getgenv().buyEgg = false
local remotePath = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices;

spawn(function()
    while getgenv().autoTap == true do
    local args = {
    [1] = 1
    }
    remotePath.ClickService.Click:FireServer(unpack(args))
    wait()
    end
end)

spawn(function()
    while getgenv().autoRebirth == true do
        local args = {[1] = 1000}
        remotePath.RebirthService.BuyRebirths:FireServer(unpack(args))
        wait()
    end
end)

function doTap()
    spawn(function ()
        while getgenv().autoTap == true do
            local args = {[1] = 1}
            remotePath.ClickService.Click:FireServer(unpack(args))
            wait()
        end
    end)
end

function autoRebirth(rebirthAmount)
    spawn(function ()
        while getgenv().autoRebirth == true do
            remotePath.RebirthService.BuyRebirths:FireServer(rebirthAmount)
            wait()
        end
    end)
end

function buyEgg(eggType)
    spawn(function ()
        while wait() do
            if not getgenv().buyEgg then break end;
            remotePath.EggService.Purchase:FireServer(eggType)
        end
    end)
    
end

function getCurrectPlayerPOS()
    local plyr = game.Players.LocalPlayer;
    if plyr.Character then
        return plyr.Character.HumanoidRootPart.Position;
    end
    return false;
end

function teleportTO(placeCFrame)
    local plyr = game.Players.LocalPlayer;
    if plyr.Character then
        return plyr.Character.HumanoidRootPart.CFrame == placeCFrame;
    end
end

function teleportWorld(world)
    if game:GetService("Workspace").Worlds:FindFirstChild(world) then
        teleportTO(game:GetService("Workspace").Worlds[world].Teleport.CFrame)
    end
end

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()

local w = library:CreateWindow("Clicking Sim")

local f = w:CreateFolder("AutoFarm")

local b = w:CreateFolder("AutoPet")

local c = w:CreateFolder("Teleport")

f:DestroyGui()

f:Toggle("AutoTap",function(bool)
    getgenv().autoTap = bool
    if bool then
        doTap();
    end
end)

f:Toggle("Auto Rebirth",function(bool)
    getgenv().autoRebirth = bool
    if bool then
        autoRebirth(1000);
    end
end)

b:Toggle("Auto Egg",function(bool)
    getgenv().buyEgg = bool
    if bool then
        buyEgg('basic');
    end
end)

c:Button("Teleport Desert",function()
    teleportWorld('Desert')
end)


-- b:Label("Pretty Useless NGL",{
--     TextSize = 25;
--     TextColor = Color3.fromRGB(255,255,255);
--     BgColor = Color3.fromRGB(69,69,69);

-- })

-- b:Slider("Slider",{
--     min = 10;
--     max = 50;
--     precise = true;
-- },function(value)
--     print(value)
-- end)

-- b:Dropdown("Dropdown",{"A","B","C"},true,function(mob)
--     print(mob)
-- end)

-- b:Bind("Bind",Enum.KeyCode.C,function() --Default bind
--     print("Yes")
-- end)

-- b:ColorPicker("ColorPicker",Color3.fromRGB(255,0,0),function(color) 
--     print(color)
-- end)

-- b:Box("Box","number",function(value)
--     print(value)
-- end)
