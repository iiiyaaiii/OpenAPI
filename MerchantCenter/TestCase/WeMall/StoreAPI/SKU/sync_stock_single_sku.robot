*** Setting ***
Library           SeleniumLibrary
Library           String

Resource          ../../../../Resource/WeLoveShopping/init.robot
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Product.txt
Resource          ../../../../Keyword/Common/Member_StoreRegister.txt
Resource          ../../../../Resource/WeMall/WebElement/Member_SignIn.txt
Resource          ../../../../Resource/WeMall/WebElement/Member_SignUp.txt
Resource          ../../../../Resource/WeMall/WebElement/Product.txt
Resource          ../../../../Resource/WeMall/WebElement/WMS_MonitoringListing.txt
Resource          ../../../../Keyword/Common/Gallery.txt
Resource          ../../../../Keyword/Common/api_common_keywords.robot
Resource          ../../../../Keyword/third_party/fms/supplier.robot


#Suite Teardown    Close All Browsers
*** Variables ***
${user_email}    mcwmtestsku01@mailinator.com
${pwd_test}      P@ssw0rd
${shopname}      mcwmtestsku01
${url_shop}      mcwmtestsku01


*** Keywords ***


*** Test Cases ***
TC_MC_06883
    [Documentation]  To verify that the physical stock is calculated correctly when FMS sends an API to request synchronization for single SKU
    [Tags]  TC_MC_06883  ITMA SPRINT-2017S17  high  regression  antman  smoke

    ${supplier_code}=  Create FMS Supplier  BU6883

    Register Wemall shop    ${user_email}    ${pwd_test}    ${shopname}    ${url_shop}    MF



TC_MC_06884 To verify that the physical stock is calculated correctly when FMS sends an API to request synchronization for multiple SKUs
	[Tags]  TC_MC_06884  ITMA SPRINT-2017S17  high  regression  antman  smoke
	[Setup]   Register Wemall shop    MF     TC_MC_06884
    #[Teardown]
    Log to console   TC_MC_06884 is running ...

TC_MC_06885 To verify that if SKU is blank, the rest of valid SKUs still can be processed and the stock has been updated correctly
	[Tags]  TC_MC_06885  ITMA SPRINT-2017S17  high  regression  antman  smoke
	[Setup]
    [Teardown]

TC_MC_06886 To verify that if some SKU has quantity less than 0, the rest of valid SKUs still can be processed and the stock has been updated correctly
	[Tags]  TC_MC_06886  ITMA SPRINT-2017S17  high  regression  antman  smoke
	[Setup]
    [Teardown]

TC_MC_06887 To verify that if some SKU has source type <> 'MF', the rest of valid SKUs still can be processed and the stock has been updated correctly
	[Tags]  TC_MC_06887  ITMA SPRINT-2017S17  high  regression  antman  smoke
	[Setup]
    [Teardown]

TC_MC_06888 To verify that the process returns success if the result of calculation between quantity from FMS and Hold stock of MC is negative value. The Physical stock in MC is also set to 0.
	[Tags]  TC_MC_06888  ITMA SPRINT-2017S17  high  regression  antman  smoke
	[Setup]
    [Teardown]

TC_MC_06889 To verify that the process returns failed if the SKU is not existing in MC database
	[Tags]  TC_MC_06889  ITMA SPRINT-2017S17  high  regression  antman  smoke