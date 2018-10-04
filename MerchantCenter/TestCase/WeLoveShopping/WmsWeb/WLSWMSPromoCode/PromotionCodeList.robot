*** Settings ***
Suite Setup     WMS Switch Project    wls
Suite Teardown    Close All Browsers
Test Setup        Set Selenium Speed    0.2s
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
Force Tags        WMS-Web    mc-wls

*** Test Case ***
TC_MC_07234
    [Documentation]    WLSWMSPromocode : Hide PromoCode (Select Promotion Code and click "Yes" button in po pup confirm)
    [Tags]    WMS-Web    RECON2017MC19    Medium
    Go to promotion code on wms page
    Check columns and button on promotion list page
    Set status to the first promotion code    inactive
    Check Element Visible    ${alert_message}    ${expect_load_time}
    Check Text    ${alert_message}    แก้ไขข้อมูลสำเร็จ
    Check Text    ${txt_status}    ปิดใช้งาน

TC_MC_07235
    [Documentation]    WLSWMSPromocode : Open PromoCode (Select Promotion Code and click "Yes" button in po pup confirm)
    [Tags]    WMS-Web    RECON2017MC19    Medium
    Go to promotion code on wms page
    Check columns and button on promotion list page
    Set status to the first promotion code    active
    Check Element Visible    ${alert_message}    ${expect_load_time}
    Check Text    ${alert_message}    แก้ไขข้อมูลสำเร็จ
    Check Text    ${txt_status}    เปิดใช้งาน

