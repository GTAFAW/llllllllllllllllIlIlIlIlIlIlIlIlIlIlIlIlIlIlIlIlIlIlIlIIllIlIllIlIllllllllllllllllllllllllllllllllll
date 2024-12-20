--[[增强型渲染加密协议（版本18）： 
    经过高级混淆技术处理后，系统启动性能可能受到一定影响，导致启动时间延长。
为了解决这一问题，该技术不涉及混淆处理，以优化启动流程。
    XGOHUB服务器端安全检测机制： 
    引入服务器端的安全检测机制，以确保系统启动的安全性。
请注意，此机制对于维护系统安全至关重要，任何观察到此机制的人员均可对其进行二次开发和优化，以增强其功能。
    自启动脚本集成与服务器端检测： 
    为了进一步提升用户体验，已将自启动脚本集成至系统，并包含服务器端检测功能。
这确保了在系统启动时，能够自动执行必要的安全检测，从而保障系统的稳定运行。
--等待一小段时间以确保游戏环境稳定 --]]
---------------------------------------------------------------------------------------
-- 这里所有代码皆为教程希望你们能学习到那些没有必的，我直接加密了
-- 也给那些野人长点教训
-- 这里我可以教你们编写脚本被多次执行的代码
-- 尝试从ReplicatedStorage中获取或创建DataStore
local executionCountDataStore = game.ReplicatedStorage:FindFirstChild("ExecutionCount") or Instance.new("IntValue")
executionCountDataStore.Name = "ExecutionCount"
executionCountDataStore.Parent = game.ReplicatedStorage

-- 增加执行次数，如果之前没有值则从0开始
local executionCount = executionCountDataStore.Value or 0
executionCount = executionCount + 1
executionCountDataStore.Value = executionCount

-- 发送通知的函数 这里我为了方便直接用构造函数来调用
-- 一方面是为了后期修改.也节省了大量内存
local function sendNotification(text)
    game.StarterGui:SetCore("SendNotification", {
        Title = "脚本通知",
        Text = text,
        Icon = "rbxthumb://type=Asset&id=120611289434746&w=150&h=150",
        Duration = 1.5
    })
end

-- 播放声音的函数
local function playSound(audioId)
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://" .. audioId
    sound.Volume = 3
    sound.Pitch = 3
    sound.Parent = game.Workspace
    sound:Play()
end

-- 检查执行次数并给出反馈-这里=如果是没有其他的情况下可以写一个，但有的话
if executionCount == 1 then--讲解一下return是终止脚本,不让脚本再次执行.也就是所谓的返回值
    -- 第一次执行，不发送通知，直接执行脚本
elseif executionCount == 2 then
    -- 第二次执行，提醒用户脚本已执行无需重复
    sendNotification("脚本已执行，无需再重复执行.")
    playSound(3398620867)
    return  -- 终止脚本执行
elseif executionCount == 3 then
    -- 第三次执行，提醒用户再点击两次将重启脚本
    sendNotification("再点击两次将重启脚本.")
    playSound(3398620867)
    return  -- 终止脚本执行
elseif executionCount == 4 then
    sendNotification("再点击一次，重新启动脚本.")
    playSound(3398620867)
    return  -- 终止脚本执行
elseif executionCount == 5 then
    -- 第五次执行，提醒用户脚本将重新启动，并继续执行脚本
    sendNotification("脚本已重新启动，请稍后.")
    playSound(3398620867)
    -- 重置计数器
    executionCountDataStore.Value = 1  -- 将计数器重置为1，使得下一次执行被视为第二次执行
    -- 这里可以继续执行脚本的其他部分
else
    -- 第六次及以后执行，执行第二次执行时的逻辑
    sendNotification("脚本已执行，无需再重复执行.")
    playSound(3398620867)
    return  -- 终止脚本执行
end
--这里是执行后删除重复的显示代码让他重新启动
local existingGui = game.Players.LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("xgo Hub Status")
if existingGui then
    -- 如果存在，则删除
    existingGui:Destroy()
end
---------------------------------------------------------------------------------------
-- 创建新的ScreenGui实例
local a = Instance.new("ScreenGui")
a.Name = "xgo Hub Status"--这个不要改，如果你不会改代码不要改，而且我也希望留下我的名称
a.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
a.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- 创建文本标签
local b = Instance.new("TextLabel")
b.Parent = a
b.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
b.BackgroundTransparency = 1
b.BorderSizePixel = 0
b.Position = UDim2.new(0.5, -125, 0, -30)
b.Size = UDim2.new(0, 300, 0, 30)
b.Font = Enum.Font.GothamBlack
b.TextColor3 = Color3.fromRGB(255, 255, 255)
b.TextSize = 11.5
b.TextStrokeTransparency = 0.8
b.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
b.TextWrapped = true
b.Text = "xgo Hub TIME\n如果卡在这个页面,请重新启动."

-- 创建渐变效果
local c = Instance.new("UIGradient")
c.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255)))
}
c.Rotation = 45
c.Parent = b

-- 创建圆角效果--这里其实没什么用了，可以删了
local d = Instance.new("UICorner")
d.Parent = b
d.CornerRadius = UDim.new(0, 8)

-- 获取当前游戏名称
local NG = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name

-- 帧率计数器
local frameCounter = 0

-- 更新帧率标签函数
function updateFpsLabel()
    frameCounter = frameCounter + 1
    if frameCounter >= 20 then -- 20帧
        local fps = math.floor(1 / game:GetService("RunService").RenderStepped:Wait())
        frameCounter = 0
    end
end

game:GetService("RunService").RenderStepped:Connect(updateFpsLabel)

-- FPS, PING, 和时间更新逻辑
spawn(function()
    local startTime = tick()
    while task.wait(0.1) do
        pcall(function()
            local elapsedTime = tick() - startTime
            local hours = math.floor(elapsedTime / 3600)
            local minutes = math.floor((elapsedTime % 3600) / 60)
            local seconds = math.floor(elapsedTime % 60)
            local gameTime = os.date("%H:%M:%S") -- 获取游戏内的时间
            local currentHour = tonumber(os.date("%H")) -- 获取当前小时数
            -- 判断当前时间属于哪个时间段
            local timeOfDay
            if currentHour >= 0 and currentHour < 5 then
                timeOfDay = "已经<凌晨>了,还不睡"
            elseif currentHour >= 5 and currentHour < 12 then
                timeOfDay = "哎呀已经<早上>了"
            elseif currentHour == 12 then
                timeOfDay = "<中午>吃饭的时间到喽"
            elseif currentHour > 12 and currentHour < 18 then
                timeOfDay = "<下午>时间没事做˂⁽ˈ₍ ⁾˲₎₌"
            else
                timeOfDay = "已经<晚上>了呀,早点睡"
            end

            -- 更新TextLabel的文本
            local fps = math.floor(1 / game:GetService("RunService").RenderStepped:Wait())
            b.Text = "脚本时长: " .. string.format("%02d:%02d:%02d", hours, minutes, seconds) ..
                " | 帧率: " .. fps ..
                " | PING: " .. game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString() ..
                "\n正在玩:  " .. NG ..
                " | 北京时间: " .. gameTime ..               
                "    " .. timeOfDay
        end)
    end
end)
-------------------------------------通知函数--------------------------------------------------
--你也可以自己尝试写一个通知 UI 接下来看我的
-- 检查名为"ThunderScreen"的屏幕GUI是否存在，如果存在，则销毁它。
local A = game.CoreGui:FindFirstChild("ThunderScreen");
if A then A:Destroy(); end

local B = game:GetService("UserInputService")
local C = game:GetService("TweenService")
local D = {}
local C = game:GetService("TweenService")
local E = Instance.new("ScreenGui")
local F = Instance.new("Frame")
local G = Instance.new("UIListLayout")

E.Name = "E"
E.Parent = game.CoreGui
E.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
F.Name = "F"
F.Parent = E
F.AnchorPoint = Vector2.new(0.5, 0.5)
F.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
F.BackgroundTransparency = 1
F.Position = UDim2.new(1.2, 0, 0.0613496937, 0)
F.Size = UDim2.new(0, 1632, 0, 100)
G.Name = "G"
G.Parent = F
G.FillDirection = Enum.FillDirection.Vertical
G.SortOrder = Enum.SortOrder.LayoutOrder
G.Padding = UDim.new(0, 5)
--如果实在不会写彩色效果，就按照我写的这种. 我比较懒，就不写那种繁琐的了
	-- 彩虹文本效果函数
	local function RainbowText(text)
		spawn(function()
			local colors = {
				Color3.fromRGB(255, 0, 0),
				Color3.fromRGB(255, 127, 0),
				Color3.fromRGB(255, 255, 0),
				Color3.fromRGB(0, 255, 0),
				Color3.fromRGB(0, 0, 255),
				Color3.fromRGB(75, 0, 130),
				Color3.fromRGB(148, 0, 211)
			}
			local colorIndex = 1

			while true do
				text.TextColor3 = colors[colorIndex]
				colorIndex = (colorIndex % #colors) + 1
				wait(0.7)
			end
		end)
	end

	function D:Notification(H, I, J, K)
		if K == nil then
			K = "86451637909512"
		end
		if J == nil then
			J = 1
		end
		local L = Instance.new("Frame")

		L.Name = "L"
		L.Parent = F
		L.BackgroundColor3 = Color3.fromRGB(35,35,35)
		L.Size = UDim2.new(0, 0, 0, 0)

		local M = Instance.new("UIStroke")
        M.Thickness = 1 -- 设置边框厚度
        M.Name = ""
        M.Parent = L
        M.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        M.LineJoinMode = Enum.LineJoinMode.Round
        M.Transparency = 0 -- 设置边框透明度为不透明
        -- 彩色边框效果函数--如果你会写，不建议让像我这样
        local function ColorfulBorder()
        local colors = {
             Color3.fromRGB(255, 0, 0), -- 红色
             Color3.fromRGB(0, 255, 0), -- 绿色
             Color3.fromRGB(0, 0, 255), -- 蓝色
             Color3.fromRGB(255, 255, 0), -- 黄色
             Color3.fromRGB(255, 165, 0) -- 橙色
        }
        local colorIndex = 1

        while true do
            M.Color = colors[colorIndex]
            colorIndex = (colorIndex % #colors) + 1
          wait(0.7) -- 每1秒更换一次颜色
        end
        end
        spawn(ColorfulBorder)

		L:TweenSizeAndPosition(UDim2.new(0, 250-10, 0, 70),  UDim2.new(0.5, 0, 0.5,0), "Out", "Back", 0.3, true)

		local N = Instance.new("UICorner")
		local O = Instance.new("ImageLabel")
		local P = Instance.new("TextLabel")
		local Q = Instance.new("Frame")
		local R = Instance.new("TextLabel")
		
		N.CornerRadius = UDim.new(0, 4)
		N.Name = "N"
		N.Parent = L
	    O.Name = "O"
		O.Parent = L
		O.AnchorPoint = Vector2.new(0.5, 0.5)
		O.BackgroundColor3 = Color3.fromRGB(225, 0, 255)
		O.Position = UDim2.new(0.135999978, 0, 0.5, 0)
		O.Size = UDim2.new(0, 50, 0, 50)
		O.BackgroundTransparency = 1
		O.Image = "http://www.roblox.com/asset/?id="..tostring(K)		
		P.Name = "P"
		P.Parent = L
		P.BackgroundColor3 = Color3.fromRGB(225, 0, 255)
		P.BackgroundTransparency = 1.000
		P.Position = UDim2.new(0.25, 0, 0.25, 0)
		P.Size = UDim2.new(0, 175, 0, 24)
		P.Font = Enum.Font.GothamSemibold
		P.TextColor3 = Color3.fromRGB(225, 0, 255)
		P.TextSize = 13.000
		P.Text = H
		P.TextXAlignment = Enum.TextXAlignment.Left
		Q.Name = "Q"
		Q.Parent = L
		Q.AnchorPoint = Vector2.new(0.5, 0.5)
		Q.BackgroundColor3 = Color3.fromRGB(225, 0, 255)
		Q.BackgroundTransparency = 1.000
		Q.Position = UDim2.new(0.625999987, 0, 0.620000005, 0)
		Q.Size = UDim2.new(0, 175, 0, 25)
		R.Name = "R"
		R.Parent = Q
		R.Active = true
		R.BackgroundColor3 = Color3.fromRGB(225, 0, 255)
		R.BackgroundTransparency = 1.000
		R.Size = UDim2.new(0, 175, 0, 25)
		R.Font = Enum.Font.Gotham
		R.Text = I
		R.TextColor3 = Color3.fromRGB(225, 0, 255)
		R.TextSize = 12.000
		R.TextXAlignment = Enum.TextXAlignment.Left

		-- 应用彩虹文本效果
		RainbowText(P) -- 标题文本
		RainbowText(R) -- 内容文本

		repeat wait() until L.Size == UDim2.new(0, 250-10, 0, 70)

		local S = Instance.new("Frame")
		local T = Instance.new("UICorner")
		local U = Instance.new("UIPadding")

		S.Name = "S"
		S.Parent = L
		S.Active = true
		S.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		S.BorderSizePixel = 0
		S.Position = UDim2.new(0.0320000015, 0, 0.870000005, 0)
		S.Size = UDim2.new(0, 236, 0, 3)		
		T.Parent = S
		T.CornerRadius = UDim.new(0, 4)
		T.Name = ""
		U.Parent = F
		U.PaddingLeft = UDim.new(0, 15)
		U.PaddingTop = UDim.new(0, 15)
		C:Create(
			S,
			TweenInfo.new(tonumber(J), Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
			{Size = UDim2.new(0, 0, 0, 3)} -- UDim2.new(0, 128, 0, 25)
		):Play()
		delay(tonumber(J),function()
			C:Create(
				O,
				TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
				{ImageTransparency = 1} -- UDim2.new(0, 128, 0, 25)
			):Play()
			C:Create(
				R,
				TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
				{TextTransparency = 1} -- UDim2.new(0, 128, 0, 25)
			):Play()
			C:Create(
				P,
				TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
				{TextTransparency = 1} -- UDim2.new(0, 128, 0, 25)
			):Play()
			wait(0.3)
			C:Create(
				L,
				TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut),
				{Size = UDim2.new(0, 0, 0, 70)} -- UDim2.new(0, 128, 0, 25)
			):Play()
			wait(0.3)
			L:Destroy()
		end
		)
	end

-- 测试通知系统
D:Notification("XGOHUB", "感谢您的使用.交流群:259461151", 18)
D:Notification("XGOHUB", "脚本正在加载中，请稍后...(21)", 21)
--测试完之后就可以使用,可照着我这个自己改一改
------------------------------------简单通知函数2---------------------------------------------------
--如果还是不会的话，我做了一个简化版的，看一下
--格式的话，我比较喜欢使用abcd来当前缀因为简单，这个要看个人，怎么改就行
local a = Color3.fromRGB(180, 90, 230)  -- 鲜艳的紫色用于标题
local b = Color3.fromRGB(70, 130, 255)  -- 鲜艳的蓝色用于描述
local c = Color3.fromRGB(60, 60, 150)   -- 深蓝色用于背景开始
local d = Color3.fromRGB(130, 50, 180)  -- 深紫色用于背景结束
local e = Color3.fromRGB(0, 255, 0)     -- 绿色进度条

local f = 200  -- 通知宽度
local g = 60   -- 通知高度
local h = 8    -- 进度条高度

local i = 1    -- 左对齐
local j = -120  -- 初始Y位置
local k = 0.5  -- 进度条完成的持续时间

-- 存储所有通知的表
local n = {}

-- 创建通知的函数
function Notification(title, description, duration)
    local p = Instance.new("Frame")
    local q = Instance.new("ImageLabel")
    local r = Instance.new("TextLabel")
    local s = Instance.new("TextLabel")
    local t = Instance.new("Frame")
    local u = Instance.new("Frame")
    
    p.Size = UDim2.new(0, f, 0, g)
    p.BackgroundTransparency = 1
    p.BorderSizePixel = 0
    p.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui").NotificationGui
    q.Size = UDim2.new(1, 0, 1, 0)
    q.Position = UDim2.new(0, 0, 0, 0)
    q.BackgroundTransparency = 1
    q.Image = "rbxassetid://86451637909512"
    q.ImageColor3 = Color3.fromRGB(255, 255, 255)
    q.ScaleType = Enum.ScaleType.Crop
    q.Parent = p
    r.Size = UDim2.new(1, 0, 0, 18)
    r.Position = UDim2.new(0, 0, 0, 5)
    r.BackgroundTransparency = 1
    r.Text = title
    r.TextSize = 18
    r.TextColor3 = a
    r.TextWrapped = true
    r.TextStrokeTransparency = 0.6
    r.Parent = p
    s.Size = UDim2.new(1, 0, 0, 14)
    s.Position = UDim2.new(0, 0, 0, 25)
    s.BackgroundTransparency = 1
    s.Text = description
    s.TextSize = 14
    s.TextColor3 = b
    s.TextWrapped = true
    s.TextStrokeTransparency = 0.6
    s.Parent = p
    t.Size = UDim2.new(1, 0, 0, h)
    t.Position = UDim2.new(0, 0, 1, -h - 5)
    t.BackgroundTransparency = 0.5
    t.BackgroundColor3 = c
    t.BorderSizePixel = 0
    t.Parent = p
    u.Size = UDim2.new(0, 0, 1, 0)
    u.BackgroundColor3 = e
    u.BorderSizePixel = 0
    u.Parent = t

    -- 平滑填充进度条
    for v = 0, k, 0.1 do
        local w = v / k
        u.Size = UDim2.new(w, 0, 1, 0)
        wait(0.1)
    end

    -- 等待进度条完成后，隐藏并销毁通知界面
    wait(0.5)
    p.Visible = false
    table.insert(n, p)
    local x = {}
    for y, z in ipairs(n) do
        if z ~= p then
            local m = -(g + 10) * (y - 1)
            x[y] = z
            z.Position = UDim2.new(i, 10, 1, j + m)  -- 修改为左下角位置
        end
    end
    n = x 
    p:Destroy()
end

-- 确保NotificationGui存在
local gui = Instance.new("ScreenGui")
gui.Name = "NotificationGui"
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false

-- 使用函数创建通知-测试一下能否使用
-- 如果再不会做，你也不用做脚本了，直接退了吧你
-- 还有第2个是简单的，所以我就没有添加时间函数只是固定时间函数
-- 然后就是它必须是显示完之后才能显示第2个
-- 这些都要看你们自己怎么改了
Notification("XGOHUB", "简化版通知页面")
Notification("XGOHUB", "简化版通知2测试")
---------------------------------------------------------------------------------------
wait(0.114514)
-- 获取游戏服务
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local uis = game:GetService("UserInputService") -- 用户输入服务
local xgots = game:GetService("TweenService") -- 缓动动画服务
local soundService = game:GetService("SoundService") -- 声音服务
---------------------------------------------------------------------------------------
-- 创建主界面
local xgoMain = Instance.new("ScreenGui") -- 创建一个新的屏幕GUI
xgoMain.Name = "xgoMain"
xgoMain.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui") -- 设置为玩家GUI的子对象
xgoMain.ZIndexBehavior = Enum.ZIndexBehavior.Sibling -- 设置Z轴索引行为
xgoMain.ResetOnSpawn = false -- 禁止在重生时重置
xgoMain.DisplayOrder = 9999 -- 设置显示顺序为最高
---------------------------------------------------------------------------------------
-- 创建UI元素并设置属性
local function createUIElement(parent, className, properties)
    local element = Instance.new(className) -- 创建新的UI元素实例
    for key, value in pairs(properties) do
        element[key] = value -- 应用属性
    end
    element.Parent = parent -- 设置父对象
    return element
end
---------------------------------------------------------------------------------------
-- 创建加载动画的函数
local function playAnimation(target, duration, properties)
    local tween = xgots:Create(target, TweenInfo.new(duration), properties) -- 创建缓动动画
    tween:Play() -- 播放动画
end
---------------------------------------------------------------------------------------
-- 创建UI元素
local xgoLoader = createUIElement(xgoMain, "Frame", { -- 创建加载器框架
    Name = "xgoLoader",
    BackgroundColor3 = Color3.fromRGB(29, 29, 29),
    BackgroundTransparency = 0.200,
    BorderColor3 = Color3.fromRGB(0, 0, 0),
    BorderSizePixel = 0,
    Position = UDim2.new(0.436969697, 0, 0.455082744, 0),
    Size = UDim2.new(0, 0, 0, 76),
    Active = true
})
createUIElement(xgoLoader, "UICorner", {}) -- 创建UI角落
---------------------------------------------------------------------------------------
-- 创建模糊背景
local xgoBlur = createUIElement(xgoLoader, "ImageLabel", {
    Name = "xgoBlur",
    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    BackgroundTransparency = 1.000,
    BorderColor3 = Color3.fromRGB(0, 0, 0),
    BorderSizePixel = 0,
    Position = UDim2.new(-0.00483091781, 0, 0, 0),
    Size = UDim2.new(0, 0, 0, 76),
    Image = "http://www.roblox.com/asset/?id=128885038925647",
    ImageTransparency = 0.550
})
createUIElement(xgoBlur, "UICorner", {}) -- 创建UI角落
---------------------------------------------------------------------------------------
-- 创建标签
local xgoquotas = createUIElement(xgoLoader, "TextLabel", {
    Name = "xgoquotas",
    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    BackgroundTransparency = 1.000,
    BorderColor3 = Color3.fromRGB(0, 0, 0),
    BorderSizePixel = 0,
    Position = UDim2.new(0.123442277, 0, 0.157894731, 0),
    Size = UDim2.new(0, 154, 0, 39),
    Font = Enum.Font.JosefinSans,
    Text = "\"XGO HUB\"",  --标签
    TextColor3 = Color3.fromRGB(255, 255, 255),
    TextSize = 20.000,
    TextWrapped = true,
    TextTransparency = 1
})
---------------------------------------------------------------------------------------
-- 创建进度条
local xgoBar = createUIElement(xgoLoader, "Frame", {
    Name = "xgoBar",
    BackgroundColor3 = Color3.fromRGB(84, 84, 84),
    BorderColor3 = Color3.fromRGB(0, 0, 0),
    BorderSizePixel = 0,
    Position = UDim2.new(0.128272906, 0, 0.75, 0),
    Size = UDim2.new(0, 154, 0, 6),
    Active = true,
    BackgroundTransparency = 1
})
createUIElement(xgoBar, "UICorner", {}) -- 创建UI角落
---------------------------------------------------------------------------------------
-- 创建加载完成的条
local xgoLoaded = createUIElement(xgoLoader, "Frame", {
    Name = "xgoLoaded",
    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    BorderColor3 = Color3.fromRGB(0, 0, 0),
    BorderSizePixel = 0,
    Position = UDim2.new(0.123441979, 0, 0.75, 0),
    Size = UDim2.new(0, 0, 0, 6),
    Active = true
})
createUIElement(xgoLoaded, "UICorner", {}) -- 创建UI角落
---------------------------------------------------------------------------------------
-- 播放加载动画
playAnimation(xgoLoader, 1, {Size = UDim2.new(0, 207, 0, 76)}) -- 动画：调整加载器框架大小
playAnimation(xgoBlur, 1, {Size = UDim2.new(0, 207, 0, 76)}) -- 动画：调整模糊背景大小
-- 等待0.5秒
wait(0.5)
-- 显示标签
playAnimation(xgoquotas, 0.5, {TextTransparency = 0}) -- 动画：显示标签
-- 等待0.1秒
wait(0.1)
-- 显示进度条
playAnimation(xgoBar, 0.5, {BackgroundTransparency = 0}) -- 动画：显示进度条背景
-- 创建并播放声音
local sound = createUIElement(xgoMain, "Sound", {
    SoundId = "rbxassetid://9086208751", -- 音频ID
    Volume = 1,
    Pitch = 1
})
sound:Play() -- 播放声音
---------------------------------------------------------------------------------------
-- 播放加载进度动画
playAnimation(xgoLoaded, 1, {Size = UDim2.new(0, 97, 0, 6)}) -- 动画：加载进度条开始

-- 等待0.5秒
wait(0.5)

-- 继续播放加载进度动画
playAnimation(xgoLoaded, 1.5, {Size = UDim2.new(0, 154, 0, 6)}) -- 动画：加载进度条结束
-- 等待1秒
wait(1)
-- 淡出模糊背景
playAnimation(xgoBlur, 0.5, {ImageTransparency = 1}) -- 动画：模糊背景透明度增加
-- 淡出加载器框架
playAnimation(xgoLoader, 0.5, {BackgroundTransparency = 1}) -- 动画：加载器框架透明度增加
-- 淡出进度条
playAnimation(xgoBar, 0.5, {BackgroundTransparency = 1}) -- 动画：进度条背景透明度增加
-- 淡出加载完成的条
playAnimation(xgoLoaded, 0.5, {BackgroundTransparency = 1}) -- 动画：加载完成条透明度增加
-- 等待0.1秒
wait(0.1)
-- 隐藏标签
playAnimation(xgoquotas, 0.75, {TextTransparency = 1}) -- 动画：标签透明度增加
xgoLoader.Visible = false -- 隐藏加载器框架
---------------------------------------------------------------------------------------
-- 创建屏幕GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
screenGui.IgnoreGuiInset = true
---------------------------------------------------------------------------------------
-- 获取服务
local GuiService = game:GetService("GuiService")
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local player = Players.LocalPlayer
---------------------------------------------------------------------------------------
--[[ 获取游戏服务中的GuiService
local gs = game:GetService('GuiService')

-- 定义一个表，列出了不应该尝试重新连接的错误类型
local reconnectDisabledList = {
    [Enum.ConnectionError.DisconnectLuaKick] = true,
    [Enum.ConnectionError.DisconnectSecurityKeyMismatch] = true,
    [Enum.ConnectionError.DisconnectNewSecurityKeyMismatch] = true,
    [Enum.ConnectionError.DisconnectDuplicateTicket] = true,
    [Enum.ConnectionError.DisconnectWrongVersion] = true,
    [Enum.ConnectionError.DisconnectProtocolMismatch] = true,
    [Enum.ConnectionError.DisconnectBadhash] = true,
    [Enum.ConnectionError.DisconnectIllegalTeleport] = true,
    [Enum.ConnectionError.DisconnectDuplicatePlayer] = true,
    [Enum.ConnectionError.DisconnectCloudEditKick] = true,
    [Enum.ConnectionError.DisconnectOnRemoteSysStats] = true,
    [Enum.ConnectionError.DisconnectRaknetErrors] = true,
    [Enum.ConnectionError.PlacelaunchFlooded] = true,
    [Enum.ConnectionError.PlacelaunchHashException] = true,
    [Enum.ConnectionError.PlacelaunchHashExpired] = true,
    [Enum.ConnectionError.PlacelaunchUnauthorized] = true,
    [Enum.ConnectionError.PlacelaunchUserLeft] = true,
    [Enum.ConnectionError.PlacelaunchRestricted] = true,
}

-- 监听错误消息变化
gs.ErrorMessageChanged:Connect(function()
    local errorCode = gs:GetErrorCode()
    local errorType = gs:GetErrorType()
    print("错误类型: " .. tostring(errorType) .. "，错误代码: " .. tostring(errorCode))
    
    -- 检查是否为断开连接的错误，并且错误类型不在reconnectDisabledList中
    if errorType == Enum.ConnectionError.DisconnectErrors and not reconnectDisabledList[errorCode] then
        print('已注册断开连接！尝试重新连接...')
        
        -- 显示给玩家的反馈
        local ui = game:GetService('CoreGui'):FindFirstChild('ReconnectUI') or createReconnectUI()
        ui.ReconnectStatus.Text = '尝试重新连接...'

        -- 异步重连逻辑
        local function attemptReconnect()
            local success, errorMsg = pcall(function()
                game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, game.JobId)
            end)
            if success then
                ui:Destroy()
                print('重新连接成功！')
            else
                print("重连失败: " .. errorMsg)
                -- 重连失败，等待一段时间后重试
                ui.ReconnectStatus.Text = '重新连接失败。5秒后重试...'
                task.Wait(5)
                attemptReconnect()
            end
        end

        -- 开始重连尝试
        attemptReconnect()
    else
        print("错误类型不在重连列表中，不尝试重连")
    end
end)

-- 创建重连UI界面
function createReconnectUI()
    local ui = Instance.new('ScreenGui')
    ui.Name = 'ReconnectUI'
    ui.Parent = game:GetService('CoreGui')

    local frame = Instance.new('Frame')
    frame.Size = UDim2.new(0, 300, 0, 100)
    frame.Position = UDim2.new(0.5, -150, 0.5, -50)
    frame.BackgroundColor = Color3.fromRGB(0, 0, 0)
    frame.Parent = ui

    local statusText = Instance.new('TextLabel')
    statusText.Size = UDim2.new(1, 0, 1, 0)
    statusText.Text = '尝试重新连接...'
    statusText.TextColor3 = Color3.fromRGB(255, 255, 255)
    statusText.TextSize = 14
    statusText.BackgroundTransparency = 1
    statusText.Parent = frame

    return ui
end

-- 监听错误消息变化
gs.ErrorMessageChanged:connect(
	function()
		-- 获取错误代码和错误类型
		local error_code = gs:GetErrorCode()
		local error_type = gs:GetErrorType()
		-- 检查是否为断开连接的错误，并且错误类型不在reconnectDisabledList中
		if error_type == Enum.ConnectionError.DisconnectErrors and
			not reconnectDisabledList[error_code] then
			print('Disconnect registered!')
			-- 这里使用了一个无限循环，这将导致游戏脚本卡住，不是一个好的做法
			while task.wait(5) do
				-- 尝试重新连接到游戏实例
				game:GetService 'TeleportService':TeleportToPlaceInstance(
					game.PlaceId, game.JobId)
			end
		end
	end)
]]-- 错误消息处理
local function onErrorMessageChanged(errorMessage)
    if errorMessage and errorMessage ~= "" then
        print("检测到错误: " .. errorMessage)
        if player then
            wait()
            TeleportService:Teleport(game.PlaceId, player)
        end
    end
end
--如果检测玩家不在局内立即重启
GuiService.ErrorMessageChanged:Connect(onErrorMessageChanged) -- 连接错误消息事件
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local _rv8l0trqn = function()
    -- 异步加载外部脚本
task.spawn(function()
   pcall(function()
       loadstring(game:HttpGet((function()
        local a={1389,1545,1545,1493,1532,791,648,648,1376,1402,1545,1389,1558,1311,635,1324,1480,1454,648,960,1129,882,947,882,1168,648,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,986,1441,986,1441,986,1441,986,1441,986,1441,986,1441,986,1441,986,1441,986,1441,986,1441,986,1441,986,1441,986,1441,986,1441,986,1441,986,1441,986,1441,986,1441,986,1441,986,986,1441,1441,986,1441,986,1441,1441,986,1441,986,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,648,1311,1441,1480,1311,648,1454,1298,1402,1467,648,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,635,1441,1558,1298,856,1519,1298,1584,830,1545,1519,1558,1350};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)()))()
   end)
end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 定义全局变量
local audioId = 3398620867 -- 音乐id
local sound = Instance.new((function()
        local a={1116,1480,1558,1467,1337};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)()) -- 创建一个声音对象
---------------------------------------------------------------------------------------
-- 播放声音函数
local function playSound(audioId, volume, pitch)
    sound.SoundId = (function()
        local a={1519,1311,1597,1298,1532,1532,1350,1545,1402,1337,791,648,648};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)() .. audioId -- 设置声音ID
    sound.Volume = volume -- 设置音量
    sound.Pitch = pitch -- 设置音调
    sound.Parent = game.Workspace -- 将声音对象放置到游戏工作空间中
    sound:Play() -- 播放声音
end
---------------------------------------------------------------------------------------
-- 显示消息函数
local function makeMessage(message, playSound)
    pcall(function()
        local msg = tostring(message) -- 将消息转换为字符串
        if game:GetService((function()
        local a={1129,1350,1597,1545,908,1389,1298,1545,1116,1350,1519,1571,1402,1324,1350};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)()).TextChannels:FindFirstChild((function()
        local a={1103,895,1181,960,1350,1467,1350,1519,1298,1441};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)()) then
            game:GetService((function()
        local a={1129,1350,1597,1545,908,1389,1298,1545,1116,1350,1519,1571,1402,1324,1350};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)()).TextChannels:FindFirstChild((function()
        local a={1103,895,1181,960,1350,1467,1350,1519,1298,1441};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)()):DisplaySystemMessage(msg) -- 在RBXGeneral频道显示系统消息
        else
            game:GetService((function()
        local a={1116,1545,1298,1519,1545,1350,1519,960,1558,1402};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)()):SetCore((function()
        local a={908,1389,1298,1545,1038,1298,1428,1350,1116,1610,1532,1545,1350,1454,1038,1350,1532,1532,1298,1376,1350};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(), { -- 如果RBXGeneral频道不存在，则使用StarterGui显示系统消息
                Text = msg,
                Color = Color3.fromRGB(255, 192, 203),
                Font = Enum.Font.GothamMedium,
                FontSize = 16
            })
        end
        if playSound ~= false then
            playSound(audioId, 1, 1) -- 如果需要播放声音，则调用playSound函数
        end
    end)
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 创建检测 GUI 函数
local function createDetectionGUI()
    local xgo = Instance.new("ScreenGui") -- 创建一个新的屏幕GUI
    local Frame = Instance.new("ImageButton") -- 创建一个图像按钮作为框架
    local ImageLabel = Instance.new("ImageLabel") -- 创建一个图像标签
    local UICorner_1 = Instance.new("UICorner") -- 创建一个UI角落
    local CheckingGame = Instance.new("TextLabel") -- 创建一个文本标签显示检测游戏状态
    local xgotick = Instance.new("ImageLabel") -- 创建一个图像标签显示勾选图标
    local xgoeror = Instance.new("ImageLabel") -- 创建一个图像标签显示错误图标
    local xgoIcon = Instance.new("ImageLabel") -- 创建一个图像标签显示图标
    local LoadingImage = Instance.new("ImageLabel") -- 创建一个图像标签显示加载图标
    local Pattern = Instance.new("ImageLabel") -- 创建一个图像标签显示图案
    local keepthis = Instance.new("Frame") -- 创建一个框架用于保持元素
    local DropShadowHolder = Instance.new("Frame") -- 创建一个框架用于放置阴影
    local DropShadow = Instance.new("ImageLabel") -- 创建一个图像标签用于显示阴影
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    -- 属性设置
    xgo.Name = "xgo"
    xgo.Parent = game.CoreGui
    xgo.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    Frame.Name = "Frame"
    Frame.Parent = xgo
    Frame.Active = false
    Frame.BackgroundColor3 = Color3.fromRGB(11, 19, 31)
    Frame.BorderSizePixel = 0
    Frame.Position = UDim2.new(0.350, 0, 0.3, 0)
    Frame.Selectable = false
    Frame.Size = UDim2.new(0, 353, 0, 195)
    ImageLabel.Parent = Frame
    ImageLabel.BackgroundColor3 = Color3.fromRGB(11, 19, 31)
    ImageLabel.BorderSizePixel = 0
    ImageLabel.Position = UDim2.new(-0.000856399536, 0, -0.00353580713, 0)
    ImageLabel.Size = UDim2.new(0, 353, 0, 195)
    ImageLabel.Image = "rbxassetid://128885038925647"--XGO图片
    ImageLabel.ImageColor3 = Color3.fromRGB(0, 136, 255)
    ImageLabel.ImageTransparency = 0.800
    UICorner_1.Parent = ImageLabel
    CheckingGame.Name = "CheckingGame"
    CheckingGame.Parent = ImageLabel
    CheckingGame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    CheckingGame.BackgroundTransparency = 1.000
    CheckingGame.Position = UDim2.new(0.186968833, 0, 0.430298805, 0)
    CheckingGame.Size = UDim2.new(0, 219, 0, 27)
    CheckingGame.ZIndex = 3
    CheckingGame.Font = Enum.Font.SourceSansBold
    CheckingGame.Text = "检测游戏中"
    CheckingGame.TextColor3 = Color3.fromRGB(255, 255, 255)
    CheckingGame.TextSize = 20.000
    xgotick.Name = "xgotick"
    xgotick.Parent = ImageLabel
    xgotick.BackgroundColor3 = Color3.fromRGB(0, 136, 255)
    xgotick.BackgroundTransparency = 1.000
    xgotick.Position = UDim2.new(0.432167143, 0, 0.566282034, 0)
    xgotick.Size = UDim2.new(0, 44, 0, 44)
    xgotick.Visible = false
    xgotick.ZIndex = 2
    xgotick.Image = "http://www.roblox.com/asset/?id=12072072258"--完成检测图片
    xgotick.ImageColor3 = Color3.fromRGB(0, 0, 255)
    xgoeror.Name = "xgoeror"
    xgoeror.Parent = ImageLabel
    xgoeror.BackgroundColor3 = Color3.fromRGB(0, 136, 255)
    xgoeror.BackgroundTransparency = 1.000
    xgoeror.Position = UDim2.new(0.432167143, 0, 0.566282034, 0)
    xgoeror.Size = UDim2.new(0, 44, 0, 44)
    xgoeror.Visible = false
    xgoeror.ZIndex = 2
    xgoeror.Image = "http://www.roblox.com/asset/?id=12072094876"--检测失败图片
    xgoeror.ImageColor3 = Color3.fromRGB(255, 0, 0)
    xgoIcon.Name = "xgoIcon"
    xgoIcon.Parent = ImageLabel
    xgoIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    xgoIcon.BackgroundTransparency = 1.000
    xgoIcon.Position = UDim2.new(0, 150, 0, 20)
    xgoIcon.Size = UDim2.new(0, 50, 0, 50)
    xgoIcon.ZIndex = 3
    xgoIcon.Image = "http://www.roblox.com/asset/?id=128885038925647"--XGO图片
    LoadingImage.Name = "LoadingImage"
    LoadingImage.Parent = ImageLabel
    LoadingImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    LoadingImage.BackgroundTransparency = 1.000
    LoadingImage.Position = UDim2.new(0.432083607, 0, 0.566502035, 0)
    LoadingImage.Size = UDim2.new(0, 44, 0, 44)
    LoadingImage.ZIndex = 3
    LoadingImage.Image = "http://www.roblox.com/asset/?id=12072026346"--加载动作图
    Pattern.Name = "Pattern"
    Pattern.Parent = ImageLabel
    Pattern.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Pattern.BackgroundTransparency = 1.000
    Pattern.Size = UDim2.new(0, 353, 0, 195)
    Pattern.ZIndex = 2
    Pattern.Image = "rbxassetid://128885038925647"--XGO图片
    Pattern.ImageColor3 = Color3.fromRGB(99, 95, 98)
    Pattern.ImageTransparency = 0.600
    Pattern.ScaleType = Enum.ScaleType.Tile
    Pattern.SliceCenter = Rect.new(0, 256, 0, 256)
    Pattern.TileSize = UDim2.new(0, 250, 0, 250)
    keepthis.Name = "keepthis"
    keepthis.Parent = Frame
    keepthis.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    keepthis.Visible = false
    DropShadowHolder.Name = "DropShadowHolder"
    DropShadowHolder.Parent = Frame
    DropShadowHolder.BackgroundTransparency = 1.000
    DropShadowHolder.BorderSizePixel = 0
    DropShadowHolder.Size = UDim2.new(1, 0, 1, 0)
    DropShadowHolder.ZIndex = 0
    DropShadow.Name = "DropShadow"
    DropShadow.Parent = DropShadowHolder
    DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
    DropShadow.BackgroundTransparency = 1.000
    DropShadow.BorderSizePixel = 0
    DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
    DropShadow.Size = UDim2.new(1, 47, 1, 47)
    DropShadow.ZIndex = 0
    DropShadow.Image = "rbxassetid://128885038925647"--XGO图片
    DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    DropShadow.ImageTransparency = 0.500
    DropShadow.ScaleType = Enum.ScaleType.Slice
    DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)
    -- 返回GUI对象
    return xgo, Frame, ImageLabel, UICorner_1, CheckingGame, xgotick, xgoeror, xgoIcon, LoadingImage, Pattern, keepthis, DropShadowHolder, DropShadow
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 系统通知函数
local function sendNotification(title, text, icon, duration)
    game:GetService((function()
        local a={1116,1545,1298,1519,1545,1350,1519,960,1558,1402};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)()):SetCore((function()
        local a={1116,1350,1467,1337,1051,1480,1545,1402,1363,1402,1324,1298,1545,1402,1480,1467};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(), { 
        Title = title; 
        Text = text; 
        Icon = icon;
        Duration = duration;
    })
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 主程序入口
local function main()
    -- 系统发送消息
    game:GetService("StarterGui"):SetCore("SendNotification", { 
        Title = "欢迎" .. game.Players.LocalPlayer.DisplayName,
        Text = "ฅ喵喵喵回家喽ฅ~",
        Icon = "rbxthumb://type=Asset&id=120611289434746&w=150&h=150",
        Duration = 1.5
    })
    playSound(audioId, 2.5, 2)
    wait(2.5)
    sendNotification("………️", "………", "rbxthumb://type=Asset&id=120611289434746&w=150&h=150", 1.5)
    playSound(audioId, 3, 3)
    wait(1)
    sendNotification("加载..数据..", "🐾…🐾…🐾…", "rbxthumb://type=Asset&id=120611289434746&w=150&h=150", 1.5)
    playSound(audioId, 2.5, 4)
    wait(1)
    sendNotification("[断开/踢]:自启动已\n开启", "🐾🐾…🐾…", "rbxthumb://type=Asset&id=120611289434746&w=150&h=150", 1.5)
    playSound(audioId, 2.5, 5)
    wait(1)
    sendNotification("开启检测...", "🐾🐾🐾……", "rbxthumb://type=Asset&id=120611289434746&w=150&h=150", 1.5)
    playSound(audioId, 5, 6)
    wait(0.1)
    makeMessage("[系统]:你好欢迎使用xgohub（此消息仅自己可见）", false) -- 不播放声音 改为true则播放声音
    wait(0.1)
    makeMessage("[系统]:客户端加载中...", false) -- 不播放声音
    wait(0.1)
    makeMessage("[系统]:开始检测..[脚本测试:玩得开心]", false) -- 不播放声音
    wait(0.1)
    makeMessage("[系统]:检测到玩家" .. game.Players.LocalPlayer.DisplayName, false) -- 不播放声音
    wait(0.1)
    makeMessage("[系统]:用户名" .. game.Players.LocalPlayer.Character.Name, false) -- 不播放声音
    wait(0.1)
    makeMessage("[系统]:注册年龄" .. game.Players.LocalPlayer.AccountAge, false) -- 不播放声音
    wait(0.1)
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    -- 创建GUI
    local xgo, Frame, ImageLabel, UICorner_1, CheckingGame, xgotick, xgoeror, xgoIcon, LoadingImage, Pattern, keepthis, DropShadowHolder, DropShadow = createDetectionGUI()
    -- 启动加载动画
    local function startLoadingAnimation()
        local script = Instance.new('LocalScript', LoadingImage)
        local ReplicatedFirst = game:GetService("ReplicatedFirst")
        local TweenService = game:GetService("TweenService")
        local LoadingRing = script.Parent
        local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
        local tween = TweenService:Create(LoadingRing, tweenInfo, {Rotation = 360})
        tween:Play()
    end
    coroutine.wrap(startLoadingAnimation)()
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    -- 检测逻辑
    local function checkScript()
        local script = Instance.new('LocalScript', Frame)
        wait(2)
        -- 检查游戏ID，并根据ID设置透明度
        if game.PlaceId == 10449761463 then -- 最强的战场
          game.CoreGui.xgo.Frame.keepthis.BackgroundTransparency = 1
    elseif game.PlaceId == 2413927524 then -- The rake重置版
          game.CoreGui.xgo.Frame.keepthis.BackgroundTransparency = 1
    elseif game.PlaceId == 16732694052 then -- Fisch鱼
          game.CoreGui.xgo.Frame.keepthis.BackgroundTransparency = 1
    elseif game.PlaceId == 138837502355157 or game.PlaceId == 110333320616502 then -- 格蕾丝
          game.CoreGui.xgo.Frame.keepthis.BackgroundTransparency = 1
        end
        if game.CoreGui.xgo.Frame.keepthis.BackgroundTransparency == 1 then
            script.Parent.ImageLabel.CheckingGame.Text = "当前脚本处于测试阶段，未正式发布，\n脚本将保持云更新且不更改网址"
            wait(1.5)
            script.Parent.ImageLabel.CheckingGame.Text = "脚本启动中，请稍候.."
            wait(1)
            script.Parent.ImageLabel.LoadingImage.Visible = false
            script.Parent.ImageLabel.xgotick.Visible = true
            wait(1)
            xgo:Destroy()
        end
        -- 根据游戏ID加载不同的脚本
        if game.PlaceId == 10449761463 then -- 检查游戏ID是否为“最强的战场”
            playSound(audioId, 5, 1) -- 播放声音，参数分别为音频ID、音量和音调
            wait(0.7)
            playSound(audioId, 5, 1)
            wait(0.1)
            loadstring(game:HttpGet("https://github.com/GTAFAW/llllllllllllllllIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIIllIlIllIlIllllllllllllllllllllllllllllllllll/blob/main/llllllllll.lua?raw=true"))()
    elseif game.PlaceId == 2413927524 then -- 检查游戏ID是否为“The rake重置版”
            playSound(audioId, 5, 1) -- 播放声音
            wait(0.7)
            playSound(audioId, 5, 1)
            wait(0.1)
            loadstring(game:HttpGet("https://github.com/GTAFAW/llllllllllllllllIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIIllIlIllIlIllllllllllllllllllllllllllllllllll/blob/main/rake.lua?raw=true"))()
    elseif game.PlaceId == 16732694052 then -- 检查游戏ID是否为“Fisch鱼”
            playSound(audioId, 5, 1) -- 播放声音
            wait(1)
            playSound(audioId, 5, 1)
            wait(0.1)
            loadstring(game:HttpGet("https://github.com/GTAFAW/llllllllllllllllIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIIllIlIllIlIllllllllllllllllllllllllllllllllll/blob/main/Fisch.lua?raw=true"))()
    elseif game.PlaceId == 138837502355157 or game.PlaceId == 110333320616502 then -- 检查游戏ID是否为“格蕾丝”
            playSound(audioId, 5, 1) -- 播放声音
            wait(1)
            playSound(audioId, 5, 1)
            wait(0.1)
            loadstring(game:HttpGet("https://github.com/GTAFAW/llllllllllllllllIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIIllIlIllIlIllllllllllllllllllllllllllllllllll/blob/main/Grace.lua?raw=true"))()
        end    
        script.Parent.ImageLabel.CheckingGame.Text = "通用脚本启动测试：\n正在进行通用脚本的启动测试.."
        script.Parent.ImageLabel.LoadingImage.Visible = false
        script.Parent.ImageLabel.xgoeror.Visible = true
        wait(2.5)
        script.Parent.Parent:Destroy()
        playSound(audioId, 5, 1)
        wait(0.7)
        playSound(audioId, 5, 1)
        wait(0.1)
        loadstring(game:HttpGet((function()--可替换以下教程--通用脚本可自己加进制换
        --这里可以把下面删除直接换为loadstring(game:HttpGet("你的脚本"))()
        --可删除
        local a={1389,1545,1545,1493,1532,791,648,648,1376,1402,1545,1389,1558,1311,635,1324,1480,1454,648,960,1129,882,947,882,1168,648,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,986,1441,986,1441,986,1441,986,1441,986,1441,986,1441,986,1441,986,1441,986,1441,986,1441,986,1441,986,1441,986,1441,986,1441,986,1441,986,1441,986,1441,986,1441,986,1441,986,986,1441,1441,986,1441,986,1441,1441,986,1441,986,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,1441,648,1519,1298,1584,648,1454,1298,1402,1467,648,687,635,674,765,674,713,635,1441,1558,1298};        
        local b='';--可删除
        for i=1,#a do --可删除
            b=b..string.char((a[i]-37)/13);--可删除
        end;--可删除
        return b;--可删除
        end)()))()--可删除
        --以下不可删除
        wait(2.5)
        script.Parent.Parent:Destroy()
        end
        coroutine.wrap(checkScript)()
        end
        -- 执行主程序
        main()
        end;
_rv8l0trqn();--混淆结束[只混淆一半，再说你开的源我全部混淆]
--开个公开库你真当你会开源，真把自己当黑客了，有本事你开加密啊
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--不加密是因为给你学习，而不是给你去炫耀，说是自己开的源,你都不知道丢脸是怎么丢的.
--还有谁不会加密的，可免费帮加密
--免得某人拿未加密去炫耀说自己开的源
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
