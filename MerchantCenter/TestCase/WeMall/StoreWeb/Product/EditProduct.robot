*** Setting ***
Suite Setup       Run Keyword    Account Login    ${seller_user_002}    ${seller_pwd_002}
Suite Teardown    Close All Browsers
Test Setup        Go To    ${URL_STORE}/${seller_name002}/admin/product/edit/${product_id}
Force Tags        Store-Web    Queue    mc-wls
Library           OperatingSystem
Library           SeleniumLibrary
Library           String
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Product.txt
Resource          ../../../../Resource/WeMall/WebElement/Member_SignIn.txt
Resource          ../../../../Resource/WeMall/WebElement/Product.txt
Resource          ../../../../Resource/WeMall/WebElement/WMS_MonitoringListing.txt
Resource          ../../../../Keyword/Common/Gallery.txt
Resource          ../../../../Resource/WeMall/WebElement/Store_Dashboard.txt

*** variable ***
${productid}    91201494
${productid2}    91200439
${productid3}    91200938
${productid4}    91201258
${productid5}    91201259

*** Keywords ***
Write Variable to File
    [Arguments]    ${variable_name}    ${value}
    ${value1}    Remove String    ${value}    L
    ${variable}    Catenate    SEPARATOR=    ${    ${variable_name}    }    ${SPACE}${SPACE}${SPACE}${SPACE}    ${value1}
    #Append To File    ${path}${/}Config${/}${ENV}/robotdata.txt    ${\n}${variable}
    ${FilePath}    Replace String    ${CURDIR}    /TestCase/WeLoveShopping/StoreWeb/Product    /Resource/${BU}/Configuration/${ENV}
    Append To File   ${FilePath}${/}robotdata.txt    ${\n}${variable}

Check product data
    [Arguments]    ${product_id}
    Go To    ${URL_STORE}/${seller_name002}/admin/product
    Search product    L${product_id}
    Sleep    3s
    ${Result}    Run Keyword and Return Status    Check Text Page Should Contain    ไม่พบสินค้า
    ${status}    Run Keyword If    '${Result}' == 'True'    Set Variable    ${Result}
    [Return]    ${status}

Set product data
    Set Selenium Speed    .2
    ${status}    Check product data    ${product_id}
    Run Keyword If    '${status}' == 'True'    Run Keywords    Go To    ${URL_STORE}/${seller_name002}/admin/product/create    AND
    ...    Store Add Product By Add Photo    electronic    robot_product1_1.jpg    productforedit    product_id
    ...    New    5    1    0    0    1


*** Test Case ***
TC_MC_05703
    [Documentation]    Verify change data all fill.
    [Tags]    Regression    High
    Wait Until Element Is Visible    ${input_product_name}
    Select Category Three Level
    ${time}    Get Time    epoch
    ${product_name}    Catenate    EditByRobot ${time}
    Input Text    ${input_product_name}    ${product_name}
    Execute Javascript    ${product_type_used}
    Execute Javascript    ${status_instock}.click()
    ${old_amount}    Get Value    ${unit_instock}
    ${new_amount}    Evaluate    ${old_amount}+1
    ${str1}    Convert To String    ${new_amount}
    Clear Element Text    ${unit_instock}
    Input Text    ${unit_instock}    ${str1}
    ${old_weight}    Get Value    ${input_product_weight}
    ${new_weight}    Evaluate    ${old_weight}+0.01
    ${str2}    Convert To String    ${new_weight}
    Clear Element Text    ${input_product_weight}
    Input Text    ${input_product_weight}    ${str2}
    ${old_selling_price}    Get Value    ${input_selling_price}
    ${new_selling_price}    Evaluate    ${old_selling_price}+1
    ${str3}    Convert To String    ${new_selling_price}
    Clear Element Text    ${input_selling_price}
    Input Text    ${input_selling_price}    ${str3}
    ${old_normal_price}    Get Value    ${input_normal_price}
    ${new_normal_price}    Evaluate    ${old_normal_price}+1
    ${str4}    Convert To String    ${new_normal_price}
    Clear Element Text    ${input_normal_price}
    Input Text    ${input_normal_price}    ${str4}
    Execute Javascript    $('.btn-save').eq(0).click()
    Sleep    1s
    Display Alert Footer
    Wait Until Element Is Visible    ${input_product_name}    ${EXPECT_LOADTIME}
    ${cat_lv1}    Execute Javascript    return $('#category1 option:selected').text();
    ${cat_lv2}    Execute Javascript    return $('#category2 option:selected').text();
    ${cat_lv3}    Execute Javascript    return $('#category3 option:selected').text();
    Should Be Equal    ${cat_lv1}    แฟชั่น
    Should Be Equal    ${cat_lv2}    กระเป๋า
    Should Be Equal    ${cat_lv3}    กระเป๋าเอกสาร
    Textfield Value Should Be    ${input_product_name}    ${product_name}
    Execute Javascript    $('input[name="pdtype"]').eq(1).is(':checked') == true
    ${current_amount}    Get Value    ${unit_instock}
    ${str_amount}    Convert To String    ${current_amount}
    Should Be Equal    ${str1}    ${str_amount}
    ${current_weight}    Get Value    ${input_product_weight}
    ${str_weight}    Convert To String    ${current_weight}
    Should Be Equal    ${str2}    ${str_weight}
    ${current_selling_price}    Get Value    ${input_selling_price}
    ${num_price}    Convert To String    ${current_selling_price}
    Should Be Equal    ${str3}    ${num_price}
    ${current_normal_price}    Get Value    ${input_normal_price}
    ${str_price}    Convert To String    ${current_normal_price}
    Should Be Equal    ${str4}    ${str_price}

TC_MC_05704
    [Documentation]    Verify change data not require fill.
    Wait Until Element Is Visible    ${input_product_name}
    ${old_weight}    Get Value    ${input_product_weight}
    ${new_weight}    Evaluate    ${old_weight}+0.01
    ${str1}    Convert To String    ${new_weight}
    Clear Element Text    ${input_product_weight}
    Input Text    ${input_product_weight}    ${str1}
    ${old_price}    Get Value    ${input_normal_price}
    ${new_price}    Evaluate    ${old_ price}+1
    ${str2}    Convert To String    ${new_price}
    Clear Element Text    ${input_normal_price}
    Input Text    ${input_normal_price}    ${str2}
    Execute Javascript    $('.btn-save').eq(0).click()
    Sleep    1s
    Display Alert Footer
    Wait Until Element Is Visible    ${input_product_weight}    ${EXPECT_LOADTIME}
    ${current_weight}    Get Value    ${input_product_weight}
    ${str_weight}    Convert To String    ${current_weight}
    Should Be Equal    ${str1}    ${str_weight}
    ${current_price}    Get Value    ${input_normal_price}
    ${str_price}    Convert To String    ${current_price}
    Should Be Equal    ${str2}    ${str_price}

TC_MC_05705
    [Documentation]    Verify change data require fill.
    [Tags]    Low
    Wait Until Element Is Visible    ${input_product_name}
    ${old_amount}    Get Value    ${unit_instock}
    ${new_amount}    Evaluate    ${old_amount}+1
    ${str1}    Convert To String    ${new_amount}
    Clear Element Text    ${unit_instock}
    Input Text    ${unit_instock}    ${new_amount}
    ${old_price}    Get Value    ${input_selling_price}
    ${new_price}    Evaluate    ${old_price}+1
    ${str2}    Convert To String    ${new_price}
    Clear Element Text    ${input_selling_price}
    Input Text    ${input_selling_price}    ${new_price}
    Execute Javascript    $('.btn-save').eq(0).click()
    Sleep    1s
    Display Alert Footer
    Wait Until Element Is Visible    ${unit_instock}    ${EXPECT_LOADTIME}
    ${current_amount}    Get Value    ${unit_instock}
    ${str_amount}    Convert To String    ${current_amount}
    Should Be Equal    ${str1}    ${str_amount}
    ${current_price}    Get Value    ${input_selling_price}
    ${str_price}    Convert To String    ${current_price}
    Should Be Equal    ${str2}    ${str_price}

TC_MC_05706
    [Documentation]    To ensure The validation icon on Product data tab.
    Wait Until Element Is Visible    ${input_product_name}
    Clear Element Text    ${input_product_name}
    Execute Javascript    $('.btn-save').eq(0).click()
    Sleep    1s
    ${msg_error}    Execute Javascript    return $('.help-inline').eq(1).text()
    Element Should Be Visible    ${icon_incomplete_p_data}

TC_MC_05707
    [Documentation]    To ensure The validation icon on Product Category tab.
    Wait Until Element Is Visible    ${input_product_name}
    Execute Javascript    $(".showcat select option").filter(function(){ return this.text == '--- เลือกหมวดหมู่สินค้า weloveshopping ---'; }).attr('selected', true).change();
    Sleep    1s
    Execute Javascript    $('.btn-save').eq(0).click()
    Sleep    1s
    ${msg_error}    Execute Javascript    return $('.help-inline').eq(0).text()

TC_MC_05708
    [Documentation]    Verify automatically create variants based.
    [Tags]    Regression    Medium
    Wait Until Element Is Visible    ${input_product_name}
    Execute Javascript    $('#switch-option').click()
    Sleep    3s
    Element Should Be Visible    ${box_attribute}
    Element Should Be Visible    ${table_cross_attr_data_lv0}
    Element Should Be Visible    ${attr_r1}
    Clear Element Text    ${sku_r1}
    Clear Element Text    ${selling_price_r1}
    Clear Element Text    ${amount_r1}
    Execute Javascript    $('.btn-save').eq(0).click()
    Focus    ${sku_r1}
    Focus    ${selling_price_r1}
    Focus    ${amount_r1}

TC_MC_05709
    [Documentation]    Verify delete all product in automatically create variants based.
    [Tags]    Regression    Medium
    Set Selenium Speed    .3
    Wait Until Element Is Visible    ${input_product_name}
    Select Category Three Level
    Execute Javascript    $('#switch-option').click()
    Wait Until Element Is Visible    ${box_attribute}    ${EXPECT_LOADTIME}
    Edit Attribute WM
    Input price and stock into product attribute
    : FOR    ${index}    IN RANGE    0    ${Count_Attr}
    \    Element Should Be Visible    optrow${index}
    \    ${attribute}    Get Text    optrow${index}
    Select Checkbox    ${icon_delete_attr_all}
    Click Button    ${btn_delete_attr}
    Element Should Be Visible    ${attr_r1}
    ${attribute_r1}    Get Text    ${attr_r1}
    Execute Javascript    $('#switch-option').click()
    Execute Javascript    $('.btn-save').eq(0).click()

TC_MC_05711
    [Documentation]    Verify Product status. If User select "Instock Product"
    Wait Until Element Is Visible    ${input_product_name}
    Execute Javascript    ${status_instock}.click()
    Input Text    ${unit_instock}    10
    Execute Javascript    $('.btn-save').eq(0).click()
    Sleep    1s
    Display Alert Footer
    Go To    ${url_product_list2}
    Wait Until Element Is Visible    ${input_keyword}
    ${status}    Execute Javascript    return $('#table_report tbody tr td').eq(6).text()

TC_MC_05716
    [Documentation]    Verify Selling price. If User enter integer or decimal.
    Go To    ${url_product_list2}
    Wait Until Element Is Visible    ${input_keyword}
    Execute Javascript    ${quick_edit}.click()
    Execute Javascript    ${box_quick_edit}
    Execute Javascript    ${quick_selling_price}.val(100.25)
    ${val1}    Execute Javascript    return ${quick_selling_price}.val()
    ${str1}    Convert To String    ${val1}
    Should Be True    ${str1}    100.25
    Execute Javascript    ${quick_selling_price}.val(150)
    ${val2}    Execute Javascript    return ${quick_selling_price}.val()
    ${str2}    Convert To String    ${val2}
    Should Be True    ${str2}    150

TC_MC_05718
    [Documentation]    Verify Normal price. If User enter integer or decimal
    Go To    ${url_product_list2}
    Wait Until Element Is Visible    ${input_keyword}
    Execute Javascript    ${quick_edit}.click()
    Execute Javascript    ${box_quick_edit}
    Execute Javascript    ${quick_normal_price}.val(100.25)
    ${val1}    Execute Javascript    return ${quick_normal_price}.val()
    ${str1}    Convert To String    ${val1}
    Should Be True    ${str1}    100.25
    Execute Javascript    ${quick_normal_price}.val(150)
    Execute Javascript    ${quick_normal_price}.val()
    ${val2}    Execute Javascript    return ${quick_normal_price}.val()
    ${str2}    Convert To String    ${val2}
    Should Be True    ${str2}    100.25

TC_MC_05720
    [Documentation]    Verify Weight. If User enter weight is format support.
    #Go To    ${URL_STORE}/${category_shopname2}/admin/product/edit/${product_id}
    Wait Until Element Is Visible    ${input_product_name}
    Clear Element Text    ${input_product_weight}
    Input Text    ${input_product_weight}    0
    Press Key    ${input_product_weight}    \\9
    Textfield Value Should Be    ${input_product_weight}    0
    Clear Element Text    ${input_product_weight}
    Input Text    ${input_product_weight}    0.5
    Press Key    ${input_product_weight}    \\9
    Textfield Value Should Be    ${input_product_weight}    0.5
    Clear Element Text    ${input_product_weight}
    Input Text    ${input_product_weight}    0.05
    Press Key    ${input_product_weight}    \\9
    Textfield Value Should Be    ${input_product_weight}    0.05
    Clear Element Text    ${input_product_weight}
    Input Text    ${input_product_weight}    100.25
    Press Key    ${input_product_weight}    \\9
    Textfield Value Should Be    ${input_product_weight}    100.25
    Clear Element Text    ${input_product_weight}
    Input Text    ${input_product_weight}    150
    Press Key    ${input_product_weight}    \\9
    Textfield Value Should Be    ${input_product_weight}    150
    Execute Javascript    $('.btn-save').eq(0).click()
    Sleep    1s

TC_MC_05724
    [Documentation]    Verify product image with choose image from album. If User choose image over limit (Maximum 10 file)
    Wait Until Element Is Visible    ${input_product_name}
    Execute Javascript    $('#btn_select_photo').click()
    Sleep    2s
    Execute Javascript    $('.modal-addimg tbody tr').eq(1).click()
    Sleep    1s
    Execute Javascript    $('.box-album, .photo-click li').eq(0).find("a").click()
    Execute Javascript    $('.box-album, .photo-click li').eq(1).find("a").click()
    Execute Javascript    $('.box-album, .photo-click li').eq(2).find("a").click()
    Execute Javascript    $('.box-album, .photo-click li').eq(3).find("a").click()
    Execute Javascript    $('.box-album, .photo-click li').eq(4).find("a").click()
    Execute Javascript    $('.box-album, .photo-click li').eq(5).find("a").click()
    Execute Javascript    $('.box-album, .photo-click li').eq(6).find("a").click()
    Execute Javascript    $('.box-album, .photo-click li').eq(7).find("a").click()
    Execute Javascript    $('.box-album, .photo-click li').eq(8).find("a").click()
    Execute Javascript    $('.box-album, .photo-click li').eq(9).find("a").click()
    Execute Javascript    $('.box-album, .photo-click li').eq(10).find("a").click()
    ${msg_over_limit}    Get Alert Message

TC_MC_05726
    [Documentation]    Verify SEO Title. If User to enter character more than 80 characters.
    Wait Until Element Is Visible    ${input_product_name}
    #Click Element    ${btn_edit_seo}
    Execute Javascript    $('#edit_meta_th a').click()
    Clear Element Text    ${input_seo_title}
    Input Text    ${input_seo_title}    ${char_over_80}
    Execute Javascript    $('.btn-save').eq(0).click()
    Sleep    1s
    ${seo_title}    Get Text    ${seo_title}
    Should Be True    '${seo_title}' == '${char_equal_80}'

TC_MC_05727
    [Documentation]    Verify SEO Description. If User enter character more than 170 characters.
    Wait Until Element Is Visible    ${input_product_name}
    #Click Element    ${btn_edit_seo}
    Execute Javascript    $('#edit_meta_th a').click()
    Clear Element Text    ${input_seo_desc}
    Input Text    ${input_seo_desc}    ${char_over_170}
    Execute Javascript    $('.btn-save').eq(0).click()
    Sleep    1s
    ${seo_desc}    Get Text    ${seo_desc}
    Should Be True    '${seo_desc}' == '${char_equal_170}'

TC_MC_01673
    [Documentation]    Verify Change status SHOW to HIDE.
    [Tags]    Regression    Medium
    Go To    ${URL_STORE}/${seller_name002}/admin/product
    Wait Until Element Is Visible    ${input_keyword}
    Execute Javascript    ${quick_edit}.click()
    Execute Javascript    ${box_quick_edit}
    Execute Javascript    ${icon_product_status}.click()
    Execute Javascript    ${btn_save_quick_edit}.click()
    Execute Javascript    $('#table_report tbody tr').eq(0).find('.hidden-phone > input').val() == 'true'

TC_MC_01675
    [Documentation]    Verify Change status HIDE to SHOW.
    [Tags]    Regression    Medium
    Go To    ${URL_STORE}/${seller_name002}/admin/product
    Wait Until Element Is Visible    ${input_keyword}
    Execute Javascript    ${quick_edit}.click()
    Execute Javascript    ${box_quick_edit}
    Execute Javascript    ${icon_product_status}.click()
    Execute Javascript    ${btn_save_quick_edit}.click()
    Execute Javascript    $('#table_report tbody tr').eq(0).find('.hidden-phone > input').val() == 'false'

TC_MC_05728
    [Documentation]    Verify save button.
    [Tags]    Low
    Wait Until Element Is Visible    ${input_product_name}
    ${time}    Get Time    epoch
    ${product_name}    Catenate    EditByRobot ${time}
    Input Text    ${input_product_name}    ${product_name}
    Execute Javascript    $('.btn-save').eq(0).click()
    Sleep    1s
    Display Alert Footer
    Go To    ${url_product_list2}
    Wait Until Element Is Visible    table_report
    Search product    L${product_id}
    Wait Until Element Is Visible    table_report
    Page Should Contain    ${product_name}
    ## Re-Product Name ##
    Go To    ${url_product_list2}/edit/${product_id}
    Clear Element Text    ${input_product_name}
    Input Text    ${input_product_name}    [Test] Fix Product 001
    Execute Javascript    $('.btn-save').eq(0).click()
    Sleep    1s
    Display Alert Footer

TC_MC_05729
    [Documentation]    Verify cancel button.
    [Tags]    Low
    Wait Until Element Is Visible    ${input_product_name}
    Execute Javascript    $('.row-fluid .btn-cancel').click()
    Location Should Contain    ${url_product_list2}

TC_MC_05843
    [Documentation]    Change shop category to select "create shop category"
    [Tags]    Medium
    Wait Until Element Is Visible    ${input_product_name}
    Select Shop Category Main
    Clear Element Text    ${input_product_name}
    Press Key    ${input_product_name}    new shop category
    Execute Javascript    $('.btn-save').eq(0).click()
    Go To    ${url_product_list2}
    Sleep    1s
    Input Text    //input[@id='search']    new shop category
    Click Element    //button[@type="submit"]
    # ${text}    Execute Javascript    return $('table tbody tr').eq(0).find('div.pd-list-name a.title').text()
    # Should Be True    ${text} ==    new shop category
    Page Should Contain    new shop category

TC_MC_05844
    [Documentation]    Change shop category to select main category
    [Tags]    Regression    Low
    Wait Until Element Is Visible    ${input_product_name}
    Select Shop Category Main
    Clear Element Text    ${input_product_name}
    Press Key    ${input_product_name}    new shop main category
    Execute Javascript    $('.btn-save').eq(0).click()
    Go To    ${url_product_list2}
    Sleep    1s
    Input Text    //input[@id='search']    new shop main category
    Click Element    //button[@type="submit"]
    Page Should Contain    new shop main category

TC_MC_05845
    [Documentation]    Change shop category to select Sub category
    [Tags]    Regression    Medium
    Wait Until Element Is Visible    ${input_product_name}
    Execute Javascript    $("#input_shop_category select option").filter(function(){ return this.text == 'กระเป๋าเอกสาร'; }).attr('selected', true).change();
    Sleep    3
    ${element}    Check Element    //select[@id='shop_sub_category']/option[normalize-space(text())="กระเป๋าโน๊ตบุ๊ค"]
    ${location}    Get Location
    Run Keyword IF    '${element}' == 'FAIL'    Run Keywords    Go To    ${URL_STORE}/${seller_name002}/admin/category    AND    Add SubCategory NoteBookBag
    Run Keyword IF    '${element}' == 'PASS'    Execute Javascript    $("select#shop_sub_category option").filter(function(){ return this.text == 'กระเป๋าโน๊ตบุ๊ค'; }).attr('selected', true).change();
    Click Element    //button[@type="submit"]
    Sleep    2
    Element Should Contain    //select[@id='shop_sub_category']/option[normalize-space(text())="กระเป๋าโน๊ตบุ๊ค"]    กระเป๋าโน๊ตบุ๊ค
    Sleep    2

TC_MC_05873
    [Documentation]    Edit Product - Edit picture of attribute
    [Tags]    Regression    Medium    mock
    Set Selenium Speed    0.5
    Go To    ${url_product_list2}/edit/${productid3}
    Wait Until Element Is Visible    ${input_product_name}    ${EXPECT_LOADTIME}
    ${checked}=    Execute Javascript    return $('input[name="use_options"]').eq(1).prop('checked')
    Run Keyword If    ${checked} == False    Execute Javascript    $('input[name="use_options"]').eq(1).click()
    ${count_inv}=    Get Matching Xpath Count    ${lbl_color_selected}
    ${count_size}=    Get Matching Xpath Count    ${lbl_size_selected}
    Run Keyword If    '${count_inv}' == '0' and '${count_size}' == '0'    Add Choose Size    S
    Edit Image Inv    1
    Execute Javascript    $('.btn-save').eq(0).click()
    Wait Until Element Is Visible    //span[@id="notify-msg"]    ${EXPECT_LOADTIME}
    Element Should Contain    //span[@id="notify-msg"]    บันทึกข้อมูลเรียบร้อยแล้ว
    Approve Wemall Product By Product Id    L${productid3}
    Go To    ${URL_LEVEL_D}/L${productid3}
    Element Should Be Visible    //div[@class='inner-option' and text()='S']

TC_MC_05875
    [Documentation]    Edit Product - Edit delete picture of all attribute
    [Tags]    Regression    Medium    mock
    Account Login    ${category_user_002}    ${category_pwd_002}
    Go To    ${URL_STORE}/${category_shopname2}/admin/product/edit/${productid5}
    Wait Until Element Is Visible    ${input_product_name}    ${EXPECT_LOADTIME}
    ${checked}=    Execute Javascript    return $('input[name="use_options"]').eq(1).prop('checked')
    Run Keyword If    ${checked} == False    Execute Javascript    $('input[name="use_options"]').eq(1).click()
    ${count_inv}=    Get Matching Xpath Count    ${lbl_color_selected}
    ${count_size}=    Get Matching Xpath Count    ${lbl_size_selected}
    Run Keyword If    '${count_inv}' == '0' and '${count_size}' == '0'    Add Choose Size    M
    Delete Image Inv    1
    Execute Javascript    $('.btn-save').eq(0).click()
    Wait Until Element Is Visible    //span[@id="notify-msg"]    ${EXPECT_LOADTIME}
    Element Should Contain    //span[@id="notify-msg"]    บันทึกข้อมูลเรียบร้อยแล้ว
    Approve Wemall Product By Product Id    L${productid5}
    Go To Product List    2    qamcautomate001
    Search Product In Store By StoreID    L${productid5}
    Click Show Product On Product List
    Go To    ${URL_LEVEL_D}/L${productid5}?refresh=changeme
    Element Should Be Visible    //div[@class='inner-option' and text()='M']

TC_MC_05876
    [Documentation]    Edit Product - Edit status hide attribute
    [Tags]    Regression    Medium    mock
    Account Login    ${category_user_002}    ${category_pwd_002}
    Go To    ${URL_STORE}/${category_shopname2}/admin/product/edit/${productid4}
    Wait Until Element Is Visible    ${input_product_name}    ${EXPECT_LOADTIME}
    ${checked}=    Execute Javascript    return $('input[name="use_options"]').eq(1).prop('checked')
    Run Keyword If    ${checked} == False    Execute Javascript    $('input[name="use_options"]').eq(1).click()
    ${count_inv}=    Get Matching Xpath Count    ${lbl_color_selected}
    ${count_size}=    Get Matching Xpath Count    ${lbl_size_selected}
    Run Keyword If    '${count_inv}' == '0' and '${count_size}' == '0'    Add Choose Size    S
    Edit Image Inv    1
    Execute Javascript    $('input[value="optrow0"]').click()
    Execute Javascript    $('#btn_hide_inv').click()
    Execute Javascript    $('.btn-save').eq(0).click()
    Wait Until Element Is Visible    //span[@id="notify-msg"]    ${EXPECT_LOADTIME}
    Element Should Contain    //span[@id="notify-msg"]    บันทึกข้อมูลเรียบร้อยแล้ว
    Go To    ${URL_LEVEL_D}/L${productid4}
    Element Should Not Be Visible    //div[@class='inner-option' and text()='S']

TC_MC_07306
    [Documentation]    Edit stock of product type MF
    [Tags]    High
    Account Login    ${user_wm_type_mf_mail}    ${user_wm_type_mf_pwd}
    Product.Edit Stock MC Type MF    ${productid2}

TC_MC_07307
    [Documentation]    Fast edit stock of product type MF
    [Tags]    Regression    High
    Account Login    ${user_wm_type_mf_mail}    ${user_wm_type_mf_pwd}
    Product.Fast Edit Stock MC Type MF

