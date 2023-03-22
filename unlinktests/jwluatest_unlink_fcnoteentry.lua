
function FCNoteEntry_Test_Unlinkable(measure, staff, entrynumber, partnumber)
    if finenv.RawFinaleVersion <= skip_finale_version then return end
    local entry = LoadMeasureEntry(measure, staff, entrynumber)
    if not AssureNonNil(entry, "LoadMeasureEntry("..measure..", "..staff..", "..entrynumber..")") then return end
    if not AssureNonNil(entry.RelinkToCurrentView, "FCNoteEntry.RelinkToScore not defined.") then return end
    if not AssureNonNil(entry.RelinkToScore, "FCNoteEntry.RelinkToCurrentView not defined.") then return end
    local score_manual_position = entry.ManualPosition
    local score_stem_up = entry.StemUp
    local score_freeze_stem = entry.FreezeStem
    local part_manual_position = score_manual_position + 24
    local part_stem_up = not score_stem_up
    local part_freeze_step = not score_freeze_stem
    
    if not AssureTrue(partnumber ~= finale.PARTID_SCORE, "FCNoteEntry_Test_Unlinkable Internal error: score passed instead of part. (FCNoteEntry)") then return end
    local part = finale.FCPart(partnumber)
    if not AssureTrue(part:Load(partnumber), "FCNoteEntry_Test_Unlinkable Internal error: load partnumber. (FCNoteEntry)") then return end
    
    part:SwitchTo()
    local part_entry, part_notecell = LoadMeasureEntryLocal(measure, staff, entrynumber)
    AssureNonNil(part_entry, "FCNoteEntry_Test_Unlinkable Internal error: part entry not nil. (FCNoteEntry)")
    part_entry.ManualPosition = part_manual_position
    part_entry.StemUp = part_stem_up
    part_entry.FreezeStem = part_freeze_step
    AssureTrue(part_notecell:Save(), "FCNoteEntry_Test_Unlinkable: Save part notecell succeeded.")
    part:SwitchBack()
    
    local score_entry, score_notecell = LoadMeasureEntryLocal(measure, staff, entrynumber)
    AssureNonNil(score_entry, "FCNoteEntry_Test_Unlinkable Internal error: score entry not nil. (FCNoteEntry)")
    AssureTrue(score_entry.ManualPosition == score_manual_position, "FCNoteEntry.ManualPosition is unlinkable.")
    AssureTrue(score_entry.StemUp == score_stem_up, "FCNoteEntry.StemUp is unlinkable.")
    AssureTrue(score_entry.FreezeStem == score_freeze_stem, "FCNoteEntry.FreezeStem is unlinkable.")
    
    part:SwitchTo()
    part_entry, part_notecell = LoadMeasureEntryLocal(measure, staff, entrynumber)
    AssureNonNil(part_entry, "FCNoteEntry_Test_Unlinkable Internal error: part entry not nil for RelinkToCurrentView. (FCNoteEntry)")
    AssureTrue(part_entry.ManualPosition == part_manual_position, "FCNoteEntry.ManualPosition retained unlinked value.")
    AssureTrue(part_entry.StemUp == part_stem_up, "FCNoteEntry.StemUp retained unlinked value.")
    AssureTrue(part_entry.FreezeStem == part_freeze_step, "FCNoteEntry.FreezeStem retained unlinked value.")
    AssureTrue(part_entry:RelinkToCurrentView(), "FCNoteEntry.RelinkToCurrentView succeeded.")
    part:SwitchBack()
    score_entry, score_notecell = LoadMeasureEntryLocal(measure, staff, entrynumber)
    AssureNonNil(score_entry, "FCNoteEntry_Test_Unlinkable Internal error: score entry not nil for RelinkToCurrentView. (FCNoteEntry)")
    AssureTrue(score_entry.ManualPosition == part_manual_position, "FCNoteEntry.ManualPosition relinked to part.")
    AssureTrue(score_entry.StemUp == part_stem_up, "FCNoteEntry.StemUp relinked to part.")
    AssureTrue(score_entry.FreezeStem == part_freeze_step, "FCNoteEntry.FreezeStem relinked to part.")
    
    score_entry.ManualPosition = score_manual_position
    score_entry.StemUp = score_stem_up
    score_entry.FreezeStem = score_freeze_stem
    AssureTrue(score_notecell:Save(), "FCNoteEntry_Test_Unlinkable Save score values for RelinkToScore.")
    part:SwitchTo()
    part_entry, part_notecell = LoadMeasureEntryLocal(measure, staff, entrynumber)
    AssureNonNil(part_entry, "FCNoteEntry_Test_Unlinkable Internal error: part entry not nil for RelinkToScore. (FCNoteEntry)")
    part_entry.ManualPosition = part_manual_position
    part_entry.StemUp = part_stem_up
    part_entry.FreezeStem = part_freeze_step
    AssureTrue(part_notecell:Save(), "FCNoteEntry_Test_Unlinkable: Save part notecell before RelinkToScore succeeded.")
    AssureTrue(part_entry:RelinkToScore(), "FCNoteEntry.RelinkToScore succeeded.")
    AssureTrue(part_notecell:Save(), "FCNoteEntry_Test_Unlinkable: Save part notecell after RelinkToScore succeeded.")
    AssureTrue(part_entry.ManualPosition == score_manual_position, "FCNoteEntry.ManualPosition was relinked to score.")
    AssureTrue(part_entry.StemUp == score_stem_up, "FCNoteEntry.StemUp was relinked to score.")
    AssureTrue(part_entry.FreezeStem == score_freeze_stem, "FCNoteEntry.FreezeStem was relinked to score.")
    part:SwitchBack()
end

-- Call:
FCNoteEntry_Test_Unlinkable(6, 2, 126, 2)
