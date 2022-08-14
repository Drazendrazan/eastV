local QBCore = exports['qb-core']:GetCoreObject()


RegisterServerEvent('dt-grandma:server:checkfunds', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local balance = Player.Functions.GetMoney(Config.MoneyType)

    if CheckBalance then -- Checks for money balance
        if balance >= Config.Cost then -- Checks to make sure player has enough funds
            TriggerClientEvent('dt-grandma:reviveplayer', source) -- Starts Progressbar for Reviving
        else
            if Config.MoneyType == 'crypto' then
                TriggerClientEvent('QBCore:Notify', source, "Büyükanneye ödeme yapmak için yeterli kripton yok!", "error")
            elseif Config.MoneyType == 'bank' then
                TriggerClientEvent('QBCore:Notify', source, "Büyükanneye ödeme yapmak için banka hesabında yeterli para yok", "error")
            elseif Config.MoneyType == 'cash' then
                TriggerClientEvent('QBCore:Notify', source, "Büyükanneye ödeme yapmak için yeterli paran yok", "error")
            end
        end
    else -- Does not check for money balance
        TriggerClientEvent('dt-grandma:reviveplayer', source)
    end
end)

QBCore.Functions.CreateCallback('random_grandma:attemptGrandmaPayment', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Config.CheckBalance then
        if Player.Functions.RemoveMoney(Config.MoneyType, Config.Cost) then
            cb(true)
        else
            cb(false)
        end
    else
        cb(true)
    end
  end)