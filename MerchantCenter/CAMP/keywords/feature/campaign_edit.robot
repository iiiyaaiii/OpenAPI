*** Settings ***
Resource    ${CURDIR}/../../resources/init.robot
Resource    ${CURDIR}/../component/campaign_list.robot
Resource    ${CURDIR}/../component/campaign_edit.robot

*** Keywords ***
Go To Edit Campaign's Information Page
    [Arguments]    ${camp_name}
    Open Campaign List Page
    Open Edit Campaign Page    ${camp_name}
    Campaign's Information Page Should Be Appeared

Fill In Campaign's Information Form
    [Arguments]    ${testData}    ${action}
    ##FILL IN FORM
    :For    ${createCampaignField}    IN    @{createCampaignFields}
    \    ${type}    ${element}=    Split String    ${createCampaignField}    _    1
    \    Run Keyword If    '${type}' == 'txt'    Fill In Textbox    &{edit_campaign}[${createCampaignField}]    &{${testData}}[${createCampaignField}]
    \    Run Keyword If    '${type}' == 'chk'    Tick Checkbox    &{edit_campaign}[${createCampaignField}]    &{${testData}}[${createCampaignField}]
    \    Run Keyword If    '${type}' == 'calendar' and '&{${testData}}[calendar_campaign_start]' != '${EMPTY}'    Edit Campaign Period    &{${testData}}[calendar_campaign_start]    &{${testData}}[calendar_campaign_stop]
    ##USER ACTION
    Run Keyword If    '${action}' == 'Update'    Click Update Button
    Run Keyword If    '${action}' == 'Cancel'    Click Cancel To Update Button

Validate Campaign's Information Form
    [Arguments]    ${error_case}    ${testData}
    Go To Edit Campaign's Information Page    ${camp_id}
    ##FILL IN FORM
    :For    ${createCampaignField}    IN    @{createCampaignFields}
    \    ${type}    ${element}=    Split String    ${createCampaignField}    _    1
    \    Run Keyword If    '${type}' == 'txt'    Fill In Textbox    &{edit_campaign}[${createCampaignField}]    &{${testData}}[${createCampaignField}]
    \    Run Keyword If    '${type}' == 'chk'    Tick Checkbox    &{edit_campaign}[${createCampaignField}]    &{${testData}}[${createCampaignField}]
    \    Run Keyword If    '${type}' == 'calendar'    Edit Campaign Period    &{${testData}}[calendar_campaign_start]    &{${testData}}[calendar_campaign_stop]
    ##SUBMIT FORM
    Click Update Button
    ##VALIDATE ERROR MESSAGE
    Run Keyword If    '${error_case}' == 'Mandatory'    campaign_edit.Missing Mandatory Field Message Should Be Appeared
    Run Keyword If    '${error_case}' == 'Maximum Text Field'    campaign_edit.Exceed Maximum Text Field Message Should Be Appeared
    Run Keyword If    '${error_case}' == 'Maximum Text Box'    campaign_edit.Exceed Maximum Text Box Message Should Be Appeared
    Capture Page Screenshot
    ##CANCEL FORM
    Click Cancel To Update Button