*** Settings ***
Documentation     Check shipping price on checkout step 3
Suite Setup       Open Custom Browser    ${URL_PORTAL}    ${BROWSER}
Suite Teardown    Close All Browsers
Test Setup        Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
Force Tags        Checkout-Web
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Resource/WeMall/WebElement/Checkout.txt
Resource          ../../../../Resource/WeMall/WebElement/Cart.txt
Resource          ../../../../Resource/WeMall/WebElement/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Checkout.txt
Resource          ../../../../Keyword/Common/Member_SignIn.txt

*** Test Cases ***
TC_MC_11673
    [Documentation]    WMCheckout : Checkout 1 product 500 baht and shipping price is free (discount from promo code 100%)
    [Tags]    Regression    Medium
    ${products}    Create List    ${product_test_shipping_price_1}
    Add To Cart Many Items    ${products}    ${storename_slug_wemall}
    Place Order    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Input Text    ${txt_coupon_code}    RE100PER
    Click Element    ${btn_use_coupon}
    Element Should Contain    ${lbl_price}    มูลค่าสินค้า
    Element Should Contain    ${lbl_price_product_total}    500.00 บาท
    Element Should Contain    ${lbl_shipping}    ค่าจัดส่ง
    Element Should Contain    ${lbl_shpping_total}    49.00 บาท
    Element Should Contain    ${lbl_total}    ราคาสุทธิ
    Element Should Contain    ${lbl_final_price}    49.00 บาท

TC_MC_11676
    [Documentation]    WMCheckout : Checkout 2 product, product A 1000 baht, product B 100 baht and shipping price is free (discount from mc code 50%)
    [Tags]    Regression    Medium
    ${products}    Create List    ${product_test_shipping_price_2}    ${product_test_shipping_price_3}
    Add To Cart Many Items    ${products}    ${storename_slug_wemall}
    Place Order    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Input Text    ${txt_coupon_code}    RE50PER
    Click Element    ${btn_use_coupon}
    Element Should Contain    ${lbl_price}    มูลค่าสินค้า
    Element Should Contain    ${lbl_price_product_total}    1,100.00 บาท
    Element Should Contain    ${lbl_shipping}    ค่าจัดส่ง
    Element Should Contain    ${lbl_shpping_total}    ฟรี
    Element Should Contain    ${lbl_total}    ราคาสุทธิ
    Element Should Contain    ${lbl_final_price}    550.00 บาท

TC_MC_11686
    [Documentation]    WMCheckout : Check out 3 installment product and shipping price is free (discount from mc code 100% for All site)
    [Tags]    Regression    Medium
    ${products}    Create List    ${product_test_shipping_price_4}
    Add To Cart Many Items    ${products}    ${storename_slug_wemall}
    Place Order    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Input Text    ${txt_coupon_code}    100PERMC
    Click Element    ${btn_use_coupon}
    Element Should Contain    ${lbl_price}    มูลค่าสินค้า
    Element Should Contain    ${lbl_price_product_total}    10,000.00 บาท
    Element Should Contain    ${lbl_shipping}    ค่าจัดส่ง
    Element Should Contain    ${lbl_shpping_total}    49.00 บาท
    Element Should Contain    ${lbl_total}    ราคาสุทธิ
    Element Should Contain    ${lbl_final_price}    49.00 บาท

TC_MC_11687
    [Documentation]    WMCheckout : Check out 3 installment product and shipping price is free (discount from mc code 90% for All site)
    [Tags]    Regression    Medium
    ${products}    Create List    ${product_test_shipping_price_4}
    Add To Cart Many Items    ${products}    ${storename_slug_wemall}
    Place Order    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Input Text    ${txt_coupon_code}    RE90PERMC
    Click Element    ${btn_use_coupon}
    Element Should Contain    ${lbl_price}    มูลค่าสินค้า
    Element Should Contain    ${lbl_price_product_total}    10,000.00 บาท
    Element Should Contain    ${lbl_shipping}    ค่าจัดส่ง
    Element Should Contain    ${lbl_shpping_total}    ฟรี
    Element Should Contain    ${lbl_total}    ราคาสุทธิ
    Element Should Contain    ${lbl_final_price}    1,000.00 บาท


