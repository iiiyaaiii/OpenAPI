*** Settings ***
Resource    ${CURDIR}/../../resources/init.robot
Resource    ${CURDIR}/../../resources/wordmap/promotion_list.robot
Resource    ${CURDIR}/../../resources/locators/promotion/promotion_list.robot

*** Variables ***
${promo_filter_option}    xpath=//span[text()='_optionName']
${promo_table_header}    xpath=//th[text()="_label"]

*** Keywords ***
Open Promotion List Page
    Click Element    ${btn_promotion_list}

Promotion List For Specific Campaign Page Should Be Appeared
    [Arguments]    ${camp_name}
    Page Title Should Be Appeared    Campaign ${camp_name} (ID: ${camp_id})

All Promotion List Fields Should Be Appeared
    ${labelName}=    Get Dictionary Keys    ${label_promotion_list}
    :For    ${labelName}    IN    @{labelName}
    \    ${type}    ${element}=    Split String    ${labelName}    _    1
    \    Run Keyword If    '${type}' == 'ddl'    Text Label Should Be Appeared    &{label_promotion_list}[${labelName}]
    \    Run Keyword If    '${type}' == 'chk'    Checkbox Label Should Be Appeared    &{label_promotion_list}[${labelName}]
    \    Run Keyword If    '${type}' == 'tbl'    Table Header Label Should Be Appeared    &{label_promotion_list}[${labelName}]
    \    Run Keyword If    '${type}' == 'btn'    Button Label On List Page Should Be Appeared    &{label_promotion_list}[${labelName}]

Enter Campaign ID
    [Arguments]    ${camp_id}
    Input Text    &{promo_list}[txt_campaign_id]    ${camp_id}

Enter Campaign Name
    [Arguments]    ${camp_name}
    Input Text    &{promo_list}[txt_campaign_name]    ${camp_name}

Enter Promotion ID
    [Arguments]    ${promo_id}
    Input Text    &{promo_list}[txt_promo_id]    ${promo_id}

Enter Promotion Name
    [Arguments]    ${promo_name}
    Input Text    &{promo_list}[txt_promo_name]    ${promo_name}

Select Promotion Type
    [Arguments]    ${promo_type}
    [Documentation]    Only 'Freebie' and 'Bundle' options are available right now
    Select From List By Label    &{promo_list}[ddl_promo_type]    ${promo_type}

Select Promotion Search Filter
    [Arguments]    ${filter_name}
    ${locator}=    Replace String    ${promo_filter_option}    _optionName    ${filter_name}
    Click Element    ${locator}

Click Search Promotion Button
    Click Element    &{promo_list}[btn_search]

Click Clear Promotion Button
    Click Element    &{promo_list}[btn_clear]

Searched Promotion Should Be Appeared
    [Arguments]    ${promo_name}
    Page Should Contain    ${promo_name}