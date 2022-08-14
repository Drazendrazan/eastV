-- TESTING
QBCore.Commands.Add("startlasers", "test", {}, false, function(source, args)
    TriggerEvent('qb-artgalleryheist:server:lasers:ActivateLasers')
end, "god")

QBCore.Commands.Add("stoplasers", "test", {}, false, function(source, args)
    TriggerEvent('qb-artgalleryheist:server:lasers:StopLasers')
end, "god")

-- Code
QBCore.Functions.CreateCallback('qb-artgalleryheist:server:GetConfig', function(source, cb)
    cb(Config)
end)

QBCore.Functions.CreateCallback('qb-a:artgalleryheist:getCops', function(source, cb)
	local amount = 0
    for k, v in pairs(QBCore.Functions.GetQBPlayers()) do
        if v.PlayerData.job.name == "police" and v.PlayerData.job.onduty then
            amount = amount + 1
        end
    end
    cb(amount)
end)

RegisterServerEvent('qb-artgalleryheist:server:OutsideHacks', function(index)
    Config.OutsideHacks[index].hit = true
    TriggerClientEvent('qb-artgalleryheist:client:OutsideHacks', -1, index)

    if Config.OutsideHacks[1].hit then
        --TriggerEvent('qb-scoreboard:server:SetActivityBusy', "artgallery", true) -- Add to your qb-scoreboard 'artgallery'
        TriggerEvent('qb-artgalleryheist:server:lasers:ActivateLasers')
        TriggerEvent('qb-doorlock:server:updateState', Config.MainDoor, false)
    end
end)

QBCore.Functions.CreateUseableItem("laptop_black", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemByName('laptop_black') then
        TriggerClientEvent("qb-artgalleryheist:client:UseLaptop", source)
    end
end)

-- QBCore.Functions.CreateUseableItem("electronickit", function(source, item)
--     local Player = QBCore.Functions.GetPlayer(source)
--     if Player.Functions.GetItemByName(item.name) then
--         TriggerClientEvent("electronickit:UseElectronickit", source)
--     end
-- end)