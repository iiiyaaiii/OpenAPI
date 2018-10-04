*** Settings ***
Documentation     Check remark text for installment on checkout step 3
Suite Setup       Open Custom Browser    ${URL_PORTAL}    ${BROWSER}
Suite Teardown    Close All Browsers
Force Tags        Checkout-Web
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Resource/WeMall/WebElement/Checkout.txt
Resource          ../../../../Resource/WeMall/WebElement/Cart.txt
Resource          ../../../../Resource/WeMall/WebElement/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Checkout.txt
Resource          ../../../../Keyword/Common/Member_SignIn.txt

*** Test Cases ***
TC_MC_11033
    [Documentation]    WM [Desktop] Display remark on checkout page
    [Tags]    Regression    Low
    Account Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Delete All Product In Cart
    Add Product To Cart by product name on Store    ${URL_SHOP}/${storename_slug_wemall}    robot_wm_installment_product_many_bank
    Wait Until Element Is Visible    ${btn_place_order}
    Click Button    ${btn_place_order}
    Wait Until Element Is Visible    ${btn_add_new_address}    20s
    Select address for placeorder    wmrecon@gmail.com
    Wait Until Element Is Visible    ${rdo_installment}
    Click Element    ${rdo_installment}
    ${lbl_remark}    Get Text    ${lbl_remark}
    Should Be Equal As Strings    ${lbl_remark}    *หมายเหตุ : ยอดผ่อนจ่ายต่อเดือนข้างต้น เป็นเพียงยอดประมาณการเท่านั้น ทางธนาคารเจ้าของบัตรจะเป็นผู้กำหนดอีกครั้ง