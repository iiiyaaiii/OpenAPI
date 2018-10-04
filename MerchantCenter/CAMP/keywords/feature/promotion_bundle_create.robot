*** Settings ***
Resource    ${CURDIR}/../../resources/init.robot
Resource    ${CURDIR}/../../resources/wordmap/promotion_bundle_create.robot
Resource    ${CURDIR}/../../resources/wordmap/promotion_freebie_create.robot
Resource    ${CURDIR}/../../resources/locators/promotion/promotion_bundle_create.robot
Resource    ${CURDIR}/../component/promotion_common.robot

*** Variables ***
${rdo_variant}    xpath=//input[(@name="_locator") and (@value="_value")]//following::span[1]

*** Keywords ***
All Create Bundle Promotion Fields Should Be Appeared
    ${labelName}=    Get Dictionary Keys    ${label_create_bundle}
    :For    ${labelName}    IN    @{labelName}
    \    ${type}    ${element}=    Split String    ${labelName}    _    1
    \    Run Keyword If    '${type}' == 'lbl'    Text Label Should Be Appeared    &{label_create_bundle}[${labelName}]
    \    Run Keyword If    '${type}' == 'btn'    Button Label Should Be Appeared    &{label_create_bundle}[${labelName}]

Go To Create Bundle Page For Specific Campaign ID
    [Arguments]    ${camp_id}
    Go To    ${CAMP_ITM_URL}/campaigns/${camp_id}/create-promotion/bundle

Select Discount Detail Type
    [Arguments]    ${element}    ${dc_option}
    ${select_option}=    Set Variable If
    ...    '${dc_option}' == 'Percent'    discountPercent
    ...    '${dc_option}' == 'Baht'    discountFixed
    ${locator}=    Replace String    ${rdo_variant}    _locator    ${element}
    ${locator}=    Replace String    ${locator}    _value    ${select_option}
    Click Element    ${locator}

Add More Bundled Variant
    Wait Until Element Is Visible    &{create_bundle}[btn_add]
    Click Element    &{create_bundle}[btn_add]

Fill In Create New Bundle Form
    [Arguments]    ${testData}    ${action}
    Add More Bundled Variant
    ##FILL IN FORM
    :For    ${createBundleField}    IN    @{createBundleFields}
    \    ${type}    ${element}=    Split String    ${createBundleField}    _    1
    \    Run Keyword If    '${type}' == 'txt' and '&{${testData}}[${createBundleField}]' != '${EMPTY}'   Fill In Textbox    &{create_bundle}[${createBundleField}]    &{${testData}}[${createBundleField}]
    \    Run Keyword If    '${type}' == 'content' and '&{${testData}}[${createBundleField}]' != '${EMPTY}'    Fill In Content Console    &{create_bundle}[${createBundleField}]    &{${testData}}[${createBundleField}]
    \    Run Keyword If    '${type}' == 'calendar' and '&{${testData}}[calendar_promotion_start]' != '${EMPTY}'    Select Promotion Period    &{${testData}}[calendar_promotion_start]    &{${testData}}[calendar_promotion_stop]
    \    Run Keyword If    '${type}' == 'chk' and '&{${testData}}[${createBundleField}]' != '${EMPTY}'    Tick Checkbox    &{create_bundle}[${createBundleField}]    &{${testData}}[${createBundleField}]
    \    Run Keyword If    '${type}' == 'rdo' and '&{${testData}}[${createBundleField}]' != '${EMPTY}'    Select Discount Detail Type    &{create_bundle}[${createBundleField}]    &{${testData}}[${createBundleField}]
    ##USER ACTION
    Run Keyword If    '${action}' == 'Create'    Click Submit Promotion Form
    Run Keyword If    '${action}' == 'Cancel'    Click Cancel Promotion Form

Validate Create New Bundle Form
    [Arguments]    ${error_case}    ${testData}
    Go To Create Bundle Page For Specific Campaign ID    ${camp_id}
    Add More Bundled Variant
    ##FILL IN FORM
    :For    ${createBundleField}    IN    @{createBundleFields}
    \    ${type}    ${element}=    Split String    ${createBundleField}    _    1
    \    Run Keyword If    '${type}' == 'txt' and '&{${testData}}[${createBundleField}]' != '${EMPTY}'    Fill In Textbox    &{create_bundle}[${createBundleField}]    &{${testData}}[${createBundleField}]
    \    Run Keyword If    '${type}' == 'content' and '&{${testData}}[${createBundleField}]' != '${EMPTY}'    Fill In Content Console    &{create_bundle}[${createBundleField}]    &{${testData}}[${createBundleField}]
    \    Run Keyword If    '${type}' == 'calendar' and '&{${testData}}[calendar_promotion_start]' != '${EMPTY}'    Select Promotion Period    &{${testData}}[calendar_promotion_start]    &{${testData}}[calendar_promotion_stop]
    \    Run Keyword If    '${type}' == 'chk' and '&{${testData}}[${createBundleField}]' != '${EMPTY}'    Tick Checkbox    &{create_bundle}[${createBundleField}]    &{${testData}}[${createBundleField}]
    \    Run Keyword If    '${type}' == 'rdo' and '&{${testData}}[${createBundleField}]' != '${EMPTY}'    Select Discount Detail Type    &{create_bundle}[${createBundleField}]    &{${testData}}[${createBundleField}]
    ##SUBMIT FORM
    Click Submit Promotion Form
    ##VALIDATE ERROR MESSAGE
    Run Keyword If    '${error_case}' == 'Mandatory Text'    Missing Mandatory - Text Field Message Should Be Appeared
    Run Keyword If    '${error_case}' == 'Maximum Name'    Exceed Maximum Promotion Name Message Should Be Appeared
    Run Keyword If    '${error_case}' == 'Maximum Description'    Exceed Maximum Promotion Description Message Should Be Appeared
    Run Keyword If    '${error_case}' == 'Discount Type'    Invalid Discount Detail Format Message Should Be Appeared
    Run Keyword If    '${error_case}' == 'Discount Range'    Invalid Discount Detail Range Message Should Be Appeared
    Capture Page Screenshot
    ##CANCEL FORM
    Click Cancel Promotion Form
