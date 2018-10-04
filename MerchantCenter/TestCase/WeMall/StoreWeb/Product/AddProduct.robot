*** Setting ***
Test Setup        Account Login    ${seller_user_001}    ${seller_pwd_001}
Test Teardown     Close All Browsers
Library           SeleniumLibrary
Library           String
Library           DateTime
Force Tags        Store-Web
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Product.txt
Resource          ../../../../Resource/WeMall/WebElement/Member_SignIn.txt
Resource          ../../../../Resource/WeMall/WebElement/Product.txt
Resource          ../../../../Resource/WeMall/WebElement/WMS_MonitoringListing.txt

*** variable ***
${sku_dupicate_deleted_sku}    robot-dupicate-2
${sku_dupicate_sku}    robot-dupicate-1

*** Test Case ***
TC_MC_05688
    [Documentation]    Verify require information on add product.
    [Tags]    Regression    Medium
    Go To    ${url_product_add}
    Wait Until Element Is Visible    ${input_product_name}
    Execute Javascript    $('.btn-save').eq(0).click()
    ${error_p_category}    Execute Javascript    return $('#show_plaza_category .help-inline').text()
    ${error_p_name}    Execute Javascript    return $('.pd-name-counter .help-inline').text()
    ${error_p_desc}    Execute Javascript    return $('.product-description .help-inline').text()
    ${error_p_image}    Execute Javascript    return $('.add-img-thumb .help-inline').text()

TC_MC_05689
    [Documentation]    Verify fill number only.
    Go To    ${url_product_add}
    Wait Until Element Is Visible    ${input_product_name}
    Select Category Fashion Bag
    Genarate Product Name And SKU    TestAddproduct
    Input Text    ${input_product_name}    ${p_name}
    Execute Javascript    $("div[class='redactor-editor']").text('สินค้าเทส').change()
    Execute Javascript    ${product_type_new}
    Execute Javascript    ${status_instock}.click()
    Input Text    ${input_product_sku}    ${p_sku}
    Input Text    ${input_product_tag}    กระโปรง
    Upload Product Image    logo_mi6_seller_1.jpg
    Execute Javascript    $('.btn-save').eq(0).click()
    Focus    ${unit_instock}
    Focus    ${prepare_shipping}
    Focus    ${input_selling_price}

TC_MC_05690
    [Documentation]    Verify product category.
    Go To    ${url_product_add}
    Wait Until Element Is Visible    ${input_product_name}
    Select Category Fashion Bag
    Genarate Product Name And SKU    TestAddproduct
    Input Text    ${input_product_name}    ${p_name}
    Input Description
#    Execute Javascript    ${product_type_used}
#    Execute Javascript    ${status_instock}.click()
#    Input Text    ${prepare_shipping}    3
#    Input Text    ${unit_instock}    10
#    Input Text    ${input_product_sku}    ${p_sku}
#    Input Text    ${input_selling_price}    199
#    Input Text    ${input_normal_price}    200
#    Capture Page Screenshot
    Input Product Stock    3    10
    Input SKU and Product Price    ${p_sku}    199    200
    Input Text    ${input_product_tag}    กระโปรง
    Click Element    ${btn_choose_image}
    Choose Image From Gallery Correct
    Execute Javascript    $('.btn-save').eq(0).click()
    Sleep    3s
    Wait Until Element Is Visible    ${top_record_pid}    ${EXPECT_LOADTIME}
    Location Should Be    ${url_product_list}
    # Wait Until Element Is Visible    ${top_record_pid}    ${EXPECT_LOADTIME}
    ${last_pname}    Get Text    ${top_record_p_name}
    Should Be Equal    ${last_pname}    ${p_name}

TC_MC_05692
    [Documentation]    Verify product name more than 80 character.
    Go To    ${url_product_add}
    Wait Until Element Is Visible    ${input_product_name}
    Select Category Fashion Bag
    ${time}    Get Time    epoch
    ${p_sku}    Catenate    SKU ${time}
    Set Test Variable    ${p_sku}
    Input Text    ${input_product_name}    ${p_name_over_80}
    Input Description
#    Execute Javascript    ${product_type_used}
#    Execute Javascript    ${status_instock}.click()
    Input Product Stock    3    10
    Input SKU and Product Price    ${p_sku}    199    200
    Input Text    ${input_product_tag}    กระโปรง
    Click Element    ${btn_choose_image}
    Choose Image From Gallery Correct
    Execute Javascript    $('.btn-save').eq(0).click()
    Wait Until Page Does Not Contain    ${input_product_tag}
    Location Should Be    ${url_product_list}
    ${last_pname}    Get Text    ${top_record_p_name}
    Should Be Equal    ${last_pname}    ${p_name_equl_80}

TC_MC_05693
    [Documentation]    Verify product description (Success)
    Go To    ${url_product_add}
    Wait Until Element Is Visible    ${input_product_name}
    Select Category Fashion Bag
    Genarate Product Name And SKU    TestAddproduct
    Input Text    ${input_product_name}    ${p_name}
    Input Text    ${input_product_desc}    ${invalid_p_desc1}
    ${p_desc}    Get Text    ${input_product_desc}
    Execute Javascript    ${product_type_used}
    Execute Javascript    ${status_instock}.click()
    Input Text    ${prepare_shipping}    3
    Input Text    ${unit_instock}    10
    Input Text    ${input_product_sku}    ${p_sku}
    Input Text    ${input_selling_price}    199
    Input Text    ${input_normal_price}    200
    Input Text    ${input_product_tag}    กระโปรง
    Click Element    ${btn_choose_image}
    Choose Image From Gallery Correct
    Sleep    4s
    Execute Javascript    $('.btn-save').eq(0).click()
    Wait Until Page Does Not Contain    ${input_product_tag}
    Location Should Be    ${url_product_list}
    ${last_pname}    Get Text    ${top_record_p_name}
    Should Be Equal    ${last_pname}    ${p_name}

TC_MC_05694
    [Documentation]    Verify product description. Incase user enter contain is invalid format.
    Go To    ${url_product_add}
    Wait Until Element Is Visible    ${input_product_name}
    Select Category Fashion Bag
    Genarate Product Name And SKU    TestAddproduct
    Input Text    ${input_product_name}    ${p_name}
    Execute Javascript    $("div[class='redactor-editor']").text('${invalid_p_desc2}').keydown();
    ${p_desc}    Get Text    ${input_product_desc}
#    Execute Javascript    ${product_type_used}
#    Execute Javascript    ${status_instock}.click()
#    Input Text    ${prepare_shipping}    3
#    Input Text    ${unit_instock}    10
#    Input Text    ${input_product_sku}    ${p_sku}
#    Input Text    ${input_selling_price}    199
#    Input Text    ${input_normal_price}    200
    Input Product Stock    3    10
    Input SKU and Product Price    ${p_sku}    199    200
    Input Text    ${input_product_tag}    กระโปรง
    Click Element    ${btn_choose_image}
    Choose Image From Gallery Correct
    Execute Javascript    $('.btn-save').eq(0).click()
    Wait Until Page Does Not Contain    ${input_product_tag}
    Location Should Be    ${url_product_list}
    ${pid}    Get Text    ${top_record_pid}
    ${str5}    Remove String    ${pid}    L
    Go To    ${URL_STORE}/${user_s001}/admin/product/edit/${str5}
    ${product_desc}    Get Text    ${input_product_desc}
    ${str2}    Convert To String    ${product_desc}
    Should Contain    ${str2}    ${p_desc}

TC_MC_05695
    [Documentation]    Verify product description (Fail).
    Go To    ${url_product_add}
    Wait Until Element Is Visible    ${input_product_name}
    Select Category Fashion Bag
    Genarate Product Name And SKU    TestAddproduct
    Input Text    ${input_product_name}    ${p_name}
    Execute Javascript    $("div[class='redactor-editor']").text('สินค้าเทส<a href = http://www.google.com>Click</a>').keydown();
#    Execute Javascript    ${product_type_new}
#    Execute Javascript    ${status_instock}.click()
#    Input Text    ${prepare_shipping}    3
#    Input Text    ${unit_instock}    10
#    Input Text    ${input_product_sku}    ${p_sku}
#    Input Text    ${input_selling_price}    199
#    Input Text    ${input_normal_price}    200
    Input Product Stock    3    10
    Input SKU and Product Price    ${p_sku}    199    200
    Input Text    ${input_product_tag}    กระโปรง
    Click Element    ${btn_choose_image}
    Choose Image From Gallery Correct
    Sleep    4s
    Execute Javascript    $('.btn-save').eq(0).click()
    Wait Until Page Does Not Contain    ${input_product_tag}
    Sleep    5s
    ${pid}    Get Text    ${top_record_pid}
    Go To    url=${URL_LEVEL_D}/${pid}
    ${lvd_p_name}    Execute Javascript    return ${lvd_product_name}.text()
    ${str1}    Convert To String    ${lvd_p_name}
    Should Be Equal    ${p_name}    ${str1}
    ${product_desc}    Execute Javascript    return ${lvd_product_desc}.text()
    ${str2}    Convert To String    ${product_desc}
    Should Contain    ${str2}    สินค้าเทสClick

TC_MC_05696
    [Documentation]    Verify product status "Instock" (Fail).
    Go To    ${url_product_add}
    Wait Until Element Is Visible    ${input_product_name}
    Select Category Fashion Bag
    Genarate Product Name And SKU    TestAddproduct
    Input Text    ${input_product_name}    ${p_name}
    Input Description
#    Execute Javascript    ${product_type_used}
#    Execute Javascript    ${status_instock}.click()
#    Input Text    ${prepare_shipping}    ก
#    Input Text    ${unit_instock}    10
#    Input Text    ${input_product_sku}    ${p_sku}
#    Input Text    ${input_selling_price}    199
#    Input Text    ${input_normal_price}    200
    Input Product Stock    n    10
    Input SKU and Product Price    ${p_sku}    199    200
    Input Text    ${input_product_tag}    กระโปรง
    Click Element    ${btn_choose_image}
    Choose Image From Gallery Correct
    Execute Javascript    $('.btn-save').eq(0).click()
    Focus    ${prepare_shipping}
    Click Element    //*[@id="knowledge-step1"]/a
    Execute Javascript    $('.btn-save').eq(0).click()
    Sleep    4s
    Location Should Be    ${url_product_add}

TC_MC_05698
    [Documentation]    Verify product status "Instock" with attibute not select picture(Success).
    [Tags]    Regression    Medium
    #Set Selenium Speed    .3
    #Account Login    ${seller_user_001}    ${seller_pwd_001}
    #Sleep    1s
    Go To    ${url_product_add}
    Wait Until Element Is Visible    ${input_product_name}
    Select Category Fashion Skirt
    Run Keyword If    '${ENV}' == 'Alpha'    Select Category each first dropdown list
    Sleep    2s
    Select Property
    Genarate Product Name And SKU    addtest_
    Input Product Name WeMall
    Input Product Description WeMall    Producttest
    Input Product Stock WeMall    10
    Input SKU and Product Price Wemall    ${p_sku}    199    200
    Input Text    ${d_width}    30
    Input Text    ${d_length}    30
    Input Text    ${d_height}    15
    Input Text    ${input_product_weight}    1
    Execute Javascript    $('#tag_tag').val('กระโปรง')
    Execute Javascript    $('#switch-option').click()
    Wait Until Element Is Visible    ${box_attribute}    ${EXPECT_LOADTIME}
    Select Attribute Size WM
    Input price and stock into product attribute2
    Execute Javascript    $('#btn_select_photo').click()
    Choose Image From Gallery Correct
    #Upload Product Image    ${image}
    Execute Javascript    $('.btn-save').eq(0).click()
    Sleep    7s
    ${pid}    Get Text    ${top_record_pid}
    Input Text    ${input_keyword}    ${pid}
    Click Button    //*[@id="table_report_filter"]/button
    Wait Until Element Is Visible    ${top_record_pid}    ${EXPECT_LOADTIME}
    ${Status1}    Get Text    ${top_record_p_name}
    ${Status2}    Convert To String    ${status1}
    Should Contain    ${Status2}    ${p_name}
    ${Status3}    Get Text    ${top_record_p_status}
    ${Status4}    Convert To String    ${status3}
    Should Contain    ${Status4}    รอการตรวจสอบ
    ${Status5}    Get Text    ${top_record_p_type}
    ${Status6}    Convert To String    ${status5}
    Should Contain    ${Status6}    พร้อมส่ง
    ${stock1}    Get Text    ${top_record_amount}
    ${stock2}    Convert To String    ${stock1}
    Should Contain    ${stock2}    30
    ${selling_price}    Get Text    ${top_record_selling_price}
    ${selling_price1}    Convert To String    ${selling_price}
    Should Contain    ${selling_price1}    199
    ${Normal_price}    Get Text    ${top_record_normal_price}
    ${Normal_price1}    Convert To String    199
    Should Contain    ${Normal_price1}    199
    Sleep    1s
    WMS Switch Project    wm
    Go To    url=${URL_WMS}/monitoringlisting
    Execute Javascript    $("input[name='product_id']").val('${pid}')
    Click Button    //button[@class="btn btn-info"]
    ${monitor_st1}    Get Text    ${top_record_adminstatus}
    Should Contain    ${monitor_st1}    รอตรวจสอบ
    ${monitor_st2}    Get Text    ${top_record_sellerstatus}
    Should Contain    ${monitor_st2}    รอการตรวจสอบ
    Approve Wemall Product By Product Id    ${pid}
    Go To Product List    1    qamcautomate001
    Search Product In Store By StoreID    ${pid}
    Click Show Product On Product List
    Go To    url=${URL_LEVEL_D}/${pid}?refresh=changeme
    Wait Until Element Is Visible    //*[@*="product-name"]
    ${lvd_p_name}    Execute Javascript    return ${lvd_product_name}.text()
    ${str1}    Convert To String    ${lvd_p_name}
    Should Be Equal    ${p_name}    ${str1}
    ${selling_price}    Execute Javascript    return ${lvd_product_price}.text()
    ${str2}    Convert To String    ${selling_price}
    Should Be Equal    ${selling_price}    ${str2}
    ${product_desc}    Execute Javascript    return ${lvd_product_desc}.text()
    ${str4}    Convert To String    ${product_desc}
    Should Contain    ${str4}    Producttest
    ${p_size}    Execute Javascript    return $('.box-option-size').text()
    #Sleep    10s

TC_MC_05869
    [Documentation]    Verify product status "Instock" with attibute select picture some attibute (Click save).
    [Tags]    Regression    Medium
    #Set Selenium Speed    .3
    #Account Login    ${seller_user_001}    ${seller_pwd_001}
    #Sleep    1s
    Go To    ${url_product_add}
    Wait Until Element Is Visible    ${input_product_name}
    Select Category Fashion Skirt
    Run Keyword If    '${ENV}' == 'Alpha'    Select Category each first dropdown list
    Sleep    2s
    Select Property
    Genarate Product Name And SKU    addtest_
    Execute Javascript    $('#title_th').val('${p_name}')
    Execute Javascript    $('div.redactor-editor').focus()
    Execute Javascript    $('div.redactor-editor').html('Producttest').keydown()
    #    Execute Javascript    $('div.redactor-editor').keydown()
    #    Input Text    ${input_product_desc}    Producttest
    Execute Javascript    ${product_type_used}.click()
    Execute Javascript    ${status_instock}.click()
    Execute Javascript    $('#prepare_shipping').val(2)
    Execute Javascript    $('#instockunit').val(10)
    Execute Javascript    $('#sku').val('${p_sku}')
    Input Text    ${d_width}    30
    Input Text    ${d_length}    30
    Input Text    ${d_height}    15
    Input Text    ${input_product_weight}    1
    Execute Javascript    $('#tag_tag').val('กระโปรง')
    Execute Javascript    $('#switch-option').click()
    Wait Until Element Is Visible    ${box_attribute}    ${EXPECT_LOADTIME}
    Select Attribute Color WM
    Input price and stock into product attribute2
    Execute Javascript    $('#img-btn-SKU-1 a div i').click()
    Execute Javascript    $('#btn_select_photo_att').click()
    Choose Image From Gallery Correct4
    #Execute Javascript    $('#btn_select_photo').click()
    #Choose Image From Gallery Correct3
    #Upload Product Image    ${image}
    Sleep    2s
    Execute Javascript    $('#btn_select_photo').click()
    Choose Image From Gallery Correct3
    Sleep    1s
    Page Should Contain    กรุณาใส่รูปลงในคุณสมบัติย่อยให้ครบ
    Sleep    1s

TC_WLS_05770
    [Documentation]    Verify product status "Instock" with attibute select picture all attribute (incase not dupicate image product and image attribute).
    [Tags]    High
    #Set Selenium Speed    .3
    #Account Login    ${seller_user_001}    ${seller_pwd_001}
    #Sleep    1s
    Go to    ${URL_STORE}/${user_s001}/admin/gallery
    Execute Javascript    $('div.album-img li').first().click()
    ${size}=    Check Image In Gallery
    Run Keyword If    ${size} < 4    Add Image In Gallery
    Go To    ${url_product_add}
    Wait Until Element Is Visible    ${input_product_name}
    Run Keyword If    '${ENV}' != 'Alpha'    Select Category Fashion Skirt
    Run Keyword If    '${ENV}' == 'Alpha'    Select Category each first dropdown list
    Sleep    2s
    Select Property
    Genarate Product Name And SKU    addtest_
    Execute Javascript    $('#title_th').val('${p_name}')
    Execute Javascript    $('div.redactor-editor').focus()
    Execute Javascript    $('div.redactor-editor').html('Producttest').keydown()
    #    Execute Javascript    $('div.redactor-editor').keydown()
    #    Input Text    ${input_product_desc}    Producttest
    Execute Javascript    ${product_type_new}.click()
#    Execute Javascript    ${status_instock}.click()
#    Execute Javascript    $('#prepare_shipping').val(2)
#    Execute Javascript    $('#instockunit').val(10)
#    Execute Javascript    $('#sku').val('${p_sku}')
    Input Product Stock    2    10
    Input SKU and Product Price    ${p_sku}    199    200
    Input Text    ${d_width}    30
    Input Text    ${d_length}    30
    Input Text    ${d_height}    15
    Input Text    ${input_product_weight}    1
    Execute Javascript    $('#tag_tag').val('กระโปรง')
    Execute Javascript    $('#switch-option').click()
    Wait Until Element Is Visible    ${box_attribute}    ${EXPECT_LOADTIME}
    Select Attribute Size WM
    Input price and stock into product attribute2
    Add Image Inv Not Duplicate    3
    Sleep    30s
    Execute Javascript    $('#tag_tagsinput').val('กระโปรง')
    Execute Javascript    $('#btn_select_photo').click()
    Choose Image From Gallery Correct New
    Execute Javascript    $('.btn-save').eq(0).click()
    Sleep    7s
    ${pid}    Get Text    ${top_record_pid}
    Input Text    ${input_keyword}    ${pid}
    Click Button    //*[@id="table_report_filter"]/button
    Wait Until Element Is Visible    ${top_record_pid}    ${EXPECT_LOADTIME}
    ${Status1}    Get Text    ${top_record_p_name}
    ${Status2}    Convert To String    ${status1}
    Should Contain    ${Status2}    ${p_name}
    ${Status3}    Get Text    ${top_record_p_status}
    ${Status4}    Convert To String    ${status3}
    Should Contain    ${Status4}    ผ่านการตรวจสอบ
    ${Status5}    Get Text    ${top_record_p_type}
    ${Status6}    Convert To String    ${status5}
    Should Contain    ${Status6}    พร้อมส่ง
    ${stock1}    Get Text    ${top_record_amount}
    ${stock2}    Convert To String    ${stock1}
    Should Contain    ${stock2}    30
    ${selling_price}    Get Text    ${top_record_selling_price}
    ${selling_price1}    Convert To String    ${selling_price}
    Should Contain    ${selling_price1}    199
    ${Normal_price}    Get Text    ${top_record_normal_price}
    ${Normal_price1}    Convert To String    199
    Should Contain    ${Normal_price1}    199
    Sleep    1s
    WMS Switch Project    wm
    Go To    url=${URL_WMS}/monitoringlisting
    Execute Javascript    $("input[name='product_id']").val('${pid}')
    Click Button    //button[@class="btn btn-info"]
    ${monitor_st1}    Get Text    ${top_record_adminstatus}
    Should Contain    ${monitor_st1}    รอตรวจสอบ
    ${monitor_st2}    Get Text    ${top_record_sellerstatus}
    Should Contain    ${monitor_st2}    ผ่านการตรวจสอบ
    Sleep    3s
    Go To    url=${URL_LEVEL_D}/${pid}
    Wait Until Element Is Visible    //*[@*="product-name"]
    ${lvd_p_name}    Execute Javascript    return ${lvd_product_name}.text()
    ${str1}    Convert To String    ${lvd_p_name}
    Should Be Equal    ${p_name}    ${str1}
    ${selling_price}    Execute Javascript    return ${lvd_product_price}.text()
    ${str2}    Convert To String    ${selling_price}
    Should Be Equal    ${selling_price}    ${str2}
    ${product_desc}    Execute Javascript    return ${lvd_product_desc}.text()
    ${str4}    Convert To String    ${product_desc}
    Should Contain    ${str4}    Producttest
    ${p_size}    Execute Javascript    return $('.box-option-size').text()
    Sleep    10s
    Account Login    ${seller_user_001}    ${seller_pwd_001}
    Go To    ${url_product_list}
    Wait Until Element Is Visible    //input[@id="search"]    ${EXPECT_LOADTIME}
    Input Text    ${input_keyword}    ${p_name}
    Click Button    //*[@id="table_report_filter"]/button
    Execute Javascript    $('input[id="check_all"]').click()
    Sleep    2s
    Execute Javascript    $('button[id="btn_delete"]').click()
    Click OK Alert Box
    Sleep    2s
    Wait Until Element Is Visible    //*[@id="errortext"]    ${EXPECT_LOADTIME}

TC_MC_05697
    [Documentation]    Verify product status "Instock" (Success).
    Go To    ${url_product_add}
    Wait Until Element Is Visible    ${input_product_name}
    Select Category Fashion Clothes
    Sleep    3s
    Select Property
    Genarate Product Name And SKU    addtest_
    Execute Javascript    $('#title_th').val('${p_name}')
    Execute Javascript    $('div.redactor-editor').focus()
    Execute Javascript    $('div.redactor-editor').html('Producttest').keydown()
    Execute Javascript    ${product_type_used}
    #Execute Javascript    ${status_instock}.click()
    # Execute Javascript    $('#prepare_shipping').val(2)
    # Execute Javascript    $('#instockunit').val(10)
    # Execute Javascript    $('#sku').val('${p_sku}')
    # Execute Javascript    $('#price').val(199)
    # Execute Javascript    $('#compare_at_price').val(200)
    Input Product Stock    2    10
    Input SKU and Product Price    ${p_sku}    199    200
    Execute Javascript    $('#tag_tag').val('กระโปรง')
    Execute Javascript    $('#btn_select_photo').click()
    Choose Image From Gallery Correct
    Execute Javascript    $('.btn-save').eq(0).click()
    Sleep    7s
    ${pid}    Get Text    ${top_record_pid}
    Input Text    ${input_keyword}    ${pid}
    Click Button    //*[@id="table_report_filter"]/button
    Wait Until Element Is Visible    ${top_record_pid}    ${EXPECT_LOADTIME}
    ${Status1}    Get Text    ${top_record_p_name}
    ${Status2}    Convert To String    ${status1}
    Should Contain    ${Status2}    ${p_name}
    ${Status3}    Get Text    ${top_record_p_status}
    ${Status4}    Convert To String    ${status3}
    Should Contain    ${Status4}    ผ่านการตรวจสอบ
    ${stock1}    Get Text    ${top_record_amount}
    ${stock2}    Convert To String    ${stock1}
    Should Contain    ${stock2}    10
    ${stock1}    Get Text    ${top_record_amount}
    ${stock2}    Convert To String    ${stock1}
    Should Contain    ${stock2}    10
    #Sleep    3s
    WMS Switch Project    wm
    Go To    url=${URL_WMS}/monitoringlisting
    Execute Javascript    $("input[name='product_id']").val('${pid}')
    Click Button    //button[@class="btn btn-info"]
    ${monitor_st1}    Get Text    ${top_record_adminstatus}
    Should Contain    ${monitor_st1}    รอตรวจสอบ
    ${monitor_st2}    Get Text    ${top_record_sellerstatus}
    Should Contain    ${monitor_st2}    ผ่านการตรวจสอบ
    #Sleep    3s
    Go To    url=${URL_LEVEL_D}/${pid}
    ${lvd_p_name}    Execute Javascript    return ${lvd_product_name}.text()
    ${str1}    Convert To String    ${lvd_p_name}
    Should Be Equal    ${p_name}    ${str1}
    ${selling_price}    Execute Javascript    return ${lvd_product_price}.text()
    ${str2}    Convert To String    ${selling_price}
    Should Be Equal    ${selling_price}    ${str2}
    ${product_desc}    Execute Javascript    return ${lvd_product_desc}.text()
    ${str4}    Convert To String    ${product_desc}
    Should Contain    ${str4}    Producttest

TC_WLS_00041
    [Documentation]    Verify product SKU incorrect.
    Go To    ${url_product_add}
    Wait Until Element Is Visible    ${input_product_name}
    Select Category Fashion Bag
    ${time}    Get Time    epoch
    ${p_name}    Catenate    TestAddproduct ${time}
    Set Test Variable    ${p_sku}    รหัสสินค้า^!@^
    Input Text    ${input_product_name}    ${p_name}
    Input Description
    Execute Javascript    ${product_type_used}
    #Execute Javascript    ${status_instock}.click()
    Input Product Stock    3    10
    Input SKU and Product Price    ${p_sku}    199    200
    Input Text    ${d_width}    30
    Input Text    ${d_length}    30
    Input Text    ${d_height}    15
    Input Text    ${input_product_weight}    1
    # Input Text    ${prepare_shipping}    3
    # Input Text    ${unit_instock}    10
    # Input Text    ${input_product_sku}    รหัสสินค้า^!@^
    # Input Text    ${input_selling_price}    199
    # Input Text    ${input_normal_price}    200
    Input Text    ${input_product_tag}    กระโปรง
    Click Element    ${btn_choose_image}
    Choose Image From Gallery Correct
    Execute Javascript    $('.btn-save').eq(0).click()
    Focus    ${input_product_sku}
    Click Element    //*[@id="knowledge-step1"]/a
    Execute Javascript    $('.btn-save').eq(0).click()
    Wait Until Element Is Visible    ${input_product_name}
    Location Should Be    ${url_product_add}

TC_WLS_00042
    [Documentation]    Verify product SKU correct.
    Account Login    ${seller_user_001}    ${seller_pwd_001}
    Go To    ${url_product_add}
    Wait Until Element Is Visible    ${input_product_name}
    Select Category Fashion Bag
    ${time}    Get Time    epoch
    ${p_name}    Catenate    TestAddproduct ${time}
    #${p_sku}    Set Variable    SKU0001
    #Input Text    ${input_product_name}    ${p_name}
    Input Product Name    ${p_name}
    Input Description
    Execute Javascript    ${product_type_used}
    #Execute Javascript    ${status_instock}.click()
    # Input Text    ${prepare_shipping}    3
    # Input Text    ${unit_instock}    10
    # Input Text    ${input_product_sku}    SKU0001
    # Input Text    ${input_selling_price}    199
    # Input Text    ${input_normal_price}    200
    Input Product Stock    3    10
    Input SKU and Product Price    ${p_sku}    SKU0001    199    200
    Input Text    ${input_product_tag}    กระโปรง
    Click Element    ${btn_choose_image}
    #Sleep    3s
    Choose Image From Gallery Correct
    Execute Javascript    $('.btn-save').eq(0).click()
    Wait Until Page Does Not Contain    ${input_product_tag}
    Location Should Be    ${url_product_list}
    ${pid}    Get Text    ${top_record_pid}
    Input Text    ${input_keyword}    ${pid}
    Click Button    //*[@id="table_report_filter"]/button
    Wait Until Element Is Visible    ${top_record_pid}    ${EXPECT_LOADTIME}
    ${Status1}    Get Text    ${top_record_p_name}
    ${Status2}    Convert To String    ${status1}
    Should Contain    ${Status2}    ${p_name}
    ${Status3}    Get Text    ${top_record_p_status}
    ${Status4}    Convert To String    ${status3}
    Should Contain    ${Status4}    ผ่านการตรวจสอบ

TC_MC_05556
    [Documentation]    Verify save button.
    Go To    ${url_product_add}
    Wait Until Element Is Visible    ${input_product_name}
    Select Category Fashion Bag
    Genarate Product Name And SKU    TestAddproduct
    Input Text    ${input_product_name}    ${p_name}
    Input Description
    Execute Javascript    ${product_type_used}
    #Execute Javascript    ${status_instock}.click()
    # Input Text    ${prepare_shipping}    2
    # Input Text    ${unit_instock}    10
    # Input Text    ${input_product_sku}    ${p_sku}
    # Input Text    ${input_selling_price}    199
    # Input Text    ${input_normal_price}    200
    Input Product Stock    2    10
    Input SKU and Product Price    ${p_sku}    199    200
    Execute Javascript    $('#switch-option').click()
    Wait Until Element Is Visible    ${box_attribute}    ${EXPECT_LOADTIME}
    Execute Javascript    $('ul.chzn-choices').eq(2).click()
    Click Element    //div[@class='chzn-drop']/ul/li[@id='attr_sel_1_chzn_o_2']
    Execute Javascript    $('ul.chzn-choices').eq(2).click()
    Click Element    //div[@class='chzn-drop']/ul/li[@id='attr_sel_1_chzn_o_3']
    Execute Javascript    $('ul.chzn-choices').eq(2).click()
    Click Element    //div[@class='chzn-drop']/ul/li[@id='attr_sel_1_chzn_o_4']
    ${count_attr}    Get Matching Xpath Count    ${table_cross_attr}
    ${attr_r1}    Get Text    ${attr_r1}
    ${attr_r2}    Get Text    ${attr_r2}
    ${attr_r3}    Get Text    ${attr_r3}
    Input Text    //*[@id="cross-sub-attr"]/tbody/tr[1]/td[4]/span/input    1
    Input Text    //*[@id="cross-sub-attr"]/tbody/tr[2]/td[4]/span/input    2
    Input Text    //*[@id="cross-sub-attr"]/tbody/tr[3]/td[4]/span/input    3
    Input Text    //*[@id="cross-sub-attr"]/tbody/tr[1]/td[5]/span/input    6
    Input Text    //*[@id="cross-sub-attr"]/tbody/tr[2]/td[5]/span/input    7
    Input Text    //*[@id="cross-sub-attr"]/tbody/tr[3]/td[5]/span/input    8
    Input Text    ${input_product_tag}    กระโปรง
    Click Element    ${btn_choose_image}
    #Sleep    3s
    Choose Image From Gallery Correct
    #Sleep    3s
    Execute Javascript    $('.btn-save').eq(0).click()
    Wait Until Page Does Not Contain    ${input_product_tag}
    Location Should Be    ${url_product_list}
    #Sleep    3s
    ${pid}    Get Text    ${top_record_pid}
    Input Text    ${input_keyword}    ${pid}
    Click Button    //*[@id="table_report_filter"]/button
    Wait Until Element Is Visible    ${top_record_pid}    ${EXPECT_LOADTIME}
    ${Status1}    Get Text    ${top_record_p_name}
    ${Status2}    Convert To String    ${status1}
    Should Contain    ${Status2}    ${p_name}
    ${Status3}    Get Text    ${top_record_p_status}
    ${Status4}    Convert To String    ${status3}
    Should Contain    ${Status4}    ผ่านการตรวจสอบ

TC_WLS_00044
    [Documentation]    Verify Add Product and Delete.
    [Tags]    High
    #Set Selenium Speed    .3
    Go To    ${url_product_add}
    Wait Until Element Is Visible    ${input_product_name}
    Select Category Fashion Bag
    Sleep    3s
    Select Property
    Genarate Product Name And SKU    addtest_
    Execute Javascript    $('#title_th').val('${p_name}')
    Input Text    ${input_product_desc}    Producttest
    Execute Javascript    ${product_type_used}
    #Execute Javascript    ${status_instock}.click()
    Execute Javascript    $('#prepare_shipping').val(2)
    Execute Javascript    $('#instockunit').val(10)
    Execute Javascript    $('#sku').val('${p_sku}')
    Input Text    ${d_width}    30
    Input Text    ${d_length}    30
    Input Text    ${d_height}    15
    Input Text    ${input_product_weight}    1
    Execute Javascript    $('#tag_tag').val('กระเป๋าเอกสาร')
    Execute Javascript    $('#switch-option').click()
    Wait Until Element Is Visible    ${box_attribute}    ${EXPECT_LOADTIME}
    Select Attribute
    Input price and stock into product attribute
    Execute Javascript    $('#btn_select_photo').click()
    Choose Image From Gallery Correct
    Execute Javascript    $('.btn-save-add').eq(0).click()
    # Sleep    10s
    # Display Alert Footer
    # Sleep    5s
    Wait Until Element Is Visible    ${input_product_name}
    Location Should Be    ${url_product_add}
    Go To    ${url_product_list}
    Wait Until Element Is Visible    //input[@id="search"]    ${EXPECT_LOADTIME}
    Input Text    ${input_keyword}    addtest
    Click Button    //*[@id="table_report_filter"]/button
    Execute Javascript    $('input[id="check_all"]').click()
    Sleep    2s
    Execute Javascript    $('button[id="btn_delete"]').click()
    Click OK Alert Box
    Sleep    2s
    Wait Until Element Is Visible    //*[@id="errortext"]    ${EXPECT_LOADTIME}

TC_WLS_00406
    [Documentation]    Open Add product page (don't enter) and click product list at sidebar menu
    Go To    ${url_product_add}
    Execute Javascript    $('#sidebar_21').find('a').get(0).click();
    Location Should Be    ${url_product_list}

TC_WLS_00407
    [Documentation]    Open Add product page (Select plaza category) and click category list at sidebar menu
    Go To    ${url_product_add}
    Wait Until Element Is Visible    ${input_product_name}
    Select Category Fashion Bag
    Execute Javascript    $('#sidebar_22').find('a').get(0).click();
    #Sleep    4s
    #Element Should Be Visible    //*[@id="alertbefore-close"]
    Wait Until Element Is Visible    //*[@id="alertbefore-close"]
    ${msg}    Get Text    //*[@id="alertbefore-close"]/div[2]
    Should Contain    ${msg}    คุณยังทำรายการไม่เสร็จสิ้น คุณต้องการออกจากหน้านี้โดยที่ยังไม่ได้บันทึกหรือไม่?

TC_WLS_00408
    [Documentation]    Open Add product page (enter product title) and click add category at sidebar menu
    Go To    ${url_product_add}
    Wait Until Element Is Visible    ${input_product_name}
    Select Category Fashion Bag
    Input Text    ${input_product_name}    test add
    Execute Javascript    $('#sidebar_22').find('a').get(1).click();
    #Sleep    4s
    #Element Should Be Visible    //*[@id="alertbefore-close"]
    Wait Until Element Is Visible    //*[@id="alertbefore-close"]
    #Sleep    2s
    Click Element    //*[@class="close-cancel btn btn-small"]
    #Sleep    3s
    Wait Until Element Is Visible    ${input_product_name}
    Location Should Be    ${url_product_add}

TC_WLS_00409
    [Documentation]    Open Add product page (enter product title) and click add category at sidebar menu
    Go To    ${url_product_add}
    Wait Until Element Is Visible    ${input_product_name}
    Select Category Fashion Bag
    Input Text    ${input_product_name}    test add
    Execute Javascript    $('#sidebar_22').find('a').get(1).click();
    Sleep    2s
    Element Should Be Visible    //*[@id="alertbefore-close"]
    #Sleep    2s
    Click Element    //*[@id="alertbefore-close"]/div[2]/p[2]/button[2]
    #Sleep    6s
    Wait Until Element Is Visible    ${input_product_name}
    Location Should Be    ${URL_STORE}/${user_s001}/admin/category/create

TC_WLS_05434
    [Documentation]    Add product - Verify shop category Incase select existing shop category (main category)
    Go To    ${url_product_add}
    Wait Until Element Is Visible    ${input_product_name}
    Select Category Fashion Bag
    #main is    เสื้อยืด
    Select Shop Category Main
    Genarate Product Name And SKU    TestAddproduct
    # Input Text    ${input_product_name}    ${p_name}
    # Execute Javascript    $("div[class='redactor-editor']").text('Producttest')
    #Press Key    ${input_product_name}    ${p_name}
    #Press Key    //div[@class='redactor-editor']    Producttest
    Input Product Name    ${p_name}
    Input Description
    Execute Javascript    ${product_type_used}
    # Execute Javascript    ${status_instock}.click()
    Input Product Stock    3    10
    Input SKU and Product Price    ${p_sku}    199    200
    # Input Text    ${prepare_shipping}    3
    # Input Text    ${unit_instock}    10
    # Input Text    ${input_product_sku}    ${p_sku}
    # Input Text    ${input_selling_price}    199
    # Input Text    ${input_normal_price}    200
    Input Text    ${input_product_tag}    กระโปรง
    Click Element    ${btn_choose_image}
    Choose Image From Gallery Correct
    Execute Javascript    $('.btn-save').eq(0).click()
    Wait Until Element Is Visible    ${top_record_pid}    ${EXPECT_LOADTIME}
    Location Should Be    ${url_product_list}
    ${last_pname}    Get Text    ${top_record_p_name}
    Should Be Equal    ${last_pname}    ${p_name}
    Element Should Contain    //*[@id="table_report"]/tbody/tr[1]/td[3]/div[@class='pd-list-cat']/a    เสื้อยืด

TC_WLS_05435
    [Documentation]    Add product - Verify shop category Incase select existing shop category (Sub category)
    Go To    ${url_product_add}
    Wait Until Element Is Visible    ${input_product_name}
    Select Category Fashion Bag
    #main is    กระเป๋าเอกสาร sub is กระเป๋าโน๊ตบุค
    Select Shop Category Sub
    Genarate Product Name And SKU    TestAddproduct
    # Press Key    ${input_product_name}    ${p_name}
    # Press Key    //div[@class='redactor-editor']    Producttest
    Execute Javascript    ${product_type_used}
    # Execute Javascript    ${status_instock}.click()
    # Input Text    ${prepare_shipping}    3
    # Input Text    ${unit_instock}    10
    # Input Text    ${input_product_sku}    ${p_sku}
    # Input Text    ${input_selling_price}    199
    # Input Text    ${input_normal_price}    200
    Input Product Name    ${p_name}
    Input Description
    Input Product Stock    3    10
    Input SKU and Product Price    ${p_sku}    199    200
    Input Text    ${input_product_tag}    กระโปรง
    Click Element    ${btn_choose_image}
    Choose Image From Gallery Correct
    Execute Javascript    $('.btn-save').eq(0).click()
    Wait Until Element Is Visible    ${top_record_pid}    ${EXPECT_LOADTIME}
    Location Should Be    ${url_product_list}
    ${last_pname}    Get Text    ${top_record_p_name}
    Should Be Equal    ${last_pname}    ${p_name}
    Element Should Contain    //*[@id="table_report"]/tbody/tr[1]/td[3]/div[@class='pd-list-cat']/a[1]    กระเป๋าเอกสาร
    Element Should Contain    //*[@id="table_report"]/tbody/tr[1]/td[3]/div[@class='pd-list-cat']/a[2]    กระเป๋าโน๊ตบุค

TC_WLS_05867
    [Documentation]    Update/edit product and verify time and date on database
    ## can add ##
    Go To    ${url_product_add}
    Wait Until Element Is Visible    ${input_product_name}
    Select Category Fashion Bag
    Select Shop Category Sub
    Genarate Product Name And SKU    TestAddproductUpdated_at
    # Press Key    ${input_product_name}    ${p_name}
    # Press Key    //div[@class='redactor-editor']    TestAddproductUpdated_at
    Execute Javascript    ${product_type_used}
    # Execute Javascript    ${status_instock}.click()
    # Input Text    ${prepare_shipping}    3
    # Input Text    ${unit_instock}    10
    # Input Text    ${input_product_sku}    ${p_sku}
    # Input Text    ${input_selling_price}    199
    # Input Text    ${input_normal_price}    200
    Input Product Name    ${p_name}
    Input Description    TestAddproductUpdated_at
    Input Product Stock    3    10
    Input SKU and Product Price    ${p_sku}    199    200
    Input Text    ${input_product_tag}    กระโปรง
    Click Element    ${btn_choose_image}
    Choose Image From Gallery Correct
    Execute Javascript    $('.btn-save').eq(0).click()
    ${date_now}=    Get Current Date    UTC    07:00:00    datetime    True
    Wait Until Element Is Visible    ${top_record_pid}    ${EXPECT_LOADTIME}
    Location Should Be    ${url_product_list}
    ${last_pname}    Get Text    ${top_record_p_name}
    Should Be Equal    ${last_pname}    ${p_name}
    Element Should Contain    //*[@id="table_report"]/tbody/tr[1]/td[3]/div[@class='pd-list-cat']/a[1]    กระเป๋าเอกสาร
    Element Should Contain    //*[@id="table_report"]/tbody/tr[1]/td[3]/div[@class='pd-list-cat']/a[2]    กระเป๋าโน๊ตบุ๊ค
    ## can edit ##
    Click Element    //*[@id="table_report"]/tbody/tr[1]/td[3]/div[1]/a
    Sleep    2
    Press Key    ${input_product_name}    can_edit_this_product_by_robotz
    Execute Javascript    $('.btn-save').eq(0).click()
    Sleep    2
    Click Element    //button[@class="btn btn-small btn-cancel"]
    Wait Until Element Is Visible    ${top_record_pid}    ${EXPECT_LOADTIME}
    Element Should Contain    //*[@id="table_report"]/tbody/tr[1]/td[3]/div[1]/a[1]    can_edit_this_product_by_robotz
    ## check updated_at ##
    WMS Switch Project    wm
    Go To    url=${URL_WMS}/members
    Press Key    //input[@id='store_id_search']    ${store_id}
    Press Key    //input[@id='store_id_search']    \\13
    Sleep    2
    Execute Javascript    $('a.btn-xs')[0].click()
    Wait Until Element Is Visible    //strong[contains(text(),'ปรับปรุงร้านค้าล่าสุด')]/following::div[@class=''][1]    ${EXPECT_LOADTIME}
    ${updated_at}=    Get Text    //strong[contains(text(),'ปรับปรุงร้านค้าล่าสุด')]/following::div[@class=''][1]
    ${epoch_date_updated_at}=    Convert Date    ${updated_at}    epoch
    ${epoch_date_now}=    Convert Date    ${date_now}    epoch
    Should Be True    ${epoch_date_updated_at} >= ${epoch_date_now}

TC_MC_07305
    [Documentation]    Add product type MF dupicate deleted SKU
    [Tags]    High
    Account Login    ${user_wm_type_mf_mail}    ${user_wm_type_mf_pwd}
    Product.Add Product MC Type MF Delete SKU    ${sku_dupicate_deleted_sku}

TC_MC_07523
    [Documentation]    Add product type MF dupicate SKU
    [Tags]    Regression    High
    Account Login    ${user_wm_type_mf_mail}    ${user_wm_type_mf_pwd}
    Product.Add Product MC Type MF Dupicate SKU    ${sku_dupicate_sku}






