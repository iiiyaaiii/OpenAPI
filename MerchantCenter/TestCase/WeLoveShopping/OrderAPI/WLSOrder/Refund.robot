*** Setting ***
Suite Setup       Go to Login and Check Seller Login    ${URL_PORTAL}    ${BROWSER}    ${reconteststore_slug}    ${user_reconteststore}    ${password_reconteststore}
Suite Teardown    Close All Browsers
Force Tags        Order-API    mc-wls
Library           SeleniumLibrary
Library           OperatingSystem
Library           String
Resource          ../../../../Resource/WeloveShopping/init.robot
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Checkout.txt
Resource          ../../../../Keyword/Common/Store_History.txt
Resource          ../../../../Keyword/Common/Account_History.txt
Resource          ../../../../Keyword/Common/Store_Refund.txt
Resource          ../../../../Keyword/Common/Account_Refund.txt
Resource          ../../../../Keyword/Common/Store_Detail.txt
Resource          ../../../../Keyword/Common/Account_Feedback.txt
Resource          ../../../../Resource/WeloveShopping/WebElement/StoreDetail.txt
Resource          ../../../../Resource/WeloveShopping/WebElement/StoreHistory.txt
Resource          ../../../../Resource/WeloveShopping/WebElement/StoreRefund.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/Checkout.txt

*** Test Cases ***
TC_MC_03808
    [Tags]    Regression    High    Order-API
    [Documentation]    check text buyer request refund after ship
    [Setup]        Create order credit card channel    ${reconteststore_slug}    ${normal_product1_reconstore}    ${select_address}    ${shipping_custom}    ${ccw_channel_radio_button}
    Go To Store Order History Page    ${reconteststore_slug}
    Search order id on store order history    ${order_id}
    Shipping One Product Custom    ngggyhghgh    https://store.wls-dev.com    https://store.wls-dev.co.th    A02.jpg
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select checkbox all product for refund
    Enter request refund data
    Go To Store Order Detail Page    ${reconteststore_slug}    ${order_id}
    Check Text    ${order_product_name_detail}    ${normal_product1_reconstore}
    Check Text    ${order_status_detail_product1}    ผู้ซื้อได้ทำการขอเงินคืน
    Check Product Detail Countdown Time
    ${txt_tracking}=    Execute JavaScript    return $('#product_detail_list tbody .text-center .headline').eq(0).text()
    Should Be Equal    ${txt_tracking}    หมายเลขพัสดุ หรือ ข้อความ
    ${txt_tracking}=    Execute JavaScript    return $('#product_detail_list tbody .text-center .headline').eq(1).text()
    Should Be Equal    ${txt_tracking}    ตรวจสอบสถานะการจัดส่ง
    Check Text    ${order_detail_custom_url1}    https://store.wls-dev.com
    Check Text    ${order_detail_custom_url2}    https://store.wls-dev.co.th


