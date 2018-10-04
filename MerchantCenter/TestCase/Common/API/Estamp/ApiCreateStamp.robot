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
TC_MC_08006
    [Documentation]    Get Stamp by using QR Code
    Create Stamp By Using QR Code    7    123456
    The Create Stamp API returns the response correctly

TC_MC_08007
    [Documentation]    Get Stamp by using password
    Create Stamp By Using Password    7    111111
    The Create Stamp API returns the response correctly

TC_MC_08008
    [Documentation]    Get Stamp by using QR Code and Password
    Create Stamp By Using QR Code and Password    10    123456    111111
    The Create Stamp API returns the response correctly








