local QBCore = exports['qb-core']:GetCoreObject()
local clipboardEntity

Citizen.CreateThread(function()
	while QBCore == nil do
		TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
		Citizen.Wait(0)
	end
end)

local forceDraw = false
local shouldDraw = false
local shouldOpenMenu = false

RegisterNetEvent('qb-showid:id')
AddEventHandler('qb-showid:id', function()
    forceDraw = not forceDraw
end)

--Test Inputs
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if Config.Key.Enabled then
            shouldDraw = IsControlPressed(0, Config.Key.Code)
        end
    end
end)

--Draw Things
Citizen.CreateThread(function()
    local animationState = false
    while true do
        Citizen.Wait(0)
        if animationState ~= shouldDraw then
            animationState = shouldDraw
            if animationState then
                local playerPed = PlayerPedId()
                ClearPedTasks(playerPed)
                if clipboardEntity ~= nil then
                    DeleteEntity(clipboardEntity)
                    clipboardEntity = nil
                end
            end
        end

        if shouldDraw or forceDraw then
            local nearbyPlayers = GetNeareastPlayers()
            for k, v in pairs(nearbyPlayers) do
                local x, y, z = table.unpack(v.coords)
                Draw3DText(x, y, z + 1.1, v.playerId)
            end
        end
    end
end)

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

function Draw3DText(x, y, z, text)
    -- Check if coords are visible and get 2D screen coords
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    if onScreen then
        -- Calculate text scale to use
        local dist = GetDistanceBetweenCoords(GetGameplayCamCoords(), x, y, z, 1)
        local scale = 1 * (1 / dist) * (1 / GetGameplayCamFov()) * 100

        -- Draw text on screen
        SetTextScale(scale, scale)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropShadow(0, 0, 0, 0, 255)
        SetTextDropShadow()
        SetTextEdge(4, 0, 0, 0, 255)
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end

function GetNeareastPlayers()
    local playerPed = PlayerPedId()
    local players, _ = QBCore.Functions.GetPlayers(GetEntityCoords(playerPed), Config.DrawDistance)

    local players_clean = {}
    local found_players = false

    for i = 1, #players, 1 do
        found_players = true
        table.insert(players_clean, { playerName = GetPlayerName(players[i]), playerId = GetPlayerServerId(players[i]), coords = GetEntityCoords(GetPlayerPed(players[i])) })
    end
    return players_clean
end
