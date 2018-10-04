*** Setting ***
Suite Setup       Open and Prepare Data    # Suite Setup    Account Login    ${seller_user_001}    # Open and Prepare Data | # Suite Setup | Account Login | ${seller_user_001} | ${seller_pwd_001}
Suite Teardown    Clear All Test    # Suite Teardown    Close All Browsers
Force Tags        Seller    Sanity
Library           OperatingSystem
Library           SeleniumLibrary
Library           String
Resource          ../../../../Resource/WeLoveShopping/init.robot
Resource          ../../../../Resource/WeLoveShopping/WebElement/Member_SignIn.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/Category.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/Widget.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/ManageProfile.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/Portal.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/Product.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/Backend_Shipping.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/Gallery.txt
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Backend_Category.txt
Resource          ../../../../Keyword/Common/Gallery.txt
Resource          ../../../../Keyword/Common/Shipping.txt
Resource          ../../../../Keyword/Common/Backend_Promotion.txt
Resource          ../../../../Keyword/Common/Product.txt
Resource          ../../../../Keyword/Common/Shipping.txt

*** Test Cases ***
TC_MC_01184
    [Documentation]    Add Category Success - Category image with Choose image Gallery.
    [Tags]    Sanity-Test-01
    #    [Tags]    Sanity-Test-01
    #    Switch Status Shop to Open    ${seller_user_001}    ${seller_pwd_001}
    #    Account Login    ${seller_user_001}    ${seller_pwd_001}
    # Go to Login    ${seller_user_001}    ${seller_pwd_001}
    # Go To    ${url_category_add}
    Go to    ${URL_STORE}/${user_s001}/admin/category/create
    # Wait Until Element Is Visible    ${input_category_name}    ${EXPECT_LOADTIME}
    Genarate Category Name    AddByRobot
    Execute Javascript    $('#title_th').val('${category_name}')
    Input Text    ${input_category_name}    ${category_name}
    Execute Javascript    $('#btn_select_photo').click()
    Choose Image From Gallery Correct2
    Sleep    2s
    Click Button Save And Display Alert    บันทึกข้อมูลหมวดหมู่สำเร็จ
    Verify Category Has Successfully Created    ${category_name}

TC_MC_01212
    [Documentation]    Delete Category Success
    [Tags]    Sanity-Test-01
    #    Account Login    ${seller_user_001}    ${seller_pwd_001}
    Go To    ${URL_STORE}/${user_s001}/admin/category
    Search By Keyword Found Result    ${category_name}
    Wait Until Page Contains Element    //li[1]//div[2][contains(.,'${category_name}')]//a
    Execute Javascript    ${check_all}.click()
    Execute Javascript    $('#btn_delete_cat').click()
    Execute Javascript    $(':contains("ยืนยัน")').click()
    Sleep    5s

TC_MC_01220
    [Documentation]    Edit Category Success - Change image by upload file.
    [Tags]    Sanity-Test-01
    #    Account Login    ${seller_user_001}    ${seller_pwd_001}
    Go To    ${URL_STORE}/${user_s001}/admin/category
    Click Element    //li[1]//div[2]//a    #Edit First Category
    Wait Until Element Is Visible    title_th
    Genarate Category Name    EditByRobot
    Execute Javascript    $('#title_th').val('${category_name}')
    Upload Image To Gallery    ${image_logo}    ${upl_input_banner}
    Click Button Save And Display Alert    บันทึกข้อมูลหมวดหมู่สำเร็จ
    Go To    ${URL_STORE}/${user_s001}/admin/category
    Click Element    //li[1]//div[2]//a    #Edit First Category
    Wait Until Element Is Visible    title_th
    ${current_cat_name}    Execute Javascript    return $('#title_th').val()
    Should Be Equal    ${current_cat_name}    ${category_name}

TC_MC_01256
    [Documentation]    [Welove] Verify Hide/Show button. Incase change Main category status
    [Tags]    Sanity-Test-01
    Hide Category Have Product    เสื้อผ้าสำหรับคนอ้วน
    ${Count1}    Execute Javascript    return $('.col-table-3').eq(1).text().trim()
    Go To    ${URL_STORE}/${user_s001}/admin/product
    Execute Javascript    $(".row-filter select option").filter(function(){ return this.text == 'เสื้อผ้าสำหรับคนอ้วน'; }).attr('selected', true).change();
    ${Count2}    Get Matching Xpath Count    //*[@id="table_report"]/tbody/tr/td[3]/div[3]/span
    Should Be Equal    ${Count1}    ${Count2}
    Sleep    3s
    Go To    ${URL_STORE}/${user_s001}/admin/category
    Input Text    search    เสื้อผ้าสำหรับคนอ้วน
    Execute Javascript    $('#frm_search .btn-primary').click()
    Sleep    3s
    Show Category Have Product    เสื้อผ้าสำหรับคนอ้วน

TC_MC_01258
    [Documentation]    Show category have product
    [Tags]    Sanity-Test-01
    #    Account Login    ${seller_user_001}    ${seller_pwd_001}
    Go To    ${URL_STORE}/${user_s001}/admin/category
    Search By Keyword Found Result    เสื้อผ้าสำหรับคนอ้วน
    Change Status Category To Show
    Sleep    2s
    ${GetURL}    Get Element Attribute    //a[contains(.,'เสื้อผ้าสำหรับคนอ้วน')]@href
    Go To    ${GetURL}
    Wait Until Element Is Visible    frm_edit_cat    10s
    ${Status}    Check Category Status
    Capture Page Screenshot
    Should Be Equal    '${Status}'    'true'
    Go To    ${URL_STORE}/${user_s001}/admin/product
    Execute Javascript    $(".pull-left select option").filter(function(){ return this.text == 'เสื้อผ้าสำหรับคนอ้วน'; }).attr('selected', true).change();
    Sleep    3s
    Element Should Not Be Visible    //i[@class="icon-eye-hide-grey tooltip-grey"]
    #${Status}    Check Product Status
    #Capture Page Screenshot
    #Should Be Equal    '${Status}'    'Show'

TC_MC_01939
    [Documentation]    Verify stock product. Incase user update stock
    [Tags]    Sanity-Test-01
    #    Account Login    ${seller_user_001}    ${seller_pwd_001}
    Go To    ${URL_STORE}/${user_s001}/admin/product/edit/${edit_product1_id}
    Wait Until Element Is Visible    ${input_product_name}
    Input price and stock into product attribute
    Execute Javascript    $('.btn-save').eq(0).click()
    Sleep    3s
    Display Alert Footer
    Sleep    3s
    Wait Until Element Is Visible    //*[@id="cross-sub-attr"]/tbody/tr[1]/td[7]/span/input
    Textfield Value Should Be    //*[@id="cross-sub-attr"]/tbody/tr[1]/td[7]/span/input    100
    Textfield Value Should Be    //*[@id="cross-sub-attr"]/tbody/tr[2]/td[7]/span/input    100
    Textfield Value Should Be    //*[@id="cross-sub-attr"]/tbody/tr[3]/td[7]/span/input    100
    Sleep    2s
    Go To    ${URL_STORE}/${user_s001}/admin/product/edit/${edit_product2_id}
    Wait Until Element Is Visible    ${input_product_name}
    Clear Element Text    ${unit_preorder}
    Input Text    ${unit_preorder}    100
    Execute Javascript    $('.btn-save').eq(0).click()
    Display Alert Footer
    Wait Until Element Is Visible    ${unit_preorder}    ${EXPECT_LOADTIME}
    Textfield Value Should Be    ${unit_preorder}    100

TC_MC_02084
    [Documentation]    Verify Selling price and Normal price. Incase quick edit.
    [Tags]    Sanity-Test-01
    Go To    ${URL_STORE}/${user_s001}/admin/product
    Wait Until Element Is Visible    table_report    ${EXPECT_LOADTIME}
    Input Text    ${input_keyword}    L${edit_product2_id}
    Log    L${edit_product2_id}
    Click Button    //*[@id="table_report_filter"]/button
    Wait Until Element Is Visible    table_report    ${EXPECT_LOADTIME}
    ${before_selling_price}    Get Text    ${top_record_selling_price}
    ${before_normal_price}    Get Text    ${top_record_normal_price}
    ${before_amount}    Get Text    ${top_record_amount}
    Execute Javascript    $('.icon-q-editpd').eq(0).click()
    Sleep    1s
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
    Wait Until Element Is Not Visible    //*[@class="btn btn-small btn-primary quick-save btn-save"]    ${EXPECT_LOADTIME}
    Sleep    3s
    Wait Until Element Is Visible    table_report    ${EXPECT_LOADTIME}
    Input Text    ${input_keyword}    L${edit_product2_id}
    Click Button    //*[@id="table_report_filter"]/button
    Sleep    3s
    Wait Until Element Is Visible    table_report    ${EXPECT_LOADTIME}
    ${after_selling_price}    Get Text    ${top_record_selling_price}
    ${after_normal_price}    Get Text    ${top_record_normal_price}
    ${after_amount}    Get Text    ${top_record_amount}
    Should Be Equal    ${after_selling_price}    ${str1}
    Should Be Equal    ${after_normal_price}    ${str2}
    Should Be Equal    ${after_amount}    ${str3}

TC_MC_02075
    [Documentation]    Verify Hide/Show Product.
    [Tags]    Sanity-Test-01
    #    Account Login    ${seller_user_001}    ${seller_pwd_001}
    Go To    ${URL_STORE}/${user_s001}/admin/product
    ${soldout_product}    Get Text    //span[@class='emptystock']
    ${soldout_product}    Convert To Integer    ${soldout_product}
    Wait Until Element Is Visible    ${top_record_pid}    ${EXPECT_LOADTIME}
    Input Text    ${input_keyword}    L${edit_product1_id}
    Click Button    //*[@id="table_report_filter"]/button
    Wait Until Element Is Visible    ${top_record_pid}    ${EXPECT_LOADTIME}
    Click Element    ${top_record_p_name}
    Sleep    3s
    Wait Until Element Is Visible    ${input_product_name}
    Execute Javascript    $('input[type="checkbox"]').eq(5).click()
    Execute Javascript    $('#btn_hide_inv').click()
    Execute Javascript    $('.btn-save').eq(0).click()
    Element Should Be Visible    //i[@class="icon-eye-hide tooltip-grey"]
    Sleep    3s
    Display Alert Footer
    Sleep    3s
    Go To    ${URL_STORE}/${user_s001}/admin/product
    Wait Until Element Is Visible    ${top_record_pid}    ${EXPECT_LOADTIME}
    Input Text    ${input_keyword}    L${edit_product1_id}
    Click Button    //*[@id="table_report_filter"]/button
    Wait Until Element Is Visible    ${top_record_pid}    ${EXPECT_LOADTIME}
    Element Should Be Visible    ${top_record_p_hide}    ${icon_status_somehide}
    Sleep    3s
    Go To    ${URL_STORE}/${user_s001}/admin/product?total=approved&page=1&ss=1
    Execute Javascript    $('input[type="checkbox"]').eq(2).click()
    Execute Javascript    $('input[type="checkbox"]').eq(3).click()
    Execute Javascript    $('input[type="checkbox"]').eq(4).click()
    Click Element    //*[@id="btn_hide"]
    Click OK Alert Box
    Sleep    2s
    Wait Until Element Is Visible    table_report
    Select From List By Label    inv_status    แสดงสินค้า
    Sleep    2s
    ${display_product}    Get Text    //span[@class='approved']
    ${display_product}    Convert To Integer    ${display_product}
    ${display_product}    Evaluate    ${display_product} - ${soldout_product}
    Sleep    1s
    Go To    ${URL_STORE}/${user_s001}
    Sleep    3s
    ${home1}    Execute javascript    return $('.shop-product').text().trim();
    ${home2}    Convert To String    ${home1}
    ${home3}    Remove String    ${home2}    สินค้าทั้งหมด
    Should Be Equal As Integers    ${home3}    ${display_product}
    Sleep    3s
    Go To    ${URL_STORE}/${user_s001}/admin/product
    Execute Javascript    ${check_all}.click()
    Click Element    //*[@id="btn_visible"]
    Click OK Alert Box
    Sleep    4s
    Select From List By Label    inv_status    แสดงสินค้า
    Sleep    2s
    ${display_product}    Get Text    //span[@class='approved']
    ${display_product}    Convert To Integer    ${display_product}
    ${display_product}    Evaluate    ${display_product} - ${soldout_product}
    Sleep    1s
    Go To    ${URL_STORE}/${user_s001}
    Sleep    3s
    ${home1}    Execute javascript    return $('.shop-product').text().trim();
    ${home2}    Convert To String    ${home1}
    ${home3}    Remove String    ${home2}    สินค้าทั้งหมด
    Should Be Equal As Integers    ${home3}    ${display_product}

TC_MC_03626
    [Documentation]    Verify Save Edit (Success), Period of preparation before shipping Complete and Shipping type Complete.
    [Tags]    Sanity-Test-01
    #    Account Login    ${seller_user_001}    ${seller_pwd_001}
    Get shop name
    Go To    ${URL_STORE}/${shop_name}/admin/shipping
    Input Text    ${day_instock}    2
    Input Text    ${day_preorder}    3
    Check Shipping Type Selected    ${thailand_post}
    Uncheck Shipping Type selected    ${rd_post}
    Choose Shipping Type Thailand Post    ${rd_ems}
    Click Element    ${rd_ems_amount}
    Check Row Shipping Have Two Rows    ${row_ems_amount}    ${ems_minus_amount}
    Execute Javascript    ${ems_range_amount_tr1}.val('to').change()
    Input Text    ${ems_amount_to_tr1}    2
    Execute Javascript    $('input[name="thai_land_post_ems[amount][price][0]"]').val(1).blur()
    #Input Text    ${ems_rate_amount_tr1}    30
    #Press Key    ${ems_rate_amount_tr1}    \\9
    Wait Until Element Is Visible    ${ems_amount_from_tr2}
    ${value}    Get Text    ${ems_amount_from_tr2}
    Should Be True    ${value} == 3
    Execute Javascript    ${ems_range_amount_tr2}.val('andup').change()
    Input Text    ${ems_rate_amount_tr2}    2
    Check Shipping Type Selected    ${kerry_express}
    Click Element    ${rd_kerry_weight}
    Check Row Shipping Have Two Rows    ${row_kerry_weight}    ${kerry_minus_weight}
    Execute Javascript    ${kerry_range_weight_tr1}.val('to').change()
    Input Text    ${kerry_weight_to_tr1}    0.5
    Execute Javascript    $('input[name="kerry_express_kerry[weight][price][0]"]').val(2).blur()
    #Input Text    ${kerry_rate_amount_tr1}    30222222
    #Press Key    ${kerry_rate_amount_tr1}    \\9
    Wait Until Element Is Visible    ${kerry_weight_from_tr2}    ${EXPECT_LOADTIME}
    ${value}    Get Text    ${kerry_weight_from_tr2}
    Should Be True    ${value} == 0.51
    Execute Javascript    ${kerry_range_weight_tr2}.val('andup').change()
    Input Text    ${kerry_rate_weight_tr2}    3
    Uncheck Shipping Type selected    ${custom_data}
    Click Button Save
    Sleep    2s
    Display Alert Footer
    Sleep    4s
    Go To    ${URL_STORE}/${user_s001}/shipping
    #    ${Count1}    Execute Javascript    return $('.ship-desc-box').length
    ${Count1}    Execute Javascript    return $('.kerry-box tr').length;
    ${Count1}    Evaluate    ${Count1} - 1
    Should Be True    ${Count1} == 2
    Element Should Be Visible    //*[@class="logo-thailandpost"]
    Element Should Be Visible    //*[@class="logo-kerry"]

TC_MC_01684
    [Documentation]    Add / Edit promotion and highlight by price
    [Tags]    Sanity-Test-01
    # Set Selenium Speed    0.2
    Get shop name
    Go To    ${URL_STORE}/${shop_name}/admin/promotion
    ${Check_Promotion}    Get Matching Xpath Count    //table//tbody//tr
    Run Keyword If    ${Check_Promotion} == 0    Add promotion    price
    Run Keyword If    ${Check_Promotion} > 0    Edit promotion    price
    Check Hide/Show promotion
    Get promotion id
    Go To    ${URL_STORE}/${shop_name}/admin/promotion/${promotion_id}/products
    Select promotion by All
    Go To    ${URL_STORE}/${shop_name}/admin/promotion/${promotion_id}/products
    Click Element    //div[@class="promotion-tab-box promotion-bycat-box"]//input
    Sleep    5s
    Execute Javascript    $("label:contains('ดินสอเขียนคิ้ว') > input").eq(0).click()
    Execute Javascript    $('[class="btn btn-primary btn-save"]').eq(0).click()
    # click cancel on modal
    Execute Javascript    $('#alertbefore-submit [type="reset"]').click()
    # wait for modal leaving
    Sleep    2s
    Execute Javascript    $('[class="btn btn-primary btn-save"]').eq(0).click()
    # click save on modal
    Execute Javascript    $('button:contains(ยืนยัน)')[0].click()
    Verify promotion category after submit
    Select all product into hightlight promotion
    Verify product highlight after submit
    # Close Shop
    #    [Documentation]    Close shop
    #    [Tags]    Sanity-Test-01
    #    Switch Status Shop to Closed    ${seller_user_001}    ${seller_pwd_001}

*** Keyword ***
Open and Prepare Data
    # Set Suite Variable    ${URL_PORTAL}    ${URL_ACCOUNT}
    Open Custom Browser    ${URL_PORTAL}    ${BROWSER}
    Check and Reset Seller Login    ${user_s001}    ${seller_user_001}    ${seller_pwd_001}
    # ${result}=    Check Element    //a[@title='บัญชีของฉัน']
    # Run Keyword If    '${result}'=='FAIL'    Go to Login    ${seller_user_001}    ${seller_pwd_001}
    Open/Close Shop    open
    # ${result}=    Check Element    //a[@title='บัญชีของฉัน']
    # Run Keyword If    '${result}'=='FAIL'    Go to Login    ${seller_user_001}    ${seller_pwd_001}

Clear All Test
    Open/Close Shop    close
    Close All Browsers

Open/Close Shop
    [Arguments]    ${action}
    # Clear Active Login
    # Go to Login    ${seller_user_001}    ${seller_pwd_001}
    Check and Reset Seller Login    ${user_s001}    ${seller_user_001}    ${seller_pwd_001}
    Go To    ${URL_STORE}/${user_s001}/admin
    Get shop name
    Set Suite Variable    ${shop_name}    ${shop_name}
    Comment    Sleep    3s
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
    Input Text    //input[@name="email"]    joyjorjar@hotmail.com
    Input Password    //input[@name="password"]    1234
    Click Button    //button[@class="width-35 pull-right btn btn-sm btn-primary"]
    Location Should Be    ${URL_WMS}/dashboard

Verify Category Has Successfully Created
    [Arguments]    ${category_name}
    Go To    ${URL_STORE}/${shop_name}/admin/category
    #    Go To    ${url_category_list}
    Wait Until Page Contains Element    frm_category_sel
    ${title_top}    Execute Javascript    return $("#frm_category_sel li:eq(2) div:eq(2)").text().trim();
    Should Contain    ${title_top}    ${category_name}

Check Category Status
    [Documentation]    verify check top record of category status is hide
    ${status}    Execute Javascript    return $('#status_status_old').attr('value');
    Return From Keyword    ${status}

Check Product Status
    ${status}    Execute Javascript    return $('[class="hidden-phone center"] i').eq(0).attr("data-original-title");
    ${status}    Set Variable If    "${status}" == "แสดงทั้งหมด"    Show    Hide
    Return From Keyword    ${status}
