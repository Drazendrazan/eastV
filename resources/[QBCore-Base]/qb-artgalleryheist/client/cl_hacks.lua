local copsCalled = false

CreateThread(function()
    exports['qb-target']:AddBoxZone("ArtGalleryBlackLaptop1", vector3(20.36, 153.07, 94.12), 0.3, 0.3, {
        name = "ArtGalleryBlackLaptop1",
        heading = 67.58,
        debugPoly = false,
        minZ = 94.15,
        maxZ = 94.35,
        }, {
            options = { 
            {
                type = "client",
                event = "qb-artgalleryheist:client:BlackLaptop",
                icon = 'fas fa-user-secret',
                label = 'Hack Security Panel'
            }
        },
        distance = 1.5,
    })
    exports['qb-target']:AddBoxZone("ArtGalleryBlackLaptop2", vector3(17.29933, 152.54852, 93.79042), 0.6, 0.6, {
        name = "ArtGalleryBlackLaptop2",
        heading = 154.62,
        debugPoly = false,
        minZ = 92.15,
        maxZ = 93.85,
        }, {
            options = { 
            {
                type = "client",
                event = "qb-artgalleryheist:client:BlackLaptop",
                icon = 'fas fa-user-secret',
                label = 'Hack Server'
            }
        },
        distance = 1.5,
    })
    exports['qb-target']:AddBoxZone("ArtGalleryCode", vector3(15.64549, 140.19191, 93.992701), 0.3, 0.5, {
        name = "ArtGalleryCode",
        heading = 72.62,
        debugPoly = false,
        minZ = 93.95,
        maxZ = 94.65,
        }, {
            options = { 
            {
                type = "client",
                event = "qb-artgalleryheist:client:CodeAttempt",
                icon = 'fas fa-user-secret',
                label = 'Enter Code'
            }
        },
        distance = 1.5,
    })
end)

function Hack(index)
    LocalPlayer.state:set("inv_busy", true, true) -- Busy
    TriggerServerEvent('qb-artgalleryheist:server:InsideHacksBusy', index, true)

    -- EVIDENCE
    if not IsWearingHandshoes() then
        TriggerServerEvent("evidence:server:CreateFingerDrop", GetEntityCoords(PlayerPedId()))
    end

    -- LAPTOP USE
    TriggerServerEvent('qb-artgalleryheist:server:laptopdamage')    
    local animDict = "anim@heists@ornate_bank@hack"
    RequestAnimDict(animDict)
    RequestModel("hei_prop_hst_laptop")
    RequestModel("hei_p_m_bag_var22_arm_s")
    
    while not HasAnimDictLoaded(animDict)
        or not HasModelLoaded("hei_prop_hst_laptop")
        or not HasModelLoaded("hei_p_m_bag_var22_arm_s") do
        Wait(100)
    end

    local loc = Config.InsideHacks[index].laptopcoords
    local ped = PlayerPedId()
    local targetPosition, targetRotation = (vec3(GetEntityCoords(ped))), vec3(GetEntityRotation(ped))

    SetEntityHeading(ped, loc.w)
    local animPos = GetAnimInitialOffsetPosition(animDict, "hack_enter", loc.x, loc.y, loc.z, loc.x, loc.y, loc.z, 0, 2)
    local animPos2 = GetAnimInitialOffsetPosition(animDict, "hack_loop", loc.x, loc.y, loc.z, loc.x, loc.y, loc.z, 0, 2)
    local animPos3 = GetAnimInitialOffsetPosition(animDict, "hack_exit", loc.x, loc.y, loc.z, loc.x, loc.y, loc.z, 0, 2)

    FreezeEntityPosition(ped, true)
    local netScene = NetworkCreateSynchronisedScene(animPos, targetRotation, 2, false, false, 1065353216, 0, 1.3)
    local bag = CreateObject(`hei_p_m_bag_var22_arm_s`, targetPosition, 1, 1, 0)
    local laptop = CreateObject(`hei_prop_hst_laptop`, targetPosition, 1, 1, 0)

    NetworkAddPedToSynchronisedScene(ped, netScene, animDict, "hack_enter", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, netScene, animDict, "hack_enter_bag", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(laptop, netScene, animDict, "hack_enter_laptop", 4.0, -8.0, 1)

    local netScene2 = NetworkCreateSynchronisedScene(animPos2, targetRotation, 2, false, true, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(ped, netScene2, animDict, "hack_loop", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, netScene2, animDict, "hack_loop_bag", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(laptop, netScene2, animDict, "hack_loop_laptop", 4.0, -8.0, 1)

    local netScene3 = NetworkCreateSynchronisedScene(animPos3, targetRotation, 2, false, false, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(ped, netScene3, animDict, "hack_exit", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, netScene3, animDict, "hack_exit_bag", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(laptop, netScene3, animDict, "hack_exit_laptop", 4.0, -8.0, 1)

    Wait(200)
    NetworkStartSynchronisedScene(netScene)
    Wait(6300)
    NetworkStartSynchronisedScene(netScene2)
    Wait(2000)

    --hack between laptop placed and hack exit
    exports['hacking']:OpenHackingGame(15, 6, 4, function(Success)
        if Success then
            TriggerServerEvent('qb-doorlock:server:updateState', Config.InsideHacks[index].doorId, false)
            TriggerServerEvent('qb-artgalleryheist:server:InsideHacksHit', index)
        end
        NetworkStartSynchronisedScene(netScene3)
        Wait(4600)
        NetworkStopSynchronisedScene(netScene3)
        DeleteObject(bag)
        DeleteObject(laptop)
        FreezeEntityPosition(ped, false)
    end)
    TriggerServerEvent('qb-artgalleryheist:server:InsideHacksBusy', index, false)
    LocalPlayer.state:set("inv_busy", false, true) -- Not Busy
end

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

function CodeCorrect()
    local object = GetClosestObjectOfType(Config.Code.coords.x , Config.Code.coords.y, Config.Code.coords.z, 20.0, -660779536, false, false, false)
    local timeOut = 10
    local entHeading = 70.0
    Wait(2500)
    TriggerServerEvent('qb-artgalleryheist:server:Code')
    if object ~= 0 then
        CreateThread(function()
            while true do
                if entHeading < 210.0 then
                    SetEntityHeading(object, entHeading + 5)
                    entHeading = entHeading + 0.5
                else
                    break
                end
                Wait(10)
            end
        end)
    end
end

function CodeFailed()
    TriggerServerEvent('qb-artgalleryheist:server:lasers:HitByLaser')
    lockdown = true
    CreateThread(function()
        while lockdown do
            -- STOP SOUNDS WHEN AWAY FROM ART GALLERY
            if #(GetEntityCoords(PlayerPedId()) - vector3(23.651853, 141.90103, 93.792182)) > 40 then
                return
            end
        
            -- CYCLE LARM EVERY 6 SECONDS
            if not alarm then
                alarm = true
                TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 20, "robberyalarm", 0.3)
            else
                break
            end
            Wait(6000)
            alarm = false
        end
    end)
end

RegisterNetEvent('qb-artgalleryheist:client:BlackLaptop', function()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
        if result then 
            TriggerEvent('qb-artgalleryheist:client:UseLaptop')
        else
            QBCore.Functions.Notify("You are missing something(s)..", "error", 2500)
        end
    end, "laptop_black")
end)

RegisterNetEvent('qb-artgalleryheist:client:CodeAttempt', function()
    if Config.OutsideHacks[1].hit and not Config.Code.isOpened and not lockdown then
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        -- EVIDENCE
        if not IsWearingHandshoes() then
            TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
        end
        -- ENTERING CODE
        local dict = "mp_heists@keypad@"
        local anim = "idle_a"
        local flag = 0
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do
            RequestAnimDict(dict)
            Wait(50)
        end
        SetEntityCoords(ped, vector3(15.982716, 140.01586, 92.792716))
        SetEntityHeading(ped, 63.16)
        TaskPlayAnim(ped, dict, anim, 8.0, 8.0, -1, flag, 0, false, false, false)
        SendNUIMessage({
            action = "open"
        })
        SetNuiFocus(true, true)
    end
end)

RegisterNUICallback('PinpadClose', function()
    SetNuiFocus(false, false)
    TaskPlayAnim(PlayerPedId(), dict, "exit", 2.0, 2.0, -1, flag, 0, false, false, false)
    Wait(1000)
end)

RegisterNUICallback('ErrorMessage', function(data)
    QBCore.Functions.Notify(data.message, 'error')
end)

RegisterNUICallback('EnterPincode', function(d)
    QBCore.Functions.TriggerCallback('qb-artgalleryheist:server:isCombinationRight',function(result)
        while result == nil do Wait(10) end
        if tonumber(d.pin) == result then
            CodeCorrect()
        else
            QBCore.Functions.Notify('This Code Is Incorrect', 'error')
            CodeFailed()
        end
        TaskPlayAnim(PlayerPedId(), dict, "exit", 2.0, 2.0, -1, flag, 0, false, false, false)
        Wait(1000)
    end)
end)

RegisterNetEvent('qb-artgalleryheist:client:Code', function()
    Config.Code.isOpened = true
end)

RegisterNetEvent('qb-artgalleryheist:client:UseLaptop', function()
    local pos = GetEntityCoords(PlayerPedId())
    if not lockdown then
        for k, v in pairs(Config.InsideHacks) do
            if #(pos - v.coords) < 2 then
                if not v.hit then
                    if not v.busy then
                        if not copsCalled then
                            local s1, s2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z)
                            local street1 = GetStreetNameFromHashKey(s1)
                            local street2 = GetStreetNameFromHashKey(s2)
                            local streetLabel = street1
                            if street2 ~= nil then 
                                streetLabel = streetLabel .. " " .. street2
                            end
                            -- CALL COPS
                            TriggerServerEvent("qb-artgalleryheist:server:callCops", streetLabel, pos)
                            copsCalled = true
                        end
                        Hack(k)
                    else
                        QBCore.Functions.Notify("Someone is already busy..", "error")
                    end
                else
                    QBCore.Functions.Notify("This has already been hacked..", "error")
                end
            end
        end
    else
        QBCore.Functions.Notify("You triggered the alarm, lockdown is active...", "error", 5000)
    end
end)

RegisterNetEvent('qb-artgalleryheist:client:robberyCall', function(streetLabel, coords)
    if PlayerJob.name == "police" then 
        local cameraId = 150
        PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
        TriggerEvent('chatMessage', "ALARM", "warning", "Silent Alarm")
        TriggerEvent('qb-policealerts:client:AddPoliceAlert', {
            timeOut = 10000,
            alertTitle = "Silent Alarm",
            coords = {
                x = coords.x,
                y = coords.y,
                z = coords.z,
            },
            details = {
                [1] = {
                    icon = '<i class="fas fa-university"></i>',
                    detail = "Vinewood Art Gallery",
                },
                [2] = {
                    icon = '<i class="fas fa-video"></i>',
                    detail = cameraId,
                },
                [3] = {
                    icon = '<i class="fas fa-globe-europe"></i>',
                    detail = streetLabel,
                },
            },
            callSign = QBCore.Functions.GetPlayerData().metadata["callsign"],
        })

        local transG = 250
        local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
        SetBlipSprite(blip, 161)
        SetBlipColour(blip, 4)
        SetBlipDisplay(blip, 4)
        SetBlipAlpha(blip, transG)
        SetBlipScale(blip, 1.9)
        SetBlipFlashes(blip, true)
        SetBlipAsShortRange(blip, false)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString("911: Silent Alarm")
        EndTextCommandSetBlipName(blip)
        while transG ~= 0 do
            Wait(180 * 4)
            transG = transG - 1
            SetBlipAlpha(blip, transG)
            if transG == 0 then
                SetBlipSprite(blip, 2)
                RemoveBlip(blip)
                return
            end
        end
    end
end)

RegisterNetEvent('qb-artgalleryheist:client:InsideHacksHit', function(index)
    Config.InsideHacks[index].hit = true
    if index == 2 then
        local codeCoords = vector3(17.29933, 152.54852, 93.79042)
        CreateThread(function()
            local taken = false
            while not taken do
                Wait(3)
                local inRange = false
                local dist = #(GetEntityCoords(PlayerPedId()) - codeCoords)
                if dist < 5 then
                    inRange = true
                    DrawMarker(2, codeCoords.x, codeCoords.y, codeCoords.z+0.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 242, 148, 41, 255, false, false, false, 1, false, false, false)
                    if dist < 1 then
                        DrawText3Ds(codeCoords.x, codeCoords.y, codeCoords.z, '~g~[E]~s~ - Copy Access Codes')
                        if IsControlJustReleased(0, 38) then
                            QBCore.Functions.Progressbar("smash_vitrine", "Copying codes..", 5000, false, true, {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            }, {}, {}, {}, function() -- Done
                                TriggerServerEvent('qb-artgalleryheist:server:CopyCodes')
                                taken = true
                            end, function() -- Cancel
                                QBCore.Functions.Notify('Canceled..', 'error')
                            end)
                        end
                    end
                end
                if not inRange then
                    Wait(2000)
                end
            end
        end)
    end
end)

RegisterNetEvent('qb-artgalleryheist:client:InsideHacksBusy', function(index, bool)
    Config.InsideHacks[index].busy = bool
end)