*** Settings ***
Documentation     Check installment payment channel on account and store order detail page
Suite Setup       Open Custom Browser    ${URL_PORTAL}    ${BROWSER}
Suite Teardown    Close All Browsers
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Resource/WeMall/WebElement/Member_SignIn.txt
Resource          ../../../../Resource/WeMall/WebElement/Account_History.txt
Resource          ../../../../Resource/WeMall/WebElement/Account_Detail.txt
Resource          ../../../../Resource/WeMall/WebElement/Store_Detail.txt
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Account_History.txt
Resource          ../../../../Keyword/Common/Store_History.txt

*** Test Cases ***
TC_MC_11038
    [Documentation]    WM Check text payment channel display on buyer order detail page
    [Tags]    Regression    Account-Web    Medium
    Account Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Go To Account Order History
    Search order id on account order history    ${orderid_installment_product}
    Click search button on account order history
    Click view order detail link    ${lnk_view_order_detail}
    ${lbl_installment_payment_channel}    Get Text Installment Channel    ${lbl_payment_channel_account_detail_page}
    Compare Text Installment Channel    ผ่อนชำระ 6 เดือน ผ่านบัตรกรุงเทพ    ${lbl_installment_payment_channel}

TC_MC_11039
    [Documentation]    WM Check text payment channel display on seller order detail page
    [Tags]    Regression    Store-Web    Medium
    Account Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Go To Store Order History Page    ${storename_slug_wemall}
    Search order id on store order history    ${orderid_installment_product}
    Click search button on store order history
    Click view order detail link    ${lnk_view_detail_store_hisory}
    Check Text    ${lbl_payment_channel_store_detail_page}    ผ่อนชำระ 6 เดือน ผ่านบัตรกรุงเทพ
