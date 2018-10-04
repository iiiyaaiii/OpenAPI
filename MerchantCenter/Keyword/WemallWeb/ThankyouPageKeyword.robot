*** Settings ***
Resource    ../../Resource/Common/globalInit.robot
Resource    ../../Resource/WeMall/Locators/WemallWeb/ThankyouPageLocator.robot

*** Variables ***
${timeout}    10s

*** Keywords ***
Click To Display Summary Order Section On Thankyou Page
    Wait Until Element Is Visible    ${tog_summary_order_thx_page}    ${timeout}
    Focus    ${tog_summary_order_thx_page}
    Click Element    ${tog_summary_order_thx_page}

Click View Order Detail Button On Thankyou Page
    [Documentation]    Use For View Order Detail Button On Thankyou Page
    Wait Until Element Is Visible    ${btn_view_order_on_thankyou_page}    ${timeout}
    Click Element    ${btn_view_order_on_thankyou_page}
    ${url_detail}    Get Location
    ${order_id}    Remove String    ${url_detail}    ${URL_ACCOUNT}/profile/report/orderdetail/
    Set Test Variable    ${order_id}
