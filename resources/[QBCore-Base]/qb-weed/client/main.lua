local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData()
local housePlants = {}
local insideHouse = false
local currentHouse = nil
local plantSpawned = false

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    LocalPlayer.state:set("inv_busy", false, true)
    PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    LocalPlayer.state:set("inv_busy", true, true)
    PlayerData = {}
end)

RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
    PlayerData = val
end)

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(5)
    end
end



DrawText3Ds = function(x, y, z, text)
	SetTextScale(0.45, 0.45)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
	SetTextDropshadow(1, 1, 1, 1, 255)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

RegisterNetEvent('qb-weed:client:getHousePlants', function(house)
    QBCore.Functions.TriggerCallback('qb-weed:server:getBuildingPlants', function(plants)
        currentHouse = house
        housePlants[currentHouse] = plants
        insideHouse = true
        spawnHousePlants()
    end, house)
end)

function spawnHousePlants()
    CreateThread(function()
        if not plantSpawned then
            for k, _ in pairs(housePlants[currentHouse]) do
                local plantData = {
                    ["plantCoords"] = {["x"] = json.decode(housePlants[currentHouse][k].coords).x, ["y"] = json.decode(housePlants[currentHouse][k].coords).y, ["z"] = json.decode(housePlants[currentHouse][k].coords).z},
                    ["plantProp"] = GetHashKey(QBWeed.Plants[housePlants[currentHouse][k].sort]["stages"][housePlants[currentHouse][k].stage]),
                }

                local plantProp = CreateObject(plantData["plantProp"], plantData["plantCoords"]["x"], plantData["plantCoords"]["y"], plantData["plantCoords"]["z"], false, false, false)
                while not plantProp do Wait(0) end
                PlaceObjectOnGroundProperly(plantProp)
                Wait(10)
                FreezeEntityPosition(plantProp, true)
                SetEntityAsMissionEntity(plantProp, false, false)
            end
            plantSpawned = true
        end
    end)
end

function despawnHousePlants()
    CreateThread(function()
        if plantSpawned then
            for k, _ in pairs(housePlants[currentHouse]) do
                local plantData = {
                    ["plantCoords"] = {["x"] = json.decode(housePlants[currentHouse][k].coords).x, ["y"] = json.decode(housePlants[currentHouse][k].coords).y, ["z"] = json.decode(housePlants[currentHouse][k].coords).z},
                }

                for _, stage in pairs(QBWeed.Plants[housePlants[currentHouse][k].sort]["stages"]) do
                    local closestPlant = GetClosestObjectOfType(plantData["plantCoords"]["x"], plantData["plantCoords"]["y"], plantData["plantCoords"]["z"], 3.5, GetHashKey(stage), false, false, false)
                    if closestPlant ~= 0 then
                        DeleteObject(closestPlant)
                    end
                end
            end
            plantSpawned = false
        end
    end)
end

local ClosestTarget = 0

CreateThread(function()
    while true do
        Wait(0)
        if insideHouse then
            if plantSpawned then
                local ped = PlayerPedId()
                for k, _ in pairs(housePlants[currentHouse]) do
                    local gender = "M"
                    if housePlants[currentHouse][k].gender == "woman" then gender = "F" end

                    local plantData = {
                        ["plantCoords"] = {["x"] = json.decode(housePlants[currentHouse][k].coords).x, ["y"] = json.decode(housePlants[currentHouse][k].coords).y, ["z"] = json.decode(housePlants[currentHouse][k].coords).z},
                        ["plantStage"] = housePlants[currentHouse][k].stage,
                        ["plantProp"] = GetHashKey(QBWeed.Plants[housePlants[currentHouse][k].sort]["stages"][housePlants[currentHouse][k].stage]),
                        ["plantSort"] = {
                            ["name"] = housePlants[currentHouse][k].sort,
                            ["label"] = QBWeed.Plants[housePlants[currentHouse][k].sort]["label"],
                        },
                        ["plantStats"] = {
                            ["food"] = housePlants[currentHouse][k].food,
                            ["health"] = housePlants[currentHouse][k].health,
                            ["progress"] = housePlants[currentHouse][k].progress,
                            ["stage"] = housePlants[currentHouse][k].stage,
                            ["highestStage"] = QBWeed.Plants[housePlants[currentHouse][k].sort]["highestStage"],
                            ["gender"] = gender,
                            ["plantId"] = housePlants[currentHouse][k].plantid,
                        }
                    }

                    local plyDistance = #(GetEntityCoords(ped) - vector3(plantData["plantCoords"]["x"], plantData["plantCoords"]["y"], plantData["plantCoords"]["z"]))

                    if plyDistance < 0.8 then

                        ClosestTarget = k
                        if plantData["plantStats"]["health"] > 0 then
                            if plantData["plantStage"] ~= plantData["plantStats"]["highestStage"] then
                                DrawText3Ds(plantData["plantCoords"]["x"], plantData["plantCoords"]["y"], plantData["plantCoords"]["z"], 'Tür: '..plantData["plantSort"]["label"]..'~w~ ['..plantData["plantStats"]["gender"]..'] | Beslenme: ~b~'..plantData["plantStats"]["food"]..'% ~w~ | Saglık: ~b~'..plantData["plantStats"]["health"]..'%')
                            else
                                DrawText3Ds(plantData["plantCoords"]["x"], plantData["plantCoords"]["y"], plantData["plantCoords"]["z"] + 0.2, "~g~ E ~w~ Hasat Et.")
                                DrawText3Ds(plantData["plantCoords"]["x"], plantData["plantCoords"]["y"], plantData["plantCoords"]["z"], 'Tür: ~g~'..plantData["plantSort"]["label"]..'~w~ ['..plantData["plantStats"]["gender"]..'] | Beslenme: ~b~'..plantData["plantStats"]["food"]..'% ~w~ | Saglık: ~b~'..plantData["plantStats"]["health"]..'%')
                                if IsControlJustPressed(0, 38) then
                                    QBCore.Functions.Progressbar("remove_weed_plant", "Bitki hasat ediliyor", 8000, false, true, {
                                        disableMovement = true,
                                        disableCarMovement = true,
                                        disableMouse = false,
                                        disableCombat = true,
                                    }, {
                                        animDict = "amb@world_human_gardener_plant@male@base",
                                        anim = "base",
                                        flags = 16,
                                    }, {}, {}, function() -- Done
                                        ClearPedTasks(ped)
                                        local amount = math.random(1, 6)
                                        if plantData["plantStats"]["gender"] == "M" then
                                            amount = math.random(1, 2)
                                        end
                                        TriggerServerEvent('qb-weed:server:harvestPlant', currentHouse, amount, plantData["plantSort"]["name"], plantData["plantStats"]["plantId"])
                                    end, function() -- Cancel
                                        ClearPedTasks(ped)
                                        QBCore.Functions.Notify("İşlem İptal Edildi", "error")
                                    end)
                                end
                            end
                        elseif plantData["plantStats"]["health"] == 0 then
                            DrawText3Ds(plantData["plantCoords"]["x"], plantData["plantCoords"]["y"], plantData["plantCoords"]["z"], '~r~ E ~w~ Ölü bitkiyi ortadan kaldır')
                            if IsControlJustPressed(0, 38) then
                                QBCore.Functions.Progressbar("remove_weed_plant", "Bitki kaldırılıyor", 8000, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "amb@world_human_gardener_plant@male@base",
                                    anim = "base",
                                    flags = 16,
                                }, {}, {}, function() -- Done
                                    ClearPedTasks(ped)
                                    TriggerServerEvent('qb-weed:server:removeDeathPlant', currentHouse, plantData["plantStats"]["plantId"])
                                end, function() -- Cancel
                                    ClearPedTasks(ped)
                                    QBCore.Functions.Notify("İşlem iptal edildi", "error")
                                end)
                            end
                        end
                    end
                end
            end
        end

        if not insideHouse then
            Wait(5000)
        end
    end
end)

RegisterNetEvent('qb-weed:client:leaveHouse', function()
    despawnHousePlants()
    SetTimeout(1000, function()
        if currentHouse ~= nil then
            insideHouse = false
            housePlants[currentHouse] = nil
            currentHouse = nil
        end
    end)
end)

RegisterNetEvent('qb-weed:client:refreshHousePlants', function(house)
    if currentHouse ~= nil and currentHouse == house then
        despawnHousePlants()
        SetTimeout(100, function()
            QBCore.Functions.TriggerCallback('qb-weed:server:getBuildingPlants', function(plants)
                currentHouse = house
                housePlants[currentHouse] = plants
                spawnHousePlants()
            end, house)
        end)
    end
end)

RegisterNetEvent('qb-weed:client:refreshPlantStats', function()
    if insideHouse then
        despawnHousePlants()
        SetTimeout(100, function()
            QBCore.Functions.TriggerCallback('qb-weed:server:getBuildingPlants', function(plants)
                housePlants[currentHouse] = plants
                spawnHousePlants()
            end, currentHouse)
        end)
    end
end)

RegisterNetEvent('qb-weed:client:placePlant', function(type, item)
    local ped = PlayerPedId()
    local plyCoords = GetOffsetFromEntityInWorldCoords(ped, 0, 0.75, 0)
    local plantData = {
        ["plantCoords"] = {["x"] = plyCoords.x, ["y"] = plyCoords.y, ["z"] = plyCoords.z},
        ["plantModel"] = QBWeed.Plants[type]["stages"]["stage-a"],
        ["plantLabel"] = QBWeed.Plants[type]["label"]
    }
    local ClosestPlant = 0
    for _, v in pairs(QBWeed.Props) do
        if ClosestPlant == 0 then
            ClosestPlant = GetClosestObjectOfType(plyCoords.x, plyCoords.y, plyCoords.z, 0.8, GetHashKey(v), false, false, false)
        end
    end

    if currentHouse ~= nil then
        if ClosestPlant == 0 then
	LocalPlayer.state:set("inv_busy", true, true)
            QBCore.Functions.Progressbar("plant_weed_plant", "Ekim Yapılıyor", 8000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "amb@world_human_gardener_plant@male@base",
                anim = "base",
                flags = 16,
		LocalPlayer.state:set("inv_busy", false, true)
            }, {}, {}, function() -- Done
                ClearPedTasks(ped)
                TriggerServerEvent('qb-weed:server:placePlant', json.encode(plantData["plantCoords"]), type, currentHouse)
                TriggerServerEvent('qb-weed:server:removeSeed', item.slot, type)
            end, function() -- Cancel
                ClearPedTasks(ped)
                QBCore.Functions.Notify("İşlem iptal edildi", "error")
		LocalPlayer.state:set("inv_busy", false, true)
            end)
        else
            QBCore.Functions.Notify("Can't Place Here", 'error', 3500)
        end
    else
        QBCore.Functions.Notify("It's Not Safe Here, try your house", 'error', 3500)
    end
end)

RegisterNetEvent('qb-weed:client:foodPlant', function()
    if currentHouse ~= nil then
        if ClosestTarget ~= 0 then
            local ped = PlayerPedId()
            local gender = "M"
            if housePlants[currentHouse][ClosestTarget].gender == "woman" then
                gender = "F"
            end

            local plantData = {
                ["plantCoords"] = {["x"] = json.decode(housePlants[currentHouse][ClosestTarget].coords).x, ["y"] = json.decode(housePlants[currentHouse][ClosestTarget].coords).y, ["z"] = json.decode(housePlants[currentHouse][ClosestTarget].coords).z},
                ["plantStage"] = housePlants[currentHouse][ClosestTarget].stage,
                ["plantProp"] = GetHashKey(QBWeed.Plants[housePlants[currentHouse][ClosestTarget].sort]["stages"][housePlants[currentHouse][ClosestTarget].stage]),
                ["plantSort"] = {
                    ["name"] = housePlants[currentHouse][ClosestTarget].sort,
                    ["label"] = QBWeed.Plants[housePlants[currentHouse][ClosestTarget].sort]["label"],
                },
                ["plantStats"] = {
                    ["food"] = housePlants[currentHouse][ClosestTarget].food,
                    ["health"] = housePlants[currentHouse][ClosestTarget].health,
                    ["progress"] = housePlants[currentHouse][ClosestTarget].progress,
                    ["stage"] = housePlants[currentHouse][ClosestTarget].stage,
                    ["highestStage"] = QBWeed.Plants[housePlants[currentHouse][ClosestTarget].sort]["highestStage"],
                    ["gender"] = gender,
                    ["plantId"] = housePlants[currentHouse][ClosestTarget].plantid,
                }
            }
            local plyDistance = #(GetEntityCoords(ped) - vector3(plantData["plantCoords"]["x"], plantData["plantCoords"]["y"], plantData["plantCoords"]["z"]))

            if plyDistance < 1.0 then
                if plantData["plantStats"]["food"] == 100 then
                    QBCore.Functions.Notify('Şuan da gübreye ihtiyacı yok', 'error', 3500)
                else
		            LocalPlayer.state:set("inv_busy", true, true)
                    QBCore.Functions.Progressbar("plant_weed_plant", "Bitki gübreleniyor", math.random(4000, 8000), false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "timetable@gardener@filling_can",
                        anim = "gar_ig_5_filling_can",
                        flags = 16,

                        LocalPlayer.state:set("inv_busy", false, true)
                    }, {}, {}, function() -- Done
                        ClearPedTasks(ped)
                        local newFood = math.random(40, 60)
                        TriggerServerEvent('qb-weed:server:foodPlant', currentHouse, newFood, plantData["plantSort"]["name"], plantData["plantStats"]["plantId"])
                    end, function() -- Cancel
                        ClearPedTasks(ped)
			            LocalPlayer.state:set("inv_busy", false, true)
                        QBCore.Functions.Notify("İşlem iptal edildi", "error")
                    end)
                end
            else
                QBCore.Functions.Notify("Buraya Yerleştirilemez", "error")
            end
        else
            QBCore.Functions.Notify("Buraya Yerleştirilemez", "error")
        end
    end
end)


---------------------------------------------------------
-- weedTable dreamTeam Functions -- 
---------------------------------------------------------

function startAnim(ped, dictionary, anim)
	Citizen.CreateThread(function()
	  RequestAnimDict(dictionary)
	  while not HasAnimDictLoaded(dictionary) do
		Citizen.Wait(0)
	  end
		TaskPlayAnim(ped, dictionary, anim ,8.0, -8.0, -1, 50, 0, false, false, false)
	end)
end
    
RegisterNetEvent('dream:client:openPersonalStash', function()
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "Personel", {
        maxweight = 9000,
        slots = 150,
    })
    TriggerEvent("inventory:client:SetCurrentStash", "Personel")
end)


RegisterNetEvent("dream-weed:client:cutWeed")
AddEventHandler("dream-weed:client:cutWeed", function()
    exports['anims']:PlayEmote('mechanic3')
    QBCore.Functions.Progressbar("cut_weed", "Bitki Kesiliyor ", (QBWeed.WaitTimes['cutWeed']), false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    }, {}, {}, {}, function() -- Done
          exports['anims']:PlayEmote('c')
        TriggerServerEvent("dream-weed:server:cutWeed")
    end, function() -- Cancel
        ClearPedTasks(ped)
        QBCore.Functions.Notify("İşlem İptal Edildi", "error")
    end)
end)

RegisterNetEvent('dream-weed:client:dryWeed', function()
    exports['anims']:PlayEmote('mechanic3')
    QBCore.Functions.Progressbar("dry_weed", "Esrar Kurutuluyor", (QBWeed.WaitTimes['dryWeed']), false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    }, {}, {}, {}, function() -- Done
          exports['anims']:PlayEmote('c')
        TriggerServerEvent("dream-weed:server:dryWeed")
    end)
end)

local weedTableProps = {
    `bkr_prop_weed_table_01a`,
}


exports['qb-target']:AddTargetModel(weedTableProps, {
        options = {
            {
                event = 'dream-weed:client:cutWeed',
                icon = "fa fa-scissors",
                label = "Bitkiyi Kes", 
            },
            {
                event = 'dream-weed:client:dryWeed',
                icon = "fa fa-scissors",
                label = "Bitkiyi Kurut", 
            },
        },
    distance = 1.0
})