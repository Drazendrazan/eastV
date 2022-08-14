CreateThread(function()
    exports['qb-target']:AddBoxZone("ArtgalleryPainting1", vector3(23.85, 149.74, 93.79), 0.3, 1.6, {
        name = "ArtgalleryPainting1",
        heading = 340.00,
        debugPoly = false,
        minZ = 94.05,
        maxZ = 95.25,
        }, {
            options = { 
            {
                action = function()
                    StealPainting(1)
                end,
                icon = 'fas fa-user-secret',
                label = 'Steal Painting',
                canInteract = function()
                    if Config.Paintings[1].taken then return false end
                    return true
                end,
            }
        },
        distance = 1.5,
    })
    exports['qb-target']:AddBoxZone("ArtgalleryPainting2", vector3(23.96, 150.19, 93.79), 0.3, 1.6, {
        name = "ArtgalleryPainting2",
        heading = 340.00,
        debugPoly = false,
        minZ = 94.05,
        maxZ = 95.25,
        }, {
            options = { 
            {
                action = function()
                    StealPainting(2)
                end,
                icon = 'fas fa-user-secret',
                label = 'Steal Painting',
                canInteract = function()
                    if Config.Paintings[2].taken then return false end
                    return true
                end,
            }
        },
        distance = 1.5,
    })
    exports['qb-target']:AddBoxZone("ArtgalleryPainting3", vector3(22.00, 150.9, 93.79), 0.3, 1.6, {
        name = "ArtgalleryPainting3",
        heading = 340.00,
        debugPoly = false,
        minZ = 94.05,
        maxZ = 95.25,
        }, {
            options = { 
            {
                action = function()
                    StealPainting(3)
                end,
                icon = 'fas fa-user-secret',
                label = 'Steal Painting',
                canInteract = function()
                    if Config.Paintings[3].taken then return false end
                    return true
                end,
            }
        },
        distance = 1.5,
    })
    exports['qb-target']:AddBoxZone("ArtgalleryPainting4", vector3(20.04, 139.82, 93.79), 0.3, 1.6, {
        name = "ArtgalleryPainting4",
        heading = 340.00,
        debugPoly = false,
        minZ = 94.05,
        maxZ = 95.25,
        }, {
            options = { 
            {
                action = function()
                    StealPainting(4)
                end,
                icon = 'fas fa-user-secret',
                label = 'Steal Painting',
                canInteract = function()
                    if Config.Paintings[4].taken then return false end
                    return true
                end,
            }
        },
        distance = 1.5,
    })
    exports['qb-target']:AddBoxZone("ArtgalleryPainting5", vector3(37.61, 133.97, 93.79), 0.3, 1.6, {
        name = "ArtgalleryPainting5",
        heading = 162.00,
        debugPoly = false,
        minZ = 94.05,
        maxZ = 95.25,
        }, {
            options = { 
            {
                action = function()
                    StealPainting(5)
                end,
                icon = 'fas fa-user-secret',
                label = 'Steal Painting',
                canInteract = function()
                    if Config.Paintings[5].taken then return false end
                    return true
                end,
            }
        },
        distance = 1.5,
    })
    exports['qb-target']:AddBoxZone("ArtgalleryPainting6", vector3(41.18, 143.91, 93.79), 0.3, 1.6, {
        name = "ArtgalleryPainting6",
        heading = 160.00,
        debugPoly = false,
        minZ = 94.05,
        maxZ = 95.25,
        }, {
            options = { 
            {
                action = function()
                    StealPainting(6)
                end,
                icon = 'fas fa-user-secret',
                label = 'Steal Painting',
                canInteract = function()
                    if Config.Paintings[6].taken then return false end
                    return true
                end,
            }
        },
        distance = 1.5,
    })
    exports['qb-target']:AddBoxZone("ArtgalleryPainting7", vector3(18.29, 141.06, 93.79), 0.3, 1.6, {
        name = "ArtgalleryPainting7",
        heading = 340.00,
        debugPoly = false,
        minZ = 94.05,
        maxZ = 95.25,
        }, {
            options = { 
            {
                action = function()
                    StealPainting(7)
                end,
                icon = 'fas fa-user-secret',
                label = 'Steal Painting',
                canInteract = function()
                    if Config.Paintings[7].taken then return false end
                    return true
                end,
            }
        },
        distance = 1.5,
    })
    exports['qb-target']:AddBoxZone("ArtgalleryPainting8", vector3(39.53, 133.33, 93.79), 0.3, 1.6, {
        name = "ArtgalleryPainting8",
        heading = 340.00,
        debugPoly = false,
        minZ = 94.05,
        maxZ = 95.25,
        }, {
            options = { 
            {
                action = function()
                    StealPainting(8)
                end,
                icon = 'fas fa-user-secret',
                label = 'Steal Painting',
                canInteract = function()
                    if Config.Paintings[8].taken then return false end
                    return true
                end,
            }
        },
        distance = 1.5,
    })
    exports['qb-target']:AddBoxZone("ArtgalleryPainting9", vector3(39.23, 132.78, 93.79), 0.3, 1.6, {
        name = "ArtgalleryPainting9",
        heading = 340.00,
        debugPoly = false,
        minZ = 94.05,
        maxZ = 95.25,
        }, {
            options = { 
            {
                action = function()
                    StealPainting(9)
                end,
                icon = 'fas fa-user-secret',
                label = 'Steal Painting',
                canInteract = function()
                    if Config.Paintings[9].taken then return false end
                    return true
                end,
            }
        },
        distance = 1.5,
    })
    exports['qb-target']:AddBoxZone("ArtgalleryPainting10", vector3(40.94, 143.47, 93.79), 0.3, 1.6, {
        name = "ArtgalleryPainting10",
        heading = 340.00,
        debugPoly = false,
        minZ = 94.05,
        maxZ = 95.25,
        }, {
            options = { 
            {
                action = function()
                    StealPainting(10)
                end,
                icon = 'fas fa-user-secret',
                label = 'Steal Painting',
                canInteract = function()
                    if Config.Paintings[10].taken then return false end
                    return true
                end,
            }
        },
        distance = 1.5,
    })
end)

local Knives = {
    [`WEAPON_SWITCHBLADE`] = true,
    [`WEAPON_KNIFE`] = true
}

StealPainting = function(index)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if #(pos - Config.Paintings[index].coords.xyz) < 2.0 then
        local pedWeapon = GetSelectedPedWeapon(ped)
        if Knives[pedWeapon] then
            LocalPlayer.state:set("inv_busy", true, true)
            local animDict = "anim_heist@hs3f@ig11_steal_painting@male@"
            RequestAnimDict(animDict)
            while not HasAnimDictLoaded(animDict) do Wait(10) end
            -- Set Taken
            TriggerServerEvent('qb-artgalleryheist:server:SetPaintingTaken', index)
            -- Animation
            local painting = GetClosestObjectOfType(Config.Paintings[index].coords.x, Config.Paintings[index].coords.y, Config.Paintings[index].coords.z, 2.0, Config.Paintings[index].object, false, false, false)
            FreezeEntityPosition(ped, true)
            SetEntityHeading(ped, Config.Paintings[index].coords.w)
            TaskPlayAnim(ped, animDict, "with_painting_exit", 8.0, 8.0, -1, 0, 0, 0, 0, 0)
            Wait(1000)
            while IsEntityPlayingAnim(ped, animDict, "with_painting_exit", 3) do Wait(50) end
            -- Finishing up: code that removes painting from wall but causes major flickering due to IPL refresh
            -- local interiorid = GetInteriorAtCoords(27.478, 143.0223, 97.945)
            -- DeactivateInteriorEntitySet(interiorid, 'set_painting1')
            -- RefreshInterior(interiorid)
            FreezeEntityPosition(ped, false)
            -- Reward
            TriggerServerEvent('qb-artgalleryheist:server:PaintingReward', index)
            LocalPlayer.state:set("inv_busy", false, true)
        else
            QBCore.Functions.Notify('You need a knife to slash the painting..', 'error', 2500)
        end
    else
        QBCore.Functions.Notify('You are not close enough..', 'error', 2500)
    end
end

RegisterNetEvent('qb-artgalleryheist:client:SetPaintingTaken', function(index)
    Config.Paintings[index].taken = true
end)