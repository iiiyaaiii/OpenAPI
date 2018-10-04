*** Settings ***
Suite Teardown    Close All Browsers
Test Teardown     Run Keywords    Capture Page Screenshot    AND    Close Browser
Force Tags        Wemall-Mobile
Resource          ../../../../Resource/WeMall/Configuration/Staging/serverconfig.txt
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Resource/WeMall/MobileElement/Homepage.robot
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Freebie.txt
Resource          ../../../../Keyword/Common/Mobile_Home.robot
Resource          ../../../../Keyword/Common/Mobile_LevelC.robot
Resource          ../../../../Keyword/Common/Mobile_LevelD.robot

*** variable ***
${product_id}    L91201422


*** Test Cases ***
TC_MC_07469
    [Documentation]     [Lv.C][Mobile] Recommend - Click < สินค้าแนะนำ (x)
    [Tags]    Regression    Medium    Sprint2017MC20
    Mobile_LevelC.Go To LevelC Recommend
    Mobile_LevelC.Click To Link Recommend

TC_MC_07473
    [Documentation]     [Lv.C][Mobile] Recommend - Thumbnail - Sorting - สินค้าแนะนำ
    [Tags]    Regression    Medium    Sprint2017MC20
    Mobile_LevelC.Go To LevelC Recommend
    Mobile_LevelC.Check Sorting Default Recommend    สินค้าแนะนำ

TC_MC_07475
    [Documentation]     [Lv.C][Mobile] Recommend - Thumbnail - Sorting - ราคาต่ำสุด
    [Tags]    Regression    Medium    Sprint2017MC20
    Mobile_LevelC.Go To LevelC Recommend
    Mobile_LevelC.Sort Product by Lowest Price
    Mobile_LevelC.Sort option is selected   ราคาต่ำสุด
    Mobile_LevelC.Products should be sorted by lowest price

TC_MC_07476
    [Documentation]     [Lv.C][Mobile] Recommend - Thumbnail - Sorting - ราคาสูงสุด
    [Tags]    Regression    Medium    Sprint2017MC20
    Mobile_LevelC.Go To LevelC Recommend
    Mobile_LevelC.Sort Product by Highest Price
    Mobile_LevelC.Sort option is selected   ราคาสูงสุด
    Mobile_LevelC.Products should be sorted by higest price

TC_MC_10691
    [Documentation]    Mobile] Verify the product's image with the freebie tag on Wemall Lvl C Recommend page when promotion status is available
    [Tags]    Regression    Medium
    Go to Product Level D Page    ${product_id}
    Navigate Level C Recommend Page
    Validate freebie promotion correctly displayed


