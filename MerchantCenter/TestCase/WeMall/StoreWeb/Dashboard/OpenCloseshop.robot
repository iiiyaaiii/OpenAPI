*** Setting ***
Test Setup        Account Login    ${wmshoptestmd_user_001}    ${wmshoptestmd_pwd_001}
Test Teardown     Close Browser
Force Tags        Store-Web
Library           SeleniumLibrary
Library           String
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Common.txt

*** Keyword ***
Open/Close Shop
    [Arguments]    ${action}
    # # Clear Active Login
    # # Go to Login    ${seller_user_001}    ${seller_pwd_001}
    # Check and Reset Seller Login    ${user_s001}    ${seller_user_001}    ${seller_pwd_001}
    # Go To    ${URL_STORE}/${user_s001}/admin
    # Get shop name
    # Set Suite Variable    ${shop_name}    ${shop_name}
    Comment    Sleep    3s
    ${check} =    Get Value    //input[@id="openshop_status_old"]
    # Pass Execution If    '${action}' == 'open' and '${check}' == 'true'    Message : Shop already Open !!
    # Pass Execution If    '${action}' == 'close' and '${check}' == 'false'    Message : Shop already Closed !!
    Run Keyword If    "${check}" == "false" and '${action}' == 'open'    Execute Javascript    $('#btn_openshop_sidebar').click();
    Run Keyword If    "${check}" == "true" and '${action}' == 'close'    Execute Javascript    $('#btn_openshop_sidebar').click();
    Sleep    1s
    Execute Javascript    $('.modal-footer .btn-primary').click();
    Sleep    3s
    # ${check} =    Get Value    //input[@id="openshop_status_old"]
    # Run Keyword If    '${action}' == 'close'    Element Should Contain    //span[@id='notify-msg']    ปิดร้านค้าเรียบร้อยแล้ว
    # Run Keyword If    '${action}' == 'close'    Should Be True    '${check}' == 'false'
    # Run Keyword If    '${action}' == 'open'    Element Should Contain    //span[@id='notify-msg']    เปิดร้านค้าเรียบร้อยแล้ว
    # Run Keyword If    '${action}' == 'open'    Should Be True    '${check}' == 'true'
    # Clear Active Login

*** Test Cases ***
TC_MC_09247
    [Documentation]    Verify change shop status Open to Close.
    [Tags]    Regression    SmokeTest    High
    Go To    ${URL_STORE}/${wmshoptestmd_url_001}/admin/
    Open/Close Shop    close
    Clear Active Login
    Go To    ${URL_PORTAL}/${wmshoptestmd_url_001}
    ${msg_CloseShop} =    Get Text    //div[@class="txt-error"]//h3
    Should Be Equal As Strings    ${msg_CloseShop}    ร้านค้าอยู่ระหว่างการปรับปรุงบริการ

TC_MC_09248
    [Documentation]    Verify change shop status Close to Open.
    [Tags]    Regression    SmokeTest    High
    Go To    ${URL_STORE}/${wmshoptestmd_url_001}/admin/
    Open/Close Shop    open
    Clear Active Login
    Go To    ${URL_PORTAL}/${wmshoptestmd_url_001}
    Element Should Be Visible    //div[@class="row-header menu-shop"]
