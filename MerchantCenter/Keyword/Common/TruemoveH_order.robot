*** Settings ***
Library           SeleniumLibrary    run_on_failure=Capture Page Screenshot
Library           String
Library           ../PythonLibrary/_customkeyword.py
Resource          ../../Resource/WeMall/WebElement/Truemoveh.txt


*** Keywords ***
Go to TruemoveH order report on wms page
    [Documentation]    Go to WMS and go to TruemoveH order
    Go to    ${URL_WMS}/tmvh-order

Search order by verify status
    [Documentation]    search TruemoveH order by verify status
    [Arguments]    ${status}
    Select From List    ${verify_status_dropdown}    ${status}
    Wait Until Element Is Visible    ${btn_search_order}
    Click Element    ${btn_search_order}

Go to customer info verify page
    [Documentation]    Click ID Card link to go to customer info verify page
    Wait Until Element Is Visible    ${link_ID_card}
    Click Element    ${link_ID_card}
    Select Window    title=Truemove H | Customer Info Verify

Approve this order and confirm
    [Documentation]    Click Approve button and confirm on Customer Info Verify page
    Wait Until Element Is Visible    ${btn_approve}
    Click Element    ${btn_approve}
    Wait Until Element Is Visible    ${btn_approve_submit}
    Click Element    ${btn_approve_submit}

Reject this order and confirm
    [Documentation]    Click Reject button and confirm on Customer Info Verify page
    Wait Until Element Is Visible    ${btn_reject}
    Click Element    ${btn_reject}
    Wait Until Element Is Visible    ${btn_reject_submit}
    Click Element    ${btn_reject_submit}

Customer cancel this order and confirm
    [Documentation]    Click Customer Cancel button and confirm on Customer Info Verify page
    Wait Until Element Is Visible    ${btn_customer_cancel}
    Click Element    ${btn_customer_cancel}
    Wait Until Element Is Visible    ${btn_cancel_submit}
    Click Element    ${btn_cancel_submit}

Add new remark on this order sucessfully
    [Documentation]    Click pencil button and enter message to remark
    [Arguments]    ${remark}
    Click Element    ${btn_remark}
    Input Text    ${txt_remark}    ${remark}
    Click Element    ${btn_submit_remark}
    Element Should Contain    ${remark_message}    ${remark}

Remove remark on this order sucessfully
    [Documentation]    Clear remark message
    Click Element    ${btn_remark}
    Clear Element Text    ${txt_remark}
    Click Element    ${btn_submit_remark}

Cancel on Popup
    [Documentation]    Click cancel button on popup
    Wait Until Element Is Visible    ${confirm_popup}
    Click Element    ${btn_cancel}

Edit Thai ID to be
    [Documentation]    Edit Thai ID Card
    [Arguments]    ${thai_id_card}
    Click Element    ${btn_edit_customer_info}
    Wait Until Element Is Visible    ${txt_id_card}
    Input Text    ${txt_id_card}    ${thai_id_card}

Change title to be
    [Documentation]    Change title radio button
    [Arguments]    ${title}
    ${passed}    Run Keyword And Return Status    Page Should Contain Element    ${btn_edit_customer_info}
    Run keyword If    ${passed}    Click Element    ${btn_edit_customer_info}
    Run keyword If    '${title}'=='นาย'    Execute Javascript    $('[id="name_title_mr"]').click()
    ...  ELSE IF    '${title}'=='นางสาว'    Execute Javascript    $('[id="name_title_miss"]').click()
    ...  ELSE IF    '${title}'=='นาง'    Execute Javascript    $('[id="name_title_mrs"]').click()
    ...  ELSE IF    '${title}'=='อื่นๆ'    Execute Javascript    $('[id="name_title_other_rdo"]').click()
    Run keyword If    '${title}'=='อื่นๆ'    Input Text    ${txt_other_title}    test

Edit customer name to be
    [Documentation]    Edit First and Last name of customer
    [Arguments]    ${name}
    ${passed}    Run Keyword And Return Status    Page Should Contain Element    ${btn_edit_customer_info}
    Run keyword If    ${passed}    Click Element    ${btn_edit_customer_info}
    ${first}    ${last}=    Split String    ${name}
    Edit customer first name to be    ${first}
    Edit customer last name to be    ${last}

Edit customer first name to be
    [Documentation]    Edit customer first name
    [Arguments]    ${first_name}
    ${passed}    Run Keyword And Return Status    Page Should Contain Element    ${btn_edit_customer_info}
    Run keyword If    ${passed}    Click Element    ${btn_edit_customer_info}
    Input Text    ${txt_first_name}    ${first_name}

Edit customer last name to be
    [Documentation]    Edit customer last name
    [Arguments]    ${last_name}
    ${passed}    Run Keyword And Return Status    Page Should Contain Element    ${btn_edit_customer_info}
    Run keyword If    ${passed}    Click Element    ${btn_edit_customer_info}
    Input Text    ${txt_last_name}    ${last_name}

Change date of birth to be
    [Documentation]    Change Date of Birth
    [Arguments]    ${birthdate}
    ${passed}    Run Keyword And Return Status    Page Should Contain Element    ${btn_edit_customer_info}
    Run keyword If    ${passed}    Click Element    ${btn_edit_customer_info}
    Execute Javascript    $('#birthday-picker').val("${birthdate}")

Change date of expiry to be
    [Documentation]    Change Date of Expiry
    [Arguments]    ${expirydate}
    ${passed}    Run Keyword And Return Status    Page Should Contain Element    ${btn_edit_customer_info}
    Run keyword If    ${passed}    Click Element    ${btn_edit_customer_info}
    Execute Javascript    $('#id_card_expiry-picker').val("${expirydate}")

Edit tel number to be
    [Documentation]    Edit telephone number
    [Arguments]    ${tel_number}
    ${passed}    Run Keyword And Return Status    Page Should Contain Element    ${btn_edit_customer_info}
    Run keyword If    ${passed}    Click Element    ${btn_edit_customer_info}
    Input Text    ${txt_tel_number}    ${tel_number}

Edit thai id address number to be
    [Documentation]    Edit Thai Address number
    [Arguments]    ${address_no}
    ${passed}    Run Keyword And Return Status    Page Should Contain Element    ${btn_edit_customer_info}
    Run keyword If    ${passed}    Click Element    ${btn_edit_customer_info}
    Input Text    ${txt_thai_address_no}    ${address_no}

Edit thai id road to be
    [Documentation]    Edit Thai Address road
    [Arguments]    ${road}
    ${passed}    Run Keyword And Return Status    Page Should Contain Element    ${btn_edit_customer_info}
    Run keyword If    ${passed}    Click Element    ${btn_edit_customer_info}
    Input Text    ${txt_thai_road}    ${road}

Change thai id province to be
    [Documentation]    Change thai id province
    [Arguments]    ${province}
    ${passed}    Run Keyword And Return Status    Page Should Contain Element    ${btn_edit_customer_info}
    Run keyword If    ${passed}    Click Element    ${btn_edit_customer_info}
    Select From List    ${thai_province_dropdown}    ${province}

Change thai id district to be
    [Documentation]    Change thai id district
    [Arguments]    ${district}
    ${passed}    Run Keyword And Return Status    Page Should Contain Element    ${btn_edit_customer_info}
    Run keyword If    ${passed}    Click Element    ${btn_edit_customer_info}
    Select From List    ${thai_district_dropdown}    ${district}

Change thai id city to be
    [Documentation]    Change thai id city
    [Arguments]    ${city}
    ${passed}    Run Keyword And Return Status    Page Should Contain Element    ${btn_edit_customer_info}
    Run keyword If    ${passed}    Click Element    ${btn_edit_customer_info}
    Select From List    ${thai_city_dropdown}    ${city}

Edit thai id postal code to be
    [Documentation]    Change thai id postcal code
    [Arguments]    ${postcode}
    ${passed}    Run Keyword And Return Status    Page Should Contain Element    ${btn_edit_customer_info}
    Run keyword If    ${passed}    Click Element    ${btn_edit_customer_info}
    Input Text    ${txt_thai_postcode}    ${postcode}

Edit billing address number to be
    [Documentation]    Edit Thai Address number
    [Arguments]    ${address_no}
    ${passed}    Run Keyword And Return Status    Page Should Contain Element    ${btn_edit_customer_info}
    Run keyword If    ${passed}    Click Element    ${btn_edit_customer_info}
    Input Text    ${txt_billing_address_no}    ${address_no}

Edit billing road to be
    [Documentation]    Edit Billing Address road
    [Arguments]    ${road}
    ${passed}    Run Keyword And Return Status    Page Should Contain Element    ${btn_edit_customer_info}
    Run keyword If    ${passed}    Click Element    ${btn_edit_customer_info}
    Input Text    ${txt_billing_road}    ${road}

Change billing province to be
    [Documentation]    Change billing province
    [Arguments]    ${province}
    ${passed}    Run Keyword And Return Status    Page Should Contain Element    ${btn_edit_customer_info}
    Run keyword If    ${passed}    Click Element    ${btn_edit_customer_info}
    Select From List    ${billing_province_dropdown}    ${province}

Change billing district to be
    [Documentation]    Change billing district
    [Arguments]    ${district}
    ${passed}    Run Keyword And Return Status    Page Should Contain Element    ${btn_edit_customer_info}
    Run keyword If    ${passed}    Click Element    ${btn_edit_customer_info}
    Select From List    ${billing_district_dropdown}    ${district}

Change billing city to be
    [Documentation]    Change billing city
    [Arguments]    ${city}
    ${passed}    Run Keyword And Return Status    Page Should Contain Element    ${btn_edit_customer_info}
    Run keyword If    ${passed}    Click Element    ${btn_edit_customer_info}
    Select From List    ${billing_city_dropdown}    ${city}

Edit billing postal code to be
    [Documentation]    Edit billing postcal code
    [Arguments]    ${postcode}
    ${passed}    Run Keyword And Return Status    Page Should Contain Element    ${btn_edit_customer_info}
    Run keyword If    ${passed}    Click Element    ${btn_edit_customer_info}
    Input Text    ${txt_billing_postcode}    ${postcode}

Save customer information
    [Documentation]    Click save button on Customer Info Edit
    Wait Until Element Is Visible    ${btn_save}
    Click Element    ${btn_save}
    Element Should Contain    ${notify_message}    Successful

Get order id on the first record
    [Documentation]    Get order ID on the first record in table
    ${order_id}    Get Text    //*[@id="dynamic-table"]/tbody/tr[1]/td[1]/a
    Set Test Variable    ${order_id}

Search waiting order with remark by order id
    [Documentation]    Search order id which has status as waiting with remark
    [Arguments]    ${order_id}
    Input Text    ${txt_order_id}    ${order_id}
    Select From List    ${verify_status_dropdown}    waiting
    Select From List    ${verify_remark_dropdown}    Remark
    Wait Until Element Is Visible    ${btn_search_order}
    Click Element    ${btn_search_order}

Verify the remark is displayed correctly
    [Documentation]    Check the remark message
    [Arguments]    ${remark}
    Element Should Contain    ${remark_label}    ${remark}

Search waiting order without remark by order id
    [Documentation]    Search order id which has status as waiting without remark
    [Arguments]    ${order_id}
    Input Text    ${txt_order_id}    ${order_id}
    Select From List    ${verify_status_dropdown}    waiting
    Select From List    ${verify_remark_dropdown}    No Remark
    Wait Until Element Is Visible    ${btn_search_order}
    Click Element    ${btn_search_order}

Verify there is no remark display correctly
    [Documentation]    check that there is no remark on waiting status
    Element Should Contain    ${remark_label}    ${EMPTY}