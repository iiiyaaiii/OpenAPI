*** Settings ***
Suite Teardown    Close All Browsers
Test Teardown     Run Keywords    Capture Page Screenshot    AND    Close Browser
Force Tags        Wemall-Mobile
Resource          ../../../../Resource/WeMall/Configuration/Staging/serverconfig.txt
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Resource/WeMall/MobileElement/LevelC.robot
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Mobile_LevelC.robot
Resource          ../../../../Keyword/Common/Freebie.txt
Resource          ../../../../Resource/WeMall/WebElement/Freebie.txt


*** Variable ***
${campaign_id}    6176

*** Test Cases ***
TC_MC_06817
    [Documentation]     [Lv.C][Mobile] Camapaign - Joincampaign no product
    [Tags]    Regression    Ligo    Sprint2017MC18
    Mobile_LevelC.Open Levelc Campaign    4014
    Mobile_LevelC.Verify No Product In Campaign

TC_MC_06818
    [Documentation]     [Lv.C][Mobile] Camapaign - Joincampaign have product active
    [Tags]    Regression    Ligo    Sprint2017MC18
    Mobile_LevelC.Open Levelc Campaign    4013
    Mobile_LevelC.Verify Product In Campaign

TC_MC_06828
    [Documentation]     [Lv.C][Mobile] Camapaign - Nonejoincampaign no product
    [Tags]    Ligo    Sprint2017MC18
    Mobile_LevelC.Open Levelc Campaign    4017
    Mobile_LevelC.Verify No Product In Campaign

TC_MC_06829
    [Documentation]     [Lv.C][Mobile] Camapaign - Nonejoincampaign have product active
    [Tags]    Ligo    Sprint2017MC18
    Mobile_LevelC.Open Levelc Campaign    4016
    Mobile_LevelC.Verify Product In Campaign

TC_MC_06839
    [Documentation]     [Lv.C][Mobile] Camapaign - Byitem no product
    [Tags]    Ligo    Sprint2017MC18
    Mobile_LevelC.Open Levelc Campaign    4019
    Mobile_LevelC.Verify No Product In Campaign

TC_MC_06840
    [Documentation]     [Lv.C][Mobile] Camapaign - Byitem fix price have product active
    [Tags]    Ligo    Sprint2017MC18
    Mobile_LevelC.Open Levelc Campaign    4025
    Mobile_LevelC.Verify Product In Campaign

TC_MC_06849
    [Documentation]     [Lv.C][Mobile] Camapaign - Nonejoin Custom price no product
    [Tags]    Ligo    Sprint2017MC18
    Mobile_LevelC.Open Levelc Campaign    4030
    Mobile_LevelC.Verify No Product In Campaign

TC_MC_06850
    [Documentation]     [Lv.C][Mobile] Camapaign - Nonejoin Custom price have product active
    [Tags]    Ligo    Sprint2017MC18
    Mobile_LevelC.Open Levelc Campaign    4029
    Mobile_LevelC.Verify Product In Campaign

TC_MC_10673
    [Documentation]    [Mobile] Verify the product's image with the freebie tag on Wemall Lvl C campaign page when promotion status is available
    [Tags]    LevelC    Regression    Medium
    Mobile_LevelC.Open Levelc Campaign    ${campaign_id}
    Validate freebie promotion correctly displayed

