*** Settings ***
Suite Teardown    Close All Browsers
Test Teardown     Run Keywords    Capture Page Screenshot    AND    Close Browser
Force Tags        Wemall-Mobile
Resource          ../../../../Resource/WeMall/Configuration/Staging/serverconfig.txt
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Resource/WeMall/MobileElement/Homepage.robot
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Freebie.txt
Resource          ../../../../Keyword/Common/Mobile_Home.robot
Resource          ../../../../Keyword/Common/Mobile_LevelC.robot

*** Keywords ***
Go To Level C page
    Mobile_Home.Open Wemall Portal page on Mobile
    Mobile_Home.Wemall Portal page should be appeared
    Mobile_Home.Click Hamburger icon
    Mobile_Home.Click Main Menu Category
    Mobile_LevelC.Categories page should be appeared

Enter Valid Keyword
    [Arguments]    ${keyword}
    Mobile_LevelC.Enter Search Keyword    ${keyword}
    Mobile_LevelC.Click Search Button
    Mobile_LevelC.Searched Product should be found    ${keyword}
    [Teardown]    Capture Page Screenshot

Enter Invalid Keyword
    [Arguments]    ${keyword}
    Mobile_LevelC.Enter Search Keyword    ${keyword}
    Mobile_LevelC.Click Search Button
    Mobile_LevelC.Search Product should not be found    ${keyword}
    [Teardown]    Capture Page Screenshot

*** Variables ***
${test_nopromotion_name}    Other_Product_test
${test_nopromotion_price}    100 บาท
${freebie_product}    KAMUA

*** Test Cases ***
TC_MC_05596
    [Documentation]    [Lv.C][Mobile] Search - Valid Keyword
    [Tags]    Smoke	Regression    Ligo    Sprint2017MC16
    [Setup]    Go To Level C page
    [Template]    Enter Valid Keyword
    test
    สินค้า

TC_MC_05597
    [Documentation]    [Lv.C][Mobile] Search - Invalid Keyword
    [Tags]    Smoke    Regression    Ligo    Sprint2017MC16
    [Setup]    Go To Level C page
    [Template]    Enter Invalid Keyword
    หาไม่เจอหรอก
    assdsdsd
    8948346894

TC_MC_05599
    [Documentation]    [Lv.C][Mobile] Search - Content - No Promotion
    [Tags]    Smoke    Regression    Ligo    Sprint2017MC16
    [Setup]    Go To Level C page
    Enter Valid Keyword    ${test_nopromotion_name}
    Mobile_LevelC.Product Name should be appeared    ${test_nopromotion_name}
    Mobile_LevelC.Product Price should be appeared    ${test_nopromotion_price}

TC_MC_05610
    [Documentation]    [Lv.C][Mobile] Search - Thumbnail - Sorting - ราคาต่ำสุด
    [Tags]    Smoke    Regression    Ligo    Sprint2017MC16
    [Setup]    Go To Level C page
    Enter Valid Keyword    สินค้า
    Mobile_LevelC.Thumb view is selected
    Mobile_LevelC.Sort Product by Lowest Price
    Mobile_LevelC.Sort option is selected    ราคาต่ำสุด
    Mobile_LevelC.Products should be sorted by lowest price

TC_MC_05611
    [Documentation]    [Lv.C][Mobile] Search - Thumbnail - Sorting - ราคาสูงสุด
    [Tags]    Smoke    Regression    Ligo    Sprint2017MC16
    [Setup]    Go To Level C page
    Enter Valid Keyword    สินค้า
    Mobile_LevelC.Thumb view is selected
    Mobile_LevelC.Sort Product by Highest Price
    Mobile_LevelC.Sort option is selected    ราคาสูงสุด
    Mobile_LevelC.Products should be sorted by higest price

TC_MC_05617
    [Documentation]    [Lv.C][Mobile] Search - List - Sorting - ราคาต่ำสุด
    [Tags]    Smoke    Regression    Ligo    Sprint2017MC16
    [Setup]    Go To Level C page
    Enter Valid Keyword    สินค้า
    Mobile_LevelC.View as List View
    Mobile_LevelC.List view is selected
    Mobile_LevelC.Sort Product by Lowest Price
    Mobile_LevelC.Sort option is selected    ราคาต่ำสุด
    Mobile_LevelC.Products should be sorted by lowest price

TC_MC_05618
    [Documentation]    [Lv.C][Mobile] Search - List - Sorting - ราคาสูงสุด
    [Tags]    Smoke    Regression    Ligo    Sprint2017MC16
    [Setup]    Go To Level C page
    Enter Valid Keyword    สินค้า
    Mobile_LevelC.View as List View
    Mobile_LevelC.List view is selected
    Mobile_LevelC.Sort Product by Highest Price
    Mobile_LevelC.Sort option is selected    ราคาสูงสุด
    Mobile_LevelC.Products should be sorted by higest price

TC_MC_10701
    [Documentation]    [Mobile] Verify the product's image with the freebie tag on Search result page when promotion status is available
    [Tags]    Smoke    Regression    Ligo
    Open Wemall Portal page on Mobile
    Wemall Portal page should be appeared
    Enter Valid Keyword    ${freebie_product}
    Validate freebie promotion correctly displayed


