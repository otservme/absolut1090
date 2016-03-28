local config = {
	[2260] = {
		corpse = 2057
	         }
               }
local teleportTobPosition = Position(32347, 32123, 8)
function onAddItem(moveitem, tileitem, position)
	local target = config[tileitem.itemid]
	if not target then
		return true
	end

	if target.corpse ~= moveitem.itemid then
		return true
	end

	local itemb = Game.createItem(1387, 1, teleportTobPosition)
	if itemb:isTeleport() then
		itemb:setDestination(teleportTobPosition)
	end
	return true
end