*** Settings ***
Library  HttpLibrary.HTTP
Library  String

### Note : Please install Robot Framework keywords for HTTP requests for this keyword with command :
###        pip install robotframework-httplibrary

*** Keywords ***
Call api
    [Arguments]  ${method}  ${url}  ${uri}  ${request_body}  ${header_dict}=&{EMPTY}  ${protocal}=https
    [Documentation]  ${method} = GET/POST/PUT
    ...  ${header_dict} = default {}
    ...  [Return] = Dictionary {body=..., status=...}
    log to console   url=${url}
    Create Http Context    ${url}    ${protocal}

    Log to console   header_dict=${header_dict}

    :FOR  ${header_key}  IN  @{header_dict}
	\   Set Request Header  ${header_key}  ${header_dict['${header_key}']}


    Run keyword if  '${method}'=='POST' or '${method}'=='PUT'  Set Request Body  ${request_body}
    Run keyword if  '${method}'=='GET'   GET   ${uri}?${request_body}
    ...  ELSE IF    '${method}'=='POST'  POST  ${uri}
    ...  ELSE IF    '${method}'=='PUT'   PUT   ${uri}

    ${response}=  Get Response Body
    ${status}=  Get Response Status
    ${result}=  Create dictionary  body=${response}  status=${status}
    [Return]  ${result}

Assert response node
    [Arguments]  ${response}  ${json_path}  ${expected}
    ${actual}=  Get Json Value  ${response}  ${json_path}

    ${actual}=   Replace String  ${actual}  "   ${EMPTY}
    ${expected}=   Replace String  ${expected}  "  ${EMPTY}
    Should be equal as strings  ${expected}  ${actual}

Assert response node contain
    [Arguments]  ${response}  ${json_path}  ${expected}
    ${actual}=  Get Json Value  ${response}  ${json_path}
    Should contain  ${actual}  ${expected}

