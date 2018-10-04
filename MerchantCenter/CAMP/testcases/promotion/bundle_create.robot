*** Settings ***
Library    ${CURDIR}/../../python_library/excel_library.py
Resource    ${CURDIR}/../../resources/init.robot
Resource    ${CURDIR}/../../keywords/feature/login.robot
Resource    ${CURDIR}/../../keywords/feature/campaign_create.robot
Resource    ${CURDIR}/../../keywords/feature/campaign_list.robot
Resource    ${CURDIR}/../../keywords/feature/promotion_bundle_create.robot
Resource    ${CURDIR}/../../keywords/feature/promotion_list.robot
Suite Setup    Run Keywords    Access To CAMP With iTruemart Merchant    AND    Setup Test Campaign
Test Setup    Setup Promotion Data
Test Teardown    Capture Page Screenshot
Suite Teardown    Run Keywords    Delete Test Campaign    AND    Close All Browsers

*** Variables ***
${testDataFilePath}    ${CURDIR}/../../resources/testdata/promotion_bundle.xlsx
${campaignTab}    create_campaign
${bundleTab}    create_bundle

*** Test Cases ***
TC_MC_09890
    [Documentation]    Verify the looks and feels of the Create Bundle Promotion page
    [Tags]    CAMP   Promotion    Bundle    Medium
    All Create Bundle Promotion Fields Should Be Appeared

TC_MC_09891
    [Documentation]    Verify that a new Bundle Promotion can be created successfully - Percent
    [Tags]    CAMP    Promotion    Bundle    Regression    High
    Fill In Create New Bundle Form    createBundle1    Create
    Promotion Should Be Appeared    &{createBundle1}[txt_promotion_name]
    Promotion Should Be Built With Specific Status    Create Pending
    Build Updated Promotion
    Promotion Should Be Successfully Built With Active Status

TC_MC_09892
    [Documentation]    Verify that a new Bundle Promotion can be created successfully - THB
    [Tags]    CAMP    Promotion    Bundle    Regression    High
    Fill In Create New Bundle Form    createBundle2    Create
    Promotion Should Be Appeared    &{createBundle2}[txt_promotion_name]
    Promotion Should Be Built With Specific Status    Create Pending
    Build Updated Promotion
    Promotion Should Be Successfully Built With Active Status

TC_MC_09893
    [Documentation]    Verify that a new Bundle Promotion can be created successfully - Combination
    [Tags]    CAMP    Promotion    Bundle    Regression    High
    Fill In Create New Bundle Form    createBundle3    Create
    Promotion Should Be Appeared    &{createBundle3}[txt_promotion_name]
    Promotion Should Be Built With Specific Status    Create Pending
    Build Updated Promotion
    Promotion Should Be Successfully Built With Active Status

TC_MC_09894
    [Documentation]    Verify that a new Bundle Promotion can be cancelled properly
    [Tags]    CAMP    Promotion    Bundle    Low
    Fill In Create New Bundle Form    createBundle4    Cancel
    Promotion Should Not Be Appeared    &{createBundle4}[txt_promotion_name]

TC_MC_09895
    [Documentation]    [Validation] Create Bundle - Missing Mandatory field
    [Tags]    CAMP    Promotion    Bundle    Medium
    [Template]    Validate Create New Bundle Form
    Mandatory Text    createBundle5
    Mandatory Text    createBundle6
    Mandatory Text    createBundle7
    Mandatory Text    createBundle8
    Mandatory Text    createBundle9
    Mandatory Text    createBundle10
    Mandatory Text    createBundle11
    Mandatory Text    createBundle12

TC_MC_09896
    [Documentation]    [Validation] Create Bundle - Exceed Maximum Characters
    [Tags]    CAMP    Promotion    Bundle    Medium
    [Template]    Validate Create New Bundle Form
    Maximum Name    createBundle13
    Maximum Name    createBundle14
    Maximum Description    createBundle15
    Maximum Description    createBundle16

TC_MC_09897
    [Documentation]    [Validation] Create Bundle - Data Type - Discount Detail - Percent
    [Tags]    CAMP    Promotion    Bundle    Medium
    [Template]    Validate Create New Bundle Form
    Discount Type    createBundle17
    Discount Type    createBundle18

TC_MC_09898
    [Documentation]    [Validation] Create Bundle - Data Type - Discount Detail - Baht
    [Tags]    CAMP    Promotion    Bundle    Medium
    [Template]    Validate Create New Bundle Form
    Discount Type    createBundle19
    Discount Type    createBundle20

TC_MC_09899
    [Documentation]    [Validation] Create Bundle - Data Range - Discount Detail - Percent
    [Tags]    CAMP    Promotion    Bundle    Medium
    [Template]    Validate Create New Bundle Form
    Discount Range    createBundle21

*** Keywords ***
Setup Test Campaign
    excel_library.openExcelFile    ${testDataFilePath}
    excel_library.changeExcelTab    ${campaignTab}

    ${createCampaign1}=    excel_library.Get Dictionary By Key    createCampaign1
    Set Suite Variable    ${createCampaign1}

    ${createCampaignFields}=    excel_library.Get First Row List
    Set Suite Variable    ${createCampaignFields}

    Go To Create Campaign Page
    Fill In Create New Campaign Form    createCampaign1    Create
    Campaign Should Be Appeared    &{createCampaign1}[txt_campaign_name]
    Get Specific Campaign ID    &{createCampaign1}[txt_campaign_name]
    Click Promotions Button

Setup Promotion Data
    excel_library.openExcelFile    ${testDataFilePath}
    excel_library.changeExcelTab    ${bundleTab}

    :For    ${index}    IN RANGE    1    22
    \   ${value}=    excel_library.Get Dictionary By Key    createBundle${index}
    \   Set Suite Variable  ${createBundle${index}}    ${value}

    ${createBundleFields}=    excel_library.Get First Row List
    Set Suite Variable    ${createBundleFields}

    Go To Create Bundle Page For Specific Campaign ID    ${camp_id}

Delete Test Campaign
    excel_library.openExcelFile    ${testDataFilePath}
    excel_library.changeExcelTab    ${campaignTab}

    ${createCampaign1}=    excel_library.Get Dictionary By Key    createCampaign1
    Set Suite Variable    ${createCampaign1}

    Go To Campaign List Page
    Delete Campaign By Campaign Name    &{createCampaign1}[txt_campaign_name]