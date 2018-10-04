*** Setting ***
Suite Setup       Open Custom Browser    ${URL_PORTAL}    ${BROWSER}
Suite Teardown    Clear All Test
Force Tags        Order-Web    mc-wls
Library           SeleniumLibrary
Library           String
Resource          ../../../../Resource/WeLoveShopping/init.robot
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Account_History.txt
Resource          ../../../../Keyword/Common/Account_Refund.txt
Resource          ../../../../Keyword/Common/Store_History.txt
Resource          ../../../../Keyword/Common/Store_Detail.txt
Resource          ../../../../Keyword/Common/ManageOrder.txt
Resource          ../../../../Keyword/Common/Bulktracking.txt
Resource          ../../../../Keyword/Common/Checkout.txt
Resource          ../../../../Keyword/Common/Account_Feedback.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/AccountHistory.txt

*** Test Cases ***
TC_MC_03747
    [Tags]    Regression    Medium    Order-Web
    [Documentation]    View order history account page in case data not found
    Set Selenium Speed    0.2
    Check and Reset Seller Login    ${reconnodata_slug}    ${user_reconnodata}    ${password_reconnodata}
    Go To Account Order History
    Check Text    ${element_totalandpage}    รายการทั้งหมด : 0 รายการ
    Check Text    ${element_data_not_found}    ไม่พบข้อมูล
    Check title table

TC_MC_03765
    [Tags]    High    Order-Web
    [Documentation]    Check item status after place order
    Check and Reset Seller Login    ${orderweb_wls_slug_name}    ${user_orderweb_wls}    ${pass_orderweb_wls}
    Create order offline channel    ${orderweb_wls_slug_name}    ${orderweb_wls_normal_product}    ${select_address}    ${shipping_post}    ${atm_channel_radio_button}    ${lbl_payment_offline_ref2_number}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Check status order on account history page    รอการชำระเงินของคุณ
    Check countdown time text on account history page    ${element_countdowntime_account_history}

TC_MC_03766
    [Tags]    Regression    Medium    Order-Web
    [Documentation]    Check item status after expired payment
    Check and Reset Seller Login    ${orderweb_wls_slug_name}    ${user_orderweb_wls}    ${pass_orderweb_wls}
    Create order offline channel    ${orderweb_wls_slug_name}    ${orderweb_wls_normal_product}    ${select_address}    ${shipping_post}    ${atm_channel_radio_button}    ${lbl_payment_offline_ref2_number}
    Login admin manage order web
    API Order Manage Datetime    payment_expired_time    เพิ่ม-ลด    -4    day
    Run cron order expire on admin manage order web    ${order_id_sub}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Check status order on account history page    หมดเวลาการชำระเงิน

TC_MC_03767
    [Tags]    Medium    Order-Web
    [Documentation]    Check item status in case payment failed
    Create order ewallet channel    ${orderweb_wls_slug_name}    ${orderweb_wls_normal_product}    ${select_address}    ${shipping_post}    ${ew_channel_radio_button}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Check status order on account history page    ชำระเงินไม่สำเร็จ

TC_MC_03768
    [Tags]    High    Order-Web
    [Documentation]    Check item status after payment
    Create order credit card channel    ${orderweb_wls_slug_name}    ${orderweb_wls_normal_product}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Check status order on account history page    รอการแจ้งจัดส่งสินค้า
    Check countdown time text on account history page    ${element_countdowntime_account_history}
    Check Text    ${refund_link_account_history}    ขอเงินคืน

TC_MC_03769
    [Tags]    High    Order-Web
    [Documentation]    Check item status after seller ship full
    Create order credit card channel    ${orderweb_wls_slug_name}    ${orderweb_wls_normal_product}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go to store order history    ${orderweb_wls_slug_name}
    Search order id on store order history    ${order_id}
    Seller ship the order with tracking number    ${ems_tracking}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Check status order on account history page    รอยืนยันการรับสินค้าของคุณ
    Check countdown time text on account history page    ${element_countdowntime_account_history}
    Check Text    ${receive_button_account_history}    ยืนยันรับสินค้า
    Check Text    ${refund_link_account_history}    ขอเงินคืน

TC_MC_03770
    [Tags]    Regression    High    Order-Web
    [Documentation]    Check item status after receive full
    Check and Reset Seller Login    ${orderweb_wls_slug_name}    ${user_orderweb_wls}    ${pass_orderweb_wls}
    Create order credit card channel    ${orderweb_wls_slug_name}    ${orderweb_wls_normal_product}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go to store order history    ${orderweb_wls_slug_name}
    Search order id on store order history    ${order_id}
    Seller ship the order with tracking number    ${ems_tracking}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    ${message}    Buyer receive the order
    Run Keyword If    '${message}' == 'รายการไม่สำเร็จ กรุณาลองใหม่อีกครั้ง'    Fail    รายการไม่สำเร็จ กรุณาลองใหม่อีกครั้ง
    Close feedback pop up
    Search order id on account order history    ${order_id}
    Check status order on account history page    คุณได้รับสินค้าเรียบร้อยแล้ว
    Check Text    ${give_feedback_button}    ให้คะแนนความพึงพอใจ
    Check Text    ${element_countdowntime_account_history}    เหลือเวลาอีก 30 วัน