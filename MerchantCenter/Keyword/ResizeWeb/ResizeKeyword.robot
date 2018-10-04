*** Settings ***
Resource    ../../Resource/Common/globalInit.robot

*** Keywords ***
Exact URL For Resize
    [Arguments]    ${full_url}
    @{resize_param}    Split String    ${full_url}    /
    Log List    ${resize_param}
    ${store_id}    Get From List    ${resize_param}    5
    ${img_full_hash}    Get From List    ${resize_param}    8
    ${img_list_hash}    Split String    ${img_full_hash}    .
    ${img_hash}    Get From List    ${img_list_hash}    0
    [Return]    ${store_id}    ${img_hash}
