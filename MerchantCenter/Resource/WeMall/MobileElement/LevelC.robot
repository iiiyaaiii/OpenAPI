*** Variables ***
##MAIN MENU CATEGORY
${wm_banner_category}	//div[@class="banner_lvc ng-scope"]//ul[@rn-carousel-index="banner_category"]
${wm_category_badge_promocode}    //div[@class="box-img"]//div[@class="tag-promo ng-scope"]

##PRODUCT VIEW
${wm_view_list}	//i[@ng-click='viewMode = LIST_VIEW']
${wm_view_list_selected}	//i[@class='icon-view-list active']
${wm_view_thumb}	//i[@ng-click='viewMode = THUMB_VIEW']
${wm_view_thumb_selected}	//i[@class='icon-view-thumb active']

##SORTING
${wm_sort_option}	//div[@class='box-drop-sort view-sort']//i
${wm_sort_lowest}	//ul[@class='sort-list']/li[@ng-click='order="price"; sort="asc"']
${wm_sort_highest}	//ul[@class='sort-list']/li[@ng-click='order="price"; sort="desc"']
${wm_sort_lowest_campaign}    //li[@ng-class="{active: sortType == PRICE_ASC}"]
${wm_sort_highest_campaign}    //li[@ng-class="{active: sortType == PRICE_DESC}"]

##LEVELC EVERYDAY WOW
${banner_everydaywow}    //div[@class="box-dz-timer"]
${banner_nexteverydaywow}    //div[@class="time-start ng-scope"]
${breadcurmb_everydaywow}    //a[@class="ui-link"]
${list_levelc_product_everydaywow}    //ul[@class="box-list-view list-wow ng-scope ng-isolate-scope"]//li[@class="ng-scope"]
${btn_shop}    //ul[@class="box-list-view list-wow ng-scope ng-isolate-scope"]//li[1]//div[@class="wrap-btn-shop ng-scope"]
${nav_topbox}    //div[@class="nav-top-box ng-scope"]
${wow_sort_option}    //div[@id="btnWowsort"]
${wow_fillter_option}    //div[@id="btnWowtype"]
${pictuer_nexteverydaywow}    //div[@class="starttime ng-scope"]
${count_category_everydaywow}    $('div[ng-repeat="category in categories"]').length
${count_collection_everydaywow}    $('div[ng-repeat="tag in tags"]').length
${btn_confrim}    //div[@class="btn-submit"]

##LEVELC CAMPAIGN
${breadcurmb_camapign}    //div[@class="box-text color-blue ng-binding"]
${box_product}    //div[@class="no-result-pd-box"]
${count_product}    $('li[ng-repeat="product in category"]').length
${campaign_sort_catgory}    //div[@class="box-drop-sort cat-sort ng-scope"]
${campaign_sort}    //div[@class="box-drop-sort view-sort"]
${banner}    //div[@class="campaign-banner ng-scope"]

##LEVELC RECOMMEND
${link_back}    //div[@class="box-text ng-binding"]
${default_sorting}    //div[@class="box-drop-sort view-sort"]