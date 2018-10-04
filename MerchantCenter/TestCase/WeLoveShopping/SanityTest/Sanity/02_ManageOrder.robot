*** Setting ***
Suite Setup       Run Keywords    Go to Login and Check Seller Login    ${URL_PORTAL}    ${BROWSER}    ${storename_slug_prod}    ${login_userprod}    ${login_passprod}    AND    Open and close shop    open    ${storename_slug_prod}
Suite Teardown    Run Keywords    Open and close shop    close    ${storename_slug_prod}    AND    Close All Browsers
Force Tags        Sanity    Trust
Library           SeleniumLibrary
Library           String
Resource          ../../../../Resource/WeLoveShopping/init.robot
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
Resource          ../../../../Resource/WeLoveShopping/WebElement/WMS_OrderTracking.txt

*** Test Cases ***
TC_MC_11250
    [Tags]    High
    [Documentation]    WLSAccountDetail Receive 1 Product 1 Category
    [Setup]    Create order credit card channel    ${storename_slug_prod}    ${product_sanity1}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Store Order History Page    ${storename_slug_prod}
    Search order id on store order history    ${order_id}
    Seller ship the order with tracking number    ${ems_tracking}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    ${message}    Buyer receive the order
    Run Keyword If    '${message}' == 'รายการไม่สำเร็จ กรุณาลองใหม่อีกครั้ง'    Fail    รายการไม่สำเร็จ กรุณาลองใหม่อีกครั้ง
    Go To WMS And Login    wls
    ${url_ordertracking}=    Set Variable    ${URL_TRACKING}
    Go To    ${URL_TRACKING}
    Input Text    ${txt_secure_key}    ${order_id}
    Click Element    ${search_button}
    ${ordertracking_wms}=    Get Element Attribute    xpath=//html/body/section/div[2]/div/div[2]/table/tbody/tr[2]/td[3]/a@href
    Go To    ${ordertracking_wms}
    Check Receive Detail Commission Fee    ${order_id}    754170
    Check Receive Transaction Fee    ${product_sanity1}

TC_MC_11251
    [Tags]    High
    [Documentation]    WLSAccountDetail Refund 1 Product 1 Category (Pay reason refund fee)
    [Setup]    Create order two products    ${storename_slug_prod}    ${product_sanity1}    ${product_sanity2}    ${select_address}    ${shipping_ems}    ${ccw_channel_radio_button}
    Go To Store Order History Page    ${storename_slug_prod}
    Search order id on store order history    ${order_id}
    Seller ship the order with tracking number    ${ems_tracking}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select checkbox all product for refund
    Enter request refund data
    Go To Store Order Detail Page    ${storename_slug_prod}    ${order_id}
    Seller accept refund    ${login_passprod}
    Go To WMS And Login    wls
    ${url_ordertracking}=    Set Variable    ${URL_TRACKING}
    Go To    ${URL_TRACKING}
    Input Text    ${txt_secure_key}    ${order_id}
    Click Element    ${search_button}
    ${ordertracking_wms}=    Get Element Attribute    xpath=//html/body/section/div[2]/div/div[2]/table/tbody/tr[2]/td[3]/a@href
    Go To    ${ordertracking_wms}
    Check Refund Full Detail Commission Fee    ${order_id}    754170
    Check Refund Full Transaction Fee    ${product_sanity2}    ${product_sanity1}

TC_MC_11252
    [Tags]    High
    [Documentation]    WLSOrder Place Order And Receive : Place Order Online Success With CCW
    [Setup]    Create order credit card channel    ${storename_slug_prod}    ${product_sanity1}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Store Order History Page    ${storename_slug_prod}
    Search order id on store order history    ${order_id}
    Seller ship the order with tracking number    ${ems_tracking}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    ${message}    Buyer receive the order
    Run Keyword If    '${message}' == 'รายการไม่สำเร็จ กรุณาลองใหม่อีกครั้ง'    Fail    รายการไม่สำเร็จ กรุณาลองใหม่อีกครั้ง
    Close feedback pop up
    Click Give Feedback button
    Give Comment And Feedback Excellent Rate    สินค้าดี    ${order_id_sub}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Check status order on account history page    คุณได้รับสินค้าเรียบร้อยแล้ว
    Go To Store Order History Page    ${storename_slug_prod}
    Search order id on store order history    ${order_id}
    Check Text    ${status}    ดำเนินการเรียบร้อย

TC_MC_11253
    [Tags]    High
    [Documentation]    WLSOrder Place Order And Refund : Place Order Online Success With CCW
    [Setup]        Create order credit card channel    ${storename_slug_prod}    ${product_sanity1}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go to store order history    ${storename_slug_prod}
    Search order id on store order history    ${order_id}
    Seller ship the order with tracking number    ${ems_tracking}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select checkbox all product for refund
    Enter request refund data
    Go To Store Order Detail Page    ${storename_slug_prod}    ${order_id}
    Seller accept refund    ${login_passprod}
    Go To Account Order History
    Click Give Feedback button
    Give Comment And Feedback Excellent Rate    สินค้าดี    ${order_id_sub}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Check status order on account history page     ร้านค้ายอมรับการขอเงินคืน
    Go to store order history    ${storename_slug_prod}
    Search order id on store order history    ${order_id}
    Check Text    ${status}    คุณได้ยอมรับการขอเงินคืน



