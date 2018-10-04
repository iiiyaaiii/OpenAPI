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
Go to Showroom section
    [Arguments]    ${showroomName}
    Mobile_Home.Open Wemall Portal page on Mobile
    Mobile_Home.Wemall Portal page should be appeared
    Mobile_Home.Scroll Down to section    ${showroomName}

*** Test Cases ***
TC_MC_05544
    [Documentation]    [Portal][Mobile] Showroom - Navigation link - LifeStyle
    [Tags]    Smoke    Regression    Ligo    Sprint2017MC16
    Go to Showroom section    LifeStyle
    Mobile_Home.Click First Banner on Showroom section    LifeStyle
    Mobile_Home.Showroom section should not be appeared

TC_MC_05545
    [Documentation]    [Portal][Mobile] Showroom - Navigation link - Gadget
    [Tags]    Smoke    Regression    Ligo    Sprint2017MC16
    Go to Showroom section    Gadget
    Mobile_Home.Click First Banner on Showroom section    Gadget
    Mobile_Home.Showroom section should not be appeared

TC_MC_05546
    [Documentation]	[Portal][Mobile] Showroom - Navigation link - Beauty
    [Tags]    Smoke    Regression    Ligo    Sprint2017MC16
    Go to Showroom section    Beauty
    Mobile_Home.Click First Banner on Showroom section    Beauty
    Mobile_Home.Showroom section should not be appeared