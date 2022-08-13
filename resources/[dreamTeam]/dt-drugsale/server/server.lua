local QBCore = exports[Config.Core]:GetCoreObject()

QBCore.Functions.CreateCallback('dt-drugsale:server:GetCops', function(source, cb)
    local amount = 0
    local players = QBCore.Functions.GetQBPlayers()
    for k, v in pairs(players) do
        if (v.PlayerData.job.name == "police" or v.PlayerData.job.name == "bcso") and v.PlayerData.job.onduty then
            amount = amount + 1
        end
    end
    cb(amount)
end)

RegisterNetEvent('dt-drugsale:initiatedrug', function(ZoneDrug)	
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player then		
		local price = ZoneDrug.price				
		if Player.Functions.GetItemByName(tostring(ZoneDrug.item)) then		
			if Player.Functions.RemoveItem(tostring(ZoneDrug.item), 1) then
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[tostring(ZoneDrug.item)], "remove", 1)				
				Player.Functions.AddMoney("cash", price)
				TriggerClientEvent('dt-drugsale:notify', src, price..'$ Kazandın')
				if Config.Debug then print('You got 1 '..ZoneDrug.item..' for $'..price) end
			else				
				TriggerClientEvent('dt-drugsale:notify', src, 'You could not sell your '..ZoneDrug.item..'!')
			end
		else
			TriggerClientEvent('dt-drugsale:notify', src, 'Elinde mal kalmadı '..ZoneDrug.item..' to sell!')
		end		
	end
end)
