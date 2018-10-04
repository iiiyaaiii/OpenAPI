*** Settings ***
Library           SeleniumLibrary    30    15    run_on_failure=Capture Page Screenshot
Library           String
Library           XML
Resource          ../../Resource/WeLoveShopping/WebElement/Dealzap.robot
Resource          ../../Keyword/Common/Common.txt

*** Variables ***
${checkedOption}    //label[text()[contains(.,"_option")]]/input[@checked]
${uncheckedOption}    //label[text()[contains(.,"_option")]]/input

*** Keyword ***

Go To LevelC Dealzap
    Go to    ${URL_PORTAL}/dealzapp

Click Filter Sub-Campaign
    [Arguments]    ${subcampaign1}
    Click Element Contain Text    ${chk_viewby}    ${subcampaign1}

Click Filter Category
    [Arguments]    ${category1}
    Click Element Contain Text    ${chk_viewby}    ${category1}

Verify Fillter After Selected Sub-Campaign
    [Arguments]    ${subcampaign2}
    ${is_checked}    Execute Javascript    return $('.group-lvc-menu-list .option-wetrust').eq(2).find('.checkbox:contains("${subcampaign2}") input').is(':checked')
    Should Be True    ${is_checked}
    ${is_contain}    Execute Javascript    return $('.sort-active:contains("${subcampaign2}")').is(':visible')
    Should Be True    ${is_contain}

Checkbox Should Be Ticked
    [Arguments]    ${menu_option}
    ${locator}=    Replace String    ${checkedOption}    _option    ${menu_option}
    Checkbox Should Be Selected    ${locator}

Checkbox Should Be Unticked
    [Arguments]    ${menu_option}
    ${locator}=    Replace String    ${uncheckedOption}    _option    ${menu_option}
    Checkbox Should Not Be Selected    ${locator}

Verify Fillter After Selected Category
    [Arguments]    ${category4}
    ${is_checked}    Execute Javascript    return $('.group-lvc-menu-list .option-wetrust').eq(1).find('.checkbox:contains("${category4}") input').is(':checked')
    Should Be True    ${is_checked}
    ${is_contain}    Execute Javascript    return $('.sort-active:contains("${category4}")').is(':visible')
    Should Be True    ${is_contain}

Select Lower Price Sorting Product
    Execute javascript    ${ddl_lower_price}

Verify Fillter After Selected
    [Arguments]    ${category2}    ${subcampaign2}    ${sorting}
    ${is_contain}    Execute Javascript    return $('.sort-active:contains("${category2}")').is(':visible')
    Should Be True    ${is_contain}
    ${is_contain}    Execute Javascript    return $('.sort-active:contains("${subcampaign2}")').is(':visible')
    Should Be True    ${is_contain}
    Element Should Contain    ${txt_lower_price}    ${sorting}

Verify Not Display Category When De-selected
    [Arguments]    ${category5}
    ${is_contain}    Execute Javascript    return $('.sort-active:contains("${category5}")').length
    Should Be Equal    '${is_contain}'    '0'

Verify Not Display Sub-Campaign When De-selected
    [Arguments]    ${subcampaign3}
    ${is_contain}    Execute Javascript    return $('.sort-active:contains("${subcampaign3}")').length
    Should Be Equal    '${is_contain}'    '0'

Click Cancle On Filter Bar
    Execute javascript    ${btn_filter}

Click Cancle All On Filter Bar
    Execute javascript    ${btn_filter_all}


Verify Price After Sorting
    ${count}    Execute Javascript    return $('.items-list-box > li').length
    : FOR    ${i}    IN RANGE    1    ${count}
    \    ${price_now}=    Get Text    //*[@id="wrapper"]/div[3]/div[2]/div[3]/div[2]/ul[1]/li[${i}]/div/div[2]/div[1]/span[1]
    \    ${i_next}    Add Operation    ${i}    1
    \    ${price_next}=    Get Text    //*[@id="wrapper"]/div[3]/div[2]/div[3]/div[2]/ul[1]/li[${i_next}]/div/div[2]/div[1]/span[1]
    \    ${price_now}    Remove String    ${price_now}    บาท
    \    ${price_next}    Remove String    ${price_next}    บาท
    \    Should Be True    ${price_now} <= ${price_next}

Click First Product After Sorting
    Execute javascript    ${txt_product_first}

Verify Product
    [Arguments]    ${category3}    ${time}
    ${is_contain}    Execute Javascript    return $('.breadcrumb-box:contains("${category3}")').is(':visible')
    Should Be True    ${is_contain}
    ${is_contain}    Execute Javascript    return $('.inner-dealzapp:contains("${time}")').is(':visible')
    Should Be True    ${is_contain}
