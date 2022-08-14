QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('qb-artgalleryheist:server:cases:SetBusy', function(index, bool)
    Config.Cases[index].busy = bool
    TriggerClientEvent('qb-artgalleryheist:client:cases:SetBusy', -1, index, bool)
end)

RegisterServerEvent('qb-artgalleryheist:server:cases:SetHit', function(index, bool)
    Config.Cases[index].hit = bool
    TriggerClientEvent('qb-artgalleryheist:client:cases:SetHit', -1, index, bool)
end)

RegisterServerEvent('qb-artgalleryheist:server:cases:Reward', function(type)
    local Player = QBCore.Functions.GetPlayer(source)
    local item
    local amount = 11

    if type == "Gems" then
        -- DIAMOND
        item = "diamond"
        amount = math.random(2, 4)
        if Player.Functions.AddItem(item, amount) then
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'add')
            TriggerEvent("qb-log:server:CreateLog", 'artgallery', "Jewellery Loot", "yellow", "**"..Player.PlayerData.name .. "** (citizenid: *" .. Player.PlayerData.citizenid .. "* | id: *(" .. Player.PlayerData.source .. "))*: has looted " ..amount.. "x "..item)  
        else
            TriggerClientEvent('QBCore:Notify', source, 'Ceplerinde çok fazla şey var...', 'error')
        end

        -- RUBY
        item = "ruby"
        amount = math.random(2, 4)
        if Player.Functions.AddItem(item, amount) then
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'add')
            TriggerEvent("qb-log:server:CreateLog", 'artgallery', "Jewellery Loot", "yellow", "**"..Player.PlayerData.name .. "** (citizenid: *" .. Player.PlayerData.citizenid .. "* | id: *(" .. Player.PlayerData.source .. "))*: has looted " ..amount.. "x "..item)  
        else
            TriggerClientEvent('QBCore:Notify', source, 'Ceplerinde çok fazla şey var...', 'error')
        end

        -- SAPPHIRE
        item = "sapphire"
        amount = math.random(2, 4)
        if Player.Functions.AddItem(item, amount) then
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'add')
            TriggerEvent("qb-log:server:CreateLog", 'artgallery', "Jewellery Loot", "yellow", "**"..Player.PlayerData.name .. "** (citizenid: *" .. Player.PlayerData.citizenid .. "* | id: *(" .. Player.PlayerData.source .. "))*: has looted " ..amount.. "x "..item)  
        else
            TriggerClientEvent('QBCore:Notify', source, 'Ceplerinde çok fazla şey var...', 'error')
        end

    elseif type == "Jewellery" then
        -- NECKLACES
        item = "goldchain"
        if Player.Functions.AddItem(item, amount) then
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'add')
            TriggerEvent("qb-log:server:CreateLog", 'artgallery', "Jewellery Loot", "yellow", "**"..Player.PlayerData.name .. "** (citizenid: *" .. Player.PlayerData.citizenid .. "* | id: *(" .. Player.PlayerData.source .. "))*: has looted " ..amount.. "x "..item)  
        else
            TriggerClientEvent('QBCore:Notify', source, 'Ceplerinde çok fazla şey var...', 'error')
        end
        -- RINGS
        item = "diamond_ring"
        if Player.Functions.AddItem(item, amount) then
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'add')
            TriggerEvent("qb-log:server:CreateLog", 'artgallery', "Jewellery Loot", "yellow", "**"..Player.PlayerData.name .. "** (citizenid: *" .. Player.PlayerData.citizenid .. "* | id: *(" .. Player.PlayerData.source .. "))*: has looted " ..amount.. "x "..item)  
        else
            TriggerClientEvent('QBCore:Notify', source, 'Ceplerinde çok fazla şey var...', 'error')
        end
    end
end)