*** Setting ***
Test Teardown     Close Browser
Force Tags        Store-Web
Library           SeleniumLibrary
Library           String
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Resource/WeMall/WebElement/WMS_NewsList.robot

*** Test Cases ***
TC_MC_09350
    [Documentation]    Verify display last newlist.
    [Tags]    Regression    Medium
    WMS Switch Project    wm
    Go To    ${URL_WMS}/sellernewsdashboard?sort=desc&order=published_at&type_id=&published_at=&updated_at=&status=true
    ${Last_Newlist}    Get Text    ${top_record_title}
    ${str1}    Convert To String    ${Last_Newlist}
    #Close Browser
    Account Login    ${seller_user_001}    ${seller_pwd_001}
    Get shop name
    Go To    ${URL_STORE}/${user_s001}/admin/dashboard/summary
    Sleep    3s
    ${alert_info}    Execute javascript    return $('.alert-info').text().trim();
    ${str2}    Convert To String    ${alert_info}
    ${str3}    Remove String    ${str2}    อ่านเพิ่มเติม
    Should Contain    ${str3}    ${str1}