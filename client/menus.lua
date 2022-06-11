local main = RageUI.CreateMenu("Catalogue", "Catalogue")
local testerVeh = RageUI.CreateSubMenu(main, "Que faire ?", 'Que faire ?')
local open = false
main.Closed = function()

    open = false

end

local getVehName = {}

function openCatalogue()

    if open then

        open = false
        RageUI.Visible(main, false)

    else

        open = true
        RageUI.Visible(main, true)

        Citizen.CreateThread(function()

            ESX.TriggerServerCallback('error:getVehicles', function(vehicules)

                local vehiclesList = vehicules

                while open do

                    RageUI.IsVisible(main, function()

                        for k,v in pairs(vehiclesList) do

                            RageUI.Button(v.name, nil, {RightLabel = '~r~'..v.price.." ~g~$"}, true, {

                                onSelected = function()

                                    getVehName = v.model

                                end

                            }, testerVeh)

                        end

                    end)

                    RageUI.IsVisible(testerVeh, function()
                    
                        RageUI.Button('Tester la voiture', nil, {RightLabel = '~w~>'}, true, {

                            onSelected = function()

                                local vehh = spawnCar(getVehName, -943.00, -3170.08, 13.94, 59.29)

                                ESX.ShowNotification("Tu a 20 secondes pour tester la voiture")

                                Citizen.Wait(20000)

                                DeleteEntity(vehh)

                                Citizen.Wait(1000)

                                ESX.ShowNotification('Merci d\'avoir tester la voiture')

                                local ped = PlayerPedId()

                                for k,v in pairs(Config.pos) do

                                SetEntityCoords(ped, v.x, v.y, v.z, false, false)

                                end

                            end

                        })
                    
                    
                    end)

                    Citizen.Wait(0)
                end

            end)

        end)

    end

end
