CreateThread(function()
    exports['qb-target']:AddBoxZone("ArtGalleryThermite1", vector3(36.92, 145.21, 93.79), 0.3, 1.2, {
        name = "ArtGalleryThermite1",
        heading = 340.96,
        debugPoly = false,
        minZ = 92.7,
        maxZ = 94.6,
        }, {
            options = { 
            {
                type = "client",
                event = "qb-artgalleryheist:client:thermite",
                icon = 'fas fa-user-secret',
                label = 'Unlock Door'
            }
        },
        distance = 2.5,
    })
    exports['qb-target']:AddBoxZone("ArtGalleryThermite2", vector3(33.14, 135.22, 93.79), 0.3, 1.2, {
        name = "ArtGalleryThermite2",
        heading = 340.96,
        debugPoly = false,
        minZ = 92.7,
        maxZ = 94.6,
        }, {
            options = { 
            {
                type = "client",
                event = "qb-artgalleryheist:client:thermite",
                icon = 'fas fa-user-secret',
                label = 'Unlock Door'
            }
        },
        distance = 2.5,
    })
end)

RegisterNetEvent('qb-artgalleryheist:client:thermite', function()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
        if result then 
            TriggerEvent('thermite:UseThermite')
        else
            QBCore.Functions.Notify("You are missing something(s)..", "error", 2500)
        end
    end, {"thermite", "lighter"})
end)

RegisterNetEvent('thermite:UseThermite', function()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if #(pos - Config.ThermiteDoors[1].coords) < 2 then
        if math.random(1, 100) <= 85 and not IsWearingHandshoes() then
            TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
        end
        PlantThermite(1)
        -- correctBlocks = Number of correct blocks the player needs to click
        -- incorrectBlocks = number of incorrect blocks after which the game will fail
        -- timetoShow = time in secs for which the right blocks will be shown
        -- timetoLose = maximum time after timetoshow expires for player to select the right blocks
        exports["memorygame"]:thermiteminigame(1, 4, 4, 120,
        function() -- success
            ThermiteEffect(1)
        end,
        function() -- failure
            QBCore.Functions.Notify("Thermite failed..", "error")
        end)
    elseif #(pos - Config.ThermiteDoors[2].coords) < 2 then
        if math.random(1, 100) <= 85 and not IsWearingHandshoes() then
            TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
        end
        PlantThermite(2)
        -- correctBlocks = Number of correct blocks the player needs to click
        -- incorrectBlocks = number of incorrect blocks after which the game will fail
        -- timetoShow = time in secs for which the right blocks will be shown
        -- timetoLose = maximum time after timetoshow expires for player to select the right blocks
        exports["memorygame"]:thermiteminigame(1, 4, 4, 120,
        function() -- success
            ThermiteEffect(2)
        end,
        function() -- failure
            QBCore.Functions.Notify("Thermite failed..", "error")
        end)
    end
end)

function PlantThermite(index)
    TriggerServerEvent("QBCore:Server:RemoveItem", "thermite", 1)
    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["thermite"], "remove")
    RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
    RequestModel("hei_p_m_bag_var22_arm_s")
    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasNamedPtfxAssetLoaded("scr_ornate_heist") do Wait(50) end
    local ped = PlayerPedId()
    local pos = Config.ThermiteDoors[index].animation
    SetEntityHeading(ped, pos.w)
    Wait(100)
    local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
    local bagscene = NetworkCreateSynchronisedScene(pos.x, pos.y, pos.z, rotx, roty, rotz, 2, false, false, 1065353216, 0, 1.3)
    local bag = CreateObject(`hei_p_m_bag_var22_arm_s`, pos.x, pos.y, pos.z,  true,  true, false)
    SetEntityCollision(bag, false, true)
    local x, y, z = table.unpack(GetEntityCoords(ped))
    local charge = CreateObject(`hei_prop_heist_thermite`, x, y, z + 0.2,  true,  true, true)
    SetEntityCollision(charge, false, true)
    AttachEntityToEntity(charge, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
    NetworkAddPedToSynchronisedScene(ped, bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, bagscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
    SetPedComponentVariation(ped, 5, 0, 0, 0)
    NetworkStartSynchronisedScene(bagscene)
    Wait(5000)
    DetachEntity(charge, 1, 1)
    FreezeEntityPosition(charge, true)
    DeleteObject(bag)
    NetworkStopSynchronisedScene(bagscene)
    CreateThread(function()
        Wait(15000)
        DeleteEntity(charge)
    end)
end

function ThermiteEffect(index)
    RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
    while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") do Wait(50) end
    local ped = PlayerPedId()
    local ptfx = Config.ThermiteDoors[index].ptfx
    Wait(1500)
    TriggerServerEvent("qb-artgalleryheist:server:ThermitePtfx", ptfx)
    Wait(500)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0)
    Wait(25000)
    ClearPedTasks(ped)
    Wait(2000)
    ThermiteSuccess(index)
end

function ThermiteSuccess(index)
    QBCore.Functions.Notify("The door is burned open", "success")
    TriggerServerEvent('qb-doorlock:server:updateState', Config.ThermiteDoors[index].doorId, false)
end

RegisterNetEvent("qb-artgalleryheist:client:ThermitePtfx", function(coords)
    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do Wait(50) end
    SetPtfxAssetNextCall("scr_ornate_heist")
    local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", coords, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
    Wait(27500)
    StopParticleFxLooped(effect, 0)
end)