*** Setting ***
Suite Setup       Go to Login and Check Seller Login    ${URL_PORTAL}    ${BROWSER}    ${orderweb_wls_slug_name}    ${user_orderweb_wls}    ${pass_orderweb_wls}
Suite Teardown    Clear All Test
Force Tags        Order-Web    mc-wls
Library           SeleniumLibrary
Library           String
Resource          ../../../../Resource/WeLoveShopping/init.robot
Resource          ../../../../Keyword/Common/Bulktracking.txt
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Checkout.txt
Resource          ../../../../Keyword/Common/Account_Detail.txt
Resource          ../../../../Keyword/Common/Account_History.txt
Resource          ../../../../Keyword/Common/ManageOrder.txt
Resource          ../../../../Keyword/Common/Store_Detail.txt
Resource          ../../../../Keyword/Common/Store_History.txt
Resource          ../../../../Keyword/Common/Account_Refund.txt
Resource          ../../../../Keyword/Common/Account_Feedback.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/Checkout.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/AccountHistory.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/AccountDetail.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/AccountRefund.txt

*** Test Cases ***
TC_MC_03779
    [Tags]    High    Order-Web
    [Documentation]    Check item status after place order on buyer order detail page
    [Setup]    Create order offline channel    ${orderweb_wls_slug_name}    ${orderweb_wls_normal_product}    ${select_address}    ${shipping_post}    ${atm_channel_radio_button}    ${lbl_payment_offline_ref2_number}
    Go to account order detail page    ${order_id}
    Check status order on account detail page    รอการชำระเงินของคุณ
    Check countdown payment time text on account detail page    ${element_countdown_time_order_detail}
    Check item status in product order detail table    ${lbl_item_status_order_detail}    รอการชำระเงินของคุณ

TC_MC_03780
    [Tags]    Regression    Medium    Order-Web
    [Documentation]    Check item status after expired payment on buyer order detail page
    [Setup]    Create order offline channel    ${orderweb_wls_slug_name}    ${orderweb_wls_normal_product}    ${select_address}    ${shipping_post}    ${atm_channel_radio_button}    ${lbl_payment_offline_ref2_number}
    Login admin manage order web
    API Order Manage Datetime    payment_expired_time    เพิ่ม-ลด    -4    day
    Run cron order expire on admin manage order web    ${order_id_sub}
    Go to account order detail page    ${order_id}
    Check status order on account detail page    หมดเวลาการชำระเงิน
    Check item status in product order detail table    ${lbl_item_status_order_detail}    หมดเวลาการชำระเงิน

TC_MC_03781
    [Tags]    Medium    Order-Web
    [Documentation]    Check item status in case payment failed on buyer order detail page
    [Setup]    Create order ewallet channel    ${orderweb_wls_slug_name}    ${orderweb_wls_normal_product}    ${select_address}    ${shipping_post}    ${ew_channel_radio_button}
    Go to account order detail page    ${order_id}
    Check status order on account detail page    ชำระเงินไม่สำเร็จ
    Check item status in product order detail table    ${lbl_item_status_order_detail}    ชำระเงินไม่สำเร็จ

TC_MC_03782
    [Tags]    High    Order-Web    SmokeTest
    [Documentation]    Check item status after payment on buyer order detail page
    [Setup]    Create order credit card channel    ${orderweb_wls_slug_name}    ${orderweb_wls_normal_product}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go to account order detail page    ${order_id}
    Check status order on account detail page    รอการแจ้งจัดส่งสินค้า
    Check countdown ship time text on account detail page    ${element_countdown_time_order_detail}
    Check Text    ${account_detail_refund_link}    ขอเงินคืน
    Check item status in product order detail table    ${lbl_item_status_order_detail}    รอการแจ้งจัดส่งสินค้า

TC_MC_03783
    [Tags]    High    Order-Web
    [Documentation]    Check item status after seller ship full
    [Setup]    Create order credit card channel    ${orderweb_wls_slug_name}    ${orderweb_wls_normal_product}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go to store order history    ${orderweb_wls_slug_name}
    Search order id on store order history    ${order_id}
    Seller ship the order with tracking number    ${ems_tracking}
    Go to account order detail page    ${order_id}
    Check status order on account detail page    รอยืนยันการรับสินค้าของคุณ
    Check countdown time text on account history page    ${element_countdown_time_order_detail}
    Check Text    ${receive_button_order_detail}    ยืนยันรับสินค้า
    Check Text    ${account_detail_refund_link}    ขอเงินคืน
    Check item status in product order detail table    ${lbl_item_status_order_detail}    รอยืนยันการรับสินค้าของคุณ
    Check Text    ${element_des_number_box_product_table}    ${ems_tracking}
    Check Text    ${element_link_check_ship}    ตรวจสอบสถานะการจัดส่ง

TC_MC_03784
    [Tags]    High    Order-Web    SmokeTest
    [Documentation]    Check item status after receive full on buyer order detail page
    [Setup]    Create order credit card channel    ${orderweb_wls_slug_name}    ${orderweb_wls_normal_product}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go to store order history    ${orderweb_wls_slug_name}
    Search order id on store order history    ${order_id}
    Seller ship the order with tracking number    ${ems_tracking}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    ${message}    Buyer receive the order
    Run Keyword If    '${message}' == 'รายการไม่สำเร็จ กรุณาลองใหม่อีกครั้ง'    Fail    รายการไม่สำเร็จ กรุณาลองใหม่อีกครั้ง
    Close feedback pop up
    Go to account order detail page    ${order_id}
    Check status order on account detail page    คุณได้รับสินค้าเรียบร้อยแล้ว
    Check item status in product order detail table    ${lbl_item_status_order_detail}    คุณได้รับสินค้าเรียบร้อยแล้ว
    Check Text    ${element_des_number_box_product_table}    ${ems_tracking}
    Check Text    ${element_link_check_ship}    ตรวจสอบสถานะการจัดส่ง