*** Settings ***
Suite Teardown    Close All Browsers
Test Teardown     Run Keywords    Capture Page Screenshot    AND     Close Browser
Force Tags        Wemall-Mobile
Resource          ../../../../Resource/WeMall/Configuration/Staging/serverconfig.txt
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Mobile_LevelD.robot

*** Variables ***
${test_invalid_product}    L99999999

*** Test Cases ***
TC_MC_05931
    [Documentation]    [Portal-Mobile] Wemall - 404 Error Page - Lv.D
    [Tags]    Regression    Ligo    Sprint2017MC17
    Mobile_LevelD.Go to Product Level D Page    ${test_invalid_product}
    Mobile_LevelD.404 Error Page Should Be Appeared