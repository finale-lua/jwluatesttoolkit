if not AssureNonNil(finenv.IsScriptActive, "Lua plugin is missing finenv.IsScriptActive. Coroutines tests are not possible.") then
    return
end

-- NOTE: Coroutines have a different Lua state than the parent script.
-- This test assures that the Lua plugin can find its script info when a script is inside a coroutine.

local function test_coroutine()
    local retval = finenv.IsScriptActive()
    AssureTrue(retval, "Lua plugin found its script info inside a coroutine.")
    return retval
end

local co = coroutine.create(test_coroutine)
    if AssureNonNil(co, "coroutine.create failed.") then
    local success, result = coroutine.resume(co)
    AssureEqual(coroutine.status(co), "dead", "Coroutine did not complete.")
    if AssureTrue(success, "coroutine.resume failed.") then
        AssureTrue(result, "coroutine returned true.")
    end
end
    
