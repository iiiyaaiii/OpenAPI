*** Settings ***
Library    ${CURDIR}/../../python_library/excel_library.py
Resource    ${CURDIR}/../../resources/init.robot
Resource    ${CURDIR}/../../keywords/feature/login.robot
Resource    ${CURDIR}/../../keywords/feature/campaign_create.robot
Resource    ${CURDIR}/../../keywords/feature/campaign_list.robot
Resource    ${CURDIR}/../../keywords/feature/promotion_freebie_create.robot
Resource    ${CURDIR}/../../keywords/feature/promotion_freebie_edit.robot
Resource    ${CURDIR}/../../keywords/feature/promotion_list.robot
Suite Setup    Run Keywords    Access To CAMP With iTruemart Merchant    AND    Setup Test Campaign    AND    Setup Promotion Data
Test Setup    Go To Edit Freebie Page For Specific Promotion ID    ${promo_id}
Test Teardown    Capture Page Screenshot
Suite Teardown    Run Keywords    Delete Test Campaign    AND    Close All Browsers

*** Variables ***
${testDataFilePath}    ${CURDIR}/../../resources/testdata/promotion_freebie.xlsx
${campaignTab}    create_campaign
${freebieTab}    edit_freebie

*** Test Cases ***
TC_MC_09600
    [Documentation]    Verify the looks and feels of the Edit Freebie Promotion page
    [Tags]    CAMP   Promotion    Freebie    Medium
    All Freebie Promotion's Information Fields Should Be Appeared

TC_MC_09606
    [Documentation]    Edit the campaign successfully
    [Tags]    CAMP    Promotion    Freebie    Regression    High
    Fill In Freebie's Promotion Information Form    editFreebie2    Update
    Promotion Should Be Appeared    &{editFreebie2}[txt_promotion_name]
    Promotion Should Be Built With Specific Status    Update Pending
    Build Updated Promotion
    Promotion Should Be Successfully Built With Active Status

TC_MC_09607
    [Documentation]    Cancel the edited campaign
    [Tags]    CAMP    Promotion    Freebie    Low
    Fill In Freebie's Promotion Information Form    editFreebie3    Cancel
    Promotion Should Not Be Appeared    &{editFreebie3}[txt_promotion_name]

TC_MC_09601
    [Documentation]    [Validation] Edit Freebie - Missing Mandatory field - Text
    [Tags]    CAMP    Promotion    Freebie    Regression    Medium
    [Template]    Validate Freebie's Promotion Information Form
    Mandatory Text    editFreebie4
    Mandatory Text    editFreebie5
    Mandatory Text    editFreebie6
    Mandatory Text    editFreebie7
    Mandatory Text    editFreebie8
    Mandatory Text    editFreebie9
    Mandatory Text    editFreebie10
    Mandatory Text    editFreebie11

TC_MC_09602
    [Documentation]    [Validation] Edit Freebie - Missing Mandatory field - Dropdown
    [Tags]    CAMP    Promotion    Freebie    Regression    Medium
    [Template]    Validate Freebie's Promotion Information Form
    Mandatory Dropdown    editFreebie12

TC_MC_09603
    [Documentation]    [Validation] Edit Freebie - Exceed maximum characters
    [Tags]    CAMP    Promotion    Freebie    Regression    Medium
    [Template]    Validate Freebie's Promotion Information Form
    Maximum Name    editFreebie13
    Maximum Name    editFreebie14
    Maximum Description    editFreebie15
    Maximum Description    editFreebie16

*** Keywords ***
Setup Test Campaign
    excel_library.openExcelFile    ${testDataFilePath}
    excel_library.changeExcelTab    ${campaignTab}

    ${testCampaign}=    excel_library.Get Dictionary By Key    createCampaign2
    Set Suite Variable    ${testCampaign}

    ${createCampaignFields}=    excel_library.Get First Row List
    Set Suite Variable    ${createCampaignFields}

    Go To Create Campaign Page
    Fill In Create New Campaign Form    testCampaign    Create
    Campaign Should Be Appeared    &{testCampaign}[txt_campaign_name]
    Get Specific Campaign ID    &{testCampaign}[txt_campaign_name]
    Click Promotions Button

Setup Promotion Data
    excel_library.openExcelFile    ${testDataFilePath}
    excel_library.changeExcelTab    ${freebieTab}

    :For    ${index}    IN RANGE    1    17
    \   ${value}=    excel_library.Get Dictionary By Key    editFreebie${index}
    \   Set Suite Variable    ${editFreebie${index}}    ${value}

    ${createFreebieFields}=    excel_library.Get First Row List
    Set Suite Variable    ${createFreebieFields}

    Go To Create Freebie Page For Specific Campaign ID    ${camp_id}
    Fill In Create New Freebie Form    editFreebie1    Create
    Promotion Should Be Appeared    &{editFreebie1}[txt_promotion_name]
    Promotion Should Be Built With Specific Status    Create Pending
    Build Updated Promotion
    Promotion Should Be Successfully Built With Active Status
    Get Latest Promotion ID

Delete Test Campaign
    excel_library.openExcelFile    ${testDataFilePath}
    excel_library.changeExcelTab    ${campaignTab}

    ${testCampaign}=    excel_library.Get Dictionary By Key    createCampaign2
    Set Suite Variable    ${testCampaign}

    Go To Campaign List Page
    Delete Campaign By Campaign Name    &{testCampaign}[txt_campaign_name]