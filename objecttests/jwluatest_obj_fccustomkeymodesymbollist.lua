function FCCustomKeyModeSymbolList_ValueTests_ItemNo1(obj)
   NumberValuePropertyTest_RO(obj, "FCCustomKeyModeSymbolList", "ItemNo", 1)
   TableValuePropertyTest(obj, "FCCustomKeyModeSymbolList", "List",
       { [-7]="Bbbb", [-6]="bbb", [-5]="Bº", [-4]="º", [-3]="Bb", [-2]="b", [-1]="B",
        [0]="n", [1]="µ", [2]="m", [3]="÷", [4]="M", [5]="Mµ", [6]="Mm", [7]="M÷" })
end


-- Call:
local obj = finale.FCCustomKeyModeSymbolList()
AssureTrue(obj:Load(1), "FCCustomKeyModeSymbolList:Load(1)")
FCCustomKeyModeSymbolList_ValueTests_ItemNo1(obj)
