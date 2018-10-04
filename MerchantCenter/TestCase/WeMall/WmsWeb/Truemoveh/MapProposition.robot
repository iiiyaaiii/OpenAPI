*** Settings ***
Suite Setup       WMS Switch Project    wemall
Suite Teardown    Close All Browsers
Force Tags        WMS-Web    Truemoveh    mock
Library           SeleniumLibrary
Library           String
Library           DateTime
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Truemoveh.txt
Resource          ../../../../Resource/WeMall/WebElement/Member_SignIn.txt
Resource          ../../../../Resource/WeMall/WebElement/Truemoveh.txt

*** Test Case ***
TC_MC_09872
    [Documentation]    Verify search not found
    [Tags]    Medium
    Go To Menu Proposition
    Search Proposition By Source Type    Bundle
    Go To Map Proposition Page
    Search Product By Product ID    123
    Page Should Contain    Data not found.

TC_MC_09874
    [Documentation]    Verify product product ID search incase never map
    [Tags]    Regression    Medium
    Go To Menu Proposition
    Search Proposition By Source Type    Bundle
    Go To Map Proposition Page
    Search Product By Product ID    L91200280
    Element Should Contain    ${lbl_searched_product_id}    L91200280

TC_MC_09875
    [Documentation]    Verify product product SKU search incase never map
    [Tags]    Regression    Medium
    Go To Menu Proposition
    Search Proposition By Source Type    Bundle
    Go To Map Proposition Page
    Search Product By SKU    robot-e-1-2
    The Search Warning Display Under Product SKU    * Required product name or product id
    Search Product By Product ID    L91200280
    Element Should Contain    ${lbl_searched_product_sku}    robot-e-1-2

TC_MC_09880
    [Documentation]    Verify Reset data for search
    [Tags]    Medium
    Go To Menu Proposition
    Search Proposition By Source Type    Bundle
    Go To Map Proposition Page
    Search Product By SKU    robot-e-1-2
    Search Product By Product ID    L91200280
    Reset Search Value
    All Search Fields Are Cleared The Value Correctly

TC_MC_09882
    [Documentation]    Verify Map some main product
    [Tags]    Regression    Medium
    Go To Menu Proposition
    Search Proposition By Source Type    Bundle
    Go To Map Proposition Page
    Search Product By Product Name    test
    Update Map Proposition With Product Successfully

TC_MC_09885
    [Documentation]    Verify back button
    [Tags]    Medium
    Go To Menu Proposition
    Search Proposition By Source Type    Bundle
    Go To Map Proposition Page
    Search Product By Product ID    L91200280
    Go Back To Proposition By Clicking Back On Map Page

