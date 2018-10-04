*** Settings ***
Suite Setup       Open and Prepare Data    # Suite Setup    Switch Status Shop to Open    ${seller_user_003}    ${seller_pwd_003}    # Suite Teardown    Switch Status Shop to Closed
Suite Teardown    Clear All Test
Force Tags        Seller    Sanity    # Test Teardown    Close All Browsers
Library           SeleniumLibrary
Resource          ../../../../Resource/WeLoveShopping/init.robot
Resource          ../../../../Resource/WeLoveShopping/WebElement/Member_SignIn.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/Category.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/Widget.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/ManageProfile.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/Portal.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/Product.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/SellerTheme.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/Backend_Dashboard.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/Gallery.txt
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Backend_Category.txt
Resource          ../../../../Keyword/Common/Gallery.txt
Resource          ../../../../Keyword/Common/Shipping.txt
Resource          ../../../../Keyword/Common/Backend_Promotion.txt
Resource          ../../../../Keyword/Common/Backend_Dashboard.txt
Resource          ../../../../Keyword/Common/Product.txt
Resource          ../../../../Keyword/Common/Store_Theme.txt


*** Test Cases ***
TC_MC_01927
    [Documentation]    Verify product status "Instock" with attibute (Success).
    [Tags]    Sanity-Test-03
    # Account Login    ${seller_user_003}    ${seller_pwd_003}
    # Go to Login    ${seller_user_003}    ${seller_pwd_003}
    Set Suite Variable    ${URL_PORTAL}    ${URL_Backup}
    Reload Page
    Sleep    0.5s
    # ${result}=    Check Element    //a[@title='บัญชีของฉัน']
    # Run Keyword If    '${result}'=='FAIL'    Go to Login    ${seller_user_003}    ${seller_pwd_003}
    Check and Reset Seller Login    ${user_s003}    ${seller_user_003}    ${seller_pwd_003}
    # Go To    ${URL_ACCOUNT}/profile
    # Sleep    1s
    # Get shop name
    Go To    ${URL_STORE}/${user_s003}/admin/product/create
    Wait Until Element Is Visible    ${input_product_name}
    Select Category Fashion Bag
    Genarate Product Name And SKU    TestAddproduct
    Execute Javascript    $('#title_th').val('${p_name}')
    Execute Javascript    $('div.redactor-editor').focus()
    Execute Javascript    $('div.redactor-editor').html('Producttest').keydown()
    #    Execute Javascript    $('div.redactor-editor').keydown()
    #    Input Text    ${input_product_desc}    Producttest
    Execute Javascript    ${product_type_used}
    Execute Javascript    ${status_instock}.click()
    Execute Javascript    ${product_type_used}
    Execute Javascript    ${status_instock}.click()
    Execute Javascript    $('#prepare_shipping').val(2)
    Execute Javascript    $('#instockunit').val(10)
    Execute Javascript    $('#sku').val('${p_sku}')
    Execute Javascript    $('#tag_tag').val('กระโปรง')
    Execute Javascript    $('#switch-option').click()
    Wait Until Element Is Visible    ${box_attribute}    ${EXPECT_LOADTIME}
    Select Attribute
    Set Selenium Speed    0.1
    Input price and stock into product attribute
    Execute Javascript    $('#btn_select_photo').click()
    Choose Image From Gallery Correct_ForAddProduct
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
    Should Contain    ${stock2}    ${Total}
    ${selling_price}    Get Text    ${top_record_selling_price}
    ${selling_price1}    Convert To String    ${selling_price}
    Should Contain    ${selling_price1}    ${Price}
    ${Normal_price}    Get Text    ${top_record_normal_price}
    ${Normal_price1}    Convert To String    ${Normal_price}
    Should Contain    ${Normal_price1}    ${Original_Price}
    Sleep    1s
    Go to WMS
    Go To    url=${URL_WMS}/monitoringlisting
    Execute Javascript    $("input[name='product_id']").val('${pid}')
    Click Button    //button[@class="btn btn-info"]
    ${monitor_st1}    Get Text    ${top_record_adminstatus}
    Should Contain    ${monitor_st1}    รอตรวจสอบ
    ${monitor_st2}    Get Text    ${top_record_sellerstatus}
    Should Contain    ${monitor_st2}    ผ่านการตรวจสอบ
    Go To    url=${URL_LEVEL_D}/${pid}
    Wait Until Page Contains Element    //*[@*="product-name"]
    ${lvd_p_name}    Execute Javascript    return ${lvd_product_name}.text()
    ${str1}    Convert To String    ${lvd_p_name}
    Should Be Equal    ${p_name}    ${str1}
    ${selling_price}    Execute Javascript    return ${lvd_product_price}.text()
    ${str2}    Convert To String    ${selling_price}
    Should Be Equal    ${selling_price}    ${str2}
    ${product_type}    Execute Javascript    return ${lvd_product_type}.text()
    ${str3}    Convert To String    ${product_type}
    ${str3}    Remove String    ${str3}    สินค้า
    Should Be Equal    ${str3}    พร้อมส่ง
    ${product_desc}    Execute Javascript    return ${lvd_product_desc}.text()
    ${str4}    Convert To String    ${product_desc}
    Should Contain    ${str4}    Producttest
    ${p_size}    Execute Javascript    return $('.box-option-size').text()
    Go to    ${URL_PORTAL}

TC_MC_01929
    [Documentation]    Verify product status "Pre-order" (Success). Incase not use stock.
    [Tags]    Sanity-Test-03
    # Set Selenium Speed    .2
    # Account Login    ${seller_user_003}    ${seller_pwd_003}
    Reload Page
    Sleep    0.5s
    # ${result}=    Check Element    //a[@title='บัญชีของฉัน']
    # Run Keyword If    '${result}'=='FAIL'    Go to Login    ${seller_user_003}    ${seller_pwd_003}
    Check and Reset Seller Login    ${user_s003}    ${seller_user_003}    ${seller_pwd_003}
    Sleep    1s
    # Get shop name
    Go To    ${URL_STORE}/${user_s003}/admin/product/create
    Wait Until Element Is Visible    ${input_product_name}
    Select Category Fashion Bag
    Genarate Product Name And SKU    TestAddproduct
    Execute Javascript    $('#title_th').val('${p_name}')
    Execute Javascript    $('div.redactor-editor').focus()
    Execute Javascript    $('div.redactor-editor').html('Producttest').keydown()
    #    Execute Javascript    $('div.redactor-editor').keydown()
    #    Input Text    ${input_product_desc}    Producttest
    Execute Javascript    ${product_type_used}
    Execute Javascript    ${status_preorder}.click()
    Execute Javascript    $('#new-product-inventory-management').val(0).change()
    Execute Javascript    $('#shipping_in').val(2)
    Execute Javascript    $('#sku').val('${p_sku}')
    Execute Javascript    $('#price').val(3)
    Execute Javascript    $('#compare_at_price').val(5)
    Execute Javascript    $('#tag_tag').val('กระโปรง')
    Execute Javascript    $('#btn_select_photo').click()
    Choose Image From Gallery Correct_ForAddProduct
    Execute Javascript    $('.btn-save').eq(0).click()
    Sleep    8s
    #    ${Check_Success}    Get Matching Xpath Count    //*[@id="product_create"]
    #    Run Keyword If    ${Check_Success} > 0    Add product preorder
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
    Should Contain    ${Status6}    พรีออเดอร์
    ${stock1}    Get Text    ${top_record_amount}
    ${stock2}    Convert To String    ${stock1}
    Should Contain    ${stock2}    N/A
    Sleep    1s
    Go to WMS
    Go To    url=${URL_WMS}/monitoringlisting
    Execute Javascript    $("input[name='product_id']").val('${pid}')
    Click Button    //button[@class="btn btn-info"]
    Wait Until Element Is Visible    ${top_record_adminstatus}
    ${monitor_st1}    Get Text    ${top_record_adminstatus}
    Should Contain    ${monitor_st1}    รอตรวจสอบ
    Wait Until Element Is Visible    ${top_record_sellerstatus}
    ${monitor_st2}    Get Text    ${top_record_sellerstatus}
    Should Contain    ${monitor_st2}    ผ่านการตรวจสอบ
    Sleep    3s
    Go To    url=${URL_LEVEL_D}/${pid}
    ${lvd_p_name}    Execute Javascript    return ${lvd_product_name}.text()
    ${str1}    Convert To String    ${lvd_p_name}
    Should Be Equal    ${p_name}    ${str1}
    ${selling_price}    Execute Javascript    return ${lvd_product_price}.text()
    ${str2}    Convert To String    ${selling_price}
    Should Be Equal    ${selling_price}    ${str2}
    ${product_type}    Execute Javascript    return ${lvd_product_type}.text()
    ${str3}    Convert To String    ${product_type}
    ${str3}    Remove String    ${str3}    สินค้า
    Should Be Equal    ${str3}    พรีออเดอร์
    ${product_desc}    Execute Javascript    return ${lvd_product_desc}.text()
    ${str4}    Convert To String    ${product_desc}
    Should Contain    ${str4}    Producttest
    ${p_size}    Execute Javascript    return $('.box-option-size').text()

TC_WLS_00908
    [Documentation]    Verify Delete product on product list page.
    [Tags]    Sanity-Test-03
    Reload Page
    Sleep    0.5s
    # ${result}=    Check Element    //a[@title='บัญชีของฉัน']
    # Run Keyword If    '${result}'=='FAIL'    Go to Login    ${seller_user_003}    ${seller_pwd_003}
    Check and Reset Seller Login    ${user_s003}    ${seller_user_003}    ${seller_pwd_003}
    # Account Login    ${seller_user_003}    ${seller_pwd_003}
    Sleep    1s
    # Get shop name
    Go To    ${URL_STORE}/${user_s003}/admin/product
    Wait Until Element Is Visible    table_report
    Search product    TestAddproduct
    Execute Javascript    ${check_all}.click()
    Click Element    btn_delete
    Click OK Alert Box

TC_MC_00441
    [Documentation]    Verify delete folder. If delete album with edit button.
    [Tags]    Sanity-Test-02
    # Set Selenium Speed    0.3
    # Account Login    ${seller_user_002}    ${seller_pwd_002}
    # Go to Login    ${seller_user_002}    ${seller_pwd_002}
    # ${result}=    Check Element    //a[@title='บัญชีของฉัน']
    # Run Keyword If    '${result}'=='FAIL'    Go to Login    ${seller_user_002}    ${seller_pwd_002}
    Check and Reset Seller Login    ${user_s002}    ${seller_user_002}    ${seller_pwd_002}
    # Get shop name
    Go To    ${URL_STORE}/${user_s002}/admin/gallery
    Wait Until Element Is Visible    //div[@class="row-fluid list-albums clear-fix"]
    ${count_default}    Execute Javascript    return $('.ace-thumbnails').length
    Upload Image To Gallery    ${image_logo}    ${upl_input}
    Comment    Upload Image To Gallery (Windows)    $("#fileuploadinput")    logo_mi6_seller_3.jpg    id=fileuploadinput
    Sleep    2s
    Wait Until Element Is Visible    //span[@data-title="ไม่มีไฟล์..."]
    ${count_before}    Execute Javascript    return $('.ace-thumbnails').length
    Run Keyword If    ${count_default} == ${count_before}    Reload Page
    Sleep    1s
    Wait Until Element Is Visible    //ul[@class="ace-thumbnails"]//img
    ${count_before}    Execute Javascript    return $('.ace-thumbnails').length
    Execute Javascript    ${btn_edit_gallery}.click()
    ${status_1}    Execute Javascript    return $('#tool_albume_delete').is(":disabled")
    Should Be True    '${status_1}' == 'True'
    Execute Javascript    $('.check_selected').eq(0).click()
    sleep    2s
    ${status_2}    Execute Javascript    return $('#tool_albume_delete').is(":enabled")
    Should Be True    '${status_2}' == 'True'
    Execute Javascript    ${btn_delete_album}.click()
    Wait Until Element Is Visible    //div[@class="bootbox modal fade in"]
    Click OK Alert Box
    Wait Until Element Is Not Visible    //div[@class="bootbox modal fade in"]
    Run Keyword If    ${count_default} == ${count_before}    Reload Page
    Sleep    1s
    Wait Until Element Is Visible    //ul[@class="ace-thumbnails"]//img
    ${count_after}    Execute Javascript    return $('.ace-thumbnails').length
    Should Be True    ${count_after} < ${count_before}

TC_MC_08667
    [Documentation]    Verify theme color. Incase choose Brown theme.
    [Tags]    Sanity-Test-02
    ## Prepare Default Theme
    # Account Login    ${seller_user_002}    ${seller_pwd_002}
    Reload Page
    Sleep    0.5s
    # ${result}=    Check Element    //a[@title='บัญชีของฉัน']
    # Run Keyword If    '${result}'=='FAIL'    Go to Login    ${seller_user_002}    ${seller_pwd_002}
    Check and Reset Seller Login    ${user_s002}    ${seller_user_002}    ${seller_pwd_002}
    Get shop name
    Go To    ${URL_STORE}/${user_s002}/admin/theme/setting
    ${Color_Old}    Get Element Attribute    //select[@id="sel_theme"]//option[@selected=""]@value
    Select From List By Label    ${select_theme}    สีน้ำตาล
    Sleep    0.5s
    Run Keyword If    '${Color_old}' != 'brown'    Confirm Action
    Sleep    0.3s
    Element Should Be Visible    ${ex_brown_theme}
    Execute Javascript    $('.btn.btn-primary.btn-small')[0].click()
    Verify theme color    brown
    Sleep    2s
    Go To    ${URL_STORE}/${user_s002}/admin/theme/setting
    ${Color_Old}    Get Element Attribute    //select[@id="sel_theme"]//option[@selected=""]@value
    Select From List By Label    ${select_theme}    สีแดง (มาตรฐาน)
    Sleep    0.5s
    Run Keyword If    '${Color_old}' != 'red'    Confirm Action
    Execute Javascript    $('.btn.btn-primary.btn-small')[0].click()
    Element Should Be Visible    ${ex_red_theme}
    Verify theme color    red

TC_WLS_00470
    [Documentation]    Verify display last newlist.
    [Tags]    Sanity-Test-02
    Reload Page
    Sleep    0.5s
    Check and Reset Seller Login    ${user_s0010}    ${seller_user_0010}    ${seller_pwd_0010}
    Go to WMS
    Goto    ${URL_WMS}/sellernewsdashboard?sort=desc&order=published_at&type_id=&published_at=&updated_at=&status=true
    Wait Until Element Is Visible    published_at
    Sleep    5s
    ${Last_Newlist}    Execute Javascript    return $("#result-table tbody tr:eq(0) td:eq(3)").text().trim()
    ${Last_Newlist}    Convert To String    ${Last_Newlist}
    Sleep    5s
    Go To    ${URL_ACCOUNT}/profile
    Get shop name
    Go To    ${URL_STORE}/${user_s0010}/admin/orders
    Sleep    3s
    ${wait_for_pay}    Get Text    //*[@id="page-content"]/div[2]/div/div/ul/li[2]/a/span
    ${wait_for_pay}    Convert To String    ${wait_for_pay}
    ${wait_for_pay}    Remove String    ${wait_for_pay}    (
    ${wait_for_pay}    Remove String    ${wait_for_pay}    )
    ${wait_for_ship}    Get Text    //*[@id="page-content"]/div[2]/div/div/ul/li[3]/a/span
    ${wait_for_ship}    Convert To String    ${wait_for_ship}
    ${wait_for_ship}    Remove String    ${wait_for_ship}    (
    ${wait_for_ship}    Remove String    ${wait_for_ship}    )
    ${wait_for_receive}    Get Text    //a[@href="#confirmshipping"]//span
    ${wait_for_receive}    Convert To String    ${wait_for_receive}
    ${wait_for_receive}    Remove String    ${wait_for_receive}    (
    ${wait_for_receive}    Remove String    ${wait_for_receive}    )
    ${total_order_receive}    Get Text    //a[@*="#complete"]//span
    ${total_order_receive}    Convert To String    ${total_order_receive}
    ${total_order_receive}    Remove String    ${total_order_receive}    (
    ${total_order_receive}    Remove String    ${total_order_receive}    )
    Go To    ${URL_STORE}/${user_s0010}/admin/orders?status=abnormal
    Sleep    5s
    ${total_order_refund}    Get Text    //a[@*="#abnormal"]//span
    ${total_order_refund}    Convert To String    ${total_order_refund}
    ${total_order_refund}    Remove String    ${total_order_refund}    (
    ${total_order_refund}    Remove String    ${total_order_refund}    )
    Go To    ${URL_STORE}/${user_s0010}/admin/product
    Sleep    3s
    Wait Until Element Is Visible    //span[@class="all"]    10
    ${total_all_listing}    Execute Javascript    return $('.all').text()
    ${total_all_listing}    Convert To String    ${total_all_listing}
    ${total_all_out}    Execute Javascript    return $('.emptystock').text()
    ${total_all_out}    Convert To String    ${total_all_out}
    ${total_all_approved}    Execute Javascript    return $('.approved').text()
    ${total_all_approved}    Convert To String    ${total_all_approved}
    ${total_wait_approve}    Execute Javascript    return $('.pending').text()
    ${total_wait_approve}    Convert To String    ${total_wait_approve}
    ${total_reject}    Execute Javascript    return $('.reject').text()
    ${total_reject}    Convert To String    ${total_reject}
    Go To    ${URL_STORE}/${user_s0010}/admin/dashboard/summary
    Sleep    5s
    ${alert_info}    Execute javascript    return $('.alert-info').text().trim()
    ${alert_info}    Convert To String    ${alert_info}
    ${alert_info}    Remove String    ${alert_info}    อ่านเพิ่มเติม
    ${db_wait_for_pay}    Get Text    //*[@id="page-content"]/div/div[2]/div/div/div[2]/div/div/div[1]/div/div[2]/div[2]
    ${db_wait_for_pay}    Convert To String    ${db_wait_for_pay}
    ${db_wait_for_pay}    Remove String    ${db_wait_for_pay}    ,
    ${db_wait_for_ship}    Get Text    //*[@id="page-content"]/div/div[2]/div/div/div[2]/div/div/div[2]/div/div[2]/div[2]
    ${db_wait_for_ship}    Convert To String    ${db_wait_for_ship}
    ${db_wait_for_ship}    Remove String    ${db_wait_for_ship}    ,
    ${db_wait_for_receive}    Get Text    //div[@increment-animation="res.waiting_for_receive"]
    ${db_wait_for_receive}   Convert To String    ${db_wait_for_receive}
    ${db_wait_for_receive}    Remove String    ${db_wait_for_receive}    ,
    ${db_total_order_receive}    Get Text    //div[@increment-animation="res.complete"]
    ${db_total_order_receive}    Convert To String    ${db_total_order_receive}
    ${db_total_order_receive}   Remove String    ${db_total_order_receive}    ,
    ${db_total_order_refund}    Get Text    //div[@increment-animation="res.refund"]
    ${db_total_order_refund}    Convert To String    ${db_total_order_refund}
    ${db_total_order_refund}    Remove String    ${db_total_order_refund}    ,
    ${product_all_listing}    Get Text    //div[@ng-bind="res.all"]
    ${product_all_listing}    Convert To String    ${product_all_listing}
    ${product_all_out}    Get Text    //div[@ng-bind="res.emptystock"]
    ${product_all_out}    Convert To String    ${product_all_out}
    ${product_all_approved}    Get Text    //div[@ng-bind="res.approved"]
    ${product_all_approved}     Convert To String    ${product_all_approved}
    ${product_wait_approve}    Get Text    //div[@ng-bind="res.pending"]
    ${product_wait_approve}    Convert To String    ${product_wait_approve}
    ${product_reject}    Get Text    //div[@ng-bind="res.reject"]
    ${product_reject}    Convert To String    ${product_reject}
    Should Contain    ${alert_info}    ${Last_Newlist}
    Should Be Equal    ${db_wait_for_pay}    ${wait_for_pay}
    Should Be Equal    ${db_wait_for_ship}    ${wait_for_ship}
    Should Be Equal    ${db_wait_for_receive}    ${wait_for_receive}
    Should Be Equal    ${db_total_order_receive}    ${total_order_receive}
    Should Contain    ${db_total_order_refund}    ${total_order_refund}
    Should Be Equal    ${total_all_listing}    ${product_all_listing}
    Should Be Equal    ${total_all_out}     ${product_all_out}
    Should Be Equal    ${total_all_approved}    ${product_all_approved}
    Should Be Equal    ${total_wait_approve}    ${product_wait_approve}
    Should Be Equal    ${total_reject}   ${product_reject}

*** Keyword ***
Open and Prepare Data
    Set Suite Variable    ${URL_Backup}    ${URL_PORTAL}
    # Set Suite Variable    ${URL_PORTAL}    ${URL_ACCOUNT}
    Open Custom Browser    ${URL_PORTAL}    ${BROWSER}
    Open/Close Shop    open    ${user_s0010}    ${seller_user_0010}    ${seller_pwd_0010}
    Open/Close Shop    open    ${user_s003}    ${seller_user_003}    ${seller_pwd_003}

Clear All Test
    Open/Close Shop    close    ${user_s0010}    ${seller_user_0010}    ${seller_pwd_0010}
    Open/Close Shop    close    ${user_s003}    ${seller_user_003}    ${seller_pwd_003}
    Close All Browsers

Open/Close Shop
    [Arguments]    ${action}    ${shop_n}    ${shop_user}    ${shop_pass}
    # Clear Active Login
    # Go to Login    ${seller_user_003}    ${seller_pwd_003}
    Check and Reset Seller Login    ${shop_n}    ${shop_user}    ${shop_pass}
    Go To    ${URL_STORE}/${shop_n}/admin
    Sleep    3s
    ${check} =    Get Value    //input[@id="openshop_status_old"]
    # Pass Execution If    '${action}' == 'open' and '${check}' == 'true'    Message : Shop already Open !!
    # Pass Execution If    '${action}' == 'close' and '${check}' == 'false'    Message : Shop already Closed !!
    Run Keyword If    "${check}" == "false" and '${action}' == 'open'    Execute Javascript    $('#btn_openshop_sidebar').click();
    Run Keyword If    "${check}" == "true" and '${action}' == 'close'    Execute Javascript    $('#btn_openshop_sidebar').click();
    Sleep    1s
    Execute Javascript    $('.modal-footer .btn-primary').click();
    Sleep    3s
    # ${check} =    Get Value    //input[@id="openshop_status_old"]
    # Run Keyword If    '${action}' == 'close'    Element Should Contain    //span[@id='notify-msg']    ปิดร้านค้าเรียบร้อยแล้ว
    # Run Keyword If    '${action}' == 'close'    Should Be True    '${check}' == 'false'
    # Run Keyword If    '${action}' == 'open'    Element Should Contain    //span[@id='notify-msg']    เปิดร้านค้าเรียบร้อยแล้ว
    # Run Keyword If    '${action}' == 'open'    Should Be True    '${check}' == 'true'
    # Clear Active Login

Go to WMS
    Go to    ${URL_WMS}
    ${title}    Get Title
    Run Keyword If    '${title}' == 'Authentication'    Input Text    //input[@name="email"]    joyjorjar@hotmail.com
    Run Keyword If    '${title}' == 'Authentication'    Input Password    //input[@name="password"]    1234
    Run Keyword If    '${title}' == 'Authentication'    Click Button    //button[@class="width-35 pull-right btn btn-sm btn-primary"]
    Run Keyword If    '${title}' == 'Authentication'    Location Should Be    ${URL_WMS}/dashboard

Select promotion by category
    Go To    ${URL_STORE}/${shop_name}/admin/promotion/${promotion_id}/products
    Click Element    //div[@class="promotion-tab-box promotion-bycat-box"]//input
    Sleep    1
    ${count_cate}    Execute Javascript    return $('.promocat-list li').length;
    ${count_product}    Set Variable    0
    : FOR    ${Index}    IN RANGE    1    ${count_cate}+1
    \    ${txt_category}    Get Text    //li[${Index}][@ng-repeat="category in categories"]//span
    \    ${txt_category}    Get Substring    ${txt_category}    -4
    \    ${txt_category}    Remove String    ${txt_category}    )    ${Space}    (
    \    ${txt_category}    Convert To Integer    ${txt_category}
    \    ${count_product}    Set Variable If    ${count_product} < ${txt_category}    ${txt_category}    ${count_product}
    Set Test Variable    ${count_product}
    Select Checkbox    //li[@ng-repeat="category in categories"][div[contains(.,'(${count_product})')]]//input
    Comment    Run Keyword If    ${Check} == True    Click Element    //li[@ng-repeat="category in categories"][div[2][contains(.,'(${count_product})')]]//span
    ${category_name}    Get Text    //li[@ng-repeat="category in categories"]//div[contains(.,'(${count_product})')]
    @{category_name}    Split String    ${category_name}    (
    ${category_name}    Set Variable    @{category_name}[0]
    ${category_name}    Execute Javascript    return $.trim("${category_name}");
    Set Test Variable    ${category_name}
    Click Element    //div[@class="form-actions-footer"]//button[@class="btn btn-small btn-primary "]
    Wait Until Element Is Visible    alertbefore-submit
    Click Element    //button[@ng-click="submitConfirm()"]
    Wait Until Page Contains Element    table_report    10s
