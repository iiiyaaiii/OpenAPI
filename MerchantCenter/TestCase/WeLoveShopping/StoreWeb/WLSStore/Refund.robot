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
Resource          ../../../../Keyword/Common/Account_History.txt
Resource          ../../../../Keyword/Common/Store_Refund.txt
Resource          ../../../../Keyword/Common/Account_Refund.txt
Resource          ../../../../Keyword/Common/Store_Detail.txt
Resource          ../../../../Resource/WeloveShopping/WebElement/StoreDetail.txt
Resource          ../../../../Resource/WeloveShopping/WebElement/StoreHistory.txt
Resource          ../../../../Resource/WeloveShopping/WebElement/StoreRefund.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/Checkout.txt

*** Test Cases ***
TC_MC_03809
    [Tags]    Regression    High    Store-Web
    [Documentation]    check text buyer request refund before ship
    [Setup]        Create order credit card channel    ${reconteststore_slug}    ${normal_product1_reconstore}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select checkbox all product for refund
    Enter request refund data
    Go To Store Order Detail Page    ${reconteststore_slug}    ${order_id}
    Check Text    ${order_product_name_detail}    ${normal_product1_reconstore}
    Check Text    ${order_status_detail_product}    ผู้ซื้อได้ทำการขอเงินคืน
    Check Product Detail Countdown Time

TC_MC_03821
    [Tags]    Regression    High    Store-Web
    [Documentation]   verify order seller accept refund
    [Setup]        Create order credit card channel    ${reconteststore_slug}    ${normal_product1_reconstore}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Store Order History Page    ${reconteststore_slug}
    Search order id on store order history    ${order_id}
    Seller ship the order with tracking number    EX129837309TH
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select checkbox all product for refund
    Enter request refund data
    Go To Store Order Detail Page    ${reconteststore_slug}    ${order_id}
    Seller accept refund    ${password_reconteststore}
    ${txt_accept_refund_value}    Execute JavaScript    return $('h3.span11').text()
    Should Be Equal    ${txt_accept_refund_value}    คุณได้ยอมรับการขอเงินคืนเรียบร้อยแล้ว
    Check Text    ${txt_price_refund}    จำนวนเงินที่ทำการคืนเงินให้ผู้ซื้อ :
    Check Text    ${price_refund}    100.00 บาท
    Check Text    ${txt_process_time}    เวลาดำเนินการ :
    Check Accept Refund Time

TC_MC_03822
    [Tags]    Regression    High    Store-Web
    [Documentation]   verify order seller decline refund
    [Setup]        Create order credit card channel    ${reconteststore_slug}    ${normal_product1_reconstore}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Store Order History Page    ${reconteststore_slug}
    Search order id on store order history    ${order_id}
    Seller ship the order with tracking number    EX129837309TH
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select checkbox all product for refund
    Enter request refund data
    Go To Store Order Detail Page    ${reconteststore_slug}    ${order_id}
    Seller decline refund
    Check Text    ${txt_decline_refund}    - คุณได้ปฏิเสธการขอเงินคืนจากผู้ซื้อ กรุณารอผู้ซื้อตรวจสอบและดำเนินการภายในระยะเวลา
    Check Decline Refund Countdown Time
    Check Text    ${txt_decline_refund_2}    - หากผู้ซื้อไม่ได้ดำเนินการภายในระยะดังกล่าว ระบบจะถือว่าผู้ซื้อยอมรับการปฏิเสธขอเงินคืนของคุณ และรายการสั่งซื้อนี้จะกลับไปดำเนินการต่อไปตามปกติ

TC_MC_03823
    [Tags]    Regression    High    Store-Web
    [Documentation]   verify order seller decline refund and buyer cancel refund
    [Setup]        Create order credit card channel    ${reconteststore_slug}    ${normal_product1_reconstore}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Store Order History Page    ${reconteststore_slug}
    Search order id on store order history    ${order_id}
    Seller ship the order with tracking number    EX129837309TH
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select checkbox all product for refund
    Enter request refund data
    Go To Store Order Detail Page    ${reconteststore_slug}    ${order_id}
    Seller decline refund
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Buyer cancel request refund
    Go To Store Order Detail Page    ${reconteststore_slug}    ${order_id}
    Click Element    ${view_order_request_refund}
    Check Text    ${txt_buyer_cancel_refund}    ผู้ซื้อได้ยกเลิกการขอเงินคืน
    ${txt_status_order}    Execute JavaScript    return $('.span9.refund-right center p').text()
    Should Be Equal    ${txt_status_order}    ผู้ซื้อได้ทำการยกเลิกการขอเงินคืน และรายการสั่งซื้อนี้ได้กลับไปดำเนินการปกติแล้ว

TC_MC_03798
    [Tags]    Regression    High    Store-Web
    [Documentation]    WLSStoreRefund View Accept Refund Status in Store History (Not Ship and Accept Refund 1 Product)
    [Setup]    Create order credit card channel    ${reconteststore_slug}    ${normal_product1_reconstore}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select checkbox all product for refund
    Enter request refund data
    Go To Store Order Detail Page    ${reconteststore_slug}    ${order_id}
    Seller accept refund    ${password_reconteststore}
    Go To Store Order History Page    ${reconteststore_slug}
    Search order id on store order history    ${order_id}
    Check Text    ${order_product_name}    ${normal_product1_reconstore}
    Check Text    ${order_status}    คุณได้ยอมรับการขอเงินคืน
    Check More Detail No Shipping

TC_MC_03799
    [Tags]    Regression    High    Store-Web
    [Documentation]    WLSStoreRefund View Accept Refund Status in Store History (Ship and Accept Refund 1 Product)
    [Setup]    Create order credit card channel    ${reconteststore_slug}    ${normal_product1_reconstore}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Store Order History Page    ${reconteststore_slug}
    Search order id on store order history    ${order_id}
    Seller ship the order with tracking number    ${ems_tracking}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select checkbox all product for refund
    Enter request refund data
    Go To Store Order Detail Page    ${reconteststore_slug}    ${order_id}
    Seller accept refund    ${password_reconteststore}
    Go To Store Order History Page    ${reconteststore_slug}
    Search order id on store order history    ${order_id}
    Check Text    ${order_product_name}    ${normal_product1_reconstore}
    Check Text    ${order_status}    คุณได้ยอมรับการขอเงินคืน
    Check More Detail No Shipping


