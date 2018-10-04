*** Settings ***
Suite Setup       WMS Switch Project    wemall
Suite Teardown    Close All Browsers
Force Tags        WMS-Web    Truemoveh    mock
Library           SeleniumLibrary
Library           String
Library           DateTime
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/TruemoveH_order.robot
Resource          ../../../../Resource/WeMall/WebElement/Truemoveh.txt

*** Test Case ***
TC_MC_08730
    [Documentation]    Approve ID Card and confirm on Verify Thai ID Order page
    [Tags]    Regression    High
    Go to TruemoveH order report on wms page
    Search order by verify status    Waiting
    Go to customer info verify page
    Approve this order and confirm

TC_MC_08731
    [Documentation]    Reject ID Card and confirm on Verify Thai ID Order page
    [Tags]    Regression    High
    Go to TruemoveH order report on wms page
    Search order by verify status    Waiting
    Go to customer info verify page
    Reject this order and confirm

TC_MC_08732
    [Documentation]    Customer cancel ID Card and confirm on Verify Thai ID Order page
    [Tags]    Regression    High
    Go to TruemoveH order report on wms page
    Search order by verify status    Waiting
    Go to customer info verify page
    Customer cancel this order and confirm

TC_MC_08736
    [Documentation]    Add Remark and save on Verify Thai ID Order page
    [Tags]    Regression    High
    Go to TruemoveH order report on wms page
    Search order by verify status    Waiting
    Go to customer info verify page
    Add new remark on this order sucessfully    test remark ja เทส
