*** Settings ***
Resource    ${CURDIR}/../../resources/init.robot
Resource    ${CURDIR}/../../resources/locators/common/login.robot
Resource    ${CURDIR}/../../resources/wordmap/campaign_create.robot

*** Keywords ***
Open Create Campaign Page
    Click Element    ${btn_create_campaign}

Create Campaign Page Should Be Appeared
    Page Title Should Be Appeared    Create Campaign

All Create Campaign Fields Should Be Appeared
    ${labelName}=    Get Dictionary Keys    ${label_create_campaign}
    :For    ${labelName}    IN    @{labelName}
    \    ${type}    ${element}=    Split String    ${labelName}    _    1
    \    Run Keyword If    '${type}' == 'lbl'    Text Label Should Be Appeared    &{label_create_campaign}[${labelName}]
    \    Run Keyword If    '${type}' == 'btn'    Button Label Should Be Appeared    &{label_create_campaign}[${labelName}]

Select Campaign Period
    [Arguments]    ${camp_start}    ${camp_end}
    Click Element    &{create_campaign}[txt_campaign_period]
    Run Keyword If    '${camp_start}' != 'default' and '${camp_end}' != 'default'
    ...    Run Keywords
    ...    Input Text    &{create_campaign}[calendar_campaign_start]    ${camp_start}
    ...    AND    Input Text    &{create_campaign}[calendar_campaign_stop]    ${camp_end}
    Click Element    &{create_campaign}[btn_campaign_period_apply]

Click Create Campaign Button
    Click Element    &{create_campaign}[btn_campaign_create]

Click Cancel To Create Campaign Button
    Click Element    &{create_campaign}[btn_campaign_cancel]

Missing Mandatory Field Message Should Be Appeared
    Error Message Should Be Appeared    &{err_create_campaign}[lbl_campaign_mandatory]

Exceed Maximum Text Field Message Should Be Appeared
    Error Message Should Be Appeared    &{err_create_campaign}[lbl_campaign_exceeds_txt]

Exceed Maximum Text Box Message Should Be Appeared
    Error Message Should Be Appeared    &{err_create_campaign}[lbl_campaign_exceeds_txtbox]
