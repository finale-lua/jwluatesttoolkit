function FCCustomKeyModeSymbolList_PropertyTests(obj)
    local function reload_func()
        return obj:Load(obj.ItemNo) and obj
    end
    NumberPropertyTest_RO(obj, "FCCustomKeyModeSymbolList", "ItemNo", {0, 1, 12, 16385})
    TablePropertyTest(obj, "FCCustomKeyModeSymbolList", "List",
        {{[0]="a", [1]="#", [-1]="b", [-2]="bb", [2]="##"}, {[-3]="vvv"}, finale.FCCustomKeyModeSymbolList.GetDefaultList()},
        nil, reload_func)
end


-- Call:
local obj = finale.FCCustomKeyModeSymbolList()
AssureTrue(obj:Load(1), "FCCustomKeyModeSymbolList:Load()")
FCCustomKeyModeSymbolList_PropertyTests(obj)
