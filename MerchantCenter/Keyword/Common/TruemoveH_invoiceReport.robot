*** Settings ***
Library           SeleniumLibrary    run_on_failure=Capture Page Screenshot
Library           String
Library           ../PythonLibrary/_customkeyword.py
Resource          ../../Resource/WeMall/WebElement/TruemoveH_InvoiceReport.robot


*** Keywords ***
Go To Invoice Report Page
    [Documentation]    Go to WMS and go to We Trust System > Invoice Report
    Go to    ${URL_WMS}/invoice

Search Invoice Report By Payment Channel
    [Documentation]    Search invoice report by payment channel
    [Arguments]    ${channel}
    Select From List    //select[@name="payment_method"]    ${channel}
    Wait Until Element Is Visible    ${btn_search_invoice}
    Click Element    ${btn_search_invoice}


All Invoice Report display Payment Channel as
    [Documentation]    Check payment channel column on every record
    [Arguments]    ${method}
    ${row}    Get Matching Xpath Count    //div[@class="box-body table-responsive no-padding"]/table/tbody/tr
    : FOR    ${i}    IN RANGE    2    ${row} - 2
    \    Run Keyword if    ${i}%2 == 0    Element Text Should Be    //div[@class="box-body table-responsive no-padding"]/table/tbody/tr[${i}]/td[8]    ${method}

Search Invoice Report By Invoice No
    [Documentation]    Enter invoice no to search
    [Arguments]    ${invoice_no}
    Input Text    ${txt_invoice_no_from}    ${invoice_no}
    Input Text    ${txt_invoice_no_to}    ${invoice_no}
    Click Element    ${btn_search_invoice}

Search Invoice Report By Order ID
    [Documentation]    Enter order id to search
    [Arguments]    ${order_id}
    Input Text    ${txt_invoice_order_id}    ${order_id}
    Click Element    ${btn_search_invoice}


The TMH Button Displays On Action Column Correctly
    [Documentation]    Check the TMH button
    Element Should Be Visible    ${btn_tmh_form}

The Searched Invoice Number Should Be Displayed as
    [Documentation]    check searched invoice number
    [Arguments]    ${invoice_no}
    Element Should Contain    //div[@class="box-body table-responsive no-padding"]/table/tbody/tr[2]/td[4]    ${invoice_no}

The Searched Order ID Should Be Displayed as
    [Documentation]    check searched order id
    [Arguments]    ${order_id}
    ${i}    Set Variable    2
    ${row}    Get Matching Xpath Count    //div[@class="box-body table-responsive no-padding"]/table/tbody/tr
    Set Test Variable    ${order_id}
    Set Test Variable    ${row}
    Run Keyword if    ${row} == 4    Element Should Contain    //div[@class="box-body table-responsive no-padding"]/table/tbody/tr[2]/td[5]    ${order_id}
    Run Keyword if    ${row} > 4    Check Multiple Order Id

Check Multiple Order Id
    @{order_id_list}    Split String    ${order_id}    |
    : FOR    ${i}    IN RANGE    2    ${row} - 1
    \   ${order}    Run Keyword if    ${i}%2 == 0    Get Text    //div[@class="box-body table-responsive no-padding"]/table/tbody/tr[${i}]/td[5]
    \   Run Keyword if    ${i}%2 == 0    Should Contain Any   ${order}    @{order_id_list}[1]    @{order_id_list}[0]

Click Update Button
    Wait Until Element Is Visible     ${btn_update_info}
    Click Element    ${btn_update_info}

Verify Update Billing Page
    Select Window     NEW
    Wait Until Element Is Visible    ${lbl_title_billing_update}
    Element Should Contain    ${lnk_breadcrumb_update}    ปรับปรุงข้อมูล

Select Type Invoice
    [Arguments]    ${type}
    Select Window     NEW
    Wait Until Element Is Visible    ${lbl_title_billing_update}
    Select From List By Label    ${ddl_type_invoice}    ${type}

Verify Update Billing Information Page for Corporate
    Element Should Be Visible    ${txt_box_company}
    Element Should Be Visible    ${txt_branch_head}
    Element Should Be Visible    ${txt_branch}
    Element Should Be Visible    ${txt_tax_no}
    Element Should Be Visible    ${txt_address}
    Element Should Be Visible    ${ddl_city}
    Element Should Be Visible    ${ddl_district}
    Element Should Be Visible    ${txt_postcode}

Verify Update Billing Information Page for Individual
    Element Should Be Visible    ${txt_box_firstname}
    Element Should Be Visible    ${txt_box_lastname}
    Element Should Be Visible    ${txt_tax_no}
    Element Should Be Visible    ${txt_address}
    Element Should Be Visible    ${ddl_city}
    Element Should Be Visible    ${ddl_district}
    Element Should Be Visible    ${txt_postcode}

Verify Alert Messages Corporate Incase Without Enter Company Required Fields
    Click Element    ${txt_box_company}
    Click Element    ${txt_branch_head}
    Element Should Contain    ${lbl_corpname}    กรุณากรอกชื่อบริษัท
    Click Element    ${txt_branch}
    Input Text    ${txt_branch_value}    ${SPACE}
    Clear Element Text    ${txt_branch_value}
    Element Should Contain    ${lbl_branch}    กรุณากรอกรหัสสาขา
    Click Element    ${txt_tax_no}
    Clear Element Text    ${txt_tax_no}
    Click Element    ${txt_address}
    Element Should Contain    ${lbl_tax_no}    กรุณากรอกหมายเลขประจำตัวผู้เสียภาษี

Verify Alert Messages Corporate Incase Without Enter Address Required Fields
    Click Element    ${txt_address}
    Clear Element Text    ${txt_address}
    Element Should Contain    ${lbl_address}    กรุณากรอกที่อยู่
    Select From List By Label    ${ddl_province}    เลือกจังหวัด
    Element Should Contain    ${lbl_province}    กรุณาเลือกจังหวัด
    Select From List By Label    ${ddl_province}    กรุงเทพมหานคร
    Select From List By Label    ${ddl_city}    คลองเตย
    Select From List By Label    ${ddl_city}    เลือกเขต/อำเภอ
    Element Should Contain    ${lbl_city}    กรุณาเลือกเขต/อำเภอ
    Select From List By Label    ${ddl_city}    คลองเตย
    Select From List By Label    ${ddl_district}    คลองตัน
    Select From List By Label    ${ddl_district}    เลือกแขวง/ตำบล
    Element Should Contain    ${lbl_district}    กรุณาเลือกแขวง/ตำบล
    Click Element    ${txt_postcode}
    Clear Element Text    ${txt_postcode}
    Element Should Contain    ${lbl_postcode}    กรุณากรอกรหัสไปรษณีย์

Verify Alert Message Incase Enter The Number Not Reach 5
    Click Element    ${txt_branch}
    Input Text    ${txt_branch_value}    123
    Element Should Contain    ${lbl_branch}     รหัสสาขาไม่ถูกต้อง

Verify Alert Messages Individual Incase Without Enter Company Required Fields
    Click Element    ${txt_box_firstname}
    Clear Element Text    ${txt_box_firstname}
    Element Should Contain    ${lbl_name}    กรุณากรอกชื่อ
    Click Element    ${txt_box_lastname}
    Clear Element Text    ${txt_box_lastname}
    Element Should Contain    ${lbl_lastname}    กรุณากรอกนามสกุล
    Click Element    ${txt_tax_no}
    Clear Element Text    ${txt_tax_no}
    Click Element    ${txt_address}
    Element Should Contain    ${lbl_tax_no}    กรุณากรอกหมายเลขประจำตัวประชาชน 13 หลัก

Verify Alert Messages Individual Incase Without Enter Address Required Fields
    Click Element    ${txt_address}
    Clear Element Text    ${txt_address}
    Element Should Contain    ${lbl_address}    กรุณากรอกที่อยู่
    Select From List By Label    ${ddl_province}    เลือกจังหวัด
    Element Should Contain    ${lbl_province}    กรุณาเลือกจังหวัด
    Select From List By Label    ${ddl_province}    กรุงเทพมหานคร
    Select From List By Label    ${ddl_city}    คลองเตย
    Select From List By Label    ${ddl_city}    เลือกเขต/อำเภอ
    Element Should Contain    ${lbl_city}    กรุณาเลือกเขต/อำเภอ
    Select From List By Label    ${ddl_city}    คลองเตย
    Select From List By Label    ${ddl_district}    คลองตัน
    Select From List By Label    ${ddl_district}    เลือกแขวง/ตำบล
    Element Should Contain    ${lbl_district}    กรุณาเลือกแขวง/ตำบล
    Click Element    ${txt_postcode}
    Clear Element Text    ${txt_postcode}
    Element Should Contain    ${lbl_postcode}    กรุณากรอกรหัสไปรษณีย์





