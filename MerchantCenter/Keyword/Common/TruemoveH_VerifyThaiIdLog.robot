*** Settings ***
Library           SeleniumLibrary    run_on_failure=Capture Page Screenshot
Library            String
Library           BuiltIn
Library           ../PythonLibrary/_customkeyword.py
Resource          ../../Resource/WeMall/WebElement/Truemoveh.txt


*** Keywords ***
Go to TruemoveH order Verify Thai ID Log on wms page
    [Documentation]    Go to WMS and go to TruemoveH order
    Go to    ${URL_WMS}/tmvh-verify-thai-id

Search Thai ID Log by id card
    [Documentation]    Enter id card and click search
    [Arguments]    ${id_card}
    Input Text    id=id_card    ${id_card}
    ${passed} =    Run Keyword And Return Status    Element Should Be Enabled    ${btn_search_order}
    Run Keyword if    ${passed}    Click Element    ${btn_search_order}
    Set Test Variable    ${id_card}

Search Thai ID Log by first name
    [Documentation]    Enter id card and click search
    [Arguments]    ${firstName}
    Input Text    id=first_name    ${firstName}
    ${passed} =    Run Keyword And Return Status    Element Should Be Enabled    ${btn_search_order}
    Run Keyword if    ${passed}    Click Element    ${btn_search_order}
    Set Test Variable    ${firstName}

Search Thai ID Log by last name
    [Documentation]    Enter id card and click search
    [Arguments]    ${lastName}
    Input Text    id=last_name    ${lastName}
    ${passed} =    Run Keyword And Return Status    Element Should Be Enabled    ${btn_search_order}
    Run Keyword if    ${passed}    Click Element    ${btn_search_order}
    Set Test Variable    ${lastName}

Search Thai ID Log by telephone number
    [Documentation]    Enter id card and click search
    [Arguments]    ${phone}
    Input Text    id=phone    ${phone}
    ${passed} =    Run Keyword And Return Status    Element Should Be Enabled    ${btn_search_order}
    Run Keyword if    ${passed}    Click Element    ${btn_search_order}
    Set Test Variable    ${phone}

Check the searched result displays searched id card correctly
    [Documentation]    Check ID Card at the first record
    Element Should Contain    //table[@id="dynamic-table"]/tbody/tr[1]/td[2]/div    ${id_card}

Check the searched result displays searched first name correctly
    [Documentation]    Check first name at the first record
    ${name}    Get Text    //table[@id="dynamic-table"]/tbody/tr[1]/td[3]/div
    ${first}    ${last}    ${phone}=    Split String    ${name}
    Should Be Equal As Strings    ${firstName}    ${first}

Check the searched result displays searched last name correctly
    [Documentation]    Check last name at the first record
    ${name}    Get Text    //table[@id="dynamic-table"]/tbody/tr[1]/td[3]/div
    ${first}    ${last}    ${phone}=    Split String    ${name}
    Should Be Equal As Strings    ${lastName}    ${last}

Check the searched result displays searched telephone number correctly
    [Documentation]    Check phone at the first record
    ${name}    Get Text    //table[@id="dynamic-table"]/tbody/tr[1]/td[3]/div
    @{name}=    Split String    ${name}
    Should Be Equal As Strings    ${phone}    @{name}[2]

Check the error message displays under ID Card field as
    [Documentation]    Check error under ID card field
    [Arguments]    ${message}
    Element Should Contain    //div[@class="help-block help-block-id col-xs-12"]    ${message}

Check the error message displays under Tel field as
    [Documentation]    Check error under ID card field
    [Arguments]    ${message}
    Element Should Contain    //*[@id="formsearch"]/div[1]/div[4]/div/div[2]    ${message}
