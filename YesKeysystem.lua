local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "World Hub Key system V3.0", HidePremium = false,IntroEnabled = false, SaveConfig = true, ConfigFolder = "OrionTest"})
local generatedKeys = {}

local function generateKey()
  math.randomseed(os.time())
  local key = ""
  for i = 1, 10 do
    key = key .. math.random(0, 9)
  end
  table.insert(generatedKeys, key)
  return key
end

local Tab = Window:MakeTab({
	Name = "Key system",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "Please enter key"
})
Tab:AddButton({
	Name = "Generate Key",
	Callback = function()
    local key = generateKey()
    print("Generated key: " .. key)
    setclipboard(key)
	Tab:AddLabel("Ya tienes la key copiada/You already have the key copied")
  	end    
})
Tab:AddTextbox({
	Name = "Key",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		local keyExists = false
		for i,v in pairs(generatedKeys) do
			if v == Value then
				keyExists = true
				break
			end
		end
		if keyExists then
			Tab:AddLabel("running World Hub!")
            loadstring(game:HttpGet("https://raw.githubusercontent.com/comet3456998765/NewSkHub/main/World%20Hub.lua"))()
			wait("10")
			OrionLib:Destroy()
		else
			Tab:AddLabel("Invalid Key")
			Tab:AddLabel("You don't want to run the old version, it doesn't have a key")
			Tab:AddButton({
				Name = "Run old version",
				Callback = function()
					    loadstring(game:HttpGet("https://raw.githubusercontent.com/comet3456998765/YesSKHUB/main/Main1"))()
						wait("5")
						OrionLib:Destroy()
				  end    
			})
		end
	end	  
})
Tab:AddButton({
	Name = "you want to run the mobile version of orion lib",
	Callback = function()
		    loadstring(game:HttpGet("https://raw.githubusercontent.com/comet3456998765/SKHub-Orion/main/Your%20hub%20men"))()
  	end    
})
local Tab = Window:MakeTab({
	Name = "Changelog",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "Info"
})
Tab:AddParagraph("Changelog","(+) Added Chat spy")

OrionLib:Init()
