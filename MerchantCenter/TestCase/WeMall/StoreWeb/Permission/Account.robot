*** Setting ***
Suite Setup       Account Login    ${seller_user_001}    ${seller_pwd_001}
Test Setup    Go To    ${URL_STORE}/${shop_name_test}/admin/dashboard/summary
Suite Teardown     Close All Browsers
Library           SeleniumLibrary
Library           String
Library           DateTime
Force Tags        Store-Web
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Resource/WeMall/permission.txt
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Permission.txt

*** variable ***
${shop_name_test}    qamcautomate001
${email_dupilcate_shop}    robot_stg_store2@mailinator.com
${email_dupilcate}    permission1@mailinator.com
${email_no_member}    user_falcon_123@mailinator.com
# ${email_edit}    permissionedit@mailinator.com
${email_edit}    permissionedit2@mailinator.com

*** Test Case ***
TC_MC_08771
    [Documentation]    [WM] List บัญชีผู้ใช้งาน page incase have user account
    [Tags]    Regression    High
    Permission.Click Menu ACL User
    Permission.Verify List Premission Have User Account

TC_MC_08772
    [Documentation]    Verify email (Wemall account) add user to shop administartor
    [Tags]    Regression    High
    Permission.Click Menu ACL User
    Permission.Add User Permission To Shop Administrator

TC_MC_08775
    [Documentation]    [WM] Email (wls account confirm register) added to shop administrator already after that add to other shop administrator
    [Tags]    Regression    High
    Permission.Click Menu ACL User
    Permission.Click Add Permission
    Permission.Search Email For Verify In Permission Page    ${email_permission2}
    Permission.Verify Email Permission Dupilcate

TC_MC_08776
    [Documentation]    [WM] Email (wls account have join wls shop) add to shop administrator
    [Tags]    Regression    High
    Permission.Click Menu ACL User
    Permission.Click Add Permission
    Permission.Search Email For Verify In Permission Page    ${email_dupilcate_shop}
    Permission.Verify Email Permission Dupilcate

TC_MC_08778
    [Documentation]    [WM] Email (other not register wls) add user to shop administartor
    [Tags]    Regression    High
    Permission.Click Menu ACL User
    Permission.Click Add Permission
    Permission.Search Email For Verify In Permission Page    ${email_no_member}
    Permission.Verify Email Permission

TC_MC_08779
    [Documentation]    [WM] Edit account name, surname, email, permission
    [Tags]    Regression    High
    Permission.Click Menu ACL User
    Permission.Edit User Permission

TC_MC_08780
    [Documentation]    [WM] Delete account
    [Tags]    Regression    High
    Permission.Click Menu ACL User
    Permission.Delete User Permission

TC_MC_08781
    [Documentation]    [WM] Search user account by name
    [Tags]    Regression    High
    Permission.Click Menu ACL User
    Permission.Search Name User Permission    use_permission2

TC_MC_08782
    [Documentation]    Verify search user account by email
    [Tags]    Regression    High
    Permission.Click Menu ACL User
    Permission.Search Email User Permission    permission4@mailinator.com
