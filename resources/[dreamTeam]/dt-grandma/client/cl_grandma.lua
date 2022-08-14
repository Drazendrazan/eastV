local QBCore = exports['qb-core']:GetCoreObject()

grandma = {}

function loadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(5)
    end
end

function GrandmaSit()
    loadAnimDict("timetable@reunited@ig_10")        
    TaskPlayAnim(grandma, "timetable@reunited@ig_10", "base_amanda", 8.0, 1.0, -1, 01, 0, 0, 0, 0)
end


function SpawnGrandma()

    RequestModel(GetHashKey('ig_mrs_thornhill'))
    while not HasModelLoaded(GetHashKey('ig_mrs_thornhill')) do
        Wait(0)
    end
    
    grandma = CreatePed(0, GetHashKey('ig_mrs_thornhill') , Config.Coords.x,  Config.Coords.y,  Config.Coords.z,  Config.Coords.w, false, false)

    SetEntityAsMissionEntity(grandma)
    SetPedFleeAttributes(grandma, 0, 0)
    SetBlockingOfNonTemporaryEvents(grandma, true)
    SetEntityInvincible(grandma, true)
    FreezeEntityPosition(grandma, true)
    GrandmaSit()  

    exports['qb-target']:AddTargetEntity(grandma, {
        options = {
            { 
                type = "client",
                event = "dt-grandma:client:checks",
                icon = "fa-solid fa-house-medical",
                label = "Tedavi Ol",
            },
        },
        distance = 2.5 
    })
end

function DeleteGrandma()
    if DoesEntityExist(grandma) then
        DeletePed(grandma)
    end
end

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        SpawnGrandma()
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    SpawnGrandma()
end)


RegisterNetEvent('dt-grandma:client:checks', function()
    local ped = PlayerPedId()
    local player = PlayerId()

    if Config.CheckDead then
        QBCore.Functions.GetPlayerData(function(PlayerData)
            if PlayerData.metadata["inlaststand"] or PlayerData.metadata["isdead"] then
                TriggerServerEvent('dt-grandma:server:checkfunds')
            else
                QBCore.Functions.Notify("Tedaviye ihtiyacın yok gibi..", "error")
            end
        end)
    else -- Not checking if player is downed or dead
        TriggerServerEvent('dt-grandma:server:checkfunds')
    end
end)


RegisterNetEvent('dt-grandma:reviveplayer', function(source)
    SetEntityCoords(PlayerPedId(), Config.Coords.x, Config.Coords.y, Config.Coords.z)
    TaskStartScenarioInPlace(grandma, "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 0, true)
    QBCore.Functions.Progressbar("grandma", "Büyükanne yaralarını iyileştiriyor..", 10000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
     }, {}, {}, {}, function()
        QBCore.Functions.TriggerCallback('random_grandma:attemptGrandmaPayment', function(hasPaid)
            if hasPaid then
                QBCore.Functions.Notify("Şimdi çok daha iyi hissediyorsun.", "success")
                TriggerEvent('hospital:client:Revive')
                ClearPedTasks(PlayerPedId())
                ClearPedTasksImmediately(grandma)
                GrandmaSit()
            else
                QBCore.Functions.Notify("You're cooked.", "error") -- Got rid of the money after initial check IE attempted to exploit
                ClearPedTasks(PlayerPedId())
                ClearPedTasksImmediately(grandma)
                GrandmaSit()
            end
        end)
     end, function() -- Cancel
        ClearPedTasks(PlayerPedId())
        ClearPedTasksImmediately(grandma)
        GrandmaSit()
    end)
end)

--------------------
-- RESOURCE STOP --
--------------------

AddEventHandler('onResourceStop', function(resourceName) 
	if GetCurrentResourceName() == resourceName then
        DeleteGrandma()
	end 
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload')
AddEventHandler('QBCore:Client:OnPlayerUnload', function()
    DeleteGrandma()
end)
