*** Settings ***
Test Setup        Open Custom Browser    ${URL_PORTAL}    ${BROWSER}
Test Teardown     Close All Browsers
Resource          ../../../../Resource/WeLoveShopping/init.robot
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Home.txt
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/Portal.txt
Force Tags        Portal-Web    mc-wls

*** Test Cases ***
TC_MC_11900
    [Documentation]    [Desktop] Verify information of Contact us menu on WeLoveShopping website
    [Tags]    Regression    Medium
    Go to    ${URL_PORTAL}
    Go To WeLoveShopping Contact Us Page
    Check The WeLoveShopping Information Correctly
