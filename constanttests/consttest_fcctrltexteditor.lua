function TestConstants_STRFINDOPT_()
    -- CAUTION: these are bitwise values. If new ones are added, they should be 0x04, 0x08, 0x10, etc.
    NumberConstantTest(finale.STRFINDOPT_IGNORECASE, "STRFINDOPT_IGNORECASE", 0x0001)
    NumberConstantTest(finale.STRFINDOPT_WHOLEWORDS, "STRFINDOPT_WHOLEWORDS", 0x0002)
    NumberConstantTest(finale.STRFINDOPT_REGEX, "STRFINDOPT_REGEX", 0x0004)
end

-- Test the constants:
TestConstants_STRFINDOPT_()
