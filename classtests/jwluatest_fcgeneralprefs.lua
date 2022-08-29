function FCGeneralPrefs_PropertyTests(obj)
    BoolPropertyTest(obj, "FCGeneralPrefs", "AutomaticUpdateLayout")
    if finenv.FinaleVersion > 10025 then
        BoolPropertyTest(obj, "FCGeneralPrefs", "DottedRestsAreLegalInCompoundMeter") -- weirdly, Finale 25 can't handle this BoolPropertyTest
    end
    BoolPropertyTest(obj, "FCGeneralPrefs", "DottedRestsAreLegalInSimpleMeter")
    BoolPropertyTest(obj, "FCGeneralPrefs", "IncludeMIDITempoChanges")
    BoolPropertyTest(obj, "FCGeneralPrefs", "IncludeMIDIContinuousData")
    NumberPropertyTest(obj, "FCGeneralPrefs", "KeyboardSplitPoint", {0, 62, 127})
    NumberPropertyTest(obj, "FCGeneralPrefs", "MeasurementUnit", {finale.MEASUREMENTUNIT_EVPUS,
        finale.MEASUREMENTUNIT_INCHES, finale.MEASUREMENTUNIT_CENTIMETERS, finale.MEASUREMENTUNIT_PICAS, finale.MEASUREMENTUNIT_POINTS,
        finale.MEASUREMENTUNIT_SPACES, finale.MEASUREMENTUNIT_MILLIMETERS})
    NumberPropertyTest(obj, "FCGeneralPrefs", "PitchRepresentationType", {0, 1})
    NumberPropertyTest(obj, "FCGeneralPrefs", "PitchRepresentationValue", {0, -12, 12})
    NumberPropertyTest(obj, "FCGeneralPrefs", "QuantizationGraceNoteMode", {finale.GRACEQUANTMODE_ALLOW,
        finale.GRACEQUANTMODE_REMOVE, finale.GRACEQUANTMODE_CONVERT})
    BoolPropertyTest(obj, "FCGeneralPrefs", "QuantizationIncludeVoiceTwo")
    NumberPropertyTest(obj, "FCGeneralPrefs", "QuantizationMode", {finale.QUANTIZATIONMODE_NOTUPLETS,
        finale.QUANTIZATIONMODE_MIXRHYTHMS, finale.QUANTIZATIONMODE_SPACEEVENLY})
    BoolPropertyTest(obj, "FCGeneralPrefs", "QuantizationRetainKeyVelocities")
    BoolPropertyTest(obj, "FCGeneralPrefs", "QuantizationRetainNoteDurations")
    NumberPropertyTest(obj, "FCGeneralPrefs", "QuantizationSensitivityLevel", {0, 128, 217})
    NumberPropertyTest(obj, "FCGeneralPrefs", "QuantizationSmallestNoteValue", {0, 128, 217})
    BoolPropertyTest(obj, "FCGeneralPrefs", "QuantizationSoftenSyncopations")
    BoolPropertyTest(obj, "FCGeneralPrefs", "RebarStopAtEndOfRegion")
    BoolPropertyTest(obj, "FCGeneralPrefs", "RebarStopAtEmptyFrame")
    BoolPropertyTest(obj, "FCGeneralPrefs", "RebarStopAtKeyChange")
    BoolPropertyTest(obj, "FCGeneralPrefs", "RebarStopAtSpecialBarline")
    BoolPropertyTest(obj, "FCGeneralPrefs", "RebarStopAtTimeChange")
    BoolPropertyTest_RO(obj, "FCGeneralPrefs", "RebarStopOnlyAtEndOfPiece")
    BoolPropertyTest(obj, "FCGeneralPrefs", "RebarWhenTimeSigChanged")
    BoolPropertyTest(obj, "FCGeneralPrefs", "RebeamOnRebar")
    BoolPropertyTest(obj, "FCGeneralPrefs", "RecalcMeasures")
    BoolPropertyTest(obj, "FCGeneralPrefs", "RecalcSystems")
    BoolPropertyTest(obj, "FCGeneralPrefs", "RespaceMeasureLayout")
    BoolPropertyTest(obj, "FCGeneralPrefs", "RetainFrozenMeasures")
    BoolPropertyTest(obj, "FCGeneralPrefs", "ShowDefaultGroupNames")
    BoolPropertyTest(obj, "FCGeneralPrefs", "ShowDefaultStaffNames")
    NumberPropertyTest_RO(obj, "FCGeneralPrefs", "UndoState")

    if Is27_3OrAbove()  then
        BoolPropertyTest(obj, "FCGeneralPrefs", "AutomaticMusicSpacing")
        NumberPropertyTest(obj, "FCGeneralPrefs", "CustomZoom1", {-12, 75, 123, 249})
        NumberPropertyTest(obj, "FCGeneralPrefs", "CustomZoom2", {0, 75, 123, 249})
        NumberPropertyTest(obj, "FCGeneralPrefs", "CustomZoom3", {0, 75, 123, 249})
        NumberPropertyTest(obj, "FCGeneralPrefs", "HiddenObjectShading", {-12, 0, 12, 47, 113})
        BoolPropertyTest(obj, "FCGeneralPrefs", "QuantizationMinimizeRests")
        NumberPropertyTest(obj, "FCGeneralPrefs", "QuantizationSmallestNoteValueToRemove", {0, 13, 27})
        BoolPropertyTest(obj, "FCGeneralPrefs", "QuantizationUseSensitivityLevel")
        BoolPropertyTest(obj, "FCGeneralPrefs", "TransposeMIDIOnInput")
    end
end

-- Call:
local obj = finale.FCGeneralPrefs()
AssureTrue(obj:Load(1), "FCGeneralPrefs:Load()")
FCGeneralPrefs_PropertyTests(obj)
