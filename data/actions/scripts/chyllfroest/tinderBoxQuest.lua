 local config = {
        storage = 75123,
        item_id = 22721 -- item ID
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
        if getPlayerStorageValue(cid, config.storage) == -1 then
                setPlayerStorageValue(cid, config.storage, 1)
				doPlayerSendTextMessage(cid,19, "You have found a tinder box.")
                doPlayerAddItem(cid, config.item_id, 1)		
        else
                doPlayerSendTextMessage(cid,19, "The pile of bones is empty.")
        end
end