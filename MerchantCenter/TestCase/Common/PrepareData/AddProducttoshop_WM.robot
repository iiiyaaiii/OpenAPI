*** Settings ***
Suite Setup       Account Login    ${user_email}    ${pwd_test}
Suite Teardown    Close All Browsers
Library           SeleniumLibrary
Library           String
Library           OperatingSystem
Resource          ../../../Resource/WeMall/init.robot
Resource          ../../../Resource/WeMall/WebElement/Member_SignUp.txt
Resource          ../../../Resource/WeMall/WebElement/Member_SignIn.txt
Resource          ../../../Resource/WeMall/WebElement/Widget.txt
Resource          ../../../Resource/WeMall/WebElement/Product.txt
Resource          ../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../Keyword/Common/Common.txt
Resource          ../../../Keyword/Common/Product.txt

*** Variable ***
${default_encoding}    ISO-8859-1
${user_email}    qamcautomate001@mailinator.com
${shopname}    qamcautomate001
${pwd_test}    Joy@123456
${round}    9


*** Keywords ***
Write Variable to File
    [Arguments]    ${variable_name}    ${value}
    ${variable}    Catenate    SEPARATOR=    ${    ${variable_name}    }    ${SPACE}${SPACE}${SPACE}${SPACE}    ${value}
    ${FilePath}    Replace String    ${CURDIR}    /TestCase/Common/PrepareData    /Resource/${BU}/Configuration/${ENV}
    Append To File   ${FilePath}${/}robotdata.txt    ${\n}${variable}


*** Test Cases ***
Add Product to shop
    [Documentation]    Use for add product a lot of
    Set Selenium Speed    .2
    : FOR    ${i}    IN RANGE    7    ${round}
    \    Sleep   2s
    \    Go To    ${URL_STORE}/${shopname}/admin/product/create
    \    Store Add Product By Add Photo    electronic    robot_product1_1.jpg    ${shopname}${SPACE}-${SPACE}พร้อมส่งสินค้าใหม่    ${shopname}_instock_type_new
    \    ...    New    5.50    1    0    0    a-${i}
    \    Go To    ${URL_STORE}/${shopname}/admin/product/create
    \    Store Add Product By Add Photo    electronic    robot_product1_2.jpg    ${shopname}${SPACE}-${SPACE}พร้อมส่งมือสอง    ${shopname}_instock_type_use
    \    ...    Use    500.10    1    0    0    b-${i}
    \    Go To    ${URL_STORE}/${shopname}/admin/product/create
    \    Store Add Product By Add Photo    electronic    robot_product1_3.jpg    ${shopname}${SPACE}-${SPACE}พร้อมส่งหนัก 1.5 kg    ${shopname}_have_weight
    \    ...    New    750.50    1.5    0    0    c-${i}
    \    Go To    ${URL_STORE}/${shopname}/admin/product/create
    \    Store Add Product By Add Photo    electronic    robot_product1_4.jpg    ${shopname}${SPACE}-${SPACE}พร้อมส่ง 1 Attr. 1 Inv.    ${shopname}_1attr_1inv
    \    ...    New    750.99    1    1    1    d-${i}
    \    Go To    ${URL_STORE}/${shopname}/admin/product/create
    \    Store Add Product By Add Photo    electronic    robot_product1_5.jpg    ${shopname}${SPACE}-${SPACE}พร้อมส่ง 1 Attr. 3 Inv.    ${shopname}_1attr_3inv
    \    ...    New    2    1    1    3    e-${i}
    \    Go To    ${URL_STORE}/${shopname}/admin/product/create
    \    Store Add Product By Add Photo    fashion    robot_product1_6.jpg    ${shopname}${SPACE}-${SPACE}พร้อมส่ง 2 Attr. 1 Inv.    ${shopname}_2attr_1inv    New
    \    ...    1000    1    2    1    f-${i}
    \    Go To    ${URL_STORE}/${shopname}/admin/product/create
    \    Store Add Product By Add Photo    fashion    robot_product1_7.jpg    ${shopname}${SPACE}-${SPACE}พร้อมส่ง 2 Attr. 3 Inv.    ${shopname}_2attr_3inv    New
    \    ...    1000    1    2    3    g-${i}
    # \    Go To    ${URL_STORE}/${shopname}/admin/product/create
    # \    Store Add Product By Select Photo    electronic    robot_product1_1    ${shopname}${SPACE}-${SPACE}สินค้า preorder ไม่ใช้ stock 1 inv    ${shopname}_preorder_ignore_stock
    # \    ...    New    1000.50    1    0    0    h-${i}
    # \    Go To    ${URL_STORE}/${shopname}/admin/product/create
    # \    Store Add Product By Select Photo    electronic    robot_product1_4    ${shopname}${SPACE}-${SPACE}สินค้า preorder ไม่ใช้ stock หลาย inv.    ${shopname}_preorder_ignore_stock_inv
    # \    ...    New    800    1    1    3    i-${i}
    # \    Go To    ${URL_STORE}/${shopname}/admin/product/create
    # \    Store Add Product By Select Photo    electronic    robot_product1_7    ${shopname}${SPACE}-${SPACE}สินค้า preorder ใช้ stock 1 inv    ${shopname}_preorder_use_stock
    # \    ...    New    1000.25    1    0    0    j-${i}