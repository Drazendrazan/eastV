CreateThread(function()
    exports['qb-target']:AddBoxZone("ArtGalleryEggTake", vector3(11.309403, 139.19904, 94.29533), 0.5, 0.5, {
        name = "ArtGalleryEggTake",
        heading = 67.58,
        debugPoly = false,
        minZ = 93.15,
        maxZ = 94.65,
        }, {
            options = { 
            {
                type = "client",
                event = "qb-artgalleryheist:client:GrabEgg",
                icon = 'fas fa-egg',
                label = 'Grab Egg',
                canInteract = function()
                    if Config.Egg.taken or Config.Egg.busy or not Config.OutsideHacks[1].hit then
                        return false
                    end
                    return true
                end,
            }
        },
        distance = 1.5,
    })

    exports['qb-target']:AddBoxZone("ArtGalleryEggSell", vector3(-1414.56, 6750.54, 11.91), 0.5, 0.5, {
        name = "ArtGalleryEggSell",
        heading = 251.78,
        debugPoly = false,
        minZ = 10.91,
        maxZ = 12.65,
        }, {
            options = { 
            {
                type = "client",
                event = "qb-artgalleryheist:client:SellEgg",
                icon = 'fas fa-handshake',
                label = 'Offer Item',
            }
        },
        distance = 1.5,
    })
end)

RegisterNetEvent('qb-artgalleryheist:client:SellEgg', function()
    QBCore.Functions.Progressbar("smash_vitrine", "Negotiating..", 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent('qb-artgalleryheist:server:egg:sellEgg')
    end, function() -- Cancel
        QBCore.Functions.Notify("Cancelled","error")
    end)
end)

RegisterNetEvent('qb-artgalleryheist:client:GrabEgg', function()
    if validWeapon() then
        local animDict = "missheist_jewel"
        local animName = "smash_case"
        local ped = PlayerPedId()
        local plyCoords = GetOffsetFromEntityInWorldCoords(ped, 0, 0.6, 0)
        local pedWeapon = GetSelectedPedWeapon(ped)

        while (not HasAnimDictLoaded(animDict)) do
            RequestAnimDict(animDict)
            Wait(3)
        end

        TaskPlayAnim(ped, animDict, animName, 3.0, 3.0, -1, 2, 0, 0, 0, 0 )
        TriggerServerEvent("InteractSound_SV:PlayOnSource", "breaking_vitrine_glass", 0.25)

        -- SET BUSY
        TriggerServerEvent('qb-artgalleryheist:server:egg:SetBusy', true)
        
        QBCore.Functions.Progressbar("smash_vitrine", "Smashing case..", math.random(2800,3200), false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            -- EVIDENCE
            if not IsWearingHandshoes() then
                TriggerServerEvent("evidence:server:CreateFingerDrop", plyCoords)
            end
            -- GIVE LOOT AND SET HIT
            TriggerServerEvent('qb-artgalleryheist:server:egg:SetTaken', true)
            TriggerServerEvent('qb-artgalleryheist:server:egg:Reward')
            TaskPlayAnim(ped, animDict, "exit", 3.0, 3.0, -1, 2, 0, 0, 0, 0)
        end, function() -- Cancel
            -- SET NOT BUSY
            TriggerServerEvent('qb-artgalleryheist:server:egg:SetBusy', false)
            TaskPlayAnim(ped, animDict, "exit", 3.0, 3.0, -1, 2, 0, 0, 0, 0)
        end)
    else
        QBCore.Functions.Notify('Your weapon doesnt seem strong enough..', 'error')
    end
end)

RegisterNetEvent('qb-artgalleryheist:client:egg:SetBusy', function(bool)
    Config.Egg.busy = bool
end)

RegisterNetEvent('qb-artgalleryheist:client:egg:SetTaken', function()
    Config.Egg.taken = true
end)