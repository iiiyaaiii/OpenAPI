*** Setting ***
Suite Setup       Account Login    ${user_corporate}    ${password_corporate}
Test Setup    Go To    ${URL_STORE}/${shop_name_test}/admin/dashboard/summary
Suite Teardown     Close All Browsers
Library           SeleniumLibrary
Library           String
Library           DateTime
Force Tags        Store-Web
Resource          ../../../../Resource/WeLoveShopping/init.robot
Resource          ../../../../Resource/WeLoveShopping/WebElement/Permission.txt
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Permission.txt

*** variable ***
${shop_name_test}    autocorp
${email_dupilcate_shop}    wlsatm1462764151@mailinator.com
${email_dupilcate}    permission1@mailinator.com
${email_no_member}    user_falcon_123@mailinator.com
${email_edit}    permissiontest_wls_dupicate@mailinator.com

*** Test Case ***
TC_MC_08866
    [Documentation]    [WLS] List บัญชีผู้ใช้งาน page incase have user account
    [Tags]    Regression    High
    Permission.Click Menu ACL User
    Permission.Verify List Premission Have User Account

TC_MC_08867
    [Documentation]    [WLS] Email (account confirm register) add user to shop administrator (1 user can add only 1shop admin)
    [Tags]    Regression    High
    Permission.Click Menu ACL User
    Permission.Add User Permission To Shop Administrator

TC_MC_08869
    [Documentation]    [WLS] Email (wls account confirm register) added to shop administrator already after that add to other shop administrator
    [Tags]    Regression    High
    Permission.Click Menu ACL User
    Permission.Click Add Permission
    Permission.Search Email For Verify In Permission Page    ${email_permission2}
    Permission.Verify Email Permission Dupilcate

TC_MC_08870
    [Documentation]    [WLS] Email (wls account have join wls shop) add to shop administrator
    [Tags]    Regression    High
    Permission.Click Menu ACL User
    Permission.Click Add Permission
    Permission.Search Email For Verify In Permission Page    ${email_dupilcate_shop}
    Permission.Verify Email Permission Dupilcate

TC_MC_08871
    [Documentation]    [WLS] Email (other not register wls) add user to shop administartor
    [Tags]    Regression    High
    Permission.Click Menu ACL User
    Permission.Click Add Permission
    Permission.Search Email For Verify In Permission Page    ${email_no_member}
    Permission.Verify Email Permission WeLoveShopping

TC_MC_08872
    [Documentation]    [WLS] Edit account name, surname, email, permission
    [Tags]    Regression    High
    Permission.Click Menu ACL User
    Permission.Edit User Permission

TC_MC_08780
    [Documentation]    [WLS] Delete account
    [Tags]    Regression    High
    Permission.Click Menu ACL User
    Permission.Delete User Permission

TC_MC_08874
    [Documentation]    [WLS] Search user account by name
    [Tags]    Regression    High
    Permission.Click Menu ACL User
    Permission.Search Name User Permission    use_permission2

TC_MC_08875
    [Documentation]    [WLS] search user account by email
    [Tags]    Regression    High
    Permission.Click Menu ACL User
    Permission.Search Email User Permission    permissiontest_wls2@mailinator.com
