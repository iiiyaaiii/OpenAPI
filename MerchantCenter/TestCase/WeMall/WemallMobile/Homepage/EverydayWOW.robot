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
TC_MC_05682
    [Documentation]     [Mobile]Homepage EverydayWoW: Everyday WoW active (have product more than 5 )
    [Tags]    Regression    Ligo    Sprint2017MC16
    Mobile_Home.Open Wemall Portal page on Mobile
    Mobile_Home.Wemall Logo should be appeared
    Mobile_Home.Verify EverydayWoW active