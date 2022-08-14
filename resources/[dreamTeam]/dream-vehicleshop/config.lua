Config = {}

Config.Location = vector3(-57.287448883057, -1097.4565429688, 26.422357559204)

Config.BoughtVehicleSpawnLocation = {coords= vector3(-53.75075, -1111.026, 25.828771),heading = 72.2} 

Config.Blip = {
  id = 326,
  color = 3,
  scale = 0.8,
  label = "LA Auto Center",
  showBlip = true
}

-- Vehicle Stock

Config.Hour = 1
Config.NumOfVehicles = 1


-- Test Drive

Config.TestDrive = {
    testDriveTimer = 120,
    testDriveCost = 5000,
}

-- Categories And Vehicles
Config.Vehicles = {
    {
      title = "daily vehicles",
      buttons = {
		{ name = "Panto", costs = 5000, model = "panto", stock = "5", maxStock = "5" },
		{ name = "Blista", costs = 2000, model = "blista", maxStock = "1" },
	  }
    }, -- BURAYA ASLA DOKUNMA AMINA KORUM
    {
      title = "Compact",
      buttons = {
        { name = "Panto", costs = 5000, model = "panto", stock = "5", maxStock = "5" },
		{ name = "Blista", costs = 2000, model = "blista" },
		{ name = "Brioso", model = "brioso", costs = 62000 },
		{ name = "Dilettante", model = "dilettante", costs = 40000 },
		{ name = "Issi S", model = "issi2", costs = 38500 },
		{ name = "Prairie", model = "prairie", costs = 60000 },
		{ name = "Rhapsody", model = "rhapsody", costs = 30000 },
		}
    },
	{ 
		title = "offroad",
		buttons = {
		{ name = "Bf Injection", model = "bfinjection", costs = 15000 },
		{ name = "Bifta", model = "bifta", costs = 18000 },
		{ name = "Brawler", model = "brawler", costs = 30000 },
		{ name = "Mesa OR", model = "mesa3", costs = 45000 },
		{ name = "Rancher XL", model = "rancherxl", costs = 30000 },
		{ name = "Rebel OR", model = "rebel2", costs = 20000 },
		}	
	},
    {
      title = "Spor",
      buttons = {
		{ name = "Alpha", model = "alpha", costs = 20000 },
		{ name = "Banshee", model = "banshee", costs = 35000 },
		{ name = "Blista S", model = "blista2", costs = 6000 },
		{ name = "Blista GT", model = "blista3", costs = 25000 },
		{ name = "Buffalo", model = "buffalo", costs = 68000 },
		{ name = "Buffalo GT", model = "buffalo3", costs = 70000 },
		{ name = "Carboni", model = "carbonizzare", costs = 55500 },
		{ name = "Comet SX", model = "comet2", costs = 80000 },
		{ name = "Coquette", model = "coquette", costs = 45000 },
		{ name = "Elegy", model = "elegy", costs = 75000 },
		{ name = "Elegy S", model = "elegy2", costs = 78000 },
		{ name = "Feltzer S", model = "feltzer2", costs = 63100 },
		{ name = "Furore GT", model = "furoregt", costs = 50000 },
		{ name = "Fusilade", model = "fusilade", costs = 66000 },
		{ name = "Futo", model = "futo", costs = 75000 },
		{ name = "Jester", model = "jester", costs = 150000 },
		{ name = "Khamelion", model = "khamelion", costs = 83000 },
		{ name = "Kuruma", model = "kuruma", costs = 98000 },
		{ name = "Massacro", model = "massacro", costs = 88000 },
		{ name = "Neon", model = "neon", costs = 170000 },
		{ name = "Ninef", model = "ninef", costs = 63000 },
		{ name = "Pariah", model = "pariah", costs = 72200 },
		{ name = "Penumbra", model = "penumbra", costs = 66500 },
		{ name = "Raiden", model = "raiden", costs = 68800 },
		{ name = "Rapid GT", model = "rapidgt", costs = 35000 },
		{ name = "Rapidgt Turbo", model = "rapidgt2", costs = 82500 },
		{ name = "Revolter", model = "revolter", costs = 40000 },
		{ name = "ruston", model = "ruston", costs = 93200 },
		{ name = "Schafter ST", model = "schafter3", costs = 40000 },
		{ name = "Schwarzer", model = "schwarzer", costs = 65350 },
		{ name = "Seven 70", model = "seven70", costs = 93000 },
		{ name = "Specter", model = "specter", costs = 58750 },
		{ name = "Streiter", model = "streiter", costs = 100000 },
		{ name = "Sultan", model = "sultan", costs = 86642 },
		{ name = "Surano", model = "surano", costs = 71350 },
		{ name = "Tampa ST", model = "tampa2", costs = 43500 },
		{ name = "Tropos", model = "tropos", costs = 95000 },
		{ name = "Verlierer ST", model = "verlierer2", costs = 96000 },
      }
    },
	 {
      title = "coupes",
      buttons = {
        { name = "Cogcabrio", model = "cogcabrio", costs = 40000 },
		{ name = "Exemplar", model = "exemplar", costs = 60000 },
		{ name = "F620", model = "f620", costs = 70000 },
		{ name = "Felon", model = "felon", costs = 70000 },
		{ name = "Felon S", model = "felon2", costs = 60000 },
		{ name = "Jackal", model = "jackal", costs = 92000 },
		{ name = "Oracle S", model = "oracle", costs = 82000 },
		{ name = "Oracle", model = "oracle2", costs = 87000 },
		{ name = "sentinel", model = "sentinel", costs = 100000 },
		{ name = "Windsor", model = "windsor", costs = 70000 },
		{ name = "windsor S", model = "windsor2", costs = 70000 },
		{ name = "zion", model = "zion", costs = 75000 },
		{ name = "zion S", model = "zion2", costs = 80000 },
      }
    },
	 {
	  title = "muscle",
	  buttons = {
		{ name = "Blade", model = "blade", costs = 1000 },
		{ name = "Buccaneer", model = "buccaneer", costs = 10000 },
		{ name = "Chino", model = "chino", costs = 15000 },
		{ name = "Chino S", model = "chino2", costs = 20000 },
		{ name = "Coquette GM", model = "coquette3", costs = 80000 },
		{ name = "Dominator", model = "dominator", costs = 55000 },
		{ name = "Faction", model = "faction", costs = 35000 },
		{ name = "Gauntlet", model = "gauntlet", costs = 40000 },
		{ name = "Hermes", model = "hermes", costs = 53000 },
		{ name = "Hotknife", model = "hotknife", costs = 50000 },
		{ name = "Moon Beam", model = "moonbeam", costs = 65000 },
		{ name = "Night Shade", model = "nightshade", costs = 30300 },
		{ name = "Picador", model = "picador", costs = 15000 },
		{ name = "Ratloader MS", model = "ratloader2", costs = 18000 },
		{ name = "Ruiner", model = "ruiner", costs = 54000 },
		{ name = "Sabre GT", model = "sabregt", costs = 87000 },
		{ name = "Slam Van", model = "slamvan", costs = 80000 },
		{ name = "stalion", model = "stalion", costs = 42000 },
		{ name = "Tampa GT", model = "tampa", costs = 20000 },
		{ name = "Vigero", model = "vigero", costs = 78000 },
		{ name = "Virgo", model = "virgo", costs = 75000 },
		{ name = "Voodoo", model = "voodoo", costs = 70000 },
		{ name = "Yosemite", model = "yosemite", costs = 70000 },
	  } 
 	},
	 {
	   title = "sedans",
	   buttons = {
		{ name = "Asea", model = "asea", costs = 3000 },
		{ name = "Asterope", model = "asterope", costs = 4000 },
		{ name = "COG55", model = "cog55", costs = 25000 },
		{ name = "Cognoscenti", model = "cognoscenti", costs = 30000 },
		{ name = "Emperor", model = "emperor", costs = 8000 },
		{ name = "Fugitive", model = "fugitive", costs = 35000 },
		{ name = "Glendale", model = "glendale", costs = 25000 },
		{ name = "Ingot", model = "ingot", costs = 45000 },
		{ name = "Intruder", model = "intruder", costs = 53000 },
		{ name = "Premier", model = "premier", costs = 35000 },
		{ name = "Primo", model = "primo", costs = 50000 },
		{ name = "Regina", model = "regina", costs = 22500 },
		{ name = "Schafter SD", model = "schafter2", costs = 45000 },
		{ name = "Stanier", model = "stanier", costs = 40000 },
		{ name = "Stratum", model = "stratum", costs = 63000 },
		{ name = "Stretch", model = "stretch", costs = 100000 },
		{ name = "Superd", model = "superd", costs = 42000 },
		{ name = "Surge", model = "surge", costs = 30000 },
		{ name = "Tailgater", model = "tailgater", costs = 86000 },
		{ name = "Warrener", model = "warrener", costs = 35000 },
		{ name = "Washington", model = "washington", costs = 25000 },
	  }
	 },
	  {
	   title = "sportsclassics", 
	   buttons = {
       { name = "Btype", model = "btype", costs = 90000 },
       { name = "Btype SC", model = "btype2", costs = 95000 },
       { name = "Btype S", model = "btype3", costs = 99000 },
       { name = "Casco", model = "casco", costs = 42000 },
       { name = "Coquette SC", model = "coquette2", costs = 54000 },
       { name = "Feltzer SC", model = "feltzer3", costs = 80000 },
	   { name = "GT500", model = "gt500", costs = 70000 },
       { name = "Infernus SC", model = "infernus2", costs = 70000 },
	   { name = "Mamba", model = "mamba", costs = 40000 },
       { name = "Manana", model = "manana", costs = 66000 },
       { name = "Monroe", model = "monroe", costs = 84000 },
       { name = "Peyote", model = "peyote", costs = 86500 },
       { name = "Pigalle", model = "pigalle", costs = 20000 },
       { name = "Rapid GTSC", model = "rapidgt3", costs = 38000 },
       { name = "Retinue", model = "retinue", costs = 78000 },
       { name = "Savestra", model = "savestra", costs = 85000 },
       { name = "Stinger", model = "stinger", costs = 76000 },
       { name = "Stromberg", model = "stromberg", costs = 77000 },
       { name = "Turismo SC", model = "turismo2", costs = 90000 },
       { name = "Viseris", model = "viseris", costs = 100000 },
       { name = "Ztype", model = "ztype", costs = 100000 },
      }
	 },
	  {
		title = "suv", 
		buttons = {
		{ name = "Baller", model = "baller", costs = 40000 },
		{ name = "Baller Super", model = "baller4", costs = 50000 },
		{ name = "BJXL", model = "bjxl", costs = 50000 },
		{ name = "Cavalcade", model = "cavalcade", costs = 92000 },
		{ name = "Contender", model = "contender", costs = 70000 },
		{ name = "Dubsta", model = "dubsta", costs = 95000 },
		{ name = "FQ2", model = "fq2", costs = 63000 },
		{ name = "Granger", model = "granger", costs = 50000 },
		{ name = "Gresley", model = "gresley", costs = 70000 },
		{ name = "Habanero", model = "habanero", costs = 62000 },
		{ name = "Huntley", model = "huntley", costs = 100000 },
		{ name = "Lands Talker", model = "landstalker", costs = 85000 },
		{ name = "Mesa S", model = "mesa", costs = 60000 },
		{ name = "Patriot", model = "patriot", costs = 70000 },
		{ name = "Radi", model = "radi", costs = 74000 },
		{ name = "Rocoto", model = "rocoto", costs = 60000 },
		{ name = "Sadler", model = "sadler", costs = 100000 },
		{ name = "Seminole", model = "seminole", costs = 97000 },
		{ name = "Serrano", model = "serrano", costs = 78000 },
		{ name = "XLS", model = "xls", costs = 70000 },
	   }
     },
	 {
	   title = "vans",
	   buttons = {
		{ name = "Bobcatxl", model = "bobcatxl", costs = 50000 },
		{ name = "Camper", model = "camper", costs = 60000 },
		{ name = "Journey", model = "journey", costs = 80000 },
		{ name = "Minivan", model = "minivan", costs = 70000 },
		{ name = "Minivan2", model = "minivan2", costs = 50000 },
		{ name = "Rumpo VN", model = "rumpo3", costs = 65000 },
		{ name = "Speedo", model = "speedo", costs = 100000 },
		{ name = "Youga", model = "Youga", costs = 24000 },
		{ name = "Youga VN", model = "youga2", costs = 20000 },
	   }
	},
    {
      title = "Motorsiklet",
      buttons = {
        { name = "Akuma", costs = 2200, model = "akuma", maxStock = 15 },
		{ name = "Avarus", model = "avarus", costs = 4700 },
		{ name = "Bati", model = "bati", costs = 50000 },
		{ name = "Carbonr S", model = "carbonrs", costs = 31200 },
		{ name = "Cliff hanger", model = "cliffhanger", costs = 7700 },
		{ name = "Daemon", model = "daemon", costs = 18100 },
		{ name = "Defiler", model = "defiler", costs = 5000 },
		{ name = "Diablous S", model = "Diablous2", costs = 50000 },
		{ name = "Double", model = "double", costs = 35000 },
		{ name = "Ess key", model = "esskey", costs = 14000 },
		{ name = "Faggio S", model = "faggio", costs = 5500 },
		{ name = "FCR", model = "fcr", costs = 13500 },
		{ name = "FCR S", model = "fcr2", costs = 19600 },
		{ name = "Gargoyle", model = "gargoyle", costs = 34000 },
		{ name = "Hakuchou", model = "hakuchou", costs = 60000 },
		{ name = "Hexer", model = "hexer", costs = 19500 },
		{ name = "Innovation", model = "innovation", costs = 32000 },
		{ name = "Lectro", model = "lectro", costs = 40000 },
		{ name = "Nightblade", model = "nightblade", costs = 25000 },
		{ name = "PCJ", model = "pcj", costs = 13500 },
		{ name = "Ruffian", model = "ruffian", costs = 10000 },
		{ name = "Sanchez", model = "sanchez2", costs = 15000 },
		{ name = "Vader", model = "vader", costs = 11700 },
		{ name = "Vortex", model = "vortex", costs = 13356 },
		{ name = "Wolfsbane", model = "wolfsbane", costs = 27000 },
      }
    }
}


-- https://wiki.rage.mp/index.php?title=Vehicle_Colors
Config.Colors = {
  {r = 255, g = 255, b = 246, colorName = "white", gtaColor = 111},
  {r = 13, g = 17, b = 22, colorName = "black", gtaColor = 0},
  {r = 194, g = 196, b = 198, colorName = "grey", gtaColor = 5},
  {r = 255, g = 207, b = 32, colorName = "yellow", gtaColor = 88},
  {r = 18, g = 56, b = 60, colorName = "green", gtaColor = 51},
  {r = 207, g = 31, b = 33, colorName = "red", gtaColor = 39},
  {r = 71, g = 87, b = 143, colorName = "blue", gtaColor = 64},
  {r = 242, g = 31, b = 153, colorName = "pink", gtaColor = 135},
  {r = 102, g = 184, b = 31, colorName = "limegreen", gtaColor = 55},
  {r = 110, g = 163, b = 198, colorName = "lightblue", gtaColor = 74},
}

-- Functions;

-- Client:
Config.BuyVehicleFunc = function(Core,vehicleEntity,vehicleName)
    local vehicleProps = Core.Functions.GetVehicleProperties(vehicleEntity)
    local model = GetEntityModel(vehicleEntity)
    vehicleProps.displayName = vehicleName
    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(vehicleEntity), vehicleEntity)
    TriggerServerEvent('dream-vehicleshop:setVehicleOwned', vehicleProps)
end

Config.TestDriveFunc = function(Core,vehicleEntity)
    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(vehicleEntity), vehicleEntity)
end

-- Server:

Config.GetPlayerMoney = function(playerId,Core)
    if type(playerId) == "number" then
        local player = Core.Functions.GetPlayer(playerId)
        if player then
            return player.PlayerData.money["cash"]
        end
    end
end

Config.RemovePlayerMoney = function(playerId, amount, Core)
    local player = Core.Functions.GetPlayer(playerId)
    if player then
        player.Functions.RemoveMoney("cash", amount)
    end
end

Config.GetPlayerNameFunc = function(playerId,Core)
    local player = Core.Functions.GetPlayer(playerId)
    return player.PlayerData.charinfo.firstname .. " " .. player.PlayerData.charinfo.lastname 
end

Config.ResetStockEvent = {
    name = "dream-vehicleshop:resetstock",
    safe_for_net = false
}
   
Config.SetDefaultStockEvent = {
  name = "dream-vehicleshop:setDefaultStock",
  safe_for_net = true
}

