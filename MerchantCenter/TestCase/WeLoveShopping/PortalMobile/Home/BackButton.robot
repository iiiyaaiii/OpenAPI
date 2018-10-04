*** Settings ***
Suite Setup    Open Custom Browser    ${URL_MOBILE}    Mobile
Test Setup    Open Custom Browser    ${URL_MOBILE}    Mobile
Suite Teardown    Close All Browsers
Resource    ../../../../Resource/WeLoveShopping/MobileElement/Homepage.robot
Resource    ../../../../Resource/WeLoveShopping/MobileElement/levelD.robot
Resource    ../../../../Resource/WeLoveShopping/init.robot
Resource    ../../../../Keyword/Common/Common.txt

*** Variables ***
${url_home}    https://m.wls-dev.com/


*** Test Cases ***
TC_MC_09476
    [Documentation]     Verify ย้อนกลับ at levelD product
    [Tags]    Regression    Medium
    Click Product Dealzap On Homepage
    Verify Button Back On levelD
    Click Back Button On LevelD
    Verify Back To Homepage Portal    ${url_home}

TC_MC_09477
    [Documentation]     Verify ย้อนกลับ at Official shops
    [Tags]    Regression    Medium
    Click Official Shops All
    Verify Button Back On Offical
    Click Back Button On Officail
    Verify Back To Homepage Portal    ${url_home}


*** Keywords ***
Click Product Dealzap On Homepage
    Click Element    ${product}

Click Official Shops All
    Page Should Contain    Official Shops
    Execute JavaScript    window.scrollTo(0,700)
    Click Element    ${official_shops_button}

Verify Button Back On levelD
    Wait Until Element Is Visible    ${btn_back}

Verify Button Back On Offical
    Wait Until Element Is Visible    ${btn_back_official}

Click Back Button On LevelD
    Click Element    ${btn_back}

Click Back Button On Officail
    Click Element    ${btn_back_official}

Verify Back To Homepage Portal
    [Arguments]    ${url_home}
    Wait Until Element Is Visible    ${menu_promotion}
    ${url_current}    Get Location
    Should Be Equal    ${url_current}    ${url_home}



