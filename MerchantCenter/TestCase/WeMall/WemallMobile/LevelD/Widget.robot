*** Settings ***
Suite Teardown    Close All Browsers
Test Teardown     Run Keywords    Capture Page Screenshot    AND     Close Browser
Force Tags        Wemall-Mobile
Resource          ../../../../Resource/WeMall/Configuration/Staging/serverconfig.txt
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Mobile_LevelD.robot
Resource          ../../../../Keyword/Common/Mobile_Home.robot
Resource          ../../../../Keyword/Common/Mobile_StoreFront.robot

*** Keywords ***
Successfully Log-in To WeMall
    [Arguments]    ${username}    ${password}
    Mobile_Home.Open Wemall Portal page on Mobile
    Mobile_Home.Wemall Portal page should be appeared
    Mobile_Home.Open Login page
    Mobile_Home.เข้าสู่ระบบ page should be appeared
    Mobile_Home.Enter Username    ${username}
    Mobile_Home.Enter password    ${password}
    Mobile_Home.Click Login button
    Mobile_Home.Wemall Portal page should be appeared
    Mobile_Home.User is logged in to WeMall successfully

Open Product Details Page
    [Arguments]    ${productID}
    Go To    ${URL_MOBILE}/d/${productID}

*** Variables ***
${test_product}    L91200127

*** Test Cases ***
TC_MC_06116
    [Documentation]    [Lv.D][Mobile] Widget - Navigation Link - WeMall Logo
    [Tags]    Regression    Ligo    Sprint2017MC17
    Mobile_LevelD.Go to Product Level D Page    ${test_product}
    Mobile_StoreFront.Click WeMall Logo
    Mobile_Home.Wemall Portal page should be appeared

TC_MC_06117
    [Documentation]    [Lv.D][Mobile] Widget - Navigation Link - Login
    [Tags]    Regression    Ligo    Sprint2017MC17
    Mobile_LevelD.Go to Product Level D Page    ${test_product}
    Mobile_StoreFront.Click Login Button
    Mobile_Home.เข้าสู่ระบบ page should be appeared

TC_MC_06118
    [Documentation]    [Lv.D][Mobile] Widget - Navigation Link - Cart icon
    [Tags]    Regression    Ligo    Sprint2017MC17
    Mobile_LevelD.Go to Product Level D Page    ${test_product}
    Mobile_StoreFront.Click My Cart Icon
    Mobile_Home.ตะกร้าสินค้า page should be appeared

TC_MC_06119
    [Documentation]    [Lv.D][Mobile] Widget - Navigation Link - My Shop icon
    [Tags]    Regression    Ligo    Sprint2017MC17
    [Setup]    Successfully Log-in To WeMall    ${wmShop_user_001}    ${wmShop_pwd_001}
    Open Product Details Page    ${test_product}
    Mobile_StoreFront.Click My Shop Icon
    Mobile_Home.Manage Store page should be appeared    ${wmShop_name_001}

TC_MC_06120
    [Documentation]    [Lv.D][Mobile] Widget - Appearance - User Avatar icon
    [Tags]    Regression    Ligo    Sprint2017MC17
    [Setup]    Successfully Log-in To WeMall    ${wmShop_user_001}    ${wmShop_pwd_001}
    Open Product Details Page    ${test_product}
    Mobile_StoreFront.Click User Avatar Icon
    Mobile_StoreFront.User Avatar Option Should Be Appeared

TC_MC_06365
    [Documentation]    [Lv.D][Mobile] Widget - Navigation Link - User Avatar - รายการสั่งซื้อ
    [Tags]    Regression    Ligo    Sprint2017MC17
    [Setup]    Successfully Log-in To WeMall    ${wmShop_user_001}    ${wmShop_pwd_001}
    Open Product Details Page    ${test_product}
    Mobile_StoreFront.Click User Avatar Icon
    Mobile_StoreFront.User Avatar Option Should Be Appeared
    Mobile_StoreFront.Select User Avatar Option    รายการสั่งซื้อ
    Mobile_Home.รายการสั่งซื้อ page should be appeared

TC_MC_06366
    [Documentation]    [Lv.D][Mobile] Widget - Navigation Link - User Avatar - ข้อมูลส่วนตัว
    [Tags]    Regression    Ligo    Sprint2017MC17
    [Setup]    Successfully Log-in To WeMall    ${wmShop_user_001}    ${wmShop_pwd_001}
    Open Product Details Page    ${test_product}
    Mobile_StoreFront.Click User Avatar Icon
    Mobile_StoreFront.User Avatar Option Should Be Appeared
    Mobile_StoreFront.Select User Avatar Option    ข้อมูลส่วนตัว
    Mobile_Home.ข้อมูลส่วนตัว page should be appeared

TC_MC_06367
    [Documentation]    [Lv.D][Mobile] Widget - Navigation Link - User Avatar icon - ออกจากระบบ
    [Tags]    Regression    Ligo    Sprint2017MC17
    [Setup]    Successfully Log-in To WeMall    ${wmShop_user_001}    ${wmShop_pwd_001}
    Open Product Details Page    ${test_product}
    Mobile_StoreFront.Click User Avatar Icon
    Mobile_StoreFront.User Avatar Option Should Be Appeared
    Mobile_StoreFront.Select User Avatar Option    ออกจากระบบ
    Mobile_Home.Wemall Portal page should be appeared

TC_MC_06121
    [Documentation]    [Lv.D][Mobile] Widget - Navigation Link - Hamburger icon
    [Tags]    Regression    Ligo    Sprint2017MC17
    Mobile_LevelD.Go to Product Level D Page    ${test_product}
    Mobile_StoreFront.Click Shop Menu Icon
    Mobile_StoreFront.Shop Menu Should Be Expanded

TC_MC_06123
    [Documentation]    [Lv.D][Mobile] Widget - Shop Name - Navigation Link - Shop Avatar
    [Tags]    Regression    Ligo    Sprint2017MC17    Sprint2017MC18
    Mobile_LevelD.Go to Product Level D Page    ${test_product}
    Mobile_StoreFront.Click Shop Avatar
    Mobile_StoreFront.Wemall Store Front Page Should Be Appeared    ${store_url1}

TC_MC_06124
    [Documentation]    [Lv.D][Mobile] Widget - Shop Name - Navigation Link - Shop Name
    [Tags]    Regression    Ligo    Sprint2017MC17    Sprint2017MC18
    Mobile_LevelD.Go to Product Level D Page    ${test_product}
    Mobile_StoreFront.Click Shop Name
    Mobile_StoreFront.Wemall Store Front Page Should Be Appeared    ${store_url1}
