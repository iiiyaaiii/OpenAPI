*** Settings ***
Suite Setup       Open Custom Browser    ${URL_PORTAL}    ${BROWSER}
Suite Teardown    Close All Browsers
Force Tags        WM-PrepareData
Library           SeleniumLibrary    15    5    run_on_failure=Capture Page Screenshot
Library           String
Library           OperatingSystem
Resource          ../../../Resource/WeMall/init.robot
Resource          ../../../Resource/WeMall/WebElement/Member_SignIn.txt
Resource          ../../../Resource/WeMall/WebElement/Campaign.txt
Resource          ../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../Keyword/Common/Common.txt
Resource          ../../../Keyword/Common/Campaign.txt

*** Test Cases ***
Set-up-Dealzapp-Next-Day
    WMS Switch Project    wm
    ${next_deal_id}    Check Dealzapp Next Day    wm
    Run Keyword If    '${next_deal_id}' == 'None'    Create Dealzapp    next_deal    wm
    ${next_deal_id}    Check Dealzapp Next Day    wm
    Run Keyword If    '${next_deal_id}' != 'None'    [Wemall] Set Dealzapp Product    next_deal    ${next_deal_id}
    ${next_deal_id}    Check Dealzapp Next Day    wm
    Dealzapp Edit    next_deal    ${next_deal_id}    wm
    ${next_deal_id}    Check Dealzapp Next Day    wm
    Set Collection to Dealzapp    ${next_deal_id}    next_deal
    ${next_deal_id}    Check Dealzapp Next Day    wm
    Set Collection to Product    ${next_deal_id}    next_deal

Set-up-Current-Dealzapp
    WMS Switch Project    wm
    ${current_deal_id}    Check Current Dealzapp
    Run Keyword If    '${current_deal_id}' == 'None'    Create Dealzapp    current_deal    wm
    # Run Keyword If    '${current_deal_id}' == 'None'    Create Dealzapp    current_deal    wm
    ${current_deal_id}    Check Current Dealzapp
    Run Keyword If    '${current_deal_id}' != 'None'    [Wemall] Set Dealzapp Product    current_deal    ${current_deal_id}
    ${current_deal_id}    Check Current Dealzapp
    Dealzapp Edit    current_deal    ${current_deal_id}    wm
    ${current_deal_id}    Check Current Dealzapp
    Set Collection to Dealzapp    ${current_deal_id}    current_deal
    ${current_deal_id}    Check Current Dealzapp
    Set Collection to Product    ${current_deal_id}    current_deal

Reset-Product-Quantity
    Clear Active Login
    Go to Login    ${store_email1}    ${store_password1}
    Go to    ${URL_STORE}/${store_url1}/admin/product
    Check Before Reset    ${robot_store1_instock_type_new}
    # Check Before Reset    ${robot_stg_store1_instock_type_use}
    Check Before Reset    ${robot_store1_more_price}
    Check Before Reset    ${robot_store1_flashsale1}
    Check Before Reset    ${robot_store1_flashsale2}
    Check Before Reset    ${robot_store1_flashsale3}
    Check Before Reset    ${robot_store1_promotion_cart_price_by_price}
    Check Before Reset    ${robot_store1_promotion_cart_percent_by_price}
    Check Before Reset    ${robot_store1_promotion_cart_price_by_qty}
    Check Before Reset    ${robot_store1_promotion_cart_percent_by_qty}
    # Check Before Reset    ${robot_store1_promotion_flashsale}
    # Check Before Reset    ${robot_stg_store1_sellerpromotion}
    Clear Active Login
    Go to Login    ${store_email2}    ${store_password2}
    Go to    ${URL_STORE}/${store_url2}/admin/product
    Check Before Reset    ${robot_store2_instock_type_new}
    # Check Before Reset    ${robot_stg_store2_sellerpromotion}
    Clear Active Login

*** Keyword ***
Open and Maximize Browser
    Set Selenium Speed    0.3
    Open Browser    ${URL_PORTAL}    ${BROWSER}
    Maximize Browser Window

Set Product Quantity
    Execute Javascript    $('.icon-q-editpd').click()
    Input Text    //input[@name='quantity']    80
    Execute Javascript    $('.quick-save').click()
    Sleep    3

Check Before Reset
    [Arguments]    ${product_id}
    Input Text    //input[@id='search']    ${product_id}
    Press Key    //input[@id='search']    \\13
    ${current_qty}    Get Text    //table[@id='table_report']//tbody//tr//td//span//span[@class='quantity-text']
    Run Keyword If    '${current_qty}' != '80'    Set Product Quantity
