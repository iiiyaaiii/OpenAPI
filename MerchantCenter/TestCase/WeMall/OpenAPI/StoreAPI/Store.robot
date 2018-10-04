*** Settings ***
Library     RequestsLibrary
Library     Selenium2Library
Resource    ../../../../Resource/OpenAPI/Configs/serverconfig.txt
Resource    ../../../../Resource/OpenAPI/TestData/account_data.txt
*** Test Cases ***

TC_MC_13136
    [Documentation]    Get store detail Success
    [Tags]    Regression    OpenAPI-Strore    Medium
     Get store detail Success

TC_MC_13137
  [Documentation]    Get store detail Failed
  [Tags]    Regression    OpenAPI-Strore    Medium
  Get store detail Failed

TC_MC_13138
  [Documentation]  Get multiple store category Success
  [Tags]    Regression    OpenAPI-Strore    Medium
  Get multiple store category Success

TC_MC_13139
    [Documentation]  Get multiple store category Success Failed
    [Tags]    Regression    OpenAPI-Strore    Medium
    Get multiple store category Success Failed


*** Keywords ***
Get store detail Success
    Create Session    Get_store    ${STAGING_HOST}
    &{headers}=  Create Dictionary  Authorization=${Bearer1_success}  Content-Type=application/json
    ${resp}=  Get Request  Get_store  ${Store_single}    headers=${headers}
    Log To Console    	${resp.status_code}
    Should Be Equal As Strings    ${resp.status_code}    200
    Should Be Equal               ${resp.json()['status_txt']}    Success

Get store detail Failed
  Create Session    Get_store    ${STAGING_HOST}
  &{headers}=  Create Dictionary  Authorization=${Bearer1_failed}  Content-Type=application/json
  ${resp}=  Get Request  Get_store  ${Store_single}    headers=${headers}
  Log To Console    	${resp.status_code}
  Should Be Equal As Strings    ${resp.status_code}    401
  Should Be Equal               ${resp.json()['fault']['faultstring']}    Invalid Access Token

Get multiple store category Success
    Create Session    Get_store    ${STAGING_HOST}
    &{headers}=  Create Dictionary  Authorization=${Bearer1_success}  Content-Type=application/json
    ${resp}=  Get Request  Get_store  ${Store_categories}    headers=${headers}
    Log To Console    	${resp.status_code}
    Should Be Equal As Strings    ${resp.status_code}    200
    Should Be Equal               ${resp.json()['status_txt']}    Success

Get multiple store category Success Failed
    Create Session    Get_store    ${STAGING_HOST}
    &{headers}=  Create Dictionary  Authorization=${Bearer1_failed}  Content-Type=application/json
    ${resp}=  Get Request  Get_store  ${Store_categories}    headers=${headers}
    Log To Console    	${resp.status_code}
    Should Be Equal As Strings    ${resp.status_code}    401
    Should Be Equal               ${resp.json()['fault']['faultstring']}    Invalid Access Token
