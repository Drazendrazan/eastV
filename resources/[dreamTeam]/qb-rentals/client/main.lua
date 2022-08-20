local QBCore = exports['qb-core']:GetCoreObject()
local SpawnVehicle = false

RegisterNetEvent('qb-rental:openMenu', function()
    exports['qb-menu']:openMenu({
        {
            header = "Araç Kiralama",
            isMenuHeader = true,
        },
        {
            id = 1,
            header = "Araç Teslim Et ",
            txt = "Kiralık aracını teslim et.",
            params = {
                event = "qb-rental:return",
            }
        },
        {
            id = 2,
            header = "Asterope",
            txt = "$250.00",
            params = {
                event = "qb-rental:spawncar",
                args = {
                    model = 'asterope',
                    money = 250,
                }
            }
        },
        {
            id = 3,
            header = "Bison ",
            txt = "$500.00",
            params = {
                event = "qb-rental:spawncar",
                args = {
                    model = 'bison',
                    money = 500,
                }
            }
        },
        {
            id = 4,
            header = "Sanchez",
            txt = "$750.00",
            params = {
                event = "qb-rental:spawncar",
                args = {
                    model = 'sanchez',
                    money = 750,
                }
            }
        },
    })
end)

CreateThread(function()
    SpawnNPC()
end)


SpawnNPC = function()
    CreateThread(function()
       
        RequestModel(GetHashKey('a_m_y_business_03'))
        while not HasModelLoaded(GetHashKey('a_m_y_business_03')) do
            Wait(1)
        end
        CreateNPC()   
    end)
end


CreateNPC = function()
    created_ped = CreatePed(5, GetHashKey('a_m_y_business_03') , -282.8292, -988.8552, 30.0809, 340.1087, false, true)
    FreezeEntityPosition(created_ped, true)
    SetEntityInvincible(created_ped, true)
    SetBlockingOfNonTemporaryEvents(created_ped, true)
    TaskStartScenarioInPlace(created_ped, 'WORLD_HUMAN_CLIPBOARD', 0, true)
end

RegisterNetEvent('qb-rental:spawncar')
AddEventHandler('qb-rental:spawncar', function(data)
    local money =data.money
    local model = data.model
    local player = PlayerPedId()
    QBCore.Functions.SpawnVehicle(model, function(vehicle)
        SetEntityHeading(vehicle, 340.0)
        TaskWarpPedIntoVehicle(player, vehicle, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(vehicle))
        SetVehicleEngineOn(vehicle, true, true)
        SpawnVehicle = true
    end, vector4(-278.7841, -986.2489, 31.0809, 247.3132), true)
    Wait(1000)
    local vehicle = GetVehiclePedIsIn(player, false)
    local vehicleLabel = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
    vehicleLabel = GetLabelText(vehicleLabel)
    local plate = GetVehicleNumberPlateText(vehicle)
    TriggerServerEvent('qb-rental:rentalpapers', plate, vehicleLabel, money)
end)

RegisterNetEvent('qb-rental:return')
AddEventHandler('qb-rental:return', function()
    if SpawnVehicle then
        local Player = QBCore.Functions.GetPlayerData()
        QBCore.Functions.Notify('Araç Teslim Edildi!', 'success')
        TriggerServerEvent('qb-rental:removepapers')
        local car = GetVehiclePedIsIn(PlayerPedId(),true)
        NetworkFadeOutEntity(car, true,false)
        Citizen.Wait(2000)
        QBCore.Functions.DeleteVehicle(car)
    else 
        QBCore.Functions.Notify("Teslim edilecek araç yok", "error")
    end
    SpawnVehicle = false
end)

CreateThread(function()
    blip = AddBlipForCoord(-282.8292, -988.8552, 31.0809)
    SetBlipSprite (blip, 56)
    SetBlipDisplay(blip, 4)
    SetBlipScale  (blip, 0.5)
    SetBlipColour (blip, 77)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Araç Kiralama')
    EndTextCommandSetBlipName(blip)
end)
