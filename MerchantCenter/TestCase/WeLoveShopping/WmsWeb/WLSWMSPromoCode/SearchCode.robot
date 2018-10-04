*** Settings ***
Suite Setup     WMS Switch Project    wls
Suite Teardown    Close All Browsers
Test Setup        Set Selenium Speed    0.2s
Library           SeleniumLibrary    15    5    run_on_failure=Capture Page Screenshot
Library           String
Library           DateTime
Resource          ../../../../Resource/WeLoveShopping/init.robot
Resource          ../../../../Resource/WeLoveShopping/WebElement/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Account_History.txt
Resource          ../../../../Keyword/Common/WMS_Promocode.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/WLSWMSPromoCode.txt
Test Timeout      3 minutes
Force Tags        WMS-Web    mc-wls

*** Test Case ***
TC_MC_07530
    [Documentation]    WLSSearchCodePromoCode - Input less than 3 character.
    [Tags]    WMS-Web    RECON2017MC20    Medium
    Go to promotion code on wms page
    Search promotion code    te
    Page Should Contain    กรุณากรอก Promotion/MC Code อย่างน้อย 3 ตัวอักษร

TC_MC_07532
    [Documentation]    WLSSearchCodePromoCode - Case Found Code
    [Tags]    WMS-Web    RECON2017MC20    Medium
    Go to promotion code on wms page
    Search promotion code    TEST
    Sleep    2
    ${CountRow}    Execute Javascript    return $('tr').length;
    ${CountRow}    Evaluate    ${CountRow} - 1
    : FOR    ${i}    IN RANGE    1    ${CountRow}
    \    Element Should Contain    //table/tbody/tr[${i}]/td[3]/span    test
    \    Element Should Contain    //table/tbody/tr[${i}]/td[3]/span    TEST

TC_MC_07533
    [Documentation]    WLSSearchCodePromoCode - Case Not Found Code
    [Tags]    WMS-Web    RECON2017MC20    Medium
    Go to promotion code on wms page
    Search promotion code    AAAAAAA
    Page Should Contain    Not Found

