*** Settings ***
Library     BuiltIn
Library     String
Resource    ../Common/Common.txt
Resource    ../../Resource/WeMall/Configuration/Staging/serverconfig.txt
Resource    ../../Resource/WeMall/MobileElement/Homepage.robot
Resource    ../../Resource/WeLoveShopping/MobileElement/Homepage.robot

*** Variables ***
&{wemallMobileDict}    highlightedTab=xpath=//li[(@role='presentation') and (@class='active')]
...    ccPromotionDetails=xpath=//div[@class='credit-desc ng-binding']/h4[text()='_promotionName']
...    ccPromotionDetailsTitle=xpath=//a[@once-text='content.title']
...    mainMenuExpanded=xpath=//ng-menu[@style='display: block; transform: translateX(0px);']
...    categotyIcon=xpath=//div[@ng-repeat='category in categories']//div[text()='_catName']
...    sectionName=xpath=//div[@class='header-title']/h2[normalize-space(text())='_title']
...    firstBrand=xpath=//div[(@ng-repeat='brands in homeShopByBrand.content') and (@class='item ng-scope active')]/div/div[1]/a[1]
...    firstShowroomBanner=xpath=//div[@class='header-title']/h2[text()='_showroomName']//following::img[1]
...    allBrandsFilter=xpath=//div[@class='categories-title']/a[text()='_selectFilter']
...    selectedFilterLabel=xpath=//h2[text()='_selectedFilter']
...    selectBrand=xpath=//ul[@class='categories-title-list']/li/a[text()='_brandname']

*** Keywords ***
##COMMON KEYWORDS FOR HOME PAGE
Open Wemall Portal page on Mobile
    Common.Open Custom Browser    ${URL_MOBILE}    Mobile

Open WeLoveShopping Portal page on Mobile
    Common.Open Custom Browser    ${URL_MOBILE}    Mobile

Wemall Portal page should be appeared
    Wait Until Element Is Visible    ${fre_wm_home}

Wemall Portal page should not be appeared
    Wait Until Element Is Not Visible    //body[@class='mc_home']

Wemall Logo should be appeared
    Wait Until Element Is Visible    //div[@class="wemall-logo"]

Selected Tab is highlighted
    [Arguments]	${tabName}
    ${selectedTab}=    Get Text    &{wemallMobileDict}[highlightedTab]
    Should Match    ${selectedTab}    ${tabName}

Scroll Down to section
    [Arguments]    ${sectionName}
    ${locator}=    String.Replace String    &{wemallMobileDict}[sectionName]    _title    ${sectionName}
    Common.Scroll Element Into View    ${locator}

Refresh Browser
    Reload Page

##CREDIT CARD PROMOTION
Click on Credit Card Promotion tab
    Click Element    ${m_wm_creditCardTab}

View Credit Card Promotion Details
    [Arguments]    ${creditCardPromotion}
    ${locator}=    String.Replace String    &{wemallMobileDict}[ccPromotionDetails]    _promotionName    ${creditCardPromotion}
    Click Element    ${locator}

Credit Card Promotion Details page is appeared
    [Arguments]    ${creditCardPromotionTitle}
    ${ccTitle}=    Get Text    &{wemallMobileDict}[ccPromotionDetailsTitle]
    BuiltIn.Should Match    ${ccTitle}    ${creditCardPromotionTitle}

Click Credit Card Breadcrumb
    Click Element    &{wemallMobileDict}[ccPromotionDetailsTitle]

##MAIN MENU
Click Main Menu
    Click Element    //span[@class="icon-bar"]

Click Main Menu Category
    Click Element    ${m_wm_mainmenu_categories}

Not Login Check Mainmenu List
    Wait Until Element Is Visible    //ul[@class="menu-list ng-scope"]
    ${mainmenu_list}    Execute Javascript    return ${m_wm_mainmenu}.length;
    Should Be Equal As Integers    ${mainmenu_list}    7
    Element Should Contain    ${m_wm_mainmenu_home}    หน้าแรก
    Element Should Contain    ${m_wm_mainmenu_categories}    หมวดหมู่สินค้า
    Element Should Contain    ${m_wm_mainmenu_cart}    ตะกร้าสินค้า
    Element Should Contain    ${m_wm_mainmenu_notlogin}    เข้าสู่ระบบ
    Element Should Contain    ${m_wm_mainmenu_register}    สมัครสมาชิก
    Element Should Contain    ${m_wm_mainmenu_help}    ช่วยเหลือ
    Element Should Contain    ${m_wm_mainmenu_contact}    ติดต่อเรา

Login Check Mainmenu List
    Wait Until Element Is Visible    //ul[@class="menu-list ng-scope"]
    ${mainmenu_list}    Execute Javascript    return ${m_wm_mainmenu}.length;
    Should Be Equal As Integers    ${mainmenu_list}    9
    Element Should Contain    ${m_wm_mainmenu_home}    หน้าแรก
    Element Should Contain    ${m_wm_mainmenu_categories}    หมวดหมู่สินค้า
    Element Should Contain    ${m_wm_mainmenu_cart}    ตะกร้าสินค้า
    Element Should Contain    ${m_wm_mainmenu_orderreport}    รายการสั่งซื้อ
    Element Should Be Visible    ${m_wm_mainmenu_store}
    Element Should Contain    ${m_wm_mainmenu_help}    ช่วยเหลือ
    Element Should Contain    ${m_wm_mainmenu_contact}    ติดต่อเรา
    Element Should Contain    ${m_wm_mainmenu_logout}    ออกจากระบบ

Mainmenu Category Level1
    Wait Until Element Is Visible    //div[@class="body-container ng-scope"]
    ${category_list}    Execute Javascript    return ${m_wm_mainmenu_category_lv1}.length;
    Should Be True    ${category_list} > 0

Click Mainmenu Category Level1
    Click Element    ${m_wm_mainmenu_category_maincategory}
    Wait Until Element Is Visible    ${m_wm_mainmenu_viewall_productcategory}

Click Logout Menu
    Click Element    ${m_wm_mainmenu_logout}

##LOGIN FORM
Open Login page
    Click Element    ${m_wm_login}

Enter Username
    [Arguments]    ${username}
    Input Text    ${m_wm_username}    ${username}

Enter password
    [Arguments]    ${password}
    Input Text    ${m_wm_password}    ${password}

Click Login button
    Click Element    ${m_wm_loginBtn}

User is logged in to WeMall successfully
    Wait Until Element Is Visible    ${m_wm_myAcc}

##WIDGETS
Click Hamburger icon
    Element Should Be Visible    ${m_wm_hamburger}
    Click Element    ${m_wm_hamburger}

Click WeMall logo
    Click Element    ${m_wm_logo}

Click เข้าสู่ระบบ button
    Click Element    ${m_wm_login}

Click ตะกร้าสินค้า icon
    Click Element    ${m_wm_cart}

Click User Avatar icon
    Click Element    ${m_wm_myAcc}

Click My Shop icon
    Click Element    ${m_wm_myShop}

เข้าสู่ระบบ page should be appeared
    Wait Until Element Is Visible    //div[@class='wls-login-box']

ตะกร้าสินค้า page should be appeared
    Wait Until Element Is Visible    //div[@class='wrapper-cart']

Main menu should be appeared
    Element Should Be Visible    &{wemallMobileDict}[mainMenuExpanded]

ข้อมูลส่วนตัว page should be appeared
    Wait Until Element Is Visible    //div[@class='box-bar-title']//following-sibling::*[contains(.,'ข้อมูลส่วนตัว')]

รายการสั่งซื้อ page should be appeared
    Wait Until Element Is Visible    //div[@class='box-bar-title']//following-sibling::*[contains(.,'รายการสั่งซื้อ')]

Manage Store page should be appeared
    [Arguments]    ${storeName}
    Wait Until Element Is Not Visible    //div[@class='preloader ng-isolate-scope']
    Location Should Be    https://store.wemall-dev.com/${storeName}/admin/dashboard/summary

##HIGHTLIGHT BANNER
Click Highlight Banner Image
    Element Should Be Visible    ${activeBanner}
    Click Element    ${activeBanner}

##CATEGORY ICONS
Click Category icon
    [Arguments]    ${categoryName}
    ${locator}=    String.Replace String    &{wemallMobileDict}[categotyIcon]    _catName    ${categoryName}
    Click Element    ${locator}

##SHOP BY BRANDS
Click First Brand banner
    Click Element    &{wemallMobileDict}[firstBrand]

Click Left Arrow on Shop by Brand section
    Click Element    ${m_wm_brand_left_arrow}

Click Right Arrow on Shop by Brand section
    Click Element    ${m_wm_brand_right_arrow}

Click ดูแบรนด์เพิ่มเติมที่นี่ link
    Click Element    ${m_wm_view_all_brands}

##VIEW ALL BRANDS
Open View All Brands Page
    Common.Open Custom Browser    ${URL_MOBILE}/brand    Mobile

View All Brands Page Should Be Appeared
    Wait Until Element Is Visible    //div[@class='categories-title']

View All Brands Page Should Not Be Appeared
    Wait Until Element Is Not Visible    //div[@class='categories-title']

Shop By Brand Breadcrumb Should Be Appeared
    Element Should Be Visible    ${m_wm_breadcrumb_brand}

Click On Shop By Brand Breadcrumb
    Click Element    ${m_wm_breadcrumb_brand}

Select Filter
    [Arguments]    ${selectFilter}
    ${locator}=    String.Replace String    &{wemallMobileDict}[allBrandsFilter]    _selectFilter    ${selectFilter}
    Click Element    ${locator}

Selected Filter Should Be Appeared
    [Arguments]    ${selectedFilter}
    ${locator}=    String.Replace String    &{wemallMobileDict}[selectedFilterLabel]    _selectedFilter    ${selectedFilter}
    Element Should Be Visible    ${locator}

Select Brand
    [Arguments]    ${selectBrand}
    ${locator}=    String.Replace String    &{wemallMobileDict}[selectBrand]    _brandname    ${selectBrand}
    Wait Until Element Is Visible    ${locator}
    Click Element    ${locator}

##SHOWROOM
Click First Banner on Showroom section
    [Arguments]    ${showroomName}
    ${locator}=    String.Replace String    &{wemallMobileDict}[firstShowroomBanner]    _showroomName    ${showroomName}
    Click Element    ${locator}

Showroom section should not be appeared
    ${currentURL}=    Get Location
    BuiltIn.Should Not Match    '${currentURL}'    'https://m.wemall-dev.com/'

##EVERYDAY WOW
Verify EverydayWoW active
    Element Should Be Visible    ${m_wm_logo_everydaywow}
    Element Should Contain    ${m_wm_countdown_everydaywow}    เหลือเวลาอีก
    ${thumb}    Execute Javascript    return ${m_wm_count_thumb_everydaywow}.length;
    Should Be Equal As Integers    ${thumb}    6


### WeLoveShopping ###
Click Main Menu On Homepage
    Click Element    ${btn_mainmenu}

Click Logout
    Click Element    ${logout}

Verify Menu Free Register Not Login
    Element Should Be Visible    ${group_menu_store}
    Element Should Contain    ${menu_free_register_notlogin}    สมัครร้านค้าฟรี

Verify Menu Free Register Login
    Element Should Be Visible    ${group_menu_store}
    Element Should Contain    ${menu_free_register_login}    สมัครร้านค้าฟรี

Verify Menu Individual
    Element Should Contain    ${menu_individual}    บุคคลธรรมดา

Verify Menu Corperate
    Element Should Contain    ${menu_corparate}    นิติบุคคล

Verify Menu Exit When Login
    Element Should Contain    ${menu_exit}    ออกจากระบบ

Verify Not Display Menu Exit Not Login
    Element Should Not Contain    ${menu_exit}    ออกจากระบบ

Verify Not Display Menu Register When Login User Store
    Element Should Not Contain    ${menu_free_register_login}    สมัครร้านค้าฟรี

Verify Display Menu ManageShop When Login User Store
    Element Should Contain    ${menu_manageshop}    จัดการร้านค้า
    Element Should Be Visible    ${menu_shop}

Click Individual Menu
    Click Element    ${menu_individual}

Click Corperate Menu
    Click Element    ${menu_corparate}

Click Shop Menu
    Click Element    ${menu_shop}

Click Wemall Contact Us Menu
    Click Element    ${icn_contactus}
    Wait Until Element Is Visible     ${fre_mb_contactus}

Click Weloveshopping Contact Us Menu
    Click Element    ${icn_wls_contactus}
    Wait Until Element Is Visible     ${fre_wls_mb_contactus}

Verify Wemall Live Chat Agent
    Wait Until Element Is Visible    ${icn_mb_live_chat}
    Element Should Be Visible    ${icn_mb_live_chat}

Check To Wemall Live Chat Mobile Page
    Click Element    ${icn_mb_live_chat}
    Select Window    New
    Element Should Be Visible    ${txt_name_chat}
    Element Should Be Visible    ${txt_email_chat}
    Element Should Be Visible    ${txt_info_chat}
    Element Should Be Visible    ${btn_submit_chat}

Verify The WeLoveShopping Information Correctly
    Element Should Contain    ${lab_wls_mb_contactus}    WeLoveShopping แหล่งนัดพบของร้านค้าที่ถูกใจ
    Element Should Contain   ${lab_wls_mb_email}    support@weloveshopping.com

Verify The Wemall Information Correctly
    Element Should Contain    ${lab_wm_mb_contactus}    WeMall.com : แหล่งช้อปปิ้งออนไลน์ สินค้าแบรนด์เนมที่แรกของไทย
    Element Should Contain   ${lab_wm_mb_email}    support@wemall.com

Verify When Click Individual Menu Incase Not Login
    Wait Until Element Is Visible    ${header_register_page}
    ${url_register}    Get Location
    Should Be Equal    ${url_register}    https://account.wls-dev.com/register/user

Verify When Click Individual Menu Incase Login
    Wait Until Element Is Visible    ${box_shop_individual_register}
    ${url_shopregister}    Get Location
    Should Be Equal    ${url_shopregister}    https://account.wls-dev.com/register/store

Verify When Click Corperate Menu Incase Not Login
    Wait Until Element Is Visible    ${header_register_corppage}
    ${url_corpregister}    Get Location
    Should Be Equal    ${url_corpregister}    https://account.wls-dev.com/corporate/user

Verify When Click Corperate Menu Incase Login
    Wait Until Element Is Visible    ${box_shop_corparate_register}
    ${url_corprstoregister}    Get Location
    Should Be Equal    ${url_corprstoregister}    https://account.wls-dev.com/corporate/store

Verify When Click Shop Menu Incase Login
    Wait Until Element Is Visible    ${shopname_storefornt}
    ${url_shopbackend}    Get Location
    Should Be Equal    ${url_shopbackend}    https://store.wls-dev.com/wlsautomate26/admin/dashboard/summary
