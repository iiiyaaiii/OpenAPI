*** Settings ***
Library    ${CURDIR}/../../python_library/excel_library.py
Resource    ${CURDIR}/../../resources/init.robot
Resource    ${CURDIR}/../../keywords/feature/login.robot
Resource    ${CURDIR}/../../keywords/feature/campaign_create.robot
Resource    ${CURDIR}/../../keywords/feature/campaign_list.robot
Suite Setup    Run Keywords    Access To CAMP With iTruemart Merchant    AND    Data Setup
Test Setup    Go To Create Campaign Page
Test Teardown    Capture Page Screenshot
Suite Teardown    Close All Browsers

*** Variables ***
${testDataFilePath}    ${CURDIR}/../../resources/testdata/campaign.xlsx
${testDataTab}    create_campaign

*** Test Cases ***
TC_MC_09529
    [Documentation]    Verify the looks and feels of the Create Campaign page
    [Tags]    CAMP   Campaign    Medium
    All Create Campaign Fields Should Be Appeared

TC_MC_09530
    [Documentation]    Verify that a new campaign can be created successfully
    [Tags]    CAMP   Campaign    Regression    High
    Fill In Create New Campaign Form    createCampaign1    Create
    Campaign List Page Should Be Appeared
    Campaign Should Be Appeared    &{createCampaign1}[txt_campaign_name]
    [Teardown]    Delete Campaign By Campaign Name    &{createCampaign1}[txt_campaign_name]

TC_MC_09531
    [Documentation]    Verify that a new campaign can be cancelled properly
    [Tags]    CAMP   Campaign    Medium
    Fill In Create New Campaign Form    createCampaign2    Cancel
    Campaign List Page Should Be Appeared
    Campaign Should Not Be Appeared    &{createCampaign2}[txt_campaign_name]

TC_MC_09532
    [Documentation]    [Validation] Verify that a new campaign cannot be created if the mandatory field is missing
    [Tags]    CAMP   Campaign    Regression    Medium
    [Template]     Validate Create New Campaign Form
    Mandatory    createCampaign3
    Mandatory    createCampaign4
    Mandatory    createCampaign5

TC_MC_09533
    [Documentation]    [Validation] Verify that a new campaign cannot be created if user enteres text into text field exceed the maximum number of characters
    [Tags]    CAMP   Campaign    Regression    Medium
    [Template]    Validate Create New Campaign Form
    Maximum Text Field    createCampaign6
    Maximum Text Field    createCampaign7

TC_MC_09534
    [Documentation]    [Validation] Verify that a new campaign cannot be created if user enteres text into text field exceed the maximum number of characters
    [Tags]    CAMP   Campaign    Regression    Medium
    [Template]    Validate Create New Campaign Form
    Maximum Text Box    createCampaign8
    Maximum Text Box    createCampaign9

*** Keywords ***
Data Setup
    excel_library.openExcelFile    ${testDataFilePath}
    excel_library.changeExcelTab    ${testDataTab}

    :For    ${index}    IN RANGE    1    10
    \   ${value}=   excel_library.Get Dictionary By Key    createCampaign${index}
    \   Set Suite Variable  ${createCampaign${index}}    ${value}

    ${createCampaignFields}=    excel_library.Get First Row List
    Set Suite Variable    ${createCampaignFields}
