*** Settings ***
Suite Setup       Go to Login and Check Seller Login    ${URL_PORTAL}    ${BROWSER}    ${reconteststore_slug}    ${user_reconteststore}    ${password_reconteststore}
Test Setup        Go to waitshipping tab on store history page    ${reconteststore_slug}
Suite Teardown    Clear All Test
Force Tags        API-Order    feature-order
Library           SeleniumLibrary
Library           String
Library           OperatingSystem
Resource          ../../../../Resource/WeloveShopping/init.robot
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Checkout.txt
Resource          ../../../../Keyword/Common/Store_History.txt
Resource          ../../../../Keyword/Common/Store_Refund.txt
Resource          ../../../../Keyword/Common/Store_Detail.txt
Resource          ../../../../Resource/WeloveShopping/WebElement/StoreDetail.txt
Resource          ../../../../Resource/WeloveShopping/WebElement/StoreHistory.txt
Resource          ../../../../Resource/WeloveShopping/WebElement/StoreRefund.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/Checkout.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/AccountDetail.txt

*** Test Cases ***
TC_MC_04714
    [Tags]    Regression    High    Store-Web
    [Documentation]    WLSStore Address Label : View รายการสั่งซื้อที่เลือก : 14
    View waitshipping page
    Click select all checkbox on waitshipping tab store history page
    Check Text    ${txt_selected}    รายการสั่งซื้อที่เลือก : 14 ตัวเลือกการพิมพ์

TC_MC_04716
    [Tags]    Medium    Store-Web
    [Documentation]    WLSStore Address Label : View รายการสั่งซื้อที่เลือก : 3
    Select order items    3
    Check Text    ${txt_selected}    รายการสั่งซื้อที่เลือก : 3 ตัวเลือกการพิมพ์

TC_MC_04717
    [Tags]    Regression    High    Store-Web
    [Documentation]    WLSStore Address Label : Check Page 2
    Click select all checkbox on waitshipping tab store history page
    Check Text    ${txt_selected}    รายการสั่งซื้อที่เลือก : 14 ตัวเลือกการพิมพ์

TC_MC_04718
    [Tags]    Regression    High    Store-Web
    [Documentation]    WLSStore Address Label : View Pop Up ตัวเลือกการพิมพ์
    Click select all checkbox on waitshipping tab store history page
    View print option popup
    Check Text    ${txt_selected}    รายการสั่งซื้อที่เลือก : 14 ตัวเลือกการพิมพ์

TC_MC_04720
    [Tags]    Regression    Medium    Store-Web
    [Documentation]    WLSStore Address Label : View พิมพ์เฉพาะที่อยู่ผู้ซื้อ ที่อยู่จัดส่ง 1 Label
    Select order items    1
    Print the order lists    พิมพ์ที่อยู่จัดส่ง
    View on Print preview page

    ${is_contain}    Execute Javascript    return ($('.info-address h2').eq(0).text().match('กรุณาส่ง') != null)
    Should Be True    ${is_contain}
    ${is_contain}    Execute Javascript    return ($('.info-address ul li').eq(0).text().match('คุณ') != null)
    Should Be True    ${is_contain}
    ${is_contain}    Execute Javascript    return ($('.info-post-l').eq(0).text().match("วิธีการจัดส่ง") != null)
    Should Be True    ${is_contain}
    ${is_contain}    Execute Javascript    return ($('.info-post-r').eq(0).text().match('Order ID') != null)
    Should Be True    ${is_contain}
    Check the title of print preview page with item    1

TC_MC_04730
    [Tags]    Medium    Store-Web
    [Documentation]    WLSStore Address Label : Print Label : View (Default 14 Order)
    Click select all checkbox on waitshipping tab store history page
    Print the order lists    พิมพ์ที่อยู่จัดส่ง
    View on Print preview page
    Check the title of print preview page with item    14
