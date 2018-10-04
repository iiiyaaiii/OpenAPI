*** Settings ***
Resource    ${CURDIR}/../../resources/init.robot
Resource    ${CURDIR}/../../resources/locators/promotion/promotion_common.robot
Resource    ${CURDIR}/../../resources/locators/promotion/promotion_freebie_create.robot

*** Variables ***
${get_template_type}    //span[@class="widget-caption"]
${modal_title}    //div[@class="modal-header"]/h4
${latest_promotion_id}    //*[@id="promotionListTable"]/tbody/tr/td[4]
${existing_sku}    criteriaValuesDiv
${existing_sku_remove}    //*[@id="criteriaValuesDiv"]/div/span/span

*** Keywords ***
Open Create Promotion Page
    Click Element    ${btn_create_promotion}

Promotion Template Selection Page Should Be Appeared
    Page Title Should Be Appeared    Create Promotion

Select Promotion Template
    [Arguments]    ${promo_type}
    Run Keyword If    '${promo_type}' == 'Freebie'    Click Element    ${btn_freebie_template}
    Run Keyword If    '${promo_type}' == 'Bundle'    Click Element    ${btn_bundle_template}

Selected Promotion Template Page Should Be Appeared
    [Arguments]    ${promo_type}
    ${template_type}=    Get Text    ${get_template_type}
    Should Match    '${template_type}'    '${promo_type}'

Click Submit Promotion Form
    Click Element    ${btn_submit_form}

Click Cancel Promotion Form
    Click Element    ${btn_cancel_form}

Click Update Promotion Form
    Click Element    ${btn_update_form}

Select Promotion Period
    [Arguments]    ${promo_start}    ${promo_end}
    Click Element    &{create_freebie}[txt_promotion_period]
    Run Keyword If    '${promo_start}' != 'default' and '${promo_end}' != 'default'
    ...    Run Keywords
    ...    Input Text    &{create_freebie}[calendar_promotion_start]    ${promo_start}
    ...    AND    Input Text    &{create_freebie}[calendar_promotion_stop]    ${promo_end}
    Click Element    &{create_freebie}[btn_promotion_period_apply]

Promotion Should Be Appeared
    [Arguments]    ${promo_name}
    Wait Until Page Contains    ${promo_name}

Promotion Should Not Be Appeared
    [Arguments]    ${promo_name}
    Page Should Not Contain    ${promo_name}

Promotion Should Be Built With Specific Status
    [Arguments]    ${promo_status}
    Page Should Contain    ${promo_status}

Click Build Promotion
    Click Element    ${btn_build}

Promotion Build Popup Should Be Appeared
    Wait Until Loading Success
    ${get_title}=    Get Text    ${modal_title}
    Should Match    '${get_title}'    'Promotion(s) built'

Click Confirm on Promotion Build Popup
    Click Element    ${btn_build_confirm}

Pending Promotion Should Be Updated
    Page Should Not Contain    Create Pending
    Page Should Not Contain    Update Pending

Missing Mandatory - Text Field Message Should Be Appeared
    Error Message Should Be Appeared    &{err_create_freebie}[lbl_mandatory_text]

Missing Mandatory - Dropdown Field Message Should Be Appeared
    Error Message Should Be Appeared    &{err_create_freebie}[lbl_mandatory_ddl]

Missing Mandatory - Image Field Message Should Be Appeared
    Image Error Message Should Be Appeared    &{err_create_freebie}[lbl_mandatory_img]

Exceed Maximum Promotion Name Message Should Be Appeared
    Error Message Should Be Appeared    &{err_create_freebie}[lbl_exceeds_name]

Exceed Maximum Promotion Description Message Should Be Appeared
    Error Message Should Be Appeared    &{err_create_freebie}[lbl_exceeds_desc]

Invalid Discount Detail Format Message Should Be Appeared
    Error Message Should Be Appeared    &{err_create_bundle}[lbl_discount_type]

Invalid Discount Detail Range Message Should Be Appeared
    Error Message Should Be Appeared    &{err_create_bundle}[lbl_discount_range]

Alert For Duplicated Variant Should Be Appeared
    Wait Until Element Is Visible    ${popup_duplicated_variant}

Alert For Duplicated Variant Should Not Be Appeared
    Wait Until Element Is Not Visible    ${popup_duplicated_variant}

Click Confirm On Duplicated Variant Popup
    Click Element    ${popup_duplicated_variant_confirm}

Click Cancel On Duplicated Variant Popup
    Click Element    ${popup_duplicated_variant_cancel}

Get Latest Promotion ID
    ${promo_id}=    Get Text    ${latest_promotion_id}
    Set Suite Variable    ${promo_id}

Remove Entered Variant Value
    ${current_value}=    Get Element Attribute    ${existing_sku}@textContent
    ${check_result}=    Set Variable If
    ...    '${current_value}' != '${NONE}'    HasProduct
    Run Keyword If    '${check_result}' == 'HasProduct'    Delete Existing Variant

Delete Existing Variant
    ${number_of_sku}=    Get Matching Xpath Count    ${existing_sku_remove}
    :For    ${index}    IN RANGE    0    ${number_of_sku}
    \    Click Element    ${existing_sku_remove}
