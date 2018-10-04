*** Settings ***
Suite Setup     WMS Switch Project    wm
Suite Teardown    Close All Browsers
Test Setup        Set Selenium Speed    0.2s
Force Tags        mock
Library           SeleniumLibrary    15    5    run_on_failure=Capture Page Screenshot
Library           String
Library           DateTime
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Resource/WeMall/WebElement/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/WMS_Promocode.txt
Resource          ../../../../Resource/WeMall/WebElement/WMWMSPromoCode.txt
Test Timeout      3 minutes


*** Test Case ***
TC_MC_07486
    [Documentation]    WLSWMSPromoCode - View "ประวัติการแก้ไข code" table on view page
    [Tags]    Medium    WMS-Web
    Go to promotion code on wms page
    Search promotion code    USE4ROBOT
    View detail this promotion code on view page
    The history log table should be displayed

TC_MC_07490
    [Documentation]    WLSWMSPromoCode - WLSWMSPromoCode - View columns in "ประวัติการแก้ไข code" table
    [Tags]    Regression    Medium    WMS-Web
    Go to promotion code on wms page
    Search promotion code    USE4ROBOT
    View detail this promotion code on view page
    The history log table should display column headers    วัน / เวลา ที่ทำการแก้ไข    ประวัติการแก้ไข    ทำโดย

TC_MC_07493
    [Documentation]   WLSWMSPromoCode - View the order of records in "ประวัติการแก้ไข code" table
    [Tags]    Medium    WMS-Web
    Go to promotion code on wms page
    Search promotion code    USE4ROBOT
    View detail this promotion code on view page
    The history records are sorted by time in descending order correctly
