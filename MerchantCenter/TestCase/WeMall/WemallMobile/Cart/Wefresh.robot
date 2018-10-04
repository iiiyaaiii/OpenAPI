*** Settings ***
Suite Setup    Open Custom Browser    ${URL_PORTAL}    Mobile
Test Setup     Checkout.Delete All Product In Cart Mobile
Suite Teardown    Close All Browsers
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Keyword/Common/Mobile_LevelD.robot
Resource          ../../../../Keyword/Common/Mobile_Cart.robot
Resource          ../../../../Keyword/Common/Checkout.txt

*** Variables ***
${product_nonefresh_sellerpromotion}    L91201533
${product_nonefresh_supperpoint}    L91556654
${product_fresh_sellerpromotion}    L91556754
${product_fresh_supperpoint}    L91556760
${product_nonefresh}    L91201361
${product_fresh}    L91556755
${product_fresh_other}    L91556750
${seller_promotion_nonefresh}    Seller promotion test precent by 1
${seller_promotion_fresh}    Seller Promotion
${supperpoint_condition_nonefresh}    ใช้ทรูพอยท์ 500 คะแนน
${supperpoint_condition_fresh}    ใช้ทรูพอยท์ 20 คะแนน + 5 บาท
${button_name}    สั่งซื้อสินค้า
${button_name_supperpoint}    ซื้อสินค้าหรือแลกด้วยทรูพอยท์

*** Test Cases ***
TC_MC_12513
    [Documentation]    [Mobile] Verify seller promotion product none fresh in cart 
    [Tags]    Regression    Medium
    Go To Level D Mobile Page    ${product_nonefresh_sellerpromotion}
    Click Add To Cart And Go To Cart Normal
    Verify Tag Seller Promotion In Cart On Mobile    ${seller_promotion_nonefresh}
    Verify Button Buy In Cart Mobile    ${button_name}

TC_MC_12516
    [Documentation]    [Mobile] Verify seller promotion product none fresh in cart 
    [Tags]    Regression    Medium
    Go To Level D Mobile Page    ${product_nonefresh_supperpoint}
    Click Add To Cart And Go To Cart Normal
    Verify Tag Supper Point In Cart    ${supperpoint_condition_nonefresh}
    Verify Button Buy In Cart Mobile    ${button_name_supperpoint}

TC_MC_12523
    [Documentation]    [Mobile][Fresh] Verify Sellerpromotion product fresh only in cart
    [Tags]    Regression    Medium
    Go To Level D Mobile Page    ${product_fresh_sellerpromotion}
    Click Add To Cart And Go To Cart Normal
    Verify Tag Seller Promotion In Cart On Mobile    ${seller_promotion_fresh}
    Verify Button Buy Fresh In Cart Mobile    ${button_name}
    Verify Remark Fresh In Cart Mobile

TC_MC_12526
    [Documentation]    [Mobile][Fresh] Verify supper point product fresh only in cart
    [Tags]    Regression    Medium
    Go To Level D Mobile Page    ${product_fresh_supperpoint}
    Click Add To Cart And Go To Cart Normal
    Verify Tag Supper Point In Cart Fresh    ${supperpoint_condition_fresh}
    Verify Button Buy Fresh In Cart Mobile    ${button_name_supperpoint}
    Verify Remark Fresh In Cart Mobile

TC_MC_12532
    [Documentation]    [Mobile][Fresh] Verify product fresh and none fresh product in cart
    [Tags]    Regression    High
    Go To Level D Mobile Page    ${product_fresh}
    Click Add To Cart And Go To Cart Normal
    Verify Button Buy Fresh In Cart Mobile    ${button_name}
    Verify Remark Fresh In Cart Mobile
    Go To Level D Mobile Page    ${product_nonefresh}
    Click Add To Cart And Go To Cart Normal
    Verify Button Buy In Cart Mobile    ${button_name}
    Verify NoneFresh And Fresh In Cart Mobile

TC_MC_12533
    [Documentation]    [Mobile][Fresh] Verify any product fresh in cart
    [Tags]    Regression    High
    Go To Level D Mobile Page    ${product_fresh}
    Click Add To Cart And Go To Cart Normal
    Verify Button Buy Fresh In Cart Mobile    ${button_name}
    Verify Remark Fresh In Cart Mobile
    Go To Level D Mobile Page    ${product_fresh_other}
    Click Add To Cart And Go To Cart Normal
    Verify Button Buy Fresh In Cart Mobile    ${button_name}
    Verify Remark Fresh In Cart Mobile
    Verify Fresh And Other Fresh In Cart Mobile
