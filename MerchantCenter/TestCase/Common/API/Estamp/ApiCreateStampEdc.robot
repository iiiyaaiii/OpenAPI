*** Setting ***
Test Setup        Request Access Token For E-stamp    ${client_id_estamp}    ${client_secret_estamp}    ${grant_type}
Library           SeleniumLibrary
Library           HttpLibrary.HTTP
Library           String
Resource          ../../../../Keyword/Common/Api_Estamp.txt
Resource          ../../../../Resource/Common/API/Api_Estamp.txt
Resource          ../../../../Resource/WeLoveShopping/init.robot

*** Test Cases ***
TC_MC_09710
    [Documentation]     Get EDC QR code and create stamp
    [Tags]    High    RECON2017MC21
    Get QR Code    1212121212121    1    7    add
    Create stamp by EDC    1100001    00011    69000007


