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

            local dst = #(pos - point)

            if dst <= 2 then

                ESX.ShowHelpNotification('Appuie sur ~INPUT_CONTEXT~ pour acceder au ~b~catalogue')

                if IsControlJustPressed(1, 51) then
                    
                    openCatalogue()

                end
            end

            Citizen.Wait(0)
        end

    end

end)
