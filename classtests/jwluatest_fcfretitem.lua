if not AssureNonNil(finale.FCFretboardGroupItem) then
    return
end

local group_item = finale.FCFretboardGroupItem()
if not AssureTrue(group_item:Load(65534, 0, 11), "FCFretGroupItem Load failed for FCFretItem test") then
    return
end
if not AssureTrue(group_item.FretItems.Count > 0, "FCFretGroupItem no FCFretItem items exist.") then
    return
end

local function savefunc(obj)
    return group_item:Save()
end

local function reloadfunc(obj)
    if not group_item:Reload() then
        return nil
    end
    return group_item.FretItems:GetItemAt(0)
end

function FCFretItem_PropertyTests(obj)
   obj = NumberPropertyTest(obj, "FCFretItem", "FretNumber", {0, 5, 12, 31, 63}, savefunc, reloadfunc)
   obj = NumberPropertyTest(obj, "FCFretItem", "Fingering", {finale.FRETFINGERING_NONE, finale.FRETFINGERING_FIRST,
                finale.FRETFINGERING_SECOND, finale.FRETFINGERING_THIRD, finale.FRETFINGERING_FOURTH, finale.FRETFINGERING_THUMB}, savefunc, reloadfunc)
   obj = NumberPropertyTest(obj, "FCFretItem", "StringNumber", {1, 5, 12, 31}, savefunc, reloadfunc)
   obj = NumberPropertyTest(obj, "FCFretItem", "Symbol", {finale.FRETITEM_NONE, finale.FRETITEM_DOT, finale.FRETITEM_CIRCLE,
                finale.FRETITEM_X, finale.FRETITEM_DIAMOND}, savefunc, reloadfunc)
end

-- Call:
local obj = group_item.FretItems:GetItemAt(0)
FCFretItem_PropertyTests(obj)
