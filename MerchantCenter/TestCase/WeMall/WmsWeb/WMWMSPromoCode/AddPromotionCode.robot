*** Settings ***
Suite Setup     WMS Switch Project    wm
Suite Teardown    Close All Browsers
Test Setup        Set Selenium Speed    0.2s
Force Tags        WMS-Web    mock
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
TC_MC_07098
    [Documentation]    (Input code prefix less than 3 )Create promotion code type bath and select limit quota(ใช้ได้ครั้งเดียว) Unique code correct
    [Tags]    Regression    High    WMS-Web
    Go to promotion code on wms page
    Check Element Visible    ${btn_add_promotioncode}    ${expect_load_time}
    Click add promotioncode button
    Select type promotion code    single
    ${secs}    Get secs for create promotion code
    Input promotioncode name    RobotTest${secs}
    Input prefix promotioncode    AA
    Input amount unique code    10
    Select period time for promotioncode
    Select discount type for promotion code on product detail page    percent    10    1000    300
    Select promotioncode condition    product
    Click add/edit product button
    Check Element Visible    ${add_product_modal}    ${expect_load_time}
    Search product by productid    L91201373
    Click search product button
    Check Element Visible    ${product_list_table}    ${expect_load_time}
    Click checkbox select all for choose product
    Click add product button
    Click save promotioncode button
    Check Element Visible    ${alert_message}    ${expect_load_time}
    Check Text    ${alert_message}    The prefix must be 3 characters.
