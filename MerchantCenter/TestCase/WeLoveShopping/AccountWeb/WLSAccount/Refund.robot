*** Setting ***
Documentation    Check order about request refund on weloveshopping site
Test Setup       Go to Login and Check Seller Login    ${URL_PORTAL}    ${BROWSER}    ${reconorder_slug}    ${user_reconorder}    ${password_reconorder}
Test Teardown    Clear All Test
Force Tags        Account-Web    mc-wls
Library           SeleniumLibrary
Library           String
Resource          ../../../../Resource/WeLoveShopping/init.robot
Resource          ../../../../Keyword/Common/Bulktracking.txt
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Checkout.txt
Resource          ../../../../Keyword/Common/Account_History.txt
Resource          ../../../../Keyword/Common/Account_Detail.txt
Resource          ../../../../Keyword/Common/Account_Refund.txt
Resource          ../../../../Keyword/Common/Store_Detail.txt
Resource          ../../../../Keyword/Common/Store_History.txt
Resource          ../../../../Keyword/Common/ManageOrder.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/AccountHistory.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/AccountDetail.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/AccountRefund.txt

*** Test Cases ***
TC_MC_03826
    [Documentation]    WLSAccountRefund Check error message for account refund page
    [Tags]    Regression    Medium    Account-Web
    Create order credit card channel    ${reconorder_slug}    ${normal_product1}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Validate error message on account refund page

TC_MC_03827
    [Documentation]    Check error message in case user doesn't select refund reason
    [Tags]    Medium    Account-Web
    Create order credit card channel    ${reconorder_slug}    ${normal_product1}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select checkbox all product for refund
    Input description refund to shop    ขอเงินคืนเนื่องจากเกิดปัญหากับสินค้า
    Choose file upload    A02.jpg
    Click request refund button on account refund page
    Check error message on account refund page    ${element_reason_refund_error_message}    กรุณาเลือกเหตุผลที่ต้องการขอเงินคืน
    Select checkbox all product for refund
    Select reason refund on account refund page    ร้านค้าแจ้งว่าไม่มีสินค้า / สินค้าหมด
    Choose file upload    A02.jpg
    Click request refund button on account refund page
    Check error message on account refund page    ${element_description_error_message}    ระบุรายละเอียดการขอคืน

TC_MC_03828
    [Documentation]    Check error message in case user doesn't input message to shop
    [Tags]    Medium    Account-Web
    Create order credit card channel    ${reconorder_slug}    ${normal_product1}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select checkbox all product for refund
    Select reason refund on account refund page    ร้านค้าแจ้งว่าไม่มีสินค้า / สินค้าหมด
    Choose file upload    A02.jpg
    Click request refund button on account refund page
    Check error message on account refund page    ${element_description_error_message}    ระบุรายละเอียดการขอคืน

TC_MC_03829
    [Documentation]    Check error message in case user incorrectly upload image file
    [Tags]    Medium    Account-Web
    Create order credit card channel    ${reconorder_slug}    ${normal_product1}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select checkbox all product for refund
    Select reason refund on account refund page    ร้านค้าแจ้งว่าไม่มีสินค้า / สินค้าหมด
    Input description refund to shop    ขอเงินคืนเนื่องจากเกิดปัญหากับสินค้า
    Choose file upload    ExcelUpload.xlsx
    Click request refund button on account refund page
    Check error message on account refund page    ${element_upload_file_error_message}    ไฟล์ต้องเป็น jpg ,gif ,png หรือ pdf เท่านั้น

TC_MC_03830
    [Documentation]    Check error message in case user upload oversize image file
    [Tags]    Medium    Account-Web
    Create order credit card channel    ${reconorder_slug}    ${normal_product1}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select checkbox all product for refund
    Select reason refund on account refund page    ร้านค้าแจ้งว่าไม่มีสินค้า / สินค้าหมด
    Input description refund to shop    ขอเงินคืนเนื่องจากเกิดปัญหากับสินค้า
    Choose file upload    over2MB.jpg
    Click request refund button on account refund page
    Check error message on account refund page    ${element_upload_file_error_message}    ขนาดไฟล์ต้องไม่เกิน 2 MB

TC_MC_03832
    [Documentation]    Check refund status after buyer request refund on refund account page
    [Tags]    Regression    Medium    Account-Web
    Create order credit card channel    ${reconorder_slug}    ${normal_product1}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select checkbox all product for refund
    Enter request refund data

TC_MC_03833
    [Documentation]    Check status in case accept refund full after paid on buyer order detail page
    [Tags]    Regression    High    Account-Web
    Create order credit card channel    ${reconorder_slug}    ${normal_product1}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select checkbox all product for refund
    Enter request refund data
    Go To Store Order Detail Page    ${reconorder_slug}    ${order_id}
    Seller accept refund    ${password_reconorder}
    Go to account order detail page    ${order_id}
    Click view refund detail button on account detail page
    ${text_accept_refund}    Get text accept refund on account refund page
    Compare string    ${text_accept_refund}    ร้านค้าได้ยอมรับการขอเงินคืนของคุณเรียบร้อยแล้ว

TC_MC_03834
    [Documentation]    Check refund status after seller decline refund on refund account page
    [Tags]    Regression    Medium    Account-Web
    Create order credit card channel    ${reconorder_slug}    ${normal_product1}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select checkbox all product for refund
    Enter request refund data
    Go To Store Order Detail Page    ${reconorder_slug}    ${order_id}
    Seller decline refund

TC_MC_03835
    [Documentation]    Check refund status after buyer cancel refund on refund account page
    [Tags]    Medium    Account-Web
    Create order credit card channel    ${reconorder_slug}    ${normal_product1}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select checkbox all product for refund
    Enter request refund data
    Go To Store Order Detail Page    ${reconorder_slug}    ${order_id}
    Seller decline refund
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Buyer cancel request refund
    Go to account order detail page    ${order_id}
    Click view refund detail button on account detail page
    Check Element Visible    ${element_accept_refund_text}    ${expect_load_time}
    Check Text    ${element_accept_refund_text}    คุณได้ยกเลิกการขอเงินคืน

TC_MC_03839
    [Documentation]    Check accept refund status on refund history table
    [Tags]    Medium    Account-Web
    Create order credit card channel    ${reconorder_slug}    ${normal_product1}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select checkbox all product for refund
    Enter request refund data
    Go To Store Order Detail Page    ${reconorder_slug}    ${order_id}
    Seller accept refund    ${password_reconorder}
    Go to account order detail page    ${order_id}
    Check Text    ${text_status_on_refund_table}    ร้านค้ายอมรับการขอเงินคืน

TC_MC_03840
    [Documentation]    Check decline refund status on refund history table
    [Tags]    Medium    Account-Web
    Create order credit card channel    ${reconorder_slug}    ${normal_product1}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select checkbox all product for refund
    Enter request refund data
    Go To Store Order Detail Page    ${reconorder_slug}    ${order_id}
    Seller decline refund
    Go to account order detail page    ${order_id}
    Check Text    ${text_status_on_refund_table}    ร้านค้าปฏิเสธการขอเงินคืน

TC_MC_03841
    [Documentation]    Check cancel refund status on refund history table
    [Tags]    Medium    Account-Web
    Create order credit card channel    ${reconorder_slug}    ${normal_product1}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select checkbox all product for refund
    Enter request refund data
    Go To Store Order Detail Page    ${reconorder_slug}    ${order_id}
    Seller decline refund
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Buyer cancel request refund
    Go to account order detail page    ${order_id}
    Check Text    ${text_status_on_refund_table}    ผู้ซื้อยกเลิกการขอเงินคืน

TC_MC_03845
    [Documentation]    WLSAccountRefund Check verify error message on send refund document page
    [Tags]    Regression    Medium    Account-Web
    Create order offline channel    ${reconorder_slug}    ${normal_product1}    ${select_address}    ${shipping_post}    ${ibank_channel_radio_button}    ${lbl_payment_offline_ref2_number}
    Get total price on account detail page
    Reconcline the order payment success    01104776    ${order_id}    ${price}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select checkbox all product for refund
    Enter request refund data
    Go To Store Order Detail Page    ${reconorder_slug}    ${order_id}
    Seller accept refund    ${password_reconorder}
    Go to account order detail page    ${order_id}
    Go to send refund offline document page
    Validate error message on send refund document page

TC_MC_03846
    [Documentation]    Check verify text account no
    [Tags]    Medium    Account-Web
    Create order offline channel    ${reconorder_slug}    ${normal_product1}    ${select_address}    ${shipping_post}    ${ibank_channel_radio_button}    ${lbl_payment_offline_ref2_number}
    Get total price on account detail page
    Reconcline the order payment success    01104776    ${order_id}    ${price}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select checkbox all product for refund
    Enter request refund data
    Go To Store Order Detail Page    ${reconorder_slug}    ${order_id}
    Seller accept refund    ${password_reconorder}
    Go to account order detail page    ${order_id}
    Go to send refund offline document page
    Check Element Visible    ${element_select_bank}    ${expect_load_time}
    Select bank on send refund offline document page    ธนาคารกรุงไทย จำกัด (มหาชน)
    Choose file refund offline    bookbank_exam.jpg
    Click checkbox confirm document
    Click send document button
    Check Text    ${element_error_message_on_send_offline_document}    กรุณากรอกเลขที่บัญชีธนาคารที่ต้องการให้โอนเงินเข้า

TC_MC_03847
    [Documentation]    Check verify text book bank
    [Tags]    Medium    Account-Web
    Create order offline channel    ${reconorder_slug}    ${normal_product1}    ${select_address}    ${shipping_post}    ${ibank_channel_radio_button}    ${lbl_payment_offline_ref2_number}
    Get total price on account detail page
    Reconcline the order payment success    01104776    ${order_id}    ${price}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select checkbox all product for refund
    Enter request refund data
    Go To Store Order Detail Page    ${reconorder_slug}    ${order_id}
    Seller accept refund    ${password_reconorder}
    Go to account order detail page    ${order_id}
    Go to send refund offline document page
    Check Element Visible    ${element_select_bank}    ${expect_load_time}
    Select bank on send refund offline document page    ธนาคารกรุงไทย จำกัด (มหาชน)
    Input bank no    11111111111
    Click checkbox confirm document
    Click send document button
    Check Text    ${element_error_message_on_send_offline_document}    กรุณาเลือกไฟล์เพื่ออัพโหลด

TC_MC_03848
    [Documentation]    Check verify text condition
    [Tags]    Medium    Account-Web
    Create order offline channel    ${reconorder_slug}    ${normal_product1}    ${select_address}    ${shipping_post}    ${ibank_channel_radio_button}    ${lbl_payment_offline_ref2_number}
    Get total price on account detail page
    Reconcline the order payment success    01104776    ${order_id}    ${price}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select checkbox all product for refund
    Enter request refund data
    Go To Store Order Detail Page    ${reconorder_slug}    ${order_id}
    Seller accept refund    ${password_reconorder}
    Go to account order detail page    ${order_id}
    Go to send refund offline document page
    Check Element Visible    ${element_select_bank}    ${expect_load_time}
    Select bank on send refund offline document page    ธนาคารกรุงไทย จำกัด (มหาชน)
    Input bank no    11111111111
    Choose file refund offline    bookbank_exam.jpg
    Click send document button
    Check Text    ${element_error_message_on_send_offline_document}    คุณยังไม่ได้กดยอมรับเงื่อนไขการขอรับเงินคืน

TC_MC_03849
    [Documentation]    Check verify special character of account no
    [Tags]    Medium    Account-Web
    Create order offline channel    ${reconorder_slug}    ${normal_product1}    ${select_address}    ${shipping_post}    ${ibank_channel_radio_button}    ${lbl_payment_offline_ref2_number}
    Get total price on account detail page
    Reconcline the order payment success    01104776    ${order_id}    ${price}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select checkbox all product for refund
    Enter request refund data
    Go To Store Order Detail Page    ${reconorder_slug}    ${order_id}
    Seller accept refund    ${password_reconorder}
    Go to account order detail page    ${order_id}
    Go to send refund offline document page
    Check Element Visible    ${element_select_bank}    ${expect_load_time}
    Select bank on send refund offline document page    ธนาคารกรุงไทย จำกัด (มหาชน)
    Input bank no    bank!1111#
    Choose file refund offline    bookbank_exam.jpg
    Click checkbox confirm document
    Click send document button
    Check Text    ${element_error_message_on_send_offline_document}    กรุณากรอกเลขที่บัญชีธนาคารเป็นตัวเลข

TC_MC_03850
    [Documentation]    Check verify text of account no
    [Tags]    Medium    Account-Web
    Create order offline channel    ${reconorder_slug}    ${normal_product1}    ${select_address}    ${shipping_post}    ${ibank_channel_radio_button}    ${lbl_payment_offline_ref2_number}
    Get total price on account detail page
    Reconcline the order payment success    01104776    ${order_id}    ${price}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select checkbox all product for refund
    Enter request refund data
    Go To Store Order Detail Page    ${reconorder_slug}    ${order_id}
    Seller accept refund    ${password_reconorder}
    Go to account order detail page    ${order_id}
    Go to send refund offline document page
    Check Element Visible    ${element_select_bank}    ${expect_load_time}
    Select bank on send refund offline document page    ธนาคารกรุงไทย จำกัด (มหาชน)
    Input bank no    111-1111-11
    Choose file refund offline    bookbank_exam.jpg
    Click checkbox confirm document
    Click send document button
    Check Text    ${element_error_message_on_send_offline_document}    กรุณากรอกเลขที่บัญชีธนาคารเป็นตัวเลข

TC_MC_03851
    [Documentation]    Check verify text more than 11 of account no
    [Tags]    Medium    Account-Web
    Create order offline channel    ${reconorder_slug}    ${normal_product1}    ${select_address}    ${shipping_post}    ${ibank_channel_radio_button}    ${lbl_payment_offline_ref2_number}
    Get total price on account detail page
    Reconcline the order payment success    01104776    ${order_id}    ${price}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select checkbox all product for refund
    Enter request refund data
    Go To Store Order Detail Page    ${reconorder_slug}    ${order_id}
    Seller accept refund    ${password_reconorder}
    Go to account order detail page    ${order_id}
    Go to send refund offline document page
    Check Element Visible    ${element_select_bank}    ${expect_load_time}
    Select bank on send refund offline document page    ธนาคารกรุงไทย จำกัด (มหาชน)
    Input bank no    111111111111
    Choose file refund offline    bookbank_exam.jpg
    Click checkbox confirm document
    Click send document button
    Check Text    ${element_error_message_on_send_offline_document}    เลขที่บัญชีธนาคารระบุได้ไม่เกิน 11 หลัก

TC_MC_03852
    [Documentation]    Check verify emoji of account no
    [Tags]    Medium    Account-Web
    Create order offline channel    ${reconorder_slug}    ${normal_product1}    ${select_address}    ${shipping_post}    ${ibank_channel_radio_button}    ${lbl_payment_offline_ref2_number}
    Get total price on account detail page
    Reconcline the order payment success    01104776    ${order_id}    ${price}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select checkbox all product for refund
    Enter request refund data
    Go To Store Order Detail Page    ${reconorder_slug}    ${order_id}
    Seller accept refund    ${password_reconorder}
    Go to account order detail page    ${order_id}
    Go to send refund offline document page
    Check Element Visible    ${element_select_bank}    ${expect_load_time}
    Select bank on send refund offline document page    ธนาคารกรุงไทย จำกัด (มหาชน)
    Input bank no    #11ก😬11a111
    Choose file refund offline    bookbank_exam.jpg
    Click checkbox confirm document
    Click send document button
    Check Text    ${element_error_message_on_send_offline_document}    กรุณากรอกเลขที่บัญชีธนาคารเป็นตัวเลข

TC_MC_03855
    [Documentation]    WLSAccountRefund WLS Approve : reject refund document
    [Tags]    Regression    Medium    Account-Web
    Create order offline channel    ${reconorder_slug}    ${normal_product1}    ${select_address}    ${shipping_post}    ${ibank_channel_radio_button}    ${lbl_payment_offline_ref2_number}
    Get total price on account detail page
    Reconcline the order payment success    01104776    ${order_id}    ${price}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select checkbox all product for refund
    Enter request refund data
    Go To Store Order Detail Page    ${reconorder_slug}    ${order_id}
    Seller accept refund    ${password_reconorder}
    Go to account order detail page    ${order_id}
    Go to send refund offline document page
    Buyer send refund document success    ธนาคารกรุงไทย จำกัด (มหาชน)    11111111111    bookbank_exam.jpg
    Close Browser
    WLSApprove Reject Refund Document    ${order_id}
    Go to Login and Check Seller Login    ${URL_PORTAL}    ${BROWSER}    ${reconorder_slug}    ${user_reconorder}    ${password_reconorder}
    Go to account order detail page    ${order_id}
    Go to send refund offline document page
    Check Text    ${txt_reject_account_name_account_refund_page}    ไม่ผ่านเนื่องจาก : ไม่ตรงกับเอกสารผู้ซื้อ
    Check Text    ${txt_reject_bank_account_refund_page}    ไม่ผ่านเนื่องจาก : เอกสารไม่ชัด
    Check Text    ${txt_reject_book_bank_refund_page}    ไม่ผ่านเนื่องจาก : เอกสารไม่ชัด

TC_MC_03860
    [Documentation]    WLSAccountRefund WLS Approve : reject refund document
    [Tags]    Regression    Medium    Account-Web
    Create order offline channel    ${reconorder_slug}    ${normal_product1}    ${select_address}    ${shipping_post}    ${ibank_channel_radio_button}    ${lbl_payment_offline_ref2_number}
    Get total price on account detail page
    Reconcline the order payment success    01104776    ${order_id}    ${price}
    Go to store order history    ${reconorder_slug}
    Search order id on store order history    ${order_id}
    Seller ship the order with tracking number    ${ems_tracking}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select checkbox all product for refund
    Enter request refund data
    Go To Store Order Detail Page    ${reconorder_slug}    ${order_id}
    Seller accept refund    ${password_reconorder}
    Go to account order detail page    ${order_id}
    Go to send refund offline document page
    Buyer send refund document success    ธนาคารกรุงไทย จำกัด (มหาชน)    11111111111    bookbank_exam.jpg
    Close Browser
    WLSApprove Approve Refund Document    ${order_id}
    TMNReview Approve Refund Document    ${order_id}
    TMNVerify Approve Refund Document    ${order_id}
    TMNApprove Approve Refund Document    ${order_id}
    Go to Login and Check Seller Login    ${URL_PORTAL}    ${BROWSER}    ${reconorder_slug}    ${user_reconorder}    ${password_reconorder}
    Go to account order detail page    ${order_id}
    Go to send refund offline document page
    Check Text Page Should Contain    เอกสารผ่านการตรวจสอบแล้ว

TC_MC_04635
    [Documentation]    WLSAccountRefund Auto accept refund
    [Tags]    Regression    High    Account-Web
    Create order credit card channel    ${reconorder_slug}    ${normal_product1}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go to store order history    ${reconorder_slug}
    Search order id on store order history    ${order_id}
    Seller ship the order with tracking number    ${ems_tracking}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select checkbox all product for refund
    Enter request refund data
    Login admin manage order web
    API Order Manage Escrow Datetime    1     escrow_products.request_refund_expired_time    เพิ่ม-ลด    -3    Day
    Run cron auto accept request refund on admin manage order web    ${order_id_sub}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Check Text    ${status_text_on_account_history}    ร้านค้ายอมรับการขอเงินคืน

TC_MC_04636
    [Documentation]    WLSAccountRefund Auto cancel refund
    [Tags]    Regression    High    Account-Web
    Create order credit card channel    ${reconorder_slug}    ${normal_product1}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go to store order history    ${reconorder_slug}
    Search order id on store order history    ${order_id}
    Seller ship the order with tracking number    ${ems_tracking}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select checkbox all product for refund
    Enter request refund data
    Go To Store Order Detail Page    ${reconorder_slug}    ${order_id}
    Seller decline refund
    Login admin manage order web
    API Order Manage Escrow Datetime    1     escrow_products.response_refund_expired_time    เพิ่ม-ลด    -3    Day
    Run cron auto cancel request refund on admin manage order web    ${order_id_sub}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Check Text    ${status_text_on_account_history}    รอยืนยันการรับสินค้าของคุณ

TC_MC_04637
    [Documentation]    WLSAccountRefund Auto receive
    [Tags]    Regression    High    Account-Web
    Create order credit card channel    ${reconorder_slug}    ${normal_product1}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go to store order history    ${reconorder_slug}
    Search order id on store order history    ${order_id}
    Seller ship the order with tracking number    ${ems_tracking}
    Login admin manage order web
    API Order Manage Escrow Datetime    1     escrow_products.receive_expired_time    เพิ่ม-ลด    -10    Day
    Run cron auto receive on admin manage order web    ${order_id_sub}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Check Text    ${status_text_on_account_history}    คุณได้รับสินค้าเรียบร้อยแล้ว

TC_MC_08474
    [Documentation]    WLSAccountRefund Non display cancel button after seller decline refund, in case buyer request refund before ship
    [Tags]    Regression    Medium    Account-Web
    Create order credit card channel    ${reconorder_slug}    ${normal_product1}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select checkbox all product for refund
    Enter request refund data
    Go To Store Order Detail Page    ${reconorder_slug}    ${order_id}
    Seller decline refund
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Element Should Not Be Visible    ${cancel_refund_button_account_refund}

TC_MC_10280
    [Documentation]    WLSAccountRefund Check product refund in case, buy 2 WLS promotion (by cart : percent) product same promotion with mc code
    [Tags]    Regression    High    Account-Web
    ${products}    Create List    Robotreconorder Welove Promotion by cart 1    Robotreconorder Welove Promotion by cart 2
    Add To Cart Many Items    ${products}    ${reconorder_slug}
    Place Order    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    ${data}    Create List    ${lbl_credit_card_number1}    ${lbl_credit_card_number2}    ${lbl_credit_card_number3}    ${lbl_credit_card_number4}    ${lbl_cardname}    ${lbl_month}    ${lbl_year}    ${lbl_cnv}
    Input Data Of Credit Card    ${data}
    Input MC Code    ALLSTORE
    Click Confirm Checkout Button
    Get order id online from thankyou page
    Get substring order id online from thankyou page    ${order_id}
    Go to store order history    ${reconorder_slug}
    Search order id on store order history    ${order_id}
    Seller ship the order with tracking number    ${ems_tracking}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select checkbox all product for refund
    Enter request refund data
