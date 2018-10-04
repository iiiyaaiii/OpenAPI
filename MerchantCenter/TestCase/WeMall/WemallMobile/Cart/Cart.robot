*** Settings ***
Suite Teardown    Close All Browsers
Test Teardown     Run Keywords    Logout From WeMall    AND    Close Browser
Force Tags        Wemall-Mobile
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Resource/WeMall/Configuration/Staging/serverconfig.txt
Resource          ../../../../Resource/WeMall/MobileElement/Homepage.robot
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Mobile_Home.robot
Resource          ../../../../Keyword/Common/Mobile_Cart.robot
Resource          ../../../../Keyword/Common/Mobile_LevelD.robot

*** Keywords ***
Login to Wemall on Mobile
    [Arguments]    ${username}    ${password}
    Mobile_Home.Open Login page
    Mobile_Home.เข้าสู่ระบบ page should be appeared
    Mobile_Home.Enter Username    ${username}
    Mobile_Home.Enter password    ${password}
    Mobile_Home.Click Login button
    # Mobile_Home.Wemall Portal page should be appeared
    Mobile_Home.User is logged in to WeMall successfully

Logout From WeMall
    Mobile_Home.Click Main Menu
    Mobile_Home.Click Logout Menu
    Mobile_Home.Wemall Portal page should be appeared

Open WeMall Portal Page On Mobile
    Mobile_Home.Open Wemall Portal page on Mobile
    Mobile_Home.Wemall Portal page should be appeared

Open Product Level D Page
    [Arguments]    ${productID}
    Go To    ${URL_MOBILE}/d/${productID}

Add Product Quantity
    [Arguments]    ${productQuantity}
    Mobile_LevelD.Select Product Quantity    ${productQuantity}
    Mobile_LevelD.Click on Add To Cart Button
    Mobile_LevelD.Click ดูสินค้าต่อ Button

Open Cart Page
    Go To    ${URL_MOBILE}/cart

Cleanup Data
    [Arguments]    ${product_name}
    Open WeMall Portal Page On Mobile
    Login to Wemall on Mobile    ${wmShop_user_004}    ${wmShop_pwd_004}
    Open Cart Page
    Mobile_Cart.Remove Product    ${product_name}

*** Test Cases ***
TC_MC_06230
    [Documentation]    Mobile wemall : No product in cart
    [Tags]    Regression    Ligo    Sprint2017MC17
    Mobile_Cart.Open Wemall Cart Page On Mobile
    Mobile_Home.ตะกร้าสินค้า page should be appeared
    Mobile_Cart.Empty Cart Page Should Be Appeared

TC_MC_06232
    [Documentation]    Mobile wemall : Add Everyday Wow product from 1 store to cart
    [Tags]    Regression    Ligo    Sprint2017MC17
    [Setup]    Run Keywords    Mobile_LevelD.Go to Product Level D Page    ${robot_stg_store1_sellerpromotion_flashsale}    AND    Add Product Quantity    1
    Open Cart Page
    Mobile_Cart.Number Of Added Product In Cart Should Be Appeared    1
    Mobile_Cart.Number Of Added Shop In Cart Should Be Appeared    1
    Mobile_Cart.Information Icon Should Be Appeared
    Mobile_Cart.Shop Name Should Be Appeared   ${store_url1}
    Mobile_Cart.Promotion Tag Should Be Appeared    Everyday Wow
    Mobile_Cart.Product Name Should Be Appeared    robot_stg_store1 - สินค้า Seller Promotion & FlashSale
    Mobile_Cart.Product Price Should Be Appeared    299.00 บาท
    Mobile_Cart.Product Compare Price Should Be Appeared    650.00 บาท
    Mobile_Cart.Added Product Quantity Should Be Appeared    1
    Mobile_Cart.Remove Product Button Should Be Appeared

TC_MC_06233
    [Documentation]    Mobile wemall : Add Seller Promotion product from 1 store to cart
    [Tags]    Regression    Ligo    Sprint2017MC17
    [Setup]    Run Keywords    Mobile_LevelD.Go to Product Level D Page    ${test_seller_promotion}    AND    Add Product Quantity    1
    Open Cart Page
    Mobile_Cart.Number Of Added Product In Cart Should Be Appeared    1
    Mobile_Cart.Number Of Added Shop In Cart Should Be Appeared    1
    Mobile_Cart.Information Icon Should Be Appeared
    Mobile_Cart.Shop Name Should Be Appeared    ${wmShop_name_001}
    Mobile_Cart.Discount Label Should Be Appeared    ${test_seller_promotion_name}
    Mobile_Cart.Promotion Tag Should Be Appeared    ${test_seller_promotion_name}
    Mobile_Cart.Product Name Should Be Appeared    [Automate] Seller Promotion - THB
    Mobile_Cart.Product Price Should Be Appeared    1,111.00 บาท
    Mobile_Cart.Product Compare Price Should Be Appeared    1,200.00 บาท
    Mobile_Cart.Added Product Quantity Should Be Appeared    1
    Mobile_Cart.Remove Product Button Should Be Appeared

TC_MC_06235
    [Documentation]    Mobile wemall : Add product from diferrent shop to cart when have product from 1 shop in cart
    [Tags]    Ligo    Sprint2017MC17
    Mobile_LevelD.Go to Product Level D Page    ${test_10_pieces}
    Add Product Quantity    1
    Open Cart Page
    Mobile_Cart.Shop Name Should Be Appeared    wemallshoptest1
    Mobile_Cart.Number Of Added Product In Cart Should Be Appeared    1
    Mobile_Cart.Number Of Added Shop In Cart Should Be Appeared    1
    Mobile_Cart.Product Name Should Be Appeared    [Automate] Stock 10 pieces
    Open Product Level D Page    ${test_huge_amount}
    Add Product Quantity    1
    Open Cart Page
    Mobile_Cart.Shop Name Should Be Appeared    robot_stg_store1
    Mobile_Cart.Number Of Added Product In Cart Should Be Appeared    2
    Mobile_Cart.Number Of Added Shop In Cart Should Be Appeared    2
    Mobile_Cart.Product Name Should Be Appeared    robot_stg_store1 - สินค้า Seller Promotion

TC_MC_06236
    [Documentation]    Mobile wemall : Add other product from first shop to cart when have product from 2 shop in cart
    [Tags]    Regression    Ligo    Sprint2017MC17
    Mobile_LevelD.Go to Product Level D Page    ${test_10_pieces}
    Add Product Quantity    1
    Open Cart Page
    Mobile_Cart.Shop Name Should Be Appeared    wemallshoptest1
    Mobile_Cart.Number Of Added Product In Cart Should Be Appeared    1
    Mobile_Cart.Number Of Added Shop In Cart Should Be Appeared    1
    Mobile_Cart.Product Name Should Be Appeared    [Automate] Stock 10 pieces
    Open Product Level D Page    ${test_huge_amount}
    Add Product Quantity    1
    Open Cart Page
    Mobile_Cart.Shop Name Should Be Appeared    robot_stg_store1
    Mobile_Cart.Number Of Added Product In Cart Should Be Appeared    2
    Mobile_Cart.Number Of Added Shop In Cart Should Be Appeared    2
    Mobile_Cart.Product Name Should Be Appeared    robot_stg_store1 - สินค้า Seller Promotion
    Open Product Level D Page    L91201368
    Add Product Quantity    1
    Open Cart Page
    Mobile_Cart.Shop Name Should Be Appeared    robot_stg_store2
    Mobile_Cart.Number Of Added Product In Cart Should Be Appeared    3
    Mobile_Cart.Number Of Added Shop In Cart Should Be Appeared    3
    Mobile_Cart.Product Name Should Be Appeared    robot_stg_store2 - สินค้า Join Campaign Limit3
    Open Product Level D Page    L91201428
    Add Product Quantity    1
    Open Cart Page
    Mobile_Cart.Shop Name Should Be Appeared    wemallshoptest1
    Mobile_Cart.Number Of Added Product In Cart Should Be Appeared    4
    Mobile_Cart.Number Of Added Shop In Cart Should Be Appeared    3
    Mobile_Cart.Product Name Should Be Appeared    [Automate] Discount Price

TC_MC_06242
    [Documentation]    Mobile wemall : [Everyday wow limit] Add product everyday wow from 2 shops
    [Tags]    Regression    Ligo    Sprint2017MC17
    [Setup]    Run Keywords    Mobile_LevelD.Go to Product Level D Page    ${test_wow_product_1}    AND    Add Product Quantity    2
    Open Cart Page
    Mobile_Cart.Number Of Added Product In Cart Should Be Appeared    2
    Mobile_Cart.Number Of Added Shop In Cart Should Be Appeared    1
    Mobile_Cart.Promotion Tag Should Be Appeared    Everyday Wow
    Open Product Level D Page    ${test_wow_product_2}
    Add Product Quantity    2
    Open Cart Page
    Mobile_Cart.Number Of Added Product In Cart Should Be Appeared    4
    Mobile_Cart.Number Of Added Shop In Cart Should Be Appeared    2
    Mobile_Cart.Promotion Tag Should Be Appeared    Everyday Wow

TC_MC_06252
    [Documentation]    Mobile wemall : Verify click icon "i" at ตะกร้าสินค้าของท่าน
    [Tags]    Ligo    Sprint2017MC17
    [Setup]    Run Keywords    Mobile_LevelD.Go to Product Level D Page    ${test_wow_product_1}    AND    Add Product Quantity    1
    Open Cart Page
    Mobile_Cart.Click On Information Icon
    Mobile_Cart.Information Popup Should Be Appeared
    Mobile_Cart.Click Close Information Popup
    Mobile_Cart.Information Popup Should Not Be Appeared

TC_MC_06253
    [Documentation]    Mobile wemall : Verify click icon "i" at promotion
    [Tags]    Ligo    Sprint2017MC17
    [Setup]    Run Keywords    Mobile_LevelD.Go to Product Level D Page    ${test_seller_promotion}    AND    Add Product Quantity    1
    Open Cart Page
    Mobile_Cart.Click On Promotion Information Icon
    Mobile_Cart.Promotion Information Popup Should Be Appeared    ${test_seller_promotion_name}    ${test_seller_promotion_detail}
    Mobile_Cart.Click Close Promotion Information Popup
    Mobile_Cart.PromotionInformation Popup Should Not Be Appeared

TC_MC_06255
    [Documentation]    Mobile [Cart : Verify Stock] Product type availibility
    [Tags]    Regression    Ligo    Sprint2017MC17
    [Setup]    Run Keywords    Mobile_LevelD.Go to Product Level D Page    ${test_10_pieces}    AND    Add Product Quantity    10
    Open Cart Page
    Mobile_Cart.Increase Product Quantity
    Mobile_Cart.Alert Message Should Be Appeared    *สินค้ามีจำนวน 10 ชิ้นเท่านั้น

TC_MC_06256
     [Documentation]    Mobile [Cart : Verify Stock] Product type availibility and have more inventories
    [Tags]    Regression    Ligo    Sprint2017MC17
    Mobile_LevelD.Go to Product Level D Page    ${test_attribute}
    Mobile_LevelD.Select Attribute Option    ขาว
    Mobile_LevelD.Select Attribute Option    S
    Add Product Quantity    1
    Open Cart Page
    Mobile_Cart.Select Product Quantity    3
    Mobile_Cart.Alert Message Should Be Appeared    *สินค้ามีจำนวน 2 ชิ้นเท่านั้น
    Open Product Level D Page    ${test_attribute}
    Mobile_LevelD.Select Attribute Option    ขาว
    Mobile_LevelD.Select Attribute Option    XXS
    Add Product Quantity    1
    Open Cart Page
    Mobile_Cart.Select Product Quantity    3
    Mobile_Cart.Alert Message Should Be Appeared    *สินค้ามีจำนวน 2 ชิ้นเท่านั้น

TC_MC_06257
    [Documentation]    Mobile [Cart : Verify Stock] Product type availibility increase product quantity more than 99
    [Tags]    Regression    Ligo    Sprint2017MC17
    [Setup]    Run Keywords    Mobile_LevelD.Go to Product Level D Page    ${test_huge_amount}    AND    Add Product Quantity    99
    Open Cart Page
    Mobile_Cart.Increase Product Quantity
    Mobile_Cart.Alert Message Should Be Appeared    *สั่งซื้อได้ครั้งละไม่เกิน 99 ชิ้นเท่านั้น

TC_MC_06258
    [Documentation]    Mobile Increase product quantity
    [Tags]    Regression    Ligo    Sprint2017MC17
    [Setup]    Run Keywords    Mobile_LevelD.Go to Product Level D Page    ${test_wow_product_1}    AND    Add Product Quantity    1
    Open Cart Page
    Mobile_Cart.Number Of Added Product In Cart Should Be Appeared    1
    Mobile_Cart.Number Of Added Shop In Cart Should Be Appeared    1
    Mobile_Cart.Select Product Quantity    3
    Mobile_Cart.Number Of Added Product In Cart Should Be Appeared    3
    Mobile_Cart.Number Of Added Shop In Cart Should Be Appeared    1

TC_MC_06260
    [Documentation]    Mobile [Join Campaign]: Increase Product Quantily as over limit
    [Tags]    Regression    Ligo    Sprint2017MC17
    Mobile_LevelD.Go to Product Level D Page    ${test_purchase_limit_join}
    Mobile_LevelD.Select Attribute Option    S
    Mobile_LevelD.Select Attribute Option    ขาว
    Add Product Quantity    2
    Open Cart Page
    Mobile_Cart.Increase Product Quantity
    Mobile_Cart.Alert Message Should Be Appeared    *จำกัดการซื้อได้ไม่เกิน 2 ชิ้นต่อครั้ง

TC_MC_06263
    [Documentation]    Mobile [Non Join Campaign]: Increase Product Quantily as over limit
    [Tags]    Ligo    Sprint2017MC17
    [Setup]    Run Keywords    Mobile_LevelD.Go to Product Level D Page    ${test_purchase_limit_non_join}    AND    Add Product Quantity    9
    Open Cart Page
    Mobile_Cart.Increase Product Quantity
    Mobile_Cart.Alert Message Should Be Appeared    *จำกัดการซื้อได้ไม่เกิน 9 ชิ้นต่อครั้ง

TC_MC_06267
    [Documentation]    Mobile Decrease product quantity
    [Tags]    Regression    Ligo    Sprint2017MC17
    [Setup]    Run Keywords    Mobile_LevelD.Go to Product Level D Page    ${test_huge_amount}    AND    Add Product Quantity    5
    Open Cart Page
    Mobile_Cart.Number Of Added Product In Cart Should Be Appeared    5
    Mobile_Cart.Number Of Added Shop In Cart Should Be Appeared    1
    Mobile_Cart.Select Product Quantity    1
    Mobile_Cart.Number Of Added Product In Cart Should Be Appeared    1
    Mobile_Cart.Number Of Added Shop In Cart Should Be Appeared    1

TC_MC_06268
    [Documentation]    Mobile Remove product from cart
    [Tags]    Regression    Ligo    Sprint2017MC17
    Mobile_LevelD.Go To Product Level D Page    ${test_wow_product_2}
    Add Product Quantity    1
    Open Product Level D Page    ${test_wow_product_1}
    Add Product Quantity    2
    Open Cart Page
    Mobile_Cart.Number Of Added Product In Cart Should Be Appeared    3
    Mobile_Cart.Number Of Added Shop In Cart Should Be Appeared    2
    Mobile_Cart.Remove Product    robot_stg_store1 - สินค้า FlashSale 1
    Mobile_Cart.Number Of Added Product In Cart Should Be Appeared    1
    Mobile_Cart.Number Of Added Shop In Cart Should Be Appeared    1

TC_MC_06269
    [Documentation]    Mobile Logon session which old session don't have product into cart
    [Tags]    Regression    Ligo    Sprint2017MC17
    Open WeMall Portal Page On Mobile
    Delete All Cookies
    Login to Wemall on Mobile    ${wmShop_user_003}    ${wmShop_pwd_003}
    Open Product Level D Page    ${test_wow_product_1}
    Add Product Quantity    1
    Open Cart Page
    Mobile_Cart.Number Of Added Product In Cart Should Be Appeared    1
    Mobile_Cart.Number Of Added Shop In Cart Should Be Appeared    1
    [Teardown]    Mobile_Cart.Remove Product    robot_stg_store1 - สินค้า FlashSale 1

TC_MC_06270
    [Documentation]    Mobile Logon session which old session have product into cart
    [Tags]    Regression    Ligo    Sprint2017MC17
    Open WeMall Portal Page On Mobile
    Delete All Cookies
    Login to Wemall on Mobile    ${wmShop_user_003}    ${wmShop_pwd_003}
    Open Product Level D Page    ${test_wow_product_1}
    Add Product Quantity    1
    Open Cart Page
    Mobile_Cart.Number Of Added Product In Cart Should Be Appeared    1
    Mobile_Cart.Number Of Added Shop In Cart Should Be Appeared    1
    Logout From WeMall
    Login to Wemall on Mobile    ${wmShop_user_003}    ${wmShop_pwd_003}
    Open Cart Page
    Mobile_Cart.Number Of Added Product In Cart Should Be Appeared    1
    Mobile_Cart.Number Of Added Shop In Cart Should Be Appeared    1
    [Teardown]    Mobile_Cart.Remove Product    robot_stg_store1 - สินค้า FlashSale 1

TC_MC_06271
    [Documentation]    Mobile Logout session
    [Tags]    Regression    Ligo    Sprint2017MC17
    Open WeMall Portal Page On Mobile
    Delete All Cookies
    Login to Wemall on Mobile    ${wmShop_user_003}    ${wmShop_pwd_003}
    Open Product Level D Page    ${test_wow_product_1}
    Add Product Quantity    1
    Open Cart Page
    Mobile_Cart.Number Of Added Product In Cart Should Be Appeared    1
    Mobile_Cart.Number Of Added Shop In Cart Should Be Appeared    1
    Logout From WeMall
    Open Cart Page
    Mobile_Cart.Empty Cart Page Should Be Appeared
    [Teardown]    Cleanup Data    robot_stg_store1 - สินค้า FlashSale 1

TC_MC_06294
    [Documentation]    [Mobile] Other product not in promotion will not calculate include with discount seller promotion
    [Tags]    Regression    Ligo    Sprint2017MC17
    [Setup]    Run Keywords    Mobile_LevelD.Go to Product Level D Page    ${test_normal_price}    AND    Add Product Quantity    1
    Open Cart Page
    Mobile_Cart.Number Of Added Product In Cart Should Be Appeared    1
    Mobile_Cart.Number Of Added Shop In Cart Should Be Appeared    1
    Discount Amount Should Not Be Appeared
    Open Product Level D Page    ${test_seller_promotion}
    Add Product Quantity    1
    Open Cart Page
    Mobile_Cart.Number Of Added Product In Cart Should Be Appeared    2
    Mobile_Cart.Number Of Added Shop In Cart Should Be Appeared    1
    Discount Amount Should Not Be Appeared
    Mobile_Cart.Promotion Tag Should Be Appeared    Seller Promotion - THB Discount
    Mobile_Cart.Product Name Should Be Appeared    [Automate] Seller Promotion - THB

TC_MC_06297
    [Documentation]    [Mobile] Choose product in seller promotion not match condition then increase quantily product after that to match condition
    [Tags]    Regression    Ligo    Sprint2017MC17    SmokeTest
    [Setup]    Run Keywords    Mobile_LevelD.Go to Product Level D Page    ${test_seller_promotion}
    ...    AND    Login to Wemall on Mobile    ${wmShop_user_003}    ${wmShop_pwd_003}
    ...    AND    Add Product Quantity    1
    ${product_name}    Set Variable    [Automate] Seller Promotion - THB
    Open Cart Page
    Mobile_Cart.Number Of Added Product In Cart Should Be Appeared    1
    Mobile_Cart.Number Of Added Shop In Cart Should Be Appeared    1
    Discount Amount Should Not Be Appeared
    Open Product Level D Page    ${test_seller_promotion}
    Add Product Quantity    1
    Open Cart Page
    Mobile_Cart.Number Of Added Product In Cart Should Be Appeared    2
    Mobile_Cart.Number Of Added Shop In Cart Should Be Appeared    1
    Discount Amount Should Be Appeared
    Mobile_Cart.Promotion Tag Should Be Appeared    Seller Promotion - THB Discount
    Mobile_Cart.Product Name Should Be Appeared    ${product_name}
    [Teardown]    Run Keywords    Open Cart Page    AND    Mobile_Cart.Remove Product    ${product_name}
