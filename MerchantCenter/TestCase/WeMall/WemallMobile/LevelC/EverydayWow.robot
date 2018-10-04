*** Settings ***
Suite Teardown    Close All Browsers
Test Teardown     Run Keywords    Capture Page Screenshot    AND    Close Browser
Force Tags        Wemall-Mobile
Resource          ../../../../Resource/WeMall/Configuration/Staging/serverconfig.txt
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Mobile_LevelC.robot
Resource          ../../../../Keyword/Common/Freebie.txt

*** Test Cases ***
TC_MC_05933
    [Documentation]     [Mobile][Lv.C] Mobile: Now Wow - Available Product
    [Tags]    Smoke    Regression    Ligo    Sprint2017MC17
    Mobile_LevelC.Go To LevelC Everyday WOW
    Mobile_LevelC.Verify Now Everyday Wow

TC_MC_05937
    [Documentation]     [Mobile][Lv.C] Mobile: Now Wow - Click ช้อปเลย
    [Tags]    Regression    Ligo    Sprint2017MC17
    Mobile_LevelC.Go To LevelC Everyday WOW
    Mobile_LevelC.Click Button Shopnow

TC_MC_05941
    [Documentation]     [Mobile][Lv.C] Mobile: Next Wow - Available Product
    [Tags]    Regression    Ligo    Sprint2017MC17
    Mobile_LevelC.Go To LevelC Next Everyday WOW
    Mobile_LevelC.Verify Next Everyday Wow

TC_MC_05949
    [Documentation]     [Mobile][Lv.C] Mobile: Now Wow - Sorting
    [Tags]    Regression    Ligo    Sprint2017MC17
    Mobile_LevelC.Go To LevelC Everyday WOW
    Mobile_LevelC.Open Sorting Option Everyday Wow
    Mobile_LevelC.Select Sorting Option    ราคาต่ำสุด
    Mobile_LevelC.Products Everyday Wow should be sorted by lowest price
    Mobile_LevelC.Open Sorting Option Everyday Wow
    Mobile_LevelC.Select Sorting Option    ราคาสูงสุด
    Mobile_LevelC.Products Everyday Wow should be sorted by Highest price

TC_MC_05950
    [Documentation]     [Mobile][Lv.C] Mobile: Now Wow - All category
    [Tags]    Ligo    Sprint2017MC17
    Mobile_LevelC.Go To LevelC Everyday WOW
    Mobile_LevelC.Open Fillter Option Everyday Wow
    Mobile_LevelC.Slect All Category On Everyday Wow

TC_MC_05951
    [Documentation]     [Mobile][Lv.C] Mobile: Now Wow - All collection
    [Tags]    Ligo    Sprint2017MC17
    Mobile_LevelC.Go To LevelC Everyday WOW
    Mobile_LevelC.Open Fillter Option Everyday Wow
    Mobile_LevelC.Slect All Collection On Everyday Wow

TC_MC_05953
    [Documentation]     [Mobile][Lv.C] Mobile: Next Wow - All category
    [Tags]    Ligo    Sprint2017MC17
    Mobile_LevelC.Go To LevelC Next Everyday WOW
    Mobile_LevelC.Open Fillter Option Everyday Wow
    Mobile_LevelC.Slect All Category On Everyday Wow

TC_MC_05954
    [Documentation]     [Mobile][Lv.C] Mobile: Next Wow - All collection
    [Tags]    Ligo    Sprint2017MC17
    Mobile_LevelC.Go To LevelC Next Everyday WOW
    Mobile_LevelC.Open Fillter Option Everyday Wow
    Mobile_LevelC.Slect All Collection On Everyday Wow

TC_MC_10711
    [Documentation]    [Mobile][Lv.C] Mobile [Mobile][Everyday Wow] Verify the product's image with the freebie tag on Wemall Lvl C Everyday Wow page when Everyday Wow status is available
    [Tags]    Regression    Medium
    Mobile_LevelC.Go To LevelC Everyday WOW
    Freebie.Validate freebie promotion correctly displayed

TC_MC_10716
    [Documentation]    [Mobile][Next Wow] Verify the product's image with the freebie tag on Wemall Lvl C Next Wow page when Next Wow status is available
    [Tags]    Regression    Medium
    Mobile_LevelC.Go To LevelC Next Everyday WOW
    Freebie.Validate freebie promotion correctly displayed


