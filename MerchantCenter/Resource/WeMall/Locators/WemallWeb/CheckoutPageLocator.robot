*** Variables ***
${btn_select_addr_checkout2}    //button[@class="btn btn-select-address select_address"]
${lbl_address_detail_step2}    //li[@class='group_address'][1]//div[@class='box-address-detail']
${rad_cod_channel_chekout3}    //div[@id="wetrust_COD"]/div[@class='button-payment']
${btn_select_specific_addr_checkout2}    //form[@id="selected_v_address_id"]/button[contains(@class,'select_address')]
${li_box_addr_checkout2}    //li[@data-shipping-email="v_email"]
${lbl_cod_invalid_address_title}    //div[@id="actionCod"]//h4[@class="modal-title"]
${lbl_cod_invalid_address_detail}    //div[@id="actionCod"]//p[@class="actionfail"]
${btn_backToCart_invalid_addr_popup}    //button[@class="btn btn-default" and text() = 'กลับไปลบสินค้าในตะกร้า']
${btn_backToCart_invalid_time_popup}    //button[@class="btn btn-primary" and text() = 'กลับไปหน้าตะกร้าสินค้า']
${rdo_ccw_channel}    //div[@id="wetrust_CCW"]/div[@class='button-payment']
${rdo_cs_channel}    //div[@id="wetrust_CS"]/div[@class='button-payment']
${rdo_ew_channel}    //div[@id="wetrust_EW"]/div[@class='button-payment']
${btn_confirm_placeorder}    id=btn_step3_confirm
${lnk_wallet_cancel}    //a[contains(text(),'ยกเลิกรายการ')]
${btn_view_order_on_thankyou_page}    //*[@class="btn btn-action-main"]