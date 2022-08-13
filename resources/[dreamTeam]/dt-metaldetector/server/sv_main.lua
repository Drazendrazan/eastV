local QBCore = exports['qb-core']:GetCoreObject()


QBCore.Functions.CreateUseableItem("metaldetector", function(src, item)
    TriggerClientEvent('dt-metaldetector:startdetect', src)
end)


RegisterNetEvent('dt-metaldetector:DetectReward', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local chance = math.random(1,100)

    if chance <= Config.CommonChance then 
        local item = Config.CommonItems[math.random(1, #Config.CommonItems)]
        local amount = Config.CommonAmount
        
        Player.Functions.AddItem(item, amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[item], "add")
        TriggerClientEvent('QBCore:Notify', src, 'Bulunan : '.. item ..'!', 'success')
    elseif chance >= Config.RareChance then 
        local item = Config.RareItems[math.random(1, #Config.RareItems)]
        local amount = Config.RareAmount
        
        Player.Functions.AddItem(item, amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[item], "add")
        TriggerClientEvent('QBCore:Notify', src, 'Bulunan : '.. item ..'!', 'success')
    else
        TriggerClientEvent('QBCore:Notify', src, 'Hiçbir şey bulamadın', 'error')
    end 
end)


RegisterServerEvent('dt-metaldetector:server:CommonTrade', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = tostring(data.item)
    local check = Player.Functions.GetItemByName(item)
    
    if data.id == 2 then
        if check ~= nil then
            if check.amount >= 50 then
                Player.Functions.RemoveItem(item, 50)
                Player.Functions.AddItem('metalscrap', 30)
                TriggerClientEvent('QBCore:Notify', src, '50 Metal Çöpü takas ettiniz'..' 30 Metal Hurda için.', 'success')
            else 
                TriggerClientEvent('QBCore:Notify', src, "Yeterince Hurda Çöpünüz Yok..", 'error')
            end 
        else 
            TriggerClientEvent('QBCore:Notify', src, "Metal Çöpünüz yok.", 'error')
        end
    elseif data.id == 3 then 
        if check ~= nil then
            if check.amount >= 50 then
                Player.Functions.RemoveItem(item, 50)
                Player.Functions.AddItem('iron', 30)
                TriggerClientEvent('QBCore:Notify', src, '50 Demir hurdası takas ettin'..' 30 Demir aldın', 'success')
            else 
                TriggerClientEvent('QBCore:Notify', src, "Yeterli hurda demiriniz yok..", 'error')
            end 
        else 
            TriggerClientEvent('QBCore:Notify', src, "Hiç hurda demirin yok.", 'error')
        end
    elseif data.id == 4 then 
        if check ~= nil then
            if check.amount >= 50 then
                Player.Functions.RemoveItem(item, 50)
                Player.Functions.AddItem('copper', 30)
                TriggerClientEvent('QBCore:Notify', src, '50 Mermi Muhafazası takas ettin'..' 30 Mermi Muhafazası için.', 'success')
            else 
                TriggerClientEvent('QBCore:Notify', src, "Yeterli Mermi Muhafazanız yok..", 'error')
            end 
        else 
            TriggerClientEvent('QBCore:Notify', src, "Mermi Muhafazanız yok.", 'error')
        end
    elseif data.id == 5 then 
        if check ~= nil then
            if check.amount >= 50 then
                Player.Functions.RemoveItem(item, 50)
                Player.Functions.AddItem('aluminum', 30)
                TriggerClientEvent('QBCore:Notify', src, '50 Alüminyum Kutu takas ettiniz'..' 30 Alüminyum için.', 'success')
            else 
                TriggerClientEvent('QBCore:Notify', src, "Yeterli Alüminyum Kutunuz yok..", 'error')
            end 
        else 
            TriggerClientEvent('QBCore:Notify', src, "Hiç Alüminyum Kutunuz yok.", 'error')
        end
    elseif data.id == 6 then 
        if check ~= nil then
            if check.amount >= 50 then
                Player.Functions.RemoveItem(item, 50)
                Player.Functions.AddItem('steel', 25)
                TriggerClientEvent('QBCore:Notify', src, '50 Çelik Çöp sattın'..' 25 Çelik için.', 'success')
            else 
                TriggerClientEvent('QBCore:Notify', src, "Yeterli Çelik Çöpünüz yok..", 'error')
            end 
        else 
            TriggerClientEvent('QBCore:Notify', src, "Çelik çöpün hiç yok", 'error')
        end
    elseif data.id == 7 then 
        if check ~= nil then
            if check.amount >= 5 then
                Player.Functions.RemoveItem(item, 5)
                Player.Functions.AddItem('weapon_dagger', 1)
                TriggerClientEvent('QBCore:Notify', src, '5 Kırık bıçak takas ettin'..' bir hançer için.', 'success')
            else 
                TriggerClientEvent('QBCore:Notify', src, "Yeterince Kırık Bıçağın yok..", 'error')
            end 
        else 
            TriggerClientEvent('QBCore:Notify', src, "Hiç kırık bıçağın yok.", 'error')
        end
    elseif data.id == 8 then 
        if check ~= nil then
            if check.amount >= 1 then
                Player.Functions.RemoveItem(item, 1)
                Player.Functions.AddMoney('cash', 1000)
                TriggerClientEvent('QBCore:Notify', src, '1 kırık Metal Dedektörü takas ettin'..' 1000$ dolar için.', 'success')
            else 
                TriggerClientEvent('QBCore:Notify', src, "Yeterli Metal Dedektörünüz yok..", 'error')
            end 
        else 
            TriggerClientEvent('QBCore:Notify', src, "Metal Dedektörünüz yok.", 'error')
        end
    elseif data.id == 9 then 
        if check ~= nil then
            if check.amount >= 50 then
                Player.Functions.RemoveItem(item, 50)
                Player.Functions.AddItem('copper', 30)
                TriggerClientEvent('QBCore:Notify', src, '50 Ev Anahtarı takas ettiniz'..' 30 bakır için.', 'success')
            else 
                TriggerClientEvent('QBCore:Notify', src, "Yeterince ev anahtarın yok.", 'error')
            end 
        else 
            TriggerClientEvent('QBCore:Notify', src, "Hiç ev anahtarın yok", 'error')
        end
    elseif data.id == 10 then 
        if check ~= nil then
            if check.amount >= 1 then
                Player.Functions.RemoveItem(item, 1)
                Player.Functions.AddMoney('cash', 300)
                TriggerClientEvent('QBCore:Notify', src, '1 adet kırık telefon verdiniz'..' karşılığında 300 dolar aldınız', 'success')
            else 
                TriggerClientEvent('QBCore:Notify', src, "Yeterince kırık telefonun yok", 'error')
            end 
        else 
            TriggerClientEvent('QBCore:Notify', src, "Hiç kırık telefonun yok", 'error')
        end
    end
end)

-- Rare Trade Event --

RegisterServerEvent('dt-metaldetector:server:RareTrade', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = tostring(data.item)
    local check = Player.Functions.GetItemByName(item)
    
    if data.id == 2 then
        if check ~= nil then
            if check.amount >= 1 then
                Player.Functions.RemoveItem(item, 1)
                Player.Functions.AddMoney('cash', 10000)
                TriggerClientEvent('QBCore:Notify', src, 'You traded 1 Burried Treasure'..' for $10,000.', 'success')
            else 
                TriggerClientEvent('QBCore:Notify', src, "You don't have enough Burried Treasure..", 'error')
            end 
        else 
            TriggerClientEvent('QBCore:Notify', src, "You do not have any Burried Treasure.", 'error')
        end
    elseif data.id == 3 then
        if check ~= nil then
            if check.amount >= 1 then
                Player.Functions.RemoveItem(item, 1)
                Player.Functions.AddMoney('cash', 1500)
                TriggerClientEvent('QBCore:Notify', src, 'You traded 1 Treasure Key'..' for $1500.', 'success')
            else 
                TriggerClientEvent('QBCore:Notify', src, "You don't have enough Treasure Keys..", 'error')
            end 
        else 
            TriggerClientEvent('QBCore:Notify', src, "You do not have any Treasure Keys.", 'error')
        end
    elseif data.id == 4 then
        if check ~= nil then
            if check.amount >= 1 then
                Player.Functions.RemoveItem(item, 1)
                Player.Functions.AddMoney('cash', 500)
                TriggerClientEvent('QBCore:Notify', src, 'You traded 1 Antique Coin'..' for $500.', 'success')
            else 
                TriggerClientEvent('QBCore:Notify', src, "You don't have enough Antique Coins..", 'error')
            end 
        else 
            TriggerClientEvent('QBCore:Notify', src, "You do not have any Antique Coins.", 'error')
        end
    elseif data.id == 5 then
        if check ~= nil then
            if check.amount >= 1 then
                Player.Functions.RemoveItem(item, 1)
                Player.Functions.AddMoney('cash', 200)
                TriggerClientEvent('QBCore:Notify', src, 'You traded 1 Golden Nugget'..' for $200.', 'success')
            else 
                TriggerClientEvent('QBCore:Notify', src, "You don't have enough Golden Nuggets..", 'error')
            end 
        else 
            TriggerClientEvent('QBCore:Notify', src, "You do not have any Golden Nuggets.", 'error')
        end
    elseif data.id == 6 then
        if check ~= nil then
            if check.amount >= 1 then
                Player.Functions.RemoveItem(item, 1)
                Player.Functions.AddMoney('cash', 300)
                TriggerClientEvent('QBCore:Notify', src, 'You traded 1 Gold Coin'..' for $300.', 'success')
            else 
                TriggerClientEvent('QBCore:Notify', src, "You don't have enough Gold Coins..", 'error')
            end 
        else 
            TriggerClientEvent('QBCore:Notify', src, "You do not have any Gold Coins.", 'error')
        end
    elseif data.id == 7 then
        if check ~= nil then
            if check.amount >= 1 then
                Player.Functions.RemoveItem(item, 1)
                Player.Functions.AddMoney('cash', 1000)
                TriggerClientEvent('QBCore:Notify', src, 'You traded 1 Antique Coin'..' for $1000.', 'success')
            else 
                TriggerClientEvent('QBCore:Notify', src, "You don't have enough Antique Coins..", 'error')
            end 
        else 
            TriggerClientEvent('QBCore:Notify', src, "You do not have any Antique Coins.", 'error')
        end
    elseif data.id == 8 then
        if check ~= nil then
            if check.amount >= 1 then
                Player.Functions.RemoveItem(item, 1)
                Player.Functions.AddMoney('cash', 800)
                TriggerClientEvent('QBCore:Notify', src, 'You traded 1 WW2 Coin'..' for $800.', 'success')
            else 
                TriggerClientEvent('QBCore:Notify', src, "You don't have enough WW2 Coins..", 'error')
            end 
        else 
            TriggerClientEvent('QBCore:Notify', src, "You do not have any WW2 Coins.", 'error')
        end
    elseif data.id == 9 then
        if check ~= nil then
            if check.amount >= 10 then
                Player.Functions.RemoveItem(item, 10)
                TriggerClientEvent('inventory:client:ItemBox', src,  QBCore.Shared.Items['gameboy'], 'add')
                Player.Functions.AddItem('gameboy', 1)
                TriggerClientEvent('QBCore:Notify', src, 'You traded 10 Broken Gameboys'..' for 1 working Gameboy.', 'success')
            else 
                TriggerClientEvent('QBCore:Notify', src, "You don't have enough Broken Gameboys..", 'error')
            end 
        else 
            TriggerClientEvent('QBCore:Notify', src, "You do not have any Broken Gameboys.", 'error')
        end
    elseif data.id == 10 then
        if check ~= nil then
            if check.amount >= 1 then
                Player.Functions.RemoveItem(item, 1)
                Player.Functions.AddMoney('cash', 150)
                TriggerClientEvent('QBCore:Notify', src, 'You traded 1 Pocket Watch'..' for $150.', 'success')
            else 
                TriggerClientEvent('QBCore:Notify', src, "You don't have enough Pocket Watches..", 'error')
            end 
        else 
            TriggerClientEvent('QBCore:Notify', src, "You do not have any Pocket Watches.", 'error')
        end
    end
end)
