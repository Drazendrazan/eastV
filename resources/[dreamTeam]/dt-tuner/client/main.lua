local QBCore = exports['qb-core']:GetCoreObject()
local isCrafting, isUpgrading = false, false
local isAuth = false

-- Functions qb-target 
local function init()
    exports['qb-target']:AddBoxZone("TunerOrder", vector3(128.61, -3014.46, 7.04), 1.2, 2.8, {
        name="tunershop",
        heading=0,
        minZ=5.24,
        maxZ=9.24
    }, {
        options = {{
            event = "tuners:client:order",
            icon = "far fa-clipboard",
            label = "Market",
            job = Config.TunerJob
        }},
        distance = 1.5
    })
    exports['qb-target']:AddBoxZone("TunerStorage", vector3(128.58, -3008.24, 7.04), 1.3, 2.8, {
        name="tunerstorage",
        heading=0,
        minZ=5.04,
        maxZ=9.04
    }, {
        options = {{
            event = "tuners:client:openstorage",
            icon = "fas fa-boxes",
            label = "Depo",
            job = Config.TunerJob
        }},
        distance = 2
    })
    exports['qb-target']:AddBoxZone("TunerCraft", vector3(138.96, -3051.4, 7.04), 0.8, 2.2, {
        name="tunercraft",
        heading=0,
        minZ=3.44,
        maxZ=7.44
    }, {
        options = {{
            event = "tuners:client:opencrafting",
            icon = "fas fa-wrench",
            label = "Üretim",
            job = Config.TunerJob
        }},
        distance = 2
    })
    exports['qb-target']:AddBoxZone("TunerBill", vector3(133.16, -3015.12, 7.04), 0.5, 0.35, {
        name="tunerbill",
        heading=346,
        minZ=3.04,
        maxZ=7.04
    }, {
        options = {{
            event = "tuners:client:openbilling",
            icon = "fas fa-file-invoice",
            label = "Fatura Kes",
            job = Config.TunerJob
        }},
        distance = 2
    })
    exports['qb-target']:AddBoxZone("TunerDuty", vector3(126.06, -3007.28, 7.04), 0.4, 0.35, {
        name="tunerduty",
        heading=325,
        minZ=3.04,
        maxZ=7.04
    }, {
        options = {{
            type = 'server',
            event = "QBCore:ToggleDuty",
            icon = "fas fa-business-time",
            label = "Mesai Gir/ÇıK",
            job = Config.TunerJob
        }},
        distance = 2
    })
end

local function IsBackEngine(vehModel)
	if Config.BackEngineVehicles[vehModel] then return true else return false end
end

-- Events
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    if QBCore.Functions.GetPlayerData().job.name == Config.TunerJob then
        isAuth = true
    end
    init()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(job)
    isAuth = false
    if job.name == Config.TunerJob then
        isAuth = true
    end
end)

RegisterNetEvent('tuners:client:order', function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Market", Config.ShopItems)
end)

RegisterNetEvent('tuners:client:openstorage', function()
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "tunerstorage", {
        maxweight = 4000000,
        slots = 300,
    })
    TriggerEvent("inventory:client:SetCurrentStash", "tunerstorage")
end)

RegisterNetEvent('tuners:client:opencrafting', function()
    local menu = {
        {
            header = "Üretim Menüsü",
            txt = 'Eşyalarını hazırla',
            isMenuHeader = true
        },
        {
            header = "Motorlar",
            txt = 'Araçlar için motorları üret',
            params = {
                event = "tuners:client:craftmenu",
                args = {
                    level4 = true,
                    category = 'engine_level',
                }
            }
        },
        {
            header = "Şanzımanlar",
            txt = 'Araçlar için şanzımanları üret',
            params = {
                event = "tuners:client:craftmenu",
                args = {
                    category = 'transmission_level',
                }
            }
        },
        {
            header = "Süspansiyonlar",
            txt = 'Aracın süspansiyonlarını üret',
            params = {
                event = "tuners:client:craftmenu",
                args = {
                    level4 = true,
                    category = 'suspension_level',
                }
            }
        },
        {
            header = "Frenler",
            txt = 'Aracın frenlerini üret',
            params = {
                event = "tuners:client:craftmenu",
                args = {
                    category = 'brakes_level',
                }
            }
        },
        {
            header = "Turbo",
            txt = QBCore.Shared.Items["steel"]["label"] .. ": ".. Config.Costs['turbo']['steel'] ..", " .. QBCore.Shared.Items["aluminum"]["label"] .. ": "..Config.Costs['turbo']['aluminum'] ..", " .. QBCore.Shared.Items["rubber"]["label"] .. ": "..Config.Costs['turbo']['rubber'],
            params = {
                isServer = true,
                event = "tuners:server:craftItem",
                args = {
                    action = 'start',
                    item = 'turbo',
                }
            }
        },
        {
            header = "Xenon",
            txt = QBCore.Shared.Items["steel"]["label"] .. ": ".. Config.Costs['xenon']['steel'] ..", " .. QBCore.Shared.Items["aluminum"]["label"] .. ": "..Config.Costs['xenon']['aluminum'] ..", " .. QBCore.Shared.Items["rubber"]["label"] .. ": "..Config.Costs['xenon']['rubber'],
            params = {
                isServer = true,
                event = "tuners:server:craftItem",
                args = {
                    action = 'start',
                    item = 'xenon',
                }
            }
        },
        {
            header = "Neon",
            txt = QBCore.Shared.Items["steel"]["label"] .. ": ".. Config.Costs['neon']['steel'] ..", " .. QBCore.Shared.Items["aluminum"]["label"] .. ": "..Config.Costs['neon']['aluminum'] ..", " .. QBCore.Shared.Items["rubber"]["label"] .. ": "..Config.Costs['neon']['rubber'],
            params = {
                isServer = true,
                event = "tuners:server:craftItem",
                args = {
                    action = 'start',
                    item = 'neon',
                }
            }
        },
        {
            header = "⬅ Geri",
            txt = "",
            params = {
                event = "qb-menu:closeMenu"
            }
        },
    }
    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent('tuners:client:craftmenu', function(data)
    local level1, level2, level3 = QBCore.Shared.Items[data.category..'1']["label"], QBCore.Shared.Items[data.category..'2']["label"], QBCore.Shared.Items[data.category..'3']["label"]
    local menu = {
        {
            header = "Motor Üret",
            txt = '',
            isMenuHeader = true
        },
        {
            header = level1,
            txt = QBCore.Shared.Items["steel"]["label"] .. ": ".. Config.Costs[data.category..'1']['steel'] ..", " .. QBCore.Shared.Items["aluminum"]["label"] .. ": "..Config.Costs[data.category..'1']['aluminum'] ..", " .. QBCore.Shared.Items["rubber"]["label"] .. ": "..Config.Costs[data.category..'1']['rubber'],
            params = {
                isServer = true,
                event = "tuners:server:craftItem",
                args = {
                    action = 'start',
                    item = data.category..'1',
                }
            }
        },
        {
            header = level2,
            txt = QBCore.Shared.Items["steel"]["label"] .. ": ".. Config.Costs[data.category..'2']['steel'] ..", " .. QBCore.Shared.Items["aluminum"]["label"] .. ": "..Config.Costs[data.category..'2']['aluminum'] ..", " .. QBCore.Shared.Items["rubber"]["label"] .. ": "..Config.Costs[data.category..'2']['rubber'],
            params = {
                isServer = true,
                event = "tuners:server:craftItem",
                args = {
                    action = 'start',
                    item = data.category..'2',
                }
            }
        },
        {
            header = level3,
            txt = QBCore.Shared.Items["steel"]["label"] .. ": ".. Config.Costs[data.category..'3']['steel'] ..", " .. QBCore.Shared.Items["aluminum"]["label"] .. ": "..Config.Costs[data.category..'3']['aluminum'] ..", " .. QBCore.Shared.Items["rubber"]["label"] .. ": "..Config.Costs[data.category..'3']['rubber'],
            params = {
                isServer = true,
                event = "tuners:server:craftItem",
                args = {
                    action = 'start',
                    item = data.category..'3',
                }
            }
        },
    }

    if data.level4 then
        menu[#menu + 1] = {
            header = QBCore.Shared.Items[data.category..'4']["label"],
            txt = QBCore.Shared.Items["steel"]["label"] .. ": ".. Config.Costs[data.category..'4']['steel'] ..", " .. QBCore.Shared.Items["aluminum"]["label"] .. ": "..Config.Costs[data.category..'4']['aluminum'] ..", " .. QBCore.Shared.Items["rubber"]["label"] .. ": "..Config.Costs[data.category..'4']['rubber'],
            params = {
                isServer = true,
                event = "tuners:server:craftItem",
                args = {
                    action = 'start',
                    item = data.category..'4',
                }
            }
        }
    end

    menu[#menu + 1] = {
        header = "⬅ Back",
        txt = "",
        params = {
            event = "tuners:client:opencrafting"
        }
    }
    
    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent('tuners:client:craftitem', function(item)
    if isCrafting then return end
    local ped = PlayerPedId()
    isCrafting = true
    QBCore.Functions.Progressbar("repair_vehicle", "Üretiliyor", (Config.WaitTimes['crafting']), false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {
		animDict = "mini@repair",
		anim = "fixing_a_player",
		flags = 16,
	}, {}, {}, function() -- Done
		StopAnimTask(ped, "mini@repair", "fixing_a_player", 1.0)
        local data = {
            ['action'] = 'receive',
            ['item'] = item
        }
        TriggerServerEvent("tuners:server:craftItem", data)
        TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items[data.item], 'add')
        isCrafting = false
	end, function() -- Cancel
		StopAnimTask(ped, "mini@repair", "fixing_a_player", 1.0)
        QBCore.Functions.Notify("Hata", "error")
        isCrafting = false
	end)
end)

RegisterNetEvent('tuners:client:openbilling', function()
    local player, distance = QBCore.Functions.GetClosestPlayer()
    if player ~= -1 and distance < 2.5 then
        local playerId = GetPlayerServerId(player)
        local dialog = exports['qb-input']:ShowInput({
            header = "Fatura Oluştur",
            submitText = "Fatura",
            inputs = {{
                text = "Oyuncu ID",
                name = "plyid",
                type = "number",
                isRequired = true
            }, {
                text = "Ücret",
                name = "amount",
                type = "number",
                isRequired = true
            }}
        })
        if tonumber(dialog['plyid']) > 0 and tonumber(dialog['amount']) > 0 then
            TriggerServerEvent("tuners:server:billplayer", dialog['plyid'], dialog['amount'])
        else
            QBCore.Functions.Notify('0dan yüksek bir rakam yazmalısın', 'error')
        end
    else
        QBCore.Functions.Notify('Yakınlarda kimse yok!', 'error')
    end
end)

RegisterNetEvent('tuners:client:useitem', function(type, item, tier)
    if Config.JobInstall and not isAuth then return end

    local closestVeh = QBCore.Functions.GetClosestVehicle()
    local ped = PlayerPedId()
    if not isUpgrading then
        if closestVeh ~= 0 then
            local pedCoords = GetEntityCoords(ped)
            local vehEngine = GetEntityBoneIndexByName(closestVeh, "engine")
            local enginePos = GetWorldPositionOfEntityBone(closestVeh, vehEngine)
            
            if #(pedCoords - enginePos) < 2 then
                if (not IsBackEngine(GetEntityModel(closestVeh)) and GetVehicleDoorAngleRatio(closestVeh, 4) ~= 0) or (IsBackEngine(GetEntityModel(closestVeh)) and GetVehicleDoorAngleRatio(closestVeh, 5) ~= 0) then
                    isUpgrading = true
                    if Config.UseQbLock then
                        local success = exports['qb-lock']:StartLockPickCircle(1, 50)
                        if not success then isUpgrading = false return end
                    end
                    PlaceObjectOnGroundProperly(spawnObj)
                    QBCore.Functions.Progressbar("repair_vehicle", "Yükleniyor "..type, (Config.WaitTimes['installing']), false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "mini@repair",
                        anim = "fixing_a_player",
                        flags = 16,
                    }, {}, {}, function() -- Done
                        TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items[item], 'remove')
                        StopAnimTask(ped, "mini@repair", "fixing_a_player", 1.0)
                        SetVehicleModKit(closestVeh, 0)
                        if type == 'engine' then
                            SetVehicleMod(closestVeh, 11, tier, false)
                        elseif type == 'transmission' then
                            SetVehicleMod(closestVeh, 13, tier, false)
                        elseif type == 'suspension' then
                            SetVehicleMod(closestVeh, 15, true)
                        elseif type == 'brakes' then
                            SetVehicleMod(closestVeh, 12, tier, false)
                        elseif type == 'xenon' then
                            ToggleVehicleMod(closestVeh, 22, true)
                        elseif type == 'neon' then
                            SetVehicleNeonLightEnabled(closestVeh, 0, true)
                            SetVehicleNeonLightEnabled(closestVeh, 1, true)
                            SetVehicleNeonLightEnabled(closestVeh, 2, true)
                            SetVehicleNeonLightEnabled(closestVeh, 3, true)
                        elseif type == 'turbo' then
                            ToggleVehicleMod(closestVeh, 18, 1)
                        end
                        local vehMods = QBCore.Functions.GetVehicleProperties(closestVeh)
                        TriggerServerEvent('tuners:server:finish', item, vehMods)
                        QBCore.Functions.Notify('Başarılı ile yüklendi '..type)

                        isUpgrading = false
                    end, function() -- Cancel
                        StopAnimTask(ped, "mini@repair", "fixing_a_player", 1.0)
                        QBCore.Functions.Notify("Failed", "error")
                        isUpgrading = false
                    end)
                end
            end
        end 
    end
end)
