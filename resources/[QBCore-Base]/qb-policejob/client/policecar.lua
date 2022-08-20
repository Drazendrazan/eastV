local QBCore = exports['qb-core']:GetCoreObject()
local SpawnVehicle = false

RegisterNetEvent('qb-policecar:openMenu', function()
    exports['qb-menu']:openMenu({
        {
            header = "LSPD - Polis Araç Teslim",
            isMenuHeader = true,
        },
        {
            id = 1,
            header = "Araç Teslim Et ",
            txt = "Aracını teslim et.",
            params = {
                event = "qb-policecar:return",
            }
        },
        {
            id = 2,
            header = "Police Charger",
            txt = "$250.00",
            params = {
                event = "qb-policecar:spawncar",
                args = {
                    model = 'polchar',
                    money = 0,
                }
            }
        },
        {
            id = 3,
            header = "Bison ",
            txt = "$500.00",
            params = {
                event = "qb-policecar:spawncar",
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
                event = "qb-policecar:spawncar",
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
       
        RequestModel(GetHashKey('s_f_y_cop_01'))
        while not HasModelLoaded(GetHashKey('s_f_y_cop_01')) do
            Wait(1)
        end
        CreateNPC()   
    end)
end


CreateNPC = function()
    created_ped = CreatePed(5, GetHashKey('s_f_y_cop_01') , 462.4978, -990.4361, 24.6998, 77.6730, false, true)
    FreezeEntityPosition(created_ped, true)
    SetEntityInvincible(created_ped, true)
    SetBlockingOfNonTemporaryEvents(created_ped, true)
    TaskStartScenarioInPlace(created_ped, 'WORLD_HUMAN_CLIPBOARD', 0, true)
end

local function SetCarItemsInfo()
	local items = {}
	for _, item in pairs(Config.CarItems) do
		local itemInfo = QBCore.Shared.Items[item.name:lower()]
		items[item.slot] = {
			name = itemInfo["name"],
			amount = tonumber(item.amount),
			info = item.info,
			label = itemInfo["label"],
			description = itemInfo["description"] and itemInfo["description"] or "",
			weight = itemInfo["weight"],
			type = itemInfo["type"],
			unique = itemInfo["unique"],
			useable = itemInfo["useable"],
			image = itemInfo["image"],
			slot = item.slot,
		}
	end
	Config.CarItems = items
end


RegisterNetEvent('qb-policecar:spawncar')
AddEventHandler('qb-policecar:spawncar', function(data)
    local money =data.money
    local model = data.model
    local player = PlayerPedId()
    QBCore.Functions.SpawnVehicle(model, function(vehicle)
        SetEntityHeading(vehicle, 340.0)
        SetCarItemsInfo()
        SetVehicleNumberPlateText(vehicle, Lang:t('info.police_plate')..tostring(math.random(1000, 9999)))
        TaskWarpPedIntoVehicle(player, vehicle, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(vehicle))
        TriggerServerEvent("inventory:server:addTrunkItems", QBCore.Functions.GetPlate(vehicle), Config.CarItems)
        SetVehicleEngineOn(vehicle, true, true)
        SetVehicleLivery(vehicle, 2)
        exports['LegacyFuel']:SetFuel(vehicle, 100.0)
        SpawnVehicle = true
    end, vector4(445.0459, -989.1485, 25.6998, 268.8760), true)
    Wait(1000)
    local vehicle = GetVehiclePedIsIn(player, false)
    local vehicleLabel = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
    vehicleLabel = GetLabelText(vehicleLabel)
end)

RegisterNetEvent('qb-policecar:return')
AddEventHandler('qb-policecar:return', function()
    if SpawnVehicle then
        local Player = QBCore.Functions.GetPlayerData()
        QBCore.Functions.Notify('Araç Teslim Edildi!', 'success')
        local car = GetVehiclePedIsIn(PlayerPedId(),true)
        NetworkFadeOutEntity(car, true,false)
        Citizen.Wait(2000)
        QBCore.Functions.DeleteVehicle(car)
    else 
        QBCore.Functions.Notify("Teslim edilecek araç yok", "error")
    end
    SpawnVehicle = false
end)
