*** Settings ***
Force Tags        Queue    mc-wls
Library           SeleniumLibrary
Library           String
Library           DateTime
Library           Collections
Resource          ../../../../Resource/WeLoveShopping/init.robot
Resource          ../../../../Resource/${BU}/WebElement/Member_SignIn.txt
Resource          ../../../../Resource/${BU}/WebElement/Campaign.txt
# Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Campaign.txt
Resource          ../../../../Keyword/Common/WMSCommonKeyword.robot
Suite Setup       Run Keywords    Open Custom Browser    ${URL_PORTAL}    ${BROWSER}    AND    Login To WMS    ${wms_user}    ${wms_pass}
Suite Teardown    Close All Browsers

*** Test Cases ***
TC_MC_08167
    [Documentation]    [Welove] Select product to Dealzapp next day
    [Tags]    Regression    High    Queue    SmokeTest    mock    Ready
    [setup]    Run Keywords    Go to WMS    AND    Switch Project On WMS    wls
    Set Test Variable    ${ProductID}    ${robot_store2_fix_next_deal}
    Set Test Variable    ${SpecialPrice}    1
    ${dealzapp_id}    Check Dealzapp Next Day    wls
    ${dealzapp_id}    Remove String    ${dealzapp_id}    row-
    WMS Select Product to Campaign    dealzapp    ${dealzapp_id}    ${robot_store2_fix_next_deal}    0    1
    Verify product on dealzapp    Next
    Verify dealzapp on Level D    Next
    [Teardown]    Run Keywords    Go to WMS    AND    Remove Product from Campaign    ${dealzapp_id}    ${robot_store2_fix_next_deal}    dealzapp
    # [Teardown]    Run Keywords    Go to WMS    AND    Reset Test Data Dealzapp    next_deal    wls
    # WMS Switch Project    wls

TC_MC_08169
    [Documentation]    [Welove] Select product to DealZapp and DealZapp on time
    [Tags]    Regression    High    Queue    SmokeTest    mock    Ready
    [Setup]    Run Keywords    Go to WMS    AND    Switch Project On WMS    wls
    Set Test Variable    ${ProductID}    ${robot_store2_fix_current_deal}
    Set Test Variable    ${SpecialPrice}    1
    ${dealzapp_id}    Check Current Dealzapp
    ${dealzapp_id}    Remove String    ${dealzapp_id}    row-
    WMS Select Product to Campaign    dealzapp    ${dealzapp_id}    ${robot_store2_fix_current_deal}    0    1
    Verify dealzapp on Level D    Current
    Verify product on dealzapp    Current
    # WMS Switch Project    wls
    [Teardown]    Run Keywords    Go to WMS    AND    Remove Product from Campaign    ${dealzapp_id}    ${robot_store2_fix_current_deal}    dealzapp
