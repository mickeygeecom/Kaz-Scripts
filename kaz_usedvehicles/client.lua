vRP = Proxy.getInterface("vRP")

local menuEnabled = false
local key = cfg.key
local cars = cfg.cars
local caramount = 0
local timeout = false


local carpos1 = cfg.carpos1
local carpos2 = cfg.carpos2
local carpos3 = cfg.carpos3
local carpos4 = cfg.carpos4
local carpos5 = cfg.carpos5
local carpos6 = cfg.carpos6
local carpos7 = cfg.carpos7
local carpos8 = cfg.carpos8
local carpos9 = cfg.carpos9
local carpos10 = cfg.carpos10

RegisterNetEvent("ToggleActionmenu")
AddEventHandler("ToggleActionmenu", function()
	ToggleActionMenu()
end)

function ToggleActionMenu()
	Citizen.Trace("tutorial launch")
	menuEnabled = not menuEnabled
	if ( menuEnabled ) then
		SetNuiFocus( true, true )
		SendNUIMessage({
			showPlayerMenu = true
		})
	else
		SetNuiFocus( false )
		SendNUIMessage({
			showPlayerMenu = false
		})
	end
end

function killTutorialMenu()
SetNuiFocus( false )
		SendNUIMessage({
			showPlayerMenu = false
		})
		menuEnabled = false

end


RegisterNUICallback('close', function(data, cb)
  ToggleActionMenu()
  cb('ok')
end)

Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(0)
		DrawMarker(27, cars.x,cars.y,cars.z-0.9, 0, 0, 0, 0, 0, 0, 3.0001,3.0001,1.0001, 0, 232, 255, 155, 0, 0, 0, 0, 0, 0, 0)
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), cars.x,cars.y,cars.z, true ) < 1.5 then
			DrawText3Ds( cars.x,cars.y,cars.z, "~w~Tryk [~g~E~w~] for at åbne menu.", 3.0, 7)
		 if (IsControlJustReleased(1, 51)) then
				 veh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
				if(GetPedInVehicleSeat(veh, -1) == GetPlayerPed(-1))then
					local ok, vtype, name = vRP.getNearestOwnedVehicle({7})
					if ok then
						if vtype ~= nil and name ~= nil then 
							if caramount == 10 then 
								TriggerEvent("pNotify:SendNotification",{text = "Der er allerede 10 køretøjer til salg!",type = "success",timeout = (8500),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
							else
								SetNuiFocus( true, true )
								SendNUIMessage({
								showPlayerMenu = true,
								atype = "intet køretøj",
								amodel = "intet køretøj",
								abeskrivelse = "intet køretøj",
								apris = "intet køretøj",
								aseller = "intet køretøj"	
								})
							end
						else
							TriggerEvent("pNotify:SendNotification",{text = "Du skal komme med dit eget køretøj!",type = "success",timeout = (8500),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
						end
					else
						TriggerEvent("pNotify:SendNotification",{text = "Du skal komme med dit eget køretøj!",type = "success",timeout = (8500),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
					end
				else
					TriggerEvent("pNotify:SendNotification",{text = "Du er ikke i et køretøj.",type = "success",timeout = (8500),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
				end	 
		 end
		end
	end
end)

RegisterNetEvent("kaz:setprice")
AddEventHandler("kaz:setprice", function(sellerid1, description1, price1, model1, vtype1, sellername1, sellerid2, description2, price2, model2, vtype2, sellername2, sellerid3, description3, price3, model3, vtype3, sellername3, sellerid4, description4, price4, model4, vtype4, sellername4, sellerid5, description5, price5, model5, vtype5, sellername5, sellerid6, description6, price6, model6, vtype6, sellername6, sellerid7, description7, price7, model7, vtype7, sellername7, sellerid8, description8, price8, model8, vtype8, sellername8, sellerid9, description9, price9, model9, vtype9, sellername9, sellerid10, description10, price10, model10, vtype10, sellername10)
npris1 = tonumber(price1)
npris2 = tonumber(price2)
npris3 = tonumber(price3)
npris4 = tonumber(price4)
npris5 = tonumber(price5)
npris6 = tonumber(price6)
npris7 = tonumber(price7)
npris8 = tonumber(price8)
npris9 = tonumber(price9)
npris10 = tonumber(price10)

ndescription1 = description1
ndescription2 = description2
ndescription3 = description3
ndescription4 = description4
ndescription5 = description5
ndescription6 = description6
ndescription7 = description7
ndescription8 = description8
ndescription9 = description9
ndescription10 = description10

nsellername1 = sellername1
nsellername2 = sellername2
nsellername3 = sellername3
nsellername4 = sellername4
nsellername5 = sellername5
nsellername6 = sellername6
nsellername7 = sellername7
nsellername8 = sellername8
nsellername9 = sellername9
nsellername10 = sellername10

nvtype1 = vtype1
nvtype2 = vtype2
nvtype3 = vtype3
nvtype4 = vtype4
nvtype5 = vtype5
nvtype6 = vtype6
nvtype7 = vtype7
nvtype8 = vtype8
nvtype9 = vtype9
nvtype10 = vtype10

nsellerid1 = tonumber(sellerid1)
nsellerid2 = tonumber(sellerid2)
nsellerid3 = tonumber(sellerid3)
nsellerid4 = tonumber(sellerid4)
nsellerid5 = tonumber(sellerid5)
nsellerid6 = tonumber(sellerid6)
nsellerid7 = tonumber(sellerid7)
nsellerid8 = tonumber(sellerid8)
nsellerid9 = tonumber(sellerid9)
nsellerid10 = tonumber(sellerid10)

carmodel1 = model1
carmodel2 = model2
carmodel3 = model3
carmodel4 = model4
carmodel5 = model5
carmodel6 = model6
carmodel7 = model7
carmodel8 = model8
carmodel9 = model9
carmodel10 = model10
end)

Citizen.CreateThread(function()
	local ped = GetPlayerPed(-1)
	while true do
		Citizen.Wait(0)
		local PlayerPos = GetEntityCoords(PlayerPedId(), true)
		if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), cars.x, cars.y, cars.z, true ) < 50 then
		TriggerEvent('kaz:refresh')
		Citizen.Wait(300000)
		end
	end
end)


Citizen.CreateThread(function()
	local ped = GetPlayerPed(-1)
	Citizen.Wait(1000)
	while true do
		Citizen.Wait(0)
		local PlayerPos = GetEntityCoords(PlayerPedId(), true)
		if caramount >= 1 then
			if npris1 ~= nil then 
			if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), carpos1.x, carpos1.y, carpos1.z, true ) <= 1 then
			if timeout == false then 
				DrawText3Ds(carpos1.x, carpos1.y, carpos1.z, "~w~Tryk [~g~K~w~] for at åbne menu.", 3.0, 7) -- TILFØJ SYSTEM TIL AT TJEKKE PRIS
				if IsControlJustPressed(1, 311) then 
					SetNuiFocus( true, true )
					SendNUIMessage({
					showPlayerMenu = true,
					atype = nvtype1,
					amodel = carmodel1,
					abeskrivelse = ndescription1,
					apris = npris1,
					aseller = nsellername1	
					})
				end
			else
			DrawText3Ds(carpos1.x, carpos1.y, carpos1.z, "[Cooldown] Vent 60 sekunder.", 3.0, 7)
			end
			end
			end	
		end
		if caramount >= 2 then
			if npris2 ~= nil then
			if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), carpos2.x, carpos2.y, carpos2.z, true ) <= 1 then
			if timeout == false then 
				DrawText3Ds(carpos2.x, carpos2.y, carpos2.z, "~w~Tryk [~g~K~w~] for at åbne menu.", 3.0, 7)-- TILFØJ SYSTEM TIL AT TJEKKE PRIS
				if IsControlJustPressed(1, 311) then 
				SetNuiFocus( true, true )
					SendNUIMessage({
					showPlayerMenu = true,
					atype = nvtype2,
					amodel = carmodel2,
					abeskrivelse = ndescription2,
					apris = npris2,
					aseller = nsellername2	
					})
				end
			else
			DrawText3Ds(carpos2.x, carpos2.y, carpos2.z, "[Cooldown] Vent 60 sekunder.", 3.0, 7)
			end
			end
			end
		end
		if caramount >= 3 then 
			if npris3 ~= nil then
			if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), carpos3.x, carpos3.y, carpos3.z, true ) <= 1 then
			if timeout == false then 
				DrawText3Ds(carpos3.x, carpos3.y, carpos3.z, "~w~Tryk [~g~K~w~] for at åbne menu.", 3.0, 7)-- TILFØJ SYSTEM TIL AT TJEKKE PRIS
				if IsControlJustPressed(1, 311) then 
				SetNuiFocus( true, true )
					SendNUIMessage({
					showPlayerMenu = true,
					atype = nvtype3,
					amodel = carmodel3,
					abeskrivelse = ndescription3,
					apris = npris3,
					aseller = nsellername3	
					})
				end
			else
			DrawText3Ds(carpos3.x, carpos3.y, carpos3.z, "[Cooldown] Vent 60 sekunder.", 3.0, 7)
			end
			end
			end
		end
		if caramount >= 4 then 
			if npris4 ~= nil then
			if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), carpos4.x, carpos4.y, carpos4.z, true ) <= 1 then
			if timeout == false then 
				DrawText3Ds(carpos4.x, carpos4.y, carpos4.z, "~w~Tryk [~g~K~w~] for at åbne menu.", 3.0, 7)-- TILFØJ SYSTEM TIL AT TJEKKE PRIS
				if IsControlJustPressed(1, 311) then 
				SetNuiFocus( true, true )
					SendNUIMessage({
					showPlayerMenu = true,
					atype = nvtype4,
					amodel = carmodel4,
					abeskrivelse = ndescription4,
					apris = npris4,
					aseller = nsellername4	
					})
				end
			else
			DrawText3Ds(carpos4.x, carpos4.y, carpos4.z, "[Cooldown] Vent 60 sekunder.", 3.0, 7)
			end
			end
			end
		end
		if caramount >= 5 then 
			if npris5 ~= nil then
			if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), carpos5.x, carpos5.y, carpos5.z, true ) <= 1 then
			if timeout == false then 
				DrawText3Ds(carpos5.x, carpos5.y, carpos5.z, "~w~Tryk [~g~K~w~] for at åbne menu.", 3.0, 7)-- TILFØJ SYSTEM TIL AT TJEKKE PRIS
				if IsControlJustPressed(1, 311) then 
				SetNuiFocus( true, true )
					SendNUIMessage({
					showPlayerMenu = true,
					atype = nvtype5,
					amodel = carmodel5,
					abeskrivelse = ndescription5,
					apris = npris5,
					aseller = nsellername5	
					})
				end
			else
			DrawText3Ds(carpos5.x, carpos5.y, carpos5.z, "[Cooldown] Vent 60 sekunder.", 3.0, 7)
			end
			end
			end
		end
		if caramount >= 6 then 
			if npris6 ~= nil then
			if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), carpos6.x, carpos6.y, carpos6.z, true ) <= 1 then
			if timeout == false then 
				DrawText3Ds(carpos6.x, carpos6.y, carpos6.z, "~w~Tryk [~g~K~w~] for at åbne menu.", 3.0, 7)-- TILFØJ SYSTEM TIL AT TJEKKE PRIS
				if IsControlJustPressed(1, 311) then 
				SetNuiFocus( true, true )
					SendNUIMessage({
					showPlayerMenu = true,
					atype = nvtype6,
					amodel = carmodel6,
					abeskrivelse = ndescription6,
					apris = npris6,
					aseller = nsellername6	
					})
				end
			else
			DrawText3Ds(carpos6.x, carpos6.y, carpos6.z, "[Cooldown] Vent 60 sekunder.", 3.0, 7)
			end
			end
			end
		end
		if caramount >= 7 then 
			if npris7 ~= nil then
			if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), carpos7.x, carpos7.y, carpos7.z, true ) <= 1 then
			if timeout == false then 
				DrawText3Ds(carpos7.x, carpos7.y, carpos7.z, "~w~Tryk [~g~K~w~] for at åbne menu.", 3.0, 7)-- TILFØJ SYSTEM TIL AT TJEKKE PRIS
				if IsControlJustPressed(1, 311) then 
				SetNuiFocus( true, true )
					SendNUIMessage({
					showPlayerMenu = true,
					atype = nvtype7,
					amodel = carmodel7,
					abeskrivelse = ndescription7,
					apris = npris7,
					aseller = nsellername7	
					})
				end
			else
			DrawText3Ds(carpos7.x, carpos7.y, carpos7.z, "[Cooldown] Vent 60 sekunder.", 3.0, 7)
			end
			end
			end
		end
		if caramount >= 8 then 
			if npris8 ~= nil then
			if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), carpos8.x, carpos8.y, carpos8.z, true ) <= 1 then
			if timeout == false then 
				DrawText3Ds(carpos8.x, carpos8.y, carpos8.z, "~w~Tryk [~g~K~w~] for at åbne menu.", 3.0, 7)-- TILFØJ SYSTEM TIL AT TJEKKE PRIS
				if IsControlJustPressed(1, 311) then 
				SetNuiFocus( true, true )
					SendNUIMessage({
					showPlayerMenu = true,
					atype = nvtype8,
					amodel = carmodel8,
					abeskrivelse = ndescription8,
					apris = npris8,
					aseller = nsellername8	
					})
				end
			else
			DrawText3Ds(carpos8.x, carpos8.y, carpos8.z, "[Cooldown] Vent 60 sekunder.", 3.0, 7)
			end
			end
			end
		end
		if caramount >= 9 then
			if npris9 ~= nil then
			if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), carpos9.x, carpos9.y, carpos9.z, true ) <= 1 then
			if timeout == false then 
				DrawText3Ds(carpos9.x, carpos9.y, carpos9.z, "~w~Tryk [~g~K~w~] for at åbne menu.", 3.0, 7)-- TILFØJ SYSTEM TIL AT TJEKKE PRIS
				if IsControlJustPressed(1, 311) then 
				SetNuiFocus( true, true )
					SendNUIMessage({
					showPlayerMenu = true,
					atype = nvtype9,
					amodel = carmodel9,
					abeskrivelse = ndescription9,
					apris = npris9,
					aseller = nsellername9	
					})
				end
			else
			DrawText3Ds(carpos9.x, carpos9.y, carpos9.z, "[Cooldown] Vent 60 sekunder.", 3.0, 7)
			end
			end
			end
		end
		if caramount >= 10 then
			if npris10 ~= nil then
			if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), carpos10.x, carpos10.y, carpos10.z, true ) <= 1 then
			if timeout == false then 
				DrawText3Ds(carpos10.x, carpos10.y, carpos10.z, "~w~Tryk [~g~K~w~] for at åbne menu.", 3.0, 7)-- TILFØJ SYSTEM TIL AT TJEKKE PRIS
				if IsControlJustPressed(1, 311) then 
				SetNuiFocus( true, true )
					SendNUIMessage({
					showPlayerMenu = true,
					atype = nvtype10,
					amodel = carmodel10,
					abeskrivelse = ndescription10,
					apris = npris10,
					aseller = nsellername10	
					})
				end
			else
			DrawText3Ds(carpos10.x, carpos10.y, carpos10.z, "[Cooldown] Vent 60 sekunder.", 3.0, 7)
			end
			end
			end
		end
	end
end)



RegisterNetEvent("kaz:refresh")
AddEventHandler("kaz:refresh", function()
	Citizen.Wait(0)
	TriggerServerEvent('kaz:getamount')
	Citizen.Wait(500)
	TriggerServerEvent('kaz:getprice', caramount)
	Citizen.Wait(500)
	 local veh1 = GetClosestVehicle(carpos1.x,carpos1.y,carpos1.z, 4.001, 0, 70)
		if DoesEntityExist(veh1) then
			DeleteEntity(veh1)
		end
	 local veh2 = GetClosestVehicle(carpos2.x,carpos2.y,carpos2.z, 4.001, 0, 70)
		if DoesEntityExist(veh2) then
			DeleteEntity(veh2)
		end
	 local veh3 = GetClosestVehicle(carpos3.x,carpos3.y,carpos3.z, 4.001, 0, 70)
		if DoesEntityExist(veh3) then
			DeleteEntity(veh3)
		end
	 local veh4 = GetClosestVehicle(carpos4.x,carpos4.y,carpos4.z, 4.001, 0, 70)
		if DoesEntityExist(veh4) then 
			DeleteEntity(veh4)
		end
	 local veh5 = GetClosestVehicle(carpos5.x,carpos5.y,carpos5.z, 4.001, 0, 70)
		if DoesEntityExist(veh5) then 
			DeleteEntity(veh5)
		end
	 local veh6 = GetClosestVehicle(carpos6.x,carpos6.y,carpos6.z, 4.001, 0, 70)
		if DoesEntityExist(veh6) then 
			DeleteEntity(veh6)
		end
	 local veh7 = GetClosestVehicle(carpos7.x,carpos7.y,carpos7.z, 4.001, 0, 70)
		if DoesEntityExist(veh7) then
			DeleteEntity(veh7)
		end
	 local veh8 = GetClosestVehicle(carpos8.x,carpos8.y,carpos8.z, 4.001, 0, 70)
		if DoesEntityExist(veh8) then
			DeleteEntity(veh8)
		end
	 local veh9 = GetClosestVehicle(carpos9.x,carpos9.y,carpos9.z, 4.001, 0, 70)
		if DoesEntityExist(veh9) then 
			DeleteEntity(veh9)
		end
	 local veh10 = GetClosestVehicle(carpos10.x,carpos10.y,carpos10.z, 4.001, 0, 70)
		if DoesEntityExist(veh10) then 
			DeleteEntity(veh10)
		end

	if caramount >= 1 then
        RequestModel(GetHashKey(carmodel))
        while not HasModelLoaded(GetHashKey(carmodel1)) do
            RequestModel(GetHashKey(carmodel1));
            Wait(50)
        end
        local vehicle1 = CreateVehicle(GetHashKey(carmodel1), carpos1.x, carpos1.y, carpos1.z, carpos1.h, false, false)
		SetVehicleCustomPrimaryColour(vehicle1, 255, 255, 255)
		SetVehicleCustomSecondaryColour(vehicle1, 255, 255, 255)
        FreezeEntityPosition(vehicle1,true)
    end
	if caramount >= 2 then
	RequestModel(GetHashKey(carmodel2));
        while not HasModelLoaded(GetHashKey(carmodel2)) do
            RequestModel(GetHashKey(carmodel2));
            Wait(50)
        end
        local vehicle2 = CreateVehicle(GetHashKey(carmodel2), carpos2.x, carpos2.y, carpos2.z, carpos2.h, false, false)
		SetVehicleCustomPrimaryColour(vehicle2, 255, 255, 255)
		SetVehicleCustomSecondaryColour(vehicle2, 255, 255, 255)
        FreezeEntityPosition(vehicle2,true)
    end
	if caramount >= 3 then 
	RequestModel(GetHashKey(carmodel3));
        while not HasModelLoaded(GetHashKey(carmodel3)) do
            RequestModel(GetHashKey(carmodel3));
            Wait(50)
        end
        local vehicle3 = CreateVehicle(GetHashKey(carmodel3), carpos3.x, carpos3.y, carpos3.z, carpos3.h, false, false)
		SetVehicleCustomPrimaryColour(vehicle3, 255, 255, 255)
		SetVehicleCustomSecondaryColour(vehicle3, 255, 255, 255)
        FreezeEntityPosition(vehicle3,true)
    end
	if caramount >= 4 then 
	RequestModel(GetHashKey(carmodel4));
        while not HasModelLoaded(GetHashKey(carmodel4)) do
            RequestModel(GetHashKey(carmodel4));
            Wait(50)
        end
        local vehicle4 = CreateVehicle(GetHashKey(carmodel4), carpos4.x, carpos4.y, carpos4.z, carpos4.h, false, false)
		SetVehicleCustomPrimaryColour(vehicle4, 255, 255, 255)
		SetVehicleCustomSecondaryColour(vehicle4, 255, 255, 255)
        FreezeEntityPosition(vehicle4,true)
    end
	if caramount >= 5 then 
	RequestModel(GetHashKey(carmodel5));
        while not HasModelLoaded(GetHashKey(carmodel5)) do
            RequestModel(GetHashKey(carmodel5));
            Wait(50)
        end
        local vehicle5 = CreateVehicle(GetHashKey(carmodel5), carpos5.x, carpos5.y, carpos5.z, carpos5.h, false, false)
		SetVehicleCustomPrimaryColour(vehicle5, 255, 255, 255)
		SetVehicleCustomSecondaryColour(vehicle5, 255, 255, 255)
        FreezeEntityPosition(vehicle5,true)
    end
	if caramount >= 6 then 
	RequestModel(GetHashKey(carmodel6));
        while not HasModelLoaded(GetHashKey(carmodel6)) do
            RequestModel(GetHashKey(carmodel6));
            Wait(50)
        end
        local vehicle6 = CreateVehicle(GetHashKey(carmodel6), carpos6.x, carpos6.y, carpos6.z, carpos6.h, false, false)
		SetVehicleCustomPrimaryColour(vehicle6, 255, 255, 255)
		SetVehicleCustomSecondaryColour(vehicle6, 255, 255, 255)
        FreezeEntityPosition(vehicle6,true)
    end
	if caramount >= 7 then 
	RequestModel(GetHashKey(carmodel7));
        while not HasModelLoaded(GetHashKey(carmodel7)) do
            RequestModel(GetHashKey(carmodel7));
            Wait(50)
        end
        local vehicle7 = CreateVehicle(GetHashKey(carmodel7), carpos7.x, carpos7.y, carpos7.z, carpos7.h, false, false)
		SetVehicleCustomPrimaryColour(vehicle7, 255, 255, 255)
		SetVehicleCustomSecondaryColour(vehicle7, 255, 255, 255)
        FreezeEntityPosition(vehicle7,true)
    end
	if caramount >= 8 then 
	RequestModel(GetHashKey(carmodel8));
        while not HasModelLoaded(GetHashKey(carmodel8)) do
            RequestModel(GetHashKey(carmodel8));
            Wait(50)
        end
        local vehicle8 = CreateVehicle(GetHashKey(carmodel8), carpos8.x, carpos8.y, carpos8.z, carpos8.h, false, false)
		SetVehicleCustomPrimaryColour(vehicle8, 255, 255, 255)
		SetVehicleCustomSecondaryColour(vehicle8, 255, 255, 255)
        FreezeEntityPosition(vehicle8,true)
    end
	if caramount >= 9 then
	RequestModel(GetHashKey(carmodel9));
        while not HasModelLoaded(GetHashKey(carmodel9)) do
            RequestModel(GetHashKey(carmodel9));
            Wait(50)
        end
        local vehicle9 = CreateVehicle(GetHashKey(carmodel9), carpos9.x, carpos9.y, carpos9.z, carpos9.h, false, false)
		SetVehicleCustomPrimaryColour(vehicle9, 255, 255, 255)
		SetVehicleCustomSecondaryColour(vehicle9, 255, 255, 255)
        FreezeEntityPosition(vehicle9,true)
    end
	if caramount >= 10 then
	RequestModel(GetHashKey(carmodel10));
        while not HasModelLoaded(GetHashKey(carmodel10)) do
            RequestModel(GetHashKey(carmodel10));
            Wait(50)
        end
        local vehicle10 = CreateVehicle(GetHashKey(carmodel10), carpos10.x, carpos10.y, carpos10.z, carpos10.h, false, false)
		SetVehicleCustomPrimaryColour(vehicle10, 255, 255, 255)
		SetVehicleCustomSecondaryColour(vehicle10, 255, 255, 255)
        FreezeEntityPosition(vehicle10,true)
    end
end)

RegisterNetEvent("kaz:setamount")
AddEventHandler("kaz:setamount", function(caramount1)
caramount = tonumber(caramount1)
end)

RegisterNetEvent("kaz:timeout")
AddEventHandler("kaz:timeout", function()
timeout = true
Citizen.Wait(60000)
timeout = false
end)




RegisterNUICallback('cc', function(data, cb) 
for k,v in pairs(data) do
	if k == "salgspris" then
		pris = v
	end
	if k == "salgstale" then
		tale = v
	end
	if k == "seller" then
	seller = v
	end
	end
	veh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		if(GetPedInVehicleSeat(veh, -1) == GetPlayerPed(-1))then
			local ok, vtype, name = vRP.getNearestOwnedVehicle({7})
			if ok then
				if vtype ~= nil and name ~= nil then 
					if caramount == 10 then 
						TriggerEvent("pNotify:SendNotification",{text = "Der er allerede 10 køretøjer til salg!",type = "success",timeout = (8500),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
					else
						TriggerServerEvent('kaz:info', pris, tale, seller, vtype, name)									
					end
				else
					TriggerEvent("pNotify:SendNotification",{text = "Du skal komme med dit eget køretøj!",type = "success",timeout = (8500),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
				end
			else
				TriggerEvent("pNotify:SendNotification",{text = "Du skal komme med dit eget køretøj!",type = "success",timeout = (8500),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
			end
		else
			TriggerEvent("pNotify:SendNotification",{text = "Du er ikke i et køretøj.",type = "success",timeout = (8500),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
		end
end )


RegisterNUICallback('closeButton', function(data, cb)
	killTutorialMenu()
  	cb('ok')
end)

RegisterNUICallback('buyButton', function(data, cb)
if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), carpos1.x, carpos1.y, carpos1.z, true ) <= 1 then
	if timeout == false then 
		TriggerServerEvent('kaz:kobbil', carmodel1, nsellerid1, npris1)
		TriggerEvent("hp:deletevehicle", player)
	else
		TriggerEvent("pNotify:SendNotification",{text = "Cooldown igang.",type = "success",timeout = (8500),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
	end
elseif GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), carpos2.x, carpos2.y, carpos2.z, true ) <= 1 then
	if timeout == false then 
		TriggerServerEvent('kaz:kobbil', carmodel2, nsellerid2, npris2)
		TriggerEvent("hp:deletevehicle", player)
	else
		TriggerEvent("pNotify:SendNotification",{text = "Cooldown igang.",type = "success",timeout = (8500),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
	end
elseif GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), carpos3.x, carpos3.y, carpos3.z, true ) <= 1 then
	if timeout == false then 
		TriggerServerEvent('kaz:kobbil', carmodel3, nsellerid3, npris3)
		TriggerEvent("hp:deletevehicle", player)
	else
		TriggerEvent("pNotify:SendNotification",{text = "Cooldown igang.",type = "success",timeout = (8500),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
	end
elseif GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), carpos4.x, carpos4.y, carpos4.z, true ) <= 1 then
	if timeout == false then 
		TriggerServerEvent('kaz:kobbil', carmodel4, nsellerid4, npris4)
		TriggerEvent("hp:deletevehicle", player)
	else
		TriggerEvent("pNotify:SendNotification",{text = "Cooldown igang.",type = "success",timeout = (8500),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
	end
elseif GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), carpos5.x, carpos5.y, carpos5.z, true ) <= 1 then
	if timeout == false then 
		TriggerServerEvent('kaz:kobbil', carmodel5, nsellerid5, npris5)
		TriggerEvent("hp:deletevehicle", player)
	else
		TriggerEvent("pNotify:SendNotification",{text = "Cooldown igang.",type = "success",timeout = (8500),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
	end
elseif GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), carpos6.x, carpos6.y, carpos6.z, true ) <= 1 then
	if timeout == false then 
		TriggerServerEvent('kaz:kobbil', carmodel6, nsellerid6, npris6)
		TriggerEvent("hp:deletevehicle", player)
	else
		TriggerEvent("pNotify:SendNotification",{text = "Cooldown igang.",type = "success",timeout = (8500),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
	end
elseif GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), carpos7.x, carpos7.y, carpos7.z, true ) <= 1 then
	if timeout == false then 
		TriggerServerEvent('kaz:kobbil', carmodel7, nsellerid7, npris7)
		TriggerEvent("hp:deletevehicle", player)
	else
		TriggerEvent("pNotify:SendNotification",{text = "Cooldown igang.",type = "success",timeout = (8500),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
	end
elseif GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), carpos8.x, carpos8.y, carpos8.z, true ) <= 1 then
	if timeout == false then 
		TriggerServerEvent('kaz:kobbil', carmodel8, nsellerid8, npris8)
		TriggerEvent("hp:deletevehicle", player)
	else
		TriggerEvent("pNotify:SendNotification",{text = "Cooldown igang.",type = "success",timeout = (8500),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
	end
elseif GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), carpos9.x, carpos9.y, carpos9.z, true ) <= 1 then
	if timeout == false then 
		TriggerServerEvent('kaz:kobbil', carmodel9, nsellerid9, npris9)
		TriggerEvent("hp:deletevehicle", player)
	else
		TriggerEvent("pNotify:SendNotification",{text = "Cooldown igang.",type = "success",timeout = (8500),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
	end
elseif GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), carpos10.x, carpos10.y, carpos10.z, true ) <= 1 then
	if timeout == false then 
		TriggerServerEvent('kaz:kobbil', carmodel10, nsellerid10, npris10)
		TriggerEvent("hp:deletevehicle", player)
	else
		TriggerEvent("pNotify:SendNotification",{text = "Cooldown igang.",type = "success",timeout = (8500),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
	end
else
	TriggerEvent("pNotify:SendNotification",{text = "Intet køretøj valgt.",type = "success",timeout = (8500),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
end
end)



function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())

    SetTextScale(0.32, 0.32)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 80)
end



function vehSR_drawTxt(text,font,centre,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x , y)
end


