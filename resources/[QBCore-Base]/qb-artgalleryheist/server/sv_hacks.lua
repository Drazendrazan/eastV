RegisterServerEvent('qb-artgalleryheist:server:callCops', function(streetLabel, coords)
    local cameraId = 150
    local msg = "Silent alarm triggered at the Vinewood Art Gallery (CAMERA ID: "..cameraId..")"
    local alertData = {
        title = "Vinewood Art Gallery",
        coords = {x = coords.x, y = coords.y, z = coords.z},
        description = msg,
    }
    TriggerClientEvent("qb-artgalleryheist:client:robberyCall", -1, streetLabel, coords)
    TriggerClientEvent("qb-phone:client:addPoliceAlert", -1, alertData)
end)

RegisterServerEvent('qb-artgalleryheist:server:InsideHacksHit', function(index)
    Config.InsideHacks[index].hit = true
    TriggerClientEvent('qb-artgalleryheist:client:InsideHacksHit', -1, index)
end)

RegisterServerEvent('qb-artgalleryheist:server:InsideHacksBusy', function(index, bool)
    Config.InsideHacks[index].busy = bool
    TriggerClientEvent('qb-artgalleryheist:client:InsideHacksBusy', -1, index, bool)
end)

local accessCodes = math.random(1111,9999)

CreateThread(function()
    print("^3[qb-artgalleryheist] ^5Access Code: "..accessCodes.."^7")
end)

RegisterNetEvent('qb-artgalleryheist:server:laptopdamage', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local item = Player.Functions.GetItemByName("laptop_black")
    if Player.PlayerData.items[item.slot].info.uses - 1 <= 0 then
        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[item.name], "remove")
        Player.Functions.RemoveItem(item.name, 1)
    else
        Player.PlayerData.items[item.slot].info.uses = Player.PlayerData.items[item.slot].info.uses - 1
        Player.Functions.SetInventory(Player.PlayerData.items)
    end
end)

RegisterServerEvent('qb-artgalleryheist:server:CopyCodes', function()
    local Player = QBCore.Functions.GetPlayer(source)
    info = {
        label = "Kasa Giriş Kodları: "..tostring(accessCodes)
    }
    Player.Functions.AddItem("stickynote", 1, false, info)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["stickynote"], "add")
end)

QBCore.Functions.CreateCallback('qb-artgalleryheist:server:isCombinationRight', function(source, cb)
    cb(accessCodes)
end)

RegisterServerEvent('qb-artgalleryheist:server:Code', function()
    Config.Code.isOpened = true
    TriggerClientEvent('qb-artgalleryheist:client:Code', -1)
end)