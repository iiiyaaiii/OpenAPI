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
TC_MC_08878
    [Documentation]    [WLS] List สิทธิ์การใช้งาน page incase add user permission
    [Tags]    Regression    Medium
    Set Selenium Speed    .3
    Permission.Click Menu ACL Role
    Permission.Verify And Add Super Admin Permission
    Permission.Verify And Add Manage Product Permission
    Permission.Verify And Add View Report Permission
    Permission.Verify And Add Setup Store Permission

TC_MC_08879
    [Documentation]    [WLS] Add permission
    Permission.Click Menu ACL Role
    Permission.Verify And Add Setup Store Permission

TC_MC_08880
    [Documentation]    [WLS] Add permission in case not key permission name
    [Tags]    Regression    High
    Permission.Create Role Permission
    Permission.Click Save Role Button
    Permission.Verify Message Alert Incase No Key Name ACL

TC_MC_08881
    [Documentation]    [WLS] Add permission in case key permission name but not select permission
    [Tags]    Regression    High
    Permission.Create Role Permission
    Permission.Input Key Name ACL
    Permission.Click Save Role Button
    Permission.Verify Message Alert Incase No Select ACL

TC_MC_08882
    [Documentation]    [WLS] Edit permission
    [Tags]    Regression    Medium
    Permission.Click Menu ACL Role
    Permission.Select Role Name For Edit
    Permission.Edit Role Name    View Report 2
    Permission.Click Menu ACL Role
    Permission.Select Role Name For Edit
    Permission.Verify Edit Role Correct
    Permission.Edit Role Name    View Report

TC_MC_08883
    [Documentation]    [WLS] Delete permission( incase no user in this group permission)
    [Tags]    Regression    Medium
    Permission.Click Menu ACL Role
    Permission.Select Role Label    5
    Permission.Delete Role
    Permission.Verify Pop-Up Message Delete

TC_MC_08884
    [Documentation]    [WM] Delete permission( incase have user in this group permission)
    [Tags]    Regression    High
    Permission.Click Menu ACL Role
    Permission.Select Role Label    1
    Permission.Delete Role
    Permission.Verify Pop-Up Message Delete In Group

TC_MC_08898
    [Documentation]    [WLS] User add to shop administrator and assign permission ACLs
    [Tags]    Regression    High
    Account Login    ${email_permission2}    ${pass_permission2}
    Permission.Verify User Permission Login And Disable Open/Close Shop Button

TC_MC_08899
    [Documentation]    [WLS] User add to shop administrator but do delete permission ACLs
    [Tags]    Regression    High
    Account Login    ${email_permission2}    ${pass_permission2}
    Permission.Verify User Permission Login And No Permission Store Page

# TC_MC_08794
#     [Documentation]    Verify user wls account (added shop administrator) login and go to seller backend when master admin not open shop(3step)
#     [Tags]    sprint 5.4
#     Account Login    acl_automate_001@mailinator.com    P@ssw0rd
#     Go To    ${URL_STORE}/${shop_name_test2}/admin
#     ${status_btn}    Execute Javascript    return $("#btn-nov-openshop").hasClass('disabled');
#     Should Be True    ${status_btn}

# TC_MC_08795
#     [Documentation]    Verify user wls account (added shop administrator) login and go to seller backend when master admin open shop(3step)
#     [Tags]    sprint 5.4
#     Account Login    acl_automate_002@mailinator.com    P@ssw0rd
#     Go To    ${URL_STORE}/${shop_name_test}/admin
#     ${status_btn}    Execute Javascript    return $('#btn_openshop_sidebar').attr('disabled');
#     Should Be Equal    ${status_btn}    disabled