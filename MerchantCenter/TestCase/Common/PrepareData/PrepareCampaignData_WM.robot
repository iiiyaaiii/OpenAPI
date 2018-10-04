*** Settings ***
Suite Setup       Open Custom Browser    ${URL_PORTAL}    ${BROWSER}
Suite Teardown    Close All Browsers
Library           SeleniumLibrary    15    5    run_on_failure=Capture Page Screenshot
Library           String
Library           OperatingSystem
Resource          ../../../Resource/WeMall/init.robot
Resource          ../../../Resource/WeMall/WebElement/Member_SignUp.txt
Resource          ../../../Resource/WeMall/WebElement/Member_SignIn.txt
Resource          ../../../Resource/WeMall/WebElement/Campaign.txt
Resource          ../../../Resource/WeMall/WebElement/Widget.txt
Resource          ../../../Resource/WeMall/WebElement/Product.txt
Resource          ../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../Keyword/Common/Common.txt
Resource          ../../../Keyword/Common/Campaign.txt
Resource          ../../../Keyword/Common/Product.txt


*** Variable ***
${default_encoding}    ISO-8859-1

*** Keywords ***
Write Variable to File
    [Arguments]    ${variable_name}    ${value}
    ${variable}    Catenate    SEPARATOR=    ${    ${variable_name}    }    ${SPACE}${SPACE}${SPACE}${SPACE}    ${value}
    ${FilePath}    Replace String    ${CURDIR}    /TestCase/Common/PrepareData    /Resource/${BU}/Configuration/${ENV}
    Append To File   ${FilePath}${/}robotdata.txt    ${\n}${variable}

CMS Select Product to Campaign
    [Arguments]    ${campaign_id}=none    ${product}=none    ${limit}=${EMPTY}
    Go to    ${URL_PORTAL}/admin/storecampaign/show/${campaign_id}
    Sleep    2
    Execute Javascript    $("input[name='txt_search_product']").val('${product}')
    Press Key    //input[@name='txt_search_product']    \\13
    Sleep    5
    Execute Javascript    $('.all_check').click()
    Execute Javascript    $('.btn-success').click()
    Sleep    5
    Input Text    //tbody[@id='list_product_promotion']//tr[1]//td[9]//input    ${limit}
    Sleep    1
    Execute Javascript    $('.navbar-btn').click()
    Sleep    5

*** Test Cases ***
 # TC_Add_Product_ToStore
 #     Set Selenium Speed    .2
 #   : FOR    ${i}    IN RANGE    1    4
 #   \    Go To    ${URL_PORTAL}
 #   \    Go to Login    ${blockstore_email${i}}    ${blockstore_password${i}}
 #   \    Go To    ${URL_STORE}/${blockstore_url${i}}/admin/product/create
 #   \    Store Add Product By Add Photo    electronic    robot_product1_1.jpg    ${blockstore_name${i}}${SPACE}-${SPACE}พร้อมส่งสินค้าใหม่    ${blockstore_name${i}}_instock_type_new
 #   \    ...    New    5    1    0    0    1
 #   \    Go To    ${URL_STORE}/${blockstore_url${i}}/admin/product/create
 #   \    Store Add Product By Add Photo    electronic    robot_product1_2.jpg    ${blockstore_name${i}}${SPACE}-${SPACE}พร้อมส่งมือสอง    ${blockstore_name${i}}_instock_type_use
 #   \    ...    Use    500    1    0    0    2
 #   \    Go To    ${URL_STORE}/${blockstore_url${i}}/admin/product/create
 #   \    Store Add Product By Add Photo    electronic    robot_product1_3.jpg    ${blockstore_name${i}}${SPACE}-${SPACE}พร้อมส่งหนัก 1.5 kg    ${blockstore_name${i}}_have_weight
 #   \    ...    New    750    1.5    0    0    3
 #   \    Go To    ${URL_STORE}/${blockstore_url${i}}/admin/product/create
 #   \    Store Add Product By Add Photo    electronic    robot_product1_4.jpg    ${blockstore_name${i}}${SPACE}-${SPACE}พร้อมส่ง 1 Attr. 1 Inv.    ${blockstore_name${i}}_1attr_1inv
 #   \    ...    New    750    1    1    1    4
 #   \    Go To    ${URL_STORE}/${blockstore_url${i}}/admin/product/create
 #   \    Store Add Product By Add Photo    electronic    robot_product1_5.jpg    ${blockstore_name${i}}${SPACE}-${SPACE}พร้อมส่ง 1 Attr. 3 Inv.    ${blockstore_name${i}}_1attr_3inv
 #   \    ...    New    2    1    1    3    5
 #   \    Go To    ${URL_STORE}/${blockstore_url${i}}/admin/product/create
 #   \    Store Add Product By Add Photo    fashion    robot_product1_6.jpg    ${blockstore_name${i}}${SPACE}-${SPACE}พร้อมส่ง 2 Attr. 1 Inv.    ${blockstore_name${i}}_2attr_1inv    New
 #   \    ...    1000    1    2    1    6
 #   \    Go To    ${URL_STORE}/${blockstore_url${i}}/admin/product/create
 #   \    Store Add Product By Add Photo    fashion    robot_product1_7.jpg    ${blockstore_name${i}}${SPACE}-${SPACE}พร้อมส่ง 2 Attr. 3 Inv.    ${blockstore_name${i}}_2attr_3inv    New
 #   \    ...    1000    1    2    3    7
 #   \    Myacc Logout

   # : FOR    ${i}    IN RANGE    2    3
   # \    Go To    ${URL_PORTAL}
   # \    Go to Login    ${store_email${i}}    ${store_password${i}}
   # \    Go To    ${URL_STORE}/${store_url${i}}/admin/product/create
   # \    Store Add Product By Add Photo    electronic    robot_product${i}_1.jpg    ${store_name${i}}${SPACE}-${SPACE}พร้อมส่งสินค้าใหม่    ${store_name${i}}_instock_type_new
   # \    ...    New    5    1    0    0    1
   # \    Go To    ${URL_STORE}/${store_url${i}}/admin/product/create
   # \    Store Add Product By Add Photo    electronic    robot_product${i}_2.jpg    ${store_name${i}}${SPACE}-${SPACE}พร้อมส่งมือสอง    ${store_name${i}}_instock_type_use
   # \    ...    Use    500    1    0    0    2
   # \    Go To    ${URL_STORE}/${store_url${i}}/admin/product/create
   # \    Store Add Product By Add Photo    electronic    robot_product${i}_3.jpg    ${store_name${i}}${SPACE}-${SPACE}พร้อมส่งหนัก 1.5 kg    ${store_name${i}}_have_weight
   # \    ...    New    750    1.5    0    0    3
   # \    Go To    ${URL_STORE}/${store_url${i}}/admin/product/create
   # \    Store Add Product By Add Photo    electronic    robot_product${i}_4.jpg    ${store_name${i}}${SPACE}-${SPACE}พร้อมส่ง 1 Attr. 1 Inv.    ${store_name${i}}_1attr_1inv
   # \    ...    New    750    1    1    1    4
   # \    Go To    ${URL_STORE}/${store_url${i}}/admin/product/create
   # \    Store Add Product By Add Photo    electronic    robot_product${i}_5.jpg    ${store_name${i}}${SPACE}-${SPACE}พร้อมส่ง 1 Attr. 3 Inv.    ${store_name${i}}_1attr_3inv
   # \    ...    New    2    1    1    3    5
   # \    Go To    ${URL_STORE}/${store_url${i}}/admin/product/create
   # \    Store Add Product By Add Photo    fashion    robot_product${i}_6.jpg    ${store_name${i}}${SPACE}-${SPACE}พร้อมส่ง 2 Attr. 1 Inv.    ${store_name${i}}_2attr_1inv    New
   # \    ...    1000    1    2    1    6
   # \    Go To    ${URL_STORE}/${store_url${i}}/admin/product/create
   # \    Store Add Product By Add Photo    fashion    robot_product${i}_7.jpg    ${store_name${i}}${SPACE}-${SPACE}พร้อมส่ง 2 Attr. 3 Inv.    ${store_name${i}}_2attr_3inv    New
   # \    ...    1000    1    2    3    7
   # \    Go To    ${URL_STORE}/${store_url${i}}/admin/product/create
   # \    Store Add Product By Select Photo    fashion    robot_product${i}_1    ${store_name${i}}${SPACE}-${SPACE}สินค้า FlashSale 1    ${store_name${i}}_flashsale1
   # \    ...    New    500    1    0    0    8
   # \    Go To    ${URL_STORE}/${store_url${i}}/admin/product/create
   # \    Store Add Product By Select Photo    fashion    robot_product${i}_2    ${store_name${i}}${SPACE}-${SPACE}สินค้า FlashSale 1 มี Attr.    ${store_name${i}}_flashsale1_attr
   # \    ...    New    750    1    2    2    9
   # \    Go To    ${URL_STORE}/${store_url${i}}/admin/product/create
   # \    Store Add Product By Select Photo    fashion    robot_product${i}_3    ${store_name${i}}${SPACE}-${SPACE}สินค้า FlashSale 2    ${store_name${i}}_flashsale2
   # \    ...    New    500    1    0    0    10
   # \    Go To    ${URL_STORE}/${store_url${i}}/admin/product/create
   # \    Store Add Product By Select Photo    fashion    robot_product${i}_4    ${store_name${i}}${SPACE}-${SPACE}สินค้า FlashSale 2 มี Attr.    ${store_name${i}}_flashsale2_attr
   # \    ...    New    750    1    2    2    11
   # \    Go To    ${URL_STORE}/${store_url${i}}/admin/product/create
   # \    Store Add Product By Select Photo    fashion    robot_product${i}_5    ${store_name${i}}${SPACE}-${SPACE}สินค้า FlashSale 3    ${store_name${i}}_flashsale3
   # \    ...    New    500    1    0    0    12
   # \    Go To    ${URL_STORE}/${store_url${i}}/admin/product/create
   # \    Store Add Product By Select Photo    fashion    robot_product${i}_6    ${store_name${i}}${SPACE}-${SPACE}สินค้า FlashSale 3 มี Attr.    ${store_name${i}}_flashsale3_attr
   # \    ...    New    750    1    2    2    13
   # \    Go To    ${URL_STORE}/${store_url${i}}/admin/product/create
   # \    Store Add Product By Select Photo    fashion    robot_product${i}_1    ${store_name${i}}${SPACE}-${SPACE}สินค้า Join Campaign    ${store_name${i}}_join_camapign
   # \    ...    New    300    1    0    0    14
   # \    Go To    ${URL_STORE}/${store_url${i}}/admin/product/create
   # \    Store Add Product By Select Photo    fashion    robot_product${i}_2    ${store_name${i}}${SPACE}-${SPACE}สินค้า None Join Campaign    ${store_name${i}}_none_join_camapign
   # \    ...    New    500    1    0    0    15
   # \    Go To    ${URL_STORE}/${store_url${i}}/admin/product/create
   # \    Store Add Product By Select Photo    fashion    robot_product${i}_3    ${store_name${i}}${SPACE}-${SPACE}สินค้า Custom Campaign    ${store_name${i}}_custom_camapign
   # \    ...    New    300    1    0    0    16
   # \    Go To    ${URL_STORE}/${store_url${i}}/admin/product/create
   # \    Store Add Product By Select Photo    electronic    robot_product${i}_4    ${store_name${i}}${SPACE}-${SPACE}สินค้า Promotion Item Price    ${store_name${i}}_promotion_item_price
   # \    ...    New    200    1    0    0    17
   # \    Go To    ${URL_STORE}/${store_url${i}}/admin/product/create
   # \    Store Add Product By Select Photo    electronic    robot_product${i}_5    ${store_name${i}}${SPACE}-${SPACE}สินค้า Promotion Item Percent    ${store_name${i}}_promotion_item_percent
   # \    ...    New    500    1    0    0    18
   # \    Go To    ${URL_STORE}/${store_url${i}}/admin/product/create
   # \    Store Add Product By Select Photo    electronic    robot_product${i}_6    ${store_name${i}}${SPACE}-${SPACE}สินค้า Promotion Cart Price By Price    ${store_name${i}}_promotion_cart_price_by_price
   # \    ...    New    650    1    0    0    19
   # \    Go To    ${URL_STORE}/${store_url${i}}/admin/product/create
   # \    Store Add Product By Select Photo    electronic    robot_product${i}_7    ${store_name${i}}${SPACE}-${SPACE}สินค้า Promotion Cart Percent By Price    ${store_name${i}}_promotion_cart_percent_by_price
   # \    ...    New    750    1    0    0    20
   # \    Go To    ${URL_STORE}/${store_url${i}}/admin/product/create
   # \    Store Add Product By Select Photo    electronic    robot_product${i}_1    ${store_name${i}}${SPACE}-${SPACE}สินค้า Promotion Cart Price By QTY    ${store_name${i}}_promotion_cart_price_by_qty
   # \    ...    New    650    1    0    0    21
   # \    Go To    ${URL_STORE}/${store_url${i}}/admin/product/create
   # \    Store Add Product By Select Photo    electronic    robot_product${i}_2    ${store_name${i}}${SPACE}-${SPACE}สินค้า Promotion Cart Percent By QTY    ${store_name${i}}_promotion_cart_percent_by_qty
   # \    ...    New    750    1    0    0    22
   # \    Go To    ${URL_STORE}/${store_url${i}}/admin/product/create
   # \    Store Add Product By Select Photo    electronic    robot_product${i}_2    ${store_name${i}}${SPACE}-${SPACE}สินค้า preorder ใช้ stock 1 inv SoldOut    ${store_name${i}}_preorder_use_stock_soldout
   # \    ...    New    1000    1    0    0    23
   # \    Go To    ${URL_STORE}/${store_url${i}}/admin/product/create
   # \    Store Add Product By Select Photo    fashion    robot_product${i}_6    ${store_name${i}}${SPACE}-${SPACE}สินค้าทดสอบ Promotion Item    ${store_name${i}}_test_promotion_item
   # \    ...    New    100    1    0    0    24
   # \    Go To    ${URL_STORE}/${store_url${i}}/admin/product/create
   # \    Store Add Product By Select Photo    fashion    robot_product${i}_7    ${store_name${i}}${SPACE}-${SPACE}สินค้า Promotion & FlashSale    ${store_name${i}}_promotion_flashsale
   # \    ...    New    650    1    0    0    25
   # \    Go To    ${URL_STORE}/${store_url${i}}/admin/product/create
   # \    Store Add Product By Select Photo    fashion    robot_product${i}_1    ${store_name${i}}${SPACE}-${SPACE}สินค้า Seller Promotion    ${store_name${i}}_sellerpromotion
   # \    ...    New    650    1    0    0    26
   # \    Go To    ${URL_STORE}/${store_url${i}}/admin/product/create
   # \    Store Add Product By Select Photo    fashion    robot_product${i}_2    ${store_name${i}}${SPACE}-${SPACE}สินค้า Seller Promotion & FlashSale    ${store_name${i}}_sellerpromotion_flashsale
   # \    ...    New    650    1    0    0   27
   # \    Go To    ${URL_STORE}/${store_url${i}}/admin/product/create
   # \    Store Add Product By Select Photo    fashion    robot_product${i}_3    ${store_name${i}}${SPACE}-${SPACE}สินค้าราคาแพง    ${store_name${i}}_more_price
   # \    ...    New    10000    1    0    0    28
   # \    Go To    ${URL_STORE}/${store_url${i}}/admin/product/create
   # \    Store Add Product By Select Photo    fashion    robot_product${i}_4    ${store_name${i}}${SPACE}-${SPACE}สินค้า flashsale near soldout    ${store_name${i}}_less_qty
   # \    ...    New    500    1    0    0    29
   # \    Go To    ${URL_STORE}/${store_url${i}}/admin/product/create
   # \    Store Add Product By Select Photo    electronic    robot_product${i}_5    ${store_name${i}}${SPACE}-${SPACE}สินค้าทดสอบ Promotion By Cart1    ${store_name${i}}_test_promotion_cart1
   # \    ...    New    500    1    0    0    30
   # \    Go To    ${URL_STORE}/${store_url${i}}/admin/product/create
   # \    Store Add Product By Select Photo    electronic    robot_product${i}_6    ${store_name${i}}${SPACE}-${SPACE}สินค้าทดสอบ Promotion Item2    ${store_name${i}}_test_promotion_item2
   # \    ...    New    500    1    0    0    31
   # \    Myacc Logout

#    : FOR    ${i}    IN RANGE    2    3
#    \    Go To    ${URL_PORTAL}
#    \    Go to Login    ${wlsbuyer_store${i}}    ${wlsbuyer_password${i}}
#    \    Go To    ${URL_STORE}/${wlsbuyer_url${i}}/admin/product/create
#    \    Store Add Product By Add Photo    electronic    buyer_product${i}_1.jpg    ${wlsbuyer_name${i}}${SPACE}-${SPACE}พร้อมส่งสินค้าใหม่    ${wlsbuyer_name${i}}_instock_type_new
#    \    ...    New    5    1    0    0    1
#    \    Go To    ${URL_STORE}/${wlsbuyer_url${i}}/admin/product/create
#    \    Store Add Product By Add Photo    electronic    buyer_product${i}_2.jpg    ${wlsbuyer_name${i}}${SPACE}-${SPACE}พร้อมส่งมือสอง    ${wlsbuyer_name${i}}_instock_type_use
#    \    ...    Use    500    1    0    0    2
#    \    Go To    ${URL_STORE}/${wlsbuyer_url${i}}/admin/product/create
#    \    Store Add Product By Add Photo    electronic    buyer_product${i}_3.jpg    ${wlsbuyer_name${i}}${SPACE}-${SPACE}พร้อมส่งหนัก 1.5 kg    ${wlsbuyer_name${i}}_have_weight
#    \    ...    New    750    1.5    0    0    3
#    \    Go To    ${URL_STORE}/${wlsbuyer_url${i}}/admin/product/create
#    \    Store Add Product By Add Photo    electronic    buyer_product${i}_4.jpg    ${wlsbuyer_name${i}}${SPACE}-${SPACE}พร้อมส่ง 1 Attr. 1 Inv.    ${wlsbuyer_name${i}}_1attr_1inv
#    \    ...    New    750    1    1    1    4
#    \    Go To    ${URL_STORE}/${wlsbuyer_url${i}}/admin/product/create
#    \    Store Add Product By Add Photo    electronic    buyer_product${i}_5.jpg    ${wlsbuyer_name${i}}${SPACE}-${SPACE}พร้อมส่ง 1 Attr. 3 Inv.    ${wlsbuyer_name${i}}_1attr_3inv
#    \    ...    New    2    1    1    3    5
#    \    Go To    ${URL_STORE}/${wlsbuyer_url${i}}/admin/product/create
#    \    Store Add Product By Add Photo    fashion    buyer_product${i}_6.jpg    ${wlsbuyer_name${i}}${SPACE}-${SPACE}พร้อมส่ง 2 Attr. 1 Inv.    ${wlsbuyer_name${i}}_2attr_1inv    New
#    \    ...    1000    1    2    1    6
#    \    Go To    ${URL_STORE}/${wlsbuyer_url${i}}/admin/product/create
#    \    Store Add Product By Add Photo    fashion    buyer_product${i}_7.jpg    ${wlsbuyer_name${i}}${SPACE}-${SPACE}พร้อมส่ง 2 Attr. 3 Inv.    ${wlsbuyer_name${i}}_2attr_3inv    New
#    \    ...    1000    1    2    3    7
#    \    Go To    ${URL_STORE}/${wlsbuyer_url${i}}/admin/product/create
#    \    Store Add Product By Select Photo    fashion    buyer_product${i}_1    ${wlsbuyer_name${i}}${SPACE}-${SPACE}สินค้า FlashSale 1    ${wlsbuyer_name${i}}_flashsale1
#    \    ...    New    500    1    0    0    8
#    \    Go To    ${URL_STORE}/${wlsbuyer_url${i}}/admin/product/create
#    \    Store Add Product By Select Photo    fashion    buyer_product${i}_2    ${wlsbuyer_name${i}}${SPACE}-${SPACE}สินค้า FlashSale 1 มี Attr.    ${wlsbuyer_name${i}}_flashsale1_attr
#    \    ...    New    750    1    2    2    9
#    \    Go To    ${URL_STORE}/${wlsbuyer_url${i}}/admin/product/create
#    \    Store Add Product By Select Photo    fashion    buyer_product${i}_3    ${wlsbuyer_name${i}}${SPACE}-${SPACE}สินค้า FlashSale 2    ${wlsbuyer_name${i}}_flashsale2
#    \    ...    New    500    1    0    0    10
#    \    Go To    ${URL_STORE}/${wlsbuyer_url${i}}/admin/product/create
#    \    Store Add Product By Select Photo    fashion    buyer_product${i}_4    ${wlsbuyer_name${i}}${SPACE}-${SPACE}สินค้า FlashSale 2 มี Attr.    ${wlsbuyer_name${i}}_flashsale2_attr
#    \    ...    New    750    1    2    2    11
#    \    Go To    ${URL_STORE}/${wlsbuyer_url${i}}/admin/product/create
#    \    Store Add Product By Select Photo    fashion    buyer_product${i}_5    ${wlsbuyer_name${i}}${SPACE}-${SPACE}สินค้า FlashSale 3    ${wlsbuyer_name${i}}_flashsale3
#    \    ...    New    500    1    0    0    12
#    \    Go To    ${URL_STORE}/${wlsbuyer_url${i}}/admin/product/create
#    \    Store Add Product By Select Photo    fashion    buyer_product${i}_6    ${wlsbuyer_name${i}}${SPACE}-${SPACE}สินค้า FlashSale 3 มี Attr.    ${wlsbuyer_name${i}}_flashsale3_attr
#    \    ...    New    750    1    2    2    13
#    \    Go To    ${URL_STORE}/${wlsbuyer_url${i}}/admin/product/create
#    \    Store Add Product By Select Photo    fashion    buyer_product${i}_1    ${wlsbuyer_name${i}}${SPACE}-${SPACE}สินค้า Join Campaign    ${wlsbuyer_name${i}}_join_camapign
#    \    ...    New    300    1    0    0    14
#    \    Go To    ${URL_STORE}/${wlsbuyer_url${i}}/admin/product/create
#    \    Store Add Product By Select Photo    fashion    buyer_product${i}_2    ${wlsbuyer_name${i}}${SPACE}-${SPACE}สินค้า None Join Campaign    ${wlsbuyer_name${i}}_none_join_camapign
#    \    ...    New    500    1    0    0    15
#    \    Go To    ${URL_STORE}/${wlsbuyer_url${i}}/admin/product/create
#    \    Store Add Product By Select Photo    fashion    buyer_product${i}_3    ${wlsbuyer_name${i}}${SPACE}-${SPACE}สินค้า Custom Campaign    ${wlsbuyer_name${i}}_custom_camapign
#    \    ...    New    300    1    0    0    16
#    \    Go To    ${URL_STORE}/${wlsbuyer_url${i}}/admin/product/create
#    \    Store Add Product By Select Photo    electronic    buyer_product${i}_4    ${wlsbuyer_name${i}}${SPACE}-${SPACE}สินค้า Promotion Item Price    ${wlsbuyer_name${i}}_promotion_item_price
#    \    ...    New    200    1    0    0    17
#    \    Go To    ${URL_STORE}/${wlsbuyer_url${i}}/admin/product/create
#    \    Store Add Product By Select Photo    electronic    buyer_product${i}_5    ${wlsbuyer_name${i}}${SPACE}-${SPACE}สินค้า Promotion Item Percent    ${wlsbuyer_name${i}}_promotion_item_percent
#    \    ...    New    500    1    0    0    18
#    \    Go To    ${URL_STORE}/${wlsbuyer_url${i}}/admin/product/create
#    \    Store Add Product By Select Photo    electronic    buyer_product${i}_6    ${wlsbuyer_name${i}}${SPACE}-${SPACE}สินค้า Promotion Cart Price By Price    ${wlsbuyer_name${i}}_promotion_cart_price_by_price
#    \    ...    New    650    1    0    0    19
#    \    Go To    ${URL_STORE}/${wlsbuyer_url${i}}/admin/product/create
#    \    Store Add Product By Select Photo    electronic    buyer_product${i}_7    ${wlsbuyer_name${i}}${SPACE}-${SPACE}สินค้า Promotion Cart Percent By Price    ${wlsbuyer_name${i}}_promotion_cart_percent_by_price
#    \    ...    New    750    1    0    0    20
#    \    Go To    ${URL_STORE}/${wlsbuyer_url${i}}/admin/product/create
#    \    Store Add Product By Select Photo    electronic    buyer_product${i}_1    ${wlsbuyer_name${i}}${SPACE}-${SPACE}สินค้า Promotion Cart Price By QTY    ${wlsbuyer_name${i}}_promotion_cart_price_by_qty
#    \    ...    New    650    1    0    0    21
#    \    Go To    ${URL_STORE}/${wlsbuyer_url${i}}/admin/product/create
#    \    Store Add Product By Select Photo    electronic    buyer_product${i}_2    ${wlsbuyer_name${i}}${SPACE}-${SPACE}สินค้า Promotion Cart Percent By QTY    ${wlsbuyer_name${i}}_promotion_cart_percent_by_qty
#    \    ...    New    750    1    0    0    22
#    \    Go To    ${URL_STORE}/${wlsbuyer_url${i}}/admin/product/create
#    \    Store Add Product By Select Photo    electronic    buyer_product${i}_2    ${wlsbuyer_name${i}}${SPACE}-${SPACE}สินค้า preorder ใช้ stock 1 inv SoldOut    ${wlsbuyer_name${i}}_preorder_use_stock_soldout
#    \    ...    New    1000    1    0    0    23
#    \    Go To    ${URL_STORE}/${wlsbuyer_url${i}}/admin/product/create
#    \    Store Add Product By Select Photo    fashion    buyer_product${i}_6    ${wlsbuyer_name${i}}${SPACE}-${SPACE}สินค้าทดสอบ Promotion Item    ${wlsbuyer_name${i}}_test_promotion_item
#    \    ...    New    100    1    0    0    24
#    \    Go To    ${URL_STORE}/${wlsbuyer_url${i}}/admin/product/create
#    \    Store Add Product By Select Photo    fashion    buyer_product${i}_7    ${wlsbuyer_name${i}}${SPACE}-${SPACE}สินค้า Promotion & FlashSale    ${wlsbuyer_name${i}}_promotion_flashsale
#    \    ...    New    650    1    0    0    25
#    \    Go To    ${URL_STORE}/${wlsbuyer_url${i}}/admin/product/create
#    \    Store Add Product By Select Photo    fashion    buyer_product${i}_1    ${wlsbuyer_name${i}}${SPACE}-${SPACE}สินค้า Seller Promotion    ${wlsbuyer_name${i}}_sellerpromotion
#    \    ...    New    650    1    0    0    26
#    \    Go To    ${URL_STORE}/${wlsbuyer_url${i}}/admin/product/create
#    \    Store Add Product By Select Photo    fashion    buyer_product${i}_2    ${wlsbuyer_name${i}}${SPACE}-${SPACE}สินค้า Seller Promotion & FlashSale    ${wlsbuyer_name${i}}_sellerpromotion_flashsale
#    \    ...    New    650    1    0    0   27
#    \    Go To    ${URL_STORE}/${wlsbuyer_url${i}}/admin/product/create
#    \    Store Add Product By Select Photo    fashion    buyer_product${i}_3    ${wlsbuyer_name${i}}${SPACE}-${SPACE}สินค้าราคาแพง    ${wlsbuyer_name${i}}_more_price
#    \    ...    New    10000    1    0    0    28
#    \    Go To    ${URL_STORE}/${wlsbuyer_url${i}}/admin/product/create
#    \    Store Add Product By Select Photo    fashion    buyer_product${i}_4    ${wlsbuyer_name${i}}${SPACE}-${SPACE}สินค้า flashsale near soldout    ${wlsbuyer_name${i}}_less_qty
#    \    ...    New    500    1    0    0    29
#    \    Go To    ${URL_STORE}/${wlsbuyer_url${i}}/admin/product/create
#    \    Store Add Product By Select Photo    electronic    buyer_product${i}_5    ${wlsbuyer_name${i}}${SPACE}-${SPACE}สินค้าทดสอบ Promotion By Cart1    ${wlsbuyer_name${i}}_test_promotion_cart1
#    \    ...    New    500    1    0    0    30
#    \    Go To    ${URL_STORE}/${wlsbuyer_url${i}}/admin/product/create
#    \    Store Add Product By Select Photo    electronic    buyer_product${i}_6    ${wlsbuyer_name${i}}${SPACE}-${SPACE}สินค้าทดสอบ Promotion Item2    ${wlsbuyer_name${i}}_test_promotion_item2
#    \    ...    New    500    1    0    0    31
#    \    Myacc Logout

# TC_Join_Campaign
#     [Tags]    join
#     WMS Switch Project    wm
#     Go to    ${URL_WMS}/campaign
#     Click Element    //button[@class='btn btn-sm btn-info btn-join-campaign' and contains(text(),'+ Join Campaign')]
#     Sleep    1s
#     Click Element    //button[contains(text(),'+ สินค้าราคาเดียว และ แบบช่วงราคา')]
#     Sleep    1s
#     Execute Javascript    $('#campaign_name_th').val('[QA-Automation] Join Campaign');
#     Choose File    id=file_banner    ${CURDIR}/Images/join_banner.jpg
#     Choose File    id=file_topbanner    ${CURDIR}/Images/join_top_banner.jpg
#     Choose File    id=file_bannermobile    ${CURDIR}/Images/join_banner.jpg
#     Execute Javascript    $("input[name='discount_type']")[1].click()
#     Sleep    0.5s
#     Input Text    //input[@id='promotion_amount']    1
#     Input Text    //input[@id='promotion_amount_end']    1000
#     Execute Javascript    $('#date_join_campaign').val('01/01/2016 00:00 - 31/12/2020 23:59');
#     Execute Javascript    $('#date_show_campaign').val('01/01/2016 00:00 - 31/12/2020 23:59');
#     Select Frame    id=description_th_ifr
#     Input Text    //body[@id='tinymce']    Join Campaign create by robot script !!
#     Unselect Frame
#     Execute Javascript    $("input[name='product_limit']")[0].click()
#     Sleep    0.5s
#     Input Text    //input[@id='min_quantity']    1
#     Execute Javascript    $("input[name='order_product']")[1].click()
#     Input Text    //input[@id='slug_th']    qa-robot-join
#     Execute Javascript    $('form').submit();
#     Sleep    3s
#     ${campaign_id}=    Execute Javascript    return $('.table > tbody > tr')[0].id
#     ${campaign_id}=    Remove String    ${campaign_id}    row-
#     Write Variable to File    join_campaign_id    ${campaign_id}
#     WMS Select Product to Campaign    join    ${campaign_id}    ${robot_stg_store1_join_camapign}    9
#     WMS Select Product to Campaign    join    ${campaign_id}    ${robot_stg_store2_join_camapign}    9

# TC_Join_Campaign_EmptyProduct
#     [Tags]    join
#     WMS Switch Project    wm
#     Go to    ${URL_WMS}/campaign
#     Click Element    //button[@class='btn btn-sm btn-info btn-join-campaign' and contains(text(),'+ Join Campaign')]
#     Sleep    1s
#     Click Element    //button[contains(text(),'+ สินค้าราคาเดียว และ แบบช่วงราคา')]
#     Sleep    1s
#     Execute Javascript    $('#campaign_name_th').val('[QA-Automation] Join Campaign Empty Product');
#     Choose File    id=file_banner    ${CURDIR}/Images/join_banner.jpg
#     Choose File    id=file_topbanner    ${CURDIR}/Images/join_top_banner.jpg
#     Choose File    id=file_bannermobile    ${CURDIR}/Images/join_banner.jpg
#     Execute Javascript    $("input[name='discount_type']")[1].click()
#     Sleep    0.5s
#     Input Text    //input[@id='promotion_amount']    1
#     Input Text    //input[@id='promotion_amount_end']    1000
#     Execute Javascript    $('#date_join_campaign').val('01/01/2016 00:00 - 31/12/2020 23:59');
#     Execute Javascript    $('#date_show_campaign').val('01/01/2016 00:00 - 31/12/2020 23:59');
#     Select Frame    id=description_th_ifr
#     Input Text    //body[@id='tinymce']    Join Campaign create by robot script !!
#     Unselect Frame
#     Execute Javascript    $("input[name='product_limit']")[0].click()
#     Sleep    0.5s
#     Input Text    //input[@id='min_quantity']    1
#     Execute Javascript    $("input[name='order_product']")[1].click()
#     Input Text    //input[@id='slug_th']    qa-robot-join-empty
#     Execute Javascript    $('form').submit();
#     Sleep    3s
#     ${campaign_id}=    Execute Javascript    return $('.table > tbody > tr')[0].id
#     ${campaign_id}=    Remove String    ${campaign_id}    row-
#     Write Variable to File    empty_join_campaign_id    ${campaign_id}

# TC_Join_Campaign_Expired
#     [Tags]    join
#     WMS Switch Project    wm
#     Go to    ${URL_WMS}/campaign
#     Click Element    //button[@class='btn btn-sm btn-info btn-join-campaign' and contains(text(),'+ Join Campaign')]
#     Sleep    1s
#     Click Element    //button[contains(text(),'+ สินค้าราคาเดียว และ แบบช่วงราคา')]
#     Sleep    1s
#     Execute Javascript    $('#campaign_name_th').val('[QA-Automation] Join Campaign Expired');
#     Choose File    id=file_banner    ${CURDIR}/Images/join_banner.jpg
#     Choose File    id=file_topbanner    ${CURDIR}/Images/join_top_banner.jpg
#     Choose File    id=file_bannermobile    ${CURDIR}/Images/join_banner.jpg
#     Execute Javascript    $("input[name='discount_type']")[1].click()
#     Sleep    0.5s
#     Input Text    //input[@id='promotion_amount']    1
#     Input Text    //input[@id='promotion_amount_end']    1000
#     Execute Javascript    $('#date_join_campaign').val('01/01/2015 00:00 - 31/12/2015 23:59');
#     Execute Javascript    $('#date_show_campaign').val('01/01/2015 00:00 - 31/12/2015 23:59');
#     Select Frame    id=description_th_ifr
#     Input Text    //body[@id='tinymce']    Join Campaign create by robot script !!
#     Unselect Frame
#     Execute Javascript    $("input[name='product_limit']")[0].click()
#     Sleep    0.5s
#     Input Text    //input[@id='min_quantity']    1
#     Execute Javascript    $("input[name='order_product']")[1].click()
#     Input Text    //input[@id='slug_th']    qa-robot-join-expired
#     Execute Javascript    $('form').submit();
#     Sleep    3s
#     ${campaign_id}=    Execute Javascript    return $('.table > tbody > tr')[0].id
#     ${campaign_id}=    Remove String    ${campaign_id}    row-
#     Write Variable to File    expired_join_campaign_id    ${campaign_id}

# TC_NonJoin_Campaign
#     [Tags]    nonjoin
#     WMS Switch Project    wm
#     Go to    ${URL_WMS}/campaign
#     Click Element    //button[@class='btn btn-sm btn-info' and contains(text(),'+ Non Join Campaign')]
#     Sleep    1s
#     Execute Javascript    $('#campaign_name_th').val('[QA-Automation] Non Join Campaign');
#     Choose File    id=file_banner    ${CURDIR}/Images/none_join_banner.jpg
#     Choose File    id=file_topbanner    ${CURDIR}/Images/join_top_banner.jpg
#     Choose File    id=file_bannermobile    ${CURDIR}/Images/none_join_banner.jpg
#     Execute Javascript    $('#date_show_campaign').val('01/01/2016 00:00 - 31/12/2020 23:59');
#     Select Frame    id=description_th_ifr
#     Input Text    //body[@id='tinymce']    Non Join Campaign create by robot script !!
#     Unselect Frame
#     Execute Javascript    $("input[name='order_product']")[1].click()
#     Input Text    //input[@id='slug_th']    qa-robot-non-join
#     Execute Javascript    $('form').submit();
#     Sleep    3s
#     ${campaign_id}=    Execute Javascript    return $('.table > tbody > tr')[0].id
#     ${campaign_id}=    Remove String    ${campaign_id}    row-
#     Write Variable to File    none_join_campaign_id    ${campaign_id}
#     WMS Select Product to Campaign    non-join    ${campaign_id}    ${robot_stg_store1_none_join_camapign}    9
#     WMS Select Product to Campaign    non-join    ${campaign_id}    ${robot_stg_store2_none_join_camapign}    9

# TC_NonJoin_Campaign_EmptyProduct
#     [Tags]    nonjoin
#     WMS Switch Project    wm
#     Go to    ${URL_WMS}/campaign
#     Click Element    //button[@class='btn btn-sm btn-info' and contains(text(),'+ Non Join Campaign')]
#     Sleep    1s
#     Execute Javascript    $('#campaign_name_th').val('[QA-Automation] Non Join Campaign Empty Product');
#     Choose File    id=file_banner    ${CURDIR}/Images/none_join_banner.jpg
#     Choose File    id=file_topbanner    ${CURDIR}/Images/join_top_banner.jpg
#     Choose File    id=file_bannermobile    ${CURDIR}/Images/none_join_banner.jpg
#     Execute Javascript    $('#date_show_campaign').val('01/01/2016 00:00 - 31/12/2020 23:59');
#     Select Frame    id=description_th_ifr
#     Input Text    //body[@id='tinymce']    Non Join Campaign create by robot script !!
#     Unselect Frame
#     Execute Javascript    $("input[name='order_product']")[1].click()
#     Input Text    //input[@id='slug_th']    qa-robot-non-join
#     Execute Javascript    $('form').submit();
#     Sleep    3s
#     ${campaign_id}=    Execute Javascript    return $('.table > tbody > tr')[0].id
#     ${campaign_id}=    Remove String    ${campaign_id}    row-
#     Write Variable to File    empty_none_join_campaign_id    ${campaign_id}

# TC_NonJoin_Campaign_Expired
#     [Tags]    nonjoin
#     WMS Switch Project    wm
#     Go to    ${URL_WMS}/campaign
#     Click Element    //button[@class='btn btn-sm btn-info' and contains(text(),'+ Non Join Campaign')]
#     Sleep    1s
#     Execute Javascript    $('#campaign_name_th').val('[QA-Automation] Non Join Campaign Expired');
#     Choose File    id=file_banner    ${CURDIR}/Images/none_join_banner.jpg
#     Choose File    id=file_topbanner    ${CURDIR}/Images/join_top_banner.jpg
#     Choose File    id=file_bannermobile    ${CURDIR}/Images/none_join_banner.jpg
#     Execute Javascript    $('#date_show_campaign').val('01/01/2016 00:00 - 31/12/2015 23:59');
#     Select Frame    id=description_th_ifr
#     Input Text    //body[@id='tinymce']    Non Join Campaign create by robot script !!
#     Unselect Frame
#     Execute Javascript    $("input[name='order_product']")[1].click()
#     Input Text    //input[@id='slug_th']    qa-robot-non-join
#     Execute Javascript    $('form').submit();
#     Sleep    3s
#     ${campaign_id}=    Execute Javascript    return $('.table > tbody > tr')[0].id
#     ${campaign_id}=    Remove String    ${campaign_id}    row-
#     Write Variable to File    expired_none_join_campaign_id    ${campaign_id}

# TC_PromotionItem_FixPrice
#     [Tags]    promotion_item
#     WMS Switch Project    wm
#     Go to    ${URL_WMS}/campaign
#     Click Element    //button[@class='btn btn-sm btn-info' and contains(text(),'+ WLS Promotion')]
#     Sleep    1s
#     Execute Javascript    $('#campaign_name_th').val('[QA-Automation] WLS Promotion by Item Fix Price');
#     Log    ${CURDIR}
#     ${IMG_DIR}=    Replace String Using Regexp    ${CURDIR}    TestCase$    Image
#     ${CUR_IMG_DIR}=    Remove String    ${IMG_DIR}    ${/}TestCase${/}Common/PrepareData
#     ${file_join_banner}=    Catenate    SEPARATOR=${/}    ${CUR_IMG_DIR}${/}Resource/${BU}${/}Image    promotion_itemprice_banner.jpg
#     ${file_join_top_banner}=    Catenate    SEPARATOR=${/}    ${CUR_IMG_DIR}${/}Resource/${BU}${/}Image    join_top_banner.jpg
#     ${file_join_bannermobile}=    Catenate    SEPARATOR=${/}    ${CUR_IMG_DIR}${/}Resource/${BU}${/}Image    promotion_itemprice_banner.jpg
#     Choose File    id=file_banner    ${file_join_banner}
#     Choose File    id=file_topbanner    ${file_join_top_banner}
#     Choose File    id=file_bannermobile    ${file_join_bannermobile}
#     Execute Javascript    $('#date_join_campaign').val('01/01/2016 00:00 - 31/12/2020 23:59');
#     Execute Javascript    $('#date_show_campaign').val('01/01/2016 00:00 - 31/12/2020 23:59');
#     Select From List By Label    discount_type    กำหนดราคา (บาท)
#     Input Text    //input[@id='discount_value']    99
#     Select Frame    id=description_th_ifr
#     Input Text    //body[@id='tinymce']    Promotion by Item Fix Price create by robot script !!
#     Unselect Frame
#     Input Text    //input[@id='min_quantity']    1
#     Input Text    //input[@id='slug_th']    qa-robot-promotion-itemfix
#     Execute Javascript    $("input[name='order_product']")[1].click()
#     Execute Javascript    $('form').submit();
#     Sleep    3s
#     ${campaign_id}=    Execute Javascript    return $('.table > tbody > tr')[0].id
#     ${campaign_id}=    Remove String    ${campaign_id}    row-
#     Write Variable to File    promotion_item_fixprice_id    ${campaign_id}
#     WMS Select Product to Campaign    promotion    ${campaign_id}    ${robot_stg_store1_promotion_item_price}    9
#     WMS Select Product to Campaign    promotion    ${campaign_id}    ${robot_stg_store2_promotion_item_price}    9

# TC_PromotionItem_DiscountPercent
#     [Tags]    promotion_item
#     WMS Switch Project    wm
#     Go to    ${URL_WMS}/campaign
#     Click Element    //button[@class='btn btn-sm btn-info' and contains(text(),'+ WLS Promotion')]
#     Sleep    1s
#     Execute Javascript    $('#campaign_name_th').val('[QA-Automation] WLS Promotion by Item Percent Discount');
#     ${IMG_DIR}=    Replace String Using Regexp    ${CURDIR}    TestCase$    Image
#     ${CUR_IMG_DIR}=    Remove String    ${IMG_DIR}    ${/}TestCase${/}Common/PrepareData
#     ${file_join_banner}=    Catenate    SEPARATOR=${/}    ${CUR_IMG_DIR}${/}Resource/${BU}${/}Image    promotion_itemprecent_banner.jpg
#     ${file_join_top_banner}=    Catenate    SEPARATOR=${/}    ${CUR_IMG_DIR}${/}Resource/${BU}${/}Image    join_top_banner.jpg
#     ${file_join_bannermobile}=    Catenate    SEPARATOR=${/}    ${CUR_IMG_DIR}${/}Resource/${BU}${/}Image    promotion_itemprecent_banner.jpg
#     Choose File    id=file_banner    ${file_join_banner}
#     Choose File    id=file_topbanner    ${file_join_top_banner}
#     Choose File    id=file_bannermobile    ${file_join_bannermobile}
#     Execute Javascript    $('#date_join_campaign').val('01/01/2016 00:00 - 31/12/2020 23:59');
#     Execute Javascript    $('#date_show_campaign').val('01/01/2016 00:00 - 31/12/2020 23:59');
#     Select From List By Label    discount_type    เปอร์เซ็นต์ส่วนลด (%)
#     Input Text    //input[@id='discount_value']    20
#     Input Text    //input[@id='discount_max']    200
#     Select Frame    id=description_th_ifr
#     Input Text    //body[@id='tinymce']    Promotion by Item Percent Discount create by robot script !!
#     Unselect Frame
#     Input Text    //input[@id='min_quantity']    1
#     Input Text    //input[@id='slug_th']    qa-robot-promotion-itempercent
#     Execute Javascript    $("input[name='order_product']")[1].click()
#     Execute Javascript    $('form').submit();
#     Sleep    3s
#     ${campaign_id}=    Execute Javascript    return $('.table > tbody > tr')[0].id
#     ${campaign_id}=    Remove String    ${campaign_id}    row-
#     Write Variable to File    promotion_item_percent_id    ${campaign_id}
#     WMS Select Product to Campaign    promotion    ${campaign_id}    ${robot_stg_store1_promotion_item_percent}    9
#     WMS Select Product to Campaign    promotion    ${campaign_id}    ${robot_stg_store2_promotion_item_percent}    9

# TC_PromotionCart_PriceDiscountPrice
#     [Tags]    promotion_cart
#     WMS Switch Project    wm
#     Go to    ${URL_WMS}/campaign
#     Click Element    //button[@class='btn btn-sm btn-info' and contains(text(),'+ WLS Promotion')]
#     Sleep    1s
#     Execute Javascript    $('#campaign_name_th').val('[QA-Automation] WLS Promotion by Cart [ซื้อครบ xx บาท ลด yy บาท]');
#     ${IMG_DIR}=    Replace String Using Regexp    ${CURDIR}    TestCase$    Image
#     ${CUR_IMG_DIR}=    Remove String    ${IMG_DIR}    ${/}TestCase${/}Common/PrepareData
#     ${file_join_banner}=    Catenate    SEPARATOR=${/}    ${CUR_IMG_DIR}${/}Resource/${BU}${/}Image    promotion_cartb2b_banner.jpg
#     ${file_join_top_banner}=    Catenate    SEPARATOR=${/}    ${CUR_IMG_DIR}${/}Resource/${BU}${/}Image    join_top_banner.jpg
#     ${file_join_bannermobile}=    Catenate    SEPARATOR=${/}    ${CUR_IMG_DIR}${/}Resource/${BU}${/}Image    promotion_cartb2b_banner.jpg
#     Choose File    id=file_banner    ${file_join_banner}
#     Choose File    id=file_topbanner    ${file_join_top_banner}
#     Choose File    id=file_bannermobile    ${file_join_bannermobile}
#     Execute Javascript    $('#date_join_campaign').val('01/01/2016 00:00 - 31/12/2020 23:59');
#     Execute Javascript    $('#date_show_campaign').val('01/01/2016 00:00 - 31/12/2020 23:59');
#     Execute Javascript    $("input[name='promotion_type']")[1].click()
#     Select Frame    id=description_th_ifr
#     Input Text    //body[@id='tinymce']    WLS Promotion by Cart [ซื้อครบ xx บาท ลด yy บาท] create by robot script !!
#     Unselect Frame
#     Input Text    //input[@id='min_quantity']    1
#     Select From List By Label    discount_type    ราคาส่วนลด (บาท)
#     Sleep    1s
#     Select From List By Label    promotion_pattern    บาท
#     Sleep    1
#     Select From List By Label    condition_range[0]    ถึง
#     Sleep    1
#     Execute Javascript    $("input[name='conditions[0][min]']").val('1000')
#     Execute Javascript    $("input[name='conditions[0][max]']").val('2000')
#     Execute Javascript    $("input[name='conditions[0][discount_value]']").val('200')
#     Click Element    //button[@class='btn btn-sm btn-primary btn_addmoreprice']
#     Execute Javascript    $("input[name='conditions[1][min]']").val('2001')
#     Execute Javascript    $("input[name='conditions[1][discount_value]']").val('500')
#     Input Text    //input[@id='slug_th']    qa-robot-promotion-cart-price-price
#     Execute Javascript    $("input[name='order_product']")[1].click()
#     Execute Javascript    $('form').submit();
#     Sleep    3s
#     ${campaign_id}=    Execute Javascript    return $('.table > tbody > tr')[0].id
#     ${campaign_id}=    Remove String    ${campaign_id}    row-
#     Write Variable to File    promotion_cart_price_by_price_id    ${campaign_id}
#     WMS Select Product to Campaign    promotion    ${campaign_id}    ${robot_store1_promotion_cart_price_by_price}    9
#     WMS Select Product to Campaign    promotion    ${campaign_id}    ${robot_stg_store2_promotion_cart_price_by_price}    9

# TC_PromotionCart_PriceDiscountPercent
#     [Tags]    promotion_cart
#     WMS Switch Project    wm
#     Go to    ${URL_WMS}/campaign
#     Click Element    //button[@class='btn btn-sm btn-info' and contains(text(),'+ WLS Promotion')]
#     Sleep    1s
#     Execute Javascript    $('#campaign_name_th').val('[QA-Automation] WLS Promotion by Cart [ซื้อครบ xx บาท ลด yy %]');
#     ${IMG_DIR}=    Replace String Using Regexp    ${CURDIR}    TestCase$    Image
#     ${CUR_IMG_DIR}=    Remove String    ${IMG_DIR}    ${/}TestCase${/}Common/PrepareData
#     ${file_join_banner}=    Catenate    SEPARATOR=${/}    ${CUR_IMG_DIR}${/}Resource/${BU}${/}Image    promotion_cartb2b_banner.jpg
#     ${file_join_top_banner}=    Catenate    SEPARATOR=${/}    ${CUR_IMG_DIR}${/}Resource/${BU}${/}Image    join_top_banner.jpg
#     ${file_join_bannermobile}=    Catenate    SEPARATOR=${/}    ${CUR_IMG_DIR}${/}Resource/${BU}${/}Image    promotion_cartb2b_banner.jpg
#     Choose File    id=file_banner    ${file_join_banner}
#     Choose File    id=file_topbanner    ${file_join_top_banner}
#     Choose File    id=file_bannermobile    ${file_join_bannermobile}
#     Execute Javascript    $('#date_join_campaign').val('01/01/2016 00:00 - 31/12/2020 23:59');
#     Execute Javascript    $('#date_show_campaign').val('01/01/2016 00:00 - 31/12/2020 23:59');
#     Execute Javascript    $("input[name='promotion_type']")[1].click()
#     Select Frame    id=description_th_ifr
#     Input Text    //body[@id='tinymce']    WLS Promotion by Cart [ซื้อครบ xx บาท ลด yy %] create by robot script !!
#     Unselect Frame
#     Input Text    //input[@id='min_quantity']    1
#     Select From List By Label    promotion_pattern    บาท
#     Sleep    1
#     Select From List By Label    condition_range[0]    ถึง
#     Sleep    1
#     Execute Javascript    $("input[name='conditions[0][min]']").val('1000')
#     Execute Javascript    $("input[name='conditions[0][max]']").val('2000')
#     Execute Javascript    $("input[name='conditions[0][discount_value]']").val('10')
#     Execute Javascript    $("input[name='conditions[0][discount_max]']").val('200')
#     Click Element    //button[@class='btn btn-sm btn-primary btn_addmoreprice']
#     Execute Javascript    $("input[name='conditions[1][min]']").val('2001')
#     Execute Javascript    $("input[name='conditions[1][discount_value]']").val('30')
#     Execute Javascript    $("input[name='conditions[1][discount_max]']").val('500')
#     Input Text    //input[@id='slug_th']    qa-robot-promotion-cart-price-percent
#     Execute Javascript    $("input[name='order_product']")[1].click()
#     Execute Javascript    $('form').submit();
#     Sleep    3s
#     ${campaign_id}=    Execute Javascript    return $('.table > tbody > tr')[0].id
#     ${campaign_id}=    Remove String    ${campaign_id}    row-
#     Write Variable to File    promotion_cart_percent_by_price_id    ${campaign_id}
#     WMS Select Product to Campaign    promotion    ${campaign_id}    ${robot_store1_promotion_cart_percent_by_price}    9
#     WMS Select Product to Campaign    promotion    ${campaign_id}    ${robot_stg_store2_promotion_cart_percent_by_price}    9

# TC_PromotionCart_QtyDiscountPrice
#     [Tags]    promotion_cart
#     WMS Switch Project    wm
#     Go to    ${URL_WMS}/campaign
#     Click Element    //button[@class='btn btn-sm btn-info' and contains(text(),'+ WLS Promotion')]
#     Sleep    1s
#     Execute Javascript    $('#campaign_name_th').val('[QA-Automation] WLS Promotion by Cart [ซื้อครบ xx ชิ้น ลด yy บาท]');
#     ${IMG_DIR}=    Replace String Using Regexp    ${CURDIR}    TestCase$    Image
#     ${CUR_IMG_DIR}=    Remove String    ${IMG_DIR}    ${/}TestCase${/}Common/PrepareData
#     ${file_join_banner}=    Catenate    SEPARATOR=${/}    ${CUR_IMG_DIR}${/}Resource/${BU}${/}Image    promotion_cartb2b_banner.jpg
#     ${file_join_top_banner}=    Catenate    SEPARATOR=${/}    ${CUR_IMG_DIR}${/}Resource/${BU}${/}Image    join_top_banner.jpg
#     ${file_join_bannermobile}=    Catenate    SEPARATOR=${/}    ${CUR_IMG_DIR}${/}Resource/${BU}${/}Image    promotion_cartb2b_banner.jpg
#     Choose File    id=file_banner    ${file_join_banner}
#     Choose File    id=file_topbanner    ${file_join_top_banner}
#     Choose File    id=file_bannermobile    ${file_join_bannermobile}
#     Execute Javascript    $('#date_join_campaign').val('01/01/2016 00:00 - 31/12/2020 23:59');
#     Execute Javascript    $('#date_show_campaign').val('01/01/2016 00:00 - 31/12/2020 23:59');
#     Execute Javascript    $("input[name='promotion_type']")[1].click()
#     Select Frame    id=description_th_ifr
#     Input Text    //body[@id='tinymce']    WLS Promotion by Cart [ซื้อครบ xx ชิ้น ลด yy บาท] create by robot script !!
#     Unselect Frame
#     Input Text    //input[@id='min_quantity']    1
#     Select From List By Label    discount_type    ราคาส่วนลด (บาท)
#     Sleep    1s
#     Select From List By Label    promotion_pattern    ชิ้น
#     Sleep    1
#     Select From List By Label    condition_range[0]    ถึง
#     Sleep    1
#     Execute Javascript    $("input[name='conditions[0][min]']").val('3')
#     Execute Javascript    $("input[name='conditions[0][max]']").val('5')
#     Execute Javascript    $("input[name='conditions[0][discount_value]']").val('200')
#     Click Element    //button[@class='btn btn-sm btn-primary btn_addmoreprice']
#     Execute Javascript    $("input[name='conditions[1][min]']").val('6')
#     Execute Javascript    $("input[name='conditions[1][discount_value]']").val('350')
#     Input Text    //input[@id='slug_th']    qa-robot-promotion-cart-qty-price
#     Execute Javascript    $("input[name='order_product']")[1].click()
#     Execute Javascript    $('form').submit();
#     Sleep    3s
#     ${campaign_id}=    Execute Javascript    return $('.table > tbody > tr')[0].id
#     ${campaign_id}=    Remove String    ${campaign_id}    row-
#     Write Variable to File    promotion_cart_price_by_qty_id    ${campaign_id}
#     WMS Select Product to Campaign    promotion    ${campaign_id}    ${robot_store1_promotion_cart_price_by_qty}    9
#     WMS Select Product to Campaign    promotion    ${campaign_id}    ${robot_stg_store2_promotion_cart_price_by_qty}    9

# TC_PromotionCart_QtyDiscountPercent
#     [Tags]    promotion_cart
#     WMS Switch Project    wm
#     Go to    ${URL_WMS}/campaign
#     Click Element    //button[@class='btn btn-sm btn-info' and contains(text(),'+ WLS Promotion')]
#     Sleep    1s
#     Execute Javascript    $('#campaign_name_th').val('[QA-Automation] WLS Promotion by Cart [ซื้อครบ xx ชิ้น ลด yy %]');
#     ${IMG_DIR}=    Replace String Using Regexp    ${CURDIR}    TestCase$    Image
#     ${CUR_IMG_DIR}=    Remove String    ${IMG_DIR}    ${/}TestCase${/}Common/PrepareData
#     ${file_join_banner}=    Catenate    SEPARATOR=${/}    ${CUR_IMG_DIR}${/}Resource/${BU}${/}Image    promotion_cartb2b_banner.jpg
#     ${file_join_top_banner}=    Catenate    SEPARATOR=${/}    ${CUR_IMG_DIR}${/}Resource/${BU}${/}Image    join_top_banner.jpg
#     ${file_join_bannermobile}=    Catenate    SEPARATOR=${/}    ${CUR_IMG_DIR}${/}Resource/${BU}${/}Image    promotion_cartb2b_banner.jpg
#     Choose File    id=file_banner    ${file_join_banner}
#     Choose File    id=file_topbanner    ${file_join_top_banner}
#     Choose File    id=file_bannermobile    ${file_join_bannermobile}
#     Execute Javascript    $('#date_join_campaign').val('01/01/2016 00:00 - 31/12/2020 23:59');
#     Execute Javascript    $('#date_show_campaign').val('01/01/2016 00:00 - 31/12/2020 23:59');
#     Execute Javascript    $("input[name='promotion_type']")[1].click()
#     Select Frame    id=description_th_ifr
#     Input Text    //body[@id='tinymce']    WLS Promotion by Cart [ซื้อครบ xx ชิ้น ลด yy %] create by robot script !!
#     Unselect Frame
#     Input Text    //input[@id='min_quantity']    1
#     Select From List By Label    promotion_pattern    ชิ้น
#     Sleep    1
#     Select From List By Label    condition_range[0]    ถึง
#     Sleep    1
#     Execute Javascript    $("input[name='conditions[0][min]']").val('3')
#     Execute Javascript    $("input[name='conditions[0][max]']").val('5')
#     Execute Javascript    $("input[name='conditions[0][discount_value]']").val('10')
#     Execute Javascript    $("input[name='conditions[0][discount_max]']").val('200')
#     Click Element    //button[@class='btn btn-sm btn-primary btn_addmoreprice']
#     Execute Javascript    $("input[name='conditions[1][min]']").val('6')
#     Execute Javascript    $("input[name='conditions[1][discount_value]']").val('20')
#     Execute Javascript    $("input[name='conditions[1][discount_max]']").val('300')
#     Input Text    //input[@id='slug_th']    qa-robot-promotion-cart-qty-percent
#     Execute Javascript    $("input[name='order_product']")[1].click()
#     Execute Javascript    $('form').submit();
#     Sleep    3s
#     ${campaign_id}=    Execute Javascript    return $('.table > tbody > tr')[0].id
#     ${campaign_id}=    Remove String    ${campaign_id}    row-
#     Write Variable to File    promotion_cart_percent_by_qty_id    ${campaign_id}
#     WMS Select Product to Campaign    promotion    ${campaign_id}    ${robot_store1_promotion_cart_percent_by_qty}    9
#     WMS Select Product to Campaign    promotion    ${campaign_id}    ${robot_stg_store2_promotion_cart_percent_by_qty}    9

# TC_PromotionItem_FixPriceEdit
#     [Tags]    promotion_cart    promotion_edit
#     WMS Switch Project    wm
#     Go to    ${URL_WMS}/campaign
#     Click Element    //button[@class='btn btn-sm btn-info' and contains(text(),'+ WLS Promotion')]
#     Sleep    1s
#     Execute Javascript    $('#campaign_name_th').val('[QA-Automation] WLS Promotion by Item Fix Price [Edit]');
#     ${IMG_DIR}=    Replace String Using Regexp    ${CURDIR}    TestCase$    Image
#     ${CUR_IMG_DIR}=    Remove String    ${IMG_DIR}    ${/}TestCase${/}Common/PrepareData
#     ${file_join_banner}=    Catenate    SEPARATOR=${/}    ${CUR_IMG_DIR}${/}Resource/${BU}${/}Image    promotion_cartb2b_banner.jpg
#     ${file_join_top_banner}=    Catenate    SEPARATOR=${/}    ${CUR_IMG_DIR}${/}Resource/${BU}${/}Image    join_top_banner.jpg
#     ${file_join_bannermobile}=    Catenate    SEPARATOR=${/}    ${CUR_IMG_DIR}${/}Resource/${BU}${/}Image    promotion_cartb2b_banner.jpg
#     Choose File    id=file_banner    ${file_join_banner}
#     Choose File    id=file_topbanner    ${file_join_top_banner}
#     Choose File    id=file_bannermobile    ${file_join_bannermobile}
#     Execute Javascript    $('#date_join_campaign').val('01/01/2016 00:00 - 31/12/2020 23:59');
#     Execute Javascript    $('#date_show_campaign').val('01/01/2016 00:00 - 31/12/2020 23:59');
#     Select From List By Label    discount_type    กำหนดราคา (บาท)
#     Input Text    //input[@id='discount_value']    99
#     Select Frame    id=description_th_ifr
#     Input Text    //body[@id='tinymce']    Promotion by Item Fix Price [Edit] create by robot script !!
#     Unselect Frame
#     Input Text    //input[@id='min_quantity']    1
#     Input Text    //input[@id='slug_th']    qa-robot-promotion-itemfix
#     Execute Javascript    $("input[name='order_product']")[1].click()
#     Execute Javascript    $('form').submit();
#     Sleep    3s
#     ${campaign_id}=    Execute Javascript    return $('.table > tbody > tr')[0].id
#     ${campaign_id}=    Remove String    ${campaign_id}    row-
#     Write Variable to File    promotion_item_for_edit_id    ${campaign_id}
#     WMS Select Product to Campaign    promotion    ${campaign_id}    ${robot_stg_store1_test_promotion_item2}
#     WMS Select Product to Campaign    promotion    ${campaign_id}    ${robot_stg_store2_test_promotion_item2}

# TC_PromotionCart_PriceDiscountPriceEdit
#     [Tags]    promotion_cart    promotion_edit
#     WMS Switch Project    wm
#     Go to    ${URL_WMS}/campaign
#     Click Element    //button[@class='btn btn-sm btn-info' and contains(text(),'+ WLS Promotion')]
#     Sleep    1s
#     Execute Javascript    $('#campaign_name_th').val('[QA-Automation] WLS Promotion by Cart [Edit]');
#     ${IMG_DIR}=    Replace String Using Regexp    ${CURDIR}    TestCase$    Image
#     ${CUR_IMG_DIR}=    Remove String    ${IMG_DIR}    ${/}TestCase${/}Common/PrepareData
#     ${file_join_banner}=    Catenate    SEPARATOR=${/}    ${CUR_IMG_DIR}${/}Resource/${BU}${/}Image    promotion_cartb2b_banner.jpg
#     ${file_join_top_banner}=    Catenate    SEPARATOR=${/}    ${CUR_IMG_DIR}${/}Resource/${BU}${/}Image    join_top_banner.jpg
#     ${file_join_bannermobile}=    Catenate    SEPARATOR=${/}    ${CUR_IMG_DIR}${/}Resource/${BU}${/}Image    promotion_cartb2b_banner.jpg
#     Choose File    id=file_banner    ${file_join_banner}
#     Choose File    id=file_topbanner    ${file_join_top_banner}
#     Choose File    id=file_bannermobile    ${file_join_bannermobile}
#     Execute Javascript    $('#date_join_campaign').val('01/01/2016 00:00 - 31/12/2020 23:59');
#     Execute Javascript    $('#date_show_campaign').val('01/01/2016 00:00 - 31/12/2020 23:59');
#     Execute Javascript    $("input[name='promotion_type']")[1].click()
#     Select Frame    id=description_th_ifr
#     Input Text    //body[@id='tinymce']    WLS Promotion by Cart [Edit] create by robot script !!
#     Unselect Frame
#     Input Text    //input[@id='min_quantity']    1
#     Select From List By Label    discount_type    ราคาส่วนลด (บาท)
#     Sleep    1s
#     Select From List By Label    promotion_pattern    บาท
#     Sleep    1
#     Select From List By Label    condition_range[0]    ถึง
#     Sleep    1
#     Execute Javascript    $("input[name='conditions[0][min]']").val('1000')
#     Execute Javascript    $("input[name='conditions[0][max]']").val('2000')
#     Execute Javascript    $("input[name='conditions[0][discount_value]']").val('200')
#     Click Element    //button[@class='btn btn-sm btn-primary btn_addmoreprice']
#     Execute Javascript    $("input[name='conditions[1][min]']").val('2001')
#     Execute Javascript    $("input[name='conditions[1][discount_value]']").val('500')
#     Input Text    //input[@id='slug_th']    qa-robot-promotion-cart-price-price-edit
#     Execute Javascript    $("input[name='order_product']")[1].click()
#     Execute Javascript    $('form').submit();
#     Sleep    3s
#     ${campaign_id}=    Execute Javascript    return $('.table > tbody > tr')[0].id
#     ${campaign_id}=    Remove String    ${campaign_id}    row-
#     Write Variable to File    promotion_cart_price_for_edit_id    ${campaign_id}
#     WMS Select Product to Campaign    promotion    ${campaign_id}    ${robot_stg_store1_test_promotion_cart1}
#     WMS Select Product to Campaign    promotion    ${campaign_id}    ${robot_stg_store2_test_promotion_cart1}

# TC_PromotionItem_Inactive
#     [Tags]    promotion_cart    inactive
#     WMS Switch Project    wm
#     Go to    ${URL_WMS}/campaign
#     Click Element    //button[@class='btn btn-sm btn-info' and contains(text(),'+ WLS Promotion')]
#     Sleep    1s
#     Execute Javascript    $('#campaign_name_th').val('[QA-Automation] WLS Promotion by Item Fix Price [Inactive]');
#     ${IMG_DIR}=    Replace String Using Regexp    ${CURDIR}    TestCase$    Image
#     ${CUR_IMG_DIR}=    Remove String    ${IMG_DIR}    ${/}TestCase${/}Common/PrepareData
#     ${file_join_banner}=    Catenate    SEPARATOR=${/}    ${CUR_IMG_DIR}${/}Resource/${BU}${/}Image    promotion_itemprice_banner.jpg
#     ${file_join_top_banner}=    Catenate    SEPARATOR=${/}    ${CUR_IMG_DIR}${/}Resource/${BU}${/}Image    join_top_banner.jpg
#     ${file_join_bannermobile}=    Catenate    SEPARATOR=${/}    ${CUR_IMG_DIR}${/}Resource/${BU}${/}Image    promotion_itemprice_banner.jpg
#     Choose File    id=file_banner    ${file_join_banner}
#     Choose File    id=file_topbanner    ${file_join_top_banner}
#     Choose File    id=file_bannermobile    ${file_join_bannermobile}
#     Execute Javascript    $('#date_join_campaign').val('01/01/2015 00:00 - 31/12/2015 23:59');
#     Execute Javascript    $('#date_show_campaign').val('01/01/2015 00:00 - 31/12/2015 23:59');
#     Select From List By Label    discount_type    กำหนดราคา (บาท)
#     Input Text    //input[@id='discount_value']    99
#     Select Frame    id=description_th_ifr
#     Input Text    //body[@id='tinymce']    Promotion by Item Fix Price [Inactive] create by robot script !!
#     Unselect Frame
#     Input Text    //input[@id='min_quantity']    1
#     Input Text    //input[@id='slug_th']    qa-robot-promotion-itemfix
#     Execute Javascript    $("input[name='order_product']")[1].click()
#     Execute Javascript    $('form').submit();
#     Sleep    3s
#     ${campaign_id}=    Execute Javascript    return $('.table > tbody > tr')[0].id
#     ${campaign_id}=    Remove String    ${campaign_id}    row-
#     Write Variable to File    promotion_item_inactive_id    ${campaign_id}

# TC_PromotionCart_Inactive
#     [Tags]    promotion_cart    inactive
#     WMS Switch Project    wm
#     Go to    ${URL_WMS}/campaign
#     Click Element    //button[@class='btn btn-sm btn-info' and contains(text(),'+ WLS Promotion')]
#     Sleep    1s
#     Execute Javascript    $('#campaign_name_th').val('[QA-Automation] WLS Promotion by Cart [Inactive]');
#     ${IMG_DIR}=    Replace String Using Regexp    ${CURDIR}    TestCase$    Image
#     ${CUR_IMG_DIR}=    Remove String    ${IMG_DIR}    ${/}TestCase${/}Common/PrepareData
#     ${file_join_banner}=    Catenate    SEPARATOR=${/}    ${CUR_IMG_DIR}${/}Resource/${BU}${/}Image    promotion_cartb2b_banner.jpg
#     ${file_join_top_banner}=    Catenate    SEPARATOR=${/}    ${CUR_IMG_DIR}${/}Resource/${BU}${/}Image    join_top_banner.jpg
#     ${file_join_bannermobile}=    Catenate    SEPARATOR=${/}    ${CUR_IMG_DIR}${/}Resource/${BU}${/}Image    promotion_cartb2b_banner.jpg
#     Choose File    id=file_banner    ${file_join_banner}
#     Choose File    id=file_topbanner    ${file_join_top_banner}
#     Choose File    id=file_bannermobile    ${file_join_bannermobile}
#     Execute Javascript    $('#date_join_campaign').val('01/01/2015 00:00 - 31/12/2015 23:59');
#     Execute Javascript    $('#date_show_campaign').val('01/01/2015 00:00 - 31/12/2015 23:59');
#     Execute Javascript    $("input[name='promotion_type']")[1].click()
#     Select Frame    id=description_th_ifr
#     Input Text    //body[@id='tinymce']    WLS Promotion by Cart [Inactive] create by robot script !!
#     Unselect Frame
#     Input Text    //input[@id='min_quantity']    1
#     Select From List By Label    discount_type    ราคาส่วนลด (บาท)
#     Sleep    1s
#     Select From List By Label    promotion_pattern    บาท
#     Sleep    1
#     Select From List By Label    condition_range[0]    ถึง
#     Sleep    1
#     Execute Javascript    $("input[name='conditions[0][min]']").val('1000')
#     Execute Javascript    $("input[name='conditions[0][max]']").val('2000')
#     Execute Javascript    $("input[name='conditions[0][discount_value]']").val('200')
#     Click Element    //button[@class='btn btn-sm btn-primary btn_addmoreprice']
#     Execute Javascript    $("input[name='conditions[1][min]']").val('2001')
#     Execute Javascript    $("input[name='conditions[1][discount_value]']").val('500')
#     Input Text    //input[@id='slug_th']    qa-robot-promotion-cart-price-price-edit
#     Execute Javascript    $("input[name='order_product']")[1].click()
#     Execute Javascript    $('form').submit();
#     Sleep    3s
#     ${campaign_id}=    Execute Javascript    return $('.table > tbody > tr')[0].id
#     ${campaign_id}=    Remove String    ${campaign_id}    row-
#     Write Variable to File    promotion_cart_price_inactive_id    ${campaign_id}

# TC_PromotionCustomPrice
#     [Tags]    promotion_custom
#     WMS Switch Project    wm
#     Go to    ${URL_WMS}/campaign
#     Click Element    //button[@class='btn btn-sm btn-info' and contains(text(),'+ WLS Promotion')]
#     Sleep    1s
#     Execute Javascript    $('#campaign_name_th').val('[QA-Automation] WLS Promotion Non Join Custom Price');
#     ${IMG_DIR}=    Replace String Using Regexp    ${CURDIR}    TestCase$    Image
#     ${CUR_IMG_DIR}=    Remove String    ${IMG_DIR}    ${/}TestCase${/}Common/PrepareData
#     ${file_join_banner}=    Catenate    SEPARATOR=${/}    ${CUR_IMG_DIR}${/}Resource/${BU}${/}Image    promotion_custom_price.jpg
#     ${file_join_top_banner}=    Catenate    SEPARATOR=${/}    ${CUR_IMG_DIR}${/}Resource/${BU}${/}Image    join_top_banner.jpg
#     ${file_join_bannermobile}=    Catenate    SEPARATOR=${/}    ${CUR_IMG_DIR}${/}Resource/${BU}${/}Image    promotion_custom_price.jpg
#     Choose File    id=file_banner    ${file_join_banner}
#     Choose File    id=file_topbanner    ${file_join_top_banner}
#     Choose File    id=file_bannermobile    ${file_join_bannermobile}
#     Execute Javascript    $('#date_join_campaign').val('01/01/2016 00:00 - 31/12/2020 23:59');
#     Execute Javascript    $('#date_show_campaign').val('01/01/2016 00:00 - 31/12/2020 23:59');
#     Execute Javascript    $("input[name='promotion_type']")[2].click()
#     Select Frame    id=description_th_ifr
#     Input Text    //body[@id='tinymce']    WLS Promotion Non Join Custom Price create by robot script !!
#     Unselect Frame
#     Input Text    //input[@id='slug_th']    qa-robot-promotion-custom-price
#     Execute Javascript    $("input[name='order_product']")[1].click()
#     Execute Javascript    $('form').submit();
#     Sleep    3s
#     ${campaign_id}=    Execute Javascript    return $('.table > tbody > tr')[0].id
#     ${campaign_id}=    Remove String    ${campaign_id}    row-
#     Write Variable to File    promotion_custom_price    ${campaign_id}
#     WMS Select Product to Campaign    promotion_type3    ${campaign_id}    ${robot_stg_store1_custom_camapign}    9    199
#     WMS Select Product to Campaign    promotion_type3    ${campaign_id}    ${robot_stg_store2_custom_camapign}    9    399

# TC_PromotionCustomPrice_Empty
#     [Tags]    promotion_custom
#     WMS Switch Project    wm
#     Go to    ${URL_WMS}/campaign
#     Click Element    //button[@class='btn btn-sm btn-info' and contains(text(),'+ WLS Promotion')]
#     Sleep    1s
#     Execute Javascript    $('#campaign_name_th').val('[QA-Automation] WLS Promotion Non Join Custom Price Empty Product');
#     ${IMG_DIR}=    Replace String Using Regexp    ${CURDIR}    TestCase$    Image
#     ${CUR_IMG_DIR}=    Remove String    ${IMG_DIR}    ${/}TestCase${/}Common/PrepareData
#     ${file_join_banner}=    Catenate    SEPARATOR=${/}    ${CUR_IMG_DIR}${/}Resource/${BU}${/}Image    promotion_custom_price.jpg
#     ${file_join_top_banner}=    Catenate    SEPARATOR=${/}    ${CUR_IMG_DIR}${/}Resource/${BU}${/}Image    join_top_banner.jpg
#     ${file_join_bannermobile}=    Catenate    SEPARATOR=${/}    ${CUR_IMG_DIR}${/}Resource/${BU}${/}Image    promotion_custom_price.jpg
#     Choose File    id=file_banner    ${file_join_banner}
#     Choose File    id=file_topbanner    ${file_join_top_banner}
#     Choose File    id=file_bannermobile    ${file_join_bannermobile}
#     Execute Javascript    $('#date_join_campaign').val('01/01/2016 00:00 - 31/12/2020 23:59');
#     Execute Javascript    $('#date_show_campaign').val('01/01/2016 00:00 - 31/12/2020 23:59');
#     Execute Javascript    $("input[name='promotion_type']")[2].click()
#     Select Frame    id=description_th_ifr
#     Input Text    //body[@id='tinymce']    WLS Promotion Non Join Custom Price Empty Product create by robot script !!
#     Unselect Frame
#     Input Text    //input[@id='slug_th']    qa-robot-promotion-custom-price
#     Execute Javascript    $("input[name='order_product']")[1].click()
#     Execute Javascript    $('form').submit();
#     Sleep    3s
#     ${campaign_id}=    Execute Javascript    return $('.table > tbody > tr')[0].id
#     ${campaign_id}=    Remove String    ${campaign_id}    row-
#     Write Variable to File    empty_promotion_custom_price    ${campaign_id}

# TC_PromotionCustomPrice_Expire
#     [Tags]    promotion_custom
#     WMS Switch Project    wm
#     Go to    ${URL_WMS}/campaign
#     Click Element    //button[@class='btn btn-sm btn-info' and contains(text(),'+ WLS Promotion')]
#     Sleep    1s
#     Execute Javascript    $('#campaign_name_th').val('[QA-Automation] WLS Promotion Non Join Custom Price Expired');
#     ${IMG_DIR}=    Replace String Using Regexp    ${CURDIR}    TestCase$    Image
#     ${CUR_IMG_DIR}=    Remove String    ${IMG_DIR}    ${/}TestCase${/}Common/PrepareData
#     ${file_join_banner}=    Catenate    SEPARATOR=${/}    ${CUR_IMG_DIR}${/}Resource/${BU}${/}Image    promotion_custom_price.jpg
#     ${file_join_top_banner}=    Catenate    SEPARATOR=${/}    ${CUR_IMG_DIR}${/}Resource/${BU}${/}Image    join_top_banner.jpg
#     ${file_join_bannermobile}=    Catenate    SEPARATOR=${/}    ${CUR_IMG_DIR}${/}Resource/${BU}${/}Image    promotion_custom_price.jpg
#     Choose File    id=file_banner    ${file_join_banner}
#     Choose File    id=file_topbanner    ${file_join_top_banner}
#     Choose File    id=file_bannermobile    ${file_join_bannermobile}
#     Execute Javascript    $('#date_join_campaign').val('01/01/2015 00:00 - 31/12/2015 23:59');
#     Execute Javascript    $('#date_show_campaign').val('01/01/2015 00:00 - 31/12/2015 23:59');
#     Execute Javascript    $("input[name='promotion_type']")[2].click()
#     Select Frame    id=description_th_ifr
#     Input Text    //body[@id='tinymce']    WLS Promotion Non Join Custom Price Expired Product create by robot script !!
#     Unselect Frame
#     Input Text    //input[@id='slug_th']    qa-robot-promotion-custom-price
#     Execute Javascript    $("input[name='order_product']")[1].click()
#     Execute Javascript    $('form').submit();
#     Sleep    3s
#     ${campaign_id}=    Execute Javascript    return $('.table > tbody > tr')[0].id
#     ${campaign_id}=    Remove String    ${campaign_id}    row-
#     Write Variable to File    expire_promotion_custom_price    ${campaign_id}

# TC_PromotionCustomPrice_Edit
#     [Tags]    promotion_custom
#     WMS Switch Project    wm
#     Go to    ${URL_WMS}/campaign
#     Click Element    //button[@class='btn btn-sm btn-info' and contains(text(),'+ WLS Promotion')]
#     Sleep    1s
#     Execute Javascript    $('#campaign_name_th').val('[QA-Automation] WLS Promotion Non Join Custom Price [Edit]');
#     ${IMG_DIR}=    Replace String Using Regexp    ${CURDIR}    TestCase$    Image
#     ${CUR_IMG_DIR}=    Remove String    ${IMG_DIR}    ${/}TestCase${/}Common/PrepareData
#     ${file_join_banner}=    Catenate    SEPARATOR=${/}    ${CUR_IMG_DIR}${/}Resource/${BU}${/}Image    promotion_custom_price.jpg
#     ${file_join_top_banner}=    Catenate    SEPARATOR=${/}    ${CUR_IMG_DIR}${/}Resource/${BU}${/}Image    join_top_banner.jpg
#     ${file_join_bannermobile}=    Catenate    SEPARATOR=${/}    ${CUR_IMG_DIR}${/}Resource/${BU}${/}Image    promotion_custom_price.jpg
#     Choose File    id=file_banner    ${file_join_banner}
#     Choose File    id=file_topbanner    ${file_join_top_banner}
#     Choose File    id=file_bannermobile    ${file_join_bannermobile}
#     Execute Javascript    $('#date_join_campaign').val('01/01/2016 00:00 - 31/12/2020 23:59');
#     Execute Javascript    $('#date_show_campaign').val('01/01/2016 00:00 - 31/12/2020 23:59');
#     Execute Javascript    $("input[name='promotion_type']")[2].click()
#     Select Frame    id=description_th_ifr
#     Input Text    //body[@id='tinymce']    WLS Promotion Non Join Custom Price [Edit] create by robot script !!
#     Unselect Frame
#     Input Text    //input[@id='slug_th']    qa-robot-promotion-custom-price
#     Execute Javascript    $("input[name='order_product']")[1].click()
#     Execute Javascript    $('form').submit();
#     Sleep    3s
#     ${campaign_id}=    Execute Javascript    return $('.table > tbody > tr')[0].id
#     ${campaign_id}=    Remove String    ${campaign_id}    row-
#     Write Variable to File    promotion_custom_price_for_edit    ${campaign_id}
#     WMS Select Product to Campaign    promotion_type3    ${campaign_id}    ${robot_stg_store1_promotion_custom_test1}    0    199
#     WMS Select Product to Campaign    promotion_type3    ${campaign_id}    ${robot_stg_store2_promotion_custom_test1}    0    199

# TC_PriceBreak
#     [Tags]    pricebreak
#     WMS Switch Project    wm
#     Go to    ${URL_WMS}/campaign
#     Click Element    //button[@class='btn btn-sm btn-info' and contains(text(),'+ Price break')]
#     Sleep    1s
#     Execute Javascript    $('#campaign_name_th').val('[QA-Automation] ทุบราคา');
#     Choose File    id=file_banner    ${CURDIR}/Images/price_break.jpg
#     Choose File    id=file_topbanner    ${CURDIR}/Images/join_top_banner.jpg
#     Choose File    id=file_bannermobile    ${CURDIR}/Images/price_break.jpg
#     Execute Javascript    $('#date_show_campaign').val('01/01/2016 00:00 - 31/12/2020 23:59');
#     Select Frame    id=description_th_ifr
#     Input Text    //body[@id='tinymce']    ทุบราคา create by robot script !!
#     Unselect Frame
#     Execute Javascript    $("input[name='order_product']")[1].click()
#     Input Text    //input[@id='slug_th']    qa-robot-price-break
#     Execute Javascript    $('form').submit();
#     Sleep    3s
#     ${campaign_id}=    Execute Javascript    return $('.table > tbody > tr')[0].id
#     ${campaign_id}=    Remove String    ${campaign_id}    row-
#     Write Variable to File    knock_price_id    ${campaign_id}
#     WMS Select Product to Campaign    knockprice    ${campaign_id}    L9057*
#     WMS Select Product to Campaign    knockprice    ${campaign_id}    ${knockprice_product}

# TC_NonJoin_ONOFF
#     [Tags]    non-join
#     WMS Switch Project    wm
#     Go to    ${URL_WMS}/campaign
#     Click Element    //button[@class='btn btn-sm btn-info' and contains(text(),'+ Non Join Campaign')]
#     Sleep    1s
#     Execute Javascript    $('#campaign_name_th').val('[QA-Automation] Non Join Campaign ON/OFF');
#     Choose File    id=file_banner    ${CURDIR}/Images/none_join_banner.jpg
#     Choose File    id=file_topbanner    ${CURDIR}/Images/join_top_banner.jpg
#     Choose File    id=file_bannermobile    ${CURDIR}/Images/none_join_banner.jpg
#     Execute Javascript    $('#date_show_campaign').val('01/01/2016 00:00 - 31/12/2020 23:59');
#     Select Frame    id=description_th_ifr
#     Input Text    //body[@id='tinymce']    Non Join Campaign ON/OFF create by robot script !!
#     Unselect Frame
#     Execute Javascript    $("input[name='order_product']")[1].click()
#     Input Text    //input[@id='slug_th']    qa-robot-non-join-onoff
#     Execute Javascript    $('form').submit();
#     Sleep    3s
#     ${campaign_id}=    Execute Javascript    return $('.table > tbody > tr')[0].id
#     ${campaign_id}=    Remove String    ${campaign_id}    row-
#     Write Variable to File    none_join_campaign_onoff_id    ${campaign_id}

# TC_StoreCampaign
#     [Tags]    store
#     Go to    ${URL_PORTAL}/admin
#     Input Text    ${cms_username}    admin
#     Input Text    ${cms_password}    admin@wel0ve
#     # Execute Javascript    $('.btn-danger')[0].click()
#     Click Button    //*[@class="btn btn-danger"]
#     Go to    ${URL_PORTAL}/admin/storecampaign/create/store
#     Execute JavaScript    $('input[name="title[th]"]').val('[QA-Automation] Store Campaign')
#     Choose File    id=banner    ${CURDIR}/Images/store_banner.jpg
#     Choose File    id=top_banner    ${CURDIR}/Images/join_top_banner.jpg
#     Choose File    id=top_banner_mobile    ${CURDIR}/Images/store_banner.jpg
#     Execute Javascript    $('input[name="published_start"]').val('2016-01-01')
#     Execute Javascript    $('input[name="published_start_time"]').val('00:00:00')
#     Execute Javascript    $('input[name="published_end"]').val('2017-12-31')
#     Execute Javascript    $('input[name="published_end_time"]').val('23:59:59')
#     Execute Javascript    $('textarea[name="description[th]"]').val('Store Camapign for Robot');
#     : FOR    ${i}    IN RANGE    0    12
#     \    ${index}    Evaluate    ${i} + 1
#     \    Execute Javascript    $("button:contains(Add new store)").click()
#     \    Sleep    0.5s
#     \    Input Text    //table//tbody//tr[${index}]//td[1]//input    ${store_campaign${index}}
#     \    Input Text    //table//tbody//tr[${index}]//td[3]//textarea    ${store_campaign_product${index}}
#     \    Click Element    //table//tbody//tr[${index}]//td[4]//a[@class='option btn btn-xs btn-success']
#     Sleep    10s
#     Log To Console    ${\n}Please click Save button
#     #Execute Javascript    $('.btn-success ').click()
#     Sleep    3s
#     Go to    ${URL_PORTAL}/admin/storecampaign?filter_campaign_type=2
#     ${campaign_id}=    Execute Javascript    return $('.table > tbody > tr')[0].id
#     ${campaign_id}=    Remove String    ${campaign_id}    row-
#     Write Variable to File    store_campaign_id    ${campaign_id}

TC_Join_Campaign_limit
    [Tags]    join
    WMS Switch Project    wm
    Go to    ${URL_WMS}/campaign
    Click Element    //button[@class='btn btn-sm btn-info btn-join-campaign' and contains(text(),'+ Join Campaign')]
    Sleep    1s
    Click Element    //button[contains(text(),'+ สินค้าราคาเดียว และ แบบช่วงราคา')]
    Sleep    1s
    Execute Javascript    $('#campaign_name_th').val('[QA-Automation] Join Campaign limit');
    Choose File    id=file_banner    ${CURDIR}/Images/join_banner.jpg
    Choose File    id=file_topbanner    ${CURDIR}/Images/join_top_banner.jpg
    Choose File    id=file_bannermobile    ${CURDIR}/Images/join_banner.jpg
    Execute Javascript    $("input[name='discount_type']")[1].click()
    Sleep    0.5s
    Input Text    //input[@id='promotion_amount']    1
    Input Text    //input[@id='promotion_amount_end']    1000
    Execute Javascript    $('#date_join_campaign').val('01/01/2016 00:00 - 31/12/2020 23:59');
    Execute Javascript    $('#date_show_campaign').val('01/01/2016 00:00 - 31/12/2020 23:59');
    Select Frame    id=description_th_ifr
    Input Text    //body[@id='tinymce']    Join Campaign create by robot script !!
    Unselect Frame
    Execute Javascript    $("input[name='product_limit']")[0].click()
    Sleep    0.5s
    Input Text    //input[@id='min_quantity']    1
    Execute Javascript    $("input[name='order_product']")[1].click()
    Input Text    //input[@id='slug_th']    qa-robot-join
    Execute Javascript    $('form').submit();
    Sleep    3s
    ${campaign_id}=    Execute Javascript    return $('.table > tbody > tr')[0].id
    ${campaign_id}=    Remove String    ${campaign_id}    row-
    Write Variable to File    join_campaign_id_limit    ${campaign_id}
    WMS Select Product to Campaign    join    ${campaign_id}    ${robot_stg_store1_join_camapign}    9
    WMS Select Product to Campaign    join    ${campaign_id}    ${robot_stg_store2_join_camapign}    9
