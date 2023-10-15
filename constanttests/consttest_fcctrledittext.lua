function TestConstants_STRFINDOPT_()
    -- CAUTION: these are bitwise values. If new ones are added, they should be 0x04, 0x08, 0x10, etc.
    NumberConstantTest(finale.STRFINDOPT_IGNORECASE, "STRFINDOPT_IGNORECASE", 0x01)
    NumberConstantTest(finale.STRFINDOPT_WHOLEWORDS, "STRFINDOPT_WHOLEWORDS", 0x02)
end

-- Test the constants:
TestConstants_STRFINDOPT_()
