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

*** Variables ***
${seller_thb}    6335
${seller_precent}    6336
${expired}    3011
${hide}    3010

*** Test Cases ***
TC_MC_07024
    [Documentation]    [StoreFront][Mobile] LvC Seller Promotion - No Seller Promotion
    [Tags]    Medium    Sprint2017MC19
    Mobile_StoreFront.Open Wemall Store Front Page On Mobile    ${seller_name004}
    Mobile_StoreFront.Seller Promotion LeveC Should Not Be Appeared    ${seller_name004}    ${hide}

TC_MC_07077
    [Documentation]    [StoreFront][Mobile] LvC Seller Promotion - Seller Promotion expried
    [Tags]    Regression    Medium    Sprint2017MC19
    Mobile_StoreFront.Open Wemall Store Front Page On Mobile    ${seller_name004}
    Mobile_StoreFront.Seller Promotion LeveC Should Not Be Appeared    ${seller_name004}    ${expired}

TC_MC_07025
    [Documentation]    [StoreFront][Mobile] LvC Seller Promotion - Seller promotion By THB
    [Tags]    Regression    Medium    Sprint2017MC19
    Mobile_StoreFront.Open Wemall Store Front Page On Mobile    ${store_url1}
    Mobile_StoreFront.Open store Fornt LevelC Seller Promotion Page    ${store_url1}    ${seller_thb}

TC_MC_07026
    [Documentation]    [StoreFront][Mobile] LvC Seller Promotion - Seller promotion By precent
    [Tags]    Regression    Medium    Sprint2017MC19
    Mobile_StoreFront.Open Wemall Store Front Page On Mobile    ${store_url1}
    Mobile_StoreFront.Open store Fornt LevelC Seller Promotion Page    ${store_url1}    ${seller_precent}

TC_MC_07032
    [Documentation]    [StoreFront][Mobile] LvC Seller Promotion -  Sorting - Default
    [Tags]    Regression    Medium    Sprint2017MC19
    Mobile_StoreFront.Open Wemall Store Front Page On Mobile    ${store_url1}
    Mobile_StoreFront.Open store Fornt LevelC Seller Promotion Page    ${store_url1}    ${seller_precent}
    Mobile_StoreFront.Check Sorting Default Category    ใหม่ล่าสุด

TC_MC_07033
    [Documentation]    [StoreFront][Mobile] LvC Seller Promotion  -  Sorting - ราคาต่ำสุด
    [Tags]    Regression    High    Sprint2017MC19
    Mobile_StoreFront.Open Wemall Store Front Page On Mobile    ${store_url1}
    Mobile_StoreFront.Open store Fornt LevelC Seller Promotion Page    ${store_url1}    ${seller_thb}
    Mobile_StoreFront.Click Sorting Button
    Mobile_StoreFront.Select Sorting Option    ราคาต่ำสุด
    Mobile_StoreFront.Seller Promotion Should Be Sorted By Price    ราคาต่ำสุด

TC_MC_07034
    [Documentation]    [StoreFront][Mobile] LvC Seller Promotion  - Sorting - ราคาสูงสุด
    [Tags]    Regression    High    Sprint2017MC19
    Mobile_StoreFront.Open Wemall Store Front Page On Mobile    ${store_url1}
    Mobile_StoreFront.Open store Fornt LevelC Seller Promotion Page    ${store_url1}    ${seller_thb}
    Mobile_StoreFront.Click Sorting Button
    Mobile_StoreFront.Select Sorting Option    ราคาสูงสุด
    Mobile_StoreFront.Seller Promotion Should Be Sorted By Price    ราคาสูงสุด
