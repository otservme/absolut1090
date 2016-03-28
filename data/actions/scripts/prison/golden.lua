function onUse(cid, item, fromPosition, itemEx)
	local player = Player(cid)
	if not player then
		return true
	end
        if(item.itemid == 22607) then
		if(itemEx.itemid == 22641) then
	        if player:getStorageValue(1) then
				pos1 = {x = 33607, y = 32362, z = getCreaturePosition(cid).z}
				pos2 = {x = 33608, y = 32362, z = getCreaturePosition(cid).z}
				pos3 = {x = 33609, y = 32362, z = getCreaturePosition(cid).z}
				pos4 = {x = 33610, y = 32362, z = getCreaturePosition(cid).z}
				pos5 = {x = 33611, y = 32362, z = getCreaturePosition(cid).z}
				if(isPlayer(getTopCreature(pos1).uid)) then
				if(isPlayer(getTopCreature(pos2).uid)) then
				if(isPlayer(getTopCreature(pos3).uid)) then
				if(isPlayer(getTopCreature(pos4).uid)) then
				if(isPlayer(getTopCreature(pos5).uid)) then
					doTeleportThing(getTopCreature(pos1).uid, {x = 33528, y = 32341, z = 12})
					doTeleportThing(getTopCreature(pos2).uid, {x = 33528, y = 32341, z = 12})
					doTeleportThing(getTopCreature(pos3).uid, {x = 33528, y = 32341, z = 12})
					doTeleportThing(getTopCreature(pos4).uid, {x = 33528, y = 32341, z = 12})
					doTeleportThing(getTopCreature(pos5).uid, {x = 33528, y = 32341, z = 12})
		doRemoveItem(item.uid, 1)
			end
		    end
	       end
	  end
     end
end
end
end
	return true
end