*** Settings ***
Suite Setup     WMS Switch Project    wm
Suite Teardown    Close All Browsers
Test Setup        Set Selenium Speed    0.2s
Library           SeleniumLibrary    15    5    run_on_failure=Capture Page Screenshot
Library           String
Library           DateTime
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Resource/WeMall/WebElement/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Account_History.txt
Resource          ../../../../Keyword/Common/WMS_Promocode.txt
Resource          ../../../../Resource/WeMall/WebElement/WMWMSPromoCode.txt
Test Timeout      3 minutes

*** Test Case ***
TC_MC_07182
    [Documentation]    WMWMSMCPromocode : Add promocode by product in case success (by product and bank issue)
    [Tags]    WMS-Web    Regression    RECON2017MC19    High
    Go to promotion code on wms page
    Check Element Visible    ${btn_add_promotioncode}    ${expect_load_time}
    Click add promotioncode button
    Select create promotion code for product    ${value_mc_code}
    Input promotioncode name    RobotTest
    ${secs}    Get secs for create promotion code
    Input promotioncode    T${secs}
    Select period time for promotioncode
    Select discount type for promotion code on product detail page    percent    10    500    100
    Select promotioncode condition    product
    Click add/edit product button
    Check Element Visible    ${add_product_modal}    ${expect_load_time}
    Search product by productid    L91200374
    Click search product button
    Check Element Visible    ${product_list_table}    ${expect_load_time}
    Click checkbox select all for choose product
    Click add product button
    Select bank issuer    bank_CITIBANK
    Click save promotioncode button
    Check Element Visible    ${alert_message}    ${expect_load_time}
    Check Text    ${alert_message}    เพิ่มข้อมูลสำเร็จ
    Check result on promotioncode list page after add promotioncode success    T${secs}
