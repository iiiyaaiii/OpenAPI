*** Settings ***
Test Setup        Request Access Token For E-stamp    ${client_id_estamp}    ${client_secret_estamp}    ${grant_type}
Library           String
Library           SeleniumLibrary
Library           HttpLibrary.HTTP
Library           Collections
Library           BuiltIn
Resource          ../../../../Keyword/Common/Api_Estamp.txt
Resource          ../../../../Resource/Common/API/Api_Estamp.txt

*** Test Cases ***
### History ###
TC_MC_08037
    [Documentation]    History valid success
    Get History List    8500345630468    created_at    asc    1    1
    Verify Body History List

TC_MC_07914
    [Documentation]    Verify the response information from My Stamp API
    Get My Stamp    8500345630468    1    1
    Verify Body Mystamp



