*** Setting ***
Test Teardown     Close Browser
Force Tags        Store-Web
Library           SeleniumLibrary
Library           String
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Product.txt

*** Variables ***
${product_name2}    Test Product

*** Keywords ***
Check product status on dashboard
    [Documentation]    Check product status on dashboard
    [Arguments]    ${shop_name}    ${wait_type}
    Go To    ${URL_STORE}/${shop_name}/admin/dashboard/summary
    ${Dashboard}    Get Text    //div[@ng-bind="res.${wait_type}"]
    ${Dashboard}    Convert To String    ${Dashboard}
    ${Dashboard}    Remove String    ${Dashboard}    ,
    Set Test Variable    ${Dashboard}

Check product
    [Documentation]    Check product
    [Arguments]    ${shop_name}    ${wait_type}
    Go To    ${URL_STORE}/${shop_name}/admin/product
    ${Product}    Execute Javascript    return $('.${wait_type}').text()
    ${Product}    Convert To String    ${Product}
    ${Product}    Remove String    ${Product}    ,
    Set Test Variable    ${Product}

*** Test Cases ***
TC_MC_09371
    [Documentation]    Verify display Total All Listing.
    Account Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Go To    ${URL_STORE}/${storename_slug_wemall}/admin
    Get shop name
    Check product    ${storename_slug_wemall}    all
    Check product status on dashboard    ${storename_slug_wemall}    all
    Should Be Equal    ${Product}    ${Dashboard}

TC_MC_09372
    [Documentation]    Verify display Total All Listing. Incase no have Listing.
    Account Login    ${wmshoptestmd_user_001}    ${wmshoptestmd_pwd_001}
    Go To    ${URL_STORE}/${wmshoptestmd_url_001}/admin
    Get shop name
    Check product    ${wmshoptestmd_url_001}    all
    Check product status on Dashboard    ${wmshoptestmd_url_001}    all
    Should Be Equal    ${Product}    ${Dashboard}

TC_MC_09374
    [Documentation]    Verify display Total Listing is Out of stock.
    [Tags]    Regression    Medium
    Account Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Go To    ${URL_STORE}/${storename_slug_wemall}/admin
    Get shop name
    Check product    ${storename_slug_wemall}    emptystock
    Check product status on dashboard    ${storename_slug_wemall}    emptystock
    Should Be Equal    ${Product}    ${Dashboard}

TC_MC_09375
    [Documentation]    Verify display Total Listing is Out of stock. Incase no have Listing.
    Account Login    ${wmshoptestmd_user_001}    ${wmshoptestmd_pwd_001}
    Go To    ${URL_STORE}/${wmshoptestmd_url_001}/admin
    Get shop name
    Check product    ${wmshoptestmd_url_001}    emptystock
    Check product status on dashboard    ${wmshoptestmd_url_001}    emptystock
    Should Be Equal    ${Product}    ${Dashboard}

TC_MC_09377
    [Documentation]    Verify display Total Listing is approved.
    [Tags]    Regression    Medium
    Account Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Go To    ${URL_STORE}/${storename_slug_wemall}/admin
    Get shop name
    Check product    ${storename_slug_wemall}    approved
    Check product status on dashboard    ${storename_slug_wemall}    approved
    Should Be Equal    ${Product}    ${Dashboard}

TC_MC_09378
    [Documentation]    Verify display Total Listing is approved. Incase no have Listing.
    Account Login    ${wmshoptestmd_user_001}    ${wmshoptestmd_pwd_001}
    Go To    ${URL_STORE}/${wmshoptestmd_url_001}/admin
    Get shop name
    Check product    ${wmshoptestmd_url_001}    approved
    Check product status on dashboard    ${wmshoptestmd_url_001}    approved
    Should Be Equal    ${Product}    ${Dashboard}

TC_MC_09380
    [Documentation]    Verify display Total Listing is Waiting for approve.
    [Tags]    Regression    Low
    Account Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Go To    ${URL_STORE}/${storename_slug_wemall}/admin
    Get shop name
    Check product    ${storename_slug_wemall}    pending
    Check product status on dashboard    ${storename_slug_wemall}    pending
    Should Be Equal    ${Product}    ${Dashboard}

TC_MC_09381
    [Documentation]    Verify display Total Listing is Waiting for approve. Incase no have Listing.
    Account Login    ${wmshoptestmd_user_001}    ${wmshoptestmd_pwd_001}
    Go To    ${URL_STORE}/${wmshoptestmd_url_001}/admin
    Get shop name
    Check product    ${wmshoptestmd_url_001}    pending
    Check product status on dashboard    ${wmshoptestmd_url_001}    pending
    Should Be Equal    ${Product}    ${Dashboard}

TC_MC_09383
    [Documentation]    Verify display Total Listing is Reject.
    [Tags]    Regression    Low
    Account Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Go To    ${URL_STORE}/${storename_slug_wemall}/admin
    Get shop name
    Check product    ${storename_slug_wemall}    reject
    Check product status on dashboard    ${storename_slug_wemall}    reject
    Should Be Equal    ${Product}    ${Dashboard}

TC_MC_09384
    [Documentation]    Verify display Total Listing is Reject. Incase no have Listing.
    Account Login    ${wmshoptestmd_user_001}    ${wmshoptestmd_pwd_001}
    Go To    ${URL_STORE}/${wmshoptestmd_url_001}/admin
    Get shop name
    Check product    ${storename_slug_wemall}    reject
    Check product status on dashboard    ${storename_slug_wemall}    reject
    Should Be Equal    ${Product}    ${Dashboard}

TC_MC_11081
    [Documentation]    Verify Store product list page after creating the new product and Verify default product's status on Wemall Store Web after creating the product
    [Tags]    Regression    Medium
    Account Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Check product    ${storename_slug_wemall}    all
    Add New Product for Wemall shop    ${storename_slug_wemall}
    Check product    ${storename_slug_wemall}    all
    Search product    ${p_name}
    Reload Page
    Checking status should be    รอการตรวจสอบ
    Product visibility should be    hide

TC_MC_11086
    [Documentation]    Verify Store product list page after updating the product name
    [Tags]    Regression    Medium
    Account Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Check product    ${storename_slug_wemall}    all
    Click quick edit
    Update Product Name On Quick Edit    ${product_name2}
    Search product    ${NEW_NAME}
    Reload Page
    Checking status should be    รอการตรวจสอบ

TC_MC_11089
    [Documentation]    Verify Edit product page for product which have status as waiting to check from wemall
    [Tags]    Regression    Medium
    Account Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Check product    ${storename_slug_wemall}    all
    Go To Pending Product Board
    Go To Edit Product Page
    Checking warning message should be    สินค้าชิ้นนี้รอการตรวจสอบจาก WeMall Admin

TC_MC_11289
    [Documentation]    Verify Store product list page after updating the product's stock on quick edit
    [Tags]    Regression    Medium
    Account Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Check product    ${storename_slug_wemall}    all
    Click quick edit
    Add Product Stock On Quick Edit
    Reload Page
    Checking status should be    ผ่านการตรวจสอบ

TC_MC_11318
    [Documentation]    Verify Store product list page after updating the product's description on edit product information page
    [Tags]    Regression    Medium
    Account Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Check product    ${storename_slug_wemall}    all
    Go To Approved Product Board
    ${input_product}    Get Text    ${lbl_first_product}
    Go To Edit Product Page
    Edit Product Information
    Check product    ${storename_slug_wemall}    all
    Go To Approved Product Board
    Search product    ${input_product}
    Checking status should be    ผ่านการตรวจสอบ

