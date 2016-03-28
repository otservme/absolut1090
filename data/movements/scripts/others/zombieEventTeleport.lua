dofile('data/zombieEvent.lua')
	zombieespera = {x=32141, y=32286, z=12}

function onStepIn(cid, item, position, fromPosition)
        local player = Player(cid)
        if not player then
            return false
        end
  
        if Game.getStorageValue(ze_stateGlobalStorage) == 2 then
            player:sendTextMessage(MESSAGE_INFO_DESCR, 'The Zombie Event has already started.')
            player:teleportTo(fromPosition, true)
            return false
        end
  
        if Game.getStorageValue(ze_stateGlobalStorage) == 0 then
            player:sendTextMessage(MESSAGE_INFO_DESCR, 'The Zombie Event has not started yet.')
            player:teleportTo(fromPosition, true)
            return false
        end
  
       if Game.getStorageValue(ze_joinCountGlobalStorage) > ze_maxPlayers then
            player:teleportTo(fromPosition, true)
            player:sendTextMessage(MESSAGE_INFO_DESCR, 'The Zombie Event is already full! ['.. Game.getStorageValue(zeJoinedCountGlobalStorage) ..'/'.. zeMaxPlayers ..']')
            return false
        end
  
        player:teleportTo(zombieespera)
        Game.setStorageValue(ze_joinCountGlobalStorage, Game.getStorageValue(ze_joinCountGlobalStorage) + 1)
        Game.broadcastMessage(string.format('%s has joined the Zombie Event! [%s/'.. ze_maxPlayers ..'].', player:getName(), Game.getStorageValue(ze_joinCountGlobalStorage)), MESSAGE_STATUS_WARNING)
        player:setStorageValue(ze_joinStorage, 1)
        return true
end