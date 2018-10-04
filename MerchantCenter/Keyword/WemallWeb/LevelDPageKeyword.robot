*** Settings ***
Resource    ../../Resource/Common/globalInit.robot
Resource    ../../Resource/WeMall/Locators/WemallWeb/LevelDPageLocator.robot

*** Variables ***
${timeout}    15s

*** Keywords ***
Click Add Product To Cart on LevelD Page
    Wait Until Element Is Visible    ${btn_leveld_add_to_cart}    ${timeout}
    Focus    ${btn_leveld_add_to_cart}
    Click Element    ${btn_leveld_add_to_cart}

Click To Confirm Add To Cart And Go to Cart Page on LevelD Page
    Wait Until Element Is Visible    ${btn_leveld_confirm_goto_cart}    ${timeout}
    Focus    ${btn_leveld_confirm_goto_cart}
    Click Element    ${btn_leveld_confirm_goto_cart}

Click To Continue Shopping
    Wait Until Element Is Visible    ${btn_leveld_continue_shopping}    ${timeout}
    Focus    ${btn_leveld_continue_shopping}
    Click Element    ${btn_leveld_continue_shopping}
