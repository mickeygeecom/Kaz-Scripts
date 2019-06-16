-- Script by: 🅚🅐🅩🅞🅞🅝 --

-- Mastermind -- (test + mangler animation til overlevering)
local mm = cfg.mm
local key = cfg.key
local viruskobt = false
local pris = cfg.pris

Citizen.CreateThread(function()
    RequestModel(GetHashKey("cs_bankman"))
    while not HasModelLoaded(GetHashKey("cs_bankman")) do
        Wait(1)
    end
    local caseyped =  CreatePed(4, 0x9760192e, mm.x,mm.y,mm.z,235.36206054688, false, true)
    SetEntityHeading(caseyped, 235.36206054688)
    FreezeEntityPosition(caseyped, true)
    SetEntityInvincible(caseyped, true)
    SetBlockingOfNonTemporaryEvents(caseyped, true)
	while true do 
		Citizen.Wait(0)
		if IsControlJustPressed(1, key) then
			if viruskobt == true then
				RequestAnimDict("mp_common")
				TaskPlayAnim(caseyped,"mp_common","givetake1_a",100.0, 200.0, 0.3, 120, 0.2, 0, 0, 0)
				Wait(750)
				StopAnimTask(caseyped, "mp_common","givetake1_a", 1.0)
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
	Citizen.Wait(0)
			if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), mm.x, mm.y, mm.z, true ) < 5 then
				if viruskobt == true then 
					DrawText3Ds(mm.x,mm.y,mm.z+1.25, "~w~[Cooldown] Vent venligst 10 sekunder!", 3.0, 7)
				elseif viruskobt == false then
					DrawText3Ds(mm.x,mm.y,mm.z+1.25, "~w~Tryk ~g~[E]~w~ for at købe virussen. Pris: "..pris.." kr.", 3.0, 7)	
						if IsControlJustPressed(1, key) then
							TriggerServerEvent('kaz:virus', pris) -- KØB Koden
							viruskobt = true
							TriggerEvent('kaz:viruskobt')
							local spiller = PlayerPedId()
							RequestAnimDict("mp_common")
								while (not HasAnimDictLoaded("mp_common")) do 
								Citizen.Wait(0)
								end
							TaskPlayAnim(spiller,"mp_common","givetake1_a",100.0, 200.0, 0.3, 120, 0.2, 0, 0, 0)
							Wait(750)
							StopAnimTask(spiller, "mp_common","givetake1_a", 1.0)
						end	
				end
			end	
	end
end)

AddEventHandler('kaz:viruskobt', function()
   if viruskobt == true then
   Citizen.Wait(10000)
   viruskobt = false
   end
end)

-- Svejser stjæling -- (mangler test + animation)
local svej = cfg.svej
local svejsteal = false

Citizen.CreateThread(function()
	while true do
	Citizen.Wait(0)
			if svejsteal == false then 
				if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), svej.x, svej.y, svej.z, true ) < 5 then
					DrawMarker(27,svej.x-0.5, svej.y, svej.z-0.9,0,0,0,0,0,Rotation,1.501,1.5001,0.5001,255,0,0,200,0,0,0,true)
					DrawText3Ds(svej.x-0.5,svej.y,svej.z, "~w~Tryk ~g~[E]~w~ for at stjæle skære brænder.", 3.0, 7)
						if IsControlJustPressed(1, key) then
							TriggerServerEvent('kaz:svej')
							svejsteal = true
							TriggerEvent('kaz:svejsteal')
							local spiller = PlayerPedId()
							TaskStartScenarioInPlace(spiller, "PROP_HUMAN_PARKING_METER")
							FreezeEntityPosition(spiller,true)							
						end
				elseif GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), svej.x, svej.y, svej.z, true ) < 40 then
					DrawMarker(27,svej.x-0.5, svej.y, svej.z-0.9,0,0,0,0,0,Rotation,1.501,1.5001,0.5001,255,0,0,200,0,0,0,true)		
				end
			elseif svejsteal == true then 
				if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), svej.x, svej.y, svej.z, true ) < 5 then
					DrawMarker(27,svej.x-0.5, svej.y, svej.z-0.9,0,0,0,0,0,Rotation,1.501,1.5001,0.5001,255,0,0,200,0,0,0,true)
					DrawText3Ds(svej.x-0.5,svej.y,svej.z, "~w~[Cooldown] Vent venligst 60 sekunder!", 3.0, 7)	
				elseif GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), svej.x, svej.y, svej.z, true ) < 40 then
					DrawMarker(27,svej.x-0.5, svej.y, svej.z-0.9,0,0,0,0,0,Rotation,1.501,1.5001,0.5001,255,0,0,200,0,0,0,true)
				end
			end	
	end
end)

AddEventHandler('kaz:svejsteal', function()
local spiller = PlayerPedId()
   if svejsteal == true then
   Citizen.Wait(60000)
   FreezeEntityPosition(spiller,false)
   ClearPedTasksImmediately(spiller)
   svejsteal = false
   end
end)

-- Røveri --
local banks = cfg.banks
local banko = nil
local banknr = nil
local terminal = nil
local harbetalt = false								
local locked = false
local korrekthack = false
local Speed = cfg.Speed
local secondsRemaining = cfg.seconds
local robcircles = false
local lokalkey = 0
local doorstate = false
local door = false

local circle1done = false
local circle2done = false
local circle3done = false
local circle4done = false
local circle5done = false
local circle6done = false
local circle7done = false

RegisterNetEvent('unlock:gate')
AddEventHandler('unlock:gate', function()
Citizen.Wait(500)
TriggerEvent("pNotify:SendNotification",{text = "Terminalen blev låst op.",type = "success",timeout = (8500),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
locked = false 
end)

RegisterNetEvent('kaz:betalt')
AddEventHandler('kaz:betalt', function(havepayed)
harbetalt = havepayed
end)

Citizen.CreateThread(function()
	while true do
	local pos = GetEntityCoords(GetPlayerPed(-1), true)
	Citizen.Wait(0)
		local PlayerPos = pos
		for k,v in pairs(banks)do
			local pos2 = v.position
			if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 75.0)then
				banko = v.banko
				banknr = v.banknr
				Terminal = v.terminal
				placering = v.position
				local spiller = GetEntityCoords(PlayerPedId())
				TriggerServerEvent('kaz:doortype', banknr, spiller)
					if VaultDoor ~= nil and VaultDoor ~= 0 then
						FreezeEntityPosition(VaultDoor, true)
					end
					if VaultDoor2 ~= nil and VaultDoor2 ~= 0 then
						FreezeEntityPosition(VaultDoor2, true)
					end
			end
		end
	if korrekthack == true then 
		drawTxt("~w~Tryk ~g~[E]~w~ for at åbne/lukke boksen. ~n~ ~w~Tryk ~g~[K] ~w~for at afslutte.",0,1,0.5,0.92,0.6,255,255,255,255)
			if IsControlJustPressed(1, 311) then
				FreezeEntityPosition(GetPlayerPed(-1),false)
				korrekthack = false
				locked = false
			end
										local CurrentHeading = GetEntityHeading(VaultDoor)
											if round(CurrentHeading, 1) == 158.7 then
												CurrentHeading = CurrentHeading - 0.1
											end
											if VaultDoor ~= nil then
												FreezeEntityPosition(VaultDoor, true)
											end
											if banknr == 7 then 										
													if CurrentHeading >= 200 then
														if IsControlJustPressed(1, key) then
															doorstate = false
															local spiller = GetEntityCoords(PlayerPedId())
															TriggerServerEvent('key:pressed', banknr, doorstate, spiller)
															end
													elseif CurrentHeading <= 200 then 
														if IsControlJustPressed(1, key) then
															doorstate = true
															local spiller = GetEntityCoords(PlayerPedId())
															TriggerServerEvent('key:pressed', banknr, doorstate, spiller)
															end
													end					
											elseif banknr == 6 then
												if round(CurrentHeading, 1) == 160.0 then
													if IsControlJustPressed(1, key) then
															doorstate = true
															local spiller = GetEntityCoords(PlayerPedId())
															TriggerServerEvent('key:pressed', banknr, doorstate, spiller)
													end
												end
												if round(CurrentHeading, 1) == 0.0 then
													if IsControlJustPressed(1, key) then
															doorstate = false
															local spiller = GetEntityCoords(PlayerPedId())
															TriggerServerEvent('key:pressed', banknr, doorstate, spiller)
													end
												end	
											elseif banknr == 5 then 							
													if CurrentHeading >= 200 then
														if IsControlJustPressed(1, key) then
															doorstate = true
															local spiller = GetEntityCoords(PlayerPedId())
															TriggerServerEvent('key:pressed', banknr, doorstate, spiller) 
															end
													elseif CurrentHeading <= 200 then 
														if IsControlJustPressed(1, key) then
															doorstate = false
															local spiller = GetEntityCoords(PlayerPedId())
															TriggerServerEvent('key:pressed', banknr, doorstate, spiller)
															end
													end						
											elseif banknr == 4 then 							
													if CurrentHeading >= 250 then
														if IsControlJustPressed(1, key) then
															doorstate = true
															local spiller = GetEntityCoords(PlayerPedId())
															TriggerServerEvent('key:pressed', banknr, doorstate, spiller)
															end
													elseif CurrentHeading <= 250 then 
														if IsControlJustPressed(1, key) then
															doorstate = false
															local spiller = GetEntityCoords(PlayerPedId())
															TriggerServerEvent('key:pressed', banknr, doorstate, spiller)
															end
													end	
											elseif banknr == 3 then 							
													if CurrentHeading <= 100 then
														if IsControlJustPressed(1, key) then
															doorstate = true
															local spiller = GetEntityCoords(PlayerPedId())
															TriggerServerEvent('key:pressed', banknr, doorstate, spiller)
															end
													elseif CurrentHeading >= 100 then 
														if IsControlJustPressed(1, key) then
															doorstate = false
															local spiller = GetEntityCoords(PlayerPedId())
															TriggerServerEvent('key:pressed', banknr, doorstate, spiller)
															end
													end
											elseif banknr == 2 then 							
													if CurrentHeading <= 300 then
														if IsControlJustPressed(1, key) then
															doorstate = false
															local spiller = GetEntityCoords(PlayerPedId())
															TriggerServerEvent('key:pressed', banknr, doorstate, spiller)
															end
													elseif CurrentHeading >= 300 then 
														if IsControlJustPressed(1, key) then
															doorstate = true
															local spiller = GetEntityCoords(PlayerPedId())
															TriggerServerEvent('key:pressed', banknr, doorstate, spiller)
															end
													end
											elseif banknr == 1 then 							
													if CurrentHeading <= 200 then
														if IsControlJustPressed(1, key) then
															doorstate = false
															local spiller = GetEntityCoords(PlayerPedId())
															TriggerServerEvent('key:pressed', banknr, doorstate, spiller)
														end
													elseif CurrentHeading >= 200 then 
														if IsControlJustPressed(1, key) then
															doorstate = true
															local spiller = GetEntityCoords(PlayerPedId())
															TriggerServerEvent('key:pressed', banknr, doorstate, spiller)
														end															
													end
											end
	end
		if Terminal ~= nil then
			if locked == true then
				if Vdist(PlayerPos.x, PlayerPos.y, PlayerPos.z, Terminal.x, Terminal.y, Terminal.z) < 17.0 then
					DrawText3Ds(Terminal.x,Terminal.y,Terminal.z, "~r~Terminal slået fra.", 3.0, 7)
				end
			else
				if Vdist(PlayerPos.x, PlayerPos.y, PlayerPos.z, Terminal.x, Terminal.y, Terminal.z) < 2.0 then
					if harbetalt == false then
						DrawText3Ds(Terminal.x,Terminal.y,Terminal.z, "~w~Tryk ~g~[E]~w~ for at installere virussen.", 3.0, 7)
						DrawMarker(27, placering.x, placering.y, placering.z - 1, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 1.5001, 1555, 0, 0,255, 0, 0, 0,0)
						if IsControlJustPressed(1, 38) then
							harbetalt = true
							TriggerServerEvent('kaz:levvirus')
						end
					elseif harbetalt == true then 
						DrawText3Ds(Terminal.x,Terminal.y,Terminal.z, "~w~Tryk ~g~[E]~w~ at starte hacking.", 3.0, 7)
						DrawMarker(27, placering.x, placering.y, placering.z - 1, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 1.5001, 1555, 0, 0,255, 0, 0, 0,0)
							if IsControlJustPressed(1, 38) then
								TriggerEvent("mhacking:show")
								TriggerEvent("mhacking:start",6,40,mycb)
								locked = true
								harbetalt = false
								FreezeEntityPosition(GetPlayerPed(-1),true)	
							end
					end
				elseif Vdist(PlayerPos.x, PlayerPos.y, PlayerPos.z, Terminal.x, Terminal.y, Terminal.z) < 40.0 then	
						DrawMarker(27, placering.x, placering.y, placering.z - 1, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 1.5001, 1555, 0, 0,255, 0, 0, 0,0)
				end
			end
		end	
	if robbing then
	local ped = GetPlayerPed(-1)
	local pos2 = banks[banko].position
	bank_drawTxt(0.515, 1.43, 1.0,1.0,0.3, "Døren lukker om: ~r~" .. secondsRemaining .. " sekunder. ~w~ Kom ud inden!", 255, 255, 255, 255)
		if secondsRemaining == 0 then 
			TriggerServerEvent('kaz:tid',secondsRemaining)
			secondsRemaining = -1
		elseif secondsRemaining == -1 then
		end	
		if IsEntityDead(ped) then
			TriggerServerEvent('es_bank:playerdied', banko)
		elseif (Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) > 50)then
			TriggerServerEvent('es_bank:toofar', banko)
		end
	end
	if robcircles == true then
					local amount = banks[banko].amount
						if amount >= 1 then
							if circle1done == false then
								local cp1 = banks[banko].circle1
								DrawMarker(27, cp1.x, cp1.y, cp1.z, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 1.5001, 1555, 0, 0,255, 0, 0, 0,0)
									if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), cp1.x, cp1.y, cp1.z+1, true ) < 0.2 then
										DrawText3Ds(cp1.x,cp1.y,cp1.z+1, "~w~Tryk ~g~[E]~w~ for at skære.", 3.0, 7)
											if IsControlJustReleased(1, key) then
												TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_WELDING")
												FreezeEntityPosition(GetPlayerPed(-1),true)
												circledone = 1
												isdoing = 1
												TriggerServerEvent('kaz:hammerbore', circledone)
												circle1done = true
											end
									end	
							end
						end
						if amount >= 2 then
							if circle2done == false then
								local cp2 = banks[banko].circle2
								DrawMarker(27, cp2.x, cp2.y, cp2.z, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 1.5001, 1555, 0, 0,255, 0, 0, 0,0)
									if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), cp2.x, cp2.y, cp2.z+1, true ) < 0.2 then
										DrawText3Ds(cp2.x,cp2.y,cp2.z+1, "~w~Tryk ~g~[E]~w~ for at skære.", 3.0, 7)
											if IsControlJustReleased(1, key) then
												TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_WELDING")
												FreezeEntityPosition(GetPlayerPed(-1),true)
												circledone = 2
												isdoing = 2
												TriggerServerEvent('kaz:hammerbore', circledone)
												circle2done = true
											end
									end	
							end
						end
						if amount >= 3 then
							if circle3done == false then
								local cp3 = banks[banko].circle3
								DrawMarker(27, cp3.x, cp3.y, cp3.z, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 1.5001, 1555, 0, 0,255, 0, 0, 0,0)
									if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), cp3.x, cp3.y, cp3.z+1, true ) < 0.2 then
										DrawText3Ds(cp3.x,cp3.y,cp3.z+1, "~w~Tryk ~g~[E]~w~ for at skære.", 3.0, 7)
											if IsControlJustReleased(1, key) then
												TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_WELDING")
												FreezeEntityPosition(GetPlayerPed(-1),true)
												circledone = 3
												isdoing = 3
												TriggerServerEvent('kaz:hammerbore', circledone)
												circle3done = true
											end
									end	
							end
						end
						if amount >= 4 then
							if circle4done == false then
								local cp4 = banks[banko].circle4
								DrawMarker(27, cp4.x, cp4.y, cp4.z, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 1.5001, 1555, 0, 0,255, 0, 0, 0,0)
									if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), cp4.x, cp4.y, cp4.z+1, true ) < 0.2 then
										DrawText3Ds(cp4.x,cp4.y,cp4.z+1, "~w~Tryk ~g~[E]~w~ for at skære.", 3.0, 7)
											if IsControlJustReleased(1, key) then
												TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_WELDING")
												FreezeEntityPosition(GetPlayerPed(-1),true)
												circledone = 4
												isdoing = 4
												TriggerServerEvent('kaz:hammerbore', circledone)
												circle4done = true
											end
									end	
							end
						end
						if amount >= 5 then
							if circle5done == false then
								local cp5 = banks[banko].circle5
								DrawMarker(27, cp5.x, cp5.y, cp5.z, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 1.5001, 1555, 0, 0,255, 0, 0, 0,0)
									if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), cp5.x, cp5.y, cp5.z+1, true ) < 0.2 then
										DrawText3Ds(cp5.x,cp5.y,cp5.z+1, "~w~Tryk ~g~[E]~w~ for at skære.", 3.0, 7)
											if IsControlJustReleased(1, key) then
												TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_WELDING")
												FreezeEntityPosition(GetPlayerPed(-1),true)
												circledone = 5
												isdoing = 5
												TriggerServerEvent('kaz:hammerbore', circledone)
												circle5done = true
											end
									end	
							end
						end
						if amount >= 6 then
							if circle6done == false then
								local cp6 = banks[banko].circle6
								DrawMarker(27, cp6.x, cp6.y, cp6.z, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 1.5001, 1555, 0, 0,255, 0, 0, 0,0)
									if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), cp6.x, cp6.y, cp6.z+1, true ) < 0.2 then
										DrawText3Ds(cp6.x,cp6.y,cp6.z+1, "~w~Tryk ~g~[E]~w~ for at skære.", 3.0, 7)
											if IsControlJustReleased(1, key) then
												TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_WELDING")
												FreezeEntityPosition(GetPlayerPed(-1),true)
												circledone = 6
												isdoing = 6
												TriggerServerEvent('kaz:hammerbore', circledone)
												circle6done = true
											end
									end	
							end
						end
						if amount >= 7 then
							if circle7done == false then
								local cp7 = banks[banko].circle7
								DrawMarker(27, cp7.x, cp7.y, cp7.z, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 1.5001, 1555, 0, 0,255, 0, 0, 0,0)
									if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), cp7.x, cp7.y, cp7.z+1, true ) < 0.2 then
										DrawText3Ds(cp7.x,cp7.y,cp7.z+1, "~w~Tryk ~g~[E]~w~ for at skære.", 3.0, 7)
											if IsControlJustReleased(1, key) then
												TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_WELDING")
												FreezeEntityPosition(GetPlayerPed(-1),true)
												circledone = 7
												isdoing = 7
												TriggerServerEvent('kaz:hammerbore', circledone)
												circle7done = true
											end
									end	
							end
						end					
					end
	end
end)

function mycb(success, timeremaining)
	if success then
		TriggerEvent('hacking:success')
		TriggerEvent('mhacking:hide')
		TriggerServerEvent('es_bank:rob', banko)
		TriggerServerEvent('kaz:circlesnew') 
		korrekthack = true
	else
		TriggerEvent('mhacking:hide')
		FreezeEntityPosition(GetPlayerPed(-1),false)	
		locked = false
	end
end



RegisterNetEvent('kaz:doorstate')
AddEventHandler('kaz:doorstate', function(doorstate1, banknum, spiller1)
doorstate = doorstate1
local banknum = banknum 
local spiller2 = spiller1
		while true do
		local CurrentHeading = GetEntityHeading(VaultDoor)
		Citizen.Wait(0)
		spiller2 = spiller1
		spiller3 = PlayerPedId()
	if round(CurrentHeading, 1) == 158.7 then
		CurrentHeading = CurrentHeading - 0.1
	end
			if GetDistanceBetweenCoords(spiller2, GetEntityCoords(spiller3), true ) < 50 then
				if door == false then
					if doorstate == true then
						if banknum == 7 then
							while CurrentHeading <= 350 do
								Citizen.Wait(0)
								SetEntityHeading(VaultDoor, round(CurrentHeading, 1) - Speed)
								CurrentHeading = GetEntityHeading(VaultDoor)
							end
							if CurrentHeading > 350 then 
								door = true 
							end
						elseif banknum == 6 then
							while round(CurrentHeading, 1) ~= 0.0 do 
								Citizen.Wait(0)
								SetEntityHeading(VaultDoor, round(CurrentHeading, 1) - Speed)
								CurrentHeading = GetEntityHeading(VaultDoor)
							end
							if CurrentHeading < 155.0 then 
								door = true
							end
						elseif banknum == 5 then
							while CurrentHeading >= 149 do
								Citizen.Wait(0)
								SetEntityHeading(VaultDoor, round(CurrentHeading, 1) - Speed)
								CurrentHeading = GetEntityHeading(VaultDoor)
							end
							if CurrentHeading < 149 then 
								door = true
							end
						elseif banknum == 4 then
							while CurrentHeading >= 196 do
								Citizen.Wait(0)
								SetEntityHeading(VaultDoor, round(CurrentHeading, 1) - Speed)
								CurrentHeading = GetEntityHeading(VaultDoor)
							end
							if CurrentHeading < 196 then 
								door = true
							end
						elseif banknum == 3 then
							while CurrentHeading <= 145 do
								Citizen.Wait(0)
								SetEntityHeading(VaultDoor, round(CurrentHeading, 1) + Speed)
								CurrentHeading = GetEntityHeading(VaultDoor)
							end
							if CurrentHeading > 145 then 
								door = true
							end
						elseif banknum == 2 then
							while CurrentHeading >= 257 do
								Citizen.Wait(0)
								SetEntityHeading(VaultDoor, round(CurrentHeading, 1) - Speed)
								CurrentHeading = GetEntityHeading(VaultDoor)
							end
							if CurrentHeading < 257 then 
								door = true
							end
						elseif banknum == 1 then
							while CurrentHeading ~= 149 do
								Citizen.Wait(0)
								SetEntityHeading(VaultDoor, round(CurrentHeading, 1) - Speed)
								CurrentHeading = GetEntityHeading(VaultDoor)
							end
							if CurrentHeading == 149 then 
								door = true
							end
						end
					end
				 elseif door == true then 
					if doorstate == false then 
						if banknum == 7 then
							while CurrentHeading ~= 90 do
								Citizen.Wait(0)
								SetEntityHeading(VaultDoor, round(CurrentHeading, 1) + Speed)
								CurrentHeading = GetEntityHeading(VaultDoor)
							end
							if CurrentHeading == 90 then 
								door = false 
							end
						elseif banknum == 6 then
							while round(CurrentHeading, 1) ~= 160.0 do 
								Citizen.Wait(0)
								SetEntityHeading(VaultDoor, round(CurrentHeading, 1) + Speed)
								CurrentHeading = GetEntityHeading(VaultDoor)
							end
							if CurrentHeading > 5 then 
								door = false 
							end
						elseif banknum == 5 then
							while CurrentHeading <= 249 do
								Citizen.Wait(0)
								SetEntityHeading(VaultDoor, round(CurrentHeading, 1) + Speed)
								CurrentHeading = GetEntityHeading(VaultDoor)
							end
							if CurrentHeading > 249 then 
								door = false 
							end
						elseif banknum == 4 then
							while CurrentHeading <= 296 do
								Citizen.Wait(0)
								SetEntityHeading(VaultDoor, round(CurrentHeading, 1) + Speed)
								CurrentHeading = GetEntityHeading(VaultDoor)
							end
							if CurrentHeading > 296 then 
								door = false 
							end
						elseif banknum == 3 then
							while CurrentHeading >= 46 do
								Citizen.Wait(0)
								SetEntityHeading(VaultDoor, round(CurrentHeading, 1) - Speed)
								CurrentHeading = GetEntityHeading(VaultDoor)
							end
							if CurrentHeading < 46 then 
								door = false 
							end
						elseif banknum == 2 then
							while CurrentHeading <= 357 do
								Citizen.Wait(0)
								SetEntityHeading(VaultDoor, round(CurrentHeading, 1) + Speed)
								CurrentHeading = GetEntityHeading(VaultDoor)
							end
							if CurrentHeading > 357 then 
								door = false 
							end
						elseif banknum == 1 then
							while CurrentHeading ~= 249 do
								Citizen.Wait(0)
								SetEntityHeading(VaultDoor, round(CurrentHeading, 1) + Speed)
								CurrentHeading = GetEntityHeading(VaultDoor)
							end
							if CurrentHeading == 249 then 
								door = false
							end
						end
					end
				end 
			end	
		end	
end)

RegisterNetEvent('kaz:doortype2')
AddEventHandler('kaz:doortype2', function(banknr, spiller1)
local PlayerPos = GetEntityCoords(PlayerPedId(), true)
spiller2 = spiller1
spiller3 = PlayerPedId()
		if GetDistanceBetweenCoords(spiller2, GetEntityCoords(spiller3), true ) < 50 then
			if banknr == 7 then
			Terminal = cfg.terminal7
			VaultDoor = GetClosestObjectOfType(PlayerPos.x, PlayerPos.y, PlayerPos.z, 100.0, 2121050683, 0, 0, 0)
			elseif banknr == 6 then
			Terminal = cfg.terminal6
			VaultDoor = GetClosestObjectOfType(PlayerPos.x, PlayerPos.y, PlayerPos.z, 100.0, 961976194, 0, 0, 0)
			elseif banknr == 5 then
			Terminal = cfg.terminal5
			VaultDoor = GetClosestObjectOfType(PlayerPos.x, PlayerPos.y, PlayerPos.z, 100.0, 2121050683, 0, 0, 0)
			elseif banknr == 4 then
			Terminal = cfg.terminal4
			VaultDoor = GetClosestObjectOfType(PlayerPos.x, PlayerPos.y, PlayerPos.z, 100.0, 2121050683, 0, 0, 0)
			elseif banknr == 3 then
			Terminal = cfg.terminal3
			VaultDoor = GetClosestObjectOfType(PlayerPos.x, PlayerPos.y, PlayerPos.z, 100.0, 1622278560, 0, 0, 0)
			elseif banknr == 2 then
			Terminal = cfg.terminal2
			VaultDoor = GetClosestObjectOfType(PlayerPos.x, PlayerPos.y, PlayerPos.z, 100.0, -63539571, 0, 0, 0)
			elseif banknr == 1 then
			Terminal = cfg.terminal1
			VaultDoor = GetClosestObjectOfType(PlayerPos.x, PlayerPos.y, PlayerPos.z, 100.0, 2121050683, 0, 0, 0)
			end
		elseif GetDistanceBetweenCoords(spiller2, GetEntityCoords(spiller3), true ) > 50 then
			if banknr == 7 then
			VaultDoor2 = GetClosestObjectOfType(PlayerPos.x, PlayerPos.y, PlayerPos.z, 100.0, 2121050683, 0, 0, 0)
			elseif banknr == 6 then
			VaultDoor2 = GetClosestObjectOfType(PlayerPos.x, PlayerPos.y, PlayerPos.z, 100.0, 961976194, 0, 0, 0)
			elseif banknr == 5 then
			VaultDoor2 = GetClosestObjectOfType(PlayerPos.x, PlayerPos.y, PlayerPos.z, 100.0, 2121050683, 0, 0, 0)
			elseif banknr == 4 then
			VaultDoor2 = GetClosestObjectOfType(PlayerPos.x, PlayerPos.y, PlayerPos.z, 100.0, 2121050683, 0, 0, 0)
			elseif banknr == 3 then
			VaultDoor2 = GetClosestObjectOfType(PlayerPos.x, PlayerPos.y, PlayerPos.z, 100.0, 1622278560, 0, 0, 0)
			elseif banknr == 2 then
			VaultDoor2 = GetClosestObjectOfType(PlayerPos.x, PlayerPos.y, PlayerPos.z, 100.0, -63539571, 0, 0, 0)
			elseif banknr == 1 then
			VaultDoor2 = GetClosestObjectOfType(PlayerPos.x, PlayerPos.y, PlayerPos.z, 100.0, 2121050683, 0, 0, 0)
			end
		end
banknur = banknr
end)
	
function round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end

RegisterNetEvent('kaz:reset')
AddEventHandler('kaz:reset', function()
circle1done = false
circle2done = false
circle3done = false
circle4done = false
circle5done = false
circle6done = false
circle7done = false
secondsRemaining = 0
doorsoff = 0
robcircles = false
end)

RegisterNetEvent('es_bank:currentlyrobbing')
AddEventHandler('es_bank:currentlyrobbing', function(robb)
	robbing = true
	secondsRemaining = cfg.seconds
end)

Citizen.CreateThread(function()
	while true do
		if robbing then
			Citizen.Wait(1000)
			if(secondsRemaining > 0)then
				secondsRemaining = secondsRemaining - 1
			end
			end
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('kaz:tiden')
AddEventHandler('kaz:tiden', function(doorsoff1)
locked = true
local CurrentHeading = GetEntityHeading(VaultDoor)
	if round(CurrentHeading, 1) == 158.7 then
		CurrentHeading = CurrentHeading - 0.1
	end
					if banknur == 7 then 							
						if CurrentHeading >= 200 then
							while CurrentHeading ~= 90 do -- <= 200, <=350
							Citizen.Wait(0)
							SetEntityHeading(VaultDoor, round(CurrentHeading, 1) + Speed)
							CurrentHeading = GetEntityHeading(VaultDoor)
							end
						end					
					elseif banknur == 6 then
							while round(CurrentHeading, 1) ~= 160.0 do -- 160.0
							Citizen.Wait(0)
							SetEntityHeading(VaultDoor, round(CurrentHeading, 1) + Speed)
							CurrentHeading = GetEntityHeading(VaultDoor)
							end	
					elseif banknur == 5 then 							
						if CurrentHeading <= 200 then -- <=200, <= 249 (start: >=200, >=149)
							while CurrentHeading <= 249 do
							Citizen.Wait(0)
							SetEntityHeading(VaultDoor, round(CurrentHeading, 1) + Speed)
							CurrentHeading = GetEntityHeading(VaultDoor)
							end
						end						
					elseif banknur == 4 then 							
						if CurrentHeading <= 250 then -- <=250, <=296
							while CurrentHeading <= 296 do
							Citizen.Wait(0)
							SetEntityHeading(VaultDoor, round(CurrentHeading, 1) + Speed)
							CurrentHeading = GetEntityHeading(VaultDoor)
							end
						end	
					elseif banknur == 3 then 							
						if CurrentHeading >= 100 then  -- >=100, <= 46
							while CurrentHeading >= 46 do
								Citizen.Wait(0)
								SetEntityHeading(VaultDoor, round(CurrentHeading, 1) - Speed)
								CurrentHeading = GetEntityHeading(VaultDoor)
								end
							end
					elseif banknur == 2 then 							
						if CurrentHeading <= 300 then -- >=300, >=257
							while CurrentHeading <= 357 do
								Citizen.Wait(0)
								SetEntityHeading(VaultDoor, round(CurrentHeading, 1) + Speed)
								CurrentHeading = GetEntityHeading(VaultDoor)
								end
						end
					elseif banknur == 1 then 							
						if CurrentHeading <= 200 then -->=200, ~= 149
							while CurrentHeading ~= 249 do
							Citizen.Wait(0)
							SetEntityHeading(VaultDoor, round(CurrentHeading, 1) + Speed)
							CurrentHeading = GetEntityHeading(VaultDoor)
							end
						end															
					end
end)

RegisterNetEvent('es_bank:toofarlocal')
AddEventHandler('es_bank:toofarlocal', function(robb)
	robbing = false
end)

RegisterNetEvent('es_bank:playerdiedlocal')
AddEventHandler('es_bank:playerdiedlocal', function(robb)
	robbing = false
end)

RegisterNetEvent('kaz:activatecircles')
AddEventHandler('kaz:activatecircles', function()
robcircles = true
end)

RegisterNetEvent('kaz:ingenbor')
AddEventHandler('kaz:ingenbor', function(harbor)
FreezeEntityPosition(GetPlayerPed(-1),false)
    local ped = GetPlayerPed(-1)
    ClearPedTasksImmediately(ped)
end)

RegisterNetEvent('kaz:mid')
AddEventHandler('kaz:mid', function(circledonenow) 
if circledonenow == 1 then 
	circle1done = true
elseif circledonenow == 2 then 
	circle2done = true
elseif circledonenow == 3 then 
	circle3done = true
elseif circledonenow == 4 then 
	circle4done = true
elseif circledonenow == 5 then 
	circle5done = true
elseif circledonenow == 6 then 
	circle6done = true
elseif circledonenow == 7 then 
	circle7done = true
end
end)
	
RegisterNetEvent('kaz:done')
AddEventHandler('kaz:done', function(pengereward, circledonenow) 
if isdoing == 1 and circledonenow == 1 then 
FreezeEntityPosition(GetPlayerPed(-1),false)
local ped = GetPlayerPed(-1)
ClearPedTasksImmediately(ped)
isdoing = 0
elseif isdoing == 2 and circledonenow == 2 then
FreezeEntityPosition(GetPlayerPed(-1),false)
local ped = GetPlayerPed(-1)
ClearPedTasksImmediately(ped)
isdoing = 0
elseif isdoing == 3 and circledonenow == 3 then 
FreezeEntityPosition(GetPlayerPed(-1),false)
local ped = GetPlayerPed(-1)
ClearPedTasksImmediately(ped)
isdoing = 0
elseif isdoing == 4 and circledonenow == 4 then 
FreezeEntityPosition(GetPlayerPed(-1),false)
local ped = GetPlayerPed(-1)
ClearPedTasksImmediately(ped)
isdoing = 0
elseif isdoing == 5 and circledonenow == 5 then
FreezeEntityPosition(GetPlayerPed(-1),false)
local ped = GetPlayerPed(-1)
ClearPedTasksImmediately(ped) 
isdoing = 0
elseif isdoing == 6 and circledonenow == 6 then 
FreezeEntityPosition(GetPlayerPed(-1),false)
local ped = GetPlayerPed(-1)
ClearPedTasksImmediately(ped)
isdoing = 0
elseif isdoing == 7 and circledonenow == 7 then 
FreezeEntityPosition(GetPlayerPed(-1),false)
local ped = GetPlayerPed(-1)
ClearPedTasksImmediately(ped)
isdoing = 0
end
end)

RegisterNetEvent('kaz:circlehammer')
AddEventHandler('kaz:circlehammer', function(circledonenow)
circledone10 = circledonenow
if circledone10 == 1 then
	circle1done = true
elseif circledone10 == 2 then
	circle2done = true
elseif circledone10 == 3 then
	circle3done = true
elseif circledone10 == 4 then
	circle4done = true
elseif circledone10 == 5 then
	circle5done = true
elseif circledone10 == 6 then
	circle6done = true
elseif circledone10 == 7 then
	circle7done = true
end
end)


------ DELTE FUNKTIONER ------
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

function drawTxt(text,font,centre,x,y,scale,r,g,b,a)
	SetTextFont(6)
	SetTextProportional(6)
	SetTextScale(scale/1.0, scale/1.0)
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

function bank_drawTxt(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
	    SetTextOutline()
	end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

