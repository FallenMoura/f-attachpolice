local QBCore = exports['qb-core']:GetCoreObject()

-- Compra Porte de arma --

RegisterNetEvent('f-attachpolice:client:buylicenseweapon', function(source)
    local src = source
TriggerServerEvent("f-attachpolice:server:buylicenseweapon", src, "Compra do Porte de arma")
end)


-- Dispatch --

function getStreetandZone(coords)
    local zone = GetLabelText(GetNameOfZone(coords.x, coords.y, coords.z))
    local currentStreetHash = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    currentStreetName = GetStreetNameFromHashKey(currentStreetHash)
    playerStreetsLocation = currentStreetName .. ", " .. zone
    return playerStreetsLocation
end

function GetPedGender()
    local gender = "Male"
    if QBCore.Functions.GetPlayerData().charinfo.gender == 1 then gender = "Female" end
    return gender
end

RegisterNetEvent('f-attachpolice:client:pedirlicenca', function()
    local plyData = QBCore.Functions.GetPlayerData()
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local gender = GetPedGender()
    TriggerServerEvent("dispatch:server:notify",{
        dispatchcodename = "f-attachpolice-pedirlicenca",        --Esta é a "label" que deveras colocar no sv_dispatchcodes.lua para gerar o blip no mapa e o som do dispatch
        dispatchCode = Config.LicencaCodigo,
        firstStreet = locationInfo,
        name = plyData.charinfo.firstname:sub(1,1):upper()..plyData.charinfo.firstname:sub(2).. " ".. plyData.charinfo.lastname:sub(1,1):upper()..plyData.charinfo.lastname:sub(2),
        number = plyData.charinfo.phone,
        camId = nil,
        model = nil,
        plate = nil,
        priority = Config.LicencaPriority,                       -- Prioridade (1-3)
        firstColor = nil,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = Config.PedirLicenca,                  -- Mensagem que aparece no dispatch
        job = {"police"}                                        -- Trabalho em que vai aparecer este dispatch
    })
end)

RegisterNetEvent('f-attachpolice:client:denuncia', function()
    local plyData = QBCore.Functions.GetPlayerData()
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local gender = GetPedGender()
    TriggerServerEvent("dispatch:server:notify",{
        dispatchcodename = "f-attachpolice-denuncia",           -- Esta é a "label" que deveras colocar no sv_dispatchcodes.lua para gerar o blip no mapa e o som do dispatch
        dispatchCode = Config.DenunciaCodigo,
        firstStreet = locationInfo,
        name = plyData.charinfo.firstname:sub(1,1):upper()..plyData.charinfo.firstname:sub(2).. " ".. plyData.charinfo.lastname:sub(1,1):upper()..plyData.charinfo.lastname:sub(2),
        number = plyData.charinfo.phone,
        camId = nil,
        model = nil,
        plate = nil,
        priority = Config.DenunciaPriority,                      -- Prioridade (1-3)
        firstColor = nil,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = Config.Denuncia,                      -- Mensagem que aparece no dispatch
        job = {"police"}                                        -- Trabalho em que vai aparecer este dispatch
    })
end)

RegisterNetEvent('f-attachpolice:client:chamaragente', function()
    local plyData = QBCore.Functions.GetPlayerData()
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local gender = GetPedGender()
    TriggerServerEvent("dispatch:server:notify",{
        dispatchcodename = "f-attachpolice-chamaragente",        -- Esta é a "label" que deveras colocar no sv_dispatchcodes.lua para gerar o blip no mapa e o som do dispatch
        dispatchCode = Config.ChamarAgenteCodigo,
        firstStreet = locationInfo,
        name = plyData.charinfo.firstname:sub(1,1):upper()..plyData.charinfo.firstname:sub(2).. " ".. plyData.charinfo.lastname:sub(1,1):upper()..plyData.charinfo.lastname:sub(2),
        number = plyData.charinfo.phone,
        camId = nil,
        model = nil,
        plate = nil,
        priority = Config.ChamarAgentePriority,                  -- Prioridade (1-3)
        firstColor = nil,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = Config.ChamarAgente,                  -- Mensagem que aparece no dispatch
        job = {"police"}                                        -- Trabalho em que vai aparecer este dispatch
    })
end)

-- Police Garage --

RegisterNetEvent('f-attachpolice:client:spawnVehicle', function(veh)
    local vehicle = veh
    if not vehicle then return false end
    local coords = Config.SpawnCarro
    if vehicle then
        QBCore.Functions.SpawnVehicle(vehicle, function(veh)
            SetVehicleNumberPlateText(veh, Config.LetrasMatricula ..tostring(math.random(1000, 9999)))
            exports['ps-fuel']:SetFuel(veh, 100.0)
            TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
            TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
            SetVehicleEngineOn(veh, true, true)
            -- TriggerServerEvent('QBCore:CallCommand', "admincar", {})
        end, coords, true)
    end
end)

RegisterNetEvent('f-attachpolice:client:menu', function(data)
    local vehList = {}
    vehList[#vehList + 1] = {
        isMenuHeader = true,
        header = 'Comprar Carros',
        icon = 'fa-solid fa-car'
    }
    for k,v in pairs(Config.PoliceCar) do
        vehList[#vehList + 1] = {
            header = v.label,
            icon = 'fa-solid fa-car',
            params = {
                isServer = true,
                event = 'f-attachpolice:server:buyVehicle',
                args = {
                    model = k,
                    label = v.label,
                    price = v.price
                }
            }
        }
    end
    exports[Config.QBMenuName]:openMenu(vehList)
end)

-- Callsign --

RegisterCommand('callsignv', function(source, args) 

    local Veh = GetVehiclePedIsIn(GetPlayerPed(-1))
    local num1 = tonumber(args[1])
    local num2 = tonumber(args[2])
    local num3 = tonumber(args[3])

    SetVehicleModKit(Veh, 0)
    SetVehicleMod(Veh, 42, num1, false)
    SetVehicleMod(Veh, 44, num2, false)
    SetVehicleMod(Veh, 45, num3, false)

end)

-- Force Lock --

RegisterNetEvent('f-attachpolice:client:forcelock', function()
    local player = QBCore.Functions.GetPlayerData()
    local veh = QBCore.Functions.GetClosestVehicle()
    local plate = GetVehicleNumberPlateText(veh)
    print('Vehicle= '..tostring(GetVehicleNumberPlateText(veh)))
        if job.name == "police" and job.onduty == true then
            if job.onduty == true then
                TriggerServerEvent('qb-vehiclekeys:server:AcquireVehicleKeys', plate)     
            else
        end
    end
end)

-- Weazel New --


RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)

RegisterNetEvent("dog-bodycam:openBoy")
AddEventHandler("dog-bodycam:openBoy", function (src)
    local Player = QBCore.Functions.GetPlayerData()
    if job.name == "police" then
        if acik then
            acik = false
            SendNUIMessage({
                action = "hideassalto"
            })
                TriggerEvent("QBCore:Notify", "Successfully you stopped your Body Camera!", "success", 2500)
                TriggerServerEvent("booleanuodate", false)
             else
            SendNUIMessage({
                action = "showassalto",
            })
            TriggerEvent("QBCore:Notify", "Success you turned on your Body Camera!", "success", 2500)      
            TriggerServerEvent("booleanuodate", true)
            acik = true
        end
    end
end)

-- Impound --

RegisterNetEvent('f-attachpolice:client:OpenImpoundMenu', function()
    exports[Config.QBMenuName]:openMenu({
        {
            header = "Boletim Apreensão",
            txt = "Vehicle in an unrecoverable state.",
            params = {
                event = "f-attachpolice:client:papelboletimInput",
            }
        },
        {
            header = "Parking Violation",
            txt = "Vehicle parked in an restricted or unauthorized place.",
            params = {
                event = "f-attachpolice:client:ParkingViolation",
            }
        },
        {
            header = "Police Impound",
            txt = "Sends vehicle to police impound lot.",
            params = {
                event = "f-attachpolice:client:PDImpound",
            }
        },
    })
end)

RegisterNetEvent('f-attachpolice:client:VehicleScuff', function()
    QBCore.Functions.Progressbar("random_task", "Requesting Impound...", 7000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
     }, {
     }, {}, {}, function() -- Done
        TriggerServerEvent("f-attachpolice:server:VehicS")
        QBCore.Functions.Notify("Impound Request Accepted", "success")
     end, function() -- Cancel
     end)
end)

RegisterNetEvent('f-attachpolice:client:ParkingViolation', function()
    QBCore.Functions.Progressbar("random_task", "Requesting Impound...", 7000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
     }, {
     }, {}, {}, function() -- Done
        TriggerServerEvent("f-attachpolice:server:ParkingVio")
     end, function() -- Cancel
     end)
end)

RegisterNetEvent('f-attachpolice:client:PDImpound', function()
    TriggerServerEvent("f-attachpolice:server:PDIm")
    QBCore.Functions.Notify("Impound Request Accepted", "success")
end)

RegisterNetEvent('f-attachpolice:client:papelboletimInput', function(data)
        local dialog = exports[Config.QBInputName]:ShowInput({
            header = "Boletim de Apreensão",
            submitText = "Apreensão de viatura",
            inputs = {
            {
                text = "Nome do Cidadão", -- text you want to be displayed as a place holder
                name = "nome", -- name of the input should be unique otherwise it might override
                type = "text", -- type of the input
                isRequired = true, -- Optional [accepted values: true | false] but will submit the form if no value is inputted
            },
            {
                text = "Callsign", -- text you want to be displayed as a place holder
                name = "callsign", -- name of the input should be unique otherwise it might override
                type = "number", -- type of the input
                isRequired = true, -- Optional [accepted values: true | false] but will submit the form if no value is inputted
            },
            {
                text = "Matricula da viatura", -- text you want to be displayed as a place holder
                name = "plate", -- name of the input should be unique otherwise it might override
                type = "text", -- type of the input
                isRequired = true, -- Optional [accepted values: true | false] but will submit the form if no value is inputted
            },
            {
                text = "Valor da Multa", -- text you want to be displayed as a place holder
                name = "valor", -- name of the input should be unique otherwise it might override
                type = "number", -- type of the input
                isRequired = true, -- Optional [accepted values: true | false] but will submit the form if no value is inputted
            },
            {
                text = "Motivo da apreensão da viatura", -- text you want to be displayed as a place holder
                name = "reason", -- name of the input should be unique otherwise it might override
                type = "text", -- type of the input
                isRequired = true, -- Optional [accepted values: true | false] but will submit the form if no value is inputted
            },
            {
                text = "Maneira de Apreensão", -- text you want to be displayed as a input header
                name = "apreensao", -- name of the input should be unique otherwise it might override
                type = "radio", -- type of the input - Radio is useful for "or" options e.g; billtype = Cash OR Bill OR bank
                options = { -- The options (in this case for a radio) you want displayed, more than 6 is not recommended
                    { value = "impound", text = "Apreensão" }, -- Options MUST include a value and a text option
                    { value = "pimpound", text = "PD Apreensão" }, -- Options MUST include a value and a text option
                },
            },
        }
        })

        if dialog ~= nil then
            exports[Config.QBMenuName]:openMenu({
                {
                    header = "You are sure you want to rent this vehicle?",
                    isMenuHeader = true,
                    icon = "fas fa-question",
                },
                {
                    header = "Yes",
                    icon = "fas fa-check",
                    params = {
                        event = "f-attachpolice:client:papelboletim",
                        args = {
                            nome = dialog.nome,
                            callsign = dialog.callsign,
                            reason = dialog.reason,
                            valor = dialog.valor,
                            apreensao = dialog.apreensao,
                        },
                    }
                },
                {
                    header = "No",
                    icon = "fas fa-circle-xmark",
                    event = Config.QBMenuName..":closeMenu",
                },
            })
        end
end)

RegisterNetEvent('f-attachpolice:client:papelboletim', function(data)
    
    local nome = data.nome
    local callsign = data.callsign
    local PlayerData = QBCore.Functions.GetPlayerData()
    local reason = data.reason
    local valor = data.valor
    local apreensao = data.apreensao

    TriggerServerEvent('f-attachpolice:server:papelboletim', nome, callsign, reason, valor, apreensao, PlayerData)
end)


local polyZoneArquivo = PolyZone:Create({
    vector2(446.38052368164, -997.87890625),
    vector2(450.80807495117, -997.82330322266),
    vector2(450.80841064453, -995.82305908203),
    vector2(446.37399291992, -995.88958740234)
}, {
    minZ = 30.646802902222,
    maxZ = 30.691841125488
})

RegisterNetEvent('f-attachpolice:client:arquivo', function(arquivo)
    local src = source
    local arquivo = arquivo

    TriggerServerEvent("inventory:server:OpenInventory", "stash", "Arquivo "..arquivo)
    TriggerEvent("inventory:client:SetCurrentStash", "Arquivo "..arquivo)
end)


RegisterCommand('arquivo', function(source, args)
    local src = source
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local arquivo = tonumber(args[1])

        if arquivo ~= nil then
            if polyZoneArquivo:isPointInside(playerCoords) then
                TriggerServerEvent("f-attachpolice:server:arquivo", arquivo)
            end
        end
end)

-- Armario --
local polyZoneArmario = PolyZone:Create({
  vector2(459.70153808594, -1000.4061889648),
  vector2(459.74282836914, -995.17767333984),
  vector2(464.21697998047, -995.57440185547),
  vector2(464.24508666992, -1000.1379394531)
}, {
  minZ = 30.689510345459,
  maxZ = 30.93235206604
})




RegisterCommand('armario', function(source)
    local src = source
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
            if polyZoneArmario:isPointInside(playerCoords) then
                TriggerServerEvent("f-attachpolice:server:armario")
            end
end)

RegisterNetEvent('f-attachpolice:client:armario', function(CID)
    local src = source
    
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "Arquivo "..CID)
    TriggerEvent("inventory:client:SetCurrentStash", "Arquivo "..CID)
end)