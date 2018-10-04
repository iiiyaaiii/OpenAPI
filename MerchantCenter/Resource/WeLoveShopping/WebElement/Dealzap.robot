*** Variables ***
### Locator ###
${ddl_lower_price}    $('#select_order ul li').eq(2).find('a')[0].click();
${txt_lower_price}    //a[@class='dropdown-toggle portal-select-selected']
${txt_product_first}    $('.items-list-box li').eq(0).find('a')[0].click();
${btn_filter}    $('.sort-option-list-box .sort-active').eq(0).find('a')[0].click();
${btn_filter_all}    $('.sort-option-list-box .remove-sort-all')[0].click();
${web_element_checkbox}    //div[@class="checkbox"]//input[@type='checkbox']

# Element that match with many elements on page
${chk_viewby}    //div[@class='checkbox']/label