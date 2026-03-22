-- machines
require("prototypes/hydraulic-assembling-machine")
-- require("prototypes/hydraulic-shaper")

local machine = data.raw["assembling-machine"]["hydraulic-assembling-machine"]
local base_categories = data.raw["assembling-machine"]["assembling-machine-3"].crafting_categories
local hydraulic_categories = table.deepcopy(base_categories)

--local categories_to_remove = {
--	["electronics"] = true,
--	["electronics-or-assembling"] = true,
--	["electronics-with-fluid"] = true,
--	["electromagnetics"] = true,
--}
--
--local filtered_categories = {}
--
--for _, category in pairs(hydraulic_categories) do
--	if not categories_to_remove[category] then
--		table.insert(filtered_categories, category)
--	end
--end

machine.crafting_categories = hydraulic_categories

---- copper-cable: add additional category "assembling"
--local copper_cable = data.raw.recipe["copper-cable"]
--if copper_cable then
--	copper_cable.additional_categories = copper_cable.additional_categories or {}
--
--	local has_assembling = false
--	for _, category in pairs(copper_cable.additional_categories) do
--		if category == "crafting" then
--			has_assembling = true
--			break
--		end
--	end
--
--	if not has_assembling then
--		table.insert(copper_cable.additional_categories, "crafting")
--	end
--end
