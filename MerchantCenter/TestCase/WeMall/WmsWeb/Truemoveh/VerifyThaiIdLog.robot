*** Settings ***
Suite Setup       WMS Switch Project    wm
Suite Teardown    Close All Browsers
Force Tags        WMS-Web    Truemoveh    mock
Library           SeleniumLibrary
Library           String
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Keyword/Common/TruemoveH_VerifyThaiIdLog.robot
Resource          ../../../../Resource/WeMall/WebElement/Truemoveh.txt

*** Test Case ***
TC_MC_09577
    [Documentation]    Verify Thai ID log when searching with ID card
    [Tags]    Regression    High
    Go to TruemoveH order Verify Thai ID Log on wms page
    Search Thai ID Log by id card    7832323131460
    Check the searched result displays searched id card correctly

TC_MC_09578
    [Documentation]    Verify Thai ID log when searching with first name
    [Tags]    Regression    High
    Go to TruemoveH order Verify Thai ID Log on wms page
    Search Thai ID Log by first name    อังคาร
    Check the searched result displays searched first name correctly

TC_MC_09579
    [Documentation]    Verify Thai ID log when searching with last name
    [Tags]    Regression    High
    Go to TruemoveH order Verify Thai ID Log on wms page
    Search Thai ID Log by last name    มกราคม
    Check the searched result displays searched last name correctly

TC_MC_09580
    [Documentation]    Verify Thai ID log when searching with telephone number
    [Tags]    Regression    High
    Go to TruemoveH order Verify Thai ID Log on wms page
    Search Thai ID Log by telephone number    0891198448
    Check the searched result displays searched telephone number correctly

TC_MC_09584
    [Documentation]    Verify error message when entering ID card as character
    [Tags]    Regression    Medium
    Go to TruemoveH order Verify Thai ID Log on wms page
    Search Thai ID Log by id card    test
    Check the error message displays under ID Card field as    กรุณาใส่ตัวเลขบัตรประชาชนให้ถูกต้อง

TC_MC_09586
    [Documentation]    Verify error message when entering telephone number as character
    [Tags]    Regression    Medium
    Go to TruemoveH order Verify Thai ID Log on wms page
    Search Thai ID Log by telephone number    test
    Check the error message displays under Tel field as    กรุณาใส่เบอร์ให้ถูกต้อง

