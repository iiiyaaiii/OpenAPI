*** Settings ***
Suite Setup       WMS Switch Project    wm
Suite Teardown    Close All Browsers
Force Tags        WMS-Web
Test Timeout      3 minutes
Library           SeleniumLibrary    15    5    run_on_failure=Capture Page Screenshot
Library           String
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Resource/WeMall/WebElement/Campaign.txt
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Campaign.txt

*** Variables ***
${product_id_no_stock}    L91556494
${wls_campaign_id}    4019

*** Test Cases ***
TC_MC_11895
    [Documentation]    [Wemall][WLS Promotion] Verify can search product in WLS Promotion incase product stock = 0
    [Tags]    Regression    Meduim
    Go To Manage Product WLSPromotion    ${wls_campaign_id}
    Search Product ID    ${product_id_no_stock}
    Verify Search Product ID
