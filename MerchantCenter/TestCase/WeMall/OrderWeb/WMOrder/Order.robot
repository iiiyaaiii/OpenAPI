*** Setting ***
Suite Setup       Open Custom Browser    ${URL_PORTAL}    ${BROWSER}
Suite Teardown    Close All Browsers
Force Tags        Order-Web    mc-wm
Library           SeleniumLibrary
Library           String
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/LevelD/LevelDKeyword.robot
Resource          ../../../../Keyword/WeMallWeb/CartPageKeyword.robot
Resource          ../../../../Keyword/WeMallWeb/ThankyouPageKeyword.robot
Resource          ../../../../Keyword/Checkout/CheckoutKeyword.robot
Resource          ../../../../Resource/WeMall/Locators/WeMallWeb/CheckoutPageLocator.robot
Resource          ../../../../Keyword/Common/Account_History.txt
Resource          ../../../../Resource/Wemall/WebElement/AccountHistory.txt
Resource          ../../../../Keyword/Common/ManageOrder.txt

*** Test Cases ***
TC_MC_11262
    [Documentation]    WMOrderAccountHistory View order history account page in case data not found
    [Tags]    Regression    Medium    Order-Web
    Set Selenium Speed    0.2
    Check and Reset Seller Login    ${user_nodata}    ${user_login_trust_zero}    ${pass_login_trust_zero}
    Go To Account Order History
    Check Text    ${element_totalandpage}    รายการทั้งหมด : 0 รายการ
    Check Text    ${element_data_not_found}    ไม่พบข้อมูล
    Check title table

TC_MC_11263
    [Documentation]    WMOrderAccountHistory Check item status after expired payment
    [Tags]    Regression    Medium    Order-Web    SmokeTest
    ${product_id}    Create List    ${product_1}
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Delete All Product In Cart
    Select Product By Product_Id    ${product_id}
    Click To Checkout Wemall Item On Cart Page
    Select Shipping Address By Email On Checkout Step 2    ${email_buyer_shipping}
    Select Payment Channel    ${rdo_cs_channel}
    Click Confirm For Place Order
    Click To Display Summary Order Section On Thankyou Page
    Get order id online from thankyou page
    Get substring order id online from thankyou page    ${order_id}
    Login admin manage order web
    API Order Manage Datetime    payment_expired_time    เพิ่ม-ลด    -4    day
    Run cron order expire on admin manage order web    ${order_id_sub}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Check status order on account history page    หมดเวลาการชำระเงิน