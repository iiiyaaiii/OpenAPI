*** Settings ***
Suite Setup       Open Custom Browser    ${URL_PORTAL}    ${BROWSER}
Suite Teardown    Close All Browsers
Test Setup        Go to    ${URL_PORTAL}
Test Teardown     Delete All Cookies
Test Timeout      3 minutes
Library           String
Library           Collections
Library           OperatingSystem
Library           DateTime
Library           SeleniumLibrary    15    5    run_on_failure=Capture Page Screenshot
Force Tags        Checkout-Web    Ligo    Sprint2017MC9
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Resource/WeMall/WebElement/Cart.txt
Resource          ../../../../Resource/WeMall/WebElement/Checkout.txt
Resource          ../../../../Resource/WeMall/WebElement/Member_SignIn.txt
Resource          ../../../../Resource/WeMall/WebElement/LevelD.txt
Resource          ../../../../Resource/WeMall/WebElement/Portal.txt
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Campaign.txt
Resource          ../../../../Keyword/Common/Checkout.txt
Resource          ../../../../Keyword/Common/Product.txt
Resource          ../../../../Keyword/Common/WMS_Blockproduct.txt
Resource          ../../../../Keyword/Campaign/EverydayWowKeyword.robot
Resource          ../../../../Keyword/WemallWeb/ThankyouPageKeyword.robot
Resource          ../../../../Keyword/WemallWeb/CartPageKeyword.robot
Resource          ../../../../Keyword/Cart/CartKeyword.robot
Resource          ../../../../Keyword/Checkout/CheckoutKeyword.robot
Resource          ../../../../Keyword/LevelD/LevelDKeyword.robot

*** Test Cases ***
TC_MC_04164
    [Documentation]    Use PromoCode but don't macth with promocode condition
    [Tags]    Regression    High    mock
    ${result}=    Check Element    //a[@title='บัญชีของฉัน']
    Run Keyword If    '${result}'=='FAIL'    Go to Login    ${buyer_checkout}    ${buyer_checkout_pass}
    Delete All Product In Cart
    Go to    ${URL_LEVEL_D}/${robot_stg_store2_instock_type_new}?refresh=changeme
    Wait Until Element Is Visible    ${Button_AddToCart}    ${EXPECT_LOADTIME}
    Click Element    ${Button_AddToCart}
    Wait Until Element Is Visible    ${btn_order}    ${EXPECT_LOADTIME}
    Click Element    ${btn_order}
    Click Checkout Button
    Execute Javascript    $("button:contains(เลือกที่อยู่จัดส่งนี้)")[0].click()
    Wait Until Element Is Visible    ${input_coupon}
    Input Text    ${input_coupon}    ${promo_code}
    Click Element    ${coupon_btn}
    Wait Until Element Is Visible    ${coupon_error}
    Element Should Contain    ${coupon_error}    คูปองนี้ต้องมีการสั่งซื้อขั้นต่ำ 1,000 บาท

TC_MC_04166
    [Documentation]    Use PromoCode and meet promocode condition
    [Tags]    Regression    High    mock
    ${result}=    Check Element    //a[@title='บัญชีของฉัน']
    Run Keyword If    '${result}'=='FAIL'    Go to Login    ${buyer_checkout}    ${buyer_checkout_pass}
    Delete All Product In Cart
    Go to    ${URL_LEVEL_D}/${robot_store2_instock_type_use}?refresh=changeme
    Repeat Keyword    1 times    Execute Javascript    ${leveld_increase_js}.click()
    Wait Until Element Is Visible    ${Button_AddToCart}    ${EXPECT_LOADTIME}
    Click Element    ${Button_AddToCart}
    Wait Until Element Is Visible    ${btn_order}    ${EXPECT_LOADTIME}
    Click Element    ${btn_order}
    Click Checkout Button
    Execute Javascript    $("button:contains(เลือกที่อยู่จัดส่งนี้)")[0].click()
    Wait Until Element Is Visible    ${input_coupon}
    Input Text    ${input_coupon}    ${promo_code}
    Click Element    ${coupon_btn}
    Wait Until Element Is Visible    ${coupon_condition}
    Element Should Contain    ${coupon_condition}    จากโค้ด ${promo_code}
    Element Should Contain    //span[@id='coupon_condition_txt']    ลดเพิ่มทันที 100.- ทั้งเว็บ เมื่อซื้อสินค้าครบ 1,000.-
    Element Should Contain    ${coupon_discount}    -100.00 บาท
    ${exclude_promo}=    Get Amount Before
    ${include_promo}=    Evaluate    ${exclude_promo} - 100
    ${net_amount}=    Get Amount After
    Should Be Equal    ${net_amount}    ${include_promo}

TC_MC_04168
    [Documentation]    Place order - We Trust - Credit card
    [Tags]    Regression    SmokeTest    High    mock
    ${data}    Create List    ${lbl_credit_card_number1}    ${lbl_credit_card_number2}    ${lbl_credit_card_number3}    ${lbl_credit_card_number4}    ${lbl_cardname}    ${lbl_month}    ${lbl_year}    ${lbl_cnv}
    ${result}=    Check Element    //a[@title='บัญชีของฉัน']
    Run Keyword If    '${result}'=='FAIL'    Go to Login    ${buyer_checkout}    ${buyer_checkout_pass}
    Delete All Product In Cart
    Go to    ${URL_LEVEL_D}/${robot_store2_instock_type_use}?refresh=changeme
    Repeat Keyword    1 times    Execute Javascript    ${leveld_increase_js}.click()
    Wait Until Element Is Visible    ${Button_AddToCart}    ${EXPECT_LOADTIME}
    Click Element    ${Button_AddToCart}
    Wait Until Element Is Visible    ${btn_order}    ${EXPECT_LOADTIME}
    Click Element    ${btn_order}
    Click To Checkout Wemall Item On Cart Page
    # ${select_adr_step2}=    Get Text    ${address_detail_step2}
    ${select_adr_step2}    Get Shipping Address Data On Checkout Step 2
    Click To Default Shipping Address On Checkout Step 2
    # Execute Javascript    $("button:contains(เลือกที่อยู่จัดส่งนี้)")[0].click()
    ${select_adr_step3}=    Get Text    ${address_detail_step3}
    ${ship_adr_step2}=    Checkout Verify Shipping Address    ${select_adr_step2}
    ${ship_adr_step3}=    Checkout Verify Shipping Address    ${select_adr_step3}
    Should Be Equal    ${ship_adr_step2}    ${ship_adr_step3}
    ${exclude_shipping}=    Get Amount Before
    ${shipping_cost}    Get Text    ${lbl_shpping_total}
    ${include_shipping}=    Get Amount After
    Execute Javascript    ${payment_credit}.click()
    Input Data Of Credit Card    ${data}
    Click Element    ${btn_confirm_checkout}
    Confirm Action
    Verify Thankyou Page Order Status    Credit    Success
    ${netamt}=    Verify Thankyou Page Order Summary    ${exclude_shipping}    None    \    \    ${shipping_cost}
    Verify Order Reference    ${netamt}    Credit    Success

TC_MC_04171
    [Documentation]    Place order - We Trust - ATM
    [Tags]    High    mock
    ${result}=    Check Element    //a[@title='บัญชีของฉัน']
    Run Keyword If    '${result}'=='FAIL'    Go to Login    ${buyer_checkout}    ${buyer_checkout_pass}
    Delete All Product In Cart
    Go to    ${URL_LEVEL_D}/${robot_store2_instock_type_use}?refresh=changeme
    Repeat Keyword    1 times    Execute Javascript    ${leveld_increase_js}.click()
    Wait Until Element Is Visible    ${Button_AddToCart}    ${EXPECT_LOADTIME}
    Click Element    ${Button_AddToCart}
    Wait Until Element Is Visible    ${btn_order}    ${EXPECT_LOADTIME}
    Click Element    ${btn_order}
    Click Checkout Button
    ${select_adr_step2}=    Get Text    ${address_detail_step2}
    Execute Javascript    $("button:contains(เลือกที่อยู่จัดส่งนี้)")[0].click()
    ${select_adr_step3}=    Get Text    ${address_detail_step3}
    ${ship_adr_step2}=    Checkout Verify Shipping Address    ${select_adr_step2}
    ${ship_adr_step3}=    Checkout Verify Shipping Address    ${select_adr_step3}
    Should Be Equal    ${ship_adr_step2}    ${ship_adr_step3}
    ${exclude_shipping}=    Get Amount Before
    ${shipping_cost}    Get Text    ${lbl_shpping_total}
    Execute Javascript    ${shipping_kerry}.click()
    ${shipping_cost}    Execute Javascript    return ${kerry_cost}.text()
    ${shipping_cost}=    Check Shipping Cost    ${shipping_cost}
    Run Keyword If    ${shipping_cost}!=0    Element Text Should Be    ${shipping_price}    ${shipping_cost}.00 บาท
    Run Keyword If    ${shipping_cost}==0    Element Text Should Be    ${shipping_price}    ฟรี
    ${shipping_cost}    Convert To Integer    ${shipping_cost}
    ${include_shipping}=    Evaluate    ${exclude_shipping} + ${shipping_cost}
    ${include_shipping}=    Get Amount After
    Input Text    ${input_coupon}    ${promo_code}
    Click Element    ${coupon_btn}
    ${exclude_promo}=    Get Amount Before
    ${exclude_promo}=    Evaluate    ${exclude_promo} + ${shipping_cost}
    ${include_promo}=    Evaluate    ${exclude_promo} - 100
    ${net_amount}=    Get Amount After
    Should Be Equal    ${net_amount}    ${include_promo}
    Execute Javascript    ${payment_ATM}.click()
    Click Element    ${btn_confirm_checkout}
    Verify Thankyou Page Order Status    ATM
    Execute Javascript    ${thx_box_pay_sum_js}.click()
    ${netamt}=    Verify Thankyou Page Order Summary    ${exclude_shipping}    Promocode    ส่วนลด (บาท)จาก ${promo_name}    200    ${shipping_cost}
    Verify Order Reference    ${netamt}    ATM

TC_MC_04173
    [Documentation]    Place order - We Trust - Bank Counter
    [Tags]    High    mock
    ${result}=    Check Element    //a[@title='บัญชีของฉัน']
    Run Keyword If    '${result}'=='FAIL'    Go to Login    ${buyer_checkout}    ${buyer_checkout_pass}
    Delete All Product In Cart
    Go to    ${URL_LEVEL_D}/${robot_store2_instock_type_use}?refresh=changeme
    Wait Until Element Is Visible    ${Button_AddToCart}    ${EXPECT_LOADTIME}
    Click Element    ${Button_AddToCart}
    Wait Until Element Is Visible    ${btn_order}    ${EXPECT_LOADTIME}
    Click Element    ${btn_order}
    Click Checkout Button
    ${select_adr_step2}=    Get Text    ${address_detail_step2}
    Execute Javascript    $("button:contains(เลือกที่อยู่จัดส่งนี้)")[0].click()
    ${select_adr_step3}=    Get Text    ${address_detail_step3}
    ${ship_adr_step2}=    Checkout Verify Shipping Address    ${select_adr_step2}
    ${ship_adr_step3}=    Checkout Verify Shipping Address    ${select_adr_step3}
    Should Be Equal    ${ship_adr_step2}    ${ship_adr_step3}
    ${exclude_shipping}=    Get Amount Before
    Execute Javascript    ${shipping_custom}.click()
    ${shipping_cost}    Execute Javascript    return ${custom_cost}.text()
    ${shipping_cost}=    Check Shipping Cost    ${shipping_cost}
    Run Keyword If    ${shipping_cost}!=0    Element Text Should Be    ${shipping_price}    ${shipping_cost}.00 บาท
    Run Keyword If    ${shipping_cost}==0    Element Text Should Be    ${shipping_price}    ฟรี
    ${shipping_cost}    Convert To Integer    ${shipping_cost}
    ${include_shipping}=    Evaluate    ${exclude_shipping} + ${shipping_cost}
    ${include_shipping}=    Get Amount After
    Execute Javascript    ${payment_bankcounter}.click()
    Click Element    ${btn_confirm_checkout}
    Verify Thankyou Page Order Status    BANKCOUNTER
    Execute Javascript    ${thx_box_pay_sum_js}.click()
    ${netamt}=    Verify Thankyou Page Order Summary    ${exclude_shipping}    None    \    \    ${shipping_cost}
    Verify Order Reference    ${netamt}    BANKCOUNTER

TC_MC_04175
    [Documentation]    Place order - We Trust - I-Banking
    [Tags]    High    mock
    ${result}=    Check Element    //a[@title='บัญชีของฉัน']
    Run Keyword If    '${result}'=='FAIL'    Go to Login    ${buyer_checkout}    ${buyer_checkout_pass}
    Delete All Product In Cart
    Go to    ${URL_LEVEL_D}/${robot_store1_instock_type_new}?refresh=changeme
    Wait Until Element Is Visible    ${Button_AddToCart}    ${EXPECT_LOADTIME}
    Click Element    ${Button_AddToCart}
    Wait Until Element Is Visible    ${btn_order}    ${EXPECT_LOADTIME}
    Click Element    ${btn_order}
    Click Checkout Button
    ${select_adr_step2}=    Get Text    ${address_detail_step2}
    Execute Javascript    $("button:contains(เลือกที่อยู่จัดส่งนี้)")[0].click()
    ${select_adr_step3}=    Get Text    ${address_detail_step3}
    ${ship_adr_step2}=    Checkout Verify Shipping Address    ${select_adr_step2}
    ${ship_adr_step3}=    Checkout Verify Shipping Address    ${select_adr_step3}
    Should Be Equal    ${ship_adr_step2}    ${ship_adr_step3}
    ${exclude_shipping}=    Get Amount Before
    Execute Javascript    ${shipping_post}.click()
    ${shipping_cost}    Execute Javascript    return ${post_cost}.text()
    ${shipping_cost}=    Check Shipping Cost    ${shipping_cost}
    Run Keyword If    ${shipping_cost}!=0    Element Text Should Be    ${shipping_price}    ${shipping_cost}.00 บาท
    Run Keyword If    ${shipping_cost}==0    Element Text Should Be    ${shipping_price}    ฟรี
    ${shipping_cost}    Convert To Integer    ${shipping_cost}
    ${include_shipping}=    Evaluate    ${exclude_shipping} + ${shipping_cost}
    ${include_shipping}=    Get Amount After
    Execute Javascript    ${payment_Ibanks}.click()
    Click Element    ${btn_confirm_checkout}
    Verify Thankyou Page Order Status    IBANKING
    Execute Javascript    ${thx_box_pay_sum_js}.click()
    ${netamt}=    Verify Thankyou Page Order Summary    ${exclude_shipping}    None    \    \    ${shipping_cost}
    Verify Order Reference    ${netamt}    IBANKING

TC_MC_04177
    [Documentation]    Place order - We Trust - Counter Service
    [Tags]    Regression    SmokeTest    High    mock
    ${result}=    Check Element    //a[@title='บัญชีของฉัน']
    Run Keyword If    '${result}'=='FAIL'    Go to Login    ${buyer_checkout}    ${buyer_checkout_pass}
    Delete All Product In Cart
    Go to    ${URL_LEVEL_D}/${robot_store1_instock_type_new}?refresh=changeme
    Wait Until Element Is Visible    ${Button_AddToCart}    ${EXPECT_LOADTIME}
    Click Element    ${Button_AddToCart}
    Wait Until Element Is Visible    ${btn_order}    ${EXPECT_LOADTIME}
    Click Element    ${btn_order}
    Click To Checkout Wemall Item On Cart Page
    Click To Default Shipping Address On Checkout Step 2
    Execute Javascript    ${payment_CS}.click()
    Click Element    ${btn_confirm_checkout}
    Verify Thankyou Page Order Status    CS
    Select Window    title=Wemall : Checkout

TC_MC_04178
    [Documentation]    Place order - We Trust - eWallet
    [Tags]    High    mock
    ${result}=    Check Element    //a[@title='บัญชีของฉัน']
    Run Keyword If    '${result}'=='FAIL'    Go to Login    ${buyer_checkout}    ${buyer_checkout_pass}
    Delete All Product In Cart
    Go to    ${URL_LEVEL_D}/${robot_store1_instock_type_new}?refresh=changeme
    Wait Until Element Is Visible    jquery=#btn-add-cart
    Execute Javascript    ${addtocart}.click()
    Execute Javascript    ${gotocart}[0].click()
    Click Checkout Button
    ${select_adr_step2}=    Get Text    ${address_detail_step2}
    Execute Javascript    $("button:contains(เลือกที่อยู่จัดส่งนี้)")[0].click()
    ${select_adr_step3}=    Get Text    ${address_detail_step3}
    ${ship_adr_step2}=    Checkout Verify Shipping Address    ${select_adr_step2}
    ${ship_adr_step3}=    Checkout Verify Shipping Address    ${select_adr_step3}
    Should Be Equal    ${ship_adr_step2}    ${ship_adr_step3}
    ${exclude_shipping}=    Get Amount Before
    Execute Javascript    ${shipping_kerry}.click()
    ${shipping_cost}    Execute Javascript    return ${kerry_cost}.text()
    ${shipping_cost}=    Check Shipping Cost    ${shipping_cost}
    Run Keyword If    ${shipping_cost}!=0    Element Text Should Be    ${shipping_price}    ${shipping_cost}.00 บาท
    Run Keyword If    ${shipping_cost}==0    Element Text Should Be    ${shipping_price}    ฟรี
    ${shipping_cost}    Convert To Integer    ${shipping_cost}
    ${include_shipping}=    Evaluate    ${exclude_shipping} + ${shipping_cost}
    ${include_shipping}=    Get Amount After
    Execute Javascript    ${payment_EW}.click()
    Click Element    ${btn_confirm_checkout}
    Payment Ewallet    ${buyer_wallet}    ${buyer_wallet_pass}    none
    Verify Thankyou Page Order Status    eWallet    Success
    ${netamt}=    Verify Thankyou Page Order Summary    ${exclude_shipping}    None    \    \    ${shipping_cost}
    Verify Order Reference    ${netamt}    eWallet    Success
    Page Should Not Contain Element    ${btn_print}
    Page Should Not Contain Element    ${footer_bank}

TC_MC_04180
    [Documentation]    Place order - We Trust - eWallet (Cancel pay)
    [Tags]    Regression    High    mock
    ${result}=    Check Element    //a[@title='บัญชีของฉัน']
    Run Keyword If    '${result}'=='FAIL'    Go to Login    ${buyer_checkout}    ${buyer_checkout_pass}
    Delete All Product In Cart
    Go to    ${URL_LEVEL_D}/${robot_store1_instock_type_new}?refresh=changeme
    Wait Until Element Is Visible    ${Button_AddToCart}    ${EXPECT_LOADTIME}
    Click Element    ${Button_AddToCart}
    Wait Until Element Is Visible    ${btn_order}    ${EXPECT_LOADTIME}
    Click Element    ${btn_order}
    Click Checkout Button
    ${select_adr_step2}=    Get Text    ${address_detail_step2}
    Execute Javascript    $("button:contains(เลือกที่อยู่จัดส่งนี้)")[0].click()
    ${select_adr_step3}=    Get Text    ${address_detail_step3}
    ${ship_adr_step2}=    Checkout Verify Shipping Address    ${select_adr_step2}
    ${ship_adr_step3}=    Checkout Verify Shipping Address    ${select_adr_step3}
    Should Be Equal    ${ship_adr_step2}    ${ship_adr_step3}
    ${exclude_shipping}=    Get Amount Before
    #Execute Javascript    ${shipping_custom}.click()
    #${shipping_cost}    Execute Javascript    return ${custom_cost}.text()
    #${shipping_cost}=    Check Shipping Cost    ${shipping_cost}
    ${shipping_cost}    Get Text    ${lbl_shpping_total}
    ${shipping_cost}    Run Keyword If    '${shipping_cost}'!='ฟรี '    Get Substring    ${shipping_cost}    0    2
    ${shipping_cost}    Run Keyword If    '${shipping_cost}'=='ฟรี '    ${shipping_cost}    Set Variable    0
    #${shipping_cost}    Run Keyword If    ${shipping_cost}!=ฟรี    Get Substring    ${shipping_cost}    0    2
    #${shipping_cost}    Run Keyword If    ${shipping_cost}==ฟรี    Set Variable    0
    ${shipping_cost}    Convert To Integer    ${shipping_cost}
    ${include_shipping}=    Evaluate    ${exclude_shipping} + ${shipping_cost}
    ${include_shipping}=    Get Amount After
    Execute Javascript    ${payment_EW}.click()
    Click Element    ${btn_confirm_checkout}
    Wait Until Element Is Visible    ${wallet_cancel}
    Click Element    ${wallet_cancel}
    Run Keyword If    '${BROWSER}'=='ff'    Confirm Action
    Verify Thankyou Page Order Status    eWallet    Cancel
    Verify Order Reference    none    eWallet    Cancel
    Page Should Not Contain Element    ${btn_print}
    Page Should Not Contain Element    ${footer_bank}

TC_MC_04182
    [Documentation]    Place order - Counter Service order over 30000 baht
    [Tags]    Regression    Medium    mock
    ${result}=    Check Element    //a[@title='บัญชีของฉัน']
    Run Keyword If    '${result}'=='FAIL'    Go to Login    ${buyer_checkout}    ${buyer_checkout_pass}
    Delete All Product In Cart
    Go to    ${URL_LEVEL_D}/${robot_store1_more_price}?refresh=changeme
    Repeat Keyword    3 times    Execute Javascript    ${leveld_increase_js}.click()
    Wait Until Element Is Visible    ${Button_AddToCart}    ${EXPECT_LOADTIME}
    Click Element    ${Button_AddToCart}
    Wait Until Element Is Visible    ${btn_order}    ${EXPECT_LOADTIME}
    Click Element    ${btn_order}
    Click Checkout Button
    Execute Javascript    $("button:contains(เลือกที่อยู่จัดส่งนี้)")[0].click()
    Execute Javascript    ${payment_CS}.click()
    ${warning}=    Get Alert Message
    Should Contain    ${warning}    คุณไม่สามารถเลือกชำระเงินผ่านเคาน์เตอร์เซอร์วิสได้ เนื่องจากมียอดชำระเงินเกิน 30,001 บาท

TC_MC_04396
    [Documentation]    Order Summary have 1 product
    [Tags]    Medium    mock
    ${result}=    Check Element    //a[@title='บัญชีของฉัน']
    Run Keyword If    '${result}'=='FAIL'    Go to Login    ${buyer_checkout}    ${buyer_checkout_pass}
    Delete All Product In Cart
    Go to    ${URL_LEVEL_D}/${robot_stg_store1_2attr_3inv}?refresh=changeme
    Repeat Keyword    2 times    Execute Javascript    ${leveld_increase_js}.click()
    ${size}=    Selected Attribute    ขนาด    M
    ${color}=    Selected Attribute    สี    ดำ
    ${item1_name}=    Get Text    ${leveld_itemname}
    ${item1_price}=    Get Text    ${leveld_itemprice}
    ${item1_price}=    Remove String    ${item1_price}    ,
    ${item1_quantity}=    Get Value    ${leveld_quantity}
    ${item1_total}=    Evaluate    ${item1_price} * ${item1_quantity}
    ${item_shopname}=    Get Text    ${leveld_shopname}
    ${item_attr}=    Set Variable    ${size}${color}
    ${item_attr}=    Remove String    ${item_attr}    ${SPACE}
    Execute Javascript    ${addtocart}.click()
    Execute Javascript    ${gotocart}[0].click()
    Click Checkout Button
    ${item_detail}=    Create Dictionary    shopname=${item_shopname}    itemname1=${item1_name}    itemattr1=${item_attr}    itemqty1=${item1_quantity}    itemtotal1=${item1_total}    itemtype1=None
    Verify Step Summary    \    \    ${item_detail}
    ${select_adr_step2}=    Get Text    ${address_detail_step2}
    Execute Javascript    $("button:contains(เลือกที่อยู่จัดส่งนี้)")[0].click()
    ${select_adr_step3}=    Get Text    ${address_detail_step3}
    ${ship_adr_step2}=    Checkout Verify Shipping Address    ${select_adr_step2}
    ${ship_adr_step3}=    Checkout Verify Shipping Address    ${select_adr_step3}
    Should Be Equal    ${ship_adr_step2}    ${ship_adr_step3}
    Verify Step Summary    \    \    ${item_detail}
    Execute Javascript    ${shipping_ems}.click()
    Execute Javascript    ${payment_ATM}.click()
    Click Element    ${btn_confirm_checkout}
    Execute Javascript    ${thx_box_pay_sum_js}.click()
    Element Should Contain    ${thx_store_info}    ${item_shopname}
    ${thankyou_adr}    Get Text    ${thx_buyer_info}
    ${thankyou_adr}    Checkout Verify Shipping Address    ${thankyou_adr}
    Should Contain    ${thankyou_adr}    ${ship_adr_step3}
    Verify Thankyou Page Product Summary    \    ${item_detail}

TC_MC_04185
    [Documentation]    Order Summary have more than 1 product
    [Tags]    Regression    Medium    mock
    ${result}=    Check Element    //a[@title='บัญชีของฉัน']
    Run Keyword If    '${result}'=='FAIL'    Go to Login    ${buyer_checkout}    ${buyer_checkout_pass}
    Delete All Product In Cart
    Go to    ${URL_LEVEL_D}/${robot_store1_instock_type_new}?refresh=changeme
    Repeat Keyword    1 times    Execute Javascript    ${leveld_increase_js}.click()
    ${item1_name}=    Get Text    ${leveld_itemname}
    ${item1_price}=    Get Text    ${leveld_itemprice}
    ${item1_price}=    Remove String    ${item1_price}    ,
    ${item1_quantity}=    Get Value    ${leveld_quantity}
    ${item1_total}=    Evaluate    ${item1_price} * ${item1_quantity}
    Wait Until Element Is Visible    ${Button_AddToCart}    ${EXPECT_LOADTIME}
    Click Element    ${Button_AddToCart}
    Go to    ${URL_LEVEL_D}/${robot_stg_store1_instock_type_use}
    ${item2_name}=    Get Text    ${leveld_itemname}
    ${item2_price}=    Get Text    ${leveld_itemprice}
    ${item2_price}=    Remove String    ${item2_price}    ,
    ${item2_quantity}=    Get Value    ${leveld_quantity}
    ${item2_total}=    Evaluate    ${item2_price} * ${item2_quantity}
    Wait Until Element Is Visible    ${Button_AddToCart}    ${EXPECT_LOADTIME}
    Click Element    ${Button_AddToCart}
    Wait Until Element Is Visible    ${btn_order}    ${EXPECT_LOADTIME}
    Click Element    ${btn_order}
    Click Checkout Button
    ${item_detail}=    Create Dictionary    itemname1=${item1_name}    itemattr1=None    itemqty1=${item1_quantity}    itemtotal1=${item1_total}    itemtype1=None    itemname2=${item2_name}    itemattr2=None    itemqty2=${item2_quantity}    itemtotal2=${item2_total}    itemtype2=None
    Verify Step Summary    \    \    ${item_detail}
    ${select_adr_step2}=    Get Text    ${address_detail_step2}
    Execute Javascript    $("button:contains(เลือกที่อยู่จัดส่งนี้)")[0].click()
    ${select_adr_step3}=    Get Text    ${address_detail_step3}
    ${ship_adr_step2}=    Checkout Verify Shipping Address    ${select_adr_step2}
    ${ship_adr_step3}=    Checkout Verify Shipping Address    ${select_adr_step3}
    Should Be Equal    ${ship_adr_step2}    ${ship_adr_step3}
    Verify Step Summary    \    \    ${item_detail}
    Execute Javascript    ${payment_CS}.click()
    Click Element    ${btn_confirm_checkout}
    ## Insert sleep for click next page ##
    Sleep    3s
    Execute Javascript    ${thx_box_pay_sum_js}.click()
    ${thankyou_adr}    Get Text    ${thx_buyer_info}
    ${thankyou_adr}    Checkout Verify Shipping Address    ${thankyou_adr}
    Should Contain    ${thankyou_adr}    ${ship_adr_step3}
    Verify Thankyou Page Product Summary    \    ${item_detail}

TC_MC_04188
    [Documentation]    Place order FlashSale product before time
    [Tags]    Regression    SmokeTest    High    mock
    ${result}=    Check Element    //a[@title='บัญชีของฉัน']
    Run Keyword If    '${result}'=='FAIL'    Go to Login    ${buyer_checkout}    ${buyer_checkout_pass}
    Delete All Product In Cart
    #Execute Javascript    ${megamenu_flashsale}.click()
    #Execute Javascript    $('.wow-mainmenu')[1].click()
    # ${lnk_wow_page}    Get Element Attribute    //div[@class="wow-mainmenu"]/a@href
    Go to Next Wow Page
    Get DealZapp Product    robot_stg_store1 - สินค้า FlashSale 2
    ${url}    Get Location
    Go to    ${url}?refresh=changeme
    Wait Until Element Is Visible    ${leveld_itemprice}
    ${item1_price}=    Get Text    ${leveld_itemprice}
    ${flashsale_price}=    Get Text    //div[@class='inner-dealzapp']//span
    ${flashsale_price}=    Get Substring    ${flashsale_price}    \    -4
    #Execute Javascript    ${addtocart}.click()
    Wait Until Element Is Visible    ${Button_AddToCart}    ${EXPECT_LOADTIME}
    Click Element    ${Button_AddToCart}
    Wait Until Element Is Visible    ${btn_order}    ${EXPECT_LOADTIME}
    Click Element    ${btn_order}
    # Click Checkout Button
    #Wait Until Element Is Visible    ${item1_price}
    #Element Should Contain    ${cart_popup_sumprice}    ${item1_price}
    #Element Should Not Contain    ${cart_popup_sumprice}    ${flashsale_price}
    # Execute Javascript    ${gotocart}[0].click()
    Verify Item Don't Have Text Promotion On Cart Page    product_id=${robot_store1_flashsale2}
    Verify Item Total Price On Cart Page    product_id=${robot_store1_flashsale2}    expected_price=${item1_price}
    # Element Should Not Be Visible    ${cart_shop}${cart_product_list}${cart_product}${cart_boxitem}${cart_itemname}${cart_flashsale}
    # Element Should Contain    ${cart_shop}${cart_product_list}${cart_product}${cart_boxitemtotal}${cart_itemtotal}    ${item1_price}
    # Element Should Not Contain    ${cart_shop}${cart_product_list}${cart_product}${cart_boxitemtotal}${cart_itemtotal}    ${flashsale_price}
    Click To Checkout Wemall Item On Cart Page
    Wait Until Element Is Visible    //ul[@class='box-table-product-list']//li${order_summary_step_itemprice}    ${EXPECT_LOADTIME}
    Element Should Contain    //ul[@class='box-table-product-list']//li${order_summary_step_itemprice}    ${item1_price}
    Element Should Not Be Visible    //ul[@class='box-table-product-list']//li${order_summary_step_itemdetail}${order_summary_step_flashsale}
    Element Should Not Contain    //ul[@class='box-table-product-list']//li${order_summary_step_itemprice}    ${flashsale_price}
    Click To Default Shipping Address On Checkout Step 2
    Wait Until Element Is Visible    //ul[@class='box-table-product-list']//li${order_summary_step_itemprice}    ${EXPECT_LOADTIME}
    Element Should Contain    //ul[@class='box-table-product-list']//li${order_summary_step_itemprice}    ${item1_price}
    Element Should Not Be Visible    //ul[@class='box-table-product-list']//li${order_summary_step_itemdetail}${order_summary_step_flashsale}
    Element Should Not Contain    //ul[@class='box-table-product-list']//li${order_summary_step_itemprice}    ${flashsale_price}
    #Execute Javascript    ${shipping_ems}.click()
    Execute Javascript    ${payment_CS}.click()
    Click Element    ${btn_confirm_checkout}
    # Execute Javascript    ${thx_box_pay_sum_js}.click()
    Click To Display Summary Order Section On Thankyou Page
    Element Should Not Be Visible    ${thx_item_flashsale}
    Element Should Contain    ${thx_item_amt}    ${item1_price}
    Element Should Not Contain    ${thx_item_amt}    ${flashsale_price}

TC_MC_04190
    [Documentation]    Place order FlashSale product on time
    [Tags]    Regression    SmokeTest    High    mock
    ${result}=    Check Element    //a[@title='บัญชีของฉัน']
    Run Keyword If    '${result}'=='FAIL'    Go to Login    ${buyer_checkout}    ${buyer_checkout_pass}
    Delete All Product In Cart
    # Execute Javascript    ${megamenu_flashsale}.click()
    Go to Now Wow Page
    Get DealZapp Product    robot_stg_store1 - สินค้า FlashSale 1
    ${url}    Get Location
    Go to    ${url}?refresh=changeme
    Wait Until Element Is Visible    ${leveld_itemprice}
    ${item1_price}=    Get Text    ${leveld_itemprice}
    Wait Until Element Is Visible    ${Button_AddToCart}    ${EXPECT_LOADTIME}
    Click Element    ${Button_AddToCart}
    Wait Until Element Is Visible    ${btn_order}    ${EXPECT_LOADTIME}
    Click Element    ${btn_order}
    Verify Item Have Text Promotion On Cart Page    product_id=${robot_store1_flashsale1}
    Verify Item Total Price On Cart Page    product_id=${robot_store1_flashsale1}    expected_price=${item1_price}
    Click To Checkout Wemall Item On Cart Page
    Wait Until Element Is Visible    //ul[@class='box-table-product-list']//li${order_summary_step_itemprice}    ${EXPECT_LOADTIME}
    Element Should Contain    //ul[@class='box-table-product-list']//li${order_summary_step_itemprice}    ${item1_price}
    Element Should Be Visible    //ul[@class='box-table-product-list']//li${order_summary_step_itemdetail}${order_summary_step_flashsale}
    Click To Default Shipping Address On Checkout Step 2
    Wait Until Element Is Visible    //ul[@class='box-table-product-list']//li${order_summary_step_itemprice}    ${EXPECT_LOADTIME}
    Element Should Contain    //ul[@class='box-table-product-list']//li${order_summary_step_itemprice}    ${item1_price}
    Element Should Be Visible    //ul[@class='box-table-product-list']//li${order_summary_step_itemdetail}${order_summary_step_flashsale}
    # Execute Javascript    ${shipping_ems}.click()
    Execute Javascript    ${payment_CS}.click()
    Click Element    ${btn_confirm_checkout}
    ## Insert sleep for click next page ##
    Click To Display Summary Order Section On Thankyou Page
    # Execute Javascript    ${thx_box_pay_sum_js}.click()
    Wait Until Element Is Visible    ${thx_item_flashsale}    10s
    Element Should Be Visible    ${thx_item_flashsale}
    Element Should Contain    ${thx_item_amt}    ${item1_price}

TC_MC_04195
    [Documentation]    Place order product FlashSale and normal product and use promo code
    [Tags]    Regression    SmokeTest    High   mock
    ${result}=    Check Element    //a[@title='บัญชีของฉัน']
    Run Keyword If    '${result}'=='FAIL'    Go to Login    ${buyer_checkout}    ${buyer_checkout_pass}
    Delete All Product In Cart
    Go to Now Wow Page
    Get DealZapp Product    robot_stg_store2 - สินค้า FlashSale 3
    ${url}    Get Location
    Go to    ${url}?refresh=changeme
    ${item1_price}=    Get Text    ${leveld_itemprice}
    Wait Until Element Is Visible    ${Button_AddToCart}    ${EXPECT_LOADTIME}
    Click Element    ${Button_AddToCart}
    Wait Until Element Is Visible    ${btn_order}    ${EXPECT_LOADTIME}
    Click Element    ${btn_order}
    Go to    ${URL_LEVEL_D}/${robot_store2_instock_type_new}
    Repeat Keyword    1 times    Execute Javascript    ${leveld_increase_js}.click()
    Wait Until Element Is Visible    ${Button_AddToCart}    ${EXPECT_LOADTIME}
    Click Element    ${Button_AddToCart}
    Wait Until Element Is Visible    ${btn_order}    ${EXPECT_LOADTIME}
    Click Element    ${btn_order}
    Verify Item Have Text Promotion On Cart Page    product_id=${robot_store2_flashsale3}
    Verify Item Total Price On Cart Page    product_id=${robot_store2_flashsale3}    expected_price=${item1_price}
    # Element Should Be Visible    ${cart_shop}${cart_product_list}${cart_product}[2]${cart_boxitem}${cart_itemname}${cart_promotion}
    # Element Should Contain    ${cart_shop}${cart_product_list}${cart_product}[2]${cart_boxitemtotal}${cart_itemtotal}    ${item1_price}
    Click To Checkout Wemall Item On Cart Page
    Wait Until Element Is Visible    //ul[@class='box-table-product-list']//li[2]${order_summary_step_itemprice}    ${EXPECT_LOADTIME}
    Element Should Contain    //ul[@class='box-table-product-list']//li[2]${order_summary_step_itemprice}    ${item1_price}
    Element Should Be Visible    //ul[@class='box-table-product-list']//li[2]${order_summary_step_itemdetail}${order_summary_step_flashsale}
    Click To Default Shipping Address On Checkout Step 2
    Wait Until Element Is Visible    //ul[@class='box-table-product-list']//li[2]${order_summary_step_itemprice}    ${EXPECT_LOADTIME}
    Element Should Contain    //ul[@class='box-table-product-list']//li[2]${order_summary_step_itemprice}    ${item1_price}
    Element Should Be Visible    //ul[@class='box-table-product-list']//li[2]${order_summary_step_itemdetail}${order_summary_step_flashsale}
    Input Text    ${input_coupon}    ${promo_code}
    Click Element    ${coupon_btn}
    Wait Until Element Is Visible    ${coupon_error}
    Element Should Contain    ${coupon_error}    คูปองนี้ไม่สามารถใช้งานได้

# TC_MC_04283
#     [Documentation]    [CheckOut Step3] [ByCart] Verify display price leght type discount price and show badge Promotion name
#     [Tags]    Regression    Medium    mock
#     ${result}=    Check Element    //a[@title='บัญชีของฉัน']
#     Run Keyword If    '${result}'=='FAIL'    Go to Login    ${buyer_checkout}    ${buyer_checkout_pass}
#     Delete All Product In Cart
#     Go to    ${URL_LEVEL_D}/${robot_store1_promotion_cart_price_by_price}?refresh=changeme
#     Repeat Keyword    1 times    Execute Javascript    ${leveld_increase_js}.click()
#     ${item1_name}=    Get Text    ${leveld_itemname}
#     ${item1_price}=    Get Text    ${leveld_itemprice}
#     ${item1_price}=    Remove String    ${item1_price}    ,
#     ${item1_quantity}=    Get Value    ${leveld_quantity}
#     ${item1_total}=    Evaluate    ${item1_price} * ${item1_quantity}
#     ${item_shopname}=    Get Text    ${leveld_shopname}
#     ${promotion_name}    Get Text    ${leveld_name_promotion}
#     ${promotion_condition}    Get Promotion Discount Price Condition
#     Wait Until Element Is Visible    jquery=#btn-add-cart
#     Execute Javascript    ${addtocart}.click()
#     Execute Javascript    ${gotocart}[0].click()
#     ${item_detail}=    Create Dictionary    shopname=${item_shopname}    itemname1=${item1_name}    itemattr1=None    itemqty1=${item1_quantity}    itemtotal1=${item1_total}    itemtype1=${promotion_name}
#     ${cart_summary}    Get Promotion Price Summary
#     ${sum_promotion}    Get From Dictionary    ${cart_summary}    promotion
#     ${promotion_discount}    Verify Promotion Discount Price    ${promotion_condition}    ${sum_promotion}    ${promotion_name}
#     Click Checkout Button
#     Verify Step Summary    ${promotion_name}    ${promotion_discount}    ${item_detail}
#     Execute Javascript    $("button:contains(เลือกที่อยู่จัดส่งนี้)")[0].click()
#     Verify Step Summary    ${promotion_name}    ${promotion_discount}    ${item_detail}
#     Execute Javascript    ${shipping_post}.click()
#     Execute Javascript    ${payment_ATM}.click()
#     Click Element    ${btn_confirm_checkout}
#
# TC_MC_04284
#     [Documentation]    [CheckOut Step3] [ByCart] Verify display price leght type discount% and show badge Promotion name
#     [Tags]    Regression    Medium    mock
#     ${result}=    Check Element    //a[@title='บัญชีของฉัน']
#     Run Keyword If    '${result}'=='FAIL'    Go to Login    ${buyer_checkout}    ${buyer_checkout_pass}
#     Delete All Product In Cart
#     Go to    ${URL_LEVEL_D}/${robot_store1_promotion_cart_percent_by_price}?refresh=changeme
#     Repeat Keyword    1 times    Execute Javascript    ${leveld_increase_js}.click()
#     ${item1_name}=    Get Text    ${leveld_itemname}
#     ${item1_price}=    Get Text    ${leveld_itemprice}
#     ${item1_price}=    Remove String    ${item1_price}    ,
#     ${item1_quantity}=    Get Value    ${leveld_quantity}
#     ${item1_total}=    Evaluate    ${item1_price} * ${item1_quantity}
#     ${item_shopname}=    Get Text    ${leveld_shopname}
#     ${promotion_name}    Get Text    ${leveld_name_promotion}
#     ${promotion_condition}    Get Promotion Discount Percent Condition
#     Execute Javascript    ${addtocart}.click()
#     Execute Javascript    ${gotocart}[0].click()
#     ${item_detail}=    Create Dictionary    shopname=${item_shopname}    itemname1=${item1_name}    itemattr1=None    itemqty1=${item1_quantity}    itemtotal1=${item1_total}    itemtype1=${promotion_name}
#     ${cart_summary}    Get Promotion Price Summary
#     ${sum_promotion}    Get From Dictionary    ${cart_summary}    promotion
#     ${promotion_discount}    Verify Promotion Discount Percent    ${promotion_condition}    ${sum_promotion}    ${promotion_name}
#     Click Checkout Button
#     Verify Step Summary    ${promotion_name}    ${promotion_discount}    ${item_detail}
#     Execute Javascript    $("button:contains(เลือกที่อยู่จัดส่งนี้)")[0].click()
#     Verify Step Summary    ${promotion_name}    ${promotion_discount}    ${item_detail}
#     Execute Javascript    ${shipping_post}.click()
#     Execute Javascript    ${payment_ATM}.click()
#     Click Element    ${btn_confirm_checkout}
#
# TC_MC_04285
#     [Documentation]    [CheckOut Step3] [ByCart] Verify display piece leght type discount by price and show badge Promotion name
#     [Tags]    Regression    Medium    mock
#     ${result}=    Check Element    //a[@title='บัญชีของฉัน']
#     Run Keyword If    '${result}'=='FAIL'    Go to Login    ${buyer_checkout}    ${buyer_checkout_pass}
#     Delete All Product In Cart
#     Go to    ${URL_LEVEL_D}/${robot_store1_promotion_cart_price_by_qty}?refresh=changeme
#     Repeat Keyword    2 times    Execute Javascript    ${leveld_increase_js}.click()
#     ${item1_name}=    Get Text    ${leveld_itemname}
#     ${item1_price}=    Get Text    ${leveld_itemprice}
#     ${item1_price}=    Remove String    ${item1_price}    ,
#     ${item1_quantity}=    Get Value    ${leveld_quantity}
#     ${item1_total}=    Evaluate    ${item1_price} * ${item1_quantity}
#     ${item_shopname}=    Get Text    ${leveld_shopname}
#     ${promotion_name}    Get Text    ${leveld_name_promotion}
#     ${promotion_condition}    Get Promotion Discount Price Condition
#     Execute Javascript    ${addtocart}.click()
#     Execute Javascript    ${gotocart}[0].click()
#     ${item_detail}=    Create Dictionary    shopname=${item_shopname}    itemname1=${item1_name}    itemattr1=None    itemqty1=${item1_quantity}    itemtotal1=${item1_total}    itemtype1=${promotion_name}
#     ${cart_summary}    Get Promotion Quantity Summary
#     ${sum_promotion}    Get From Dictionary    ${cart_summary}    promotion
#     ${promotion_discount}    Verify Promotion Discount Price    ${promotion_condition}    ${sum_promotion}    ${promotion_name}
#     Click Checkout Button
#     Verify Step Summary    ${promotion_name}    ${promotion_discount}    ${item_detail}
#     Execute Javascript    $("button:contains(เลือกที่อยู่จัดส่งนี้)")[0].click()
#     Verify Step Summary    ${promotion_name}    ${promotion_discount}    ${item_detail}
#     Execute Javascript    ${shipping_post}.click()
#     Execute Javascript    ${payment_ATM}.click()
#     Click Element    ${btn_confirm_checkout}
#
# TC_MC_04286
#     [Documentation]    [CheckOut Step3] [ByCart] Verify display piece leght type discount% and show badge Promotion name
#     [Tags]    Regression    Medium    mock
#     ${result}=    Check Element    //a[@title='บัญชีของฉัน']
#     Run Keyword If    '${result}'=='FAIL'    Go to Login    ${buyer_checkout}    ${buyer_checkout_pass}
#     Delete All Product In Cart
#     Go to    ${URL_LEVEL_D}/${robot_store1_promotion_cart_percent_by_qty}?refresh=changeme
#     Repeat Keyword    4 times    Execute Javascript    ${leveld_increase_js}.click()
#     ${item1_name}=    Get Text    ${leveld_itemname}
#     ${item1_price}=    Get Text    ${leveld_itemprice}
#     ${item1_price}=    Remove String    ${item1_price}    ,
#     ${item1_quantity}=    Get Value    ${leveld_quantity}
#     ${item1_total}=    Evaluate    ${item1_price} * ${item1_quantity}
#     ${item_shopname}=    Get Text    ${leveld_shopname}
#     ${promotion_name}    Get Text    ${leveld_name_promotion}
#     ${promotion_condition}    Get Promotion Discount Percent Condition
#     Execute Javascript    ${addtocart}.click()
#     Execute Javascript    ${gotocart}[0].click()
#     ${item_detail}=    Create Dictionary    shopname=${item_shopname}    itemname1=${item1_name}    itemattr1=None    itemqty1=${item1_quantity}    itemtotal1=${item1_total}    itemtype1=${promotion_name}
#     ${cart_summary}    Get Promotion Quantity Summary
#     ${sum_promotion}    Get From Dictionary    ${cart_summary}    promotion
#     ${promotion_discount}    Verify Promotion Discount Percent    ${promotion_condition}    ${sum_promotion}    ${promotion_name}
#     Click Checkout Button
#     Verify Step Summary    ${promotion_name}    ${promotion_discount}    ${item_detail}
#     Execute Javascript    $("button:contains(เลือกที่อยู่จัดส่งนี้)")[0].click()
#     Verify Step Summary    ${promotion_name}    ${promotion_discount}    ${item_detail}
#     Execute Javascript    ${shipping_post}.click()
#     Execute Javascript    ${payment_ATM}.click()
#     Click Element    ${btn_confirm_checkout}
#
# TC_MC_04287
#     [Documentation]    [CheckOut Step3] [FlashSale] Verify display badge FlashSale under product name
#     [Tags]    Regression    Medium    mock
#     ${result}=    Check Element    //a[@title='บัญชีของฉัน']
#     Run Keyword If    '${result}'=='FAIL'    Go to Login    ${buyer_checkout}    ${buyer_checkout_pass}
#     Delete All Product In Cart
#     Execute Javascript    ${megamenu_flashsale}.click()
#     Get DealZapp Product    robot_stg_store1 - สินค้า FlashSale 1
#     ${url}    Get Location
#     Go to    ${url}?refresh=changeme
#     ${item1_name}=    Get Text    ${leveld_itemname}
#     ${item1_price}=    Get Text    ${leveld_itemprice}
#     ${item1_price}=    Remove String    ${item1_price}    ,
#     ${item1_quantity}=    Get Value    ${leveld_quantity}
#     ${item1_total}=    Evaluate    ${item1_price} * ${item1_quantity}
#     ${item_shopname}=    Get Text    ${leveld_shopname}
#     ${item_detail}=    Create Dictionary    shopname=${item_shopname}    itemname1=${item1_name}    itemattr1=None    itemqty1=${item1_quantity}    itemtotal1=${item1_total}    itemtype1=flashsale
#     Execute Javascript    ${addtocart}.click()
#     Execute Javascript    ${gotocart}[0].click()
#     Click Checkout Button
#     Verify Step Summary    \    \    ${item_detail}
#     Execute Javascript    $("button:contains(เลือกที่อยู่จัดส่งนี้)")[0].click()
#     Verify Step Summary    \    \    ${item_detail}
#     Execute Javascript    ${shipping_ems}.click()
#     Execute Javascript    ${payment_ATM}.click()
#     Click Element    ${btn_confirm_checkout}
#     Wait Until Element Is Visible    //*[@id="accordion"]/div[3]/a[2]
#     Click Element    //*[@id="accordion"]/div[3]/a[2]
#     Wait Until Element Is Visible    ${thx_item_flashsale}
#     Element Should Be Visible    ${thx_item_flashsale}
#
# TC_MC_04288
#     [Documentation]    [CheckOut Step3] [FlashSale] Verify price of FlashSale will not include discount promotion
#     [Tags]    Regression    Medium    mock
#     ${result}=    Check Element    //a[@title='บัญชีของฉัน']
#     Run Keyword If    '${result}'=='FAIL'    Go to Login    ${buyer_checkout}    ${buyer_checkout_pass}
#     Delete All Product In Cart
#     Go to    ${URL_PORTAL}
#     Execute Javascript    ${megamenu_flashsale}.click()
#     Get DealZapp Product    robot_stg_store1 - สินค้า Promotion & FlashSale
#     ${url}    Get Location
#     Go to    ${url}?refresh=changeme
#     ${item1_name}=    Get Text    ${leveld_itemname}
#     ${item1_price}=    Get Text    ${leveld_itemprice}
#     ${item1_price}=    Remove String    ${item1_price}    ,
#     ${item1_quantity}=    Get Value    ${leveld_quantity}
#     ${item1_total}=    Evaluate    ${item1_price} * ${item1_quantity}
#     ${item_shopname}=    Get Text    ${leveld_shopname}
#     Execute Javascript    ${addtocart}.click()
#     Execute Javascript    ${continue_shopping}[0].click()
#     Go to    ${URL_LEVEL_D}/${robot_store1_promotion_cart_price_by_price}?refresh=changeme
#     ${promotion_name}    Get Text    ${leveld_name_promotion}
#     ${promotion_condition}    Get Promotion Discount Price Condition
#     Selected Attribute    สี    น้ำเงิน
#     Selected Attribute    ขนาด    30
#     Repeat Keyword    1 times    Execute Javascript    ${leveld_increase_js}.click()
#     ${item2_name}=    Get Text    ${leveld_itemname}
#     ${item2_price}=    Get Text    ${leveld_itemprice}
#     ${item2_price}=    Remove String    ${item2_price}    ,
#     ${item2_quantity}=    Get Value    ${leveld_quantity}
#     ${item2_total}=    Evaluate    ${item2_price} * ${item2_quantity}
#     ${item_detail}=    Create Dictionary    shopname=${item_shopname}    itemname1=${item1_name}    itemattr1=None    itemqty1=${item1_quantity}    itemtotal1=${item1_total}    itemtype1=flashsale    itemname2=${item2_name}    itemattr2=None    itemqty2=${item2_quantity}    itemtotal2=${item2_total}    itemtype2=${promotion_name}
#     Execute Javascript    ${addtocart}.click()
#     Execute Javascript    ${gotocart}[0].click()
#     ${cart_summary}    Get Promotion Price Summary
#     ${sum_promotion}    Get From Dictionary    ${cart_summary}    promotion
#     ${promotion_discount}    Verify Promotion Discount Price    ${promotion_condition}    ${sum_promotion}    ${promotion_name}
#     Click Checkout Button
#     Verify Step Summary    ${promotion_name}    ${promotion_discount}    ${item_detail}
#     Execute Javascript    $("button:contains(เลือกที่อยู่จัดส่งนี้)")[0].click()
#     Verify Step Summary    ${promotion_name}    ${promotion_discount}    ${item_detail}
#     Execute Javascript    ${shipping_post}.click()
#     Execute Javascript    ${payment_ATM}.click()
#     Click Element    ${btn_confirm_checkout}
#
# TC_MC_04289
#     [Documentation]    [CheckOut Step3] Other product not in promotion will not calculate include with promotion
#     [Tags]    Regression    Medium    mock
#     ${result}=    Check Element    //a[@title='บัญชีของฉัน']
#     Run Keyword If    '${result}'=='FAIL'    Go to Login    ${buyer_checkout}    ${buyer_checkout_pass}
#     Delete All Product In Cart
#     Go to    ${URL_LEVEL_D}/${robot_store1_instock_type_new}?refresh=changeme
#     ${item1_name}=    Get Text    ${leveld_itemname}
#     ${item1_price}=    Get Text    ${leveld_itemprice}
#     ${item1_price}=    Remove String    ${item1_price}    ,
#     ${item1_quantity}=    Get Value    ${leveld_quantity}
#     ${item1_total}=    Evaluate    ${item1_price} * ${item1_quantity}
#     ${item_shopname}=    Get Text    ${leveld_shopname}
#     Execute Javascript    ${addtocart}.click()
#     Execute Javascript    ${continue_shopping}[0].click()
#     Go to    ${URL_LEVEL_D}/${robot_store1_promotion_cart_price_by_price}?refresh=changeme
#     ${promotion_name}    Get Text    ${leveld_name_promotion}
#     ${promotion_condition}    Get Promotion Discount Price Condition
#     Selected Attribute    สี    น้ำเงิน
#     Selected Attribute    ขนาด    30
#     Repeat Keyword    1 times    Execute Javascript    ${leveld_increase_js}.click()
#     ${item2_name}=    Get Text    ${leveld_itemname}
#     ${item2_price}=    Get Text    ${leveld_itemprice}
#     ${item2_price}=    Remove String    ${item2_price}    ,
#     ${item2_quantity}=    Get Value    ${leveld_quantity}
#     ${item2_total}=    Evaluate    ${item2_price} * ${item2_quantity}
#     ${item_detail}=    Create Dictionary    shopname=${item_shopname}    itemname1=${item1_name}    itemattr1=None    itemqty1=${item1_quantity}    itemtotal1=${item1_total}    itemtype1=None    itemname2=${item2_name}    itemattr2=None    itemqty2=${item2_quantity}    itemtotal2=${item2_total}    itemtype2=${promotion_name}
#     Execute Javascript    ${addtocart}.click()
#     Execute Javascript    ${gotocart}[0].click()
#     ${cart_summary}    Get Promotion Price Summary
#     ${sum_promotion}    Get From Dictionary    ${cart_summary}    promotion
#     Verify Promotion Discount Price    ${promotion_condition}    ${sum_promotion}    ${promotion_name}
#     ${promotion_discount}    Verify Promotion Discount Price    ${promotion_condition}    ${sum_promotion}    ${promotion_name}
#     Click Checkout Button
#     Verify Step Summary    ${promotion_name}    ${promotion_discount}    ${item_detail}
#     Execute Javascript    $("button:contains(เลือกที่อยู่จัดส่งนี้)")[0].click()
#     Verify Step Summary    ${promotion_name}    ${promotion_discount}    ${item_detail}
#     Execute Javascript    ${shipping_post}.click()
#     Execute Javascript    ${payment_ATM}.click()
#     Click Element    ${btn_confirm_checkout}
#
# TC_MC_04300
#     [Documentation]    [CheckOut ThankU][ByCart] Display summary promotion name and condition promotion
#     [Tags]    Regression    Medium    mock
#     ${result}=    Check Element    //a[@title='บัญชีของฉัน']
#     Run Keyword If    '${result}'=='FAIL'    Go to Login    ${buyer_checkout}    ${buyer_checkout_pass}
#     Delete All Product In Cart
#     Go to    ${URL_LEVEL_D}/${robot_store1_promotion_cart_percent_by_price}?refresh=changeme
#     Repeat Keyword    2 times    Execute Javascript    ${leveld_increase_js}.click()
#     ${item1_name}=    Get Text    ${leveld_itemname}
#     ${item1_price}=    Get Text    ${leveld_itemprice}
#     ${item1_price}=    Remove String    ${item1_price}    ,
#     ${item1_quantity}=    Get Value    ${leveld_quantity}
#     ${item1_total}=    Evaluate    ${item1_price} * ${item1_quantity}
#     ${item_shopname}=    Get Text    ${leveld_shopname}
#     ${promotion_name}    Get Text    ${leveld_name_promotion}
#     ${promotion_condition}    Get Promotion Discount Percent Condition
#     ${condition_text}    Get Promotion Percent Match Condition    ${promotion_condition}    ${item1_total}
#     Execute Javascript    ${addtocart}.click()
#     Execute Javascript    ${gotocart}[0].click()
#     ${item_detail}=    Create Dictionary    shopname=${item_shopname}    itemname1=${item1_name}    itemattr1=None    itemqty1=${item1_quantity}    itemtotal1=${item1_total}    itemtype1=${promotion_name}
#     ${cart_summary}    Get Promotion Price Summary
#     ${sum_promotion}    Get From Dictionary    ${cart_summary}    promotion
#     ${promotion_discount}    Verify Promotion Discount Percent    ${promotion_condition}    ${sum_promotion}    ${promotion_name}
#     Click Checkout Button
#     ## Insert sleep for click next page ##
#     Sleep    3s
#     Execute Javascript    $("button:contains(เลือกที่อยู่จัดส่งนี้)")[0].click()
#     ${exclude_shipping}=    Get Amount Before
#     Execute Javascript    ${shipping_post}.click()
#     ${shipping_cost}    Execute Javascript    return ${post_cost}.text()
#     ${shipping_cost}=    Check Shipping Cost    ${shipping_cost}
#     Execute Javascript    ${payment_ATM}.click()
#     Click Element    ${btn_confirm_checkout}
#     ## Insert sleep for click next page ##
#     Sleep    3s
#     Execute Javascript    ${thx_box_pay_sum_js}.click()
#     Verify Thankyou Page Product Summary    \    ${item_detail}
#     ${netamt}=    Verify Thankyou Page Order Summary    ${exclude_shipping}    Promotion    ${promotion_name}    ${promotion_discount}    ${shipping_cost}
#     Element Should Contain    ${thx_promotion_detail}//span    ${promotion_name}
#     ${thx_promotion_condition}    Get Text    ${thx_promotion_detail}
#     ${thx_promotion_condition}    Remove String Using Regexp    ${thx_promotion_condition}    \n+
#     ${thx_promotion_condition}    Remove String    ${thx_promotion_condition}    ${promotion_name}    ${SPACE}
#     ${condition_text}    Remove String    ${condition_text}    ${SPACE}
#     Should Contain    ${condition_text}    ${thx_promotion_condition}
#     Verify Order Reference    ${netamt}    ATM
#
# TC_MC_04301
#     [Documentation]    [CheckOut ThankU][ByCart]Display summary total price and total discount promotion
#     [Tags]    Regression    Medium    mock
#     ${result}=    Check Element    //a[@title='บัญชีของฉัน']
#     Run Keyword If    '${result}'=='FAIL'    Go to Login    ${buyer_checkout}    ${buyer_checkout_pass}
#     Delete All Product In Cart
#     Go to    ${URL_LEVEL_D}/${robot_store1_promotion_cart_price_by_price}?refresh=changeme
#     Repeat Keyword    2 times    Execute Javascript    ${leveld_increase_js}.click()
#     ${item1_name}=    Get Text    ${leveld_itemname}
#     ${item1_price}=    Get Text    ${leveld_itemprice}
#     ${item1_price}=    Remove String    ${item1_price}    ,
#     ${item1_quantity}=    Get Value    ${leveld_quantity}
#     ${item1_total}=    Evaluate    ${item1_price} * ${item1_quantity}
#     ${item_shopname}=    Get Text    ${leveld_shopname}
#     ${promotion_name}    Get Text    ${leveld_name_promotion}
#     ${promotion_condition}    Get Promotion Discount Price Condition
#     ${condition_text}    Get Promotion Price Match Condition    ${promotion_condition}    ${item1_total}
#     Execute Javascript    ${addtocart}.click()
#     Execute Javascript    ${gotocart}[0].click()
#     ${item_detail}=    Create Dictionary    shopname=${item_shopname}    itemname1=${item1_name}    itemattr1=None    itemqty1=${item1_quantity}    itemtotal1=${item1_total}    itemtype1=${promotion_name}
#     ${cart_summary}    Get Promotion Price Summary
#     ${sum_promotion}    Get From Dictionary    ${cart_summary}    promotion
#     ${promotion_discount}    Verify Promotion Discount Price    ${promotion_condition}    ${sum_promotion}    ${promotion_name}
#     Click Checkout Button
#     ## Insert sleep for click next page ##
#     Sleep    3s
#     Execute Javascript    $("button:contains(เลือกที่อยู่จัดส่งนี้)")[0].click()
#     ${exclude_shipping}=    Get Amount Before
#     Execute Javascript    ${shipping_post}.click()
#     ${shipping_cost}    Execute Javascript    return ${post_cost}.text()
#     ${shipping_cost}=    Check Shipping Cost    ${shipping_cost}
#     Execute Javascript    ${payment_ATM}.click()
#     Click Element    ${btn_confirm_checkout}
#     ## Insert sleep for click next page ##
#     Sleep    3s
#     Execute Javascript    ${thx_box_pay_sum_js}.click()
#     Verify Thankyou Page Product Summary    \    ${item_detail}
#     ${netamt}=    Verify Thankyou Page Order Summary    ${exclude_shipping}    Promotion    ${promotion_name}    ${promotion_discount}    ${shipping_cost}
#     Element Should Contain    ${thx_promotion_detail}//span    ${promotion_name}
#     Element Should Contain    ${thx_promotion_detail}    ${condition_text}
#     Verify Order Reference    ${netamt}    ATM

# TC_MC_04341
#     [Documentation]    [CheckOut Step2] [Seller Promotion] Verify price leght type discount price and show badge Promotion name
#     [Tags]    Regression    Medium    mock
#     ${result}=    Check Element    //a[@title='บัญชีของฉัน']
#     Run Keyword If    '${result}'=='FAIL'    Go to Login    ${buyer_checkout}    ${buyer_checkout_pass}
#     Delete All Product In Cart
#     Go to    ${URL_LEVEL_D}/${robot_stg_store1_sellerpromotion}?refresh=changeme
#     Repeat Keyword    4 times    Execute Javascript    ${leveld_increase_js}.click()
#     ${item1_name}=    Get Text    ${leveld_itemname}
#     ${item1_price}=    Get Text    ${leveld_itemprice}
#     ${item1_price}=    Remove String    ${item1_price}    ,
#     ${item1_quantity}=    Get Value    ${leveld_quantity}
#     ${item1_total}=    Evaluate    ${item1_price} * ${item1_quantity}
#     ${item_shopname}=    Get Text    ${leveld_shopname}
#     ${promotion_name}    Get Text    ${leveld_name_promotion}
#     ${promotion_condition}    Get Promotion Discount Percent Condition
#     Wait Until Element Is Visible    jquery=#btn-add-cart
#     Execute Javascript    ${addtocart}.click()
#     Execute Javascript    ${gotocart}[0].click()
#     ${item_detail}=    Create Dictionary    shopname=${item_shopname}    itemname1=${item1_name}    itemattr1=None    itemqty1=${item1_quantity}    itemtotal1=${item1_total}    itemtype1=${promotion_name}
#     ${cart_summary}    Get Promotion Price Summary
#     ${sum_promotion}    Get From Dictionary    ${cart_summary}    promotion
#     ${promotion_discount}    Verify Promotion Discount Percent    ${promotion_condition}    ${sum_promotion}    ${promotion_name}
#     Click Checkout Button
#     Verify Step Summary    ${promotion_name}    ${promotion_discount}    ${item_detail}
#
# TC_MC_04342
#     [Documentation]    [CheckOut Step2] [Seller Promotion] Verify price leght type discount% and show badge Promotion name
#     [Tags]    Regression    Medium    mock
#     ${result}=    Check Element    //a[@title='บัญชีของฉัน']
#     Run Keyword If    '${result}'=='FAIL'    Go to Login    ${buyer_checkout}    ${buyer_checkout_pass}
#     Delete All Product In Cart
#     Go to    ${URL_LEVEL_D}/${robot_stg_store1_sellerpromotion}?refresh=changeme
#     Repeat Keyword    4 times    Execute Javascript    ${leveld_increase_js}.click()
#     ${item1_name}=    Get Text    ${leveld_itemname}
#     ${item1_price}=    Get Text    ${leveld_itemprice}
#     ${item1_price}=    Remove String    ${item1_price}    ,
#     ${item1_quantity}=    Get Value    ${leveld_quantity}
#     ${item1_total}=    Evaluate    ${item1_price} * ${item1_quantity}
#     ${item_shopname}=    Get Text    ${leveld_shopname}
#     ${promotion_name}    Get Text    ${leveld_name_promotion}
#     ${promotion_condition}    Get Promotion Discount Percent Condition
#     Wait Until Element Is Visible    jquery=#btn-add-cart
#     Execute Javascript    ${addtocart}.click()
#     Execute Javascript    ${gotocart}[0].click()
#     ${item_detail}=    Create Dictionary    shopname=${item_shopname}    itemname1=${item1_name}    itemattr1=None    itemqty1=${item1_quantity}    itemtotal1=${item1_total}    itemtype1=${promotion_name}
#     ${cart_summary}    Get Promotion Price Summary
#     ${sum_promotion}    Get From Dictionary    ${cart_summary}    promotion
#     ${promotion_discount}    Verify Promotion Discount Percent    ${promotion_condition}    ${sum_promotion}    ${promotion_name}
#     Click Checkout Button
#     Verify Step Summary    ${promotion_name}    ${promotion_discount}    ${item_detail}

# TC_MC_04343
#     [Documentation]    [CheckOut Step3] [Seller Promotion] Verify display price leght type discount price and show badge Promotion name
#     [Tags]    Regression    Medium    Checkout-Web   mock
#     ${result}=    Check Element    //a[@title='บัญชีของฉัน']
#     Run Keyword If    '${result}'=='FAIL'    Go to Login    ${buyer_checkout}    ${buyer_checkout_pass}
#     Delete All Product In Cart
#     Go to    ${URL_LEVEL_D}/${robot_stg_store1_sellerpromotion}?refresh=changeme
#     Repeat Keyword    4 times    Execute Javascript    ${leveld_increase_js}.click()
#     ${item1_name}=    Get Text    ${leveld_itemname}
#     ${item1_price}=    Get Text    ${leveld_itemprice}
#     ${item1_price}=    Remove String    ${item1_price}    ,
#     ${item1_quantity}=    Get Value    ${leveld_quantity}
#     ${item1_total}=    Evaluate    ${item1_price} * ${item1_quantity}
#     ${item_shopname}=    Get Text    ${leveld_shopname}
#     ${promotion_name}    Get Text    ${leveld_name_promotion}
#     ${promotion_condition}    Get Promotion Discount Percent Condition
#     Wait Until Element Is Visible    jquery=#btn-add-cart
#     Execute Javascript    ${addtocart}.click()
#     Execute Javascript    ${gotocart}[0].click()
#     ${item_detail}=    Create Dictionary    shopname=${item_shopname}    itemname1=${item1_name}    itemattr1=None    itemqty1=${item1_quantity}    itemtotal1=${item1_total}    itemtype1=${promotion_name}
#     ${cart_summary}    Get Promotion Price Summary
#     ${sum_promotion}    Get From Dictionary    ${cart_summary}    promotion
#     ${promotion_discount}    Verify Promotion Discount Percent    ${promotion_condition}    ${sum_promotion}    ${promotion_name}
#     Click Checkout Button
#     Verify Step Summary    ${promotion_name}    ${promotion_discount}    ${item_detail}
#     Execute Javascript    $("button:contains(เลือกที่อยู่จัดส่งนี้)")[0].click()
#     Verify Step Summary    ${promotion_name}    ${promotion_discount}    ${item_detail}
#     Execute Javascript    ${shipping_post}.click()
#     Execute Javascript    ${payment_ATM}.click()
#     Click Element    ${btn_confirm_checkout}
#
# TC_MC_04344
#     [Documentation]    [CheckOut Step3] [Seller Promotion] Verify display price leght type discount% and show badge Promotion name
#     [Tags]    Regression    Medium    Checkout-Web    mock
#     ${result}=    Check Element    //a[@title='บัญชีของฉัน']
#     Run Keyword If    '${result}'=='FAIL'    Go to Login    ${buyer_checkout}    ${buyer_checkout_pass}
#     Delete All Product In Cart
#     Go to    ${URL_LEVEL_D}/${robot_stg_store1_sellerpromotion}?refresh=changeme
#     Repeat Keyword    4 times    Execute Javascript    ${leveld_increase_js}.click()
#     ${item1_name}=    Get Text    ${leveld_itemname}
#     ${item1_price}=    Get Text    ${leveld_itemprice}
#     ${item1_price}=    Remove String    ${item1_price}    ,
#     ${item1_quantity}=    Get Value    ${leveld_quantity}
#     ${item1_total}=    Evaluate    ${item1_price} * ${item1_quantity}
#     ${item_shopname}=    Get Text    ${leveld_shopname}
#     ${promotion_name}    Get Text    ${leveld_name_promotion}
#     ${promotion_condition}    Get Promotion Discount Percent Condition
#     Wait Until Element Is Visible    jquery=#btn-add-cart
#     Execute Javascript    ${addtocart}.click()
#     Execute Javascript    ${gotocart}[0].click()
#     ${item_detail}=    Create Dictionary    shopname=${item_shopname}    itemname1=${item1_name}    itemattr1=None    itemqty1=${item1_quantity}    itemtotal1=${item1_total}    itemtype1=${promotion_name}
#     ${cart_summary}    Get Promotion Price Summary
#     ${sum_promotion}    Get From Dictionary    ${cart_summary}    promotion
#     ${promotion_discount}    Verify Promotion Discount Percent    ${promotion_condition}    ${sum_promotion}    ${promotion_name}
#     Click Checkout Button
#     Verify Step Summary    ${promotion_name}    ${promotion_discount}    ${item_detail}
#     Execute Javascript    $("button:contains(เลือกที่อยู่จัดส่งนี้)")[0].click()
#     Verify Step Summary    ${promotion_name}    ${promotion_discount}    ${item_detail}
#     Execute Javascript    ${shipping_post}.click()
#     Execute Javascript    ${payment_ATM}.click()
#     Click Element    ${btn_confirm_checkout}
#
# TC_MC_04349
#     [Documentation]    [CheckOut ThankU][Seller Promotion]Display summary total price and total discount promotion
#     [Tags]    Regression    Medium    Checkout-Web    mock
#     ${result}=    Check Element    //a[@title='บัญชีของฉัน']
#     Run Keyword If    '${result}'=='FAIL'    Go to Login    ${buyer_checkout}    ${buyer_checkout_pass}
#     Delete All Product In Cart
#     Go to    ${URL_LEVEL_D}/${robot_stg_store2_sellerpromotion}?refresh=changeme
#     Repeat Keyword    4 times    Execute Javascript    ${leveld_increase_js}.click()
#     ${item1_name}=    Get Text    ${leveld_itemname}
#     ${item1_price}=    Get Text    ${leveld_itemprice}
#     ${item1_price}=    Remove String    ${item1_price}    ,
#     ${item1_quantity}=    Get Value    ${leveld_quantity}
#     ${item1_total}=    Evaluate    ${item1_price} * ${item1_quantity}
#     ${item_shopname}=    Get Text    ${leveld_shopname}
#     ${promotion_name}    Get Text    ${leveld_name_promotion}
#     ${promotion_condition}    Get Promotion Discount Price Condition
#     ${condition_text}    Get Promotion Price Match Condition    ${promotion_condition}    ${item1_total}
#     Wait Until Element Is Visible    jquery=#btn-add-cart
#     Execute Javascript    ${addtocart}.click()
#     Execute Javascript    ${gotocart}[0].click()
#     ${item_detail}=    Create Dictionary    shopname=${item_shopname}    itemname1=${item1_name}    itemattr1=None    itemqty1=${item1_quantity}    itemtotal1=${item1_total}    itemtype1=${promotion_name}
#     ${cart_summary}    Get Promotion Price Summary
#     ${sum_promotion}    Get From Dictionary    ${cart_summary}    promotion
#     ${promotion_discount}    Verify Promotion Discount Price    ${promotion_condition}    ${sum_promotion}    ${promotion_name}
#     Click Checkout Button
#     ## Insert sleep for click next page ##
#     Sleep    3s
#     Execute Javascript    $("button:contains(เลือกที่อยู่จัดส่งนี้)")[0].click()
#     ${exclude_shipping}=    Get Amount Before
#     Execute Javascript    ${shipping_post}.click()
#     ${shipping_cost}    Execute Javascript    return ${post_cost}.text()
#     ${shipping_cost}=    Check Shipping Cost    ${shipping_cost}
#     Execute Javascript    ${payment_ATM}.click()
#     Click Element    ${btn_confirm_checkout}
#     ## Insert sleep for click next page ##
#     Sleep    3s
#     Execute Javascript    ${thx_box_pay_sum_js}.click()
#     Verify Thankyou Page Product Summary    \    ${item_detail}
#     ${netamt}=    Verify Thankyou Page Order Summary    ${exclude_shipping}    Promotion    ${promotion_name}    ${promotion_discount}    ${shipping_cost}
#     ${thx_promotion_desc}    Get Text    ${thx_promotion_detail}
#     ${thx_promotion_desc}    Remove String    ${thx_promotion_desc}    .00
#     Should Contain    ${thx_promotion_desc}    ${promotion_name}
#     Should Contain    ${thx_promotion_desc}    ${condition_text}
#     Verify Order Reference    ${netamt}    ATM
#
# TC_MC_04400
#     [Documentation]    Place order product (shop status beware)
#     [Tags]    Regression    High    mock
#     Open and Prepare Data
#    	Run Keywords    Execute Javascript    $('#home_modal').css("display", "none")    AND    Execute Javascript    $('.modal-backdrop.fade.in').hide()    AND    Clear Active Login
#     ${result}=    Check Element    //a[@title='บัญชีของฉัน']
#     Run Keyword If    '${result}'=='FAIL'    Go to Login    ${buyer_checkout}    ${buyer_checkout_pass}
#     Delete All Product In Cart
#     Go to    ${URL_LEVEL_D}/${robot_blockstore1_instock_type_new}?refresh=changeme
#     Sleep    1
#     Repeat Keyword    2 times    Execute Javascript    ${leveld_increase_js}.click()
#     ${item1_name}=    Get Text    ${leveld_itemname}
#     ${item1_price}=    Get Text    ${leveld_itemprice}
#     ${item1_price}=    Remove String    ${item1_price}    ,
#     ${item1_quantity}=    Get Value    ${leveld_quantity}
#     ${item1_total}=    Evaluate    ${item1_price} * ${item1_quantity}
#     ${item_shopname}=    Get Text    ${leveld_shopname}
#     Sleep    1
#     Execute Javascript    ${addtocart}.click()
#     Sleep    1
#     Execute Javascript    ${gotocart}[0].click()
#     Click Checkout Button
#     Sleep    1
#     ${item_detail}=    Create Dictionary    shopname=${item_shopname}    itemname1=${item1_name}    itemattr1=None    itemqty1=${item1_quantity}    itemtotal1=${item1_total}    itemtype1=None
#     Verify Step Summary    \    \    ${item_detail}
#     ${previous_url}    Get Location
#     Execute Javascript    window.open('${URL_PORTAL}')
#     Sleep    1
#     Select Window    title=Weloveshopping - ซื้อของออนไลน์ ขายของออนไลน์ สะดวก ปลอดภัย
#     BuyerKeyword.Go to WMS
#     Change Shop Product Status    shop    ${blockstore_id1}    beware
#     Go to    ${URL_WMS}/logout
#     Close Window
#     Select Window    url=${previous_url}
#     Execute Javascript    $("button:contains(เลือกที่อยู่จัดส่งนี้)")[0].click()
#     Sleep    1
#     Verify Step Summary    \    \    ${item_detail}
#     Go to    ${URL_PORTAL}
#     Sleep    0.5s
#     BuyerKeyword.Go to WMS
#     Change Shop Product Status    shop    ${blockstore_id1}    normal
#     Go to    ${URL_WMS}/logout
#     Go to    ${URL_PORTAL}
#
# TC_MC_04405
#     [Documentation]    Place order product (shop status warning)
#     [Tags]    Regression    High    mock
#     Open and Prepare Data
#    	Run Keywords    Execute Javascript    $('#home_modal').css("display", "none")    AND    Execute Javascript    $('.modal-backdrop.fade.in').hide()    AND    Clear Active Login
#     ${result}=    Check Element    //a[@title='บัญชีของฉัน']
#     Run Keyword If    '${result}'=='FAIL'    Go to Login    ${buyer_checkout}    ${buyer_checkout_pass}
#     Delete All Product In Cart
#     Go to    ${URL_LEVEL_D}/${robot_blockstore1_instock_type_new}?refresh=changeme
#     Sleep    1
#     Execute Javascript    ${leveld_increase_js}.click()
#     Sleep    1
#     Execute Javascript    ${addtocart}.click()
#     Sleep    1
#     Execute Javascript    ${gotocart}[0].click()
#     Click Checkout Button
#     Sleep    0.3s
#     ${previous_url}    Get Location
#     Execute Javascript    window.open('${URL_PORTAL}')
#     Select Window    title=Weloveshopping - ซื้อของออนไลน์ ขายของออนไลน์ สะดวก ปลอดภัย
#     BuyerKeyword.Go to WMS
#     Change Shop Product Status    shop    ${blockstore_id1}    warning
#     Go to    ${URL_WMS}/logout
#     Close Window
#     Select Window    url=${previous_url}
#     Execute Javascript    $("button:contains(เลือกที่อยู่จัดส่งนี้)")[0].click()
#     Element Should Be Visible    //div[@class='msg-product-checkout']
#     Element Should Contain    //div[@class='msg-product-checkout']    ขออภัยค่ะ ในระหว่างที่คุณทำการสั่งซื้อ
#     Element Should Contain    //div[@class='msg-product-checkout']    มีสินค้าบางรายการหมด หรือไม่พร้อมจำหน่าย
#     Element Should Contain    //div[@class='msg-product-checkout']    กรุณากลับไปที่ตะกร้าสินค้า เพื่อลบรายการสินค้า
#     Click Element    //button[@class='btn btn-con']
#     Location Should Be    ${URL_PORTAL}/cart
#     Go to    ${URL_PORTAL}
#     Sleep    0.5s
#     BuyerKeyword.Go to WMS
#     Change Shop Product Status    shop    ${blockstore_id1}    normal
#     Go to    ${URL_WMS}/logout
#     Go to    ${URL_PORTAL}
#
# TC_MC_04406
#     [Documentation]    Place order product (shop status blocked)
#     [Tags]    Regression    High    mock
#     Open and Prepare Data
#    	Run Keywords    Execute Javascript    $('#home_modal').css("display", "none")    AND    Execute Javascript    $('.modal-backdrop.fade.in').hide()    AND    Clear Active Login
#     ${result}=    Check Element    //a[@title='บัญชีของฉัน']
#     Run Keyword If    '${result}'=='FAIL'    Go to Login    ${buyer_checkout}    ${buyer_checkout_pass}
#     Delete All Product In Cart
#     Go to    ${URL_LEVEL_D}/${robot_blockstore1_instock_type_new}?refresh=changeme
#     Sleep    1
#     Execute Javascript    ${leveld_increase_js}.click()
#     Sleep    1
#     Execute Javascript    ${addtocart}.click()
#     Sleep    1
#     Execute Javascript    ${gotocart}[0].click()
#     Click Checkout Button
#     Sleep    0.3s
#     ${previous_url}    Get Location
#     Execute Javascript    window.open('${URL_PORTAL}')
#     Select Window    title=Weloveshopping - ซื้อของออนไลน์ ขายของออนไลน์ สะดวก ปลอดภัย
#     BuyerKeyword.Go to WMS
#     Change Shop Product Status    shop    ${blockstore_id1}    blocked
#     Go to    ${URL_WMS}/logout
#     Close Window
#     Select Window    url=${previous_url}
#     Execute Javascript    $("button:contains(เลือกที่อยู่จัดส่งนี้)")[0].click()
#     Element Should Be Visible    //div[@class='msg-product-checkout']
#     Element Should Contain    //div[@class='msg-product-checkout']    ขออภัยค่ะ ในระหว่างที่คุณทำการสั่งซื้อ
#     Element Should Contain    //div[@class='msg-product-checkout']    มีสินค้าบางรายการหมด หรือไม่พร้อมจำหน่าย
#     Element Should Contain    //div[@class='msg-product-checkout']    กรุณากลับไปที่ตะกร้าสินค้า เพื่อลบรายการสินค้า
#     Click Element    //button[@class='btn btn-con']
#     Location Should Be    ${URL_PORTAL}/cart
#     Go to    ${URL_PORTAL}
#     Sleep    0.5s
#     BuyerKeyword.Go to WMS
#     Change Shop Product Status    shop    ${blockstore_id1}    normal
#     Go to    ${URL_WMS}/logout
#     Go to    ${URL_PORTAL}
#
# TC_MC_04407
#     [Documentation]    Place order product (product status ปิด by admin)
#     [Tags]    Regression    High    mock
#     ${result}=    Check Element    //a[@title='บัญชีของฉัน']
#     Run Keyword If    '${result}'=='FAIL'    Go to Login    ${buyer_checkout}    ${buyer_checkout_pass}
#     Delete All Product In Cart
#     Go to    ${URL_LEVEL_D}/${robot_blockstore1_instock_type_new}?refresh=changeme
#     Execute Javascript    ${leveld_increase_js}.click()
#     Wait Until Element Is Visible    jquery=#btn-add-cart
#     Execute Javascript    ${addtocart}.click()
#     Execute Javascript    ${gotocart}[0].click()
#     Click Checkout Button
#     ${previous_url}    Get Location
#     Execute Javascript    window.open('${URL_PORTAL}')
#     Select Window    title=Weloveshopping - ซื้อของออนไลน์ ขายของออนไลน์ สะดวก ปลอดภัย
#     #BuyerKeyword.Go to WMS
#     WMS Switch Project    wls
#     Change Shop Product Status    product    ${robot_blockstore1_instock_type_new}    ปิด
#     Go to    ${URL_WMS}/logout
#     Close Window
#     Select Window    url=${previous_url}
#     Execute Javascript    $("button:contains(เลือกที่อยู่จัดส่งนี้)")[0].click()
#     Element Should Be Visible    //div[@class='msg-product-checkout']
#     Element Should Contain    //div[@class='msg-product-checkout']    ขออภัยค่ะ ในระหว่างที่คุณทำการสั่งซื้อ
#     Element Should Contain    //div[@class='msg-product-checkout']    มีสินค้าบางรายการหมด หรือไม่พร้อมจำหน่าย
#     Element Should Contain    //div[@class='msg-product-checkout']    กรุณากลับไปที่ตะกร้าสินค้า เพื่อลบรายการสินค้า
#     Click Element    //button[@class='btn btn-con']
#     Location Should Be    ${URL_PORTAL}/cart
#     Go to    ${URL_PORTAL}
#     WMS Switch Project    wls
#     Change Shop Product Status    product    ${robot_blockstore1_instock_type_new}    แสดง
#     Go to    ${URL_WMS}/logout
#
# TC_MC_04408
#     [Documentation]    Place order product (product status ไม่ผ่านการตรวจสอบ)
#     [Tags]    Regression    High    mock
#     ${result}=    Check Element    //a[@title='บัญชีของฉัน']
#     Run Keyword If    '${result}'=='FAIL'    Go to Login    ${buyer_checkout}    ${buyer_checkout_pass}
#     Delete All Product In Cart
#     Go to    ${URL_LEVEL_D}/${robot_blockstore1_instock_type_new}?refresh=changeme
#     Execute Javascript    ${leveld_increase_js}.click()
#     Wait Until Element Is Visible    jquery=#btn-add-cart
#     Execute Javascript    ${addtocart}.click()
#     Execute Javascript    ${gotocart}[0].click()
#     Click Checkout Button
#     ${previous_url}    Get Location
#     Execute Javascript    window.open('${URL_PORTAL}')
#     Select Window    title=Weloveshopping - ซื้อของออนไลน์ ขายของออนไลน์ สะดวก ปลอดภัย
#     WMS Switch Project    wls
#     Change Shop Product Status    product    ${robot_blockstore1_instock_type_new}    ไม่ผ่านการตรวจสอบ
#     Go to    ${URL_WMS}/logout
#     Close Window
#     Select Window    url=${previous_url}
#     Execute Javascript    $("button:contains(เลือกที่อยู่จัดส่งนี้)")[0].click()
#     Element Should Be Visible    //div[@class='msg-product-checkout']
#     Element Should Contain    //div[@class='msg-product-checkout']    ขออภัยค่ะ ในระหว่างที่คุณทำการสั่งซื้อ
#     Element Should Contain    //div[@class='msg-product-checkout']    มีสินค้าบางรายการหมด หรือไม่พร้อมจำหน่าย
#     Element Should Contain    //div[@class='msg-product-checkout']    กรุณากลับไปที่ตะกร้าสินค้า เพื่อลบรายการสินค้า
#     Click Element    //button[@class='btn btn-con']
#     Location Should Be    ${URL_PORTAL}/cart
#     Go to    ${URL_PORTAL}
#     WMS Switch Project    wls
#     Change Shop Product Status    product    ${robot_blockstore1_instock_type_new}    ผ่านการตรวจสอบ
#     Go to    ${URL_WMS}/logout
#
# TC_MC_04409
#     [Documentation]    Use PromoCode status ซ่อน on levelD
#     [Tags]    Regression    Medium    mock
#     ${result}=    Check Element    //a[@title='บัญชีของฉัน']
#     Run Keyword If    '${result}'=='FAIL'    Go to Login    ${buyer_checkout}    ${buyer_checkout_pass}
#     Delete All Product In Cart
#     Go to    ${URL_LEVEL_D}/${robot_stg_store2_instock_type_new}?refresh=changeme
#     Repeat Keyword    1 times    Execute Javascript    ${leveld_increase_js}.click()
#     Wait Until Element Is Visible    jquery=#btn-add-cart
#     Execute Javascript    ${addtocart}.click()
#     Execute Javascript    ${gotocart}[0].click()
#     Click Checkout Button
#     Wait Until Element Is Visible    jquery=button:contains(เลือกที่อยู่จัดส่งนี้)
#     Execute Javascript    $("button:contains(เลือกที่อยู่จัดส่งนี้)")[0].click()
#     Wait Until Element Is Visible    ${input_coupon}
#     Input Text    ${input_coupon}    ${promo_code_hide}
#     Click Element    ${coupon_btn}
#     Element Should Contain    ${coupon_condition}    จาก ${promo_name_hide}
#     Element Should Contain    ${coupon_condition}    เมื่อซื้อครบ 100 บาท
#     Element Should Contain    ${coupon_discount}    -10.00 บาท
#     ${exclude_promo}=    Get Amount Before
#     ${include_promo}=    Evaluate    ${exclude_promo} - 10
#     ${net_amount}=    Get Amount After
#     Should Be Equal    ${net_amount}    ${include_promo}
#
# TC_MC_04410
#     [Documentation]    Use PromoCode expried
#     [Tags]    Regression    Medium    mock
#     ${result}=    Check Element    //a[@title='บัญชีของฉัน']
#     Run Keyword If    '${result}'=='FAIL'    Go to Login    ${buyer_checkout}    ${buyer_checkout_pass}
#     Delete All Product In Cart
#     Go to    ${URL_LEVEL_D}/${robot_stg_store2_instock_type_new}?refresh=changeme
#     Repeat Keyword    1 times    Execute Javascript    ${leveld_increase_js}.click()
#     Wait Until Element Is Visible    jquery=#btn-add-cart
#     Execute Javascript    ${addtocart}.click()
#     Execute Javascript    ${gotocart}[0].click()
#     Click Checkout Button
#     Wait Until Element Is Visible    jquery=button:contains(เลือกที่อยู่จัดส่งนี้)
#     Execute Javascript    $("button:contains(เลือกที่อยู่จัดส่งนี้)")[0].click()
#     Wait Until Element Is Visible    ${input_coupon}
#     Input Text    ${input_coupon}    ${promo_code_expired}
#     Click Element    ${coupon_btn}
#     Element Should Contain    ${coupon_expired}    คูปองนี้หมดอายุแล้ว
#
# TC_MC_04418
#     [Documentation]    [CheckOut ThankU][Promotion]Display remark when place order with flashsale product and promotion product
#     [Tags]    Regression    Medium    mock
#     ${result}=    Check Element    //a[@title='บัญชีของฉัน']
#     Run Keyword If    '${result}'=='FAIL'    Go to Login    ${buyer_checkout}    ${buyer_checkout_pass}
#     Delete All Product In Cart
#     Execute Javascript    ${megamenu_flashsale}.click()
#     Get DealZapp Product    robot_stg_store1 - สินค้า FlashSale 1
#     ${url}    Get Location
#     Go to    ${url}?refresh=changeme
#     Wait Until Element Is Visible    jquery=#btn-add-cart
#     Execute Javascript    ${addtocart}.click()
#     Go to    ${URL_LEVEL_D}/${robot_store1_promotion_cart_percent_by_price}
#     Repeat Keyword    2 times    Execute Javascript    ${leveld_increase_js}.click()
#     Execute Javascript    ${addtocart}.click()
#     Execute Javascript    ${gotocart}[0].click()
#     Click Checkout Button
#     Wait Until Element Is Visible    jquery=button:contains(เลือกที่อยู่จัดส่งนี้)
#     Execute Javascript    $("button:contains(เลือกที่อยู่จัดส่งนี้)")[0].click()
#     ${exclude_shipping}=    Get Amount Before
#     Execute Javascript    ${shipping_post}.click()
#     ${shipping_cost}    Execute Javascript    return ${post_cost}.text()
#     ${shipping_cost}=    Check Shipping Cost    ${shipping_cost}
#     Execute Javascript    ${payment_ATM}.click()
#     Click Element    ${btn_confirm_checkout}
#     ## Insert sleep for click next page ##
#     Sleep    3s
#     Execute Javascript    ${thx_box_pay_sum_js}.click()
#     Element Should Contain    //div[@class='box-order-sum']//div[@class='box-promotion-remark']//p    หมายเหตุ : สินค้า  Flash Sale ไม่สามารถใช้ร่วมกับรายการส่งเสริมการขายอื่นๆได้
#     Element Should Be Visible    ${thx_promotion_detail}//span
#
# TC_MC_04419
#     [Documentation]    Place order complete then back to home page
#     [Tags]    Regression    Medium    mock
#     ${result}=    Check Element    //a[@title='บัญชีของฉัน']
#     Run Keyword If    '${result}'=='FAIL'    Go to Login    ${buyer_checkout}    ${buyer_checkout_pass}
#     Delete All Product In Cart
#     Go to    ${URL_LEVEL_D}/${robot_store1_instock_type_new}?refresh=changeme
#     Wait Until Element Is Visible    jquery=#btn-add-cart
#     Execute Javascript    ${addtocart}.click()
#     Execute Javascript    ${gotocart}[0].click()
#     Click Checkout Button
#     Wait Until Element Is Visible    jquery=button:contains(เลือกที่อยู่จัดส่งนี้)
#     Execute Javascript    $("button:contains(เลือกที่อยู่จัดส่งนี้)")[0].click()
#     Execute Javascript    ${shipping_ems}.click()
#     Execute Javascript    ${payment_bankcounter}.click()
#     Click Element    ${btn_confirm_checkout}
#     Wait Until Element Is Visible    ${gotohome_from_checkout}    60s
#     Click Element    ${gotohome_from_checkout}
#     Wait Until Element Is Visible    ${home_hilight_box}    60s
#     Element Should Be Visible    ${home_hilight_box}
#
# TC_MC_04420
#     [Documentation]    Place order complete then go to order detail page
#     [Tags]    Regression    Medium    mock
#     ${result}=    Check Element    //a[@title='บัญชีของฉัน']
#     Run Keyword If    '${result}'=='FAIL'    Go to Login    ${buyer_checkout}    ${buyer_checkout_pass}
#     Delete All Product In Cart
#     Go to    ${URL_LEVEL_D}/${robot_store1_instock_type_new}?refresh=changeme
#     Wait Until Element Is Visible    jquery=#btn-add-cart
#     Execute Javascript    ${addtocart}.click()
#     Execute Javascript    ${gotocart}[0].click()
#     Click Checkout Button
#     Wait Until Element Is Visible    jquery=button:contains(เลือกที่อยู่จัดส่งนี้)
#     Execute Javascript    $("button:contains(เลือกที่อยู่จัดส่งนี้)")[0].click()
#     Execute Javascript    ${shipping_ems}.click()
#     Execute Javascript    ${payment_Ibanks}.click()
#     Click Element    ${btn_confirm_checkout}
#     Wait Until Element Is Visible    ${gotoorder_detail_from_checkout}    60s
#     ${order_id}    Get Element Attribute    //div[@class='order-list']@data-order-id
#     Click Element    ${gotoorder_detail_from_checkout}
#     Wait Until Element Is Visible    //div[@class='orderid-and-date']//strong    60s
#     ${order_his_url}    Get Location
#     Should Be True    '${order_his_url}' == '${URL_ACCOUNT}/profile/report/orderdetail/${order_id}'
#     Element Should Contain    //div[@class='orderid-and-date']//strong    ${order_id}

TC_MC_12455
    [Documentation]    [Wemall][WeFresh][Desktop] Verify can Place order - COD - Wefresh Shop
    [Tags]    Checkout-Web    Checkout    PlaceOrder    Wefresh    Regression    High
    ${payment_channel}    Set Variable    COD
    ${shipping_cost}    Set Variable    0
    ${address}    Set Variable    wefresh_buyer01@mailinator.com
    ${result}=    Check Element    //a[@title='บัญชีของฉัน']
    Run Keyword If    '${result}'=='FAIL'    Go to Login    ${wefresh_buyer01_username}    ${wefresh_buyer01_password}
    Delete All Product In Cart
    Go to    ${URL_LEVEL_D}/${robot_wefresh_product}
    Add Product To Cart And Confirm To Cart Page
    Click To Checkout Wefresh Item On Cart Page    ${wefresh_store_id01}
    Select Shipping Address By Email On Checkout Step 2    ${address}
    ${exclude_shipping}=    Get Amount Before
    # ${shipping_cost}    Get Text    ${lbl_shpping_total}
    Element Should Contain    ${lbl_shpping_total}    ฟรี
    ${include_shipping}=    Get Amount After
    Select Payment Channel On Checkout Step 3    ${payment_channel}
    Click Element    ${btn_confirm_checkout}
    Verify Thankyou Page Order Status    ${payment_channel}
    ${netamt}=    Verify Thankyou Page Order Summary    ${exclude_shipping}    None    \    \    ${shipping_cost}
    Verify Order Reference    ${netamt}    COD

TC_MC_12448
    [Documentation]    [Desktop][WeFresh]  Verify cannot Edit existing address which unsupporting shipping area and in limit order time for placing order which have only WeFresh product
    [Tags]    Checkout-Web    Checkout    Address    WeFreshAddress    Regression    Medium
    ${result}=    Check Element    //a[@title='บัญชีของฉัน']
    ${invalid_address}    Set Variable    wefresh01_buyer01@mailinator.com
    Run Keyword If    '${result}'=='FAIL'    Go to Login    ${wefresh_buyer01_username}    ${wefresh_buyer01_password}
    Delete All Product In Cart
    Go to    ${URL_LEVEL_D}/${robot_wefresh_product}
    Add Product To Cart And Confirm To Cart Page
    Click To Checkout Wefresh Item On Cart Page    ${wefresh_store_id01}
    Select Shipping Address By Email On Checkout Step 2    ${invalid_address}
    Verify Select Invalid Address For Wefresh On Checkout Step 2
    Click Button Back To Cart From Alert Invalid Address

TC_MC_12449
    [Documentation]    [Desktop][WeFresh] Verify cannot placing order WeFresh product when select existing address which in supporting shipping area but not in limit order time
    [Tags]    Checkout-Web    Checkout    Address    WeFreshAddress    Regression    Medium
    ${result}=    Check Element    //a[@title='บัญชีของฉัน']
    ${address}    Set Variable    wefresh_buyer01@mailinator.com
    Run Keyword If    '${result}'=='FAIL'    Go to Login    ${wefresh_buyer01_username}    ${wefresh_buyer01_password}
    Delete All Product In Cart
    Go to    ${URL_LEVEL_D}/${robot_wefresh_shop_closed}
    Add Product To Cart And Confirm To Cart Page
    Click To Checkout Wefresh Item On Cart Page    ${wefresh_closed_store_id}
    Select Shipping Address By Email On Checkout Step 2    ${address}
    Verify Place Order Out of Time Service For Wefresh On Checkout Step 2
    Click Button Back To Cart From Alert Invalid Time
