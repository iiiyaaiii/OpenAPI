*** Setting ***
Test Teardown     Close Browser
Force Tags        Store-Web
Library           SeleniumLibrary
Library           String
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Common.txt

*** Keywords ***
Check order
    [Documentation]    Check order
    [Arguments]    ${wait_type}
    Go To    ${URL_STORE}/${shop_name}/admin/orders
    Wait Until Element Is Visible    //ul[@class="nav nav-tabs"]
    ${order}    Get Text    //a[@href="#${wait_type}"]//span
    ${order}    Convert To String    ${order}
    ${order}    Remove String    ${order}    (    )    ,
    Set Test Variable    ${order}

Check order dashboard
    [Documentation]    Check order dashboard
    [Arguments]    ${wait_type}
    Go To    ${URL_STORE}/${shop_name}/admin/dashboard/summary
    Wait Until Element Is Visible    //div[@*="row-order-total-box ng-scope"]
    Sleep    2s
    ${Dashboard}    Get Text    //div[contains(@ng-click,"${wait_type}")]//div[@class="headline ng-isolate-scope"]
    ${Dashboard}    Convert To String    ${Dashboard}
    ${Dashboard}    Remove String    ${Dashboard}    ,
    Set Test Variable    ${Dashboard}

*** Test Cases ***
TC_MC_09356
    [Documentation]    Verify display Total order waiting for pay.
    [Tags]    Regression    Medium    mock
    Account Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Go To    ${URL_STORE}/${storename_slug_wemall}/admin
    Get shop name
    Check order    waitpayment
    Check order dashboard    waitpayment
    Should Be Equal    ${order}    ${Dashboard}

TC_MC_09357
    [Documentation]    Verify display Total order waiting for pay. Incase no have order.
    [Tags]    Regression    Low    mock
    Account Login    ${wmshoptestmd_user_001}    ${wmshoptestmd_pwd_001}
    Go To    ${URL_STORE}/${wmshoptestmd_url_001}/admin
    Get shop name
    Check order    waitpayment
    Check order dashboard    waitpayment
    Should Be Equal    ${order}    ${Dashboard}

TC_MC_09359
    [Documentation]    Verify display Total order waiting for ship
    [Tags]    Regression    High    mock
    Account Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Go To    ${URL_STORE}/${storename_slug_wemall}/admin
    Get shop name
    Check order    shipping
    Check order dashboard    shipping
    Should Be Equal    ${order}    ${Dashboard}

TC_MC_09360
    [Documentation]    Verify display Total order waiting for ship. Incase no have order.
    [Tags]    Regression    Low    mock
    Account Login    ${wmshoptestmd_user_001}    ${wmshoptestmd_pwd_001}
    Go To    ${URL_STORE}/${wmshoptestmd_url_001}/admin
    Get shop name
    Check order    shipping
    Check order dashboard    shipping
    Should Be Equal    ${order}    ${Dashboard}

TC_MC_09362
    [Documentation]    Verify display Total order waiting for receive.
    [Tags]    Regression    High    mock
    Account Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Go To    ${URL_STORE}/${storename_slug_wemall}/admin
    Get shop name
    Check order    confirmshipping
    Check order dashboard    waitconfirmreceive
    Should Be Equal    ${order}    ${Dashboard}

TC_MC_09363
    [Documentation]    Verify display Total order waiting for receive. Incase no have order.
    [Tags]    Regression    Low    mock
    Account Login    ${wmshoptestmd_user_001}    ${wmshoptestmd_pwd_001}
    Go To    ${URL_STORE}/${wmshoptestmd_url_001}/admin
    Get shop name
    Check order    confirmshipping
    Check order dashboard    waitconfirmreceive
    Should Be Equal    ${order}    ${Dashboard}

TC_MC_09365
    [Documentation]    Verify display Total order received.
    [Tags]    Regression    High    mock
    Account Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Go To    ${URL_STORE}/${storename_slug_wemall}/admin
    Get shop name
    ###    complete = received
    Check order    complete
    Check order dashboard    complete
    Should Be Equal    ${order}    ${Dashboard}

TC_MC_09366
    [Documentation]    Verify display Total order received. Incase no have order.
    [Tags]    Regression    Low    mock
    Account Login    ${wmshoptestmd_user_001}    ${wmshoptestmd_pwd_001}
    Go To    ${URL_STORE}/${wmshoptestmd_url_001}/admin
    Get shop name
    ###    complete = received
    Check order    complete
    Check order dashboard    complete
    Should Be Equal    ${order}    ${Dashboard}

TC_MC_09368
    [Documentation]    Verify display Total order refund.
    [Tags]    Regression    High    mock
    Account Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Go To    ${URL_STORE}/${storename_slug_wemall}/admin
    Get shop name
    ###    abnormal = refund
    Check order    abnormal
    Click Element    //a[@href="#abnormal"]//span
    Wait Until Element Is Visible    sort-by-refund
    Click Element    //button[@type="submit"]
    Sleep    3s
    ${order}    get text    //div[contains(@class,"total-item")]
    @{order}    Split String    ${order}    ${SPACE}
    ${order}    Set Variable    ${order[1]}
    Check order dashboard    abnormal
    Should Be Equal    ${order}    ${Dashboard}

TC_MC_09369
    [Documentation]    Verify display Total order refund. Incase no have order.
    [Tags]    Regression    Low    mock
    Account Login    ${wmshoptestmd_user_001}    ${wmshoptestmd_pwd_001}
    Go To    ${URL_STORE}/${wmshoptestmd_url_001}/admin
    Get shop name
    ###    abnormal = refund
    Check order    abnormal
    Check order dashboard    abnormal
    Should Be Equal    ${order}    ${Dashboard}