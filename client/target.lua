local QBCore = exports['qb-core']:GetCoreObject()
local bones = {'bonnet', 'boot'}

CreateThread(function()
    for k, v in pairs(Config.ShopPed) do
        local PedLoc = v.PedCoords
        local Spot = v.SpotName
        RequestModel(GetHashKey(v.PedModel))
        while not HasModelLoaded(GetHashKey(v.PedModel)) do
            Wait(1)
        end
        RentalPed =  CreatePed(4, v.PedModelHash, PedLoc.x, PedLoc.y, PedLoc.z, v.PedHeading, false, true)
        SetEntityHeading(RentalPed, v.PedHeading)
        FreezeEntityPosition(RentalPed, true)
        SetEntityInvincible(RentalPed, true)
        SetBlockingOfNonTemporaryEvents(RentalPed, true)
        TaskStartScenarioInPlace(RentalPed, "WORLD_HUMAN_STAND_MOBILE_UPRIGHT", 0, true) 

        exports[Config.QBTargetName]:AddBoxZone(v.SpotName, v.PedCoords, 1, 1, {
            name=v.SpotName,
            heading=v.PedHeading,
        }, {
            options = {
                {
                    targeticon = v.TargetIcon,
                    icon = "fas fa-clipboard",
                    label = v.LabelSpotName,
                    job = {["police"] = 4},
                    action = function()
                        TriggerEvent('f-attachpolice:client:menu')
                    end
                },
            },
            distance = 2.5
        })
    end
end)

CreateThread(function()
    for k, v in pairs(Config.MRPDped) do
        local PedLoc = v.PedCoords
        local Spot = v.SpotName
        RequestModel(GetHashKey(v.PedModel))
        while not HasModelLoaded(GetHashKey(v.PedModel)) do
            Wait(1)
        end
        RentalPed =  CreatePed(4, v.PedModelHash, PedLoc.x, PedLoc.y, PedLoc.z, v.PedHeading, false, true)
        SetEntityHeading(RentalPed, v.PedHeading)
        FreezeEntityPosition(RentalPed, true)
        SetEntityInvincible(RentalPed, true)
        SetBlockingOfNonTemporaryEvents(RentalPed, true)
        TaskStartScenarioInPlace(RentalPed, "WORLD_HUMAN_STAND_MOBILE_UPRIGHT", 0, true) 

        exports[Config.QBTargetName]:AddBoxZone(v.SpotName, v.PedCoords, 1, 1, {
            name=v.SpotName,
            heading=v.PedHeading,
        }, {
           options = {
                { -- This is 
                num = 1, -- This is the position number of your option in the list of options in the qb-target context menu (OPTIONAL)
                    type = "client",
                    event = "qb-policeweapon:client:pedirlicenca",
                    icon = 'fa-solid fa-car',
                    label = v.LabelSpotName, -- This is the label of this option which you would be able to click on to trigger everything, this has to be a string
                    job = 'police', -- This is the job, this option won't show up if the player doesn't have this job, this can also be done with multiple jobs and grades, if you want multiple jobs you always need a grade with it: job = {["police"] = 0, ["ambulance"] = 2},
                },
                { -- This is 
                num = 2, -- This is the position number of your option in the list of options in the qb-target context menu (OPTIONAL)
                    type = "client",
                    event = "qb-policeweapon:client:denuncia", 
                    icon = 'fa-solid fa-car', -- This is the icon that will display next to this trigger option
                    label = v.LabelSpotName2, -- This is the label of this option which you would be able to click on to trigger everything, this has to be a string
                    job = 'police', -- This is the job, this option won't show up if the player doesn't have this job, this can also be done with multiple jobs and grades, if you want multiple jobs you always need a grade with it: job = {["police"] = 0, ["ambulance"] = 2},
                },
                { -- This is 
                num = 3, -- This is the position number of your option in the list of options in the qb-target context menu (OPTIONAL)
                    type = "client",
                    event = "qb-policeweapon:client:chamaragente",
                    icon = 'fa-solid fa-car', -- This is the icon that will display next to this trigger option
                    label = v.LabelSpotName3, -- This is the label of this option which you would be able to click on to trigger everything, this has to be a string
                    job = 'police', -- This is the job, this option won't show up if the player doesn't have this job, this can also be done with multiple jobs and grades, if you want multiple jobs you always need a grade with it: job = {["police"] = 0, ["ambulance"] = 2},
                },
                { -- This is 
                num = 4, -- This is the position number of your option in the list of options in the qb-target context menu (OPTIONAL)
                    type = "client",
                    event = "qb-policeweapon:client:buylicenseweapon",
                    icon = 'fa-solid fa-gun', -- This is the icon that will display next to this trigger option
                    label = v.LabelSpotName4, -- This is the label of this option which you would be able to click on to trigger everything, this has to be a string
                },
            },
            distance = 2.5
        })
    end
end)

CreateThread(function()
    exports[Config.QBTargetName]:AddTargetBone(bones, {
        options = {
            ["Impound"] = {
                icon = "fas fa-lock",
                label = Config.Label,
                event = "dynyx-impound:client:OpenImpoundMenu",
                distance = 1.3
            }
        }
    })
end)

