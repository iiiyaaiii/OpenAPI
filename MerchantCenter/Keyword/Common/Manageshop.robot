*** Settings ***
Library           String
Resource          ../../Resource/WeMall/WebElement/Member_SignIn.txt
Resource          ../../Resource/WeMall/WebElement/Category.txt
Resource          ../../Resource/WeMall/WebElement/Product.txt
Resource          ../../Resource/WeMall/WebElement/Manageshop.txt
Resource          ../../Resource/WeMall/WebElement/Gallery.txt
Resource          ../../Keyword/Common/Member_SignIn.txt
Resource          ../../Keyword/Common/Common.txt
Resource          ../../Keyword/Common/Backend_Promotion.txt

*** Keywords ***
Clear All Test Wemall
    Open/Close Shop    close    ${user_s001}    ${seller_user_001}    ${seller_pwd_001}
    Open/Close Shop    close    ${user_s002}    ${seller_user_002}    ${seller_pwd_002}
    Close All Browsers

Clear All Test Wemall Sanity
    Open/Close Shop    close    ${store_prod_name}    ${user_prod_wemall}    ${pass_prod_wemall}
    Close All Browsers

Open/Close Shop
    [Arguments]    ${action}    ${shop_n}    ${shop_user}    ${shop_pass}
    Check and Reset Seller Login    ${shop_n}    ${shop_user}    ${shop_pass}
    Go To    ${URL_STORE}/${shop_n}/admin
    ${check} =    Get Value    ${btn_value_shop}
    Run Keyword If    "${check}" == "false" and '${action}' == 'open'    Click Element    ${btn_open_shop}
    Run Keyword If    "${check}" == "true" and '${action}' == 'close'    Run Keywords    Click Element    ${btn_open_shop}    AND    Click Element    ${btn_confirm_shop}

Go To Product Admin
    [Arguments]    ${shopname}
    Go To    ${URL_STORE}/${shopname}/admin/product
    Wait Until Element Is Visible    ${tbl_report}

Go To Gallery Admin
    [Arguments]    ${shopname}
    Go To    ${URL_STORE}/${shopname}/admin/gallery
    Wait Until Element Is Visible    ${fre_gallery}

Go To Category Admin
    [Arguments]    ${shopname}
    Go To    ${URL_STORE}/${shopname}/admin/category
    Wait Until Element Is Visible    ${lnk_first_category}

Go To Create Category Page
    [Arguments]    ${shopname}
    Go To    ${URL_STORE}/${shopname}/admin/category/create

Go To Edit Product
    [Arguments]    ${shopname}    ${productid}
    Go To    ${URL_STORE}/${shopname}/admin/product/edit/${productid}

Go To Promotion Product
    [Arguments]    ${shopname}
    Go To    ${URL_STORE}/${shop_name}/admin/promotion

Go To Promotion Product Admin
    [Arguments]    ${shopname}    ${promotion_id}
    Go To    ${URL_STORE}/${shop_name}/admin/promotion/${promotion_id}/products

Delete All Products
    Click Element    ${ddl_check_all}
    Click Element    ${btn_delete}

Create Gallery Album
    ${count_default}    Get Matching Xpath Count    ${fre_album}
    Upload Image To Gallery    ${image_logo}    ${upl_input}
    Wait Until Element Is Visible    ${txt_title_album}
    ${count_before}    Get Matching Xpath Count    ${fre_album}
    Run Keyword If    ${count_default} == ${count_before}    Reload Page
    Set Test Variable    ${count_default}
    Set Test Variable    ${count_before}

Delete Gallery Album
    Click Element    ${btn_edit_gallery}
    ${status_1}    Get Value    ${btn_delete_album}
    Should Be True    '${status_1}' == 'delete'
    Click Element    ${ddl_checked}
    Click Element    ${btn_delete_album}
    Wait Until Element Is Visible    ${frm_popup}
    Click Element    ${btn_confirm_delete}

Verify Gallery Album
    Wait Until Element Is Not Visible    ${frm_popup}
    Run Keyword If    ${count_default} == ${count_before}    Reload Page
    Wait Until Element Is Visible    ${img_gallery}
    ${count_after}    Get Matching Xpath Count    ${fre_album}
    Should Be True    ${count_after} < ${count_before}

Add Category Name
    [Arguments]    ${category}
    Input Text    ${input_category_name}    ${category}

Click Add Image Button
    Click Element    ${btn_add_image}

Delete Category Success
    Wait Until Page Contains Element    ${tbc_category_column}
    Click Element    ${chk_check_all}
    Click Element    ${btn_delete_cat}
    Wait Until Element Is Enabled    ${btn_confirm}
    Click Element    ${btn_confirm}
    Display Alert Footer

Click First Category
    Click Element    ${lnk_first_category}
    Wait Until Element Is Visible    ${input_category_name}

Click Quick Edit Button
    Wait Until Element Is Visible    ${btn_quick_edit}
    Click Element    ${btn_quick_edit}

Edit Category
    Genarate Category Name    EditByRobot
    Input Text    ${input_category_name}    ${category_name}
    Upload Image To Gallery    logo_mi6_seller_1.jpg    ${upload_file}
    Click Button Save And Display Alert    บันทึกข้อมูลหมวดหมู่สำเร็จ

Add Sale Product Price Value
    Wait Until Element Is Visible    ${txt_sale_price}
    ${sale_price}    Get Value    ${txt_sale_price}
    ${new_sale_price}    Evaluate    ${sale_price}+1
    ${str_new_sale_price}    Convert To String    ${new_sale_price}
    Input Text    ${txt_sale_price}    ${new_sale_price}
    Set Test Variable    ${str_new_sale_price}

Add Normal Product Price Value
    Wait Until Element Is Visible    ${txt_normal_price}
    ${normal_price}    Get Value    ${txt_normal_price}
    ${new_normal_price}    Evaluate    ${normal_price}+1
    ${str_normal_price}    Convert To String    ${new_normal_price}
    Input Text    ${txt_normal_price}    ${new_normal_price}
    Set Test Variable    ${str_normal_price}

Add Quanity Product
    Wait Until Element Is Visible    ${txt_quantity}
    ${quantity}    Get Value    ${txt_quantity}
    ${new_quantity}    Evaluate    ${quantity}+1
    ${str_quantity}    Convert To String    ${new_quantity}
    Input Text    ${txt_quantity}    ${new_quantity}
    Set Test Variable    ${str_quantity}

Go To Storefront Shop
    [Arguments]    ${shopname}
    Go To    ${URL_SHOP}/${shopname}

Confirm Quick Edit
    Wait Until Element Is Visible    ${btn_confirm_quick_edit}
    Click Element    ${btn_confirm_quick_edit}
    Wait Until Element Is Not Visible    ${btn_confirm_quick_edit}    ${EXPECT_LOADTIME}

Verify Wemall Product Highlight After Submit
    [Documentation]    Verify product highlight after submit
    Go To    ${URL_STORE}/${shop_name}/admin/promotion/${promotion_id}/highlight
    Wait Until Element Is Visible    highlight-thumb
    ${check_highlight}    Get Matching Xpath Count    ${fre_highlight_product}
    Go To Storefront Shop    ${shop_name}
    Wait Until Element Is Visible    ${tbl_highlight_product}
    ${product_highlight}    Get Matching Xpath Count    ${obj_highlight_product}
    Should Be Equal    ${product_highlight}    ${check_highlight}

Check Product To Update Promotion
    ${Check_Promotion}    Get Matching Xpath Count    ${tbl_promotion_product}
    Run Keyword If    ${Check_Promotion} == 0    Add promotion    price
    Run Keyword If    ${Check_Promotion} > 0    Edit promotion    price

Add Category Promotion Highlight Products
    Go To Promotion Product Admin    ${user_s001}    ${promotion_id}
    Click Element    ${rdo_category_highlight}
    Click Element    ${lnk_pampers_category}
    Click Element    ${btn_edit_save_sellerpromotion}
    Click Element    ${btn_cancel}
    Click Element    ${btn_edit_save_sellerpromotion}
    Click Element    ${btn_confirm_promotion}

Check The Quick Update Value
    Wait Until Element Is Visible    table_report    ${EXPECT_LOADTIME}
    ${after_selling_price}    Get Text    ${top_record_selling_price}
    ${after_normal_price}    Get Text    ${top_record_normal_price}
    ${after_amount}    Get Text    ${top_record_amount}
    Should Be Equal    ${after_selling_price}    ${str_new_sale_price}    #${str_sale_price}
    Should Be Equal    ${after_normal_price}        ${str_normal_price}    #${str_normal_price}
    Should Be Equal    ${after_amount}    ${str_quantity}    #${str_quantity}


