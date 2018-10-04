*** Setting ***
[Documentation]    Testcase are manage order for sanity on production
Suite Setup       Run Keywords    Account Login    ${sanity_user}    ${sanity_password}    AND    Open and close shop    open    ${slug_name_sanity}
Suite Teardown    Run Keywords    Open and close shop    close    ${slug_name_sanity}    AND    Close All Browsers
Library           SeleniumLibrary
Library           String
Resource          ../../../Resource/WeMall/init.robot
Resource          ../../../Keyword/Common/Home.txt
Resource          ../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../Keyword/Common/Checkout.txt
Resource          ../../../Keyword/Common/Common.txt
Resource          ../../../Keyword/Common/WMS_OrderTracking.txt
Resource          ../../../Keyword/Common/Account_Refund.txt
Resource          ../../../Keyword/Common/Account_History.txt
Resource          ../../../Keyword/Common/Account_Detail.txt
Resource          ../../../Keyword/Common/Store_History.txt
Resource          ../../../Resource/WeMall/WebElement/WMS_OrderTracking.txt
Resource          ../../../Keyword/LevelD/LevelDKeyword.robot
Resource          ../../../Keyword/WeMallWeb/CartPageKeyword.robot
Resource          ../../../Keyword/WeMallWeb/ThankyouPageKeyword.robot
Resource          ../../../Keyword/Checkout/CheckoutKeyword.robot
Resource          ../../../Resource/WeMall/Locators/WeMallWeb/CheckoutPageLocator.robot

*** Test Cases ***
TC_MC_MANAGE_01
    [Documentation]    Place order and Accept request refund by admin
    [Tags]    Sanity
    ${product_id}    Create List    ${sanity1_product}
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
    Click refund link on account order history
    Select checkbox all product for refund
    Enter request refund data
    Go to WMS    ${wms_sanity_user}    ${wms_sanity_password}
    Switch Project    wm
    Go to Order Tracking Page
    Search order id on wms order tracking    ${order_id}
    Get wms order tracking url
    Admin manage order request refund    ${btn_admin_accept}
    Element Should Contain    ${dlg_message}    Accept Refund Success
    Go to account order detail page    ${order_id}
    Check Text    ${text_status_on_refund_table}    ร้านค้ายอมรับการขอเงินคืน

TC_MC_MANAGE_02
    [Documentation]    Place order and Accept request refund
    [Tags]    Sanity
    ${product_id}    Create List    ${sanity1_product}
    Delete All Product In Cart
    Select Product By Product_Id    ${product_id}
    Click To Checkout Wemall Item On Cart Page
    Select Shipping Address By Email On Checkout Step 2    ${email_buyer_shipping}
    Select Payment Channel    ${rdo_ccw_channel}
    Click Confirm For Place Order
    Perform payment by Credit Card
    Get order id online from thankyou page
    Get substring order id online from thankyou page    ${order_id}
    Go to store order history    ${slug_name_sanity}
    Search order id on store order history    ${order_id}
    Shipping One Product Custom By Product Name    ${lbl_ems_tracking}    ${URL_STORE}    ${URL_STORE}    ${img_ship}    ${sanity1_product}
    Go To Account Order History
    Search Order Id On Account Order History    ${order_id}
    Click refund link on account order history
    Select checkbox all product for refund
    Enter request refund data
    Go To Store Order Detail    ${slug_name_sanity}    ${order_id}
    Seller accept refund    ${sanity_password}
    Go to account order detail page    ${order_id}
    Check Text    ${text_status_on_refund_table}    ร้านค้ายอมรับการขอเงินคืน

TC_MC_MANAGE_03
    [Documentation]     Place order Ship Request Refund and Decline
    [Tags]    Sanity
    ${product_id}    Create List    ${sanity1_product}    ${sanity2_product}
    Delete All Product In Cart
    Select Product By Product_Id    ${product_id}
    Click To Checkout Wemall Item On Cart Page
    Select Shipping Address By Email On Checkout Step 2    ${email_buyer_shipping}
    Select Payment Channel    ${rdo_ccw_channel}
    Click Confirm For Place Order
    Perform payment by Credit Card
    Get order id online from thankyou page
    Get substring order id online from thankyou page    ${order_id}
    Go to store order history    ${slug_name_sanity}
    Search order id on store order history    ${order_id}
    Shipping One Product Custom By Product Name    ${lbl_ems_tracking}    ${URL_STORE}    ${URL_STORE}    ${img_ship}    ${sanity2_product}
    Go To Account Order History
    Search Order Id On Account Order History    ${order_id}
    Click refund link on account order history
    Select checkbox product for refund by product name    ${sanity2_name}
    Enter request refund data
    Go To Store Order Detail Page    ${slug_name_sanity}    ${order_id}
    Seller decline refund
    Go to account order detail page    ${order_id}
    Check status order on account detail page    กำลังจัดส่งสินค้า
    Check Text    ${text_status_on_refund_table}    ร้านค้าปฏิเสธการขอเงินคืน
