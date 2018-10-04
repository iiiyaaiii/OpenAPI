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
Resource          ../../../../Keyword/Common/TruemoveH_order.robot
Resource          ../../../../Resource/WeMall/WebElement/Truemoveh.txt

*** Test Case ***
TC_MC_09568
    [Documentation]    Add remark message when verifying Thai ID card
    [Tags]    Regression    High
    Go to TruemoveH order report on wms page
    Search order by verify status    Waiting
    Get order id on the first record
    Go to customer info verify page
    Add new remark on this order sucessfully    test remark for robot
    Go to TruemoveH order report on wms page
    Search waiting order with remark by order id    ${order_id}
    Verify the remark is displayed correctly    test remark for robot

TC_MC_09569
    [Documentation]    Remove remark message when verifying Thai ID Card
    [Tags]    Regression    High
    Go to TruemoveH order report on wms page
    Search order by verify status    Waiting
    Get order id on the first record
    Go to customer info verify page
    Remove remark on this order sucessfully
    Go to TruemoveH order report on wms page
    Search waiting order without remark by order id    ${order_id}
    Verify there is no remark display correctly





