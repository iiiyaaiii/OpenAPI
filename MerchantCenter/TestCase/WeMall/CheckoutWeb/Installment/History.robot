*** Settings ***
Documentation     Check payment channel on account order history
Suite Setup       Open Custom Browser    ${URL_PORTAL}    ${BROWSER}
Suite Teardown    Close All Browsers
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Resource/WeMall/WebElement/Member_SignIn.txt
Resource          ../../../../Resource/WeMall/WebElement/Account_History.txt
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Account_History.txt

*** Test Cases ***
TC_MC_11037
    [Documentation]    WM Check text payment channel display on buyer order history page
    [Tags]    Regression    Low    Account-Web
    Account Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Go To Account Order History
    Search order id on account order history    ${orderid_installment_product}
    Click search button on account order history
    ${lbl_installment_payment_channel}    Get Text Installment Channel    ${lbl_payment_channel}
    Compare Text Installment Channel    การชำระเงิน : ผ่อนชำระ 6 เดือน ผ่านบัตรกรุงเทพ    ${lbl_installment_payment_channel}