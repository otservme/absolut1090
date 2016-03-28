function onThink(cid)
local hp = (getCreatureHealth(cid)/getCreatureMaxHealth(cid))*100
	if (hp < 75) then
		doCreatureSay(cid, "Dare to follow me to my Sanctuary below and you shall DIE!", TALKTYPE_ORANGE_1)
			doRemoveCreature(cid)
			doSummonCreature("The Pale Count", { x=32972, y=32419, z=15 })
	end
	return true
end