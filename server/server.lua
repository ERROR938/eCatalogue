ESX.RegisterServerCallback('error:getVehicles', function(source, cb)

    local xPlayer = ESX.GetPlayerFromId(source)
    local vehicules = {}

    MySQL.Async.fetchAll('SELECT * FROM vehicles', {

    }, function(result)

        for i=1, #result, 1 do

            table.insert(vehicules, {
                name = result[i].name,
                model = result[i].model,
                price = result[i].price,
            })

        end

        cb(vehicules)
    
    end)

end)