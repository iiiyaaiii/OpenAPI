*** Settings ***
Library    ${CURDIR}/../../python_library/excel_library.py
Resource    ${CURDIR}/../../resources/init.robot
Resource    ${CURDIR}/../../keywords/feature/login.robot
Resource    ${CURDIR}/../../keywords/feature/campaign_create.robot
Resource    ${CURDIR}/../../keywords/feature/campaign_list.robot
Resource    ${CURDIR}/../../keywords/feature/promotion_freebie_create.robot
Resource    ${CURDIR}/../../keywords/feature/promotion_list.robot
Suite Setup    Run Keywords    Access To CAMP With iTruemart Merchant    AND    Setup Test Campaign    AND    Setup Test Promotion
Test Setup    Open Promotion List Page
Test Teardown    Capture Page Screenshot
Suite Teardown    Run Keywords    Delete Test Campaign    AND    Close All Browsers

*** Variables ***
${testDataFilePath}    ${CURDIR}/../../resources/testdata/promotion_list.xlsx
${campaignTab}    create_campaign
${freebieTab}    create_freebie

*** Test Cases ***
TC_MC_09626
    [Documentation]    [PromotionList] Looks and feels of the Promotion List page
    [Tags]    CAMP    Promotion    Medium
    All Promotion List Fields Should Be Appeared

TC_MC_09643
    [Documentation]    [PromotionList] Search - Campaign ID
    [Tags]    CAMP    Promotion    Regression    Medium
    promotion_list.Enter Campaign ID    ${camp_id}
    promotion_list.Click Search Promotion Button
    campaign_list.Searched Campaign Name Should Be Found    &{listCampaign1}[txt_campaign_name]
    [Teardown]    Click Clear Promotion Button

TC_MC_09644
    [Documentation]    [PromotionList] Search - Campaign Name
    [Tags]    CAMP    Promotion    Regression    Medium
    promotion_list.Enter Campaign Name    &{listCampaign1}[txt_campaign_name]
    promotion_list.Click Search Promotion Button
    campaign_list.Searched Campaign Name Should Be Found    &{listCampaign1}[txt_campaign_name]
    [Teardown]    Click Clear Promotion Button

TC_MC_09627
    [Documentation]    [PromotionList] Search - Promotion ID
    [Tags]    CAMP    Promotion    Regression    Medium
    promotion_list.Enter Promotion ID    ${promo_id}
    promotion_list.Click Search Promotion Button
    promotion_list.Searched Promotion Should Be Appeared    &{listFreebie1}[txt_promotion_name]
    [Teardown]    Click Clear Promotion Button

TC_MC_09628
    [Documentation]    [PromotionList] Search - Promotion Name
    [Tags]    CAMP    Promotion    Regression    Medium
    promotion_list.Enter Promotion Name    &{listFreebie1}[txt_promotion_name]
    promotion_list.Click Search Promotion Button
    promotion_list.Searched Promotion Should Be Appeared    &{listFreebie1}[txt_promotion_name]
    [Teardown]    Click Clear Promotion Button

TC_MC_09629
    [Documentation]    [PromotionList] Search - Promotion Type
    [Tags]    CAMP    Promotion    Regression    Medium
    promotion_list.Select Promotion Type    Freebie
    promotion_list.Click Search Promotion Button
    promotion_list.Searched Promotion Should Be Appeared    &{listFreebie1}[txt_promotion_name]
    [Teardown]    Click Clear Promotion Button

TC_MC_09630
    [Documentation]    [PromotionList] Filter - Enable & Live on web
    [Tags]    CAMP    Promotion    Medium
    promotion_list.Select Promotion Search Filter    Enable & Live on web
    promotion_list.Click Search Promotion Button
    promotion_list.Searched Promotion Should Be Appeared    &{listFreebie1}[txt_promotion_name]
    [Teardown]    Click Clear Promotion Button

TC_MC_09632
    [Documentation]    [PromotionList] Filter - Disabled
    [Tags]    CAMP    Promotion    Medium
    [Setup]    Setup Disabled Promotion
    promotion_list.Select Promotion Search Filter    Disabled
    promotion_list.Click Search Promotion Button
    promotion_list.Searched Promotion Should Be Appeared    &{listFreebie2}[txt_promotion_name]
    [Teardown]    Click Clear Promotion Button

TC_MC_09633
    [Documentation]    [PromotionList] Filter - Expired
    [Tags]    CAMP    Promotion    Medium
    [Setup]    Setup Expired Promotion
    promotion_list.Select Promotion Search Filter    Expired
    promotion_list.Click Search Promotion Button
    promotion_list.Searched Promotion Should Be Appeared    &{listFreebie3}[txt_promotion_name]
    [Teardown]    Click Clear Promotion Button

*** Keywords ***
Setup Test Campaign
    excel_library.openExcelFile    ${testDataFilePath}
    excel_library.changeExcelTab    ${campaignTab}

    ${listCampaign1}=    excel_library.Get Dictionary By Key    listCampaign1
    Set Suite Variable    ${listCampaign1}

    ${createCampaignFields}=    excel_library.Get First Row List
    Set Suite Variable    ${createCampaignFields}

    Go To Create Campaign Page
    Fill In Create New Campaign Form    listCampaign1    Create
    Campaign Should Be Appeared    &{listCampaign1}[txt_campaign_name]
    Get Specific Campaign ID    &{listCampaign1}[txt_campaign_name]
    Click Promotions Button

Setup Test Promotion
    excel_library.openExcelFile    ${testDataFilePath}
    excel_library.changeExcelTab    ${freebieTab}

    ${listFreebie1}=    excel_library.Get Dictionary By Key    listFreebie1
    Set Suite Variable    ${listFreebie1}

    ${createFreebieFields}=    excel_library.Get First Row List
    Set Suite Variable    ${createFreebieFields}

    Go To Create Freebie Page For Specific Campaign ID    ${camp_id}
    Fill In Create New Freebie Form    listFreebie1    Create
    Promotion Should Be Appeared    &{listFreebie1}[txt_promotion_name]
    Promotion Should Be Built With Specific Status    Create Pending
    Get Latest Promotion ID
    Build Updated Promotion
    Promotion Should Be Successfully Built With Active Status

Setup Disabled Promotion
    excel_library.openExcelFile    ${testDataFilePath}
    excel_library.changeExcelTab    ${freebieTab}

    ${listFreebie2}=   excel_library.Get Dictionary By Key    listFreebie2
    Set Suite Variable  ${listFreebie2}

    ${createFreebieFields}=    excel_library.Get First Row List
    Set Suite Variable    ${createFreebieFields}

    Go To Create Freebie Page For Specific Campaign ID    ${camp_id}
    Fill In Create New Freebie Form    listFreebie2    Create
    Promotion Should Be Appeared    &{listFreebie2}[txt_promotion_name]
    Open Promotion List Page

Setup Expired Promotion
    excel_library.openExcelFile    ${testDataFilePath}
    excel_library.changeExcelTab    ${freebieTab}

    ${listFreebie3}=   excel_library.Get Dictionary By Key    listFreebie3
    Set Suite Variable  ${listFreebie3}

    ${createFreebieFields}=    excel_library.Get First Row List
    Set Suite Variable    ${createFreebieFields}

    Go To Create Freebie Page For Specific Campaign ID    ${camp_id}
    Fill In Create New Freebie Form    listFreebie3    Create
    Promotion Should Be Appeared    &{listFreebie3}[txt_promotion_name]
    Open Promotion List Page

Delete Test Campaign
    excel_library.openExcelFile    ${testDataFilePath}
    excel_library.changeExcelTab    ${campaignTab}

    ${listCampaign1}=    excel_library.Get Dictionary By Key    listCampaign1
    Set Suite Variable    ${listCampaign1}

    Go To Campaign List Page
    Delete Campaign By Campaign Name    &{listCampaign1}[txt_campaign_name]