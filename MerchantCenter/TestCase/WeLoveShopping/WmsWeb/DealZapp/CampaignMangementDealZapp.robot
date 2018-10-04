*** Settings ***
Suite Setup       Run Keywords    WMS Switch Project    wls    AND    Set Selenium Speed    0.2s
Suite Teardown    Close All Browsers
Force Tags        WMS-Web    mock    Ligo    Sprint2017MC9    dealzapp2    mc-wls
Library           SeleniumLibrary
Library           String
Library           DateTime
Library           Collections
Resource          ../../../../Resource/WeLoveShopping/init.robot
Resource          ../../../../Resource/WeLoveShopping/WebElement/Member_SignIn.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/Campaign.txt
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Campaign.txt

*** Test Cases ***
# TC_MC_08167
#     [Documentation]    [Welove] Select product to Dealzapp next day
#     [Tags]    Regression    High    Queue    SmokeTest    mock    Ready
#     [setup]    Reset Test Data Dealzapp    next_deal    wls
#     Set Test Variable    ${ProductID}    ${robot_store2_fix_next_deal}
#     Set Test Variable    ${SpecialPrice}    1
#     ${dealzapp_id}    Check Dealzapp Next Day    wls
#     ${dealzapp_id}    Remove String    ${dealzapp_id}    row-
#     WMS Select Product to Campaign    dealzapp    ${dealzapp_id}    ${robot_store2_fix_next_deal}    0    1
#     Verify product on dealzapp    Next
#     Verify dealzapp on Level D    Next
#     WMS Switch Project    wls

# TC_MC_08169
#     [Documentation]    [Welove] Select product to DealZapp and DealZapp on time
#     [Tags]    Regression    High    Queue    SmokeTest    mock    Ready
#     Set Test Variable    ${ProductID}    ${robot_store2_fix_current_deal}
#     Set Test Variable    ${SpecialPrice}    1
#     ${dealzapp_id}    Check Current Dealzapp
#     ${dealzapp_id}    Remove String    ${dealzapp_id}    row-
#     WMS Select Product to Campaign    dealzapp    ${dealzapp_id}    ${robot_store2_fix_current_deal}    0    1
#     Verify dealzapp on Level D    Current
#     Verify product on dealzapp    Current
#     WMS Switch Project    wls
#     Remove Product from Campaign    ${dealzapp_id}    ${robot_store2_fix_current_deal}    dealzapp

TC_MC_08183
    [Documentation]    [[Welove] [Dealzapp]: Edit limit product in campaign not equal 0
    [Tags]    Regression    Medium    mock    Ready
    [setup]    Reset Test Data Dealzapp    current_deal
    Go to dealzapp list
    Filter dealzap status    On
    ${NoData_Msg}    ${campaign_id}    Check no data and get Campaign ID
    Run Keyword If    '${NoData_Msg}' == '1'    Change dealzapp date to next deal    2400
    WMS Select Product to Campaign    dealzapp    ${campaign_id}    ${robot_store2_fix_current_deal}    0    1
    Wait Until Element Is Visible    //tr[1]//input[contains(@name,'quantity_limit')]    60s
    Input Text    //tr[1]//input[contains(@name,'quantity_limit')]    3
    Save Manage shop
    Go to Manage Show    ${campaign_id}
    Wait Until Element Is Visible    //tr[1]//input[contains(@name,'quantity_limit')]    60s
    ${GetLimit}    Execute Javascript    return $('input[numbers-only="quantity_limit[product.id]"]:eq(0)').val();
    Should Be Equal    ${GetLimit}    3
    Remove Product from Campaign    ${campaign_id}    ${robot_store2_fix_current_deal}    dealzapp

TC_MC_08187
    [Documentation]    [Welove] [Dealzapp]: Edit custom price product in campaign not equal sell price
    [Tags]    Regression    Medium    mock    Ready
    [setup]    Reset Test Data Dealzapp    current_deal
    Go to dealzapp list
    Filter dealzap status    On
    ${NoData_Msg}    ${campaign_id}    Check no data and get Campaign ID
    Run Keyword If    '${NoData_Msg}' == '1'    Change dealzapp date to next deal    2400
    WMS Select Product to Campaign    dealzapp    ${campaign_id}    ${robot_store2_fix_current_deal}    0    1
    Comment    *** Change custom price ***
    Wait Until Element Is Visible    //tr[1]//input[contains(@name,'price')]    60s
    Input Text    //tr[1]//input[contains(@name,'price')]    19
    Save Manage shop
    Comment    *** Verify After change ***
    Go to Manage Show    ${campaign_id}
    Wait Until Element Is Visible    //tr[1]//input[contains(@name,'price')]    60s
    ${Custom_Price}    Execute Javascript    return $('input[numbers-only="custom_price[product.id]"]:eq(0)').val();
    Should Be Equal    ${Custom_Price}    19
    Remove Product from Campaign    ${campaign_id}    ${robot_store2_fix_current_deal}    dealzapp

TC_MC_08193
    [Documentation]    [Welove] Select collection to product DealZapp on time
    WMS Switch Project    wls
    ${current_deal_id}    Check Current Dealzapp
    Set Collection to Product    ${current_deal_id}    current_deal
    Verify Collection on dealzapp    current_deal

TC_MC_08197
    [Documentation]    [Welove] Select collection to product DealZapp next time
    WMS Switch Project    wls
    ${next_deal_id}    Check Dealzapp Next Day
    Set Collection to Product    ${next_deal_id}    next_deal
    Verify Collection on dealzapp    next_deal
