*** Setting ***
Test Setup        Request Access Token For E-stamp    ${client_id_estamp}    ${client_secret_estamp}    ${grant_type}
Library           SeleniumLibrary
Library           HttpLibrary.HTTP
Library           String
Resource          ../../../../Keyword/Common/Api_Estamp.txt
Resource          ../../../../Resource/Common/API/Api_Estamp.txt
Resource          ../../../../Resource/WeLoveShopping/init.robot

*** Test Cases ***
TC_MC_08094
    [Documentation]    Get list of merchant with merchant id
    [Tags]    RECON2017MC21    High
    ${response_data}    Get Merchant List By Merchant Id    1
    Response Status Code Should Equal    200
    Should Contain    ${response_data}    id
    Should Contain    ${response_data}    code
    Should Contain    ${response_data}    name
    Should Contain    ${response_data}    logo_url
    Should Contain    ${response_data}    banner_url

TC_MC_08095
    [Documentation]    Get list of merchant with limit equal 10
    [Tags]    RECON2017MC21    High
    ${response_data}    Get Merchant List By Parameter    limit    10
    Response Status Code Should Equal    200
    Should Contain    ${response_data}    limit
    Get Value From Response Data    ${response_data}    /pagination/limit
    Should Be True    ${value} == 10

TC_MC_08096
    [Documentation]    Get list of merchant with page equal 1
    [Tags]    RECON2017MC21    High
    ${response_data}    Get Merchant List By Parameter    page    1
    Response Status Code Should Equal    200
    Should Contain    ${response_data}    page
    Get Value From Response Data    ${response_data}    /pagination/page
    Should Be True    ${value} == 1

TC_MC_08097
    [Documentation]    Get list of merchant with limit equal 5
    [Tags]    RECON2017MC21    High
    ${response_data}    Get Merchant List By Parameter    limit    5
    Response Status Code Should Equal    200
    Should Contain    ${response_data}    limit
    Get Value From Response Data    ${response_data}    /pagination/limit
    Should Be True    ${value} == 5