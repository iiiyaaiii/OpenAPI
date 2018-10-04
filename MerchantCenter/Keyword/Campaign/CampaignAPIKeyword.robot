*** Setting ***
Resource    ../../Resource/Common/globalInit.robot
Library     HttpLibrary
Library     RequestsLibrary
Resource    ../Common/CommonAPIKeyword.robot

*** Keywords ***
Update Join Campaign Data Via API
    [Arguments]    ${cookie}
    ...    ${campaign_id}
    ...    ${campaign_status}=1
    ...    ${campaign_show}=1
    ...    ${campaign_fee}=0
    ...    ${price_fee}=${EMPTY}
    ...    ${campaign_name[th]}=[QA-Automate] Join Campaign
    ...    ${campaign_group_id}=${EMPTY}
    ...    ${description[th]}=Join Campaign create campaign by robot script !!
    ...    ${discount_type}=1
    ...    ${promotion_amount}=1
    ...    ${promotion_amount_end}=5
    ...    ${product_limit}=0
    ...    ${product_limit_input}=${EMPTY}
    ...    ${has_feedback_limit}=0
    ...    ${date_join_campaign}=01/01/2017 00:00 - 31/12/2019 23:59
    ...    ${date_show_campaign}=01/01/2017 00:00 - 31/12/2019 23:59
    ...    ${plaza_category}=${EMPTY}
    ...    ${product_type}=0
    ...    ${min_quantity}=3
    ...    ${price}=2500
    ...    ${price_campaign}=up
    ...    ${price_to}=${EMPTY}
    ...    ${order_product}=score
    ...    ${slug[th]}=qa-join-campaign
    ...    ${campaign_type}=1
    ...    ${promotion_type}=1
    ...    ${_section}=3

    ${parameter}    CATENATE
    ...    ${campaign_id}?campaign_status=${campaign_status}
    ...    &campaign_show=${campaign_show}
    ...    &campaign_fee=${campaign_fee}
    ...    &price_fee=${price_fee}
    ...    &campaign_name[th]=${campaign_name[th]}
    ...    &campaign_group_id=${campaign_group_id}
    ...    &description[th]=${description[th]}
    ...    &discount_type=${discount_type}
    ...    &promotion_amount=${promotion_amount}
    ...    &promotion_amount_end=${promotion_amount_end}
    ...    &product_limit=${product_limit}
    ...    &product_limit_input=${product_limit_input}
    ...    &has_feedback_limit=${has_feedback_limit}
    ...    &date_join_campaign=${date_join_campaign}
    ...    &date_show_campaign=${date_show_campaign}
    ...    &plaza_category[]=${plaza_category}
    ...    &product_type=${product_type}
    ...    &min_quantity=${min_quantity}
    ...    &price=${price}
    ...    &price_campaign=${price_campaign}
    ...    &price_to=${price_to}
    ...    &order_product=${order_product}
    ...    &slug[th]=${slug[th]}
    ...    &campaign_type=${campaign_type}
    ...    &promotion_type=${promotion_type}
    ...    &_section=${_section}
    ${parameter}    Replace String    ${parameter}    ${SPACE}&    &
    Create Session    wms    ${URL_WMS}    max_retries=5    backoff_factor=1    verify=True
    ${headers}    Create Dictionary    Cookie=${cookie}
    ${response}    Post Request    wms    /campaign/collection-join/edit/${parameter}    headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    200
    # Log To Console    ${response.content}

Update Non Join Campaign Data Via API
    [Arguments]    ${cookie}
    ...    ${campaign_id}
    ...    ${campaign_status}=1
    ...    ${campaign_show}=1
    ...    ${campaign_fee}=0
    ...    ${price_fee}=${EMPTY}
    ...    ${campaign_name[th]}=[QA-Automate] NonJoin Campaign
    ...    ${campaign_group_id}=${EMPTY}
    ...    ${description[th]}=Non Join Campaign Test create by robot script !!
    ...    ${date_show_campaign}=01/01/2017 00:00 - 31/12/2019 23:59
    ...    ${order_product}=custom
    ...    ${slug[th]}=qa-automate-nonjoin-campaign
    ...    ${campaign_type}=4
    ...    ${promotion_type}=0
    ...    ${_section}=3

    ${parameter}    CATENATE
    ...    ${campaign_id}?campaign_status=${campaign_status}
    ...    &campaign_show=${campaign_show}
    ...    &campaign_fee=${campaign_fee}
    ...    &price_fee=${price_fee}
    ...    &campaign_name[th]=${campaign_name[th]}
    ...    &campaign_group_id=${campaign_group_id}
    ...    &description[th]=${description[th]}
    ...    &date_show_campaign=${date_show_campaign}
    ...    &order_product=${order_product}
    ...    &slug[th]=${slug[th]}
    ...    &campaign_type=${campaign_type}
    ...    &promotion_type=${promotion_type}
    ...    &_section=${_section}
    ${parameter}    Replace String    ${parameter}    ${SPACE}&    &
    Create Session    wms    ${URL_WMS}    max_retries=5    backoff_factor=1    verify=True
    ${headers}    Create Dictionary    Cookie=${cookie}
    ${response}    Post Request    wms    /campaign/collection-non-join/edit/${parameter}    headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    200

Update Dealzapp/EverydayWow Data Via API
    [Arguments]    ${cookie}
    ...    ${campaign_id}
    ...    ${campaign_status}=1
    ...    ${campaign_show}=1
    ...    ${campaign_fee}=0
    ...    ${price_fee}=${EMPTY}
    ...    ${campaign_name[th]}=Dealzapp/EverydayWow
    ...    ${campaign_group_id}=${EMPTY}
    ...    ${description[th]}=Dealzapp/EverydayWow by robot script !!
    ...    ${date_show_campaign}=01/01/2017 00:00 - 31/12/2019 23:59
    ...    ${order_product}=custom
    ...    ${campaign_type}=5
    ...    ${promotion_type}=0
    ...    ${_section}=3

    ${parameter}    CATENATE
    ...    ${campaign_id}?campaign_status=${campaign_status}
    ...    &campaign_show=${campaign_show}
    ...    &campaign_fee=${campaign_fee}
    ...    &price_fee=${price_fee}
    ...    &campaign_name[th]=${campaign_name[th]}
    ...    &campaign_group_id=${campaign_group_id}
    ...    &description[th]=${description[th]}
    ...    &date_show_campaign=${date_show_campaign}
    ...    &order_product=${order_product}
    ...    &campaign_type=${campaign_type}
    ...    &promotion_type=${promotion_type}
    ...    &_section=${_section}
    ${parameter}    Replace String    ${parameter}    ${SPACE}&    &
    Create Session    wms    ${URL_WMS}    max_retries=5    backoff_factor=1    verify=True
    ${headers}    Create Dictionary    Cookie=${cookie}
    ${response}    Post Request    wms    /campaign/dealzapp/edit/${parameter}    headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    200

Update WLSPromotion Data Via API
    [Arguments]    ${cookie}
    ...    ${campaign_id}
    ...    ${campaign_status}=1
    ...    ${campaign_show}=1
    ...    ${campaign_fee}=0
    ...    ${price_fee}=${EMPTY}
    ...    ${campaign_name[th]}=[QA-Automate] WLS Promotion
    ...    ${campaign_group_id}=${EMPTY}
    ...    ${description[th]}=WLS Promotion by robot script !!
    ...    ${promotion_type}=3
    ...    ${discount_type}=3
    ...    ${discount_value}=${EMPTY}
    ...    ${discount_max}=${EMPTY}
    ...    ${promotion_pattern}=1
    ...    ${conditions_0_min}=${EMPTY}
    ...    ${condition_range_0}=1
    ...    ${conditions_0_max}=${EMPTY}
    ...    ${conditions_0_discount_value_}=${EMPTY}
    ...    ${conditions_0_discount_max}=${EMPTY}
    ...    ${date_join_campaign}=01/01/2017 00:00 - 31/12/2019 23:59
    ...    ${date_show_campaign}=01/01/2017 00:00 - 31/12/2019 23:59
    ...    ${plaza_category}=${EMPTY}
    ...    ${product_type}=0
    ...    ${min_quantity}=${EMPTY}
    ...    ${order_product}=score
    ...    ${slug[th]}=qa-wls-promotion
    ...    ${campaign_type}=6
    ...    ${_section}=3

    ${parameter}    CATENATE
    ...    ${campaign_id}?campaign_status=${campaign_status}
    ...    &campaign_show=${campaign_show}
    ...    &campaign_fee=${campaign_fee}
    ...    &price_fee=${price_fee}
    ...    &campaign_name[th]=${campaign_name[th]}
    ...    &campaign_group_id=${campaign_group_id}
    ...    &description[th]=${description[th]}
    ...    &promotion_type=${promotion_type}
    ...    &discount_type=${discount_type}
    ...    &discount_value=${discount_value}
    ...    &discount_max=${discount_max}
    ...    &promotion_pattern=${promotion_pattern}
    ...    &conditions[0][min]=${conditions_0_min}
    ...    &condition_range[0]=${condition_range_0}
    ...    &conditions[0][max]=${conditions_0_max}
    ...    &conditions[0][discount_value]=${conditions_0_discount_value}
    ...    &conditions[0][discount_max]=${conditions_0_discount_max}
    ...    &date_join_campaign=${date_join_campaign}
    ...    &date_show_campaign=${date_show_campaign}
    ...    &plaza_category[]=${plaza_category}
    ...    &product_type=${product_type}
    ...    &min_quantity=${min_quantity}
    ...    &order_product=${order_product}
    ...    &slug[th]=${slug[th]}
    ...    &campaign_type=${campaign_type}
    ...    &_section=${_section}
    ${parameter}    Replace String    ${parameter}    ${SPACE}&    &
    Create Session    wms    ${URL_WMS}    max_retries=5    backoff_factor=1    verify=True
    ${headers}    Create Dictionary    Cookie=${cookie}
    ${response}    Post Request    wms    /campaign/promotion/edit/${parameter}    headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    200

Update Price Break Data Via API
    [Arguments]    ${cookie}
    ...    ${campaign_id}
    ...    ${campaign_status}=1
    ...    ${campaign_show}=1
    ...    ${campaign_fee}=0
    ...    ${price_fee}=${EMPTY}
    ...    ${campaign_name[th]}=[QA-Automate] Price Break
    ...    ${campaign_group_id}=${EMPTY}
    ...    ${description[th]}=Price Break by robot script !!
    ...    ${date_show_campaign}=01/01/2017 00:00 - 31/12/2019 23:59
    ...    ${order_product}=custom
    ...    ${slug[th]}=qa-price-break
    ...    ${campaign_type}=4
    ...    ${promotion_type}=0
    ...    ${is_price_break}=true
    ...    ${_section}=1

    ${parameter}    CATENATE
    ...    ${campaign_id}?campaign_status=${campaign_status}
    ...    &campaign_show=${campaign_show}
    ...    &campaign_fee=${campaign_fee}
    ...    &price_fee=${price_fee}
    ...    &campaign_name[th]=${campaign_name[th]}
    ...    &campaign_group_id=${campaign_group_id}
    ...    &description[th]=${description[th]}
    ...    &date_show_campaign=${date_show_campaign}
    ...    &order_product=${order_product}
    ...    &slug[th]=${slug[th]}
    ...    &campaign_type=${campaign_type}
    ...    &promotion_type=${promotion_type}
    ...    &is_price_break=${is_price_break}
    ...    &_section=${_section}
    ${parameter}    Replace String    ${parameter}    ${SPACE}&    &
    Create Session    wms    ${URL_WMS}    max_retries=5    backoff_factor=1    verify=True
    ${headers}    Create Dictionary    Cookie=${cookie}
    ${response}    Post Request    wms    /campaign/collection-price-break/edit/${parameter}    headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    200
