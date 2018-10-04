*** Settings ***
Suite Setup    Open Custom Browser    ${URL_PORTAL}    Mobile
Suite Teardown    Close All Browsers
Test Setup        Clear Mobile Login
Resource          ../../../../Resource/WeLoveShopping/init.robot
Resource          ../../../../Keyword/Common/Mobile_LevelD.robot

*** Variable ***
${product_truepoint}    L91556655

*** Test Cases ***
TC_MC_12095
    [Documentation]    [WLS][Mobile] Verify Product image with TruePoint thumbnail on Level D page
    [Tags]    Regression    High
    Open Product LevelD Weloveshopping    ${product_truepoint}
    Verify Truepoint Icon On LevelD Weloveshopping
    Verify Condition Truepoint On LevelD Weloveshopping