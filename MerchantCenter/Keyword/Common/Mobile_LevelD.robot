*** Settings ***
Library     BuiltIn
Library     String
Library     DateTime
Resource    ../Common/Common.txt
Resource    ../../Resource/WeMall/Configuration/Staging/serverconfig.txt
Resource    ../../Resource/Weloveshopping/Configuration/Staging/serverconfig.txt
Resource    ../../Resource/Weloveshopping/MobileElement/LevelD.robot
Resource    ../../Resource/WeMall/MobileElement/LevelD.robot
Resource    ../../Resource/WeMall/MobileElement/StoreFront.robot

*** Variables ***
&{levelDMobileDict}    attributeName=xpath=//div[@class='box-option-item ng-scope']/div[(@class='text-option') and (text()='_name')]
...    attributeOption=xpath=//div[(@valid-option='product.validOption') and (@data-option-title='_option')]
...    attributeOptionSelected=xpath=//div[(@class[contains(.,'selected')]) and (@data-option-title='_option')]
...    attributeOptionDisabled=xpath=//div[(@class[contains(.,'disable')]) and (@data-option-title='_option')]
...    errorMessage=xpath=//div[(@type='error') and (text()='_errMsg')]
...    propertyName=xpath=//div[(@class='properties-type') and (text()='_propertyName${SPACE}:')]
...    propertyValue=xpath=//div[(@class='properties-type') and (text()='_propertyName${SPACE}:')]//following-sibling::*
...    productQuantity=xpath=//select[@ng-model='product.quantity']/option[@label='_productNumber']
...    productQuantityError=xpath=//div[(@class='box-option-noti') and (text()='*สินค้านี้มีจำนวน${SPACE}_productNumber${SPACE}ชิ้นเท่านั้น')]
...    popupProductOption=xpath=//div[@class='col-text-add-cart']/div[@class='pd-option']/span[text()[contains(.,'_option')]]

*** Keywords ***
##COMMON KEYWORDS FOR LEVEL D PAGE
Go to Product Level D Page
    [Arguments]    ${productID}
    Run Keyword If    '${productID}' == 'product_id_with_truepoint_promotion'    Common.Open Custom Browser    ${URL_MOBILE}/d/${product_id_with_truepoint_promotion}    Mobile
    ...    ELSE IF    '${productID}' == 'product_id_with_truepoint_and_freebie_promotion'    Common.Open Custom Browser    ${URL_MOBILE}/d/${product_id_with_truepoint_and_freebie_promotion}    Mobile
    ...    ELSE IF    '${productID}' == 'product_id_multiple_sku_and_some_product_with_truepoint_product'    Common.Open Custom Browser    ${URL_MOBILE}/d/${product_id_multiple_sku_and_some_product_with_truepoint_product}    Mobile
    ...    ELSE    Common.Open Custom Browser    ${URL_MOBILE}/d/${productID}    Mobile

Open Mobile Browser
    Common.Open Custom Browser    ${URL_MOBILE}    Mobile
    Wait Until Element Is Visible    box-my-cart

Go To Level D Mobile Page
    [Arguments]    ${ProductLvD}
    Run Keyword If    '${ProductLvD}' == 'product_id_with_truepoint_promotion'    Go to    ${URL_MOBILE}/d/${product_id_with_truepoint_promotion}
    ...    ELSE IF    '${ProductLvD}' == 'product_id_with_truepoint_and_freebie_promotion'    Go to    ${URL_MOBILE}/d/${product_id_with_truepoint_and_freebie_promotion}
    ...    ELSE IF    '${ProductLvD}' == 'product_id_multiple_sku_and_some_product_with_truepoint_product'    Go to    ${URL_MOBILE}/d/${product_id_multiple_sku_and_some_product_with_truepoint_product}
    ...    ELSE    Go to    ${URL_MOBILE}/d/${ProductLvD}


##KEYWORD FOR 404 ERROR PAGE
404 Error Page Should Be Appeared
    Wait Until Element Is Visible    //div[@ng-if='productNotFound']

##KEYWORDS FOR PRODUCT DETAILS
Sold Out Label Should Be Appeared
    Element Should Be Visible    ${lbl_sold_out}
    Element Should Contain    ${lbl_sold_out}    SOLD OUT

Get Product Price
    [Arguments]    ${expectedPrice}
    ##GET PRICE ON FRONT-END
    Common.Scroll Element Into View    ${lbl_product_price}
    ${currentPrice}=    Get Text    ${lbl_product_price}
    ##COMPARE WITH THE EXPECTED VALUE
    BuiltIn.Should Match    '${currentPrice}'    '${expectedPrice}'

Compare Price Should Be Appeared
    [Arguments]    ${expectedPrice}
    Element Should Be Visible    ${lbl_compare_price}
    ##GET PRICE ON FRONT-END
    Common.Scroll Element Into View    ${lbl_compare_price}
    ${comparePrice}=    Get Text    ${lbl_compare_price}
    ##COMPARE WITH THE EXPECTED VALUE
    BuiltIn.Should Match    '${comparePrice}'    '${expectedPrice}'

Compare Price Should Not Be Appeared
    Element Should Not Be Visible    ${lbl_compare_price}

Select Product Quantity
    [Arguments]    ${numberOfProduct}
    Common.Scroll Element Into View    ${lbl_product_quantity}
    Click Element    ${ddl_product_quantity}
    ${locator}=    String.Replace String    &{levelDMobileDict}[productQuantity]    _productNumber    ${numberOfProduct}
    Click Element    ${locator}

Increase Product Quantity
    Click Element    ${btn_increase_quantity}

Decrease Product Quantity
    Click Element    ${btn_decrease_quantity}

Quantity Alert Message Should Be Appeared
    [Arguments]    ${numberOfProduct}
    ${locator}=    String.Replace String    &{levelDMobileDict}[productQuantityError]    _productNumber    ${numberOfProduct}
    Element Should Be Visible    ${locator}

Quantity Alert Message Should Not Be Appeared
    [Arguments]    ${numberOfProduct}
    ${locator}=    String.Replace String    &{levelDMobileDict}[productQuantityError]    _productNumber    ${numberOfProduct}
    Element Should Not Be Visible    ${locator}

Now WOW Logo Should Be Appeared
    Page Should Contain Element    ${img_wow_color}

Next WOW Logo Should Be Appeared
    Page Should Contain Element    ${img_wow_grey}

Less Stock Warning Message Should Be Appeared
    Element Should Contain    ${lbl_less_stock}    *สินค้านี้มีจำนวน 10 ชิ้นเท่านั้น

Seller Promotion Box Should Be Appeared
    Element Should Be Visible    ${lbl_seller_promotion_box}

Seller Promotion Box Should Be Disappeared
    Element Should Not Be Visible    ${lbl_seller_promotion_box}

Seller Promotion Name Should Be Appeared
    [Arguments]    ${expectedPromotionName}
    ##GET PROMOTION NAME ON FRONT-END
    Common.Scroll Element Into View    ${lbl_seller_promotion_name}
    ${promotionName}=    Get Text    ${lbl_seller_promotion_name}
    ##COMPARE WITH THE EXPECTED VALUE
    BuiltIn.Should Match    '${promotionName}'    '${expectedPromotionName}'

Seller Promotion Discount Should Be Appeared
    [Arguments]    ${expectedPromotionDiscount}
    ##GET PROMOTION DISCOUNT ON FRONT-END
    Common.Scroll Element Into View    ${lbl_seller_promotion_discount}
    ${promotionDiscount}=    Get Text    ${lbl_seller_promotion_discount}
    ##COMPARE WITH THE EXPECTED VALUE
    BuiltIn.Should Match    '${promotionDiscount}'    '${expectedPromotionDiscount}'

Seller Promotion Shop Name Should Be Appeared
    [Arguments]    ${expectedPromotionShop}
    ##GET PROMOTION SHOP NAME ON FRONT-END
    Common.Scroll Element Into View    ${lbl_seller_promotion_shop}
    ${promotionShop}=    Get Text    ${lbl_seller_promotion_shop}
    ##COMPARE WITH THE EXPECTED VALUE
    BuiltIn.Should Match    '${promotionShop}'    '${expectedPromotionShop}'

Seller Promotion Period Should Be Appeared
    [Arguments]    ${expectedPromotionPeriod}
    ##GET PROMOTION PERIOD ON FRONT-END
    Common.Scroll Element Into View    ${lbl_seller_promotion_period}
    ${promotionDiscount}=    Get Text    ${lbl_seller_promotion_period}
    ##COMPARE WITH THE EXPECTED VALUE
    BuiltIn.Should Match    '${promotionDiscount}'    '${expectedPromotionPeriod}'

Attribute Section Should Be Appeared
    [Arguments]    ${attributeName}
    ${locator}=    String.Replace String    &{levelDMobileDict}[attributeName]    _name    ${attributeName}
    Element Should Be Visible    ${locator}
    Common.Scroll Element Into View    ${locator}

Attribute Option Should Be Appeared
    [Arguments]    ${attributeOption}
    ${locator}=    String.Replace String    &{levelDMobileDict}[attributeOption]    _option    ${attributeOption}
    Element Should Be Visible    ${locator}

Select Attribute Option
    [Arguments]    ${attributeOption}
    ${locator}=    String.Replace String    &{levelDMobileDict}[attributeOption]    _option    ${attributeOption}
    Common.Scroll Element Into View    ${locator}
    Click Element    ${locator}

Attribute Option Is Selected
    [Arguments]    ${attributeOption}
    ${locator}=    String.Replace String    &{levelDMobileDict}[attributeOptionSelected]    _option    ${attributeOption}
    Element Should Be Visible    ${locator}

Attribute Option Is Disabled
    [Arguments]    ${attributeOption}
    ${locator}=    String.Replace String    &{levelDMobileDict}[attributeOptionDisabled]    _option    ${attributeOption}
    Element Should Be Visible    ${locator}

Error Message Should Be Appeared
    [Arguments]    ${errMsg}
    ${locator}=    String.Replace String    &{levelDMobileDict}[errorMessage]    _errMsg    ${errMsg}
    Element Should Be Visible    ${locator}
    Common.Scroll Element Into View    ${locator}

Click on รายละเอียดสินค้า tab
    Common.Scroll Element Into View    ${tab_product_description}
    Click Element    ${tab_product_description}

Product Property Section Should Be Appeared
    Element Should Be Visible    ${lbl_product_property}

Click On แสดงข้อมูลเพิ่มเติม Link
    Click Element    ${link_property_expand}

Click On ซ่อนข้อมูลบางส่วน Link
    Click Element    ${link_property_collapse}

Property Value Should Be Populated
    [Arguments]    ${propertyName}    ${expectedPropertyValue}
    ${locator}=    String.Replace String    &{levelDMobileDict}[propertyValue]    _propertyName    ${propertyName}
    ${value}=    Get Text    ${locator}
    BuiltIn.Should Match    ${value}    ${expectedPropertyValue}

Recommend Product Section Should Be Appeared
    [Arguments]    ${expectedShopName}
    Element Should Be Visible    ${img_shop_avatar}
    ${shopName}=    Get Text    ${lbl_shop_name}
    BuiltIn.Should Match    '${shopName}'    '${expectedShopName}'

Click on Add To Cart Button
    Click Element    ${btn_add_to_cart}

Confirmation Popup Should Be Appeared
    Element Should Be Visible    ${popup_confirmation}

Confirmation Popup Should Not Be Appeared
    Element Should Not Be Visible    ${popup_confirmation}

Click X-out To Close Popup
    Click Element    ${popup_close}

Click ดูสินค้าต่อ Button
    Click Element    ${popup_view_more}

Click สั่งซื้อสินค้า Button
    Click Element    ${popup_check_order}

On Popup, Product Name Is Populated Correctly
    [Arguments]    ${expectedName}
    ${productName}=    Get Text    ${popup_product_name}
    BuiltIn.Should Match    '${productName}'    '${expectedName}'

On Popup, Product Option Is Populated Correctly
    [Arguments]    ${option}    ${expectedOption}
    ${locator}=    String.Replace String    &{levelDMobileDict}[popupProductOption]    _option    ${option}
    ${productOption}=    Get Text    ${locator}
    ${optionTag}    ${productOption}=    String.Split String    ${productOption}    :
    ${productOption}=    String.Strip String    ${productOption}
    BuiltIn.Should Match    '${productOption}'    '${expectedOption}'

On Popup, Product Quantity Is Populated Correctly
    [Arguments]    ${expectedQuantity}
    ${productQuantity}=    Get Text    ${popup_product_quantity}
    ${quantityTag}    ${productQuantity}=    String.Split String    ${productQuantity}    :
    ${productQuantity}=    String.Strip String    ${productQuantity}
    BuiltIn.Should Match    '${productQuantity}'    '${expectedQuantity}'

On Popup, Product Price Is Populated Correctly
    [Arguments]    ${expectedPrice}
    ${productPrice}=    Get Text    ${popup_product_price}
    ${priceTag}    ${productPrice}=    String.Split String    ${productPrice}    :
    ${productPrice}=    String.Strip String    ${productPrice}
    BuiltIn.Should Match    '${productPrice}'    '${expectedPrice}'

Select Product Everyday Wow Have Freebie Mobile
    [Arguments]    ${product_freebie}
    Wait Until Element Is Visible    /${tbl_product_everydaywow}
    ${freebie}=    Replace String    ${lbl_productname_freebie}    -freebie    ${product_freebie}
    Click Element    ${freebie}

Open Product Level D Page
    [Arguments]    ${productID}
    Go To    ${URL_MOBILE}/d/${productID}

Go To LevelC Everyady Wow On Mobile
    Go to    ${URL_MOBILE}/everyday-wow

<<<<<<< Updated upstream

#### TruePoint ####

Verify Additional Line for TruePoint Product
    [Documentation]    Check additional lines when select TruePoint product
    [Arguments]    ${mode}
    Run Keyword If    '${mode}' == 'exist'    Log To Console    Verify TruePoint condition lines exist
    Run Keyword If    '${mode}' == 'exist'    Element Should Contain    ${txt_truepoint_info}    ใช้ทรูพอยท์
    Run Keyword If    '${mode}' == 'exist'    Element Should Contain    ${txt_truepoint_condition}    อ่านเงื่อนไข
    Run Keyword If    '${mode}' == 'notexist'    Log To Console    Verify TruePoint condition lines do not exist
    Run Keyword If    '${mode}' == 'notexist'    Element Should Not Be Visible    ${txt_truepoint_info}
    Run Keyword If    '${mode}' == 'notexist'    Element Should Not Be Visible    ${txt_truepoint_condition}

Verify TruePoint Thumbnail
    [Documentation]    Check TruePoint thumbnail exist when select TruePoint product
    [Arguments]    ${mode}
    Run Keyword If    '${mode}' == 'exist'    Log To Console    Verify TruePoint Thumbnail exists
    Run Keyword If    '${mode}' == 'exist'    Element Should Be Visible    ${img_truepoint_thumbnail}
    Run Keyword If    '${mode}' == 'notexist'    Log To Console    Verify no TruePoint Thumbnail exists
    Run Keyword If    '${mode}' == 'notexist'    Element Should Not Be Visible    ${img_truepoint_thumbnail}

Verify TruePoint Button
    [Documentation]    Check TruePoint button exist when select TruePoint product
    [Arguments]    ${mode}
    Run Keyword If    '${mode}' == 'exist'    Log To Console    Verify TruePoint Button exists
    Run Keyword If    '${mode}' == 'exist'    Element Should Be Visible    ${btn_truepoint}
    Run Keyword If    '${mode}' == 'exist'    Click Element Contain Text    ${btn_truepoint}    แลกด้วย TruePoint
    Run Keyword If    '${mode}' == 'notexist'    Log To Console    Verify no TruePoint Button exists
    Run Keyword If    '${mode}' == 'notexist'    Element Should Not Be Visible    ${btn_truepoint}

Verify Level D Go To Cart Page
    [Documentation]    Verify whether Page Go To Cart page or not
    Log To Console    Verify whether Page Go To Cart from Level D or not
    Location Should Contain    /cart

Click TruePoint Button On Level D Page
    [Documentation]    Click TruePoint button on level D page
    Log To Console    Click TruePoint Button on Level D Page
    Click Button    ${btn_truepoint}

Select Level D Product
    [Documentation]    Select specific product from varient
    [Arguments]    ${product}
    Log To Console    Select Specific Product from Other varient
    Execute JavaScript    window.scrollTo(0,1500)
    Run Keyword If    '${product}' == 'normal'    Click Button    ${btn_attribute_red}
    Run Keyword If    '${product}' == 'truepoint'    Click Button    ${btn_attribute_black}

Click Continue On TruePoint Alert Message
    [Documentation]    Click Continue button on TruePoint Popup Message
    Log To Console    Click Continue button on TruePoint Popup Message
    Click Button    ${btn_at_popup_truepoint_continue}
    Wait Until Page Does Not Contain Element    add-to-cart

Verify Level D TruePoint Alert Message
    [Documentation]    Verify TruePoint Alert Message at Popup
    [Arguments]    ${mode}
    Run Keyword If    '${mode}' == 'yes'    Log To Console    Verify TruePoint Alert Message at Popup
    Run Keyword If    '${mode}' == 'yes'    Wait Until Element Is Visible    ${popup_truepoint_msg}
    Run Keyword If    '${mode}' == 'yes'    Element Should Contain    ${popup_error_msg}    คุณแลกสินค้าทรูพอยท์ได้เพียง 1 ชิ้น
    Run Keyword If    '${mode}' == 'yes'    Element Should Contain    ${btn_at_popup_truepoint_continue}    ดำเนินการต่อ
    Run Keyword If    '${mode}' == 'no'    Log To Console    Verify no Alert Message And Go To Cart Page
    Run Keyword If    '${mode}' == 'no'    Wait Until Page Does Not Contain Element    add-to-cart
    Run Keyword If    '${mode}' == 'no'    Verify Level D Go To Cart Page

Click Add to Cart And Go to Cart
    [Documentation]    Click Add To Cart button and continue to Cart page
    Click on Add To Cart Button
    Confirmation Popup Should Be Appeared
    Click สั่งซื้อสินค้า Button

Click Add To Cart And Go To Cart Normal
    Click Element    ${btn_add_to_cart_normal}
    Confirmation Popup Should Be Appeared
    Click สั่งซื้อสินค้า Button

=======
#### WELOVESHOPPING ###
Open Product LevelD Weloveshopping
    [Arguments]    ${productid}
    Go To    ${URL_MOBILE}/product/${productid}

Verify Truepoint Icon On LevelD Weloveshopping
    Wait Until Element Is Visible    ${icn_truepoint}
    Element Should Be Visible    ${icn_truepoint}

Verify Condition Truepoint On LevelD Weloveshopping
    Element Should Contain    ${txt_condition_point}    ใช้ทรูพอยท์ 1,000 คะแนน
    Element Should Contain    ${txt_condition_bath}     + 100 บาท
    Element Should Contain    ${btn_truepoint}    แลกด้วย TruePoint

Click Add Truepoint To Cart
    [Documentation]    add truepoint for wemall mobile
    Wait Until Element Is Visible    ${btn_add_to_cart_truepoint}
    Click Element    ${btn_add_to_cart_truepoint}

Click Add Truepoint To Cart Weloveshopping Mobile
    [Documentation]    add truepoint for weloveshopping mobile
    Wait Until Element Is Visible    ${btn_truepoint}
    Click Element    ${btn_truepoint}
>>>>>>> Stashed changes
