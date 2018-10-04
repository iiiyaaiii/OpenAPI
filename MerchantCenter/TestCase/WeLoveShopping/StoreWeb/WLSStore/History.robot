*** Setting ***
Suite Setup       Go to Login and Check Seller Login    ${URL_PORTAL}    ${BROWSER}    ${reconteststore_slug}    ${user_reconteststore}    ${password_reconteststore}
Suite Teardown    Close All Browsers
Force Tags        Store-Web    mc-wls
Library           SeleniumLibrary
Library           OperatingSystem
Library           String
Resource          ../../../../Resource/WeloveShopping/init.robot
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Checkout.txt
Resource          ../../../../Keyword/Common/Store_History.txt
Resource          ../../../../Keyword/Common/Store_Detail.txt
Resource          ../../../../Keyword/Common/Account_History.txt
Resource          ../../../../Keyword/Common/ManageOrder.txt
Resource          ../../../../Keyword/Common/Account_Refund.txt
Resource          ../../../../Resource/WeloveShopping/WebElement/StoreHistory.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/Checkout.txt

*** Test Cases ***
TC_MC_03526
    [Documentation]    WLSStoreHistory View Store History (Order=0)
    [Tags]    Medium    Store-Web
    Check and Reset Seller Login    ${reconnodata_slug}    ${user_reconnodata}    ${password_reconnodata}
    Go To Store Order History Page    ${reconorder_slug}
    Check Text    ${txt_nodata}    ไม่พบรายการสั่งซื้อ

TC_MC_03527
    [Tags]    Low    Store-Web
    [Documentation]    WLSStoreHistory View Store History (Page View)
    Go To Store Order History Page    ${reconteststore_slug}
    Check Text    ${store_topic_report_order}    รายงานการสั่งซื้อ
    Check Text    ${store_topic_order_total}    รายการทั้งหมด
    Check Text    ${store_topic_wait_payment}    รอการชำระเงิน
    Check Text    ${store_topic_wait_shipping}    รอการแจ้งจัดส่งสินค้า
    Check Text    ${store_topic_wait_receive}    รอยืนยันรับสินค้า
    Check Text    ${store_topic_received}    รับสินค้าแล้ว
    Check Text    ${store_topic_refund}    ขอเงินคืน
    Check Text    ${store_topic_payment_fail}    ชำระเงินไม่สำเร็จ

TC_MC_03536
    [Tags]    Regression    High    Store-Web
    [Documentation]    WLSStoreHistory View Store History (Place Order 1 Product)
    [Setup]    Create order offline channel    ${reconteststore_slug}    ${normal_product1_reconstore}    ${select_address}    ${shipping_post}    ${cs_channel_radio_button}    ${lbl_payment_cs_ref2_number}
    Go To Store Order History Page    ${reconteststore_slug}
    Search order id on store order history    ${order_id}
    Check Text    ${order_product_name}    ${normal_product1_reconstore}
    Check Text    ${order_status}    รอการชำระเงิน
    Check Order Countdown Time
    Check More Detail No Shipping

TC_MC_03538
    [Tags]    Medium    Store-Web
    [Documentation]    WLSStoreHistory View Store History (Payment Expired 1 Product)
    [Setup]    Create order offline channel    ${reconteststore_slug}    ${normal_product1_reconstore}    ${select_address}    ${shipping_post}    ${cs_channel_radio_button}    ${lbl_payment_cs_ref2_number}
    Login admin manage order web
    API Order Manage Datetime    payment_expired_time    เพิ่ม-ลด    -4    day
    Run cron order expire on admin manage order web    ${order_id_sub}
    Go To Store Order History Page    ${reconteststore_slug}
    Search order id on store order history    ${order_id}
    Check Text    ${order_product_name}    ${normal_product1_reconstore}
    Check Text    ${order_status}    รายการนี้ถูกยกเลิก
    Check More Detail No Shipping

TC_MC_03539
    [Tags]    Regression    Medium    Store-Web
    [Documentation]    WLSStoreHistory View Store History (Payment Not found 1 Product)
    [Setup]    Create order ewallet channel    ${reconteststore_slug}    ${normal_product1_reconstore}    ${select_address}    ${shipping_post}    ${ew_channel_radio_button}
    Go To Store Order History Page    ${reconteststore_slug}
    Search order id on store order history    ${order_id}
    Check Text    ${order_product_name}    ${normal_product1_reconstore}
    Check Text    ${order_status}    ชำระเงินไม่สำเร็จ
    Check More Detail No Shipping

TC_MC_03540
    [Tags]    Regression    High    Store-Web
    [Documentation]    WLSStoreHistory View Store History (Payment Success 1 Product)
    [Setup]    Create order credit card channel    ${reconteststore_slug}    ${normal_product1_reconstore}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Store Order History Page    ${reconteststore_slug}
    Search order id on store order history    ${order_id}
    Check Text    ${order_product_name}    ${normal_product1_reconstore}
    Check Text    ${order_status}    รอการแจ้งจัดส่งสินค้า
    Check Order Countdown Time
    Check More Detail No Shipping

TC_MC_03542
    [Tags]    Regression    High    Store-Web
    [Documentation]    WLSStoreHistory View Store History (Ship)
    [Setup]    Create order credit card channel    ${reconteststore_slug}    ${normal_product1_reconstore}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Store Order History Page    ${reconteststore_slug}
    Search order id on store order history    ${order_id}
    Seller ship the order with tracking number    ${ems_tracking}
    Go To Store Order History Page    ${reconteststore_slug}
    Search order id on store order history    ${order_id}
    Check Text    ${order_product_name}    ${normal_product1_reconstore}
    Check Text    ${order_status}    รอยืนยันรับสินค้า
    Check Order Countdown Time
    Check More Detail No Shipping

TC_MC_03543
    [Tags]    High    Store-Web
    [Documentation]    WLSStoreHistory View Store History (Receive)
    [Setup]    Create order credit card channel    ${reconteststore_slug}    ${normal_product1_reconstore}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Store Order History Page    ${reconteststore_slug}
    Search order id on store order history    ${order_id}
    Seller ship the order with tracking number    ${ems_tracking}
    Login admin manage order web
    API Order Manage Escrow Datetime    1     receive_expired_time    เพิ่ม-ลด    -10    Day
    Run cron auto receive on admin manage order web    ${order_id_sub}
    Go To Store Order History Page    ${reconteststore_slug}
    Search order id on store order history    ${order_id}
    Check Text    ${order_product_name}    ${normal_product1_reconstore}
    Check Text    ${order_status}    ดำเนินการเรียบร้อย
    Check More Detail No Shipping

TC_MC_03544
    [Tags]    Regression    High    Store-Web
    [Documentation]    WLSStoreHistory View Store History (Not Ship and Request Refund)
    [Setup]    Create order credit card channel    ${reconteststore_slug}    ${normal_product1_reconstore}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select checkbox all product for refund
    Enter request refund data
    Go To Store Order History Page    ${reconteststore_slug}
    Search order id on store order history    ${order_id}
    Check Text    ${order_product_name}    ${normal_product1_reconstore}
    Check Text    ${order_status}    รอการแจ้งจัดส่งสินค้า
    Check Order Countdown Time
    Check Button Shipping History Page
    Check Text Refund Order List
    Check More Detail With Refund

TC_MC_03545
    [Tags]    Regression    High    Store-Web
    [Documentation]    WLSStoreHistory View Store History (Ship and Request Refund)
    [Setup]    Create order credit card channel    ${reconteststore_slug}    ${normal_product1_reconstore}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Store Order History Page    ${reconteststore_slug}
    Search order id on store order history    ${order_id}
    Seller ship the order with tracking number    ${ems_tracking}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select checkbox all product for refund
    Enter request refund data
    Go To Store Order History Page    ${reconteststore_slug}
    Search order id on store order history    ${order_id}
    Check Text    ${order_product_name}    ${normal_product1_reconstore}
    Check Text    ${order_status}    รอยืนยันรับสินค้า
    Check Text Refund Order List
    Check More Detail With Refund


