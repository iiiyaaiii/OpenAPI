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
TC_MC_07040
    [Documentation]    [StoreFront][Mobile] LvC ProductAll - Product active
    [Tags]    Regression    High    Sprint2017MC19
    Mobile_StoreFront.Open Wemall Store Front Page On Mobile    ${seller_name004}
    Mobile_StoreFront.Open store Fornt LevelC Prduct All Page    ${seller_name004}

TC_MC_07044
    [Documentation]    [StoreFront][Mobile] LvC ProductAll - Sorting - Default
    [Tags]    Regression    Medium    Sprint2017MC19
    Mobile_StoreFront.Open Wemall Store Front Page On Mobile    ${seller_name004}
    Mobile_StoreFront.Open store Fornt LevelC Prduct All Page    ${seller_name004}
    Mobile_StoreFront.Check Sorting Default Category    ใหม่ล่าสุด

TC_MC_07045
    [Documentation]    [StoreFront][Mobile] LvC ProductAll -  Sorting - ราคาต่ำสุด
    [Tags]    Regression    High    Sprint2017MC19
    Mobile_StoreFront.Open Wemall Store Front Page On Mobile    ${seller_name004}
    Mobile_StoreFront.Open store Fornt LevelC Prduct All Page    ${seller_name004}
    Mobile_StoreFront.Click Sorting Button
    Mobile_StoreFront.Select Sorting Option    ราคาต่ำสุด
    Mobile_StoreFront.Products All Should Be Sorted By Price    ราคาต่ำสุด

TC_MC_07046
    [Documentation]    [StoreFront][Mobile] LvC ProductAll - Sorting - ราคาสูงสุด
    [Tags]    Regression    High    Sprint2017MC19
    Mobile_StoreFront.Open Wemall Store Front Page On Mobile    ${seller_name004}
    Mobile_StoreFront.Open store Fornt LevelC Prduct All Page    ${seller_name004}
    Mobile_StoreFront.Click Sorting Button
    Mobile_StoreFront.Select Sorting Option    ราคาสูงสุด
    Mobile_StoreFront.Products All Should Be Sorted By Price    ราคาสูงสุด


