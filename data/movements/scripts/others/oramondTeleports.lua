local portals = {
	[50510] = {position = Position(33458, 31714, 9), message = 'Slrrp!', premium = true}, --entrance
	[50511] = {position = Position(33668, 31888, 5), message = 'Slrrp!', premium = false}, --exit
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local portal = portals[item.uid]
	if portal then
		if not player:isPremium() and portal.premium then
			player:teleportTo(fromPosition)
			player:sendCancelMessage("You need a premium account to access this area.")
			fromPosition:sendMagicEffect(CONST_ME_POFF)
			return true
		end
		player:teleportTo(portal.position)
		item:getPosition():sendMagicEffect(CONST_ME_GREEN_RINGS)
		player:say(portal.message, TALKTYPE_MONSTER_SAY)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end
	return true
end
