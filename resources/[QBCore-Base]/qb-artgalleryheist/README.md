Made by Lionh34rt#4305
Discord: https://discord.gg/AWyTUEnGeN
Tebex: https://lionh34rt.tebex.io/

# Description
* **This scripts allows players to steal the fabergé egg from the Vinewood Art Gallery. This script is made for people who have acquired K4MB1's Art Gallery MLO (Not included here). All the hacks and lasers are synced with every client via the server. After hacking the three outside spots, the main door will open and the lasers will be activated. If the players run in the lasers the alarm goes off and the vault goes into lockdown and the only thing that can still be stolen are the jewellery cases in the back. To access the jewellery cases, players have to use thermite on the doors. To access the vault players have to hack into the security room and hack the server to gain access codes. Entering the wrong code will trigger the alarm. Once players have stolen the egg they can bring it to a rich collector found on the yacht**

# Dependencies
* [QBCore Framework](https://github.com/qbcore-framework)
* [mkalasers by mkafrin](https://github.com/mkafrin/mka-lasers)
* [mhacking by GHMatti](https://github.com/qbcore-framework/mhacking)
* [Vinewood Art Gallery by K4MB1 MAPS](https://k4mb1.tebex.io/package/4672250)
* [Memorygame by pushkart2](https://github.com/pushkart2/memorygame)
* [Hack minigame by Jasper-Hustad](https://github.com/Jesper-Hustad/NoPixel-minigame)
* [qb-target by BerkieBb](https://github.com/BerkieBb/qb-target)
* [ms-peds by MiddleSkillz](https://github.com/MiddleSkillz/ms-peds*)
* [qb-powerplant by Lionh34rt#4305](https://lionh34rt.tebex.io/)

# Installation
* **Add the items to your shared.lua**
* **Add the correct lines to your giveitem command**
* **Install all the dependencies**
* **Add the sound effects to your interact-sound resource**
* **Create nightvision in smallresources: see dependencies folder**
* **You may have to change the clothing piece in the nightvision.lua**
* **Make an entry for "artgallery" in your scoreboard script**
* **Change the doorlock triggers to match your corresponding doorlockId**

# ADD THE FOLLOWING TO YOUR QB-INVENTORY/SERVER/MAIN.LUA UNDER THE GIVEITEM COMMAND
```lua
-- LAPTOPS
elseif itemData["name"] == "laptop_black" then
    info.uses = 3
```

# Items for shared.lua
```lua
-- ART GALLERY
["faberge_egg"] 		 	 	 = {["name"] = "faberge_egg",           		["label"] = "Faberge Egg",	 			["weight"] = 2500, 		["type"] = "item", 		["image"] = "faberge-egg.png", 			["unique"] = true, 		["useable"] = false, 	["shouldClose"] = false,   		["combinable"] = nil,   ["description"] = "A Precious Faberge Egg."},
["laptop_black"] 		 	 	 = {["name"] = "laptop_black",        		   	["label"] = "Laptop",	 				["weight"] = 2500, 		["type"] = "item", 		["image"] = "laptop_black.png", 		["unique"] = true, 		["useable"] = true, 	["shouldClose"] = false,   		["combinable"] = nil,   ["description"] = "A laptop made for hacking"},
["sapphire"] 			 		 = {["name"] = "sapphire", 						["label"] = "Sapphire", 				["weight"] = 500, 		["type"] = "item", 		["image"] = "sapphire.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,	   	["combinable"] = nil,   ["description"] = "Gems are truly, truly, truly outrageous."},
["ruby"]						 = {["name"] = "ruby", 							["label"] = "Ruby", 					["weight"] = 500, 		["type"] = "item", 		["image"] = "ruby.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,	   	["combinable"] = nil,   ["description"] = "Gems are truly, truly, truly outrageous."},
["diamond"] 			 		 = {["name"] = "diamond", 						["label"] = "Diamond", 					["weight"] = 500, 		["type"] = "item", 		["image"] = "diamond.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,	   	["combinable"] = nil,   ["description"] = "Gems are truly, truly, truly outrageous."},
["nightvision"] 			 	 = {["name"] = "nightvision", 					["label"] = "Night Vision Goggles", 	["weight"] = 6000, 		["type"] = "item", 		["image"] = "nightvision.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,	   	["combinable"] = nil,   ["description"] = "These allow you to see in the dark"},
["artg_painting1"] 			 	 = {["name"] = "artg_painting1", 				["label"] = "Painting", 				["weight"] = 500, 		["type"] = "item", 		["image"] = "artg_painting1.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,	["combinable"] = nil,   ["description"] = "A stolen painting from the Vinewood Art Gallery"},
["artg_painting2"] 			 	 = {["name"] = "artg_painting2", 				["label"] = "Painting", 				["weight"] = 500, 		["type"] = "item", 		["image"] = "artg_painting2.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,	["combinable"] = nil,   ["description"] = "A stolen painting from the Vinewood Art Gallery"},
["artg_painting3"] 			 	 = {["name"] = "artg_painting3", 				["label"] = "Painting", 				["weight"] = 500, 		["type"] = "item", 		["image"] = "artg_painting3.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,	["combinable"] = nil,   ["description"] = "A stolen painting from the Vinewood Art Gallery"},
["artg_painting4"] 			 	 = {["name"] = "artg_painting4", 				["label"] = "Painting", 				["weight"] = 500, 		["type"] = "item", 		["image"] = "artg_painting4.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,	["combinable"] = nil,   ["description"] = "A stolen painting from the Vinewood Art Gallery"},
["artg_painting5"] 			 	 = {["name"] = "artg_painting5", 				["label"] = "Painting", 				["weight"] = 500, 		["type"] = "item", 		["image"] = "artg_painting5.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,	["combinable"] = nil,   ["description"] = "A stolen painting from the Vinewood Art Gallery"},
["artg_painting6"] 			 	 = {["name"] = "artg_painting6", 				["label"] = "Painting", 				["weight"] = 500, 		["type"] = "item", 		["image"] = "artg_painting6.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,	["combinable"] = nil,   ["description"] = "A stolen painting from the Vinewood Art Gallery"},
["artg_painting7"] 			 	 = {["name"] = "artg_painting7", 				["label"] = "Painting", 				["weight"] = 500, 		["type"] = "item", 		["image"] = "artg_painting7.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,	["combinable"] = nil,   ["description"] = "A stolen painting from the Vinewood Art Gallery"},
["artg_painting8"] 			 	 = {["name"] = "artg_painting8", 				["label"] = "Painting", 				["weight"] = 500, 		["type"] = "item", 		["image"] = "artg_painting8.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,	["combinable"] = nil,   ["description"] = "A stolen painting from the Vinewood Art Gallery"},
["artg_painting9"] 			 	 = {["name"] = "artg_painting9", 				["label"] = "Painting", 				["weight"] = 500, 		["type"] = "item", 		["image"] = "artg_painting9.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,	["combinable"] = nil,   ["description"] = "A stolen painting from the Vinewood Art Gallery"},
["artg_painting10"] 			 = {["name"] = "artg_painting10", 				["label"] = "Painting", 				["weight"] = 500, 		["type"] = "item", 		["image"] = "artg_painting10.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,	["combinable"] = nil,   ["description"] = "A stolen painting from the Vinewood Art Gallery"},
```

# Ped for ms-peds
-- SELL EGG
{
    model = `ig_dreyfuss`,
    coords = vector4(-1414.56, 6750.54, 11.91, 251.78),
    gender = 'male'
},

# When making a way for players to acquire a black laptop, you need to add info.uses
```lua
local src = source
local Player = QBCore.Functions.GetPlayer(src)
info = {
    uses = 3
}
Player.Functions.AddItem("laptop_black", 1, false, info)
```
# qb-smallresources/server/main.lua for nightvision
See dependencies
