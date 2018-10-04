*** Settings ***
Library    ${CURDIR}/../../python_library/excel_library.py
Resource    ${CURDIR}/../../resources/init.robot
Resource    ${CURDIR}/../../keywords/feature/login.robot
Resource    ${CURDIR}/../../keywords/feature/campaign_create.robot
Resource    ${CURDIR}/../../keywords/feature/campaign_list.robot
Resource    ${CURDIR}/../../keywords/feature/promotion_list.robot
Suite Setup    Run Keywords    Access To CAMP With iTruemart Merchant    AND    Data Setup
Test Setup    Go To Campaign List Page
Test Teardown    Capture Page Screenshot
Suite Teardown    Run Keywords    Cleanup Suite Data    AND    Close All Browsers

*** Variables ***
${testDataFilePath}    ${CURDIR}/../../resources/testdata/campaign.xlsx
${testDataTab}    campaign_list

*** Test Cases ***
TC_MC_09535
    [Documentation]    Looks and feels of the Campaign List page
    [Tags]    CAMP    Campaign    Medium
    All Campaign List Fields Should Be Appeared

TC_MC_09536
    [Documentation]    Search - Campaign ID
    [Setup]    Get Specific Campaign ID    &{campaignList1}[txt_campaign_name]
    [Tags]    CAMP    Campaign    Regression    High
    campaign_list.Enter Campaign ID    ${camp_id}
    campaign_list.Click Search Button
    campaign_list.Searched Campaign ID Should Be Found    ${camp_id}

TC_MC_09537
    [Documentation]    Search - Campaign Name
    [Tags]    CAMP    Campaign    Regression    High
    campaign_list.Enter Campaign Name    &{campaignList1}[txt_campaign_name]
    campaign_list.Click Search Button
    campaign_list.Searched Campaign Name Should Be Found    &{campaignList1}[txt_campaign_name]

TC_MC_09538
    [Documentation]    Search - Campaign Period
    [Tags]    CAMP    Campaign    Regression    High
    campaign_list.Enter Campaign Period    default    default
    campaign_list.Click Search Button
    campaign_list.Searched Campaign Name Should Be Found    &{campaignList1}[txt_campaign_name]

TC_MC_09539
    [Documentation]    Filter - 'Enable & Live on web' status
    [Tags]    CAMP    Campaign    Regression    Medium
    campaign_list.Select Campaign Filter    Enable & Live on web
    campaign_list.Campaign Should Be Appeared    &{campaignList1}[txt_campaign_name]
    [Teardown]    Click Clear Button

TC_MC_09541
    [Documentation]    Filter - 'Disabled' status
    [Setup]    Setup Disabled Campaign
    [Tags]    CAMP    Campaign    Regression    Medium
    campaign_list.Select Campaign Filter    Disabled
    campaign_list.Campaign Should Be Appeared    &{campaignList2}[txt_campaign_name]
    [Teardown]    Run Keywords    Click Clear Button    AND    Delete Campaign By Campaign Name    &{campaignList2}[txt_campaign_name]

TC_MC_09542
    [Documentation]    Filter - 'Expired' status
    [Setup]    Setup Expired Campaign
    [Tags]    CAMP    Campaign    Regression    Medium
    campaign_list.Select Campaign Filter    Expired
    campaign_list.Campaign Should Be Appeared    &{campaignList3}[txt_campaign_name]
    [Teardown]    Run Keywords    Click Clear Button    AND    Delete Campaign By Campaign Name    &{campaignList3}[txt_campaign_name]

TC_MC_09543
    [Documentation]    Enable/Disable Campaign Status toggle
    [Tags]    CAMP    Campaign    Regression    High
    campaign_list.Search Campaign By Campaign Name    &{campaignList1}[txt_campaign_name]
    campaign_list.Select Campaign Checkbox
    campaign_list.Campaign Status Should Be Enabled
    campaign_list.Update Campaign Status    Disable
    campaign_list.Campaign Status Should Be Disabled
    campaign_list.Select Campaign Checkbox
    campaign_list.Update Campaign Status    Enable
    campaign_list.Campaign Status Should Be Enabled

TC_MC_09544
    [Documentation]    View Promotion List page
    [Tags]    CAMP    Campaign    Regression    Medium
    [Setup]    Get Specific Campaign ID    &{campaignList1}[txt_campaign_name]
    campaign_list.Click Promotions Button
    promotion_list.Promotion List For Specific Campaign Page Should Be Appeared    &{campaignList1}[txt_campaign_name]

TC_MC_09545
    [Documentation]    Sorting - Campaign List - ID
    [Tags]    CAMP    Campaign    Regression    Medium
    campaign_list.Sort Campaign List    ID
    campaign_list.Campaign Records Should Be Sorted By Campaign ID    Ascending
    campaign_list.Sort Campaign List    ID
    campaign_list.Campaign Records Should Be Sorted By Campaign ID    Descending

TC_MC_09546
    [Documentation]    Sorting - Campaign List - Name
    [Tags]    CAMP    Campaign    Regression    Medium
    campaign_list.Sort Campaign List    Name
    campaign_list.Campaign Records Should Be Sorted By Campaign Name    Ascending
    campaign_list.Sort Campaign List    Name
    campaign_list.Campaign Records Should Be Sorted By Campaign Name    Descending

TC_MC_09551
    [Documentation]    Pagination - Campaign List
    [Tags]    CAMP    Campaign    Regression    Medium
    campaign_list.Select Number Of Records    40
    campaign_list.Number Of Campaign Records Should Be Appeared As Selected    40

*** Keywords ***
Data Setup
    excel_library.openExcelFile    ${testDataFilePath}
    excel_library.changeExcelTab    ${testDataTab}

    ${campaignList1}=   excel_library.Get Dictionary By Key    campaignList1
    Set Suite Variable  ${campaignList1}

    ${createCampaignFields}=    excel_library.Get First Row List
    Set Suite Variable    ${createCampaignFields}

    Go To Create Campaign Page
    Fill In Create New Campaign Form    campaignList1    Create
    Campaign Should Be Appeared    &{campaignList1}[txt_campaign_name]

Setup Disabled Campaign
    excel_library.openExcelFile    ${testDataFilePath}
    excel_library.changeExcelTab    ${testDataTab}

    ${campaignList2}=   excel_library.Get Dictionary By Key    campaignList2
    Set Suite Variable  ${campaignList2}

    Go To Create Campaign Page
    Fill In Create New Campaign Form    campaignList2    Create
    Campaign Should Be Appeared    &{campaignList2}[txt_campaign_name]

Setup Expired Campaign
    excel_library.openExcelFile    ${testDataFilePath}
    excel_library.changeExcelTab    ${testDataTab}

    ${campaignList3}=   excel_library.Get Dictionary By Key    campaignList3
    Set Suite Variable  ${campaignList3}

    Go To Create Campaign Page
    Fill In Create New Campaign Form    campaignList3    Create
    Campaign Should Be Appeared    &{campaignList3}[txt_campaign_name]

Cleanup Suite Data
    Delete Campaign By Campaign Name    &{campaignList1}[txt_campaign_name]