function onDeath(cid, corpse, deathList)
local chance = math.random(1, 100)
if chance < 50 then
doCreatureSay(cid, "The elves came too late to save the deer, however they might avenge it.", TALKTYPE_ORANGE_1)
doSummonCreature("Elf Scout", getCreaturePosition(cid))
doSummonCreature("Elf Scout", getCreaturePosition(cid))
end
end