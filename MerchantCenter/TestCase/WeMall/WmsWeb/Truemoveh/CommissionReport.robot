*** Settings ***
Suite Setup       WMS Switch Project    wm
Suite Teardown    Close All Browsers
Force Tags        WMS-Web    Truemoveh    mock
Library           SeleniumLibrary
Library           String
Library           DateTime
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Resource/WeMall/WebElement/Truemoveh.txt
Resource          ../../../../Keyword/Common/TruemoveH_commission.txt


*** Test Cases ***
TC_MC_09185
    [Tags]    Regression    Medium    WmsWeb
    [Documentation]    Search commision report by entering valid order ID
    Go to TruemoveH Commission Report on wms page
    Select commission type    Sim Only
    Select Dealer to be    True Move
    Search commission report by order id    800011400930
    Check that the searched result displays order ID correctly    800011400930

TC_MC_09186
    [Tags]    Regression    Medium    WmsWeb
    [Documentation]    Search commision report by entering invalid order ID
    Go to TruemoveH Commission Report on wms page
    Select commission type    Sim Only
    Search commission report by order id    ^%#*_
    Check the error message under order ID field    The order id field is invalid (0-9)

TC_MC_09189
    [Tags]    Regression    Medium    WmsWeb
    [Documentation]    Search commission report type - Sim Only
    Go to TruemoveH Commission Report on wms page
    Select commission type    Sim Only
    Select Dealer to be    True Move
    Search commission report by activate date    13/03/2017 - 12/12/2017
    Chcek that the searched result displays type correctly    Sim Only

