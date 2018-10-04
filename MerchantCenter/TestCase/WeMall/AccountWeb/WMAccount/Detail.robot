*** Setting ***
[Documentation]    Check detail on order detail page
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
Resource          ../../../../Keyword/Common/ManageOrder.txt
Resource          ../../../../Keyword/Common/Account_Detail.txt
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Resource/WeMall/WebElement/Account_History.txt
Resource          ../../../../Resource/WeMall/WebElement/Account_Detail.txt
Resource          ../../../../Resource/WeMall/WebElement/Account_Refund.txt
Resource          ../../../../Resource/Wemall/WebElement/Checkout.txt
Resource          ../../../../Resource/Wemall/WebElement/Cart.txt
Resource          ../../../../Keyword/Common/Store_History.txt
Resource          ../../../../Keyword/Common/Store_Detail.txt
Resource          ../../../../Keyword/Common/Freebie.txt

*** variable ***
${freebie_orderid}    800011406692
${seller_promotion_freebie_orderid}    800011406693

*** Test Cases ***
TC_MC_04769
    [Documentation]    Check item status in case payment failed on buyer order detail page
    [Tags]    Regression    Medium    Account-Web
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Create order ewallet channel    ${storename_slug_wemall}    trustmall 004    ${select_address}    ${shipping_post}    ${ew_channel_radio_button}
    Go to account order detail page    ${order_id}
    Check status order on account detail page    ชำระเงินไม่สำเร็จ
    Check item status in product order detail table    ${element_item_status_order_detail_product1}    ชำระเงินไม่สำเร็จ

TC_MC_04770
    [Documentation]    Check item status after place order on buyer order detail page
    [Tags]    Regression    High    Account-Web
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Create order offline channel    ${storename_slug_wemall}    ${trustmall_product1_name}    ${select_address}    ${shipping_post}    ${cs_channel_radio_button}    ${lbl_payment_offline_ref2_number}
    Go to account order detail page    ${order_id}
    Check status order on account detail page    รอการชำระเงินของคุณ
    Check countdown payment time text on account detail page    ${element_countdown_time_order_detail}
    Check item status in product order detail table    ${element_item_status_order_detail_product1}    รอการชำระเงินของคุณ

TC_MC_04771
    [Documentation]    Check item status after expired payment on buyer order detail page
    [Tags]    Regression    Medium    Account-Web
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Create order offline channel    ${storename_slug_wemall}    ${trustmall_product1_name}    ${select_address}    ${shipping_post}    ${cs_channel_radio_button}    ${lbl_payment_offline_ref2_number}
    ${order_id_sub}    Get substring order id form thankyou page    ${order_id}
    Login admin manage order web
    Go To    ${URL_ORDER}/admin/manage/datetime
    Search order id on manage datetime page    ${order_id_sub}
    API Order Manage Datetime    payment_expired_time    เพิ่ม-ลด    -3    day
    Run cron order expire on admin manage order web    ${order_id_sub}
    Go to account order detail page    ${order_id}
    Check status order on account detail page    หมดเวลาการชำระเงิน
    Check item status in product order detail table    ${element_item_status_order_detail_product1}    หมดเวลาการชำระเงิน

TC_MC_04772
    [Documentation]    Check item status after payment on buyer order detail page
    [Tags]    Regression    High    Account-Web
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Create order credit card channel    ${storename_slug_wemall}    trustmall 004    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go to account order detail page    ${order_id}
    Check status order on account detail page    รอการแจ้งจัดส่งสินค้า
    Check countdown time text on account history page    ${element_item_countdown_time_order_detail}
    Check request refund link on account history page
    Check item status in product order detail table    ${element_item_status_order_detail_product1}    รอการแจ้งจัดส่งสินค้า

TC_MC_04773
    [Documentation]    Check item status after seller ship full on buyer order detail page
    [Tags]    Regression    High    Account-Web
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Create order credit card channel    ${storename_slug_wemall}    trustmall 004    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Store Order History    ${storename_slug_wemall}
    Search order id on store order history    ${order_id}
    Click search button on account order history
    Shipping One Product Custom By Product Name    EX123456789TH    https://www.google.co.th    https://store.wls-dev.co.th    A02.jpg    ${trustmall_product1_name}
    Go to account order detail page    ${order_id}
    Check status order on account detail page    กำลังจัดส่งสินค้า
    Check request refund link on account history page
    Check item status in product order detail table    ${element_item_status_order_detail_product1}    กำลังจัดส่งสินค้า
    Check item status in product order detail table    ${element_item_tracking_desc}    หมายเลขพัสดุ หรือ ข้อความ
    Check item status in product order detail table    ${element_item_tracking_desc}    EX123456789TH
    Check item status in product order detail table    ${element_item_tracking_status}    ตรวจสอบสถานะการจัดส่ง
    Check item status in product order detail table    ${element_item_link_tracking}    https://www.google.co.th
    Check item status in product order detail table    ${element_item_link_attach_file}    ไฟล์แนบ

TC_MC_04774
    [Documentation]    Check item status after receive full on buyer order detail page
    [Tags]    Regression    High    Account-Web
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Create order credit card channel    ${storename_slug_wemall}    trustmall 004    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Store Order History    ${storename_slug_wemall}
    Search order id on store order history    ${order_id}
    Click search button on account order history
    Shipping One Product Custom By Product Name    EX123456789TH    https://www.google.co.th    https://store.wls-dev.co.th    A02.jpg    ${trustmall_product1_name}
    Login admin manage order web
    API Order Manage Escrow Datetime    1     escrow_products.receive_expired_time    เพิ่ม-ลด    -10    Day
    Run cron auto receive on admin manage order web    ${order_id_sub}
    Go to account order detail page    ${order_id}
    Check status order on account detail page    คุณได้รับสินค้าเรียบร้อยแล้ว
    Check item status in product order detail table    ${element_item_status_order_detail_product1}    คุณได้รับสินค้าเรียบร้อยแล้ว
    Check item status in product order detail table    ${element_item_tracking_desc}    หมายเลขพัสดุ หรือ ข้อความ
    Check item status in product order detail table    ${element_item_tracking_desc}    EX123456789TH
    Check item status in product order detail table    ${element_item_tracking_status}    ตรวจสอบสถานะการจัดส่ง
    Check item status in product order detail table    ${element_item_link_tracking}    https://www.google.co.th
    Check item status in product order detail table    ${element_item_link_attach_file}    ไฟล์แนบ

TC_MC_04775
    [Documentation]    Check item status after ship partial on buyer order detail page
    [Tags]    Regression    High    Account-Web
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    ${products}    Create List    ${sanity1_product}    ${sanity2_product}
    ${data}    Create List    ${lbl_credit_card_number1}    ${lbl_credit_card_number2}    ${lbl_credit_card_number3}    ${lbl_credit_card_number4}    ${lbl_cardname}    ${lbl_month}    ${lbl_year}    ${lbl_cnv}
    Add To Cart Many Items    ${products}    ${slug_name_sanity}
    Place Order    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Input Data Of Credit Card    ${data}
    Click Confirm Checkout Button
    Get order id online from thankyou page
    Get substring order id online from thankyou page    ${order_id}
    Go To Store Order History    ${storename_slug_wemall}
    Search order id on store order history    ${order_id}
    Click search button on account order history
    Click Element    ${request_tracking_button}
    Click check box for request tracking    ${sanity1_product}
    Click Button    ${btn_shipping_custom}
    Input Text    ${input_tracking_custom}    จัดส่งโดย aden
    Input Text    ${input_url_custom}    https://store.wls-dev.com
    Input Text    ${input_url_custom_2}    https://store.wls-dev.co.th
    ${file_path}    Get file path
    Choose File    ${input_custom_file}    ${file_path}/A02.jpg
    Click Button    ${confirm_custom_button}
    Go to account order detail page    ${order_id}
    Check status order on account detail page    รอการแจ้งจัดส่งสินค้า
    Check countdown ship time text on account detail page    ${element_countdown_time_order_detail}
    Check Text    ${text_ship_by_item}    (จัดส่งไปแล้ว 1 จาก 2 รายการ)
    Check Text    ${account_detail_refund_link}    ขอเงินคืน
    Check item status in product order detail table    ${lbl_status_item}    กำลังจัดส่งสินค้า
    Check item status in product order detail table    ${element_item_tracking_desc}    หมายเลขพัสดุ หรือ ข้อความ
    Check item status in product order detail table    ${element_item_tracking_desc}    จัดส่งโดย aden
    Check item status in product order detail table    ${element_item_tracking_status}    ตรวจสอบสถานะการจัดส่ง
    Check item status in product order detail table    ${element_item_link_tracking}    https://store.wls-dev.com
    Check item status in product order detail table    ${element_item_link_attach_file}    ไฟล์แนบ
    Check item status in product order detail table    ${lbl_status_item_2}    รอการแจ้งจัดส่งสินค้า

TC_MC_04776
    [Documentation]     Check status in case refund full before ship (Place order 2 Refund 2) on buyer order detail page
    [Tags]    Regression    Medium    Account-Web
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    ${products}    Create List    ${sanity1_product}    ${sanity2_product}
    ${data}    Create List    ${lbl_credit_card_number1}    ${lbl_credit_card_number2}    ${lbl_credit_card_number3}    ${lbl_credit_card_number4}    ${lbl_cardname}    ${lbl_month}    ${lbl_year}    ${lbl_cnv}
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
    Select checkbox all product for refund
    Select reason refund on account refund page    ร้านค้าแจ้งว่าไม่มีสินค้า / สินค้าหมด
    Input description refund to shop    ขอเงินคืนเนื่องจากเกิดปัญหากับสินค้า
    Choose file upload    A02.jpg
    Click request refund button on account refund page
    Click confirm action
    Check Text    ${element_box_view_refund}    - คุณได้ทำการแจ้งขอเงินคืน กรุณารอร้านค้าตรวจสอบและดำเนินการ
    Go to account order detail page    ${order_id}
    Check status order on account detail page    รอการแจ้งจัดส่งสินค้า
    Check Text    ${text_request_refund_order_detail}    คุณได้ทำการขอเงินคืน
    Check item status in product order detail table    ${lbl_status_item_product1}    คุณได้ทำการขอเงินคืน
    Check countdown refund time text on account detail page    ${lbl_refund_countdown_time_product1}
    Check item status in product order detail table    ${lbl_status_item_product2}    คุณได้ทำการขอเงินคืน
    Check countdown refund time text on account detail page    ${lbl_refund_countdown_time_product2}

TC_MC_04777
    [Documentation]     Check status in case refund after partail ship (Place order 2 Refund 1) on buyer order detail page
    [Tags]    Regression    Medium    Account-Web
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    ${products}    Create List    ${sanity1_product}    ${sanity2_product}
    ${data}    Create List    ${lbl_credit_card_number1}    ${lbl_credit_card_number2}    ${lbl_credit_card_number3}    ${lbl_credit_card_number4}    ${lbl_cardname}    ${lbl_month}    ${lbl_year}    ${lbl_cnv}
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
    Select checkbox product for refund by product name    ${sanity2_product}
    Select reason refund on account refund page    ร้านค้าแจ้งว่าไม่มีสินค้า / สินค้าหมด
    Input description refund to shop    ขอเงินคืนเนื่องจากเกิดปัญหากับสินค้า
    Choose file upload    A02.jpg
    Click request refund button on account refund page
    Click confirm action
    Check Text    ${element_box_view_refund}    - คุณได้ทำการแจ้งขอเงินคืน กรุณารอร้านค้าตรวจสอบและดำเนินการ
    Go to account order detail page    ${order_id}
    Check status order on account detail page    รอการแจ้งจัดส่งสินค้า
    Check countdown refund time text on account detail page    ${element_item_countdown_time_order_detail}
    Check Text    ${text_request_refund_order_detail}    คุณได้ทำการขอเงินคืน
    Check Text    ${account_detail_refund_link}    ขอเงินคืน
    Check item status in product order detail table    ${lbl_status_item_product1}    คุณได้ทำการขอเงินคืน
    Check item status in product order detail table    ${lbl_status_item_product2}    รอการแจ้งจัดส่งสินค้า

TC_MC_04778
    [Documentation]     Check status in case refund before ship (Place order 2 Ship 1 Refund 1) on buyer order detail page
    [Tags]    Regression    Medium    Account-Web
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    ${products}    Create List    ${sanity1_product}    ${sanity2_product}
    ${data}    Create List    ${lbl_credit_card_number1}    ${lbl_credit_card_number2}    ${lbl_credit_card_number3}    ${lbl_credit_card_number4}    ${lbl_cardname}    ${lbl_month}    ${lbl_year}    ${lbl_cnv}
    Add To Cart Many Items    ${products}    ${slug_name_sanity}
    Place Order    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Input Data Of Credit Card    ${data}
    Click Confirm Checkout Button
    Get order id online from thankyou page
    Get substring order id online from thankyou page    ${order_id}
    Go To Store Order History Page    ${storename_slug_wemall}
    Search order id on store order history    ${order_id}
    Click search button on store order history
    Click Element    ${request_tracking_button}
    Click check box for request tracking    ${sanity1_product}
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
    Click refund link on account order history
    Select checkbox product for refund by product name    ${sanity1_product}
    Select reason refund on account refund page    ร้านค้าแจ้งว่าไม่มีสินค้า / สินค้าหมด
    Input description refund to shop    ขอเงินคืนเนื่องจากเกิดปัญหากับสินค้า
    Choose file upload    A02.jpg
    Click request refund button on account refund page
    Click confirm action
    Check Text    ${element_box_view_refund}    - คุณได้ทำการแจ้งขอเงินคืน กรุณารอร้านค้าตรวจสอบและดำเนินการ
    Go to account order detail page    ${order_id}
    Check status order on account detail page    รอการแจ้งจัดส่งสินค้า
    Check countdown refund time text on account detail page    ${element_item_countdown_time_order_detail}
    Check Text    ${text_request_refund_order_detail}    คุณได้ทำการขอเงินคืน
    Check item status in product order detail table    ${lbl_status_item_product1}    คุณได้ทำการขอเงินคืน
    Check countdown refund time text on account detail page    ${lbl_refund_countdown_time_product1}
    Check item status in product order detail table    ${lbl_status_item_product2}    กำลังจัดส่งสินค้า
    Check Text    ${check_text_tracking_product2}    หมายเลขพัสดุ หรือ ข้อความ\nEX123456789TH
    Check Text    ${check_status_tracking_product2}    ตรวจสอบสถานะการจัดส่ง
    Check Text    ${link_tracking}    https://www.google.co.th

TC_MC_04779
    [Documentation]     Check status in case accept refund full after paid on buyer order detail page
    [Tags]    Regression    Medium    Account-Web
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
    Check status order on account detail page    ร้านค้ายอมรับการขอเงินคืน
    Check item status in product order detail table    ${refund_item_status_order_detail_product1}    ร้านค้ายอมรับการขอเงินคืน

TC_MC_04780
    [Documentation]     Check status in case accept refund full after ship on buyer order detail page
    [Tags]    Regression    Medium    Account-Web
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Create order credit card channel    ${storename_slug_wemall}    trustmall 004    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Store Order History    ${storename_slug_wemall}
    Search order id on store order history    ${order_id}
    Click search button on account order history
    Check Element Visible    ${request_tracking_button}    ${expect_load_time}
    Click Element    ${request_tracking_button}
    Click Button    ${btn_shipping_custom}
    Input Text    ${input_tracking_custom}    EX123456789TH
    Input Text    ${input_url_custom}    https://www.google.co.th
    ${file_path}    Get file path
    Choose File    ${input_custom_file}    ${file_path}/A02.jpg
    Click Button    ${confirm_custom_button}
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
    Check status order on account detail page    ร้านค้ายอมรับการขอเงินคืน
    Check item status in product order detail table    ${refund_item_status_order_detail_product1}    ร้านค้ายอมรับการขอเงินคืน

TC_MC_04781
    [Documentation]     Check status in case seller decline refund on buyer order detail page
    [Tags]    Regression    Medium    Account-Web
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Create order credit card channel    ${storename_slug_wemall}    trustmall 004    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Store Order History    ${storename_slug_wemall}
    Search order id on store order history    ${order_id}
    Click search button on account order history
    Check Element Visible    ${request_tracking_button}    ${expect_load_time}
    Click Element    ${request_tracking_button}
    Click Button    ${btn_shipping_custom}
    Input Text    ${input_tracking_custom}    EX123456789TH
    Input Text    ${input_url_custom}    https://www.google.co.th
    ${file_path}    Get file path
    Choose File    ${input_custom_file}    ${file_path}/A02.jpg
    Click Button    ${confirm_custom_button}
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
    Click decline refund button
    Check Element Visible    ${decline_refund_modal}    ${expect_load_time}
    Input description decline to buyer    ขออภัยสินค้าสินค้าหมดจะทำการจัดส่งภายใน 3-7 วัน
    Choose file for decline refund
    Click confirm decline refund button
    Click ok button on confirm decline modal
    Page Should Contain    - คุณได้ปฏิเสธการขอเงินคืนจากผู้ซื้อ กรุณารอผู้ซื้อตรวจสอบและดำเนินการ
    Go to account order detail page    ${order_id}
    Check status order on account detail page    กำลังจัดส่งสินค้า
    Check Text    ${text_request_refund_order_detail}    คุณได้ทำการขอเงินคืน
    Check item status in product order detail table    ${refund_item_status_order_detail_product1}    ร้านค้าปฏิเสธการขอเงินคืน
    Check countdown decline time text on account detail page    ${element_item_countdown_time_order_detail_product1}

TC_MC_04782
    [Documentation]     Check status in case place order 1 product (Already shipped)
    [Tags]    Regression    High    Account-Web
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    ${products}    Create List    ${sanity1_product}    ${sanity2_product}
    ${data}    Create List    ${lbl_credit_card_number1}    ${lbl_credit_card_number2}    ${lbl_credit_card_number3}    ${lbl_credit_card_number4}    ${lbl_cardname}    ${lbl_month}    ${lbl_year}    ${lbl_cnv}
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
    Select checkbox product for refund by product name    ${Adidas_shoe}
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
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click search button on account order history
    Go To    ${URL_ACCOUNT}/profile/report/refund/${order_id}?refund_more=1?refund_more=1
    Select checkbox product for refund by product name    ${Vio_baseball_cap}
    Select reason refund on account refund page    ร้านค้าแจ้งว่าไม่มีสินค้า / สินค้าหมด
    Input description refund to shop    ขอเงินคืนเนื่องจากเกิดปัญหากับสินค้า
    Choose file upload    A02.jpg
    Click request refund button on account refund page
    Click confirm action
    Check Text    ${element_box_view_refund}    - คุณได้ทำการแจ้งขอเงินคืน กรุณารอร้านค้าตรวจสอบและดำเนินการ
    Go to store order detail    ${storename_slug_wemall}    ${order_id}
    Click Element    ${refund_second}
    Click accept refund button
    Check Element Visible    ${accept_refund_modal}    ${expect_load_time}
    Input password accept request refund    ${pass_login_trust_wemall}
    Click confirm accept refund button
    Click ok button on confirm accept modal
    Check Element Visible    ${go_to_detail_button}    ${expect_load_time}
    Go to account order detail page    ${order_id}
    Check status order on account detail page    รอการแจ้งจัดส่งสินค้า
    Check Text    ${text_request_refund_order_detail}    คุณได้ทำการขอเงินคืน
    Check item status in product order detail table    ${refund_item_status_order_detail_product1}    ร้านค้าปฏิเสธการขอเงินคืน
    Check countdown decline time text on account detail page    ${element_item_countdown_time_order_detail_product1}
    Check item status in product order detail table    ${refund_item_status_order_detail_product2}    ร้านค้ายอมรับการขอเงินคืน

TC_MC_04935
    [Documentation]     Check status in case seller decline refund and accept refund on buyer order detail page
    [Tags]    Regression    Medium    Account-Web
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Create order credit card channel    ${storename_slug_wemall}    trustmall 004    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Store Order History    ${storename_slug_wemall}
    Search order id on store order history    ${order_id}
    Click search button on account order history
    Check Element Visible    ${request_tracking_button}    ${expect_load_time}
    Click Element    ${request_tracking_button}
    Click Button    ${btn_shipping_custom}
    Input Text    ${input_tracking_custom}    EX123456789TH
    Input Text    ${input_url_custom}    https://www.google.co.th
    ${file_path}    Get file path
    Choose File    ${input_custom_file}    ${file_path}/A02.jpg
    Click Button    ${confirm_custom_button}
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
    Go to account order detail page    ${order_id}
    Check status order on account detail page    กำลังจัดส่งสินค้า
    Check Text    ${text_request_refund_order_detail}    คุณได้ทำการขอเงินคืน

TC_MC_04937
    [Documentation]    WLSAccount Check text bubble in case waiting payment
    [Tags]    Low    Account-Web
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Create order offline channel    ${storename_slug_wemall}    ${trustmall_product1_name}    ${select_address}    ${shipping_post}    ${cs_channel_radio_button}    ${lbl_payment_offline_ref2_number}
    Go to account order detail page    ${order_id}
    Element Should Contain    ${account_detail_bubble_box_content_step_1}    คุณยังไม่ได้ทำการชำระเงินของรายการสั่งซื้อนี้ กรุณาชำระเงิน ตามช่องทางที่คุณได้เลือกไว้ภายใน 3 วันหลังจากวันที่คุณได้ทำรายการสั่งซื้อ
    Check countdown time bubble on account history page    ${account_detail_bubble_countdown_time}

TC_MC_04938
    [Documentation]    WMAccount Check text bubble in case expired payment
    [Tags]    Low    Account-Web
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Create order offline channel    ${storename_slug_wemall}    ${trustmall_product1_name}    ${select_address}    ${shipping_post}    ${cs_channel_radio_button}    ${lbl_payment_offline_ref2_number}
    Login admin manage order web
    Go To    ${URL_ORDER}/admin/manage/datetime
    Search order id on manage datetime page    ${order_id}
    API Order Manage Datetime    payment_expired_time    เพิ่ม-ลด    -4    day
    Run cron order expire on admin manage order web    ${order_id}
    Go to account order detail page    ${order_id}
    Element Should Contain    ${account_detail_bubble_box_content_step_1}    รายการสั่งซื้อนี้ถูกยกเลิกเนื่องจากคุณไม่ได้ชำระเงินภายในระยะเวลาที่กำหนด

TC_MC_04939
    [Documentation]    WMAccount Check text bubble in case payment failed
    [Tags]    Low    Account-Web
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Create order ewallet channel    ${storename_slug_wemall}    trustmall 004    ${select_address}    ${shipping_post}    ${ew_channel_radio_button}
    Go to account order detail page    ${order_id}
    Element Should Contain    ${account_detail_bubble_box_content_step_1}    รายการสั่งซื้อนี้ถูกยกเลิกเนื่องจากการชำระเงินของคุณไม่สำเร็จ หากคุณต้องการซื้อสินค้า กรุณาทำรายการอีกครั้ง

TC_MC_04940
    [Documentation]    WMAccount Check text bubble in case waiting ship and don't timeout
    [Tags]    Low    Account-Web
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Create order credit card channel    ${storename_slug_wemall}    trustmall 004    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go to account order detail page    ${order_id}
    Element Should Contain    ${account_detail_bubble_box_content_step_2}    กรุณารอร้านค้าทำการแจ้งจัดส่งสินค้าภายในระยะเวลาที่กำหนด ในกรณีที่ร้านค้าไม่มีสินค้าจัดส่ง หรือหากต้องการยกเลิกการสั่งซื้อ สามารถกดขอเงินคืนได้
    Check countdown time bubble on account history page    ${account_detail_bubble_countdown_time}

TC_MC_04941
    [Documentation]    WMAccount Check text bubble in case waiting ship, but expired ship
    [Tags]    Low    Account-Web
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Create order credit card channel    ${storename_slug_wemall}    trustmall 004    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Login admin manage order web
    Go To    ${URL_ORDER}/admin/manage/datetime
    Search order id on manage datetime page    ${order_id}
    API Order Manage Escrow Datetime    1    escrow_products.ship_expired_time    addsub    -4    day    ${order_id}
    Go to account order detail page    ${order_id}
    Element Should Contain    ${account_detail_bubble_box_content_step_2}    กรุณารอร้านค้าทำการแจ้งจัดส่งสินค้าภายในระยะเวลาที่กำหนด ในกรณีที่ร้านค้าไม่มีสินค้าจัดส่ง หรือหากต้องการยกเลิกการสั่งซื้อ สามารถกดขอเงินคืนได้
    Element Should Contain    ${account_detail_bubble_countdown_time}    หมดเวลา

TC_MC_04942
    [Documentation]    WMAccount Check text bubble in case shipping
    [Tags]    Low    Account-Web
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Create order credit card channel    ${storename_slug_wemall}    trustmall 004    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Store Order Detail Page    ${storename_slug_wemall}    ${order_id}
    Shipping One Product Custom By Product Name    EX123456789TH    https://www.google.co.th    https://store.wls-dev.co.th    A02.jpg    ${trustmall_product1_name}
    Go to account order detail page    ${order_id}
    Element Should Contain    ${account_detail_bubble_box_content_step_3}    ร้านค้าได้ทำการจัดส่งสินค้าแล้ว คุณสามารถเข้าไปตรวจสอบสถานะการจัดส่งเพื่อดูรายละเอียด หากคุณไม่ได้รับสินค้าตามที่สั่งซื้อภายในระยะเวลาที่กำหนด กรุณา ติดต่อร้านค้า เพื่อสอบถามรายละเอียด
    Element Should Contain    ${account_detail_bubble_refund_text}    กำลังจัดส่งสินค้า

TC_MC_04943
    [Documentation]    WMAccount Check text bubble in case already receive
    [Tags]    Low    Account-Web
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Create order credit card channel    ${storename_slug_wemall}    trustmall 004    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Store Order Detail Page    ${storename_slug_wemall}    ${order_id}
    Shipping One Product Custom By Product Name    EX123456789TH    https://www.google.co.th    https://store.wls-dev.co.th    A02.jpg    ${trustmall_product1_name}
    Login admin manage order web
    Go To    ${URL_ORDER}/admin/manage/datetime
    Search order id on manage datetime page    ${order_id}
    API Order Manage Escrow Datetime    1    escrow_products.receive_expired_time    addsub    -30    day    ${order_id}
    Set Auto Receive With API    ${order_id}
    Go to account order detail page    ${order_id}
    Element Should Not Be Visible    ${account_detail_bubble_box_content_step_1}
    Element Should Not Be Visible    ${account_detail_bubble_box_content_step_2}
    Element Should Not Be Visible    ${account_detail_bubble_box_content_step_3}
    Element Should Not Be Visible    ${account_detail_bubble_box_content_step_4}
    Check Element Visible    ${step1_complete}    ${expect_load_time}
    Check Element Visible    ${step2_complete}    ${expect_load_time}
    Check Element Visible    ${step3_complete}    ${expect_load_time}
    Check Element Visible    ${step4_complete}    ${expect_load_time}

TC_MC_04944
    [Documentation]    WMAccount Check text bubble in case request refund
    [Tags]    Low    Account-Web
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Create order credit card channel    ${storename_slug_wemall}    trustmall 004    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Store Order Detail Page    ${storename_slug_wemall}    ${order_id}
    Shipping One Product Custom By Product Name    EX123456789TH    https://www.google.co.th    https://store.wls-dev.co.th    A02.jpg    ${trustmall_product1_name}
    Go to account order detail page    ${order_id}
    Click Element    ${account_detail_refund_link}
    Select checkbox all product for refund
    Select reason refund on account refund page    ร้านค้าแจ้งว่าไม่มีสินค้า / สินค้าหมด
    Input description refund to shop    ขอเงินคืนเนื่องจากเกิดปัญหากับสินค้า
    Choose file upload    A02.jpg
    Click request refund button on account refund page
    Click confirm action
    Go to account order detail page    ${order_id}
    Element Should Contain    ${account_detail_bubble_box_content_step_3}    คุณได้ทำการขอเงินคืน กรุณารอร้านค้าตรวจสอบและดำเนินการ

TC_MC_04945
    [Documentation]    WMAccount Check text bubble in case accept refund payment by online channel
    [Tags]    Low    Account-Web
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Create order credit card channel    ${storename_slug_wemall}    trustmall 004    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Store Order Detail Page    ${storename_slug_wemall}    ${order_id}
    Shipping One Product Custom By Product Name    EX123456789TH    https://www.google.co.th    https://store.wls-dev.co.th    A02.jpg    ${trustmall_product1_name}
    Go to account order detail page    ${order_id}
    Click Element    ${account_detail_refund_link}
    Select checkbox all product for refund
    Select reason refund on account refund page    ร้านค้าแจ้งว่าไม่มีสินค้า / สินค้าหมด
    Input description refund to shop    ขอเงินคืนเนื่องจากเกิดปัญหากับสินค้า
    Choose file upload    A02.jpg
    Click request refund button on account refund page
    Click confirm action
    Go to store order detail    ${storename_slug_wemall}    ${order_id}
    Click Element    ${view_detail_store_order_detail}
    Click accept refund button
    Check Element Visible    ${accept_refund_modal}    ${expect_load_time}
    Input password accept request refund    ${pass_login_trust_wemall}
    Click confirm accept refund button
    Click ok button on confirm accept modal
    Check Element Visible    ${go_to_detail_button}    ${expect_load_time}
    Go to account order detail page    ${order_id}
    Element Should Contain    ${account_detail_bubble_box_content_step_3}    ร้านค้าได้ทำการยอมรับการขอเงินคืนของคุณแล้ว คุณจะได้รับเงินคืนตามช่องทางที่คุณชำระเงินมา โดยระยะเวลาการได้รับเงินคืนจะขึ้นอยู่กับระบบและนโยบายของสถาบันการเงินที่ออกบัตรเครดิต/เดบิตของคุณ\n- ชำระด้วยบัตรเครดิต จะได้รับเงินคืนภายใน 14 วันทำการ\n- ชำระด้วยบัตรเดบิต จะได้รับเงินคืนภายใน 45-60 วันทำการ
    Element Should Contain    ${account_detail_bubble_refund_text}    ร้านค้ายอมรับการขอเงินคืน

TC_MC_04947
    [Documentation]    WMAccount Check text bubble in case decline refund
    [Tags]    Low    Account-Web
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Create order credit card channel    ${storename_slug_wemall}    trustmall 004    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Store Order Detail Page    ${storename_slug_wemall}    ${order_id}
    Shipping One Product Custom By Product Name    EX123456789TH    https://www.google.co.th    https://store.wls-dev.co.th    A02.jpg    ${trustmall_product1_name}
    Go to account order detail page    ${order_id}
    Click Element    ${account_detail_refund_link}
    Select checkbox all product for refund
    Select reason refund on account refund page    ร้านค้าแจ้งว่าไม่มีสินค้า / สินค้าหมด
    Input description refund to shop    ขอเงินคืนเนื่องจากเกิดปัญหากับสินค้า
    Choose file upload    A02.jpg
    Click request refund button on account refund page
    Click confirm action
    Go to store order detail    ${storename_slug_wemall}    ${order_id}
    Click Element    ${view_detail_store_order_detail}
    Click decline refund button
    Check Element Visible    ${decline_refund_modal}    ${expect_load_time}
    Input description decline to buyer    ขออภัยสินค้าสินค้าหมดจะทำการจัดส่งภายใน 3-7 วัน
    Choose file for decline refund
    Click confirm decline refund button
    Click ok button on confirm decline modal
    Go to account order detail page    ${order_id}
    Element Should Contain    ${account_detail_bubble_box_content_step_3}    ร้านค้าได้ปฏิเสธการขอเงินคืนของคุณ คุณสามารถทำการ ขอเงินคืนใหม่ หรือ ยกเลิกการขอเงินคืนนี้ ภายในระยะเวลาที่กำหนด มิฉะนั้นจะถือว่าคุณได้ยอมรับการปฏิเสธการขอเงินคืนและรายการสั่งซื้อนี้จะดำเนินการต่อไปตามปกติ
    Element Should Contain    ${account_detail_bubble_refund_text}    อยู่ในระหว่างการขอเงินคืน

TC_MC_04949
    [Documentation]    WMAccount Check text bubble in case waiting ship (Place order 2 product, Request refund 1 product and accept refund)
    [Tags]    Low    Account-Web
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Create order credit card channel    ${storename_slug_wemall}    trustmall 004    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go to account order detail page    ${order_id}
    Click Element    ${account_detail_refund_link}
    Select reason refund on account refund page    ร้านค้าแจ้งว่าไม่มีสินค้า / สินค้าหมด
    Select checkbox product for refund by product name    trustmall 004
    Input description refund to shop    ขอเงินคืนเนื่องจากเกิดปัญหากับสินค้า
    Choose file upload    A02.jpg
    Click request refund button on account refund page
    Click confirm action
    Go to store order detail    ${storename_slug_wemall}    ${order_id}
    Click Element    ${view_detail_store_order_detail}
    Click accept refund button
    Check Element Visible    ${accept_refund_modal}    ${expect_load_time}
    Input password accept request refund    ${pass_login_trust_wemall}
    Click confirm accept refund button
    Click ok button on confirm accept modal
    Check Element Visible    ${go_to_detail_button}    ${expect_load_time}
    Go to account order detail page    ${order_id}
    Element Should Contain    ${account_detail_bubble_box_content_step_2}    กรุณารอร้านค้าทำการแจ้งจัดส่งสินค้าภายในระยะเวลาที่กำหนด ในกรณีที่ร้านค้าไม่มีสินค้าจัดส่ง หรือหากต้องการยกเลิกการสั่งซื้อ สามารถกดขอเงินคืนได้
    Check countdown time bubble on account history page    ${account_detail_bubble_countdown_time}

TC_MC_04950
    [Documentation]    WMAccount Check text bubble in case waiting ship (Place order 2 product, Request refund 1 product and decline refund)
    [Tags]    Low    Account-Web
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Create order credit card channel    ${storename_slug_wemall}    trustmall 004    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go to account order detail page    ${order_id}
    Click Element    ${account_detail_refund_link}
    Select reason refund on account refund page    ร้านค้าแจ้งว่าไม่มีสินค้า / สินค้าหมด
    Select checkbox product for refund by product name    trustmall 004
    Input description refund to shop    ขอเงินคืนเนื่องจากเกิดปัญหากับสินค้า
    Choose file upload    A02.jpg
    Click request refund button on account refund page
    Click confirm action
    Go to store order detail    ${storename_slug_wemall}    ${order_id}
    Click Element    ${view_detail_store_order_detail}
    Click decline refund button
    Check Element Visible    ${decline_refund_modal}    ${expect_load_time}
    Input description decline to buyer    ขออภัยสินค้าสินค้าหมดจะทำการจัดส่งภายใน 3-7 วัน
    Choose file for decline refund
    Click confirm decline refund button
    Click ok button on confirm decline modal
    Go to account order detail page    ${order_id}
    Element Should Contain    ${account_detail_bubble_box_content_step_2}    ร้านค้าได้ปฏิเสธการขอเงินคืนของคุณ คุณสามารถทำการ ขอเงินคืนใหม่ หรือ ยกเลิกการขอเงินคืนนี้ ภายในระยะเวลาที่กำหนด มิฉะนั้นจะถือว่าคุณได้ยอมรับการปฏิเสธการขอเงินคืนและรายการสั่งซื้อนี้จะดำเนินการต่อไปตามปกติ\nกรุณารอร้านค้าทำการแจ้งจัดส่งสินค้าภายในระยะเวลาที่กำหนด ในกรณีที่ร้านค้าไม่มีสินค้าจัดส่ง หรือหากต้องการยกเลิกการสั่งซื้อ สามารถกดขอเงินคืนได้
    Element Should Contain    ${account_detail_bubble_refund_text}    อยู่ในระหว่างการขอเงินคืน

TC_MC_04955
    [Documentation]    WMAccount Check text bubble in case already shipped (Place order 2 product, Request refund 1 product and Decline refund)
    [Tags]    Low    Account-Web
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    ${products}    Create List    ${sanity1_product}    ${sanity2_product}
    ${data}    Create List    ${lbl_credit_card_number1}    ${lbl_credit_card_number2}    ${lbl_credit_card_number3}    ${lbl_credit_card_number4}    ${lbl_cardname}    ${lbl_month}    ${lbl_year}    ${lbl_cnv}
    Add To Cart Many Items    ${products}    ${slug_name_sanity}
    Place Order    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Input Data Of Credit Card    ${data}
    Click Confirm Checkout Button
    Get order id online from thankyou page
    Get substring order id online from thankyou page    ${order_id}
    Go to account order detail page    ${order_id}
    Click Element    ${account_detail_refund_link}
    Select reason refund on account refund page    ร้านค้าแจ้งว่าไม่มีสินค้า / สินค้าหมด
    Select checkbox product for refund by product name    ${sanity1_product}
    Input description refund to shop    ขอเงินคืนเนื่องจากเกิดปัญหากับสินค้า
    Choose file upload    A02.jpg
    Click request refund button on account refund page
    Click confirm action
    Go to store order detail    ${storename_slug_wemall}    ${order_id}
    Click Element    ${view_detail_store_order_detail}
    Click decline refund button
    Check Element Visible    ${decline_refund_modal}    ${expect_load_time}
    Input description decline to buyer    ขออภัยสินค้าสินค้าหมดจะทำการจัดส่งภายใน 3-7 วัน
    Choose file for decline refund
    Click confirm decline refund button
    Click ok button on confirm decline modal
    Go To Store Order Detail Page    ${storename_slug_wemall}    ${order_id}
    Shipping One Product Custom By Product Name    EX123456789TH    https://www.google.co.th    https://store.wls-dev.co.th    A02.jpg    ${sanity2_product}
    Go to account order detail page    ${order_id}
    Element Should Contain    ${account_detail_bubble_box_content_step_2}    ร้านค้าได้ปฏิเสธการขอเงินคืนของคุณ คุณสามารถทำการ ขอเงินคืนใหม่ หรือ ยกเลิกการขอเงินคืนนี้ ภายในระยะเวลาที่กำหนด มิฉะนั้นจะถือว่าคุณได้ยอมรับการปฏิเสธการขอเงินคืนและรายการสั่งซื้อนี้จะดำเนินการต่อไปตามปกติ\nกรุณารอร้านค้าทำการแจ้งจัดส่งสินค้าภายในระยะเวลาที่กำหนด ในกรณีที่ร้านค้าไม่มีสินค้าจัดส่ง หรือหากต้องการยกเลิกการสั่งซื้อ สามารถกดขอเงินคืนได้
    Element Should Contain    ${account_detail_bubble_refund_text}    อยู่ในระหว่างการขอเงินคืน

TC_MC_05451
    [Documentation]     Check item status in case place order 2 product and refund 1 product non ship
    [Tags]    Regression    High    Account-Web
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    ${products}    Create List    ${sanity1_product}    ${sanity2_product}
    ${data}    Create List    ${lbl_credit_card_number1}    ${lbl_credit_card_number2}    ${lbl_credit_card_number3}    ${lbl_credit_card_number4}    ${lbl_cardname}    ${lbl_month}    ${lbl_year}    ${lbl_cnv}
    Add To Cart Many Items    ${products}    ${slug_name_sanity}
    Place Order    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Input Data Of Credit Card    ${data}
    Click Confirm Checkout Button
    Get order id online from thankyou page
    Get substring order id online from thankyou page    ${order_id}
    Go To Store Order History    ${storename_slug_wemall}
    Search order id on store order history    ${order_id}
    Click search button on account order history
    Check Element Visible    ${request_tracking_button}    ${expect_load_time}
    Click Element    ${request_tracking_button}
    Click check box for request tracking    ${sanity1_product}
    Click Button    ${btn_shipping_custom}
    Input Text    ${input_tracking_custom}    แจ้งจัดส่งโดย aden
    Input Text    ${input_url_custom}    https://store.wls-dev.com
    Input Text    ${input_url_custom_2}    https://store.wls-dev.co.th
    ${file_path}    Get file path
    Choose File    ${input_custom_file}    ${file_path}/A02.jpg
    Click Button    ${confirm_custom_button}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click search button on account order history
    Click refund link on account order history
    Select checkbox product for refund by product name    ${sanity1_product}
    Select reason refund on account refund page    ร้านค้าแจ้งว่าไม่มีสินค้า / สินค้าหมด
    Input description refund to shop    ขอเงินคืนเนื่องจากเกิดปัญหากับสินค้า
    Choose file upload    A02.jpg
    Click request refund button on account refund page
    Click confirm action
    Element Should Contain    ${element_box_view_refund}    - คุณได้ทำการแจ้งขอเงินคืน กรุณารอร้านค้าตรวจสอบและดำเนินการ
    Go to account order detail page    ${order_id}
    Check status order on account detail page    รอการแจ้งจัดส่งสินค้า
    Check Text    ${text_ship_by_item}    (จัดส่งไปแล้ว 1 จาก 2 รายการ)
    Check Text    ${text_request_refund_order_detail}    คุณได้ทำการขอเงินคืน
    Check Text    ${account_detail_refund_link}    ขอเงินคืน

TC_MC_05452
    [Documentation]    Check item status in case place order 1 product and ship expired
    [Tags]    Regression    High    Account-Web
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Create order credit card channel    ${storename_slug_wemall}    trustmall 004    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Login admin manage order web
    Go To    ${URL_ORDER}/admin/manage/datetime
    Search order id on manage datetime page    ${order_id_sub}
    Click ELement   ${select_escrow_product1}
    Select From List    escrow-fields    ship_expired_time
    Select From List    escrow-type    เพิ่ม-ลด
    Input Text    ${escrow_time}    -7
    Select From List    escrow-unit    Day
    Click Element    ${escrow_btn_update}
    Go to account order detail page    ${order_id}
    Check status order on account detail page    รอการแจ้งจัดส่งสินค้า
    Check Text    ${account_detail_expired_ship}    ร้านค้าไม่ได้แจ้งจัดส่งสินค้าภายในเวลาที่กำหนด
    Check Text    ${account_detail_refund_link}    ขอเงินคืน

TC_MC_05455
    [Documentation]    Check item status in case place order 2 product, ship and partial refund
    [Tags]    Regression    Medium    Account-Web
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    ${products}    Create List    ${sanity1_product}    ${sanity2_product}
    ${data}    Create List    ${lbl_credit_card_number1}    ${lbl_credit_card_number2}    ${lbl_credit_card_number3}    ${lbl_credit_card_number4}    ${lbl_cardname}    ${lbl_month}    ${lbl_year}    ${lbl_cnv}
    Add To Cart Many Items    ${products}    ${slug_name_sanity}
    Place Order    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Input Data Of Credit Card    ${data}
    Click Confirm Checkout Button
    Get order id online from thankyou page
    Get substring order id online from thankyou page    ${order_id}
    Go To Store Order History    ${storename_slug_wemall}
    Search order id on store order history    ${order_id}
    Click search button on account order history
    Check Element Visible    ${request_tracking_button}    ${expect_load_time}
    Click Element    ${request_tracking_button}
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
    Click refund link on account order history
    Select checkbox product for refund by product name    ${sanity1_product}
    Select reason refund on account refund page    ร้านค้าแจ้งว่าไม่มีสินค้า / สินค้าหมด
    Input description refund to shop    ขอเงินคืนเนื่องจากเกิดปัญหากับสินค้า
    Choose file upload    A02.jpg
    Click request refund button on account refund page
    Click confirm action
    Element Should Contain    ${element_box_view_refund}    - คุณได้ทำการแจ้งขอเงินคืน กรุณารอร้านค้าตรวจสอบและดำเนินการ
    Go to account order detail page    ${order_id}
    Check status order on account detail page    กำลังจัดส่งสินค้า
    Check Text    ${text_request_refund_order_detail}    คุณได้ทำการขอเงินคืน
    Check Text    ${account_detail_refund_link}    ขอเงินคืน

TC_MC_05456
    [Documentation]    Check item status in case place order 1 product, non ship, ship expired and full refund
    [Tags]    Regression    Medium    Account-Web
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Create order credit card channel    ${storename_slug_wemall}    trustmall 004    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Login admin manage order web
    Go To    ${URL_ORDER}/admin/manage/datetime
    Search order id on manage datetime page    ${order_id_sub}
    Click ELement   ${select_escrow_product1}
    Select From List    escrow-fields    ship_expired_time
    Select From List    escrow-type    เพิ่ม-ลด
    Input Text    ${escrow_time}    -7
    Select From List    escrow-unit    Day
    Click Element    ${escrow_btn_update}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click search button on account order history
    Click refund link on account order history
    Select checkbox product for refund by product name    trustmall 004
    Select reason refund on account refund page    ร้านค้าแจ้งว่าไม่มีสินค้า / สินค้าหมด
    Input description refund to shop    ขอเงินคืนเนื่องจากเกิดปัญหากับสินค้า
    Choose file upload    A02.jpg
    Click request refund button on account refund page
    Click confirm action
    Element Should Contain    ${element_box_view_refund}    - คุณได้ทำการแจ้งขอเงินคืน กรุณารอร้านค้าตรวจสอบและดำเนินการ
    Go to account order detail page    ${order_id}
    Check status order on account detail page    รอการแจ้งจัดส่งสินค้า
    Check Text    ${text_request_refund_order_detail}    คุณได้ทำการขอเงินคืน

TC_MC_05457
    [Documentation]    Check item status in case place order 2 product, non ship, ship expired and partial refund
    [Tags]    Regression    Medium    Account-Web
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    ${products}    Create List    ${sanity1_product}    ${sanity2_product}
    ${data}    Create List    ${lbl_credit_card_number1}    ${lbl_credit_card_number2}    ${lbl_credit_card_number3}    ${lbl_credit_card_number4}    ${lbl_cardname}    ${lbl_month}    ${lbl_year}    ${lbl_cnv}
    Add To Cart Many Items    ${products}    ${slug_name_sanity}
    Place Order    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Input Data Of Credit Card    ${data}
    Click Confirm Checkout Button
    Get order id online from thankyou page
    Get substring order id online from thankyou page    ${order_id}
    Login admin manage order web
    Go To    ${URL_ORDER}/admin/manage/datetime
    Search order id on manage datetime page    ${order_id_sub}
    API Order Manage Escrow Datetime    2    escrow_products.ship_expired_time    addsub    -7    day    ${order_id}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click search button on account order history
    Click refund link on account order history
    Select checkbox product for refund by product name    ${sanity1_product}
    Select reason refund on account refund page    ร้านค้าแจ้งว่าไม่มีสินค้า / สินค้าหมด
    Input description refund to shop    ขอเงินคืนเนื่องจากเกิดปัญหากับสินค้า
    Choose file upload    A02.jpg
    Click request refund button on account refund page
    Click confirm action
    Element Should Contain    ${element_box_view_refund}    - คุณได้ทำการแจ้งขอเงินคืน กรุณารอร้านค้าตรวจสอบและดำเนินการ
    Go to account order detail page    ${order_id}
    Check status order on account detail page    รอการแจ้งจัดส่งสินค้า
    Check Text    ${account_detail_expired_ship}    ร้านค้าไม่ได้แจ้งจัดส่งสินค้าภายในเวลาที่กำหนด
    Check Text    ${text_request_refund_order_detail}    คุณได้ทำการขอเงินคืน
    Check Text    ${account_detail_refund_link}    ขอเงินคืน

TC_MC_05461
    [Documentation]    Check item status in case place order 2 product, partial ship, partial refund non ship, refund full (remaining)
    [Tags]    Regression    Medium    Account-Web
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    ${products}    Create List    ${sanity1_product}    ${sanity2_product}
    ${data}    Create List    ${lbl_credit_card_number1}    ${lbl_credit_card_number2}    ${lbl_credit_card_number3}    ${lbl_credit_card_number4}    ${lbl_cardname}    ${lbl_month}    ${lbl_year}    ${lbl_cnv}
    Add To Cart Many Items    ${products}    ${slug_name_sanity}
    Place Order    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Input Data Of Credit Card    ${data}
    Click Confirm Checkout Button
    Get order id online from thankyou page
    Get substring order id online from thankyou page    ${order_id}
    Go To Store Order History    ${storename_slug_wemall}
    Search order id on store order history    ${order_id}
    Click search button on account order history
    Check Element Visible    ${request_tracking_button}    ${expect_load_time}
    Click Element    ${request_tracking_button}
    Click check box for request tracking    ${sanity2_product}
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
    Click refund link on account order history
    Select checkbox product for refund by product name    ${sanity2_product}
    Select reason refund on account refund page    ร้านค้าแจ้งว่าไม่มีสินค้า / สินค้าหมด
    Input description refund to shop    ขอเงินคืนเนื่องจากเกิดปัญหากับสินค้า
    Choose file upload    A02.jpg
    Click request refund button on account refund page
    Click confirm action
    Element Should Contain    ${element_box_view_refund}    - คุณได้ทำการแจ้งขอเงินคืน กรุณารอร้านค้าตรวจสอบและดำเนินการ
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click search button on account order history
    Click refund link on account order history
    Select checkbox product for refund by product name    ${sanity1_product}
    Select reason refund on account refund page    ร้านค้าแจ้งว่าไม่มีสินค้า / สินค้าหมด
    Input description refund to shop    ขอเงินคืนเนื่องจากเกิดปัญหากับสินค้า
    Choose file upload    A02.jpg
    Click request refund button on account refund page
    Click confirm action
    Element Should Contain    ${element_box_view_refund}    - คุณได้ทำการแจ้งขอเงินคืน กรุณารอร้านค้าตรวจสอบและดำเนินการ
    Go to account order detail page    ${order_id}
    Check status order on account detail page    รอการแจ้งจัดส่งสินค้า
    Check Text    ${text_ship_by_item}    (จัดส่งไปแล้ว 1 จาก 2 รายการ)
    Check Text    ${text_request_refund_order_detail}    คุณได้ทำการขอเงินคืน

TC_MC_10876
    [Documentation]    Verify the freebie product on checkout page when normal product have promotion freebie in the same shop on Order Detail page
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Go to account order detail page    ${freebie_orderid}
    Validate freebie product correctly displayed

TC_MC_10885
    [Documentation]    Verify the freebie product on Order Detail page when seller promotion product has promotion freebie
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Go to account order detail page    ${seller_promotion_freebie_orderid}
    Validate freebie product correctly displayed
    Promotion Tag Displays On Main Product Correctly
