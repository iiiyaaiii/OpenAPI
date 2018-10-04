*** Settings ***
Suite Setup       WMS Switch Project    wm
Suite Teardown    Close All Browsers
Force Tags        WMS-Web    Ligo
Test Timeout      3 minutes
Library           SeleniumLibrary    15    5    run_on_failure=Capture Page Screenshot
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Keyword/Common/WMS_installment.txt
Resource          ../../../../Keyword/Common/Common.txt

*** Variables ***
${product_no_stock}    L91556494

*** Test Cases ***
TC_MC_11886
    [Documentation]    [Wemall][Installment] Verify can search product in installment incase product stock = 0
    [Tags]    Regression    Medium
    Go To Installment
    Search Product ID    ${product_no_stock}
    Verify Product After For Search   ${product_no_stock} 
