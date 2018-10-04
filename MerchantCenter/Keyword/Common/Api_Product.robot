*** Setting ***
Library           SeleniumLibrary
Library           HttpLibrary.HTTP
Library           RequestsLibrary
Library           Collections
Library           DateTime
Library           OperatingSystem

*** keyword ***
Get Token
    Create Session    get_token    ${URL_API_ACCOUNT}    verify=True
    ${body_data}    Create Dictionary    client_id=${client_id}     client_secret=${client_secret}    grant_type=client_credentials
    ${header}    Create Dictionary    Content-Type=application/x-www-form-urlencoded
    ${response}    Post Request    get_token    /oauth2/access_token    data=${body_data}    headers=${header}
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
    ${header}    Create Dictionary    X-WLS-Access-Token=${token}
    [return]    ${header}

Update Product
    [Arguments]    ${data}=none    ${method}=none
    Create Session    product_update    ${URL_GATEWAY}    verify=True
    ${body_data}=    Set Json Value    {"product": [] }    /product    ${data}
    ${token}    Get Token
    ${header_json}    Create Dictionary    Content-Type=application/json    X-WLS-Access-Token=${token}
    ${response}    Put Request    product_update    /merchant/product/${method}    data=${body_data}    headers=${header_json}
    [return]    ${response}

Get Product List
    Create Session    product_list    ${URL_GATEWAY}    verify=True
    ${header}    Set Request Header
    ${response}    Get Request    product_list    /merchant/product    headers=${header}
    [return]    ${response}

Get Product filter
    [Arguments]    ${FILTER}
    Create Session    product_list    ${URL_GATEWAY}    verify=True
    ${header}    Set Request Header
    ${response}    Get Request    product_list    ${FILTER}    headers=${header}
    [return]    ${response}

Get Product Info
    [Arguments]    ${pid}=none
    Create Session    product_list    ${URL_GATEWAY}    verify=True
    ${header}    Set Request Header
    ${response}    Get Request    product_list    /merchant/product/${pid}    headers=${header}
    [return]    ${response}

Get Incorrect Header
    Create Session    product_list    ${URL_GATEWAY}    verify=True
    ${header}    Create Dictionary    X-WLS-Access-Token=RmAsPcfgPC8bLgJGiFiuCXY5ENUqkLSGv1bH1QsN!
    ${response}    Get Request    product_list    /merchant/product    headers=${header}
    [return]    ${response}