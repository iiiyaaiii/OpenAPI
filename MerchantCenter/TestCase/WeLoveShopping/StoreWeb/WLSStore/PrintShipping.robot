*** Settings ***
Suite Setup       Open Custom Browser    ${URL_PORTAL}    ${BROWSER}
Suite Teardown    Clear All Test
Force Tags        API-Order    feature-order    mc-wls
Library           SeleniumLibrary
Library           String
Library           OperatingSystem
Resource          ../../../../Resource/WeloveShopping/init.robot
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Checkout.txt
Resource          ../../../../Keyword/Common/Store_History.txt
Resource          ../../../../Keyword/Common/Store_Refund.txt
Resource          ../../../../Keyword/Common/Store_Detail.txt
Resource          ../../../../Resource/WeloveShopping/WebElement/StoreDetail.txt
Resource          ../../../../Resource/WeloveShopping/WebElement/StoreHistory.txt
Resource          ../../../../Resource/WeloveShopping/WebElement/StoreRefund.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/Checkout.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/AccountDetail.txt

*** Test Cases ***
TC_MC_04708
    [Tags]    Regression    Low    Store-Web
    [Documentation]    WLSStore Print Shipping Fillter Invoice (Defult 14 Order)
    Set Selenium Speed    0.1
    Check and Reset Seller Login    ${slug_order_store}    ${user_store_order}    ${password_store_order}
    Go To    ${URL_STORE}/${slug_order_store}/admin/orders?status=waitshipping&sort-by-pay=ASC
    Click Element    id=selectall
    sleep    0.5s
    Click Element    //*[@class="btn btn-small btn-primary show-print"]
    sleep    0.5s
    Click Element    //input[@id="print-type-2"]
    sleep    0.5s
    Click Element    //button[@class="btn btn-small btn-primary printlable"]
    sleep    0.5s
    Select Window    url=${URL_STORE}/${slug_order_store}/admin/orders/print-preview
    Element Should Contain    //div[@class="nav-inner"]    แสดงตัวอย่าง ที่อยู่จัดส่ง จำนวน 14 รายการ

