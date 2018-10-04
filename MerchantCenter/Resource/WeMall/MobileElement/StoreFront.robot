*** Variables ***
##WIDGETS
${img_wemall_logo}    //div[@ng-click='linkTo()']
${btn_login}    //div[@ng-click='redirectTo( getLoginUrl() )']
${btn_my_shop}    //i[@class='icon-shop']
${btn_user_avatar}    //div[@class='box-user-info']
${btn_cart}    box-my-cart
${txt_search_in_store}    //input[@ng-model='keywordStore']
${btn_search_in_store}    //button[@ng-click='doSearch()']
${img_header_banner}    //div[@ng-click='linkToFullUrl( top_banner.link )']
${ddl_avatar_shop_history}    //a[@ng-click="redirectTo( accountUrl + 'profile/report' )"]
${ddl_avatar_user_info}    //a[@ng-click="redirectTo( accountUrl + 'profile' )"]
${ddl_avatar_sign_out}    //a[@ng-click="redirectTo( accountUrl + 'logout' )"]
${btn_all_products}    //a[@class='btn-viewmore']

##SHOP
${btn_store_main_menu}    btn_collap
${img_store_avatar}    //div[@class='nt-shopname-box']/div[@class='nt-shop-display']
${lbl_store_name}    //div[@class='nt-shopname']

##SORTING SEARCH RECORD
${btn_sort_product}    //div[@class='sortdown-box']/span

##SOCIAL NETWORKS
${lbl_social_network}    //div[@class='follow-box']
${btn_facebook}    //i[@class='icon-white-facebook']
${btn_instagram}    //i[@class='icon-white-instagram']
${btn_twitter}    //i[@class='icon-white-twitter']
${btn_google_plus}    //i[@class='icon-white-google']
${btn_pinterest}    //i[@class='icon-white-pinstagram']

##SELLER PROMOTION HOMEPAGE
${bage_sellerpromotion}    //div[@class="caption"]//i[@class="icon-promo-title"]
${sellerpromotion_condition}    //span[@class="cond-box ng-binding"]
${sellerpromotion_product}    //div[@class="s-promo-wrapper"]
${sellerpromotion_viewall}    //a[@href="https://m.wemall-dev.com/robot_stg_store1/promotion/6336"]

##COLLECTION HOMEPAGE
${box_collection}    //div[@class="box-main highlight-home-box ng-scope"]
${viewall_collection}    //a[@href="https://m.wemall-dev.com/robot_stg_store1/collection"]
${product_collection}    $('li[ng-repeat="product in collection.collection_highlight"]')

##STOREFRONT LEVELC CATEGORY
${box_product_lvc}   //div[@class="box-main lvc-category ng-scope"]
${product_category}    $('li[ng-repeat="product in categoryData"]')
${default_sorting}    //span[@class="sort-selected cursor-pointer ng-binding"]

##STOREFRONT LEVELC COLLECTION
${product_collection_lvc}    $('li[ng-repeat="product in collection_item"]')
${no_collection}    //div[@class="noresult-box"]

##STOREFRONT LEVELC SELLER PROMOTION
${icon_promotion}    //i[@class="icon-promo-title"]
${product_seller_lvc}    $('div[class="product-box"]')
${img_product_seller_lvc}    //div[@class="product-box"]

##FOOTER##
${box_remind_3step}    //div[@class='footer-3step']
${btn_footer}    //a[@class='btn-footer']

##STOREFRONT LEVELC PRODUCT ALL
${product_all_lvc}    $('li[ng-repeat="product in productData"]')

##STOREFRONT MAIN MENU
${opt_promotion}    $('#store-menu-promotion > a')[0].click()

##STOREFRONT LEVELC PRODUCT ALL
${product_all_lvc}    $('li[ng-repeat="product in productData"]')

