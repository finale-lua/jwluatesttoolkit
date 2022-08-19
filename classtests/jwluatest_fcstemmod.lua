function FCStemMod_PropertyTests(obj)
   NumberPropertyTest(obj, "FCStemMod", "HorizontalDownOffset", {-12, 0, 12})
   NumberPropertyTest(obj, "FCStemMod", "HorizontalUpOffset", {-12, 0, 12})
   NumberPropertyTest(obj, "FCStemMod", "VerticalDownOffset", {-12, 0, 12})
   NumberPropertyTest(obj, "FCStemMod", "VerticalUpOffset", {-12, 0, 12})
end

local FCStemMod_ClassProcessEntry = function(entry)
    if AssureNonNil(entry, "FCStemMod_ClassProcessEntry") then
        local obj = finale.FCStemMod()
        obj:SetNoteEntry(entry)
        if AssureTrue(obj:LoadFirst(), "FCStemMod_ProcessEntry: LoadFirst") then
            FCStemMod_PropertyTests(obj)
        end
    end
end

-- Call:
FCStemMod_ClassProcessEntry(LoadMeasureEntry(12, 2, 301))
FCStemMod_ClassProcessEntry(LoadMeasureEntry(12, 2, 302))
