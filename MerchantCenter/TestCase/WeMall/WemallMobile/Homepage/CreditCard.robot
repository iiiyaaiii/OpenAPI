*** Settings ***
Suite Teardown    Close All Browsers
Test Teardown     Run Keywords    Capture Page Screenshot    AND    Close Browser
Force Tags        Wemall-Mobile
Resource          ../../../../Resource/WeMall/Configuration/Staging/serverconfig.txt
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Resource/WeMall/MobileElement/Homepage.robot
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Mobile_Home.robot

*** Variables ***
${data_ccPromotionName}    รับเครดิตเงินคืน 17%
${data_ccPromotionDetailsTitle}    Tesco รับเครดิตเงินคืน 2,000 บาท

*** Test Cases ***
TC_MC_05630
    [Documentation]    [Portal][Mobile] สิทธิพิเศษบัตรเครดิต - All promotions
    [Tags]    Regression    Ligo    Sprint2017MC16
    Mobile_Home.Open Wemall Portal page on Mobile
    Mobile_Home.Wemall Portal page should be appeared
    Mobile_Home.Click on Credit Card Promotion tab
    Mobile_Home.Selected Tab is highlighted    ${m_wm_creditCardTabName}

TC_MC_05632
    [Documentation]    [Portal][Mobile] สิทธิพิเศษบัตรเครดิต - Promotion Details
    [Tags]    Smoke    Regression    Ligo    Sprint2017MC16
    Mobile_Home.Open Wemall Portal page on Mobile
    Mobile_Home.Wemall Portal page should be appeared
    Mobile_Home.Click on Credit Card Promotion tab
    Mobile_Home.Selected Tab is highlighted    ${m_wm_creditCardTabName}
    Mobile_Home.View Credit Card Promotion Details    ${data_ccPromotionName}
    Mobile_Home.Credit Card Promotion Details page is appeared    ${data_ccPromotionDetailsTitle}

TC_MC_05633
    [Documentation]    [Portal][Mobile] สิทธิพิเศษบัตรเครดิต - Promotion Details - Breadcrumb - No Refresh
    [Tags]    Regression    Ligo    Sprint2017MC16
    Mobile_Home.Open Wemall Portal page on Mobile
    Mobile_Home.Wemall Portal page should be appeared
    Mobile_Home.Click on Credit Card Promotion tab
    Mobile_Home.Selected Tab is highlighted    ${m_wm_creditCardTabName}
    Mobile_Home.View Credit Card Promotion Details    ${data_ccPromotionName}
    Mobile_Home.Credit Card Promotion Details page is appeared    ${data_ccPromotionDetailsTitle}
    Mobile_Home.Click Credit Card Breadcrumb
    Mobile_Home.Selected Tab is highlighted    ${m_wm_creditCardTabName}

TC_MC_05634
    [Documentation]    [Portal][Mobile] สิทธิพิเศษบัตรเครดิต - Promotion Details - Breadcrumb - Refresh
    [Tags]    Regression    Ligo    Sprint2017MC16
    Mobile_Home.Open Wemall Portal page on Mobile
    Mobile_Home.Wemall Portal page should be appeared
    Mobile_Home.Click on Credit Card Promotion tab
    Mobile_Home.Selected Tab is highlighted    ${m_wm_creditCardTabName}
    Mobile_Home.View Credit Card Promotion Details    ${data_ccPromotionName}
    Mobile_Home.Credit Card Promotion Details page is appeared    ${data_ccPromotionDetailsTitle}
    Mobile_Home.Refresh Browser
    Mobile_Home.Click Credit Card Breadcrumb
    Mobile_Home.Selected Tab is highlighted    ${m_wm_homeTabName}