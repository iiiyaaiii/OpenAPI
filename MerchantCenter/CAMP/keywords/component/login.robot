*** Settings ***
Resource    ${CURDIR}/../../resources/init.robot
Resource    ${CURDIR}/../../resources/locators/common/login.robot

*** Keywords ***
Enter Username
    [Arguments]    ${username}
    Input Text    ${txt_username}    ${username}

Enter Password
    [Arguments]    ${password}
    Input Text    ${txt_password}    ${password}

Click Login Button
    Click Element    ${btn_login}

Select Promotion Menu
    Wait Until Element Is Visible    ${btn_menu_promotion}
    Click Element    ${btn_menu_promotion}

Select iTruemart Merchant
    Wait Until Element Is Visible    ${btn_itm_merchant}
    Click Element    ${btn_itm_merchant}

iTruemart Promotion Menu Should Be Appeared
    Wait Until Element Is Visible    ${btn_sidebar_menu}