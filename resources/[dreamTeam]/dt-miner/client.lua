local QBCore = exports['qb-core']:GetCoreObject()

local kazmaProp = `prop_tool_pickaxe`

local miner = CircleZone:Create(vector3(-593.13, 2074.56, 131.34), 15.0, {
    name="miner",
    useZ=false,
    --debugPoly=true
})

RegisterNetEvent('kaz:maden')
AddEventHandler('kaz:maden', function()
local playerCoords = GetEntityCoords(PlayerPedId())
local coords = GetEntityCoords(PlayerPedId())
viberagotten = miner:isPointInside(coords)
    if viberagotten then 
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
