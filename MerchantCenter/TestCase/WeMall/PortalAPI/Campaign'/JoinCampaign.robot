*** Settings ***
Suite Setup       Run Keywords    Open Custom Browser    ${URL_PORTAL}    ${BROWSER}    AND    WMS Switch Project    wm
Suite Teardown    Close All Browsers
Force Tags        Portal-API    Ligo
Test Timeout      3 minutes
Library           SeleniumLibrary    15    5    run_on_failure=Capture Page Screenshot
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Campaign.txt
Resource          ../../../../Resource/WeMall/WebElement/Campaign.txt
Resource          ../../../../Resource/WeMall/WebElement/LevelD.txt

*** Test Cases ***
TC_MC_12623
    [Documentation]    [WeMall] Join Campaign : Campaign is active and have product in campaign
    [Tags]    SmokeTest    Regression    High    mock
    Go to    ${URL_PORTAL}/promotion/${slug}-${campaign_id}
    Element Should Contain    ${breadcrumb_new}    หน้าหลัก > กิจกรรมส่งเสริมการขาย > [QA-Automation] Join Campaign
    Element Should Contain    ${lbl_wemall_campaign_total_product}    แสดงทั้งหมด 1 รายการ
    Element Should Contain    ${campaign_promotion_prodoct_name}    [QA-Automation] Join Campaign