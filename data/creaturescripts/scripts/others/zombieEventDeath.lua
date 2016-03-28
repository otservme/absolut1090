function onDeath(monster, corpse, killer, mostDamage, unjustified, mostDamage_unjustified)
    -- Send text and effect
    monster:say("I WILL BE BACK!", TALKTYPE_MONSTER_YELL)
    monster:getPosition():sendMagicEffect(CONST_ME_MORTAREA)

    -- Remove zombie count, when it dies
    Game.setStorageValue(ze_zombieCountGlobalStorage, getZombieEventZombieCount() - 1)

    -- Store player kills
    local killerId = killer:getId()
    if zombieKillCount[killerId] ~= nil then
        zombieKillCount[killerId] = zombieKillCount[killerId] + 1
    else
        zombieKillCount[killerId] = 1
    end

    return true
end

function onPrepareDeath(player, killer)
    -- Remove player from count
    local count = getZombieEventJoinedCount()
    Game.setStorageValue(ze_joinCountGlobalStorage, count - 1)

    -- Reset player after death
    player:teleportTo(player:getTown():getTemplePosition())
    player:setStorageValue(ze_joinStorage, 0)
    player:addHealth(player:getMaxHealth())
    player:addMana(player:getMaxMana())
    player:unregisterEvent("ZombiePlayerDeath")

    -- Let's reward the 3 last players
    if count <= 3 then
        local playerName =  player:getName()

        local trophy = ze_trophiesTable[count]
        local item = player:addItem(trophy.itemid, 1)
        if item then
            item:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, string.format("%s %s\n%s.", playerName, trophy.description, os.date("%x")))
        end

        -- Store kill count and remove from table to avoid memory leak
        local playerId, killCount = player:getId(), 0
        if zombieKillCount[playerId] ~= nil then
            killCount = zombieKillCount[playerId]
            zombieKillCount[playerId] = nil
        end

        -- Broadcast
        Game.broadcastMessage(string.format("%d place goes to %s of Zombie Event versus %d Zombies and slained %d Zombies.", count, playerName, getZombieEventZombieCount(), killCount))

        -- The last player died, let's reset the event
        if count <= 1 then
            resetZombieEvent()
        end
    end

    return false
end