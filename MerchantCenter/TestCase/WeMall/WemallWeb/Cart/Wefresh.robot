*** Settings ***
Suite Setup       Open Custom Browser    ${URL_PORTAL}    ${BROWSER}
Suite Teardown    Close All Browsers
Force Tags        Wemall-Web    Cart
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Resource/WeMall/WebElement/LevelD.txt
Resource          ../../../../Resource/WeMall/WebElement/Cart.txt
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Cart.txt
Resource          ../../../../Keyword/Common/LevelD.txt
Resource          ../../../../Keyword/Common/Checkout.txt

*** Variables ***
${product_nonefresh_sellerpromotion}    L91201533
${product_nonefresh_supperpoint}    L91556654
${product_fresh_sellerpromotion}    L91556754
${product_fresh_supperpoint}    L91556760
${product_nonefresh}    L91201361
${product_fresh}    L91556755
${product_fresh_other}    L91556750
${headline_nonefresh}    สินค้าคุณภาพจากแบรนด์ชั้นนำ
${headline_fresh}    สินค้าสดใหม่ ส่งได้ทันที
${seller_promotion_nonefresh}    Seller promotion test precent by 1
${seller_promotion_fresh}    Seller Promotion
${supperpoint_condition_nonefresh}    ใช้ทรูพอยท์ 500 คะแนน
${supperpoint_condition_fresh}    ใช้ทรูพอยท์ 20 คะแนน + 5 บาท
${button_name}    สั่งซื้อสินค้า
${button_name_supperpoint}    ซื้อสินค้าหรือแลกด้วยทรูพอยท์
${time_order}     (เวลาสั่งสินค้า 07.00 น. - 00.00 น. )

*** Test Cases ***
TC_MC_12478
    [Documentation]    [Desktop] Verify product none fresh in cart
    [Tags]    Regression    Meduim
    Delete All Product In Cart
    Go To Leveld Portal wemall    ${product_nonefresh_sellerpromotion}
    Click Add to Cart and go to Cart
    Verify Headline In Cart    ${headline_nonefresh}
    Verify Tag Promotion In Cart    ${seller_promotion_nonefresh}
    Verify Button Buy Nonefresh In Cart    ${button_name}

TC_MC_12481
    [Documentation]    [Desktop] Verify product none fresh in cart
    [Tags]    Regression    Meduim
    Delete All Product In Cart
    Go To Leveld Portal wemall    ${product_nonefresh_supperpoint}
    Click Add to Cart and go to Cart
    Verify Headline In Cart    ${headline_nonefresh}
    Verify Tag Promotion In Cart    ${supperpoint_condition_nonefresh}
    Verify Button Buy Nonefresh In Cart    ${button_name_supperpoint}

TC_MC_12488
    [Documentation]    [Desktop][Fresh] Verify seller promotion product fresh only in cart
    [Tags]    Regression    Meduim
    Delete All Product In Cart
    Go To Leveld Portal wemall    ${product_fresh_sellerpromotion}
    Click Add to Cart and go to Cart
    Verify Headline Fresh In Cart    ${headline_fresh}    ${time_order}
    Verify Tag Promotion In Cart Fresh    ${seller_promotion_fresh}
    Verify Button Buy Fresh In Cart    ${button_name}

TC_MC_12491
    [Documentation]    [Desktop][Fresh] Verify supper point product fresh only in cart
    [Tags]    Regression    Meduim
    Delete All Product In Cart
    Go To Leveld Portal wemall    ${product_fresh_supperpoint}
    Click Add to Cart and go to Cart
    Verify Headline Fresh In Cart    ${headline_fresh}    ${time_order}
    Verify Tag Promotion In Cart Fresh    ${supperpoint_condition_fresh}
    Verify Button Buy Fresh In Cart    ${button_name_supperpoint}

TC_MC_12497
    [Documentation]    [Desktop][Fresh] Verify product fresh and none fresh product in cart
    [Tags]    Regression    High
    Delete All Product In Cart
    Go To Leveld Portal wemall    ${product_fresh}
    Click Add to Cart and go to Cart
    Verify Headline Fresh In Cart    ${headline_fresh}    ${time_order}
    Verify Remark Fresh In Cart
    Verify Button Buy Fresh In Cart    ${button_name}
    Go To Leveld Portal wemall    ${product_nonefresh}
    Click Add to Cart and go to Cart
    Verify Headline In Cart    ${headline_nonefresh}
    Verify Button Buy Nonefresh In Cart    ${button_name}
    Verify NoneFresh And Fresh In Cart    ${headline_nonefresh}    ${headline_fresh}

TC_MC_12498
    [Documentation]    [Desktop][Fresh] Verify any product fresh in cart
    [Tags]    Regression    High
    Delete All Product In Cart
    Go To Leveld Portal wemall    ${product_fresh}
    Click Add to Cart and go to Cart
    Verify Headline Fresh In Cart    ${headline_fresh}    ${time_order}
    Verify Remark Fresh In Cart
    Verify Button Buy Fresh In Cart    ${button_name}
    Go To Leveld Portal wemall    ${product_fresh_other}
    Click Add to Cart and go to Cart
    Verify Headline Fresh In Cart    ${headline_fresh}    ${time_order}
    Verify Remark Fresh In Cart
    Verify Button Buy Fresh In Cart    ${button_name}
    Verify Fresh And Other Fresh In Cart    ${headline_fresh}    ${headline_nonefresh}


