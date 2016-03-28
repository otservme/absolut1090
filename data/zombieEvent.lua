-- Store player kills
if zombieKillCount == nil then
    zombieKillCount = {}
end
 
-- Zombie Variables
ze_zombieName = "Zombie Event" -- Zombie name
ze_timeToStartInvasion = 30 -- When should the first zombie be summoned [seconds]
ze_zombieSpawnInerval = 30 -- The interval of each zombie that will get summoned
ze_zombieMaxSpawn = 20 -- Max zombies in the arena
ze_zombieCountGlobalStorage = 100 -- Use empty global storage
 
-- Player Variables
ze_joinStorage = 3549 -- Storage that will be added, when player join
ze_minPlayers = 1 -- Minimum players that have to join
ze_maxPlayers = 100 -- Maxnimum players that can join
ze_joinCountGlobalStorage = 101 -- Use empty global storage
 
-- States
ze_stateGlobalStorage = 68932 -- Use empty global storage
ze_EVENT_CLOSED = 0
ze_EVENT_STATE_STARTUP = 1
ze_EVENT_STARTED = 2
 
-- Waiting room
zeWaitingRoomPos = Position(32141, 33286, 12) -- Where should player be teleport in waiting room
ze_waitingRoomCenterPosition = Position(32141, 32286, 12) -- Center of the waiting room
ze_waitingRoomRadiusX = 25 -- Depends how big the arena room is 25sqm to x
ze_waitingRoomRadiusY = 25 -- Depends how big the arena room is 25sqm to y
 
-- Zombie arena
ze_zombieArenaStartPosition = Position(32176, 32280, 12) -- When even start where should player be teleported in the zombie arena?
ze_arenaCenterPosition = Position(32176, 32280, 12) -- Center position of the arena
ze_arenaFromPosition = Position(32159, 32273, 12) -- Pos of top left corner
ze_arenaToPosition = Position(32188, 32286, 12) -- Pos of bottom right corner
ze_arenaRoomRadiusX = 50 -- Depends how big the arena room is 50sqm to x
ze_arenaRoomRadiusY = 50 -- Depends how big the arena room is 50sqm to y
ze_arenaRoomMultifloor = false -- Does the arena have more floors than one?
 
-- Other variables
ze_waitTime = 10 -- How long until the event begin?
ze_createTeleportPosition = Position(32360, 32239, 7) -- Where should the teleport be created?
ze_teleportActionId = 7000 -- Actionid of the teleport
ze_trophiesTable = {
    [1] = {itemid = 7369, description = "won first place on Zombie Event."},
    [2] = {itemid = 7370, description = "won second place on Zombie Event."},
    [3] = {itemid = 7371, description = "won third place on Zombie Event."}
}
 
-- Get methods
function getZombieEventZombieCount()
    return Game.getStorageValue(ze_zombieCountGlobalStorage)
end
 
function getZombieEventJoinedCount()
    return Game.getStorageValue(ze_joinCountGlobalStorage)
end
 
function setZombieEventState(value)
    Game.setStorageValue(ze_stateGlobalStorage, value)
end
 
function getZombieEventState()
    return Game.getStorageValue(ze_stateGlobalStorage) or ze_EVENT_CLOSED
end
 
function resetZombieEvent()
    -- Reset variables
    Game.setStorageValue(ze_zombieCountGlobalStorage, 0)
    Game.setStorageValue(ze_joinCountGlobalStorage, 0)
    setZombieEventState(ze_EVENT_CLOSED)
 
    -- Clear the arena from zombies
    local spectator = Game.getSpectators(ze_arenaCenterPosition, ze_arenaRoomMultifloor, false, 0, ze_arenaRoomRadiusX, 0, ze_arenaRoomRadiusY)
    for i = 1, #spectator do
        if spectator[i]:isMonster() then
            spectator[i]:remove()
        end
    end
end
 
function startZombieEvent()
    local spectator = Game.getSpectators(ze_waitingRoomCenterPosition, ze_arenaRoomMultifloor, false, 0, ze_waitingRoomRadiusX, 0, ze_waitingRoomRadiusY)
    if getZombieEventJoinedCount() < ze_minPlayers then
        for i = 1, #spectator do
            spectator[i]:teleportTo(spectator[i]:getTown():getTemplePosition())
            spectator[i]:setStorageValue(ze_joinStorage, 0)
        end
 
        resetZombieEvent()
        Game.broadcastMessage("Zombie event failed to start, due to not enough of participants.")
    else
        for i = 1, #spectator do
            spectator[i]:teleportTo(ze_zombieArenaStartPosition)
            spectator[i]:registerEvent("ZombiePlayerDeath")
        end
 
        Game.broadcastMessage("Zombie Event has started, good luck to all participants.")
        setZombieEventState(ze_EVENT_STARTED)
        addEvent(startZombieInvasion, ze_timeToStartInvasion * 1000)
    end
 
    -- Remove Teleport
    local item = Tile(ze_createTeleportPosition):getItemById(1387)
    if item:isTeleport() then
        item:remove()
    end
end
 
function startZombieInvasion()
    if getZombieEventState() == ze_EVENT_STARTED then
        local random = math.random
        local zombie = Game.createMonster(ze_zombieName, Position(random(ze_arenaFromPosition.x, ze_arenaToPosition.x), random(ze_arenaFromPosition.y, ze_arenaToPosition.y), random(ze_arenaFromPosition.z, ze_arenaToPosition.z)))
        if zombie then
            Game.setStorageValue(ze_zombieCountGlobalStorage, getZombieEventZombieCount() + 1)
        end
 
        addEvent(startZombieInvasion, ze_zombieSpawnInerval * 1000)
    end
end
 
function setupZombieEvent(minPlayers, maxPlayers, waitTime)
    -- Event is not closed, then stop from start new one
    if getZombieEventState() ~= ze_EVENT_CLOSED then
        return
    end
 
    -- Create teleport and set the respective action id
    local item = Game.createItem(1387, 1, ze_createTeleportPosition)
    if item:isTeleport() then
        item:setAttribute(ITEM_ATTRIBUTE_ACTIONID, ze_teleportActionId)
    end
 
    -- Change the variables, to the new ones
    ze_minPlayers = minPlayers
    ze_maxPlayers = maxPlayers
    ze_waitTime = waitTime
 
    -- Set the counts, state, broadcast and delay the start of the event.
    Game.setStorageValue(ze_zombieCountGlobalStorage, 0)
    Game.setStorageValue(ze_joinCountGlobalStorage, 0)
    setZombieEventState(ze_EVENT_STATE_STARTUP)
    Game.broadcastMessage(string.format("The Zombie Event has started! The event require atleast %d and max %d players, you have %d minutes to join.", minPlayers, maxPlayers, waitTime))
    addEvent(startZombieEvent, waitTime * 60 * 1000)
end