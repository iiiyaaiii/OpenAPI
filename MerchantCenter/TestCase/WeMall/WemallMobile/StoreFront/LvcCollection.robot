*** Settings ***
Suite Teardown    Close All Browsers
Test Teardown     Run Keywords    Capture Page Screenshot    AND    Close Browser
Force Tags        Wemall-Mobile
Resource          ../../../../Resource/WeMall/Configuration/Staging/serverconfig.txt
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Resource/WeMall/MobileElement/Homepage.robot
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Mobile_Home.robot
Resource          ../../../../Keyword/Common/Mobile_StoreFront.robot

*** Test Cases ***
TC_MC_06968
    [Documentation]    [StoreFront][Mobile] LvC Collection - Product active on collection
    [Tags]    Regression    High    Sprint2017MC19
    Mobile_StoreFront.Open Wemall Store Front Page On Mobile    ${store_url1}
    Mobile_StoreFront.Open store Fornt LevelC Collection Page    ${store_url1}

TC_MC_06972
    [Documentation]    [StoreFront][Mobile] LvC Collection -  Sorting - Default
    [Tags]    Regression    Medium    Sprint2017MC19
    Mobile_StoreFront.Open Wemall Store Front Page On Mobile    ${store_url1}
    Mobile_StoreFront.Open store Fornt LevelC Collection Page    ${store_url1}
    Mobile_StoreFront.Check Sorting Default Category    สินค้าแนะนำ

TC_MC_06973
    [Documentation]    [StoreFront][Mobile] LvC Collection  -  Sorting - ราคาต่ำสุด
    [Tags]    Regression    High    Sprint2017MC19
    Mobile_StoreFront.Open Wemall Store Front Page On Mobile    ${store_url1}
    Mobile_StoreFront.Open store Fornt LevelC Collection Page    ${store_url1}
    Mobile_StoreFront.Click Sorting Button
    Mobile_StoreFront.Select Sorting Option    ราคาต่ำสุด
    Mobile_StoreFront.Collection Products Should Be Sorted By Price    ราคาต่ำสุด

TC_MC_06974
    [Documentation]    [StoreFront][Mobile] LvC Collection  - Sorting - ราคาสูงสุด
    [Tags]    Regression    Medium    Sprint2017MC19
    Mobile_StoreFront.Open Wemall Store Front Page On Mobile    ${store_url1}
    Mobile_StoreFront.Open store Fornt LevelC Collection Page    ${store_url1}
    Mobile_StoreFront.Click Sorting Button
    Mobile_StoreFront.Select Sorting Option    ราคาสูงสุด
    Mobile_StoreFront.Collection Products Should Be Sorted By Price    ราคาสูงสุด

TC_MC_07068
    [Documentation]    [StoreFront][Mobile] LvC Collection - Collection inactive
    [Tags]    Regression    Medium    Sprint2017MC19
    Mobile_StoreFront.Open Wemall Store Front Page On Mobile    ${seller_name002}
    Mobile_StoreFront.Open store Fornt LevelC Collection Page    ${seller_name002}
    Mobile_StoreFront.Verify No Collection

