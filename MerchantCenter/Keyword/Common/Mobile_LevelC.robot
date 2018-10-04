*** Settings ***
Library     BuiltIn
Library     String
Resource    ../Common/Common.txt
Resource    ../Common/Mobile_Home.robot
Resource    ../../Resource/WeMall/Configuration/Staging/serverconfig.txt
Resource    ../../Resource/WeMall/MobileElement/Homepage.robot
Resource    ../../Resource/WeMall/MobileElement/LevelC.robot

*** Variables ***
&{levelCMobileDict}    pageHeader=xpath=//div[@class='box-title-bar active']
...    searchResultKeyword=xpath=//div[@class='box-text ng-binding']
...    noResult=xpath=//div[@class='box-text']
...    noResultContent=xpath=//div[@class='no-result-title']/span
...    getProductName=xpath=//div[@class='product-name']
...    getProductPrice=xpath=//div[@class='box-price']
...    selectedSortOption=xpath=//span[@class='sort-active ng-binding']
...    sortingOption=xpath=//label[(@ng-click='filterDeal()') and (text()[contains(.,'_filter')])]

*** Keywords ***
##CATEGORY
Navigate Level C Recommend Page
    Go To    ${URL_MOBILE}/recommended

Go To LevelC Category No Banner
    Common.Open Custom Browser    ${URL_MOBILE}/c/${category_no_banner}    Mobile

Go To LevelC Category Banner
    Common.Open Custom Browser    ${URL_MOBILE}/c/${maincategory_banner}    Mobile

Categories page should be appeared
    ${pageHeader}=    Get Text    &{levelCMobileDict}[pageHeader]
    BuiltIn.Should Match    '${pageHeader}'    'หมวดหมู่สินค้า'

Focus Banner Category
    Element Should Be Visible    ${wm_banner_category}

Focus No Banner Category
    Element Should Not Be Visible    ${wm_banner_category}

Verify Badge Promocode
    Page Should Contain Element    ${wm_category_badge_promocode}

##SEARCH FEATURE
Enter Search Keyword
    [Arguments]    ${keyword}
    Input Text    ${m_wm_searchBox}    ${keyword}

Click Search Button
    Click Element    ${m_wm_searchIcon}

Searched Product should be found
    [Arguments]    ${keyword}
    Wait Until Element Is Visible    &{levelCMobileDict}[searchResultKeyword]
    ${searchResult}=    Get Element Attribute    &{levelCMobileDict}[searchResultKeyword]@textContent
    ${prefix}    ${searchKeyword}    ${searchNumber}=    String.Split String    ${searchResult}
    ${searchNumber}=    String.Strip String    ${searchNumber}    characters=()
    BuiltIn.Should Match    '${prefix}'    'ผลการค้นหา:'
    ##VERIFY KEYWORD
    BuiltIn.Should Match    '${searchKeyword}'    '${keyword}'
    ##VERIFY NUMBER
    BuiltIn.Should Not Be Empty    ${searchNumber}

Search Product should not be found
    [Arguments]    ${keyword}
    ##BREADCRUMB
    Wait Until Element Is Visible    &{levelCMobileDict}[noResult]
    ${searchResult}=    Get Element Attribute    &{levelCMobileDict}[noResult]@textContent
    ${prefix}    ${result}=    String.Split String    ${searchResult}
    BuiltIn.Should Match    '${prefix}'    'ผลการค้นหา:'
    BuiltIn.Should Match    '${result}'    'ไม่พบสินค้าที่คุณต้องการ'
    ##CONTENT
    ${content}=    Get Text    &{levelCMobileDict}[noResultContent]
    ${content}=    String.Strip String    ${content}    characters="
    BuiltIn.Should Match    '${content}'    '${keyword}'

Go To Level C page
    Mobile_Home.Open Wemall Portal page on Mobile
    Mobile_Home.Wemall Portal page should be appeared
    Mobile_Home.Click Hamburger icon
    Mobile_Home.Click Main Menu Category
    Mobile_LevelC.Categories page should be appeared

Enter Valid Keyword
    [Arguments]    ${keyword}
    Mobile_LevelC.Enter Search Keyword    ${keyword}
    Mobile_LevelC.Click Search Button
    Mobile_LevelC.Searched Product should be found    ${keyword}

Enter Invalid Keyword
    [Arguments]    ${keyword}
    Mobile_LevelC.Enter Search Keyword    ${keyword}
    Mobile_LevelC.Click Search Button
    Mobile_LevelC.Search Product should not be found    ${keyword}

##COMMON PRODUCT KEYWORDS
View as List View
    Click Element    ${wm_view_list}

List view is selected
    Element Should Be Visible    ${wm_view_list_selected}

View as Thumb View
    Click Element    ${wm_view_thumb}

Thumb view is selected
    Element Should Be Visible    ${wm_view_thumb_selected}

Product Name should be appeared
    [Arguments]    ${productName}
    ${displayName}=	Get Text    &{levelCMobileDict}[getProductName]
    BuiltIn.Should Match    '${displayName}'    '${productName}'

Product Price should be appeared
    [Arguments]    ${productPrice}
    ${displayPrice}=    Get Text    &{levelCMobileDict}[getProductPrice]
    BuiltIn.Should Match    '${displayPrice}'    '${productPrice}'

Scroll page to footer
    Common.Scroll Element Into View    ${m_wm_copyright}

Click on Scroll to Top button
    Element Should Be Visible    ${m_wm_scrollTop}
    Click Element    ${m_wm_scrollTop}

Product Search Box is appeared
    Element Should Be Visible    ${m_wm_searchBox}

Sort option is selected
    [Arguments]    ${sortOption}
    ${selectedOption}=    Get Element Attribute    &{levelCMobileDict}[selectedSortOption]@outerText
    BuiltIn.Should Match    '${selectedOption}'    '${sortOption}'

Sort Product by Lowest Price
    Click Element    ${wm_sort_option}
    Click Element    ${wm_sort_lowest}

Products should be sorted by lowest price
    : FOR    ${i}    IN RANGE    1    4
    \    ${price_now}    Get Text    //li[@ng-click='linkTo("d/" + product.id)'][${i}]//div[@class='box-price']/span[1]
    \    ${i_next}    Add Operation    ${i}    1
    \    ${price_next}    Get Text    //li[@ng-click='linkTo("d/" + product.id)'][${i_next}]//div[@class='box-price']/span[1]
    \    ${price_now}    Remove String    ${price_now}    บาท
    \    ${price_next}    Remove String    ${price_next}    บาท
    \    Should Be True    ${price_now} <= ${price_next}

Sort Product by Highest Price
    Click Element    ${wm_sort_option}
    Click Element    ${wm_sort_highest}

Products should be sorted by higest price
    : FOR    ${i}    IN RANGE    1    4
    \    ${price_now}    Get Text    //li[@ng-click='linkTo("d/" + product.id)'][${i}]//div[@class='box-price']/span[1]
    \    ${i_next}    Add Operation    ${i}    1
    \    ${price_next}    Get Text    //li[@ng-click='linkTo("d/" + product.id)'][${i_next}]//div[@class='box-price']/span[1]
    \    ${price_now}    Remove String    ${price_now}    บาท
    \    ${price_next}    Remove String    ${price_next}    บาท
    \    Should Be True    ${price_now} >= ${price_next}

##LEVELC EVERYDAY WOW
Go To LevelC Everyday WOW
    Common.Open Custom Browser    ${URL_MOBILE}/everyday-wow    Mobile

Go To LevelC Next Everyday WOW
    Common.Open Custom Browser    ${URL_MOBILE}/everyday-wow?nextdeal=1    Mobile

Verify Now Everyday Wow
    Wait Until Element Is Visible    ${banner_everydaywow}
    Element Should Be Visible    ${breadcurmb_everydaywow}    Everyday Wow
    Element Should Be Visible    ${list_levelc_product_everydaywow}
    Element Should Be Visible    ${btn_shop}    ช้อปเลย

Verify Next Everyday Wow
    Wait Until Element Is Visible    ${banner_everydaywow}
    Element Should Be Visible    ${breadcurmb_everydaywow}    Everyday Wow
    Element Should Be Visible    ${banner_nexteverydaywow}    ช้อปสินค้าใหม่พร้อมกันเริ่มเวลา
    Element Should Be Visible    ${pictuer_nexteverydaywow}

Click Button Shopnow
    Click Element    ${btn_shop}
    Wait Until Element Is Visible    ${nav_topbox}

Open Sorting Option Everyday Wow
    Click Element    ${wow_sort_option}

Select Sorting Option
    [Arguments]    ${_option}
    ${locator}=    String.Replace String    &{levelCMobileDict}[sortingOption]    _filter    ${_option}
    Click Element    ${locator}
    Wait Until Element Is Visible    ${banner_everydaywow}

Products Everyday Wow should be sorted by lowest price
    : FOR    ${i}    IN RANGE    1    4
    \    ${price_now}    Get Text    //li[${i}]//span[@class="price ng-binding"]
    \    ${i_next}    Add Operation    ${i}    1
    \    ${price_next}    Get Text    //li[${i_next}]//span[@class="price ng-binding"]
    \    ${price_now}    Remove String    ${price_now}    บาท
    \    ${price_next}    Remove String    ${price_next}    บาท
    \    Should Be True    ${price_now} <= ${price_next}

Products Everyday Wow should be sorted by Highest price
    : FOR    ${i}    IN RANGE    1    4
    \    ${price_now}    Get Text    //li[${i}]//span[@class="price ng-binding"]
    \    ${i_next}    Add Operation    ${i}    1
    \    ${price_next}    Get Text    //li[${i_next}]//span[@class="price ng-binding"]
    \    ${price_now}    Remove String    ${price_now}    บาท
    \    ${price_next}    Remove String    ${price_next}    บาท
    \    Should Be True    ${price_now} >= ${price_next}

Open Fillter Option Everyday Wow
    Click Element    ${wow_fillter_option}

Slect All Category On Everyday Wow
    ${count_cate}    Execute Javascript    return ${count_category_everydaywow}
    ${count_cate}    Evaluate    ${count_cate} + 1
    : FOR    ${a}    IN RANGE    1    ${count_cate}
    \    Click Element    //div[@ng-repeat="category in categories"][${a}]//input[@type="checkbox"]
    Click Element    ${btn_confrim}

Slect All Collection On Everyday Wow
    ${count_collection}    Execute Javascript    return ${count_collection_everydaywow}
    ${count_collection}    Evaluate    ${count_collection} + 1
    : FOR    ${a}    IN RANGE    1    ${count_collection}
    \    Click Element    //div[@ng-repeat="tag in tags"][${a}]//input[@type="checkbox"]
    Click Element    ${btn_confrim}

##LEVELC CAMPAIGN
Open Levelc Campaign
    [Arguments]    ${id_campaign}
    Common.Open Custom Browser    ${URL_MOBILE}/campaign/${id_campaign}    Mobile

Verify No Product In Campaign
    Wait Until Element Is Visible    ${banner}
    Wait Until Element Is Visible    ${breadcurmb_camapign}
    Element Should Contain    ${breadcurmb_camapign}    โปรโมชั่น:
    Element Should Contain    ${box_product}    กิจกรรมส่งเสริมการขายนี้ยังไม่มีสินค้าเข้าร่วมรายการ

Verify Product In Campaign
    Wait Until Element Is Visible    ${banner}
    Wait Until Element Is Visible    ${breadcurmb_camapign}
    Element Should Contain    ${breadcurmb_camapign}    โปรโมชั่น:
    Element Should Be Visible    ${campaign_sort_catgory}
    Element Should Be Visible    ${campaign_sort}
    ${count_product_campaign}    Execute Javascript    return ${count_product}
    Should Be True    ${count_product_campaign} > 0

##LEVELC RECOMMEND
Go To LevelC Recommend
    Common.Open Custom Browser    ${URL_MOBILE}/recommended    Mobile
    Wait Until Element Is Visible    ${link_back}
    ${url_recommend}    Get Location
    Should Be True    '${url_recommend}' == '${URL_MOBILE}/recommended'

Click To Link Recommend
    Click Element    ${link_back}
    ${url_home}    Get Location
    Should Be True    '${url_home}' == '${URL_MOBILE}/'

Check Sorting Default Recommend
    [Arguments]    ${sortingOption}
    Element Should Contain    ${default_sorting}    ${sortingOption}


