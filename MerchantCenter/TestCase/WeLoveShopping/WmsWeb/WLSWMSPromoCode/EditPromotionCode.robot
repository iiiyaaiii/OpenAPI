*** Settings ***
Suite Setup     WMS Switch Project    wls
Suite Teardown    Close All Browsers
Test Setup        Set Selenium Speed    0.2s
Force Tags        mock    mc-wls
Library           SeleniumLibrary    15    5    run_on_failure=Capture Page Screenshot
Library           String
Library           DateTime
Resource          ../../../../Resource/WeLoveShopping/init.robot
Resource          ../../../../Resource/WeLoveShopping/WebElement/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/WMS_Promocode.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/WLSWMSPromoCode.txt
Test Timeout      3 minutes

*** Test Case ***
TC_MC_07353
    [Documentation]    WLSWMSPromoCode - Edit promotion code on option "ประเภท Promotion Code" from "ใช้ได้หลายครั้ง" to "ใช้ได้ครั้งเดียว (Unique)"
    [Tags]    High    WMS-Web
    Go to promotion code on wms page
    Search promotion code    USE4ROBOT
    Go to edit page for this promotion code
    The Promotion Code Type option could not be changed

TC_MC_07357
    [Documentation]    WLSWMSPromoCode - Edit promotion code on option "จำนวนครั้งที่สามารถใช้ได้" on "จำกัด" type
    [Tags]    High    WMS-Web
    Go to promotion code on wms page
    Search promotion code    ROBOTLIMIT
    Go to edit page for this promotion code
    Edit the number of coupon limit value and update successfully    ROBOTLIMIT

TC_MC_07360
    [Documentation]    WLSWMSPromoCode - Edit promotion code on option "ค่าธรรมเนียมเข้าร่วมแคมเปญ" for"คิดค่าธรรมเนียม" option
    [Tags]    High    WMS-Web
    Go to promotion code on wms page
    Search promotion code    USE4ROBOT
    Go to edit page for this promotion code
    The campaign fee option could not be changed

TC_MC_07361
    [Documentation]    WLSWMSPromoCode - Edit promotion code on option "ชื่อเรียก Promotion"
    [Tags]    Medium    WMS-Web
    Go to promotion code on wms page
    Search promotion code    ROBOTLIMIT
    Go to edit page for this promotion code
    Edit the promotion name and update successfully    ROBOTLIMIT


TC_MC_07363
   [Documentation]    WLSWMSPromoCode - Edit promotion code with duplicate code
    [Tags]    High    WMS-Web
    Go to promotion code on wms page
    Search promotion code    USE4ROBOT
    Go to edit page for this promotion code
    Edit the promotion code to be    ROBOTLIMIT
    The error message should be displayed    This promotion code is not available.

TC_MC_07367
   [Documentation]    WLSWMSPromoCode - Edit promotion code on option "ลูกค้า 1 คน สามารถใช้ได้กี่ครั้ง" on "จำกัด" type
    [Tags]    High    WMS-Web
    Go to promotion code on wms page
    Search promotion code    TESTROBOT
    Go to edit page for this promotion code
    Edit the number of coupon limit per customer and update successfully    TESTROBOT

TC_MC_07368
   [Documentation]    WLSWMSPromoCode - Edit promotion code on option "ระยะเวลา Promotion"
    [Tags]    High    WMS-Web
    Go to promotion code on wms page
    Search promotion code    USE4ROBOT
    Go to edit page for this promotion code
    Edit the promotion period and update successfully    USE4ROBOT    2017-12-31    2018-12-31

TC_MC_07389
    [Documentation]    WLSWMSPromoCode - Go to edit page when clicking "Edit" button on view page
    [Tags]    Medium    WMS-Web
    Go to promotion code on wms page
    Search promotion code    ROBOTLIMIT
    View detail this promotion code on view page
    Go to edit page from view page successfully
