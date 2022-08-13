ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


ESX.RegisterUsableItem("printerdocument", function(source, item)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('printer:client:UseDocument', source, item)
end)



RegisterServerEvent('printer:server:SaveDocument')
AddEventHandler('printer:server:SaveDocument', function(url)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local info = {}

    if url ~= nil then
        info.url = url
        xPlayer.addInventoryItem('printerdocument', 1, nil, info)
        TriggerClientEvent('inventory:client:ItemBox', src, ESX.GetItems()['printerdocument'], "add")
    end
end)