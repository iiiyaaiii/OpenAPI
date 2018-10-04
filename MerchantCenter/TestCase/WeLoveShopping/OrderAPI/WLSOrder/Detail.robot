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
Resource          ../../../../Keyword/Common/ManageOrder.txt
Resource          ../../../../Keyword/Common/Account_History.txt
Resource          ../../../../Keyword/Common/Account_Detail.txt
Resource          ../../../../Keyword/Common/Store_Detail.txt
Resource          ../../../../Keyword/Common/Store_History.txt
Resource          ../../../../Keyword/Common/Account_Refund.txt
Resource          ../../../../Keyword/Common/Account_Feedback.txt
Resource          ../../../../Resource/WeloveShopping/WebElement/StoreDetail.txt
Resource          ../../../../Resource/WeloveShopping/WebElement/StoreHistory.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/Checkout.txt
Resource          ../../../../Resource/WeloveShopping/init.robot

*** Test Cases ***
TC_MC_03551
    [Tags]    Regression    High    Order-API    SmokeTest
    [Documentation]    Check status placeorder order detail waiting for payment
    [Setup]    Create order offline channel    ${reconteststore_slug}    ${normal_product1_reconstore}    ${select_address}    ${shipping_post}    ${cs_channel_radio_button}    ${lbl_payment_cs_ref2_number}
    Go To Store Order Detail Page    ${reconteststore_slug}    ${order_id}
    Check Text    ${order_product_name_detail}    ${normal_product1_reconstore}
    Check Text    ${order_status_detail_product}    รอการชำระเงิน

TC_MC_03553
    [Tags]    Regression    Medium    Order-API    SmokeTest
    [Documentation]    Check status placeorder order detail cancel order
    [Setup]    Create order offline channel    ${reconteststore_slug}    ${normal_product1_reconstore}    ${select_address}    ${shipping_post}    ${cs_channel_radio_button}    ${lbl_payment_cs_ref2_number}
    Login admin manage order web
    API Order Manage Datetime    payment_expired_time    เพิ่ม-ลด    -4    day
    Run cron order expire on admin manage order web    ${order_id_sub}
    Go To Store Order Detail Page    ${reconteststore_slug}    ${order_id}
    Check Text    ${order_product_name_detail}    ${normal_product1_reconstore}
    Check Text    ${order_status_detail_product}    รายการนี้ถูกยกเลิก

TC_MC_03554
    [Tags]    Regression    Medium    Order-API    SmokeTest
    [Documentation]    Check status placeorder order detail payment fail
    [Setup]    Create order ewallet channel    ${reconteststore_slug}    ${normal_product1_reconstore}    ${select_address}    ${shipping_post}    ${ew_channel_radio_button}
    Go To Store Order Detail Page    ${reconteststore_slug}    ${order_id}
    Check Text    ${order_product_name_detail}    ${normal_product1_reconstore}
    Check Text    ${order_status_detail_product}    ชำระเงินไม่สำเร็จ

TC_MC_03556
    [Tags]    Regression    High    Order-API
    [Documentation]    Check status placeorder order detail waiting for shipping
    [Setup]    Create order two products    ${reconteststore_slug}    ${normal_product1_reconstore}    ${normal_product2_reconstore}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Store Order Detail Page    ${reconteststore_slug}    ${order_id}
    Check Text    ${order_status_detail}    รอการแจ้งจัดส่งสินค้า
    Check Order Countdown Main Status Order
    Check Button Shipping Detail Page
    Check Text    ${order_product_name_detail}    Robotreconteststore normal product 2
    Check Text    ${order_status_detail_product1}    รอการแจ้งจัดส่งสินค้า
    Check Text    ${order_product2_name_detail}    Robotreconteststore normal product
    Check Text    ${order_status_detail_product2}    รอการแจ้งจัดส่งสินค้า

TC_MC_03557
    [Tags]    Regression    High    Order-API
    [Documentation]    Check status placeorder order detail waiting for receive
    [Setup]    Create order credit card channel    ${reconteststore_slug}    ${normal_product1_reconstore}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Store Order History Page    ${reconteststore_slug}
    Search order id on store order history    ${order_id}
    Seller ship the order with tracking number    LN892440056TH
    Go To Store Order Detail Page    ${reconteststore_slug}    ${order_id}
    Check Text    ${order_status_detail}    รอยืนยันการรับสินค้า
    Check Order Countdown Main Status Order
    Check Text    ${order_product_name_detail}    ${normal_product1_reconstore}
    Check Text    ${order_status_detail_product}    รอยืนยันการรับสินค้า
    Check text tracking number on store order detail

TC_MC_03558
    [Tags]    Regression    High    Order-API
    [Documentation]    Check status order detail buyer receive
    [Setup]    Create order credit card channel    ${reconteststore_slug}    ${normal_product1_reconstore}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Store Order History Page    ${reconteststore_slug}
    Search order id on store order history    ${order_id}
    Seller ship the order with tracking number    EX123456789TH
    Login admin manage order web
    API Order Manage Escrow Datetime    1     receive_expired_time    เพิ่ม-ลด    -10    Day
    Run cron auto receive on admin manage order web    ${order_id_sub}
    Go To Store Order Detail Page    ${reconteststore_slug}    ${order_id}
    Check Text    ${order_product_name_detail}    ${normal_product1_reconstore}
    Check Text    ${order_status_detail_product}    ผู้ซื้อได้รับสินค้าเรียบร้อยแล้ว

TC_MC_03559
    [Tags]    Regression    High    Order-API
    [Documentation]    Check status order detail buyer request refund before ship
    [Setup]    Create order credit card channel    ${reconteststore_slug}    ${normal_product1_reconstore}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select checkbox all product for refund
    Enter request refund data
    Go To Store Order Detail Page    ${reconteststore_slug}    ${order_id}
    Check Text    ${order_status_detail}    รอการแจ้งจัดส่งสินค้า
    Check Text    ${btn_shipping_detail}    แจ้งจัดส่งสินค้า
    Check Text    ${order_refund_txt}    ผู้ซื้อได้ทำการขอเงินคืน\nกรุณาดำเนินการภายในระยะเวลาที่กำหนด
    Check Text    ${order_product_name_detail}    ${normal_product1_reconstore}
    Check Text    ${order_status_detail_product}    ผู้ซื้อได้ทำการขอเงินคืน
    Check Product Detail Countdown Time

TC_MC_03560
    [Tags]    Regression    High    Order-API
    [Documentation]    Check status order detail buyer request refund after ship
    [Setup]    Create order credit card channel    ${reconteststore_slug}    ${normal_product1_reconstore}    ${select_address}    ${shipping_custom}    ${ccw_channel_radio_button}
    Go To Store Order History Page    ${reconteststore_slug}
    Search order id on store order history    ${order_id}
    Shipping One Product Custom    ngggyhghgh    https://store.wls-dev.com    https://store.wls-dev.co.th    A02.jpg
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select checkbox all product for refund
    Enter request refund data
    Go To Store Order Detail Page    ${reconteststore_slug}    ${order_id}
    Check Text    ${order_status_detail}    รอยืนยันการรับสินค้า
    Check Text    ${order_refund_txt}    ผู้ซื้อได้ทำการขอเงินคืน\nกรุณาดำเนินการภายในระยะเวลาที่กำหนด
    Check Text    ${order_product_name_detail}    ${normal_product1_reconstore}
    Check Text    ${order_status_detail_product1}    ผู้ซื้อได้ทำการขอเงินคืน
    Check Product Detail Countdown Time
    ${txt_tracking}=    Execute JavaScript    return $('#product_detail_list tbody .text-center .headline').eq(0).text()
    Should Be Equal    ${txt_tracking}    หมายเลขพัสดุ หรือ ข้อความ
    ${txt_tracking}=    Execute JavaScript    return $('#product_detail_list tbody .text-center .headline').eq(1).text()
    Should Be Equal    ${txt_tracking}    ตรวจสอบสถานะการจัดส่ง
    Check Text    ${order_detail_custom_url1}    https://store.wls-dev.com
    Check Text    ${order_detail_custom_url2}    https://store.wls-dev.co.th

TC_MC_03796
    [Tags]    Regression    High    Order-API
    [Documentation]    Check status order detail buyer request refund and accept before ship
    [Setup]    Create order credit card channel    ${reconteststore_slug}    ${normal_product1_reconstore}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select checkbox all product for refund
    Enter request refund data
    Go To Store Order Detail Page    ${reconteststore_slug}    ${order_id}
    Seller accept refund    ${password_reconteststore}
    Click Element    ${go_to_detail_button}
    Check Text    ${order_product_name_detail}    ${normal_product1_reconstore}
    Check Text    ${order_status_detail_product}    คุณได้ยอมรับการขอเงินคืน

TC_MC_03797
    [Tags]    Regression    High    Order-API
    [Documentation]    Check status order detail buyer request refund and accept after ship
    [Setup]    Create order credit card channel    ${reconteststore_slug}    ${normal_product1_reconstore}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Store Order History Page    ${reconteststore_slug}
    Search order id on store order history    ${order_id}
    Seller ship the order with tracking number    EX123456789TH
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select checkbox all product for refund
    Enter request refund data
    Go To Store Order Detail Page    ${reconteststore_slug}    ${order_id}
    Seller accept refund    ${password_reconteststore}
    Click Element    ${go_to_detail_button}
    Check Text    ${order_product_name_detail}    ${normal_product1_reconstore}
    Check Text    ${order_status_detail_product}    คุณได้ยอมรับการขอเงินคืน



