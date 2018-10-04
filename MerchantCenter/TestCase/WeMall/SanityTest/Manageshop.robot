*** Settings ***
Suite Setup       Open Custom Browser    ${URL_PORTAL}
Suite Teardown    Clear All Test Wemall Sanity
Force Tags        Seller    Sanity
Resource          ../../../Resource/WeMall/init.robot
Resource          ../../../Resource/WeMall/WebElement/Member_SignIn.txt
Resource          ../../../Keyword/Common/Manageshop.robot
Resource          ../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../Keyword/Common/Product.txt
Resource          ../../../Keyword/Common/Common.txt
Resource          ../../../Keyword/Common/Backend_Category.txt


*** Variables ***
${product_name}    TestAddproduct

*** Test Cases ***
TC_MC_11320
    [Documentation]    Verify Delete product on product list page.
    [Tags]    Sanity-Test
    Check and Reset Seller Login    ${store_prod_name}    ${user_prod_wemall}    ${pass_prod_wemall}
    Verify Search Product    ${store_prod_name}    ${product_name}
    Create Product Sanity    ${store_prod_name}
    Go To Product Admin    ${store_prod_name}
    Search product    ${product_name}
    Delete All Products
    Click OK Alert Box

TC_MC_11321
    [Documentation]    Verify delete folder. If delete album with edit button.
    [Tags]    Sanity-Test
    Check and Reset Seller Login    ${store_prod_name}    ${user_prod_wemall}    ${pass_prod_wemall}
    Go To Gallery Admin    ${store_prod_name}
    Create Gallery Album
    Delete Gallery Album
    Click OK Alert Box
    Verify Gallery Album

TC_MC_11345
    [Documentation]    Add Category Success - Category image with Choose image Gallery.
    [Tags]    Sanity-Test
    Check and Reset Seller Login    ${store_prod_name}    ${user_prod_wemall}    ${pass_prod_wemall}
    Go To Create Category Page    ${store_prod_name}
    Genarate Category Name    AddTempByRobot
    Add Category Name    ${category_name}
    Click Add Image Button
    Choose Image From Gallery Correct2
    Click Button Save And Display Alert    บันทึกข้อมูลหมวดหมู่สำเร็จ
    Backend_Category.Verify Category Has Successfully Created    ${category_name}

TC_MC_11346
    [Documentation]    Delete Category Success
    [Tags]    Sanity-Test
    Check and Reset Seller Login    ${store_prod_name}    ${user_prod_wemall}    ${pass_prod_wemall}
    Go To Category Admin    ${store_prod_name}
    Search By Keyword Found Result    AddTempByRobot
    Delete Category Success

TC_MC_11347
    [Documentation]    Edit First Category Success - Change image by upload file.
    [Tags]    Sanity-Test
    Check and Reset Seller Login    ${store_prod_name}    ${user_prod_wemall}    ${pass_prod_wemall}
    Go To Category Admin    ${store_prod_name}
    Click First Category
    Edit Category
    Go To Category Admin    ${store_prod_name}
    Click First Category
    ${current_cat_name}    Get Value    ${input_category_name}
    Should Be Equal    ${current_cat_name}    ${category_name}

TC_MC_11348
    [Documentation]    Verify Selling price and Normal price. Incase quick edit.
    [Tags]    Sanity-Test
    Check and Reset Seller Login     ${store_prod_name}    ${user_prod_wemall}    ${pass_prod_wemall}
    Go To Product Admin    ${store_prod_name}
    Search Product    ${edit_product2_id}
    Click Quick Edit Button
    Add Sale Product Price Value
    Add Normal Product Price Value
    Add Quanity Product
    Confirm Quick Edit
    Search Product    ${edit_product2_id}
    Check The Quick Update Value
    Approve Wemall Product By Product Id    ${edit_product2_id}

TC_MC_11350
    [Documentation]    Add / Edit promotion and highlight by price
    [Tags]    Sanity-Test
    [Setup]    Open Custom Browser    ${URL_PORTAL}
    Check and Reset Seller Login    ${store_prod_name}    ${user_prod_wemall}    ${pass_prod_wemall}
    Go To    ${URL_STORE}/${store_prod_name}
    Get shop name
    Go To Promotion Product    ${store_prod_name}
    Check Product To Update Promotion
    Check Hide/Show promotion
    Get promotion id
    Go To Promotion Product Admin    ${store_prod_name}    ${promotion_id}
    Select promotion by All
    Add Category Promotion Highlight Products
    Verify promotion category after submit
    Select all product into hightlight promotion
    Verify Wemall Product Highlight After Submit
