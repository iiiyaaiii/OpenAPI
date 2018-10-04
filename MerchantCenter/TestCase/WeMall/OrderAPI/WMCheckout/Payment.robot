*** Setting ***
Documentation     Place order and check order status for wemall site
Suite Setup       Run Keywords    Open Custom Browser    ${URL_PORTAL}    ${BROWSER}    AND    Check and Reset Seller Login    ${storename_slug_wemall}    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
Suite Teardown    Close All Browsers
Force Tags        Order-API    mc-wm
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Checkout.txt
Resource          ../../../../Keyword/Common/Account_History.txt
Resource          ../../../../Keyword/Common/Store_Detail.txt
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/LevelD/LevelDKeyword.robot
Resource          ../../../../Keyword/WeMallWeb/CartPageKeyword.robot
Resource          ../../../../Keyword/WeMallWeb/ThankyouPageKeyword.robot
Resource          ../../../../Keyword/Checkout/CheckoutKeyword.robot
Resource          ../../../../Resource/WeMall/Locators/WeMallWeb/CheckoutPageLocator.robot

*** Test Cases ***
TC_MC_10512
    [Documentation]    WMCheck status when place order with cs channel
    [Tags]    Regression    Medium    SmokeTest
    ${product_id}    Create List    ${product_1}
    Delete All Product In Cart
    Select Product By Product_Id    ${product_id}
    Click To Checkout Wemall Item On Cart Page
    Select Shipping Address By Email On Checkout Step 2    ${email_buyer_shipping}
    Select Payment Channel    ${rdo_cs_channel}
    Click Confirm For Place Order
    Click To Display Summary Order Section On Thankyou Page
    Get order id online from thankyou page
    Get substring order id online from thankyou page    ${order_id}
    Go To Store Order Detail Page    ${storename_slug_wemall}    ${order_id}
    Check Text    ${order_product_name_detail}    trustmall 004
    Check Text    ${order_status_detail_product}    รอการชำระเงิน

TC_MC_10513
    [Documentation]     WMCheck status when place order with ew channel
    [Tags]    Regression    Medium    SmokeTest
    ${product_id}    Create List    ${product_1}
    Delete All Product In Cart
    Select Product By Product_Id    ${product_id}
    Click To Checkout Wemall Item On Cart Page
    Select Shipping Address By Email On Checkout Step 2    ${email_buyer_shipping}
    Select Payment Channel    ${rdo_ew_channel}
    Click Confirm For Place Order
    Click Cancel Order For E-wallet
    Click View Order Detail Button On Thankyou Page
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Check status order on account history page    ชำระเงินไม่สำเร็จ

TC_MC_10798
    [Documentation]    WMCheck status when place order and payment with ccw channel
    [Tags]    Regression    Medium    SmokeTest
    ${product_id}    Create List    ${product_1}
    Delete All Product In Cart
    Select Product By Product_Id    ${product_id}
    Click To Checkout Wemall Item On Cart Page
    Select Shipping Address By Email On Checkout Step 2    ${email_buyer_shipping}
    Select Payment Channel    ${rdo_ccw_channel}
    Click Confirm For Place Order
    Perform payment by Credit Card
    Get order id online from thankyou page
    Get substring order id online from thankyou page    ${order_id}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Check status order on account history page    รอการแจ้งจัดส่งสินค้า
    Check countdown time text on account history page    ${element_countdowntime_account_history}
    Check Text    ${refund_link_account_history}    ขอเงินคืน

