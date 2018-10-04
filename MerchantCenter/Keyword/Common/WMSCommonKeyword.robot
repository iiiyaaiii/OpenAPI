*** Settings ***
Resource    ../../Resource/Common/globalInit.robot
Resource    ../../Resource/Common/WMSWeb/WMSLoginLocator.robot

*** Variables ***
${timeout}    10s

*** Keywords ***
Go to WMS
    Go to    ${URL_WMS}

Input Email To WMS Login
    [Arguments]    ${wms_user}
    Input Text    ${txt_wms_email_login}    ${wms_user}

Input Password To WMS Login
    [Arguments]    ${wms_pass}
    Input Password    ${txt_wms_password_login}    ${wms_pass}

Click WMS Login Button
    Click Button    ${btn_wms_login}

Login To WMS
    [Documentation]    WMS Login
    [Arguments]    ${username}    ${password}
    Go to WMS
    Input Email To WMS Login    ${username}
    Input Password To WMS Login    ${password}
    Click WMS Login Button
    Wait Until Element Is visible    ${div_wms_user_section}    ${timeout}

Switch Project On WMS
    [Arguments]    ${project}
    ${project}    Convert To Lowercase    ${project}
    ${project} =    Set Variable If    '${project}' == 'wls'    westore    ${project}
    ${project} =    Set Variable If    '${project}' == 'wm'    wemall    ${project}
    ${expect_project_locator}    Replace String    ${img_project}    v_project_name    ${project}
    ${wms_current_project}    Get Matching Xpath Count    ${expect_project_locator}
    Run Keyword If    '${wms_current_project}' == '0'    Select WMS Project    ${expect_project_locator}

Click To View WMS Project List
    Click Element    ${li_wms_project_list}
    Wait Until Element Is Visible    ${li_wms_project_list_open}    ${timeout}

Select WMS Project
    [Arguments]    ${project_locator}
    Click To View WMS Project List
    Click Element    ${project_locator}

    # Wait Until Element Is Visible    //li[@class="light-blue user-min open"]
    # Click Element    //li[@class="light-blue user-min open"][1]/ul//img
    # Wait Until Element Is Visible    //li[@class="light-blue user-min"][1]/a//img[contains(@src,'logo_${Project}.png')]
