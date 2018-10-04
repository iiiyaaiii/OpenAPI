*** Settings ***
Resource    ${CURDIR}/../../resources/init.robot
Resource    ${CURDIR}/../../resources/locators/campaign/campaign_list.robot
Resource    ${CURDIR}/../../resources/wordmap/campaign_list.robot

*** Variables ***
${latest_camp_ID}    xpath=//*[@id="campaignListTable"]/tbody/tr[1]/td[3]
${filter_option}    xpath=//span[text()='_optionName']
${camp_active}    xpath=//table[@id="campaignListTable"]//following::i[(@class="fa fa-circle") and (@style[contains(.,"color: green")])]
${first_delete}    deleteBtn1
${first_checkbox}    checkboxSpan1
${first_promotions}    promotionBtn1
${table_header}    xpath=//th[text()="_label"]
${pagination_opt}    xpath=//select[@id="paginationSelect"]/option[@value="_selectedValue"]
${page_limit}    10

*** Keywords ***
Open Campaign List Page
    Click Element    ${btn_campaign_list}

Campaign List Page Should Be Appeared
    Page Title Should Be Appeared    Campaign List

All Campaign List Fields Should Be Appeared
    ${labelName}=    Get Dictionary Keys    ${label_campaign_list}
    :For    ${labelName}    IN    @{labelName}
    \    ${type}    ${element}=    Split String    ${labelName}    _    1
    \    Run Keyword If    '${type}' == 'chk'    Checkbox Label Should Be Appeared    &{label_campaign_list}[${labelName}]
    \    Run Keyword If    '${type}' == 'tbl'    Table Header Label Should Be Appeared    &{label_campaign_list}[${labelName}]
    \    Run Keyword If    '${type}' == 'btn'    Button Label On List Page Should Be Appeared    &{label_campaign_list}[${labelName}]

Campaign Should Be Appeared
    [Arguments]    ${camp_name}
    Wait Until Page Contains    ${camp_name}

Enter Campaign ID
    [Arguments]    ${camp_id}
    Input Text    &{campaign_list}[txt_campaign_id]    ${camp_id}

Enter Campaign Name
    [Arguments]    ${camp_name}
    Input Text    &{campaign_list}[txt_campaign_name]    ${camp_name}

Enter Campaign Period
    [Arguments]    ${camp_start}    ${camp_end}
    Click Element    &{campaign_list}[txt_campaign_period]
    Run Keyword If    '${camp_start}' != 'default' and '${camp_end}' != 'default'
    ...    Run Keywords
    ...    Input Text    &{campaign_list}[calendar_campaign_start]    ${camp_start}
    ...    AND    Input Text    &{campaign_list}[calendar_campaign_stop]    ${camp_end}
    Click Element    &{campaign_list}[btn_calendar_apply]

Select Search Filter
    [Arguments]    ${filter_name}
    ${locator}=    Replace String    ${filter_option}    _optionName    ${filter_name}
    Click Element    ${locator}

Click Search Button
    Click Element    &{campaign_list}[btn_search]

Click Clear Button
    Click Element    &{campaign_list}[btn_clear]

Click Enable Button
    Click Element    &{campaign_list}[btn_enable]

Click Disable Button
    Click Element    &{campaign_list}[btn_disable]

Searched Campaign ID Should Be Found
    [Arguments]    ${camp_id}
    Page Should Contain    ${camp_id}

Searched Campaign Name Should Be Found
    [Arguments]    ${camp_name}
    Page Should Contain    ${camp_name}

Delete Latest Campaign
    Click Element    ${first_delete}

Delete Popup Should Be Appeared
    Element Should Be Visible    &{delete_popup}[modal_delete]

Click Confirm on Delete Popup
    Click Element    &{delete_popup}[btn_confirm]

Click Cancel on Delete Popup
    Click Element    &{delete_popup}[btn_cancel]

Campaign Should Not Be Appeared
    [Arguments]    ${camp}
    Page Should Not Contain    ${camp}

Get Latest Campaign ID
    ${camp_id}=    Get Text    ${latest_camp_ID}
    Set Suite Variable    ${camp_id}

Select Campaign Checkbox
    Click Element    ${first_checkbox}

Update Campaign Status
    [Arguments]    ${camp_status}
    ${is_active}=    Run Keyword And Return Status    Element Should Be Visible    ${camp_active}
    Run Keyword If    '${is_active}' == 'True' and '${camp_status}' == 'Disable'    Click Disable Button
    Run Keyword If    '${is_active}' == 'False' and '${camp_status}' == 'Enable'    Click Enable Button
    Wait Until Loading Success

Campaign Status Should Be Enabled
    Element Should Be Visible    ${camp_active}

Campaign Status Should Be Disabled
    Element Should Not Be Visible    ${camp_active}

Click Promotions Button
    Click Element    ${first_promotions}

Sort Campaign List
    [Arguments]    ${sorting_opt}
    ${locator}=    Replace String    ${table_header}    _label    ${sorting_opt}
    Click Element    ${locator}

Campaign Records Should Be Sorted By Campaign ID
    [Arguments]    ${order_opt}
    :For    ${index}    IN RANGE    1    ${page_limit}
    \    ${current_data}=    Get Text    //*[@id="campaignListTable"]/tbody/tr[${index}]/td[3]
    \    ${next_data}=    Get Text    //*[@id="campaignListTable"]/tbody/tr[${index+1}]/td[3]
    \    Run Keyword If    '${order_opt}' == 'Ascending'    Should Be True    ${current_data} <= ${next_data}
    \    Run Keyword If    '${order_opt}' == 'Descending'    Should Be True    ${current_data} >= ${next_data}

Campaign Records Should Be Sorted By Campaign Name
    [Arguments]    ${order_opt}
    ${retrieve_data}=    Create List
    :For    ${index}    IN RANGE    1    ${page_limit}
    \    Wait Until Element Is Visible    //*[@id="campaignListTable"]/tbody/tr[${index}]/td[4]
    \    ${data}=    Get Text    //*[@id="campaignListTable"]/tbody/tr[${index}]/td[4]
    \    Append To List    ${retrieve_data}    ${data}
    ${sorted_data}=    Copy List    ${retrieve_data}
    Sort List    ${sorted_data}
    Run Keyword If    '${order_opt}' == 'Ascending'    Lists Should Be Equal    ${retrieve_data}    ${sorted_data}
    Run Keyword If    '${order_opt}' == 'Descending'    Run Keyword And Expect Error    Lists are different:*    Lists Should Be Equal    ${retrieve_data}    ${sorted_data}

Select Number Of Records
    [Arguments]    ${record_number}
    Click Element    &{campaign_list}[rdo_pagination]
    ${select_option}=    Replace String    ${pagination_opt}    _selectedValue    ${record_number}
    Click Element    ${select_option}

Number Of Campaign Records Should Be Appeared As Selected
    [Arguments]    ${record_number}
    Wait Until Loading Success
    ${retrieve_data}=    Get Matching Xpath Count    //tbody/tr
    Should Match    ${record_number}    ${retrieve_data}
