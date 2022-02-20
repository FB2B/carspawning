local LevelRoles = {
    -- {discord_role_id, perm_level}
    {00000000001, 1},
    {00000000002, 2},
}

-------

local power = 0
RegisterServerEvent('carspawning:GetPermissions')
AddEventHandler('carspawning:GetPermissions', function(player)
    local plr = player
    local playerRoles = exports.Badger_Discord_API:GetDiscordRoles(plr)

    for i = 1, #playerRoles do
        local prole = playerRoles[i]
        for j = 1, #LevelRoles do
            local role = LevelRoles[i]

            if prole == role[1] then
                if prole[2] > power then
                    power = prole[2]
                end
            end
        end
    end

    TriggerClientEvent('carspawning:ReturnPermissions', source, power)
end)

RegisterCommand("spawn", function(source, args, rawCommand)
    TriggerClientEvent('carspawning:openGUI', source)
end)