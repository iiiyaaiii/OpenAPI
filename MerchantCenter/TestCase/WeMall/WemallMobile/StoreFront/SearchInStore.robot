*** Settings ***
Suite Teardown    Close All Browsers
Test Teardown     Run Keywords    Capture Page Screenshot    AND    Close Browser
Force Tags        Wemall-Mobile
Resource          ../../../../Resource/WeMall/Configuration/Staging/serverconfig.txt
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Mobile_StoreFront.robot

*** Keywords ***
Open WeMall Store Front Page
    [Arguments]    ${slugID}    ${shopName}
    Mobile_StoreFront.Open Wemall Store Front Page On Mobile    ${slugID}
    Mobile_StoreFront.Wemall Store Front Page Should Be Appeared    ${shopName}

Open WeMall Search Page
    [Arguments]    ${slugID}    ${shopName}    ${keyword}
    Open WeMall Store Front Page    ${slugID}    ${shopName}
    Mobile_StoreFront.Enter Search Keyword    ${keyword}
    Mobile_StoreFront.Click Search Button
    Mobile_StoreFront.Search Result Should Be Found

Validate Valid Keywords
    [Arguments]    ${keyword}
    Mobile_StoreFront.Enter Search Keyword    ${keyword}
    Mobile_StoreFront.Click Search Button
    Mobile_StoreFront.Search Result Should Be Found

Validate Invalid Keywords
    [Arguments]    ${keyword}
    Mobile_StoreFront.Enter Search Keyword    ${keyword}
    Mobile_StoreFront.Click Search Button
    Mobile_StoreFront.Search Result Should Not Be Found    ${keyword}

Validate Sorting Option
    [Arguments]    ${option}
    Mobile_StoreFront.Sorting Option Should Be Appeared    ${option}
    [Teardown]    Capture Page Screenshot

*** Variables ***
${test_keyword}    Product

*** Test Cases ***
TC_MC_06528
    [Documentation]    [StoreFront][Mobile] Search - Placeholder
    [Tags]    Regression    Ligo    Sprint2017MC18
    [Setup]    Open WeMall Store Front Page    ${wmShop_name_004}    ${wmShop_store_004}
    Mobile_StoreFront.Placeholder Text Should Be Appeared    ค้นหาสินค้าภายในร้านค้านี้

TC_MC_06529
    [Documentation]    [StoreFront][Mobile] Search - No Search Criteria
    [Tags]    Regression    Ligo    Sprint2017MC18
    [Setup]    Open WeMall Store Front Page    ${wmShop_name_004}    ${wmShop_store_004}
    Mobile_StoreFront.Click Search Button
    Mobile_StoreFront.Search Result Should Be Found

TC_MC_06530
    [Documentation]    [StoreFront][Mobile] Search - Valid Search Criteria
    [Tags]    Regression    Ligo    Sprint2017MC18
    [Setup]    Open WeMall Store Front Page    ${wmShop_name_004}    ${wmShop_store_004}
    [Template]    Validate Valid Keywords
    Seller
    Mobile
    สินค้าลดราคา

TC_MC_06531
    [Documentation]    [StoreFront][Mobile] Search - Invalid Search Criteria
    [Tags]    Regression    Ligo    Sprint2017MC18
    [Setup]    Open WeMall Store Front Page    ${wmShop_name_004}    ${wmShop_store_004}
    [Template]    Validate Invalid Keywords
    No Result
    หาไม่เจอหรอก

TC_MC_06532
    [Documentation]    [StoreFront][Mobile] Search - Sorting Option
    [Tags]    Regression    Ligo    Sprint2017MC18
    [Setup]    Run Keywords    Open WeMall Search Page    ${wmShop_name_004}    ${wmShop_store_004}    ${test_keyword}    AND    Mobile_StoreFront.Click Sorting Button
    [Template]    Validate Sorting Option
    ราคาต่ำสุด
    ราคาสูงสุด
    ใหม่ล่าสุด
    ผลการค้นหา

TC_MC_06533
    [Documentation]    [StoreFront][Mobile] Search - Sorting - Default
    [Tags]    Regression    Ligo    Sprint2017MC18
    [Setup]    Open WeMall Search Page    ${store_url1}    ${store_url1}    ${store_url1}
    Mobile_StoreFront.Selected Sorting Option Should Be Appeared    ผลการค้นหา

TC_MC_06534
    [Documentation]    [StoreFront][Mobile] Search - Sorting - ราคาต่ำสุด
    [Tags]    Regression    Ligo    Sprint2017MC18
    [Setup]    Open WeMall Search Page    ${store_url1}    ${store_url1}    ${store_url1}
    Mobile_StoreFront.Click Sorting Button
    Mobile_StoreFront.Select Sorting Option    ราคาต่ำสุด
    Mobile_StoreFront.Products Should Be Sorted By Price    ราคาต่ำสุด

TC_MC_06535
    [Documentation]    [StoreFront][Mobile] Search - Sorting - ราคาสูงสุด
    [Tags]    Regression    Ligo    Sprint2017MC18
    [Setup]    Open WeMall Search Page    ${store_url1}    ${store_url1}    ${store_url1}
    Mobile_StoreFront.Click Sorting Button
    Mobile_StoreFront.Select Sorting Option    ราคาสูงสุด
    Mobile_StoreFront.Products Should Be Sorted By Price    ราคาสูงสุด

TC_MC_06541
    [Documentation]    [StoreFront][Mobile] Search - Social Network - Not Available
    [Tags]    Regression    Ligo    Sprint2017MC18
    [Setup]    Open WeMall Search Page    ${wmShop_name_002}    ${wmShop_store_002}    ${test_keyword}
    Mobile_StoreFront.Social Network Section Should Not Be Appeared

TC_MC_06542
    [Documentation]    [StoreFront][Mobile] Search - Social Network - Available
    [Tags]    Regression    Ligo    Sprint2017MC18
    [Setup]    Open WeMall Search Page    ${store_url1}    ${store_url1}    ${test_keyword}
    Mobile_StoreFront.Scroll To Social Network Section
    Mobile_StoreFront.Social Network Section Should Be Appeared
