*** Settings ***
Suite Setup     WMS Switch Project    wls
Suite Teardown    Close All Browsers
Test Setup        Set Selenium Speed    0.2s
Force Tags        mock    mc-wls
Library           SeleniumLibrary    15    5    run_on_failure=Capture Page Screenshot
Library           String
Library           DateTime
Resource          ../../../../Resource/WeLoveShopping/init.robot
Resource          ../../../../Resource/WeLoveShopping/WebElement/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Account_History.txt
Resource          ../../../../Keyword/Common/WMS_Promocode.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/WLSWMSPromoCode.txt
Test Timeout      3 minutes

*** Test Case ***
TC_MC_07222
    [Documentation]    WLSWMSPromoCode - AddPromotionCode : (Input code prefix less than 3 )Create promotion code type bath and select limit quota(ใช้ได้ครั้งเดียว) Unique code correct
    [Tags]    High    WMS-Web
    Go to promotion code on wms page
    Add new promotion code type    single
    Identify prefix promotioncode and amount unique code    AA    10
    Select discount type for promotion code on product detail page    percent    10    1000    300
    Select promotioncode condition    product
    Add product to promotioncode    ${add_product_modal}    L91199816    ${product_list_table}
    Check Element Visible    ${alert_message}    ${expect_load_time}
    Check Text    ${alert_message}    The prefix must be 3 characters.