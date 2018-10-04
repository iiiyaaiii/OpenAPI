*** Setting ***
Suite Setup       Open Custom Browser    ${URL_PORTAL}    ${BROWSER}
Suite Teardown    Close All Browsers
Test Setup        Clear Active Login
Force Tags        Account-Web
Library           SeleniumLibrary
Library           String
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Checkout.txt
Resource          ../../../../Keyword/Common/Account_History.txt
Resource          ../../../../Keyword/Common/Account_Detail.txt
Resource          ../../../../Keyword/Common/Account_Refund.txt
Resource          ../../../../Keyword/Common/Store_Detail.txt
Resource          ../../../../Keyword/Common/Store_History.txt
Resource          ../../../../Keyword/Common/ManageOrder.txt
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Resource/WeMall/WebElement/Account_History.txt
Resource          ../../../../Resource/WeMall/WebElement/Account_Detail.txt
Resource          ../../../../Resource/Wemall/WebElement/Checkout.txt
Resource          ../../../../Resource/Wemall/WebElement/Cart.txt
Resource          ../../../../Resource/WeMall/WebElement/Account_Refund.txt

*** Test Cases ***
TC_MC_04786
    [Tags]    Regression    Medium    Account-Web
    [Documentation]    Check error message in case user doesn't select product for refund
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Create order credit card channel    ${storename_slug_wemall}    trustmall 004    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click search button on account order history
    Check Element Visible    ${refund_link_account_history}    ${expect_load_time}
    Click refund link on account order history
    Select reason refund on account refund page    ร้านค้าแจ้งว่าไม่มีสินค้า / สินค้าหมด
    Input description refund to shop    ขอเงินคืนเนื่องจากเกิดปัญหากับสินค้า
    Choose file upload    A02.jpg
    Click request refund button on account refund page
    Focus    ${check_box_account_refund_page}

TC_MC_04788
    [Tags]    Regression    Medium    Account-Web
    [Documentation]    Check error message in case user doesn't input message to shop
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Create order credit card channel    ${storename_slug_wemall}    trustmall 004    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Check Element Visible    ${text_order_id_thankyou_page}    ${expect_load_time}
    ${text_order_id}    Get Text    ${text_order_id_thankyou_page}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click search button on account order history
    Check Element Visible    ${refund_link_account_history}    ${expect_load_time}
    Click refund link on account order history
    Select checkbox all product for refund
    Select reason refund on account refund page    ร้านค้าแจ้งว่าไม่มีสินค้า / สินค้าหมด
    Choose file upload    A02.jpg
    Click request refund button on account refund page
    Check error message on account refund page    ${element_description_error_message}    ระบุรายละเอียดการขอคืน

TC_MC_04787
    [Tags]    Regression    Medium    Account-Web
    [Documentation]    Check error message in case user doesn't select refund reason
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Create order credit card channel    ${storename_slug_wemall}    trustmall 004    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Check Element Visible    ${text_order_id_thankyou_page}    ${expect_load_time}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click search button on account order history
    Check Element Visible    ${refund_link_account_history}    ${expect_load_time}
    Click refund link on account order history
    Select checkbox all product for refund
    Input description refund to shop    ขอเงินคืนเนื่องจากเกิดปัญหากับสินค้า
    Choose file upload    A02.jpg
    Click request refund button on account refund page
    Check error message on account refund page    ${element_reason_refund_error_message}    กรุณาเลือกเหตุผลที่ต้องการขอเงินคืน

TC_MC_04789
    [Tags]    Regression    Medium    Account-Web
    [Documentation]    Check error message in case user incorrectly upload image file
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Create order credit card channel    ${storename_slug_wemall}    trustmall 004    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click search button on account order history
    Check Element Visible    ${refund_link_account_history}    ${expect_load_time}
    Click refund link on account order history
    Select checkbox all product for refund
    Select reason refund on account refund page    ร้านค้าแจ้งว่าไม่มีสินค้า / สินค้าหมด
    Input description refund to shop    ขอเงินคืนเนื่องจากเกิดปัญหากับสินค้า
    Choose file upload    ExcelUpload.xlsx
    Click request refund button on account refund page
    Check error message on account refund page    ${element_upload_file_error_message}    ไฟล์ต้องเป็น jpg ,gif ,png หรือ pdf เท่านั้น

TC_MC_04790
    [Tags]    Regression    Medium    Account-Web
    [Documentation]    Check error message in case user upload oversize image file
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Create order credit card channel    ${storename_slug_wemall}    trustmall 004    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click search button on account order history
    Check Element Visible    ${refund_link_account_history}    ${expect_load_time}
    Click refund link on account order history
    Select checkbox all product for refund
    Select reason refund on account refund page    ร้านค้าแจ้งว่าไม่มีสินค้า / สินค้าหมด
    Input description refund to shop    ขอเงินคืนเนื่องจากเกิดปัญหากับสินค้า
    Choose file upload    over2MB.jpg
    Click request refund button on account refund page
    Check error message on account refund page    ${element_upload_file_error_message}    ขนาดไฟล์ต้องไม่เกิน 2 MB

TC_MC_04791
    [Tags]    Regression    Medium    Account-Web
    [Documentation]    Check refund status after buyer request refund on refund account page
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Create order credit card channel    ${storename_slug_wemall}    trustmall 004    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click search button on account order history
    Check Element Visible    ${refund_link_account_history}    ${expect_load_time}
    Click refund link on account order history
    Select checkbox all product for refund
    Select reason refund on account refund page    ร้านค้าแจ้งว่าไม่มีสินค้า / สินค้าหมด
    Input description refund to shop    ขอเงินคืนเนื่องจากเกิดปัญหากับสินค้า
    Click request refund button on account refund page
    Click confirm action
    Check Text    ${element_box_view_refund}    - คุณได้ทำการแจ้งขอเงินคืน กรุณารอร้านค้าตรวจสอบและดำเนินการ

TC_MC_04792
    [Tags]    Regression    Medium    Account-Web
    [Documentation]    Check status in case accept refund full after paid on buyer order detail page
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Create order credit card channel    ${storename_slug_wemall}    trustmall 004    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click search button on account order history
    Click refund link on account order history
    Select checkbox all product for refund
    Select reason refund on account refund page    ร้านค้าแจ้งว่าไม่มีสินค้า / สินค้าหมด
    Input description refund to shop    ขอเงินคืนเนื่องจากเกิดปัญหากับสินค้า
    Choose file upload    A02.jpg
    Click request refund button on account refund page
    Click confirm action
    Check Text    ${element_box_view_refund}    - คุณได้ทำการแจ้งขอเงินคืน กรุณารอร้านค้าตรวจสอบและดำเนินการ
    Go to store order detail    ${storename_slug_wemall}    ${order_id}
    Click Element    ${view_detail_store_order_detail}
    Click accept refund button
    Check Element Visible    ${accept_refund_modal}    ${expect_load_time}
    Input password accept request refund    ${pass_login_trust_wemall}
    Click confirm accept refund button
    Click ok button on confirm accept modal
    Check Element Visible    ${go_to_detail_button}    ${expect_load_time}
    Go to account order detail page    ${order_id}
    Click view refund detail button on account detail page
    ${text_accept_refund}    Get text accept refund on account refund page
    Compare string    ${text_accept_refund}    ร้านค้าได้ยอมรับการขอเงินคืนของคุณเรียบร้อยแล้ว

TC_MC_04793
    [Tags]    Regression    Medium    Account-Web
    [Documentation]    Check refund status after seller decline refund on refund account page
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Create order credit card channel    ${storename_slug_wemall}    trustmall 004    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Store Order History Page    ${storename_slug_wemall}
    Search order id on store order history    ${order_id}
    Click search button on store order history
    Click Button    ${btn_shipping}
    Click Button    ${btn_shipping_custom}
    Input Text    ${input_tracking_custom}    EX123120380809TH
    Input Text    ${input_url_custom}    https://www.google.com
    ${file_path}    Get file path
    Choose File    ${input_custom_file}    ${file_path}/A02.jpg
    Click Button    ${confirm_custom_button}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click search button on account order history
    Check Element Visible    ${refund_link_account_history}    ${expect_load_time}
    Click refund link on account order history
    Select checkbox all product for refund
    Select reason refund on account refund page    ร้านค้าแจ้งว่าไม่มีสินค้า / สินค้าหมด
    Input description refund to shop    ขอเงินคืนเนื่องจากเกิดปัญหากับสินค้า
    Choose file upload    A02.jpg
    Click request refund button on account refund page
    Click confirm action
    Check Text    ${element_box_view_refund}    - คุณได้ทำการแจ้งขอเงินคืน กรุณารอร้านค้าตรวจสอบและดำเนินการ
    Go to store order detail    ${storename_slug_wemall}    ${order_id}
    Click Element    ${view_detail_store_order_detail}
    Click decline refund button
    Check Element Visible    ${decline_refund_modal}    ${expect_load_time}
    Input description decline to buyer    ขออภัยสินค้าสินค้าหมดจะทำการจัดส่งภายใน 3-7 วัน
    Choose file for decline refund
    Click confirm decline refund button
    Click ok button on confirm decline modal
    Go to account order detail page    ${order_id}
    Click view refund detail button on account detail page
    Element Should Contain    ${element_decline_refund_account_refund_page_text1}    - ร้านค้าได้ปฏิเสธการขอเงินคืนจากคุณพร้อมเหตุผลในการปฏิเสธ
    Element Should Contain    ${element_decline_refund_account_refund_page_text2}    - คุณสามารถยกเลิกการขอเงินคืน เพื่อให้รายการสั่งซื้อนี้กลับไปดำเนินการต่อไปตามปกติ
    Element Should Contain    ${element_decline_refund_account_refund_page_text3}    - คุณสามารถขอเงินคืนใหม่ เพื่อทำการแก้ไขรายละเอียดการขอเงินคืน
    Element Should Contain    ${element_decline_refund_account_refund_page_text4}    - หากคุณไม่ดำเนินการใดๆ ภายในระยะเวลา 72 ชั่วโมงนับจากที่ร้านค้าได้ปฏิเสธการขอเงินคืนของคุณ   ระบบจะถือว่าคุณยอมรับการปฏิเสธการขอเงินคืน และรายการสั่งซื้อนี้จะกลับไปดำเนินการต่อไปตามปกติ

TC_MC_04794
    [Tags]    Regression    Medium    Account-Web
    [Documentation]    Check refund status after buyer cancel refund on refund account page
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Create order credit card channel    ${storename_slug_wemall}    trustmall 004    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Store Order History Page    ${storename_slug_wemall}
    Search order id on store order history    ${order_id}
    Click search button on store order history
    Click Button    ${btn_shipping}
    Click Button    ${btn_shipping_custom}
    Input Text    ${input_tracking_custom}    EX123120380809TH
    Input Text    ${input_url_custom}    https://www.google.com
    ${file_path}    Get file path
    Choose File    ${input_custom_file}    ${file_path}/A02.jpg
    Click Button    ${confirm_custom_button}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click search button on account order history
    Check Element Visible    ${refund_link_account_history}    ${expect_load_time}
    Click refund link on account order history
    Select checkbox all product for refund
    Select reason refund on account refund page    ร้านค้าแจ้งว่าไม่มีสินค้า / สินค้าหมด
    Input description refund to shop    ขอเงินคืนเนื่องจากเกิดปัญหากับสินค้า
    Choose file upload    A02.jpg
    Click request refund button on account refund page
    Click confirm action
    Check Text    ${element_box_view_refund}    - คุณได้ทำการแจ้งขอเงินคืน กรุณารอร้านค้าตรวจสอบและดำเนินการ
    Go to store order detail    ${storename_slug_wemall}    ${order_id}
    Click Element    ${view_detail_store_order_detail}
    Click decline refund button
    Check Element Visible    ${decline_refund_modal}    ${expect_load_time}
    Input description decline to buyer    ขออภัยสินค้าสินค้าหมดจะทำการจัดส่งภายใน 3-7 วัน
    Choose file for decline refund
    Click confirm decline refund button
    Click ok button on confirm decline modal
    Page Should Contain    - คุณได้ปฏิเสธการขอเงินคืนจากผู้ซื้อ กรุณารอผู้ซื้อตรวจสอบและดำเนินการ
    Go to account order detail page    ${order_id}
    Click view refund detail button on account detail page
    Check Element Visible    ${cancel_refund_button_account_refund}    ${expect_load_time}
    Click cancel refund on account refund page
    Click confirm action
    Check Element Visible    ${element_accept_refund_text}    ${expect_load_time}
    Check Text    ${element_accept_refund_text}    คุณได้ยกเลิกการขอเงินคืน

TC_MC_04934
    [Tags]    Regression    Medium    Account-Web
    [Documentation]    Chek status on account detail page (Place order 3 Product)
    Set Selenium Speed    0.2
    ${products}    Create List    trustmall 004    trustmall 003    trustmall 002
    ${data}    Create List    ${lbl_credit_card_number1}    ${lbl_credit_card_number2}    ${lbl_credit_card_number3}    ${lbl_credit_card_number4}    ${lbl_cardname}    ${lbl_month}    ${lbl_year}    ${lbl_cnv}
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Add To Cart Many Items    ${products}    ${slug_name_sanity}
    Place Order    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Input Data Of Credit Card    ${data}
    Click Confirm Checkout Button
    Get order id online from thankyou page
    Get substring order id online from thankyou page    ${order_id}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click search button on account order history
    Click refund link on account order history
    Select checkbox product for refund by product name    ${trustmall_product1_name}
    Select reason refund on account refund page    ร้านค้าแจ้งว่าไม่มีสินค้า / สินค้าหมด
    Input description refund to shop    ขอเงินคืนเนื่องจากเกิดปัญหากับสินค้า
    Choose file upload    A02.jpg
    Click request refund button on account refund page
    Click confirm action
    Check Text    ${element_box_view_refund}    - คุณได้ทำการแจ้งขอเงินคืน กรุณารอร้านค้าตรวจสอบและดำเนินการ
    Go To Store Order History Page    ${storename_slug_wemall}
    Search order id on store order history    ${order_id}
    Click search button on store order history
    Click Element    ${request_tracking_button}
    Click check box for request tracking    ${trustmall_product1_name}
    Click check box for request tracking    ${trustmall_product9_name}
    Click Button    ${btn_shipping_custom}
    Input Text    ${input_tracking_custom}    จัดส่งโดย aden
    Input Text    ${input_url_custom}    https://store.wls-dev.com
    Input Text    ${input_url_custom_2}    https://store.wls-dev.co.th
    ${file_path}    Get file path
    Choose File    ${input_custom_file}    ${file_path}/A02.jpg
    Click Button    ${confirm_custom_button}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click search button on account order history
    Go to account order detail page    ${order_id}
    Check status order on account detail page    รอการแจ้งจัดส่งสินค้า
    Check countdown refund time text on account detail page    ${element_item_countdown_time_order_detail}
    Check Text    ${text_ship_by_item}    (จัดส่งไปแล้ว 1 จาก 3 รายการ)
    Check Text    ${text_request_refund_order_detail}    คุณได้ทำการขอเงินคืน
    Check Text    ${account_detail_refund_link}    ขอเงินคืน

TC_MC_04822
    [Tags]    Regression    High    Account-Web
    [Documentation]    WMAccountRefund Auto accept refund
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Create order credit card channel    ${storename_slug_wemall}    trustmall 004    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Store Order History Page    ${storename_slug_wemall}
    Search order id on store order history    ${order_id}
    Click search button on store order history
    Click Button    ${btn_shipping}
    Click Button    ${btn_shipping_custom}
    Input Text    ${input_tracking_custom}    EX123120380809TH
    Input Text    ${input_url_custom}    https://www.google.com
    ${file_path}    Get file path
    Choose File    ${input_custom_file}    ${file_path}/A02.jpg
    Click Button    ${confirm_custom_button}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click search button on account order history
    Check Element Visible    ${refund_link_account_history}    ${expect_load_time}
    Click refund link on account order history
    Select checkbox all product for refund
    Select reason refund on account refund page    ร้านค้าแจ้งว่าไม่มีสินค้า / สินค้าหมด
    Input description refund to shop    ขอเงินคืนเนื่องจากเกิดปัญหากับสินค้า
    Choose file upload    A02.jpg
    Click request refund button on account refund page
    Click confirm action
    Login admin manage order web
    Go To    ${URL_ORDER}/admin/manage/datetime
    Search order id on manage datetime page    ${order_id_sub}
    API Order Manage Escrow Datetime    1    escrow_products.request_refund_expired_time    addsub    -3    day
    Run cron auto accept request refund on admin manage order web    ${order_id_sub}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click search button on account order history
    Check Text    ${status_text_on_account_history}    กำลังจัดส่งสินค้า
    Check Text    ${text_request_refund_order_history}    คุณได้ทำการขอเงินคืน

TC_MC_04823
    [Tags]    Regression    High    Account-Web
    [Documentation]    WMAccountRefund Auto cancel refund
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Delete All Product In Cart
    Create order credit card channel    ${storename_slug_wemall}    trustmall 004    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Store Order History Page    ${storename_slug_wemall}
    Search order id on store order history    ${order_id}
    Click search button on store order history
    Click Button    ${btn_shipping}
    Click Button    ${btn_shipping_custom}
    Input Text    ${input_tracking_custom}    EX123120380809TH
    Input Text    ${input_url_custom}    https://www.google.com
    ${file_path}    Get file path
    Choose File    ${input_custom_file}    ${file_path}/A02.jpg
    Click Button    ${confirm_custom_button}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click search button on account order history
    Check Element Visible    ${refund_link_account_history}    ${expect_load_time}
    Click refund link on account order history
    Select checkbox all product for refund
    Select reason refund on account refund page    ร้านค้าแจ้งว่าไม่มีสินค้า / สินค้าหมด
    Input description refund to shop    ขอเงินคืนเนื่องจากเกิดปัญหากับสินค้า
    Choose file upload    A02.jpg
    Click request refund button on account refund page
    Click confirm action
    Check Text    ${element_box_view_refund}    - คุณได้ทำการแจ้งขอเงินคืน กรุณารอร้านค้าตรวจสอบและดำเนินการ
    Go to store order detail    ${storename_slug_wemall}    ${order_id}
    Click Element    ${view_detail_store_order_detail}
    Click decline refund button
    Check Element Visible    ${decline_refund_modal}    ${expect_load_time}
    Input description decline to buyer    ขออภัยสินค้าสินค้าหมดจะทำการจัดส่งภายใน 3-7 วัน
    Choose file for decline refund
    Click confirm decline refund button
    Click ok button on confirm decline modal
    Page Should Contain    - คุณได้ปฏิเสธการขอเงินคืนจากผู้ซื้อ กรุณารอผู้ซื้อตรวจสอบและดำเนินการ
    Login admin manage order web
    Go To    ${URL_ORDER}/admin/manage/datetime
    Search order id on manage datetime page    ${order_id_sub}
    API Order Manage Escrow Datetime    1     escrow_products.response_refund_expired_time    เพิ่ม-ลด    -3    Day
    Run cron auto cancel request refund on admin manage order web    ${order_id_sub}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click search button on account order history
    Check Text    ${status_text_on_account_history}    กำลังจัดส่งสินค้า

