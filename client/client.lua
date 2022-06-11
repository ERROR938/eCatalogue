RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)

    PlayerData = xPlayer

end)


Citizen.CreateThread(function()

    for k, v in pairs(Config.pos) do

        while true do

            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)
            local point = vector3(v.x, v.y, v.z)
            local inter = 200

            local dst = #(pos - point)

            if dst <= 2 then

                inter = 0

                ESX.ShowHelpNotification('Appuie sur ~INPUT_CONTEXT~ pour acceder au ~b~catalogue')

                if IsControlJustPressed(1, 51) then
                    
                    openCatalogue()

                end

            else 

                inter = 1000
            end

            Citizen.Wait(inter)
        end

    end

end)
