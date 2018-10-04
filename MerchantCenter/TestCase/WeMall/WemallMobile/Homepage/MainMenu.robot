*** Settings ***
Suite Teardown    Close All Browsers
Test Teardown     Run Keywords    Capture Page Screenshot    AND    Close Browser
Force Tags        Wemall-Mobile
Resource          ../../../../Resource/WeMall/Configuration/Staging/serverconfig.txt
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Resource/WeMall/MobileElement/Homepage.robot
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Mobile_Home.robot
Resource          ../../../../Keyword/Common/Member_SignIn.txt

*** Keywords ***
Login to Wemall on Mobile
    [Arguments]	${username}	${password}
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
TC_MC_05563
    [Documentation]    [Mobile]Mainmenu: Not login
    [Tags]    Regression    Ligo    Sprint2017MC16
    Mobile_Home.Open Wemall Portal page on Mobile
    Mobile_Home.Wemall Portal page should be appeared
    Member_SignIn.Clear Active Login
    Mobile_Home.Click Main Menu
    Mobile_Home.Not Login Check Mainmenu List

TC_MC_05564
    [Documentation]    [Mobile]Mainmenu: login already
    [Tags]    Smoke    Regression    Ligo    Sprint2017MC16
    [Setup]    Login to Wemall on Mobile    ${seller_user_001}    ${seller_pwd_001}
    Mobile_Home.Click Main Menu
    Mobile_Home.Login Check Mainmenu List

TC_MC_11899
    [Documentation]    [Mobile] Verify information of Contact us menu on Wemall website
    [Tags]    Regression
    Mobile_Home.Open Wemall Portal page on Mobile
    Mobile_Home.Click Main Menu
    Mobile_Home.Click Wemall Contact Us Menu
    Mobile_Home.Verify The Wemall Information Correctly

TC_MC_11919
    [Documentation]    [Mobile] Verify Chat Live section on Wemall Homepage
    [Tags]    Regression
    Mobile_Home.Open Wemall Portal page on Mobile
    Mobile_Home.Verify Wemall Live Chat Agent
    Mobile_Home.Check To Wemall Live Chat Mobile Page


