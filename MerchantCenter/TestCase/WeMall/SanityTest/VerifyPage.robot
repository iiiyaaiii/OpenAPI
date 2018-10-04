*** Setting ***
[Documentation]    These case are verification page for sanity testing
Suite Setup       Open Custom Browser    ${URL_PORTAL}    ${BROWSER}
Suite Teardown    Close All Browsers
Test Setup        Clear Active Login
Library           SeleniumLibrary
Library           String
Resource          ../../../Resource/WeMall/init.robot
Resource          ../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../Keyword/Common/Campaign.txt
Resource          ../../../Keyword/Common/Common.txt
Resource          ../../../Keyword/Common/Home.txt
Resource          ../../../Resource/WeMall/WebElement/Campaign.txt
Resource          ../../../Keyword/Common/Truemoveh.txt
Resource          ../../../Keyword/Common/TruemoveH_SearchSimNumber.robot
Resource          ../../../Resource/WeMall/WebElement/Truemoveh.txt

*** Test Cases ***
TC_MC_01
    [Tags]    Sanity
    [Documentation]    Verify Everyday wow promotion on Home page
    Go to Login    ${user_prod_wemall}    ${pass_prod_wemall}
    Go To Wemall Production Homepage
    Click Link Everyday WOW Production
    Check The Product In Everyday WOW

TC_MC_02
    [Tags]    Sanity
    [Documentation]    Verify Next wow promotion on Home page
    Go to Login    ${user_prod_wemall}    ${pass_prod_wemall}
    Go To Wemall Production Homepage
    Click Link Everyday WOW Production
    Go To Next Wow Production
    Check The Product In Next WOW

#TC_MC_03
#    [Tags]    Sanity
#    [Documentation]    Verify Register Sim Landing page
#    Go to Login    ${user_prod_wemall}    ${pass_prod_wemall}
#    Search Product On Wemall By Product Name    sim truemove
#    Click Sim Product
#    Go To Select Lucky Sim Number Page
#    Select Lucky Sim Type    บุคคลธรรมดา
#    Search Sim Number By Identify The Last Two Position    8    8
#    TruemoveH_SearchSimNumber.Click Search Button
#    Select The First Number
#    Select The First Promotion
#    Click Register Button
#    Check The Validation Field

