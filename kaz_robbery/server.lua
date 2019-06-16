-- Script by: 🅚🅐🅩🅞🅞🅝 --

-- Settings --
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_bank")
local iskriminel = false
local ispoliti = false
local bandit = cfg.bandit
local politi = cfg.politi
local banks = cfg.banks
local robbers = {}
local pengereward = cfg.pengereward
local pengerewardhoj = cfg.pengerewardhoj

-- Mastermind --
RegisterServerEvent('kaz:virus')
AddEventHandler('kaz:virus', function(pris)
    local source = source
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
	local cops = vRP.getUsersByPermission({cfg.permission})
	iskriminel = vRP.hasGroup({user_id,bandit})
	if #cops >= cfg.cops then
		cops = #cops
		if iskriminel == true then 
			if vRP.tryFullPayment({user_id,pris}) then	
				vRP.giveInventoryItem({user_id,"virus",1,false})
				TriggerClientEvent("pNotify:SendNotification", source,{text = "Success! Der er "..cops.." betjente på arbejde.", type = "error", queue = "global", timeout = 10000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
			else
				TriggerClientEvent("pNotify:SendNotification", source,{text = "Du har ikke råd!", type = "error", queue = "global", timeout = 8000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
			end
		else
			TriggerClientEvent("pNotify:SendNotification", source,{text = "Du er ikke Kriminel", type = "error", queue = "global", timeout = 8000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
		end
	else
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Der er ikke nok betjente på arbejde!", type = "error", queue = "global", timeout = 8000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
	end
end)

-- Svejser stjæling -- 
RegisterServerEvent('kaz:svej')
AddEventHandler('kaz:svej', function()
    local source = source
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
	local iskriminel = false
	local cops = vRP.getUsersByPermission({cfg.permission})
	iskriminel = vRP.hasGroup({user_id,bandit})
		if iskriminel == true then 
			TriggerClientEvent("pNotify:SendNotification", source,{text = "Stjæler skære brænder... (vent 60 sekunder)", type = "error", queue = "global", timeout = 60000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
			Citizen.Wait(60000)
			vRP.giveInventoryItem({user_id,"svejser",1,false})
			TriggerClientEvent("pNotify:SendNotification", source,{text = "Du stjal 1 stk skære brænder.", type = "error", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
		else
			TriggerClientEvent("pNotify:SendNotification", source,{text = "Du er ikke Kriminel... (vent 60 sekunder)", type = "error", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
		end
end)

-- Røveri -- 
RegisterCommand('unlock', function(source)
    local source = source
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
	local ispoliti = false
	ispoliti = vRP.hasGroup({user_id,politi})
	if ispoliti == true then 
	TriggerClientEvent('unlock:gate', -1, test)
	else
	TriggerClientEvent("pNotify:SendNotification", source,{text = "Du er ikke politi!.", type = "error", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
	end
end)

RegisterServerEvent('kaz:levvirus')
AddEventHandler('kaz:levvirus', function()
  local source = source
  local user_id = vRP.getUserId({source})
  local player = vRP.getUserSource({user_id})
  local iskriminel = false
  local cops = vRP.getUsersByPermission({cfg.permission})
    if #cops >= cfg.cops then
          iskriminel = vRP.hasGroup({user_id,bandit})
		  ispoliti = vRP.hasGroup({user_id,politi})
		if iskriminel == true then
			if vRP.tryGetInventoryItem({user_id,"virus",1,false}) then
			else
			havepayed = false
			TriggerClientEvent('kaz:betalt', -1, havepayed)
			TriggerClientEvent("pNotify:SendNotification", source,{text = "Du mangler virussen!", type = "error", queue = "global", timeout = 8000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
			end
		elseif ispoliti == true then
			TriggerClientEvent("pNotify:SendNotification", source,{text = "Alarmen starter ikke, da du er betjent!", type = "error", queue = "global", timeout = 8000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
		else
			havepayed = false
			TriggerClientEvent('kaz:betalt', -1, havepayed)
			TriggerClientEvent("pNotify:SendNotification", source,{text = "Du er ikke kriminel!", type = "error", queue = "global", timeout = 8000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
		end
	else
	havepayed = false
	TriggerClientEvent('kaz:betalt', -1, havepayed)
	TriggerClientEvent("pNotify:SendNotification", source,{text = "Ikke nok betjente i byen!", type = "error", queue = "global", timeout = 8000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
	end
end)

RegisterServerEvent('key:pressed')
AddEventHandler('key:pressed', function(banknur, doorstate, spiller)
doorstate1 = doorstate
banknum = banknur
spiller1 = spiller
TriggerClientEvent('kaz:doorstate', -1, doorstate1, banknum, spiller1)
end)

RegisterServerEvent('kaz:doortype')
AddEventHandler('kaz:doortype', function(banknr, spiller)
banknr = banknr
spiller1 = spiller
TriggerClientEvent('kaz:doortype2', -1, banknr, spiller1)
end)

RegisterServerEvent('es_bank:rob')
AddEventHandler('es_bank:rob', function(robb)
    local source = source
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
	local iskriminel = false
	local ispoliti = false 
	local cops = vRP.getUsersByPermission({cfg.permission})
	iskriminel = vRP.hasGroup({user_id,bandit})
	ispoliti = vRP.hasGroup({user_id,politi})
  if ispoliti == true then 
    TriggerClientEvent("pNotify:SendNotification", source,{text = "Du er ikke kriminel!", type = "error", queue = "global", timeout = 8000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
  else
    if #cops >= cfg.cops then
	  if banks[robb] then
		  local bank = banks[robb]
		  TriggerClientEvent('chatMessage', -1, 'NEWS', {255, 0, 0}, "Bankrøveri igang ved ^2" .. bank.nameofbank)
		  TriggerClientEvent('chatMessage', player, 'SYSTEM', {255, 0, 0}, "Du har startet et bankrøveri ved: ^2" .. bank.nameofbank .. "^0!")
		  TriggerClientEvent('chatMessage', player, 'SYSTEM', {255, 0, 0}, "Boksen er låst op, åben døren, og gå igang med at skære!")
		  TriggerClientEvent('es_bank:currentlyrobbing', player, robb)
		  banks[robb].lastrobbed = os.time()
		  robbers[player] = robb
		  local savedSource = player
		  SetTimeout(cfg.seconds*1000, function()
			  if(robbers[savedSource])then
				  if(user_id)then
				  end
			  end
		  end)
	  end
    else
      TriggerClientEvent("pNotify:SendNotification", source,{text = "Ikke nok betjente i byen!", type = "error", queue = "global", timeout = 8000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
    end
  end
end)

RegisterServerEvent('kaz:tid')
AddEventHandler('kaz:tid', function(secondsRemaining)
    local source = source
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
	local iskriminel = false
	local ispoliti = false 
doorsoff1 = 1
TriggerClientEvent('chatMessage', -1, 'NEWS', {255, 0, 0}, "Bankboksen er blevet lukket af alarmsystemet.")
TriggerClientEvent('kaz:tiden', -1, doorsoff1)
end)

RegisterServerEvent('es_bank:toofar')
AddEventHandler('es_bank:toofar', function(robb)
	if(robbers[source])then
		TriggerClientEvent('es_bank:toofarlocal', source)
		robbers[source] = nil
		TriggerClientEvent('chatMessage', -1, 'NEWS', {255, 0, 0}, "Bankrøveri overstået ved ^2" .. banks[robb].nameofbank.. ".^7 Røverne har forladt banken.")
		TriggerClientEvent('kaz:reset', -1, test)
	end
end)

RegisterServerEvent('es_bank:playerdied')
AddEventHandler('es_bank:playerdied', function(robb)
	if(robbers[source])then
		TriggerClientEvent('es_bank:playerdiedlocal', source)
		robbers[source] = nil
		TriggerClientEvent('chatMessage', -1, 'NEWS', {255, 0, 0}, "Bankrøveriet blev aflyst: ^2" .. banks[robb].nameofbank)
		TriggerClientEvent('kaz:reset', -1, test)
		
	end
end)

RegisterServerEvent('kaz:circlesnew')
AddEventHandler('kaz:circlesnew', function()
TriggerClientEvent('kaz:activatecircles', -1, test)
end)

RegisterServerEvent('kaz:hammerbore')
AddEventHandler('kaz:hammerbore', function(circledone)
local source = source
local user_id = vRP.getUserId({source})
local player = vRP.getUserSource({user_id})
local iskriminel = false
local cops = vRP.getUsersByPermission({cfg.permission})
circledonenow = circledone
harbor = nil
if vRP.tryGetInventoryItem({user_id,"svejser",1,false}) then
TriggerClientEvent('kaz:mid', -1, circledonenow)
TriggerClientEvent("pNotify:SendNotification", source,{text = "Brænder bankboks - Vent venligst! (80 sekunder)", type = "error", queue = "global", timeout = 80000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
Citizen.Wait(80000)
TriggerClientEvent('kaz:done', -1, pengereward, circledonenow)
vRP.giveInventoryItem({user_id,"dirty_money",math.random(pengereward, pengerewardhoj),true})
else
TriggerClientEvent('kaz:ingenbor', -1, harbor)
TriggerClientEvent("pNotify:SendNotification", source,{text = "Du mangler en skære brænder!", type = "error", queue = "global", timeout = 8000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
end
TriggerClientEvent('kaz:circlehammer', -1, circledonenow)
end)
