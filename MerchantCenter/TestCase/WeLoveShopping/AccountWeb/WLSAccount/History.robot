*** Setting ***
Suite Setup       Go to Login and Check Seller Login    ${URL_PORTAL}    ${BROWSER}    ${reconorder_slug}    ${user_reconorder}    ${password_reconorder}
Suite Teardown    Clear All Test
Force Tags        Account-Web    mc-wls
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
TC_MC_03771
    [Tags]    Regression    Medium    Account-Web
    [Documentation]    Check status in case partial ship (Place order 2 Partail ship 1)
    [Setup]    Create order two products    ${reconorder_slug}    ${normal_product1}    ${normal_product2}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go to store order history    ${reconorder_slug}
    Search order id on store order history    ${order_id}
    Seller partial ship    ${ems_tracking}    ${normal_product1}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Check status order on account history page    รอการแจ้งจัดส่งสินค้า
    Check countdown time text on account history page    ${element_countdowntime_account_history}
    Check Text    ${refund_link_account_history}    ขอเงินคืน
    Check Text    ${text_ship_by_item_account_history}    (จัดส่งไปแล้ว 1 จาก 2 รายการ)

TC_MC_03772
    [Tags]    Regression    Medium    Account-Web
    [Documentation]    Check status in case refund full before ship (Place order 2 Refund 2)
    [Setup]    Create order credit card channel    ${reconorder_slug}    ${normal_product1}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select Refund Product By Name    ${normal_product1}
    Enter request refund data
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Check status order on account history page    รอการแจ้งจัดส่งสินค้า
    Check Text    ${text_refund_account_history}    คุณได้ทำการขอเงินคืน

TC_MC_03773
    [Tags]    Regression    Medium    Account-Web
    [Documentation]    Check status in case refund after partail ship (Place order 2 Ship 1 Refund 1)
    [Setup]    Create order two products    ${reconorder_slug}    ${normal_product1}    ${normal_product2}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go to store order history    ${reconorder_slug}
    Search order id on store order history    ${order_id}
    Seller partial ship    ${ems_tracking}    ${normal_product2}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select Refund Product By Name    ${normal_product2}
    Enter request refund data
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Check status order on account history page    รอการแจ้งจัดส่งสินค้า
    Check Text    ${text_ship_by_item_account_history}    (จัดส่งไปแล้ว 1 จาก 2 รายการ)
    Check Text    ${text_refund_account_history}    คุณได้ทำการขอเงินคืน

TC_MC_03775
    [Tags]    Regression    High    Account-Web
    [Documentation]    Check status in case accept refund full after paid
    [Setup]    Create order credit card channel    ${reconorder_slug}    ${normal_product1}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select checkbox all product for refund
    Enter request refund data
    Go To Store Order Detail Page    ${reconorder_slug}    ${order_id}
    Seller accept refund    ${password_reconorder}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Check status order on account history page    ร้านค้ายอมรับการขอเงินคืน

TC_MC_03776
    [Tags]    Regression    High    Account-Web
    [Documentation]    Check status in case accept refund full after ship
    [Setup]    Create order credit card channel    ${reconorder_slug}    ${normal_product1}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go to store order history    ${reconorder_slug}
    Search order id on store order history    ${order_id}
    Seller ship the order with tracking number    ${ems_tracking}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select checkbox all product for refund
    Enter request refund data
    Go To Store Order Detail Page    ${reconorder_slug}    ${order_id}
    Seller accept refund    ${password_reconorder}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Check status order on account history page    ร้านค้ายอมรับการขอเงินคืน

TC_MC_03777
    [Tags]    Regression    High    Account-Web
    [Documentation]    Check status in case seller decline refund
    [Setup]    Create order credit card channel    ${reconorder_slug}    ${normal_product1}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go to store order history    ${reconorder_slug}
    Search order id on store order history    ${order_id}
    Seller ship the order with tracking number    ${ems_tracking}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select checkbox all product for refund
    Enter request refund data
    Go To Store Order Detail Page    ${reconorder_slug}    ${order_id}
    Seller decline refund
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Check status order on account history page    รอยืนยันการรับสินค้าของคุณ
    Check Text    ${refund_link_account_history}    ขอเงินคืน
    Check Text    ${text_refund_account_history}    คุณได้ทำการขอเงินคืน


