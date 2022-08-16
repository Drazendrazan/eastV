local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("kazma", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent('kaz:maden', src)
end)

Items = {
    "copper",
    "iron",
    "diamond",
}
  
function RandomItem()
    return Items[math.random(#Items)]
end
  
function RandomNumber()
    return math.random(1,1)
end
  
RegisterServerEvent('item:ver')
AddEventHandler('item:ver', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem(RandomItem(), RandomNumber())
end)
