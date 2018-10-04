*** Settings ***
Resource    ${CURDIR}/../../resources/init.robot
Resource    ${CURDIR}/../../resources/wordmap/promotion_freebie_create.robot
Resource    ${CURDIR}/../../resources/locators/promotion/promotion_freebie_create.robot
Resource    ${CURDIR}/../component/promotion_common.robot

*** Keywords ***
All Create Freebie Promotion Fields Should Be Appeared
    ${labelName}=    Get Dictionary Keys    ${label_create_freebie}
    :For    ${labelName}    IN    @{labelName}
    \    ${type}    ${element}=    Split String    ${labelName}    _    1
    \    Run Keyword If    '${type}' == 'lbl'    Text Label Should Be Appeared    &{label_create_freebie}[${labelName}]
    \    Run Keyword If    '${type}' == 'btn'    Button Label Should Be Appeared    &{label_create_freebie}[${labelName}]

Go To Create Freebie Page For Specific Campaign ID
    [Arguments]    ${camp_id}
    Go To    ${CAMP_ITM_URL}/campaigns/${camp_id}/create-promotion/freebie

Fill In Create New Freebie Form
    [Arguments]    ${testData}    ${action}
    ##FILL IN FORM
    :For    ${createFreebieField}    IN    @{createFreebieFields}
    \    ${type}    ${element}=    Split String    ${createFreebieField}    _    1
    \    Run Keyword If    '${type}' == 'txt'    Fill In Textbox    &{create_freebie}[${createFreebieField}]    &{${testData}}[${createFreebieField}]
    \    Run Keyword If    '${type}' == 'content'    Fill In Content Console    &{create_freebie}[${createFreebieField}]    &{${testData}}[${createFreebieField}]
    \    Run Keyword If    '${type}' == 'calendar' and '&{${testData}}[calendar_promotion_start]' != '${EMPTY}'    Select Promotion Period    &{${testData}}[calendar_promotion_start]    &{${testData}}[calendar_promotion_stop]
    \    Run Keyword If    '${type}' == 'chk'    Tick Checkbox    &{create_freebie}[${createFreebieField}]    &{${testData}}[${createFreebieField}]
    \    Run Keyword If    '${type}' == 'ddl'    Select Dropdown List Option    &{create_freebie}[${createFreebieField}]    &{${testData}}[${createFreebieField}]
    \    Run Keyword If    '${type}' == 'upload' and '&{${testData}}[${createFreebieField}]' != '${EMPTY}'    Select Image To Upload    &{create_freebie}[${createFreebieField}]    &{${testData}}[${createFreebieField}]
    ##USER ACTION
    Run Keyword If    '${action}' == 'Create'    Click Submit Promotion Form
    Run Keyword If    '${action}' == 'Cancel'    Click Cancel Promotion Form

Validate Create New Freebie Form
    [Arguments]    ${error_case}    ${testData}
    Go To Create Freebie Page For Specific Campaign ID    ${camp_id}
    ##FILL IN FORM
    :For    ${createFreebieField}    IN    @{createFreebieFields}
    \    ${type}    ${element}=    Split String    ${createFreebieField}    _    1
    \    Run Keyword If    '${type}' == 'txt' and '&{${testData}}[${createFreebieField}]' != '${EMPTY}'    Fill In Textbox    &{create_freebie}[${createFreebieField}]    &{${testData}}[${createFreebieField}]
    \    Run Keyword If    '${type}' == 'content' and '&{${testData}}[${createFreebieField}]' != '${EMPTY}'    Fill In Content Console    &{create_freebie}[${createFreebieField}]    &{${testData}}[${createFreebieField}]
    \    Run Keyword If    '${type}' == 'calendar' and '&{${testData}}[calendar_promotion_start]' != '${EMPTY}'    Select Promotion Period    &{${testData}}[calendar_promotion_start]    &{${testData}}[calendar_promotion_stop]
    \    Run Keyword If    '${type}' == 'chk' and '&{${testData}}[${createFreebieField}]' != '${EMPTY}'    Tick Checkbox    &{create_freebie}[${createFreebieField}]    &{${testData}}[${createFreebieField}]
    \    Run Keyword If    '${type}' == 'ddl' and '&{${testData}}[${createFreebieField}]' != '${EMPTY}'    Select Dropdown List Option    &{create_freebie}[${createFreebieField}]    &{${testData}}[${createFreebieField}]
    \    Run Keyword If    '${type}' == 'upload' and '&{${testData}}[${createFreebieField}]' != '${EMPTY}'    Select Image To Upload    &{create_freebie}[${createFreebieField}]    &{${testData}}[${createFreebieField}]
    ##SUBMIT FORM
    Click Submit Promotion Form
    ##VALIDATE ERROR MESSAGE
    Run Keyword If    '${error_case}' == 'Mandatory Text'    Missing Mandatory - Text Field Message Should Be Appeared
    Run Keyword If    '${error_case}' == 'Mandatory Dropdown'    Missing Mandatory - Dropdown Field Message Should Be Appeared
    Run Keyword If    '${error_case}' == 'Mandatory Image'    Missing Mandatory - Image Field Message Should Be Appeared
    Run Keyword If    '${error_case}' == 'Maximum Name'    Exceed Maximum Promotion Name Message Should Be Appeared
    Run Keyword If    '${error_case}' == 'Maximum Description'    Exceed Maximum Promotion Description Message Should Be Appeared
    Capture Page Screenshot
    ##CANCEL FORM
    Click Cancel Promotion Form
