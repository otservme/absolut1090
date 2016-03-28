local condition = createConditionObject(CONDITION_REGENERATION)
setConditionParam(condition, CONDITION_PARAM_SUBID, 88888)
setConditionParam(condition, CONDITION_PARAM_TICKS, 15 * 60 * 1000)
setConditionParam(condition, CONDITION_PARAM_HEALTHGAIN, 0.01)
setConditionParam(condition, CONDITION_PARAM_HEALTHTICKS, 15 * 60 * 1000)

function onPrepareDeath(cid, lastHitKiller, mostDamageKiller)

    if isCreature(cid) == true and getCreatureName(cid) == "Hirintror" then
        if getCreatureCondition(cid, CONDITION_REGENERATION, 88888) == false then
            doAddCondition(cid, condition)
            doCreatureAddHealth(cid, 1000)
            return false
        end
    else
        return false
    end
    return true
end