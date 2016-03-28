local portals = {
	[63001] = {110001}, --venore
	[63002] = {110002}, --thais
	[63003] = {110003}, --kazordoon
	[63004] = {110004}, --carlin
	[63005] = {110005}, --ab'dendriel
	[63006] = {110006}, --liberty bay
	[63007] = {110007}, --port hope
	[63008] = {110008}, --ankrahmun
	[63009] = {110009}, --darashia
	[63010] = {110010}, --edron
	[63011] = {110011}, --svargrond
	[63012] = {110012}, --yalahar
	[63013] = {110013}, --farmine
	[63014] = {110014}, --gray beach
	[63015] = {110015}, --roshamuul
	[63016] = {110016},  --rathleton
	[63017] = {110017}  --rookgaard
}

local pos = Position(17127, 16964, 7)

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local storage = portals[item.uid]
	if not storage then
		return true
	end

	player:teleportTo(pos)
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	player:setStorageValue(storage[1], 1)
	return true
end
