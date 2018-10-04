*** Setting ***
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
Resource          ../../../../Keyword/Common/Account_Detail.txt
Resource          ../../../../Keyword/Common/Account_History.txt
Resource          ../../../../Keyword/Common/ManageOrder.txt
Resource          ../../../../Keyword/Common/Store_Detail.txt
Resource          ../../../../Keyword/Common/Store_History.txt
Resource          ../../../../Keyword/Common/Account_Refund.txt
Resource          ../../../../Keyword/Common/Account_Feedback.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/Checkout.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/AccountHistory.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/AccountDetail.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/AccountRefund.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/WMS_OrderTracking.txt

*** Test Cases ***
TC_MC_03785
    [Tags]    Regression    Medium    Account-Web
    [Documentation]    Check status in case partial ship (Place order 2 Partail ship 1) on buyer order detail page
    Create order two products    ${reconorder_slug}    ${normal_product1}    ${normal_product2}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go to store order history    ${reconorder_slug}
    Search order id on store order history    ${order_id}
    Seller partial ship    ${ems_tracking}    ${normal_product2}
    Go to account order detail page    ${order_id}
    Check status order on account detail page    รอการแจ้งจัดส่งสินค้า
    Check countdown ship time text on account detail page    ${element_countdown_time_order_detail}
    Check Text    ${text_ship_by_item}    (จัดส่งไปแล้ว 1 จาก 2 รายการ)
    Check Text    ${account_detail_refund_link}    ขอเงินคืน
    Check item status in product order detail table    ${lbl_item_status_product1_order_detail}    รอการแจ้งจัดส่งสินค้า
    Check item status in product order detail table    ${lbl_item_status_product2_order_detail}    รอยืนยันการรับสินค้าของคุณ
    Check Text    ${element_des_number_box_product_table}    ${ems_tracking}
    Check Text    ${element_link_check_ship}    ตรวจสอบสถานะการจัดส่ง

TC_MC_03786
    [Tags]    Regression    Medium    Account-Web
    [Documentation]    Check status in case refund full before ship (Place order 2 Refund 2) on buyer order detail page
    Create order two products    ${reconorder_slug}    ${normal_product1}    ${normal_product2}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select checkbox all product for refund
    Enter request refund data
    Go to account order detail page    ${order_id}
    Check status order on account detail page    รอการแจ้งจัดส่งสินค้า
    Check Text    ${text_request_refund_order_detail}    คุณได้ทำการขอเงินคืน
    Check item status in product order detail table    ${lbl_item_status_product1_order_detail}    คุณได้ทำการขอเงินคืน
    Check countdown refund time text on account detail page    ${element_item_countdown_time_order_detail}
    Check item status in product order detail table    ${lbl_item_status_product2_order_detail}    คุณได้ทำการขอเงินคืน
    Check countdown refund time text on account detail page    ${element_item_countdown_time_order_detail}

TC_MC_03787
    [Tags]    Regression    Medium    Account-Web
    [Documentation]    Check status in case refund after partail ship (Place order 2 Refund 1) on buyer order detail page
    Create order two products    ${reconorder_slug}    ${normal_product1}    ${normal_product2}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select Refund Product By Name    ${normal_product2}
    Enter request refund data
    Go to account order detail page    ${order_id}
    Check status order on account detail page    รอการแจ้งจัดส่งสินค้า
    Check Text    ${text_request_refund_order_detail}    คุณได้ทำการขอเงินคืน
    Check item status in product order detail table    ${lbl_item_status_product1_order_detail}     คุณได้ทำการขอเงินคืน
    Check countdown refund time text on account detail page    ${element_item_countdown_time_order_detail}
    Check item status in product order detail table    ${lbl_item_status_product2_order_detail}     รอการแจ้งจัดส่งสินค้า

TC_MC_03788
    [Tags]    Regression    Medium    Account-Web
    [Documentation]    Check status in case refund before ship (Place order 2 Ship 1 Refund 1) on buyer order detail page
    Create order two products    ${reconorder_slug}    ${normal_product1}    ${normal_product2}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go to store order history    ${reconorder_slug}
    Search order id on store order history    ${order_id}
    Seller partial ship    ${ems_tracking}    ${normal_product2}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select Refund Product By Name    ${normal_product2}
    Enter request refund data
    Go to account order detail page    ${order_id}
    Check status order on account detail page    รอการแจ้งจัดส่งสินค้า
    Check Text    ${text_ship_by_item}    (จัดส่งไปแล้ว 1 จาก 2 รายการ)
    Check Text    ${text_request_refund_order_detail}    คุณได้ทำการขอเงินคืน
    Check item status in product order detail table    ${lbl_item_status_product1_order_detail}    คุณได้ทำการขอเงินคืน
    Check countdown refund time text on account detail page    ${element_item_countdown_time_order_detail}
    Check item status in product order detail table    ${lbl_item_status_product2_order_detail}    รอยืนยันการรับสินค้าของคุณ
    Check Text    ${element_des_number_box_product_table}    ${ems_tracking}
    Check Text    ${element_link_check_ship}    ตรวจสอบสถานะการจัดส่ง

TC_MC_03789
    [Tags]    Regression    High    Account-Web
    [Documentation]    Check status in case accept refund full after paid on buyer order detail page
    Create order credit card channel    ${reconorder_slug}    ${normal_product1}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select checkbox all product for refund
    Enter request refund data
    Go To Store Order Detail Page    ${reconorder_slug}    ${order_id}
    Seller accept refund    ${password_reconorder}
    Go to account order detail page    ${order_id}
    Check status order on account detail page    ร้านค้ายอมรับการขอเงินคืน
    Check item status in product order detail table    ${lbl_item_status_order_detail}    ร้านค้ายอมรับการขอเงินคืน

TC_MC_03790
    [Tags]    Regression    High    Account-Web
    [Documentation]    Check status in case accept refund full after ship on buyer order detail page
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
    Seller accept refund    ${password_reconorder}
    Go to account order detail page    ${order_id}
    Check status order on account detail page    ร้านค้ายอมรับการขอเงินคืน
    Check item status in product order detail table    ${lbl_item_status_order_detail}    ร้านค้ายอมรับการขอเงินคืน

TC_MC_03791
    [Tags]    Regression    High    Account-Web
    [Documentation]    Check status in case seller decline refund on buyer order detail page
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
    Go to account order detail page    ${order_id}
    Check status order on account detail page    รอยืนยันการรับสินค้าของคุณ
    Check item status in product order detail table    ${lbl_item_status_product1_order_detail}    ร้านค้าปฏิเสธการขอเงินคืน
    Check countdown decline time text on account detail page    ${element_item_countdown_time_order_detail}

TC_MC_03792
    [Tags]    Regression    Medium    Account-Web
    [Documentation]    Check status in case seller decline refund and accept refund on buyer order detail page
    Create order two products    ${reconorder_slug}    ${normal_product1}    ${normal_product2}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select Refund Product By Name    ${normal_product2}
    Enter request refund data
    Go To Store Order Detail Page    ${reconorder_slug}    ${order_id}
    Seller decline refund
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select Refund Product By Name    ${normal_product1}
    Enter request refund data
    Go To Store Order Detail Page    ${reconorder_slug}    ${order_id}
    Seller accept refund    ${password_reconorder}
    Go to account order detail page    ${order_id}
    Check status order on account detail page    รอการแจ้งจัดส่งสินค้า
    Check countdown ship time text on account detail page    ${element_countdown_time_order_detail}
    Check Text    ${account_detail_refund_link}    ขอเงินคืน
    Check item status in product order detail table    ${lbl_item_status_product1_order_detail}    ร้านค้ายอมรับการขอเงินคืน
    Check item status in product order detail table    ${lbl_item_status_product2_order_detail}    รอการแจ้งจัดส่งสินค้า

TC_MC_04973
    [Tags]    Medium    Account-Web
    [Documentation]    WLSAccount Check text bubble in case waiting payment
    Create order offline channel    ${reconorder_slug}    ${normal_product1}    ${select_address}    ${shipping_post}    ${atm_channel_radio_button}    ${lbl_payment_offline_ref2_number}
    Go to account order detail page    ${order_id}
    Element Should Contain    ${account_detail_bubble_box_content_step_1}    คุณยังไม่ได้ทำการชำระเงินของรายการสั่งซื้อนี้ กรุณาชำระเงิน ตามช่องทางที่คุณได้เลือกไว้ภายใน 3 วันหลังจากวันที่คุณได้ทำรายการสั่งซื้อ
    Check countdown time bubble on account history page    ${account_detail_bubble_countdown_time}

TC_MC_04974
    [Tags]    High    Account-Web
    [Documentation]    WLSAccount Check text bubble in case expired payment
    Create order offline channel    ${reconorder_slug}    ${normal_product1}    ${select_address}    ${shipping_post}    ${atm_channel_radio_button}    ${lbl_payment_offline_ref2_number}
    Login admin manage order web
    API Order Manage Datetime    payment_expired_time    เพิ่ม-ลด    -4    day
    Run cron order expire on admin manage order web    ${order_id_sub}
    Go to account order detail page    ${order_id}
    Element Should Contain    ${account_detail_bubble_box_content_step_1}    รายการสั่งซื้อนี้ถูกยกเลิกเนื่องจากคุณไม่ได้ชำระเงินภายในระยะเวลาที่กำหนด

TC_MC_04975
    [Tags]    High    Account-Web
    [Documentation]    WLSAccount Check text bubble in case payment failed
    Create order ewallet channel    ${reconorder_slug}    ${normal_product1}    ${select_address}    ${shipping_post}    ${ew_channel_radio_button}
    Go to account order detail page    ${order_id}
    Element Should Contain    ${account_detail_bubble_box_content_step_1}    รายการสั่งซื้อนี้ถูกยกเลิกเนื่องจากการชำระเงินของคุณไม่สำเร็จ หากคุณต้องการซื้อสินค้า กรุณาทำรายการอีกครั้ง

TC_MC_04976
    [Tags]    High    Account-Web
    [Documentation]    WLSAccount Check text bubble in case waiting ship and don't timeout
    Create order credit card channel    ${reconorder_slug}    ${normal_product1}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go to account order detail page    ${order_id}
    Element Should Contain    ${account_detail_bubble_box_content_step_2}    กรุณารอร้านค้าทำการแจ้งจัดส่งสินค้าภายในระยะเวลาที่กำหนด ในกรณีที่ร้านค้าไม่มีสินค้าจัดส่ง หรือหากต้องการยกเลิกการสั่งซื้อ สามารถกดขอเงินคืนได้
    Check countdown time bubble on account history page    ${account_detail_bubble_countdown_time}

TC_MC_04977
    [Tags]    High    Account-Web
    [Documentation]    WLSAccount Check text bubble in case waiting ship, but expired ship
    Create order credit card channel    ${reconorder_slug}    ${normal_product1}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Login admin manage order web
    API Order Manage Escrow Datetime    1     ship_expired_time    เพิ่ม-ลด    -30    Day
    Go to account order detail page    ${order_id}
    Element Should Contain    ${account_detail_bubble_box_content_step_2}    กรุณารอร้านค้าทำการแจ้งจัดส่งสินค้าภายในระยะเวลาที่กำหนด ในกรณีที่ร้านค้าไม่มีสินค้าจัดส่ง หรือหากต้องการยกเลิกการสั่งซื้อ สามารถกดขอเงินคืนได้
    Element Should Contain    ${account_detail_bubble_countdown_time}    หมดเวลา

TC_MC_04978
    [Tags]    High    Account-Web
    [Documentation]    WLSAccount Check text bubble in case waiting receive
    Create order credit card channel    ${reconorder_slug}    ${normal_product1}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go to store order history    ${reconorder_slug}
    Search order id on store order history    ${order_id}
    Seller ship the order with tracking number    ${ems_tracking}
    Go to account order detail page    ${order_id}
    Element Should Contain    ${account_detail_bubble_box_content_step_3}    ร้านค้าได้ทำการจัดส่งสินค้าและรอการยืนยันรับสินค้าจากคุณ คุณสามารถตรวจสอบสถานะการจัดส่ง เพื่อดูรายละเอียด\n- หากคุณได้รับสินค้าและตรวจสอบความเรียบร้อยแล้ว กรุณากด ยืนยันรับสินค้า\n- หากคุณไม่ได้รับสินค้าตามที่สั่งซื้อภายในระยะเวลาที่กำหนด (สังเกตเวลาที่เหลืออยู่ในส่วนของยืนยันรับสินค้า) กรุณาติตต่อร้านค้าเพื่อสอบถามรายละเอียด\nหรือทำการ ขอเงินคืน ก่อนที่เวลายืนยันรับสินค้าจะหมด มิฉะนั้นจะถือว่าคุณได้ยืนยันรับสินค้าแล้ว
    Check countdown time bubble on account history page    ${account_detail_bubble_countdown_time}

TC_MC_04979
    [Tags]    High    Account-Web
    [Documentation]    WLSAccount Check text bubble in case already receive
    Create order credit card channel    ${reconorder_slug}    ${normal_product1}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go to store order history    ${reconorder_slug}
    Search order id on store order history    ${order_id}
    Seller ship the order with tracking number    ${ems_tracking}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    ${message}    Buyer receive the order
    Run Keyword If    '${message}' == 'รายการไม่สำเร็จ กรุณาลองใหม่อีกครั้ง'    Fail    รายการไม่สำเร็จ กรุณาลองใหม่อีกครั้ง
    Go to account order detail page    ${order_id}
    Element Should Not Be Visible    ${account_detail_bubble_box_content_step_1}
    Element Should Not Be Visible    ${account_detail_bubble_box_content_step_2}
    Element Should Not Be Visible    ${account_detail_bubble_box_content_step_3}
    Element Should Not Be Visible    ${account_detail_bubble_box_content_step_4}
    Check Element Visible    ${step1_complete}    ${expect_load_time}
    Check Element Visible    ${step2_complete}    ${expect_load_time}
    Check Element Visible    ${step3_complete}    ${expect_load_time}
    Check Element Visible    ${step4_complete}    ${expect_load_time}

TC_MC_04980
    [Tags]    High    Account-Web
    [Documentation]    WLSAccount Check text bubble in case request refund
    Create order credit card channel    ${reconorder_slug}    ${normal_product1}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go to store order history    ${reconorder_slug}
    Search order id on store order history    ${order_id}
    Seller ship the order with tracking number    ${ems_tracking}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select checkbox all product for refund
    Enter request refund data
    Go to account order detail page    ${order_id}
    Element Should Contain    ${account_detail_bubble_box_content_step_3}    คุณได้ทำการขอเงินคืน กรุณารอร้านค้าตรวจสอบและดำเนินการภายในระยะเวลาที่กำหนด ถ้าร้านค้าไม่ได้ดำเนินการภายในระยะเวลาดังกล่าว ระบบจะถือว่าร้านค้ายอมรับการขอเงินคืน และจะดำเนินการคืนเงินให้แก่คุณ
    Element Should Contain    ${account_detail_bubble_refund_text}    อยู่ในระหว่างการขอเงินคืน

TC_MC_04981
    [Tags]    High    Account-Web
    [Documentation]    WLSAccount Check text bubble in case accept refund payment by online channel
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
    Seller accept refund    ${password_reconorder}
    Go to account order detail page    ${order_id}
    Element Should Contain    ${account_detail_bubble_box_content_step_3}    ร้านค้าได้ทำการยอมรับการขอเงินคืนของคุณแล้ว คุณจะได้รับเงินคืนตามช่องทางที่คุณชำระเงินมา โดยระยะเวลาการได้รับเงินคืนจะขึ้นอยู่กับระบบและนโยบายของสถาบันการเงินที่ออกบัตรเครดิต/เดบิตของคุณ\n- ชำระด้วยบัตรเครดิต จะได้รับเงินคืนภายใน 14 วันทำการ\n- ชำระด้วยบัตรเดบิต จะได้รับเงินคืนภายใน 45-60 วันทำการ
    Element Should Contain    ${account_detail_bubble_refund_text}    ร้านค้ายอมรับการขอเงินคืน

TC_MC_04982
    [Tags]    High    Account-Web
    [Documentation]    WLSAccount Check text bubble in case accept refund payment by offline channel
    Create order offline channel    ${reconorder_slug}    ${normal_product1}    ${select_address}    ${shipping_post}    ${atm_channel_radio_button}    ${lbl_payment_offline_ref2_number}
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
    Element Should Contain    ${account_detail_bubble_box_content_step_3}    ร้านค้าได้ทำการยอมรับการขอเงินคืนของคุณ โดยคุณจะได้รับเงินคืนกลับมาทางบัญชีธนาคาร ภายใน 7 วันทำการหลังจากที่เอกสารของคุณได้รับการอนุมัติ โดยคุณจะต้อง ส่งเอกสารและกรอกข้อมูลเพิ่มเติมเพื่อใช้ในการรับเงินคืน ดังนี้\nชื่อเจ้าของบัญชี\nธนาคาร\nเลขที่บัญชี\nสำเนาหน้าเลขที่บัญชีธนาคาร

TC_MC_04983
    [Tags]    High    Account-Web
    [Documentation]    WLSAccount Check text bubble in case decline refund
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
    Go to account order detail page    ${order_id}
    Element Should Contain    ${account_detail_bubble_box_content_step_3}    ร้านค้าได้ปฏิเสธการขอเงินคืนของคุณ คุณสามารถทำการ ขอเงินคืนใหม่ หรือ ยกเลิกการขอเงินคืนนี้ ภายในระยะเวลาที่กำหนด มิฉะนั้นจะถือว่าคุณได้ยอมรับการปฏิเสธการขอเงินคืนและรายการสั่งซื้อนี้จะดำเนินการต่อไปตามปกติ

TC_MC_04985
    [Tags]    High    Account-Web
    [Documentation]    WLSAccount Check text bubble in case waiting ship (Place order 2 product, Request refund 1 product and accept refund)
    Create order two products    ${reconorder_slug}    ${normal_product1}    ${normal_product2}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select Refund Product By Name    ${normal_product2}
    Enter request refund data
    Go To Store Order Detail Page    ${reconorder_slug}    ${order_id}
    Seller accept refund    ${password_reconorder}
    Go to account order detail page    ${order_id}
    Element Should Contain    ${account_detail_bubble_box_content_step_2}    กรุณารอร้านค้าทำการแจ้งจัดส่งสินค้าภายในระยะเวลาที่กำหนด ในกรณีที่ร้านค้าไม่มีสินค้าจัดส่ง หรือหากต้องการยกเลิกการสั่งซื้อ สามารถกดขอเงินคืนได้
    Check countdown time bubble on account history page    ${account_detail_bubble_countdown_time}

TC_MC_04989
    [Tags]    High    Account-Web
    [Documentation]    WLSAccount Check text bubble in case already shipped (Place order 2 product, Request refund 1 product and decline refund)
    Create order two products    ${reconorder_slug}    ${normal_product1}    ${normal_product2}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go to store order history    ${reconorder_slug}
    Search order id on store order history    ${order_id}
    Seller partial ship    ${ems_tracking}    ${normal_product2}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select Refund Product By Name    ${normal_product2}
    Enter request refund data
    Go To Store Order Detail Page    ${reconorder_slug}    ${order_id}
    Seller decline refund
    Go to store order history    ${reconorder_slug}
    Search order id on store order history    ${order_id}
    Seller ship the order with tracking number    EX123456789TH
    Go to account order detail page    ${order_id}
    Element Should Contain    ${account_detail_bubble_box_content_step_3}    ร้านค้าได้ทำการจัดส่งสินค้าและรอการยืนยันรับสินค้าจากคุณ คุณสามารถตรวจสอบสถานะการจัดส่ง เพื่อดูรายละเอียด\n- หากคุณได้รับสินค้าและตรวจสอบความเรียบร้อยแล้ว กรุณากด ยืนยันรับสินค้า\n- หากคุณไม่ได้รับสินค้าตามที่สั่งซื้อภายในระยะเวลาที่กำหนด (สังเกตเวลาที่เหลืออยู่ในส่วนของยืนยันรับสินค้า) กรุณาติตต่อร้านค้าเพื่อสอบถามรายละเอียด\nหรือทำการ ขอเงินคืน ก่อนที่เวลายืนยันรับสินค้าจะหมด มิฉะนั้นจะถือว่าคุณได้ยืนยันรับสินค้าแล้ว