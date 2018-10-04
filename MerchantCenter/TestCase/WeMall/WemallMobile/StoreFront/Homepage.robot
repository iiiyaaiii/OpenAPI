*** Settings ***
Suite Teardown    Close All Browsers
Test Teardown     Close Browser
Force Tags        Wemall-Mobile
Resource          ../../../../Resource/WeMall/Configuration/Staging/serverconfig.txt
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Resource/WeMall/MobileElement/StoreFront.robot
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Mobile_Home.robot
Resource          ../../../../Keyword/Common/Mobile_StoreFront.robot

*** Keywords ***
Successfully Log-in To WeMall
    [Arguments]    ${username}    ${password}
    Mobile_Home.Open Wemall Portal page on Mobile
    Mobile_Home.Wemall Portal page should be appeared
    Mobile_Home.Open Login page
    Mobile_Home.เข้าสู่ระบบ page should be appeared
    Mobile_Home.Enter Username    ${username}
    Mobile_Home.Enter password    ${password}
    Mobile_Home.Click Login button
    Mobile_Home.Wemall Portal page should be appeared
    Mobile_Home.User is logged in to WeMall successfully

Open Store Front Page
    [Arguments]    ${shopSlugID}
    Go To    ${URL_MOBILE}/${shopSlugID}

Open Shop Main Menu
    [Arguments]    ${shopSlugID}    ${shopName}
    Mobile_StoreFront.Open Wemall Store Front Page On Mobile    ${shopSlugID}
    Mobile_StoreFront.Wemall Store Front Page Should Be Appeared    ${shopName}
    Mobile_StoreFront.Click Shop Menu Icon

Shop Menu Option Should Be Appeared
    [Arguments]    ${shopMenu}
    Mobile_StoreFront.Shop Menu Should Be Appeared    ${shopMenu}

Validate Social Network Icon
    [Arguments]    ${socialNetwork}    ${expectedResult}
    Run Keyword If    '${expectedResult}'=='Invisible'    Element Should Not Be Visible    ${socialNetwork}
    Run Keyword If    '${expectedResult}'=='Visible'      Element Should Be Visible        ${socialNetwork}
    [Teardown]    Capture Page Screenshot

*** Test Cases ***
TC_MC_06478
    [Documentation]    [StoreFront][Mobile] Widget - Appearance - User Avatar icon
    [Tags]    Regression    Ligo    Sprint2017MC18
    [Setup]    Successfully Log-in To WeMall    ${wmShop_user_004}    ${wmShop_pwd_004}
    Open Store Front Page    ${wmShop_name_004}
    Mobile_StoreFront.Wemall Store Front Page Should Be Appeared    ${wmShop_store_004}
    Mobile_StoreFront.Click User Avatar Icon
    Mobile_StoreFront.User Avatar Option Should Be Appeared

TC_MC_06479
    [Documentation]    [StoreFront][Mobile] Widget - Navigation Link - Wemall logo
    [Tags]    Regression    Ligo    Sprint2017MC18
    Mobile_StoreFront.Open Wemall Store Front Page On Mobile    ${wmShop_name_004}
    Mobile_StoreFront.Wemall Store Front Page Should Be Appeared    ${wmShop_store_004}
    Mobile_StoreFront.Click WeMall Logo
    Mobile_Home.Wemall Portal page should be appeared

TC_MC_06480
    [Documentation]    [StoreFront][Mobile] Widget - Navigation Link - Login
    [Tags]    Regression    Ligo    Sprint2017MC18
    Mobile_StoreFront.Open Wemall Store Front Page On Mobile    ${wmShop_name_004}
    Mobile_StoreFront.Wemall Store Front Page Should Be Appeared    ${wmShop_store_004}
    Mobile_StoreFront.Click Login Button
    Mobile_Home.เข้าสู่ระบบ page should be appeared

TC_MC_06481
    [Documentation]    [StoreFront][Mobile] Widget - Navigation Link - Cart
    [Tags]    Regression    Ligo    Sprint2017MC18
    Mobile_StoreFront.Open Wemall Store Front Page On Mobile    ${wmShop_name_004}
    Mobile_StoreFront.Wemall Store Front Page Should Be Appeared    ${wmShop_store_004}
    Mobile_StoreFront.Click My Cart Icon
    Mobile_Home.ตะกร้าสินค้า page should be appeared

TC_MC_06482
    [Documentation]    [StoreFront][Mobile] Widget - Navigation Link - Shop Main Menu
    [Tags]    Regression    Ligo    Sprint2017MC18
    Mobile_StoreFront.Open Wemall Store Front Page On Mobile    ${wmShop_name_004}
    Mobile_StoreFront.Wemall Store Front Page Should Be Appeared    ${wmShop_store_004}
    Mobile_StoreFront.Click Shop Menu Icon
    Mobile_StoreFront.Shop Menu Should Be Expanded

TC_MC_06483
    [Documentation]    [StoreFront][Mobile] Widget - Navigation Link - Shop Avatar
    [Tags]    Regression    Ligo    Sprint2017MC18
    Mobile_StoreFront.Open Wemall Store Front Page On Mobile    ${wmShop_name_004}
    Mobile_StoreFront.Wemall Store Front Page Should Be Appeared    ${wmShop_store_004}
    Mobile_StoreFront.Click Shop Avatar
    Mobile_StoreFront.Wemall Store Front Page Should Be Appeared    ${wmShop_store_004}

TC_MC_06484
    [Documentation]    [StoreFront][Mobile] Widget - Navigation Link - Shop Name
    [Tags]    Regression    Ligo    Sprint2017MC18
    Mobile_StoreFront.Open Wemall Store Front Page On Mobile    ${wmShop_name_004}
    Mobile_StoreFront.Wemall Store Front Page Should Be Appeared    ${wmShop_store_004}
    Mobile_StoreFront.Click Shop Name
    Mobile_StoreFront.Wemall Store Front Page Should Be Appeared    ${wmShop_store_004}

TC_MC_06485
    [Documentation]    [StoreFront][Mobile] Widget - Navigation Link - My Shop
    [Tags]    Regression    Ligo    Sprint2017MC18
    [Setup]    Successfully Log-in To WeMall    ${wmShop_user_004}    ${wmShop_pwd_004}
    Open Store Front Page    ${wmShop_name_004}
    Mobile_StoreFront.Wemall Store Front Page Should Be Appeared    ${wmShop_store_004}
    Mobile_StoreFront.Click My Shop Icon
    Mobile_Home.Manage Store page should be appeared    ${wmShop_name_004}

TC_MC_06486
    [Documentation]    [StoreFront][Mobile] Widget - Navigation Link - User Avatar - รายการสั่งซื้อ
    [Tags]    Regression    Ligo    Sprint2017MC18
    [Setup]    Successfully Log-in To WeMall    ${wmShop_user_004}    ${wmShop_pwd_004}
    Open Store Front Page    ${wmShop_name_004}
    Mobile_StoreFront.Wemall Store Front Page Should Be Appeared    ${wmShop_store_004}
    Mobile_StoreFront.Click User Avatar Icon
    Mobile_StoreFront.User Avatar Option Should Be Appeared
    Mobile_StoreFront.Select User Avatar Option    รายการสั่งซื้อ
    Mobile_Home.รายการสั่งซื้อ page should be appeared

TC_MC_06487
    [Documentation]    [StoreFront][Mobile] Widget - Navigation Link - User Avatar - ข้อมูลส่วนตัว
    [Tags]    Regression    Ligo    Sprint2017MC18
    [Setup]    Successfully Log-in To WeMall    ${wmShop_user_004}    ${wmShop_pwd_004}
    Open Store Front Page    ${wmShop_name_004}
    Mobile_StoreFront.Wemall Store Front Page Should Be Appeared    ${wmShop_store_004}
    Mobile_StoreFront.Click User Avatar Icon
    Mobile_StoreFront.User Avatar Option Should Be Appeared
    Mobile_StoreFront.Select User Avatar Option    ข้อมูลส่วนตัว
    Mobile_Home.ข้อมูลส่วนตัว page should be appeared

TC_MC_06488
    [Documentation]    [StoreFront][Mobile] Widget - Navigation Link - User Avatar - ออกจากระบบ
    [Tags]    Regression    Ligo    Sprint2017MC18
    [Setup]    Successfully Log-in To WeMall    ${wmShop_user_004}    ${wmShop_pwd_004}
    Open Store Front Page    ${wmShop_name_004}
    Mobile_StoreFront.Wemall Store Front Page Should Be Appeared    ${wmShop_store_004}
    Mobile_StoreFront.Click User Avatar Icon
    Mobile_StoreFront.User Avatar Option Should Be Appeared
    Mobile_StoreFront.Select User Avatar Option    ออกจากระบบ
    Mobile_Home.Wemall Portal page should be appeared

TC_MC_06493
    [Documentation]    [StoreFront][Mobile] Shop Main Menu - Appearance
    [Tags]    Smoke    Regression    Ligo    Sprint2017MC18
    [Setup]    Open Shop Main Menu    ${wmShop_name_004}    ${wmShop_store_004}
    [Template]    Shop Menu Option Should Be Appeared
    หน้าแรก
    สินค้า
    หมวดหมู่สินค้า
    โปรโมชั่นร้านค้า
    # ติดต่อร้านค้า
    # [Teardown]    Capture Page Screenshot

TC_MC_06496
    [Documentation]    [StoreFront][Mobile] Shop Main Menu - Navigation Link - หน้าแรก
    [Tags]    Regression    Ligo    Sprint2017MC18
    Mobile_StoreFront.Open Wemall Store Front Page On Mobile    ${wmShop_name_004}
    Mobile_StoreFront.Wemall Store Front Page Should Be Appeared    ${wmShop_store_004}
    Mobile_StoreFront.Select Shop Menu    หน้าแรก
    Mobile_StoreFront.Wemall Store Front Page Should Be Appeared    ${wmShop_store_004}

TC_MC_06497
    [Documentation]    [StoreFront][Mobile] Shop Main Menu - Navigation Link - สินค้า
    [Tags]    Regression    Ligo    Sprint2017MC18    Sprint2017MC19
    Mobile_StoreFront.Open Wemall Store Front Page On Mobile    ${wmShop_name_004}
    Mobile_StoreFront.Wemall Store Front Page Should Be Appeared    ${wmShop_store_004}
    Mobile_StoreFront.Select Shop Menu    สินค้า
    Mobile_StoreFront.All Products Page Should Be Appeared

TC_MC_06498
    [Documentation]    [StoreFront][Mobile] Shop Main Menu - Navigation Link - หมวดหมู่สินค้า - Main Category
    [Tags]    Regression    Ligo    Sprint2017MC18    Sprint2017MC19
    Mobile_StoreFront.Open Wemall Store Front Page On Mobile    ${seller_name001}
    Mobile_StoreFront.Wemall Store Front Page Should Be Appeared    ${seller_name001}
    Mobile_StoreFront.Select Shop Menu    หมวดหมู่สินค้า
    Mobile_StoreFront.Select Shop Sub-Menu    กระโปรงแฟชั่น
    Mobile_StoreFront.Level C Product Category Page Should Be Appeared    กระโปรงแฟชั่น

TC_MC_06499
    [Documentation]    [StoreFront][Mobile] Shop Main Menu - Navigation Link - หมวดหมู่สินค้า - Sub-Category
    [Tags]    Regression    Ligo    Sprint2017MC18    Sprint2017MC19
    Mobile_StoreFront.Open Wemall Store Front Page On Mobile    ${seller_name001}
    Mobile_StoreFront.Wemall Store Front Page Should Be Appeared    ${seller_name001}
    Mobile_StoreFront.Select Shop Menu    หมวดหมู่สินค้า
    Mobile_StoreFront.Select Shop Sub-Menu    กระเป๋าเอกสาร
    Mobile_StoreFront.Select Shop Sub-Menu    กระเป๋าโน๊ตบุ๊ค
    Mobile_StoreFront.Level C Product Category Page Should Be Appeared    กระเป๋าโน๊ตบุ๊ค

TC_MC_06500
    [Documentation]    [StoreFront][Mobile] Shop Main Menu - Navigation Link - โปรโมชั่นร้านค้า - No Promotion
    [Tags]    Regression    Ligo    Sprint2017MC18    Sprint2017MC19
    Mobile_StoreFront.Open Wemall Store Front Page On Mobile    ${wmShop_name_002}
    Mobile_StoreFront.Wemall Store Front Page Should Be Appeared    ${wmShop_store_002}
    Mobile_StoreFront.Select Shop Promotion
    Mobile_StoreFront.No Seller Promotion Page Should Be Appeared

TC_MC_06501
    [Documentation]    [StoreFront][Mobile] Shop Main Menu - Navigation Link - โปรโมชั่นร้านค้า - Has Promotion
    [Tags]    Regression    Ligo    Sprint2017MC18    Sprint2017MC19
    Mobile_StoreFront.Open Wemall Store Front Page On Mobile    ${wmShop_name_004}
    Mobile_StoreFront.Wemall Store Front Page Should Be Appeared    ${wmShop_store_004}
    Mobile_StoreFront.Select Shop Promotion
    Mobile_StoreFront.Seller Promotion List Page Should Be Appeared

# TC_MC_06502
#     [Documentation]    [StoreFront][Mobile] Shop Main Menu - Navigation Link - ติดต่อร้านค้า (Inactive)
#     [Tags]    Regression    Ligo    Sprint2017MC18    Sprint2017MC19
#     Mobile_StoreFront.Open Wemall Store Front Page On Mobile    ${wmShop_name_004}
#     Mobile_StoreFront.Wemall Store Front Page Should Be Appeared    ${wmShop_store_004}
#     Mobile_StoreFront.Select Shop Menu    ติดต่อร้านค้า
#     Mobile_StoreFront.Seller Contact Page Should Be Appeared

TC_MC_06508
    [Documentation]    [StoreFront][Mobile] Latest Product - ช้อปสินค้าใหม่ - ดูสินค้าทั้งหมด link
    [Tags]    Regression    Ligo    Sprint2017MC18    Sprint2017MC19
    Mobile_StoreFront.Open Wemall Store Front Page On Mobile    ${wmShop_name_004}
    Mobile_StoreFront.Wemall Store Front Page Should Be Appeared    ${wmShop_store_004}
    Mobile_StoreFront.View More Products    ช้อปสินค้าใหม่
    Mobile_StoreFront.All Products Page Should Be Appeared

TC_MC_06512
    [Documentation]    [StoreFront][Mobile] Latest Product - ดูสินค้าใหม่เพิ่มเติมที่นี่
    [Tags]    Regression    Ligo    Sprint2017MC18    Sprint2017MC19
    Mobile_StoreFront.Open Wemall Store Front Page On Mobile    ${wmShop_name_004}
    Mobile_StoreFront.Wemall Store Front Page Should Be Appeared    ${wmShop_store_004}
    Mobile_StoreFront.Click ดูสินค้าใหม่เพิ่มเติมที่นี่ Button
    Mobile_StoreFront.All Products Page Should Be Appeared

TC_MC_06514
    [Documentation]    [StoreFront][Mobile] Social Network - Not Available
    [Tags]    Regression    Ligo    Sprint2017MC18
    Mobile_StoreFront.Open Wemall Store Front Page On Mobile    ${wmShop_name_002}
    Mobile_StoreFront.Wemall Store Front Page Should Be Appeared    ${wmShop_store_002}
    Mobile_StoreFront.Social Network Section Should Not Be Appeared

TC_MC_06515
    [Documentation]    [StoreFront][Mobile] Social Network - Available
    [Tags]    Regression    Ligo    Sprint2017MC18
    Mobile_StoreFront.Open Wemall Store Front Page On Mobile    ${store_url1}
    Mobile_StoreFront.Wemall Store Front Page Should Be Appeared    ${store_url1}
    Mobile_StoreFront.Scroll To Social Network Section
    Mobile_StoreFront.Social Network Section Should Be Appeared

TC_MC_06523
    [Documentation]    [StoreFront][Mobile] Seller promotion -  Seller promotion active have product
    [Tags]    Regression    High    Sprint2017MC18
    Mobile_StoreFront.Open Wemall Store Front Page On Mobile    ${store_url1}
    Mobile_StoreFront.Verify Seller Promotion On HOMEPAGE

TC_MC_06526
    [Documentation]    [StoreFront][Mobile] Seller promotion -  Seller promotion active have product
    [Tags]    Regression    Low    Sprint2017MC18
    Mobile_StoreFront.Open Wemall Store Front Page On Mobile    ${store_url1}
    Mobile_StoreFront.Click View All

TC_MC_06615
    [Documentation]    [StoreFront][Mobile] Seller promotion -  Seller promotion active have product
    [Tags]    Regression    High    Sprint2017MC18
    Mobile_StoreFront.Open Wemall Store Front Page On Mobile    ${store_url1}
    Mobile_StoreFront.Verify Collection On HOMEPAGE
