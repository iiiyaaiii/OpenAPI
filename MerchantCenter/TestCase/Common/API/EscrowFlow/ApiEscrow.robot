*** Setting ***
Library           SeleniumLibrary
Library           String
Resource          ../../../Keyword/Common/Api_Escrow.txt
Resource          ../../../Resource/Common/API/Api_Escrow.txt
Resource          ../../../Resource/WeLoveShopping/init.robot

*** Test Cases ***
Place_Order_and_Payment_CCW
    [Documentation]    Place order and payment with CCW channel
    ${one_time_token}=    Get One Time Token From TMN   ${url_get_token_tmn}    ${content_type}    ${pubilc_token}    ${card_holder_name}    ${card_number}    ${card_expiry_month}    ${card_expiry_year}    ${card_cvn}
    ${response_data}=    API Placeorder    ${one_time_token}    CCW
    ${securekey}    Get secure_key from response data    ${response_data}
    Check response code    ${response_data}    200    success
    Check Status Api List    ${securekey}    "Payment success and waiting for shipment"    /data/order_status/description

Place_Order_EW
    [Documentation]    Place order with EW channel
    ${one_time_token}=    Get One Time Token From TMN   ${url_get_token_tmn}    ${content_type}    ${pubilc_token}    ${card_holder_name}    ${card_number}    ${card_expiry_month}    ${card_expiry_year}    ${card_cvn}
    ${response_data}=    API Placeorder    ${one_time_token}    EW
    ${securekey}    Get secure_key from response data    ${response_data}
    Check response code    ${response_data}    200    success
    Check Status Api List    ${securekey}    "Waiting for payment"    /data/order_status/description

Place_Order_CS
    [Documentation]    Place order with CS channel
    ${one_time_token}=    Get One Time Token From TMN   ${url_get_token_tmn}    ${content_type}    ${pubilc_token}    ${card_holder_name}    ${card_number}    ${card_expiry_month}    ${card_expiry_year}    ${card_cvn}
    ${response_data}=    API Placeorder    ${one_time_token}    CS
    ${securekey}    Get secure_key from response data    ${response_data}
    Check response code    ${response_data}    200    success
    Check Status Api List    ${securekey}    "Waiting for payment"    /data/order_status/description

Place_Order_Offline
    [Documentation]    Place order with offline channel
    ${one_time_token}=    Get One Time Token From TMN   ${url_get_token_tmn}    ${content_type}    ${pubilc_token}    ${card_holder_name}    ${card_number}    ${card_expiry_month}    ${card_expiry_year}    ${card_cvn}
    ${response_data}=    API Placeorder    ${one_time_token}    ATM
    ${securekey}    Get secure_key from response data    ${response_data}
    Check response code    ${response_data}    200    success
    Check Status Api List    ${securekey}    "Waiting for payment"    /data/order_status/description

Ship
    [Documentation]    Place order and ship
    ${one_time_token}=    Get One Time Token From TMN   ${url_get_token_tmn}    ${content_type}    ${pubilc_token}    ${card_holder_name}    ${card_number}    ${card_expiry_month}    ${card_expiry_year}    ${card_cvn}
    ${response_data}=    API Placeorder    ${one_time_token}    CCW
    ${securekey}    Get secure_key from response data    ${response_data}
    ${order_product_id_1}    ${order_product_id_2}    ${order_product_id_3}    ${order_product_id_4}    Get Product Id From Api    ${securekey}    /data/order_product/0/id    /data/order_product/1/id    /data/order_product/2/id    /data/order_product/3/id
    ${response_data}    API Shipping    ${securekey}    ${app_secret}    ${action_shipping}    ${order_product_id_1}    ${order_product_id_2}    ${order_product_id_3}    ${order_product_id_4}    ThailandPost    EMS    EL381863293TH    Tracking Description    http://www.google.co.th/
    Check response code    ${response_data}    200    success
    Check Status Api List    ${securekey}    "Shipped and wait for confirm receive"    /data/order_status/description

Receive
    [Documentation]    Place order and recevice
    ${one_time_token}=    Get One Time Token From TMN   ${url_get_token_tmn}    ${content_type}    ${pubilc_token}    ${card_holder_name}    ${card_number}    ${card_expiry_month}    ${card_expiry_year}    ${card_cvn}
    ${response_data}=    API Placeorder    ${one_time_token}    CCW
    ${securekey}    Get secure_key from response data    ${response_data}
    ${order_product_id_1}    ${order_product_id_2}    ${order_product_id_3}    ${order_product_id_4}    Get Product Id From Api    ${securekey}    /data/order_product/0/id    /data/order_product/1/id    /data/order_product/2/id    /data/order_product/3/id
    API Shipping    ${securekey}    ${app_secret}    ${action_shipping}    ${order_product_id_1}    ${order_product_id_2}    ${order_product_id_3}    ${order_product_id_4}    ThailandPost    EMS    EL381863293TH    Tracking Description    http://www.google.co.th/
    ${response_data}    API Receive    ${securekey}    ${app_secret}    ${action_receive}    ${order_product_id_1}    ${order_product_id_2}    ${order_product_id_3}    ${order_product_id_4}
    Check response code    ${response_data}    200    success
    Check Status Api List    ${securekey}    "Receive and order completed"    /data/order_status/description

RequestRefund
    [Documentation]    Place order and request refund
    ${one_time_token}=    Get One Time Token From TMN   ${url_get_token_tmn}    ${content_type}    ${pubilc_token}    ${card_holder_name}    ${card_number}    ${card_expiry_month}    ${card_expiry_year}    ${card_cvn}
    ${response_data}=    API Placeorder    ${one_time_token}    CCW
    ${securekey}    Get secure_key from response data    ${response_data}
    ${order_product_id_1}    ${order_product_id_2}    ${order_product_id_3}    ${order_product_id_4}    Get Product Id From Api    ${securekey}    /data/order_product/0/id    /data/order_product/1/id    /data/order_product/2/id    /data/order_product/3/id
    API Shipping    ${securekey}    ${app_secret}    ${action_shipping}    ${order_product_id_1}    ${order_product_id_2}    ${order_product_id_3}    ${order_product_id_4}    ThailandPost    EMS    EL381863293TH    Tracking Description    http://www.google.co.th/
    ${response_data}    API Request Refund    ${securekey}    ${app_secret}    ${action_request_refund}    ${order_request_reasons_code}    ${request_description}    ${order_product_id_1}    ${order_product_id_2}    ${order_product_id_3}    ${order_product_id_4}
    Check response code    ${response_data}    200    success
    Check Status Api List    ${securekey}    "Request refund and waiting for seller's response"    /data/order_product/0/escrow_product/order_status/description

AcceptRefund
    [Documentation]    Place order and accept request refund
    ${one_time_token}=    Get One Time Token From TMN   ${url_get_token_tmn}    ${content_type}    ${pubilc_token}    ${card_holder_name}    ${card_number}    ${card_expiry_month}    ${card_expiry_year}    ${card_cvn}
    ${response_data}=    API Placeorder    ${one_time_token}    CCW
    ${securekey}    Get secure_key from response data    ${response_data}
    ${order_product_id_1}    ${order_product_id_2}    ${order_product_id_3}    ${order_product_id_4}    Get Product Id From Api    ${securekey}    /data/order_product/0/id    /data/order_product/1/id    /data/order_product/2/id    /data/order_product/3/id
    API Shipping    ${securekey}    ${app_secret}    ${action_shipping}    ${order_product_id_1}    ${order_product_id_2}    ${order_product_id_3}    ${order_product_id_4}    ThailandPost    EMS    EL381863293TH    Tracking Description    http://www.google.co.th/
    API Request Refund    ${securekey}    ${app_secret}    ${action_request_refund}    ${order_request_reasons_code}    ${request_description}    ${order_product_id_1}    ${order_product_id_2}    ${order_product_id_3}    ${order_product_id_4}
    ${order_request_refund_id}    Get Refund Id From Api    ${securekey}    /data/order_request_refund/0/id
    ${refund_item_id_1}    ${refund_item_id_2}    ${refund_item_id_3}    ${refund_item_id_4}    Get Product Id From Api    ${securekey}    /data/order_request_refund/0/order_request_refund_item/0/id    /data/order_request_refund/0/order_request_refund_item/1/id    /data/order_request_refund/0/order_request_refund_item/2/id    /data/order_request_refund/0/order_request_refund_item/3/id
    ${response_data}    API Accept Refund    ${securekey}    ${app_secret}    ${action_accept}    ${refund_item_id_1}    ${refund_item_id_2}    ${refund_item_id_3}    ${refund_item_id_4}    ${order_request_refund_id}    ${request_description}
    Check response code    ${response_data}    200    success
    Check Status Api List    ${securekey}    "Accept and refund"    /data/order_status/description

Decline
    [Documentation]    Place order and decline request refund
    ${one_time_token}=    Get One Time Token From TMN   ${url_get_token_tmn}    ${content_type}    ${pubilc_token}    ${card_holder_name}    ${card_number}    ${card_expiry_month}    ${card_expiry_year}    ${card_cvn}
    ${response_data}=    API Placeorder    ${one_time_token}    CCW
    ${securekey}    Get secure_key from response data    ${response_data}
    ${order_product_id_1}    ${order_product_id_2}    ${order_product_id_3}    ${order_product_id_4}    Get Product Id From Api    ${securekey}    /data/order_product/0/id    /data/order_product/1/id    /data/order_product/2/id    /data/order_product/3/id
    API Shipping    ${securekey}    ${app_secret}    ${action_shipping}    ${order_product_id_1}    ${order_product_id_2}    ${order_product_id_3}    ${order_product_id_4}    ThailandPost    EMS    EL381863293TH    Tracking Description    http://www.google.co.th/
    API Request Refund    ${securekey}    ${app_secret}    ${action_request_refund}    ${order_request_reasons_code}    ${request_description}    ${order_product_id_1}    ${order_product_id_2}    ${order_product_id_3}    ${order_product_id_4}
    ${order_request_refund_id}    Get Refund Id From Api    ${securekey}    /data/order_request_refund/0/id
    ${refund_item_id_1}    ${refund_item_id_2}    ${refund_item_id_3}    ${refund_item_id_4}    Get Product Id From Api    ${securekey}    /data/order_request_refund/0/order_request_refund_item/0/id    /data/order_request_refund/0/order_request_refund_item/1/id    /data/order_request_refund/0/order_request_refund_item/2/id    /data/order_request_refund/0/order_request_refund_item/3/id
    ${response_data}    API Decline Request Refund    ${securekey}    ${app_secret}    ${action_decline}    ${refund_item_id_1}    ${refund_item_id_2}    ${refund_item_id_3}    ${refund_item_id_4}    ${order_request_refund_id}    ${request_description}
    Check response code    ${response_data}    200    success
    Check Status Api List    ${securekey}    "Shipped and wait for confirm receive"    /data/order_status/description
    Check Status Api List    ${securekey}    "ร้านค้าปฏิเสธการขอเงินคืน"    /data/order_request_refund/0/order_request_status/status

Cancel
    [Documentation]    Place order and cancel request refund
    ${one_time_token}=    Get One Time Token From TMN   ${url_get_token_tmn}    ${content_type}    ${pubilc_token}    ${card_holder_name}    ${card_number}    ${card_expiry_month}    ${card_expiry_year}    ${card_cvn}
    ${response_data}=    API Placeorder    ${one_time_token}    CCW
    ${securekey}    Get secure_key from response data    ${response_data}
    ${order_product_id_1}    ${order_product_id_2}    ${order_product_id_3}    ${order_product_id_4}    Get Product Id From Api    ${securekey}    /data/order_product/0/id    /data/order_product/1/id    /data/order_product/2/id    /data/order_product/3/id
    API Shipping    ${securekey}    ${app_secret}    ${action_shipping}    ${order_product_id_1}    ${order_product_id_2}    ${order_product_id_3}    ${order_product_id_4}    ThailandPost    EMS    EL381863293TH    Tracking Description    http://www.google.co.th/
    API Request Refund    ${securekey}    ${app_secret}    ${action_request_refund}    ${order_request_reasons_code}    ${request_description}    ${order_product_id_1}    ${order_product_id_2}    ${order_product_id_3}    ${order_product_id_4}
    ${order_request_refund_id}    Get Refund Id From Api    ${securekey}    /data/order_request_refund/0/id
    ${refund_item_id_1}    ${refund_item_id_2}    ${refund_item_id_3}    ${refund_item_id_4}    Get Product Id From Api    ${securekey}    /data/order_request_refund/0/order_request_refund_item/0/id    /data/order_request_refund/0/order_request_refund_item/1/id    /data/order_request_refund/0/order_request_refund_item/2/id    /data/order_request_refund/0/order_request_refund_item/3/id
    API Decline Request Refund    ${securekey}    ${app_secret}    ${action_decline}    ${refund_item_id_1}    ${refund_item_id_2}    ${refund_item_id_3}    ${refund_item_id_4}    ${order_request_refund_id}    ${request_description}
    ${response_data}    API Cancel Request Refund    ${securekey}    ${app_secret}    ${action_cancel}    ${order_request_refund_id}    ${request_description}
    Check response code    ${response_data}    200    success
    Check Status Api List    ${securekey}    "Shipped and wait for confirm receive"    /data/order_status/description
    Check Status Api List    ${securekey}    "ผู้ซื้อยกเลิกการขอเงินคืน"    /data/order_request_refund/0/order_request_status/status






