*** Settings ***
Suite Teardown    Close All Browsers
Test Teardown     Close Browser
Force Tags        Wemall-Mobile
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Mobile_LevelD.robot
Resource          ../../../../Keyword/Common/Mobile_Home.robot
Resource          ../../../../Resource/WeMall/WebElement/Freebie.txt
Resource          ../../../../Keyword/Common/Freebie.txt
Resource          ../../../../Resource/WeMall/MobileElement/LevelD.robot
Resource          ../../../../Keyword/Common/Checkout.txt

*** Test Cases ***
TC_MC_06150
    [Documentation]    [Lv.D][Mobile] Picture - Out of stock
    [Tags]    Regression    Ligo    Sprint2017MC17
    Mobile_LevelD.Go to Product Level D Page    ${test_out_of_stock}
    Mobile_LevelD.Sold Out Label Should Be Appeared

TC_MC_06151
    [Documentation]    [Lv.D][Mobile] Price - Digit
    [Tags]    Regression    Ligo    Sprint2017MC17
    [Template]    Validate Price Digit
    ${test_price_leading_zero}          234.05 บาท
    ${test_price_decimal_point_1}       222.99 บาท
    ${test_price_decimal_point_2}       2,222.70 บาท

TC_MC_06152
    [Documentation]    [Lv.D][Mobile] Price - Single price - No Discount
    [Tags]    Regression    Ligo    Sprint2017MC17
    Mobile_LevelD.Go to Product Level D Page    ${test_price_normal_price}
    Mobile_LevelD.Get Product Price    3,455 บาท
    Mobile_LevelD.Compare Price Should Not Be Appeared

TC_MC_06153
    [Documentation]    [Lv.D][Mobile] Price - Single price - Discount
    [Tags]    Regression    Ligo    Sprint2017MC17
    Mobile_LevelD.Go to Product Level D Page    ${test_price_discount_price}
    Mobile_LevelD.Get Product Price    5,999 บาท
    Mobile_LevelD.Compare Price Should Be Appeared    12,345 บาท

TC_MC_06157
    [Documentation]    [Lv.D][Mobile] Quantity - Number of stock > 10 pieces
    [Tags]    Regression    Ligo    Sprint2017MC17
    Mobile_LevelD.Go to Product Level D Page    ${test_stock_more}
    Mobile_LevelD.Select Product Quantity    11
    Mobile_LevelD.Quantity Alert Message Should Not Be Appeared    11
    Mobile_LevelD.Increase Product Quantity
    Mobile_LevelD.Quantity Alert Message Should Be Appeared    11
    Mobile_LevelD.Decrease Product Quantity
    Mobile_LevelD.Quantity Alert Message Should Not Be Appeared    11

TC_MC_06158
    [Documentation]    [Lv.D][Mobile] Quantity - Number of stock = 10 pieces
    [Tags]    Regression    Ligo    Sprint2017MC17
    Mobile_LevelD.Go to Product Level D Page    ${test_stock_less}
    Mobile_LevelD.Select Product Quantity    11
    Mobile_LevelD.Less Stock Warning Message Should Be Appeared

TC_MC_06168
    [Documentation]    [Lv.D][Mobile] Promotion - Single Promotion - Everyday WOW - Now WOW
    [Tags]    Regression    Ligo    Sprint2017MC17
    Mobile_LevelD.Go to Product Level D Page    ${test_now_wow}
    Mobile_LevelD.Now WOW Logo Should Be Appeared

TC_MC_06171
    [Documentation]    [Lv.D][Mobile] Promotion - Single Promotion - Everyday WOW - Next WOW
    [Tags]    Regression    Ligo    Sprint2017MC17
    Mobile_LevelD.Go to Product Level D Page    ${test_next_wow}
    Mobile_LevelD.Next WOW Logo Should Be Appeared

TC_MC_06173
    [Documentation]    [Lv.D][Mobile] Promotion - Single Promotion - Seller Promotion - Discount Baht
    [Tags]    Regression    Ligo    Sprint2017MC17
    Mobile_LevelD.Go to Product Level D Page    ${test_seller_pro_thb}
    Mobile_LevelD.Seller Promotion Box Should Be Appeared
    Mobile_LevelD.Seller Promotion Name Should Be Appeared          Seller Promotion - THB Discount
    Mobile_LevelD.Seller Promotion Discount Should Be Appeared      ซื้อสินค้าตั้งแต่ 2,000 บาทขึ้นไป ลดเพิ่ม 222 บาท
    Mobile_LevelD.Seller Promotion Shop Name Should Be Appeared     wemallshoptest1
    Mobile_LevelD.Seller Promotion Period Should Be Appeared        ระยะเวลาโปรโมชั่น: 1 ก.พ. 2561 (00:00 น.) - 4 ส.ค. 2562 (23:59 น.)

TC_MC_06174
    [Documentation]    [Lv.D][Mobile] Promotion - Single Promotion - Seller Promotion - Discount Baht - Out of stock
    [Tags]    Regression    Ligo    Sprint2017MC17
    Mobile_LevelD.Go to Product Level D Page    ${test_seller_pro_thb_soldout}
    Mobile_LevelD.Sold Out Label Should Be Appeared
    Mobile_LevelD.Seller Promotion Box Should Be Disappeared

TC_MC_06175
    [Documentation]    [Lv.D][Mobile] Promotion - Single Promotion - Seller Promotion - Discount Percent
    [Tags]    Regression    Ligo    Sprint2017MC17    SmokeTest
    Mobile_LevelD.Go to Product Level D Page    ${test_seller_pro_percent}
    Mobile_LevelD.Seller Promotion Box Should Be Appeared
    Mobile_LevelD.Seller Promotion Name Should Be Appeared          Seller Promotion - Percent Discount
    Mobile_LevelD.Seller Promotion Discount Should Be Appeared      ซื้อสินค้าตั้งแต่ 2,000 บาทขึ้นไป ลดเพิ่ม 22% ลดสูงสุดไม่เกิน 555 บาท
    Mobile_LevelD.Seller Promotion Shop Name Should Be Appeared     ${sellerpromotion_shop1}
    Mobile_LevelD.Seller Promotion Period Should Be Appeared        ${sellerpromotion_period}

TC_MC_06176
    [Documentation]    [Lv.D][Mobile] Promotion - Single Promotion - Seller Promotion - Discount Percent - Out of stock
    [Tags]    Ligo    Sprint2017MC17
    Mobile_LevelD.Go to Product Level D Page    ${test_seller_pro_percent_soldout}
    Mobile_LevelD.Sold Out Label Should Be Appeared
    Mobile_LevelD.Seller Promotion Box Should Be Disappeared

TC_MC_06194
    [Documentation]    [Lv.D][Mobile] Campaign - By Item - Price - เปอร์เซ็นต์ส่วนลด (%)
    [Tags]    Regression    Ligo    Sprint2017MC17
    Mobile_LevelD.Go to Product Level D Page    ${robot_stg_store1_promotion_item_percent}
    Mobile_LevelD.Get Product Price    400 บาท
    Mobile_LevelD.Compare Price Should Be Appeared    500 บาท

TC_MC_06195
    [Documentation]    [Lv.D][Mobile] Campaign - By Item - Price - กำหนดราคา (บาท)
    [Tags]    Regression    Ligo    Sprint2017MC17
    Mobile_LevelD.Go to Product Level D Page    ${robot_stg_store2_test_promotion_item2}
    Mobile_LevelD.Get Product Price    99 บาท
    Mobile_LevelD.Compare Price Should Be Appeared    500 บาท

TC_MC_06198
    [Documentation]    [Lv.D][Mobile] Attribute - Product option is available
    [Tags]    Regression    Ligo    Sprint2017MC17
    Mobile_LevelD.Go to Product Level D Page    ${robot_stg_store1_2attr_3inv}
    Mobile_LevelD.Attribute Section Should Be Appeared    เลือกขนาด
    Mobile_LevelD.Attribute Option Should Be Appeared    S
    Mobile_LevelD.Attribute Option Should Be Appeared    M
    Mobile_LevelD.Select Attribute Option    S
    Mobile_LevelD.Attribute Option Is Selected    S

TC_MC_06199
    [Documentation]    [Lv.D][Mobile] Attribute - Some product option is unavailable
    [Tags]    Regression    Ligo    Sprint2017MC17
    Mobile_LevelD.Go to Product Level D Page    ${test_attr_unavailable}
    Mobile_LevelD.Select Attribute Option     ครีม
    Mobile_LevelD.Attribute Option Is Disabled    S

TC_MC_06201
    [Documentation]    [Lv.D][Mobile] Attribute - Not Select Option
    [Tags]    Regression    Ligo    Sprint2017MC17
    Mobile_LevelD.Go to Product Level D Page    ${robot_stg_store1_2attr_3inv}
    Mobile_LevelD.Click on Add To Cart Button
    Mobile_LevelD.Error Message Should Be Appeared    *กรุณาเลือกสี
    Mobile_LevelD.Error Message Should Be Appeared    *กรุณาเลือกขนาด

TC_MC_06204
    [Documentation]    [Lv.D][Mobile] รายละเอียดสินค้า - Has only property information - More than 6 property
    [Tags]    Regression    Ligo    Sprint2017MC17
    [Setup]    Open Product Property Section    ${test_property}
    [Template]    Validate Product Property
    Brand                  zara
    แบรนด์                 TEST-1
    TestRequired           22222222222
    TestTextNotMoreThan    3
    TEST-1                 TEST-1
    Style                  11111111111
    TestNumberEqual        3
    TestDate               2018-01-31

TC_MC_06208
    [Documentation]    [Lv.D][Mobile] Recommend Product - Shop Name
    [Tags]    Regression    Ligo    Sprint2017MC17
    Mobile_LevelD.Go to Product Level D Page    ${test_price_normal_price}
    Mobile_LevelD.Recommend Product Section Should Be Appeared    wemallshoptest1

TC_MC_06226
    [Documentation]    [Lv.D][Mobile] Add To Cart - Popup - Has Attribute
    [Tags]    Regression    Ligo    Sprint2017MC17
    Mobile_LevelD.Go to Product Level D Page    ${test_attr_unavailable}
    Mobile_LevelD.Select Attribute Option    XXS
    Mobile_LevelD.Select Attribute Option    ขาว
    Mobile_LevelD.Click on Add To Cart Button
    Mobile_LevelD.Confirmation Popup Should Be Appeared
    Mobile_LevelD.On Popup, Product Name Is Populated Correctly    [Automate] Attribute Option
    Mobile_LevelD.On Popup, Product Option Is Populated Correctly    สี    ขาว
    Mobile_LevelD.On Popup, Product Option Is Populated Correctly    ขนาด    XXS
    Mobile_LevelD.On Popup, Product Quantity Is Populated Correctly    1
    Mobile_LevelD.On Popup, Product Price Is Populated Correctly    200 บาท

TC_MC_06227
    [Documentation]    [Lv.D][Mobile] Add To Cart - Popup - ดูสินค้าต่อ
    [Tags]    Regression    Ligo    Sprint2017MC17
    Mobile_LevelD.Go to Product Level D Page    ${test_attr_unavailable}
    Mobile_LevelD.Select Attribute Option    ขาว
    Mobile_LevelD.Select Attribute Option    S
    Mobile_LevelD.Click on Add To Cart Button
    Mobile_LevelD.Confirmation Popup Should Be Appeared
    Mobile_LevelD.Click ดูสินค้าต่อ Button
    Mobile_LevelD.Confirmation Popup Should Not Be Appeared

TC_MC_06228
    [Documentation]    [Lv.D][Mobile] Add To Cart - Popup - สั่งซื้อสินค้า
    [Tags]    Regression    Ligo    Sprint2017MC17
    Mobile_LevelD.Go to Product Level D Page    ${test_attr_unavailable}
    Mobile_LevelD.Select Attribute Option    ขาว
    Mobile_LevelD.Select Attribute Option    S
    Mobile_LevelD.Click on Add To Cart Button
    Mobile_LevelD.Confirmation Popup Should Be Appeared
    Mobile_LevelD.Click สั่งซื้อสินค้า Button
    Mobile_Home.ตะกร้าสินค้า page should be appeared

TC_MC_06229
    [Documentation]    [Lv.D][Mobile] Add To Cart - Popup - X-out
    [Tags]    Regression    Ligo    Sprint2017MC17
    Mobile_LevelD.Go to Product Level D Page    ${test_attr_unavailable}
    Mobile_LevelD.Select Attribute Option    ขาว
    Mobile_LevelD.Select Attribute Option    S
    Mobile_LevelD.Click on Add To Cart Button
    Mobile_LevelD.Confirmation Popup Should Be Appeared
    Mobile_LevelD.Click X-out To Close Popup
    Mobile_LevelD.Confirmation Popup Should Not Be Appeared

TC_MC_10860
    [Documentation]    [Mobile] Verify the product's image with the freebie tag on product detail page when promotion status is available
    [Tags]    Regression    Ligo    Sprint2017MC17
    Go to Product Level D Page    ${test_kamu_b}
    Validate freebie promotion correctly displayed



TC_MC_12084
    [Documentation]    [WM][Mobile]Verify TruePoint thumbnail for main Product image on Level D page
    [Tags]    Regression    High
    Open Mobile Browser
    Go To Level D Mobile Page    product_id_with_truepoint_promotion
    Verify TruePoint Thumbnail    exist

TC_MC_12086
    [Documentation]    Verify TruePoint button on Level D page
    [Tags]    Regression    High
    Open Mobile Browser
    Go To Level D Mobile Page    product_id_with_truepoint_promotion
    Verify TruePoint Button    exist

TC_MC_12087
    [Documentation]    Verify product's price on Level D page
    [Tags]    Regression    High
    Open Mobile Browser
    Go To Level D Mobile Page    product_id_with_truepoint_promotion
    Verify Additional Line For TruePoint Product    exist

TC_MC_12088
    [Documentation]    Verify Level D page which product is in TruePoint and Freebie promotion
    [Tags]    Regression    High
    Open Mobile Browser
    Go To Level D Mobile Page    product_id_with_truepoint_and_freebie_promotion
    Validate freebie promotion correctly displayed on level D
    Verify TruePoint Thumbnail    exist
    Verify TruePoint Button    exist
    Verify Additional Line for TruePoint Product    exist

TC_MC_12089
    [Documentation]    Verify Level D page which some product's attribute is not in TruePoint promotion (multiple SKUs testing)
    [Tags]    Regression    High
    Open Mobile Browser
    Go To Level D Mobile Page    product_id_multiple_sku_and_some_product_with_truepoint_product
    Verify TruePoint Thumbnail    exist
    Verify Additional Line for TruePoint Product    notexist
    Select Level D Product    normal
    Verify TruePoint Thumbnail    notexist
    Verify TruePoint Button    notexist
    Verify Additional Line for TruePoint Product    notexist
    Select Level D Product    truepoint
    Verify TruePoint Thumbnail    exist
    Verify Additional Line for TruePoint Product    exist
    Verify TruePoint Button    exist

TC_MC_12093
    [Documentation]    Verify alert message at Level D page when Cart is not empty
    [Tags]    Regression    High
    Open Mobile Browser
    Delete All Product In Cart Mobile
    Go To Level D Mobile Page    product_id_multiple_sku_and_some_product_with_truepoint_product
    Select Level D Product    normal
    Click on Add To Cart Button
    Confirmation Popup Should Be Appeared
    Click ดูสินค้าต่อ Button
    Select Level D Product    truepoint
    Click TruePoint Button On Level D Page
    Verify Level D TruePoint Alert Message    yes
    Click Continue On TruePoint Alert Message
    Delete All Product In Cart Mobile

TC_MC_12094
    [Documentation]    Verify no alert message at Level D page when Cart is empty
    [Tags]    Regression    High
    Open Mobile Browser
    Delete All Product In Cart Mobile
    Go To Level D Mobile Page    product_id_with_truepoint_promotion
    Click TruePoint Button On Level D Page
    Verify Level D TruePoint Alert Message    no
    Delete All Product In Cart Mobile

TC_MC_12095
    [Documentation]    Verify no alert message at Level D page when Cart has TruePoint product and add another normal product
    [Tags]    Regression    High
    Open Mobile Browser
    Delete All Product In Cart Mobile
    Go To Level D Mobile Page    product_id_with_truepoint_promotion
    Click TruePoint Button On Level D Page
    Verify Level D TruePoint Alert Message    no
    Go To Level D Mobile Page    product_id_multiple_sku_and_some_product_with_truepoint_product
    Select Level D Product    normal
    Click Add to Cart And Go to Cart
    Verify Level D TruePoint Alert Message    no
    Delete All Product In Cart Mobile


*** Keywords ***
Validate Price Digit
    [Arguments]    ${productID}    ${expectedPrice}
    Mobile_LevelD.Go to Product Level D Page    ${productID}
    Mobile_LevelD.Get Product Price    ${expectedPrice}
    [Teardown]    Capture Page Screenshot

Open Product Property Section
    [Arguments]    ${test_property}
    Mobile_LevelD.Go to Product Level D Page    ${test_property}
    Mobile_LevelD.Click on รายละเอียดสินค้า tab
    Mobile_LevelD.Product Property Section Should Be Appeared
    Mobile_LevelD.Click On แสดงข้อมูลเพิ่มเติม Link

Validate Product Property
    [Arguments]    ${propertyName}    ${expectedPropertyValue}
    Mobile_LevelD.Property Value Should Be Populated    ${propertyName}    ${expectedPropertyValue}

