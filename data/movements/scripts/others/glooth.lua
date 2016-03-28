	gloothf = {x=33559, y=31970, z=12}
	
function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end
	player:teleportTo(gloothf)
	return true
end