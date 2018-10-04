*** Settings ***
Suite Teardown    Close All Browsers
Test Teardown     Close Browser
Force Tags        Wemall-Mobile
Resource          ../../../../Resource/WeMall/Configuration/Staging/serverconfig.txt
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Mobile_StoreFront.robot
Resource          ../../../../Keyword/Common/Mobile_LevelD.robot

*** Keywords ***
Open Shop Main Menu
    [Arguments]    ${productID}
    Mobile_LevelD.Go to Product Level D Page    ${productID}
    Mobile_StoreFront.Click Shop Menu Icon
    Mobile_StoreFront.Shop Menu Should Be Expanded

Shop Menu Option Should Be Appeared
    [Arguments]	${shopMenu}
    Mobile_StoreFront.Shop Menu Should Be Appeared    ${shopMenu}

*** Variables ***
${test_product}    L91200127

*** Test Cases ***
TC_MC_06129
    [Documentation]    [Lv.D][Mobile] Main Menu - Appearance
    [Tags]    Smoke    Regression    Ligo    Sprint2017MC17
    [Setup]    Open Shop Main Menu    ${test_product}
    [Template]    Shop Menu Option Should Be Appeared
    หน้าแรก
    สินค้า
    หมวดหมู่สินค้า
    โปรโมชั่นร้านค้า
    #ติดต่อร้านค้า
    # [Teardown]    Capture Page Screenshot

TC_MC_06132
    [Documentation]    [Lv.D][Mobile] Main Menu - Navigation Link - หน้าแรก
    [Tags]    Regression    Ligo    Sprint2017MC17    Sprint2017MC18
    Mobile_LevelD.Go to Product Level D Page    ${test_product}
    Mobile_StoreFront.Select Shop Menu    หน้าแรก
    Mobile_StoreFront.Wemall Store Front Page Should Be Appeared    ${store_url1}
