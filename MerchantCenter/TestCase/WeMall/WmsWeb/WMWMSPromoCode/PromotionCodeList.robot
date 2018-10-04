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
TC_MC_07103
    [Documentation]    WMWMSPromocode : View PromoCode List
    [Tags]    WMS-Web    Regression    RECON2017MC19    Low
    Go to promotion code on wms page
    Check Text    ${txt_id_column}    ID
    Check Text    ${txt_promotionname_column}    Promotion Name
    Check Text    ${txt_condition_column}    Condition
    Check Text    ${txt_discount_column}    Discount
    Check Text    ${txt_period_column}    Period
    Check Text    ${txt_status_column}    Status
    Check Text    ${txt_viewdetail_column}    View Detail
    Check Element Is Visible    ${btn_add_promotioncode}
    Check Element Is Visible    ${btn_open_promotioncode}
    Check Element Is Visible    ${btn_close_promotioncode}

TC_MC_07110
    [Documentation]    WMWMSPromocode : Hide PromoCode (Select Promotion Code and click "Yes" button in po pup confirm)
    [Tags]    WMS-Web    Regression    RECON2017MC19    Medium
    Go to promotion code on wms page
    Click select box on promotioncode list page    1
    Click close promotioncode button
    Check Element Is Visible    ${confirm_usable_modal}
    Click yes button on confirm modal
    Check Element Visible    ${alert_message}    ${expect_load_time}
    Check Text    ${alert_message}    แก้ไขข้อมูลสำเร็จ
    Check Text    ${txt_status}    ปิดใช้งาน

TC_MC_07111
    [Documentation]    WMWMSPromocode : Open PromoCode (Select Promotion Code and click "Yes" button in po pup confirm)
    [Tags]    WMS-Web    Regression    RECON2017MC19    Medium
    Go to promotion code on wms page
    Click select box on promotioncode list page    1
    Click open promotioncode button
    Check Element Is Visible    ${confirm_usable_modal}
    Click yes button on confirm modal
    Check Element Visible    ${alert_message}    ${expect_load_time}
    Check Text    ${alert_message}    แก้ไขข้อมูลสำเร็จ
    Check Text    ${txt_status}    เปิดใช้งาน