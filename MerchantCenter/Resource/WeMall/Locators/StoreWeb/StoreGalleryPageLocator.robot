*** Variables ***
${link_gallery_album_name}    //div[@class="album-detail"]//span[text()='v_album_name']//preceding::div[@class='album-img position-relative']
${input_upload_img}    //input[@id='fileuploadinput']
${lbl_img_name}    //div//a//span[contains(text(),'v_img_name')]
${lbl_gallery_name_header}    //div[@class="span8"]//div[@class="widget-header"]
${link_img_name}    //div//a//span[contains(text(),'v_img_name')]/parent::a
${btn_edit_album}    //button[@id='tool_albume_edit']
${chk_select_img}    //input[@value="v_img_hash"]
${btn_del_img_in_album}    //button[@id="tool_albume_delete"]
${lbl_success_action}    //span[@id='notify-msg']
${btn_confirm_delete}    //a[@class="btn btn-primary" and text() = 'ตกลง']
