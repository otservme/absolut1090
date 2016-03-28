local running = false
function onThink(cid)
local hp = (getCreatureHealth(cid)/getCreatureMaxHealth(cid))*100
local summons = getCreatureSummons(cid)
	if (hp < 50 and not running and #summons < 3) then
	running = true
	addEvent(Boom, 1000, cid) 
	elseif (hp < 3 and not running) then
	running = true
	addEvent(Boom2, 1000, cid) 
	end
	end

function Boom (cid)
	doCreatureSay(cid, "OMRAFIR EXPLODES INTO FLAMES!", TALKTYPE_ORANGE_2)
	running = false
	doSummonCreature("Hellfire Fighter", { x=33585, y=32373, z=12 })
	doSummonCreature("Hellfire Fighter", { x=33587, y=32374, z=12 })
	doSummonCreature("Hellfire Fighter", { x=33590, y=32374, z=12 })
	doSummonCreature("Hellfire Fighter", { x=33592, y=32378, z=12 })
	doSummonCreature("Hellfire Fighter", { x=33589, y=32379, z=12 })
	doSummonCreature("Hellfire Fighter", { x=33584, y=32381, z=12 })
	doSummonCreature("Hellfire Fighter", { x=33590, y=32382, z=12 })
	doSummonCreature("Hellfire Fighter", { x=33595, y=32381, z=12 })
	doSummonCreature("Hellfire Fighter", { x=33588, y=32378, z=12 })
	doSummonCreature("Hellfire Fighter", { x=33581, y=32379, z=12 })
	doSendMagicEffect(getCreaturePosition(cid), CONST_ME_FIREATTACK)
	doRemoveCreature(cid)
	addEvent(Spawn, 10000, cid) 
	end
	
function Spawn(cid)
doSummonCreature("Omrafir", { x=33586, y=32379, z=12 })
end

function Boom2 (cid)
	doCreatureSay(cid, "OMRAFIR EXPLODES INTO FLAMES!", TALKTYPE_ORANGE_2)
	running = false
	doSummonCreature("Hellfire Fighter", { x=33585, y=32373, z=12 })
	doSummonCreature("Hellfire Fighter", { x=33587, y=32374, z=12 })
	doSummonCreature("Hellfire Fighter", { x=33590, y=32374, z=12 })
	doSummonCreature("Hellfire Fighter", { x=33592, y=32378, z=12 })
	doSummonCreature("Hellfire Fighter", { x=33589, y=32379, z=12 })
	doSummonCreature("Hellfire Fighter", { x=33584, y=32381, z=12 })
	doSummonCreature("Hellfire Fighter", { x=33590, y=32382, z=12 })
	doSummonCreature("Hellfire Fighter", { x=33595, y=32381, z=12 })
	doSummonCreature("Hellfire Fighter", { x=33588, y=32378, z=12 })
	doSummonCreature("Hellfire Fighter", { x=33581, y=32379, z=12 })
	doSendMagicEffect(getCreaturePosition(cid), CONST_ME_FIREATTACK)
	doRemoveCreature(cid)
	addEvent(Spawn2, 10000, cid) 
	end
	
	function Spawn2(cid)
summon = doSummonCreature("Omrafir2", { x=33586, y=32379, z=12 })
doCreatureSay(summon, "OMRAFIR REFORMS HIMSELF WITH NEW STRENGTH!", TALKTYPE_ORANGE_2)

	return true
end