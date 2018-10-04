*** Setting ***
Test Setup        Request Access Token For E-stamp    ${client_id_estamp}    ${client_secret_estamp}    ${grant_type}
Library           String
Library           SeleniumLibrary
Library           HttpLibrary.HTTP
Library           Collections
Library           BuiltIn
Resource          ../../../../Keyword/Common/Api_Estamp.txt
Resource          ../../../../Resource/Common/API/Api_Estamp.txt
Resource          ../../../../Resource/WeLoveShopping/init.robot

*** Test Cases ***
TC_MC_09714
    [Documentation]     Redeem stamp by EDC
    [Tags]    High    RECON2017MC21
    Get QR Code    2212121212121    32    7    add
    Create stamp by EDC    1100001    00011    69000007
    Get QR Code For Redeem    2212121212121    32    7    redeem
    Redeem stamp by EDC
