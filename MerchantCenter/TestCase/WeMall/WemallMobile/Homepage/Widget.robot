*** Settings ***
Suite Teardown    Close All Browsers
Test Teardown     Run Keywords    Capture Page Screenshot    AND    Close Browser
Force Tags        Wemall-Mobile
Resource          ../../../../Resource/WeMall/Configuration/Staging/serverconfig.txt
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Resource/WeMall/MobileElement/Homepage.robot
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Mobile_Home.robot

*** Keywords ***
Login to Wemall on Mobile
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

*** Test Cases ***
TC_MC_05580
    [Documentation]    [Portal][Mobile] Widget: Verify Widget items - Navigation link for Hamburger Icon
    [Tags]    Regression    Ligo    Sprint2017MC16
    Mobile_Home.Open Wemall Portal page on Mobile
    Mobile_Home.Wemall Portal page should be appeared
    Mobile_Home.Click Hamburger icon
    Mobile_Home.Main menu should be appeared

TC_MC_05581
    [Documentation]    [Portal][Mobile] Widget: Verify Widget items - Navigation link for WeMall Logo
    [Tags]    Regression    Ligo    Sprint2017MC16
    Mobile_Home.Open Wemall Portal page on Mobile
    Mobile_Home.Wemall Portal page should be appeared
    Mobile_Home.Click WeMall logo
    Mobile_Home.Wemall Portal page should be appeared

TC_MC_05582
    [Documentation]    [Portal][Mobile] Widget: Verify Widget items - Navigation link for เข้าสู่ระบบ button
    [Tags]    Smoke    Regression    Ligo    Sprint2017MC16
    Mobile_Home.Open Wemall Portal page on Mobile
    Mobile_Home.Wemall Portal page should be appeared
    Mobile_Home.Click เข้าสู่ระบบ button
    Mobile_Home.เข้าสู่ระบบ page should be appeared

TC_MC_05583
    [Documentation]    [Portal][Mobile] Widget: Verify Widget items - Navigation link for Cart icon
    Mobile_Home.Open Wemall Portal page on Mobile
    Mobile_Home.Wemall Portal page should be appeared
    Mobile_Home.Click ตะกร้าสินค้า icon
    Mobile_Home.ตะกร้าสินค้า page should be appeared

TC_MC_05584
    [Documentation]    [Portal][Mobile] Widget: Verify Widget items - Navigation link for User Avatar icon
    [Tags]    Ligo    Sprint2017MC16
    [Setup]    Login to Wemall on Mobile    ${wmShop_user_001}    ${wmShop_pwd_001}
    Mobile_Home.Click User Avatar icon
    Mobile_Home.ข้อมูลส่วนตัว page should be appeared

TC_MC_05585
    [Documentation]    [Portal][Mobile] Widget: Verify Widget items - Navigation link for My Shop icon
    [Tags]    Ligo    Sprint2017MC16
    [Setup]    Login to Wemall on Mobile    ${wmShop_user_001}    ${wmShop_pwd_001}
    Mobile_Home.Click My Shop icon
    Mobile_Home.Manage Store page should be appeared    ${wmShop_name_001}

TC_MC_05591
    [Documentation]    [Portal][Mobile] Banner: Navigation Link
    [Tags]    Smoke    Ligo    Sprint2017MC16
    Mobile_Home.Open Wemall Portal page on Mobile
    Mobile_Home.Wemall Portal page should be appeared
    Mobile_Home.Click Highlight Banner Image
    Mobile_Home.Wemall Portal page should not be appeared

TC_MC_05595
    [Documentation]    [Portal][Mobile] Category Icon: Navigation Link
    [Tags]    Smoke    Ligo    Sprint2017MC16
    Mobile_Home.Open Wemall Portal page on Mobile
    Mobile_Home.Wemall Portal page should be appeared
    Mobile_Home.Click Category icon    lifestyle
    Mobile_Home.Wemall Portal page should not be appeared

