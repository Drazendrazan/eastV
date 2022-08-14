QBCore = exports['qb-core']:GetCoreObject()

local WhitelistedWeapons = {
    [`weapon_assaultrifle`] = true,
    [`weapon_assaultsmg`] = true,
    [`weapon_specialcarbine`] = true,
    [`weapon_gusenberg`] = true,
    [`weapon_advancedrifle`] = true,
    [`weapon_bullpuprifle`] = true,
    [`weapon_carbinerifle`] = true,
    [`weapon_crowbar`] = true,
    [`weapon_compactrifle`] = true,
    [`weapon_microsmg`] = true,
    [`weapon_minismg`] = true,
    [`weapon_machinepistol`] = true,
}

CreateThread(function()
    for k, v in pairs(Config.Cases) do
        exports['qb-target']:AddBoxZone("ArtGalleryCase"..k, vector3(v.coords.x, v.coords.y, v.coords.z), 0.6, 1.2, {
            name = "ArtGalleryCase"..k,
            heading = v.coords.w,
            debugPoly = false,
            minZ = 93.35,
            maxZ = 94.05,
            }, {
                options = { 
                {
                    type = "client",
                    event = "qb-artgalleryheist:client:LootCase",
                    icon = 'fas fa-gem',
                    label = 'Smash Case',
                    canInteract = function()
                        if Config.Cases[k].hit or Config.Cases[k].busy then
                            return false
                        end
                        return true
                    end,
                }
            },
            distance = 1.0,
        })
    end
end)

RegisterNetEvent('qb-artgalleryheist:client:LootCase', function()
    local pos = GetEntityCoords(PlayerPedId())
    for k, v in pairs(Config.Cases) do
        local dist = #(pos - vector3(v.coords.x, v.coords.y, v.coords.z))
        if dist < 1 then
            if not v.hit then
                if not v.busy then
                    if validWeapon() then
                        SmashCase(k)
                    else
                        QBCore.Functions.Notify('Your weapon doesnt seem strong enough..', 'error')
                    end
                else
                    QBCore.Functions.Notify('Somebody is already looting this..', 'error')
                end
            end
        end
    end
end)

function validWeapon()
    local ped = PlayerPedId()
    local pedWeapon = GetSelectedPedWeapon(ped)
    if WhitelistedWeapons[pedWeapon] then
        return true
    else
        return false
    end
end

function SmashCase(index)
    local animDict = "missheist_jewel"
    local animName = "smash_case"
    local ped = PlayerPedId()
    local plyCoords = GetOffsetFromEntityInWorldCoords(ped, 0, 0.6, 0)

    while (not HasAnimDictLoaded(animDict)) do
        RequestAnimDict(animDict)
        Wait(3)
    end

    TaskPlayAnim(ped, animDict, animName, 3.0, 3.0, -1, 2, 0, 0, 0, 0 )
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "breaking_vitrine_glass", 0.25)

    -- SET BUSY
    TriggerServerEvent('qb-artgalleryheist:server:cases:SetBusy', index, true)
    
    QBCore.Functions.Progressbar("smash_vitrine", "Smashing case..", 5000, false, true, {
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
        TriggerServerEvent('qb-artgalleryheist:server:cases:SetHit', index, true)
        TriggerServerEvent('qb-artgalleryheist:server:cases:Reward', Config.Cases[index].type)
        TaskPlayAnim(ped, animDict, "exit", 3.0, 3.0, -1, 2, 0, 0, 0, 0)
    end, function() -- Cancel
        -- SET NOT BUSY
        TriggerServerEvent('qb-artgalleryheist:server:cases:SetBusy', index, false)
        TaskPlayAnim(ped, animDict, "exit", 3.0, 3.0, -1, 2, 0, 0, 0, 0)
    end)
end

RegisterNetEvent('qb-artgalleryheist:client:cases:SetBusy', function(index, bool)
    Config.Cases[index].busy = bool
end)

RegisterNetEvent('qb-artgalleryheist:client:cases:SetHit', function(index, bool)
    Config.Cases[index].hit = bool
end)