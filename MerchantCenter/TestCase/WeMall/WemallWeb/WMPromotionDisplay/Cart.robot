*** Setting ***
Suite Setup       Open Custom Browser    ${URL_PORTAL}    ${BROWSER}
Suite Teardown    Close All Browsers
Test Setup        Clear Active Login
Test Timeout      3 minutes
Library           SeleniumLibrary
Library           String
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Checkout.txt
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/ManageOrder.txt
Resource          ../../../../Keyword/Common/Account_History.txt
Resource          ../../../../Resource/Wemall/WebElement/Checkout.txt
Resource          ../../../../Resource/Wemall/WebElement/Cart.txt

*** Test Cases ***
TC_MC_10241
    [Tags]    Regression    High    Checkout-Web
    [Documentation]    View Promotion In Checkout
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    # Set product trustmall_product4 stock trustmall store
    ${product4_id}    Get Substring    ${trustmall_product4_id}    -8
    Go to    ${URL_STORE}/trustmall/admin/product/edit/${product4_id}
    Input Text    //input[@id="instockunit"]    1
    Click Element    //button[@type="submit"]
    # Wait Until Element Is Visible    //span[@id="notify-msg"]
    sleep    2
    Delete All Product In Cart
    Add Product To Cart by product name on store    ${URL_PORTAL}/${storename_slug_wemall}    ${trustmall_product4_name}
    Add Product To Cart by product name on store    ${URL_PORTAL}/${storename_slug_wemall}    ${trustmall_product5_name}
    Add Product To Cart by product name on store    ${URL_PORTAL}/${storename_slug_wemall}    ${trustmall_product6_name}
    Add Product To Cart by product name on store    ${URL_PORTAL}/${storename_slug_wemall}    ${trustmall_product7_name}
    Add Product To Cart by product name on store    ${URL_PORTAL}/${storename_slug_wemall}    ${trustmall_product8_name}
    Close All Browsers

    # Paid trustmall_product4 reconfulfillment store
    Open Custom Browser    ${URL_PORTAL}    ${BROWSER}
    Go to Login    ${user_login_trust_wemall_mf}    ${pass_login_trust_wemall_mf}
    Delete All Product In Cart
    Go To    ${URL_PORTAL}/${storename_slug_wemall}
    Select product by product name    ${trustmall_product4_name}
    Add Product To Cart And Go Checkout
    Place Order Online Offline Wemall    ${select_address_wemall}    ${ccw_channel_radio_button}
    Inpage Credit Card
    Click Confirm Checkout Button
    Check Element Visible    ${text_order_id_thankyou_page}    ${expect_load_time}

    # Check cart trustmall store
    Close All Browsers
    Open Custom Browser    ${URL_PORTAL}    ${BROWSER}
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Go to    ${URL_PORTAL}/cart
    Element Should Contain    //div[@class="box-promotion-remark"]    หมายเหตุ
    Element Should Contain    //div[@class="box-promotion-remark"]    สินค้าหมด หรือ ไม่พร้อมจำหน่ายจะไม่สามารถทำรายการสั่งซื้อได้ กรุณาลบสินค้าออกจากตะกร้า
    Element Should Contain    //div[@class="box-promotion-remark"]    Seller Promotion By Baht ซื้อสินค้าตั้งแต่ 100 บาทขึ้นไป ลดเพิ่ม 35บาท
    Element Should Contain    //div[@class='box-sum-left']    ส่วนลด
    Element Should Contain    //div[@class='box-sum-left']    Seller Promotion By Baht

TC_MC_10242
    [Tags]    Regression    High    Checkout-Web
    [Documentation]    View Promotion In Checkout
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}

    Delete All Product In Cart
    Add Product To Cart by product name on store    ${URL_PORTAL}/${storename_slug_wemall}    ${trustmall_product9_name}
    Add Product To Cart by product name on store    ${URL_PORTAL}/${storename_slug_wemall}    ${trustmall_product5_name}
    Add Product To Cart by product name on store    ${URL_PORTAL}/${storename_slug_wemall}    ${trustmall_product6_name}
    Add Product To Cart by product name on store    ${URL_PORTAL}/${storename_slug_wemall}    ${trustmall_product7_name}
    Go To    ${URL_PORTAL}/${storename_slug_wemall}
    Select product by product name    ${trustmall_product8_name}
    Add Product To Cart And Go Checkout
    Click Button    //button[@class="btn btn-buy"]
    Wait Until Element Is Visible    //button[@class="btn btn-default btn-xs btn-add new_address"]    60
    Focus    //button[@class="btn btn-default btn-xs btn-add new_address"]
    Execute Javascript    ${select_address_wemall}
    Use Promotion Code    ALLSTORE01

    Element Should Contain    //div[@class="box-discount"]    Seller Promotion By Baht
    Element Should Contain    //span[@id="coupon_condition"]    จากโค้ด ALLSTORE01
    Element Should Contain    //span[@id="coupon_condition_txt"]    ลดเพิ่มทันที 15% เมื่อซื้อสินค้าครบ 200.- จำกัดส่วนลดสูงสุด 500.- สำหรับสินค้าในร้าน ทรัสต์เม็นท์, ทรัสต์มอล


TC_MC_10243
    [Tags]    Regression    High    Checkout-Web
    [Documentation]    View Promotion In Checkout
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}

    Delete All Product In Cart
    Add Product To Cart by product name on store    ${URL_PORTAL}/${storename_slug_wemall}    ${trustmall_product9_name}
    Add Product To Cart by product name on store    ${URL_PORTAL}/${storename_slug_wemall}    ${trustmall_product5_name}
    Add Product To Cart by product name on store    ${URL_PORTAL}/${storename_slug_wemall}    ${trustmall_product6_name}
    Add Product To Cart by product name on store    ${URL_PORTAL}/${storename_slug_wemall}    ${trustmall_product7_name}
    Go To    ${URL_PORTAL}/${storename_slug_wemall}
    Select product by product name    ${trustmall_product8_name}
    Add Product To Cart And Go Checkout
    Place Order Online Offline Wemall    ${select_address_wemall}    ${ccw_channel_radio_button}
    Use Promotion Code    ALLSTORE01
    Inpage Credit Card
    Click Confirm Checkout Button
    Check Element Visible    ${text_order_id_thankyou_page}    ${expect_load_time}

    Element Should Contain    //div[@class='box-promotion-promo']    หมายเหตุ
    Element Should Contain    //div[@class='box-promotion-promo']    Seller Promotion By Baht ซื้อสินค้าตั้งแต่ 100 บาทขึ้นไป ลดเพิ่ม 35 บาท
    Element Should Contain    //div[@class='box-promotion-promo']    จากโค้ด ALLSTORE01 ลดเพิ่มทันที 15% เมื่อซื้อสินค้าครบ 200.- จำกัดส่วนลดสูงสุด 500.- สำหรับสินค้าในร้าน ทรัสต์เม็นท์, ทรัสต์มอล
    Element Should Contain    //div[@class='thk-sum-detail']    Seller Promotion By Baht
    Element Should Contain    //div[@class='thk-sum-detail']    จากโค้ด ALLSTORE01



