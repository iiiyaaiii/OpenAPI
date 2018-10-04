*** Setting ***
Resource    ../../Resource/Common/globalInit.robot
Library     HttpLibrary.HTTP
Library     RequestsLibrary

*** Keywords ***
Sign In WMS Via API
    [Arguments]    ${username}    ${password}
    Create Session    wms    ${URL_WMS}    max_retries=5    backoff_factor=1    verify=True
    ${response}    Post Request    wms    /login?email=${username}&password=${password}
    Log    ${response.headers}
    ${header}    Convert To String    ${response.headers}
    ${c_wms}    Get Regexp Matches    ${header}    wms=[a-zA-Z0-9%]+    0
    [Return]    ${c_wms[0]}
