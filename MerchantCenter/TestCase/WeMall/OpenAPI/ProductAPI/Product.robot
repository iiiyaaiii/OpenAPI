*** Settings ***
Suite Setup     Get Authorized token
Library     RequestsLibrary
Library     Selenium2Library
Resource    ../../../../Resource/OpenAPI/Configs/serverconfig.txt
Resource    ../../../../Resource/OpenAPI/TestData/account_data.txt

*** Test Cases ***
TC_MC_13140
    [Documentation]    Get multiple product success
    [Tags]    Regression    OpenAPI-Product    Medium
    Get multiple product success

TC_MC_13141
      [Documentation]    Get multiple product failed
      [Tags]    Regression    OpenAPI-Product    Medium
      Get multiple product failed

TC_MC_13142
      [Documentation]    Get single product detail success
      [Tags]    Regression    OpenAPI-Product    Medium
      Get single product detail success

TC_MC_13143
    [Documentation]    Get single product detail (access token failed)
    [Tags]    Regression    OpenAPI-Product    Medium
    Get single product detail success (access token failed)

TC_MC_13144
  [Documentation]   Get single product detail (products id failed)
  [Tags]    Regression    OpenAPI-Product    Medium
  Get single product detail (products id failed)

*** Keywords ***
Get Authorized token
    ${auth}=  Create List  ${auth_user}  ${auth_passwd}
    Create Session    wemall_account    ${STAGING_HOST}   auth=${auth}
    &{headers}=  Create Dictionary  Content-Type=application/json
    ${resp}=  Post Request  wemall_account  ${ACCESS_TOKEN}  headers=${headers}
    ${TOKEN}=     Set Variable     ${resp.json()['access_token']}
    Set Global Variable     ${TOKEN}
    Log To Console    TOKEN= ${TOKEN}

Get multiple product success
    Create Session    multiple_product    ${STAGING_HOST}
    &{headers}=  Create Dictionary  Authorization=Bearer ${TOKEN}  Content-Type=application/json
    ${resp}=  Get Request  multiple_product  ${Product_multiple}    headers=${headers}
    Log To Console    TOKEN= ${TOKEN}
    Log To Console    	${resp.status_code}
    Should Be Equal As Strings    ${resp.status_code}    200
    Should Be Equal               ${resp.json()['status_txt']}    OK

Get multiple product failed
    Create Session    multiple_product    ${STAGING_HOST}
    &{headers}=  Create Dictionary  Authorization=${Bearer_failed}  Content-Type=application/json
    ${resp}=  Get Request  multiple_product  ${Product_multiple}    headers=${headers}
    Log To Console    	${resp.status_code}
    Should Be Equal As Strings    ${resp.status_code}    401


Get single product detail success
  Create Session    single_product    ${STAGING_HOST}
  &{headers}=  Create Dictionary  Authorization=Bearer ${TOKEN}  Content-Type=application/json
  ${resp}=  Get Request  single_product  ${Product_single}${product_id_success}    headers=${headers}
  Log To Console    TOKEN= ${TOKEN}
  Log To Console    	${resp.status_code}
  Should Be Equal As Strings    ${resp.status_code}    200


Get single product detail success (access token failed)
  Create Session    single_product    ${STAGING_HOST}
  &{headers}=  Create Dictionary  Authorization=${Bearer_failed}  Content-Type=application/json
  ${resp}=  Get Request  single_product   ${Product_single}${product_id_success}    headers=${headers}
  Log To Console    	${resp.status_code}
  Should Be Equal As Strings    ${resp.status_code}    401

Get single product detail (products id failed)
  Create Session    single_product    ${STAGING_HOST}
  &{headers}=  Create Dictionary  Authorization=${TOKEN}  Content-Type=application/json
  ${resp}=  Get Request  single_product   ${Product_single}${product_id_fail}    headers=${headers}
  Log To Console    	${resp.text}
