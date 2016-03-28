function onDeath(cid, corpse, deathList)
local chance = math.random(1, 100)
if chance < 50 then
doSummonCreature("Slippery Northern Pike", getThingPos(cid))
else
end
end