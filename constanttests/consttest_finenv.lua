function TestConstants_Finenv_()
    if AssureNonNil(finenv.MessageResultType, "finenv.MessageResultType") then
        NumberConstantTest(finenv.MessageResultType.SCRIPT_RESULT, "SCRIPT_RESULT", 0)
        NumberConstantTest(finenv.MessageResultType.DOCUMENT_REQUIRED, "DOCUMENT_REQUIRED", 1)
        NumberConstantTest(finenv.MessageResultType.SELECTION_REQUIRED, "SELECTION_REQUIRED", 2)
        NumberConstantTest(finenv.MessageResultType.SCORE_REQUIRED, "SCORE_REQUIRED", 3)
        NumberConstantTest(finenv.MessageResultType.FINALE_VERSION_MISMATCH, "FINALE_VERSION_MISMATCH", 4)
        NumberConstantTest(finenv.MessageResultType.LUA_PLUGIN_VERSION_MISMATCH, "LUA_PLUGIN_VERSION_MISMATCH", 5)
    end
    
    if AssureNonNil(finenv.MessageResultType, "finenv.TrustedModeType") then
        NumberConstantTest(finenv.TrustedModeType.UNTRUSTED, "UNTRUSTED", 0)
        NumberConstantTest(finenv.TrustedModeType.USER_TRUSTED, "USER_TRUSTED", 1)
        NumberConstantTest(finenv.TrustedModeType.HASH_VERIFIED, "HASH_VERIFIED", 2)
        NumberConstantTest(finenv.TrustedModeType.NOT_ENFORCED, "NOT_ENFORCED", 3)
    end
end

-- Test the constants:
TestConstants_Finenv_()
