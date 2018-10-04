*** Settings ***
Library     BuiltIn
Library     String
Resource    ../Common/Common.txt
Resource    ../../Resource/WeMall/Configuration/Staging/serverconfig.txt
Resource    ../../Resource/WeLoveshopping/Configuration/Staging/serverconfig.txt
Resource    ../../Resource/WeMall/MobileElement/Cart.robot
Resource    ../../Resource/WeLoveshopping/MobileElement/Cart.robot


*** Variables ***
&{cartMobileDict}    numberOfProductInCart=xpath=//div[@class='box-cart-title']
...    productQuantity=xpath=//select[@ng-model='product.quantity']/option[@label='_number']
...    removeProduct=xpath=//p[text()='_productName']//following-sibling::div[@ng-click='deleteProduct(product)']

*** Keywords ***
##COMMON KEYWORDS FOR HOME PAGE
Open Wemall Cart Page On Mobile
    Common.Open Custom Browser    ${URL_MOBILE}/cart    Mobile

Empty Cart Page Should Be Appeared
    Element Should Be Visible    ${lbl_empty_cart_text}
    Element Should Be Visible    ${btn_continue_shopping}

Number Of Added Product In Cart Should Be Appeared
    [Arguments]    ${expectedProduct}
    ${numberOfProduct}=    Get Text    ${lbl_product_in_cart}
    BuiltIn.Should Match    '${numberOfProduct}'    '${expectedProduct}'

Number Of Added Shop In Cart Should Be Appeared
    [Arguments]    ${expectedShop}
    ${numberOfShop}=    Get Text    ${lbl_shop_in_cart}
    ${numberOfShop}=    String.Remove String    ${numberOfShop}    จาก    ร้าน
    ${numberOfShop}=    String.Strip String    ${numberOfShop}
    BuiltIn.Should Match    '${numberOfShop}'    '${expectedShop}'

Delete All Product In Cart Mobile
    Go to    ${URL_MOBILE}/cart
    ${count}=    Get Matching Xpath Count    ${btn_delete_product_cart}
    : FOR    ${a}    IN RANGE    0    ${count}
    \    Wait Until Element Is Visible    ${btn_delete_product_cart}
    \    Log    ${a}
    \    Click Element    ${btn_delete_product_cart}
    \    Confirm Action
    Wait Until Page Contains    ไม่มีสินค้าในตะกร้าของท่าน

##INFORMATION POPUP
Information Icon Should Be Appeared
    Element Should Be Visible    ${img_info}

Click On Information Icon
    Click Element    ${img_info}

Click Close Information Popup
    Click Element    ${btn_close_info}

Information Popup Should Be Appeared
    ${infoDetail}=    Get Text    ${popup_info_detail}
    BuiltIn.Should Match    '${infoDetail}'    'ท่านสามารถเลื่อนหน้าจอลงมาด้านล่าง เพื่อดูสินค้าในตะกร้าทั้งหมด'

Information Popup Should Not Be Appeared
    Element Should Not Be Visible    ${popup_info_detail}

##PROMOTION INFORMATION POPUP
Promotion Information Icon Should Be Appeared
    Element Should Be Visible    ${img_promotion_info}

Click On Promotion Information Icon
    Click Element    ${img_promotion_info}

Click Close Promotion Information Popup
    Click Element    ${btn_close_promotion_info}

Promotion Information Popup Should Be Appeared
    [Arguments]    ${expectedPromotionName}    ${expectedPromotionDesc}
    ${promotionName}=    Get Text    ${popup_promotion_detail_shop}
    BuiltIn.Should Match    '${promotionName}'    '${expectedPromotionName}'
    ${promotionDesc}=    Get Text    ${popup_promotion_detail_desc}
    BuiltIn.Should Match    '${promotionDesc}'    '${expectedPromotionDesc}'

PromotionInformation Popup Should Not Be Appeared
    Element Should Not Be Visible    ${popup_promotion_detail_shop}

##DETAILS
Shop Name Should Be Appeared
    [Arguments]    ${expectedShopName}
    ${shopName}=    Get Text    ${lbl_shop_name}
    ${shopName}=    String.Strip String    ${shopName}    characters=ร้านค้า :    mode=left
    BuiltIn.Should Match    '${shopName}'    '${expectedShopName}'

Product Name Should Be Appeared
    [Arguments]    ${expectedProductName}
    ${productName}=    Get Text    ${lbl_product_name}
    BuiltIn.Should Match    '${productName}'    '${expectedProductName}'

Promotion Tag Should Be Appeared
    [Arguments]    ${expectedPromotion}
    ${promotionName}=    Get Text    ${img_promotion}
    BuiltIn.Should Match    '${promotionName}'    '${expectedPromotion}'

Discount Label Should Be Appeared
    [Arguments]    ${expectedPromotion}
    ${promotionLabel}=    Get Text    ${lbl_discount}
    BuiltIn.Should Match    '${promotionLabel}'    '${expectedPromotion}'

Product Price Should Be Appeared
    [Arguments]    ${expectedProductPrice}
    ${productPrice}=    Get Text    ${lbl_product_price}
    BuiltIn.Should Match    '${productPrice}'    '${expectedProductPrice}'

Product Compare Price Should Be Appeared
    [Arguments]    ${expectedComparePrice}
    ${comparePrice}=    Get Text    ${lbl_compare_price}
    BuiltIn.Should Match    '${comparePrice}'    '${expectedComparePrice}'

Added Product Quantity Should Be Appeared
    [Arguments]    ${expectedAddedQuantity}
    ${addedQuantity}=    Get Text    ${lbl_added_quantity}
    BuiltIn.Should Match    '${addedQuantity}'    '${expectedAddedQuantity}'

Remove Product Button Should Be Appeared
    Element Should Be Visible    ${lbl_remove_product}

Remove Product
    [Arguments]    ${productName}
    ${locator}=    String.Replace String    &{cartMobileDict}[removeProduct]    _productName    ${productName}
    Click Element    ${locator}

Decrease Product Quantity
    Click Element    ${btn_decrease_product}

Increase Product Quantity
    Click Element    ${btn_increase_product}

Select Product Quantity
    [Arguments]    ${numberOfProduct}
    Click Element    ${ddl_add_quantity}
    ${locator}=    String.Replace String    &{cartMobileDict}[productQuantity]    _number    ${numberOfProduct}
    Click Element    ${locator}

Alert Message Should Be Appeared
    [Arguments]    ${expectedError}
    ${errorMsg}=    Get Text    ${lbl_alert_msg}
    BuiltIn.Should Match    '${errorMsg}'    '${expectedError}'

Discount Amount Should Be Appeared
    Element Should Be Visible    ${lbl_discount_amount}

Discount Amount Should Not Be Appeared
    Element Should Not Be Visible    ${lbl_discount_amount}

### Freebie ###
Verify Product Name In Cart On Mobile
    [Arguments]    ${product_name}
    Element Should Contain    ${lbl_m_product_name}    ${product_name}

Verify Tag Promotion In Cart On Mobile
    [Arguments]    ${promotion}
    Element Should Contain    ${lbl_m_promotion}    ${promotion}

Verify Tag Seller Promotion In Cart On Mobile
    [Arguments]    ${promotion}
    Element Should Contain    ${lbl_m_seller}    ${promotion}

Verify Not Tag Promotion In Cart On Mobile
    Element Should Not Be Visible    ${lbl_m_promotion}

Verify Section Promotion Freebie In Cart
    Element Should Be Visible    ${tbr_m_freebie}

### Truepoint ###
Verify Truepoint In Cart Mobile
    [Documentation]    Cart for wemall cart mobile
    [Arguments]    ${condition}    ${remark}
    ${loc}    Get Location
    Should Be Equal    ${loc}    https://m.wemall-dev.com/cart
    Element Should Contain    ${txt_condition_truepoint_mobile}     ${condition}
    Element Should Contain    ${txt_remark_condition_truepoint_mobile}     ${remark}

Verify Truepoint In Cart Mobile For WeLoveshopping
    [Documentation]    Cart for weloveshopping cart mobile
    [Arguments]    ${condition}    ${remark}
    ${loc}    Get Location
    Should Be Equal    ${loc}    https://m.wls-dev.com/cart
    Element Should Contain    ${txt_condition_truepoint_mobile_wls}     ${condition}
    Element Should Contain    ${txt_remark_condition_truepoint_mobile_wls}     ${remark}

### Fresh ###
Verify Button Buy In Cart Mobile
    [Arguments]    ${name_button}
    Focus    ${btn_buy_mobile}
    Element Should Contain    ${btn_buy_mobile}    ${name_button}

Verify Tag Supper Point In Cart
    [Arguments]    ${promotion}
    Element Should Contain    ${lbl_m_seller}    ${promotion}
    Element Should Be Visible    ${lbl_remark_incart_mobile}

Verify Tag Supper Point In Cart Fresh
    [Arguments]    ${promotion}
    Element Should Contain    ${lbl_m_seller}    ${promotion}

Verify Button Buy Fresh In Cart Mobile
    [Arguments]    ${name_button}
    Element Should Contain    ${btn_buy_fresh}    ${name_button}

Verify Remark Fresh In Cart Mobile
    Element Should Be Visible    ${lbl_remark_fresh_cart_mobile}

Verify NoneFresh And Fresh In Cart Mobile
    Element Should Be Visible    ${lbl_group_nonefresh}
    Element Should Be Visible    ${lbl_group_fresh}

Verify Fresh And Other Fresh In Cart Mobile
    Element Should Be Visible    ${lbl_group_fresh}
    Element Should Not Be Visible    ${lbl_group_nonefresh}
