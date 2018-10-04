*** Settings ***
Resource    ${CURDIR}/../../resources/init.robot
Resource    ${CURDIR}/../../resources/locators/campaign/campaign_create.robot
Resource    ${CURDIR}/../component/campaign_create.robot

*** Keywords ***
Go To Create Campaign Page
    Open Create Campaign Page
    Create Campaign Page Should Be Appeared

Fill In Create New Campaign Form
    [Arguments]    ${testData}    ${action}
    ##FILL IN FORM
    :For    ${createCampaignField}    IN    @{createCampaignFields}
    \    ${type}    ${element}=    Split String    ${createCampaignField}    _    1
    \    Run Keyword If    '${type}' == 'txt'    Fill In Textbox    &{create_campaign}[${createCampaignField}]    &{${testData}}[${createCampaignField}]
    \    Run Keyword If    '${type}' == 'chk'    Tick Checkbox    &{create_campaign}[${createCampaignField}]    &{${testData}}[${createCampaignField}]
    \    Run Keyword If    '${type}' == 'calendar' and '&{${testData}}[calendar_campaign_start]' != '${EMPTY}'    Select Campaign Period    &{${testData}}[calendar_campaign_start]    &{${testData}}[calendar_campaign_stop]
    ##USER ACTION
    Run Keyword If    '${action}' == 'Create'    Click Create Campaign Button
    Run Keyword If    '${action}' == 'Cancel'    Click Cancel To Create Campaign Button

Validate Create New Campaign Form
    [Arguments]    ${error_case}    ${testData}
    Go To Create Campaign Page
    ##FILL IN FORM
    :For    ${createCampaignField}    IN    @{createCampaignFields}
    \    ${type}    ${element}=    Split String    ${createCampaignField}    _    1
    \    Run Keyword If    '${type}' == 'txt'    Fill In Textbox    &{create_campaign}[${createCampaignField}]    &{${testData}}[${createCampaignField}]
    \    Run Keyword If    '${type}' == 'chk'    Tick Checkbox    &{create_campaign}[${createCampaignField}]    &{${testData}}[${createCampaignField}]
    \    Run Keyword If    '${type}' == 'calendar' and '&{${testData}}[calendar_campaign_start]' != '${EMPTY}'    Select Campaign Period    &{${testData}}[calendar_campaign_start]    &{${testData}}[calendar_campaign_stop]
    ##SUBMIT FORM
    Click Create Campaign Button
    ##VALIDATE ERROR MESSAGE
    Run Keyword If    '${error_case}' == 'Mandatory'    Missing Mandatory Field Message Should Be Appeared
    Run Keyword If    '${error_case}' == 'Maximum Text Field'    Exceed Maximum Text Field Message Should Be Appeared
    Run Keyword If    '${error_case}' == 'Maximum Text Box'    Exceed Maximum Text Box Message Should Be Appeared
    Capture Page Screenshot
    ##CANCEL FORM
    Click Cancel To Create Campaign Button