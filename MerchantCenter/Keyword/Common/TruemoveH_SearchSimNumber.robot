*** Settings ***
Library           SeleniumLibrary    run_on_failure=Capture Page Screenshot
Library            String
Library           BuiltIn
Library           ../PythonLibrary/_customkeyword.py
Resource          ../../Resource/WeMall/WebElement/Truemoveh.txt

*** Keywords ***
Go To Select Lucky Sim Number Page
    Wait Until Element Is Visible    ${btn_lucky_number}
    Click Element    ${btn_lucky_number}
    Page Should Contain    เบอร์มงคล ผลรวมดี เพิ่มมงคลชีวิต

Select Lucky Sim Type
    [Arguments]    ${sim_type}
    Execute JavaScript    window.scrollTo(0,700)
    Run Keyword if    '${sim_type}' == 'บุคคลธรรมดา'    Select Radio Button    sim    0

Search Sim Number By Identify The Last Two Position
    [Arguments]    ${digit1}    ${digit2}
    Wait Until ELement Is Enabled    id=input_number9
    Press Key    id=input_number9    ${digit1}
    Press Key    id=input_number10    ${digit2}
    Set Test Variable    ${digit1}
    Set Test Variable    ${digit2}

The Last Two Numbers Are Displayed In The Result Correctly
    Wait Until Element Is Visible    //div[@class="col-md-12 box-mobile-number result-search"]
    ${count_numbers}    Get matching xpath count    //div[@class="col-md-12 box-mobile-number result-search"]/div
    : FOR    ${i}    IN RANGE    1    ${count_numbers}-1
    \    ${number}    Run Keyword if    '${count_numbers}' > 2    Get Text    //div[@class="col-md-12 box-mobile-number result-search"]/div[${i}]/a
    \    ${last_two}    Get Substring   ${number}   -2
    \    Should Be Equal    '${last_two}'    '${digit1}${digit2}'

Search Sim Number By Digits In Sim Number
    [Arguments]    ${include_digits}
    Wait Until Element Is Visible    id=includeNumberSearch
    Input Text    id=includeNumberSearch    ${include_digits}
    Set Test Variable    ${include_digits}

Search Sim Number By Digits Not In Sim Number
    [Arguments]    ${exclude_digit}
    Wait Until Element Is Visible    id=excludeNumberSearch
    Input Text    id=excludeNumberSearch    ${exclude_digit}
    Set Test Variable    ${exclude_digit}

The Results Are Displayed With The Searched Digits Correctly
    Wait Until Element Is Visible    //div[@class="col-md-12 box-mobile-number result-search"]
    ${count_numbers}    Get matching xpath count    //div[@class="col-md-12 box-mobile-number result-search"]/div
    : FOR    ${i}    IN RANGE    1    ${count_numbers}-1
    \    ${number}    Run Keyword if    '${count_numbers}' > 2    Get Text    //div[@class="col-md-12 box-mobile-number result-search"]/div[${i}]/a
    \    Check Digits Is In Sim Number    ${number}

The Results Are Displayed Without The Searched Digits Correctly
    Wait Until Element Is Visible    //div[@class="col-md-12 box-mobile-number result-search"]
    ${count_numbers}    Get matching xpath count    //div[@class="col-md-12 box-mobile-number result-search"]/div
    : FOR    ${i}    IN RANGE    1    ${count_numbers}-1
    \    ${number}    Run Keyword if    '${count_numbers}' > 2    Get Text    //div[@class="col-md-12 box-mobile-number result-search"]/div[${i}]/a
    \    Check Digits Is Not In Sim Number    ${number}

Check Digits Is In Sim Number
    [Arguments]    ${number}
    ${length} =    Get Length    ${include_digits}
    @{include_digit}    Split String To Characters    ${include_digits}
    : FOR    ${i}    IN RANGE    0    ${length}
    \    Should Contain Any    ${number}    @{include_digit}[${i}]

Check Digits Is Not In Sim Number
    [Arguments]    ${number}
    ${length} =    Get Length    ${exclude_digit}
    @{exclude_digit}    Split String To Characters    ${exclude_digit}
    : FOR    ${i}    IN RANGE    0    ${length}
    \    Should Not Contain Any    ${number}    @{exclude_digit}[${i}]

Select Horoscope
    [Arguments]    ${horoscope}
    Wait Until Element Is Visible    //select[@name="phoneModel"]
    Select From List    //select[@name="phoneModel"]    ${horoscope}
    ${horo_number}    Get Substring    ${horoscope}    0    2
    Set Test Variable    ${horo_number}

Select Horoscope For Mobile Lucky Tab
    [Arguments]    ${horoscope}
    @{horo}    Get WebElements    //select[@name="phoneModel"]
    Wait Until Element Is Visible    @{horo}[1]
    Select From List    @{horo}[1]    ${horoscope}
    ${horo_number}    Get Substring    ${horoscope}    0    2
    Set Test Variable    ${horo_number}

The Horoscope Displays The Description As Expected
    Execute JavaScript    window.scrollTo(0,1200)
    ${expected}    Execute Javascript    return $("span.horo-score").text().trim()
    Should Be Equal    ${expected}    ${horo_number}

Click Search Button
    Wait Until Element Is Visible    //button[@type="submit"]
    Click Element    //button[@type="submit"]

The Warning Message Is Displayed Under Exclude Number Field
    [Arguments]    ${message}
    Wait Until Element Is Visible    id=m-exclude
    Element Should Contain    id=m-exclude    ${message}

The Warning Message Is Displayed Under Include Number Field
    [Arguments]    ${message}
    Wait Until Element Is Visible    id=m-include
    Element Should Contain    id=m-include    ${message}

The Warning Message Is Displayed Under Position Field
    [Arguments]    ${message}
    Wait Until Element Is Visible    id=m-number
    Element Should Contain    id=m-number    ${message}

Select Lucky Number Tab
    Wait Until Element Is Enabled    id=tab_lucky
    Click Element    //a[@id="tab_lucky"]

Select The First Number
    Execute JavaScript    window.scrollTo(0,1000)
    Wait Until Element Is Visible    //div[@class="col-md-12 box-mobile-number result-search"]/div[1]/a
    Click Element    //div[@class="col-md-12 box-mobile-number result-search"]/div[1]/a

Select The First Promotion
    Wait Until Element Is Enabled    //div[@class="card-promotion-top"]
    Click Element    //div[@class="card-promotion-top"]

Click Register Button
    Wait Until Element Is Enabled    id=btnRegist
    Click Element    id=btnRegist

Check The Validation Field
    Element Should Be Visible    id=cardid
    Element Should Be Visible    id=birthdateDay
    Element Should Be Visible    id=birthdateMonth
    Element Should Be Visible    id=birthdateYear
    Element Should Be Visible    id=check_idcard
    Element Should Be Visible    id=link_cancel



