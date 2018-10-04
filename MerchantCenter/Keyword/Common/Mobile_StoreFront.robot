*** Settings ***
Library     BuiltIn
Library     String
Resource    ../Common/Common.txt
Resource    ../../Resource/WeMall/Configuration/Staging/serverconfig.txt
Resource    ../../Resource/WeMall/MobileElement/StoreFront.robot

*** Variables ***
&{storeFrontMobileDict}    shopMenu=xpath=//*[@id="ul_collap"]/li/a[text()='_shopMenu']
...    selectShopSubMenu=xpath=//a[text()='_subMenu']
# ...    shopMenuExpand=xpath=//ul[(@id='ul_collap') and (@style='display: block;')]
...    shopMenuExpand=xpath=//*[@id="ul_collap"]
...    sectionName=xpath=//div[@class='caption']/h2[text()='_sectionName']
...    avatarOption=xpath=//a[text()='_option']
...    searchResult=xpath=//div[@class='caption']/h2/span
...    noResultFound=xpath=//div[(@ng-show='searchEmpty') and (text()='ไม่พบสินค้าที่ต้องการค้นหา${SPACE}"_keyword"')]
...    sortingOption=xpath=//ul[@ng-show='toggleSort']/li/a[text()='_option']
...    selectedSort=xpath=//span[@class[contains(.,'selected')]]
...    pageHeader=xpath=//div[@class='caption']/h2
...    viewMore=xpath=//h2[text()='_sectionName']//following::a[text()='ดูสินค้าทั้งหมด']

&{levelBMobileDict}    noPromotion=xpath=//div[@ng-show='promotionEmpty']
...    promotionName=xpath=//div[@class='caption']/h2[text()='_promotionName']
...    promotionDesc=xpath=//h2[text()='_promotionName']//following::div[@class='promotion-desc']/span[@class='cond-box ng-binding']
...    promotionDate=xpath=//h2[text()='_promotionName']//following::div[@class='promotion-desc']/span[@class='time-box ng-binding']
...    viewPromotion=xpath=//h2[text()='_promotionName']//following::span/a

*** Keywords ***
##COMMON KEYWORDS FOR STORE FRONT PAGE
Open Wemall Store Front Page On Mobile
    [Arguments]    ${shopSlugID}
    Common.Open Custom Browser    ${URL_MOBILE}/${shopSlugID}    Mobile

Wemall Store Front Page Should Be Appeared
    [Arguments]    ${shopName}
    Wait Until Element Is Visible    ${lbl_store_name}
    ${getShopName}=    Get Text    ${lbl_store_name}
    BuiltIn.Should Match    ${getShopName}    ${shopName}

Wemall Store Front Page Should Not Be Appeared
    [Arguments]    ${storeName}
    Wait Until Element Is Not Visible    ${lbl_store_name}

Go To Section Name
    [Arguments]    ${sectionName}
    ${locator}=    String.Replace String    &{storeFrontMobileDict}[sectionName]    _sectionName    ${sectionName}
    Common.Scroll Element Into View    ${locator}

##KEYWORDS FOR WIDGETS
Click WeMall Logo
    Click Element    ${img_wemall_logo}

Click Login Button
    Click Element    ${btn_login}

Click My Shop Icon
    Click Element    ${btn_my_shop}

Click User Avatar Icon
    Click Element    ${btn_user_avatar}

Click My Cart Icon
    Click Element    ${btn_cart}

Click Header Banner
    Click Element    ${img_header_banner}

User Avatar Option Should Be Appeared
    Element Should Contain    ${ddl_avatar_shop_history}    รายการสั่งซื้อ
    Element Should Contain    ${ddl_avatar_user_info}    ข้อมูลส่วนตัว
    Element Should Contain    ${ddl_avatar_sign_out}    ออกจากระบบ

User Avatar Option Should Not Be Appeared
    Element Should Not Be Visible    ${ddl_avatar_shop_history}
    Element Should Not Be Visible    ${ddl_avatar_user_info}
    Element Should Not Be Visible    ${ddl_avatar_sign_out}

Select User Avatar Option
    [Arguments]    ${avatarOption}
    ${locator}=    String.Replace String    &{storeFrontMobileDict}[avatarOption]    _option    ${avatarOption}
    Click Element    ${locator}

##KEYWORDS FOR SHOP MAIN MENU
Click Shop Menu Icon
    Wait Until Element Is Visible    ${btn_store_main_menu}
    Common.Scroll Element Into View    ${btn_store_main_menu}
    Click Element    ${btn_store_main_menu}

Shop Menu Should Be Expanded
    Element Should Be Visible    &{storeFrontMobileDict}[shopMenuExpand]

Shop Menu Should Be Appeared
    [Arguments]    ${shopMenu}
    ${locator}=    String.Replace String    &{storeFrontMobileDict}[shopMenu]    _shopMenu    ${shopMenu}
    Element Should Be Visible    ${locator}

Select Shop Menu
    [Arguments]    ${option}
    Mobile_StoreFront.Click Shop Menu Icon
    Mobile_StoreFront.Shop Menu Should Be Expanded
    ${locator}=    String.Replace String    &{storeFrontMobileDict}[shopMenu]    _shopMenu    ${option}
    Click Element    ${locator}

Select Shop Sub-Menu
    [Arguments]    ${option}
    ${locator}=    String.Replace String    &{storeFrontMobileDict}[selectShopSubMenu]    _subMenu    ${option}
    Click Element    ${locator}

Select Shop Promotion
    Mobile_StoreFront.Click Shop Menu Icon
    Mobile_StoreFront.Shop Menu Should Be Expanded
    Execute Javascript    ${opt_promotion}

Click Shop Avatar
    Click Element    ${img_store_avatar}

Click Shop Name
    Click Element    ${lbl_store_name}

View More Products
    [Arguments]    ${sectionName}
    ${locator}=    String.Replace String    &{storeFrontMobileDict}[viewMore]    _sectionName    ${sectionName}
    Common.Scroll Element Into View    ${locator}
    Click Element    ${locator}

Click ดูสินค้าใหม่เพิ่มเติมที่นี่ Button
    Click Element    ${btn_all_products}

##KEYWORDS FOR SOCIAL NETWORKS
Scroll To Social Network Section
    Common.Scroll Element Into View    ${lbl_social_network}

Click Facebook Icon
    Click Element    ${btn_facebook}

Click Instagram Icon
    Click Element    ${btn_instagram}

Click Twitter Icon
    Click Element    ${btn_twitter}

Click Google+ Icon
    Click Element    ${btn_google_plus}

Click Pinterest Icon
    Click Element    ${btn_pinterest}

Social Network Section Should Be Appeared
    Wait Until Element Is Visible    ${lbl_social_network}

Social Network Section Should Not Be Appeared
    Wait Until Element Is Not Visible    ${lbl_social_network}

##KEYWORDS FOR SEARCH IN-STORE
Placeholder Text Should Be Appeared
    [Arguments]    ${expectedText}
    ${getPlaceHolderText}=    Get Element Attribute    ${txt_search_in_store}@placeholder
    BuiltIn.Should Match    '${getPlaceHolderText}'    '${expectedText}'

Enter Search Keyword
    [Arguments]    ${keyword}
    Input Text    ${txt_search_in_store}    ${keyword}

Click Search Button
    Click Element    ${btn_search_in_store}

Search Result Should Be Found
    :FOR    ${index}    IN RANGE    0    5
    \    ${searchResult}=    Get Element Attribute    &{storeFrontMobileDict}[searchResult]@textContent
    \    Log To Console    This is search result '${searchResult}'
    \    ${result}=    Run Keyword And Return Status    Should Not Be Empty    ${searchResult}
    \    Log To Console    This is check '${result}'
    \    Exit For Loop If    '${result}' == 'True'

Search Result Should Not Be Found
    [Arguments]    ${keyword}
    Wait Until Element Is Not Visible    &{storeFrontMobileDict}[searchResult]
    ${locator}=    String.Replace String    &{storeFrontMobileDict}[noResultFound]    _keyword    ${keyword}
    Element Should Be Visible    ${locator}

Click Sorting Button
    Wait Until Element Is Visible    ${btn_sort_product}
    Click Element    ${btn_sort_product}

Sorting Option Should Be Appeared
    [Arguments]    ${sortingOption}
    ${locator}=    String.Replace String    &{storeFrontMobileDict}[sortingOption]    _option    ${sortingOption}
    Element Should Be Visible    ${locator}

Select Sorting Option
    [Arguments]    ${sortingOption}
    ${locator}=    String.Replace String    &{storeFrontMobileDict}[sortingOption]    _option    ${sortingOption}
    Click Element    ${locator}

Selected Sorting Option Should Be Appeared
    [Arguments]    ${sortingOption}
    ${selectOption}=    Get Text    &{storeFrontMobileDict}[selectedSort]
    BuiltIn.Should Match    '${selectOption}'    '${sortingOption}'

Products Should Be Sorted By Price
    [Arguments]    ${sortingOption}
    : FOR    ${i}    IN RANGE    1    4
    \    Wait Until Element Is Visible    //li[@ng-repeat='product in searchData'][${i}]//div[@class='price-box']/strong[1]
    \    ${price_now}=    Get Text    //li[@ng-repeat='product in searchData'][${i}]//div[@class='price-box']/strong[1]
    \    ${i_next}=    Add Operation    ${i}    1
    \    ${price_next}=    Get Text    //li[@ng-repeat='product in searchData'][${i_next}]//div[@class='price-box']/strong[1]
    \    ${price_now}=    Remove String    ${price_now}    บาท
    \    ${price_next}=    Remove String    ${price_next}    บาท
    \    Run Keyword If    '${sortingOption}' == 'ราคาต่ำสุด'    Should Be True    ${price_now} <= ${price_next}
    \    Run Keyword If    '${sortingOption}' == 'ราคาสูงสุด'    Should Be True    ${price_now} >= ${price_next}

##SELLER PROMOTION HOMEPAGE
Verify Seller Promotion On HOMEPAGE
    Wait Until Element Is Visible    ${bage_sellerpromotion}
    Wait Until Element Is Visible    ${sellerpromotion_condition}
    Wait Until Element Is Visible    ${sellerpromotion_product}

Click View All
    Element Should Be Visible    ${sellerpromotion_viewall}
    Click Element    ${sellerpromotion_viewall}

##COLLECTION HOMEPAGE
Verify Collection On HOMEPAGE
    Wait Until Element Is Visible    ${box_collection}
    Wait Until Element Is Visible    ${viewall_collection}
    ${product}    Execute Javascript    return ${product_collection}.length
    Should Be True    ${product} <= 4

##STORE FRONT LEVELC CATEGORY
Open store Fornt LevelC Category Page
    [Arguments]    ${shopName}    ${categoryID}
    Go To    ${URL_MOBILE}/${shopName}/category/${categoryID}
    Wait Until Element Is Visible    ${box_product_lvc}
    ${category_url}    Get Location
    Should Be True    '${category_url}' == '${URL_MOBILE}/${shopName}/category/${categoryID}'
    Execute Javascript    ${product_category}
    ${product}    Execute Javascript    return ${product_category}.length

Level C Product Category Page Should Be Appeared
    [Arguments]    ${catName}
    Wait Until Element Is Visible    &{storeFrontMobileDict}[pageHeader]
    ${pageName}=    Get Text    &{storeFrontMobileDict}[pageHeader]
    BuiltIn.Should Match    '${pageName}'    '${catName}'

Check Sorting Default Category
    [Arguments]    ${sortingOption}
    Element Should Contain    ${default_sorting}    ${sortingOption}

Category Products Should Be Sorted By Price
    [Arguments]    ${sortingOption}
    : FOR    ${i}    IN RANGE    1    4
    \    ${price_now}=    Get Text    //li[@ng-repeat="product in categoryData"][${i}]//div[@class='price-box']
    \    ${i_next}=    Add Operation    ${i}    1
    \    ${price_next}=    Get Text    //li[@ng-repeat="product in categoryData"][${i_next}]//div[@class='price-box']
    \    ${price_now}=    Remove String    ${price_now}    บาท
    \    ${price_next}=    Remove String    ${price_next}    บาท
    \    Run Keyword If    '${sortingOption}' == 'ราคาต่ำสุด'    Should Be True    ${price_now} <= ${price_next}
    \    Run Keyword If    '${sortingOption}' == 'ราคาสูงสุด'    Should Be True    ${price_now} >= ${price_next}

##STORE FRONT LEVELC COLLECTION
Open store Fornt LevelC Collection Page
    [Arguments]    ${shopName}
    Go To    ${URL_MOBILE}/${shopName}/collection
    Wait Until Element Is Visible    ${box_product_lvc}
    ${collection_url}    Get Location
    Should Be True    '${collection_url}' == '${URL_MOBILE}/${shopName}/collection'
    Execute Javascript    ${product_collection_lvc}
    ${product}    Execute Javascript    return ${product_collection_lvc}.length

Collection Products Should Be Sorted By Price
    [Arguments]    ${sortingOption}
    : FOR    ${i}    IN RANGE    1    3
    \    ${price_now}=    Get Text    //li[@ng-repeat="product in collection_item"][${i}]//div[@class='price-box']/strong[@class='price ng-binding']
    \    ${i_next}=    Add Operation    ${i}    1
    \    ${price_next}=    Get Text    //li[@ng-repeat="product in collection_item"][${i_next}]//div[@class='price-box']/strong[@class='price ng-binding']
    \    ${price_now}=    Remove String    ${price_now}    บาท
    \    ${price_next}=    Remove String    ${price_next}    บาท
    \    Run Keyword If    '${sortingOption}' == 'ราคาต่ำสุด'    Should Be True    ${price_now} <= ${price_next}
    \    Run Keyword If    '${sortingOption}' == 'ราคาสูงสุด'    Should Be True    ${price_now} >= ${price_next}

Verify No Collection
    Element Should Contain    ${no_collection}    ร้านนี้ยังไม่มีสินค้าแนะนำในเวลานี้

##STORE FRONT LEVELC PRODUCT ALL
Open store Fornt LevelC Prduct All Page
    [Arguments]    ${shopName}
    Go To    ${URL_MOBILE}/${shopName}/products
    Wait Until Element Is Visible    ${box_product_lvc}
    ${product_url}    Get Location
    Should Be True    '${product_url}' == '${URL_MOBILE}/${shopName}/products'
    Execute Javascript    ${product_all_lvc}
    ${product}    Execute Javascript    return ${product_all_lvc}.length

All Products Page Should Be Appeared
    Wait Until Element Is Visible    &{storeFrontMobileDict}[pageHeader]
    ${pageName}=    Get Text    &{storeFrontMobileDict}[pageHeader]
    BuiltIn.Should Match    '${pageName}'    'สินค้า'

Products All Should Be Sorted By Price
    [Arguments]    ${sortingOption}
    : FOR    ${i}    IN RANGE    1    4
    \    ${price_now}=    Get Text    //li[@ng-repeat="product in productData"][${i}]//div[@class='price-box']/strong[@class='price']
    \    ${i_next}=    Add Operation    ${i}    1
    \    ${price_next}=    Get Text    //li[@ng-repeat="product in productData"][${i_next}]//div[@class='price-box']/strong[@class='price']
    \    ${price_now}=    Remove String    ${price_now}    บาท
    \    ${price_next}=    Remove String    ${price_next}    บาท
    \    Run Keyword If    '${sortingOption}' == 'ราคาต่ำสุด'    Should Be True    ${price_now} <= ${price_next}
    \    Run Keyword If    '${sortingOption}' == 'ราคาสูงสุด'    Should Be True    ${price_now} >= ${price_next}

##STORE FRONT LEVELC SELLER PROMOTION
Seller Promotion LeveC Should Not Be Appeared
    [Arguments]    ${shopName}    ${sellerpromotion_id}
    Go To    ${URL_MOBILE}/${shopName}/promotion/${sellerpromotion_id}
    Element Should Not Be Visible    ${icon_promotion}
    ${404_url}    Get Location
    Should Be True    '${404_url}' == 'https://m.wemall-dev.com/404'

Open store Fornt LevelC Seller Promotion Page
    [Arguments]    ${shopName}    ${sellerpromotion_id}
    Go To    ${URL_MOBILE}/${shopName}/promotion/${sellerpromotion_id}
    Wait Until Element Is Visible    ${icon_promotion}
    Element Should Be Visible    ${icon_promotion}
    ${sellerlvc_url}    Get Location
    Should Be True    '${sellerlvc_url}' == '${URL_MOBILE}/${shopName}/promotion/${sellerpromotion_id}'
    Click Element    ${img_product_seller_lvc}
    ${product}    Execute Javascript    return ${product_seller_lvc}.length

Seller Promotion Should Be Sorted By Price
    [Arguments]    ${sortingOption}
    : FOR    ${i}    IN RANGE    1    4
    \    ${price_now}=    Get Text    //li[@ng-repeat="product in promotion_item"][${i}]//div[@class="price-box"]//strong
    \    ${i_next}=    Add Operation    ${i}    1
    \    ${price_next}=    Get Text    //li[@ng-repeat="product in promotion_item"][${i_next}]//div[@class="price-box"]//strong
    \    ${price_now}=    Remove String    ${price_now}    บาท
    \    ${price_next}=    Remove String    ${price_next}    บาท
    \    Run Keyword If    '${sortingOption}' == 'ราคาต่ำสุด'    Should Be True    ${price_now} <= ${price_next}
    \    Run Keyword If    '${sortingOption}' == 'ราคาสูงสุด'    Should Be True    ${price_now} >= ${price_next}


##KEYWORDS FOR LEVELB SELLER PROMOTION LIST
Open Wemall Seller Promotion List Page On Mobile
    [Arguments]    ${shopSlugID}
    Common.Open Custom Browser    ${URL_MOBILE}/${shopSlugID}/promotion    Mobile

Seller Promotion List Page Should Be Appeared
    Wait Until Element Is Visible    &{storeFrontMobileDict}[pageHeader]
    ${pageName}=    Get Text    &{storeFrontMobileDict}[pageHeader]
    BuiltIn.Should Match    '${pageName}'    'โปรโมชั่นร้านค้า'

Seller Promotion List Page Should Not Be Appeared
    Element Should Not Be Visible    &{storeFrontMobileDict}[pageHeader]//div[@class="noresult-box"]

Seller Promotion Should Be Available
    Element Should Not Be Visible    &{levelBMobileDict}[noPromotion]

No Seller Promotion Page Should Be Appeared
    ${msg}=    Get Text    &{levelBMobileDict}[noPromotion]
    BuiltIn.Should Match    '${msg}'    'ร้านนี้ยังไม่มีโปรโมชั่นในช่วงเวลานี้'

Scroll To Seller Promotion
    [Arguments]    ${promotionName}
    ${locator}=    Replace String    &{levelBMobileDict}[promotionName]    _promotionName    ${promotionName}
    Common.Scroll Element Into View    ${locator}

Seller Promotion Description Should Be Appeared
    [Arguments]    ${promotionName}    ${expectedText}
    ${locator}=    Replace String    &{levelBMobileDict}[promotionDesc]    _promotionName    ${promotionName}
    ${desc}=    Get Element Attribute    ${locator}@innerText
    BuiltIn.Should Match    '${desc}'    '${expectedText}'

Seller Promotion Duration Should Be Appeared
    [Arguments]    ${promotionName}    ${expectedText}
    ${locator}=    Replace String    &{levelBMobileDict}[promotionDate]    _promotionName    ${promotionName}
    ${range}=    Get Element Attribute    ${locator}@innerText
    BuiltIn.Should Match    '${range}'    '${expectedText}'

Seller Promotion Should Be Appeared
    [Arguments]    ${promotionName}
    ${locator}=    Replace String    &{levelBMobileDict}[promotionName]    _promotionName    ${promotionName}
    Page Should Contain Element    ${locator}
    Common.Scroll Element Into View    ${locator}

Seller Promotion Should Not Be Appeared
    [Arguments]    ${promotionName}
    ${locator}=    Replace String    &{levelBMobileDict}[promotionName]    _promotionName    ${promotionName}
    Page Should Not Contain Element    ${locator}

Click View Product In Seller Promotion
    [Arguments]    ${promotionName}
    ${locator}=    Replace String    &{levelBMobileDict}[viewPromotion]    _promotionName    ${promotionName}
    Click Element    ${locator}

##KEYWORDS FOR CONTACT US PAGE
Open Wemall Seller Contact Page On Mobile
    [Arguments]    ${shopSlugID}
    Common.Open Custom Browser    ${URL_MOBILE}/${shopSlugID}/contact    Mobile

Seller Contact Page Should Be Appeared
    Wait Until Element Is Visible    &{storeFrontMobileDict}[pageHeader]
    ${pageName}=    Get Text    &{storeFrontMobileDict}[pageHeader]
    BuiltIn.Should Match    '${pageName}'    'ติดต่อร้านค้า'
