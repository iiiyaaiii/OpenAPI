*** Settings ***
Test Teardown    Close All Browsers
Force Tags        Wemall-Web    Search-API    Sprint2017MC10
Test Timeout      3 minutes
Library           SeleniumLibrary    15    5    run_on_failure=Capture Page Screenshot
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Resource/WeMall/WebElement/Widget.txt
Resource          ../../../../Resource/WeMall/WebElement/Search.txt
Resource          ../../../../Resource/WeMall/WebElement/ManageProfile.txt
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Member_SignIn.txt


*** Test Cases ***
TC_MC_03233
    [Documentation]    [Wemall] Level C - Search : Display Product have promocode
    [Tags]    Regression     Ligo,Sprint2017MC10    High    SmokeTest
    Open Browser    ${URL_PORTAL}    ${BROWSER}
    Input Text    ${input_search}    robot
    Execute Javascript    ${button_search}.click()
    Element Should Be Visible    ${sidebar_wemall}
    ${count_category}    Get Matching Xpath Count    ${sidebar_wemall}
    ${count_category}    Convert To Integer    ${count_category}
    Should Be True    ${count_category} > 0
    ${count_match}    Execute Javascript    return $('.discount-area:visible').length
    ${count_match}    Convert To Integer    ${count_match}
    Should Be True    ${count_match} >= 0

TC_MC_03235
    [Documentation]    [Wemall] Level C - Search : Display Product have price length
    [Tags]    Regression     Ligo,Sprint2017MC10    High
    Open Browser    ${URL_PORTAL}    ${BROWSER}
    Input Text    ${input_search}    robot
    Execute Javascript    ${button_search}.click()
    Element Should Be Visible    ${sidebar_wemall}
    ${count_category}    Get Matching Xpath Count    ${sidebar_wemall}
    ${count_category}    Convert To Integer    ${count_category}
    Should Be True    ${count_category} > 0
    ${compare_price}    Get Matching Xpath Count    //span[contains(@class,'compare')]
    ${compare_price}    Convert To Integer    ${compare_price}
    Should Be True    ${compare_price} > 0

TC_MC_03236
    [Documentation]    [Wemall] Level C - Search : Display Product price have digit
    [Tags]    Regression     Ligo,Sprint2017MC10    High
    Open Browser    ${URL_PORTAL}    ${BROWSER}
    Input Text    ${input_search}    ${seller_url1000}
    Execute Javascript    ${button_search}.click()
    Element Should Be Visible    ${sidebar_wemall}
    ${count_category}    Get Matching Xpath Count    ${sidebar_wemall}
    ${count_category}    Convert To Integer    ${count_category}
    Should Be True    ${count_category} > 0
    ${digit_price}    Execute Javascript    return $('span.price')[0].innerText;
    Should Contain    ${digit_price}    .
    Should Contain    ${digit_price}    บาท

TC_MC_03237
    [Documentation]    [Wemall] Level C - Search : Display - Number of result
    [Tags]    Ligo,Sprint2017MC10    High
    Open Browser    ${URL_PORTAL}    ${BROWSER}
    Input Text    ${input_search}    robot
    Execute Javascript    ${button_search}.click()
    Element Should Be Visible    ${sidebar_wemall}
    ${count_category}    Get Matching Xpath Count    ${sidebar_wemall}
    ${count_category}    Convert To Integer    ${count_category}
    Should Be True    ${count_category} > 0
    ## 48 item
    ${count_match}    Get Matching Xpath Count    //div[contains(@class,'item-detail')]
    ${count_match}    Convert To Integer    ${count_match}
    Should Be True    ${count_match} >= 1
    ## num show
    Element Should Be Visible    //div[@class='col-left']
    Element Should Be Visible    ${lvc_search_title}
    Element Should Be Visible    //div[@class='list-box']
    Element Should Be Visible    //span[@class='highlight_num']
    ${text_show}=    Get Text    //div[@class='list-box']
    ${result_count}=    Get Text    //span[@class='highlight_num']
    Element Should Contain    //div[@class='list-box']    ${text_show}
    Element Should Contain    //div[@class='text-normal-title']    ผลการค้นหา
    Element Should Contain    //h2[@class='text-normal-title']    robot
    Should Be True    ${result_count} > 0

TC_MC_03245
    [Documentation]    [WM Promotion] Show badge Promotion on product discount by price of price length at levelC when search all product
    [Tags]     Ligo,Sprint2017MC10    High
    Open Browser    ${URL_PORTAL}    ${BROWSER}
    Input Text    ${input_search}    robot
    Execute Javascript    ${button_search}.click()
    Element Should Be Visible    ${sidebar_wemall}
    ${count_category}    Get Matching Xpath Count    ${sidebar_wemall}
    ${count_category}    Convert To Integer    ${count_category}
    Should Be True    ${count_category} > 0
    ## sort
    Execute Javascript    $('.dropdown-menu li')[1].click()
    Execute Javascript    $('.dropdown-menu li a')[1].click()
    ## tag promotion
    ${count_match_tag}    Get Matching Xpath Count    //a[contains(@class,'product-promotion')]
    ${count_match_tag}    Convert To Integer    ${count_match_tag}
    Should Be True    ${count_match_tag} > 0

TC_MC_03246
    [Documentation]    [Wemall] Level C-Search : Search corporate product by English fullname
    [Tags]    Regression     Ligo,Sprint2017MC10    High    SmokeTest
    Open Browser    ${URL_PORTAL}    ${BROWSER}
    Input Text    ${input_search}    Test
    Execute Javascript    ${button_search}.click()
    Element Should Be Visible    ${sidebar_wemall}
    ${count_category}    Get Matching Xpath Count    ${sidebar_wemall}
    ${count_category}    Convert To Integer    ${count_category}
    Should Be True    ${count_category} > 0
    ## Matching
    ${count_match}    Get Matching Xpath Count    //a[contains(@class,'item-name') and contains(text(),'Test')]
    ${count_match}    Convert To Integer    ${count_match}
    Should Be True    ${count_match} > 0
