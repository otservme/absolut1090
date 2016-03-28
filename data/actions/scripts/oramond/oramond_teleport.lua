local upFloorIds = {23668}
function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if isInArray(upFloorIds, item.itemid) then
		fromPosition.y = fromPosition.y + 1
		fromPosition.z = fromPosition.z - 2
	else
		fromPosition.x = fromPosition.x + 1
		fromPosition.z = fromPosition.z + 2
	end
	player:teleportTo(fromPosition, false)
	return true
end
