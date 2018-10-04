*** Settings ***
Resource    ../../Resource/Common/globalInit.robot
Resource    ../../Resource/WeMall/Locators/WemallWeb/CheckoutPageLocator.robot

*** Variables ***
${timeout}    10s

*** Keywords ***
Select COD Payment Channel
    Wait Until Element Is Visible    ${rad_cod_channel_chekout3}    ${timeout}
    Focus    ${rad_cod_channel_chekout3}
    Click Element    ${rad_cod_channel_chekout3}

Select Shipping Address By Address ID
    [Arguments]    ${address_id}
    ${btn_select_address_locator}    Replace String    ${btn_select_specific_addr_checkout2}    v_address_id    ${address_id}
    Wait Until Element Is Visible    ${btn_select_address_locator}    ${timeout}
    Focus    ${btn_select_address_locator}
    Click Element    ${btn_select_address_locator}

Click Button Back To Cart From Alert Invalid Address
    Wait Until Element Is Visible    ${btn_backToCart_invalid_addr_popup}    ${timeout}
    Click Element    ${btn_backToCart_invalid_addr_popup}

Click Button Back To Cart From Alert Invalid Time
    Wait Until Element Is Visible    ${btn_backToCart_invalid_time_popup}    ${timeout}
    Click Element    ${btn_backToCart_invalid_time_popup}
