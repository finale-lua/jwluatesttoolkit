function FCNumber_PropertyTests(num)
   NumberPropertyTest(num, "FCNumber", "Int", {-345690, -1234, 0, 4, 569812})
   NumberPropertyTest(num, "FCNumber", "Float", {-345690.234, -1234, 0.5, 4.34234, 569812})
end


-- Call test:
 local num = finale.FCNumber(0)
FCNumber_PropertyTests(num)
