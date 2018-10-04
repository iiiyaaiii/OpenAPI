*** Setting ***
Test Teardown     Close Browser
Force Tags        Store-Web
Library           SeleniumLibrary
Library           String
Resource          ../../../../Resource/WeLoveShopping/init.robot
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Common.txt

*** Keywords ***
Check product status on dashboard
    [Documentation]    Check product status on dashboard
    [Arguments]    ${wait_type}
    Go To    ${URL_STORE}/${shop_name}/admin/dashboard/summary
    ${Dashboard}    Get Text    //div[@ng-bind="res.${wait_type}"]
    ${Dashboard}    Convert To String    ${Dashboard}
    ${Dashboard}    Remove String    ${Dashboard}    ,
    Set Test Variable    ${Dashboard}

Check product
    [Documentation]    Check product
    [Arguments]    ${wait_type}
    Go To    ${URL_STORE}/${shop_name}/admin/product
    ${Product}    Execute Javascript    return $('.${wait_type}').text()
    ${Product}    Convert To String    ${Product}
    ${Product}    Remove String    ${Product}    ,
    Set Test Variable    ${Product}

*** Test Cases ***
TC_MC_09286
    [Documentation]    Verify display Total All Listing.
    Account Login    ${user_reconorder}    ${password_reconorder}
    Go To    ${URL_STORE}/${reconorder_slug}/admin
    Get shop name
    Check product    all
    Check product status on dashboard    all
    Should Be Equal    ${Product}    ${Dashboard}

TC_MC_09287
    [Documentation]    Verify display Total All Listing. Incase no have Listing.
    Account Login    ${seller_user_002}    ${seller_pwd_002}
    Go To    ${URL_STORE}/${user_s002}/admin
    Get shop name
    Check product    all
    Check product status on dashboard    all
    Should Be Equal    ${Product}    ${Dashboard}

TC_MC_09289
    [Documentation]    Verify display Total Listing is Out of stock.
    [Tags]    Regression    Medium
    Account Login    ${user_reconorder}    ${password_reconorder}
    Go To    ${URL_STORE}/${reconorder_slug}/admin
    Get shop name
    Check product    emptystock
    Check product status on dashboard    emptystock
    Should Be Equal    ${Product}    ${Dashboard}

TC_MC_09290
    [Documentation]    Verify display Total Listing is Out of stock. Incase no have Listing.
    Account Login    ${seller_user_002}    ${seller_pwd_002}
    Go To    ${URL_STORE}/${user_s002}/admin
    Get shop name
    Check product    emptystock
    Check product status on dashboard    emptystock
    Should Be Equal    ${Product}    ${Dashboard}

TC_MC_09292
    [Documentation]    Verify display Total Listing is approved.
    [Tags]    Regression    Medium
    Account Login    ${user_reconorder}    ${password_reconorder}
    Go To    ${URL_STORE}/${reconorder_slug}/admin
    Get shop name
    Check product    approved
    Check product status on dashboard    approved
    Should Be Equal    ${Product}    ${Dashboard}

TC_MC_09293
    [Documentation]    Verify display Total Listing is approved. Incase no have Listing.
    Account Login    ${seller_user_002}    ${seller_pwd_002}
    Go To    ${URL_STORE}/${user_s002}/admin
    Get shop name
    Check product    approved
    Check product status on dashboard    approved
    Should Be Equal    ${Product}    ${Dashboard}

TC_MC_09295
    [Documentation]    Verify display Total Listing is Waiting for approve.
    [Tags]    Regression    Low
    Account Login    ${user_reconorder}    ${password_reconorder}
    Go To    ${URL_STORE}/${reconorder_slug}/admin
    Get shop name
    Check product    pending
    Check product status on dashboard    pending
    Should Be Equal    ${Product}    ${Dashboard}

TC_MC_09296
    [Documentation]    Verify display Total Listing is Waiting for approve. Incase no have Listing.
    Account Login    ${seller_user_002}    ${seller_pwd_002}
    Go To    ${URL_STORE}/${user_s002}/admin
    Get shop name
    Check product    pending
    Check product status on dashboard    pending
    Should Be Equal    ${Product}    ${Dashboard}

TC_MC_09298
    [Documentation]    Verify display Total Listing is Reject.
    [Tags]    Regression    Low
    Account Login    ${user_reconorder}    ${password_reconorder}
    Go To    ${URL_STORE}/${reconorder_slug}/admin
    Get shop name
    Check product    reject
    Check product status on dashboard    reject
    Should Be Equal    ${Product}    ${Dashboard}

TC_MC_09299
    [Documentation]    Verify display Total Listing is Reject. Incase no have Listing.
    Account Login    ${seller_user_002}    ${seller_pwd_002}
    Go To    ${URL_STORE}/${user_s002}/admin
    Get shop name
    Check product    reject
    Check product status on dashboard    reject
    Should Be Equal    ${Product}    ${Dashboard}