*** Setting ***
Test Setup        Request Access Token For E-stamp    ${client_id_estamp}    ${client_secret_estamp}    ${grant_type}
Library           SeleniumLibrary
Library           HttpLibrary.HTTP
Library           String
Resource          ../../../../Keyword/Common/Api_Estamp.txt
Resource          ../../../../Resource/Common/API/Api_Estamp.txt
Resource          ../../../../Resource/WeLoveShopping/init.robot

*** Test Cases ***
TC_MC_08085
    [Documentation]     Get list of campaign with existing campaign id
    [Tags]    High    RECON2017MC21
    ${response_data}    Get Campaign List By Campaign Id    1
    Response Status Code Should Equal    200
    Should Contain    ${response_data}    id
    Should Contain    ${response_data}    name
    Should Contain    ${response_data}    detail
    Should Contain    ${response_data}    stamp_logo_url
    Should Contain    ${response_data}    stamp_per_page
    Should Contain    ${response_data}    background_url
    Should Contain    ${response_data}    banner_url
    Should Contain    ${response_data}    policy
    Should Contain    ${response_data}    term_condition
    Should Contain    ${response_data}    period
    Should Contain    ${response_data}    condition
    Should Contain    ${response_data}    reward
    Should Contain    ${response_data}    branch
    Should Contain    ${response_data}    other
    Should Contain    ${response_data}    active
    Should Contain    ${response_data}    started_at
    Should Contain    ${response_data}    collect_expired_at
    Should Contain    ${response_data}    campaign_expired_at
    Should Contain    ${response_data}    verify_type
    Should Contain    ${response_data}    campaign_branch

TC_MC_08086
    [Documentation]    Get list of campaign with existing limit equal 10
    [Tags]    High    RECON2017MC21
    ${response_data}    Get Campaign List By Parameter    limit    10
    Response Status Code Should Equal    200
    Should Contain    ${response_data}    limit
    Get Value From Response Data    ${response_data}    /pagination/limit
    Should Be True    ${value} == 10

TC_MC_08087
    [Documentation]    Get list of campaign with existing page equal 1
    [Tags]    High    RECON2017MC21
    ${response_data}    Get Campaign List By Parameter    page    1
    Response Status Code Should Equal    200
    Should Contain    ${response_data}    page
    Get Value From Response Data    ${response_data}    /pagination/page
    Should Be True    ${value} == 1

TC_MC_08088
    [Documentation]    Get list of campaign with existing limit equal 15
    [Tags]    High    RECON2017MC21
    ${response_data}    Get Campaign List By Parameter    limit    15
    Response Status Code Should Equal    200
    Should Contain    ${response_data}    limit
    Get Value From Response Data    ${response_data}    /pagination/limit
    Should Be True    ${value} == 15

TC_MC_08089
    [Documentation]    Get list of campaign with existing page equal 2
    [Tags]    High    RECON2017MC21
    ${response_data}    Get Campaign List By Parameter    page    2
    Response Status Code Should Equal    200
    Should Contain    ${response_data}    page
    Get Value From Response Data    ${response_data}    /pagination/page
    Should Be True    ${value} == 2
