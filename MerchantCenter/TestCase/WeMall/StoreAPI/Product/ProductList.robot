*** Setting ***
Suite Setup       Run Keywords    Account Login    ${seller_user_001}    ${seller_pwd_001}    AND    Set product data
Suite Teardown    Close Browser
Test Setup        Go To    ${URL_STORE}/${user_s001}/admin/product
Force Tags        Store-API    mc-wls
Library           SeleniumLibrary
Library           String
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Product.txt
Resource          ../../../../Resource/WeMall/WebElement/Member_SignIn.txt
Resource          ../../../../Resource/WeMall/WebElement/Product.txt
Resource          ../../../../Resource/WeMall/WebElement/Category.txt
Resource          ../../../../Resource/WeMall/WebElement/WMS_MonitoringListing.txt

*** variable ***
#${id_product}    L91200113
### Locator ###
${product_id_name}    $('div[style="text-align:center;margin-top: 3px;font-size:11px;"]')


*** Keywords ***
Write Variable to File
    [Arguments]    ${variable_name}    ${value}
    ${variable}    Catenate    SEPARATOR=    ${    ${variable_name}    }    ${SPACE}${SPACE}${SPACE}${SPACE}    ${value}
    #Append To File    ${path}${/}Config${/}${ENV}/robotdata.txt    ${\n}${variable}
    ${FilePath}    Replace String    ${CURDIR}    /TestCase/WeMall/StoreAPI/Product    /Resource/${BU}/Configuration/${ENV}
    Append To File   ${FilePath}${/}robotdata.txt    ${\n}${variable}

Check And Set Category
    [Arguments]    ${categoryname}
    Go To    ${URL_STORE}/${user_s001}/admin/category
    Input Text    search    ${categoryname}
    Execute Javascript    $('#frm_search .btn-primary').click()
    Sleep    3s
    ${Result}    Run Keyword and Return Status    Check Text Page Should Contain    ไม่พบข้อมูล
    Run Keyword If    ${Result} == True    Create Category    ${categoryname}
    Go To    ${URL_STORE}/${user_s001}/admin/product

Create Category
    [Arguments]    ${categoryname}
    Go To    ${URL_STORE}/${user_s001}/admin/category/create
    Input Text    ${input_category_name}    ${category_name}
    Execute Javascript    $('.row-fluid .btn-primary').click()
    Display Alert Footer

Check product data
    [Arguments]    ${productname}
    Go To    ${URL_STORE}/${user_s001}/admin/product
    Search product    ${productname}
    Sleep    3s
    ${Result}    Run Keyword and Return Status    Check Text Page Should Contain    ไม่พบสินค้า
    ${status}    Run Keyword If    '${Result}' == 'True'    Set Variable    ${Result}
    [Return]    ${status}

Set product data
    Set Selenium Speed    .2
    ${status}    Check product data    productfortestquickedit
    Run Keyword If    '${status}' == 'True'    Run Keywords    Go To    ${URL_STORE}/${user_s001}/admin/product/create    AND
    ...    Store Add Product By Add Photo    electronic    robot_product1_1.jpg    productfortestquickedit    productfortestquickedit
    ...    New    5    1    0    0    product
    ${status}    Check product data    productattr
    Run Keyword If    '${status}' == 'True'    Run Keywords    Go To    ${URL_STORE}/${user_s001}/admin/product/create    AND
    ...    Store Add Product By Add Photo    fashion    robot_product1_7.jpg    productattr    product_Attr    New
    ...    1000    1    2    3    producta

*** Test Case ***
TC_MC_05833
    [Documentation]    Verify value filter of product status
    [Tags]    Regression    Low
    Page Should Contain Element    inv_status
    Page Should Contain Element    //option[contains(.,'แสดงสถานะสินค้าทั้งหมด')]
    Page Should Contain Element    //option[text()='แสดงสินค้า']
    Page Should Contain Element    //option[text()='ซ่อนสินค้า']

TC_MC_05834
    [Documentation]    Verify after user click tooltip filter product status
    [Tags]    Regression    Low
    Wait Until Element Is Visible    table_report
    Page Should Contain Element    ${FilterTooltip}
    Click Element    ${FilterTooltip}
    ${ProductList_URL}    Get Location
    Sleep    3
    Select Window    title=ตัวกรองแสดงสถานะสินค้า
    Page Should Contain    ตัวกรองแสดงสถานะสินค้า
    ${ShopStatus_URL}    Get Location
    Should Be Equal    http://seller.weloveshopping.com/product-status/    ${ShopStatus_URL}
    # Close Window
    # Select Window    url=${ProductList_URL}

TC_MC_05835
    [Documentation]    Change status to "แสดงสินค้า", Incase found product
    [Tags]    Regression    Medium
    Account Login    ${seller_user_001}    ${seller_pwd_001}
    Go To    ${URL_STORE}/${user_s001}/admin/product
    Select From List By Label    inv_status    แสดงสินค้า
    Sleep    1.5
    Wait Until Element Is Visible    table_report
    ${Check_NumPage}    Execute Javascript    return $('.pagination li').length;
    : FOR    ${Index}    IN RANGE    0    ${Check_NumPage}-1
    \    Page Should Contain Element    ${ShowProductStatus}
    \    Page Should Not Contain Element    ${HideProductStatus}
    \    Go to next page

TC_MC_05836
    [Documentation]    Change status to "ซ่อนสินค้า", Incase found product
    [Tags]    Regression    Medium
    Select From List By Label    inv_status    ซ่อนสินค้า
    Sleep    1.5
    Wait Until Element Is Visible    table_report
    ${Check_NumPage}    Execute Javascript    return $('.pagination li').length;
    : FOR    ${Index}    IN RANGE    0    ${Check_NumPage}-1
    \    Page Should Not Contain Element    ${ShowProductStatus}
    \    Page Should Contain Element    ${HideProductStatus}
    \    Go to next page

TC_MC_05837
    [Documentation]    Change status to "แสดงสถานะสินค้าทั้งหมด"
    [Tags]    Regression    Low
    Select From List By Label    inv_status    แสดงสถานะสินค้าทั้งหมด
    Sleep    1.5
    Wait Until Element Is Visible    table_report
    ${Check_NumPage}    Execute Javascript    return $('.pagination li').length;
    : FOR    ${Index}    IN RANGE    0    ${Check_NumPage}-1
    \    Page Should Contain Element    ${AllProductStatus}
    \    Go to next page

TC_MC_05838
    [Documentation]    Change status to "แสดงสินค้า", Incase not found product
    [Tags]    Low    mock
    Check And Set Category    category no product
    Select From List By Label    filter    category no product
    Sleep    1.5
    Wait Until Element Is Visible    table_report
    Select From List By Label    inv_status    แสดงสินค้า
    Sleep    1.5
    Wait Until Element Is Visible    table_report
    Page Should Contain    ไม่พบสินค้า
    Select From List By Label    inv_status    ซ่อนสินค้า
    Sleep    1.5
    Wait Until Element Is Visible    table_report
    Page Should Contain    ไม่พบสินค้า

TC_MC_05840
    [Documentation]    filter display product more than 20
    [Tags]    Regression    Medium
    ###    Show Status
    Select From List By Label    inv_status    แสดงสินค้า
    Sleep    1.5
    Wait Until Element Is Visible    table_report
    ${GetPage}    Execute Javascript    return $('.pagination li').length;
    Run Keyword If    ${GetPage} > 0    Go to next page
    sleep    1.5
    Page Should Contain Element    //*[@*="inv_status"]//option[@selected="selected" and contains(.,'แสดงสินค้า')]
    Run Keyword If    ${GetPage} > 0    Go to previous page
    sleep    1.5
    Page Should Contain Element    //*[@*="inv_status"]//option[@selected="selected" and contains(.,'แสดงสินค้า')]
    ###    Hide Status
    Select From List By Label    inv_status    ซ่อนสินค้า
    Sleep    1.5
    Wait Until Element Is Visible    table_report
    ${GetPage}    Execute Javascript    return $('.pagination li').length;
    Run Keyword If    ${GetPage} > 0    Go to next page
    sleep    1.5
    Page Should Contain Element    //*[@*="inv_status"]//option[@selected="selected" and contains(.,'ซ่อนสินค้า')]
    Run Keyword If    ${GetPage} > 0    Go to previous page
    sleep    1.5
    Page Should Contain Element    //*[@*="inv_status"]//option[@selected="selected" and contains(.,'ซ่อนสินค้า')]

TC_MC_05801
    [Documentation]    Verify Selling price and Normal price. Incase quick edit.
    [Tags]    Regression    Medium
#    Search product    L${edit_product3_id}
    Search product    productfortestquickedit
    Click first product for edit
    ${before_pname}    Get Value    ${input_product_name}
    ${before_pdesc}    Get Value    ${input_product_desc}
    Go To    ${URL_STORE}/${USER_S001}/admin/product
    Search product    productfortestquickedit
    ${before_selling_price}    Get Text    ${top_record_selling_price}
    ${before_normal_price}    Get Text    ${top_record_normal_price}
    ${before_amount}    Get Text    ${top_record_amount}
    Click quick edit
    ${ing1}    Execute Javascript    return ${quick_selling_price}.val()
    ${new_ing1}    Evaluate    ${ing1}+1
    ${str1}    Convert To String    ${new_ing1}
    Execute Javascript    ${quick_selling_price}.val('${new_ing1}')
    ${ing2}    Execute Javascript    return ${quick_normal_price}.val()
    ${new_ing2}    Evaluate    ${ing2}+1
    ${str2}    Convert To String    ${new_ing2}
    Execute Javascript    ${quick_normal_price}.val('${new_ing2}')
    ${ing3}    Execute Javascript    return ${quick_amount}.val()
    ${new_ing3}    Evaluate    ${ing3}+1
    ${str3}    Convert To String    ${new_ing3}
    Execute Javascript    ${quick_amount}.val('${new_ing3}')
    Execute Javascript    $('.quick-save :first').click()
    Sleep    8s
    Search product    productfortestquickedit
    ${after_selling_price}    Get Text    ${top_record_selling_price}
    ${after_normal_price}    Get Text    ${top_record_normal_price}
    ${after_amount}    Get Text    ${top_record_amount}
    Should Be Equal    ${after_selling_price}    ${str1}
    Should Be Equal    ${after_normal_price}    ${str2}
    Should Be Equal    ${after_amount}    ${str3}
    Click first product for edit
    ${after_pname}    Get Value    ${input_product_name}
    ${after_pdesc}    Get Value    ${input_product_desc}
    Should Be Equal    ${before_pname}    ${after_pname}
    Should Be Equal    ${before_pdesc}    ${after_pdesc}

TC_MC_05730
    [Documentation]    ProductList - Search by productname.
    [Tags]    Regression    Low
    Wait Until Element Is Visible    //input[@id="search"]    ${EXPECT_LOADTIME}
    ${top_product}    Get Text    //*[@id="table_report"]/tbody/tr[1]/td[3]/div[1]/a[1]
    Search product    ${top_product}
    ${result}    Execute Javascript    return $("#table_report tbody tr:eq(0) td:eq(2)").find('a').text()
    Should Contain    ${result}    ${top_product}

TC_MC_05731
    [Documentation]    ProductList - Search by productid (Success).
    [Tags]    Regression    Medium
    ${top_pid}    Get Text    //*[@id="table_report"]/tbody/tr/td[2]/a[2]/div
    Search product    ${top_pid}
    ${result}    Execute Javascript    return $("#table_report tbody tr:eq(0) td:eq(1)").text()
    Should Contain    ${result}    ${top_pid}

TC_MC_05732
    [Documentation]    ProductList - Search by productid (Fail).
    Search product    L90
    ${msg_not_found}    Execute Javascript    return $('#errortext').text()
    Should Be Equal    ${msg_not_found}    ไม่พบสินค้า

TC_MC_05733
    [Documentation]    ProductList - Search by lower case productid.
    [Tags]    Low
    Wait Until Element Is Visible    //input[@id="search"]    ${EXPECT_LOADTIME}
    Search product    productfortestquickedit
    ${top_pid}    Get Text    //*[@id="table_report"]/tbody/tr/td[2]/a[2]/div
    ${pid}    Remove String    ${top_pid}    L
    #Input Text    ${input_keyword}    l${id}
    Search product    l${pid}
    ${result}    Execute Javascript    return $("#table_report tbody tr:eq(0) td:eq(1)").text()
    Should Contain    ${result}    ${top_pid}

TC_MC_05790
    [Documentation]    ProductList - Verify product category Incase Move Product to other Category
    [Tags]    Regression    Medium
    Check And Set Category    Category-for-test-moveproduct
    Wait Until Element Is Visible    //input[@id="search"]    ${EXPECT_LOADTIME}
    #${p_category}    Get Text    //*[@id="table_report"]/tbody/tr[1]/td[3]/div[3]/a
    Select filter product by category    Category-for-test-moveproduct
    ${before_Count1}    Execute Javascript    return $('.all').text();
    Select filter product by category    หูฟัง
#    Wait Until Element Is Visible    //td[3]//a[contains(.,'${p_category}')]
    ${before_Count2}    Execute Javascript    return $('.all').text();
    Click checkbox first product in list
    Move product to category    Category-for-test-moveproduct
    ${before_Count1}    Evaluate    ${before_Count1} + 1
    ${before_Count2}    Evaluate    ${before_Count2} - 1
    Select filter product by category    Category-for-test-moveproduct
    ${after_Count1}    Execute Javascript    return $('.all').text();
    Should Be True    ${before_Count1} == ${after_Count1}
    Select filter product by category    หูฟัง
    ${after_Count2}    Execute Javascript    return $('.all').text();
    Should Be True    ${before_Count2} == ${after_Count2}
    Select filter product by category    Category-for-test-moveproduct
    Click checkbox first product in list
    Move product to category    หูฟัง

TC_MC_05792
    [Documentation]    ProductList - verify display product Incase hide product
    [Tags]    Regression    SmokeTest    High
    ${soldout_product}    Get Text    //span[@class='emptystock']
    ${soldout_product}    Convert To Integer    ${soldout_product}
    Wait Until Element Is Visible    ${top_record_pid}    ${EXPECT_LOADTIME}
    Search product    productattr
    Wait Until Element Is Visible    ${top_record_pid}    ${EXPECT_LOADTIME}
    Click Element    ${top_record_p_name}
    Wait Until Element Is Visible    ${input_product_name}
    Execute Javascript    $('input[type="checkbox"]').eq(5).click()
    Execute Javascript    $('#btn_hide_inv').click()
    Element Should Be Visible    //*[@id="cross-sub-attr"]/tbody/tr[1]/td[8]    //i[@class="tooltip-grey icon-eye-hide"]
    Execute Javascript    $('.btn-save').eq(0).click()
    Display Alert Footer
    Go To    ${URL_STORE}/${user_s001}/admin/product
    Wait Until Element Is Visible    ${top_record_pid}    ${EXPECT_LOADTIME}
    Search product    productattr
    Wait Until Element Is Visible    ${top_record_pid}    ${EXPECT_LOADTIME}
    Element Should Be Visible    ${top_record_p_hide}    ${icon_status_somehide}
    Execute Javascript    $('input[type="checkbox"]').eq(2).click()
    Click Element    btn_visible
    Click OK Alert Box
    Wait Until Element Is Visible    table_report
    Go To    ${URL_STORE}/${user_s001}/admin/product?total=approved&page=1&ss=1
    Execute Javascript    $('input[type="checkbox"]').eq(2).click()
    Execute Javascript    $('input[type="checkbox"]').eq(3).click()
    Execute Javascript    $('input[type="checkbox"]').eq(4).click()
    Click Element    btn_hide
    Click OK Alert Box
    Wait Until Element Is Visible    table_report
    Select From List By Label    inv_status    แสดงสินค้า
    ${display_product}    Get Text    //span[@class='approved']
    ${display_product}    Convert To Integer    ${display_product}
    ${display_product}    Evaluate    ${display_product} - ${soldout_product}
    Go To    ${URL_PORTAL}/${user_s001}/products
    ${home1}    Get Text    //*[@id="row-body"]/div/div/div/div[3]/div/div[2]/div[1]/span
    @{home1} =  Split String    ${home1}   ${SPACE}
    ${Length}    Get Length    ${home1}
    Set Suite Variable    ${home2}    ${home1[${Length}-2]}
    ${home2}    Convert To Integer    ${home2}
    Should Be Equal As Integers    ${home2}    ${display_product}
    Go To    ${URL_STORE}/${user_s001}/admin/product
    Execute Javascript    ${check_all}.click()
    Click Element    btn_visible
    Click OK Alert Box
    Select From List By Label    inv_status    แสดงสินค้า
    Wait Until Element Is Visible    //span[@class='approved']
    ${display_product}    Get Text    //span[@class='approved']
    ${display_product}    Convert To Integer    ${display_product}
    ${display_product}    Evaluate    ${display_product} - ${soldout_product}
    Go To    ${URL_PORTAL}/${user_s001}/products
    ${home1}    Get Text    //*[@id="row-body"]/div/div/div/div[3]/div/div[2]/div[1]/span
    @{home1} =  Split String    ${home1}   ${SPACE}
    ${Length}    Get Length    ${home1}
    Set Suite Variable    ${home2}    ${home1[${Length}-4]}
    ${home2}    Convert To Integer    ${home2}
    Should Be Equal As Integers    ${home2}    ${display_product}

TC_MC_05795
    [Documentation]    ProductList - Filter product by Product category
    [Tags]    Regression    Medium
    Wait Until Element Is Visible    //input[@id="search"]    ${EXPECT_LOADTIME}
    # ${p_category}    Get Text    //*[@id="table_report"]/tbody/tr[1]/td[3]/div[3]/a
    Select filter product by category    หูฟัง
    Wait Until Element Is Visible    //td[3]//a[contains(.,'หูฟัง')]
    ${paging}    Execute Javascript    return $('.pagination li').length;
    Run Keyword If     ${paging} >= 0    Count product on product list have paging
    Run Keyword If     ${paging} == 0    Count product on product list not have paging
    ${all_product1}    Execute Javascript    return $('.all').text();
    Should Be True    '${before_Count1}' == '${all_product1}'

TC_MC_05796
    [Documentation]    ProductList - Filter product by Status All
    [Tags]    Regression    Low
    Wait Until Element Is Visible    //input[@id="search"]    ${EXPECT_LOADTIME}
    Filter product by status all product
    ${paging}    Execute Javascript    return $('.pagination li').length;
    Run Keyword If     ${paging} >= 0    Count product on product list have paging
    Run Keyword If     ${paging} == 0    Count product on product list not have paging
    ${all_product1}    Get Text    //*[@id="total-product"]/ul/li[1]/a/span
    Should Be True    '${before_Count1}' == '${all_product1}'

TC_MC_05797
    [Documentation]    ProductList - Filter product by Status out of stock
    [Tags]    Regression    Medium
    Wait Until Element Is Visible    //input[@id="search"]    ${EXPECT_LOADTIME}
    Filter product by status soldout
    ${before_Count1}    Get Matching Xpath Count    //*[@id="table_report"]/tbody/tr/td[2]
    ${all_product1}    Get Text    //*[@id="total-product"]/ul/li[2]/a/span
    Should Be True    '${before_Count1}' == '${all_product1}'

TC_MC_05798
    [Documentation]    ProductList - Filter product by Status Reject
    [Tags]    Regression    Low
    Wait Until Element Is Visible    //input[@id="search"]    ${EXPECT_LOADTIME}
    Filter product by status reject
    ${before_Count1}    Get Matching Xpath Count    //*[@id="table_report"]/tbody/tr/td[2]
    ${all_product1}    Get Text    //*[@id="total-product"]/ul/li[5]/a/span
    Should Be True    '${before_Count1}' == '${all_product1}'

TC_MC_05799
    [Documentation]    ProductList - Filter product by Status Approved
    [Tags]    Regression    Medium
    Wait Until Element Is Visible    //input[@id="search"]    ${EXPECT_LOADTIME}
    Filter product by status approved
    Wait Until Element Is Visible    table_report
    ${paging}    Execute Javascript    return $('.pagination li').length;
    Run Keyword If     ${paging} >= 0    Count product on product list have paging
    Run Keyword If     ${paging} == 0    Count product on product list not have paging
    ${all_product1}    Get Text    //*[@id="total-product"]/ul/li[3]/a/span
    Should Be True    '${before_Count1}' == '${all_product1}'

TC_MC_05846
    [Documentation]    Move Product to other Category sub category
    [Tags]    Regression    High    mock
    Wait Until Element Is Visible    //input[@id="search"]    ${EXPECT_LOADTIME}
    Select From List By Label    filter    กระเป๋าโน๊ตบุ๊ค
    Wait Until Element Is Visible    //td[3]//a[contains(.,'กระเป๋าโน๊ตบุ๊ค')]
    ${before_Count2}    Execute Javascript    return $('.all').text();
    Select From List By Label    filter    กระโปรงแฟชั่น
    Wait Until Element Is Visible    //td[3]//a[contains(.,'กระโปรงแฟชั่น')]
    ${before_Count1}    Execute Javascript    return $('.all').text();
    Click checkbox first product in list
    Move product to subcategory    กระเป๋าโน๊ตบุ๊ค
    ${before_Count1}    Evaluate    ${before_Count1} - 1
    ${before_Count2}    Evaluate    ${before_Count2} + 1
    Select From List By Label    filter    กระโปรงแฟชั่น
    Wait Until Element Is Visible    //td[3]//a[contains(.,'กระโปรงแฟชั่น')]
    ${after_Count1}    Execute Javascript    return $('.all').text();
    Should Be True    ${before_Count1} == ${after_Count1}
    Select From List By Label    filter    กระเป๋าโน๊ตบุ๊ค
    Wait Until Element Is Visible    //td[3]//a[contains(.,'กระเป๋าโน๊ตบุ๊ค')]
    ${after_Count2}    Execute Javascript    return $('.all').text();
    Should Be True    ${before_Count2} == ${after_Count2}
    Click checkbox first product in list
    Move product to category    กระโปรงแฟชั่น

TC_MC_05847
    [Documentation]    Filter product by Product category (sub category)
    [Tags]    Regression    Medium    mock
    Select From List By Label    filter    กระเป๋าโน๊ตบุ๊ค
    sleep    2
    ${count}    Execute Javascript    return $('.all').text();
    Should Be True    ${count} >= 1
    Element Should Contain    //div[@class='pd-list-cat']/a[1]    กระเป๋าเอกสาร
    Element Should Contain    //div[@class='pd-list-cat']/a[2]    กระเป๋าโน๊ตบุ๊ค

TC_MC_08769
    [Documentation]    verify link redirect to level d when click product id at product list page.
    [Tags]    Regression    Medium
    ${pid}    Get Text    ${top_record_pid}
    ${pname}    Get Text    //*[@id="table_report"]/tbody/tr[1]/td[3]/div[1]/a[1]
    Click Element    ${top_record_pid}
    Select Window    title=${pname} ${user_s001}
    ${loc}    Get Location
    Should Be Equal    ${loc}    ${URL_LEVEL_D}/${pid}




