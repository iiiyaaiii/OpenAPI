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
### Banner ###
TC_MC_07935
    [Documentation]    [Banner List] Valid Condition - All Parameters
    Get Banner List    3    updated_at    desc    inactive
    Verify Body Banner List

TC_MC_07949
    [Documentation]    [Add Banner] Enter both required fields and optional fields
    Post Add Banner    testName    testURL    testImageURL    inactive    99
    Verify Body Add Banner

TC_MC_07957
    [Documentation]    [Edit Banner] Update Name
    Put Edit Banner    testUpdate
    Verify Body Edit Name Banner

TC_MC_07958
    [Documentation]    [Edit Banner] Update URL
    Put Edit Banner    testUpdateURL
    Verify Body Edit Url Banner

TC_MC_07959
    [Documentation]    [Edit Banner] Update Image URL
    Put Edit Banner    testUpdateImageURL
    Verify Body Edit Image Url Banner




