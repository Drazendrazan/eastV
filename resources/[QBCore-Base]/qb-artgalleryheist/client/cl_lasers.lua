local alarm = false
local powerplantHit = false
lockdown = false

Artgallery1 = Laser.new(
    vector3(21.74, 150.529, 97.944),
    {vector3(20.73, 140.11, 93.847), vector3(21.084, 140.001, 93.159)},
    {travelTimeBetweenTargets = {1.0, 1.0}, waitTimeAtTargets = {0.0, 0.0}, randomTargetSelection = true, name = "artgallery1"}
)

Artgallery2 = Laser.new(
    vector3(16.961, 141.759, 97.075),
    {vector3(20.442, 150.745, 94.663), vector3(19.368, 147.37, 92.792), vector3(17.93, 143.862, 92.792)},
    {travelTimeBetweenTargets = {1.0, 1.0}, waitTimeAtTargets = {0.0, 0.0}, randomTargetSelection = true, name = "lasernogiets"}
)

Artgallery3 = Laser.new(
    vector3(17.331, 141.361, 97.542),
    {vector3(28.902, 147.578, 92.793), vector3(27.715, 142.547, 92.792), vector3(24.95, 139.199, 92.793), vector3(21.338, 142.746, 92.792)},
    {travelTimeBetweenTargets = {1.0, 1.0}, waitTimeAtTargets = {0.0, 0.0}, randomTargetSelection = true, name = "artgallery3"}
)

Artgallery4 = Laser.new(
    vector3(25.269, 148.968, 96.707),
    {vector3(17.202, 144.27, 92.913), vector3(24.92, 139.841, 92.792), vector3(28.043, 144.972, 92.792), vector3(19.038, 141.66, 92.792), vector3(22.862, 139.612, 92.793)},
    {travelTimeBetweenTargets = {1.0, 1.0}, waitTimeAtTargets = {0.0, 0.0}, randomTargetSelection = true, name = "artgallery4"}
)

Artgallery5 = Laser.new(
  vector3(27.275, 138.781, 97.8),
  {vector3(18.049, 142.875, 92.792), vector3(19.731, 146.534, 92.792), vector3(20.488, 150.516, 92.793), vector3(25.542, 148.853, 93.093), vector3(23.651, 139.536, 92.793), vector3(28.377, 148.648, 92.793)},
  {travelTimeBetweenTargets = {1.0, 1.0}, waitTimeAtTargets = {0.0, 0.0}, randomTargetSelection = true, name = "artgallery5"}
)


RegisterNetEvent('qb-artgalleryheist:client:lasers:ActivateLasers', function()
    if not powerplantHit then
        Artgallery1.setActive(true)
        Artgallery1.setMoving(true)
        Artgallery2.setActive(true)
        Artgallery2.setMoving(true)
        Artgallery3.setActive(true)
        Artgallery3.setMoving(true)
        Artgallery4.setActive(true)
        Artgallery4.setMoving(true)
        Artgallery5.setActive(true)
        Artgallery5.setMoving(true)

        CreateThread(function()
            Artgallery1.onPlayerHit(function(playerBeingHit, hitPos)
                if playerBeingHit then
                    -- Laser just hit the player
                    HitByLaz0r()
                end
            end)
            Artgallery2.onPlayerHit(function(playerBeingHit, hitPos)
                if playerBeingHit then
                    -- Laser just hit the player
                    HitByLaz0r()
                end
            end)
            Artgallery3.onPlayerHit(function(playerBeingHit, hitPos)
                if playerBeingHit then
                    -- Laser just hit the player
                    HitByLaz0r()
                end
            end)
            Artgallery4.onPlayerHit(function(playerBeingHit, hitPos)
                if playerBeingHit then
                    -- Laser just hit the player
                    HitByLaz0r()
                end
            end)
            Artgallery5.onPlayerHit(function(playerBeingHit, hitPos)
                if playerBeingHit then
                    -- Laser just hit the player
                    HitByLaz0r()
                end
            end)
        end)
    end
end)

RegisterNetEvent('qb-artgalleryheist:client:lasers:StopLasers', function()
    Artgallery1.setActive(false)
    Artgallery1.setMoving(false)
    Artgallery2.setActive(false)
    Artgallery2.setMoving(false)
    Artgallery3.setActive(false)
    Artgallery3.setMoving(false)
    Artgallery4.setActive(false)
    Artgallery4.setMoving(false)
    Artgallery5.setActive(false)
    Artgallery5.setMoving(false)
end)

function HitByLaz0r()
    TriggerServerEvent('qb-artgalleryheist:server:lasers:HitByLaser')
    lockdown = true
    CreateThread(function()
        while lockdown do
            -- STOP SOUNDS WHEN AWAY FROM ART GALLERY
            if #(GetEntityCoords(PlayerPedId()) - vector3(23.651853, 141.90103, 93.792182)) > 40 then
                break
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

RegisterNetEvent('qb-artgalleryheist:client:lasers:ActivateLockdown', function()
    lockdown = true
end)

RegisterNetEvent('qb-artgalleryheist:client:lasers:PowerPlantHit', function()
    powerplantHit = true
end)