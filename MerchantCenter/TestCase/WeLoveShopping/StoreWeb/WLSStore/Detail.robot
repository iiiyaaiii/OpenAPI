*** Setting ***
Suite Setup       Go to Login and Check Seller Login    ${URL_PORTAL}    ${BROWSER}    ${reconteststore_slug}    ${user_reconteststore}    ${password_reconteststore}
Suite Teardown    Close All Browsers
Force Tags        Store-Web    mc-wls
Library           SeleniumLibrary
Library           OperatingSystem
Library           String
Resource          ../../../../Resource/WeloveShopping/init.robot
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Checkout.txt
Resource          ../../../../Keyword/Common/ManageOrder.txt
Resource          ../../../../Keyword/Common/Account_History.txt
Resource          ../../../../Keyword/Common/Account_Detail.txt
Resource          ../../../../Keyword/Common/Store_Detail.txt
Resource          ../../../../Keyword/Common/Store_History.txt
Resource          ../../../../Keyword/Common/Account_Refund.txt
Resource          ../../../../Resource/WeloveShopping/WebElement/StoreDetail.txt
Resource          ../../../../Resource/WeloveShopping/WebElement/StoreHistory.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/Checkout.txt
Resource          ../../../../Resource/WeloveShopping/init.robot

*** Test Cases ***
TC_MC_04992
    [Tags]    Medium    Store-Web
    [Documentation]    Check text bubble in case waiting payment
    [Setup]    Create order offline channel    ${reconteststore_slug}    ${normal_product1_reconstore}    ${select_address}    ${shipping_post}    ${atm_channel_radio_button}    ${lbl_payment_offline_ref2_number}
    Go To Store Order Detail Page    ${reconteststore_slug}    ${order_id}
    ${content_countdown_bubble_top}=    Execute Javascript    return $('.step2 .content-bub .timeremaining').text().trim()
    Check countdown time text on top bubble store detail    ${content_countdown_bubble_top}
    ${content_bubble_bottom}=    Execute Javascript    return $('.bstep1').text().trim()
    Should Be Equal    ${content_bubble_bottom}    รายการสั่งซื้อสินค้านี้ผู้ซื้อยังไม่ได้ทำการชำระเงิน คุณยังไม่จำเป็นต้องจัดส่งสินค้า จนกว่าผู้ซื้อได้ทำการชำระเงินแล้วสถานะของรายการจะเปลี่ยนเป็น "รอการแจ้งจัดส่งสินค้า"

TC_MC_04993
    [Tags]    Medium    Store-Web
    [Documentation]    Check text bubble in case expired payment
    [Setup]    Create order offline channel    ${reconteststore_slug}    ${normal_product1_reconstore}    ${select_address}    ${shipping_post}    ${cs_channel_radio_button}    ${lbl_payment_cs_ref2_number}
    Login admin manage order web
    API Order Manage Datetime    payment_expired_time    เพิ่ม-ลด    -4    day
    Run cron order expire on admin manage order web    ${order_id_sub}
    Go To Store Order Detail Page    ${reconteststore_slug}    ${order_id}
    ${content_bubble_bottom}=    Execute Javascript    return $('.bstep1').text().trim()
    Should Contain    ${content_bubble_bottom}    รายการสั่งซื้อนี้ถูกยกเลิกเนื่องจากผู้ซื้อไม่ได้ชำระเงินภายในระยะเวลาที่กำหนด

TC_MC_04994
    [Tags]    Medium    Store-Web
    [Documentation]    Check text bubble in case payment failed
    [Setup]    Create order ewallet channel    ${reconteststore_slug}    ${normal_product1_reconstore}    ${select_address}    ${shipping_post}    ${ew_channel_radio_button}
    Go To Store Order Detail Page    ${reconteststore_slug}    ${order_id}
    ${content_bubble_bottom}=    Execute Javascript    return $('.bstep1').text().trim()
    Should Be Equal    ${content_bubble_bottom}    รายการสั่งซื้อนี้ถูกยกเลิกเนื่องจากการชำระเงินของผู้ซื้อไม่สำเร็จ

TC_MC_04995
    [Tags]    Medium    Store-Web
    [Documentation]    Check text bubble in case waiting ship
    [Setup]    Create order credit card channel    ${reconteststore_slug}    ${normal_product1_reconstore}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Store Order Detail Page    ${reconteststore_slug}    ${order_id}
    ${content_countdown_bubble_top}=    Execute Javascript    return $('.step3 .content-bub .timeremaining').text().trim()
    Check countdown time text on top bubble store detail    ${content_countdown_bubble_top}
    ${content_bubble_bottom}=    Execute Javascript    return $('.bstep2').text().trim()
    Should Contain    ${content_bubble_bottom}    กรุณาทำการแจ้งจัดส่งสินค้าภายในระยะเวลาตามที่คุณกำหนดไว้ (ผู้ซื้อสามารถทำการขอเงินคืนได้ หลังจากที่ผู้ซื้อชำระเงินเรียบร้อย)
    Should Contain    ${content_bubble_bottom}    - หากไม่สามารถทำการจัดส่งสินค้าได้ กรุณาแจ้งผู้ซื้อโดยเร็ว เพื่อให้ผู้ซื้อทำการขอเงินคืนในระบบ
    Should Contain    ${content_bubble_bottom}    - หากหมดระยะเวลาการจัดส่งแล้ว คุณยังคงสามารถแจ้งจัดส่งสินค้าได้
    Should Contain    ${content_bubble_bottom}    - หากผู้ซื้อทำการขอเงินคืน คุณจะไม่สามารถแจ้งจัดส่งสินค้าได้ จนกว่าคุณจะกดยกเลิกการขอเงินคืน และสถานะเป็น “รอการแจ้งจัดส่งสินค้า”
    Should Contain    ${content_bubble_bottom}    หมายเหตุ : คุณต้องทำการแจ้งจัดส่งในระบบเท่านั้น จึงถือว่าการแจ้งจัดส่งเรียบร้อย

TC_MC_04996
    [Tags]    Medium    Store-Web
    [Documentation]    Check text bubble in case waiting receive
    [Setup]    Create order credit card channel    ${reconteststore_slug}    ${normal_product1_reconstore}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Store Order History Page    ${reconteststore_slug}
    Search order id on store order history    ${order_id}
    Seller ship the order with tracking number    EX123456789TH
    Go To Store Order Detail Page    ${reconteststore_slug}    ${order_id}
    ${content_countdown_bubble_top}=    Execute Javascript    return $('.step4 .content-bub .timeremaining').text().trim()
    Check countdown time text on top bubble store detail    ${content_countdown_bubble_top}
    ${content_bubble_bottom}=    Execute Javascript    return $('.bstep3').text().trim()
    Should Contain    ${content_bubble_bottom}    คุณได้ทำการจัดส่งสินค้าแล้วและสามารถตรวจสอบสถานะการจัดส่งเพื่อดูรายละเอียด และคุณจะได้รับเงินค่าสินค้าเข้าบัญชีทรูมันนี่ของคุณหลังจาก
    Should Contain    ${content_bubble_bottom}    - ผู้ซื้อทำการยืนยันรับสินค้า
    Should Contain    ${content_bubble_bottom}    - เวลาในการยืนยันรับสินค้าหมดลง (สังเกตเวลาที่เหลืออยู่ในส่วนของยืนยันรับสินค้า)
    Should Contain    ${content_bubble_bottom}    หมายเหตุ : หากผู้ซื้อไม่ได้รับสินค้าตามที่สั่งซื้อภายในระยะเวลาที่กำหนด ผู้ซื้อสามารถทำการ ขอเงินคืนก่อนที่ระยะเวลายืนยันรับสินค้าจะหมด

TC_MC_04997
    [Tags]    Medium    Store-Web
    [Documentation]    Check text bubble in case already receive
    [Setup]    Create order credit card channel    ${reconteststore_slug}    ${normal_product1_reconstore}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Store Order History Page    ${reconteststore_slug}
    Search order id on store order history    ${order_id}
    Seller ship the order with tracking number    EX123456789TH
    Go To Account Order History
    Search order id on account order history    ${order_id}
    ${message}    Buyer receive the order
    Run Keyword If    '${message}' == 'รายการไม่สำเร็จ กรุณาลองใหม่อีกครั้ง'    Fail    รายการไม่สำเร็จ กรุณาลองใหม่อีกครั้ง
    Go To Store Order Detail Page    ${reconteststore_slug}    ${order_id}
    ${content_bubble_bottom}=    Execute Javascript    return $('.bstep4').text().trim()
    Should Contain    ${content_bubble_bottom}    รายการสั่งซื้อนี้ เงินค่าสินค้าได้โอนเข้าสู่บัญชีทรูมันนี่ของคุณเรียบร้อยแล้ว คุณสามารถเข้าไปยัง บัญชีทรูมันนี่ เพื่อตรวจสอบหรือทำธุรกรรมอื่นๆ ได้

TC_MC_04998
    [Tags]    Medium    Store-Web
    [Documentation]    Check text bubble in case request refund
    [Setup]    Create order credit card channel    ${reconteststore_slug}    ${normal_product1_reconstore}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Store Order History Page    ${reconteststore_slug}
    Search order id on store order history    ${order_id}
    Seller ship the order with tracking number    EX123456789TH
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select checkbox all product for refund
    Enter request refund data
    Go To Store Order Detail Page    ${reconteststore_slug}    ${order_id}
    ${content_status_bubble_top}=    Execute Javascript    return $('.step4 .content-bub').text().trim()
    Should Contain    ${content_status_bubble_top}    อยู่ในระหว่างการขอเงินคืน
    ${content_bubble_bottom}=    Execute Javascript    return $('.bstep3').text().trim()
    Should Contain    ${content_bubble_bottom}    ผู้ซื้อได้ทำการขอเงินคืนจากคุณ กรุณาดำเนินการภายในระยะเวลาที่กำหนด
    Should Contain    ${content_bubble_bottom}    - หากคุณตกลงที่จะคืนเงินให้แก่ผู้ซื้อ คุณสามารถ “ยอมรับการขอเงินคืน”
    Should Contain    ${content_bubble_bottom}    - หากคุณแน่ใจว่าสินค้าไม่ได้มีปัญหาแต่ประการใด คุณสามารถ “ปฏิเสธการขอเงินคืน”
    Should Contain    ${content_bubble_bottom}    - หากคุณไม่ดำเนินการใดๆ ภายในระยะเวลาที่กำหนด ระบบจะถือว่าคุณยอมรับการขอเงินคืน และจะดำเนินการคืนเงินให้แก่ผู้ซื้อ
    Should Contain    ${content_bubble_bottom}    คุณได้ทำการจัดส่งสินค้าแล้วและสามารถตรวจสอบสถานะการจัดส่งเพื่อดูรายละเอียด และคุณจะได้รับเงินค่าสินค้าเข้าบัญชีทรูมันนี่ของคุณหลังจาก
    Should Contain    ${content_bubble_bottom}    - ผู้ซื้อทำการยืนยันรับสินค้า
    Should Contain    ${content_bubble_bottom}    - เวลาในการยืนยันรับสินค้าหมดลง (สังเกตเวลาที่เหลืออยู่ในส่วนของยืนยันรับสินค้า)
    Should Contain    ${content_bubble_bottom}    หมายเหตุ : หากผู้ซื้อไม่ได้รับสินค้าตามที่สั่งซื้อภายในระยะเวลาที่กำหนด ผู้ซื้อสามารถทำการ ขอเงินคืนก่อนที่ระยะเวลายืนยันรับสินค้าจะหมด

TC_MC_04999
    [Tags]    Medium    Store-Web
    [Documentation]    Check text bubble in case decline refund
    [Setup]    Create order credit card channel    ${reconteststore_slug}    ${normal_product1_reconstore}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Store Order History Page    ${reconteststore_slug}
    Search order id on store order history    ${order_id}
    Seller ship the order with tracking number    EX123456789TH
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select checkbox all product for refund
    Enter request refund data
    Go To Store Order Detail Page    ${reconteststore_slug}    ${order_id}
    Seller decline refund
    Go To Store Order Detail Page    ${reconteststore_slug}    ${order_id}
    ${content_status_bubble_top}=    Execute Javascript    return $('.step4 .content-bub').text().trim()
    Should Contain    ${content_status_bubble_top}    อยู่ในระหว่างการขอเงินคืน
    ${content_bubble_bottom}=    Execute Javascript    return $('.bstep3').text().trim()
    Should Contain    ${content_bubble_bottom}    คุณได้ทำการจัดส่งสินค้าแล้วและสามารถตรวจสอบสถานะการจัดส่งเพื่อดูรายละเอียด และคุณจะได้รับเงินค่าสินค้าเข้าบัญชีทรูมันนี่ของคุณหลังจาก
    Should Contain    ${content_bubble_bottom}    - ผู้ซื้อทำการยืนยันรับสินค้า
    Should Contain    ${content_bubble_bottom}    - เวลาในการยืนยันรับสินค้าหมดลง (สังเกตเวลาที่เหลืออยู่ในส่วนของยืนยันรับสินค้า)
    Should Contain    ${content_bubble_bottom}    หมายเหตุ : หากผู้ซื้อไม่ได้รับสินค้าตามที่สั่งซื้อภายในระยะเวลาที่กำหนด ผู้ซื้อสามารถทำการ ขอเงินคืนก่อนที่ระยะเวลายืนยันรับสินค้าจะหมด
    Should Contain    ${content_bubble_bottom}    คุณได้ปฏิเสธการขอเงินคืน กรุณารอผู้ซื้อดำเนินการภายในระยะเวลาที่กำหนด
    Should Contain    ${content_bubble_bottom}    หากผู้ซื้อไม่ได้ดำเนินการภายในระยะเวลาที่กำหนด ระบบจะถือว่าผู้ซื้อได้ยอมรับการปฏิเสธการขอเงินคืนของคุณและรายการสั่งซื้อนี้จะดำเนินการต่อไปตามปกติ

TC_MC_05005
    [Tags]    Medium    Store-Web
    [Documentation]    Check text bubble in case already ship (Place order 2 product, Request refund 1 product and Decline refund)
    [Setup]    Create order two products    ${reconteststore_slug}    ${normal_product1_reconstore}    ${normal_product2_reconstore}    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Go To Store Order History Page    ${reconteststore_slug}
    Search order id on store order history    ${order_id}
    Seller ship the order with tracking number    EX123456789TH
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select checkbox product for refund by product name    ${normal_product1_reconstore}
    Enter request refund data
    Go To Store Order Detail Page    ${reconteststore_slug}    ${order_id}
    Seller decline refund
    Go To Store Order Detail Page    ${reconteststore_slug}    ${order_id}
    ${content_status_bubble_top}=    Execute Javascript    return $('.step4 .content-bub').text().trim()
    Should Contain    ${content_status_bubble_top}    อยู่ในระหว่างการขอเงินคืน
    ${content_bubble_bottom}=    Execute Javascript    return $('.bstep3').text().trim()
    Should Contain    ${content_bubble_bottom}    คุณได้ทำการจัดส่งสินค้าแล้วและสามารถตรวจสอบสถานะการจัดส่งเพื่อดูรายละเอียด และคุณจะได้รับเงินค่าสินค้าเข้าบัญชีทรูมันนี่ของคุณหลังจาก
    Should Contain    ${content_bubble_bottom}    - ผู้ซื้อทำการยืนยันรับสินค้า
    Should Contain    ${content_bubble_bottom}    - เวลาในการยืนยันรับสินค้าหมดลง (สังเกตเวลาที่เหลืออยู่ในส่วนของยืนยันรับสินค้า)
    Should Contain    ${content_bubble_bottom}    หมายเหตุ : หากผู้ซื้อไม่ได้รับสินค้าตามที่สั่งซื้อภายในระยะเวลาที่กำหนด ผู้ซื้อสามารถทำการ ขอเงินคืนก่อนที่ระยะเวลายืนยันรับสินค้าจะหมด
    Should Contain    ${content_bubble_bottom}    คุณได้ปฏิเสธการขอเงินคืน กรุณารอผู้ซื้อดำเนินการภายในระยะเวลาที่กำหนด
    Should Contain    ${content_bubble_bottom}    หากผู้ซื้อไม่ได้ดำเนินการภายในระยะเวลาที่กำหนด ระบบจะถือว่าผู้ซื้อได้ยอมรับการปฏิเสธการขอเงินคืนของคุณและรายการสั่งซื้อนี้จะดำเนินการต่อไปตามปกติ

TC_MC_03562
    [Tags]    Regression    Medium    Store-Web
    [Documentation]    WLSStoreDetail View Store Detail (Request Refund Not Ship 1 Product and Ship 1 Product)
    [Setup]    Create order two products    ${reconteststore_slug}    ${normal_product1_reconstore}    ${normal_product2_reconstore}    ${select_address}    ${shipping_custom}    ${ccw_channel_radio_button}
    Go To Account Order History
    Search order id on account order history    ${order_id}
    Click refund link on account order history
    Select Refund Product By Name    ${normal_product1_reconstore}
    Enter request refund data
    Go To Store Order Detail Page    ${reconteststore_slug}    ${order_id}
    Seller accept refund    ${password_reconteststore}
    Go To Store Order History Page    ${reconteststore_slug}
    Search order id on store order history    ${order_id}
    Shipping One Product Custom By Product Name    ngggyhghgh    https://store.wls-dev.com    https://store.wls-dev.co.th    A02.jpg    ${normal_product1_reconstore}
    Go To Store Order History Page    ${reconteststore_slug}
    Search order id on store order history    ${order_id}
    Check Text    ${order_product_name}    ${normal_product2_reconstore}
    Check Text    ${order_status}    รอยืนยันรับสินค้า
    Go To Store Order Detail Page    ${reconteststore_slug}    ${order_id}
    Check Text    ${order_status_detail}    รอยืนยันการรับสินค้า
    ${txt_tracking}=    Execute JavaScript    return $('#product_detail_list tbody .text-center .headline').eq(0).text()
    Should Be Equal    ${txt_tracking}    หมายเลขพัสดุ หรือ ข้อความ
    ${txt_tracking}=    Execute JavaScript    return $('#product_detail_list tbody .text-center .headline').eq(1).text()
    Should Be Equal    ${txt_tracking}    ตรวจสอบสถานะการจัดส่ง
    Check Text    ${order_detail_custom_url1}    https://store.wls-dev.com
    Check Text    ${order_detail_custom_url2}    https://store.wls-dev.co.th


