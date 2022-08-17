QBCore = nil
local QBCore = exports['qb-core']:GetCoreObject()
cachedData = {}
local JobBusy = false

function CreateBlips()
    for i, zone in ipairs(Config.FishingRestaurant) do
        local coords = zone.secret and ((zone.coords / 1.5) - 133.37) or zone.coords
        local name = zone.name
        if not zone.secret then
            local x = AddBlipForCoord(coords)
            SetBlipSprite(x, 405)
            SetBlipDisplay(x, 4)
            SetBlipScale(x, 0.35)
            SetBlipAsShortRange(x, true)
            SetBlipColour(x, 69)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName(name)
            EndTextCommandSetBlipName(x)
        end
    end
end

function DeleteBlips()
    if DoesBlipExist(coords) then
        RemoveBlip(coords)
    end
end

RegisterNetEvent("qb-fishing:tryToFish")
AddEventHandler("qb-fishing:tryToFish", function()
    TryToFish()
end)

RegisterNetEvent("qb-fishing:calculatedistances")
AddEventHandler("qb-fishing:calculatedistances", pos, function()

end)

Citizen.CreateThread(function()
    Citizen.Wait(500)
    HandleStore()
    while true do
        local sleepThread = 500
        local ped = cachedData["ped"]
        Citizen.Wait(sleepThread)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1500)

        local ped = PlayerPedId()

        if cachedData["ped"] ~= ped then
            cachedData["ped"] = ped
        end
    end
end)
