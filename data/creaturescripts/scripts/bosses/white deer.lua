function onDeath(cid, corpse, deathList)
local chance = math.random(1, 100)
if chance < 30 then
doCreatureSay(cid, "The white deer summons all his strength and turns to fight!", TALKTYPE_ORANGE_1)
doSummonCreature("Enraged White Deer", getCreaturePosition(cid))
else
doCreatureSay(cid, "The white deer desperately tries to escape!", TALKTYPE_ORANGE_1)
doSummonCreature("Desperate White Deer", getCreaturePosition(cid))
end
end