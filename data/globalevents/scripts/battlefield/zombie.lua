dofile('data/zombieEvent.lua')

function onTime(interval, lastExecution, thinkInterval)
    if Game.getStorageValue(ze_stateGlobalStorage) < 1 then
        local teleport = Game.createItem(1387, 1, ze_createTeleportPosition)
        if teleport then
            teleport:setAttribute(ITEM_ATTRIBUTE_ACTIONID, 7000)
        end
        Game.setStorageValue(ze_stateGlobalStorage, 1)
        print('Zombie Event has started & waiting for players to join! Min: 1/100.')
        Game.broadcastMessage('The Zombie Event has started! You have '.. ze_waitTime ..' minutes to join!', MESSAGE_STATUS_WARNING)
        addEvent(startZombieEvent, ze_waitTime * 60 * 1000)
    end
    return true
end