*** Settings ***
Suite Teardown    Close All Browsers
Test Teardown     Run Keywords    Capture Page Screenshot    AND    Close Browser
Force Tags        Wemall-Mobile
Resource          ../../../../Resource/WeMall/Configuration/Staging/serverconfig.txt
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Resource/WeMall/MobileElement/StoreFront.robot
Resource          ../../../../Keyword/Common/Common.txt
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

Open Store Front Page
    [Arguments]    ${shopSlugID}
    Go To    ${URL_MOBILE}/${shopSlugID}

Open Shop Main Menu
    [Arguments]    ${shopSlugID}    ${shopName}
    Mobile_StoreFront.Open Wemall Store Front Page On Mobile    ${shopSlugID}
    Mobile_StoreFront.Wemall Store Front Page Should Be Appeared    ${shopName}
    Mobile_StoreFront.Click Shop Menu Icon

Shop Menu Option Should Be Appeared
    [Arguments]    ${shopMenu}
    Mobile_StoreFront.Shop Menu Should Be Appeared    ${shopMenu}

Validate Social Network Icon
    [Arguments]    ${socialNetwork}    ${expectedResult}
    Run Keyword If    '${expectedResult}'=='Invisible'    Element Should Not Be Visible    ${socialNetwork}
    Run Keyword If    '${expectedResult}'=='Visible'      Element Should Be Visible        ${socialNetwork}
    [Teardown]    Capture Page Screenshot

Footer 3 Step should be appeared
    Wait Until Element Is Visible    ${box_remind_3step}

Footer 3 Step should not be appeared
    Wait Until Element Is Not Visible    ${box_remind_3step}


*** Test Cases ***
TC_MC_07069
    [Documentation]    [StoreFront][Mobile] Footer remind shop setup 3 step incomplete - Appearance - Logged-in with shop was setup 3 step completed
    [Tags]    Regression    Medium    Ligo    Sprint2017MC19
    [Setup]    Successfully Log-in To WeMall    ${seller_user_001}    ${seller_pwd_001}
    Open Store Front Page    ${seller_name001}
    Wait Until Element is Visible    ${txt_search_in_store}
    Footer 3 Step should not be appeared

TC_MC_07070
    [Documentation]    [StoreFront][Mobile] Footer remind shop setup 3 step incomplete - Appearance - Logged-in with shop is setup 3 step incomplete
    [Tags]    Regression    Medium    Ligo    Sprint2017MC19
    [Setup]    Successfully Log-in To WeMall    ${user_wm_3step}    ${pwd_wm_3step}
    Open Store Front Page    ${wm_3step}
    Wait Until Element is Visible    ${txt_search_in_store}
    Footer 3 Step should be appeared

TC_MC_07071
    [Documentation]    [StoreFront][Mobile] Footer remind shop setup 3 step incomplete - Click "คลิกเพื่อดำเนินการ" button.
    [Tags]    Regression    Low    Ligo    Sprint2017MC19
    [Setup]    Successfully Log-in To WeMall    ${user_wm_3step}    ${pwd_wm_3step}
    Open Store Front Page    ${wm_3step}
    Wait Until Element is Visible    ${txt_search_in_store}
    Click button    ${btn_footer}
    ${location}=    Get Location
    Should Contain    ${location}    ${URL_STORE}/${wm_3step}/admin

TC_MC_07072
    [Documentation]    [StoreFront][Mobile] Footer - Without Setup Social network
    [Tags]    Regression    Low    Ligo    Sprint2017MC19
    [Setup]    Successfully Log-in To WeMall    ${seller_user_001}    ${seller_pwd_001}
    Open Store Front Page    ${seller_name001}
    Wait Until Element is Visible    ${txt_search_in_store}
    Social Network Section Should Not Be Appeared

TC_MC_07073
    [Documentation]    [StoreFront][Mobile] Footer - With Setup Social network
    [Tags]    Regression    Low    Ligo    Sprint2017MC19
    [Setup]    Successfully Log-in To WeMall    ${store_email1}    ${store_password1}
    Open Store Front Page    ${store_url1}
    Wait Until Element is Visible    ${txt_search_in_store}
    Social Network Section Should Be Appeared


