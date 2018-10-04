*** Settings ***
Resource    ../../Resource/Common/globalInit.robot
Resource    ../../Resource/WeMall/Locators/WemallWeb/CartPageLocator.robot

*** Variables ***
${timeout}    10s

*** Keywords ***
Verify Item Don't Have Text Promotion On Cart Page
    [Arguments]    ${product_id}
    ${lbl_cart_item_promotion_locator}    Replace String    ${lbl_cart_item_promotion}    v_product_id    ${product_id}
    Run Keyword And Ignore Error    Wait Until Element Is Visible    ${lbl_cart_item_promotion_locator}    ${timeout}
    Element Should Not Be Visible    ${lbl_cart_item_promotion_locator}

Verify Item Have Text Promotion On Cart Page
    [Arguments]    ${product_id}
    ${lbl_cart_item_promotion_locator}    Replace String    ${lbl_cart_item_promotion}    v_product_id    ${product_id}
    Wait Until Element Is Visible    ${lbl_cart_item_promotion_locator}    ${timeout}
    Element Should Be Visible    ${lbl_cart_item_promotion_locator}

Verify Item Total Price On Cart Page
    [Arguments]    ${product_id}    ${expected_price}
    ${lbl_cart_item_total_price_locator}    Replace String    ${lbl_cart_item_total_price}    v_product_id    ${product_id}
    Wait Until Element Is Visible    ${lbl_cart_item_total_price_locator}    ${timeout}
    Element Should Contain    ${lbl_cart_item_total_price_locator}    ${expected_price}
