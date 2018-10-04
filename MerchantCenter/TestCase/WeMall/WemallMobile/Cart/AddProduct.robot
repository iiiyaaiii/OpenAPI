*** Settings ***
Documentation   The tests to verify product add to cart on wemall mobile
Test Setup      Run Keywords
...             Open WeMall Portal Page On Mobile    AND
...             Delete All Product In Cart Mobile
Suite Teardown  Close All Browsers
Test Teardown   Run Keywords
...             Capture Page Screenshot    AND
...             Close Browser
Force Tags      Wemall-Mobile
Resource        ../../../../Keyword/Common/Mobile_Home.robot
Resource        ../../../../Keyword/Common/Mobile_Cart.robot
Resource        ../../../../Keyword/Common/Mobile_LevelD.robot

*** Variables ***
${m_promotion_text}    Everyday Wow
${m_product_name_everydaywow_freebie}    Wemall-Test - 1216 39CY4
${m_productid_freebie_b}    L91201418
${m_product_name_freebie_b}    KAMUB
${m_productid_freebie_h}    L91201532
${m_product_name_freebie_h}    KAMUH
${m_product_name_sellerpromotion}    Seller Promotion2

*** Test Cases ***
TC_MC_10821
    [Documentation]    [Mobile] Verify the freebie product on cart page when promotion product have promotion freebie
    [Tags]    Regression    Medium
    Go To LevelC Everyady Wow On Mobile
    Select Product Everyday Wow Have Freebie Mobile    ${m_product_name_everydaywow_freebie}
    Click on Add To Cart Button
    Confirmation Popup Should Be Appeared
    Click สั่งซื้อสินค้า Button
    Verify Product Name In Cart On Mobile    ${m_product_name_everydaywow_freebie}
    Verify Tag Promotion In Cart On Mobile    ${m_promotion_text}
    Verify Section Promotion Freebie In Cart

TC_MC_10823
    [Documentation]    [Mobile] Verify buy product A1 get freebie product A2
    [Tags]    Regression    Medium
    Open Product Level D Page    ${m_productid_freebie_b}
    Click on Add To Cart Button
    Confirmation Popup Should Be Appeared
    Click สั่งซื้อสินค้า Button
    Verify Product Name In Cart On Mobile    ${m_product_name_freebie_b}
    Verify Not Tag Promotion In Cart On Mobile
    Verify Section Promotion Freebie In Cart

TC_MC_10957
    [Documentation]    [Mobile] Verify the freebie product on cart page when seller promotion product have promotion freebie
    [Tags]    Regression    Medium
    Open Product Level D Page    ${m_productid_freebie_h}
    Click on Add To Cart Button
    Confirmation Popup Should Be Appeared
    Click สั่งซื้อสินค้า Button
    Verify Product Name In Cart On Mobile    ${m_product_name_freebie_h}
    Verify Tag Seller Promotion In Cart On Mobile    ${m_product_name_sellerpromotion}
    Verify Section Promotion Freebie In Cart