local cjson = DoRequire("cjson")
if not cjson then return end

if not AssureNonNil(prettyformatjson, "prettyformatjson is non nil") then
    return
end

-- basis for this test:
--[[
local t =
{
    boolval = true,
    intval = 334,
    numval = 12.34,
    strval = "this is a string",
    arrval = {
        "array_val 1",
        false,
        12,
        145.2
    },
    tableval = {
        boolval = false,
        intval = 23,
        numval = 1.5,
        tableval = {
            boolval = true,
            numval = 1.3455
        },
        arrayval = {
            "one",
            "two",
            "three",
            "four
        }
    }
}
]]

--to create the flat version:
--[[ 
local cjson = require("cjson")
local json_flat = cjson.encode(t)
finenv.UI():TextToClipboard(json_flat)
]]

local json_flat = [[
{"strval":"this is a string","boolval":true,"tableval":{"boolval":false,"arrayval":["one","two","three","four"],"tableval":{"numval":1.3455,"boolval":true},"intval":23,"numval":1.5},"arrval":["array_val 1",false,12,145.2],"intval":334,"numval":12.34}
]]

--to create the pretty version:
--[[
local json_pretty = prettyformatjson(json_flat, 5)
finenv.UI():TextToClipboard(json_pretty)
]]

local json_pretty = [[
{
     "strval": "this is a string",
     "boolval": true,
     "tableval": {
          "boolval": false,
          "arrayval": [
               "one",
               "two",
               "three",
               "four"
          ],
          "tableval": {
               "numval": 1.3455,
               "boolval": true
          },
          "intval": 23,
          "numval": 1.5
     },
     "arrval": [
          "array_val 1",
          false,
          12,
          145.2
     ],
     "intval": 334,
     "numval": 12.34
}
]]

AssureEqual(json_pretty, prettyformatjson(json_flat, 5), "prettyformatjson comparison")
