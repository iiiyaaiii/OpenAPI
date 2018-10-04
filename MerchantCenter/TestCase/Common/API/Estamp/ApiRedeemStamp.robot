*** Setting ***
Test Setup        Request Access Token For E-stamp    ${client_id_estamp}    ${client_secret_estamp}    ${grant_type}
Library           String
Library           SeleniumLibrary
Library           HttpLibrary.HTTP
Library           Collections
Library           BuiltIn
Resource          ../../../Keyword/Common/Api_Estamp.txt
Resource          ../../../Resource/Common/API/Api_Estamp.txt
Resource          ../../../Resource/WeLoveShopping/init.robot


*** Test Cases ***
TC_MC_08027
    [Documentation]    Get Stamp by using QR Code
    Redeem Stamp to get the reward    7    127573
    The Redeem Stamp API returns the response correctly
