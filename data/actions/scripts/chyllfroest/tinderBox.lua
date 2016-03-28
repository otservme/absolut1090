function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 22721) then
		if(itemEx.itemid == 22720) then
				doRemoveItem(item.uid, 1)
				doRemoveItem(itemEx.uid, 1)
				doPlayerAddItem(cid, 22719, 1)
			end
		end
	return true
end