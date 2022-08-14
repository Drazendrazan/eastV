RegisterServerEvent('qb-artgalleryheist:server:egg:sellEgg', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        local amount = 215000 -- cash reward for selling egg
        if Player.Functions.GetItemByName("faberge_egg") then
            -- REMOVE EGG
            Player.Functions.RemoveItem("faberge_egg",1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["faberge_egg"], "remove")
            -- GIVE CASH
            Player.Functions.AddMoney('cash', amount, "egg-sale")
            -- NOTIFICATION AND LOG
            TriggerClientEvent('QBCore:Notify', src, "You have sold your Fabergé egg for "..amount.." cash..", 'success')
            TriggerEvent("qb-log:server:CreateLog", 'artgallery', "Egg Sale", "red", "**"..Player.PlayerData.name .. "** (citizenid: *" .. Player.PlayerData.citizenid .. "* | id: *(" .. Player.PlayerData.source .. "))*: has sold Faberge Egg for **" ..amount.."**")
        else
            TriggerClientEvent('QBCore:Notify', src, "İstediğim hiçbir şeye sahip değilsin, şimdi teknemden in!", 'error')
        end
    end
end)

RegisterServerEvent('qb-artgalleryheist:server:egg:SetTaken', function()
    Config.Egg.taken = true
    TriggerClientEvent('qb-artgalleryheist:client:egg:SetTaken', -1)
end)

RegisterServerEvent('qb-artgalleryheist:server:egg:SetBusy', function(bool)
    Config.Egg.busy = bool
    TriggerClientEvent('qb-artgalleryheist:client:egg:SetBusy', -1, bool)
end)

RegisterServerEvent('qb-artgalleryheist:server:egg:Reward', function()
    local Player = QBCore.Functions.GetPlayer(source)
    -- GIVE EGG
    Player.Functions.AddItem("faberge_egg", 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["faberge_egg"], "add")
    -- LOG
    TriggerEvent("qb-log:server:CreateLog", 'artgallery', "Egg Reward", "green", "**"..Player.PlayerData.name .. "** (citizenid: *" .. Player.PlayerData.citizenid .. "* | id: *(" .. Player.PlayerData.source .. "))*: has received a Fabergé Egg")
    -- NOTIFY
    TriggerClientEvent('QBCore:Notify', source, "You've stolen the Fabergé egg!", 'error')
end)