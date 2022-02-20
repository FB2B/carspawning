local PlayerPowerLevel = 0

-- Callbacks --
RegisterNUICallback('spawnveh', function(data, cb)
    Citizen.Trace(data.vehicle)
    TriggerEvent('carspawning:carspawning', data.vehicle)
    SendNUIMessage({type = "close"})
end)
RegisterNUICallback('refresh', function()
    Citizen.Trace("Refreshing carspawning UI")
    GetPlayerPower()
    Wait(500)
    SendNUIMessage({type = "refresh", power = PlayerPowerLevel})
end)
RegisterNUICallback('close', function(data, cb)
    SetNuiFocus(false, false)
end)

-- Events --
RegisterNetEvent('carspawning:carspawning')
AddEventHandler('carspawning:carspawning', function(car)
    SpawnCar(car)
    Citizen.Trace("Spawning Car!")
end)
RegisterNetEvent('carspawning:ReturnPermissions')
AddEventHandler('carspawning:ReturnPermissions', function(level)
    PlayerPowerLevel = level  
end)
RegisterNetEvent('carspawning:openGUI')
AddEventHandler('carspawning:openGUI', function()
    OpenMenu()
    SendNUIMessage({type = "open"})
end)

-- Functions --
function GetPlayerPower()
    local player = source
    TriggerServerEvent('carspawning:GetPermissions', player)
end 
function SpawnCar(v)
    local p = PlayerPedId()
        
    if IsPedInAnyVehicle(p, false) then
        local cv = GetVehiclePedIsIn(p, false)
        SetEntityAsNoLongerNeeded(cv)
        Citizen.Wait(10)
        DeleteEntity(cv)
    end    
    local car = GetHashKey(v)
    
    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(10)
    end
    local heading = GetEntityHeading(p)
    local x,y,z = table.unpack(GetEntityCoords(p, false))
    local veh = CreateVehicle(car, x, y, z, p, true, false)
    SetEntityAsMissionEntity(veh, true, true)
    
    SetPedIntoVehicle(p, veh, -1)
end    
function OpenMenu()
    GetPlayerPower()
    Wait(500)
    SetNuiFocus(true, true)
    SendNUIMessage({type = "open", permissions = PlayerPowerLevel})
end

