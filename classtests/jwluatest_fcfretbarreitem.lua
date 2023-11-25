if not AssureNonNil(finale.FCFretboardGroupItem) then
    return
end

local group_item = finale.FCFretboardGroupItem()
if not AssureTrue(group_item:Load(65534, 0, 11), "FCFretGroupItem Load failed for FCFretBarreItem test") then
    return
end
if not AssureTrue(group_item.FretBarreItems.Count > 0, "FCFretGroupItem no FCFretBarreItem items exist.") then
    return
end

local function savefunc(obj)
    return group_item:Save()
end

local function reloadfunc(obj)
    if not group_item:Reload() then
        return nil
    end
    return group_item.FretBarreItems:GetItemAt(0)
end

function FCFretBarreItem_PropertyTests(obj)
   obj = NumberPropertyTest(obj, "FCFretBarreItem", "FretNumber", {0, 5, 12, 31, 63}, savefunc, reloadfunc)
   obj = NumberPropertyTest(obj, "FCFretBarreItem", "LeftStringNumber", {1, 5, 12, 31}, savefunc, reloadfunc)
   obj = NumberPropertyTest(obj, "FCFretBarreItem", "RightStringNumber", {1, 5, 12, 31}, savefunc, reloadfunc)
end


-- Call:
local obj = group_item.FretBarreItems:GetItemAt(0)
FCFretBarreItem_PropertyTests(obj)
