*** Settings ***
Suite Setup       WMS Switch Project    wm
Suite Teardown    Close All Browsers
Library           SeleniumLibrary
Library           String
Library           DateTime
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Keyword/Common/TruemoveH_InvoiceReport.robot
Resource          ../../../../Resource/WeMall/WebElement/Member_SignIn.txt
Resource          ../../../../Resource/WeMall/WebElement/TruemoveH_InvoiceReport.robot

*** Variables ***
${corporate}    นิติบุคคล
${individual}    บุคคลธรรมดา

*** Test Case ***
TC_MC_09852
    [Documentation]    Invoice report not display Invoice list correctly by using criteria : Input Payment Channel = ATM
    Go To Invoice Report Page
    Search Invoice Report By Payment Channel    ตู้เอทีเอ็ม (ATM)
    All Invoice Report display Payment Channel as    ATM

TC_MC_09853
    [Documentation]    Invoice report not display Invoice list correctly by using criteria : Input Payment Channel = BANKTRANS
    Go To Invoice Report Page
    Search Invoice Report By Payment Channel    เคาน์เตอร์ธนาคาร (BANKTRANS)
    All Invoice Report display Payment Channel as    BANKTRANS

TC_MC_09854
    [Documentation]    Invoice report not display Invoice list correctly by using criteria : Input Payment Channel = IBANK
    Go To Invoice Report Page
    Search Invoice Report By Payment Channel    อินเตอร์เน็ตแบงค์กิ้ง (IBANK)
    All Invoice Report display Payment Channel as    IBANK


TC_MC_09855
    [Documentation]    Invoice report not display Invoice list correctly by using criteria : Input Payment Channel = CCW
    Go To Invoice Report Page
    Search Invoice Report By Payment Channel    บัตรเครดิต (CCW)
    All Invoice Report display Payment Channel as    CCW


TC_MC_09856
    [Documentation]    Invoice report not display Invoice list correctly by using criteria : Input Payment Channel = EW
    Go To Invoice Report Page
    Search Invoice Report By Payment Channel    Wallet (EW)
    All Invoice Report display Payment Channel as    EW

TC_MC_09857
    [Documentation]    Invoice report not display Invoice list correctly by using criteria : Input Payment Channel = CS
    Go To Invoice Report Page
    Search Invoice Report By Payment Channel    เคาน์เตอร์เซอวิส (CS)
    All Invoice Report display Payment Channel as    CS

TC_MC_09858
    [Documentation]    Invoice report display Invoice list correctly by using criteria : Input Invoice No as existing in system
    Go To Invoice Report Page
    Search Invoice Report By Invoice No    180116000002
    The Searched Invoice Number Should Be Displayed as    180116000002

TC_MC_09861
    [Documentation]    Invoice report display Invoice list correctly by using criteria : Input Order ID as existing in system
    Go To Invoice Report Page
    Search Invoice Report By Order ID    800011403329
    The Searched Order ID Should Be Displayed as    800011403329

TC_MC_09863
    [Documentation]    Invoice report display Invoice list correctly by using criteria : Input Order ID as length (input maximum 30 orders)
    Go To Invoice Report Page
    Search Invoice Report By Order ID    800011403329|800011403328
    The Searched Order ID Should Be Displayed as    800011403329|800011403328


TC_MC_09943
    [Documentation]    Verify "TMH" button on invoice list for sim order
    Go To Invoice Report Page
    Search Invoice Report By Order ID    800011403455
    The TMH Button Displays On Action Column Correctly

TC_MC_10584
    [Documentation]    Verify click button ปรับปรุงข้อมูล
    [Tags]    Regression    Low
    Go To Invoice Report Page
    Click Update Button
    Verify Update Billing Page

TC_MC_10586
    [Documentation]    Verify invoice field edit page when selecting ออกใบเสร็จในนาม as นิติบุคคล
    [Tags]    Regression    Medium
    Go To Invoice Report Page
    Click Update Button
    Select Type Invoice    ${corporate}
    Verify Update Billing Information Page for Corporate

TC_MC_10587
    [Documentation]    Verify invoice field edit page when selecting ออกใบเสร็จในนาม as บุคคลธรรมดา
    [Tags]    Regression    Medium
    Go To Invoice Report Page
    Click Update Button
    Select Type Invoice    ${individual}
    Verify Update Billing Information Page for Individual


TC_MC_10588
    [Documentation]    Verify invoice edit page warning message for "นิติบุคคล" when submitting without enter the required fields
    [Tags]    Regression    Medium
    Go To Invoice Report Page
    Click Update Button
    Select Type Invoice    ${corporate}
    Verify Alert Messages Corporate Incase Without Enter Company Required Fields
    Verify Alert Messages Corporate Incase Without Enter Address Required Fields


TC_MC_10591
    [Documentation]    Verify invoice edit page warning message for "นิติบุคคล" and select สาขา when submitting enter the number not reach 5
    [Tags]    Regression    Medium
    Go To Invoice Report Page
    Click Update Button
    Select Type Invoice    ${corporate}
    Verify Alert Message Incase Enter The Number Not Reach 5

TC_MC_10592
    [Documentation]    Verify invoice edit page warning message for "บุคคลธรรมดา" when submitting without enter the required fields
    [Tags]    Regression    Medium
    Go To Invoice Report Page
    Click Update Button
    Select Type Invoice    ${individual}
    Verify Alert Messages Individual Incase Without Enter Company Required Fields
    Verify Alert Messages Individual Incase Without Enter Address Required Fields








