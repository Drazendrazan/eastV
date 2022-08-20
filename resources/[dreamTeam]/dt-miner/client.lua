local QBCore = exports['qb-core']:GetCoreObject()
local blips = {}
local kazmaProp = `prop_tool_pickaxe`

local miner = CircleZone:Create(vector3(-593.13, 2074.56, 131.34), 15.0, {
    name="miner",
    useZ=false,
    --debugPoly=false
})

CreateThread(function()
    blip = AddBlipForCoord(-593.13, 2074.56, 131.34)
    SetBlipSprite (blip, 78)
    SetBlipDisplay(blip, 4)
    SetBlipScale  (blip, 0.5)
    SetBlipColour (blip, 77)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Taş Madeni')
    EndTextCommandSetBlipName(blip)
end)


RegisterNetEvent('kaz:maden')
AddEventHandler('kaz:maden', function()
local playerCoords = GetEntityCoords(PlayerPedId())
local coords = GetEntityCoords(PlayerPedId())
erkanagotten = miner:isPointInside(coords)
    if erkanagotten then 
        QBCore.Functions.Progressbar('kaz', 'Kazıyorsun', 3000, false, true, { -- Name | Label | Time | useWhileDead | canCancel
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = 'melee@large_wpn@streamed_core',
            anim = 'ground_attack_on_spot',
            flags = 16,
        }, {}, {}, function()
            TriggerServerEvent('item:ver')
        end, function()
        end)
    else
        QBCore.Functions.Notify('Madende değilsin', 'error', 7500)
    end
end)
