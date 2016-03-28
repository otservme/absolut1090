local position = {
    [1] = {pos = {x=33170, y=31730, z=9}},
    [2] = {pos = {x=33175, y=31736, z=9}},
    [3] = {pos = {x=33174, y=31747, z=9}},
    [4] = {pos = {x=33164, y=31744, z=9}}
}

function onThink(cid)
local chance = math.random(1, 100)
if chance < 7 then
    if(not isCreature(cid)) then 
	return true
end
    local spawn = position[math.random(4)]
    doTeleportThing(cid, spawn.pos)
    doSendMagicEffect(spawn.pos, CONST_ME_TELEPORT)
    return true
	end
end