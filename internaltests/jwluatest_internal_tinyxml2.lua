if not AssureNonNil(tinyxml2, "TinyXML2 is not available. Check LoadTinyXML2 setting in plugindef function.") then
    return
end

local function TestConstants_TinyXML2()
   NumberConstantTest(tinyxml2.OPEN, "OPEN", 0)
   NumberConstantTest(tinyxml2.CLOSED, "CLOSED", 1)
   NumberConstantTest(tinyxml2.CLOSING, "CLOSING", 2)
   --
   NumberConstantTest(tinyxml2.PRESERVE_WHITESPACE, "PRESERVE_WHITESPACE", 0)
   NumberConstantTest(tinyxml2.COLLAPSE_WHITESPACE, "COLLAPSE_WHITESPACE", 1)
   --
   NumberConstantTest(tinyxml2.XML_CAN_NOT_CONVERT_TEXT, "XML_CAN_NOT_CONVERT_TEXT", 16)
   NumberConstantTest(tinyxml2.XML_ELEMENT_DEPTH_EXCEEDED, "XML_ELEMENT_DEPTH_EXCEEDED", 18)
   NumberConstantTest(tinyxml2.XML_ERROR_COUNT, "XML_ERROR_COUNT", 19)
   NumberConstantTest(tinyxml2.XML_ERROR_EMPTY_DOCUMENT, "XML_ERROR_EMPTY_DOCUMENT", 13)
   NumberConstantTest(tinyxml2.XML_ERROR_FILE_COULD_NOT_BE_OPENED, "XML_ERROR_FILE_COULD_NOT_BE_OPENED", 4)
   NumberConstantTest(tinyxml2.XML_ERROR_FILE_NOT_FOUND, "XML_ERROR_FILE_NOT_FOUND", 3)
   NumberConstantTest(tinyxml2.XML_ERROR_FILE_READ_ERROR, "XML_ERROR_FILE_READ_ERROR", 5)
   NumberConstantTest(tinyxml2.XML_ERROR_MISMATCHED_ELEMENT, "XML_ERROR_MISMATCHED_ELEMENT", 14)
   NumberConstantTest(tinyxml2.XML_ERROR_PARSING, "XML_ERROR_PARSING", 15)
   NumberConstantTest(tinyxml2.XML_ERROR_PARSING_ATTRIBUTE, "XML_ERROR_PARSING_ATTRIBUTE", 7)
   NumberConstantTest(tinyxml2.XML_ERROR_PARSING_CDATA, "XML_ERROR_PARSING_CDATA", 9)
   NumberConstantTest(tinyxml2.XML_ERROR_PARSING_COMMENT, "XML_ERROR_PARSING_COMMENT", 10)
   NumberConstantTest(tinyxml2.XML_ERROR_PARSING_DECLARATION, "XML_ERROR_PARSING_DECLARATION", 11)
   NumberConstantTest(tinyxml2.XML_ERROR_PARSING_ELEMENT, "XML_ERROR_PARSING_ELEMENT", 6)
   NumberConstantTest(tinyxml2.XML_ERROR_PARSING_TEXT, "XML_ERROR_PARSING_TEXT", 8)
   NumberConstantTest(tinyxml2.XML_ERROR_PARSING_UNKNOWN, "XML_ERROR_PARSING_UNKNOWN", 12)
   NumberConstantTest(tinyxml2.XML_NO_ATTRIBUTE, "XML_NO_ATTRIBUTE", 1)
   NumberConstantTest(tinyxml2.XML_NO_TEXT_NODE, "XML_NO_TEXT_NODE", 17)
   NumberConstantTest(tinyxml2.XML_SUCCESS, "XML_SUCCESS", 0)
   NumberConstantTest(tinyxml2.XML_WRONG_ATTRIBUTE_TYPE, "XML_WRONG_ATTRIBUTE_TYPE", 2)
end

-- Test the constants:
TestConstants_TinyXML2()

local function PropertyTest_TinyXML2(obj, classname, propertyname, defaultvalue, testvalue)
    -- Can't use PropertyTest because it expects to find __propget table, and tinyxml2 doesn't have that
    -- PropertyTest(obj, classname, propertyname, "tinyxml2")
    if not TestClassName(obj, classname, "tinyxml2") then return end
    if not AssureNonNil(obj[propertyname], propertyname.." property not found for class "..classname..".") then return end
    AssureEqual(obj[propertyname], defaultvalue, "PropertyTest_TinyXML2 property starts out with defaultvalue.")
    
    local function tryValue(value)
        local success, errmsg = pcall(function() obj[propertyname] = value end)
        AssureTrue(success, "PropertyTest_TinyXML2 could not set "..classname.."."..propertyname.." to "..tostring(value)..": "..tostring(errmsg))
    end
    
    if type(testvalue) == "nil" then
        tryValue(not obj[propertyname])
    elseif type(testvalue) ~= "table" then
        tryValue(testvalue)
    else
        for _, v in pairs(testvalue) do
            tryValue(v)
        end
    end    
end

local function TestTinyXML2_Classes()
    if not AssureNonNil(tinyxml2.XMLDocument, "tinyxml2.XMLDocument") then return end
    local xml = tinyxml2.XMLDocument()
    if not TestClassName(xml, "XMLDocument", "tinyxml2") then return end
    TestClassName(xml:NewText("XMLText"), "XMLText", "tinyxml2")
    TestClassName(xml:NewComment("XMLComment"), "XMLComment", "tinyxml2")
    TestClassName(xml:NewDeclaration("XMLDeclaration"), "XMLDeclaration", "tinyxml2")
    TestClassName(xml:NewUnknown("XMLUnknown"), "XMLUnknown", "tinyxml2")
    TestClassName(xml:NewElement("XMLElement"), "XMLElement", "tinyxml2")
    TestClassName(tinyxml2.XMLHandle(xml), "XMLHandle", "tinyxml2")
    TestClassName(xml:InsertFirstChild(xml:NewText("XMLTextForXMLNode")), "XMLNode", "tinyxml2")
    local element = xml:NewElement("ElementForAttribute")
    if not AssureNonNil(element, "xml:NewElement(\"ElementForAttribute\")") then return end
    element:SetAttribute("testattribute", "true")
    TestClassName(element:FirstAttribute(), "XMLAttribute", "tinyxml2")
    -- XMLVisitor and XMLPrinter not currently supported (as of 0.67)
    --TestClassName(obj, "XMLVisitor", "tinyxml2")
    --TestClassName(obj, "XMLPrinter", "tinyxml2")
end

local function TestTinyXML2_Properties()
    local xmldoc = tinyxml2.XMLDocument()
    PropertyTest_TinyXML2(xmldoc, "XMLDocument", "ProcessEntities", true)
    PropertyTest_TinyXML2(xmldoc, "XMLDocument", "WhitespaceMode", tinyxml2.PRESERVE_WHITESPACE,
                    {tinyxml2.PRESERVE_WHITESPACE, tinyxml2.COLLAPSE_WHITESPACE})
end

local function TestTinyXML2_WithFile()
    local xml = tinyxml2.XMLDocument()
    AssureNonNil(xml, "TestTinyXML2_WithFile tinyxml2.XMLDocument()")
    AssureEqual(tinyxml2.XML_SUCCESS, xml:LoadFile(GetRunningFolderPath() .. "/tools/breakfast_menu.xml"), "TestTinyXML2_WithFile LoadFile")
    local menu = xml:FirstChildElement("breakfast_menu")
    if AssureNonNil(menu, "TestTinyXML2_WithFile xml:FirstChildElement(\"breakfast_menu\")") then
        local function checkItem(element, name, price, description, calories)
            if not AssureNonNil(element, "TestTinyXML2_WithFile: element for "..name..".") then
                return nil
            end
            local function getText(element_name)
                local subelement = element:FirstChildElement(element_name)
                if not AssureNonNil(subelement, "TestTinyXML2_WithFile: element for "..name.."->"..element_name..".") then
                    return nil
                end
                return subelement:GetText()
            end
            local function getInt(element_name)
                local subelement = element:FirstChildElement(element_name)
                if not AssureNonNil(subelement, "TestTinyXML2_WithFile: element for "..name.."->"..element_name..".") then
                    return nil
                end
                return subelement:IntText(-1)
            end
            AssureEqual(price, getText("price"), "TestTinyXML2_WithFile: element for "..price..".")
            AssureEqual(name, getText("name"), "TestTinyXML2_WithFile: element for "..name..".")
            AssureEqual(description, getText("description"), "TestTinyXML2_WithFile: element for "..description..".")
            AssureEqual(calories, getInt("calories"), "TestTinyXML2_WithFile: element for "..calories..".")
            return tinyxml2.XMLHandle(element):NextSibling():ToElement()
        end
        local element = menu:FirstChildElement("food")
        element = checkItem(element, "Belgian Waffles", "$5.95",
                                "Two of our famous Belgian Waffles with plenty of real maple syrup", 650)
        element = checkItem(element, "Strawberry Belgian Waffles", "$7.95",
                                "Light Belgian waffles covered with strawberries and whipped cream", 900)
        element = checkItem(element, "Berry-Berry Belgian Waffles", "$8.95",
                                "Light Belgian waffles covered with an assortment of fresh berries and whipped cream", 900)
        element = checkItem(element, "French Toast", "$4.50",
                                "Thick slices made from our homemade sourdough bread", 600)
        element = checkItem(element, "Homestyle Breakfast", "$6.95",
                                "Two eggs, bacon or sausage, toast, and our ever-popular hash browns", 950)
        AssureNil(element, "TestTinyXML2_WithFile: element at end of menu")
    end
end

TestTinyXML2_Classes()
TestTinyXML2_Properties()
TestTinyXML2_WithFile()