*** Settings ***
Suite Setup     WMS Switch Project    wm
Suite Teardown    Close All Browsers
Test Setup        Set Selenium Speed    0.2s
Library           SeleniumLibrary    15    5    run_on_failure=Capture Page Screenshot
Library           String
Library           DateTime
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Resource/WeMall/WebElement/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Account_History.txt
Resource          ../../../../Keyword/Common/WMS_Promocode.txt
Resource          ../../../../Resource/WeMall/WebElement/WMWMSPromoCode.txt
Test Timeout      3 minutes

*** Test Case ***
TC_MC_07135
    [Documentation]    WMWMSPromocode : Search product by product id
    [Tags]    WMS-Web    Regression    RECON2017MC19    Medium
    Go to promotion code on wms page
    Check Element Visible    ${btn_add_promotioncode}    ${expect_load_time}
    Click add promotioncode button
    Select promotioncode condition    product
    Click add/edit product button
    Check Element Visible    ${add_product_modal}    ${expect_load_time}
    Search product by productid    L90567523
    Click search product button
    Check Element Visible    ${product_list_table}    ${expect_load_time}
    Check Text    ${txt_result_id_column}    L90567523

TC_MC_07137
    [Documentation]    WMWMSPromocode : Search product by product name in case data not found
    [Tags]    WMS-Web    Regression    RECON2017MC19    Low
    Go to promotion code on wms page
    Check Element Visible    ${btn_add_promotioncode}    ${expect_load_time}
    Click add promotioncode button
    Select promotioncode condition    product
    Click add/edit product button
    Check Element Visible    ${add_product_modal}    ${expect_load_time}
    Search product by productid    aaaaaaaaaaaaa
    Click search product button
    Check Element Visible    ${txt_data_not_found}    ${expect_load_time}
    Check Text    ${txt_data_not_found}    ไม่พบสินค้า

TC_MC_07142
    [Documentation]    WMWMSPromocode : Delete product in product list
    [Tags]    WMS-Web    RECON2017MC19    Medium
    Go to promotion code on wms page
    Check Element Visible    ${btn_add_promotioncode}    ${expect_load_time}
    Click add promotioncode button
    Select promotioncode condition    product
    Click add/edit product button
    Check Element Visible    ${add_product_modal}    ${expect_load_time}
    Search product by productid    L90567523
    Click search product button
    Check Element Visible    ${product_list_table}    ${expect_load_time}
    Click checkbox select all for choose product
    Click add product button
    Check Element Visible    ${product_list_table_after_selected}    ${expect_load_time}
    Click remove link on product list
    Click confirm action
    Check Element Is Not Visible    ${product_list_table_after_selected}

TC_MC_07143
    [Documentation]    WMWMSPromocode : Add promocode by product in case success (Promotion Code WLS)
    [Tags]    WMS-Web    Regression    RECON2017MC19    High
    Go to promotion code on wms page
    Check Element Visible    ${btn_add_promotioncode}    ${expect_load_time}
    Click add promotioncode button
    Input promotioncode name    RobotTest
    ${secs}    Get secs for create promotion code
    Input promotioncode    T${secs}
    Select period time for promotioncode
    Select discount type for promotion code on product detail page    percent
    Input discount    10
    Input discount max    1000
    Input minimum price    300
    Select promotioncode condition    product
    Click add/edit product button
    Check Element Visible    ${add_product_modal}    ${expect_load_time}
    Search product by productid    L90567523
    Click search product button
    Check Element Visible    ${product_list_table}    ${expect_load_time}
    Click checkbox select all for choose product
    Click add product button
    Click save promotioncode button
    Check Element Visible    ${alert_message}    ${expect_load_time}
    Check Text    ${alert_message}    เพิ่มข้อมูลสำเร็จ
    Check result on promotioncode list page after add promotioncode success    T${secs}

TC_MC_07145
    [Documentation]    WMWMSPromocode : Add product again to promocode by product
    [Tags]    WMS-Web    Regression    RECON2017MC19    Medium
    Go to promotion code on wms page
    Check Element Visible    ${btn_add_promotioncode}    ${expect_load_time}
    Click add promotioncode button
    Select promotioncode condition    product
    Click add/edit product button
    Check Element Visible    ${add_product_modal}    ${expect_load_time}
    Search product by productid    L90567523
    Click search product button
    Check Element Visible    ${chk_product}    ${expect_load_time}
    Click check box for choose product
    Click add product button
    Check Element Visible    ${product_list_table_after_selected}    ${expect_load_time}
    Click add/edit product button
    Check Element Visible    ${add_product_modal}    ${expect_load_time}
    Search product by productid    L90567522
    Click search product button
    Check Element Visible    ${product_list_table}    ${expect_load_time}
    Click checkbox select all for choose product
    Click add product button
    Check Element Visible    ${product_list_table_after_selected}    ${expect_load_time}
    ${row}    Count row product list after select product
    Should Be True    ${row} == 2

TC_MC_07146
    [Documentation]    WMWMSPromocode : Add promocode by product in case not select product
    [Tags]    WMS-Web    Regression    RECON2017MC19    Medium
    Go to promotion code on wms page
    Check Element Visible    ${btn_add_promotioncode}    ${expect_load_time}
    Click add promotioncode button
    Input promotioncode name    RobotTest
    ${secs}    Get secs for create promotion code
    Input promotioncode    T${secs}
    Select period time for promotioncode
    Select discount type for promotion code on product detail page    percent
    Input discount    10
    Input discount max    1000
    Input minimum price    300
    Select promotioncode condition    product
    Click add/edit product button
    Check Element Visible    ${add_product_modal}    ${expect_load_time}
    Search product by productid    L90567523
    Click search product button
    Check Element Visible    ${chk_product}    ${expect_load_time}
    Click add product button
    Click save promotioncode button
    Check Element Visible    ${alert_message}    ${expect_load_time}
    Check Text    ${alert_message}    กรุณากำหนดสินค้าที่สามารถเข้าร่วมรายการ