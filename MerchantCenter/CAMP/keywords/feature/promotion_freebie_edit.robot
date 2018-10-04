*** Settings ***
Resource    ${CURDIR}/../../resources/init.robot
Resource    ${CURDIR}/../../resources/wordmap/promotion_freebie_edit.robot
Resource    ${CURDIR}/../../resources/locators/promotion/promotion_freebie_edit.robot
Resource    ${CURDIR}/../component/promotion_common.robot

*** Keywords ***
Go To Edit Freebie Page For Specific Promotion ID
    [Arguments]    ${promo_id}
    Go To    ${CAMP_ITM_URL}/promotions/${promo_id}

All Freebie Promotion's Information Fields Should Be Appeared
    ${labelName}=    Get Dictionary Keys    ${label_edit_freebie}
    :For    ${labelName}    IN    @{labelName}
    \    ${type}    ${element}=    Split String    ${labelName}    _    1
    \    Run Keyword If    '${type}' == 'lbl'    Text Label Should Be Appeared    &{label_edit_freebie}[${labelName}]
    \    Run Keyword If    '${type}' == 'btn'    Button Label Should Be Appeared    &{label_edit_freebie}[${labelName}]

Fill In Freebie's Promotion Information Form
    [Arguments]    ${testData}    ${action}
    ##FILL IN FORM
    :For    ${createFreebieField}    IN    @{createFreebieFields}
    \    ${type}    ${element}=    Split String    ${createFreebieField}    _    1
    \    Run Keyword If    '${type}' == 'txt'    Fill In Textbox    &{create_freebie}[${createFreebieField}]    &{${testData}}[${createFreebieField}]
    \    Run Keyword If    '${type}' == 'content'    Fill In Content Console    &{create_freebie}[${createFreebieField}]    &{${testData}}[${createFreebieField}]
    \    Run Keyword If    '${type}' == 'calendar' and '&{${testData}}[calendar_promotion_start]' != '${EMPTY}'    Select Promotion Period    &{${testData}}[calendar_promotion_start]    &{${testData}}[calendar_promotion_stop]
    \    Run Keyword If    '${type}' == 'chk'    Tick Checkbox    &{create_freebie}[${createFreebieField}]    &{${testData}}[${createFreebieField}]
    \    Run Keyword If    '${type}' == 'ddl'    Select Dropdown List Option    &{create_freebie}[${createFreebieField}]    &{${testData}}[${createFreebieField}]
    \    Run Keyword If    '${type}' == 'upload'    Select Image To Upload    &{create_freebie}[${createFreebieField}]    &{${testData}}[${createFreebieField}]
    ##USER ACTION
    Run Keyword If    '${action}' == 'Update'    Click Update Promotion Form
    Run Keyword If    '${action}' == 'Cancel'    Click Cancel Promotion Form

Validate Freebie's Promotion Information Form
    [Arguments]    ${error_case}    ${testData}
    Go To Edit Freebie Page For Specific Promotion ID    ${promo_id}
    ##FILL IN FORM
    :For    ${createFreebieField}    IN    @{createFreebieFields}
    \    ${type}    ${element}=    Split String    ${createFreebieField}    _    1
    \    Run Keyword If    '${type}' == 'txt'    Fill In Textbox    &{create_freebie}[${createFreebieField}]    &{${testData}}[${createFreebieField}]
    \    Run Keyword If    '${element}' == 'criteria_value' and '&{${testData}}[txt_criteria_value]' == '${EMPTY}'    Remove Entered Variant Value
    \    Run Keyword If    '${type}' == 'content'    Fill In Content Console    &{create_freebie}[${createFreebieField}]    &{${testData}}[${createFreebieField}]
    \    Run Keyword If    '${type}' == 'calendar' and '&{${testData}}[calendar_promotion_start]' != '${EMPTY}'    Select Promotion Period    &{${testData}}[calendar_promotion_start]    &{${testData}}[calendar_promotion_stop]
    \    Run Keyword If    '${type}' == 'chk'    Tick Checkbox    &{create_freebie}[${createFreebieField}]    &{${testData}}[${createFreebieField}]
    \    Run Keyword If    '${type}' == 'ddl'    Select Dropdown List Option    &{create_freebie}[${createFreebieField}]    &{${testData}}[${createFreebieField}]
    \    Run Keyword If    '${type}' == 'upload'    Select Image To Upload    &{create_freebie}[${createFreebieField}]    &{${testData}}[${createFreebieField}]
    ##UPDATE FORM
    Click Update Promotion Form
    ##VALIDATE ERROR MESSAGE
    Run Keyword If    '${error_case}' == 'Mandatory Text'    Missing Mandatory - Text Field Message Should Be Appeared
    Run Keyword If    '${error_case}' == 'Mandatory Dropdown'    Missing Mandatory - Dropdown Field Message Should Be Appeared
    Run Keyword If    '${error_case}' == 'Maximum Name'    Exceed Maximum Promotion Name Message Should Be Appeared
    Run Keyword If    '${error_case}' == 'Maximum Description'    Exceed Maximum Promotion Description Message Should Be Appeared
    Capture Page Screenshot
    ##CANCEL FORM
    Click Cancel Promotion Form
