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
TC_MC_07391
    [Documentation]    WMWMSMCPromoCode - Edit promotion code on option "ประเภท Promotion Code" from "ใช้ได้หลายครั้ง" to "ใช้ได้ครั้งเดียว (Unique)"
    [Tags]    Regression    High    WMS-Web
    Go to promotion code on wms page
    Search promotion code    MCUSEROBOT
    Go to edit page for this promotion code
    The Promotion Code Type option could not be changed

TC_MC_07395
    [Documentation]    WMWMSMCPromoCode - Edit promotion code on option "จำนวนครั้งที่สามารถใช้ได้" on "จำกัด" type
    [Tags]    High    WMS-Web
    Go to promotion code on wms page
    Search promotion code    MCUSEROBOT
    Go to edit page for this promotion code
    Edit the number of coupon limit value and update successfully    MCUSEROBOT

TC_MC_07396
    [Documentation]    WMWMSMCPromoCode - Edit promotion code on option "ค่าธรรมเนียมเข้าร่วมแคมเปญ" for"คิดค่าธรรมเนียม" option
    [Tags]    Regression    High    WMS-Web
    Go to promotion code on wms page
    Search promotion code    MCUSEROBOT
    Go to edit page for this promotion code
    The campaign fee option could not be changed

TC_MC_07399
    [Documentation]    WLSWMSPromoCode - Edit promotion code on option "ชื่อเรียก Promotion"
    [Tags]    Regression    Medium    WMS-Web
    Go to promotion code on wms page
    Search promotion code    MC4AUTOMATE
    Go to edit page for this promotion code
    Edit the promotion name and update successfully    MC4AUTOMATE

TC_MC_07401
   [Documentation]    WMWMSMCPromoCode - Edit promotion code with duplicate code
    [Tags]    Regression    High    WMS-Web
    Go to promotion code on wms page
    Search promotion code    MCUSEROBOT
    Go to edit page for this promotion code
    Edit the promotion code to be    MC4AUTOMATE
    The error message should be displayed    This promotion code is not available.

TC_MC_07405
   [Documentation]    WLSWMSPromoCode - Edit promotion code on option "ลูกค้า 1 คน สามารถใช้ได้กี่ครั้ง" on "จำกัด" type
    [Tags]    High    WMS-Web
    Go to promotion code on wms page
    Search promotion code    MCUSEROBOT
    Go to edit page for this promotion code
    Edit the number of coupon limit per customer and update successfully    MCUSEROBOT

TC_MC_07406
   [Documentation]    WMWMSMCPromoCode - Edit promotion code on option "ระยะเวลา Promotion"
    [Tags]    High    WMS-Web
    Go to promotion code on wms page
    Search promotion code    MC4AUTOMATE
    Go to edit page for this promotion code
    Edit the promotion period and update successfully    MC4AUTOMATE    2017-12-31    2018-12-31

TC_MC_07427
    [Documentation]    WMWMSMCPromoCode - Go to edit page when clicking "Edit" button on view page
    [Tags]    Medium    WMS-Web
    Go to promotion code on wms page
    Search promotion code    MCTESTROBOT
    View detail this promotion code on view page
    Go to edit page from view page successfully
