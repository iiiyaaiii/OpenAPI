*** Settings ***
Suite Teardown    Clear All Test
Suite Setup    Open Custom Browser    ${URL_PORTAL}    ${BROWSER}
Force Tags        feature-report    mc-wls
Library           SeleniumLibrary
Library           String
Library           OperatingSystem
Library           ExcelLibrary
Resource          ../../../../Resource/WeLoveShopping/init.robot
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Checkout.txt
Resource          ../../../../Keyword/Common/Bulktracking.txt
Resource          ../../../../Keyword/Common/Account_History.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/Bulktracking.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/Checkout.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/AccountHistory.txt

*** Test Cases ***
TC_MC_03077
    [Tags]    High    Store-Web
    [Documentation]    WLSStore View Bulk tracking page Open link (Not Login Shop)
    Go To Store Bulktracking Page    ${bulktracking_shop_name}
    Verify Text Username
    Verify Text Password

TC_MC_03079
    [Tags]    Low    Store-Web
    [Documentation]    WLSStore View Bulk tracking page Open link (Account Only)
    Set Selenium Speed    0.2
    Account Login    ${user_buyer_bulktracking}    ${password_buyer_bulktracking}
    Go To Store Bulktracking Page    ${bulktracking_shop_name}
    Check Text    ${locator_error_text}    ${error_text}

TC_MC_03080
    [Tags]    Low    Store-Web
    [Documentation]    WLSStore View Bulk tracking page (Non-self stores)
    Set Selenium Speed    0.2
    Check and Reset Seller Login    ${reconnodata_slug}    ${user_reconnodata}    ${password_reconnodata}
    Go To Store Bulktracking Page    ${bulktracking_shop_name}
    Check Text    ${locator_error_text}    ${error_text}

TC_MC_03082
    [Tags]    Medium    Store-Web
    [Documentation]    WLSStore View Bulk tracking text (Store Not have Status Ship)
    Set Selenium Speed    0.2
    Check and Reset Seller Login    ${reconnodata_slug}    ${user_reconnodata}    ${password_reconnodata}
    Go To Order List Waitshipping Tab Store Page    ${reconnodata_slug}
    Check Element Is Visible    ${muti_ship_button}
    Click Button    ${muti_ship_button}
    Select Window Bulktracking    title=Bulk Order Tracking - WeLoveShopping
    Check Location    ${URL_STORE}/${reconnodata_slug}/admin/orders/bulk-tracking
    Check Text Page Should Contain    ${text_ship_order}
    Check Text Page Should Contain    ${text_ship_item}

TC_MC_03083
    [Tags]    Medium    Store-Web
    [Documentation]    WLSStore View Bulk tracking page import data (Store Not have Status Ship)
    Set Selenium Speed    0.2
    Check and Reset Seller Login    ${reconnodata_slug}    ${user_reconnodata}    ${password_reconnodata}
    Go to store bulktracking page    ${reconnodata_slug}
    ${file_path}    Get file path
    Choose File    ${input_file_tracking}    ${file_path}/tracking_20151126_171204.xls
    Click Button    ${tracking_button}
    Check Element Is Visible    ${comfirm_button}
    Click Button    ${comfirm_button}
    Check Element Is Visible    ${locator_text_already}
    Check Text    ${locator_text_already}     ดำเนินการเรียบร้อย
    Check Text    ${locator_alert_text_ship}    คุณสามารถตรวจสอบสถานะการแจ้งจัดส่งสินค้าได้ ที่นี่
    Check Text    ${locator_text_total}    รายการที่แจ้งจัดส่งทั้งหมด 0รายการ
    Check Text    ${locator_text_success}    แจ้งจัดส่งสำเร็จ 0รายการ
    Check Text    ${locator_text_fail}    แจ้งจัดส่งไม่สำเร็จ 0รายการ

TC_MC_03084
    [Tags]    Medium    Store-Web
    [Documentation]    WLSStore View Bulk tracking page (Click link)
    Set Selenium Speed    0.1
    Check and Reset Seller Login    ${reconnodata_slug}    ${user_reconnodata}    ${password_reconnodata}
    Go to store bulktracking page    ${reconnodata_slug}
    ${file_path}    Get file path
    Choose File    ${input_file_tracking}    ${file_path}/tracking_20151126_171204.xls
    Click Button    ${tracking_button}
    Check Element Is Visible    ${comfirm_button}
    Click Button    ${comfirm_button}
    Check Element Is Visible    ${here_link}
    Click Button    ${here_link}
    Check Location    ${URL_STORE}/${reconnodata_slug}/admin/orders?status=waitshipping

TC_MC_03087
    [Tags]    Low    Store-Web
    [Documentation]    WLSStore View bulk tracking page (show menu)
    Set Selenium Speed    0.2
    Check and Reset Seller Login    ${bulktracking_shop_name}    ${user_bulktracking}    ${pass_bulktracking}
    Go to store bulktracking page    ${bulktracking_shop_name}
    Element Is Visible    ${logo}
    Check Text    ${bulktracking_title}    แจ้งจัดส่งทีละหลายรายการ
    Check Text    ${step_first_title}    1. ดาวน์โหลดแบบฟอร์มในการแจ้งจัดส่ง
    Element Is Visible    ${download_button_on_bulktracking}
    Check Text    ${suggest_download_file}    ดาวน์โหลดไฟล์ Excel จากระบบ\n(ระบบจะรวมรายการสั่งซื้อจากร้านค้าของคุณที่รอการแจ้งจัดส่งทั้งหมดมาไว้ในไฟล์นี้)
    Check Text    ${step_second_title}    2. กรอกหมายเลขพัสดุ ของแต่ละรายการสั่งซื้อ ลงในไฟล์ที่ดาวน์โหลดมา
    Check Text    ${suggest_open_file}    เปิดไฟล์ “แจ้งจัดส่ง.xls” ที่ดาวน์โหลดมา และ กรอกหมายเลขพัสดุให้ตรงกับรายการสั่งซื้อแล้วกดบันทึก\nดูรายละเอียดการใช้ตาราง
    Element Is Visible    ${view_detail_link}
    Check Text    ${step_third_title}    3. เพิ่มแบบฟอร์มเข้าระบบเพื่อแจ้งจัดส่ง
    Element Is Visible    ${input_import_tracking_file}
    Element Is Visible    ${tracking_button}
    Check Text    ${suggest_upload_file}    อัพโหลดไฟล์ “แจ้งจัดส่ง.xls”

TC_MC_03088
    [Tags]    Low    Store-Web
    [Documentation]    WLSStore View bulk tracking page (View tool tip)
    Set Selenium Speed    0.1
    Check and Reset Seller Login    ${bulktracking_shop_name}    ${user_bulktracking}    ${pass_bulktracking}
    Go to store bulktracking page    ${bulktracking_shop_name}
    Check Element Is Visible    ${view_detail_link}
    Click Button    ${view_detail_link}
    Check Element Is Visible    ${how_to_use_file_modal}
    Check Text    ${how_to_use_file_header}    วิธีใช้งานไฟล์ excel ที่ใช้แจ้งจัดส่งทีละหลายรายการ
    Check Text    ${caution_title}    ข้อควรระวัง
    Check Text    ${caution_content_first}    กรณีวิธีการจัดส่งเป็นวิธีอื่น ที่ไม่ใช่ไปรษณีย์ไทย หรือ Kerry Express ให้ใช้ “หมายเลขพัสดุ หรือ ข้อความ”
    Check Text    ${caution_content_second}    ผู้ซื้อมีสิทธิ์ที่จะขอเงินคืนจากร้านค้า กรณี

TC_MC_03089
    [Tags]    Medium    Store-Web
    [Documentation]    WLSStore Download bulk tracking
    Set Selenium Speed    0.2
    Check and Reset Seller Login    ${bulktracking_shop_name}    ${user_bulktracking}    ${pass_bulktracking}
    Go To    ${URL_STORE}/${bulktracking_shop_name}/admin/orders/bulk-tracking
    Select Radio Button Type For Download File    full
    Click Button    ${download_button_on_bulktracking}
    Check Element Is Visible    ${text_after_click_download}

TC_MC_03129
    [Tags]    Regression    High    Store-Web
    [Documentation]    WLSStore View Bulk tracking Button All Ship
    Account Login    ${user_reconteststore}    ${password_reconteststore}
    Go To Order List Waitshipping Tab Store Page    ${reconteststore_slug}
    Check Element Is Visible    ${muti_ship_button}
    Check Text    ${muti_ship_button}    แจ้งจัดส่งหลายรายการ
    Click Button    ${muti_ship_button}
    Select Window Bulktracking    title=Bulk Order Tracking - WeLoveShopping
    Check Location    ${URL_STORE}/${reconteststore_slug}/admin/orders/bulk-tracking

TC_MC_03134
    [Tags]    Regression    Medium    Store-Web
    [Documentation]    WLSStore Check user doesn't select ship type
    Account Login    ${user_reconteststore}    ${password_reconteststore}
    Go to store bulktracking page    ${reconteststore_slug}
    Check Element Is Visible    ${download_button_on_bulktracking}
    Click Button    ${download_button_on_bulktracking}
    Check Element Is Visible    ${error_download_modal}
    Check Text    ${error_text_header}    คุณยังไม่ได้เลือกรูปแบบไฟล์ที่ต้องการแจ้งจัดส่ง
    Check Text    ${error_text_body}    กรุณาเลือกรูปแบบไฟล์ เพื่อดาวน์โหลดฟอร์มในการแจ้งจัดส่ง

TC_MC_03135
    [Tags]    Regression    Medium    Store-Web
    [Documentation]    WLSStore Check text after download
    Account Login    ${user_reconteststore}    ${password_reconteststore}
    Go To Order List Waitshipping Tab Store Page    ${reconteststore_slug}
    Check Element Is Visible    ${muti_ship_button}
    Click muti shipping button
    Select Window Bulktracking    title=Bulk Order Tracking - WeLoveShopping
    Select format file for shipping    partial
    Check Element Is Visible    ${download_button_on_bulktracking}
    Click download button on bulktracking page
    Check Element Is Visible    ${txt_date_after_download}
    ${text_download}=    Get Text    ${txt_date_after_download}
    Should Not Match Regexp    ${text_download}    ดาวน์โหลด ณ วันที่ ([0-9]{1,2}\s[ก-ฮ]{1}\.[ก-ฮ]{1}\.\s[0-9]{4} []0-9]{2}:[0-9]{2}\sน\.)

TC_MC_03137
    [Tags]    Regression    Medium    Store-Web
    [Documentation]    WLSStore Check error message in case tracking number over 255 characters
    Account Login    ${user_reconteststore}    ${password_reconteststore}
    Go to store bulktracking page    ${reconteststore_slug}
    Check Element Is Visible    ${tracking_button}
    Upload file for shipping    Over255.xls
    Check Text    ${locator_error_message}    หมายเลขพัสดุหรือข้อความต้องไม่เกิน 255 ตัวอักษร

TC_MC_03138
    [Tags]    Regression    Medium    Store-Web
    [Documentation]    WLSStore Check error message in case link incorrect
    Account Login    ${user_reconteststore}    ${password_reconteststore}
    Go to store bulktracking page    ${reconteststore_slug}
    Check Element Is Visible    ${tracking_button}
    Upload file for shipping    IncorrectLink.xls
    Check Text    ${locator_error_message}    ลิงก์เพื่อตรวจสอบหมายเลขพัสดุ-1 ไม่ถูกต้อง

TC_MC_03140
    [Tags]    Regression    Medium    Store-Web
    [Documentation]    WLSStore Check error message in case orderid is imaginary
    Account Login    ${user_reconteststore}    ${password_reconteststore}
    Go to store bulktracking page    ${reconteststore_slug}
    Check Element Is Visible    ${tracking_button}
    Upload file for shipping    IncorrectOrderid.xls
    Check Text    ${locator_error_message}    หมายเลขการสั่งซื้อไม่ถูกต้อง

TC_MC_03141
    [Tags]    Regression    Medium    Store-Web
    [Documentation]    WLSStore Check error message in case user doesn't input tracking
    Account Login    ${user_reconteststore}    ${password_reconteststore}
    Go to store bulktracking page    ${reconteststore_slug}
    Check Element Is Visible    ${tracking_button}
    Upload file for shipping    NoTracking.xls
    Check Text    ${locator_error_message}    ไม่ระบุหมายเลขพัสดุ

TC_MC_03142
    [Tags]    Regression    Medium    Store-Web
    [Documentation]    WLSStore Check error message in case user input tracking number less more 13 characters
    Account Login    ${user_reconteststore}    ${password_reconteststore}
    Go to store bulktracking page    ${reconteststore_slug}
    Check Element Is Visible    ${tracking_button}
    Upload file for shipping    Lessthan13.xls
    Check Text    ${locator_error_message}    กรุณาใส่อย่างน้อย 13 ตัวอักษร

TC_MC_03143
    [Tags]    Regression    Medium    Store-Web
    [Documentation]    WLSStore Check error message in case user input tracking number over 13 characters
    Account Login    ${user_reconteststore}    ${password_reconteststore}
    Go to store bulktracking page    ${reconteststore_slug}
    Check Element Is Visible    ${tracking_button}
    Upload file for shipping    Morethan13.xls
    Check Text    ${locator_error_message}    กรุณาใส่ไม่เกิน 13 ตัวอักษร

TC_MC_03144
    [Tags]    Regression    Medium    Store-Web
    [Documentation]    WLSStore Check error message in case user input tracking number register tracking in EMS
    Account Login    ${user_reconteststore}    ${password_reconteststore}
    Go to store bulktracking page    ${reconteststore_slug}
    Check Element Is Visible    ${tracking_button}
    Upload file for shipping    RegisInsteadofEMS.xls
    Check Text    ${locator_error_message}    กรุณาจัดส่งแบบ EMS ตามที่ผู้ซื้อระบุค่ะ

TC_MC_03145
    [Tags]    Regression    Medium    Store-Web
    [Documentation]    WLSStore Check error message in case user input tracking number incorrect format
    Account Login    ${user_reconteststore}    ${password_reconteststore}
    Go to store bulktracking page    ${reconteststore_slug}
    Check Element Is Visible    ${tracking_button}
    Upload file for shipping    IncorrectFormat.xls
    Check Text    ${locator_error_message}    หมายเลขพัสดุไม่ถูกต้อง

TC_MC_03146
    [Tags]    Regression    Medium    Store-Web
    [Documentation]    WLSStore Check error message in case orderid has already shipped
    Account Login    ${user_reconteststore}    ${password_reconteststore}
    Go to store bulktracking page    ${reconteststore_slug}
    Check Element Is Visible    ${tracking_button}
    Upload file for shipping    AlreadyOrderShip.xls
    Check Text    ${locator_error_message}    หมายเลขการสั่งซื้อนี้เคยแจ้งจัดส่งแล้ว

TC_MC_03147
    [Tags]    Regression    Medium    Store-Web
    [Documentation]    WLSStore Check error message in case productid is imaginary
    Account Login    ${user_reconteststore}    ${password_reconteststore}
    Go to store bulktracking page    ${reconteststore_slug}
    Check Element Is Visible    ${tracking_button}
    Upload file for shipping    IncorrectProductid.xls
    Check Text    ${locator_error_message}    หมายเลขรหัสสินค้าไม่ตรงตามที่สั่งซื้อ

TC_MC_03148
    [Tags]    Regression    Medium    Store-Web
    [Documentation]    WLSStore Check error message in case productid has already shipped
    Account Login    ${user_reconteststore}    ${password_reconteststore}
    Go to store bulktracking page    ${reconteststore_slug}
    Check Element Is Visible    ${tracking_button}
    Upload file for shipping    AlreadyProductidShip.xls
    Check Text    ${locator_error_message}    หมายเลขรหัสสินค้านี้เคยแจ้งจัดส่งแล้ว

TC_MC_03149
    [Tags]    Regression    Medium    Store-Web
    [Documentation]    WLSStore Check error message when link not match in a order in case same tracking number
    Account Login    ${user_reconteststore}    ${password_reconteststore}
    Go to store bulktracking page    ${reconteststore_slug}
    Check Element Is Visible    ${tracking_button}
    Upload file for shipping    LinkNotMatch.xls
    Check Text    ${locator_error_message}    ข้อมูลลิงก์ไม่ถูกต้อง

TC_MC_03150
    [Tags]    Regression    Medium    Store-Web
    [Documentation]    WLSStore Upload bulk tracking partial success
    Account Login    ${user_reconteststore}    ${password_reconteststore}
    Create order credit card channel    ${reconteststore_slug}    ${normal_product1_reconstore}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go to store bulktracking page    ${reconteststore_slug}
    Check Element Is Visible    ${tracking_button}
    Create and upload shipping file after create the order success
    Check Text    ${txt_status_bulktracking_success}    แจ้งจัดส่งสำเร็จ
