*** Settings ***
Suite Setup       Run Keywords    Open Custom Browser    ${URL_PORTAL}    ${BROWSER}    AND    Capture Page Screenshot
Suite Teardown    Close All Browsers
Force Tags        Wemall-Web    feature-leveld
Test Timeout      3 minutes
Library           SeleniumLibrary    run_on_failure=Capture Page Screenshot
Library           String
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Keyword/Common/LevelD.txt
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Resource/WeMall/WebElement/LevelD.txt
Resource          ../../../../Resource/WeMall/WebElement/Member_SignIn.txt

*** Test Cases ***
TC_MC_06306
    [Documentation]    [WeMall] LevelD header : Click หน้าหลัก menu follow by store
    [Tags]    Regression    Medium
    LevelD.Click Product to LevelD
    LevelD.Click Header Mainmenu

TC_MC_06307
    [Documentation]    [WeMall] LevelD header: Click สินค้า menu follow by store
    [Tags]    Regression    Medium
    Go to    ${URL_PORTAL}
    LevelD.Click Product to LevelD
    LevelD.Click Header Productmenu

TC_MC_06308
    [Documentation]    [WeMall] LevelD header : Click หมวดหมู่สินค้า menu follow by store >> select main category
    [Tags]    Regression    High
    LevelD.Go To Leveld Portal wemall    L91200277
    LevelD.Click Header Categorymenu

TC_MC_06309
    [Documentation]    LevelD header: Click หมวดหมู่สินค้า menu follow by store >> select sub category
    [Tags]    Regression    High
    LevelD.Go To Leveld Portal wemall    L91200277
    LevelD.Click Header Subcategory

TC_MC_06313
    [Documentation]    LevelD header: Click โปรโมชั่นร้านค้า menu follow by store incase no promotion
    [Tags]    Regression    High
    LevelD.Go To Leveld Portal wemall    L91200277
    LevelD.Click Header Promotionstore

TC_MC_06314
    [Documentation]    LevelD header Click ติดต่อร้านค้า menu follow by store
    [Tags]    Regression    High
    LevelD.Go To Leveld Portal wemall    L91200277
    LevelD.Click Header Contact
