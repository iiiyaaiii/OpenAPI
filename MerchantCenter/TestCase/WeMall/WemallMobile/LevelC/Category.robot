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

*** Test Cases ***
TC_MC_05635
    [Documentation]     [Mobile][Lv.C][Mobile] Category - No banner category
    [Tags]    Regression    Ligo    Sprint2017MC16
    Mobile_LevelC.Go To LevelC Category No Banner
    Mobile_LevelC.Focus No Banner Category

TC_MC_05636
    [Documentation]     [Mobile][Lv.C][Mobile] Category - Have banner main category
    [Tags]    Regression    Ligo    Sprint2017MC16
    Mobile_LevelC.Go To LevelC Category Banner
    Mobile_LevelC.Focus Banner Category

TC_MC_05644
    [Documentation]     [Mobile]Category - Badge - ใส่โค้ดลดเพิ่ม
    [Tags]    Regression    Ligo    Sprint2017MC16
    Mobile_LevelC.Go To LevelC Category Banner
    Mobile_LevelC.Verify Badge Promocode

TC_MC_05651
    [Documentation]     [Mobile][Lv.C] Category - Thumbnail - Sorting - ราคาต่ำสุด
    [Tags]    Smoke    Regression    Ligo    Sprint2017MC16
    Mobile_LevelC.Go To LevelC Category Banner
    Mobile_LevelC.Sort Product by Lowest Price
    Mobile_LevelC.Sort option is selected   ราคาต่ำสุด
    Mobile_LevelC.Products should be sorted by lowest price

TC_MC_05652
    [Documentation]     [Mobile][Lv.C]Category - Thumbnail - Sorting - ราคาสูงสุด
    [Tags]    Smoke    Regression    Ligo    Sprint2017MC16
    Mobile_LevelC.Go To LevelC Category Banner
    Mobile_LevelC.Sort Product by Highest Price
    Mobile_LevelC.Sort option is selected   ราคาสูงสุด
    Mobile_LevelC.Products should be sorted by higest price

TC_MC_10696
    [Documentation]    [Mobile] Verify the product's image with the freebie tag on Wemall Lvl C Category page when promotion status is available
    [Tags]    Smoke    Regression
    Go To LevelC Category Banner
    Validate freebie promotion correctly displayed
