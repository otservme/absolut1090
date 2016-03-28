local pos = {
[1] = {x = 32270, y = 32180, z = 8},
[2] = {x = 32269, y = 32180, z = 8},
team1 = {x = 32255, y = 32169, z = 9},
team2 = {x = 32254, y = 32188, z = 9} 
}

local posMidle = {x = 32255, y = 32179, z = 9}
local rangex = 23 
local rangey = 20 

local itemremove = 5958


function onUse(cid, item, fromPosition, itemEx)
	local player = Player(cid)

	if #Game.getSpectators(posMidle, false, true, rangex, rangex, rangey, rangey) == 0 then
		for i = 1, #pos do
			if not isPlayer(getTopCreature(pos[i]).uid) then
				return player:sendCancelMessage("You need two players to start the arena.")			
			end
		end	
		if not doPlayerRemoveItem(cid, itemremove, 1) then
			return player:sendCancelMessage("You must have "..  getItemName(itemremove) .." with you in order to enter here.")			
		end
		
		for i = 1, #pos do
			if isPlayer(getTopCreature(pos[i]).uid) then
				if i <= #pos/2 then			
					doTeleportThing(getTopCreature(pos[i]).uid, pos.team1)
                                        doSendMagicEffect(pos.team1, 37)
				else
					doTeleportThing(getTopCreature(pos[i]).uid, pos.team2)
                                        doSendMagicEffect(pos.team2, 37)
				end
                                doPlayerSendTextMessage(cid, 19, "You entered in the PVP Arena, survive if you can.")
			end
		end
	else
		player:sendCancelMessage("The arena is being used at this moment.")
	end	
return true
end