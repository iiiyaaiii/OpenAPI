*** Variables ***
##WIDGETS
${m_wm_hamburger}	//button[@ng-click='toggleNav()']/span
${m_wm_logo}		//div[@ng-click='linkTo()']
${m_wm_searchBox}	//div[@class='search-bar']//input
${m_wm_searchIcon}	//div[@class='search-bar']//button
${m_wm_login}		//div[@class='link-login']
${m_wm_cart}		//div[@id='box-my-cart']
${m_wm_myAcc}		//div[@ng-click="toggleAccount()"]/img
${m_wm_myShop}		//i[@class='icon-shop']
${m_wm_freeDelivery}	//div[@class='m-shipping-bar']

##LOGIN FORM
${m_wm_username}	username
${m_wm_password}	password
${m_wm_loginBtn}	//button[@class='btn-default btn-login']

##TABS
${m_wm_homeTab}			//a[@data-target='#home']
${m_wm_homeTabName}		หน้าแรก
${m_wm_creditCardTab}	//a[@data-target='#creditcard']
${m_wm_creditCardTabName}	สิทธิพิเศษบัตรเครดิต

##MAIN MENU
${fre_wm_home}    //body[@class='mc_home']
${m_wm_mainmenu}    $("ul[class='menu-list ng-scope'] li")
${m_wm_mainmenu_home}    //li[@ng-click="linkTo()"]
${m_wm_mainmenu_categories}    //li[@ng-click="linkTo('/categories')"]
${icn_contactus}    //i[@class="icon-menu-contact"]
${fre_mb_contactus}    //div[@class="container wrapper"]
${lab_wm_mb_contactus}    //div[@class="container wrapper"]/p[2]
${lab_wm_mb_email}    //div[@class="container wrapper"]/table[2]//td
# ${m_wm_mainmenu_categories}    //li[@class="dropdown-menu"]
${m_wm_mainmenu_cart}    //li[@ng-click="linkTo('/cart')"]
${m_wm_mainmenu_notlogin}    //li[@ng-click="redirectTo( getLoginUrl() )"]
${m_wm_mainmenu_register}    //li[@ng-click="redirectTo( accountUrl + 'signup/user' )"]
${m_wm_mainmenu_help}    //li[@ng-click="linkTo('/nav_content')"]
${m_wm_mainmenu_contact}    //li[@ng-click="linkTo('/content/378')"]
${m_wm_mainmenu_orderreport}    //li[@ng-click="redirectTo( accountUrl + 'profile/report' )"]
${m_wm_mainmenu_store}    //li[@ng-click="redirectTo( westore.shop_url )"]
${m_wm_mainmenu_logout}    //li[@ng-click="redirectTo( accountUrl + 'logout' )"]
${icn_mb_live_chat}    id=live-agent-mobile
${txt_name_chat}    id=46006input
${txt_email_chat}    id=46007input
${txt_info_chat}    id=46008area
${btn_submit_chat}    //div[@class="ImLeButtonMainContent"]

##HIGHLIGHT BANNER
${activeBanner}	//div[@role='listbox']//following-sibling::li[@style='display: inline-block; transform: translate3d(0%, 0px, 0px);']

##MAIN MENU CATEGORY
${m_wm_mainmenu_category_lv1}    $("li[ng-repeat='category in categories']")
${m_wm_mainmenu_category_maincategory}    //div[@ng-click="linkTo(category.url)"]//span[@once-text="category.title"]
${m_wm_mainmenu_viewall_productcategory}    //a-link[@ng-click="linkTo( currentItem.url )"]
${categorylist_name_title}    //span[@once-text="categoryTitle"]
${category_name_title}    //div[@class="box-text"]//span[@class="color-blue"]

##EVERYDAY WOW
${m_wm_logo_everydaywow}    //div[@class="widget-box"]//div[@class="widget-header"]//div[@class="wow-head"]
${m_wm_countdown_everydaywow}    //div[@class="coundown-text"]
${m_wm_count_thumb_everydaywow}    $("div[class='item-thumb ng-scope']")

##FOOTER
${m_wm_scrollTop}	//span[text()='กลับสู่ด้านบน']
${m_wm_copyright}	//div[@class='copyright']

##SHOP BY BRAND
${m_wm_brand_left_arrow}    //div[@id='carousel-brand']//following::i[@class='left-arrow-icon']
${m_wm_brand_right_arrow}   //div[@id='carousel-brand']//following::i[@class='right-arrow-icon']
${m_wm_view_all_brands}    //a[@ng-click="linkTo('brand')"]
${m_wm_breadcrumb_brand}    //span[(@ng-click='historyBack()') and (text()='Shop by Brand')]
