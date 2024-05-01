ESX = nil
loaded = false

local showMap, showBars, showArmor, showOxygen, isOpen, cinematicHud, isPaused
local armorActive, mainActive
local showArmor
local lastJob = nil
local PlayerData = nil




local lastJob = nil
local PlayerData = nil

Citizen.CreateThread(function() -- Thread 3#
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	Wait(Config.WaitValue)
	end

	Citizen.Wait(500)
	if PlayerData == nil or PlayerData.job == nil then
	PlayerData = ESX.GetPlayerData()
	end

end)


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)


Citizen.CreateThread(function() -- Thread 4#
	while true do
	Wait(Config.WaitValue)
		if(PlayerData ~= nil) and (PlayerData.job ~= nil) then
			local jobName = PlayerData.job.label..' - '..PlayerData.job.grade_label
				if(lastJob ~= jobName) then
				lastJob = jobName
					SendNUIMessage({
						action = 'setJob',
						data = jobName
					})
			end
		end
	end
end)



Citizen.CreateThread(function() -- Thread 5#
RegisterNetEvent("oc_hud_v2:setValues")
AddEventHandler("oc_hud_v2:setValues", function(wallet, bank, black_money, society)

SendNUIMessage({
	wallet = wallet,
	bank = bank,
	black_money = black_money,
	society = society
})

end)
end)

Citizen.CreateThread(function() -- Thread 6#
	while true do
		Wait(Config.WaitValue)
		TriggerServerEvent('oc_hud_v2:getMoneys')
	end
end)

Citizen.CreateThread(function() -- Thread 7#

	local talking = false
	local playerId = PlayerId()

		while true do
			Wait(Config.WaitTalk)
				if NetworkIsPlayerTalking(PlayerId()) then
					SendNUIMessage({talking = true})
					else 
					SendNUIMessage({talking = false})
				end	
		end

end)



Citizen.CreateThread(function()  -- Thread 8#
    while true do
	Wait(Config.WaitValue)
        TriggerEvent(Config.statustrigger, Config.statustriggerhunger, function(hunger)
            TriggerEvent(Config.statustrigger, Config.statustriggerthirst, function(thirst)
              food = hunger.getPercent()
              water = thirst.getPercent()
            end)
        end)
    end
end)

Citizen.CreateThread(function() -- Thread 9#
    while ESX == nil do
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	Wait(Config.WaitValue)
    end

    ESX.PlayerData = ESX.GetPlayerData()

	while true do 
	local playerId = PlayerId()
	local pedhealth = GetEntityHealth(ped)
	local ped = PlayerPedId()
	local player = PlayerId()
	local armor, id = GetPedArmour(ped)
	local id  = GetPlayerServerId(player)
	local minutes, hours = GetClockMinutes(), GetClockHours()
	armor = GetPedArmour(ped)
	oxygen = GetPlayerUnderwaterTimeRemaining(playerId)*Config.oxygenMax
	oxygen = math.ceil(oxygen)


	if (minutes <= 9) then
		minutes = "0" .. minutes
	end
	if (hours <= 9) then
		hours = "0" .. hours
	end

SendNUIMessage({
action = "hud",
id = id,
time = hours .. " : " .. minutes,
})

SendNUIMessage({
	type = "update",
		health = health,
		armor = armor,
		food = food,
		water = water,
		oxygen = oxygen,

})

SendNUIMessage({
            action = "update_circle",
            health = health,
            armor = armor,
            hunger = food,
            thirst = water,
            oxygen = oxygen,

        })



Wait(Config.waitTime)


if IsEntityDead(ped) then
	health = 0
else
	health = GetEntityHealth(ped) - 100
end

end
end)







