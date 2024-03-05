function FCCustomKeyModeSymbolList_ValueTests_ItemNo1(obj, itemno)
   NumberValuePropertyTest_RO(obj, "FCCustomKeyModeSymbolList", "ItemNo", itemno)
   TableValuePropertyTest(obj, "FCCustomKeyModeSymbolList", "List",
       { [-7]="Bbbb", [-6]="bbb", [-5]="Bº", [-4]="º", [-3]="Bb", [-2]="b", [-1]="B",
        [0]="n", [1]="µ", [2]="m", [3]="÷", [4]="M", [5]="Mµ", [6]="Mm", [7]="M÷" })
end


-- Call:
local obj = finale.FCCustomKeyModeSymbolList()
AssureTrue(obj:Load(1), "FCCustomKeyModeSymbolList:Load(1)")
FCCustomKeyModeSymbolList_ValueTests_ItemNo1(obj, 1)

local lists = finale.FCCustomKeyModeSymbolLists()
local org_count = lists:LoadAll()

local newobj = finale.FCCustomKeyModeSymbolList()
newobj.List = obj.List
AssureTrue(newobj:Save(), "FCCustomKeyModeSymbolList:Save() to create a new one.")
AssureFalse(lists:LoadAll() == org_count, "Added a FCCustomKeyModeSymbolList but count did not increase.")
FCCustomKeyModeSymbolList_ValueTests_ItemNo1(newobj, newobj.ItemNo)
AssureTrue(newobj:DeleteData(), "FCCustomKeyModeSymbolList:DeleteData()")
AssureEqual(lists:LoadAll(), org_count, "Deleted a FCCustomKeyModeSymbolList but count did not decrease.")
