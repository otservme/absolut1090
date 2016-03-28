function onRecord(current, old)
	addEvent(Game.broadcastMessage, 150, 'Novo recorde: ' .. current .. ' jogadores online.', MESSAGE_STATUS_DEFAULT)
	return true
end
