*** Settings ***
Resource    ../../Resource/Common/globalInit.robot
Resource    ../../Resource/WeMall/Locators/WemallWeb/CheckoutPageLocator.robot
Resource    ../../Resource/WeMall/Locators/WemallWeb/ThankyouPageLocator.robot
Resource    ../WemallWeb/CheckoutPageKeyword.robot

*** Variables ***
${timeout}    10s

*** Keywords ***
Click To Default Shipping Address On Checkout Step 2
    [Documentation]    if user have more shipping address it will select first address
    Wait Until Element Is Visible    ${btn_select_addr_checkout2}    ${timeout}
    Click Element    ${btn_select_addr_checkout2}

Get Shipping Address Data On Checkout Step 2
    Wait Until Element Is Visible    ${lbl_address_detail_step2}    ${timeout}
    ${address_detail}    Get Text    ${lbl_address_detail_step2}
    [Return]    ${address_detail}

Select Payment Channel On Checkout Step 3
    [Arguments]    ${expected_payment_channel}
    Run Keyword If    '${expected_payment_channel}' == 'COD'    Select COD Payment Channel

Verify Total Amount Of Order On Thankyou Page
    [Arguments]    ${expected_net_amount}
    Wait Until Element Is Visible    ${lbl_total_thankyou_page}    ${timeout}
    ${thx_net_amt_value}=    Get Text    ${lbl_total_thankyou_page}
    ${thx_net_amt_value}=    Remove String    ${thx_net_amt_value}    ,
    ${expected_net_amount}    Convert To String    ${expected_net_amount}
    Should Contain    ${thx_net_amt_value}    ${expected_net_amount}

Select Shipping Address By Email On Checkout Step 2
    [Arguments]    ${expected_email}
    ${box_addr_locator}    Replace String    ${li_box_addr_checkout2}    v_email    ${expected_email}
    Wait Until Element Is Visible    ${box_addr_locator}    ${timeout}
    ${locator_id}    Get Element Attribute    ${box_addr_locator}    id
    ${address_id}    Remove String    ${locator_id}    address_
    Select Shipping Address By Address ID    ${address_id}

Verify Select Invalid Address For Wefresh On Checkout Step 2
    Wait Until Element Is Visible    ${lbl_cod_invalid_address_title}    ${timeout}
    Element Should Contain    ${lbl_cod_invalid_address_title}    ขออภัยในความไม่สะดวก
    Element Should Contain    ${lbl_cod_invalid_address_detail}    ที่อยู่ของคุณอยู่นอกพื้นที่การจัดส่ง

Verify Place Order Out Of Time Service For Wefresh On Checkout Step 2
    Wait Until Element Is Visible    ${lbl_cod_invalid_address_title}    ${timeout}
    Element Should Contain    ${lbl_cod_invalid_address_title}    ขออภัยคุณลูกค้า
    Element Should Contain    ${lbl_cod_invalid_address_detail}    ขณะนี้อยู่นอกเวลาการสั่งซื้อของร้านนี้    (สามารถสั่งซื้อได้ในเวลา 23.00 น. - 23.30 น.)

Select Payment Channel
    [Documentation]    Use For Select Payment Channel
    [Arguments]    ${payment_channel}
    Wait Until Element Is Visible    ${payment_channel}    ${timeout}
    Click Element    ${payment_channel}

Click Confirm For Place Order
    [Documentation]    Use Confirm Place Order
    Click Element    ${btn_confirm_placeorder}

Click Cancel Order For E-wallet
    [Documentation]    Use For Cancel E-wallet Payment Channel
    Wait Until Element Is Visible    ${lnk_wallet_cancel}    ${timeout}
    Click Element    ${lnk_wallet_cancel}
