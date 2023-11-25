function TestConstants_FRETITEM_()
    NumberConstantTest(finale.FRETITEM_NONE, "FRETITEM_NONE", 0)
    NumberConstantTest(finale.FRETITEM_DOT, "FRETITEM_DOT", 1)
    NumberConstantTest(finale.FRETITEM_CIRCLE, "FRETITEM_CIRCLE", 2)
    NumberConstantTest(finale.FRETITEM_X, "FRETITEM_X", 4)
    NumberConstantTest(finale.FRETITEM_DIAMOND, "FRETITEM_DIAMOND", 8)
end

-- Test the constants:
TestConstants_FRETITEM_()

function TestConstants_FRETFINGERING_()
    NumberConstantTest(finale.FRETFINGERING_NONE, "FRETFINGERING_NONE", 0)
    NumberConstantTest(finale.FRETFINGERING_FIRST, "FRETFINGERING_FIRST", 1)
    NumberConstantTest(finale.FRETFINGERING_SECOND, "FRETFINGERING_SECOND", 2)
    NumberConstantTest(finale.FRETFINGERING_THIRD, "FRETFINGERING_THIRD", 3)
    NumberConstantTest(finale.FRETFINGERING_FOURTH, "FRETFINGERING_FOURTH", 4)
    NumberConstantTest(finale.FRETFINGERING_THUMB, "FRETFINGERING_THUMB", 5)
end

-- Test the constants:
TestConstants_FRETFINGERING_()
