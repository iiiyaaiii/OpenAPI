*** Variables ***
##EMPTY CART
${lbl_empty_cart_text}    //p[text()='ไม่มีสินค้าในตะกร้าของท่าน']
${btn_continue_shopping}    //div[text()='กลับไปซื้อสินค้าต่อ']

##CART
${lbl_product_in_cart}    //div[@class='box-cart-title']/span[1]
${lbl_shop_in_cart}    //div[@class='box-cart-title']/span[2]
${img_info}    //i[@ng-click='showInfo()']
${popup_info_detail}    //div[@class='pop-detail']
${btn_close_info}    //button[@ng-click='closeInfo()']
${lbl_alert_msg}    //div[@class='box-cart-noti ng-binding ng-scope']
${btn_delete_product_cart}    //div[@class="delete-item"]
${lbl_m_product_name}    //p[@class="text-name"]
${lbl_m_promotion}    //div[@class="text-promotion ng-scope"]
${tbr_m_freebie}    //div[@class="feebie-box ng-scope"]
${lbl_m_seller}    //div[@class="text-promotion ng-binding ng-scope"]

##PRODUCT DETAILS
${lbl_shop_name}    //div[@class='shop-title']/div[@once-text='"ร้านค้า : " + group.store.title']
${lbl_product_name}    //div[@class="detail"]//p[contains(@once-text,'title')]
${lbl_product_price}    //div[@class='box-shop-cart ng-scope open'][1]//following-sibling::div[@class='price']/span[@class='text-price']
${lbl_compare_price}   //div[@class='box-shop-cart ng-scope open'][1]//following-sibling::span[@once-text='product.compare_at_price']
${lbl_added_quantity}    //div[@class='box-shop-cart ng-scope open'][1]//following-sibling::*[@ng-model='product.quantity']/option[@selected='selected']
${lbl_remove_product}    //div[@class='box-shop-cart ng-scope open'][1]//following-sibling::*[@ng-click='deleteProduct(product)']
${btn_decrease_product}    //div[@class='box-shop-cart ng-scope open'][1]//following-sibling::div[@ng-click='updateQuantity(product,-1)']
${btn_increase_product}    //div[@class='box-shop-cart ng-scope open'][1]//following-sibling::div[@ng-click='updateQuantity(product,1)']
${ddl_add_quantity}    //div[@class='box-shop-cart ng-scope open'][1]//following-sibling::select
${img_promotion}    //div[contains(@ng-if,'promotionSummary')]//div[@class="pro-line-box"]/span
${lbl_discount}    //div[@class='box-tag-promocode promotion-ribbon-box ng-scope']
${img_promotion_info}    //i[@ng-click='promotionInfo(productGroup.id)']
${popup_promotion_detail_shop}    //div[@class='modal-cart-promotion']/span
${popup_promotion_detail_desc}    //div[@class='modal-cart-promotion']//ul
${btn_close_promotion_info}    //button[@ng-click='closePromotionInfo()']
${lbl_discount_amount}    //div[contains(@ng-if,'promotionSummary')]

### TRUE POINT ###
${txt_condition_truepoint_mobile}    //div[@class="text-promotion ng-binding ng-scope"]
${txt_remark_condition_truepoint_mobile}    //div[@class="wrap-remark ng-scope"]

## Fresh
${btn_buy_mobile}    //div[@class="inner ng-binding ng-scope"]
${lbl_remark_incart_mobile}    //div[@class="col-remark-point-detail"]
${lbl_remark_fresh_cart_mobile}    //div[@class="col-remark-wefresh-detail"]
${btn_buy_fresh}    //div[@class="inner ng-binding ng-scope"]
${lbl_group_nonefresh}    //div[@class="box-shop ng-scope wemall"]
${lbl_group_fresh}    //div[@class="box-shop ng-scope wefreshL941052"]