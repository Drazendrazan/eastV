
local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('tuners:client:openNeonMenu', function()
    local playerPed	= PlayerPedId()
	if IsPedSittingInAnyVehicle(playerPed) then
        local vehicle = GetVehiclePedIsIn(playerPed)
        local plate = GetVehicleNumberPlateText(vehicle)
        if Config.isVehicleOwned then
            QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                if owned then
                    TriggerEvent("tuners:client:neonMenu")
                else
                    QBCore.Functions.Notify("Aracın sahibi değilsin", "error", 3500)
                end
            end, plate)
        else
            TriggerEvent("tuners:client:neonMenu")
        end
	else
		QBCore.Functions.Notify("Aracın içinde olmalısın", "error", 3500)
    end
end)

RegisterNetEvent('tuners:client:applyNeonPostion', function(args) 
    local args = tonumber(args)
    local playerPed	= PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed)
    TriggerEvent("tuners:client:neonToggleMenu")
	if args == 1 then 
        SetVehicleNeonLightEnabled(vehicle, 0, true)
        SetVehicleNeonLightEnabled(vehicle, 1, true)
        SetVehicleNeonLightEnabled(vehicle, 2, true)
        SetVehicleNeonLightEnabled(vehicle, 3, true)
    elseif args == 2 then 
        SetVehicleNeonLightEnabled(vehicle, 0, false)
        SetVehicleNeonLightEnabled(vehicle, 1, false)
        SetVehicleNeonLightEnabled(vehicle, 2, false)
        SetVehicleNeonLightEnabled(vehicle, 3, false)
    end
end)

RegisterNetEvent('tuners:client:applyNeonColor', function(args) 
    local args = tonumber(args)
    local playerPed	= PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed)
    TriggerEvent("tuners:client:neonColorMenu")
	if args == 1 then 
        SetVehicleNeonLightsColour(vehicle, 222, 222, 255)
    elseif args == 2 then 
        SetVehicleNeonLightsColour(vehicle, 2, 21, 255)
    elseif args == 3 then 
        SetVehicleNeonLightsColour(vehicle, 3, 83, 255)
    elseif args == 4 then 
        SetVehicleNeonLightsColour(vehicle, 0, 255, 140)
    elseif args == 5 then 
        SetVehicleNeonLightsColour(vehicle, 94,	255, 1)
    elseif args == 6 then 
        SetVehicleNeonLightsColour(vehicle, 255, 255, 0)
    elseif args == 7 then 
        SetVehicleNeonLightsColour(vehicle, 255, 150, 0)
    elseif args == 8 then 
        SetVehicleNeonLightsColour(vehicle, 255, 62, 0)
    elseif args == 9 then 
        SetVehicleNeonLightsColour(vehicle, 255, 1, 1)
    elseif args == 10 then 
        SetVehicleNeonLightsColour(vehicle, 255, 50, 100)
    elseif args == 11 then 
        SetVehicleNeonLightsColour(vehicle, 255, 5, 190)
    elseif args == 12 then 
        SetVehicleNeonLightsColour(vehicle, 35,	1, 255) 
    elseif args == 13 then 
        SetVehicleNeonLightsColour(vehicle, 15, 3, 255)     
    else
        exports['qb-menu']:closeMenu()
        CurrentVehicleData = QBCore.Functions.GetVehicleProperties(vehicle)
        TriggerServerEvent('updateVehicle', CurrentVehicleData)
    end
end)

RegisterNetEvent('tuners:client:neonMenu', function()
    exports['qb-menu']:openMenu({
		{
            header = "Neon Menüsü",
            txt = "Neon Menüsü",
            isMenuHeader = true
        },
        {
            header = "Neonu Aç",
            txt = "",
            params = {
                event = "tuners:client:neonToggleMenu",
            }
        },
        {
            header = "Renk Değiştir",
            txt = "",
            params = {
                event = "tuners:client:neonColorMenu",
            }
        },
        {
            header = "Kapat",
            txt = "",
            params = {
                event = "tuners:client:applyNeonColor",
                args = 14
            }
        },
    })
end)

RegisterNetEvent('tuners:client:neonToggleMenu', function()
    exports['qb-menu']:openMenu({
		{
            header = "Neon Menüsü",
            txt = "Neonu Aç/Kapat",
            isMenuHeader = true
        },
        {
            header = "Aktif Et",
            txt = "",
            params = {
                event = "tuners:client:applyNeonPostion",
                args = 1
            }
        },
        {
            header = "Pasif Et",
            txt = "",
            params = {
                event = "tuners:client:applyNeonPostion",
                args = 2
            }
        },
        {
            header = "< Geri",
            txt = "",
            params = {
                event = "tuners:client:neonMenu",
            }
        },
    })
end)

RegisterNetEvent('tuners:client:neonColorMenu', function()
    exports['qb-menu']:openMenu({
		{
            header = "Neon Menüsü",
            txt = "Renk Seçimi",
            isMenuHeader = true
        },
        {
            header = "White",
            txt = "",
            params = {
                event = "tuners:client:applyNeonColor",
                args = 1
            }
        },
        {
            header = "Blue",
            txt = "",
            params = {
                event = "tuners:client:applyNeonColor",
                args = 2
            }
        },
        {
            header = "Electric Blue",
            txt = "",
            params = {
                event = "tuners:client:applyNeonColor",
                args = 3
            }
        },
        {
            header = "Mint Green",
            txt = "",
            params = {
                event = "tuners:client:applyNeonColor",
                args = 4
            }
        },
        {
            header = "Lime Green",
            txt = "",
            params = {
                event = "tuners:client:applyNeonColor",
                args = 5
            }
        },
        {
            header = "Yellow",
            txt = "",
            params = {
                event = "tuners:client:applyNeonColor",
                args = 6
            }
        },
        {
            header = "Golden Shower",
            txt = "",
            params = {
                event = "tuners:client:applyNeonColor",
                args = 7
            }
        },
        {
            header = "Orange",
            txt = "",
            params = {
                event = "tuners:client:applyNeonColor",
                args = 8
            }
        },
        {
            header = "Red",
            txt = "",
            params = {
                event = "tuners:client:applyNeonColor",
                args = 9
            }
        },
        {
            header = "Pony Pink",
            txt = "",
            params = {
                event = "tuners:client:applyNeonColor",
                args = 10
            }
        },
        {
            header = "Hot Pink",
            txt = "",
            params = {
                event = "tuners:client:applyNeonColor",
                args = 11
            }
        },
        {
            header = "Purple",
            txt = "",
            params = {
                event = "tuners:client:applyNeonColor",
                args = 12
            }
        },
        {
            header = "Blacklight",
            txt = "",
            params = {
                event = "tuners:client:applyNeonColor",
                args = 13
            }
        },
        {
            header = "< Geri",
            txt = "",
            params = {
                event = "tuners:client:neonMenu",
            }
        },
    })
end)
