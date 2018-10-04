*** Settings ***
Suite Setup       WMS Switch Project    wls
Suite Teardown    Close All Browsers
Force Tags        WMS-Web    RECON2017MC19    mc-wls
Library           SeleniumLibrary
Library           String
Library           DateTime
Resource          ../../../../Resource/WeLoveShopping/init.robot
Resource          ../../../../Resource/WeLoveShopping/WebElement/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Account_History.txt
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/WMS_Promocode.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/WLSWMSPromoCode.txt

*** Test Case ***
TC_MC_07283
    [Documentation]    WLSWMSPromocode : Add promocode by Category in case Not Select Category
    [Tags]    Medium
    Go to promotion code on wms page
    Wait Until Element Is Visible    ${btn_add_promotioncode}    ${expect_load_time}
    Click add promotioncode button
    Input promotioncode name    PromocodeByCategory
    Input promotioncode    QATEST
    Select period time for promotioncode
    Select discount type for promotion code on product detail page    amount
    Input Text    //input[@id="discount_value"]    10
    Input Text    //input[@name="order_min"]    300
    Select promotioncode condition    category
    Click add/edit category button
    Click add category button
    Click save promotioncode button
    Page Should Contain    กรุณากำหนด Category ที่สามารถเข้าร่วมรายการ

TC_MC_07284
    [Documentation]    WLSWMSPromocode : Check Category table in case select Main Category
    [Tags]    High
    Go to promotion code on wms page
    Wait Until Element Is Visible    ${btn_add_promotioncode}    ${expect_load_time}
    Click add promotioncode button
    Input promotioncode name    PromocodeByCategory
    Input promotioncode    QATEST
    Select period time for promotioncode
    Select discount type for promotion code on product detail page    amount
    Input Text    //input[@id="discount_value"]    10
    Input Text    //input[@name="order_min"]    300
    Select promotioncode condition    category
    Click add/edit category button
    Expand all category
    Click check box for choose category    แฟชั่น
    Click add category button
    ${result}    Execute Javascript    return $("[id='body_category'] > tr").length
    Should Be True    ${result} > 0
    ${categoryname}=    Get Text    //*[@id="body_category"]/tr[2]/td[2]
    Should Contain    ${categoryname}    แฟชั่น

TC_MC_07285
    [Documentation]    WLSWMSPromocode : Check Category table in case select All SubCategory
    [Tags]    High
    Go to promotion code on wms page
    Wait Until Element Is Visible    ${btn_add_promotioncode}    ${expect_load_time}
    Click add promotioncode button
    Input promotioncode name    PromocodeByCategory
    Input promotioncode    QATEST
    Select period time for promotioncode
    Select discount type for promotion code on product detail page    amount
    Input Text    //input[@id="discount_value"]    10
    Input Text    //input[@name="order_min"]    300
    Select promotioncode condition    category
    Click add/edit category button
    Expand all category
    Click check box for choose category    กระเป๋า
    Click check box for choose category    เสื้อผ้า
    Click check box for choose category    รองเท้า
    Click check box for choose category    เครื่องแต่งกาย
    Click check box for choose category    เครื่องประดับและอัญมณี
    Click check box for choose category    นาฬิกา
    Click add category button
    ${result}    Execute Javascript    return $("[id='body_category'] > tr").length
    Should Be True    ${result} > 0
    ${categoryname}=    Get Text    //*[@id="body_category"]/tr[2]/td[2]
    Should Contain    ${categoryname}    แฟชั่น

TC_MC_07286
    [Documentation]    WLSWMSPromocode : Check Category table in case select some Sub Category
    [Tags]    High
    Go to promotion code on wms page
    Wait Until Element Is Visible    ${btn_add_promotioncode}    ${expect_load_time}
    Click add promotioncode button
    Input promotioncode name    PromocodeByCategory
    Input promotioncode    QATEST
    Select period time for promotioncode
    Select discount type for promotion code on product detail page    amount
    Input Text    //input[@id="discount_value"]    10
    Input Text    //input[@name="order_min"]    300
    Select promotioncode condition    category
    Click add/edit category button
    Expand all category
    Click check box for choose category    เสื้อผ้า
    Click check box for choose category    กระเป๋า
    Click add category button
    ${result}    Execute Javascript    return $("[id='body_category'] > tr").length
    Should Be True    ${result} > 0
    ${categoryname1}=    Get Text    //*[@id="body_category"]/tr[2]/td[2]
    ${categoryname2}=    Get Text    //*[@id="body_category"]/tr[3]/td[2]
    Should Contain    ${categoryname1}    เสื้อผ้า
    Should Contain    ${categoryname2}    กระเป๋า

TC_MC_07288
    [Documentation]    WLSWMSPromocode : Click Add Category again in Category list
    [Tags]    Medium
    Go to promotion code on wms page
    Wait Until Element Is Visible    ${btn_add_promotioncode}    ${expect_load_time}
    Click add promotioncode button
    Input promotioncode name    PromocodeByCategory
    Input promotioncode    QATEST
    Select period time for promotioncode
    Select discount type for promotion code on product detail page    amount
    Input Text    //input[@id="discount_value"]    10
    Input Text    //input[@name="order_min"]    300
    Select promotioncode condition    category
    Click add/edit category button
    Expand all category
    Click check box for choose category    เสื้อผ้า
    Click check box for choose category    กระเป๋า
    Click add category button
    ${result}    Execute Javascript    return $("[id='body_category'] > tr").length
    Should Be True    ${result} > 0
    ${categoryname1}=    Get Text    //*[@id="body_category"]/tr[2]/td[2]
    ${categoryname2}=    Get Text    //*[@id="body_category"]/tr[3]/td[2]
    Should Contain    ${categoryname1}    เสื้อผ้า
    Should Contain    ${categoryname2}    กระเป๋า
    Click add/edit category button
    Click check box for choose category    แม่และเด็ก
    Click check box for choose category    เครื่องสำอาง
    Click add category button
    ${result}    Execute Javascript    return $("[id='body_category'] > tr").length
    Should Be True    ${result} > 0
    ${categoryname1}=    Get Text    //*[@id="body_category"]/tr[2]/td[2]
    ${categoryname2}=    Get Text    //*[@id="body_category"]/tr[3]/td[2]
    ${categoryname3}=    Get Text    //*[@id="body_category"]/tr[4]/td[2]
    ${categoryname4}=    Get Text    //*[@id="body_category"]/tr[5]/td[2]
    Should Contain    ${categoryname1}    เสื้อผ้า
    Should Contain    ${categoryname2}    กระเป๋า
    Should Contain    ${categoryname3}    เครื่องสำอาง
    Should Contain    ${categoryname4}    แม่และเด็ก

TC_MC_07291
    [Documentation]    WLSWMSPromocode : Search Product exclusion by product id
    [Tags]    Medium
    Go to promotion code on wms page
    Wait Until Element Is Visible    ${btn_add_promotioncode}    ${expect_load_time}
    Click add promotioncode button
    Input promotioncode name    PromocodeByCategory
    Input promotioncode    QATEST
    Select period time for promotioncode
    Select discount type for promotion code on product detail page    amount
    Input Text    //input[@id="discount_value"]    10
    Input Text    //input[@name="order_min"]    300
    Select promotioncode condition    category
    Click add/edit category button
    Expand all category
    Click check box for choose category    แฟชั่น
    Click add category button
    Click Element    //*[@id="body_category"]/tr/td/a[@data-cat="แฟชั่น"]
    Wait Until Element Is Visible    //*[@id="product-table"]/thead/tr    ${EXPECT_LOADTIME}
    ${productid1}=    Get Text    //*[@id="product-table"]/tbody/tr[1]/td[1]
    Input Text    //input[@class="p-id s-input"]    ${productid1}
    Execute Javascript    $('button:contains(ค้นหาสินค้า)').click()
    Wait Until Element Is Visible    //*[@id="product-table"]/thead/tr    ${EXPECT_LOADTIME}
    ${Count}    Get Matching Xpath Count    //*[@id="product-table"]/tbody/tr/td[1]
    Should Be True    ${Count} == 1

TC_MC_07293
    [Documentation]    WLSWMSPromocode : Search Product exclusion in case data not found
    [Tags]    Low
    Go to promotion code on wms page
    Wait Until Element Is Visible    ${btn_add_promotioncode}    ${expect_load_time}
    Click add promotioncode button
    Input promotioncode name    PromocodeByCategory
    Input promotioncode    QATEST
    Select period time for promotioncode
    Select discount type for promotion code on product detail page    amount
    Input Text    //input[@id="discount_value"]    10
    Input Text    //input[@name="order_min"]    300
    Select promotioncode condition    category
    Click add/edit category button
    Expand all category
    Click check box for choose category    แฟชั่น
    Click add category button
    Click Element    //*[@id="body_category"]/tr/td/a[@data-cat="แฟชั่น"]
    Wait Until Element Is Visible    //*[@id="product-table"]/thead/tr    ${EXPECT_LOADTIME}
    ${productid1}=    Get Text    //*[@id="product-table"]/tbody/tr[1]/td[1]
    Input Text    //input[@class="p-id s-input"]    ${productid1}
    Input Text    //input[@class="p-name s-input"]    test
    Execute Javascript    $('button:contains(ค้นหาสินค้า)').click()
    Wait Until Element Is Visible    //*[@id="p-not"]    ${EXPECT_LOADTIME}
    Page Should Contain    ไม่พบสินค้า

TC_MC_07295
    [Documentation]    WLSWMSPromocode : Check product after add product exclusion
    [Tags]    Medium
    Go to promotion code on wms page
    Wait Until Element Is Visible    ${btn_add_promotioncode}    ${expect_load_time}
    Click add promotioncode button
    Input promotioncode name    PromocodeByCategory
    Input promotioncode    QATEST
    Select period time for promotioncode
    Select discount type for promotion code on product detail page    amount
    Input Text    //input[@id="discount_value"]    10
    Input Text    //input[@name="order_min"]    300
    Select promotioncode condition    category
    Click add/edit category button
    Expand all category
    Click check box for choose category    แฟชั่น
    Click check box for choose category    เครื่องสำอาง
    Click add category button
    Click add exclusion for category    แฟชั่น
    Select One Product exclusion
    Click add exclusion for category    เครื่องสำอาง
    Select One Product exclusion
    ${fashionid}=    Get Text    //*[@id="body_category"]/tr[2]/td[1]
    ${cosmaticid}=    Get Text    //*[@id="body_category"]/tr[3]/td[1]
    Element Should Be Visible    //div[@class="product-wrap product_exclude_${fashionid}"]
    Element Should Be Visible    //div[@class="product-wrap product_exclude_${cosmaticid}"]

TC_MC_07298
    [Documentation]    WLSWMSPromocode : Delete Category in Category list
    [Tags]    Medium
    Go to promotion code on wms page
    Wait Until Element Is Visible    ${btn_add_promotioncode}    ${expect_load_time}
    Click add promotioncode button
    Input promotioncode name    PromocodeByCategory
    Input promotioncode    QATEST
    Select period time for promotioncode
    Select discount type for promotion code on product detail page    amount
    Input Text    //input[@id="discount_value"]    10
    Input Text    //input[@name="order_min"]    300
    Select promotioncode condition    category
    Click add/edit category button
    Expand all category
    Click check box for choose category    แฟชั่น
    Click add category button
    Click Element    //*[@id="body_category"]/tr/td/button[@data-name="แฟชั่น"]
    Confirm Action
    ${result}    Execute Javascript    return $("[id='body_category'] > tr").length
    Should Be True    ${result} == 0

TC_MC_07300
    [Documentation]    WLSWMSPromocode : Delete product in product exclusion list
    [Tags]    Medium
    Go to promotion code on wms page
    Wait Until Element Is Visible    ${btn_add_promotioncode}    ${expect_load_time}
    Click add promotioncode button
    Input promotioncode name    PromocodeByCategory
    Input promotioncode    QATEST
    Select period time for promotioncode
    Select discount type for promotion code on product detail page    amount
    Input Text    //input[@id="discount_value"]    10
    Input Text    //input[@name="order_min"]    300
    Select promotioncode condition    category
    Click add/edit category button
    Expand all category
    Click check box for choose category    แฟชั่น
    Click add category button
    Click add exclusion for category    แฟชั่น
    Select One Product exclusion
    ${fashionid}=    Get Text    //*[@id="body_category"]/tr[2]/td[1]
    Click Element    //div[@class="product-wrap product_exclude_${fashionid}"]/table/tbody/tr/td[3]
    Confirm Action
    Element Should Not Be Visible    //div[@class="product-wrap product_exclude_${fashionid}"]/table

TC_MC_07301
    [Documentation]    WLSWMSPromocode : Add promocode by Category in case success (Promotion Code WLS)
    [Tags]    High
    Go to promotion code on wms page
    Wait Until Element Is Visible    ${btn_add_promotioncode}    ${expect_load_time}
    Click add promotioncode button
    Select type promotion code    single
    Input promotioncode name    PromocodeByCategory
    ${secs}    Get secs for create promotion code
    Input prefix promotioncode    PBC
    Input amount unique code    100
    Select period time for promotioncode
    Select discount type for promotion code on product detail page    percent
    Input discount    10
    Input discount max    100
    Input minimum price    300
    Select promotioncode condition    category
    Click add/edit category button
    Expand all category
    Click check box for choose category    แฟชั่น
    Click check box for choose category    ของเก่าและของสะสม
    Click add category button
    Click save promotioncode button
    Check Element Visible    ${alert_message}    ${expect_load_time}
    Check Text    ${alert_message}    เพิ่มข้อมูลสำเร็จ
    Check result on promotioncode list page after add promotioncode success    PBC


