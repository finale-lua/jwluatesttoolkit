function TestConstants_Finenv_()
    if AssureNonNil(finenv.MessageResultType, "finenv.MessageResultType") then
        NumberConstantTest(finenv.MessageResultType.SCRIPT_RESULT, "SCRIPT_RESULT", 0)
        NumberConstantTest(finenv.MessageResultType.DOCUMENT_REQUIRED, "DOCUMENT_REQUIRED", 1)
        NumberConstantTest(finenv.MessageResultType.SELECTION_REQUIRED, "SELECTION_REQUIRED", 2)
        NumberConstantTest(finenv.MessageResultType.SCORE_REQUIRED, "SCORE_REQUIRED", 3)
    end
end

-- Test the constants:
TestConstants_Finenv_()
