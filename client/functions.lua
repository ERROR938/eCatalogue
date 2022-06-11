function spawnCar(model, x, y, z, h)

    local ped = PlayerPedId()

    local hash = GetHashKey(model)

    RequestModel(hash)

    while not HasModelLoaded(hash) do Citizen.Wait(0) end

    local car = CreateVehicle(hash, x, y, z, h, false, false)

    SetEntityInvincible(car, true)
    SetVehicleDoorsLocked(car, 2)

    TaskWarpPedIntoVehicle(ped, car, -1)

    return car

end