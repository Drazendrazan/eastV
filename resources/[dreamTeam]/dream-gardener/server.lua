local QBCore = exports['qb-core']:GetCoreObject()


QBCore.Functions.CreateCallback('dream-gardener:checkMoney', function(source, cb)
    local xPlayer = QBCore.Functions.GetPlayer(source)

    if xPlayer.PlayerData.money.cash >= Config.DepositPrice then
        xPlayer.Functions.RemoveMoney('cash', Config.DepositPrice)

            local result = exports.oxmysql:executeSync('SELECT * FROM dream_jobs WHERE identifier=@identifier AND job=@job', {
                ['@identifier'] = xPlayer.PlayerData.citizenid,
                ['@job'] = 'gardener',
            })
            if result[1] ~= nil then
                exports.oxmysql:execute('UPDATE dream_jobs SET first_time = @first_time WHERE identifier=@identifier AND job=@job', {
                    ['@identifier'] = xPlayer.PlayerData.citizenid,
                    ['@first_time'] = 'true',
                    ['@job'] = 'gardener',
                })
            end

		cb(true)
    elseif xPlayer.PlayerData.money.bank >= Config.DepositPrice then
        xPlayer.Functions.RemoveMoney('bank', Config.DepositPrice)

            local result = exports.oxmysql:executeSync('SELECT * FROM dream_jobs WHERE identifier=@identifier AND job=@job', {
                ['@identifier'] = xPlayer.PlayerData.citizenid,
                ['@job'] = 'gardener',
            })
            if result[1] ~= nil then
                exports.oxmysql:execute('UPDATE dream_jobs SET first_time = @first_time WHERE identifier=@identifier AND job=@job', {
                    ['@identifier'] = xPlayer.PlayerData.citizenid,
                    ['@first_time']   = 'true',
                    ['@job'] = 'gardener',
                })
            end

        cb(true)
	else
		cb(false)
	end
end)


RegisterServerEvent('dream-gardener:returnVehicle')
AddEventHandler('dream-gardener:returnVehicle', function()
	local xPlayer = QBCore.Functions.GetPlayer(source)
	local Payout = Config.DepositPrice
	xPlayer.Functions.AddMoney('bamk', Config.DepositPrice)
end)


RegisterServerEvent('dream-gardener:payout')
AddEventHandler('dream-gardener:payout', function(source, cb)
	local xPlayer = QBCore.Functions.GetPlayer(source)
	local money = math.random(Config.PayOutMin, Config.PayOutMax)
	xPlayer.Functions.AddMoney('cash', money)
	cb(money)
end)


QBCore.Functions.CreateCallback('dream-gardener:getdatabase', function(source, cb, xPlayer)
    local xPlayer = QBCore.Functions.GetPlayer(source)

    local result = exports.oxmysql:executeSync('SELECT * FROM dream_jobs WHERE identifier=@identifier AND job=@job', {
        ['@identifier'] = xPlayer.PlayerData.citizenid,
        ['@job'] = 'gardener',
    })

    if result[1] ~= nil then
        cb(result[1].first_time) 
    else
        exports.oxmysql:execute('INSERT INTO dream_jobs (identifier,experience,gardener,job,first_time) VALUES (@identifier,@experience,@gardener,@job,@first_time)', {
            ['@identifier'] = xPlayer.PlayerData.citizenid,
            ['@experience'] = 0,
            ['@gardener'] = 0,
            ['@job'] = 'gardener',
            ['@first_time'] = 'false',
        })
        cb('false') 
    end

end)

