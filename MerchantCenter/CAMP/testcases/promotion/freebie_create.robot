*** Settings ***
Library    ${CURDIR}/../../python_library/excel_library.py
Resource    ${CURDIR}/../../resources/init.robot
Resource    ${CURDIR}/../../keywords/feature/login.robot
Resource    ${CURDIR}/../../keywords/feature/campaign_create.robot
Resource    ${CURDIR}/../../keywords/feature/campaign_list.robot
Resource    ${CURDIR}/../../keywords/feature/promotion_freebie_create.robot
Resource    ${CURDIR}/../../keywords/feature/promotion_list.robot
Suite Setup    Run Keywords    Access To CAMP With iTruemart Merchant    AND    Setup Test Campaign
Test Setup    Setup Promotion Data
Test Teardown    Capture Page Screenshot
Suite Teardown    Run Keywords    Delete Test Campaign    AND    Close All Browsers

*** Variables ***
${testDataFilePath}    ${CURDIR}/../../resources/testdata/promotion_freebie.xlsx
${campaignTab}    create_campaign
${freebieTab}    create_freebie

*** Test Cases ***
TC_MC_09591
    [Documentation]    Verify the looks and feels of the Create Freebie Promotion page
    [Tags]    CAMP   Promotion    Freebie    Medium
    All Create Freebie Promotion Fields Should Be Appeared

TC_MC_09592
    [Documentation]    Verify that a new Freebie Promotion can be created successfully
    [Tags]    CAMP    Promotion    Freebie    Regression    High
    Fill In Create New Freebie Form    createFreebie1    Create
    Promotion Should Be Appeared    &{createFreebie1}[txt_promotion_name]
    Promotion Should Be Built With Specific Status    Create Pending
    Build Updated Promotion
    Promotion Should Be Successfully Built With Active Status

TC_MC_09593
    [Documentation]    Verify that a new Freebie Promotion can be cancelled properly
    [Tags]    CAMP    Promotion    Freebie    Low
    Fill In Create New Freebie Form    createFreebie2    Cancel
    Promotion Should Not Be Appeared    &{createFreebie2}[txt_promotion_name]

TC_MC_09594
    [Documentation]    [Validation] Create Freebie - Missing Mandatory field - Text
    [Tags]    CAMP    Promotion    Freebie    Regression    Medium
    [Template]    Validate Create New Freebie Form
    Mandatory Text    createFreebie3
    Mandatory Text    createFreebie4
    Mandatory Text    createFreebie5
    Mandatory Text    createFreebie6
    Mandatory Text    createFreebie7
    Mandatory Text    createFreebie8
    Mandatory Text    createFreebie9
    Mandatory Text    createFreebie10
    Mandatory Text    createFreebie11

TC_MC_09595
    [Documentation]    [Validation] Create Freebie - Missing Mandatory field - Dropdown
    [Tags]    CAMP    Promotion    Freebie    Regression    Medium
    [Template]    Validate Create New Freebie Form
    Mandatory Dropdown    createFreebie12

TC_MC_09596
    [Documentation]    [Validation] Create Freebie - Missing Mandatory field - Image
    [Tags]    CAMP    Promotion    Freebie    Regression    Medium
    [Template]    Validate Create New Freebie Form
    Mandatory Image    createFreebie13
    Mandatory Image    createFreebie14
    Mandatory Image    createFreebie15
    Mandatory Image    createFreebie16

TC_MC_09597
    [Documentation]    [Validation] Create Freebie - Exceed maximum characters
    [Tags]    CAMP    Promotion    Freebie    Regression    Medium
    [Template]    Validate Create New Freebie Form
    Maximum Name    createFreebie17
    Maximum Name    createFreebie18
    Maximum Description    createFreebie19
    Maximum Description    createFreebie20

TC_MC_09598
    [Documentation]    [Validation] Create Freebie - Duplicated variant information - Confirm
    [Tags]    CAMP    Promotion    Freebie    Regression    Medium
    Fill In Create New Freebie Form    createFreebie21    Create
    Alert For Duplicated Variant Should Be Appeared
    Click Confirm On Duplicated Variant Popup
    Promotion Should Be Appeared    &{createFreebie21}[txt_promotion_name]
    Promotion Should Be Built With Specific Status    Create Pending
    Build Updated Promotion
    Promotion Should Be Successfully Built With Active Status

TC_MC_09599
    [Documentation]    [Validation] Create Freebie - Duplicated variant information - Cancel
    [Tags]    CAMP    Promotion    Freebie    Low
    Fill In Create New Freebie Form    createFreebie21    Create
    Alert For Duplicated Variant Should Be Appeared
    Click Cancel On Duplicated Variant Popup
    Alert For Duplicated Variant Should Not Be Appeared

*** Keywords ***
Setup Test Campaign
    excel_library.openExcelFile    ${testDataFilePath}
    excel_library.changeExcelTab    ${campaignTab}

    ${testCampaign1}=    excel_library.Get Dictionary By Key    createCampaign1
    Set Suite Variable    ${testCampaign1}

    ${createCampaignFields}=    excel_library.Get First Row List
    Set Suite Variable    ${createCampaignFields}

    Go To Create Campaign Page
    Fill In Create New Campaign Form    testCampaign1    Create
    Campaign Should Be Appeared    &{testCampaign1}[txt_campaign_name]
    Get Specific Campaign ID    &{testCampaign1}[txt_campaign_name]
    Click Promotions Button

Setup Promotion Data
    excel_library.openExcelFile    ${testDataFilePath}
    excel_library.changeExcelTab    ${freebieTab}

    :For    ${index}    IN RANGE    1    22
    \   ${value}=    excel_library.Get Dictionary By Key    createFreebie${index}
    \   Set Suite Variable  ${createFreebie${index}}    ${value}

    ${createFreebieFields}=    excel_library.Get First Row List
    Set Suite Variable    ${createFreebieFields}

    Go To Create Freebie Page For Specific Campaign ID    ${camp_id}

Delete Test Campaign
    excel_library.openExcelFile    ${testDataFilePath}
    excel_library.changeExcelTab    ${campaignTab}

    ${testCampaign1}=    excel_library.Get Dictionary By Key    createCampaign1
    Set Suite Variable    ${testCampaign1}

    Go To Campaign List Page
    Delete Campaign By Campaign Name    &{testCampaign1}[txt_campaign_name]