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
TC_MC_07315
    [Documentation]    WMWMSPromoCode - Edit promotion code on option "ประเภท Promotion Code" from "ใช้ได้หลายครั้ง" to "ใช้ได้ครั้งเดียว (Unique)"
    [Tags]    High    WMS-Web
    Go to promotion code on wms page
    Search promotion code    USE4ROBOT
    Go to edit page for this promotion code
    The Promotion Code Type option could not be changed

TC_MC_07319
    [Documentation]    WMWMSPromoCode - Edit promotion code on option "จำนวนครั้งที่สามารถใช้ได้" on "จำกัด" type
    [Tags]    Regression    High    WMS-Web
    Go to promotion code on wms page
    Search promotion code    AUTOUSELIMIT
    Go to edit page for this promotion code
    Edit the number of coupon limit value and update successfully    AUTOUSELIMIT

TC_MC_07322
    [Documentation]    WMWMSPromoCode - Edit promotion code on option "ค่าธรรมเนียมเข้าร่วมแคมเปญ" for"คิดค่าธรรมเนียม" option
    [Tags]    High    WMS-Web
    Go to promotion code on wms page
    Search promotion code    USE4ROBOT
    Go to edit page for this promotion code
    The campaign fee option could not be changed

TC_MC_07323
    [Documentation]    WMWMSPromoCode - Edit promotion code on option "ชื่อเรียก Promotion"
    [Tags]    Regression    Medium    WMS-Web
    Go to promotion code on wms page
    Search promotion code    USE4ROBOT
    Go to edit page for this promotion code
    Edit the promotion name and update successfully    USE4ROBOT

TC_MC_07325
   [Documentation]    WMWMSPromoCode - Edit promotion code with duplicate code
    [Tags]    Regression    High    WMS-Web
    Go to promotion code on wms page
    Search promotion code    AUTOUSELIMIT
    Go to edit page for this promotion code
    Edit the promotion code to be    USE4ROBOT
    The error message should be displayed    This promotion code is not available.

TC_MC_07329
   [Documentation]    WMWMSPromoCode - Edit promotion code on option "ลูกค้า 1 คน สามารถใช้ได้กี่ครั้ง" on "จำกัด" type
    [Tags]    High    WMS-Web
    Go to promotion code on wms page
    Search promotion code    USERLIMIT
    Go to edit page for this promotion code
    Edit the number of coupon limit per customer and update successfully    USERLIMIT

TC_MC_07330
   [Documentation]    WMWMSPromoCode - Edit promotion code on option "ระยะเวลา Promotion"
    [Tags]    Regression    High    WMS-Web
    Go to promotion code on wms page
    Search promotion code    AUTOUSELIMIT
    Go to edit page for this promotion code
    Edit the promotion period and update successfully    AUTOUSELIMIT    2017-10-31    2018-03-31

TC_MC_07351
    [Documentation]    WMWMSPromoCode - Go to edit page when clicking "Edit" button on view page
    [Tags]    Regression    Medium    WMS-Web
    Go to promotion code on wms page
    Search promotion code    USE4ROBOT
    View detail this promotion code on view page
    Go to edit page from view page successfully
