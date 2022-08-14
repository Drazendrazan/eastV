RegisterServerEvent('qb-artgalleryheist:server:lasers:ActivateLasers', function()
    TriggerClientEvent('qb-artgalleryheist:client:lasers:ActivateLasers', -1)
end)

RegisterServerEvent('qb-artgalleryheist:server:lasers:StopLasers', function()
    TriggerClientEvent('qb-artgalleryheist:client:lasers:StopLasers', -1)
end)

RegisterServerEvent('qb-artgalleryheist:server:lasers:HitByLaser', function()
    TriggerClientEvent('qb-artgalleryheist:client:lasers:ActivateLockdown', -1)
end)