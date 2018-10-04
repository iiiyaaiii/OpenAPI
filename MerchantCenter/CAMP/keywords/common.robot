*** Settings ***
Library    ${CURDIR}/../python_library/file_upload.py
Resource    ${CURDIR}/../resources/init.robot
Resource    ${CURDIR}/../resources/locators/common/login.robot
Resource    ${CURDIR}/../resources/locators/common/landing.robot
Resource    ${CURDIR}/../resources/locators/common/main_menu.robot

*** Variables ***
&{ui_label}    txtLabel=xpath=//label[text()="_label"]
...    btnLabel=xpath=//input[(@type="button") and (@value="_label")]
...    btnListLabel=xpath=//button[text()="_label"]
...    errLabel=xpath=//div[@class[contains(.,"has-error")]]//following-sibling::small[text()="_label"]
...    errImage=xpath=//p[text()="_label"]
...    chkLabel=xpath=//input[@type="checkbox"]//following-sibling::span[text()="_label"]
...    tblLabel=xpath=//th[text()="_label"]

${no_loading}    xpath=//div[@class="loadedContent"]

*** Keywords ***
Open CAMPS Browser
    Set Selenium Speed    ${SELENIUM_SPEED}
    Open Browser    ${CAMP_URL}    ${BROWSER}
    Maximize Browser Window

CAMP Landing Page Should Be Appeared
    Wait Until Element Is Visible    ${btn_menu}    ${DELAY}

Page Title Should Be Appeared
    [Arguments]    ${expected_title}
    ${get_title}=    Get Text    ${lbl_pageTitle}
    Should Match    '${get_title}'    '${expected_title}'

Fill In Textbox
    [Arguments]    ${elementID}    ${enteredText}
    Input Text    ${elementID}    ${enteredText}

Fill In Content Console
    [Arguments]    ${elementID}    ${enteredText}
    Execute JavaScript    CKEDITOR.instances["${elementID}"].setData("${enteredText}")

Tick Checkbox
    [Arguments]    ${elementID}    ${selectedOption}
    ${current_value}=    Execute JavaScript    return $('input[id="${elementID}"]').prop("checked")
    Run Keyword If    '${current_value}' == 'True' and '${selectedOption}' == 'off'    Click Element    ${elementID}
    Run Keyword If    '${current_value}' == 'False' and '${selectedOption}' == 'on'    Click Element    ${elementID}

Select Dropdown List Option
    [Arguments]    ${elementID}    ${optionLabel}
    Select From List By Label    ${elementID}    ${optionLabel}

Select Image To Upload
    [Arguments]    ${elementID}    ${file_name}
    ${image_path}=    Set Variable    ${CURDIR}/../resources/testdata/${file_name}
    ${canonical_path}=    file_upload.Get Canonical Path    ${image_path}
    Choose File    ${elementID}    ${canonical_path}

Text Label Should Be Appeared
    [Arguments]    ${labelText}
    ${locator}=    Replace String    &{ui_label}[txtLabel]    _label    ${labelText}
    Element Should Be Visible    ${locator}

Button Label Should Be Appeared
    [Arguments]    ${labelText}
    ${locator}=    Replace String    &{ui_label}[btnLabel]    _label    ${labelText}
    Element Should Be Visible    ${locator}

Button Label On List Page Should Be Appeared
    [Arguments]    ${labelText}
    ${locator}=    Replace String    &{ui_label}[btnListLabel]    _label    ${labelText}
    Element Should Be Visible    ${locator}

Error Message Should Be Appeared
    [Arguments]    ${labelText}
    ${locator}=    Replace String    &{ui_label}[errLabel]    _label    ${labelText}
    Element Should Be Visible    ${locator}

Image Error Message Should Be Appeared
    [Arguments]    ${labelText}
    ${locator}=    Replace String    &{ui_label}[errImage]    _label    ${labelText}
    Element Should Be Visible    ${locator}

Checkbox Label Should Be Appeared
    [Arguments]    ${labelText}
    ${locator}=    Replace String    &{ui_label}[chkLabel]    _label    ${labelText}
    Element Should Be Visible    ${locator}

Table Header Label Should Be Appeared
    [Arguments]    ${labelText}
    ${locator}=    Replace String    &{ui_label}[tblLabel]    _label    ${labelText}
    Element Should Be Visible    ${locator}

Wait Until Loading Success
    Wait Until Element Is Visible    ${no_loading}    ${DELAY}

