
function FCPageGraphic_Test_Unlinkable(page, inci, partnumber)
    local pagegraphic = finale.FCPageGraphic()
    if AssureTrue(pagegraphic:Load(page,inci), "FCPageGraphic_Test_Unlinkable: FCPageGraphic:Load()") then
        UnlinkableNumberPropertyTest(pagegraphic, "FCPageGraphic", "Height", "Reload", nil, -12, partnumber, skip_finale_version)
        UnlinkableNumberPropertyTest(pagegraphic, "FCPageGraphic", "HorizontalPos", "Reload", nil, -12, partnumber, skip_finale_version)
        UnlinkableNumberPropertyTest(pagegraphic, "FCPageGraphic", "VerticalPos", "Reload", nil, 12, partnumber, skip_finale_version)
        UnlinkableNumberPropertyTest(pagegraphic, "FCPageGraphic", "Visible", "Reload", nil, -12, partnumber, skip_finale_version)
        UnlinkableNumberPropertyTest(pagegraphic, "FCPageGraphic", "Width", "Reload", nil, -12, partnumber, skip_finale_version)
    end
end

-- Call:
FCPageGraphic_Test_Unlinkable(0, 0, 2)
FCPageGraphic_Test_Unlinkable(1, 0, 3)
