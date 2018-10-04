*** Settings ***
Resource    ${CURDIR}/../../resources/init.robot
Resource    ${CURDIR}/../../resources/wordmap/campaign_edit.robot
Resource    ${CURDIR}/../../resources/locators/campaign/campaign_edit.robot
Resource    ${CURDIR}/../feature/campaign_list.robot

*** Keywords ***
Open Edit Campaign Page
    [Arguments]    ${camp_id}
    Search Campaign By Campaign ID    ${camp_id}
    Click Element    ${btn_edit_campaign}

Campaign's Information Page Should Be Appeared
    Page Title Should Be Appeared    Campaign ID: ${camp_id}

All Campaign's Information Fields Should Be Appeared
    ${labelName}=    Get Dictionary Keys    ${label_edit_campaign}
    :For    ${labelName}    IN    @{labelName}
    \    ${type}    ${element}=    Split String    ${labelName}    _    1
    \    Run Keyword If    '${type}' == 'lbl'    Text Label Should Be Appeared    &{label_edit_campaign}[${labelName}]
    \    Run Keyword If    '${type}' == 'btn'    Button Label Should Be Appeared    &{label_edit_campaign}[${labelName}]

Edit Campaign Period
    [Arguments]    ${camp_start}    ${camp_end}
    Click Element    &{edit_campaign}[txt_campaign_period]
    Run Keyword If    '${camp_start}' != 'default' and '${camp_end}' != 'default'
    ...    Run Keywords
    ...    Input Text    &{edit_campaign}[calendar_campaign_start]    ${camp_start}
    ...    AND    Input Text    &{edit_campaign}[calendar_campaign_stop]    ${camp_end}
    Click Element    &{edit_campaign}[btn_campaign_period_apply]

Click Update Button
    Click Element    &{edit_campaign}[btn_campaign_update]

Click Cancel To Update Button
    Click Element    &{edit_campaign}[btn_campaign_cancel]

Missing Mandatory Field Message Should Be Appeared
    Error Message Should Be Appeared    &{err_edit_campaign}[lbl_campaign_mandatory]

Exceed Maximum Text Field Message Should Be Appeared
    Error Message Should Be Appeared    &{err_edit_campaign}[lbl_campaign_exceeds_txt]

Exceed Maximum Text Box Message Should Be Appeared
    Error Message Should Be Appeared    &{err_edit_campaign}[lbl_campaign_exceeds_txtbox]
