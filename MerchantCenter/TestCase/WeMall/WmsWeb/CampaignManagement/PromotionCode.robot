*** Settings ***
Suite Setup       WMS Switch Project    wm
Suite Teardown    Close All Browsers
Force Tags        WMS-Web
Test Timeout      3 minutes
Library           SeleniumLibrary    15    5    run_on_failure=Capture Page Screenshot
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Keyword/Common/WMS_Promocode.txt
Resource          ../../../../Keyword/Common/Common.txt

*** Variables ***
${product_id_no_stock}    L91556494

*** Test Cases ***
TC_MC_11889
    [Documentation]    [Wemall][Promotion MC code] Verify can search product in promotion MC code  incase product stock = 0
    [Tags]    Regression    Medium
    Go to promotion code on wms page
    Click add promotioncode button
    Select Radio Button By Product
    Search Product ID    ${product_id_no_stock}
    Verify Search Product ID    ${product_id_no_stock}