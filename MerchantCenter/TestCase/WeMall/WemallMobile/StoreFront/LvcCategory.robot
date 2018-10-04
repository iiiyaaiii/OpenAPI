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
${main_category}    152918
${sub_category}    153026
${category_no_product}    153547

*** Test Cases ***
TC_MC_06955
    [Documentation]    [StoreFront][Mobile] LvC Cateory - Main category
    [Tags]    Regression    High    Sprint2017MC19
    Mobile_StoreFront.Open Wemall Store Front Page On Mobile    ${seller_name001}
    Mobile_StoreFront.Open store Fornt LevelC Category Page    ${seller_name001}    ${main_category}

TC_MC_06956
    [Documentation]    [StoreFront][Mobile] LvC Cateory - Sub category
    [Tags]    Regression    High    Sprint2017MC19
    Mobile_StoreFront.Open Wemall Store Front Page On Mobile    ${seller_name001}
    Mobile_StoreFront.Open store Fornt LevelC Category Page    ${seller_name001}    ${sub_category}

TC_MC_06957
    [Documentation]    [StoreFront][Mobile] LvC Cateory -  Category no product
    [Tags]    Regression    High    Sprint2017MC19
    Mobile_StoreFront.Open Wemall Store Front Page On Mobile    ${seller_name001}
    Mobile_StoreFront.Open store Fornt LevelC Category Page    ${seller_name001}    ${category_no_product}

TC_MC_06960
    [Documentation]    [StoreFront][Mobile] LvC Cateory - Sorting - Default
    [Tags]    Regression    Medium    Sprint2017MC19
    Mobile_StoreFront.Open Wemall Store Front Page On Mobile    ${seller_name001}
    Mobile_StoreFront.Open store Fornt LevelC Category Page    ${seller_name001}    ${main_category}
    Mobile_StoreFront.Check Sorting Default Category    ใหม่ล่าสุด

TC_MC_06961
    [Documentation]    [StoreFront][Mobile] LvC Cateory -  Sorting - ราคาต่ำสุด
    [Tags]    Regression    High    Sprint2017MC19
    Mobile_StoreFront.Open Wemall Store Front Page On Mobile    ${seller_name001}
    Mobile_StoreFront.Open store Fornt LevelC Category Page    ${seller_name001}    ${main_category}
    Mobile_StoreFront.Click Sorting Button
    Mobile_StoreFront.Select Sorting Option    ราคาต่ำสุด
    Mobile_StoreFront.Category Products Should Be Sorted By Price    ราคาต่ำสุด

TC_MC_06962
    [Documentation]    [StoreFront][Mobile] LvC Cateory -  Sorting - ราคาสูงสุด
    [Tags]    Regression    High    Sprint2017MC19
    Mobile_StoreFront.Open Wemall Store Front Page On Mobile    ${seller_name001}
    Mobile_StoreFront.Open store Fornt LevelC Category Page    ${seller_name001}    ${main_category}
    Mobile_StoreFront.Click Sorting Button
    Mobile_StoreFront.Select Sorting Option    ราคาสูงสุด
    Mobile_StoreFront.Category Products Should Be Sorted By Price    ราคาสูงสุด
