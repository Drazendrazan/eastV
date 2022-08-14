local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    if QBCore.Functions.GetPlayerData().job.name == Config.TunerJob then
        isAuth = true
    end
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(job)
    isAuth = false
    if job.name == Config.TunerJob then
		isAuth = true
    end
end)


local wheels = {
    "wheel_lf",
    "wheel_rf",
    "wheel_lm1",
    "wheel_rm1",
    "wheel_lm2",
    "wheel_rm2",
    "wheel_lm3",
    "wheel_rm3",
    "wheel_lr",
    "wheel_rr",
	"bonnet",
}


exports['qb-target']:AddTargetBone(wheels, {
    options = {
        {
            event = "tuners:client:checkVehicleMods",
            icon = "fas fa-car",
            label = "Aracın Modlarını Kontrol Et",
			job = "mechanic",
		},
    },
    distance = 10.0
}) 

RegisterNetEvent('tuners:client:checkVehicleMods', function()
	if Config.JobInstall and not isAuth then return end

	local ped = PlayerPedId()
    local closestVeh = QBCore.Functions.GetClosestVehicle()
	local time = 5000
	local plate = GetVehicleNumberPlateText(veh)

	if closestVeh ~= 0 then
		local pedCoords = GetEntityCoords(ped)
		local vehEngine = GetEntityBoneIndexByName(closestVeh, "engine")
		local enginePos = GetWorldPositionOfEntityBone(closestVeh, vehEngine)

		if #(pedCoords - enginePos) < 2 then
			QBCore.Functions.Notify("Araç Durumu Kontrol Ediliyor..", "primary", time)
			SetVehicleEngineOn(veh, false, false, true)
			Wait(time)
			checkVehicleMods()
			SetVehicleEngineOn(veh, true, false, false) 
		else
			print(pedCoords, enginePos)
			QBCore.Functions.Notify("Araç olmadan size yardımcı olamam!", "error", 3500)
		end
	end
end)

function checkVehicleMods()
    local ped = PlayerPedId()
    local vehicle = QBCore.Functions.GetClosestVehicle()
	local vehProps = QBCore.Functions.GetVehicleProperties(vehicle)
	local model = GetEntityModel(vehicle)
	local modelName = GetDisplayNameFromVehicleModel(model)
	local modCount = GetNumVehicleMods(vehicle, modType)
	vehProps.modEngine = vehProps.modEngine + 1
	vehProps.modBrakes = vehProps.modBrakes + 1
	vehProps.modSuspension = vehProps.modSuspension + 1
	vehProps.modTransmission = vehProps.modTransmission + 1
	vehProps.windowTint = vehProps.windowTint + 1
	if Config.checkTunesMessage == "chat" then
		TriggerEvent('chat:addMessage', { 
			template = '<div class="chat-message advert"><div class="chat-message-body"><strong>Sport Race | Diagnostics</strong><br>Model: {0}<br>Tint: {1}<br>Brakes: {2}<br>Engine: {3}<br>Suspension: {4}<br>Transmission: {5}<br>Turbo: {6}<br>Headlights: {7}</div>',
			args = {
				modelName,
				tostring(vehProps.windowTint).. '/6',
				tostring(vehProps.modBrakes).. '/' .. GetNumVehicleMods(vehicle, 12),
				tostring(vehProps.modEngine).. '/' .. GetNumVehicleMods(vehicle,11),
				tostring(vehProps.modSuspension).. '/' .. GetNumVehicleMods(vehicle,15),
				tostring(vehProps.modTransmission).. '/' .. GetNumVehicleMods(vehicle,13),
				tostring(vehProps.modTurbo),
				tostring(vehProps.modXenon),

			} 
		})
		QBCore.Functions.Notify("Araç Modifikasyon Listesi Alındı", "success")
	elseif Config.checkTunesMessage == "phone" then 
		QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
			if HasItem then
				TriggerServerEvent('qb-phone:server:sendNewMail', {
					sender = "Modifikasyon Listesi",
					subject = "Araç Teşhisi",
					message = "Model: "..modelName.."<br />CamFilmi: "..tostring(vehProps.windowTint).. "/6<br />Frenler: "..tostring(vehProps.modBrakes).. "/" .. GetNumVehicleMods(vehicle, 12).."<br />Motor: "..tostring(vehProps.modEngine).. "/" .. GetNumVehicleMods(vehicle,11).."<br />Süspansiyon: "..tostring(vehProps.modSuspension).. "/" .. GetNumVehicleMods(vehicle,15).."<br />Fren: "..tostring(vehProps.modTransmission).. "/" .. GetNumVehicleMods(vehicle,13).."<br />Turbo: "..tostring(vehProps.modTurbo).."<br />Xenon: "..tostring(vehProps.modXenon),
				})
				QBCore.Functions.Notify("Araç Modifikasyon Listesi Alındı", "success")
			else
			  QBCore.Functions.Notify("araç durum kontrol cihazı yok", "error" , 5000)
			end
		end, 'tuners_check')
	end
end


