	gloothv = {x=33650, y=31942, z=7}
	
function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end
	player:teleportTo(gloothv)
	return true
end