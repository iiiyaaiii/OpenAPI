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
Go To Shop By Brand Section
    Mobile_Home.Open Wemall Portal page on Mobile
    Mobile_Home.Wemall Portal page should be appeared
    Mobile_Home.Scroll Down to section     Shop by Brand

Validate All Brands Filter
    [Arguments]    ${selectFilter}
    Mobile_Home.Select Filter    ${selectFilter}
    Mobile_Home.Selected Filter Should Be Appeared    ${selectFilter}

*** Test Cases ***
TC_MC_05540
    [Documentation]    [Portal][Mobile] Shop by Brand - View Selected Brand - 1st page
    [Tags]    Smoke    Regression    Ligo    Sprint2017MC16
    Go To Shop By Brand Section
    Mobile_Home.Click First Brand banner
    Mobile_Home.Wemall Portal page should not be appeared

TC_MC_05541
    [Documentation]    [Portal][Mobile] Shop by Brand - View Selected Brand - 2nd page
    [Tags]    Smoke    Regression    Ligo    Sprint2017MC16
    Go To Shop By Brand Section
    Mobile_Home.Click Right Arrow on Shop by Brand section
    Mobile_Home.Click First Brand banner
    Mobile_Home.Wemall Portal page should not be appeared

TC_MC_05538
    [Documentation]    [Portal][Mobile] Shop by Brand - View All Brand - 1st page
    [Tags]    Regression    Ligo    Sprint2017MC17
    Go To Shop By Brand Section
    Mobile_Home.Click ดูแบรนด์เพิ่มเติมที่นี่ link
    Mobile_Home.View All Brands Page Should Be Appeared

TC_MC_05539
    [Documentation]    [Portal][Mobile] Shop by Brand - View All Brand - 2nd page
    [Tags]    Regression    Ligo    Sprint2017MC17
    Go To Shop By Brand Section
    Mobile_Home.Click Right Arrow on Shop by Brand section
    Mobile_Home.Click ดูแบรนด์เพิ่มเติมที่นี่ link
    Mobile_Home.View All Brands Page Should Be Appeared

TC_MC_06107
    [Documentation]    [Portal][Mobile] View All Brands - Breadcrumb
    [Tags]    Regression    Ligo    Sprint2017MC17
    Mobile_Home.Open View All Brands Page
    Mobile_Home.Shop By Brand Breadcrumb Should Be Appeared
    Mobile_Home.Click On Shop By Brand Breadcrumb
    Mobile_Home.Wemall Portal page should be appeared

TC_MC_06109
    [Documentation]    [Portal][Mobile] View All Brands - Available Filter list
    [Tags]    Regression    Ligo    Sprint2017MC17
    [Setup]    Mobile_Home.Open View All Brands Page
    [Template]    Validate All Brands Filter
    A
    B
    C
    0-9#

TC_MC_06111
    [Documentation]    [Portal][Mobile] View All Brands - Brand
    [Tags]    Regression    Ligo    Sprint2017MC17
    Mobile_Home.Open View All Brands Page
    Mobile_Home.View All Brands Page Should Be Appeared
    Mobile_Home.Select Brand    Automation Testing
    Mobile_Home.View All Brands Page Should Not Be Appeared