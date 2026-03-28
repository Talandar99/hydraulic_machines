-- machines
require("prototypes/hydraulic-assembling-machine")
-- require("prototypes/hydraulic-shaper")

local machine = data.raw["assembling-machine"]["hydraulic-assembling-machine"]
local base_categories = data.raw["assembling-machine"]["assembling-machine-3"].crafting_categories
local hydraulic_categories = table.deepcopy(base_categories)
table.insert(hydraulic_categories, "hydraulic-assembling")
machine.crafting_categories = hydraulic_categories
