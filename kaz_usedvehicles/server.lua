local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
MySQL = module("vrp_mysql", "MySQL")
cfg = module("kaz_usedvehicles", "cfg/cars")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","kaz_usedvehicles")

vRPcc = {}
Tunnel.bindInterface("kaz_usedvehicles",vRPcc)
Proxy.addInterface("kaz_usedvehicles",vRPcc)
vRPccC = Tunnel.getInterface("kaz_usedvehicles","kaz_usedvehicles")


MySQL.createCommand("vRP/sell_vehiclekaz","INSERT INTO vehicles_for_sale(sellerid,description,price,model,vtype,sellername) VALUES(@sellerid,@description,@price,@model,@vtype,@sellername)")
MySQL.createCommand("vRP/get_vehicles_kaz","SELECT sellerid, description, price, model, vtype, sellername FROM vehicles_for_sale") 
MySQL.createCommand("vRP/get_num_vehicles_for_sale","SELECT COUNT(*) FROM vehicles_for_sale")
MySQL.createCommand("vRP/remove_vehiclekaz","DELETE FROM vehicles_for_sale WHERE sellerid = @sellerid AND model = @model AND @price = @price")
MySQL.createCommand("vRP/kazget_vehicle1","SELECT vehicle FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicleowned")
MySQL.createCommand("vRP/kazsell_vehicle_player","UPDATE vrp_user_vehicles SET user_id = @user_id, vehicle_plate = @registration, vehicle = @vehiclenow, vehicle_name = @vehicle_namenow WHERE user_id = @oldUser AND vehicle = @vehicle")
MySQL.createCommand("vRP/kazsell_vehiclestate","UPDATE vrp_user_vehicles SET vehicle = @salevehicle, vehicle_name = @salevehicle_name WHERE user_id = @user_id AND vehicle = @vehicle")
MySQL.createCommand("vRP/kaz_getvehicle","SELECT vehicle_name FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle")
MySQL.createCommand("vRP/removesalg1","SELECT vehicle_name, vehicle FROM vrp_user_vehicles WHERE user_id = @sellerid AND vehicle = @vehiclefix")


RegisterServerEvent('kaz:info')
AddEventHandler('kaz:info', function(pris, tale, seller, vtype, vname)
	local user_id = vRP.getUserId({source})
	vRPclient.despawnGarageVehicle(source,{vtype,15})
	MySQL.query("vRP/kaz_getvehicle", {user_id = user_id, vehicle = vname}, function(newcar)
	for k,v in pairs(newcar) do
          if v then
			newcardone = newcar[1].vehicle_name
		  end
	 end
	 salevehicle_name = newcardone.."TILSALG"
	 salevehicle = vname.."salg"
	MySQL.query("vRP/kazsell_vehiclestate", {user_id = user_id, vehicle = vname, salevehicle = salevehicle, salevehicle_name = salevehicle_name})
	MySQL.query("vRP/sell_vehiclekaz", {sellerid = user_id, description = tale, price = pris, model = vname, vtype = vtype, sellername = seller})
	TriggerClientEvent("pNotify:SendNotification", source,{text = "Køretøjet er sat til salg for " ..pris.. " kr.", type = "error", queue = "global", timeout = 10000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
	TriggerClientEvent("kaz:refresh", -1)
end)
end)

RegisterServerEvent('kaz:getamount')
AddEventHandler('kaz:getamount', function()
MySQL.query("vRP/get_num_vehicles_for_sale", {}, function(data)
			for index, data in ipairs(data) do
				for key, value in pairs(data) do
				value1 = value
				end
			end
				caramount = value1
				TriggerClientEvent('kaz:setamount', -1, caramount)
    end)
end)

RegisterServerEvent('kaz:getprice')
AddEventHandler('kaz:getprice', function(caramount)
MySQL.query("vRP/get_vehicles_kaz", {}, function(data)
for k,v in pairs(data) do
          if v then -- check true, prevent future neolua issues
		  if caramount >= 1 then 
		  sellerid1 = data[1].sellerid
		  description1 = data[1].description
		  price1 = data[1].price
		  model1 = data[1].model
		  vtype1 = data[1].vtype
		  sellername1 = data[1].sellername
		  end
		  if caramount >= 2 then 
		  sellerid2 = data[2].sellerid
		  description2 = data[2].description
		  price2 = data[2].price
		  model2 = data[2].model
		  vtype2 = data[2].vtype
		  sellername2 = data[2].sellername
		  end
		  if caramount >= 3 then 
		  sellerid3 = data[3].sellerid
		  description3 = data[3].description
		  price3 = data[3].price
		  model3 = data[3].model
		  vtype3 = data[3].vtype
		  sellername3 = data[3].sellername
		  end
		  if caramount >= 4 then 
		  sellerid4 = data[4].sellerid
		  description4 = data[4].description
		  price4 = data[4].price
		  model4 = data[4].model
		  vtype4 = data[4].vtype
		  sellername4 = data[4].sellername
		  end
		  if caramount >= 5 then 
		  sellerid5 = data[5].sellerid
		  description5 = data[5].description
		  price5 = data[5].price
		  model5 = data[5].model
		  vtype5 = data[5].vtype
		  sellername5 = data[5].sellername
		  end
		  if caramount >= 6 then 
		  sellerid6 = data[6].sellerid
		  description6 = data[6].description
		  price6 = data[6].price
		  model6 = data[6].model
		  vtype6 = data[6].vtype
		  sellername6 = data[6].sellername
		  end
		  if caramount >= 7 then 
		  sellerid7 = data[7].sellerid
		  description7 = data[7].description
		  price7 = data[7].price
		  model7 = data[7].model
		  vtype7 = data[7].vtype
		  sellername7 = data[7].sellername
		  end
		  if caramount >= 8 then 
		  sellerid8 = data[8].sellerid
		  description8 = data[8].description
		  price8 = data[8].price
		  model8 = data[8].model
		  vtype8 = data[8].vtype
		  sellername8 = data[8].sellername
		  end
		  if caramount >= 9 then 
		  sellerid9 = data[9].sellerid
		  description9 = data[9].description
		  price9 = data[9].price
		  model9 = data[9].model
		  vtype9 = data[9].vtype
		  sellername9 = data[9].sellername
		  end
		  if caramount >= 10 then 
		  sellerid10 = data[10].sellerid
		  description10 = data[10].description
		  price10 = data[10].price
		  model10 = data[10].model
		  vtype10 = data[10].vtype
		  sellername10 = data[10].sellername
		  end
		  if caramount == 1 then 
		  TriggerClientEvent('kaz:setprice', -1, sellerid1, description1, price1, model1, vtype1, sellername1)
		  elseif caramount == 2 then 
		  TriggerClientEvent('kaz:setprice', -1, sellerid1, description1, price1, model1, vtype1, sellername1, sellerid2, description2, price2, model2, vtype2, sellername2)
		  elseif caramount == 3 then
		  TriggerClientEvent('kaz:setprice', -1, sellerid1, description1, price1, model1, vtype1, sellername1, sellerid2, description2, price2, model2, vtype2, sellername2, sellerid3, description3, price3, model3, vtype3, sellername3)
		  elseif caramount == 4 then
		  TriggerClientEvent('kaz:setprice', -1, sellerid1, description1, price1, model1, vtype1, sellername1, sellerid2, description2, price2, model2, vtype2, sellername2, sellerid3, description3, price3, model3, vtype3, sellername3, sellerid4, description4, price4, model4, vtype4, sellername4)
		  elseif caramount == 5 then
		  TriggerClientEvent('kaz:setprice', -1, sellerid1, description1, price1, model1, vtype1, sellername1, sellerid2, description2, price2, model2, vtype2, sellername2, sellerid3, description3, price3, model3, vtype3, sellername3, sellerid4, description4, price4, model4, vtype4, sellername4, sellerid5, description5, price5, model5, vtype5, sellername5)
		  elseif caramount == 6 then
		  TriggerClientEvent('kaz:setprice', -1, sellerid1, description1, price1, model1, vtype1, sellername1, sellerid2, description2, price2, model2, vtype2, sellername2, sellerid3, description3, price3, model3, vtype3, sellername3, sellerid4, description4, price4, model4, vtype4, sellername4, sellerid5, description5, price5, model5, vtype5, sellername5, sellerid6, description6, price6, model6, vtype6, sellername6)
		  elseif caramount == 7 then
		  TriggerClientEvent('kaz:setprice', -1, sellerid1, description1, price1, model1, vtype1, sellername1, sellerid2, description2, price2, model2, vtype2, sellername2, sellerid3, description3, price3, model3, vtype3, sellername3, sellerid4, description4, price4, model4, vtype4, sellername4, sellerid5, description5, price5, model5, vtype5, sellername5, sellerid6, description6, price6, model6, vtype6, sellername6, sellerid7, description7, price7, model7, vtype7, sellername7)
		  elseif caramount == 8 then
		  TriggerClientEvent('kaz:setprice', -1, sellerid1, description1, price1, model1, vtype1, sellername1, sellerid2, description2, price2, model2, vtype2, sellername2, sellerid3, description3, price3, model3, vtype3, sellername3, sellerid4, description4, price4, model4, vtype4, sellername4, sellerid5, description5, price5, model5, vtype5, sellername5, sellerid6, description6, price6, model6, vtype6, sellername6, sellerid7, description7, price7, model7, vtype7, sellername7, sellerid8, description8, price8, model8, vtype8, sellername8)
		  elseif caramount == 9 then
		  TriggerClientEvent('kaz:setprice', -1, sellerid1, description1, price1, model1, vtype1, sellername1, sellerid2, description2, price2, model2, vtype2, sellername2, sellerid3, description3, price3, model3, vtype3, sellername3, sellerid4, description4, price4, model4, vtype4, sellername4, sellerid5, description5, price5, model5, vtype5, sellername5, sellerid6, description6, price6, model6, vtype6, sellername6, sellerid7, description7, price7, model7, vtype7, sellername7, sellerid8, description8, price8, model8, vtype8, sellername8, sellerid9, description9, price9, model9, vtype9, sellername9)
		  elseif caramount == 10 then
		  TriggerClientEvent('kaz:setprice', -1, sellerid1, description1, price1, model1, vtype1, sellername1, sellerid2, description2, price2, model2, vtype2, sellername2, sellerid3, description3, price3, model3, vtype3, sellername3, sellerid4, description4, price4, model4, vtype4, sellername4, sellerid5, description5, price5, model5, vtype5, sellername5, sellerid6, description6, price6, model6, vtype6, sellername6, sellerid7, description7, price7, model7, vtype7, sellername7, sellerid8, description8, price8, model8, vtype8, sellername8, sellerid9, description9, price9, model9, vtype9, sellername9, sellerid10, description10, price10, model10, vtype10, sellername10)
		end
		end
		end
    end)
end)

RegisterServerEvent('kaz:kobbil')
AddEventHandler('kaz:kobbil', function(carmodel, sellerid, pris)
 local source = source
 local user_id = vRP.getUserId({source})
	if user_id == sellerid then 
		MySQL.query("vRP/get_user_identity", {user_id = user_id}, function(identity)
		for k,v in pairs(identity) do
				  if v then
				  id = identity[1].registration
				  end
				  end
			MySQL.query("vRP/kazget_vehicle1", {user_id = user_id, vehicleowned = carmodel}, function(pvehicle, affected)
			vehiclefix = carmodel.."salg"
			if #pvehicle > 0 then
				TriggerClientEvent("pNotify:SendNotification", source,{text = "Du har allerede dette køretøj!", type = "error", queue = "global", timeout = 10000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
			else
					TriggerClientEvent("pNotify:SendNotification", source,{text = "Du annullerede salget.", type = "error", queue = "global", timeout = 10000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
					MySQL.query("vRP/removesalg1", {sellerid = sellerid, vehiclefix = vehiclefix}, function(cardata)
				for index, data in ipairs(cardata) do
				for key, value in pairs(data) do
					cardata.vehicle = cardata[1].vehicle
					cardata.name = cardata[1].vehicle_name
					vehiclenow = string.gsub(cardata.vehicle, "salg", "")
					vehicle_namenow = string.gsub(cardata.name, "TILSALG", "")		
					vehicleold = carmodel.."salg"
					MySQL.execute("vRP/kazsell_vehicle_player", {user_id = user_id, registration = "P"..id, oldUser = sellerid, vehicle = vehicleold, vehicle_namenow = vehicle_namenow, vehiclenow = vehiclenow})
					MySQL.query("vRP/remove_vehiclekaz", {sellerid = sellerid, model = carmodel, price = pris})
					
					TriggerClientEvent('kaz:timeout', -1)
					Citizen.Wait(60000)
					TriggerClientEvent('kaz:refresh', -1)
							end
					end
					end)
			end
		end)
		end)
	else
		MySQL.query("vRP/get_user_identity", {user_id = user_id}, function(identity)
		for k,v in pairs(identity) do
				  if v then
				  id = identity[1].registration
				  end
				  end
			MySQL.query("vRP/kazget_vehicle1", {user_id = user_id, vehicleowned = carmodel}, function(pvehicle, affected)
			vehiclefix = carmodel.."salg"
			if #pvehicle > 0 then
				TriggerClientEvent("pNotify:SendNotification", source,{text = "Du har allerede dette køretøj!", type = "error", queue = "global", timeout = 10000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
			else
					if vRP.tryFullPayment({user_id,pris}) then
					vRP.giveBankMoney({sellerid,pris})
					TriggerClientEvent("pNotify:SendNotification", source,{text = "Du købte ".. carmodel .. ", for " .. pris .." kr.", type = "error", queue = "global", timeout = 10000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
					MySQL.query("vRP/removesalg1", {sellerid = sellerid, vehiclefix = vehiclefix}, function(cardata)
				for index, data in ipairs(cardata) do
				for key, value in pairs(data) do
					cardata.vehicle = cardata[1].vehicle
					cardata.name = cardata[1].vehicle_name
					vehiclenow = string.gsub(cardata.vehicle, "salg", "")
					vehicle_namenow = string.gsub(cardata.name, "TILSALG", "")		
					vehicleold = carmodel.."salg"
					MySQL.execute("vRP/kazsell_vehicle_player", {user_id = user_id, registration = "P"..id, oldUser = sellerid, vehicle = vehicleold, vehicle_namenow = vehicle_namenow, vehiclenow = vehiclenow})
					MySQL.query("vRP/remove_vehiclekaz", {sellerid = sellerid, model = carmodel, price = pris})
					
					TriggerClientEvent('kaz:timeout', -1)
					Citizen.Wait(60000)
					TriggerClientEvent('kaz:refresh', -1)
							end
					end
					end)
					else
					TriggerClientEvent("pNotify:SendNotification", source,{text = "Du har ikke råd!", type = "error", queue = "global", timeout = 10000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
					
					end	
			end
		end)
		end)
	end	
end)
