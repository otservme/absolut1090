function onThink(cid)
    local hp = (getCreatureHealth(cid)/getCreatureMaxHealth(cid))*100
      if isMonster(cid) and getCreatureName(cid) == "Egg" and hp == 100 then
        addEvent(transform, 10000, cid)
    end
end

function transform(cid)
    if isMonster(cid) then
        local pos = getCreaturePosition(cid)
        doSendMagicEffect(pos, CONST_ME_POISONAREA)
        doRemoveCreature(cid)
        local summon = doSummonCreature("Spawn Of The Welter", pos)
        if summon == false then
            return false
        end
    end
    return true
end