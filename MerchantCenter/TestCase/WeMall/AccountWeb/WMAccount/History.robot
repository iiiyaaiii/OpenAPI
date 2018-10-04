*** Setting ***
Suite Setup       Open Custom Browser    ${URL_PORTAL}    ${BROWSER}
Suite Teardown    Close All Browsers
Test Setup        Clear Active Login
Force Tags        Account-Web
Test Timeout      5 minutes
Library           SeleniumLibrary
Library           String
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Checkout.txt
Resource          ../../../../Keyword/Common/Account_History.txt
Resource          ../../../../Keyword/Common/ManageOrder.txt
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Resource/WeMall/WebElement/Account_History.txt
Resource          ../../../../Resource/Wemall/WebElement/Checkout.txt
Resource          ../../../../Resource/Wemall/WebElement/Cart.txt
Resource          ../../../../Keyword/Common/Store_History.txt
Resource          ../../../../Keyword/Common/Store_Detail.txt
Resource          ../../../../Keyword/Common/Freebie.txt

*** Variable ***
${freebie_orderid}    800011406692
${seller_promotion_freebie_orderid}    800011406693

*** Test Cases ***
TC_MC_04733
    [Tags]    Low    Account-Web
    [Documentation]    View input search in order history account page
    Set Selenium Speed    0.2
    Check and Reset Seller Login    qamcautomate001    ${user_non_data_wemall}    ${pass_non_data_wemall}
    Go To Account Order History
    Element Should Be Visible    //div[@class="box-search-col1"]//div[@class="form-group"]//label[1]    ชื่อสินค้า
    Element Should Be Enabled    //input[@name="product_name"]
    Element Should Be Visible    //div[@class="box-search-col2"]//div[@class="form-group"]//label    หมายเลขการสั่งซื้อ
    Element Should Be Enabled    //input[@name="order_no"]
    Element Should Be Visible    //div[@class="box-search-col3"]//div[@class="form-group"]//label    สถานะ
    Element Should Be Enabled    //select[@name="order_status"]
    Element Should Be Visible    //select[@name="order_status"]//option[@value="001"]    รอการชำระเงินของคุณ
    Element Should Be Visible    //select[@name="order_status"]//option[@value="002"]    ชำระเงินไม่สำเร็จ
    Element Should Be Visible    //select[@name="order_status"]//option[@value="100"]    รอการแจ้งจัดส่งสินค้า
    Element Should Be Visible    //select[@name="order_status"]//option[@value="200"]    รอยืนยันการรับสินค้าของคุณ
    Element Should Be Visible    //select[@name="order_status"]//option[@value="300"]    คุณได้รับสินค้าเรียบร้อยแล้ว
    Element Should Be Visible    //select[@name="order_status"]//option[@value="400"]    คุณได้ทำการขอเงินคืน
    Element Should Be Visible    //select[@name="order_status"]//option[@value="401"]    ร้านค้ายอมรับการขอเงินคืน
    Element Should Be Visible    //select[@name="order_status"]//option[@value="402"]    ร้านค้าปฏิเสธการขอเงินคืน
    Element Should Be Visible    //select[@name="order_status"]//option[@value="003"]    หมดเวลาการชำระเงิน
    Element Should Be Visible    //div[@class="box-search-col1"][1]//div[@class="form-group"]//label    ร้าน
    Element Should Be Enabled    //input[@id="store_name"]
    Element Should Be Visible    //div[@class="box-search-col2-max"]//div[@class="form-group"]//label    วันที่สั่งซื้อ
    ${status_date_picker}    Execute Javascript    return $('#id-date-range-picker-1').is(":enabled")
    Should Be True    '${status_date_picker}' == 'True'
    Element Should Be Enabled    //button[@type="submit"]


TC_MC_04735
    [Tags]    Regression    Medium    Account-Web
    [Documentation]    View order history account page in case data not found
    Set Selenium Speed    0.2
    Check and Reset Seller Login    ${slug_name_shop_no_data}    ${user_nodata}    ${password_nodata}
    Go To Account Order History
    Element Should Be Visible    //div[@class="totalandpage"]    รายการทั้งหมด : 0 รายการ
    Element Should Be Visible    //ul[@class="order-list"]//li//center    ไม่พบข้อมูล
    Element Should Be Visible    //div[@class="order-list-title"]//div[@class="box-order-items"]    รายการสินค้า
    Element Should Be Visible    //div[@class="order-list-title"]//div[@class="box-order-price"]    ราคาต่อหน่วย (บาท)
    Element Should Be Visible    //div[@class="order-list-title"]//div[@class="box-order-piece"]    จำนวน
    Element Should Be Visible    //div[@class="order-list-title"]//div[@class="box-order-status"]    สถานะ

TC_MC_04753
    [Documentation]    Check item status after place order
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Create order credit card channel    ${storename_slug_wemall}    trustmall 004    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click search button on account order history
    Check status order on account history page    รอการชำระเงินของคุณ
    Check countdown time text on account history page    ${countdown_time_text_on_account_history}

TC_MC_04754
    [Tags]    Regression    Medium    Account-Web
    [Documentation]    Check item status after expired payment
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Create order offline channel    ${storename_slug_wemall}    ${trustmall_product1_name}    ${select_address}    ${shipping_post}    ${cs_channel_radio_button}    ${lbl_payment_offline_ref2_number}
    Login admin manage order web
    Go To    ${URL_ORDER}/admin/manage/datetime
    Search order id on manage datetime page    ${order_id_sub}
    API Order Manage Datetime    payment_expired_time    เพิ่ม-ลด    -4    day
    Run cron order expire on admin manage order web    ${order_id_sub}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click search button on account order history
    Check status order on account history page    หมดเวลาการชำระเงิน

TC_MC_04755
    [Tags]    Regression    Medium    Account-Web
    [Documentation]    Check item status in case payment failed
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Create order ewallet channel    ${storename_slug_wemall}    trustmall 004    ${select_address}    ${shipping_post}    ${ew_channel_radio_button}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click search button on account order history
    Check status order on account history page    ชำระเงินไม่สำเร็จ

TC_MC_04756
    [Documentation]    Check item status after payment
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Create order credit card channel    ${storename_slug_wemall}    trustmall 004    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click search button on account order history
    Check status order on account history page    รอการแจ้งจัดส่งสินค้า
    Check countdown time text on account history page    ${countdown_time_text_on_account_history}
    Check request refund link on account history page

TC_MC_04757
    [Documentation]    Check item status after seller ship
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Create order credit card channel    ${storename_slug_wemall}    trustmall 004    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Store Order History    ${storename_slug_wemall}
    Search order id on store order history    ${order_id}
    Click search button on account order history
    Shipping One Product Custom By Product Name    EX123456789TH    https://store.wls-dev.com    https://store.wls-dev.co.th    A02.jpg    ${Vio_baseball_cap}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click search button on account order history
    Check status order on account history page    กำลังจัดส่งสินค้า

TC_MC_04758
    [Documentation]    Check item status after receive
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Create order credit card channel    ${storename_slug_wemall}    trustmall 004    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Store Order History    ${storename_slug_wemall}
    Search order id on store order history    ${order_id}
    Click search button on account order history
    Shipping One Product Custom By Product Name    EX123456789TH    https://store.wls-dev.com    https://store.wls-dev.co.th    A02.jpg    ${Vio_baseball_cap}
    Login admin manage order web
    API Order Manage Escrow Datetime    1     escrow_products.receive_expired_time    เพิ่ม-ลด    -10    Day
    Run cron auto receive on admin manage order web    ${order_id_sub}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click search button on account order history
    Check status order on account history page    คุณได้รับสินค้าเรียบร้อยแล้ว

TC_MC_04759
    [Tags]    Regression    Medium    Account-Web
    [Documentation]    Check status in case partial ship (Place order 2 Partail ship 1)
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
    Check status order on account history page    รอการแจ้งจัดส่งสินค้า
    Check countdown time text on account history page    ${element_countdowntime_account_history}
    Element Should Contain    ${account_history_refund_link_}    ขอเงินคืน
    Element Should Contain    ${text_ship_by_item_account_history}    (จัดส่งไปแล้ว 1 จาก 2 รายการ)

TC_MC_04760
    [Tags]    Regression    Medium    Account-Web
    [Documentation]    Check status in case refund full before ship (Place order 2 Refund 2)
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
    Element Should Contain    ${element_box_view_refund}    - คุณได้ทำการแจ้งขอเงินคืน กรุณารอร้านค้าตรวจสอบและดำเนินการภาย
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click search button on account order history
    Check status order on account history page    รอการแจ้งจัดส่งสินค้า
    Element Should Contain    ${text_refund_account_history}    คุณได้ทำการขอเงินคืน

TC_MC_04761
    [Tags]    Regression    Medium    Account-Web
    [Documentation]    Check status in case refund after partail ship (Place order 2 Ship 1 Refund 1)
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
    Input Text    ${input_tracking_custom}    จัดส่งด้วย aden
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
    Check status order on account history page    รอการแจ้งจัดส่งสินค้า
    Element Should Contain    ${text_ship_by_item_account_history}    (จัดส่งไปแล้ว 1 จาก 2 รายการ)
    Check Text    ${account_history_refund_link_}    ขอเงินคืน
    Element Should Contain    ${text_refund_account_history}    คุณได้ทำการขอเงินคืน

TC_MC_04763
    [Tags]    Regression    High    Account-Web
    [Documentation]    Check status in case accept refund full after paid
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
    Element Should Contain    ${element_box_view_refund}    - คุณได้ทำการแจ้งขอเงินคืน กรุณารอร้านค้าตรวจสอบและดำเนินการ
    Go to store order detail    ${storename_slug_wemall}    ${order_id}
    Click Element    ${view_detail_store_order_detail}
    Click accept refund button
    Check Element Visible    ${accept_refund_modal}    ${expect_load_time}
    Input password accept request refund    ${pass_login_trust_wemall}
    Click confirm accept refund button
    Click ok button on confirm accept modal
    Check Element Visible    ${go_to_detail_button}    ${expect_load_time}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click search button on account order history
    Check status order on account history page    ร้านค้ายอมรับการขอเงินคืน

TC_MC_04764
    [Tags]    Regression    High    Account-Web
    [Documentation]    Check status in case accept refund full after ship
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Create order credit card channel    ${storename_slug_wemall}    trustmall 004    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Store Order History    ${storename_slug_wemall}
    Search order id on store order history    ${order_id}
    Click search button on account order history
    Check Element Visible    ${request_tracking_button}    ${expect_load_time}
    Click Element    ${request_tracking_button}
    Click check box for request tracking    ${sanity2_product}
    Click Button    ${btn_shipping_custom}
    Input Text    ${input_tracking_custom}    จัดส่งด้วย aden
    Input Text    ${input_url_custom}    https://store.wls-dev.com
    Input Text    ${input_url_custom_2}    https://store.wls-dev.co.th
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
    Element Should Contain    ${element_box_view_refund}    - คุณได้ทำการแจ้งขอเงินคืน กรุณารอร้านค้าตรวจสอบและดำเนินการ
    Go to store order detail    ${storename_slug_wemall}    ${order_id}
    Click Element    ${view_detail_store_order_detail}
    Click accept refund button
    Check Element Visible    ${accept_refund_modal}    ${expect_load_time}
    Input password accept request refund    ${pass_login_trust_wemall}
    Click confirm accept refund button
    Click ok button on confirm accept modal
    Check Element Visible    ${go_to_detail_button}    ${expect_load_time}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click search button on account order history
    Check status order on account history page    ร้านค้ายอมรับการขอเงินคืน

TC_MC_04765
    [Tags]    Regression    High    Account-Web
    [Documentation]     Check status in case seller decline refund
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Create order credit card channel    ${storename_slug_wemall}    trustmall 004    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Store Order History    ${storename_slug_wemall}
    Search order id on store order history    ${order_id}
    Click search button on account order history
    Check Element Visible    ${request_tracking_button}    ${expect_load_time}
    Click Element    ${request_tracking_button}
    Click check box for request tracking    ${sanity1_product}
    Click Button    ${btn_shipping_custom}
    Input Text    ${input_tracking_custom}    จัดส่งด้วย aden
    Input Text    ${input_url_custom}    https://store.wls-dev.com
    Input Text    ${input_url_custom_2}    https://store.wls-dev.co.th
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
    Element Should Contain    ${element_box_view_refund}    - คุณได้ทำการแจ้งขอเงินคืน กรุณารอร้านค้าตรวจสอบและดำเนินการ
    Go to store order detail    ${storename_slug_wemall}    ${order_id}
    Click Element    ${view_detail_store_order_detail}
    Click decline refund button
    Check Element Visible    ${decline_refund_modal}    ${expect_load_time}
    Input description decline to buyer    ขออภัยสินค้าสินค้าหมดจะทำการจัดส่งภายใน 3-7 วัน
    Choose file for decline refund
    Click confirm decline refund button
    Click ok button on confirm decline modal
    Page Should Contain    - คุณได้ปฏิเสธการขอเงินคืนจากผู้ซื้อ กรุณารอผู้ซื้อตรวจสอบและดำเนินการภายในระยะเวลา
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click search button on account order history
    Check status order on account history page    กำลังจัดส่งสินค้า
    Element Should Contain    ${text_refund_account_history}    คุณได้ทำการขอเงินคืน

TC_MC_04766
    [Tags]    Regression    High    Account-Web
    [Documentation]     Check status in case place order 2 product 2 shop (Partial refund)
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
    Input Text    ${input_tracking_custom}    ngggyhghgh
    Input Text    ${input_url_custom}    https://store.wls-dev.com
    Input Text    ${input_url_custom_2}    https://store.wls-dev.co.th
    ${file_path}    Get file path
    Choose File    ${input_custom_file}    ${file_path}/A02.jpg
    Click Button    ${confirm_custom_button}
    Check and Reset Seller Login    ${storename_slug_wemall_trustment}    ${user_shop_trustment}    ${password_trustment}
    Go To    https://store.wemall-dev.com/trustment/admin/orders
    Search order id on store order history    ${order_id}
    Click search button on account order history
    Check Element Visible    ${request_tracking_button}    ${expect_load_time}
    Click Element    ${request_tracking_button}
    Click check box for request tracking    ${sanity2_product}
    Click Button    ${btn_shipping_custom}
    Input Text    ${input_tracking_custom}    EX123456789TH
    Input Text    ${input_url_custom}    https://store.wls-dev.com
    Input Text    ${input_url_custom_2}    https://store.wls-dev.co.th
    ${file_path}    Get file path
    Choose File    ${input_custom_file}    ${file_path}/A02.jpg
    Click Button    ${confirm_custom_button}
    Check and Reset Seller Login    ${storename_slug_wemall}    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
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
    Check status order on account history page    กำลังจัดส่งสินค้า
    Check Text    ${account_history_refund_link_}    ขอเงินคืน
    Check Text    ${text_refund_account_history}    คุณได้ทำการขอเงินคืน

TC_MC_04767
    [Tags]    Regression    High    Account-Web
    [Documentation]     Check status in case place order 2 product 2 shop (Full refund)
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
    Select checkbox product for refund by product name    ${sanity1_product}
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
    Check status order on account history page    รอการแจ้งจัดส่งสินค้า
    Check Text    ${text_refund_account_history}    คุณได้ทำการขอเงินคืน

TC_MC_04824
    [Tags]    Regression    High    Account-Web
    [Documentation]    Auto Receive
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
    Login admin manage order web
    Go To    ${URL_ORDER}/admin/manage/datetime
    Search order id on manage datetime page    ${order_id_sub}
    API Order Manage Escrow Datetime    1    escrow_products.receive_expired_time    addsub    -60    day    ${order_id_sub}
    Check Element Visible    ${escrow_btn_update}    ${expect_load_time}
    Go to    https://api-order.wls-dev.com/v3/auto/receive?order_id=${order_id_sub}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click search button on account order history
    Check status order on account history page    คุณได้รับสินค้าเรียบร้อยแล้ว

TC_MC_05437
    [Tags]    Regression    High    Account-Web
    [Documentation]     Check item status in case place order 2 product and refund 1 product non ship
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
    Input Text    ${input_tracking_custom}    ngggyhghgh
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
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click search button on account order history
    Check status order on account history page    รอการแจ้งจัดส่งสินค้า
    Check Text    ${text_refund_account_history}    คุณได้ทำการขอเงินคืน
    Element Should Contain    ${account_history_refund_link_}    ขอเงินคืน
    Element Should Contain    ${text_ship_by_item_account_history}    (จัดส่งไปแล้ว 1 จาก 2 รายการ)

TC_MC_05438
    [Tags]    Regression    High    Account-Web
    [Documentation]    Check item status in case place order 1 product and ship expired
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
    Check status order on account history page    รอการแจ้งจัดส่งสินค้า
    Check Text    ${account_history_expired_ship}    ร้านค้าไม่ได้แจ้งจัดส่งสินค้า\nภายในเวลาที่กำหนด
    Element Should Contain    ${account_history_refund_link_}    ขอเงินคืน

TC_MC_05441
    [Tags]    Regression    Medium    Account-Web
    [Documentation]     Check item status in case place order 2 product and refund 1 product non ship
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
    Go to store order history    ${storename_slug_wemall}
    Search order id on store order history    ${order_id}
    Click search button on account order history
    Check Element Visible    ${request_tracking_button}    ${expect_load_time}
    Click Element    ${request_tracking_button}
    Click Button    ${btn_shipping_custom}
    Input Text    ${input_tracking_custom}    ngggyhghgh
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
    Check status order on account history page    กำลังจัดส่งสินค้า
    Check Text    ${text_refund_account_history}    คุณได้ทำการขอเงินคืน
    Element Should Contain    ${account_history_refund_link_}    ขอเงินคืน

TC_MC_05442
    [Tags]    Regression    Medium    Account-Web
    [Documentation]    Check item status in case place order 1 product, non ship, ship expired and full refund
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
    Select checkbox product for refund by product name    ${Vio_baseball_cap}
    Select reason refund on account refund page    ร้านค้าแจ้งว่าไม่มีสินค้า / สินค้าหมด
    Input description refund to shop    ขอเงินคืนเนื่องจากเกิดปัญหากับสินค้า
    Choose file upload    A02.jpg
    Click request refund button on account refund page
    Click confirm action
    Element Should Contain    ${element_box_view_refund}    - คุณได้ทำการแจ้งขอเงินคืน กรุณารอร้านค้าตรวจสอบและดำเนินการ
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click search button on account order history
    Check status order on account history page    รอการแจ้งจัดส่งสินค้า
    Check Text    ${text_refund_account_history}    คุณได้ทำการขอเงินคืน

TC_MC_05443
    [Tags]    Regression    Medium    Account-Web
    [Documentation]    Check item status in case place order 2 product, non ship, ship expired and partial refund
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
    API Order Manage Escrow Datetime    2    escrow_products.ship_expired_time    addsub    -17    day    ${order_id_sub}
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
    Check status order on account history page    รอการแจ้งจัดส่งสินค้า
    Check Text    ${text_refund_account_history}    คุณได้ทำการขอเงินคืน
    Element Should Contain    ${account_history_refund_link_}    ขอเงินคืน

TC_MC_05447
    [Tags]    Regression    Medium    Account-Web
    [Documentation]    Check item status in case place order 2 product, non ship, ship expired and partial refund
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
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click search button on account order history
    Check status order on account history page    รอการแจ้งจัดส่งสินค้า
    Check Text    ${text_refund_account_history}    คุณได้ทำการขอเงินคืน
    Element Should Contain    ${text_ship_by_item_account_history}    (จัดส่งไปแล้ว 1 จาก 2 รายการ)

TC_MC_10865
    [Documentation]    Verify the freebie product on checkout page when normal product have promotion freebie in the same shop on Order History page
    [Tags]    Regression    Medium    Account-Web
    Set Selenium Speed    0.2
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Go To Account Order History
    Search order id on account order history    ${freebie_orderid}
    Click search button on account order history
    Validate freebie product correctly displayed

TC_MC_10874
    [Documentation]    Verify the freebie product on Order History page when seller promotion product has promotion freebie
    [Tags]    Regression    Medium    Account-Web
    Go to Login    ${user_login_trust_wemall}    ${pass_login_trust_wemall}
    Go To Account Order History
    Search order id on account order history    ${seller_promotion_freebie_orderid}
    Click search button on account order history
    Validate freebie product correctly displayed
    Promotion Tag Displays On Main Product Correctly
