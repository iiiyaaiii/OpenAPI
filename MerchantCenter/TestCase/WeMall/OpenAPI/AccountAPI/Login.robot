*** Settings ***
Suite Setup     Get Authorized token
Library     RequestsLibrary
Library     Selenium2Library
Resource    ../../../../Resource/OpenAPI/Configs/serverconfig.txt
Resource    ../../../../Resource/OpenAPI/TestData/account_data.txt

*** Test Cases ***
TC_MC_13153
    [Documentation]    Login via facebook success
    [Tags]    Regression    OpenAPI-Account   Login
    Login with Facebook success

TC_MC_13162
    [Documentation]    Login via facebook success
    [Tags]    Regression    OpenAPI-Account   Login
    Login with Username Password success

*** Keywords ***
Get Authorized token
    ${auth}=  Create List  ${auth_user}  ${auth_passwd}
    Create Session    wemall_account    ${STAGING_HOST}   auth=${auth}
    &{headers}=  Create Dictionary  Content-Type=application/json
    ${resp}=  Post Request  wemall_account  ${ACCESS_TOKEN}  headers=${headers}
    ${TOKEN}=     Set Variable     ${resp.json()['access_token']}
    Set Global Variable     ${TOKEN}
    Log To Console    TOKEN= ${TOKEN}

Login with Facebook success
    Create Session    wemall_account    ${STAGING_HOST}
    &{data}=  Create Dictionary  uid=12345678  service=facebook  display_name=${fb_display_name}  email=${fb_email}  first_name=${fb_first_name}   last_name=${fb_last_name}  device_id=12345678  device_type=ios
    &{headers}=  Create Dictionary  Authorization=Bearer ${TOKEN}  Content-Type=application/json
    ${resp_fb}=  Post Request  wemall_account  ${ACCOUNT_AUTH_SOCIAL}  data=${data}  headers=${headers}
    ${fb_access_token}=     Set Variable     '${resp_fb.json()['data']['record']['access_token']}'
    Set Global Variable     ${fb_access_token}
    Should Be Equal As Strings    ${resp_fb.status_code}    200

Login with Username Password success
    Create Session    wemall_account    ${STAGING_HOST}
    &{data}=  Create Dictionary  password=${user_password}  username=${user_email}
    &{headers}=  Create Dictionary  Authorization=Bearer ${TOKEN}  Content-Type=application/json
    ${resp}=  Post Request  wemall_account  ${ACCOUNT_AUTH}  data=${data}  headers=${headers}
    ${user_access_token}=     Set Variable     '${resp.json()['data']['record']['access_token']}'
    Set Global Variable     ${user_access_token}
    Should Be Equal As Strings    ${resp.status_code}    200
