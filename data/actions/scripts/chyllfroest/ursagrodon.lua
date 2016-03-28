function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 22719) then
		if(itemEx.itemid == 22722) and getPlayerStorageValue(cid, 16410) < 1 then
			doPlayerSendTextMessage(cid, 19, "You managed to melt about half of the ice blook. Quickly now, it's ice cold here and the ice block could freeze over again.")
			doTransformItem(getTileItemById(toPosition,22722).uid,22723)
			setPlayerStorageValue(cid, 16410, 1)
		elseif (itemEx.itemid == 22722) and getPlayerStorageValue(cid, 16410) == 3 then
			doPlayerSendCancel(cid, "You already have the Ursagrodon.")
		end
		if(itemEx.itemid == 22723) and getPlayerStorageValue(cid, 16410) == 1 then
			doPlayerSendTextMessage(cid, 19, "You managed to melt almost the whole block, only the feet of the creature are still stuck in the ice. Finish the job!")
			doTransformItem(getTileItemById(toPosition,22723).uid,22724)
			setPlayerStorageValue(cid, 16410, 2)
		end
		if(itemEx.itemid == 22724) and getPlayerStorageValue(cid, 16410) == 2 then
			doPlayerSendTextMessage(cid, 19, "The freed Ursagrodon looks at you with glowing, obedient eyes.")
			setPlayerStorageValue(cid, 16410, 3)
			doPlayerAddMount(cid,38)
			doRemoveItem(item.uid, 1)
			end
		end
	return true
end