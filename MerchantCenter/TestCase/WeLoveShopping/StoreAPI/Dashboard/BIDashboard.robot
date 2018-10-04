*** Setting ***
Suite Setup       Account Login    ${user_reconorder}    ${password_reconorder}
Suite Teardown    Close All Browsers
#Force Tags        Store-API    mock
Library           SeleniumLibrary
Library           HttpLibrary.HTTP
Library           RequestsLibrary
Library           Collections
Library           DateTime
Library           String
Resource          ../../../../Resource/WeLoveShopping/init.robot
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Common.txt

*** keyword ***
Get Token
    Create Session    get_token    https://staging.ascendanalyticshub.com    verify=True
    ${body_data}    Create Dictionary    grant_type=client_credentials
    ${header}    Create Dictionary    Authorization=Basic Y2xpZW50OnNlY3JldA=="    Content-Type=application/x-www-form-urlencoded
    ${response}    Post Request    get_token    /oauth/token    data=${body_data}    headers=${header}
    ${response_body}    To Json    ${response.content}
    Log    ${response_body}
    ${token}     Get From Dictionary    ${response_body}    access_token
    [return]    ${token}
    # Create Http Context    api-account.wls-dev.com    https
    # Set Request Body    grant_type=client_credentials&client_id=86151b263565b45b&client_secret=9fff17ac24cfef4d1a326267c114e949
    # POST    ${URL_API_ACCOUNT}/oauth2/access_token
    # Log Response Body

Set Request Header
    ${token}    Get Token
    ${header}    Create Dictionary    Authorization=bearer ${token}
    [return]    ${header}

Get Late Shipment
    [Arguments]    ${store_id}
    Create Session    late_shipment    https://staging.ascendanalyticshub.com    verify=True
    ${header}    Set Request Header
    ${response}    Get Request    late_shipment    /api/lateshipment/${store_id}    headers=${header}
    Log    ${response.content}
    [return]    ${response}

Get Refund Rate
    [Arguments]    ${store_id}
    Create Session    late_shipment    https://staging.ascendanalyticshub.com    verify=True
    ${header}    Set Request Header
    ${response}    Get Request    late_shipment    /api/refund/${store_id}    headers=${header}
    Log    ${response.content}
    [return]    ${response}

*** Test Cases ***
TC_MC_09333
    [Documentation]    Verify % Late Shipment at This week. Incase shop have data
    [Tags]    Regression    Medium
    ${response}    Get Late Shipment    ${id_reconorder}
    Should Be Equal As Strings    ${response.status_code}    200
    ${data_from_api_thisweek}    Get Json Value    ${response.content}    /thisweek/percentage
    # Account Login    kusuma.chom@gmail.com    Escrow@1234
    Get shop name
    Go To    ${URL_STORE}/${shop_name}/admin/dashboard
    Execute Javascript    window.scrollTo(0,2300)
    Wait Until Element Is Visible    //*[@id="page-content"]/div[1]/div[3]/div[3]/div[1]/div[2]/div/div/div[1]/div/div[2]/span[1]    60s
    ${data_from_display}    Execute Javascript    return parseFloat($('.col-qc-lateship .top-box .percent-box').text().replace(' ','').replace('%','')).toFixed(2)
    Log    ${data_from_display}
    Log    ${data_from_api_thisweek}
    Should be true    "${data_from_display}" == ${data_from_api_thisweek}

TC_MC_09336
    [Documentation]    Verify % Late Shipment at Last week. Incase shop doesn't have data
    [Tags]    Regression    Medium
    ${response}    Get Late Shipment    ${id_reconorder}
    Should Be Equal As Strings    ${response.status_code}    200
    ${data_from_api_lastweek}    Get Json Value    ${response.content}    /lastweek/percentage
    # Account Login    kusuma.chom@gmail.com    Escrow@1234
    Get shop name
    Go To    ${URL_STORE}/${shop_name}/admin/dashboard
    Execute Javascript    window.scrollTo(0,2300)
    Wait Until Element Is Visible    //*[@id="page-content"]/div[1]/div[3]/div[3]/div[1]/div[2]/div/div/div[1]/div/div[2]/span[1]    60s
    ${data_from_display}    Execute Javascript    return parseFloat($('.col-qc-lateship .bttm-box .percent-box').text().replace(' ','').replace('%','')).toFixed(2)
    Log    ${data_from_display}
    Log    ${data_from_api_lastweek}
    Should be true    "${data_from_display}" == ${data_from_api_lastweek}

TC_MC_09342
    [Documentation]    Verify % Refund Rate at first week on 3 week ago Incase shop dose have data
    [Tags]    Regression    Medium
    ${response}    Get Refund Rate    ${id_reconorder}
    Should Be Equal As Strings    ${response.status_code}    200
    ${data_from_api_last3week}    Get Json Value    ${response.content}    /last3week/percentage
    # Account Login    kusuma.chom@gmail.com    Escrow@1234
    Get shop name
    Go To    ${URL_STORE}/${shop_name}/admin/dashboard
    Execute Javascript    window.scrollTo(0,2300)
    Wait Until Element Is Visible    //*[@id="page-content"]/div[1]/div[3]/div[3]/div[1]/div[2]/div/div/div[1]/div/div[2]/span[1]    60s
    ${data_from_display}    Execute Javascript    return parseFloat($('.col-qc-refund .top-box .percent-box').text().replace(' ','').replace('%','')).toFixed(2)
    Log    ${data_from_display}
    Log    ${data_from_api_last3week}
    Should be true    "${data_from_display}" == ${data_from_api_last3week}

TC_MC_09348
    [Documentation]    Verify % Refund Rate at first week on 4 week ago Incase shop dose have data
    [Tags]    Regression    Medium
    ${response}    Get Refund Rate    ${id_reconorder}
    Should Be Equal As Strings    ${response.status_code}    200
    ${data_from_api_last4week}    Get Json Value    ${response.content}    /last4week/percentage
    # Account Login    kusuma.chom@gmail.com    Escrow@1234
    Get shop name
    Go To    ${URL_STORE}/${shop_name}/admin/dashboard
    Execute Javascript    window.scrollTo(0,2300)
    Wait Until Element Is Visible    //*[@id="page-content"]/div[1]/div[3]/div[3]/div[1]/div[2]/div/div/div[1]/div/div[2]/span[1]    60s
    ${data_from_display}    Execute Javascript    return parseFloat($('.col-qc-refund .bttm-box .percent-box').text().replace(' ','').replace('%','')).toFixed(2)
    Log    ${data_from_display}
    Log    ${data_from_api_last4week}
    Should be true    "${data_from_display}" == ${data_from_api_last4week}
