local isDriving = false;
local HUD_HIDE_RADAR_ON_FOOT = Config.Hidemaponfoot
ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        if Config.UnitOfSpeed == "kmh" then
            SpeedMultiplier = 3.6
        elseif Config.UnitOfSpeed == "mph" then
            SpeedMultiplier = 2.2
        end
        Wait(100)
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(150)

        if isDriving and IsPedInAnyVehicle(PlayerPedId(), true) then
            local veh = GetVehiclePedIsUsing(PlayerPedId(), false)
            local speed = math.floor(GetEntitySpeed(veh) * SpeedMultiplier)
            local vehhash = GetEntityModel(veh)
            local maxspeed = GetVehicleModelMaxSpeed(vehhash) * 3.6
            SendNUIMessage({speed = speed, maxspeed = maxspeed})
        end
    end
end)
Citizen.CreateThread(function()
    while true do
        Wait(2000)
        if Config.ShowSpeedometer == true then
            if IsPedInAnyVehicle(PlayerPedId(), false) and
                not IsPedInFlyingVehicle(PlayerPedId()) and
                not IsPedInAnySub(PlayerPedId()) then
                isDriving = true
                SendNUIMessage({showSpeedo = true})
				if HUD_HIDE_RADAR_ON_FOOT == true then
				SendNUIMessage({action = 'streetinfoShow'})
				end
            elseif not IsPedInAnyVehicle(PlayerPedId(), false) then
                isDriving = true
                SendNUIMessage({showSpeedo = false})
				if HUD_HIDE_RADAR_ON_FOOT == true then
				SendNUIMessage({action = 'streetinfoHide'})
				end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2000)
        if Config.Hidemaponfoot then
            local player = GetPlayerPed(-1)
            DisplayRadar(IsPedInAnyVehicle(player, false))
            SetRadarZoomLevelThisFrame(200.0)
        end	
		if Config.ShowSpeedometer == false then
		SendNUIMessage({showSpeedo = false})
        end
		if Config.Showstreetinfo == false then
		SendNUIMessage({action = 'streetinfoHide'})
        end
    end
end)






config = {

	color = '';

	position = {

		offsetX = 17;
		offsetY = 2.5; 
	};

  scale = 1.0;


  dynamic = false;
}
