RegisterServerEvent('carspawning:GetPermissions')
AddEventHandler('carspawning:GetPermissions', function(player)
    local plr = player
    if plr < 3 then
        local power = 20
        TriggerClientEvent('carspawning:ReturnPermissions', source, power)
    end
end)

RegisterCommand("spawn", function(source, args, rawCommand)
    TriggerClientEvent('carspawning:openGUI', source)
end)