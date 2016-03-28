-- Ferumbras Quest feita por Ciroc
function onUse(cid, item, fromPosition, itemEx)
	local player = Player(cid)
	if not player then
		return true
	end
	local daysvalue = 2 * 24 * 60 * 60
        time = os.time() + daysvalue
	if player:getStorageValue(45598) <= 0 then
		player:addItem(25655, 5)
		player:setStorageValue(45598, time)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Congratulations, you got your reward.')
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You already got your reward.')
	end
	if player:getStorageValue(45599) <= 0 then
		player:addItem(2160, 10)
		player:addItem(25393, 4)
		player:addItem(25387, 4)
		player:addItem(25431, 1)
		player:addOutfitAddon(845, 2)
		player:addOutfitAddon(845, 1)
		player:addOutfitAddon(846, 2)
		player:addOutfitAddon(846, 1)
		player:setStorageValue(45599, 1)
		player:setStorageValue(54989, 1)
        end
	return true
end