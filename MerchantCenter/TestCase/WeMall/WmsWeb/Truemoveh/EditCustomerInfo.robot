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
TC_MC_08748
    [Documentation]    Edit Thai ID - on Verify Thai ID Order page
    [Tags]    Regression    High
    Go to TruemoveH order report on wms page
    Search order by verify status    Waiting
    Go to customer info verify page
    Edit Thai ID to be   1814655284383
    Save customer information

TC_MC_08749
    [Documentation]    Edit Title - on Verify Thai ID Order page
    [Tags]    Regression    High
    Go to TruemoveH order report on wms page
    Search order by verify status    Waiting
    Go to customer info verify page
    Change title to be    อื่นๆ
    Save customer information

TC_MC_08751
    [Documentation]    Edit Name - on Verify Thai ID Order page
    [Tags]    Regression    High
    Go to TruemoveH order report on wms page
    Search order by verify status    Waiting
    Go to customer info verify page
    Edit customer name to be    Hi World
    Save customer information

TC_MC_08752
    [Documentation]    Edit Date of Birth - on Verify Thai ID Order page
    [Tags]    Regression    High
    Go to TruemoveH order report on wms page
    Search order by verify status    Waiting
    Go to customer info verify page
    Change date of birth to be    2538-01-01
    Save customer information

TC_MC_08753
    [Documentation]    Edit Thai ID Address - on Verify Thai ID Order page
    [Tags]    Regression    High
    Go to TruemoveH order report on wms page
    Search order by verify status    Waiting
    Go to customer info verify page
    Edit thai id address number to be    111
    Edit thai id road to be    ถนน
    Change thai id province to be    กาญจนบุรี
    Change thai id city to be    ท่ามะกา
    Change thai id district to be    ตะคร้ำเอน
    Edit thai id postal code to be    10400
    Save customer information

TC_MC_08754
    [Documentation]    Edit Date of Expiry - on Verify Thai ID Order page
    [Tags]    Regression    High
    Go to TruemoveH order report on wms page
    Search order by verify status    Waiting
    Go to customer info verify page
    Change date of expiry to be    2543-11-21
    Save customer information

TC_MC_08755
    [Documentation]    Edit Tel No - on Verify Thai ID Order page
    [Tags]    Regression    High
    Go to TruemoveH order report on wms page
    Search order by verify status    Waiting
    Go to customer info verify page
    Edit tel number to be    0881234567
    Save customer information

TC_MC_08756
    [Documentation]    Edit Biling Address - on Verify Thai ID Order page
    [Tags]    Regression    High
    Go to TruemoveH order report on wms page
    Search order by verify status    Waiting
    Go to customer info verify page
    Edit billing address number to be    111
    Edit billing road to be    ถนน
    Change billing province to be    กรุงเทพมหานคร
    Change billing city to be    คลองสามวา
    Change billing district to be    ทรายกองดินใต้
    Edit billing postal code to be    30440
    Save customer information