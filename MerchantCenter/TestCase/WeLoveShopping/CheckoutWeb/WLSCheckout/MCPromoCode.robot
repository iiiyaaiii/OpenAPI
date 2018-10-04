*** Settings ***
Suite Setup       Open Custom Browser    ${URL_PORTAL}    ${BROWSER}
Suite Teardown    Close All Browsers
Force Tags        Checkout-Web    mc-wls
Library           String
Library           SeleniumLibrary    15    5    run_on_failure=Capture Page Screenshot
Resource          ../../../../Resource/WeLoveShopping/init.robot
Resource          ../../../../Resource/WeLoveShopping/WebElement/Checkout.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/Cart.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/Member_SignIn.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/ManageProfile.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/WLSCheckout_MCPromoCode.txt
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Checkout.txt
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Keyword/Common/WLSCheckout_MCPromocode.txt

*** Test Cases ***
TC_MC_07737
    [Documentation]    WLSCheckout : Place order normal product by mc code
    [Tags]    RECON2017MC20    High    Checkout-Web
    Set Selenium Speed    0.2
    Check and Reset Seller Login    ${slug_order_testonly}    ${user_store_testonly}    ${password_store_testonly}
    Delete All Product In Cart
    Go To    ${URL_STORE}/${slug_order_testonly}
    Select product by product name    ${promotioncode_product}
    Click add to cart button on level d
    Check Element Is Visible    ${btn_cart_pop_up}
    Click order button on pop up level d
    Click order button on cart
    Check Element Is Visible    ${btn_address}
    Focus address button on checkout step 2
    Select address on checkout step 2    0
    Check Element Is Visible    ${input_coupon_checkout_3}
    Input promotion code    MCREGRESS
    Click use coupon code button
    Check Element Is Visible    ${txt_title_promotion_code}
    Check Text    ${txt_title_promotion_code}    ส่วนลดเพิ่มเติม
    Check Text    ${txt_condition_promotion_code}    จาก PromocodeTest\nเมื่อซื้อครบ 50 บาท

TC_MC_07742
    [Documentation]    WLSCheckout : Place order Seller promotion (percent) product by mc code
    Set Selenium Speed    0.2
    Check and Reset Seller Login    ${slug_order_testonly}    ${user_store_testonly}    ${password_store_testonly}
    Delete All Product In Cart
    Go To    ${URL_STORE}/${slug_order_testonly}
    Select product by product name    ${seller_promotion_product}
    Click add to cart button on level d
    Check Element Is Visible    ${btn_cart_pop_up}
    Click order button on pop up level d
    Click order button on cart
    Check Element Is Visible    ${btn_address}
    Focus address button on checkout step 2
    Select address on checkout step 2    0
    Check Element Is Visible    ${input_coupon_checkout_3}
    Input promotion code    MCREGRESS
    Click use coupon code button
    Check Element Is Visible    ${txt_title_promotion_code}
    Check Text    ${txt_title_promotion_code}    ส่วนลดเพิ่มเติม
    Check Text    ${txt_condition_promotion_code}    จาก PromocodeTest\nเมื่อซื้อครบ 50 บาท
    #Element Should Contain    //p[@class="bg-danger coupon_error_text"]    คูปองนี้ไม่สามารถใช้งานได้

TC_MC_07744
    [Documentation]    WLSCheckout : Place order WLS promotion (by cart : amount) product by mc code
    Set Selenium Speed    0.2
    Check and Reset Seller Login    ${slug_order_testonly}    ${user_store_testonly}    ${password_store_testonly}
    Delete All Product In Cart
    Go To    ${URL_STORE}/${slug_order_testonly}
    Select product by product name
    Click add to cart button on level d
    Check Element Is Visible    ${btn_cart_pop_up}
    Click order button on pop up level d
    Click order button on cart
    Check Element Is Visible    ${btn_address}
    Focus address button on checkout step 2
    Select address on checkout step 2    0
    Check Element Is Visible    ${input_coupon_checkout_3}
    Input promotion code    MCREGRESS
    Click use coupon code button
    Check Element Is Visible    ${txt_title_promotion_code}
    Check Text    ${txt_title_promotion_code}    ส่วนลดเพิ่มเติม
    Check Text    ${txt_condition_promotion_code}    จาก PromocodeTest\nเมื่อซื้อครบ 50 บาท

TC_MC_07746
    [Documentation]    WLSCheckout : Place order WLS promotion (by item) product by mc code
    Set Selenium Speed    0.2
    Check and Reset Seller Login    ${slug_order_testonly}    ${user_store_testonly}    ${password_store_testonly}
    Delete All Product In Cart
    Go To    ${URL_STORE}/${slug_order_testonly}
    Select product by product name
    Click add to cart button on level d
    Check Element Is Visible    ${btn_cart_pop_up}
    Click order button on pop up level d
    Click order button on cart
    Check Element Is Visible    ${btn_address}
    Focus address button on checkout step 2
    Select address on checkout step 2    0
    Check Element Is Visible    ${input_coupon_checkout_3}
    Input promotion code    MCREGRESS
    Click use coupon code button
    Check Element Is Visible    ${txt_title_promotion_code}
    Check Text    ${txt_title_promotion_code}    ส่วนลดเพิ่มเติม
    Check Text    ${txt_condition_promotion_code}    จาก PromocodeTest\nเมื่อซื้อครบ 50 บาท

TC_MC_07747
    [Documentation]    WLSCheckout : Place order Dealzap product by mc code
    Set Selenium Speed    0.2
    Check and Reset Seller Login    ${slug_order_testonly}    ${user_store_testonly}    ${password_store_testonly}
    Delete All Product In Cart
    Go To    ${URL_STORE}/${slug_order_testonly}
    Select product by product name
    Click add to cart button on level d
    Check Element Is Visible    ${btn_cart_pop_up}
    Click order button on pop up level d
    Click order button on cart
    Check Element Is Visible    ${btn_address}
    Focus address button on checkout step 2
    Select address on checkout step 2    0
    Check Element Is Visible    ${input_coupon_checkout_3}
    Input promotion code    MCREGRESS
    Click use coupon code button
    Check Element Is Visible    ${txt_title_promotion_code}
    Check Text    ${txt_title_promotion_code}    ส่วนลดเพิ่มเติม
    Check Text    ${txt_condition_promotion_code}    จาก PromocodeTest\nเมื่อซื้อครบ 50 บาท

TC_MC_07751
    [Documentation]    WLSCheckout : Place order 2 product Dealzap, Seller promotion (Baht) by mc code
    Set Selenium Speed    0.2
    Check and Reset Seller Login    ${slug_order_testonly}    ${user_store_testonly}    ${password_store_testonly}
    Delete All Product In Cart
    Go To    ${URL_STORE}/${slug_order_testonly}
    Select product by product name
    Click add to cart button on level d
    Check Element Is Visible    ${btn_cart_pop_up}
    Click order button on pop up level d
    Click order button on cart
    Check Element Is Visible    ${btn_address}
    Focus address button on checkout step 2
    Select address on checkout step 2    0
    Check Element Is Visible    ${input_coupon_checkout_3}
    Input promotion code    MCREGRESS
    Click use coupon code button
    Check Element Is Visible    ${txt_title_promotion_code}
    Check Text    ${txt_title_promotion_code}    ส่วนลดเพิ่มเติม
    Check Text    ${txt_condition_promotion_code}    จาก PromocodeTest\nเมื่อซื้อครบ 50 บาท

TC_MC_07760
    [Documentation]    WLSCheckout : Place order 1 product Promotion by piece (percent) product by mc code
    Set Selenium Speed    0.2
    Check and Reset Seller Login    ${slug_order_testonly}    ${user_store_testonly}    ${password_store_testonly}
    Delete All Product In Cart
    Go To    ${URL_STORE}/${slug_order_testonly}
    Select product by product name
    Click add to cart button on level d
    Check Element Is Visible    ${btn_cart_pop_up}
    Click order button on pop up level d
    Click order button on cart
    Check Element Is Visible    ${btn_address}
    Focus address button on checkout step 2
    Select address on checkout step 2    0
    Check Element Is Visible    ${input_coupon_checkout_3}
    Input promotion code    MCREGRESS
    Click use coupon code button
    Check Element Is Visible    ${txt_title_promotion_code}
    Check Text    ${txt_title_promotion_code}    ส่วนลดเพิ่มเติม
    Check Text    ${txt_condition_promotion_code}    จาก PromocodeTest\nเมื่อซื้อครบ 50 บาท

TC_MC_07762
    [Documentation]    WLSCheckout : Place order 2 product Seller Promotion by mc code
    Set Selenium Speed    0.2
    Check and Reset Seller Login    ${slug_order_testonly}    ${user_store_testonly}    ${password_store_testonly}
    Delete All Product In Cart
    Go To    ${URL_STORE}/${slug_order_testonly}
    Select product by product name
    Click add to cart button on level d
    Check Element Is Visible    ${btn_cart_pop_up}
    Click order button on pop up level d
    Click order button on cart
    Check Element Is Visible    ${btn_address}
    Focus address button on checkout step 2
    Select address on checkout step 2    0
    Check Element Is Visible    ${input_coupon_checkout_3}
    Input promotion code    MCREGRESS
    Click use coupon code button
    Check Element Is Visible    ${txt_title_promotion_code}
    Check Text    ${txt_title_promotion_code}    ส่วนลดเพิ่มเติม
    Check Text    ${txt_condition_promotion_code}    จาก PromocodeTest\nเมื่อซื้อครบ 50 บาท
