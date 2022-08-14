local QBCore = exports['qb-core']:GetCoreObject()



RegisterNetEvent('tuners:client:xenonMenu', function()
	local playerPed	= PlayerPedId()
	if IsPedSittingInAnyVehicle(playerPed) then
		local vehicle = GetVehiclePedIsIn(playerPed)
		local plate = GetVehicleNumberPlateText(vehicle)
		if Config.isVehicleOwned then
			QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
				if owned then
					xenonControllerMenu()
				else
					QBCore.Functions.Notify("Aracın sahibi değilsin", "error", 3500)
				end
			end, plate)
		else
			xenonControllerMenu()
		end
	else
		QBCore.Functions.Notify("Aracın içerisinde olman gerekir", "error", 3500)
    end
end)



RegisterNetEvent('tuners:client:applyXenonColor', function(args) 
    local args = tonumber(args)
    local playerPed	= PlayerPedId()
	local vehicle = GetVehiclePedIsIn(playerPed, false)
    xenonControllerMenu()
	if args == 1 then 
		SetVehicleHeadlightsColour(vehicle, 0)
    elseif args == 2 then 
		SetVehicleHeadlightsColour(vehicle, -1)      
    elseif args == 3 then 
		SetVehicleHeadlightsColour(vehicle, 1)    
    elseif args == 4 then 
		SetVehicleHeadlightsColour(vehicle, 2)    
    elseif args == 5 then
		SetVehicleHeadlightsColour(vehicle, 3)
	elseif args == 6 then
		SetVehicleHeadlightsColour(vehicle, 4)    
	elseif args == 7 then
		SetVehicleHeadlightsColour(vehicle, 5)    
	elseif args == 8 then
		SetVehicleHeadlightsColour(vehicle, 6)    
	elseif args == 9 then
		SetVehicleHeadlightsColour(vehicle, 7)    
	elseif args == 10 then
		SetVehicleHeadlightsColour(vehicle, 8)    
	elseif args == 11 then
		SetVehicleHeadlightsColour(vehicle, 9)   
	elseif args == 12 then
		SetVehicleHeadlightsColour(vehicle, 10)    
	elseif args == 13 then
		SetVehicleHeadlightsColour(vehicle, 11)    
	elseif args == 14 then
		SetVehicleHeadlightsColour(vehicle, 12)    
    else
        exports['qb-menu']:closeMenu()
        CurrentVehicleData = QBCore.Functions.GetVehicleProperties(vehicle)
        TriggerServerEvent('updateVehicle', CurrentVehicleData)
    end
end)

function xenonControllerMenu()
    exports['qb-menu']:openMenu({
		{
            header = "Xenon Menu",
            txt = "Xenon Renkleri",
            isMenuHeader = true
        },
		{
            header = "Stock",
            txt = "",
            params = {
                event = "tuners:client:applyXenonColor",
				args = 1
            }
        },
        {
            header = "Ice blue",
            txt = "",
            params = {
                event = "tuners:client:applyXenonColor",
				args = 2
            }
        },
		{
            header = "Blue",
            txt = "",
            params = {
                event = "tuners:client:applyXenonColor",
				args = 3
            }
        },
		{
            header = "Electric Blue",
            txt = "",
            params = {
                event = "tuners:client:applyXenonColor",
				args = 4
            }
        },
		{
            header = "Mint Green",
            txt = "",
            params = {
                event = "tuners:client:applyXenonColor",
				args = 5
            }
        },
		{
            header = "Lime Green",
            txt = "",
            params = {
                event = "tuners:client:applyXenonColor",
				args = 6
            }
        },
		{
            header = "Yellow",
            txt = "",
            params = {
                event = "tuners:client:applyXenonColor",
				args = 7
            }
        },
		{
            header = "Golden",
            txt = "",
            params = {
                event = "tuners:client:applyXenonColor",
				args = 8
            }
        },
		{
            header = "Orange",
            txt = "",
            params = {
                event = "tuners:client:applyXenonColor",
				args = 9
            }
        },
		{
            header = "Red",
            txt = "",
            params = {
                event = "tuners:client:applyXenonColor",
				args = 10
            }
        },
		{
            header = "Pony Pink ",
            txt = "",
            params = {
                event = "tuners:client:applyXenonColor",
				args = 11
            }
        },
		{
            header = "Hot Pink",
            txt = "",
            params = {
                event = "tuners:client:applyXenonColor",
				args = 12
            }
        },
		{
            header = "Purple",
            txt = "",
            params = {
                event = "tuners:client:applyXenonColor",
				args = 13
            }
        },
		{
            header = "Blacklight",
            txt = "",
            params = {
                event = "tuners:client:applyXenonColor",
				args = 14
            }
        },
        {
            header = "Kapat",
            txt = "",
            params = {
                event = "tuners:client:applyXenonColor",
				args = 15
            }
        },
    })
end

