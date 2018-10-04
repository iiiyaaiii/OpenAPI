*** Settings ***
Suite Setup       Run Keyword    Open Custom Browser    ${URL_PORTAL}    ${BROWSER}    #AND    Reset Store/Product Status    wm
Suite Teardown    Close All Browsers
Force Tags        Wemall-Web
Library           SeleniumLibrary    15    5    run_on_failure=Capture Page Screenshot
Library           String
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Resource/WeMall/WebElement/LevelD.txt
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/LevelD.txt


*** Test Cases ***
TC_MC_11025
    [Documentation]    [Installment]  Verify mouth and banks installment
    [Tags]    Regression    Medium
    Go to    ${URL_LEVEL_D}/${robot_wm_installment_product_many_banks}
    Click Element    ${lnk_leveld_installment_detail}
    Verify month for installment on level d
