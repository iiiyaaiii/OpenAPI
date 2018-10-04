*** Variables ***
##PRODUCT DETAILS
${lbl_sold_out}    //div[@ng-if='isEmpty']
${lbl_product_price}    //div[@class='box-price-item']//span[@class='price']
${lbl_compare_price}    //div[@class='box-price-item']//span[@class='compare-price ng-scope']
${lbl_less_stock}    //div[(@type='quantity') and (@class='box-option-noti')]
${img_wow_color}    //div[@class='lvd-dz-title ng-scope']
${img_wow_grey}    //div[@class='lvd-dz-title off ng-scope']
${lbl_seller_promotion_box}    //div[@class='box-tag-promocode promotion-ribbon-box ng-scope']
${lbl_seller_promotion_name}    //div[@class='box-promotion-name ng-scope']
${lbl_seller_promotion_discount}    //li[@class='ng-binding ng-scope']
${lbl_seller_promotion_shop}    //div[@class='box-promotion-shop']/a
${lbl_seller_promotion_period}    //div[@class='box-promotion-date ng-binding']
${btn_add_to_cart}    add-to-cart
${btn_add_to_cart_normal}    //div[@class="inner"]
${tab_product_description}    //div[(@class='box-detail-title ng-scope') and (text()='รายละเอียดสินค้า')]
${lbl_product_property}    //div[@class='box-detail-properties ng-scope']
${lbl_product_description}    //div[@class='inner-detail-item']
${link_property_expand}    //a[@onclick='show_feature();']
${link_property_collapse}    //a[@onclick='hide_feature();']
${lbl_recommend_product}    //div[@class='box-relative']
${img_shop_avatar}    //div[@class='box-relative']/div[@class='shop-display']
${lbl_shop_name}    //div[@class='box-relative']/div[@class='shop-name']/strong
${lbl_product_quantity}    //div[@select-quantity='select-quantity']
${ddl_product_quantity}    //select[@ng-model='product.quantity']
${btn_increase_quantity}    //div[@ng-click='updateQuantity(product,1)']
${btn_decrease_quantity}    //div[@ng-click='updateQuantity(product,-1)']
${popup_confirmation}    //div[@class='modal-content']
${popup_close}    //button[@class='close']
${popup_view_more}    //a[@ng-click='continueShopping()']
${popup_check_order}    //a[@ng-click='linkTo( "/cart" )']
${popup_product_name}    //div[@class='col-text-add-cart']/div[@class='pd-name']
${popup_product_option}    //div[@class='col-text-add-cart']/div[@class='pd-option']
${popup_product_quantity}    //div[@class='col-text-add-cart']/div[@class='pd-qty']
${popup_product_price}    //div[@class='col-text-add-cart']/div[@class='pd-price']
${tbl_product_everydaywow}    /li[@ng-repeat="item in productData"]
${lbl_productname_freebie}    //div[contains(text(),'-freebie')]

### TruePoint ###
${txt_truepoint_info}    //div[@class="product-superpoint-info"]
${txt_truepoint_condition}    //div[@class="product-superpoint-description"]
${btn_truepoint}    //div[@class="inner point ng-scope"]
${img_truepoint_thumbnail}    //div[@class="superpoint-tag ng-scope"]
${btn_attribute_black}    //div[@data-option-title="ดำ"]
${btn_attribute_red}    //div[@data-option-title="แดง"]
${popup_error_msg}    //h4[@class="modal-title"]
${btn_at_popup_truepoint_continue}    //a[@class="btn btn-addtocart-point"]
${btn_selection_area}    //div[@class="option-selector-item ng-scope ng-isolate-scope box-option-color"]
${popup_truepoint_msg}    id=lvdcart-point
=======
${btn_add_to_cart_truepoint}    //div[@class="inner point ng-scope"]
>>>>>>> Stashed changes
