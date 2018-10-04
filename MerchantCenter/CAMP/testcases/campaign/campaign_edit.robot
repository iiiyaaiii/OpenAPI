*** Settings ***
Library    ${CURDIR}/../../python_library/excel_library.py
Resource    ${CURDIR}/../../resources/init.robot
Resource    ${CURDIR}/../../keywords/feature/login.robot
Resource    ${CURDIR}/../../keywords/feature/campaign_create.robot
Resource    ${CURDIR}/../../keywords/feature/campaign_list.robot
Resource    ${CURDIR}/../../keywords/feature/promotion_list.robot
Resource    ${CURDIR}/../../keywords/feature/campaign_edit.robot
Suite Setup    Run Keywords    Access To CAMP With iTruemart Merchant    AND    Data Setup
Test Setup    Go To Edit Campaign's Information Page    ${camp_id}
Test Teardown    Capture Page Screenshot
Suite Teardown    Run Keywords    Delete Campaign By Campaign ID    ${camp_id}    AND    Close All Browsers

*** Variables ***
${testDataFilePath}    ${CURDIR}/../../resources/testdata/campaign.xlsx
${testDataTab}    edit_campaign

*** Test Cases ***
TC_MC_09552
    [Documentation]    Looks and feels of the Edit Campaign page
    [Tags]    CAMP    Campaign    Medium
    All Campaign's Information Fields Should Be Appeared

TC_MC_09553
    [Documentation]    Edit the campaign successfully
    [Tags]    CAMP    Campaign    Regression    High
    Fill In Campaign's Information Form    editCampaign2    Update
    Campaign List Page Should Be Appeared
    Campaign Should Be Appeared    &{editCampaign2}[txt_campaign_name]

TC_MC_09554
    [Documentation]    Cancel the edited campaign
    [Tags]    CAMP    Campaign    Medium
    Fill In Campaign's Information Form    editCampaign3    Cancel
    Campaign List Page Should Be Appeared
    Campaign Should Not Be Appeared    &{editCampaign3}[txt_campaign_name]

TC_MC_09555
    [Documentation]    [Validation] Verify that a new campaign cannot be created if the mandatory field is missing
    [Tags]    CAMP    Campaign    Regression    Medium
    [Template]     Validate Campaign's Information Form
    Mandatory    editCampaign4
    Mandatory    editCampaign5

TC_MC_09556
    [Documentation]    [Validation] Verify that a new campaign cannot be created if user enteres text into text field exceed the maximum number of characters
    [Tags]    CAMP    Campaign    Regression    Medium
    [Template]    Validate Campaign's Information Form
    Maximum Text Field    editCampaign6
    Maximum Text Field    editCampaign7

TC_MC_09557
    [Documentation]    [Validation] Verify that a new campaign cannot be created if user enteres text into text field exceed the maximum number of characters
    [Tags]    CAMP    Campaign    Regression    Medium
    [Template]    Validate Campaign's Information Form
    Maximum Text Box    editCampaign8
    Maximum Text Box    editCampaign9

*** Keywords ***
Data Setup
    excel_library.openExcelFile    ${testDataFilePath}
    excel_library.changeExcelTab    ${testDataTab}

    :For    ${index}    IN RANGE    1    10
    \   ${value}=   excel_library.Get Dictionary By Key    editCampaign${index}
    \   Set Suite Variable  ${editCampaign${index}}    ${value}

    ${createCampaignFields}=    excel_library.Get First Row List
    Set Suite Variable    ${createCampaignFields}

    Go To Create Campaign Page
    Fill In Create New Campaign Form    editCampaign1    Create
    Campaign Should Be Appeared    &{editCampaign1}[txt_campaign_name]
    Get Specific Campaign ID    &{editCampaign1}[txt_campaign_name]
