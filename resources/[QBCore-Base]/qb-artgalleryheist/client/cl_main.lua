PlayerJob = {}

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)

RegisterNetEvent("QBCore:Client:OnPlayerLoaded", function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
    QBCore.Functions.TriggerCallback('qb-artgalleryheist:server:GetConfig', function(config)
        Config = config
    end)
end)

CreateThread(function()
    exports['qb-target']:AddBoxZone("ArtGalleryOutside3", vector3(14.81, 145.17, 94.72), 0.3, 0.6, {
        name = "ArtGalleryOutside3",
        heading = 41.22,
        debugPoly = false,
        minZ = 93.5,
        maxZ = 93.8,
        }, {
            options = { 
            {
                type = "client",
                event = "qb-artgalleryheist:OutsideHack",
                icon = 'fas fa-user-secret',
                label = 'Hack Security'
            }
        },
        distance = 2.5,
    })
end)

RegisterNetEvent('qb-artgalleryheist:OutsideHack', function()
    local pos = GetEntityCoords(PlayerPedId())
    if #(pos - Config.OutsideHacks[1].coords) < 1 then
        QBCore.Functions.TriggerCallback('qb-powerplant:server:getCops', function(cops)
            if cops >= Config.MinimumPolice then
                if not Config.OutsideHacks[1].hit then
                    if not Config.OutsideHacks[1].busy then
                        QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
                            if result then 
                                TriggerEvent('inventory:client:requiredItems', requiredItems, false)
                                QBCore.Functions.Progressbar("hack_gate", "Connecting electronics..", math.random(5000, 10000), false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "anim@gangops@facility@servers@",
                                    anim = "hotwire",
                                    flags = 16,
                                }, {}, {}, function() -- Done
                                    StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                                    TriggerEvent("mhacking:show")
                                    TriggerEvent("mhacking:start", math.random(4, 6), 45, OnHackDone)
                                end, function() -- Cancel
                                    StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                                    QBCore.Functions.Notify("Canceled..", "error")
                                end)
                            else
                                QBCore.Functions.Notify("You are missing an item..", "error")
                            end
                        end, "trojan_usb")
                    else
                        QBCore.Functions.Notify("Someone is already hacking this..", "error")
                    end
                else
                    QBCore.Functions.Notify("This has already been hacked..", "error")
                end
            else
                QBCore.Functions.Notify("Not enough cops..", "error")
            end
        end)
    end
end)

function OnHackDone(success)
    if success then
        TriggerEvent('mhacking:hide')
        TriggerServerEvent('qb-artgalleryheist:server:OutsideHacks', 1)
    else
        TriggerEvent('mhacking:hide')
	end
end

RegisterNetEvent('qb-artgalleryheist:client:OutsideHacks', function(index)
    Config.OutsideHacks[index].hit = true
end)

function IsWearingHandshoes()
    local armIndex = GetPedDrawableVariation(PlayerPedId(), 3)
    local model = GetEntityModel(PlayerPedId())
    local retval = true
    if model == `mp_m_freemode_01` then
        if Config.MaleNoHandshoes[armIndex] ~= nil and Config.MaleNoHandshoes[armIndex] then
            retval = false
        end
    else
        if Config.FemaleNoHandshoes[armIndex] ~= nil and Config.FemaleNoHandshoes[armIndex] then
            retval = false
        end
    end
    return retval
end

-- DOOR
CreateThread(function()
    while true do
        local pos = GetEntityCoords(PlayerPedId())
        local inRange = false
        local dist = #(pos - Config.Code.coords)
        if Config.OutsideHacks[1].hit then
            if dist < 15 then
                inRange = true
                if Config.Code.isOpened then
                    local object = GetClosestObjectOfType(Config.Code.coords.x , Config.Code.coords.y, Config.Code.coords.z, 20.0, -660779536, false, false, false)
                    if object ~= 0 then
                        SetEntityHeading(object, 210.0)
                        FreezeEntityPosition(object, true)
                    end
                else
                    local object = GetClosestObjectOfType(Config.Code.coords.x , Config.Code.coords.y, Config.Code.coords.z, 20.0, -660779536, false, false, false)
                    if object ~= 0 then
                        SetEntityHeading(object, 70.0)
                        FreezeEntityPosition(object, true)
                    end
                end
            end
        else
            Wait(5000)
        end
        if not inRange then
            Wait(5000)
        end
        Wait(2000)
    end
end)