*** Settings ***
Suite Setup     WMS Switch Project    wm
Suite Teardown    Close All Browsers
Force Tags        WMS-Web    RECON2017MC19
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
TC_MC_07183
    [Documentation]    WMWMSPromocode : Add MC promocode by Category in case success (MC Code)
    [Tags]    Regression    High
    Go to promotion code on wms page
    Wait Until Element Is Visible    ${btn_add_promotioncode}    ${expect_load_time}
    Click add promotioncode button
    Select type promotion code    nolimit
    Input promotioncode name    PromocodeByCategory
    ${secs}    Get secs for create promotion code
    Input prefix promotioncode    TEST${secs}
    Input amount unique code    100
    Select period time for promotioncode
    Select discount type for promotion code on product detail page    percent    10    500    100
    Select promotioncode condition    category
    Click add/edit category button
    Expand all category
    Click check box for choose category    แฟชั่น
    Click check box for choose category    ของเก่าและของสะสม
    Click add category button
    Click save promotioncode button
    Check Element Visible    ${alert_message}    ${expect_load_time}
    Check Text    ${alert_message}    เพิ่มข้อมูลสำเร็จ
    Check result on promotioncode list page after add promotioncode success    TEST


