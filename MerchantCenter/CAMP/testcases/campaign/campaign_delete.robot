*** Settings ***
Library    ${CURDIR}/../../python_library/excel_library.py
Resource    ${CURDIR}/../../resources/init.robot
Resource    ${CURDIR}/../../keywords/feature/login.robot
Resource    ${CURDIR}/../../keywords/feature/campaign_create.robot
Resource    ${CURDIR}/../../keywords/feature/campaign_list.robot
Suite Setup    Run Keywords    Access To CAMP With iTruemart Merchant    AND    Data Setup
Test Setup    Go To Campaign List Page
Test Teardown    Capture Page Screenshot
Suite Teardown    Close All Browsers

*** Variables ***
${testDataFilePath}    ${CURDIR}/../../resources/testdata/campaign.xlsx
${testDataTab}    delete_campaign

*** Test Cases ***
TC_MC_09562
    [Documentation]    Delete Campaign - Cancel
    [Tags]    CAMP    Campaign    Medium
    Search Campaign By Campaign ID    ${camp_id}
    Delete Latest Campaign
    Delete Popup Should Be Appeared
    Click Cancel on Delete Popup
    Campaign Should Be Appeared    ${camp_id}

TC_MC_09563
    [Documentation]    Delete Campaign - Delete successfully
    [Tags]    CAMP    Campaign    Regression    Medium
    Search Campaign By Campaign ID    ${camp_id}
    Delete Latest Campaign
    Delete Popup Should Be Appeared
    Click Confirm on Delete Popup
    Campaign Should Not Be Appeared    ${camp_id}

*** Keywords ***
Data Setup
    excel_library.openExcelFile    ${testDataFilePath}
    excel_library.changeExcelTab    ${testDataTab}

    ${deleteCampaign1}=   excel_library.Get Dictionary By Key    deleteCampaign1
    Set Suite Variable  ${deleteCampaign1}

    ${createCampaignFields}=    excel_library.Get First Row List
    Set Suite Variable    ${createCampaignFields}

    Go To Create Campaign Page
    Fill In Create New Campaign Form    deleteCampaign1    Create
    Campaign Should Be Appeared    &{deleteCampaign1}[txt_campaign_name]
    Get Specific Campaign ID    &{deleteCampaign1}[txt_campaign_name]