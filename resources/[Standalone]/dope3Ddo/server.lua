RegisterCommand("do", function(source , args, rawCommand)
    local Text = table.concat(args, ' ')
    TriggerClientEvent('do:image', -1, Text, source)
end, false)
