RegisterNetEvent('qb-artgalleryheist:server:SetPaintingTaken', function(index)
    Config.Paintings[index].taken = true
    TriggerClientEvent('qb-artgalleryheist:client:SetPaintingTaken', -1, index)
end)

RegisterNetEvent('qb-artgalleryheist:server:PaintingReward', function(index)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = Config.Paintings[index].item
    Player.Functions.AddItem(item, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add')
    TriggerEvent("qb-log:server:CreateLog", 'artgallery', "Painting", "default", "**"..Player.PlayerData.name .. "** (citizenid: *" .. Player.PlayerData.citizenid .. "* | id: *(" .. Player.PlayerData.source .. "))*: received "..item)
end)