*** Settings ***
Resource    ../../Resource/Common/globalInit.robot
Resource    ../../Resource/WeMall/Locators/WemallWeb/CartPageLocator.robot

*** Variables ***
${timeout}    10s

*** Keywords ***
Click To Checkout Wemall Item On Cart Page
    Wait Until Element Is Visible    ${btn_checkout_wemall_on_cart_page}    ${timeout}
    Focus    ${btn_checkout_wemall_on_cart_page}
    Click Element    ${btn_checkout_wemall_on_cart_page}

Click To Checkout Wefresh Item On Cart Page
    [Arguments]    ${store_id}
    ${btn_checkout_wefresh_locator}    Replace String    ${btn_checkout_wefresh_on_cart_page}    v_store_id    ${store_id}
    Wait Until Element Is Visible    ${btn_checkout_wefresh_locator}    ${timeout}
    Focus    ${btn_checkout_wefresh_locator}
    Click Element    ${btn_checkout_wefresh_locator}
