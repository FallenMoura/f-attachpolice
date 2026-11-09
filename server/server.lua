local QBCore = exports['qb-core']:GetCoreObject()

-- Compra porte de arma

RegisterNetEvent('f-attachpolice:server:buylicenseweapon') 
AddEventHandler('f-attachpolice:server:buylicenseweapon', function(src)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local Citizen = QBCore.Functions.GetPlayerByCitizenId(src)
    local SearchedPlayer = QBCore.Functions.GetPlayer(src)
        if not SearchedPlayer.PlayerData.metadata["licences"]["weapon"] then
            TriggerClientEvent('QBCore:Notify', SearchedPlayer.PlayerData.source, Config.SemLicenca, "error", Config.TempoNotify)
            TriggerClientEvent('QBCore:Notify', src, Config.ComparencaAgente, "primary", Config.TempoNotify)
        elseif 
            Player.PlayerData.money.bank >= Config.CustoLicenca then
            exports['um-idcard']:CreateMetaLicense(src, {Config.item})
            Player.Functions.RemoveMoney(Config.Pagamento, Config.CustoLicenca)
            exports['qb-management']:AddMoney('police', Config.CustoLicenca)
            TriggerClientEvent('QBCore:Notify', src, Config.Comprada, "success", Config.TempoNotify)
        else
            TriggerClientEvent('QBCore:Notify', src, Config.SemDinheiro, "error", Config.TempoNotify)
    end
end)

-- Police Shop --

RegisterNetEvent('f-attachpolice:server:buyVehicle', function(data)
    local src = source
    local data = data
    local Player = QBCore.Functions.GetPlayer(src)

    if Player.PlayerData.money.bank >= data.price then
        Player.Functions.RemoveMoney(Config.ShopPagamento, data.price)
        exports['qb-management']:AddMoney('police', data.price)
        TriggerClientEvent('f-attachpolice:client:spawnVehicle', src, data.model)
    else
        TriggerClientEvent('QBCore:Notify', src, Config.ShopSemDinheiro, 'error', Config.ShopTempoNotify)
    end
end)

-- Force Lock --

RegisterNetEvent('f-attachpolice:server:forcelock', function(player, veh)
    local src = source
    TriggerClientEvent("f-attachpolice:client:breaklocks", source)
end)

QBCore.Functions.CreateUseableItem("police_lockpick", function(source, item)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemByName(item.name) ~= nil then
		TriggerClientEvent("f-attachpolice:client:forcelock", src)
	end
end)

-- Weazel New --

local acik = false

RegisterNetEvent("booleanuodate")
AddEventHandler("booleanuodate", function (bool)
    acik = bool
end)

RegisterCommand('assalto', function(source)
    local src = source
    TriggerClientEvent("dog-bodycam:openBoy", src, 'Weazel New')
end)

-- Impound --

RegisterServerEvent('f-attachpolice:server:VehicS', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('QBCore:Command:DeleteVehicle', src)
    TriggerEvent('qb-log:server:CreateLog', 'default', 'Scuff Impound', "lightgreen", (Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname).. " has scuff impounded a vehicle.")
end)

RegisterServerEvent('f-attachpolice:server:ParkingVio', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.name == "police" then
        TriggerClientEvent('QBCore:Command:DeleteVehicle', src)
        TriggerClientEvent('QBCore:Notify', src, 'Impound Request Accepted.', 'success')
        TriggerEvent('qb-log:server:CreateLog', 'default', 'Parking Violation', "lightgreen", (Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname).. " has impounded a vehicle for a parking violation.")
    else
        TriggerClientEvent('QBCore:Notify', src, 'You are not a police officer.', 'error')
    end
end)

RegisterServerEvent('f-attachpolice:server:PDIm', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.name == "police" then
        TriggerClientEvent("police:client:ImpoundVehicle", src, true)
        TriggerEvent('qb-log:server:CreateLog', 'default', 'Police Impound', "lightgreen", (Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname).. " has sent a vehicle to police Impound.")
    else
        TriggerClientEvent('QBCore:Notify', src, 'You are not a police officer.', 'error')
    end
end)


RegisterNetEvent('f-attachpolice:server:papelboletim', function(nome, callsign, reason, valor, apreensao, PlayerData)
local Player = QBCore.Functions.GetPlayer(source)
    local info = {}
    info.name = PlayerData.charinfo.firstname .. " " .. PlayerData.charinfo.lastname
    info.nome = nome
    info.callsign = callsign
    info.reason = reason
    info.valor = valor
    info.apreensao = apreensao

    Player.Functions.AddItem('boletim', 1, nil, info)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["boletim"], "add", 1)
end)

-- Arquivo --

RegisterNetEvent('f-attachpolice:server:arquivo', function(arquivo)
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)

    if Player.PlayerData.job.name == "police" and Player.PlayerData.job.onduty then
        TriggerClientEvent('f-attachpolice:client:arquivo', source, arquivo)
    end
end)

-- Armário --

RegisterNetEvent('f-attachpolice:server:armario', function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local CID = Player.PlayerData.citizenid

    if Player.PlayerData.job.name == "police" and Player.PlayerData.job.onduty then
        TriggerClientEvent('f-attachpolice:client:armario', source, CID)
        print(CID)
        print('fun2')
    end
end)
